; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76594 () Bool)

(assert start!76594)

(declare-fun b!897194 () Bool)

(declare-fun b_free!15943 () Bool)

(declare-fun b_next!15943 () Bool)

(assert (=> b!897194 (= b_free!15943 (not b_next!15943))))

(declare-fun tp!55859 () Bool)

(declare-fun b_and!26245 () Bool)

(assert (=> b!897194 (= tp!55859 b_and!26245)))

(declare-fun mapIsEmpty!29021 () Bool)

(declare-fun mapRes!29021 () Bool)

(assert (=> mapIsEmpty!29021 mapRes!29021))

(declare-fun mapNonEmpty!29021 () Bool)

(declare-fun tp!55858 () Bool)

(declare-fun e!501516 () Bool)

(assert (=> mapNonEmpty!29021 (= mapRes!29021 (and tp!55858 e!501516))))

(declare-datatypes ((array!52595 0))(
  ( (array!52596 (arr!25282 (Array (_ BitVec 32) (_ BitVec 64))) (size!25734 (_ BitVec 32))) )
))
(declare-datatypes ((V!29327 0))(
  ( (V!29328 (val!9186 Int)) )
))
(declare-datatypes ((ValueCell!8654 0))(
  ( (ValueCellFull!8654 (v!11673 V!29327)) (EmptyCell!8654) )
))
(declare-datatypes ((array!52597 0))(
  ( (array!52598 (arr!25283 (Array (_ BitVec 32) ValueCell!8654)) (size!25735 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4324 0))(
  ( (LongMapFixedSize!4325 (defaultEntry!5374 Int) (mask!26052 (_ BitVec 32)) (extraKeys!5074 (_ BitVec 32)) (zeroValue!5178 V!29327) (minValue!5178 V!29327) (_size!2217 (_ BitVec 32)) (_keys!10133 array!52595) (_values!5365 array!52597) (_vacant!2217 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4324)

(declare-fun mapRest!29021 () (Array (_ BitVec 32) ValueCell!8654))

(declare-fun mapKey!29021 () (_ BitVec 32))

(declare-fun mapValue!29021 () ValueCell!8654)

(assert (=> mapNonEmpty!29021 (= (arr!25283 (_values!5365 thiss!1181)) (store mapRest!29021 mapKey!29021 mapValue!29021))))

(declare-datatypes ((SeekEntryResult!8845 0))(
  ( (MissingZero!8845 (index!37751 (_ BitVec 32))) (Found!8845 (index!37752 (_ BitVec 32))) (Intermediate!8845 (undefined!9657 Bool) (index!37753 (_ BitVec 32)) (x!76276 (_ BitVec 32))) (Undefined!8845) (MissingVacant!8845 (index!37754 (_ BitVec 32))) )
))
(declare-fun lt!405127 () SeekEntryResult!8845)

(declare-fun e!501514 () Bool)

(declare-fun b!897188 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897188 (= e!501514 (arrayContainsKey!0 (_keys!10133 thiss!1181) key!785 (index!37752 lt!405127)))))

(declare-fun b!897189 () Bool)

(declare-fun e!501518 () Bool)

(declare-fun tp_is_empty!18271 () Bool)

(assert (=> b!897189 (= e!501518 tp_is_empty!18271)))

(declare-fun b!897190 () Bool)

(declare-fun e!501515 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897190 (= e!501515 (inRange!0 (index!37752 lt!405127) (mask!26052 thiss!1181)))))

(declare-fun b!897191 () Bool)

(declare-fun e!501517 () Bool)

(assert (=> b!897191 (= e!501517 (not e!501514))))

(declare-fun res!606422 () Bool)

(assert (=> b!897191 (=> res!606422 e!501514)))

(get-info :version)

(assert (=> b!897191 (= res!606422 (or (not ((_ is Found!8845) lt!405127)) (bvslt (index!37752 lt!405127) #b00000000000000000000000000000000) (bvsge (index!37752 lt!405127) (size!25734 (_keys!10133 thiss!1181))) (bvsge (size!25734 (_keys!10133 thiss!1181)) #b01111111111111111111111111111111)))))

(assert (=> b!897191 e!501515))

(declare-fun res!606419 () Bool)

(assert (=> b!897191 (=> res!606419 e!501515)))

(assert (=> b!897191 (= res!606419 (not ((_ is Found!8845) lt!405127)))))

(declare-datatypes ((Unit!30464 0))(
  ( (Unit!30465) )
))
(declare-fun lt!405128 () Unit!30464)

(declare-fun lemmaSeekEntryGivesInRangeIndex!73 (array!52595 array!52597 (_ BitVec 32) (_ BitVec 32) V!29327 V!29327 (_ BitVec 64)) Unit!30464)

(assert (=> b!897191 (= lt!405128 (lemmaSeekEntryGivesInRangeIndex!73 (_keys!10133 thiss!1181) (_values!5365 thiss!1181) (mask!26052 thiss!1181) (extraKeys!5074 thiss!1181) (zeroValue!5178 thiss!1181) (minValue!5178 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52595 (_ BitVec 32)) SeekEntryResult!8845)

(assert (=> b!897191 (= lt!405127 (seekEntry!0 key!785 (_keys!10133 thiss!1181) (mask!26052 thiss!1181)))))

(declare-fun b!897192 () Bool)

(assert (=> b!897192 (= e!501516 tp_is_empty!18271)))

(declare-fun res!606420 () Bool)

(assert (=> start!76594 (=> (not res!606420) (not e!501517))))

(declare-fun valid!1679 (LongMapFixedSize!4324) Bool)

(assert (=> start!76594 (= res!606420 (valid!1679 thiss!1181))))

(assert (=> start!76594 e!501517))

(declare-fun e!501513 () Bool)

(assert (=> start!76594 e!501513))

(assert (=> start!76594 true))

(declare-fun b!897193 () Bool)

(declare-fun res!606421 () Bool)

(assert (=> b!897193 (=> (not res!606421) (not e!501517))))

(assert (=> b!897193 (= res!606421 (not (= key!785 (bvneg key!785))))))

(declare-fun e!501519 () Bool)

(declare-fun array_inv!19892 (array!52595) Bool)

(declare-fun array_inv!19893 (array!52597) Bool)

(assert (=> b!897194 (= e!501513 (and tp!55859 tp_is_empty!18271 (array_inv!19892 (_keys!10133 thiss!1181)) (array_inv!19893 (_values!5365 thiss!1181)) e!501519))))

(declare-fun b!897195 () Bool)

(assert (=> b!897195 (= e!501519 (and e!501518 mapRes!29021))))

(declare-fun condMapEmpty!29021 () Bool)

(declare-fun mapDefault!29021 () ValueCell!8654)

(assert (=> b!897195 (= condMapEmpty!29021 (= (arr!25283 (_values!5365 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8654)) mapDefault!29021)))))

(assert (= (and start!76594 res!606420) b!897193))

(assert (= (and b!897193 res!606421) b!897191))

(assert (= (and b!897191 (not res!606419)) b!897190))

(assert (= (and b!897191 (not res!606422)) b!897188))

(assert (= (and b!897195 condMapEmpty!29021) mapIsEmpty!29021))

(assert (= (and b!897195 (not condMapEmpty!29021)) mapNonEmpty!29021))

(assert (= (and mapNonEmpty!29021 ((_ is ValueCellFull!8654) mapValue!29021)) b!897192))

(assert (= (and b!897195 ((_ is ValueCellFull!8654) mapDefault!29021)) b!897189))

(assert (= b!897194 b!897195))

(assert (= start!76594 b!897194))

(declare-fun m!834805 () Bool)

(assert (=> mapNonEmpty!29021 m!834805))

(declare-fun m!834807 () Bool)

(assert (=> b!897190 m!834807))

(declare-fun m!834809 () Bool)

(assert (=> b!897194 m!834809))

(declare-fun m!834811 () Bool)

(assert (=> b!897194 m!834811))

(declare-fun m!834813 () Bool)

(assert (=> b!897188 m!834813))

(declare-fun m!834815 () Bool)

(assert (=> b!897191 m!834815))

(declare-fun m!834817 () Bool)

(assert (=> b!897191 m!834817))

(declare-fun m!834819 () Bool)

(assert (=> start!76594 m!834819))

(check-sat b_and!26245 tp_is_empty!18271 (not b!897191) (not b!897190) (not mapNonEmpty!29021) (not b_next!15943) (not start!76594) (not b!897188) (not b!897194))
(check-sat b_and!26245 (not b_next!15943))
(get-model)

(declare-fun d!111215 () Bool)

(assert (=> d!111215 (= (array_inv!19892 (_keys!10133 thiss!1181)) (bvsge (size!25734 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897194 d!111215))

(declare-fun d!111217 () Bool)

(assert (=> d!111217 (= (array_inv!19893 (_values!5365 thiss!1181)) (bvsge (size!25735 (_values!5365 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897194 d!111217))

(declare-fun d!111219 () Bool)

(declare-fun e!501571 () Bool)

(assert (=> d!111219 e!501571))

(declare-fun res!606449 () Bool)

(assert (=> d!111219 (=> res!606449 e!501571)))

(declare-fun lt!405146 () SeekEntryResult!8845)

(assert (=> d!111219 (= res!606449 (not ((_ is Found!8845) lt!405146)))))

(assert (=> d!111219 (= lt!405146 (seekEntry!0 key!785 (_keys!10133 thiss!1181) (mask!26052 thiss!1181)))))

(declare-fun lt!405145 () Unit!30464)

(declare-fun choose!1483 (array!52595 array!52597 (_ BitVec 32) (_ BitVec 32) V!29327 V!29327 (_ BitVec 64)) Unit!30464)

(assert (=> d!111219 (= lt!405145 (choose!1483 (_keys!10133 thiss!1181) (_values!5365 thiss!1181) (mask!26052 thiss!1181) (extraKeys!5074 thiss!1181) (zeroValue!5178 thiss!1181) (minValue!5178 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!111219 (validMask!0 (mask!26052 thiss!1181))))

(assert (=> d!111219 (= (lemmaSeekEntryGivesInRangeIndex!73 (_keys!10133 thiss!1181) (_values!5365 thiss!1181) (mask!26052 thiss!1181) (extraKeys!5074 thiss!1181) (zeroValue!5178 thiss!1181) (minValue!5178 thiss!1181) key!785) lt!405145)))

(declare-fun b!897246 () Bool)

(assert (=> b!897246 (= e!501571 (inRange!0 (index!37752 lt!405146) (mask!26052 thiss!1181)))))

(assert (= (and d!111219 (not res!606449)) b!897246))

(assert (=> d!111219 m!834817))

(declare-fun m!834853 () Bool)

(assert (=> d!111219 m!834853))

(declare-fun m!834855 () Bool)

(assert (=> d!111219 m!834855))

(declare-fun m!834857 () Bool)

(assert (=> b!897246 m!834857))

(assert (=> b!897191 d!111219))

(declare-fun b!897259 () Bool)

(declare-fun e!501580 () SeekEntryResult!8845)

(declare-fun lt!405158 () SeekEntryResult!8845)

(assert (=> b!897259 (= e!501580 (ite ((_ is MissingVacant!8845) lt!405158) (MissingZero!8845 (index!37754 lt!405158)) lt!405158))))

(declare-fun lt!405157 () SeekEntryResult!8845)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52595 (_ BitVec 32)) SeekEntryResult!8845)

(assert (=> b!897259 (= lt!405158 (seekKeyOrZeroReturnVacant!0 (x!76276 lt!405157) (index!37753 lt!405157) (index!37753 lt!405157) key!785 (_keys!10133 thiss!1181) (mask!26052 thiss!1181)))))

(declare-fun b!897261 () Bool)

(declare-fun e!501579 () SeekEntryResult!8845)

(assert (=> b!897261 (= e!501579 Undefined!8845)))

(declare-fun b!897262 () Bool)

(assert (=> b!897262 (= e!501580 (MissingZero!8845 (index!37753 lt!405157)))))

(declare-fun b!897263 () Bool)

(declare-fun e!501578 () SeekEntryResult!8845)

(assert (=> b!897263 (= e!501579 e!501578)))

(declare-fun lt!405156 () (_ BitVec 64))

(assert (=> b!897263 (= lt!405156 (select (arr!25282 (_keys!10133 thiss!1181)) (index!37753 lt!405157)))))

(declare-fun c!94962 () Bool)

(assert (=> b!897263 (= c!94962 (= lt!405156 key!785))))

(declare-fun b!897264 () Bool)

(assert (=> b!897264 (= e!501578 (Found!8845 (index!37753 lt!405157)))))

(declare-fun d!111221 () Bool)

(declare-fun lt!405155 () SeekEntryResult!8845)

(assert (=> d!111221 (and (or ((_ is MissingVacant!8845) lt!405155) (not ((_ is Found!8845) lt!405155)) (and (bvsge (index!37752 lt!405155) #b00000000000000000000000000000000) (bvslt (index!37752 lt!405155) (size!25734 (_keys!10133 thiss!1181))))) (not ((_ is MissingVacant!8845) lt!405155)) (or (not ((_ is Found!8845) lt!405155)) (= (select (arr!25282 (_keys!10133 thiss!1181)) (index!37752 lt!405155)) key!785)))))

(assert (=> d!111221 (= lt!405155 e!501579)))

(declare-fun c!94963 () Bool)

(assert (=> d!111221 (= c!94963 (and ((_ is Intermediate!8845) lt!405157) (undefined!9657 lt!405157)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52595 (_ BitVec 32)) SeekEntryResult!8845)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111221 (= lt!405157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26052 thiss!1181)) key!785 (_keys!10133 thiss!1181) (mask!26052 thiss!1181)))))

(assert (=> d!111221 (validMask!0 (mask!26052 thiss!1181))))

(assert (=> d!111221 (= (seekEntry!0 key!785 (_keys!10133 thiss!1181) (mask!26052 thiss!1181)) lt!405155)))

(declare-fun b!897260 () Bool)

(declare-fun c!94964 () Bool)

(assert (=> b!897260 (= c!94964 (= lt!405156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897260 (= e!501578 e!501580)))

(assert (= (and d!111221 c!94963) b!897261))

(assert (= (and d!111221 (not c!94963)) b!897263))

(assert (= (and b!897263 c!94962) b!897264))

(assert (= (and b!897263 (not c!94962)) b!897260))

(assert (= (and b!897260 c!94964) b!897262))

(assert (= (and b!897260 (not c!94964)) b!897259))

(declare-fun m!834859 () Bool)

(assert (=> b!897259 m!834859))

(declare-fun m!834861 () Bool)

(assert (=> b!897263 m!834861))

(declare-fun m!834863 () Bool)

(assert (=> d!111221 m!834863))

(declare-fun m!834865 () Bool)

(assert (=> d!111221 m!834865))

(assert (=> d!111221 m!834865))

(declare-fun m!834867 () Bool)

(assert (=> d!111221 m!834867))

(assert (=> d!111221 m!834855))

(assert (=> b!897191 d!111221))

(declare-fun d!111223 () Bool)

(assert (=> d!111223 (= (inRange!0 (index!37752 lt!405127) (mask!26052 thiss!1181)) (and (bvsge (index!37752 lt!405127) #b00000000000000000000000000000000) (bvslt (index!37752 lt!405127) (bvadd (mask!26052 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897190 d!111223))

(declare-fun d!111225 () Bool)

(declare-fun res!606454 () Bool)

(declare-fun e!501585 () Bool)

(assert (=> d!111225 (=> res!606454 e!501585)))

(assert (=> d!111225 (= res!606454 (= (select (arr!25282 (_keys!10133 thiss!1181)) (index!37752 lt!405127)) key!785))))

(assert (=> d!111225 (= (arrayContainsKey!0 (_keys!10133 thiss!1181) key!785 (index!37752 lt!405127)) e!501585)))

(declare-fun b!897269 () Bool)

(declare-fun e!501586 () Bool)

(assert (=> b!897269 (= e!501585 e!501586)))

(declare-fun res!606455 () Bool)

(assert (=> b!897269 (=> (not res!606455) (not e!501586))))

(assert (=> b!897269 (= res!606455 (bvslt (bvadd (index!37752 lt!405127) #b00000000000000000000000000000001) (size!25734 (_keys!10133 thiss!1181))))))

(declare-fun b!897270 () Bool)

(assert (=> b!897270 (= e!501586 (arrayContainsKey!0 (_keys!10133 thiss!1181) key!785 (bvadd (index!37752 lt!405127) #b00000000000000000000000000000001)))))

(assert (= (and d!111225 (not res!606454)) b!897269))

(assert (= (and b!897269 res!606455) b!897270))

(declare-fun m!834869 () Bool)

(assert (=> d!111225 m!834869))

(declare-fun m!834871 () Bool)

(assert (=> b!897270 m!834871))

(assert (=> b!897188 d!111225))

(declare-fun d!111227 () Bool)

(declare-fun res!606462 () Bool)

(declare-fun e!501589 () Bool)

(assert (=> d!111227 (=> (not res!606462) (not e!501589))))

(declare-fun simpleValid!312 (LongMapFixedSize!4324) Bool)

(assert (=> d!111227 (= res!606462 (simpleValid!312 thiss!1181))))

(assert (=> d!111227 (= (valid!1679 thiss!1181) e!501589)))

(declare-fun b!897277 () Bool)

(declare-fun res!606463 () Bool)

(assert (=> b!897277 (=> (not res!606463) (not e!501589))))

(declare-fun arrayCountValidKeys!0 (array!52595 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897277 (= res!606463 (= (arrayCountValidKeys!0 (_keys!10133 thiss!1181) #b00000000000000000000000000000000 (size!25734 (_keys!10133 thiss!1181))) (_size!2217 thiss!1181)))))

(declare-fun b!897278 () Bool)

(declare-fun res!606464 () Bool)

(assert (=> b!897278 (=> (not res!606464) (not e!501589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52595 (_ BitVec 32)) Bool)

(assert (=> b!897278 (= res!606464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10133 thiss!1181) (mask!26052 thiss!1181)))))

(declare-fun b!897279 () Bool)

(declare-datatypes ((List!17772 0))(
  ( (Nil!17769) (Cons!17768 (h!18912 (_ BitVec 64)) (t!25103 List!17772)) )
))
(declare-fun arrayNoDuplicates!0 (array!52595 (_ BitVec 32) List!17772) Bool)

(assert (=> b!897279 (= e!501589 (arrayNoDuplicates!0 (_keys!10133 thiss!1181) #b00000000000000000000000000000000 Nil!17769))))

(assert (= (and d!111227 res!606462) b!897277))

(assert (= (and b!897277 res!606463) b!897278))

(assert (= (and b!897278 res!606464) b!897279))

(declare-fun m!834873 () Bool)

(assert (=> d!111227 m!834873))

(declare-fun m!834875 () Bool)

(assert (=> b!897277 m!834875))

(declare-fun m!834877 () Bool)

(assert (=> b!897278 m!834877))

(declare-fun m!834879 () Bool)

(assert (=> b!897279 m!834879))

(assert (=> start!76594 d!111227))

(declare-fun condMapEmpty!29030 () Bool)

(declare-fun mapDefault!29030 () ValueCell!8654)

(assert (=> mapNonEmpty!29021 (= condMapEmpty!29030 (= mapRest!29021 ((as const (Array (_ BitVec 32) ValueCell!8654)) mapDefault!29030)))))

(declare-fun e!501594 () Bool)

(declare-fun mapRes!29030 () Bool)

(assert (=> mapNonEmpty!29021 (= tp!55858 (and e!501594 mapRes!29030))))

(declare-fun mapIsEmpty!29030 () Bool)

(assert (=> mapIsEmpty!29030 mapRes!29030))

(declare-fun b!897286 () Bool)

(declare-fun e!501595 () Bool)

(assert (=> b!897286 (= e!501595 tp_is_empty!18271)))

(declare-fun b!897287 () Bool)

(assert (=> b!897287 (= e!501594 tp_is_empty!18271)))

(declare-fun mapNonEmpty!29030 () Bool)

(declare-fun tp!55874 () Bool)

(assert (=> mapNonEmpty!29030 (= mapRes!29030 (and tp!55874 e!501595))))

(declare-fun mapValue!29030 () ValueCell!8654)

(declare-fun mapRest!29030 () (Array (_ BitVec 32) ValueCell!8654))

(declare-fun mapKey!29030 () (_ BitVec 32))

(assert (=> mapNonEmpty!29030 (= mapRest!29021 (store mapRest!29030 mapKey!29030 mapValue!29030))))

(assert (= (and mapNonEmpty!29021 condMapEmpty!29030) mapIsEmpty!29030))

(assert (= (and mapNonEmpty!29021 (not condMapEmpty!29030)) mapNonEmpty!29030))

(assert (= (and mapNonEmpty!29030 ((_ is ValueCellFull!8654) mapValue!29030)) b!897286))

(assert (= (and mapNonEmpty!29021 ((_ is ValueCellFull!8654) mapDefault!29030)) b!897287))

(declare-fun m!834881 () Bool)

(assert (=> mapNonEmpty!29030 m!834881))

(check-sat (not b!897270) tp_is_empty!18271 (not b!897246) (not mapNonEmpty!29030) (not b_next!15943) (not d!111227) (not b!897259) (not d!111219) (not b!897278) (not d!111221) b_and!26245 (not b!897277) (not b!897279))
(check-sat b_and!26245 (not b_next!15943))
