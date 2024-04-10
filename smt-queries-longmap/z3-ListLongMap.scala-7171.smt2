; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91616 () Bool)

(assert start!91616)

(declare-fun b!1043119 () Bool)

(declare-fun b_free!21081 () Bool)

(declare-fun b_next!21081 () Bool)

(assert (=> b!1043119 (= b_free!21081 (not b_next!21081))))

(declare-fun tp!74477 () Bool)

(declare-fun b_and!33613 () Bool)

(assert (=> b!1043119 (= tp!74477 b_and!33613)))

(declare-fun b!1043117 () Bool)

(declare-fun res!694987 () Bool)

(declare-fun e!590970 () Bool)

(assert (=> b!1043117 (=> res!694987 e!590970)))

(declare-datatypes ((SeekEntryResult!9824 0))(
  ( (MissingZero!9824 (index!41667 (_ BitVec 32))) (Found!9824 (index!41668 (_ BitVec 32))) (Intermediate!9824 (undefined!10636 Bool) (index!41669 (_ BitVec 32)) (x!93124 (_ BitVec 32))) (Undefined!9824) (MissingVacant!9824 (index!41670 (_ BitVec 32))) )
))
(declare-fun lt!459766 () SeekEntryResult!9824)

(declare-datatypes ((V!37941 0))(
  ( (V!37942 (val!12451 Int)) )
))
(declare-datatypes ((ValueCell!11697 0))(
  ( (ValueCellFull!11697 (v!15042 V!37941)) (EmptyCell!11697) )
))
(declare-datatypes ((array!65762 0))(
  ( (array!65763 (arr!31635 (Array (_ BitVec 32) (_ BitVec 64))) (size!32170 (_ BitVec 32))) )
))
(declare-datatypes ((array!65764 0))(
  ( (array!65765 (arr!31636 (Array (_ BitVec 32) ValueCell!11697)) (size!32171 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5988 0))(
  ( (LongMapFixedSize!5989 (defaultEntry!6376 Int) (mask!30457 (_ BitVec 32)) (extraKeys!6104 (_ BitVec 32)) (zeroValue!6210 V!37941) (minValue!6210 V!37941) (_size!3049 (_ BitVec 32)) (_keys!11632 array!65762) (_values!6399 array!65764) (_vacant!3049 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5988)

(assert (=> b!1043117 (= res!694987 (or (bvslt (index!41668 lt!459766) #b00000000000000000000000000000000) (bvsge (index!41668 lt!459766) (size!32170 (_keys!11632 thiss!1427)))))))

(declare-fun b!1043118 () Bool)

(declare-fun e!590967 () Bool)

(declare-fun e!590963 () Bool)

(assert (=> b!1043118 (= e!590967 e!590963)))

(declare-fun res!694980 () Bool)

(assert (=> b!1043118 (=> (not res!694980) (not e!590963))))

(get-info :version)

(assert (=> b!1043118 (= res!694980 ((_ is Found!9824) lt!459766))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65762 (_ BitVec 32)) SeekEntryResult!9824)

(assert (=> b!1043118 (= lt!459766 (seekEntry!0 key!909 (_keys!11632 thiss!1427) (mask!30457 thiss!1427)))))

(declare-fun e!590968 () Bool)

(declare-fun tp_is_empty!24801 () Bool)

(declare-fun e!590969 () Bool)

(declare-fun array_inv!24441 (array!65762) Bool)

(declare-fun array_inv!24442 (array!65764) Bool)

(assert (=> b!1043119 (= e!590969 (and tp!74477 tp_is_empty!24801 (array_inv!24441 (_keys!11632 thiss!1427)) (array_inv!24442 (_values!6399 thiss!1427)) e!590968))))

(declare-fun b!1043120 () Bool)

(declare-fun e!590966 () Bool)

(declare-fun mapRes!38819 () Bool)

(assert (=> b!1043120 (= e!590968 (and e!590966 mapRes!38819))))

(declare-fun condMapEmpty!38819 () Bool)

(declare-fun mapDefault!38819 () ValueCell!11697)

(assert (=> b!1043120 (= condMapEmpty!38819 (= (arr!31636 (_values!6399 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11697)) mapDefault!38819)))))

(declare-fun b!1043122 () Bool)

(declare-fun res!694984 () Bool)

(assert (=> b!1043122 (=> res!694984 e!590970)))

(declare-datatypes ((List!21982 0))(
  ( (Nil!21979) (Cons!21978 (h!23186 (_ BitVec 64)) (t!31196 List!21982)) )
))
(declare-fun arrayNoDuplicates!0 (array!65762 (_ BitVec 32) List!21982) Bool)

(assert (=> b!1043122 (= res!694984 (not (arrayNoDuplicates!0 (_keys!11632 thiss!1427) #b00000000000000000000000000000000 Nil!21979)))))

(declare-fun b!1043123 () Bool)

(declare-fun res!694985 () Bool)

(assert (=> b!1043123 (=> res!694985 e!590970)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65762 (_ BitVec 32)) Bool)

(assert (=> b!1043123 (= res!694985 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11632 thiss!1427) (mask!30457 thiss!1427))))))

(declare-fun mapIsEmpty!38819 () Bool)

(assert (=> mapIsEmpty!38819 mapRes!38819))

(declare-fun b!1043124 () Bool)

(assert (=> b!1043124 (= e!590963 (not e!590970))))

(declare-fun res!694986 () Bool)

(assert (=> b!1043124 (=> res!694986 e!590970)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043124 (= res!694986 (not (validMask!0 (mask!30457 thiss!1427))))))

(declare-fun lt!459769 () array!65762)

(declare-fun arrayContainsKey!0 (array!65762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043124 (not (arrayContainsKey!0 lt!459769 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34057 0))(
  ( (Unit!34058) )
))
(declare-fun lt!459771 () Unit!34057)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65762 (_ BitVec 32) (_ BitVec 64)) Unit!34057)

(assert (=> b!1043124 (= lt!459771 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11632 thiss!1427) (index!41668 lt!459766) key!909))))

(assert (=> b!1043124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459769 (mask!30457 thiss!1427))))

(declare-fun lt!459768 () Unit!34057)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65762 (_ BitVec 32) (_ BitVec 32)) Unit!34057)

(assert (=> b!1043124 (= lt!459768 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11632 thiss!1427) (index!41668 lt!459766) (mask!30457 thiss!1427)))))

(assert (=> b!1043124 (arrayNoDuplicates!0 lt!459769 #b00000000000000000000000000000000 Nil!21979)))

(declare-fun lt!459770 () Unit!34057)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65762 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21982) Unit!34057)

(assert (=> b!1043124 (= lt!459770 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11632 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41668 lt!459766) #b00000000000000000000000000000000 Nil!21979))))

(declare-fun arrayCountValidKeys!0 (array!65762 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043124 (= (arrayCountValidKeys!0 lt!459769 #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11632 thiss!1427) #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043124 (= lt!459769 (array!65763 (store (arr!31635 (_keys!11632 thiss!1427)) (index!41668 lt!459766) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32170 (_keys!11632 thiss!1427))))))

(declare-fun lt!459767 () Unit!34057)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65762 (_ BitVec 32) (_ BitVec 64)) Unit!34057)

(assert (=> b!1043124 (= lt!459767 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11632 thiss!1427) (index!41668 lt!459766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043125 () Bool)

(declare-fun e!590964 () Bool)

(assert (=> b!1043125 (= e!590964 tp_is_empty!24801)))

(declare-fun mapNonEmpty!38819 () Bool)

(declare-fun tp!74478 () Bool)

(assert (=> mapNonEmpty!38819 (= mapRes!38819 (and tp!74478 e!590964))))

(declare-fun mapRest!38819 () (Array (_ BitVec 32) ValueCell!11697))

(declare-fun mapValue!38819 () ValueCell!11697)

(declare-fun mapKey!38819 () (_ BitVec 32))

(assert (=> mapNonEmpty!38819 (= (arr!31636 (_values!6399 thiss!1427)) (store mapRest!38819 mapKey!38819 mapValue!38819))))

(declare-fun b!1043126 () Bool)

(declare-fun res!694983 () Bool)

(assert (=> b!1043126 (=> (not res!694983) (not e!590967))))

(assert (=> b!1043126 (= res!694983 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043127 () Bool)

(assert (=> b!1043127 (= e!590970 (= (select (arr!31635 (_keys!11632 thiss!1427)) (index!41668 lt!459766)) key!909))))

(declare-fun b!1043128 () Bool)

(assert (=> b!1043128 (= e!590966 tp_is_empty!24801)))

(declare-fun b!1043129 () Bool)

(declare-fun res!694979 () Bool)

(assert (=> b!1043129 (=> res!694979 e!590970)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043129 (= res!694979 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1043121 () Bool)

(declare-fun res!694982 () Bool)

(assert (=> b!1043121 (=> res!694982 e!590970)))

(assert (=> b!1043121 (= res!694982 (or (not (= (size!32171 (_values!6399 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30457 thiss!1427)))) (not (= (size!32170 (_keys!11632 thiss!1427)) (size!32171 (_values!6399 thiss!1427)))) (bvslt (mask!30457 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6104 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6104 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun res!694981 () Bool)

(assert (=> start!91616 (=> (not res!694981) (not e!590967))))

(declare-fun valid!2248 (LongMapFixedSize!5988) Bool)

(assert (=> start!91616 (= res!694981 (valid!2248 thiss!1427))))

(assert (=> start!91616 e!590967))

(assert (=> start!91616 e!590969))

(assert (=> start!91616 true))

(assert (= (and start!91616 res!694981) b!1043126))

(assert (= (and b!1043126 res!694983) b!1043118))

(assert (= (and b!1043118 res!694980) b!1043124))

(assert (= (and b!1043124 (not res!694986)) b!1043121))

(assert (= (and b!1043121 (not res!694982)) b!1043123))

(assert (= (and b!1043123 (not res!694985)) b!1043122))

(assert (= (and b!1043122 (not res!694984)) b!1043117))

(assert (= (and b!1043117 (not res!694987)) b!1043129))

(assert (= (and b!1043129 (not res!694979)) b!1043127))

(assert (= (and b!1043120 condMapEmpty!38819) mapIsEmpty!38819))

(assert (= (and b!1043120 (not condMapEmpty!38819)) mapNonEmpty!38819))

(assert (= (and mapNonEmpty!38819 ((_ is ValueCellFull!11697) mapValue!38819)) b!1043125))

(assert (= (and b!1043120 ((_ is ValueCellFull!11697) mapDefault!38819)) b!1043128))

(assert (= b!1043119 b!1043120))

(assert (= start!91616 b!1043119))

(declare-fun m!962331 () Bool)

(assert (=> b!1043124 m!962331))

(declare-fun m!962333 () Bool)

(assert (=> b!1043124 m!962333))

(declare-fun m!962335 () Bool)

(assert (=> b!1043124 m!962335))

(declare-fun m!962337 () Bool)

(assert (=> b!1043124 m!962337))

(declare-fun m!962339 () Bool)

(assert (=> b!1043124 m!962339))

(declare-fun m!962341 () Bool)

(assert (=> b!1043124 m!962341))

(declare-fun m!962343 () Bool)

(assert (=> b!1043124 m!962343))

(declare-fun m!962345 () Bool)

(assert (=> b!1043124 m!962345))

(declare-fun m!962347 () Bool)

(assert (=> b!1043124 m!962347))

(declare-fun m!962349 () Bool)

(assert (=> b!1043124 m!962349))

(declare-fun m!962351 () Bool)

(assert (=> b!1043124 m!962351))

(declare-fun m!962353 () Bool)

(assert (=> b!1043119 m!962353))

(declare-fun m!962355 () Bool)

(assert (=> b!1043119 m!962355))

(declare-fun m!962357 () Bool)

(assert (=> b!1043122 m!962357))

(declare-fun m!962359 () Bool)

(assert (=> b!1043127 m!962359))

(declare-fun m!962361 () Bool)

(assert (=> b!1043118 m!962361))

(declare-fun m!962363 () Bool)

(assert (=> mapNonEmpty!38819 m!962363))

(declare-fun m!962365 () Bool)

(assert (=> start!91616 m!962365))

(declare-fun m!962367 () Bool)

(assert (=> b!1043129 m!962367))

(declare-fun m!962369 () Bool)

(assert (=> b!1043123 m!962369))

(check-sat (not b!1043124) tp_is_empty!24801 (not b!1043123) (not start!91616) (not b!1043122) b_and!33613 (not b!1043129) (not b!1043118) (not mapNonEmpty!38819) (not b_next!21081) (not b!1043119))
(check-sat b_and!33613 (not b_next!21081))
(get-model)

(declare-fun d!126221 () Bool)

(assert (=> d!126221 (= (array_inv!24441 (_keys!11632 thiss!1427)) (bvsge (size!32170 (_keys!11632 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043119 d!126221))

(declare-fun d!126223 () Bool)

(assert (=> d!126223 (= (array_inv!24442 (_values!6399 thiss!1427)) (bvsge (size!32171 (_values!6399 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043119 d!126223))

(declare-fun d!126225 () Bool)

(declare-fun res!695021 () Bool)

(declare-fun e!590997 () Bool)

(assert (=> d!126225 (=> (not res!695021) (not e!590997))))

(declare-fun simpleValid!445 (LongMapFixedSize!5988) Bool)

(assert (=> d!126225 (= res!695021 (simpleValid!445 thiss!1427))))

(assert (=> d!126225 (= (valid!2248 thiss!1427) e!590997)))

(declare-fun b!1043175 () Bool)

(declare-fun res!695022 () Bool)

(assert (=> b!1043175 (=> (not res!695022) (not e!590997))))

(assert (=> b!1043175 (= res!695022 (= (arrayCountValidKeys!0 (_keys!11632 thiss!1427) #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))) (_size!3049 thiss!1427)))))

(declare-fun b!1043176 () Bool)

(declare-fun res!695023 () Bool)

(assert (=> b!1043176 (=> (not res!695023) (not e!590997))))

(assert (=> b!1043176 (= res!695023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11632 thiss!1427) (mask!30457 thiss!1427)))))

(declare-fun b!1043177 () Bool)

(assert (=> b!1043177 (= e!590997 (arrayNoDuplicates!0 (_keys!11632 thiss!1427) #b00000000000000000000000000000000 Nil!21979))))

(assert (= (and d!126225 res!695021) b!1043175))

(assert (= (and b!1043175 res!695022) b!1043176))

(assert (= (and b!1043176 res!695023) b!1043177))

(declare-fun m!962411 () Bool)

(assert (=> d!126225 m!962411))

(assert (=> b!1043175 m!962347))

(assert (=> b!1043176 m!962369))

(assert (=> b!1043177 m!962357))

(assert (=> start!91616 d!126225))

(declare-fun d!126227 () Bool)

(declare-fun e!591000 () Bool)

(assert (=> d!126227 e!591000))

(declare-fun res!695026 () Bool)

(assert (=> d!126227 (=> (not res!695026) (not e!591000))))

(assert (=> d!126227 (= res!695026 (and (bvsge (index!41668 lt!459766) #b00000000000000000000000000000000) (bvslt (index!41668 lt!459766) (size!32170 (_keys!11632 thiss!1427)))))))

(declare-fun lt!459792 () Unit!34057)

(declare-fun choose!53 (array!65762 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21982) Unit!34057)

(assert (=> d!126227 (= lt!459792 (choose!53 (_keys!11632 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41668 lt!459766) #b00000000000000000000000000000000 Nil!21979))))

(assert (=> d!126227 (bvslt (size!32170 (_keys!11632 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126227 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11632 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41668 lt!459766) #b00000000000000000000000000000000 Nil!21979) lt!459792)))

(declare-fun b!1043180 () Bool)

(assert (=> b!1043180 (= e!591000 (arrayNoDuplicates!0 (array!65763 (store (arr!31635 (_keys!11632 thiss!1427)) (index!41668 lt!459766) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32170 (_keys!11632 thiss!1427))) #b00000000000000000000000000000000 Nil!21979))))

(assert (= (and d!126227 res!695026) b!1043180))

(declare-fun m!962413 () Bool)

(assert (=> d!126227 m!962413))

(assert (=> b!1043180 m!962339))

(declare-fun m!962415 () Bool)

(assert (=> b!1043180 m!962415))

(assert (=> b!1043124 d!126227))

(declare-fun d!126229 () Bool)

(declare-fun res!695031 () Bool)

(declare-fun e!591005 () Bool)

(assert (=> d!126229 (=> res!695031 e!591005)))

(assert (=> d!126229 (= res!695031 (= (select (arr!31635 lt!459769) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126229 (= (arrayContainsKey!0 lt!459769 key!909 #b00000000000000000000000000000000) e!591005)))

(declare-fun b!1043185 () Bool)

(declare-fun e!591006 () Bool)

(assert (=> b!1043185 (= e!591005 e!591006)))

(declare-fun res!695032 () Bool)

(assert (=> b!1043185 (=> (not res!695032) (not e!591006))))

(assert (=> b!1043185 (= res!695032 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32170 lt!459769)))))

(declare-fun b!1043186 () Bool)

(assert (=> b!1043186 (= e!591006 (arrayContainsKey!0 lt!459769 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126229 (not res!695031)) b!1043185))

(assert (= (and b!1043185 res!695032) b!1043186))

(declare-fun m!962417 () Bool)

(assert (=> d!126229 m!962417))

(declare-fun m!962419 () Bool)

(assert (=> b!1043186 m!962419))

(assert (=> b!1043124 d!126229))

(declare-fun b!1043195 () Bool)

(declare-fun e!591011 () (_ BitVec 32))

(declare-fun call!44213 () (_ BitVec 32))

(assert (=> b!1043195 (= e!591011 (bvadd #b00000000000000000000000000000001 call!44213))))

(declare-fun b!1043196 () Bool)

(declare-fun e!591012 () (_ BitVec 32))

(assert (=> b!1043196 (= e!591012 e!591011)))

(declare-fun c!105912 () Bool)

(assert (=> b!1043196 (= c!105912 (validKeyInArray!0 (select (arr!31635 lt!459769) #b00000000000000000000000000000000)))))

(declare-fun bm!44210 () Bool)

(assert (=> bm!44210 (= call!44213 (arrayCountValidKeys!0 lt!459769 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32170 (_keys!11632 thiss!1427))))))

(declare-fun b!1043197 () Bool)

(assert (=> b!1043197 (= e!591012 #b00000000000000000000000000000000)))

(declare-fun b!1043198 () Bool)

(assert (=> b!1043198 (= e!591011 call!44213)))

(declare-fun d!126231 () Bool)

(declare-fun lt!459795 () (_ BitVec 32))

(assert (=> d!126231 (and (bvsge lt!459795 #b00000000000000000000000000000000) (bvsle lt!459795 (bvsub (size!32170 lt!459769) #b00000000000000000000000000000000)))))

(assert (=> d!126231 (= lt!459795 e!591012)))

(declare-fun c!105913 () Bool)

(assert (=> d!126231 (= c!105913 (bvsge #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))))))

(assert (=> d!126231 (and (bvsle #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32170 (_keys!11632 thiss!1427)) (size!32170 lt!459769)))))

(assert (=> d!126231 (= (arrayCountValidKeys!0 lt!459769 #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))) lt!459795)))

(assert (= (and d!126231 c!105913) b!1043197))

(assert (= (and d!126231 (not c!105913)) b!1043196))

(assert (= (and b!1043196 c!105912) b!1043195))

(assert (= (and b!1043196 (not c!105912)) b!1043198))

(assert (= (or b!1043195 b!1043198) bm!44210))

(assert (=> b!1043196 m!962417))

(assert (=> b!1043196 m!962417))

(declare-fun m!962421 () Bool)

(assert (=> b!1043196 m!962421))

(declare-fun m!962423 () Bool)

(assert (=> bm!44210 m!962423))

(assert (=> b!1043124 d!126231))

(declare-fun b!1043199 () Bool)

(declare-fun e!591013 () (_ BitVec 32))

(declare-fun call!44214 () (_ BitVec 32))

(assert (=> b!1043199 (= e!591013 (bvadd #b00000000000000000000000000000001 call!44214))))

(declare-fun b!1043200 () Bool)

(declare-fun e!591014 () (_ BitVec 32))

(assert (=> b!1043200 (= e!591014 e!591013)))

(declare-fun c!105914 () Bool)

(assert (=> b!1043200 (= c!105914 (validKeyInArray!0 (select (arr!31635 (_keys!11632 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44211 () Bool)

(assert (=> bm!44211 (= call!44214 (arrayCountValidKeys!0 (_keys!11632 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32170 (_keys!11632 thiss!1427))))))

(declare-fun b!1043201 () Bool)

(assert (=> b!1043201 (= e!591014 #b00000000000000000000000000000000)))

(declare-fun b!1043202 () Bool)

(assert (=> b!1043202 (= e!591013 call!44214)))

(declare-fun d!126233 () Bool)

(declare-fun lt!459796 () (_ BitVec 32))

(assert (=> d!126233 (and (bvsge lt!459796 #b00000000000000000000000000000000) (bvsle lt!459796 (bvsub (size!32170 (_keys!11632 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126233 (= lt!459796 e!591014)))

(declare-fun c!105915 () Bool)

(assert (=> d!126233 (= c!105915 (bvsge #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))))))

(assert (=> d!126233 (and (bvsle #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32170 (_keys!11632 thiss!1427)) (size!32170 (_keys!11632 thiss!1427))))))

(assert (=> d!126233 (= (arrayCountValidKeys!0 (_keys!11632 thiss!1427) #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))) lt!459796)))

(assert (= (and d!126233 c!105915) b!1043201))

(assert (= (and d!126233 (not c!105915)) b!1043200))

(assert (= (and b!1043200 c!105914) b!1043199))

(assert (= (and b!1043200 (not c!105914)) b!1043202))

(assert (= (or b!1043199 b!1043202) bm!44211))

(declare-fun m!962425 () Bool)

(assert (=> b!1043200 m!962425))

(assert (=> b!1043200 m!962425))

(declare-fun m!962427 () Bool)

(assert (=> b!1043200 m!962427))

(declare-fun m!962429 () Bool)

(assert (=> bm!44211 m!962429))

(assert (=> b!1043124 d!126233))

(declare-fun b!1043213 () Bool)

(declare-fun e!591024 () Bool)

(declare-fun call!44217 () Bool)

(assert (=> b!1043213 (= e!591024 call!44217)))

(declare-fun b!1043214 () Bool)

(declare-fun e!591026 () Bool)

(declare-fun e!591025 () Bool)

(assert (=> b!1043214 (= e!591026 e!591025)))

(declare-fun res!695039 () Bool)

(assert (=> b!1043214 (=> (not res!695039) (not e!591025))))

(declare-fun e!591023 () Bool)

(assert (=> b!1043214 (= res!695039 (not e!591023))))

(declare-fun res!695041 () Bool)

(assert (=> b!1043214 (=> (not res!695041) (not e!591023))))

(assert (=> b!1043214 (= res!695041 (validKeyInArray!0 (select (arr!31635 lt!459769) #b00000000000000000000000000000000)))))

(declare-fun bm!44214 () Bool)

(declare-fun c!105918 () Bool)

(assert (=> bm!44214 (= call!44217 (arrayNoDuplicates!0 lt!459769 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105918 (Cons!21978 (select (arr!31635 lt!459769) #b00000000000000000000000000000000) Nil!21979) Nil!21979)))))

(declare-fun b!1043215 () Bool)

(assert (=> b!1043215 (= e!591024 call!44217)))

(declare-fun d!126235 () Bool)

(declare-fun res!695040 () Bool)

(assert (=> d!126235 (=> res!695040 e!591026)))

(assert (=> d!126235 (= res!695040 (bvsge #b00000000000000000000000000000000 (size!32170 lt!459769)))))

(assert (=> d!126235 (= (arrayNoDuplicates!0 lt!459769 #b00000000000000000000000000000000 Nil!21979) e!591026)))

(declare-fun b!1043216 () Bool)

(assert (=> b!1043216 (= e!591025 e!591024)))

(assert (=> b!1043216 (= c!105918 (validKeyInArray!0 (select (arr!31635 lt!459769) #b00000000000000000000000000000000)))))

(declare-fun b!1043217 () Bool)

(declare-fun contains!6061 (List!21982 (_ BitVec 64)) Bool)

(assert (=> b!1043217 (= e!591023 (contains!6061 Nil!21979 (select (arr!31635 lt!459769) #b00000000000000000000000000000000)))))

(assert (= (and d!126235 (not res!695040)) b!1043214))

(assert (= (and b!1043214 res!695041) b!1043217))

(assert (= (and b!1043214 res!695039) b!1043216))

(assert (= (and b!1043216 c!105918) b!1043213))

(assert (= (and b!1043216 (not c!105918)) b!1043215))

(assert (= (or b!1043213 b!1043215) bm!44214))

(assert (=> b!1043214 m!962417))

(assert (=> b!1043214 m!962417))

(assert (=> b!1043214 m!962421))

(assert (=> bm!44214 m!962417))

(declare-fun m!962431 () Bool)

(assert (=> bm!44214 m!962431))

(assert (=> b!1043216 m!962417))

(assert (=> b!1043216 m!962417))

(assert (=> b!1043216 m!962421))

(assert (=> b!1043217 m!962417))

(assert (=> b!1043217 m!962417))

(declare-fun m!962433 () Bool)

(assert (=> b!1043217 m!962433))

(assert (=> b!1043124 d!126235))

(declare-fun d!126237 () Bool)

(assert (=> d!126237 (= (validMask!0 (mask!30457 thiss!1427)) (and (or (= (mask!30457 thiss!1427) #b00000000000000000000000000000111) (= (mask!30457 thiss!1427) #b00000000000000000000000000001111) (= (mask!30457 thiss!1427) #b00000000000000000000000000011111) (= (mask!30457 thiss!1427) #b00000000000000000000000000111111) (= (mask!30457 thiss!1427) #b00000000000000000000000001111111) (= (mask!30457 thiss!1427) #b00000000000000000000000011111111) (= (mask!30457 thiss!1427) #b00000000000000000000000111111111) (= (mask!30457 thiss!1427) #b00000000000000000000001111111111) (= (mask!30457 thiss!1427) #b00000000000000000000011111111111) (= (mask!30457 thiss!1427) #b00000000000000000000111111111111) (= (mask!30457 thiss!1427) #b00000000000000000001111111111111) (= (mask!30457 thiss!1427) #b00000000000000000011111111111111) (= (mask!30457 thiss!1427) #b00000000000000000111111111111111) (= (mask!30457 thiss!1427) #b00000000000000001111111111111111) (= (mask!30457 thiss!1427) #b00000000000000011111111111111111) (= (mask!30457 thiss!1427) #b00000000000000111111111111111111) (= (mask!30457 thiss!1427) #b00000000000001111111111111111111) (= (mask!30457 thiss!1427) #b00000000000011111111111111111111) (= (mask!30457 thiss!1427) #b00000000000111111111111111111111) (= (mask!30457 thiss!1427) #b00000000001111111111111111111111) (= (mask!30457 thiss!1427) #b00000000011111111111111111111111) (= (mask!30457 thiss!1427) #b00000000111111111111111111111111) (= (mask!30457 thiss!1427) #b00000001111111111111111111111111) (= (mask!30457 thiss!1427) #b00000011111111111111111111111111) (= (mask!30457 thiss!1427) #b00000111111111111111111111111111) (= (mask!30457 thiss!1427) #b00001111111111111111111111111111) (= (mask!30457 thiss!1427) #b00011111111111111111111111111111) (= (mask!30457 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30457 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1043124 d!126237))

(declare-fun d!126239 () Bool)

(declare-fun e!591029 () Bool)

(assert (=> d!126239 e!591029))

(declare-fun res!695044 () Bool)

(assert (=> d!126239 (=> (not res!695044) (not e!591029))))

(assert (=> d!126239 (= res!695044 (bvslt (index!41668 lt!459766) (size!32170 (_keys!11632 thiss!1427))))))

(declare-fun lt!459799 () Unit!34057)

(declare-fun choose!121 (array!65762 (_ BitVec 32) (_ BitVec 64)) Unit!34057)

(assert (=> d!126239 (= lt!459799 (choose!121 (_keys!11632 thiss!1427) (index!41668 lt!459766) key!909))))

(assert (=> d!126239 (bvsge (index!41668 lt!459766) #b00000000000000000000000000000000)))

(assert (=> d!126239 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11632 thiss!1427) (index!41668 lt!459766) key!909) lt!459799)))

(declare-fun b!1043220 () Bool)

(assert (=> b!1043220 (= e!591029 (not (arrayContainsKey!0 (array!65763 (store (arr!31635 (_keys!11632 thiss!1427)) (index!41668 lt!459766) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32170 (_keys!11632 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126239 res!695044) b!1043220))

(declare-fun m!962435 () Bool)

(assert (=> d!126239 m!962435))

(assert (=> b!1043220 m!962339))

(declare-fun m!962437 () Bool)

(assert (=> b!1043220 m!962437))

(assert (=> b!1043124 d!126239))

(declare-fun d!126241 () Bool)

(declare-fun e!591032 () Bool)

(assert (=> d!126241 e!591032))

(declare-fun res!695047 () Bool)

(assert (=> d!126241 (=> (not res!695047) (not e!591032))))

(assert (=> d!126241 (= res!695047 (and (bvsge (index!41668 lt!459766) #b00000000000000000000000000000000) (bvslt (index!41668 lt!459766) (size!32170 (_keys!11632 thiss!1427)))))))

(declare-fun lt!459802 () Unit!34057)

(declare-fun choose!25 (array!65762 (_ BitVec 32) (_ BitVec 32)) Unit!34057)

(assert (=> d!126241 (= lt!459802 (choose!25 (_keys!11632 thiss!1427) (index!41668 lt!459766) (mask!30457 thiss!1427)))))

(assert (=> d!126241 (validMask!0 (mask!30457 thiss!1427))))

(assert (=> d!126241 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11632 thiss!1427) (index!41668 lt!459766) (mask!30457 thiss!1427)) lt!459802)))

(declare-fun b!1043223 () Bool)

(assert (=> b!1043223 (= e!591032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65763 (store (arr!31635 (_keys!11632 thiss!1427)) (index!41668 lt!459766) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32170 (_keys!11632 thiss!1427))) (mask!30457 thiss!1427)))))

(assert (= (and d!126241 res!695047) b!1043223))

(declare-fun m!962439 () Bool)

(assert (=> d!126241 m!962439))

(assert (=> d!126241 m!962333))

(assert (=> b!1043223 m!962339))

(declare-fun m!962441 () Bool)

(assert (=> b!1043223 m!962441))

(assert (=> b!1043124 d!126241))

(declare-fun b!1043232 () Bool)

(declare-fun e!591039 () Bool)

(declare-fun call!44220 () Bool)

(assert (=> b!1043232 (= e!591039 call!44220)))

(declare-fun bm!44217 () Bool)

(assert (=> bm!44217 (= call!44220 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459769 (mask!30457 thiss!1427)))))

(declare-fun b!1043233 () Bool)

(declare-fun e!591040 () Bool)

(assert (=> b!1043233 (= e!591040 e!591039)))

(declare-fun lt!459809 () (_ BitVec 64))

(assert (=> b!1043233 (= lt!459809 (select (arr!31635 lt!459769) #b00000000000000000000000000000000))))

(declare-fun lt!459810 () Unit!34057)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65762 (_ BitVec 64) (_ BitVec 32)) Unit!34057)

(assert (=> b!1043233 (= lt!459810 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459769 lt!459809 #b00000000000000000000000000000000))))

(assert (=> b!1043233 (arrayContainsKey!0 lt!459769 lt!459809 #b00000000000000000000000000000000)))

(declare-fun lt!459811 () Unit!34057)

(assert (=> b!1043233 (= lt!459811 lt!459810)))

(declare-fun res!695053 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65762 (_ BitVec 32)) SeekEntryResult!9824)

(assert (=> b!1043233 (= res!695053 (= (seekEntryOrOpen!0 (select (arr!31635 lt!459769) #b00000000000000000000000000000000) lt!459769 (mask!30457 thiss!1427)) (Found!9824 #b00000000000000000000000000000000)))))

(assert (=> b!1043233 (=> (not res!695053) (not e!591039))))

(declare-fun b!1043234 () Bool)

(declare-fun e!591041 () Bool)

(assert (=> b!1043234 (= e!591041 e!591040)))

(declare-fun c!105921 () Bool)

(assert (=> b!1043234 (= c!105921 (validKeyInArray!0 (select (arr!31635 lt!459769) #b00000000000000000000000000000000)))))

(declare-fun b!1043235 () Bool)

(assert (=> b!1043235 (= e!591040 call!44220)))

(declare-fun d!126243 () Bool)

(declare-fun res!695052 () Bool)

(assert (=> d!126243 (=> res!695052 e!591041)))

(assert (=> d!126243 (= res!695052 (bvsge #b00000000000000000000000000000000 (size!32170 lt!459769)))))

(assert (=> d!126243 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459769 (mask!30457 thiss!1427)) e!591041)))

(assert (= (and d!126243 (not res!695052)) b!1043234))

(assert (= (and b!1043234 c!105921) b!1043233))

(assert (= (and b!1043234 (not c!105921)) b!1043235))

(assert (= (and b!1043233 res!695053) b!1043232))

(assert (= (or b!1043232 b!1043235) bm!44217))

(declare-fun m!962443 () Bool)

(assert (=> bm!44217 m!962443))

(assert (=> b!1043233 m!962417))

(declare-fun m!962445 () Bool)

(assert (=> b!1043233 m!962445))

(declare-fun m!962447 () Bool)

(assert (=> b!1043233 m!962447))

(assert (=> b!1043233 m!962417))

(declare-fun m!962449 () Bool)

(assert (=> b!1043233 m!962449))

(assert (=> b!1043234 m!962417))

(assert (=> b!1043234 m!962417))

(assert (=> b!1043234 m!962421))

(assert (=> b!1043124 d!126243))

(declare-fun b!1043246 () Bool)

(declare-fun e!591046 () Bool)

(assert (=> b!1043246 (= e!591046 (bvslt (size!32170 (_keys!11632 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1043247 () Bool)

(declare-fun e!591047 () Bool)

(assert (=> b!1043247 (= e!591047 (= (arrayCountValidKeys!0 (array!65763 (store (arr!31635 (_keys!11632 thiss!1427)) (index!41668 lt!459766) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32170 (_keys!11632 thiss!1427))) #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11632 thiss!1427) #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1043245 () Bool)

(declare-fun res!695063 () Bool)

(assert (=> b!1043245 (=> (not res!695063) (not e!591046))))

(assert (=> b!1043245 (= res!695063 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1043244 () Bool)

(declare-fun res!695064 () Bool)

(assert (=> b!1043244 (=> (not res!695064) (not e!591046))))

(assert (=> b!1043244 (= res!695064 (validKeyInArray!0 (select (arr!31635 (_keys!11632 thiss!1427)) (index!41668 lt!459766))))))

(declare-fun d!126245 () Bool)

(assert (=> d!126245 e!591047))

(declare-fun res!695065 () Bool)

(assert (=> d!126245 (=> (not res!695065) (not e!591047))))

(assert (=> d!126245 (= res!695065 (and (bvsge (index!41668 lt!459766) #b00000000000000000000000000000000) (bvslt (index!41668 lt!459766) (size!32170 (_keys!11632 thiss!1427)))))))

(declare-fun lt!459814 () Unit!34057)

(declare-fun choose!82 (array!65762 (_ BitVec 32) (_ BitVec 64)) Unit!34057)

(assert (=> d!126245 (= lt!459814 (choose!82 (_keys!11632 thiss!1427) (index!41668 lt!459766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126245 e!591046))

(declare-fun res!695062 () Bool)

(assert (=> d!126245 (=> (not res!695062) (not e!591046))))

(assert (=> d!126245 (= res!695062 (and (bvsge (index!41668 lt!459766) #b00000000000000000000000000000000) (bvslt (index!41668 lt!459766) (size!32170 (_keys!11632 thiss!1427)))))))

(assert (=> d!126245 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11632 thiss!1427) (index!41668 lt!459766) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459814)))

(assert (= (and d!126245 res!695062) b!1043244))

(assert (= (and b!1043244 res!695064) b!1043245))

(assert (= (and b!1043245 res!695063) b!1043246))

(assert (= (and d!126245 res!695065) b!1043247))

(assert (=> b!1043247 m!962339))

(declare-fun m!962451 () Bool)

(assert (=> b!1043247 m!962451))

(assert (=> b!1043247 m!962347))

(declare-fun m!962453 () Bool)

(assert (=> b!1043245 m!962453))

(assert (=> b!1043244 m!962359))

(assert (=> b!1043244 m!962359))

(declare-fun m!962455 () Bool)

(assert (=> b!1043244 m!962455))

(declare-fun m!962457 () Bool)

(assert (=> d!126245 m!962457))

(assert (=> b!1043124 d!126245))

(declare-fun b!1043248 () Bool)

(declare-fun e!591048 () Bool)

(declare-fun call!44221 () Bool)

(assert (=> b!1043248 (= e!591048 call!44221)))

(declare-fun bm!44218 () Bool)

(assert (=> bm!44218 (= call!44221 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11632 thiss!1427) (mask!30457 thiss!1427)))))

(declare-fun b!1043249 () Bool)

(declare-fun e!591049 () Bool)

(assert (=> b!1043249 (= e!591049 e!591048)))

(declare-fun lt!459815 () (_ BitVec 64))

(assert (=> b!1043249 (= lt!459815 (select (arr!31635 (_keys!11632 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459816 () Unit!34057)

(assert (=> b!1043249 (= lt!459816 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11632 thiss!1427) lt!459815 #b00000000000000000000000000000000))))

(assert (=> b!1043249 (arrayContainsKey!0 (_keys!11632 thiss!1427) lt!459815 #b00000000000000000000000000000000)))

(declare-fun lt!459817 () Unit!34057)

(assert (=> b!1043249 (= lt!459817 lt!459816)))

(declare-fun res!695067 () Bool)

(assert (=> b!1043249 (= res!695067 (= (seekEntryOrOpen!0 (select (arr!31635 (_keys!11632 thiss!1427)) #b00000000000000000000000000000000) (_keys!11632 thiss!1427) (mask!30457 thiss!1427)) (Found!9824 #b00000000000000000000000000000000)))))

(assert (=> b!1043249 (=> (not res!695067) (not e!591048))))

(declare-fun b!1043250 () Bool)

(declare-fun e!591050 () Bool)

(assert (=> b!1043250 (= e!591050 e!591049)))

(declare-fun c!105922 () Bool)

(assert (=> b!1043250 (= c!105922 (validKeyInArray!0 (select (arr!31635 (_keys!11632 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043251 () Bool)

(assert (=> b!1043251 (= e!591049 call!44221)))

(declare-fun d!126247 () Bool)

(declare-fun res!695066 () Bool)

(assert (=> d!126247 (=> res!695066 e!591050)))

(assert (=> d!126247 (= res!695066 (bvsge #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))))))

(assert (=> d!126247 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11632 thiss!1427) (mask!30457 thiss!1427)) e!591050)))

(assert (= (and d!126247 (not res!695066)) b!1043250))

(assert (= (and b!1043250 c!105922) b!1043249))

(assert (= (and b!1043250 (not c!105922)) b!1043251))

(assert (= (and b!1043249 res!695067) b!1043248))

(assert (= (or b!1043248 b!1043251) bm!44218))

(declare-fun m!962459 () Bool)

(assert (=> bm!44218 m!962459))

(assert (=> b!1043249 m!962425))

(declare-fun m!962461 () Bool)

(assert (=> b!1043249 m!962461))

(declare-fun m!962463 () Bool)

(assert (=> b!1043249 m!962463))

(assert (=> b!1043249 m!962425))

(declare-fun m!962465 () Bool)

(assert (=> b!1043249 m!962465))

(assert (=> b!1043250 m!962425))

(assert (=> b!1043250 m!962425))

(assert (=> b!1043250 m!962427))

(assert (=> b!1043123 d!126247))

(declare-fun d!126249 () Bool)

(declare-fun lt!459827 () SeekEntryResult!9824)

(assert (=> d!126249 (and (or ((_ is MissingVacant!9824) lt!459827) (not ((_ is Found!9824) lt!459827)) (and (bvsge (index!41668 lt!459827) #b00000000000000000000000000000000) (bvslt (index!41668 lt!459827) (size!32170 (_keys!11632 thiss!1427))))) (not ((_ is MissingVacant!9824) lt!459827)) (or (not ((_ is Found!9824) lt!459827)) (= (select (arr!31635 (_keys!11632 thiss!1427)) (index!41668 lt!459827)) key!909)))))

(declare-fun e!591058 () SeekEntryResult!9824)

(assert (=> d!126249 (= lt!459827 e!591058)))

(declare-fun c!105929 () Bool)

(declare-fun lt!459828 () SeekEntryResult!9824)

(assert (=> d!126249 (= c!105929 (and ((_ is Intermediate!9824) lt!459828) (undefined!10636 lt!459828)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65762 (_ BitVec 32)) SeekEntryResult!9824)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126249 (= lt!459828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30457 thiss!1427)) key!909 (_keys!11632 thiss!1427) (mask!30457 thiss!1427)))))

(assert (=> d!126249 (validMask!0 (mask!30457 thiss!1427))))

(assert (=> d!126249 (= (seekEntry!0 key!909 (_keys!11632 thiss!1427) (mask!30457 thiss!1427)) lt!459827)))

(declare-fun b!1043264 () Bool)

(declare-fun e!591057 () SeekEntryResult!9824)

(assert (=> b!1043264 (= e!591057 (Found!9824 (index!41669 lt!459828)))))

(declare-fun b!1043265 () Bool)

(declare-fun e!591059 () SeekEntryResult!9824)

(assert (=> b!1043265 (= e!591059 (MissingZero!9824 (index!41669 lt!459828)))))

(declare-fun b!1043266 () Bool)

(assert (=> b!1043266 (= e!591058 Undefined!9824)))

(declare-fun b!1043267 () Bool)

(declare-fun c!105930 () Bool)

(declare-fun lt!459826 () (_ BitVec 64))

(assert (=> b!1043267 (= c!105930 (= lt!459826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043267 (= e!591057 e!591059)))

(declare-fun b!1043268 () Bool)

(assert (=> b!1043268 (= e!591058 e!591057)))

(assert (=> b!1043268 (= lt!459826 (select (arr!31635 (_keys!11632 thiss!1427)) (index!41669 lt!459828)))))

(declare-fun c!105931 () Bool)

(assert (=> b!1043268 (= c!105931 (= lt!459826 key!909))))

(declare-fun b!1043269 () Bool)

(declare-fun lt!459829 () SeekEntryResult!9824)

(assert (=> b!1043269 (= e!591059 (ite ((_ is MissingVacant!9824) lt!459829) (MissingZero!9824 (index!41670 lt!459829)) lt!459829))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65762 (_ BitVec 32)) SeekEntryResult!9824)

(assert (=> b!1043269 (= lt!459829 (seekKeyOrZeroReturnVacant!0 (x!93124 lt!459828) (index!41669 lt!459828) (index!41669 lt!459828) key!909 (_keys!11632 thiss!1427) (mask!30457 thiss!1427)))))

(assert (= (and d!126249 c!105929) b!1043266))

(assert (= (and d!126249 (not c!105929)) b!1043268))

(assert (= (and b!1043268 c!105931) b!1043264))

(assert (= (and b!1043268 (not c!105931)) b!1043267))

(assert (= (and b!1043267 c!105930) b!1043265))

(assert (= (and b!1043267 (not c!105930)) b!1043269))

(declare-fun m!962467 () Bool)

(assert (=> d!126249 m!962467))

(declare-fun m!962469 () Bool)

(assert (=> d!126249 m!962469))

(assert (=> d!126249 m!962469))

(declare-fun m!962471 () Bool)

(assert (=> d!126249 m!962471))

(assert (=> d!126249 m!962333))

(declare-fun m!962473 () Bool)

(assert (=> b!1043268 m!962473))

(declare-fun m!962475 () Bool)

(assert (=> b!1043269 m!962475))

(assert (=> b!1043118 d!126249))

(declare-fun b!1043270 () Bool)

(declare-fun e!591061 () Bool)

(declare-fun call!44222 () Bool)

(assert (=> b!1043270 (= e!591061 call!44222)))

(declare-fun b!1043271 () Bool)

(declare-fun e!591063 () Bool)

(declare-fun e!591062 () Bool)

(assert (=> b!1043271 (= e!591063 e!591062)))

(declare-fun res!695068 () Bool)

(assert (=> b!1043271 (=> (not res!695068) (not e!591062))))

(declare-fun e!591060 () Bool)

(assert (=> b!1043271 (= res!695068 (not e!591060))))

(declare-fun res!695070 () Bool)

(assert (=> b!1043271 (=> (not res!695070) (not e!591060))))

(assert (=> b!1043271 (= res!695070 (validKeyInArray!0 (select (arr!31635 (_keys!11632 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44219 () Bool)

(declare-fun c!105932 () Bool)

(assert (=> bm!44219 (= call!44222 (arrayNoDuplicates!0 (_keys!11632 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105932 (Cons!21978 (select (arr!31635 (_keys!11632 thiss!1427)) #b00000000000000000000000000000000) Nil!21979) Nil!21979)))))

(declare-fun b!1043272 () Bool)

(assert (=> b!1043272 (= e!591061 call!44222)))

(declare-fun d!126251 () Bool)

(declare-fun res!695069 () Bool)

(assert (=> d!126251 (=> res!695069 e!591063)))

(assert (=> d!126251 (= res!695069 (bvsge #b00000000000000000000000000000000 (size!32170 (_keys!11632 thiss!1427))))))

(assert (=> d!126251 (= (arrayNoDuplicates!0 (_keys!11632 thiss!1427) #b00000000000000000000000000000000 Nil!21979) e!591063)))

(declare-fun b!1043273 () Bool)

(assert (=> b!1043273 (= e!591062 e!591061)))

(assert (=> b!1043273 (= c!105932 (validKeyInArray!0 (select (arr!31635 (_keys!11632 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043274 () Bool)

(assert (=> b!1043274 (= e!591060 (contains!6061 Nil!21979 (select (arr!31635 (_keys!11632 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126251 (not res!695069)) b!1043271))

(assert (= (and b!1043271 res!695070) b!1043274))

(assert (= (and b!1043271 res!695068) b!1043273))

(assert (= (and b!1043273 c!105932) b!1043270))

(assert (= (and b!1043273 (not c!105932)) b!1043272))

(assert (= (or b!1043270 b!1043272) bm!44219))

(assert (=> b!1043271 m!962425))

(assert (=> b!1043271 m!962425))

(assert (=> b!1043271 m!962427))

(assert (=> bm!44219 m!962425))

(declare-fun m!962477 () Bool)

(assert (=> bm!44219 m!962477))

(assert (=> b!1043273 m!962425))

(assert (=> b!1043273 m!962425))

(assert (=> b!1043273 m!962427))

(assert (=> b!1043274 m!962425))

(assert (=> b!1043274 m!962425))

(declare-fun m!962479 () Bool)

(assert (=> b!1043274 m!962479))

(assert (=> b!1043122 d!126251))

(declare-fun d!126253 () Bool)

(assert (=> d!126253 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043129 d!126253))

(declare-fun mapNonEmpty!38825 () Bool)

(declare-fun mapRes!38825 () Bool)

(declare-fun tp!74487 () Bool)

(declare-fun e!591068 () Bool)

(assert (=> mapNonEmpty!38825 (= mapRes!38825 (and tp!74487 e!591068))))

(declare-fun mapValue!38825 () ValueCell!11697)

(declare-fun mapRest!38825 () (Array (_ BitVec 32) ValueCell!11697))

(declare-fun mapKey!38825 () (_ BitVec 32))

(assert (=> mapNonEmpty!38825 (= mapRest!38819 (store mapRest!38825 mapKey!38825 mapValue!38825))))

(declare-fun b!1043281 () Bool)

(assert (=> b!1043281 (= e!591068 tp_is_empty!24801)))

(declare-fun b!1043282 () Bool)

(declare-fun e!591069 () Bool)

(assert (=> b!1043282 (= e!591069 tp_is_empty!24801)))

(declare-fun mapIsEmpty!38825 () Bool)

(assert (=> mapIsEmpty!38825 mapRes!38825))

(declare-fun condMapEmpty!38825 () Bool)

(declare-fun mapDefault!38825 () ValueCell!11697)

(assert (=> mapNonEmpty!38819 (= condMapEmpty!38825 (= mapRest!38819 ((as const (Array (_ BitVec 32) ValueCell!11697)) mapDefault!38825)))))

(assert (=> mapNonEmpty!38819 (= tp!74478 (and e!591069 mapRes!38825))))

(assert (= (and mapNonEmpty!38819 condMapEmpty!38825) mapIsEmpty!38825))

(assert (= (and mapNonEmpty!38819 (not condMapEmpty!38825)) mapNonEmpty!38825))

(assert (= (and mapNonEmpty!38825 ((_ is ValueCellFull!11697) mapValue!38825)) b!1043281))

(assert (= (and mapNonEmpty!38819 ((_ is ValueCellFull!11697) mapDefault!38825)) b!1043282))

(declare-fun m!962481 () Bool)

(assert (=> mapNonEmpty!38825 m!962481))

(check-sat (not d!126249) tp_is_empty!24801 (not b!1043249) (not bm!44219) (not b!1043217) b_and!33613 (not bm!44218) (not b!1043223) (not b!1043175) (not d!126227) (not b!1043200) (not b!1043274) (not b!1043250) (not d!126241) (not b!1043234) (not bm!44217) (not b!1043180) (not mapNonEmpty!38825) (not b!1043216) (not b!1043269) (not b!1043233) (not b!1043177) (not b!1043176) (not d!126225) (not b!1043271) (not b!1043196) (not bm!44214) (not d!126239) (not bm!44211) (not b!1043220) (not b!1043247) (not b!1043186) (not b!1043273) (not bm!44210) (not d!126245) (not b!1043214) (not b_next!21081) (not b!1043245) (not b!1043244))
(check-sat b_and!33613 (not b_next!21081))
