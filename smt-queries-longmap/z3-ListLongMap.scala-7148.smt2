; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90840 () Bool)

(assert start!90840)

(declare-fun b!1038262 () Bool)

(declare-fun b_free!20941 () Bool)

(declare-fun b_next!20941 () Bool)

(assert (=> b!1038262 (= b_free!20941 (not b_next!20941))))

(declare-fun tp!73983 () Bool)

(declare-fun b_and!33447 () Bool)

(assert (=> b!1038262 (= tp!73983 b_and!33447)))

(declare-fun b!1038256 () Bool)

(declare-fun e!587453 () Bool)

(declare-fun tp_is_empty!24661 () Bool)

(assert (=> b!1038256 (= e!587453 tp_is_empty!24661)))

(declare-fun b!1038257 () Bool)

(declare-fun e!587449 () Bool)

(assert (=> b!1038257 (= e!587449 tp_is_empty!24661)))

(declare-fun b!1038258 () Bool)

(declare-fun e!587454 () Bool)

(declare-fun e!587451 () Bool)

(assert (=> b!1038258 (= e!587454 e!587451)))

(declare-fun res!692650 () Bool)

(assert (=> b!1038258 (=> (not res!692650) (not e!587451))))

(declare-datatypes ((SeekEntryResult!9764 0))(
  ( (MissingZero!9764 (index!41427 (_ BitVec 32))) (Found!9764 (index!41428 (_ BitVec 32))) (Intermediate!9764 (undefined!10576 Bool) (index!41429 (_ BitVec 32)) (x!92648 (_ BitVec 32))) (Undefined!9764) (MissingVacant!9764 (index!41430 (_ BitVec 32))) )
))
(declare-fun lt!457520 () SeekEntryResult!9764)

(get-info :version)

