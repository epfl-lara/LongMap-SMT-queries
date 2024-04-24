; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80864 () Bool)

(assert start!80864)

(declare-fun b!947488 () Bool)

(declare-fun b_free!18145 () Bool)

(declare-fun b_next!18145 () Bool)

(assert (=> b!947488 (= b_free!18145 (not b_next!18145))))

(declare-fun tp!62980 () Bool)

(declare-fun b_and!29577 () Bool)

(assert (=> b!947488 (= tp!62980 b_and!29577)))

(declare-fun b!947485 () Bool)

(declare-fun e!533216 () Bool)

(declare-datatypes ((V!32503 0))(
  ( (V!32504 (val!10377 Int)) )
))
(declare-datatypes ((ValueCell!9845 0))(
  ( (ValueCellFull!9845 (v!12908 V!32503)) (EmptyCell!9845) )
))
(declare-datatypes ((array!57345 0))(
  ( (array!57346 (arr!27583 (Array (_ BitVec 32) ValueCell!9845)) (size!28055 (_ BitVec 32))) )
))
(declare-datatypes ((array!57347 0))(
  ( (array!57348 (arr!27584 (Array (_ BitVec 32) (_ BitVec 64))) (size!28056 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4840 0))(
  ( (LongMapFixedSize!4841 (defaultEntry!5717 Int) (mask!27469 (_ BitVec 32)) (extraKeys!5449 (_ BitVec 32)) (zeroValue!5553 V!32503) (minValue!5553 V!32503) (_size!2475 (_ BitVec 32)) (_keys!10642 array!57347) (_values!5740 array!57345) (_vacant!2475 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4840)

(assert (=> b!947485 (= e!533216 (or (not (= (size!28055 (_values!5740 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27469 thiss!1141)))) (not (= (size!28056 (_keys!10642 thiss!1141)) (size!28055 (_values!5740 thiss!1141)))) (bvslt (mask!27469 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5449 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!947486 () Bool)

(declare-fun res!635779 () Bool)

(declare-fun e!533218 () Bool)

(assert (=> b!947486 (=> (not res!635779) (not e!533218))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!947486 (= res!635779 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32840 () Bool)

(declare-fun mapRes!32840 () Bool)

(assert (=> mapIsEmpty!32840 mapRes!32840))

(declare-fun res!635780 () Bool)

(assert (=> start!80864 (=> (not res!635780) (not e!533218))))

(declare-fun valid!1854 (LongMapFixedSize!4840) Bool)

(assert (=> start!80864 (= res!635780 (valid!1854 thiss!1141))))

(assert (=> start!80864 e!533218))

(declare-fun e!533214 () Bool)

(assert (=> start!80864 e!533214))

(assert (=> start!80864 true))

(declare-fun b!947487 () Bool)

(declare-fun e!533220 () Bool)

(declare-fun tp_is_empty!20653 () Bool)

(assert (=> b!947487 (= e!533220 tp_is_empty!20653)))

(declare-fun e!533219 () Bool)

(declare-fun array_inv!21506 (array!57347) Bool)

(declare-fun array_inv!21507 (array!57345) Bool)

(assert (=> b!947488 (= e!533214 (and tp!62980 tp_is_empty!20653 (array_inv!21506 (_keys!10642 thiss!1141)) (array_inv!21507 (_values!5740 thiss!1141)) e!533219))))

(declare-fun b!947489 () Bool)

(declare-fun e!533217 () Bool)

(assert (=> b!947489 (= e!533217 (not e!533216))))

(declare-fun res!635778 () Bool)

(assert (=> b!947489 (=> res!635778 e!533216)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947489 (= res!635778 (not (validMask!0 (mask!27469 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947489 (arrayContainsKey!0 (_keys!10642 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9064 0))(
  ( (MissingZero!9064 (index!38627 (_ BitVec 32))) (Found!9064 (index!38628 (_ BitVec 32))) (Intermediate!9064 (undefined!9876 Bool) (index!38629 (_ BitVec 32)) (x!81380 (_ BitVec 32))) (Undefined!9064) (MissingVacant!9064 (index!38630 (_ BitVec 32))) )
))
(declare-fun lt!426697 () SeekEntryResult!9064)

(declare-datatypes ((Unit!31887 0))(
  ( (Unit!31888) )
))
(declare-fun lt!426696 () Unit!31887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57347 (_ BitVec 64) (_ BitVec 32)) Unit!31887)

(assert (=> b!947489 (= lt!426696 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10642 thiss!1141) key!756 (index!38628 lt!426697)))))

(declare-fun b!947490 () Bool)

(assert (=> b!947490 (= e!533218 e!533217)))

(declare-fun res!635781 () Bool)

(assert (=> b!947490 (=> (not res!635781) (not e!533217))))

(get-info :version)

(assert (=> b!947490 (= res!635781 ((_ is Found!9064) lt!426697))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57347 (_ BitVec 32)) SeekEntryResult!9064)

(assert (=> b!947490 (= lt!426697 (seekEntry!0 key!756 (_keys!10642 thiss!1141) (mask!27469 thiss!1141)))))

(declare-fun mapNonEmpty!32840 () Bool)

(declare-fun tp!62981 () Bool)

(assert (=> mapNonEmpty!32840 (= mapRes!32840 (and tp!62981 e!533220))))

(declare-fun mapRest!32840 () (Array (_ BitVec 32) ValueCell!9845))

(declare-fun mapValue!32840 () ValueCell!9845)

(declare-fun mapKey!32840 () (_ BitVec 32))

(assert (=> mapNonEmpty!32840 (= (arr!27583 (_values!5740 thiss!1141)) (store mapRest!32840 mapKey!32840 mapValue!32840))))

(declare-fun b!947491 () Bool)

(declare-fun e!533213 () Bool)

(assert (=> b!947491 (= e!533219 (and e!533213 mapRes!32840))))

(declare-fun condMapEmpty!32840 () Bool)

(declare-fun mapDefault!32840 () ValueCell!9845)

(assert (=> b!947491 (= condMapEmpty!32840 (= (arr!27583 (_values!5740 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9845)) mapDefault!32840)))))

(declare-fun b!947492 () Bool)

(assert (=> b!947492 (= e!533213 tp_is_empty!20653)))

(assert (= (and start!80864 res!635780) b!947486))

(assert (= (and b!947486 res!635779) b!947490))

(assert (= (and b!947490 res!635781) b!947489))

(assert (= (and b!947489 (not res!635778)) b!947485))

(assert (= (and b!947491 condMapEmpty!32840) mapIsEmpty!32840))

(assert (= (and b!947491 (not condMapEmpty!32840)) mapNonEmpty!32840))

(assert (= (and mapNonEmpty!32840 ((_ is ValueCellFull!9845) mapValue!32840)) b!947487))

(assert (= (and b!947491 ((_ is ValueCellFull!9845) mapDefault!32840)) b!947492))

(assert (= b!947488 b!947491))

(assert (= start!80864 b!947488))

(declare-fun m!881193 () Bool)

(assert (=> mapNonEmpty!32840 m!881193))

(declare-fun m!881195 () Bool)

(assert (=> b!947490 m!881195))

(declare-fun m!881197 () Bool)

(assert (=> start!80864 m!881197))

(declare-fun m!881199 () Bool)

(assert (=> b!947488 m!881199))

(declare-fun m!881201 () Bool)

(assert (=> b!947488 m!881201))

(declare-fun m!881203 () Bool)

(assert (=> b!947489 m!881203))

(declare-fun m!881205 () Bool)

(assert (=> b!947489 m!881205))

(declare-fun m!881207 () Bool)

(assert (=> b!947489 m!881207))

(check-sat b_and!29577 (not b_next!18145) (not b!947490) tp_is_empty!20653 (not b!947488) (not b!947489) (not start!80864) (not mapNonEmpty!32840))
(check-sat b_and!29577 (not b_next!18145))
(get-model)

(declare-fun d!114885 () Bool)

(declare-fun lt!426718 () SeekEntryResult!9064)

(assert (=> d!114885 (and (or ((_ is MissingVacant!9064) lt!426718) (not ((_ is Found!9064) lt!426718)) (and (bvsge (index!38628 lt!426718) #b00000000000000000000000000000000) (bvslt (index!38628 lt!426718) (size!28056 (_keys!10642 thiss!1141))))) (not ((_ is MissingVacant!9064) lt!426718)) (or (not ((_ is Found!9064) lt!426718)) (= (select (arr!27584 (_keys!10642 thiss!1141)) (index!38628 lt!426718)) key!756)))))

(declare-fun e!533277 () SeekEntryResult!9064)

(assert (=> d!114885 (= lt!426718 e!533277)))

(declare-fun c!98873 () Bool)

(declare-fun lt!426721 () SeekEntryResult!9064)

(assert (=> d!114885 (= c!98873 (and ((_ is Intermediate!9064) lt!426721) (undefined!9876 lt!426721)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57347 (_ BitVec 32)) SeekEntryResult!9064)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114885 (= lt!426721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27469 thiss!1141)) key!756 (_keys!10642 thiss!1141) (mask!27469 thiss!1141)))))

(assert (=> d!114885 (validMask!0 (mask!27469 thiss!1141))))

(assert (=> d!114885 (= (seekEntry!0 key!756 (_keys!10642 thiss!1141) (mask!27469 thiss!1141)) lt!426718)))

(declare-fun b!947553 () Bool)

(declare-fun e!533275 () SeekEntryResult!9064)

(assert (=> b!947553 (= e!533277 e!533275)))

(declare-fun lt!426719 () (_ BitVec 64))

(assert (=> b!947553 (= lt!426719 (select (arr!27584 (_keys!10642 thiss!1141)) (index!38629 lt!426721)))))

(declare-fun c!98872 () Bool)

(assert (=> b!947553 (= c!98872 (= lt!426719 key!756))))

(declare-fun b!947554 () Bool)

(declare-fun c!98871 () Bool)

(assert (=> b!947554 (= c!98871 (= lt!426719 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533276 () SeekEntryResult!9064)

(assert (=> b!947554 (= e!533275 e!533276)))

(declare-fun b!947555 () Bool)

(assert (=> b!947555 (= e!533275 (Found!9064 (index!38629 lt!426721)))))

(declare-fun b!947556 () Bool)

(declare-fun lt!426720 () SeekEntryResult!9064)

(assert (=> b!947556 (= e!533276 (ite ((_ is MissingVacant!9064) lt!426720) (MissingZero!9064 (index!38630 lt!426720)) lt!426720))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57347 (_ BitVec 32)) SeekEntryResult!9064)

(assert (=> b!947556 (= lt!426720 (seekKeyOrZeroReturnVacant!0 (x!81380 lt!426721) (index!38629 lt!426721) (index!38629 lt!426721) key!756 (_keys!10642 thiss!1141) (mask!27469 thiss!1141)))))

(declare-fun b!947557 () Bool)

(assert (=> b!947557 (= e!533276 (MissingZero!9064 (index!38629 lt!426721)))))

(declare-fun b!947558 () Bool)

(assert (=> b!947558 (= e!533277 Undefined!9064)))

(assert (= (and d!114885 c!98873) b!947558))

(assert (= (and d!114885 (not c!98873)) b!947553))

(assert (= (and b!947553 c!98872) b!947555))

(assert (= (and b!947553 (not c!98872)) b!947554))

(assert (= (and b!947554 c!98871) b!947557))

(assert (= (and b!947554 (not c!98871)) b!947556))

(declare-fun m!881241 () Bool)

(assert (=> d!114885 m!881241))

(declare-fun m!881243 () Bool)

(assert (=> d!114885 m!881243))

(assert (=> d!114885 m!881243))

(declare-fun m!881245 () Bool)

(assert (=> d!114885 m!881245))

(assert (=> d!114885 m!881203))

(declare-fun m!881247 () Bool)

(assert (=> b!947553 m!881247))

(declare-fun m!881249 () Bool)

(assert (=> b!947556 m!881249))

(assert (=> b!947490 d!114885))

(declare-fun d!114887 () Bool)

(assert (=> d!114887 (= (array_inv!21506 (_keys!10642 thiss!1141)) (bvsge (size!28056 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947488 d!114887))

(declare-fun d!114889 () Bool)

(assert (=> d!114889 (= (array_inv!21507 (_values!5740 thiss!1141)) (bvsge (size!28055 (_values!5740 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947488 d!114889))

(declare-fun d!114891 () Bool)

(assert (=> d!114891 (= (validMask!0 (mask!27469 thiss!1141)) (and (or (= (mask!27469 thiss!1141) #b00000000000000000000000000000111) (= (mask!27469 thiss!1141) #b00000000000000000000000000001111) (= (mask!27469 thiss!1141) #b00000000000000000000000000011111) (= (mask!27469 thiss!1141) #b00000000000000000000000000111111) (= (mask!27469 thiss!1141) #b00000000000000000000000001111111) (= (mask!27469 thiss!1141) #b00000000000000000000000011111111) (= (mask!27469 thiss!1141) #b00000000000000000000000111111111) (= (mask!27469 thiss!1141) #b00000000000000000000001111111111) (= (mask!27469 thiss!1141) #b00000000000000000000011111111111) (= (mask!27469 thiss!1141) #b00000000000000000000111111111111) (= (mask!27469 thiss!1141) #b00000000000000000001111111111111) (= (mask!27469 thiss!1141) #b00000000000000000011111111111111) (= (mask!27469 thiss!1141) #b00000000000000000111111111111111) (= (mask!27469 thiss!1141) #b00000000000000001111111111111111) (= (mask!27469 thiss!1141) #b00000000000000011111111111111111) (= (mask!27469 thiss!1141) #b00000000000000111111111111111111) (= (mask!27469 thiss!1141) #b00000000000001111111111111111111) (= (mask!27469 thiss!1141) #b00000000000011111111111111111111) (= (mask!27469 thiss!1141) #b00000000000111111111111111111111) (= (mask!27469 thiss!1141) #b00000000001111111111111111111111) (= (mask!27469 thiss!1141) #b00000000011111111111111111111111) (= (mask!27469 thiss!1141) #b00000000111111111111111111111111) (= (mask!27469 thiss!1141) #b00000001111111111111111111111111) (= (mask!27469 thiss!1141) #b00000011111111111111111111111111) (= (mask!27469 thiss!1141) #b00000111111111111111111111111111) (= (mask!27469 thiss!1141) #b00001111111111111111111111111111) (= (mask!27469 thiss!1141) #b00011111111111111111111111111111) (= (mask!27469 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27469 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947489 d!114891))

(declare-fun d!114893 () Bool)

(declare-fun res!635810 () Bool)

(declare-fun e!533282 () Bool)

(assert (=> d!114893 (=> res!635810 e!533282)))

(assert (=> d!114893 (= res!635810 (= (select (arr!27584 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114893 (= (arrayContainsKey!0 (_keys!10642 thiss!1141) key!756 #b00000000000000000000000000000000) e!533282)))

(declare-fun b!947563 () Bool)

(declare-fun e!533283 () Bool)

(assert (=> b!947563 (= e!533282 e!533283)))

(declare-fun res!635811 () Bool)

(assert (=> b!947563 (=> (not res!635811) (not e!533283))))

(assert (=> b!947563 (= res!635811 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28056 (_keys!10642 thiss!1141))))))

(declare-fun b!947564 () Bool)

(assert (=> b!947564 (= e!533283 (arrayContainsKey!0 (_keys!10642 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114893 (not res!635810)) b!947563))

(assert (= (and b!947563 res!635811) b!947564))

(declare-fun m!881251 () Bool)

(assert (=> d!114893 m!881251))

(declare-fun m!881253 () Bool)

(assert (=> b!947564 m!881253))

(assert (=> b!947489 d!114893))

(declare-fun d!114895 () Bool)

(assert (=> d!114895 (arrayContainsKey!0 (_keys!10642 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426724 () Unit!31887)

(declare-fun choose!13 (array!57347 (_ BitVec 64) (_ BitVec 32)) Unit!31887)

(assert (=> d!114895 (= lt!426724 (choose!13 (_keys!10642 thiss!1141) key!756 (index!38628 lt!426697)))))

(assert (=> d!114895 (bvsge (index!38628 lt!426697) #b00000000000000000000000000000000)))

(assert (=> d!114895 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10642 thiss!1141) key!756 (index!38628 lt!426697)) lt!426724)))

(declare-fun bs!26623 () Bool)

(assert (= bs!26623 d!114895))

(assert (=> bs!26623 m!881205))

(declare-fun m!881255 () Bool)

(assert (=> bs!26623 m!881255))

(assert (=> b!947489 d!114895))

(declare-fun d!114897 () Bool)

(declare-fun res!635818 () Bool)

(declare-fun e!533286 () Bool)

(assert (=> d!114897 (=> (not res!635818) (not e!533286))))

(declare-fun simpleValid!359 (LongMapFixedSize!4840) Bool)

(assert (=> d!114897 (= res!635818 (simpleValid!359 thiss!1141))))

(assert (=> d!114897 (= (valid!1854 thiss!1141) e!533286)))

(declare-fun b!947571 () Bool)

(declare-fun res!635819 () Bool)

(assert (=> b!947571 (=> (not res!635819) (not e!533286))))

(declare-fun arrayCountValidKeys!0 (array!57347 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947571 (= res!635819 (= (arrayCountValidKeys!0 (_keys!10642 thiss!1141) #b00000000000000000000000000000000 (size!28056 (_keys!10642 thiss!1141))) (_size!2475 thiss!1141)))))

(declare-fun b!947572 () Bool)

(declare-fun res!635820 () Bool)

(assert (=> b!947572 (=> (not res!635820) (not e!533286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57347 (_ BitVec 32)) Bool)

(assert (=> b!947572 (= res!635820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10642 thiss!1141) (mask!27469 thiss!1141)))))

(declare-fun b!947573 () Bool)

(declare-datatypes ((List!19284 0))(
  ( (Nil!19281) (Cons!19280 (h!20440 (_ BitVec 64)) (t!27597 List!19284)) )
))
(declare-fun arrayNoDuplicates!0 (array!57347 (_ BitVec 32) List!19284) Bool)

(assert (=> b!947573 (= e!533286 (arrayNoDuplicates!0 (_keys!10642 thiss!1141) #b00000000000000000000000000000000 Nil!19281))))

(assert (= (and d!114897 res!635818) b!947571))

(assert (= (and b!947571 res!635819) b!947572))

(assert (= (and b!947572 res!635820) b!947573))

(declare-fun m!881257 () Bool)

(assert (=> d!114897 m!881257))

(declare-fun m!881259 () Bool)

(assert (=> b!947571 m!881259))

(declare-fun m!881261 () Bool)

(assert (=> b!947572 m!881261))

(declare-fun m!881263 () Bool)

(assert (=> b!947573 m!881263))

(assert (=> start!80864 d!114897))

(declare-fun mapIsEmpty!32849 () Bool)

(declare-fun mapRes!32849 () Bool)

(assert (=> mapIsEmpty!32849 mapRes!32849))

(declare-fun mapNonEmpty!32849 () Bool)

(declare-fun tp!62996 () Bool)

(declare-fun e!533292 () Bool)

(assert (=> mapNonEmpty!32849 (= mapRes!32849 (and tp!62996 e!533292))))

(declare-fun mapRest!32849 () (Array (_ BitVec 32) ValueCell!9845))

(declare-fun mapValue!32849 () ValueCell!9845)

(declare-fun mapKey!32849 () (_ BitVec 32))

(assert (=> mapNonEmpty!32849 (= mapRest!32840 (store mapRest!32849 mapKey!32849 mapValue!32849))))

(declare-fun condMapEmpty!32849 () Bool)

(declare-fun mapDefault!32849 () ValueCell!9845)

(assert (=> mapNonEmpty!32840 (= condMapEmpty!32849 (= mapRest!32840 ((as const (Array (_ BitVec 32) ValueCell!9845)) mapDefault!32849)))))

(declare-fun e!533291 () Bool)

(assert (=> mapNonEmpty!32840 (= tp!62981 (and e!533291 mapRes!32849))))

(declare-fun b!947580 () Bool)

(assert (=> b!947580 (= e!533292 tp_is_empty!20653)))

(declare-fun b!947581 () Bool)

(assert (=> b!947581 (= e!533291 tp_is_empty!20653)))

(assert (= (and mapNonEmpty!32840 condMapEmpty!32849) mapIsEmpty!32849))

(assert (= (and mapNonEmpty!32840 (not condMapEmpty!32849)) mapNonEmpty!32849))

(assert (= (and mapNonEmpty!32849 ((_ is ValueCellFull!9845) mapValue!32849)) b!947580))

(assert (= (and mapNonEmpty!32840 ((_ is ValueCellFull!9845) mapDefault!32849)) b!947581))

(declare-fun m!881265 () Bool)

(assert (=> mapNonEmpty!32849 m!881265))

(check-sat b_and!29577 (not b!947573) (not b_next!18145) (not b!947572) (not b!947571) tp_is_empty!20653 (not b!947556) (not mapNonEmpty!32849) (not d!114895) (not d!114885) (not b!947564) (not d!114897))
(check-sat b_and!29577 (not b_next!18145))
(get-model)

(declare-fun b!947590 () Bool)

(declare-fun e!533298 () (_ BitVec 32))

(assert (=> b!947590 (= e!533298 #b00000000000000000000000000000000)))

(declare-fun bm!41130 () Bool)

(declare-fun call!41133 () (_ BitVec 32))

(assert (=> bm!41130 (= call!41133 (arrayCountValidKeys!0 (_keys!10642 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28056 (_keys!10642 thiss!1141))))))

(declare-fun d!114899 () Bool)

(declare-fun lt!426727 () (_ BitVec 32))

(assert (=> d!114899 (and (bvsge lt!426727 #b00000000000000000000000000000000) (bvsle lt!426727 (bvsub (size!28056 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114899 (= lt!426727 e!533298)))

(declare-fun c!98878 () Bool)

(assert (=> d!114899 (= c!98878 (bvsge #b00000000000000000000000000000000 (size!28056 (_keys!10642 thiss!1141))))))

(assert (=> d!114899 (and (bvsle #b00000000000000000000000000000000 (size!28056 (_keys!10642 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28056 (_keys!10642 thiss!1141)) (size!28056 (_keys!10642 thiss!1141))))))

(assert (=> d!114899 (= (arrayCountValidKeys!0 (_keys!10642 thiss!1141) #b00000000000000000000000000000000 (size!28056 (_keys!10642 thiss!1141))) lt!426727)))

(declare-fun b!947591 () Bool)

(declare-fun e!533297 () (_ BitVec 32))

(assert (=> b!947591 (= e!533297 (bvadd #b00000000000000000000000000000001 call!41133))))

(declare-fun b!947592 () Bool)

(assert (=> b!947592 (= e!533297 call!41133)))

(declare-fun b!947593 () Bool)

(assert (=> b!947593 (= e!533298 e!533297)))

(declare-fun c!98879 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947593 (= c!98879 (validKeyInArray!0 (select (arr!27584 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114899 c!98878) b!947590))

(assert (= (and d!114899 (not c!98878)) b!947593))

(assert (= (and b!947593 c!98879) b!947591))

(assert (= (and b!947593 (not c!98879)) b!947592))

(assert (= (or b!947591 b!947592) bm!41130))

(declare-fun m!881267 () Bool)

(assert (=> bm!41130 m!881267))

(assert (=> b!947593 m!881251))

(assert (=> b!947593 m!881251))

(declare-fun m!881269 () Bool)

(assert (=> b!947593 m!881269))

(assert (=> b!947571 d!114899))

(declare-fun b!947603 () Bool)

(declare-fun res!635830 () Bool)

(declare-fun e!533301 () Bool)

(assert (=> b!947603 (=> (not res!635830) (not e!533301))))

(declare-fun size!28061 (LongMapFixedSize!4840) (_ BitVec 32))

(assert (=> b!947603 (= res!635830 (bvsge (size!28061 thiss!1141) (_size!2475 thiss!1141)))))

(declare-fun b!947605 () Bool)

(assert (=> b!947605 (= e!533301 (and (bvsge (extraKeys!5449 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5449 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2475 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!947602 () Bool)

(declare-fun res!635832 () Bool)

(assert (=> b!947602 (=> (not res!635832) (not e!533301))))

(assert (=> b!947602 (= res!635832 (and (= (size!28055 (_values!5740 thiss!1141)) (bvadd (mask!27469 thiss!1141) #b00000000000000000000000000000001)) (= (size!28056 (_keys!10642 thiss!1141)) (size!28055 (_values!5740 thiss!1141))) (bvsge (_size!2475 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2475 thiss!1141) (bvadd (mask!27469 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun d!114901 () Bool)

(declare-fun res!635831 () Bool)

(assert (=> d!114901 (=> (not res!635831) (not e!533301))))

(assert (=> d!114901 (= res!635831 (validMask!0 (mask!27469 thiss!1141)))))

(assert (=> d!114901 (= (simpleValid!359 thiss!1141) e!533301)))

(declare-fun b!947604 () Bool)

(declare-fun res!635829 () Bool)

(assert (=> b!947604 (=> (not res!635829) (not e!533301))))

(assert (=> b!947604 (= res!635829 (= (size!28061 thiss!1141) (bvadd (_size!2475 thiss!1141) (bvsdiv (bvadd (extraKeys!5449 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!114901 res!635831) b!947602))

(assert (= (and b!947602 res!635832) b!947603))

(assert (= (and b!947603 res!635830) b!947604))

(assert (= (and b!947604 res!635829) b!947605))

(declare-fun m!881271 () Bool)

(assert (=> b!947603 m!881271))

(assert (=> d!114901 m!881203))

(assert (=> b!947604 m!881271))

(assert (=> d!114897 d!114901))

(declare-fun d!114903 () Bool)

(declare-fun res!635833 () Bool)

(declare-fun e!533302 () Bool)

(assert (=> d!114903 (=> res!635833 e!533302)))

(assert (=> d!114903 (= res!635833 (= (select (arr!27584 (_keys!10642 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114903 (= (arrayContainsKey!0 (_keys!10642 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!533302)))

(declare-fun b!947606 () Bool)

(declare-fun e!533303 () Bool)

(assert (=> b!947606 (= e!533302 e!533303)))

(declare-fun res!635834 () Bool)

(assert (=> b!947606 (=> (not res!635834) (not e!533303))))

(assert (=> b!947606 (= res!635834 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28056 (_keys!10642 thiss!1141))))))

(declare-fun b!947607 () Bool)

(assert (=> b!947607 (= e!533303 (arrayContainsKey!0 (_keys!10642 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114903 (not res!635833)) b!947606))

(assert (= (and b!947606 res!635834) b!947607))

(declare-fun m!881273 () Bool)

(assert (=> d!114903 m!881273))

(declare-fun m!881275 () Bool)

(assert (=> b!947607 m!881275))

(assert (=> b!947564 d!114903))

(declare-fun b!947616 () Bool)

(declare-fun e!533312 () Bool)

(declare-fun e!533311 () Bool)

(assert (=> b!947616 (= e!533312 e!533311)))

(declare-fun c!98882 () Bool)

(assert (=> b!947616 (= c!98882 (validKeyInArray!0 (select (arr!27584 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114905 () Bool)

(declare-fun res!635840 () Bool)

(assert (=> d!114905 (=> res!635840 e!533312)))

(assert (=> d!114905 (= res!635840 (bvsge #b00000000000000000000000000000000 (size!28056 (_keys!10642 thiss!1141))))))

(assert (=> d!114905 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10642 thiss!1141) (mask!27469 thiss!1141)) e!533312)))

(declare-fun b!947617 () Bool)

(declare-fun call!41136 () Bool)

(assert (=> b!947617 (= e!533311 call!41136)))

(declare-fun bm!41133 () Bool)

(assert (=> bm!41133 (= call!41136 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10642 thiss!1141) (mask!27469 thiss!1141)))))

(declare-fun b!947618 () Bool)

(declare-fun e!533310 () Bool)

(assert (=> b!947618 (= e!533311 e!533310)))

(declare-fun lt!426735 () (_ BitVec 64))

(assert (=> b!947618 (= lt!426735 (select (arr!27584 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426736 () Unit!31887)

(assert (=> b!947618 (= lt!426736 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10642 thiss!1141) lt!426735 #b00000000000000000000000000000000))))

(assert (=> b!947618 (arrayContainsKey!0 (_keys!10642 thiss!1141) lt!426735 #b00000000000000000000000000000000)))

(declare-fun lt!426734 () Unit!31887)

(assert (=> b!947618 (= lt!426734 lt!426736)))

(declare-fun res!635839 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57347 (_ BitVec 32)) SeekEntryResult!9064)

(assert (=> b!947618 (= res!635839 (= (seekEntryOrOpen!0 (select (arr!27584 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000) (_keys!10642 thiss!1141) (mask!27469 thiss!1141)) (Found!9064 #b00000000000000000000000000000000)))))

(assert (=> b!947618 (=> (not res!635839) (not e!533310))))

(declare-fun b!947619 () Bool)

(assert (=> b!947619 (= e!533310 call!41136)))

(assert (= (and d!114905 (not res!635840)) b!947616))

(assert (= (and b!947616 c!98882) b!947618))

(assert (= (and b!947616 (not c!98882)) b!947617))

(assert (= (and b!947618 res!635839) b!947619))

(assert (= (or b!947619 b!947617) bm!41133))

(assert (=> b!947616 m!881251))

(assert (=> b!947616 m!881251))

(assert (=> b!947616 m!881269))

(declare-fun m!881277 () Bool)

(assert (=> bm!41133 m!881277))

(assert (=> b!947618 m!881251))

(declare-fun m!881279 () Bool)

(assert (=> b!947618 m!881279))

(declare-fun m!881281 () Bool)

(assert (=> b!947618 m!881281))

(assert (=> b!947618 m!881251))

(declare-fun m!881283 () Bool)

(assert (=> b!947618 m!881283))

(assert (=> b!947572 d!114905))

(declare-fun b!947632 () Bool)

(declare-fun e!533321 () SeekEntryResult!9064)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947632 (= e!533321 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81380 lt!426721) #b00000000000000000000000000000001) (nextIndex!0 (index!38629 lt!426721) (bvadd (x!81380 lt!426721) #b00000000000000000000000000000001) (mask!27469 thiss!1141)) (index!38629 lt!426721) key!756 (_keys!10642 thiss!1141) (mask!27469 thiss!1141)))))

(declare-fun b!947633 () Bool)

(declare-fun c!98889 () Bool)

(declare-fun lt!426742 () (_ BitVec 64))

(assert (=> b!947633 (= c!98889 (= lt!426742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533319 () SeekEntryResult!9064)

(assert (=> b!947633 (= e!533319 e!533321)))

(declare-fun b!947634 () Bool)

(declare-fun e!533320 () SeekEntryResult!9064)

(assert (=> b!947634 (= e!533320 e!533319)))

(declare-fun c!98891 () Bool)

(assert (=> b!947634 (= c!98891 (= lt!426742 key!756))))

(declare-fun b!947635 () Bool)

(assert (=> b!947635 (= e!533321 (MissingVacant!9064 (index!38629 lt!426721)))))

(declare-fun lt!426741 () SeekEntryResult!9064)

(declare-fun d!114907 () Bool)

(assert (=> d!114907 (and (or ((_ is Undefined!9064) lt!426741) (not ((_ is Found!9064) lt!426741)) (and (bvsge (index!38628 lt!426741) #b00000000000000000000000000000000) (bvslt (index!38628 lt!426741) (size!28056 (_keys!10642 thiss!1141))))) (or ((_ is Undefined!9064) lt!426741) ((_ is Found!9064) lt!426741) (not ((_ is MissingVacant!9064) lt!426741)) (not (= (index!38630 lt!426741) (index!38629 lt!426721))) (and (bvsge (index!38630 lt!426741) #b00000000000000000000000000000000) (bvslt (index!38630 lt!426741) (size!28056 (_keys!10642 thiss!1141))))) (or ((_ is Undefined!9064) lt!426741) (ite ((_ is Found!9064) lt!426741) (= (select (arr!27584 (_keys!10642 thiss!1141)) (index!38628 lt!426741)) key!756) (and ((_ is MissingVacant!9064) lt!426741) (= (index!38630 lt!426741) (index!38629 lt!426721)) (= (select (arr!27584 (_keys!10642 thiss!1141)) (index!38630 lt!426741)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114907 (= lt!426741 e!533320)))

(declare-fun c!98890 () Bool)

(assert (=> d!114907 (= c!98890 (bvsge (x!81380 lt!426721) #b01111111111111111111111111111110))))

(assert (=> d!114907 (= lt!426742 (select (arr!27584 (_keys!10642 thiss!1141)) (index!38629 lt!426721)))))

(assert (=> d!114907 (validMask!0 (mask!27469 thiss!1141))))

(assert (=> d!114907 (= (seekKeyOrZeroReturnVacant!0 (x!81380 lt!426721) (index!38629 lt!426721) (index!38629 lt!426721) key!756 (_keys!10642 thiss!1141) (mask!27469 thiss!1141)) lt!426741)))

(declare-fun b!947636 () Bool)

(assert (=> b!947636 (= e!533319 (Found!9064 (index!38629 lt!426721)))))

(declare-fun b!947637 () Bool)

(assert (=> b!947637 (= e!533320 Undefined!9064)))

(assert (= (and d!114907 c!98890) b!947637))

(assert (= (and d!114907 (not c!98890)) b!947634))

(assert (= (and b!947634 c!98891) b!947636))

(assert (= (and b!947634 (not c!98891)) b!947633))

(assert (= (and b!947633 c!98889) b!947635))

(assert (= (and b!947633 (not c!98889)) b!947632))

(declare-fun m!881285 () Bool)

(assert (=> b!947632 m!881285))

(assert (=> b!947632 m!881285))

(declare-fun m!881287 () Bool)

(assert (=> b!947632 m!881287))

(declare-fun m!881289 () Bool)

(assert (=> d!114907 m!881289))

(declare-fun m!881291 () Bool)

(assert (=> d!114907 m!881291))

(assert (=> d!114907 m!881247))

(assert (=> d!114907 m!881203))

(assert (=> b!947556 d!114907))

(assert (=> d!114895 d!114893))

(declare-fun d!114909 () Bool)

(assert (=> d!114909 (arrayContainsKey!0 (_keys!10642 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114909 true))

(declare-fun _$60!436 () Unit!31887)

(assert (=> d!114909 (= (choose!13 (_keys!10642 thiss!1141) key!756 (index!38628 lt!426697)) _$60!436)))

(declare-fun bs!26624 () Bool)

(assert (= bs!26624 d!114909))

(assert (=> bs!26624 m!881205))

(assert (=> d!114895 d!114909))

(declare-fun b!947656 () Bool)

(declare-fun lt!426748 () SeekEntryResult!9064)

(assert (=> b!947656 (and (bvsge (index!38629 lt!426748) #b00000000000000000000000000000000) (bvslt (index!38629 lt!426748) (size!28056 (_keys!10642 thiss!1141))))))

(declare-fun res!635847 () Bool)

(assert (=> b!947656 (= res!635847 (= (select (arr!27584 (_keys!10642 thiss!1141)) (index!38629 lt!426748)) key!756))))

(declare-fun e!533333 () Bool)

(assert (=> b!947656 (=> res!635847 e!533333)))

(declare-fun e!533332 () Bool)

(assert (=> b!947656 (= e!533332 e!533333)))

(declare-fun b!947657 () Bool)

(declare-fun e!533334 () SeekEntryResult!9064)

(assert (=> b!947657 (= e!533334 (Intermediate!9064 false (toIndex!0 key!756 (mask!27469 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun d!114911 () Bool)

(declare-fun e!533335 () Bool)

(assert (=> d!114911 e!533335))

(declare-fun c!98900 () Bool)

(assert (=> d!114911 (= c!98900 (and ((_ is Intermediate!9064) lt!426748) (undefined!9876 lt!426748)))))

(declare-fun e!533336 () SeekEntryResult!9064)

(assert (=> d!114911 (= lt!426748 e!533336)))

(declare-fun c!98899 () Bool)

(assert (=> d!114911 (= c!98899 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!426747 () (_ BitVec 64))

(assert (=> d!114911 (= lt!426747 (select (arr!27584 (_keys!10642 thiss!1141)) (toIndex!0 key!756 (mask!27469 thiss!1141))))))

(assert (=> d!114911 (validMask!0 (mask!27469 thiss!1141))))

(assert (=> d!114911 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27469 thiss!1141)) key!756 (_keys!10642 thiss!1141) (mask!27469 thiss!1141)) lt!426748)))

(declare-fun b!947658 () Bool)

(assert (=> b!947658 (= e!533336 e!533334)))

(declare-fun c!98898 () Bool)

(assert (=> b!947658 (= c!98898 (or (= lt!426747 key!756) (= (bvadd lt!426747 lt!426747) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!947659 () Bool)

(assert (=> b!947659 (= e!533335 e!533332)))

(declare-fun res!635849 () Bool)

(assert (=> b!947659 (= res!635849 (and ((_ is Intermediate!9064) lt!426748) (not (undefined!9876 lt!426748)) (bvslt (x!81380 lt!426748) #b01111111111111111111111111111110) (bvsge (x!81380 lt!426748) #b00000000000000000000000000000000) (bvsge (x!81380 lt!426748) #b00000000000000000000000000000000)))))

(assert (=> b!947659 (=> (not res!635849) (not e!533332))))

(declare-fun b!947660 () Bool)

(assert (=> b!947660 (and (bvsge (index!38629 lt!426748) #b00000000000000000000000000000000) (bvslt (index!38629 lt!426748) (size!28056 (_keys!10642 thiss!1141))))))

(assert (=> b!947660 (= e!533333 (= (select (arr!27584 (_keys!10642 thiss!1141)) (index!38629 lt!426748)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947661 () Bool)

(assert (=> b!947661 (= e!533334 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27469 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27469 thiss!1141)) key!756 (_keys!10642 thiss!1141) (mask!27469 thiss!1141)))))

(declare-fun b!947662 () Bool)

(assert (=> b!947662 (= e!533336 (Intermediate!9064 true (toIndex!0 key!756 (mask!27469 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!947663 () Bool)

(assert (=> b!947663 (and (bvsge (index!38629 lt!426748) #b00000000000000000000000000000000) (bvslt (index!38629 lt!426748) (size!28056 (_keys!10642 thiss!1141))))))

(declare-fun res!635848 () Bool)

(assert (=> b!947663 (= res!635848 (= (select (arr!27584 (_keys!10642 thiss!1141)) (index!38629 lt!426748)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947663 (=> res!635848 e!533333)))

(declare-fun b!947664 () Bool)

(assert (=> b!947664 (= e!533335 (bvsge (x!81380 lt!426748) #b01111111111111111111111111111110))))

(assert (= (and d!114911 c!98899) b!947662))

(assert (= (and d!114911 (not c!98899)) b!947658))

(assert (= (and b!947658 c!98898) b!947657))

(assert (= (and b!947658 (not c!98898)) b!947661))

(assert (= (and d!114911 c!98900) b!947664))

(assert (= (and d!114911 (not c!98900)) b!947659))

(assert (= (and b!947659 res!635849) b!947656))

(assert (= (and b!947656 (not res!635847)) b!947663))

(assert (= (and b!947663 (not res!635848)) b!947660))

(declare-fun m!881293 () Bool)

(assert (=> b!947660 m!881293))

(assert (=> b!947663 m!881293))

(assert (=> b!947661 m!881243))

(declare-fun m!881295 () Bool)

(assert (=> b!947661 m!881295))

(assert (=> b!947661 m!881295))

(declare-fun m!881297 () Bool)

(assert (=> b!947661 m!881297))

(assert (=> b!947656 m!881293))

(assert (=> d!114911 m!881243))

(declare-fun m!881299 () Bool)

(assert (=> d!114911 m!881299))

(assert (=> d!114911 m!881203))

(assert (=> d!114885 d!114911))

(declare-fun d!114913 () Bool)

(declare-fun lt!426754 () (_ BitVec 32))

(declare-fun lt!426753 () (_ BitVec 32))

(assert (=> d!114913 (= lt!426754 (bvmul (bvxor lt!426753 (bvlshr lt!426753 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114913 (= lt!426753 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114913 (and (bvsge (mask!27469 thiss!1141) #b00000000000000000000000000000000) (let ((res!635850 (let ((h!20441 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81399 (bvmul (bvxor h!20441 (bvlshr h!20441 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81399 (bvlshr x!81399 #b00000000000000000000000000001101)) (mask!27469 thiss!1141)))))) (and (bvslt res!635850 (bvadd (mask!27469 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635850 #b00000000000000000000000000000000))))))

(assert (=> d!114913 (= (toIndex!0 key!756 (mask!27469 thiss!1141)) (bvand (bvxor lt!426754 (bvlshr lt!426754 #b00000000000000000000000000001101)) (mask!27469 thiss!1141)))))

(assert (=> d!114885 d!114913))

(assert (=> d!114885 d!114891))

(declare-fun b!947675 () Bool)

(declare-fun e!533348 () Bool)

(declare-fun contains!5198 (List!19284 (_ BitVec 64)) Bool)

(assert (=> b!947675 (= e!533348 (contains!5198 Nil!19281 (select (arr!27584 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947676 () Bool)

(declare-fun e!533345 () Bool)

(declare-fun e!533347 () Bool)

(assert (=> b!947676 (= e!533345 e!533347)))

(declare-fun res!635859 () Bool)

(assert (=> b!947676 (=> (not res!635859) (not e!533347))))

(assert (=> b!947676 (= res!635859 (not e!533348))))

(declare-fun res!635857 () Bool)

(assert (=> b!947676 (=> (not res!635857) (not e!533348))))

(assert (=> b!947676 (= res!635857 (validKeyInArray!0 (select (arr!27584 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947677 () Bool)

(declare-fun e!533346 () Bool)

(declare-fun call!41139 () Bool)

(assert (=> b!947677 (= e!533346 call!41139)))

(declare-fun b!947678 () Bool)

(assert (=> b!947678 (= e!533346 call!41139)))

(declare-fun d!114915 () Bool)

(declare-fun res!635858 () Bool)

(assert (=> d!114915 (=> res!635858 e!533345)))

(assert (=> d!114915 (= res!635858 (bvsge #b00000000000000000000000000000000 (size!28056 (_keys!10642 thiss!1141))))))

(assert (=> d!114915 (= (arrayNoDuplicates!0 (_keys!10642 thiss!1141) #b00000000000000000000000000000000 Nil!19281) e!533345)))

(declare-fun b!947679 () Bool)

(assert (=> b!947679 (= e!533347 e!533346)))

(declare-fun c!98903 () Bool)

(assert (=> b!947679 (= c!98903 (validKeyInArray!0 (select (arr!27584 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41136 () Bool)

(assert (=> bm!41136 (= call!41139 (arrayNoDuplicates!0 (_keys!10642 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98903 (Cons!19280 (select (arr!27584 (_keys!10642 thiss!1141)) #b00000000000000000000000000000000) Nil!19281) Nil!19281)))))

(assert (= (and d!114915 (not res!635858)) b!947676))

(assert (= (and b!947676 res!635857) b!947675))

(assert (= (and b!947676 res!635859) b!947679))

(assert (= (and b!947679 c!98903) b!947677))

(assert (= (and b!947679 (not c!98903)) b!947678))

(assert (= (or b!947677 b!947678) bm!41136))

(assert (=> b!947675 m!881251))

(assert (=> b!947675 m!881251))

(declare-fun m!881301 () Bool)

(assert (=> b!947675 m!881301))

(assert (=> b!947676 m!881251))

(assert (=> b!947676 m!881251))

(assert (=> b!947676 m!881269))

(assert (=> b!947679 m!881251))

(assert (=> b!947679 m!881251))

(assert (=> b!947679 m!881269))

(assert (=> bm!41136 m!881251))

(declare-fun m!881303 () Bool)

(assert (=> bm!41136 m!881303))

(assert (=> b!947573 d!114915))

(declare-fun mapIsEmpty!32850 () Bool)

(declare-fun mapRes!32850 () Bool)

(assert (=> mapIsEmpty!32850 mapRes!32850))

(declare-fun mapNonEmpty!32850 () Bool)

(declare-fun tp!62997 () Bool)

(declare-fun e!533350 () Bool)

(assert (=> mapNonEmpty!32850 (= mapRes!32850 (and tp!62997 e!533350))))

(declare-fun mapKey!32850 () (_ BitVec 32))

(declare-fun mapRest!32850 () (Array (_ BitVec 32) ValueCell!9845))

(declare-fun mapValue!32850 () ValueCell!9845)

(assert (=> mapNonEmpty!32850 (= mapRest!32849 (store mapRest!32850 mapKey!32850 mapValue!32850))))

(declare-fun condMapEmpty!32850 () Bool)

(declare-fun mapDefault!32850 () ValueCell!9845)

(assert (=> mapNonEmpty!32849 (= condMapEmpty!32850 (= mapRest!32849 ((as const (Array (_ BitVec 32) ValueCell!9845)) mapDefault!32850)))))

(declare-fun e!533349 () Bool)

(assert (=> mapNonEmpty!32849 (= tp!62996 (and e!533349 mapRes!32850))))

(declare-fun b!947680 () Bool)

(assert (=> b!947680 (= e!533350 tp_is_empty!20653)))

(declare-fun b!947681 () Bool)

(assert (=> b!947681 (= e!533349 tp_is_empty!20653)))

(assert (= (and mapNonEmpty!32849 condMapEmpty!32850) mapIsEmpty!32850))

(assert (= (and mapNonEmpty!32849 (not condMapEmpty!32850)) mapNonEmpty!32850))

(assert (= (and mapNonEmpty!32850 ((_ is ValueCellFull!9845) mapValue!32850)) b!947680))

(assert (= (and mapNonEmpty!32849 ((_ is ValueCellFull!9845) mapDefault!32850)) b!947681))

(declare-fun m!881305 () Bool)

(assert (=> mapNonEmpty!32850 m!881305))

(check-sat (not b_next!18145) (not b!947661) (not b!947616) (not bm!41133) (not mapNonEmpty!32850) (not bm!41130) (not d!114907) (not b!947607) (not b!947593) (not b!947632) b_and!29577 (not b!947675) (not b!947604) (not d!114911) tp_is_empty!20653 (not bm!41136) (not d!114901) (not d!114909) (not b!947603) (not b!947679) (not b!947618) (not b!947676))
(check-sat b_and!29577 (not b_next!18145))
