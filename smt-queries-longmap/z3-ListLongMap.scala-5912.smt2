; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76746 () Bool)

(assert start!76746)

(declare-fun b!898011 () Bool)

(declare-fun b_free!15973 () Bool)

(declare-fun b_next!15973 () Bool)

(assert (=> b!898011 (= b_free!15973 (not b_next!15973))))

(declare-fun tp!55965 () Bool)

(declare-fun b_and!26275 () Bool)

(assert (=> b!898011 (= tp!55965 b_and!26275)))

(declare-fun b!898003 () Bool)

(declare-fun e!502163 () Bool)

(declare-fun e!502166 () Bool)

(assert (=> b!898003 (= e!502163 e!502166)))

(declare-fun res!606803 () Bool)

(assert (=> b!898003 (=> res!606803 e!502166)))

(declare-datatypes ((array!52665 0))(
  ( (array!52666 (arr!25312 (Array (_ BitVec 32) (_ BitVec 64))) (size!25766 (_ BitVec 32))) )
))
(declare-datatypes ((V!29367 0))(
  ( (V!29368 (val!9201 Int)) )
))
(declare-datatypes ((ValueCell!8669 0))(
  ( (ValueCellFull!8669 (v!11688 V!29367)) (EmptyCell!8669) )
))
(declare-datatypes ((array!52667 0))(
  ( (array!52668 (arr!25313 (Array (_ BitVec 32) ValueCell!8669)) (size!25767 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4354 0))(
  ( (LongMapFixedSize!4355 (defaultEntry!5389 Int) (mask!26106 (_ BitVec 32)) (extraKeys!5096 (_ BitVec 32)) (zeroValue!5200 V!29367) (minValue!5200 V!29367) (_size!2232 (_ BitVec 32)) (_keys!10166 array!52665) (_values!5387 array!52667) (_vacant!2232 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4354)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898003 (= res!606803 (not (validMask!0 (mask!26106 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898003 (arrayContainsKey!0 (_keys!10166 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30488 0))(
  ( (Unit!30489) )
))
(declare-fun lt!405423 () Unit!30488)

(declare-datatypes ((SeekEntryResult!8858 0))(
  ( (MissingZero!8858 (index!37803 (_ BitVec 32))) (Found!8858 (index!37804 (_ BitVec 32))) (Intermediate!8858 (undefined!9670 Bool) (index!37805 (_ BitVec 32)) (x!76387 (_ BitVec 32))) (Undefined!8858) (MissingVacant!8858 (index!37806 (_ BitVec 32))) )
))
(declare-fun lt!405424 () SeekEntryResult!8858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52665 (_ BitVec 64) (_ BitVec 32)) Unit!30488)

(assert (=> b!898003 (= lt!405423 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10166 thiss!1181) key!785 (index!37804 lt!405424)))))

(declare-fun res!606804 () Bool)

(declare-fun e!502167 () Bool)

(assert (=> start!76746 (=> (not res!606804) (not e!502167))))

(declare-fun valid!1688 (LongMapFixedSize!4354) Bool)

(assert (=> start!76746 (= res!606804 (valid!1688 thiss!1181))))

(assert (=> start!76746 e!502167))

(declare-fun e!502162 () Bool)

(assert (=> start!76746 e!502162))

(assert (=> start!76746 true))

(declare-fun b!898004 () Bool)

(declare-fun e!502160 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898004 (= e!502160 (inRange!0 (index!37804 lt!405424) (mask!26106 thiss!1181)))))

(declare-fun b!898005 () Bool)

(declare-fun res!606806 () Bool)

(assert (=> b!898005 (=> (not res!606806) (not e!502167))))

(assert (=> b!898005 (= res!606806 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898006 () Bool)

(declare-fun e!502164 () Bool)

(declare-fun tp_is_empty!18301 () Bool)

(assert (=> b!898006 (= e!502164 tp_is_empty!18301)))

(declare-fun b!898007 () Bool)

(assert (=> b!898007 (= e!502166 (or (not (= (size!25767 (_values!5387 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26106 thiss!1181)))) (not (= (size!25766 (_keys!10166 thiss!1181)) (size!25767 (_values!5387 thiss!1181)))) (bvslt (mask!26106 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5096 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!29083 () Bool)

(declare-fun mapRes!29083 () Bool)

(declare-fun tp!55966 () Bool)

(assert (=> mapNonEmpty!29083 (= mapRes!29083 (and tp!55966 e!502164))))

(declare-fun mapKey!29083 () (_ BitVec 32))

(declare-fun mapValue!29083 () ValueCell!8669)

(declare-fun mapRest!29083 () (Array (_ BitVec 32) ValueCell!8669))

(assert (=> mapNonEmpty!29083 (= (arr!25313 (_values!5387 thiss!1181)) (store mapRest!29083 mapKey!29083 mapValue!29083))))

(declare-fun b!898008 () Bool)

(declare-fun e!502165 () Bool)

(declare-fun e!502159 () Bool)

(assert (=> b!898008 (= e!502165 (and e!502159 mapRes!29083))))

(declare-fun condMapEmpty!29083 () Bool)

(declare-fun mapDefault!29083 () ValueCell!8669)

(assert (=> b!898008 (= condMapEmpty!29083 (= (arr!25313 (_values!5387 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8669)) mapDefault!29083)))))

(declare-fun mapIsEmpty!29083 () Bool)

(assert (=> mapIsEmpty!29083 mapRes!29083))

(declare-fun b!898009 () Bool)

(assert (=> b!898009 (= e!502167 (not e!502163))))

(declare-fun res!606802 () Bool)

(assert (=> b!898009 (=> res!606802 e!502163)))

(get-info :version)

(assert (=> b!898009 (= res!606802 (not ((_ is Found!8858) lt!405424)))))

(assert (=> b!898009 e!502160))

(declare-fun res!606805 () Bool)

(assert (=> b!898009 (=> res!606805 e!502160)))

(assert (=> b!898009 (= res!606805 (not ((_ is Found!8858) lt!405424)))))

(declare-fun lt!405425 () Unit!30488)

(declare-fun lemmaSeekEntryGivesInRangeIndex!84 (array!52665 array!52667 (_ BitVec 32) (_ BitVec 32) V!29367 V!29367 (_ BitVec 64)) Unit!30488)

(assert (=> b!898009 (= lt!405425 (lemmaSeekEntryGivesInRangeIndex!84 (_keys!10166 thiss!1181) (_values!5387 thiss!1181) (mask!26106 thiss!1181) (extraKeys!5096 thiss!1181) (zeroValue!5200 thiss!1181) (minValue!5200 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52665 (_ BitVec 32)) SeekEntryResult!8858)

(assert (=> b!898009 (= lt!405424 (seekEntry!0 key!785 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)))))

(declare-fun b!898010 () Bool)

(assert (=> b!898010 (= e!502159 tp_is_empty!18301)))

(declare-fun array_inv!19920 (array!52665) Bool)

(declare-fun array_inv!19921 (array!52667) Bool)

(assert (=> b!898011 (= e!502162 (and tp!55965 tp_is_empty!18301 (array_inv!19920 (_keys!10166 thiss!1181)) (array_inv!19921 (_values!5387 thiss!1181)) e!502165))))

(assert (= (and start!76746 res!606804) b!898005))

(assert (= (and b!898005 res!606806) b!898009))

(assert (= (and b!898009 (not res!606805)) b!898004))

(assert (= (and b!898009 (not res!606802)) b!898003))

(assert (= (and b!898003 (not res!606803)) b!898007))

(assert (= (and b!898008 condMapEmpty!29083) mapIsEmpty!29083))

(assert (= (and b!898008 (not condMapEmpty!29083)) mapNonEmpty!29083))

(assert (= (and mapNonEmpty!29083 ((_ is ValueCellFull!8669) mapValue!29083)) b!898006))

(assert (= (and b!898008 ((_ is ValueCellFull!8669) mapDefault!29083)) b!898010))

(assert (= b!898011 b!898008))

(assert (= start!76746 b!898011))

(declare-fun m!835327 () Bool)

(assert (=> b!898009 m!835327))

(declare-fun m!835329 () Bool)

(assert (=> b!898009 m!835329))

(declare-fun m!835331 () Bool)

(assert (=> mapNonEmpty!29083 m!835331))

(declare-fun m!835333 () Bool)

(assert (=> b!898003 m!835333))

(declare-fun m!835335 () Bool)

(assert (=> b!898003 m!835335))

(declare-fun m!835337 () Bool)

(assert (=> b!898003 m!835337))

(declare-fun m!835339 () Bool)

(assert (=> start!76746 m!835339))

(declare-fun m!835341 () Bool)

(assert (=> b!898011 m!835341))

(declare-fun m!835343 () Bool)

(assert (=> b!898011 m!835343))

(declare-fun m!835345 () Bool)

(assert (=> b!898004 m!835345))

(check-sat (not b!898003) (not b_next!15973) (not b!898011) (not b!898004) (not b!898009) b_and!26275 (not start!76746) (not mapNonEmpty!29083) tp_is_empty!18301)
(check-sat b_and!26275 (not b_next!15973))
(get-model)

(declare-fun d!111355 () Bool)

(declare-fun res!606843 () Bool)

(declare-fun e!502224 () Bool)

(assert (=> d!111355 (=> (not res!606843) (not e!502224))))

(declare-fun simpleValid!317 (LongMapFixedSize!4354) Bool)

(assert (=> d!111355 (= res!606843 (simpleValid!317 thiss!1181))))

(assert (=> d!111355 (= (valid!1688 thiss!1181) e!502224)))

(declare-fun b!898072 () Bool)

(declare-fun res!606844 () Bool)

(assert (=> b!898072 (=> (not res!606844) (not e!502224))))

(declare-fun arrayCountValidKeys!0 (array!52665 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898072 (= res!606844 (= (arrayCountValidKeys!0 (_keys!10166 thiss!1181) #b00000000000000000000000000000000 (size!25766 (_keys!10166 thiss!1181))) (_size!2232 thiss!1181)))))

(declare-fun b!898073 () Bool)

(declare-fun res!606845 () Bool)

(assert (=> b!898073 (=> (not res!606845) (not e!502224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52665 (_ BitVec 32)) Bool)

(assert (=> b!898073 (= res!606845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)))))

(declare-fun b!898074 () Bool)

(declare-datatypes ((List!17777 0))(
  ( (Nil!17774) (Cons!17773 (h!18919 (_ BitVec 64)) (t!25108 List!17777)) )
))
(declare-fun arrayNoDuplicates!0 (array!52665 (_ BitVec 32) List!17777) Bool)

(assert (=> b!898074 (= e!502224 (arrayNoDuplicates!0 (_keys!10166 thiss!1181) #b00000000000000000000000000000000 Nil!17774))))

(assert (= (and d!111355 res!606843) b!898072))

(assert (= (and b!898072 res!606844) b!898073))

(assert (= (and b!898073 res!606845) b!898074))

(declare-fun m!835387 () Bool)

(assert (=> d!111355 m!835387))

(declare-fun m!835389 () Bool)

(assert (=> b!898072 m!835389))

(declare-fun m!835391 () Bool)

(assert (=> b!898073 m!835391))

(declare-fun m!835393 () Bool)

(assert (=> b!898074 m!835393))

(assert (=> start!76746 d!111355))

(declare-fun d!111357 () Bool)

(assert (=> d!111357 (= (inRange!0 (index!37804 lt!405424) (mask!26106 thiss!1181)) (and (bvsge (index!37804 lt!405424) #b00000000000000000000000000000000) (bvslt (index!37804 lt!405424) (bvadd (mask!26106 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898004 d!111357))

(declare-fun d!111359 () Bool)

(assert (=> d!111359 (= (validMask!0 (mask!26106 thiss!1181)) (and (or (= (mask!26106 thiss!1181) #b00000000000000000000000000000111) (= (mask!26106 thiss!1181) #b00000000000000000000000000001111) (= (mask!26106 thiss!1181) #b00000000000000000000000000011111) (= (mask!26106 thiss!1181) #b00000000000000000000000000111111) (= (mask!26106 thiss!1181) #b00000000000000000000000001111111) (= (mask!26106 thiss!1181) #b00000000000000000000000011111111) (= (mask!26106 thiss!1181) #b00000000000000000000000111111111) (= (mask!26106 thiss!1181) #b00000000000000000000001111111111) (= (mask!26106 thiss!1181) #b00000000000000000000011111111111) (= (mask!26106 thiss!1181) #b00000000000000000000111111111111) (= (mask!26106 thiss!1181) #b00000000000000000001111111111111) (= (mask!26106 thiss!1181) #b00000000000000000011111111111111) (= (mask!26106 thiss!1181) #b00000000000000000111111111111111) (= (mask!26106 thiss!1181) #b00000000000000001111111111111111) (= (mask!26106 thiss!1181) #b00000000000000011111111111111111) (= (mask!26106 thiss!1181) #b00000000000000111111111111111111) (= (mask!26106 thiss!1181) #b00000000000001111111111111111111) (= (mask!26106 thiss!1181) #b00000000000011111111111111111111) (= (mask!26106 thiss!1181) #b00000000000111111111111111111111) (= (mask!26106 thiss!1181) #b00000000001111111111111111111111) (= (mask!26106 thiss!1181) #b00000000011111111111111111111111) (= (mask!26106 thiss!1181) #b00000000111111111111111111111111) (= (mask!26106 thiss!1181) #b00000001111111111111111111111111) (= (mask!26106 thiss!1181) #b00000011111111111111111111111111) (= (mask!26106 thiss!1181) #b00000111111111111111111111111111) (= (mask!26106 thiss!1181) #b00001111111111111111111111111111) (= (mask!26106 thiss!1181) #b00011111111111111111111111111111) (= (mask!26106 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26106 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898003 d!111359))

(declare-fun d!111361 () Bool)

(declare-fun res!606850 () Bool)

(declare-fun e!502229 () Bool)

(assert (=> d!111361 (=> res!606850 e!502229)))

(assert (=> d!111361 (= res!606850 (= (select (arr!25312 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111361 (= (arrayContainsKey!0 (_keys!10166 thiss!1181) key!785 #b00000000000000000000000000000000) e!502229)))

(declare-fun b!898079 () Bool)

(declare-fun e!502230 () Bool)

(assert (=> b!898079 (= e!502229 e!502230)))

(declare-fun res!606851 () Bool)

(assert (=> b!898079 (=> (not res!606851) (not e!502230))))

(assert (=> b!898079 (= res!606851 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25766 (_keys!10166 thiss!1181))))))

(declare-fun b!898080 () Bool)

(assert (=> b!898080 (= e!502230 (arrayContainsKey!0 (_keys!10166 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111361 (not res!606850)) b!898079))

(assert (= (and b!898079 res!606851) b!898080))

(declare-fun m!835395 () Bool)

(assert (=> d!111361 m!835395))

(declare-fun m!835397 () Bool)

(assert (=> b!898080 m!835397))

(assert (=> b!898003 d!111361))

(declare-fun d!111363 () Bool)

(assert (=> d!111363 (arrayContainsKey!0 (_keys!10166 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405446 () Unit!30488)

(declare-fun choose!13 (array!52665 (_ BitVec 64) (_ BitVec 32)) Unit!30488)

(assert (=> d!111363 (= lt!405446 (choose!13 (_keys!10166 thiss!1181) key!785 (index!37804 lt!405424)))))

(assert (=> d!111363 (bvsge (index!37804 lt!405424) #b00000000000000000000000000000000)))

(assert (=> d!111363 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10166 thiss!1181) key!785 (index!37804 lt!405424)) lt!405446)))

(declare-fun bs!25197 () Bool)

(assert (= bs!25197 d!111363))

(assert (=> bs!25197 m!835335))

(declare-fun m!835399 () Bool)

(assert (=> bs!25197 m!835399))

(assert (=> b!898003 d!111363))

(declare-fun d!111365 () Bool)

(assert (=> d!111365 (= (array_inv!19920 (_keys!10166 thiss!1181)) (bvsge (size!25766 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898011 d!111365))

(declare-fun d!111367 () Bool)

(assert (=> d!111367 (= (array_inv!19921 (_values!5387 thiss!1181)) (bvsge (size!25767 (_values!5387 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898011 d!111367))

(declare-fun d!111369 () Bool)

(declare-fun e!502233 () Bool)

(assert (=> d!111369 e!502233))

(declare-fun res!606854 () Bool)

(assert (=> d!111369 (=> res!606854 e!502233)))

(declare-fun lt!405452 () SeekEntryResult!8858)

(assert (=> d!111369 (= res!606854 (not ((_ is Found!8858) lt!405452)))))

(assert (=> d!111369 (= lt!405452 (seekEntry!0 key!785 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)))))

(declare-fun lt!405451 () Unit!30488)

(declare-fun choose!1488 (array!52665 array!52667 (_ BitVec 32) (_ BitVec 32) V!29367 V!29367 (_ BitVec 64)) Unit!30488)

(assert (=> d!111369 (= lt!405451 (choose!1488 (_keys!10166 thiss!1181) (_values!5387 thiss!1181) (mask!26106 thiss!1181) (extraKeys!5096 thiss!1181) (zeroValue!5200 thiss!1181) (minValue!5200 thiss!1181) key!785))))

(assert (=> d!111369 (validMask!0 (mask!26106 thiss!1181))))

(assert (=> d!111369 (= (lemmaSeekEntryGivesInRangeIndex!84 (_keys!10166 thiss!1181) (_values!5387 thiss!1181) (mask!26106 thiss!1181) (extraKeys!5096 thiss!1181) (zeroValue!5200 thiss!1181) (minValue!5200 thiss!1181) key!785) lt!405451)))

(declare-fun b!898083 () Bool)

(assert (=> b!898083 (= e!502233 (inRange!0 (index!37804 lt!405452) (mask!26106 thiss!1181)))))

(assert (= (and d!111369 (not res!606854)) b!898083))

(assert (=> d!111369 m!835329))

(declare-fun m!835401 () Bool)

(assert (=> d!111369 m!835401))

(assert (=> d!111369 m!835333))

(declare-fun m!835403 () Bool)

(assert (=> b!898083 m!835403))

(assert (=> b!898009 d!111369))

(declare-fun b!898096 () Bool)

(declare-fun e!502242 () SeekEntryResult!8858)

(declare-fun lt!405462 () SeekEntryResult!8858)

(assert (=> b!898096 (= e!502242 (Found!8858 (index!37805 lt!405462)))))

(declare-fun b!898097 () Bool)

(declare-fun e!502240 () SeekEntryResult!8858)

(assert (=> b!898097 (= e!502240 (MissingZero!8858 (index!37805 lt!405462)))))

(declare-fun d!111371 () Bool)

(declare-fun lt!405464 () SeekEntryResult!8858)

(assert (=> d!111371 (and (or ((_ is MissingVacant!8858) lt!405464) (not ((_ is Found!8858) lt!405464)) (and (bvsge (index!37804 lt!405464) #b00000000000000000000000000000000) (bvslt (index!37804 lt!405464) (size!25766 (_keys!10166 thiss!1181))))) (not ((_ is MissingVacant!8858) lt!405464)) (or (not ((_ is Found!8858) lt!405464)) (= (select (arr!25312 (_keys!10166 thiss!1181)) (index!37804 lt!405464)) key!785)))))

(declare-fun e!502241 () SeekEntryResult!8858)

(assert (=> d!111371 (= lt!405464 e!502241)))

(declare-fun c!95067 () Bool)

(assert (=> d!111371 (= c!95067 (and ((_ is Intermediate!8858) lt!405462) (undefined!9670 lt!405462)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52665 (_ BitVec 32)) SeekEntryResult!8858)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111371 (= lt!405462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26106 thiss!1181)) key!785 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)))))

(assert (=> d!111371 (validMask!0 (mask!26106 thiss!1181))))

(assert (=> d!111371 (= (seekEntry!0 key!785 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)) lt!405464)))

(declare-fun b!898098 () Bool)

(assert (=> b!898098 (= e!502241 e!502242)))

(declare-fun lt!405461 () (_ BitVec 64))

(assert (=> b!898098 (= lt!405461 (select (arr!25312 (_keys!10166 thiss!1181)) (index!37805 lt!405462)))))

(declare-fun c!95068 () Bool)

(assert (=> b!898098 (= c!95068 (= lt!405461 key!785))))

(declare-fun b!898099 () Bool)

(declare-fun lt!405463 () SeekEntryResult!8858)

(assert (=> b!898099 (= e!502240 (ite ((_ is MissingVacant!8858) lt!405463) (MissingZero!8858 (index!37806 lt!405463)) lt!405463))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52665 (_ BitVec 32)) SeekEntryResult!8858)

(assert (=> b!898099 (= lt!405463 (seekKeyOrZeroReturnVacant!0 (x!76387 lt!405462) (index!37805 lt!405462) (index!37805 lt!405462) key!785 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)))))

(declare-fun b!898100 () Bool)

(assert (=> b!898100 (= e!502241 Undefined!8858)))

(declare-fun b!898101 () Bool)

(declare-fun c!95069 () Bool)

(assert (=> b!898101 (= c!95069 (= lt!405461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898101 (= e!502242 e!502240)))

(assert (= (and d!111371 c!95067) b!898100))

(assert (= (and d!111371 (not c!95067)) b!898098))

(assert (= (and b!898098 c!95068) b!898096))

(assert (= (and b!898098 (not c!95068)) b!898101))

(assert (= (and b!898101 c!95069) b!898097))

(assert (= (and b!898101 (not c!95069)) b!898099))

(declare-fun m!835405 () Bool)

(assert (=> d!111371 m!835405))

(declare-fun m!835407 () Bool)

(assert (=> d!111371 m!835407))

(assert (=> d!111371 m!835407))

(declare-fun m!835409 () Bool)

(assert (=> d!111371 m!835409))

(assert (=> d!111371 m!835333))

(declare-fun m!835411 () Bool)

(assert (=> b!898098 m!835411))

(declare-fun m!835413 () Bool)

(assert (=> b!898099 m!835413))

(assert (=> b!898009 d!111371))

(declare-fun b!898109 () Bool)

(declare-fun e!502247 () Bool)

(assert (=> b!898109 (= e!502247 tp_is_empty!18301)))

(declare-fun mapIsEmpty!29092 () Bool)

(declare-fun mapRes!29092 () Bool)

(assert (=> mapIsEmpty!29092 mapRes!29092))

(declare-fun mapNonEmpty!29092 () Bool)

(declare-fun tp!55981 () Bool)

(declare-fun e!502248 () Bool)

(assert (=> mapNonEmpty!29092 (= mapRes!29092 (and tp!55981 e!502248))))

(declare-fun mapKey!29092 () (_ BitVec 32))

(declare-fun mapRest!29092 () (Array (_ BitVec 32) ValueCell!8669))

(declare-fun mapValue!29092 () ValueCell!8669)

(assert (=> mapNonEmpty!29092 (= mapRest!29083 (store mapRest!29092 mapKey!29092 mapValue!29092))))

(declare-fun b!898108 () Bool)

(assert (=> b!898108 (= e!502248 tp_is_empty!18301)))

(declare-fun condMapEmpty!29092 () Bool)

(declare-fun mapDefault!29092 () ValueCell!8669)

(assert (=> mapNonEmpty!29083 (= condMapEmpty!29092 (= mapRest!29083 ((as const (Array (_ BitVec 32) ValueCell!8669)) mapDefault!29092)))))

(assert (=> mapNonEmpty!29083 (= tp!55966 (and e!502247 mapRes!29092))))

(assert (= (and mapNonEmpty!29083 condMapEmpty!29092) mapIsEmpty!29092))

(assert (= (and mapNonEmpty!29083 (not condMapEmpty!29092)) mapNonEmpty!29092))

(assert (= (and mapNonEmpty!29092 ((_ is ValueCellFull!8669) mapValue!29092)) b!898108))

(assert (= (and mapNonEmpty!29083 ((_ is ValueCellFull!8669) mapDefault!29092)) b!898109))

(declare-fun m!835415 () Bool)

(assert (=> mapNonEmpty!29092 m!835415))

(check-sat (not d!111355) (not b!898080) (not d!111371) (not mapNonEmpty!29092) (not b!898074) (not d!111369) (not b!898072) (not b_next!15973) (not b!898099) b_and!26275 (not b!898083) (not b!898073) (not d!111363) tp_is_empty!18301)
(check-sat b_and!26275 (not b_next!15973))
(get-model)

(assert (=> d!111363 d!111361))

(declare-fun d!111373 () Bool)

(assert (=> d!111373 (arrayContainsKey!0 (_keys!10166 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111373 true))

(declare-fun _$60!412 () Unit!30488)

(assert (=> d!111373 (= (choose!13 (_keys!10166 thiss!1181) key!785 (index!37804 lt!405424)) _$60!412)))

(declare-fun bs!25198 () Bool)

(assert (= bs!25198 d!111373))

(assert (=> bs!25198 m!835335))

(assert (=> d!111363 d!111373))

(declare-fun d!111375 () Bool)

(declare-fun res!606855 () Bool)

(declare-fun e!502249 () Bool)

(assert (=> d!111375 (=> res!606855 e!502249)))

(assert (=> d!111375 (= res!606855 (= (select (arr!25312 (_keys!10166 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111375 (= (arrayContainsKey!0 (_keys!10166 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!502249)))

(declare-fun b!898110 () Bool)

(declare-fun e!502250 () Bool)

(assert (=> b!898110 (= e!502249 e!502250)))

(declare-fun res!606856 () Bool)

(assert (=> b!898110 (=> (not res!606856) (not e!502250))))

(assert (=> b!898110 (= res!606856 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25766 (_keys!10166 thiss!1181))))))

(declare-fun b!898111 () Bool)

(assert (=> b!898111 (= e!502250 (arrayContainsKey!0 (_keys!10166 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111375 (not res!606855)) b!898110))

(assert (= (and b!898110 res!606856) b!898111))

(declare-fun m!835417 () Bool)

(assert (=> d!111375 m!835417))

(declare-fun m!835419 () Bool)

(assert (=> b!898111 m!835419))

(assert (=> b!898080 d!111375))

(declare-fun d!111377 () Bool)

(declare-fun e!502263 () Bool)

(assert (=> d!111377 e!502263))

(declare-fun c!95077 () Bool)

(declare-fun lt!405469 () SeekEntryResult!8858)

(assert (=> d!111377 (= c!95077 (and ((_ is Intermediate!8858) lt!405469) (undefined!9670 lt!405469)))))

(declare-fun e!502261 () SeekEntryResult!8858)

(assert (=> d!111377 (= lt!405469 e!502261)))

(declare-fun c!95076 () Bool)

(assert (=> d!111377 (= c!95076 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!405470 () (_ BitVec 64))

(assert (=> d!111377 (= lt!405470 (select (arr!25312 (_keys!10166 thiss!1181)) (toIndex!0 key!785 (mask!26106 thiss!1181))))))

(assert (=> d!111377 (validMask!0 (mask!26106 thiss!1181))))

(assert (=> d!111377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26106 thiss!1181)) key!785 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)) lt!405469)))

(declare-fun b!898130 () Bool)

(declare-fun e!502265 () SeekEntryResult!8858)

(assert (=> b!898130 (= e!502265 (Intermediate!8858 false (toIndex!0 key!785 (mask!26106 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!898131 () Bool)

(assert (=> b!898131 (and (bvsge (index!37805 lt!405469) #b00000000000000000000000000000000) (bvslt (index!37805 lt!405469) (size!25766 (_keys!10166 thiss!1181))))))

(declare-fun res!606863 () Bool)

(assert (=> b!898131 (= res!606863 (= (select (arr!25312 (_keys!10166 thiss!1181)) (index!37805 lt!405469)) key!785))))

(declare-fun e!502264 () Bool)

(assert (=> b!898131 (=> res!606863 e!502264)))

(declare-fun e!502262 () Bool)

(assert (=> b!898131 (= e!502262 e!502264)))

(declare-fun b!898132 () Bool)

(assert (=> b!898132 (and (bvsge (index!37805 lt!405469) #b00000000000000000000000000000000) (bvslt (index!37805 lt!405469) (size!25766 (_keys!10166 thiss!1181))))))

(assert (=> b!898132 (= e!502264 (= (select (arr!25312 (_keys!10166 thiss!1181)) (index!37805 lt!405469)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898133 () Bool)

(assert (=> b!898133 (= e!502263 (bvsge (x!76387 lt!405469) #b01111111111111111111111111111110))))

(declare-fun b!898134 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898134 (= e!502265 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26106 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!26106 thiss!1181)) key!785 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)))))

(declare-fun b!898135 () Bool)

(assert (=> b!898135 (= e!502261 (Intermediate!8858 true (toIndex!0 key!785 (mask!26106 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!898136 () Bool)

(assert (=> b!898136 (= e!502263 e!502262)))

(declare-fun res!606864 () Bool)

(assert (=> b!898136 (= res!606864 (and ((_ is Intermediate!8858) lt!405469) (not (undefined!9670 lt!405469)) (bvslt (x!76387 lt!405469) #b01111111111111111111111111111110) (bvsge (x!76387 lt!405469) #b00000000000000000000000000000000) (bvsge (x!76387 lt!405469) #b00000000000000000000000000000000)))))

(assert (=> b!898136 (=> (not res!606864) (not e!502262))))

(declare-fun b!898137 () Bool)

(assert (=> b!898137 (= e!502261 e!502265)))

(declare-fun c!95078 () Bool)

(assert (=> b!898137 (= c!95078 (or (= lt!405470 key!785) (= (bvadd lt!405470 lt!405470) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!898138 () Bool)

(assert (=> b!898138 (and (bvsge (index!37805 lt!405469) #b00000000000000000000000000000000) (bvslt (index!37805 lt!405469) (size!25766 (_keys!10166 thiss!1181))))))

(declare-fun res!606865 () Bool)

(assert (=> b!898138 (= res!606865 (= (select (arr!25312 (_keys!10166 thiss!1181)) (index!37805 lt!405469)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898138 (=> res!606865 e!502264)))

(assert (= (and d!111377 c!95076) b!898135))

(assert (= (and d!111377 (not c!95076)) b!898137))

(assert (= (and b!898137 c!95078) b!898130))

(assert (= (and b!898137 (not c!95078)) b!898134))

(assert (= (and d!111377 c!95077) b!898133))

(assert (= (and d!111377 (not c!95077)) b!898136))

(assert (= (and b!898136 res!606864) b!898131))

(assert (= (and b!898131 (not res!606863)) b!898138))

(assert (= (and b!898138 (not res!606865)) b!898132))

(declare-fun m!835421 () Bool)

(assert (=> b!898131 m!835421))

(assert (=> b!898134 m!835407))

(declare-fun m!835423 () Bool)

(assert (=> b!898134 m!835423))

(assert (=> b!898134 m!835423))

(declare-fun m!835425 () Bool)

(assert (=> b!898134 m!835425))

(assert (=> b!898132 m!835421))

(assert (=> d!111377 m!835407))

(declare-fun m!835427 () Bool)

(assert (=> d!111377 m!835427))

(assert (=> d!111377 m!835333))

(assert (=> b!898138 m!835421))

(assert (=> d!111371 d!111377))

(declare-fun d!111379 () Bool)

(declare-fun lt!405476 () (_ BitVec 32))

(declare-fun lt!405475 () (_ BitVec 32))

(assert (=> d!111379 (= lt!405476 (bvmul (bvxor lt!405475 (bvlshr lt!405475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111379 (= lt!405475 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111379 (and (bvsge (mask!26106 thiss!1181) #b00000000000000000000000000000000) (let ((res!606866 (let ((h!18920 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76405 (bvmul (bvxor h!18920 (bvlshr h!18920 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76405 (bvlshr x!76405 #b00000000000000000000000000001101)) (mask!26106 thiss!1181)))))) (and (bvslt res!606866 (bvadd (mask!26106 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606866 #b00000000000000000000000000000000))))))

(assert (=> d!111379 (= (toIndex!0 key!785 (mask!26106 thiss!1181)) (bvand (bvxor lt!405476 (bvlshr lt!405476 #b00000000000000000000000000001101)) (mask!26106 thiss!1181)))))

(assert (=> d!111371 d!111379))

(assert (=> d!111371 d!111359))

(declare-fun d!111381 () Bool)

(assert (=> d!111381 (= (inRange!0 (index!37804 lt!405452) (mask!26106 thiss!1181)) (and (bvsge (index!37804 lt!405452) #b00000000000000000000000000000000) (bvslt (index!37804 lt!405452) (bvadd (mask!26106 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898083 d!111381))

(declare-fun d!111383 () Bool)

(declare-fun res!606874 () Bool)

(declare-fun e!502275 () Bool)

(assert (=> d!111383 (=> res!606874 e!502275)))

(assert (=> d!111383 (= res!606874 (bvsge #b00000000000000000000000000000000 (size!25766 (_keys!10166 thiss!1181))))))

(assert (=> d!111383 (= (arrayNoDuplicates!0 (_keys!10166 thiss!1181) #b00000000000000000000000000000000 Nil!17774) e!502275)))

(declare-fun b!898149 () Bool)

(declare-fun e!502274 () Bool)

(declare-fun call!39844 () Bool)

(assert (=> b!898149 (= e!502274 call!39844)))

(declare-fun bm!39841 () Bool)

(declare-fun c!95081 () Bool)

(assert (=> bm!39841 (= call!39844 (arrayNoDuplicates!0 (_keys!10166 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95081 (Cons!17773 (select (arr!25312 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000) Nil!17774) Nil!17774)))))

(declare-fun b!898150 () Bool)

(declare-fun e!502276 () Bool)

(assert (=> b!898150 (= e!502275 e!502276)))

(declare-fun res!606875 () Bool)

(assert (=> b!898150 (=> (not res!606875) (not e!502276))))

(declare-fun e!502277 () Bool)

(assert (=> b!898150 (= res!606875 (not e!502277))))

(declare-fun res!606873 () Bool)

(assert (=> b!898150 (=> (not res!606873) (not e!502277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898150 (= res!606873 (validKeyInArray!0 (select (arr!25312 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898151 () Bool)

(assert (=> b!898151 (= e!502274 call!39844)))

(declare-fun b!898152 () Bool)

(assert (=> b!898152 (= e!502276 e!502274)))

(assert (=> b!898152 (= c!95081 (validKeyInArray!0 (select (arr!25312 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898153 () Bool)

(declare-fun contains!4374 (List!17777 (_ BitVec 64)) Bool)

(assert (=> b!898153 (= e!502277 (contains!4374 Nil!17774 (select (arr!25312 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111383 (not res!606874)) b!898150))

(assert (= (and b!898150 res!606873) b!898153))

(assert (= (and b!898150 res!606875) b!898152))

(assert (= (and b!898152 c!95081) b!898151))

(assert (= (and b!898152 (not c!95081)) b!898149))

(assert (= (or b!898151 b!898149) bm!39841))

(assert (=> bm!39841 m!835395))

(declare-fun m!835429 () Bool)

(assert (=> bm!39841 m!835429))

(assert (=> b!898150 m!835395))

(assert (=> b!898150 m!835395))

(declare-fun m!835431 () Bool)

(assert (=> b!898150 m!835431))

(assert (=> b!898152 m!835395))

(assert (=> b!898152 m!835395))

(assert (=> b!898152 m!835431))

(assert (=> b!898153 m!835395))

(assert (=> b!898153 m!835395))

(declare-fun m!835433 () Bool)

(assert (=> b!898153 m!835433))

(assert (=> b!898074 d!111383))

(declare-fun b!898166 () Bool)

(declare-fun e!502286 () SeekEntryResult!8858)

(assert (=> b!898166 (= e!502286 (Found!8858 (index!37805 lt!405462)))))

(declare-fun d!111385 () Bool)

(declare-fun lt!405482 () SeekEntryResult!8858)

(assert (=> d!111385 (and (or ((_ is Undefined!8858) lt!405482) (not ((_ is Found!8858) lt!405482)) (and (bvsge (index!37804 lt!405482) #b00000000000000000000000000000000) (bvslt (index!37804 lt!405482) (size!25766 (_keys!10166 thiss!1181))))) (or ((_ is Undefined!8858) lt!405482) ((_ is Found!8858) lt!405482) (not ((_ is MissingVacant!8858) lt!405482)) (not (= (index!37806 lt!405482) (index!37805 lt!405462))) (and (bvsge (index!37806 lt!405482) #b00000000000000000000000000000000) (bvslt (index!37806 lt!405482) (size!25766 (_keys!10166 thiss!1181))))) (or ((_ is Undefined!8858) lt!405482) (ite ((_ is Found!8858) lt!405482) (= (select (arr!25312 (_keys!10166 thiss!1181)) (index!37804 lt!405482)) key!785) (and ((_ is MissingVacant!8858) lt!405482) (= (index!37806 lt!405482) (index!37805 lt!405462)) (= (select (arr!25312 (_keys!10166 thiss!1181)) (index!37806 lt!405482)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!502285 () SeekEntryResult!8858)

(assert (=> d!111385 (= lt!405482 e!502285)))

(declare-fun c!95088 () Bool)

(assert (=> d!111385 (= c!95088 (bvsge (x!76387 lt!405462) #b01111111111111111111111111111110))))

(declare-fun lt!405481 () (_ BitVec 64))

(assert (=> d!111385 (= lt!405481 (select (arr!25312 (_keys!10166 thiss!1181)) (index!37805 lt!405462)))))

(assert (=> d!111385 (validMask!0 (mask!26106 thiss!1181))))

(assert (=> d!111385 (= (seekKeyOrZeroReturnVacant!0 (x!76387 lt!405462) (index!37805 lt!405462) (index!37805 lt!405462) key!785 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)) lt!405482)))

(declare-fun e!502284 () SeekEntryResult!8858)

(declare-fun b!898167 () Bool)

(assert (=> b!898167 (= e!502284 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76387 lt!405462) #b00000000000000000000000000000001) (nextIndex!0 (index!37805 lt!405462) (bvadd (x!76387 lt!405462) #b00000000000000000000000000000001) (mask!26106 thiss!1181)) (index!37805 lt!405462) key!785 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)))))

(declare-fun b!898168 () Bool)

(assert (=> b!898168 (= e!502285 Undefined!8858)))

(declare-fun b!898169 () Bool)

(assert (=> b!898169 (= e!502285 e!502286)))

(declare-fun c!95089 () Bool)

(assert (=> b!898169 (= c!95089 (= lt!405481 key!785))))

(declare-fun b!898170 () Bool)

(declare-fun c!95090 () Bool)

(assert (=> b!898170 (= c!95090 (= lt!405481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898170 (= e!502286 e!502284)))

(declare-fun b!898171 () Bool)

(assert (=> b!898171 (= e!502284 (MissingVacant!8858 (index!37805 lt!405462)))))

(assert (= (and d!111385 c!95088) b!898168))

(assert (= (and d!111385 (not c!95088)) b!898169))

(assert (= (and b!898169 c!95089) b!898166))

(assert (= (and b!898169 (not c!95089)) b!898170))

(assert (= (and b!898170 c!95090) b!898171))

(assert (= (and b!898170 (not c!95090)) b!898167))

(declare-fun m!835435 () Bool)

(assert (=> d!111385 m!835435))

(declare-fun m!835437 () Bool)

(assert (=> d!111385 m!835437))

(assert (=> d!111385 m!835411))

(assert (=> d!111385 m!835333))

(declare-fun m!835439 () Bool)

(assert (=> b!898167 m!835439))

(assert (=> b!898167 m!835439))

(declare-fun m!835441 () Bool)

(assert (=> b!898167 m!835441))

(assert (=> b!898099 d!111385))

(declare-fun d!111387 () Bool)

(declare-fun res!606881 () Bool)

(declare-fun e!502295 () Bool)

(assert (=> d!111387 (=> res!606881 e!502295)))

(assert (=> d!111387 (= res!606881 (bvsge #b00000000000000000000000000000000 (size!25766 (_keys!10166 thiss!1181))))))

(assert (=> d!111387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)) e!502295)))

(declare-fun b!898180 () Bool)

(declare-fun e!502294 () Bool)

(declare-fun e!502293 () Bool)

(assert (=> b!898180 (= e!502294 e!502293)))

(declare-fun lt!405490 () (_ BitVec 64))

(assert (=> b!898180 (= lt!405490 (select (arr!25312 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405491 () Unit!30488)

(assert (=> b!898180 (= lt!405491 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10166 thiss!1181) lt!405490 #b00000000000000000000000000000000))))

(assert (=> b!898180 (arrayContainsKey!0 (_keys!10166 thiss!1181) lt!405490 #b00000000000000000000000000000000)))

(declare-fun lt!405489 () Unit!30488)

(assert (=> b!898180 (= lt!405489 lt!405491)))

(declare-fun res!606880 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52665 (_ BitVec 32)) SeekEntryResult!8858)

(assert (=> b!898180 (= res!606880 (= (seekEntryOrOpen!0 (select (arr!25312 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000) (_keys!10166 thiss!1181) (mask!26106 thiss!1181)) (Found!8858 #b00000000000000000000000000000000)))))

(assert (=> b!898180 (=> (not res!606880) (not e!502293))))

(declare-fun bm!39844 () Bool)

(declare-fun call!39847 () Bool)

(assert (=> bm!39844 (= call!39847 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10166 thiss!1181) (mask!26106 thiss!1181)))))

(declare-fun b!898181 () Bool)

(assert (=> b!898181 (= e!502293 call!39847)))

(declare-fun b!898182 () Bool)

(assert (=> b!898182 (= e!502295 e!502294)))

(declare-fun c!95093 () Bool)

(assert (=> b!898182 (= c!95093 (validKeyInArray!0 (select (arr!25312 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898183 () Bool)

(assert (=> b!898183 (= e!502294 call!39847)))

(assert (= (and d!111387 (not res!606881)) b!898182))

(assert (= (and b!898182 c!95093) b!898180))

(assert (= (and b!898182 (not c!95093)) b!898183))

(assert (= (and b!898180 res!606880) b!898181))

(assert (= (or b!898181 b!898183) bm!39844))

(assert (=> b!898180 m!835395))

(declare-fun m!835443 () Bool)

(assert (=> b!898180 m!835443))

(declare-fun m!835445 () Bool)

(assert (=> b!898180 m!835445))

(assert (=> b!898180 m!835395))

(declare-fun m!835447 () Bool)

(assert (=> b!898180 m!835447))

(declare-fun m!835449 () Bool)

(assert (=> bm!39844 m!835449))

(assert (=> b!898182 m!835395))

(assert (=> b!898182 m!835395))

(assert (=> b!898182 m!835431))

(assert (=> b!898073 d!111387))

(declare-fun b!898192 () Bool)

(declare-fun e!502301 () (_ BitVec 32))

(assert (=> b!898192 (= e!502301 #b00000000000000000000000000000000)))

(declare-fun bm!39847 () Bool)

(declare-fun call!39850 () (_ BitVec 32))

(assert (=> bm!39847 (= call!39850 (arrayCountValidKeys!0 (_keys!10166 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25766 (_keys!10166 thiss!1181))))))

(declare-fun b!898193 () Bool)

(declare-fun e!502300 () (_ BitVec 32))

(assert (=> b!898193 (= e!502300 call!39850)))

(declare-fun b!898194 () Bool)

(assert (=> b!898194 (= e!502300 (bvadd #b00000000000000000000000000000001 call!39850))))

(declare-fun b!898195 () Bool)

(assert (=> b!898195 (= e!502301 e!502300)))

(declare-fun c!95099 () Bool)

(assert (=> b!898195 (= c!95099 (validKeyInArray!0 (select (arr!25312 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111389 () Bool)

(declare-fun lt!405494 () (_ BitVec 32))

(assert (=> d!111389 (and (bvsge lt!405494 #b00000000000000000000000000000000) (bvsle lt!405494 (bvsub (size!25766 (_keys!10166 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111389 (= lt!405494 e!502301)))

(declare-fun c!95098 () Bool)

(assert (=> d!111389 (= c!95098 (bvsge #b00000000000000000000000000000000 (size!25766 (_keys!10166 thiss!1181))))))

(assert (=> d!111389 (and (bvsle #b00000000000000000000000000000000 (size!25766 (_keys!10166 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25766 (_keys!10166 thiss!1181)) (size!25766 (_keys!10166 thiss!1181))))))

(assert (=> d!111389 (= (arrayCountValidKeys!0 (_keys!10166 thiss!1181) #b00000000000000000000000000000000 (size!25766 (_keys!10166 thiss!1181))) lt!405494)))

(assert (= (and d!111389 c!95098) b!898192))

(assert (= (and d!111389 (not c!95098)) b!898195))

(assert (= (and b!898195 c!95099) b!898194))

(assert (= (and b!898195 (not c!95099)) b!898193))

(assert (= (or b!898194 b!898193) bm!39847))

(declare-fun m!835451 () Bool)

(assert (=> bm!39847 m!835451))

(assert (=> b!898195 m!835395))

(assert (=> b!898195 m!835395))

(assert (=> b!898195 m!835431))

(assert (=> b!898072 d!111389))

(assert (=> d!111369 d!111371))

(declare-fun d!111391 () Bool)

(declare-fun e!502304 () Bool)

(assert (=> d!111391 e!502304))

(declare-fun res!606884 () Bool)

(assert (=> d!111391 (=> res!606884 e!502304)))

(declare-fun lt!405497 () SeekEntryResult!8858)

(assert (=> d!111391 (= res!606884 (not ((_ is Found!8858) lt!405497)))))

(assert (=> d!111391 (= lt!405497 (seekEntry!0 key!785 (_keys!10166 thiss!1181) (mask!26106 thiss!1181)))))

(assert (=> d!111391 true))

(declare-fun _$36!360 () Unit!30488)

(assert (=> d!111391 (= (choose!1488 (_keys!10166 thiss!1181) (_values!5387 thiss!1181) (mask!26106 thiss!1181) (extraKeys!5096 thiss!1181) (zeroValue!5200 thiss!1181) (minValue!5200 thiss!1181) key!785) _$36!360)))

(declare-fun b!898198 () Bool)

(assert (=> b!898198 (= e!502304 (inRange!0 (index!37804 lt!405497) (mask!26106 thiss!1181)))))

(assert (= (and d!111391 (not res!606884)) b!898198))

(assert (=> d!111391 m!835329))

(declare-fun m!835453 () Bool)

(assert (=> b!898198 m!835453))

(assert (=> d!111369 d!111391))

(assert (=> d!111369 d!111359))

(declare-fun b!898208 () Bool)

(declare-fun res!606894 () Bool)

(declare-fun e!502307 () Bool)

(assert (=> b!898208 (=> (not res!606894) (not e!502307))))

(declare-fun size!25772 (LongMapFixedSize!4354) (_ BitVec 32))

(assert (=> b!898208 (= res!606894 (bvsge (size!25772 thiss!1181) (_size!2232 thiss!1181)))))

(declare-fun b!898207 () Bool)

(declare-fun res!606896 () Bool)

(assert (=> b!898207 (=> (not res!606896) (not e!502307))))

(assert (=> b!898207 (= res!606896 (and (= (size!25767 (_values!5387 thiss!1181)) (bvadd (mask!26106 thiss!1181) #b00000000000000000000000000000001)) (= (size!25766 (_keys!10166 thiss!1181)) (size!25767 (_values!5387 thiss!1181))) (bvsge (_size!2232 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2232 thiss!1181) (bvadd (mask!26106 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!111393 () Bool)

(declare-fun res!606895 () Bool)

(assert (=> d!111393 (=> (not res!606895) (not e!502307))))

(assert (=> d!111393 (= res!606895 (validMask!0 (mask!26106 thiss!1181)))))

(assert (=> d!111393 (= (simpleValid!317 thiss!1181) e!502307)))

(declare-fun b!898210 () Bool)

(assert (=> b!898210 (= e!502307 (and (bvsge (extraKeys!5096 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5096 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2232 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!898209 () Bool)

(declare-fun res!606893 () Bool)

(assert (=> b!898209 (=> (not res!606893) (not e!502307))))

(assert (=> b!898209 (= res!606893 (= (size!25772 thiss!1181) (bvadd (_size!2232 thiss!1181) (bvsdiv (bvadd (extraKeys!5096 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!111393 res!606895) b!898207))

(assert (= (and b!898207 res!606896) b!898208))

(assert (= (and b!898208 res!606894) b!898209))

(assert (= (and b!898209 res!606893) b!898210))

(declare-fun m!835455 () Bool)

(assert (=> b!898208 m!835455))

(assert (=> d!111393 m!835333))

(assert (=> b!898209 m!835455))

(assert (=> d!111355 d!111393))

(declare-fun b!898212 () Bool)

(declare-fun e!502308 () Bool)

(assert (=> b!898212 (= e!502308 tp_is_empty!18301)))

(declare-fun mapIsEmpty!29093 () Bool)

(declare-fun mapRes!29093 () Bool)

(assert (=> mapIsEmpty!29093 mapRes!29093))

(declare-fun mapNonEmpty!29093 () Bool)

(declare-fun tp!55982 () Bool)

(declare-fun e!502309 () Bool)

(assert (=> mapNonEmpty!29093 (= mapRes!29093 (and tp!55982 e!502309))))

(declare-fun mapValue!29093 () ValueCell!8669)

(declare-fun mapKey!29093 () (_ BitVec 32))

(declare-fun mapRest!29093 () (Array (_ BitVec 32) ValueCell!8669))

(assert (=> mapNonEmpty!29093 (= mapRest!29092 (store mapRest!29093 mapKey!29093 mapValue!29093))))

(declare-fun b!898211 () Bool)

(assert (=> b!898211 (= e!502309 tp_is_empty!18301)))

(declare-fun condMapEmpty!29093 () Bool)

(declare-fun mapDefault!29093 () ValueCell!8669)

(assert (=> mapNonEmpty!29092 (= condMapEmpty!29093 (= mapRest!29092 ((as const (Array (_ BitVec 32) ValueCell!8669)) mapDefault!29093)))))

(assert (=> mapNonEmpty!29092 (= tp!55981 (and e!502308 mapRes!29093))))

(assert (= (and mapNonEmpty!29092 condMapEmpty!29093) mapIsEmpty!29093))

(assert (= (and mapNonEmpty!29092 (not condMapEmpty!29093)) mapNonEmpty!29093))

(assert (= (and mapNonEmpty!29093 ((_ is ValueCellFull!8669) mapValue!29093)) b!898211))

(assert (= (and mapNonEmpty!29092 ((_ is ValueCellFull!8669) mapDefault!29093)) b!898212))

(declare-fun m!835457 () Bool)

(assert (=> mapNonEmpty!29093 m!835457))

(check-sat (not mapNonEmpty!29093) (not b!898153) (not b!898195) (not b!898180) (not bm!39841) (not b!898209) (not b!898150) (not d!111377) (not b!898182) (not b!898208) (not b!898134) (not d!111385) (not bm!39844) (not d!111391) (not d!111393) (not b_next!15973) (not b!898152) (not b!898111) (not b!898167) b_and!26275 (not b!898198) (not bm!39847) tp_is_empty!18301 (not d!111373))
(check-sat b_and!26275 (not b_next!15973))
