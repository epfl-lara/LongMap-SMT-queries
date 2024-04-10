; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76950 () Bool)

(assert start!76950)

(declare-fun b!899265 () Bool)

(declare-fun b_free!16029 () Bool)

(declare-fun b_next!16029 () Bool)

(assert (=> b!899265 (= b_free!16029 (not b_next!16029))))

(declare-fun tp!56164 () Bool)

(declare-fun b_and!26335 () Bool)

(assert (=> b!899265 (= tp!56164 b_and!26335)))

(declare-fun tp_is_empty!18357 () Bool)

(declare-fun e!503147 () Bool)

(declare-datatypes ((array!52756 0))(
  ( (array!52757 (arr!25353 (Array (_ BitVec 32) (_ BitVec 64))) (size!25810 (_ BitVec 32))) )
))
(declare-datatypes ((V!29441 0))(
  ( (V!29442 (val!9229 Int)) )
))
(declare-datatypes ((ValueCell!8697 0))(
  ( (ValueCellFull!8697 (v!11722 V!29441)) (EmptyCell!8697) )
))
(declare-datatypes ((array!52758 0))(
  ( (array!52759 (arr!25354 (Array (_ BitVec 32) ValueCell!8697)) (size!25811 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4410 0))(
  ( (LongMapFixedSize!4411 (defaultEntry!5427 Int) (mask!26179 (_ BitVec 32)) (extraKeys!5147 (_ BitVec 32)) (zeroValue!5251 V!29441) (minValue!5251 V!29441) (_size!2260 (_ BitVec 32)) (_keys!10214 array!52756) (_values!5438 array!52758) (_vacant!2260 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4410)

(declare-fun e!503148 () Bool)

(declare-fun array_inv!19896 (array!52756) Bool)

(declare-fun array_inv!19897 (array!52758) Bool)

(assert (=> b!899265 (= e!503147 (and tp!56164 tp_is_empty!18357 (array_inv!19896 (_keys!10214 thiss!1181)) (array_inv!19897 (_values!5438 thiss!1181)) e!503148))))

(declare-fun b!899266 () Bool)

(declare-fun e!503155 () Bool)

(declare-datatypes ((SeekEntryResult!8931 0))(
  ( (MissingZero!8931 (index!38095 (_ BitVec 32))) (Found!8931 (index!38096 (_ BitVec 32))) (Intermediate!8931 (undefined!9743 Bool) (index!38097 (_ BitVec 32)) (x!76630 (_ BitVec 32))) (Undefined!8931) (MissingVacant!8931 (index!38098 (_ BitVec 32))) )
))
(declare-fun lt!406107 () SeekEntryResult!8931)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899266 (= e!503155 (inRange!0 (index!38096 lt!406107) (mask!26179 thiss!1181)))))

(declare-fun b!899267 () Bool)

(declare-fun e!503153 () Bool)

(assert (=> b!899267 (= e!503153 tp_is_empty!18357)))

(declare-fun b!899268 () Bool)

(declare-fun e!503152 () Bool)

(assert (=> b!899268 (= e!503152 tp_is_empty!18357)))

(declare-fun res!607533 () Bool)

(declare-fun e!503151 () Bool)

(assert (=> start!76950 (=> (not res!607533) (not e!503151))))

(declare-fun valid!1695 (LongMapFixedSize!4410) Bool)

(assert (=> start!76950 (= res!607533 (valid!1695 thiss!1181))))

(assert (=> start!76950 e!503151))

(assert (=> start!76950 e!503147))

(assert (=> start!76950 true))

(declare-fun b!899269 () Bool)

(declare-fun e!503150 () Bool)

(declare-fun e!503154 () Bool)

(assert (=> b!899269 (= e!503150 e!503154)))

(declare-fun res!607531 () Bool)

(assert (=> b!899269 (=> res!607531 e!503154)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!899269 (= res!607531 (not (validMask!0 (mask!26179 thiss!1181))))))

(declare-datatypes ((tuple2!12044 0))(
  ( (tuple2!12045 (_1!6033 (_ BitVec 64)) (_2!6033 V!29441)) )
))
(declare-datatypes ((List!17847 0))(
  ( (Nil!17844) (Cons!17843 (h!18987 tuple2!12044) (t!25192 List!17847)) )
))
(declare-datatypes ((ListLongMap!10741 0))(
  ( (ListLongMap!10742 (toList!5386 List!17847)) )
))
(declare-fun contains!4419 (ListLongMap!10741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2660 (array!52756 array!52758 (_ BitVec 32) (_ BitVec 32) V!29441 V!29441 (_ BitVec 32) Int) ListLongMap!10741)

(assert (=> b!899269 (contains!4419 (getCurrentListMap!2660 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181)) (select (arr!25353 (_keys!10214 thiss!1181)) (index!38096 lt!406107)))))

(declare-datatypes ((Unit!30560 0))(
  ( (Unit!30561) )
))
(declare-fun lt!406108 () Unit!30560)

(declare-fun lemmaValidKeyInArrayIsInListMap!249 (array!52756 array!52758 (_ BitVec 32) (_ BitVec 32) V!29441 V!29441 (_ BitVec 32) Int) Unit!30560)

(assert (=> b!899269 (= lt!406108 (lemmaValidKeyInArrayIsInListMap!249 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) (index!38096 lt!406107) (defaultEntry!5427 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!899269 (arrayContainsKey!0 (_keys!10214 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406109 () Unit!30560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52756 (_ BitVec 64) (_ BitVec 32)) Unit!30560)

(assert (=> b!899269 (= lt!406109 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10214 thiss!1181) key!785 (index!38096 lt!406107)))))

(declare-fun b!899270 () Bool)

(assert (=> b!899270 (= e!503151 (not e!503150))))

(declare-fun res!607534 () Bool)

(assert (=> b!899270 (=> res!607534 e!503150)))

(get-info :version)

(assert (=> b!899270 (= res!607534 (not ((_ is Found!8931) lt!406107)))))

(assert (=> b!899270 e!503155))

(declare-fun res!607535 () Bool)

(assert (=> b!899270 (=> res!607535 e!503155)))

(assert (=> b!899270 (= res!607535 (not ((_ is Found!8931) lt!406107)))))

(declare-fun lt!406106 () Unit!30560)

(declare-fun lemmaSeekEntryGivesInRangeIndex!95 (array!52756 array!52758 (_ BitVec 32) (_ BitVec 32) V!29441 V!29441 (_ BitVec 64)) Unit!30560)

(assert (=> b!899270 (= lt!406106 (lemmaSeekEntryGivesInRangeIndex!95 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52756 (_ BitVec 32)) SeekEntryResult!8931)

(assert (=> b!899270 (= lt!406107 (seekEntry!0 key!785 (_keys!10214 thiss!1181) (mask!26179 thiss!1181)))))

(declare-fun b!899271 () Bool)

(assert (=> b!899271 (= e!503154 (or (not (= (size!25811 (_values!5438 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26179 thiss!1181)))) (not (= (size!25810 (_keys!10214 thiss!1181)) (size!25811 (_values!5438 thiss!1181)))) (bvsge (mask!26179 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!29198 () Bool)

(declare-fun mapRes!29198 () Bool)

(declare-fun tp!56163 () Bool)

(assert (=> mapNonEmpty!29198 (= mapRes!29198 (and tp!56163 e!503153))))

(declare-fun mapRest!29198 () (Array (_ BitVec 32) ValueCell!8697))

(declare-fun mapKey!29198 () (_ BitVec 32))

(declare-fun mapValue!29198 () ValueCell!8697)

(assert (=> mapNonEmpty!29198 (= (arr!25354 (_values!5438 thiss!1181)) (store mapRest!29198 mapKey!29198 mapValue!29198))))

(declare-fun b!899272 () Bool)

(declare-fun res!607532 () Bool)

(assert (=> b!899272 (=> (not res!607532) (not e!503151))))

(assert (=> b!899272 (= res!607532 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29198 () Bool)

(assert (=> mapIsEmpty!29198 mapRes!29198))

(declare-fun b!899273 () Bool)

(assert (=> b!899273 (= e!503148 (and e!503152 mapRes!29198))))

(declare-fun condMapEmpty!29198 () Bool)

(declare-fun mapDefault!29198 () ValueCell!8697)

(assert (=> b!899273 (= condMapEmpty!29198 (= (arr!25354 (_values!5438 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8697)) mapDefault!29198)))))

(assert (= (and start!76950 res!607533) b!899272))

(assert (= (and b!899272 res!607532) b!899270))

(assert (= (and b!899270 (not res!607535)) b!899266))

(assert (= (and b!899270 (not res!607534)) b!899269))

(assert (= (and b!899269 (not res!607531)) b!899271))

(assert (= (and b!899273 condMapEmpty!29198) mapIsEmpty!29198))

(assert (= (and b!899273 (not condMapEmpty!29198)) mapNonEmpty!29198))

(assert (= (and mapNonEmpty!29198 ((_ is ValueCellFull!8697) mapValue!29198)) b!899267))

(assert (= (and b!899273 ((_ is ValueCellFull!8697) mapDefault!29198)) b!899268))

(assert (= b!899265 b!899273))

(assert (= start!76950 b!899265))

(declare-fun m!835765 () Bool)

(assert (=> b!899265 m!835765))

(declare-fun m!835767 () Bool)

(assert (=> b!899265 m!835767))

(declare-fun m!835769 () Bool)

(assert (=> start!76950 m!835769))

(declare-fun m!835771 () Bool)

(assert (=> b!899269 m!835771))

(declare-fun m!835773 () Bool)

(assert (=> b!899269 m!835773))

(declare-fun m!835775 () Bool)

(assert (=> b!899269 m!835775))

(declare-fun m!835777 () Bool)

(assert (=> b!899269 m!835777))

(declare-fun m!835779 () Bool)

(assert (=> b!899269 m!835779))

(assert (=> b!899269 m!835771))

(declare-fun m!835781 () Bool)

(assert (=> b!899269 m!835781))

(declare-fun m!835783 () Bool)

(assert (=> b!899269 m!835783))

(assert (=> b!899269 m!835779))

(declare-fun m!835785 () Bool)

(assert (=> b!899266 m!835785))

(declare-fun m!835787 () Bool)

(assert (=> b!899270 m!835787))

(declare-fun m!835789 () Bool)

(assert (=> b!899270 m!835789))

(declare-fun m!835791 () Bool)

(assert (=> mapNonEmpty!29198 m!835791))

(check-sat (not b!899270) tp_is_empty!18357 b_and!26335 (not mapNonEmpty!29198) (not b_next!16029) (not start!76950) (not b!899266) (not b!899265) (not b!899269))
(check-sat b_and!26335 (not b_next!16029))
(get-model)

(declare-fun d!111459 () Bool)

(declare-fun e!503188 () Bool)

(assert (=> d!111459 e!503188))

(declare-fun res!607553 () Bool)

(assert (=> d!111459 (=> res!607553 e!503188)))

(declare-fun lt!406130 () Bool)

(assert (=> d!111459 (= res!607553 (not lt!406130))))

(declare-fun lt!406132 () Bool)

(assert (=> d!111459 (= lt!406130 lt!406132)))

(declare-fun lt!406131 () Unit!30560)

(declare-fun e!503187 () Unit!30560)

(assert (=> d!111459 (= lt!406131 e!503187)))

(declare-fun c!95116 () Bool)

(assert (=> d!111459 (= c!95116 lt!406132)))

(declare-fun containsKey!427 (List!17847 (_ BitVec 64)) Bool)

(assert (=> d!111459 (= lt!406132 (containsKey!427 (toList!5386 (getCurrentListMap!2660 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181))) (select (arr!25353 (_keys!10214 thiss!1181)) (index!38096 lt!406107))))))

(assert (=> d!111459 (= (contains!4419 (getCurrentListMap!2660 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181)) (select (arr!25353 (_keys!10214 thiss!1181)) (index!38096 lt!406107))) lt!406130)))

(declare-fun b!899307 () Bool)

(declare-fun lt!406133 () Unit!30560)

(assert (=> b!899307 (= e!503187 lt!406133)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!323 (List!17847 (_ BitVec 64)) Unit!30560)

(assert (=> b!899307 (= lt!406133 (lemmaContainsKeyImpliesGetValueByKeyDefined!323 (toList!5386 (getCurrentListMap!2660 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181))) (select (arr!25353 (_keys!10214 thiss!1181)) (index!38096 lt!406107))))))

(declare-datatypes ((Option!464 0))(
  ( (Some!463 (v!11724 V!29441)) (None!462) )
))
(declare-fun isDefined!332 (Option!464) Bool)

(declare-fun getValueByKey!458 (List!17847 (_ BitVec 64)) Option!464)

(assert (=> b!899307 (isDefined!332 (getValueByKey!458 (toList!5386 (getCurrentListMap!2660 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181))) (select (arr!25353 (_keys!10214 thiss!1181)) (index!38096 lt!406107))))))

(declare-fun b!899308 () Bool)

(declare-fun Unit!30562 () Unit!30560)

(assert (=> b!899308 (= e!503187 Unit!30562)))

(declare-fun b!899309 () Bool)

(assert (=> b!899309 (= e!503188 (isDefined!332 (getValueByKey!458 (toList!5386 (getCurrentListMap!2660 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181))) (select (arr!25353 (_keys!10214 thiss!1181)) (index!38096 lt!406107)))))))

(assert (= (and d!111459 c!95116) b!899307))

(assert (= (and d!111459 (not c!95116)) b!899308))

(assert (= (and d!111459 (not res!607553)) b!899309))

(assert (=> d!111459 m!835771))

(declare-fun m!835821 () Bool)

(assert (=> d!111459 m!835821))

(assert (=> b!899307 m!835771))

(declare-fun m!835823 () Bool)

(assert (=> b!899307 m!835823))

(assert (=> b!899307 m!835771))

(declare-fun m!835825 () Bool)

(assert (=> b!899307 m!835825))

(assert (=> b!899307 m!835825))

(declare-fun m!835827 () Bool)

(assert (=> b!899307 m!835827))

(assert (=> b!899309 m!835771))

(assert (=> b!899309 m!835825))

(assert (=> b!899309 m!835825))

(assert (=> b!899309 m!835827))

(assert (=> b!899269 d!111459))

(declare-fun d!111461 () Bool)

(declare-fun e!503191 () Bool)

(assert (=> d!111461 e!503191))

(declare-fun res!607556 () Bool)

(assert (=> d!111461 (=> (not res!607556) (not e!503191))))

(assert (=> d!111461 (= res!607556 (and (bvsge (index!38096 lt!406107) #b00000000000000000000000000000000) (bvslt (index!38096 lt!406107) (size!25810 (_keys!10214 thiss!1181)))))))

(declare-fun lt!406136 () Unit!30560)

(declare-fun choose!1500 (array!52756 array!52758 (_ BitVec 32) (_ BitVec 32) V!29441 V!29441 (_ BitVec 32) Int) Unit!30560)

(assert (=> d!111461 (= lt!406136 (choose!1500 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) (index!38096 lt!406107) (defaultEntry!5427 thiss!1181)))))

(assert (=> d!111461 (validMask!0 (mask!26179 thiss!1181))))

(assert (=> d!111461 (= (lemmaValidKeyInArrayIsInListMap!249 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) (index!38096 lt!406107) (defaultEntry!5427 thiss!1181)) lt!406136)))

(declare-fun b!899312 () Bool)

(assert (=> b!899312 (= e!503191 (contains!4419 (getCurrentListMap!2660 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181)) (select (arr!25353 (_keys!10214 thiss!1181)) (index!38096 lt!406107))))))

(assert (= (and d!111461 res!607556) b!899312))

(declare-fun m!835829 () Bool)

(assert (=> d!111461 m!835829))

(assert (=> d!111461 m!835777))

(assert (=> b!899312 m!835779))

(assert (=> b!899312 m!835771))

(assert (=> b!899312 m!835779))

(assert (=> b!899312 m!835771))

(assert (=> b!899312 m!835781))

(assert (=> b!899269 d!111461))

(declare-fun d!111463 () Bool)

(assert (=> d!111463 (arrayContainsKey!0 (_keys!10214 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406139 () Unit!30560)

(declare-fun choose!13 (array!52756 (_ BitVec 64) (_ BitVec 32)) Unit!30560)

(assert (=> d!111463 (= lt!406139 (choose!13 (_keys!10214 thiss!1181) key!785 (index!38096 lt!406107)))))

(assert (=> d!111463 (bvsge (index!38096 lt!406107) #b00000000000000000000000000000000)))

(assert (=> d!111463 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10214 thiss!1181) key!785 (index!38096 lt!406107)) lt!406139)))

(declare-fun bs!25248 () Bool)

(assert (= bs!25248 d!111463))

(assert (=> bs!25248 m!835773))

(declare-fun m!835831 () Bool)

(assert (=> bs!25248 m!835831))

(assert (=> b!899269 d!111463))

(declare-fun d!111465 () Bool)

(assert (=> d!111465 (= (validMask!0 (mask!26179 thiss!1181)) (and (or (= (mask!26179 thiss!1181) #b00000000000000000000000000000111) (= (mask!26179 thiss!1181) #b00000000000000000000000000001111) (= (mask!26179 thiss!1181) #b00000000000000000000000000011111) (= (mask!26179 thiss!1181) #b00000000000000000000000000111111) (= (mask!26179 thiss!1181) #b00000000000000000000000001111111) (= (mask!26179 thiss!1181) #b00000000000000000000000011111111) (= (mask!26179 thiss!1181) #b00000000000000000000000111111111) (= (mask!26179 thiss!1181) #b00000000000000000000001111111111) (= (mask!26179 thiss!1181) #b00000000000000000000011111111111) (= (mask!26179 thiss!1181) #b00000000000000000000111111111111) (= (mask!26179 thiss!1181) #b00000000000000000001111111111111) (= (mask!26179 thiss!1181) #b00000000000000000011111111111111) (= (mask!26179 thiss!1181) #b00000000000000000111111111111111) (= (mask!26179 thiss!1181) #b00000000000000001111111111111111) (= (mask!26179 thiss!1181) #b00000000000000011111111111111111) (= (mask!26179 thiss!1181) #b00000000000000111111111111111111) (= (mask!26179 thiss!1181) #b00000000000001111111111111111111) (= (mask!26179 thiss!1181) #b00000000000011111111111111111111) (= (mask!26179 thiss!1181) #b00000000000111111111111111111111) (= (mask!26179 thiss!1181) #b00000000001111111111111111111111) (= (mask!26179 thiss!1181) #b00000000011111111111111111111111) (= (mask!26179 thiss!1181) #b00000000111111111111111111111111) (= (mask!26179 thiss!1181) #b00000001111111111111111111111111) (= (mask!26179 thiss!1181) #b00000011111111111111111111111111) (= (mask!26179 thiss!1181) #b00000111111111111111111111111111) (= (mask!26179 thiss!1181) #b00001111111111111111111111111111) (= (mask!26179 thiss!1181) #b00011111111111111111111111111111) (= (mask!26179 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26179 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!899269 d!111465))

(declare-fun d!111467 () Bool)

(declare-fun res!607561 () Bool)

(declare-fun e!503196 () Bool)

(assert (=> d!111467 (=> res!607561 e!503196)))

(assert (=> d!111467 (= res!607561 (= (select (arr!25353 (_keys!10214 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111467 (= (arrayContainsKey!0 (_keys!10214 thiss!1181) key!785 #b00000000000000000000000000000000) e!503196)))

(declare-fun b!899317 () Bool)

(declare-fun e!503197 () Bool)

(assert (=> b!899317 (= e!503196 e!503197)))

(declare-fun res!607562 () Bool)

(assert (=> b!899317 (=> (not res!607562) (not e!503197))))

(assert (=> b!899317 (= res!607562 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25810 (_keys!10214 thiss!1181))))))

(declare-fun b!899318 () Bool)

(assert (=> b!899318 (= e!503197 (arrayContainsKey!0 (_keys!10214 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111467 (not res!607561)) b!899317))

(assert (= (and b!899317 res!607562) b!899318))

(declare-fun m!835833 () Bool)

(assert (=> d!111467 m!835833))

(declare-fun m!835835 () Bool)

(assert (=> b!899318 m!835835))

(assert (=> b!899269 d!111467))

(declare-fun b!899361 () Bool)

(declare-fun res!607589 () Bool)

(declare-fun e!503228 () Bool)

(assert (=> b!899361 (=> (not res!607589) (not e!503228))))

(declare-fun e!503234 () Bool)

(assert (=> b!899361 (= res!607589 e!503234)))

(declare-fun c!95133 () Bool)

(assert (=> b!899361 (= c!95133 (not (= (bvand (extraKeys!5147 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!899362 () Bool)

(declare-fun e!503233 () ListLongMap!10741)

(declare-fun call!39940 () ListLongMap!10741)

(assert (=> b!899362 (= e!503233 call!39940)))

(declare-fun b!899363 () Bool)

(declare-fun e!503229 () Bool)

(assert (=> b!899363 (= e!503234 e!503229)))

(declare-fun res!607582 () Bool)

(declare-fun call!39937 () Bool)

(assert (=> b!899363 (= res!607582 call!39937)))

(assert (=> b!899363 (=> (not res!607582) (not e!503229))))

(declare-fun b!899364 () Bool)

(declare-fun e!503226 () Bool)

(declare-fun lt!406197 () ListLongMap!10741)

(declare-fun apply!412 (ListLongMap!10741 (_ BitVec 64)) V!29441)

(declare-fun get!13334 (ValueCell!8697 V!29441) V!29441)

(declare-fun dynLambda!1306 (Int (_ BitVec 64)) V!29441)

(assert (=> b!899364 (= e!503226 (= (apply!412 lt!406197 (select (arr!25353 (_keys!10214 thiss!1181)) #b00000000000000000000000000000000)) (get!13334 (select (arr!25354 (_values!5438 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1306 (defaultEntry!5427 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899364 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25811 (_values!5438 thiss!1181))))))

(assert (=> b!899364 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10214 thiss!1181))))))

(declare-fun b!899365 () Bool)

(declare-fun e!503236 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!899365 (= e!503236 (validKeyInArray!0 (select (arr!25353 (_keys!10214 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39934 () Bool)

(declare-fun call!39942 () ListLongMap!10741)

(declare-fun call!39941 () ListLongMap!10741)

(assert (=> bm!39934 (= call!39942 call!39941)))

(declare-fun b!899366 () Bool)

(declare-fun c!95131 () Bool)

(assert (=> b!899366 (= c!95131 (and (not (= (bvand (extraKeys!5147 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5147 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!503227 () ListLongMap!10741)

(assert (=> b!899366 (= e!503227 e!503233)))

(declare-fun b!899367 () Bool)

(declare-fun e!503230 () Bool)

(declare-fun e!503224 () Bool)

(assert (=> b!899367 (= e!503230 e!503224)))

(declare-fun res!607581 () Bool)

(declare-fun call!39943 () Bool)

(assert (=> b!899367 (= res!607581 call!39943)))

(assert (=> b!899367 (=> (not res!607581) (not e!503224))))

(declare-fun b!899368 () Bool)

(assert (=> b!899368 (= e!503227 call!39942)))

(declare-fun b!899369 () Bool)

(declare-fun e!503225 () ListLongMap!10741)

(declare-fun +!2593 (ListLongMap!10741 tuple2!12044) ListLongMap!10741)

(assert (=> b!899369 (= e!503225 (+!2593 call!39941 (tuple2!12045 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5251 thiss!1181))))))

(declare-fun b!899371 () Bool)

(assert (=> b!899371 (= e!503233 call!39942)))

(declare-fun bm!39935 () Bool)

(assert (=> bm!39935 (= call!39943 (contains!4419 lt!406197 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899372 () Bool)

(assert (=> b!899372 (= e!503234 (not call!39937))))

(declare-fun bm!39936 () Bool)

(declare-fun call!39938 () ListLongMap!10741)

(assert (=> bm!39936 (= call!39940 call!39938)))

(declare-fun b!899373 () Bool)

(declare-fun e!503235 () Bool)

(assert (=> b!899373 (= e!503235 e!503226)))

(declare-fun res!607586 () Bool)

(assert (=> b!899373 (=> (not res!607586) (not e!503226))))

(assert (=> b!899373 (= res!607586 (contains!4419 lt!406197 (select (arr!25353 (_keys!10214 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10214 thiss!1181))))))

(declare-fun b!899374 () Bool)

(declare-fun e!503232 () Bool)

(assert (=> b!899374 (= e!503232 (validKeyInArray!0 (select (arr!25353 (_keys!10214 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899375 () Bool)

(assert (=> b!899375 (= e!503228 e!503230)))

(declare-fun c!95130 () Bool)

(assert (=> b!899375 (= c!95130 (not (= (bvand (extraKeys!5147 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!95132 () Bool)

(declare-fun c!95134 () Bool)

(declare-fun call!39939 () ListLongMap!10741)

(declare-fun bm!39937 () Bool)

(assert (=> bm!39937 (= call!39941 (+!2593 (ite c!95134 call!39939 (ite c!95132 call!39938 call!39940)) (ite (or c!95134 c!95132) (tuple2!12045 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5251 thiss!1181)) (tuple2!12045 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5251 thiss!1181)))))))

(declare-fun b!899376 () Bool)

(declare-fun e!503231 () Unit!30560)

(declare-fun lt!406194 () Unit!30560)

(assert (=> b!899376 (= e!503231 lt!406194)))

(declare-fun lt!406205 () ListLongMap!10741)

(declare-fun getCurrentListMapNoExtraKeys!3280 (array!52756 array!52758 (_ BitVec 32) (_ BitVec 32) V!29441 V!29441 (_ BitVec 32) Int) ListLongMap!10741)

(assert (=> b!899376 (= lt!406205 (getCurrentListMapNoExtraKeys!3280 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181)))))

(declare-fun lt!406200 () (_ BitVec 64))

(assert (=> b!899376 (= lt!406200 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406188 () (_ BitVec 64))

(assert (=> b!899376 (= lt!406188 (select (arr!25353 (_keys!10214 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406190 () Unit!30560)

(declare-fun addStillContains!334 (ListLongMap!10741 (_ BitVec 64) V!29441 (_ BitVec 64)) Unit!30560)

(assert (=> b!899376 (= lt!406190 (addStillContains!334 lt!406205 lt!406200 (zeroValue!5251 thiss!1181) lt!406188))))

(assert (=> b!899376 (contains!4419 (+!2593 lt!406205 (tuple2!12045 lt!406200 (zeroValue!5251 thiss!1181))) lt!406188)))

(declare-fun lt!406193 () Unit!30560)

(assert (=> b!899376 (= lt!406193 lt!406190)))

(declare-fun lt!406204 () ListLongMap!10741)

(assert (=> b!899376 (= lt!406204 (getCurrentListMapNoExtraKeys!3280 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181)))))

(declare-fun lt!406198 () (_ BitVec 64))

(assert (=> b!899376 (= lt!406198 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406185 () (_ BitVec 64))

(assert (=> b!899376 (= lt!406185 (select (arr!25353 (_keys!10214 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406201 () Unit!30560)

(declare-fun addApplyDifferent!334 (ListLongMap!10741 (_ BitVec 64) V!29441 (_ BitVec 64)) Unit!30560)

(assert (=> b!899376 (= lt!406201 (addApplyDifferent!334 lt!406204 lt!406198 (minValue!5251 thiss!1181) lt!406185))))

(assert (=> b!899376 (= (apply!412 (+!2593 lt!406204 (tuple2!12045 lt!406198 (minValue!5251 thiss!1181))) lt!406185) (apply!412 lt!406204 lt!406185))))

(declare-fun lt!406192 () Unit!30560)

(assert (=> b!899376 (= lt!406192 lt!406201)))

(declare-fun lt!406189 () ListLongMap!10741)

(assert (=> b!899376 (= lt!406189 (getCurrentListMapNoExtraKeys!3280 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181)))))

(declare-fun lt!406191 () (_ BitVec 64))

(assert (=> b!899376 (= lt!406191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406203 () (_ BitVec 64))

(assert (=> b!899376 (= lt!406203 (select (arr!25353 (_keys!10214 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406202 () Unit!30560)

(assert (=> b!899376 (= lt!406202 (addApplyDifferent!334 lt!406189 lt!406191 (zeroValue!5251 thiss!1181) lt!406203))))

(assert (=> b!899376 (= (apply!412 (+!2593 lt!406189 (tuple2!12045 lt!406191 (zeroValue!5251 thiss!1181))) lt!406203) (apply!412 lt!406189 lt!406203))))

(declare-fun lt!406187 () Unit!30560)

(assert (=> b!899376 (= lt!406187 lt!406202)))

(declare-fun lt!406195 () ListLongMap!10741)

(assert (=> b!899376 (= lt!406195 (getCurrentListMapNoExtraKeys!3280 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181)))))

(declare-fun lt!406196 () (_ BitVec 64))

(assert (=> b!899376 (= lt!406196 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406184 () (_ BitVec 64))

(assert (=> b!899376 (= lt!406184 (select (arr!25353 (_keys!10214 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899376 (= lt!406194 (addApplyDifferent!334 lt!406195 lt!406196 (minValue!5251 thiss!1181) lt!406184))))

(assert (=> b!899376 (= (apply!412 (+!2593 lt!406195 (tuple2!12045 lt!406196 (minValue!5251 thiss!1181))) lt!406184) (apply!412 lt!406195 lt!406184))))

(declare-fun b!899377 () Bool)

(assert (=> b!899377 (= e!503225 e!503227)))

(assert (=> b!899377 (= c!95132 (and (not (= (bvand (extraKeys!5147 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5147 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39938 () Bool)

(assert (=> bm!39938 (= call!39939 (getCurrentListMapNoExtraKeys!3280 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181)))))

(declare-fun b!899378 () Bool)

(declare-fun res!607587 () Bool)

(assert (=> b!899378 (=> (not res!607587) (not e!503228))))

(assert (=> b!899378 (= res!607587 e!503235)))

(declare-fun res!607583 () Bool)

(assert (=> b!899378 (=> res!607583 e!503235)))

(assert (=> b!899378 (= res!607583 (not e!503232))))

(declare-fun res!607585 () Bool)

(assert (=> b!899378 (=> (not res!607585) (not e!503232))))

(assert (=> b!899378 (= res!607585 (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10214 thiss!1181))))))

(declare-fun b!899370 () Bool)

(assert (=> b!899370 (= e!503224 (= (apply!412 lt!406197 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5251 thiss!1181)))))

(declare-fun d!111469 () Bool)

(assert (=> d!111469 e!503228))

(declare-fun res!607588 () Bool)

(assert (=> d!111469 (=> (not res!607588) (not e!503228))))

(assert (=> d!111469 (= res!607588 (or (bvsge #b00000000000000000000000000000000 (size!25810 (_keys!10214 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10214 thiss!1181))))))))

(declare-fun lt!406199 () ListLongMap!10741)

(assert (=> d!111469 (= lt!406197 lt!406199)))

(declare-fun lt!406186 () Unit!30560)

(assert (=> d!111469 (= lt!406186 e!503231)))

(declare-fun c!95129 () Bool)

(assert (=> d!111469 (= c!95129 e!503236)))

(declare-fun res!607584 () Bool)

(assert (=> d!111469 (=> (not res!607584) (not e!503236))))

(assert (=> d!111469 (= res!607584 (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10214 thiss!1181))))))

(assert (=> d!111469 (= lt!406199 e!503225)))

(assert (=> d!111469 (= c!95134 (and (not (= (bvand (extraKeys!5147 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5147 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111469 (validMask!0 (mask!26179 thiss!1181))))

(assert (=> d!111469 (= (getCurrentListMap!2660 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5427 thiss!1181)) lt!406197)))

(declare-fun b!899379 () Bool)

(assert (=> b!899379 (= e!503229 (= (apply!412 lt!406197 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5251 thiss!1181)))))

(declare-fun bm!39939 () Bool)

(assert (=> bm!39939 (= call!39938 call!39939)))

(declare-fun bm!39940 () Bool)

(assert (=> bm!39940 (= call!39937 (contains!4419 lt!406197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899380 () Bool)

(declare-fun Unit!30563 () Unit!30560)

(assert (=> b!899380 (= e!503231 Unit!30563)))

(declare-fun b!899381 () Bool)

(assert (=> b!899381 (= e!503230 (not call!39943))))

(assert (= (and d!111469 c!95134) b!899369))

(assert (= (and d!111469 (not c!95134)) b!899377))

(assert (= (and b!899377 c!95132) b!899368))

(assert (= (and b!899377 (not c!95132)) b!899366))

(assert (= (and b!899366 c!95131) b!899371))

(assert (= (and b!899366 (not c!95131)) b!899362))

(assert (= (or b!899371 b!899362) bm!39936))

(assert (= (or b!899368 bm!39936) bm!39939))

(assert (= (or b!899368 b!899371) bm!39934))

(assert (= (or b!899369 bm!39939) bm!39938))

(assert (= (or b!899369 bm!39934) bm!39937))

(assert (= (and d!111469 res!607584) b!899365))

(assert (= (and d!111469 c!95129) b!899376))

(assert (= (and d!111469 (not c!95129)) b!899380))

(assert (= (and d!111469 res!607588) b!899378))

(assert (= (and b!899378 res!607585) b!899374))

(assert (= (and b!899378 (not res!607583)) b!899373))

(assert (= (and b!899373 res!607586) b!899364))

(assert (= (and b!899378 res!607587) b!899361))

(assert (= (and b!899361 c!95133) b!899363))

(assert (= (and b!899361 (not c!95133)) b!899372))

(assert (= (and b!899363 res!607582) b!899379))

(assert (= (or b!899363 b!899372) bm!39940))

(assert (= (and b!899361 res!607589) b!899375))

(assert (= (and b!899375 c!95130) b!899367))

(assert (= (and b!899375 (not c!95130)) b!899381))

(assert (= (and b!899367 res!607581) b!899370))

(assert (= (or b!899367 b!899381) bm!39935))

(declare-fun b_lambda!12987 () Bool)

(assert (=> (not b_lambda!12987) (not b!899364)))

(declare-fun t!25194 () Bool)

(declare-fun tb!5197 () Bool)

(assert (=> (and b!899265 (= (defaultEntry!5427 thiss!1181) (defaultEntry!5427 thiss!1181)) t!25194) tb!5197))

(declare-fun result!10163 () Bool)

(assert (=> tb!5197 (= result!10163 tp_is_empty!18357)))

(assert (=> b!899364 t!25194))

(declare-fun b_and!26339 () Bool)

(assert (= b_and!26335 (and (=> t!25194 result!10163) b_and!26339)))

(assert (=> d!111469 m!835777))

(assert (=> b!899365 m!835833))

(assert (=> b!899365 m!835833))

(declare-fun m!835837 () Bool)

(assert (=> b!899365 m!835837))

(declare-fun m!835839 () Bool)

(assert (=> bm!39935 m!835839))

(declare-fun m!835841 () Bool)

(assert (=> b!899370 m!835841))

(assert (=> b!899373 m!835833))

(assert (=> b!899373 m!835833))

(declare-fun m!835843 () Bool)

(assert (=> b!899373 m!835843))

(declare-fun m!835845 () Bool)

(assert (=> b!899364 m!835845))

(assert (=> b!899364 m!835845))

(declare-fun m!835847 () Bool)

(assert (=> b!899364 m!835847))

(declare-fun m!835849 () Bool)

(assert (=> b!899364 m!835849))

(assert (=> b!899364 m!835833))

(assert (=> b!899364 m!835847))

(assert (=> b!899364 m!835833))

(declare-fun m!835851 () Bool)

(assert (=> b!899364 m!835851))

(declare-fun m!835853 () Bool)

(assert (=> bm!39940 m!835853))

(declare-fun m!835855 () Bool)

(assert (=> b!899369 m!835855))

(declare-fun m!835857 () Bool)

(assert (=> b!899379 m!835857))

(declare-fun m!835859 () Bool)

(assert (=> bm!39938 m!835859))

(assert (=> b!899374 m!835833))

(assert (=> b!899374 m!835833))

(assert (=> b!899374 m!835837))

(declare-fun m!835861 () Bool)

(assert (=> bm!39937 m!835861))

(declare-fun m!835863 () Bool)

(assert (=> b!899376 m!835863))

(declare-fun m!835865 () Bool)

(assert (=> b!899376 m!835865))

(declare-fun m!835867 () Bool)

(assert (=> b!899376 m!835867))

(declare-fun m!835869 () Bool)

(assert (=> b!899376 m!835869))

(assert (=> b!899376 m!835859))

(declare-fun m!835871 () Bool)

(assert (=> b!899376 m!835871))

(declare-fun m!835873 () Bool)

(assert (=> b!899376 m!835873))

(assert (=> b!899376 m!835865))

(declare-fun m!835875 () Bool)

(assert (=> b!899376 m!835875))

(declare-fun m!835877 () Bool)

(assert (=> b!899376 m!835877))

(assert (=> b!899376 m!835833))

(declare-fun m!835879 () Bool)

(assert (=> b!899376 m!835879))

(declare-fun m!835881 () Bool)

(assert (=> b!899376 m!835881))

(declare-fun m!835883 () Bool)

(assert (=> b!899376 m!835883))

(declare-fun m!835885 () Bool)

(assert (=> b!899376 m!835885))

(declare-fun m!835887 () Bool)

(assert (=> b!899376 m!835887))

(declare-fun m!835889 () Bool)

(assert (=> b!899376 m!835889))

(assert (=> b!899376 m!835883))

(assert (=> b!899376 m!835875))

(declare-fun m!835891 () Bool)

(assert (=> b!899376 m!835891))

(assert (=> b!899376 m!835879))

(assert (=> b!899269 d!111469))

(declare-fun d!111471 () Bool)

(declare-fun e!503239 () Bool)

(assert (=> d!111471 e!503239))

(declare-fun res!607592 () Bool)

(assert (=> d!111471 (=> res!607592 e!503239)))

(declare-fun lt!406211 () SeekEntryResult!8931)

(assert (=> d!111471 (= res!607592 (not ((_ is Found!8931) lt!406211)))))

(assert (=> d!111471 (= lt!406211 (seekEntry!0 key!785 (_keys!10214 thiss!1181) (mask!26179 thiss!1181)))))

(declare-fun lt!406210 () Unit!30560)

(declare-fun choose!1501 (array!52756 array!52758 (_ BitVec 32) (_ BitVec 32) V!29441 V!29441 (_ BitVec 64)) Unit!30560)

(assert (=> d!111471 (= lt!406210 (choose!1501 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) key!785))))

(assert (=> d!111471 (validMask!0 (mask!26179 thiss!1181))))

(assert (=> d!111471 (= (lemmaSeekEntryGivesInRangeIndex!95 (_keys!10214 thiss!1181) (_values!5438 thiss!1181) (mask!26179 thiss!1181) (extraKeys!5147 thiss!1181) (zeroValue!5251 thiss!1181) (minValue!5251 thiss!1181) key!785) lt!406210)))

(declare-fun b!899386 () Bool)

(assert (=> b!899386 (= e!503239 (inRange!0 (index!38096 lt!406211) (mask!26179 thiss!1181)))))

(assert (= (and d!111471 (not res!607592)) b!899386))

(assert (=> d!111471 m!835789))

(declare-fun m!835893 () Bool)

(assert (=> d!111471 m!835893))

(assert (=> d!111471 m!835777))

(declare-fun m!835895 () Bool)

(assert (=> b!899386 m!835895))

(assert (=> b!899270 d!111471))

(declare-fun b!899399 () Bool)

(declare-fun e!503248 () SeekEntryResult!8931)

(declare-fun lt!406221 () SeekEntryResult!8931)

(assert (=> b!899399 (= e!503248 (Found!8931 (index!38097 lt!406221)))))

(declare-fun b!899400 () Bool)

(declare-fun e!503247 () SeekEntryResult!8931)

(assert (=> b!899400 (= e!503247 Undefined!8931)))

(declare-fun b!899401 () Bool)

(declare-fun e!503246 () SeekEntryResult!8931)

(assert (=> b!899401 (= e!503246 (MissingZero!8931 (index!38097 lt!406221)))))

(declare-fun d!111473 () Bool)

(declare-fun lt!406223 () SeekEntryResult!8931)

(assert (=> d!111473 (and (or ((_ is MissingVacant!8931) lt!406223) (not ((_ is Found!8931) lt!406223)) (and (bvsge (index!38096 lt!406223) #b00000000000000000000000000000000) (bvslt (index!38096 lt!406223) (size!25810 (_keys!10214 thiss!1181))))) (not ((_ is MissingVacant!8931) lt!406223)) (or (not ((_ is Found!8931) lt!406223)) (= (select (arr!25353 (_keys!10214 thiss!1181)) (index!38096 lt!406223)) key!785)))))

(assert (=> d!111473 (= lt!406223 e!503247)))

(declare-fun c!95143 () Bool)

(assert (=> d!111473 (= c!95143 (and ((_ is Intermediate!8931) lt!406221) (undefined!9743 lt!406221)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52756 (_ BitVec 32)) SeekEntryResult!8931)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111473 (= lt!406221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26179 thiss!1181)) key!785 (_keys!10214 thiss!1181) (mask!26179 thiss!1181)))))

(assert (=> d!111473 (validMask!0 (mask!26179 thiss!1181))))

(assert (=> d!111473 (= (seekEntry!0 key!785 (_keys!10214 thiss!1181) (mask!26179 thiss!1181)) lt!406223)))

(declare-fun b!899402 () Bool)

(declare-fun c!95142 () Bool)

(declare-fun lt!406220 () (_ BitVec 64))

(assert (=> b!899402 (= c!95142 (= lt!406220 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899402 (= e!503248 e!503246)))

(declare-fun b!899403 () Bool)

(declare-fun lt!406222 () SeekEntryResult!8931)

(assert (=> b!899403 (= e!503246 (ite ((_ is MissingVacant!8931) lt!406222) (MissingZero!8931 (index!38098 lt!406222)) lt!406222))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52756 (_ BitVec 32)) SeekEntryResult!8931)

(assert (=> b!899403 (= lt!406222 (seekKeyOrZeroReturnVacant!0 (x!76630 lt!406221) (index!38097 lt!406221) (index!38097 lt!406221) key!785 (_keys!10214 thiss!1181) (mask!26179 thiss!1181)))))

(declare-fun b!899404 () Bool)

(assert (=> b!899404 (= e!503247 e!503248)))

(assert (=> b!899404 (= lt!406220 (select (arr!25353 (_keys!10214 thiss!1181)) (index!38097 lt!406221)))))

(declare-fun c!95141 () Bool)

(assert (=> b!899404 (= c!95141 (= lt!406220 key!785))))

(assert (= (and d!111473 c!95143) b!899400))

(assert (= (and d!111473 (not c!95143)) b!899404))

(assert (= (and b!899404 c!95141) b!899399))

(assert (= (and b!899404 (not c!95141)) b!899402))

(assert (= (and b!899402 c!95142) b!899401))

(assert (= (and b!899402 (not c!95142)) b!899403))

(declare-fun m!835897 () Bool)

(assert (=> d!111473 m!835897))

(declare-fun m!835899 () Bool)

(assert (=> d!111473 m!835899))

(assert (=> d!111473 m!835899))

(declare-fun m!835901 () Bool)

(assert (=> d!111473 m!835901))

(assert (=> d!111473 m!835777))

(declare-fun m!835903 () Bool)

(assert (=> b!899403 m!835903))

(declare-fun m!835905 () Bool)

(assert (=> b!899404 m!835905))

(assert (=> b!899270 d!111473))

(declare-fun d!111475 () Bool)

(declare-fun res!607599 () Bool)

(declare-fun e!503251 () Bool)

(assert (=> d!111475 (=> (not res!607599) (not e!503251))))

(declare-fun simpleValid!326 (LongMapFixedSize!4410) Bool)

(assert (=> d!111475 (= res!607599 (simpleValid!326 thiss!1181))))

(assert (=> d!111475 (= (valid!1695 thiss!1181) e!503251)))

(declare-fun b!899411 () Bool)

(declare-fun res!607600 () Bool)

(assert (=> b!899411 (=> (not res!607600) (not e!503251))))

(declare-fun arrayCountValidKeys!0 (array!52756 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899411 (= res!607600 (= (arrayCountValidKeys!0 (_keys!10214 thiss!1181) #b00000000000000000000000000000000 (size!25810 (_keys!10214 thiss!1181))) (_size!2260 thiss!1181)))))

(declare-fun b!899412 () Bool)

(declare-fun res!607601 () Bool)

(assert (=> b!899412 (=> (not res!607601) (not e!503251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52756 (_ BitVec 32)) Bool)

(assert (=> b!899412 (= res!607601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10214 thiss!1181) (mask!26179 thiss!1181)))))

(declare-fun b!899413 () Bool)

(declare-datatypes ((List!17848 0))(
  ( (Nil!17845) (Cons!17844 (h!18988 (_ BitVec 64)) (t!25195 List!17848)) )
))
(declare-fun arrayNoDuplicates!0 (array!52756 (_ BitVec 32) List!17848) Bool)

(assert (=> b!899413 (= e!503251 (arrayNoDuplicates!0 (_keys!10214 thiss!1181) #b00000000000000000000000000000000 Nil!17845))))

(assert (= (and d!111475 res!607599) b!899411))

(assert (= (and b!899411 res!607600) b!899412))

(assert (= (and b!899412 res!607601) b!899413))

(declare-fun m!835907 () Bool)

(assert (=> d!111475 m!835907))

(declare-fun m!835909 () Bool)

(assert (=> b!899411 m!835909))

(declare-fun m!835911 () Bool)

(assert (=> b!899412 m!835911))

(declare-fun m!835913 () Bool)

(assert (=> b!899413 m!835913))

(assert (=> start!76950 d!111475))

(declare-fun d!111477 () Bool)

(assert (=> d!111477 (= (array_inv!19896 (_keys!10214 thiss!1181)) (bvsge (size!25810 (_keys!10214 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899265 d!111477))

(declare-fun d!111479 () Bool)

(assert (=> d!111479 (= (array_inv!19897 (_values!5438 thiss!1181)) (bvsge (size!25811 (_values!5438 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899265 d!111479))

(declare-fun d!111481 () Bool)

(assert (=> d!111481 (= (inRange!0 (index!38096 lt!406107) (mask!26179 thiss!1181)) (and (bvsge (index!38096 lt!406107) #b00000000000000000000000000000000) (bvslt (index!38096 lt!406107) (bvadd (mask!26179 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899266 d!111481))

(declare-fun condMapEmpty!29204 () Bool)

(declare-fun mapDefault!29204 () ValueCell!8697)

(assert (=> mapNonEmpty!29198 (= condMapEmpty!29204 (= mapRest!29198 ((as const (Array (_ BitVec 32) ValueCell!8697)) mapDefault!29204)))))

(declare-fun e!503256 () Bool)

(declare-fun mapRes!29204 () Bool)

(assert (=> mapNonEmpty!29198 (= tp!56163 (and e!503256 mapRes!29204))))

(declare-fun mapNonEmpty!29204 () Bool)

(declare-fun tp!56173 () Bool)

(declare-fun e!503257 () Bool)

(assert (=> mapNonEmpty!29204 (= mapRes!29204 (and tp!56173 e!503257))))

(declare-fun mapValue!29204 () ValueCell!8697)

(declare-fun mapKey!29204 () (_ BitVec 32))

(declare-fun mapRest!29204 () (Array (_ BitVec 32) ValueCell!8697))

(assert (=> mapNonEmpty!29204 (= mapRest!29198 (store mapRest!29204 mapKey!29204 mapValue!29204))))

(declare-fun b!899420 () Bool)

(assert (=> b!899420 (= e!503257 tp_is_empty!18357)))

(declare-fun b!899421 () Bool)

(assert (=> b!899421 (= e!503256 tp_is_empty!18357)))

(declare-fun mapIsEmpty!29204 () Bool)

(assert (=> mapIsEmpty!29204 mapRes!29204))

(assert (= (and mapNonEmpty!29198 condMapEmpty!29204) mapIsEmpty!29204))

(assert (= (and mapNonEmpty!29198 (not condMapEmpty!29204)) mapNonEmpty!29204))

(assert (= (and mapNonEmpty!29204 ((_ is ValueCellFull!8697) mapValue!29204)) b!899420))

(assert (= (and mapNonEmpty!29198 ((_ is ValueCellFull!8697) mapDefault!29204)) b!899421))

(declare-fun m!835915 () Bool)

(assert (=> mapNonEmpty!29204 m!835915))

(declare-fun b_lambda!12989 () Bool)

(assert (= b_lambda!12987 (or (and b!899265 b_free!16029) b_lambda!12989)))

(check-sat (not bm!39938) (not b!899386) (not bm!39935) (not d!111459) b_and!26339 (not d!111475) (not b!899379) (not b!899307) (not d!111469) (not mapNonEmpty!29204) (not b!899374) (not bm!39937) (not b!899365) (not b!899403) (not b!899318) tp_is_empty!18357 (not b!899373) (not b!899364) (not d!111461) (not b!899309) (not b!899376) (not b!899411) (not d!111473) (not bm!39940) (not d!111471) (not b!899370) (not b!899412) (not b!899312) (not b_next!16029) (not d!111463) (not b_lambda!12989) (not b!899369) (not b!899413))
(check-sat b_and!26339 (not b_next!16029))
