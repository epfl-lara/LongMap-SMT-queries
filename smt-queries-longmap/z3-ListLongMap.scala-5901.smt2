; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76462 () Bool)

(assert start!76462)

(declare-fun b!896375 () Bool)

(declare-fun b_free!15907 () Bool)

(declare-fun b_next!15907 () Bool)

(assert (=> b!896375 (= b_free!15907 (not b_next!15907))))

(declare-fun tp!55731 () Bool)

(declare-fun b_and!26209 () Bool)

(assert (=> b!896375 (= tp!55731 b_and!26209)))

(declare-fun b!896370 () Bool)

(declare-fun res!606066 () Bool)

(declare-fun e!500910 () Bool)

(assert (=> b!896370 (=> (not res!606066) (not e!500910))))

(declare-datatypes ((array!52511 0))(
  ( (array!52512 (arr!25246 (Array (_ BitVec 32) (_ BitVec 64))) (size!25697 (_ BitVec 32))) )
))
(declare-datatypes ((V!29279 0))(
  ( (V!29280 (val!9168 Int)) )
))
(declare-datatypes ((ValueCell!8636 0))(
  ( (ValueCellFull!8636 (v!11655 V!29279)) (EmptyCell!8636) )
))
(declare-datatypes ((array!52513 0))(
  ( (array!52514 (arr!25247 (Array (_ BitVec 32) ValueCell!8636)) (size!25698 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4288 0))(
  ( (LongMapFixedSize!4289 (defaultEntry!5356 Int) (mask!25998 (_ BitVec 32)) (extraKeys!5052 (_ BitVec 32)) (zeroValue!5156 V!29279) (minValue!5156 V!29279) (_size!2199 (_ BitVec 32)) (_keys!10099 array!52511) (_values!5343 array!52513) (_vacant!2199 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4288)

(assert (=> b!896370 (= res!606066 (and (= (size!25698 (_values!5343 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25998 thiss!1181))) (= (size!25697 (_keys!10099 thiss!1181)) (size!25698 (_values!5343 thiss!1181))) (bvsge (mask!25998 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5052 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5052 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28948 () Bool)

(declare-fun mapRes!28948 () Bool)

(assert (=> mapIsEmpty!28948 mapRes!28948))

(declare-fun b!896371 () Bool)

(declare-fun e!500907 () Bool)

(declare-fun tp_is_empty!18235 () Bool)

(assert (=> b!896371 (= e!500907 tp_is_empty!18235)))

(declare-fun res!606064 () Bool)

(declare-fun e!500909 () Bool)

(assert (=> start!76462 (=> (not res!606064) (not e!500909))))

(declare-fun valid!1667 (LongMapFixedSize!4288) Bool)

(assert (=> start!76462 (= res!606064 (valid!1667 thiss!1181))))

(assert (=> start!76462 e!500909))

(declare-fun e!500911 () Bool)

(assert (=> start!76462 e!500911))

(assert (=> start!76462 true))

(declare-fun b!896372 () Bool)

(declare-fun res!606065 () Bool)

(assert (=> b!896372 (=> (not res!606065) (not e!500909))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896372 (= res!606065 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896373 () Bool)

(declare-fun e!500906 () Bool)

(assert (=> b!896373 (= e!500906 (and e!500907 mapRes!28948))))

(declare-fun condMapEmpty!28948 () Bool)

(declare-fun mapDefault!28948 () ValueCell!8636)

(assert (=> b!896373 (= condMapEmpty!28948 (= (arr!25247 (_values!5343 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8636)) mapDefault!28948)))))

(declare-fun mapNonEmpty!28948 () Bool)

(declare-fun tp!55732 () Bool)

(declare-fun e!500908 () Bool)

(assert (=> mapNonEmpty!28948 (= mapRes!28948 (and tp!55732 e!500908))))

(declare-fun mapKey!28948 () (_ BitVec 32))

(declare-fun mapRest!28948 () (Array (_ BitVec 32) ValueCell!8636))

(declare-fun mapValue!28948 () ValueCell!8636)

(assert (=> mapNonEmpty!28948 (= (arr!25247 (_values!5343 thiss!1181)) (store mapRest!28948 mapKey!28948 mapValue!28948))))

(declare-fun b!896374 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52511 (_ BitVec 32)) Bool)

(assert (=> b!896374 (= e!500910 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10099 thiss!1181) (mask!25998 thiss!1181))))))

(declare-fun array_inv!19870 (array!52511) Bool)

(declare-fun array_inv!19871 (array!52513) Bool)

(assert (=> b!896375 (= e!500911 (and tp!55731 tp_is_empty!18235 (array_inv!19870 (_keys!10099 thiss!1181)) (array_inv!19871 (_values!5343 thiss!1181)) e!500906))))

(declare-fun b!896376 () Bool)

(assert (=> b!896376 (= e!500909 e!500910)))

(declare-fun res!606067 () Bool)

(assert (=> b!896376 (=> (not res!606067) (not e!500910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896376 (= res!606067 (validMask!0 (mask!25998 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8833 0))(
  ( (MissingZero!8833 (index!37703 (_ BitVec 32))) (Found!8833 (index!37704 (_ BitVec 32))) (Intermediate!8833 (undefined!9645 Bool) (index!37705 (_ BitVec 32)) (x!76159 (_ BitVec 32))) (Undefined!8833) (MissingVacant!8833 (index!37706 (_ BitVec 32))) )
))
(declare-fun lt!404894 () SeekEntryResult!8833)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52511 (_ BitVec 32)) SeekEntryResult!8833)

(assert (=> b!896376 (= lt!404894 (seekEntry!0 key!785 (_keys!10099 thiss!1181) (mask!25998 thiss!1181)))))

(declare-fun b!896377 () Bool)

(assert (=> b!896377 (= e!500908 tp_is_empty!18235)))

(assert (= (and start!76462 res!606064) b!896372))

(assert (= (and b!896372 res!606065) b!896376))

(assert (= (and b!896376 res!606067) b!896370))

(assert (= (and b!896370 res!606066) b!896374))

(assert (= (and b!896373 condMapEmpty!28948) mapIsEmpty!28948))

(assert (= (and b!896373 (not condMapEmpty!28948)) mapNonEmpty!28948))

(get-info :version)

(assert (= (and mapNonEmpty!28948 ((_ is ValueCellFull!8636) mapValue!28948)) b!896377))

(assert (= (and b!896373 ((_ is ValueCellFull!8636) mapDefault!28948)) b!896371))

(assert (= b!896375 b!896373))

(assert (= start!76462 b!896375))

(declare-fun m!834323 () Bool)

(assert (=> mapNonEmpty!28948 m!834323))

(declare-fun m!834325 () Bool)

(assert (=> b!896374 m!834325))

(declare-fun m!834327 () Bool)

(assert (=> start!76462 m!834327))

(declare-fun m!834329 () Bool)

(assert (=> b!896375 m!834329))

(declare-fun m!834331 () Bool)

(assert (=> b!896375 m!834331))

(declare-fun m!834333 () Bool)

(assert (=> b!896376 m!834333))

(declare-fun m!834335 () Bool)

(assert (=> b!896376 m!834335))

(check-sat (not b!896375) b_and!26209 (not mapNonEmpty!28948) (not b_next!15907) tp_is_empty!18235 (not b!896374) (not start!76462) (not b!896376))
(check-sat b_and!26209 (not b_next!15907))
(get-model)

(declare-fun b!896434 () Bool)

(declare-fun e!500961 () Bool)

(declare-fun call!39802 () Bool)

(assert (=> b!896434 (= e!500961 call!39802)))

(declare-fun b!896435 () Bool)

(declare-fun e!500963 () Bool)

(assert (=> b!896435 (= e!500963 call!39802)))

(declare-fun d!111105 () Bool)

(declare-fun res!606096 () Bool)

(declare-fun e!500962 () Bool)

(assert (=> d!111105 (=> res!606096 e!500962)))

(assert (=> d!111105 (= res!606096 (bvsge #b00000000000000000000000000000000 (size!25697 (_keys!10099 thiss!1181))))))

(assert (=> d!111105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10099 thiss!1181) (mask!25998 thiss!1181)) e!500962)))

(declare-fun bm!39799 () Bool)

(assert (=> bm!39799 (= call!39802 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10099 thiss!1181) (mask!25998 thiss!1181)))))

(declare-fun b!896436 () Bool)

(assert (=> b!896436 (= e!500961 e!500963)))

(declare-fun lt!404909 () (_ BitVec 64))

(assert (=> b!896436 (= lt!404909 (select (arr!25246 (_keys!10099 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30448 0))(
  ( (Unit!30449) )
))
(declare-fun lt!404908 () Unit!30448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52511 (_ BitVec 64) (_ BitVec 32)) Unit!30448)

(assert (=> b!896436 (= lt!404908 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10099 thiss!1181) lt!404909 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896436 (arrayContainsKey!0 (_keys!10099 thiss!1181) lt!404909 #b00000000000000000000000000000000)))

(declare-fun lt!404907 () Unit!30448)

(assert (=> b!896436 (= lt!404907 lt!404908)))

(declare-fun res!606097 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52511 (_ BitVec 32)) SeekEntryResult!8833)

(assert (=> b!896436 (= res!606097 (= (seekEntryOrOpen!0 (select (arr!25246 (_keys!10099 thiss!1181)) #b00000000000000000000000000000000) (_keys!10099 thiss!1181) (mask!25998 thiss!1181)) (Found!8833 #b00000000000000000000000000000000)))))

(assert (=> b!896436 (=> (not res!606097) (not e!500963))))

(declare-fun b!896437 () Bool)

(assert (=> b!896437 (= e!500962 e!500961)))

(declare-fun c!94859 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896437 (= c!94859 (validKeyInArray!0 (select (arr!25246 (_keys!10099 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111105 (not res!606096)) b!896437))

(assert (= (and b!896437 c!94859) b!896436))

(assert (= (and b!896437 (not c!94859)) b!896434))

(assert (= (and b!896436 res!606097) b!896435))

(assert (= (or b!896435 b!896434) bm!39799))

(declare-fun m!834365 () Bool)

(assert (=> bm!39799 m!834365))

(declare-fun m!834367 () Bool)

(assert (=> b!896436 m!834367))

(declare-fun m!834369 () Bool)

(assert (=> b!896436 m!834369))

(declare-fun m!834371 () Bool)

(assert (=> b!896436 m!834371))

(assert (=> b!896436 m!834367))

(declare-fun m!834373 () Bool)

(assert (=> b!896436 m!834373))

(assert (=> b!896437 m!834367))

(assert (=> b!896437 m!834367))

(declare-fun m!834375 () Bool)

(assert (=> b!896437 m!834375))

(assert (=> b!896374 d!111105))

(declare-fun d!111107 () Bool)

(assert (=> d!111107 (= (array_inv!19870 (_keys!10099 thiss!1181)) (bvsge (size!25697 (_keys!10099 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896375 d!111107))

(declare-fun d!111109 () Bool)

(assert (=> d!111109 (= (array_inv!19871 (_values!5343 thiss!1181)) (bvsge (size!25698 (_values!5343 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896375 d!111109))

(declare-fun d!111111 () Bool)

(declare-fun res!606104 () Bool)

(declare-fun e!500966 () Bool)

(assert (=> d!111111 (=> (not res!606104) (not e!500966))))

(declare-fun simpleValid!306 (LongMapFixedSize!4288) Bool)

(assert (=> d!111111 (= res!606104 (simpleValid!306 thiss!1181))))

(assert (=> d!111111 (= (valid!1667 thiss!1181) e!500966)))

(declare-fun b!896444 () Bool)

(declare-fun res!606105 () Bool)

(assert (=> b!896444 (=> (not res!606105) (not e!500966))))

(declare-fun arrayCountValidKeys!0 (array!52511 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896444 (= res!606105 (= (arrayCountValidKeys!0 (_keys!10099 thiss!1181) #b00000000000000000000000000000000 (size!25697 (_keys!10099 thiss!1181))) (_size!2199 thiss!1181)))))

(declare-fun b!896445 () Bool)

(declare-fun res!606106 () Bool)

(assert (=> b!896445 (=> (not res!606106) (not e!500966))))

(assert (=> b!896445 (= res!606106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10099 thiss!1181) (mask!25998 thiss!1181)))))

(declare-fun b!896446 () Bool)

(declare-datatypes ((List!17765 0))(
  ( (Nil!17762) (Cons!17761 (h!18904 (_ BitVec 64)) (t!25096 List!17765)) )
))
(declare-fun arrayNoDuplicates!0 (array!52511 (_ BitVec 32) List!17765) Bool)

(assert (=> b!896446 (= e!500966 (arrayNoDuplicates!0 (_keys!10099 thiss!1181) #b00000000000000000000000000000000 Nil!17762))))

(assert (= (and d!111111 res!606104) b!896444))

(assert (= (and b!896444 res!606105) b!896445))

(assert (= (and b!896445 res!606106) b!896446))

(declare-fun m!834377 () Bool)

(assert (=> d!111111 m!834377))

(declare-fun m!834379 () Bool)

(assert (=> b!896444 m!834379))

(assert (=> b!896445 m!834325))

(declare-fun m!834381 () Bool)

(assert (=> b!896446 m!834381))

(assert (=> start!76462 d!111111))

(declare-fun d!111113 () Bool)

(assert (=> d!111113 (= (validMask!0 (mask!25998 thiss!1181)) (and (or (= (mask!25998 thiss!1181) #b00000000000000000000000000000111) (= (mask!25998 thiss!1181) #b00000000000000000000000000001111) (= (mask!25998 thiss!1181) #b00000000000000000000000000011111) (= (mask!25998 thiss!1181) #b00000000000000000000000000111111) (= (mask!25998 thiss!1181) #b00000000000000000000000001111111) (= (mask!25998 thiss!1181) #b00000000000000000000000011111111) (= (mask!25998 thiss!1181) #b00000000000000000000000111111111) (= (mask!25998 thiss!1181) #b00000000000000000000001111111111) (= (mask!25998 thiss!1181) #b00000000000000000000011111111111) (= (mask!25998 thiss!1181) #b00000000000000000000111111111111) (= (mask!25998 thiss!1181) #b00000000000000000001111111111111) (= (mask!25998 thiss!1181) #b00000000000000000011111111111111) (= (mask!25998 thiss!1181) #b00000000000000000111111111111111) (= (mask!25998 thiss!1181) #b00000000000000001111111111111111) (= (mask!25998 thiss!1181) #b00000000000000011111111111111111) (= (mask!25998 thiss!1181) #b00000000000000111111111111111111) (= (mask!25998 thiss!1181) #b00000000000001111111111111111111) (= (mask!25998 thiss!1181) #b00000000000011111111111111111111) (= (mask!25998 thiss!1181) #b00000000000111111111111111111111) (= (mask!25998 thiss!1181) #b00000000001111111111111111111111) (= (mask!25998 thiss!1181) #b00000000011111111111111111111111) (= (mask!25998 thiss!1181) #b00000000111111111111111111111111) (= (mask!25998 thiss!1181) #b00000001111111111111111111111111) (= (mask!25998 thiss!1181) #b00000011111111111111111111111111) (= (mask!25998 thiss!1181) #b00000111111111111111111111111111) (= (mask!25998 thiss!1181) #b00001111111111111111111111111111) (= (mask!25998 thiss!1181) #b00011111111111111111111111111111) (= (mask!25998 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25998 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896376 d!111113))

(declare-fun b!896459 () Bool)

(declare-fun e!500975 () SeekEntryResult!8833)

(declare-fun lt!404920 () SeekEntryResult!8833)

(assert (=> b!896459 (= e!500975 (MissingZero!8833 (index!37705 lt!404920)))))

(declare-fun b!896460 () Bool)

(declare-fun e!500973 () SeekEntryResult!8833)

(declare-fun e!500974 () SeekEntryResult!8833)

(assert (=> b!896460 (= e!500973 e!500974)))

(declare-fun lt!404921 () (_ BitVec 64))

(assert (=> b!896460 (= lt!404921 (select (arr!25246 (_keys!10099 thiss!1181)) (index!37705 lt!404920)))))

(declare-fun c!94866 () Bool)

(assert (=> b!896460 (= c!94866 (= lt!404921 key!785))))

(declare-fun d!111115 () Bool)

(declare-fun lt!404919 () SeekEntryResult!8833)

(assert (=> d!111115 (and (or ((_ is MissingVacant!8833) lt!404919) (not ((_ is Found!8833) lt!404919)) (and (bvsge (index!37704 lt!404919) #b00000000000000000000000000000000) (bvslt (index!37704 lt!404919) (size!25697 (_keys!10099 thiss!1181))))) (not ((_ is MissingVacant!8833) lt!404919)) (or (not ((_ is Found!8833) lt!404919)) (= (select (arr!25246 (_keys!10099 thiss!1181)) (index!37704 lt!404919)) key!785)))))

(assert (=> d!111115 (= lt!404919 e!500973)))

(declare-fun c!94868 () Bool)

(assert (=> d!111115 (= c!94868 (and ((_ is Intermediate!8833) lt!404920) (undefined!9645 lt!404920)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52511 (_ BitVec 32)) SeekEntryResult!8833)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111115 (= lt!404920 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25998 thiss!1181)) key!785 (_keys!10099 thiss!1181) (mask!25998 thiss!1181)))))

(assert (=> d!111115 (validMask!0 (mask!25998 thiss!1181))))

(assert (=> d!111115 (= (seekEntry!0 key!785 (_keys!10099 thiss!1181) (mask!25998 thiss!1181)) lt!404919)))

(declare-fun b!896461 () Bool)

(assert (=> b!896461 (= e!500974 (Found!8833 (index!37705 lt!404920)))))

(declare-fun b!896462 () Bool)

(assert (=> b!896462 (= e!500973 Undefined!8833)))

(declare-fun b!896463 () Bool)

(declare-fun lt!404918 () SeekEntryResult!8833)

(assert (=> b!896463 (= e!500975 (ite ((_ is MissingVacant!8833) lt!404918) (MissingZero!8833 (index!37706 lt!404918)) lt!404918))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52511 (_ BitVec 32)) SeekEntryResult!8833)

(assert (=> b!896463 (= lt!404918 (seekKeyOrZeroReturnVacant!0 (x!76159 lt!404920) (index!37705 lt!404920) (index!37705 lt!404920) key!785 (_keys!10099 thiss!1181) (mask!25998 thiss!1181)))))

(declare-fun b!896464 () Bool)

(declare-fun c!94867 () Bool)

(assert (=> b!896464 (= c!94867 (= lt!404921 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896464 (= e!500974 e!500975)))

(assert (= (and d!111115 c!94868) b!896462))

(assert (= (and d!111115 (not c!94868)) b!896460))

(assert (= (and b!896460 c!94866) b!896461))

(assert (= (and b!896460 (not c!94866)) b!896464))

(assert (= (and b!896464 c!94867) b!896459))

(assert (= (and b!896464 (not c!94867)) b!896463))

(declare-fun m!834383 () Bool)

(assert (=> b!896460 m!834383))

(declare-fun m!834385 () Bool)

(assert (=> d!111115 m!834385))

(declare-fun m!834387 () Bool)

(assert (=> d!111115 m!834387))

(assert (=> d!111115 m!834387))

(declare-fun m!834389 () Bool)

(assert (=> d!111115 m!834389))

(assert (=> d!111115 m!834333))

(declare-fun m!834391 () Bool)

(assert (=> b!896463 m!834391))

(assert (=> b!896376 d!111115))

(declare-fun b!896471 () Bool)

(declare-fun e!500981 () Bool)

(assert (=> b!896471 (= e!500981 tp_is_empty!18235)))

(declare-fun b!896472 () Bool)

(declare-fun e!500980 () Bool)

(assert (=> b!896472 (= e!500980 tp_is_empty!18235)))

(declare-fun mapIsEmpty!28957 () Bool)

(declare-fun mapRes!28957 () Bool)

(assert (=> mapIsEmpty!28957 mapRes!28957))

(declare-fun condMapEmpty!28957 () Bool)

(declare-fun mapDefault!28957 () ValueCell!8636)

(assert (=> mapNonEmpty!28948 (= condMapEmpty!28957 (= mapRest!28948 ((as const (Array (_ BitVec 32) ValueCell!8636)) mapDefault!28957)))))

(assert (=> mapNonEmpty!28948 (= tp!55732 (and e!500980 mapRes!28957))))

(declare-fun mapNonEmpty!28957 () Bool)

(declare-fun tp!55747 () Bool)

(assert (=> mapNonEmpty!28957 (= mapRes!28957 (and tp!55747 e!500981))))

(declare-fun mapKey!28957 () (_ BitVec 32))

(declare-fun mapRest!28957 () (Array (_ BitVec 32) ValueCell!8636))

(declare-fun mapValue!28957 () ValueCell!8636)

(assert (=> mapNonEmpty!28957 (= mapRest!28948 (store mapRest!28957 mapKey!28957 mapValue!28957))))

(assert (= (and mapNonEmpty!28948 condMapEmpty!28957) mapIsEmpty!28957))

(assert (= (and mapNonEmpty!28948 (not condMapEmpty!28957)) mapNonEmpty!28957))

(assert (= (and mapNonEmpty!28957 ((_ is ValueCellFull!8636) mapValue!28957)) b!896471))

(assert (= (and mapNonEmpty!28948 ((_ is ValueCellFull!8636) mapDefault!28957)) b!896472))

(declare-fun m!834393 () Bool)

(assert (=> mapNonEmpty!28957 m!834393))

(check-sat (not b!896446) b_and!26209 (not b!896445) (not mapNonEmpty!28957) (not b!896437) (not b_next!15907) tp_is_empty!18235 (not b!896436) (not b!896444) (not bm!39799) (not d!111115) (not b!896463) (not d!111111))
(check-sat b_and!26209 (not b_next!15907))