(assert (=> b!1038258 (= res!692650 ((_ is Found!9764) lt!457520))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37755 0))(
  ( (V!37756 (val!12381 Int)) )
))
(declare-datatypes ((ValueCell!11627 0))(
  ( (ValueCellFull!11627 (v!14966 V!37755)) (EmptyCell!11627) )
))
(declare-datatypes ((array!65375 0))(
  ( (array!65376 (arr!31464 (Array (_ BitVec 32) (_ BitVec 64))) (size!31996 (_ BitVec 32))) )
))
(declare-datatypes ((array!65377 0))(
  ( (array!65378 (arr!31465 (Array (_ BitVec 32) ValueCell!11627)) (size!31997 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5848 0))(
  ( (LongMapFixedSize!5849 (defaultEntry!6306 Int) (mask!30239 (_ BitVec 32)) (extraKeys!6034 (_ BitVec 32)) (zeroValue!6140 V!37755) (minValue!6140 V!37755) (_size!2979 (_ BitVec 32)) (_keys!11503 array!65375) (_values!6329 array!65377) (_vacant!2979 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5848)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65375 (_ BitVec 32)) SeekEntryResult!9764)

(assert (=> b!1038258 (= lt!457520 (seekEntry!0 key!909 (_keys!11503 thiss!1427) (mask!30239 thiss!1427)))))

(declare-fun b!1038259 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038259 (= e!587451 (not (validMask!0 (mask!30239 thiss!1427))))))

(declare-fun lt!457522 () array!65375)

(declare-datatypes ((List!21971 0))(
  ( (Nil!21968) (Cons!21967 (h!23170 (_ BitVec 64)) (t!31176 List!21971)) )
))
(declare-fun arrayNoDuplicates!0 (array!65375 (_ BitVec 32) List!21971) Bool)

(assert (=> b!1038259 (arrayNoDuplicates!0 lt!457522 #b00000000000000000000000000000000 Nil!21968)))

(declare-datatypes ((Unit!33855 0))(
  ( (Unit!33856) )
))
(declare-fun lt!457521 () Unit!33855)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65375 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21971) Unit!33855)

(assert (=> b!1038259 (= lt!457521 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11503 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41428 lt!457520) #b00000000000000000000000000000000 Nil!21968))))

(declare-fun arrayCountValidKeys!0 (array!65375 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038259 (= (arrayCountValidKeys!0 lt!457522 #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11503 thiss!1427) #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038259 (= lt!457522 (array!65376 (store (arr!31464 (_keys!11503 thiss!1427)) (index!41428 lt!457520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31996 (_keys!11503 thiss!1427))))))

(declare-fun lt!457523 () Unit!33855)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65375 (_ BitVec 32) (_ BitVec 64)) Unit!33855)

(assert (=> b!1038259 (= lt!457523 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11503 thiss!1427) (index!41428 lt!457520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038260 () Bool)

(declare-fun res!692651 () Bool)

(assert (=> b!1038260 (=> (not res!692651) (not e!587454))))

(assert (=> b!1038260 (= res!692651 (not (= key!909 (bvneg key!909))))))

(declare-fun res!692649 () Bool)

(assert (=> start!90840 (=> (not res!692649) (not e!587454))))

(declare-fun valid!2193 (LongMapFixedSize!5848) Bool)

(assert (=> start!90840 (= res!692649 (valid!2193 thiss!1427))))

(assert (=> start!90840 e!587454))

(declare-fun e!587450 () Bool)

(assert (=> start!90840 e!587450))

(assert (=> start!90840 true))

(declare-fun mapIsEmpty!38535 () Bool)

(declare-fun mapRes!38535 () Bool)

(assert (=> mapIsEmpty!38535 mapRes!38535))

(declare-fun b!1038261 () Bool)

(declare-fun e!587455 () Bool)

(assert (=> b!1038261 (= e!587455 (and e!587449 mapRes!38535))))

(declare-fun condMapEmpty!38535 () Bool)

(declare-fun mapDefault!38535 () ValueCell!11627)

(assert (=> b!1038261 (= condMapEmpty!38535 (= (arr!31465 (_values!6329 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11627)) mapDefault!38535)))))

(declare-fun array_inv!24329 (array!65375) Bool)

(declare-fun array_inv!24330 (array!65377) Bool)

(assert (=> b!1038262 (= e!587450 (and tp!73983 tp_is_empty!24661 (array_inv!24329 (_keys!11503 thiss!1427)) (array_inv!24330 (_values!6329 thiss!1427)) e!587455))))

(declare-fun mapNonEmpty!38535 () Bool)

(declare-fun tp!73984 () Bool)

(assert (=> mapNonEmpty!38535 (= mapRes!38535 (and tp!73984 e!587453))))

(declare-fun mapRest!38535 () (Array (_ BitVec 32) ValueCell!11627))

(declare-fun mapKey!38535 () (_ BitVec 32))

(declare-fun mapValue!38535 () ValueCell!11627)

(assert (=> mapNonEmpty!38535 (= (arr!31465 (_values!6329 thiss!1427)) (store mapRest!38535 mapKey!38535 mapValue!38535))))

(assert (= (and start!90840 res!692649) b!1038260))

(assert (= (and b!1038260 res!692651) b!1038258))

(assert (= (and b!1038258 res!692650) b!1038259))

(assert (= (and b!1038261 condMapEmpty!38535) mapIsEmpty!38535))

(assert (= (and b!1038261 (not condMapEmpty!38535)) mapNonEmpty!38535))

(assert (= (and mapNonEmpty!38535 ((_ is ValueCellFull!11627) mapValue!38535)) b!1038256))

(assert (= (and b!1038261 ((_ is ValueCellFull!11627) mapDefault!38535)) b!1038257))

(assert (= b!1038262 b!1038261))

(assert (= start!90840 b!1038262))

(declare-fun m!957729 () Bool)

(assert (=> b!1038262 m!957729))

(declare-fun m!957731 () Bool)

(assert (=> b!1038262 m!957731))

(declare-fun m!957733 () Bool)

(assert (=> start!90840 m!957733))

(declare-fun m!957735 () Bool)

(assert (=> b!1038259 m!957735))

(declare-fun m!957737 () Bool)

(assert (=> b!1038259 m!957737))

(declare-fun m!957739 () Bool)

(assert (=> b!1038259 m!957739))

(declare-fun m!957741 () Bool)

(assert (=> b!1038259 m!957741))

(declare-fun m!957743 () Bool)

(assert (=> b!1038259 m!957743))

(declare-fun m!957745 () Bool)

(assert (=> b!1038259 m!957745))

(declare-fun m!957747 () Bool)

(assert (=> b!1038259 m!957747))

(declare-fun m!957749 () Bool)

(assert (=> mapNonEmpty!38535 m!957749))

(declare-fun m!957751 () Bool)

(assert (=> b!1038258 m!957751))

(check-sat (not start!90840) tp_is_empty!24661 (not mapNonEmpty!38535) b_and!33447 (not b_next!20941) (not b!1038262) (not b!1038258) (not b!1038259))
(check-sat b_and!33447 (not b_next!20941))
(get-model)

(declare-fun b!1038317 () Bool)

(declare-fun e!587505 () SeekEntryResult!9764)

(declare-fun lt!457557 () SeekEntryResult!9764)

(assert (=> b!1038317 (= e!587505 (Found!9764 (index!41429 lt!457557)))))

(declare-fun b!1038318 () Bool)

(declare-fun e!587506 () SeekEntryResult!9764)

(assert (=> b!1038318 (= e!587506 e!587505)))

(declare-fun lt!457558 () (_ BitVec 64))

(assert (=> b!1038318 (= lt!457558 (select (arr!31464 (_keys!11503 thiss!1427)) (index!41429 lt!457557)))))

(declare-fun c!105167 () Bool)

(assert (=> b!1038318 (= c!105167 (= lt!457558 key!909))))

(declare-fun b!1038319 () Bool)

(declare-fun e!587504 () SeekEntryResult!9764)

(assert (=> b!1038319 (= e!587504 (MissingZero!9764 (index!41429 lt!457557)))))

(declare-fun b!1038320 () Bool)

(assert (=> b!1038320 (= e!587506 Undefined!9764)))

(declare-fun d!125183 () Bool)

(declare-fun lt!457559 () SeekEntryResult!9764)

(assert (=> d!125183 (and (or ((_ is MissingVacant!9764) lt!457559) (not ((_ is Found!9764) lt!457559)) (and (bvsge (index!41428 lt!457559) #b00000000000000000000000000000000) (bvslt (index!41428 lt!457559) (size!31996 (_keys!11503 thiss!1427))))) (not ((_ is MissingVacant!9764) lt!457559)) (or (not ((_ is Found!9764) lt!457559)) (= (select (arr!31464 (_keys!11503 thiss!1427)) (index!41428 lt!457559)) key!909)))))

(assert (=> d!125183 (= lt!457559 e!587506)))

(declare-fun c!105168 () Bool)

(assert (=> d!125183 (= c!105168 (and ((_ is Intermediate!9764) lt!457557) (undefined!10576 lt!457557)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65375 (_ BitVec 32)) SeekEntryResult!9764)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125183 (= lt!457557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30239 thiss!1427)) key!909 (_keys!11503 thiss!1427) (mask!30239 thiss!1427)))))

(assert (=> d!125183 (validMask!0 (mask!30239 thiss!1427))))

(assert (=> d!125183 (= (seekEntry!0 key!909 (_keys!11503 thiss!1427) (mask!30239 thiss!1427)) lt!457559)))

(declare-fun b!1038321 () Bool)

(declare-fun lt!457556 () SeekEntryResult!9764)

(assert (=> b!1038321 (= e!587504 (ite ((_ is MissingVacant!9764) lt!457556) (MissingZero!9764 (index!41430 lt!457556)) lt!457556))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65375 (_ BitVec 32)) SeekEntryResult!9764)

(assert (=> b!1038321 (= lt!457556 (seekKeyOrZeroReturnVacant!0 (x!92648 lt!457557) (index!41429 lt!457557) (index!41429 lt!457557) key!909 (_keys!11503 thiss!1427) (mask!30239 thiss!1427)))))

(declare-fun b!1038322 () Bool)

(declare-fun c!105166 () Bool)

(assert (=> b!1038322 (= c!105166 (= lt!457558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038322 (= e!587505 e!587504)))

(assert (= (and d!125183 c!105168) b!1038320))

(assert (= (and d!125183 (not c!105168)) b!1038318))

(assert (= (and b!1038318 c!105167) b!1038317))

(assert (= (and b!1038318 (not c!105167)) b!1038322))

(assert (= (and b!1038322 c!105166) b!1038319))

(assert (= (and b!1038322 (not c!105166)) b!1038321))

(declare-fun m!957801 () Bool)

(assert (=> b!1038318 m!957801))

(declare-fun m!957803 () Bool)

(assert (=> d!125183 m!957803))

(declare-fun m!957805 () Bool)

(assert (=> d!125183 m!957805))

(assert (=> d!125183 m!957805))

(declare-fun m!957807 () Bool)

(assert (=> d!125183 m!957807))

(assert (=> d!125183 m!957735))

(declare-fun m!957809 () Bool)

(assert (=> b!1038321 m!957809))

(assert (=> b!1038258 d!125183))

(declare-fun d!125185 () Bool)

(assert (=> d!125185 (= (array_inv!24329 (_keys!11503 thiss!1427)) (bvsge (size!31996 (_keys!11503 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038262 d!125185))

(declare-fun d!125187 () Bool)

(assert (=> d!125187 (= (array_inv!24330 (_values!6329 thiss!1427)) (bvsge (size!31997 (_values!6329 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038262 d!125187))

(declare-fun d!125189 () Bool)

(declare-fun e!587509 () Bool)

(assert (=> d!125189 e!587509))

(declare-fun res!692672 () Bool)

(assert (=> d!125189 (=> (not res!692672) (not e!587509))))

(assert (=> d!125189 (= res!692672 (and (bvsge (index!41428 lt!457520) #b00000000000000000000000000000000) (bvslt (index!41428 lt!457520) (size!31996 (_keys!11503 thiss!1427)))))))

(declare-fun lt!457562 () Unit!33855)

(declare-fun choose!53 (array!65375 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21971) Unit!33855)

(assert (=> d!125189 (= lt!457562 (choose!53 (_keys!11503 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41428 lt!457520) #b00000000000000000000000000000000 Nil!21968))))

(assert (=> d!125189 (bvslt (size!31996 (_keys!11503 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125189 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11503 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41428 lt!457520) #b00000000000000000000000000000000 Nil!21968) lt!457562)))

(declare-fun b!1038325 () Bool)

(assert (=> b!1038325 (= e!587509 (arrayNoDuplicates!0 (array!65376 (store (arr!31464 (_keys!11503 thiss!1427)) (index!41428 lt!457520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31996 (_keys!11503 thiss!1427))) #b00000000000000000000000000000000 Nil!21968))))

(assert (= (and d!125189 res!692672) b!1038325))

(declare-fun m!957811 () Bool)

(assert (=> d!125189 m!957811))

(assert (=> b!1038325 m!957747))

(declare-fun m!957813 () Bool)

(assert (=> b!1038325 m!957813))

(assert (=> b!1038259 d!125189))

(declare-fun d!125191 () Bool)

(assert (=> d!125191 (= (validMask!0 (mask!30239 thiss!1427)) (and (or (= (mask!30239 thiss!1427) #b00000000000000000000000000000111) (= (mask!30239 thiss!1427) #b00000000000000000000000000001111) (= (mask!30239 thiss!1427) #b00000000000000000000000000011111) (= (mask!30239 thiss!1427) #b00000000000000000000000000111111) (= (mask!30239 thiss!1427) #b00000000000000000000000001111111) (= (mask!30239 thiss!1427) #b00000000000000000000000011111111) (= (mask!30239 thiss!1427) #b00000000000000000000000111111111) (= (mask!30239 thiss!1427) #b00000000000000000000001111111111) (= (mask!30239 thiss!1427) #b00000000000000000000011111111111) (= (mask!30239 thiss!1427) #b00000000000000000000111111111111) (= (mask!30239 thiss!1427) #b00000000000000000001111111111111) (= (mask!30239 thiss!1427) #b00000000000000000011111111111111) (= (mask!30239 thiss!1427) #b00000000000000000111111111111111) (= (mask!30239 thiss!1427) #b00000000000000001111111111111111) (= (mask!30239 thiss!1427) #b00000000000000011111111111111111) (= (mask!30239 thiss!1427) #b00000000000000111111111111111111) (= (mask!30239 thiss!1427) #b00000000000001111111111111111111) (= (mask!30239 thiss!1427) #b00000000000011111111111111111111) (= (mask!30239 thiss!1427) #b00000000000111111111111111111111) (= (mask!30239 thiss!1427) #b00000000001111111111111111111111) (= (mask!30239 thiss!1427) #b00000000011111111111111111111111) (= (mask!30239 thiss!1427) #b00000000111111111111111111111111) (= (mask!30239 thiss!1427) #b00000001111111111111111111111111) (= (mask!30239 thiss!1427) #b00000011111111111111111111111111) (= (mask!30239 thiss!1427) #b00000111111111111111111111111111) (= (mask!30239 thiss!1427) #b00001111111111111111111111111111) (= (mask!30239 thiss!1427) #b00011111111111111111111111111111) (= (mask!30239 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30239 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1038259 d!125191))

(declare-fun b!1038336 () Bool)

(declare-fun e!587519 () Bool)

(declare-fun call!43921 () Bool)

(assert (=> b!1038336 (= e!587519 call!43921)))

(declare-fun d!125193 () Bool)

(declare-fun res!692679 () Bool)

(declare-fun e!587521 () Bool)

(assert (=> d!125193 (=> res!692679 e!587521)))

(assert (=> d!125193 (= res!692679 (bvsge #b00000000000000000000000000000000 (size!31996 lt!457522)))))

(assert (=> d!125193 (= (arrayNoDuplicates!0 lt!457522 #b00000000000000000000000000000000 Nil!21968) e!587521)))

(declare-fun b!1038337 () Bool)

(declare-fun e!587518 () Bool)

(assert (=> b!1038337 (= e!587521 e!587518)))

(declare-fun res!692680 () Bool)

(assert (=> b!1038337 (=> (not res!692680) (not e!587518))))

(declare-fun e!587520 () Bool)

(assert (=> b!1038337 (= res!692680 (not e!587520))))

(declare-fun res!692681 () Bool)

(assert (=> b!1038337 (=> (not res!692681) (not e!587520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038337 (= res!692681 (validKeyInArray!0 (select (arr!31464 lt!457522) #b00000000000000000000000000000000)))))

(declare-fun b!1038338 () Bool)

(assert (=> b!1038338 (= e!587519 call!43921)))

(declare-fun b!1038339 () Bool)

(assert (=> b!1038339 (= e!587518 e!587519)))

(declare-fun c!105171 () Bool)

(assert (=> b!1038339 (= c!105171 (validKeyInArray!0 (select (arr!31464 lt!457522) #b00000000000000000000000000000000)))))

(declare-fun b!1038340 () Bool)

(declare-fun contains!6018 (List!21971 (_ BitVec 64)) Bool)

(assert (=> b!1038340 (= e!587520 (contains!6018 Nil!21968 (select (arr!31464 lt!457522) #b00000000000000000000000000000000)))))

(declare-fun bm!43918 () Bool)

(assert (=> bm!43918 (= call!43921 (arrayNoDuplicates!0 lt!457522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105171 (Cons!21967 (select (arr!31464 lt!457522) #b00000000000000000000000000000000) Nil!21968) Nil!21968)))))

(assert (= (and d!125193 (not res!692679)) b!1038337))

(assert (= (and b!1038337 res!692681) b!1038340))

(assert (= (and b!1038337 res!692680) b!1038339))

(assert (= (and b!1038339 c!105171) b!1038336))

(assert (= (and b!1038339 (not c!105171)) b!1038338))

(assert (= (or b!1038336 b!1038338) bm!43918))

(declare-fun m!957815 () Bool)

(assert (=> b!1038337 m!957815))

(assert (=> b!1038337 m!957815))

(declare-fun m!957817 () Bool)

(assert (=> b!1038337 m!957817))

(assert (=> b!1038339 m!957815))

(assert (=> b!1038339 m!957815))

(assert (=> b!1038339 m!957817))

(assert (=> b!1038340 m!957815))

(assert (=> b!1038340 m!957815))

(declare-fun m!957819 () Bool)

(assert (=> b!1038340 m!957819))

(assert (=> bm!43918 m!957815))

(declare-fun m!957821 () Bool)

(assert (=> bm!43918 m!957821))

(assert (=> b!1038259 d!125193))

(declare-fun b!1038349 () Bool)

(declare-fun res!692690 () Bool)

(declare-fun e!587527 () Bool)

(assert (=> b!1038349 (=> (not res!692690) (not e!587527))))

(assert (=> b!1038349 (= res!692690 (validKeyInArray!0 (select (arr!31464 (_keys!11503 thiss!1427)) (index!41428 lt!457520))))))

(declare-fun b!1038352 () Bool)

(declare-fun e!587526 () Bool)

(assert (=> b!1038352 (= e!587526 (= (arrayCountValidKeys!0 (array!65376 (store (arr!31464 (_keys!11503 thiss!1427)) (index!41428 lt!457520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31996 (_keys!11503 thiss!1427))) #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11503 thiss!1427) #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125195 () Bool)

(assert (=> d!125195 e!587526))

(declare-fun res!692693 () Bool)

(assert (=> d!125195 (=> (not res!692693) (not e!587526))))

(assert (=> d!125195 (= res!692693 (and (bvsge (index!41428 lt!457520) #b00000000000000000000000000000000) (bvslt (index!41428 lt!457520) (size!31996 (_keys!11503 thiss!1427)))))))

(declare-fun lt!457565 () Unit!33855)

(declare-fun choose!82 (array!65375 (_ BitVec 32) (_ BitVec 64)) Unit!33855)

(assert (=> d!125195 (= lt!457565 (choose!82 (_keys!11503 thiss!1427) (index!41428 lt!457520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125195 e!587527))

(declare-fun res!692691 () Bool)

(assert (=> d!125195 (=> (not res!692691) (not e!587527))))

(assert (=> d!125195 (= res!692691 (and (bvsge (index!41428 lt!457520) #b00000000000000000000000000000000) (bvslt (index!41428 lt!457520) (size!31996 (_keys!11503 thiss!1427)))))))

(assert (=> d!125195 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11503 thiss!1427) (index!41428 lt!457520) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457565)))

(declare-fun b!1038351 () Bool)

(assert (=> b!1038351 (= e!587527 (bvslt (size!31996 (_keys!11503 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038350 () Bool)

(declare-fun res!692692 () Bool)

(assert (=> b!1038350 (=> (not res!692692) (not e!587527))))

(assert (=> b!1038350 (= res!692692 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125195 res!692691) b!1038349))

(assert (= (and b!1038349 res!692690) b!1038350))

(assert (= (and b!1038350 res!692692) b!1038351))

(assert (= (and d!125195 res!692693) b!1038352))

(declare-fun m!957823 () Bool)

(assert (=> b!1038349 m!957823))

(assert (=> b!1038349 m!957823))

(declare-fun m!957825 () Bool)

(assert (=> b!1038349 m!957825))

(assert (=> b!1038352 m!957747))

(declare-fun m!957827 () Bool)

(assert (=> b!1038352 m!957827))

(assert (=> b!1038352 m!957741))

(declare-fun m!957829 () Bool)

(assert (=> d!125195 m!957829))

(declare-fun m!957831 () Bool)

(assert (=> b!1038350 m!957831))

(assert (=> b!1038259 d!125195))

(declare-fun b!1038361 () Bool)

(declare-fun e!587533 () (_ BitVec 32))

(declare-fun call!43924 () (_ BitVec 32))

(assert (=> b!1038361 (= e!587533 (bvadd #b00000000000000000000000000000001 call!43924))))

(declare-fun d!125197 () Bool)

(declare-fun lt!457568 () (_ BitVec 32))

(assert (=> d!125197 (and (bvsge lt!457568 #b00000000000000000000000000000000) (bvsle lt!457568 (bvsub (size!31996 (_keys!11503 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!587532 () (_ BitVec 32))

(assert (=> d!125197 (= lt!457568 e!587532)))

(declare-fun c!105176 () Bool)

(assert (=> d!125197 (= c!105176 (bvsge #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))))))

(assert (=> d!125197 (and (bvsle #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31996 (_keys!11503 thiss!1427)) (size!31996 (_keys!11503 thiss!1427))))))

(assert (=> d!125197 (= (arrayCountValidKeys!0 (_keys!11503 thiss!1427) #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))) lt!457568)))

(declare-fun b!1038362 () Bool)

(assert (=> b!1038362 (= e!587532 #b00000000000000000000000000000000)))

(declare-fun b!1038363 () Bool)

(assert (=> b!1038363 (= e!587533 call!43924)))

(declare-fun bm!43921 () Bool)

(assert (=> bm!43921 (= call!43924 (arrayCountValidKeys!0 (_keys!11503 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31996 (_keys!11503 thiss!1427))))))

(declare-fun b!1038364 () Bool)

(assert (=> b!1038364 (= e!587532 e!587533)))

(declare-fun c!105177 () Bool)

(assert (=> b!1038364 (= c!105177 (validKeyInArray!0 (select (arr!31464 (_keys!11503 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125197 c!105176) b!1038362))

(assert (= (and d!125197 (not c!105176)) b!1038364))

(assert (= (and b!1038364 c!105177) b!1038361))

(assert (= (and b!1038364 (not c!105177)) b!1038363))

(assert (= (or b!1038361 b!1038363) bm!43921))

(declare-fun m!957833 () Bool)

(assert (=> bm!43921 m!957833))

(declare-fun m!957835 () Bool)

(assert (=> b!1038364 m!957835))

(assert (=> b!1038364 m!957835))

(declare-fun m!957837 () Bool)

(assert (=> b!1038364 m!957837))

(assert (=> b!1038259 d!125197))

(declare-fun b!1038365 () Bool)

(declare-fun e!587535 () (_ BitVec 32))

(declare-fun call!43925 () (_ BitVec 32))

(assert (=> b!1038365 (= e!587535 (bvadd #b00000000000000000000000000000001 call!43925))))

(declare-fun d!125199 () Bool)

(declare-fun lt!457569 () (_ BitVec 32))

(assert (=> d!125199 (and (bvsge lt!457569 #b00000000000000000000000000000000) (bvsle lt!457569 (bvsub (size!31996 lt!457522) #b00000000000000000000000000000000)))))

(declare-fun e!587534 () (_ BitVec 32))

(assert (=> d!125199 (= lt!457569 e!587534)))

(declare-fun c!105178 () Bool)

(assert (=> d!125199 (= c!105178 (bvsge #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))))))

(assert (=> d!125199 (and (bvsle #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31996 (_keys!11503 thiss!1427)) (size!31996 lt!457522)))))

(assert (=> d!125199 (= (arrayCountValidKeys!0 lt!457522 #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))) lt!457569)))

(declare-fun b!1038366 () Bool)

(assert (=> b!1038366 (= e!587534 #b00000000000000000000000000000000)))

(declare-fun b!1038367 () Bool)

(assert (=> b!1038367 (= e!587535 call!43925)))

(declare-fun bm!43922 () Bool)

(assert (=> bm!43922 (= call!43925 (arrayCountValidKeys!0 lt!457522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31996 (_keys!11503 thiss!1427))))))

(declare-fun b!1038368 () Bool)

(assert (=> b!1038368 (= e!587534 e!587535)))

(declare-fun c!105179 () Bool)

(assert (=> b!1038368 (= c!105179 (validKeyInArray!0 (select (arr!31464 lt!457522) #b00000000000000000000000000000000)))))

(assert (= (and d!125199 c!105178) b!1038366))

(assert (= (and d!125199 (not c!105178)) b!1038368))

(assert (= (and b!1038368 c!105179) b!1038365))

(assert (= (and b!1038368 (not c!105179)) b!1038367))

(assert (= (or b!1038365 b!1038367) bm!43922))

(declare-fun m!957839 () Bool)

(assert (=> bm!43922 m!957839))

(assert (=> b!1038368 m!957815))

(assert (=> b!1038368 m!957815))

(assert (=> b!1038368 m!957817))

(assert (=> b!1038259 d!125199))

(declare-fun d!125201 () Bool)

(declare-fun res!692700 () Bool)

(declare-fun e!587538 () Bool)

(assert (=> d!125201 (=> (not res!692700) (not e!587538))))

(declare-fun simpleValid!422 (LongMapFixedSize!5848) Bool)

(assert (=> d!125201 (= res!692700 (simpleValid!422 thiss!1427))))

(assert (=> d!125201 (= (valid!2193 thiss!1427) e!587538)))

(declare-fun b!1038375 () Bool)

(declare-fun res!692701 () Bool)

(assert (=> b!1038375 (=> (not res!692701) (not e!587538))))

(assert (=> b!1038375 (= res!692701 (= (arrayCountValidKeys!0 (_keys!11503 thiss!1427) #b00000000000000000000000000000000 (size!31996 (_keys!11503 thiss!1427))) (_size!2979 thiss!1427)))))

(declare-fun b!1038376 () Bool)

(declare-fun res!692702 () Bool)

(assert (=> b!1038376 (=> (not res!692702) (not e!587538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65375 (_ BitVec 32)) Bool)

(assert (=> b!1038376 (= res!692702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11503 thiss!1427) (mask!30239 thiss!1427)))))

(declare-fun b!1038377 () Bool)

(assert (=> b!1038377 (= e!587538 (arrayNoDuplicates!0 (_keys!11503 thiss!1427) #b00000000000000000000000000000000 Nil!21968))))

(assert (= (and d!125201 res!692700) b!1038375))

(assert (= (and b!1038375 res!692701) b!1038376))

(assert (= (and b!1038376 res!692702) b!1038377))

(declare-fun m!957841 () Bool)

(assert (=> d!125201 m!957841))

(assert (=> b!1038375 m!957741))

(declare-fun m!957843 () Bool)

(assert (=> b!1038376 m!957843))

(declare-fun m!957845 () Bool)

(assert (=> b!1038377 m!957845))

(assert (=> start!90840 d!125201))

(declare-fun mapNonEmpty!38544 () Bool)

(declare-fun mapRes!38544 () Bool)

(declare-fun tp!73999 () Bool)

(declare-fun e!587543 () Bool)

(assert (=> mapNonEmpty!38544 (= mapRes!38544 (and tp!73999 e!587543))))

(declare-fun mapRest!38544 () (Array (_ BitVec 32) ValueCell!11627))

(declare-fun mapKey!38544 () (_ BitVec 32))

(declare-fun mapValue!38544 () ValueCell!11627)

(assert (=> mapNonEmpty!38544 (= mapRest!38535 (store mapRest!38544 mapKey!38544 mapValue!38544))))

(declare-fun mapIsEmpty!38544 () Bool)

(assert (=> mapIsEmpty!38544 mapRes!38544))

(declare-fun b!1038385 () Bool)

(declare-fun e!587544 () Bool)

(assert (=> b!1038385 (= e!587544 tp_is_empty!24661)))

(declare-fun condMapEmpty!38544 () Bool)

(declare-fun mapDefault!38544 () ValueCell!11627)

(assert (=> mapNonEmpty!38535 (= condMapEmpty!38544 (= mapRest!38535 ((as const (Array (_ BitVec 32) ValueCell!11627)) mapDefault!38544)))))

(assert (=> mapNonEmpty!38535 (= tp!73984 (and e!587544 mapRes!38544))))

(declare-fun b!1038384 () Bool)

(assert (=> b!1038384 (= e!587543 tp_is_empty!24661)))

(assert (= (and mapNonEmpty!38535 condMapEmpty!38544) mapIsEmpty!38544))

(assert (= (and mapNonEmpty!38535 (not condMapEmpty!38544)) mapNonEmpty!38544))

(assert (= (and mapNonEmpty!38544 ((_ is ValueCellFull!11627) mapValue!38544)) b!1038384))

(assert (= (and mapNonEmpty!38535 ((_ is ValueCellFull!11627) mapDefault!38544)) b!1038385))

(declare-fun m!957847 () Bool)

(assert (=> mapNonEmpty!38544 m!957847))

(check-sat (not b!1038337) (not bm!43922) (not b!1038376) (not b!1038368) tp_is_empty!24661 (not d!125183) (not b_next!20941) (not b!1038375) (not d!125195) (not b!1038349) b_and!33447 (not b!1038364) (not b!1038377) (not b!1038352) (not mapNonEmpty!38544) (not b!1038321) (not bm!43918) (not b!1038325) (not bm!43921) (not d!125201) (not b!1038350) (not d!125189) (not b!1038340) (not b!1038339))
(check-sat b_and!33447 (not b_next!20941))
