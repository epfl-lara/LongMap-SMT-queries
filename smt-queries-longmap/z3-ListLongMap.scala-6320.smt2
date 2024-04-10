; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81208 () Bool)

(assert start!81208)

(declare-fun b!950313 () Bool)

(declare-fun b_free!18243 () Bool)

(declare-fun b_next!18243 () Bool)

(assert (=> b!950313 (= b_free!18243 (not b_next!18243))))

(declare-fun tp!63324 () Bool)

(declare-fun b_and!29699 () Bool)

(assert (=> b!950313 (= tp!63324 b_and!29699)))

(declare-fun b!950311 () Bool)

(declare-fun e!535031 () Bool)

(declare-fun tp_is_empty!20751 () Bool)

(assert (=> b!950311 (= e!535031 tp_is_empty!20751)))

(declare-fun b!950312 () Bool)

(declare-fun res!637153 () Bool)

(declare-fun e!535033 () Bool)

(assert (=> b!950312 (=> (not res!637153) (not e!535033))))

(declare-datatypes ((V!32633 0))(
  ( (V!32634 (val!10426 Int)) )
))
(declare-datatypes ((ValueCell!9894 0))(
  ( (ValueCellFull!9894 (v!12969 V!32633)) (EmptyCell!9894) )
))
(declare-datatypes ((array!57520 0))(
  ( (array!57521 (arr!27660 (Array (_ BitVec 32) ValueCell!9894)) (size!28137 (_ BitVec 32))) )
))
(declare-datatypes ((array!57522 0))(
  ( (array!57523 (arr!27661 (Array (_ BitVec 32) (_ BitVec 64))) (size!28138 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4938 0))(
  ( (LongMapFixedSize!4939 (defaultEntry!5780 Int) (mask!27580 (_ BitVec 32)) (extraKeys!5512 (_ BitVec 32)) (zeroValue!5616 V!32633) (minValue!5616 V!32633) (_size!2524 (_ BitVec 32)) (_keys!10716 array!57522) (_values!5803 array!57520) (_vacant!2524 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4938)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13550 0))(
  ( (tuple2!13551 (_1!6786 (_ BitVec 64)) (_2!6786 V!32633)) )
))
(declare-datatypes ((List!19340 0))(
  ( (Nil!19337) (Cons!19336 (h!20496 tuple2!13550) (t!27679 List!19340)) )
))
(declare-datatypes ((ListLongMap!12247 0))(
  ( (ListLongMap!12248 (toList!6139 List!19340)) )
))
(declare-fun contains!5230 (ListLongMap!12247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3372 (array!57522 array!57520 (_ BitVec 32) (_ BitVec 32) V!32633 V!32633 (_ BitVec 32) Int) ListLongMap!12247)

(assert (=> b!950312 (= res!637153 (contains!5230 (getCurrentListMap!3372 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141)) key!756))))

(declare-fun res!637155 () Bool)

(assert (=> start!81208 (=> (not res!637155) (not e!535033))))

(declare-fun valid!1877 (LongMapFixedSize!4938) Bool)

(assert (=> start!81208 (= res!637155 (valid!1877 thiss!1141))))

(assert (=> start!81208 e!535033))

(declare-fun e!535034 () Bool)

(assert (=> start!81208 e!535034))

(assert (=> start!81208 true))

(declare-fun mapNonEmpty!33038 () Bool)

(declare-fun mapRes!33038 () Bool)

(declare-fun tp!63325 () Bool)

(assert (=> mapNonEmpty!33038 (= mapRes!33038 (and tp!63325 e!535031))))

(declare-fun mapValue!33038 () ValueCell!9894)

(declare-fun mapRest!33038 () (Array (_ BitVec 32) ValueCell!9894))

(declare-fun mapKey!33038 () (_ BitVec 32))

(assert (=> mapNonEmpty!33038 (= (arr!27660 (_values!5803 thiss!1141)) (store mapRest!33038 mapKey!33038 mapValue!33038))))

(declare-fun e!535035 () Bool)

(declare-fun array_inv!21468 (array!57522) Bool)

(declare-fun array_inv!21469 (array!57520) Bool)

(assert (=> b!950313 (= e!535034 (and tp!63324 tp_is_empty!20751 (array_inv!21468 (_keys!10716 thiss!1141)) (array_inv!21469 (_values!5803 thiss!1141)) e!535035))))

(declare-fun mapIsEmpty!33038 () Bool)

(assert (=> mapIsEmpty!33038 mapRes!33038))

(declare-fun b!950314 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950314 (= e!535033 (not (validMask!0 (mask!27580 thiss!1141))))))

(declare-fun lt!427950 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57522 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950314 (= lt!427950 (arrayScanForKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950314 (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31989 0))(
  ( (Unit!31990) )
))
(declare-fun lt!427949 () Unit!31989)

(declare-fun lemmaKeyInListMapIsInArray!319 (array!57522 array!57520 (_ BitVec 32) (_ BitVec 32) V!32633 V!32633 (_ BitVec 64) Int) Unit!31989)

(assert (=> b!950314 (= lt!427949 (lemmaKeyInListMapIsInArray!319 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) key!756 (defaultEntry!5780 thiss!1141)))))

(declare-fun b!950315 () Bool)

(declare-fun e!535032 () Bool)

(assert (=> b!950315 (= e!535035 (and e!535032 mapRes!33038))))

(declare-fun condMapEmpty!33038 () Bool)

(declare-fun mapDefault!33038 () ValueCell!9894)

(assert (=> b!950315 (= condMapEmpty!33038 (= (arr!27660 (_values!5803 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9894)) mapDefault!33038)))))

(declare-fun b!950316 () Bool)

(declare-fun res!637156 () Bool)

(assert (=> b!950316 (=> (not res!637156) (not e!535033))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9141 0))(
  ( (MissingZero!9141 (index!38935 (_ BitVec 32))) (Found!9141 (index!38936 (_ BitVec 32))) (Intermediate!9141 (undefined!9953 Bool) (index!38937 (_ BitVec 32)) (x!81759 (_ BitVec 32))) (Undefined!9141) (MissingVacant!9141 (index!38938 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57522 (_ BitVec 32)) SeekEntryResult!9141)

(assert (=> b!950316 (= res!637156 (not ((_ is Found!9141) (seekEntry!0 key!756 (_keys!10716 thiss!1141) (mask!27580 thiss!1141)))))))

(declare-fun b!950317 () Bool)

(assert (=> b!950317 (= e!535032 tp_is_empty!20751)))

(declare-fun b!950318 () Bool)

(declare-fun res!637154 () Bool)

(assert (=> b!950318 (=> (not res!637154) (not e!535033))))

(assert (=> b!950318 (= res!637154 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!81208 res!637155) b!950318))

(assert (= (and b!950318 res!637154) b!950316))

(assert (= (and b!950316 res!637156) b!950312))

(assert (= (and b!950312 res!637153) b!950314))

(assert (= (and b!950315 condMapEmpty!33038) mapIsEmpty!33038))

(assert (= (and b!950315 (not condMapEmpty!33038)) mapNonEmpty!33038))

(assert (= (and mapNonEmpty!33038 ((_ is ValueCellFull!9894) mapValue!33038)) b!950311))

(assert (= (and b!950315 ((_ is ValueCellFull!9894) mapDefault!33038)) b!950317))

(assert (= b!950313 b!950315))

(assert (= start!81208 b!950313))

(declare-fun m!882753 () Bool)

(assert (=> b!950312 m!882753))

(assert (=> b!950312 m!882753))

(declare-fun m!882755 () Bool)

(assert (=> b!950312 m!882755))

(declare-fun m!882757 () Bool)

(assert (=> start!81208 m!882757))

(declare-fun m!882759 () Bool)

(assert (=> b!950316 m!882759))

(declare-fun m!882761 () Bool)

(assert (=> mapNonEmpty!33038 m!882761))

(declare-fun m!882763 () Bool)

(assert (=> b!950314 m!882763))

(declare-fun m!882765 () Bool)

(assert (=> b!950314 m!882765))

(declare-fun m!882767 () Bool)

(assert (=> b!950314 m!882767))

(declare-fun m!882769 () Bool)

(assert (=> b!950314 m!882769))

(declare-fun m!882771 () Bool)

(assert (=> b!950313 m!882771))

(declare-fun m!882773 () Bool)

(assert (=> b!950313 m!882773))

(check-sat (not b_next!18243) (not b!950312) (not start!81208) tp_is_empty!20751 (not b!950316) (not b!950314) (not mapNonEmpty!33038) (not b!950313) b_and!29699)
(check-sat b_and!29699 (not b_next!18243))
(get-model)

(declare-fun d!115167 () Bool)

(assert (=> d!115167 (= (array_inv!21468 (_keys!10716 thiss!1141)) (bvsge (size!28138 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950313 d!115167))

(declare-fun d!115169 () Bool)

(assert (=> d!115169 (= (array_inv!21469 (_values!5803 thiss!1141)) (bvsge (size!28137 (_values!5803 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950313 d!115169))

(declare-fun d!115171 () Bool)

(assert (=> d!115171 (= (validMask!0 (mask!27580 thiss!1141)) (and (or (= (mask!27580 thiss!1141) #b00000000000000000000000000000111) (= (mask!27580 thiss!1141) #b00000000000000000000000000001111) (= (mask!27580 thiss!1141) #b00000000000000000000000000011111) (= (mask!27580 thiss!1141) #b00000000000000000000000000111111) (= (mask!27580 thiss!1141) #b00000000000000000000000001111111) (= (mask!27580 thiss!1141) #b00000000000000000000000011111111) (= (mask!27580 thiss!1141) #b00000000000000000000000111111111) (= (mask!27580 thiss!1141) #b00000000000000000000001111111111) (= (mask!27580 thiss!1141) #b00000000000000000000011111111111) (= (mask!27580 thiss!1141) #b00000000000000000000111111111111) (= (mask!27580 thiss!1141) #b00000000000000000001111111111111) (= (mask!27580 thiss!1141) #b00000000000000000011111111111111) (= (mask!27580 thiss!1141) #b00000000000000000111111111111111) (= (mask!27580 thiss!1141) #b00000000000000001111111111111111) (= (mask!27580 thiss!1141) #b00000000000000011111111111111111) (= (mask!27580 thiss!1141) #b00000000000000111111111111111111) (= (mask!27580 thiss!1141) #b00000000000001111111111111111111) (= (mask!27580 thiss!1141) #b00000000000011111111111111111111) (= (mask!27580 thiss!1141) #b00000000000111111111111111111111) (= (mask!27580 thiss!1141) #b00000000001111111111111111111111) (= (mask!27580 thiss!1141) #b00000000011111111111111111111111) (= (mask!27580 thiss!1141) #b00000000111111111111111111111111) (= (mask!27580 thiss!1141) #b00000001111111111111111111111111) (= (mask!27580 thiss!1141) #b00000011111111111111111111111111) (= (mask!27580 thiss!1141) #b00000111111111111111111111111111) (= (mask!27580 thiss!1141) #b00001111111111111111111111111111) (= (mask!27580 thiss!1141) #b00011111111111111111111111111111) (= (mask!27580 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27580 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950314 d!115171))

(declare-fun d!115173 () Bool)

(declare-fun lt!427959 () (_ BitVec 32))

(assert (=> d!115173 (and (or (bvslt lt!427959 #b00000000000000000000000000000000) (bvsge lt!427959 (size!28138 (_keys!10716 thiss!1141))) (and (bvsge lt!427959 #b00000000000000000000000000000000) (bvslt lt!427959 (size!28138 (_keys!10716 thiss!1141))))) (bvsge lt!427959 #b00000000000000000000000000000000) (bvslt lt!427959 (size!28138 (_keys!10716 thiss!1141))) (= (select (arr!27661 (_keys!10716 thiss!1141)) lt!427959) key!756))))

(declare-fun e!535056 () (_ BitVec 32))

(assert (=> d!115173 (= lt!427959 e!535056)))

(declare-fun c!99220 () Bool)

(assert (=> d!115173 (= c!99220 (= (select (arr!27661 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28138 (_keys!10716 thiss!1141))) (bvslt (size!28138 (_keys!10716 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115173 (= (arrayScanForKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000) lt!427959)))

(declare-fun b!950347 () Bool)

(assert (=> b!950347 (= e!535056 #b00000000000000000000000000000000)))

(declare-fun b!950348 () Bool)

(assert (=> b!950348 (= e!535056 (arrayScanForKey!0 (_keys!10716 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115173 c!99220) b!950347))

(assert (= (and d!115173 (not c!99220)) b!950348))

(declare-fun m!882797 () Bool)

(assert (=> d!115173 m!882797))

(declare-fun m!882799 () Bool)

(assert (=> d!115173 m!882799))

(declare-fun m!882801 () Bool)

(assert (=> b!950348 m!882801))

(assert (=> b!950314 d!115173))

(declare-fun d!115175 () Bool)

(declare-fun res!637173 () Bool)

(declare-fun e!535061 () Bool)

(assert (=> d!115175 (=> res!637173 e!535061)))

(assert (=> d!115175 (= res!637173 (= (select (arr!27661 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115175 (= (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000) e!535061)))

(declare-fun b!950353 () Bool)

(declare-fun e!535062 () Bool)

(assert (=> b!950353 (= e!535061 e!535062)))

(declare-fun res!637174 () Bool)

(assert (=> b!950353 (=> (not res!637174) (not e!535062))))

(assert (=> b!950353 (= res!637174 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28138 (_keys!10716 thiss!1141))))))

(declare-fun b!950354 () Bool)

(assert (=> b!950354 (= e!535062 (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115175 (not res!637173)) b!950353))

(assert (= (and b!950353 res!637174) b!950354))

(assert (=> d!115175 m!882799))

(declare-fun m!882803 () Bool)

(assert (=> b!950354 m!882803))

(assert (=> b!950314 d!115175))

(declare-fun d!115177 () Bool)

(declare-fun e!535065 () Bool)

(assert (=> d!115177 e!535065))

(declare-fun c!99223 () Bool)

(assert (=> d!115177 (= c!99223 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!427962 () Unit!31989)

(declare-fun choose!1584 (array!57522 array!57520 (_ BitVec 32) (_ BitVec 32) V!32633 V!32633 (_ BitVec 64) Int) Unit!31989)

(assert (=> d!115177 (= lt!427962 (choose!1584 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) key!756 (defaultEntry!5780 thiss!1141)))))

(assert (=> d!115177 (validMask!0 (mask!27580 thiss!1141))))

(assert (=> d!115177 (= (lemmaKeyInListMapIsInArray!319 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) key!756 (defaultEntry!5780 thiss!1141)) lt!427962)))

(declare-fun b!950359 () Bool)

(assert (=> b!950359 (= e!535065 (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!950360 () Bool)

(assert (=> b!950360 (= e!535065 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5512 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5512 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115177 c!99223) b!950359))

(assert (= (and d!115177 (not c!99223)) b!950360))

(declare-fun m!882805 () Bool)

(assert (=> d!115177 m!882805))

(assert (=> d!115177 m!882763))

(assert (=> b!950359 m!882767))

(assert (=> b!950314 d!115177))

(declare-fun d!115179 () Bool)

(declare-fun e!535071 () Bool)

(assert (=> d!115179 e!535071))

(declare-fun res!637177 () Bool)

(assert (=> d!115179 (=> res!637177 e!535071)))

(declare-fun lt!427973 () Bool)

(assert (=> d!115179 (= res!637177 (not lt!427973))))

(declare-fun lt!427972 () Bool)

(assert (=> d!115179 (= lt!427973 lt!427972)))

(declare-fun lt!427971 () Unit!31989)

(declare-fun e!535070 () Unit!31989)

(assert (=> d!115179 (= lt!427971 e!535070)))

(declare-fun c!99226 () Bool)

(assert (=> d!115179 (= c!99226 lt!427972)))

(declare-fun containsKey!464 (List!19340 (_ BitVec 64)) Bool)

(assert (=> d!115179 (= lt!427972 (containsKey!464 (toList!6139 (getCurrentListMap!3372 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141))) key!756))))

(assert (=> d!115179 (= (contains!5230 (getCurrentListMap!3372 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141)) key!756) lt!427973)))

(declare-fun b!950367 () Bool)

(declare-fun lt!427974 () Unit!31989)

(assert (=> b!950367 (= e!535070 lt!427974)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!360 (List!19340 (_ BitVec 64)) Unit!31989)

(assert (=> b!950367 (= lt!427974 (lemmaContainsKeyImpliesGetValueByKeyDefined!360 (toList!6139 (getCurrentListMap!3372 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141))) key!756))))

(declare-datatypes ((Option!503 0))(
  ( (Some!502 (v!12971 V!32633)) (None!501) )
))
(declare-fun isDefined!369 (Option!503) Bool)

(declare-fun getValueByKey!497 (List!19340 (_ BitVec 64)) Option!503)

(assert (=> b!950367 (isDefined!369 (getValueByKey!497 (toList!6139 (getCurrentListMap!3372 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141))) key!756))))

(declare-fun b!950368 () Bool)

(declare-fun Unit!31991 () Unit!31989)

(assert (=> b!950368 (= e!535070 Unit!31991)))

(declare-fun b!950369 () Bool)

(assert (=> b!950369 (= e!535071 (isDefined!369 (getValueByKey!497 (toList!6139 (getCurrentListMap!3372 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141))) key!756)))))

(assert (= (and d!115179 c!99226) b!950367))

(assert (= (and d!115179 (not c!99226)) b!950368))

(assert (= (and d!115179 (not res!637177)) b!950369))

(declare-fun m!882807 () Bool)

(assert (=> d!115179 m!882807))

(declare-fun m!882809 () Bool)

(assert (=> b!950367 m!882809))

(declare-fun m!882811 () Bool)

(assert (=> b!950367 m!882811))

(assert (=> b!950367 m!882811))

(declare-fun m!882813 () Bool)

(assert (=> b!950367 m!882813))

(assert (=> b!950369 m!882811))

(assert (=> b!950369 m!882811))

(assert (=> b!950369 m!882813))

(assert (=> b!950312 d!115179))

(declare-fun b!950412 () Bool)

(declare-fun e!535103 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!950412 (= e!535103 (validKeyInArray!0 (select (arr!27661 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950413 () Bool)

(declare-fun res!637197 () Bool)

(declare-fun e!535101 () Bool)

(assert (=> b!950413 (=> (not res!637197) (not e!535101))))

(declare-fun e!535105 () Bool)

(assert (=> b!950413 (= res!637197 e!535105)))

(declare-fun c!99242 () Bool)

(assert (=> b!950413 (= c!99242 (not (= (bvand (extraKeys!5512 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!950414 () Bool)

(declare-fun call!41390 () Bool)

(assert (=> b!950414 (= e!535105 (not call!41390))))

(declare-fun b!950415 () Bool)

(declare-fun e!535102 () ListLongMap!12247)

(declare-fun e!535104 () ListLongMap!12247)

(assert (=> b!950415 (= e!535102 e!535104)))

(declare-fun c!99244 () Bool)

(assert (=> b!950415 (= c!99244 (and (not (= (bvand (extraKeys!5512 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5512 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950416 () Bool)

(declare-fun call!41388 () ListLongMap!12247)

(declare-fun +!2862 (ListLongMap!12247 tuple2!13550) ListLongMap!12247)

(assert (=> b!950416 (= e!535102 (+!2862 call!41388 (tuple2!13551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5616 thiss!1141))))))

(declare-fun b!950417 () Bool)

(declare-fun e!535108 () Bool)

(assert (=> b!950417 (= e!535101 e!535108)))

(declare-fun c!99240 () Bool)

(assert (=> b!950417 (= c!99240 (not (= (bvand (extraKeys!5512 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950418 () Bool)

(declare-fun e!535099 () Bool)

(declare-fun lt!428040 () ListLongMap!12247)

(declare-fun apply!878 (ListLongMap!12247 (_ BitVec 64)) V!32633)

(assert (=> b!950418 (= e!535099 (= (apply!878 lt!428040 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5616 thiss!1141)))))

(declare-fun b!950419 () Bool)

(declare-fun e!535098 () Bool)

(declare-fun get!14535 (ValueCell!9894 V!32633) V!32633)

(declare-fun dynLambda!1651 (Int (_ BitVec 64)) V!32633)

(assert (=> b!950419 (= e!535098 (= (apply!878 lt!428040 (select (arr!27661 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)) (get!14535 (select (arr!27660 (_values!5803 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1651 (defaultEntry!5780 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28137 (_values!5803 thiss!1141))))))

(assert (=> b!950419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28138 (_keys!10716 thiss!1141))))))

(declare-fun b!950420 () Bool)

(declare-fun c!99241 () Bool)

(assert (=> b!950420 (= c!99241 (and (not (= (bvand (extraKeys!5512 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5512 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!535107 () ListLongMap!12247)

(assert (=> b!950420 (= e!535104 e!535107)))

(declare-fun b!950421 () Bool)

(declare-fun e!535110 () Unit!31989)

(declare-fun Unit!31992 () Unit!31989)

(assert (=> b!950421 (= e!535110 Unit!31992)))

(declare-fun b!950422 () Bool)

(declare-fun call!41387 () ListLongMap!12247)

(assert (=> b!950422 (= e!535104 call!41387)))

(declare-fun b!950423 () Bool)

(assert (=> b!950423 (= e!535105 e!535099)))

(declare-fun res!637200 () Bool)

(assert (=> b!950423 (= res!637200 call!41390)))

(assert (=> b!950423 (=> (not res!637200) (not e!535099))))

(declare-fun b!950424 () Bool)

(declare-fun e!535100 () Bool)

(assert (=> b!950424 (= e!535100 (= (apply!878 lt!428040 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5616 thiss!1141)))))

(declare-fun bm!41382 () Bool)

(declare-fun call!41391 () ListLongMap!12247)

(declare-fun call!41386 () ListLongMap!12247)

(assert (=> bm!41382 (= call!41391 call!41386)))

(declare-fun bm!41383 () Bool)

(assert (=> bm!41383 (= call!41387 call!41388)))

(declare-fun bm!41384 () Bool)

(declare-fun call!41385 () ListLongMap!12247)

(assert (=> bm!41384 (= call!41386 call!41385)))

(declare-fun b!950425 () Bool)

(assert (=> b!950425 (= e!535107 call!41391)))

(declare-fun c!99243 () Bool)

(declare-fun bm!41385 () Bool)

(assert (=> bm!41385 (= call!41388 (+!2862 (ite c!99243 call!41385 (ite c!99244 call!41386 call!41391)) (ite (or c!99243 c!99244) (tuple2!13551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5616 thiss!1141)) (tuple2!13551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5616 thiss!1141)))))))

(declare-fun bm!41386 () Bool)

(declare-fun call!41389 () Bool)

(assert (=> bm!41386 (= call!41389 (contains!5230 lt!428040 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950426 () Bool)

(assert (=> b!950426 (= e!535107 call!41387)))

(declare-fun b!950427 () Bool)

(declare-fun res!637198 () Bool)

(assert (=> b!950427 (=> (not res!637198) (not e!535101))))

(declare-fun e!535106 () Bool)

(assert (=> b!950427 (= res!637198 e!535106)))

(declare-fun res!637196 () Bool)

(assert (=> b!950427 (=> res!637196 e!535106)))

(declare-fun e!535109 () Bool)

(assert (=> b!950427 (= res!637196 (not e!535109))))

(declare-fun res!637204 () Bool)

(assert (=> b!950427 (=> (not res!637204) (not e!535109))))

(assert (=> b!950427 (= res!637204 (bvslt #b00000000000000000000000000000000 (size!28138 (_keys!10716 thiss!1141))))))

(declare-fun bm!41387 () Bool)

(assert (=> bm!41387 (= call!41390 (contains!5230 lt!428040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41388 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3317 (array!57522 array!57520 (_ BitVec 32) (_ BitVec 32) V!32633 V!32633 (_ BitVec 32) Int) ListLongMap!12247)

(assert (=> bm!41388 (= call!41385 (getCurrentListMapNoExtraKeys!3317 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141)))))

(declare-fun b!950428 () Bool)

(assert (=> b!950428 (= e!535108 (not call!41389))))

(declare-fun b!950429 () Bool)

(declare-fun lt!428020 () Unit!31989)

(assert (=> b!950429 (= e!535110 lt!428020)))

(declare-fun lt!428038 () ListLongMap!12247)

(assert (=> b!950429 (= lt!428038 (getCurrentListMapNoExtraKeys!3317 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141)))))

(declare-fun lt!428034 () (_ BitVec 64))

(assert (=> b!950429 (= lt!428034 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428030 () (_ BitVec 64))

(assert (=> b!950429 (= lt!428030 (select (arr!27661 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428035 () Unit!31989)

(declare-fun addStillContains!581 (ListLongMap!12247 (_ BitVec 64) V!32633 (_ BitVec 64)) Unit!31989)

(assert (=> b!950429 (= lt!428035 (addStillContains!581 lt!428038 lt!428034 (zeroValue!5616 thiss!1141) lt!428030))))

(assert (=> b!950429 (contains!5230 (+!2862 lt!428038 (tuple2!13551 lt!428034 (zeroValue!5616 thiss!1141))) lt!428030)))

(declare-fun lt!428022 () Unit!31989)

(assert (=> b!950429 (= lt!428022 lt!428035)))

(declare-fun lt!428026 () ListLongMap!12247)

(assert (=> b!950429 (= lt!428026 (getCurrentListMapNoExtraKeys!3317 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141)))))

(declare-fun lt!428023 () (_ BitVec 64))

(assert (=> b!950429 (= lt!428023 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428032 () (_ BitVec 64))

(assert (=> b!950429 (= lt!428032 (select (arr!27661 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428024 () Unit!31989)

(declare-fun addApplyDifferent!461 (ListLongMap!12247 (_ BitVec 64) V!32633 (_ BitVec 64)) Unit!31989)

(assert (=> b!950429 (= lt!428024 (addApplyDifferent!461 lt!428026 lt!428023 (minValue!5616 thiss!1141) lt!428032))))

(assert (=> b!950429 (= (apply!878 (+!2862 lt!428026 (tuple2!13551 lt!428023 (minValue!5616 thiss!1141))) lt!428032) (apply!878 lt!428026 lt!428032))))

(declare-fun lt!428031 () Unit!31989)

(assert (=> b!950429 (= lt!428031 lt!428024)))

(declare-fun lt!428021 () ListLongMap!12247)

(assert (=> b!950429 (= lt!428021 (getCurrentListMapNoExtraKeys!3317 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141)))))

(declare-fun lt!428036 () (_ BitVec 64))

(assert (=> b!950429 (= lt!428036 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428037 () (_ BitVec 64))

(assert (=> b!950429 (= lt!428037 (select (arr!27661 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428019 () Unit!31989)

(assert (=> b!950429 (= lt!428019 (addApplyDifferent!461 lt!428021 lt!428036 (zeroValue!5616 thiss!1141) lt!428037))))

(assert (=> b!950429 (= (apply!878 (+!2862 lt!428021 (tuple2!13551 lt!428036 (zeroValue!5616 thiss!1141))) lt!428037) (apply!878 lt!428021 lt!428037))))

(declare-fun lt!428027 () Unit!31989)

(assert (=> b!950429 (= lt!428027 lt!428019)))

(declare-fun lt!428039 () ListLongMap!12247)

(assert (=> b!950429 (= lt!428039 (getCurrentListMapNoExtraKeys!3317 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141)))))

(declare-fun lt!428033 () (_ BitVec 64))

(assert (=> b!950429 (= lt!428033 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428028 () (_ BitVec 64))

(assert (=> b!950429 (= lt!428028 (select (arr!27661 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950429 (= lt!428020 (addApplyDifferent!461 lt!428039 lt!428033 (minValue!5616 thiss!1141) lt!428028))))

(assert (=> b!950429 (= (apply!878 (+!2862 lt!428039 (tuple2!13551 lt!428033 (minValue!5616 thiss!1141))) lt!428028) (apply!878 lt!428039 lt!428028))))

(declare-fun b!950430 () Bool)

(assert (=> b!950430 (= e!535108 e!535100)))

(declare-fun res!637202 () Bool)

(assert (=> b!950430 (= res!637202 call!41389)))

(assert (=> b!950430 (=> (not res!637202) (not e!535100))))

(declare-fun b!950431 () Bool)

(assert (=> b!950431 (= e!535106 e!535098)))

(declare-fun res!637199 () Bool)

(assert (=> b!950431 (=> (not res!637199) (not e!535098))))

(assert (=> b!950431 (= res!637199 (contains!5230 lt!428040 (select (arr!27661 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950431 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28138 (_keys!10716 thiss!1141))))))

(declare-fun b!950432 () Bool)

(assert (=> b!950432 (= e!535109 (validKeyInArray!0 (select (arr!27661 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115181 () Bool)

(assert (=> d!115181 e!535101))

(declare-fun res!637201 () Bool)

(assert (=> d!115181 (=> (not res!637201) (not e!535101))))

(assert (=> d!115181 (= res!637201 (or (bvsge #b00000000000000000000000000000000 (size!28138 (_keys!10716 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28138 (_keys!10716 thiss!1141))))))))

(declare-fun lt!428029 () ListLongMap!12247)

(assert (=> d!115181 (= lt!428040 lt!428029)))

(declare-fun lt!428025 () Unit!31989)

(assert (=> d!115181 (= lt!428025 e!535110)))

(declare-fun c!99239 () Bool)

(assert (=> d!115181 (= c!99239 e!535103)))

(declare-fun res!637203 () Bool)

(assert (=> d!115181 (=> (not res!637203) (not e!535103))))

(assert (=> d!115181 (= res!637203 (bvslt #b00000000000000000000000000000000 (size!28138 (_keys!10716 thiss!1141))))))

(assert (=> d!115181 (= lt!428029 e!535102)))

(assert (=> d!115181 (= c!99243 (and (not (= (bvand (extraKeys!5512 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5512 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115181 (validMask!0 (mask!27580 thiss!1141))))

(assert (=> d!115181 (= (getCurrentListMap!3372 (_keys!10716 thiss!1141) (_values!5803 thiss!1141) (mask!27580 thiss!1141) (extraKeys!5512 thiss!1141) (zeroValue!5616 thiss!1141) (minValue!5616 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5780 thiss!1141)) lt!428040)))

(assert (= (and d!115181 c!99243) b!950416))

(assert (= (and d!115181 (not c!99243)) b!950415))

(assert (= (and b!950415 c!99244) b!950422))

(assert (= (and b!950415 (not c!99244)) b!950420))

(assert (= (and b!950420 c!99241) b!950426))

(assert (= (and b!950420 (not c!99241)) b!950425))

(assert (= (or b!950426 b!950425) bm!41382))

(assert (= (or b!950422 bm!41382) bm!41384))

(assert (= (or b!950422 b!950426) bm!41383))

(assert (= (or b!950416 bm!41384) bm!41388))

(assert (= (or b!950416 bm!41383) bm!41385))

(assert (= (and d!115181 res!637203) b!950412))

(assert (= (and d!115181 c!99239) b!950429))

(assert (= (and d!115181 (not c!99239)) b!950421))

(assert (= (and d!115181 res!637201) b!950427))

(assert (= (and b!950427 res!637204) b!950432))

(assert (= (and b!950427 (not res!637196)) b!950431))

(assert (= (and b!950431 res!637199) b!950419))

(assert (= (and b!950427 res!637198) b!950413))

(assert (= (and b!950413 c!99242) b!950423))

(assert (= (and b!950413 (not c!99242)) b!950414))

(assert (= (and b!950423 res!637200) b!950418))

(assert (= (or b!950423 b!950414) bm!41387))

(assert (= (and b!950413 res!637197) b!950417))

(assert (= (and b!950417 c!99240) b!950430))

(assert (= (and b!950417 (not c!99240)) b!950428))

(assert (= (and b!950430 res!637202) b!950424))

(assert (= (or b!950430 b!950428) bm!41386))

(declare-fun b_lambda!14367 () Bool)

(assert (=> (not b_lambda!14367) (not b!950419)))

(declare-fun t!27682 () Bool)

(declare-fun tb!6191 () Bool)

(assert (=> (and b!950313 (= (defaultEntry!5780 thiss!1141) (defaultEntry!5780 thiss!1141)) t!27682) tb!6191))

(declare-fun result!12295 () Bool)

(assert (=> tb!6191 (= result!12295 tp_is_empty!20751)))

(assert (=> b!950419 t!27682))

(declare-fun b_and!29703 () Bool)

(assert (= b_and!29699 (and (=> t!27682 result!12295) b_and!29703)))

(assert (=> b!950431 m!882799))

(assert (=> b!950431 m!882799))

(declare-fun m!882815 () Bool)

(assert (=> b!950431 m!882815))

(declare-fun m!882817 () Bool)

(assert (=> bm!41386 m!882817))

(declare-fun m!882819 () Bool)

(assert (=> b!950424 m!882819))

(declare-fun m!882821 () Bool)

(assert (=> b!950418 m!882821))

(assert (=> b!950412 m!882799))

(assert (=> b!950412 m!882799))

(declare-fun m!882823 () Bool)

(assert (=> b!950412 m!882823))

(declare-fun m!882825 () Bool)

(assert (=> b!950429 m!882825))

(declare-fun m!882827 () Bool)

(assert (=> b!950429 m!882827))

(declare-fun m!882829 () Bool)

(assert (=> b!950429 m!882829))

(declare-fun m!882831 () Bool)

(assert (=> b!950429 m!882831))

(declare-fun m!882833 () Bool)

(assert (=> b!950429 m!882833))

(declare-fun m!882835 () Bool)

(assert (=> b!950429 m!882835))

(declare-fun m!882837 () Bool)

(assert (=> b!950429 m!882837))

(declare-fun m!882839 () Bool)

(assert (=> b!950429 m!882839))

(declare-fun m!882841 () Bool)

(assert (=> b!950429 m!882841))

(declare-fun m!882843 () Bool)

(assert (=> b!950429 m!882843))

(assert (=> b!950429 m!882843))

(declare-fun m!882845 () Bool)

(assert (=> b!950429 m!882845))

(assert (=> b!950429 m!882827))

(declare-fun m!882847 () Bool)

(assert (=> b!950429 m!882847))

(declare-fun m!882849 () Bool)

(assert (=> b!950429 m!882849))

(assert (=> b!950429 m!882799))

(assert (=> b!950429 m!882835))

(declare-fun m!882851 () Bool)

(assert (=> b!950429 m!882851))

(declare-fun m!882853 () Bool)

(assert (=> b!950429 m!882853))

(declare-fun m!882855 () Bool)

(assert (=> b!950429 m!882855))

(assert (=> b!950429 m!882839))

(declare-fun m!882857 () Bool)

(assert (=> b!950416 m!882857))

(declare-fun m!882859 () Bool)

(assert (=> bm!41387 m!882859))

(declare-fun m!882861 () Bool)

(assert (=> bm!41385 m!882861))

(assert (=> b!950419 m!882799))

(declare-fun m!882863 () Bool)

(assert (=> b!950419 m!882863))

(declare-fun m!882865 () Bool)

(assert (=> b!950419 m!882865))

(declare-fun m!882867 () Bool)

(assert (=> b!950419 m!882867))

(assert (=> b!950419 m!882865))

(declare-fun m!882869 () Bool)

(assert (=> b!950419 m!882869))

(assert (=> b!950419 m!882799))

(assert (=> b!950419 m!882867))

(assert (=> bm!41388 m!882831))

(assert (=> b!950432 m!882799))

(assert (=> b!950432 m!882799))

(assert (=> b!950432 m!882823))

(assert (=> d!115181 m!882763))

(assert (=> b!950312 d!115181))

(declare-fun d!115183 () Bool)

(declare-fun res!637211 () Bool)

(declare-fun e!535113 () Bool)

(assert (=> d!115183 (=> (not res!637211) (not e!535113))))

(declare-fun simpleValid!374 (LongMapFixedSize!4938) Bool)

(assert (=> d!115183 (= res!637211 (simpleValid!374 thiss!1141))))

(assert (=> d!115183 (= (valid!1877 thiss!1141) e!535113)))

(declare-fun b!950441 () Bool)

(declare-fun res!637212 () Bool)

(assert (=> b!950441 (=> (not res!637212) (not e!535113))))

(declare-fun arrayCountValidKeys!0 (array!57522 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950441 (= res!637212 (= (arrayCountValidKeys!0 (_keys!10716 thiss!1141) #b00000000000000000000000000000000 (size!28138 (_keys!10716 thiss!1141))) (_size!2524 thiss!1141)))))

(declare-fun b!950442 () Bool)

(declare-fun res!637213 () Bool)

(assert (=> b!950442 (=> (not res!637213) (not e!535113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57522 (_ BitVec 32)) Bool)

(assert (=> b!950442 (= res!637213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10716 thiss!1141) (mask!27580 thiss!1141)))))

(declare-fun b!950443 () Bool)

(declare-datatypes ((List!19342 0))(
  ( (Nil!19339) (Cons!19338 (h!20498 (_ BitVec 64)) (t!27683 List!19342)) )
))
(declare-fun arrayNoDuplicates!0 (array!57522 (_ BitVec 32) List!19342) Bool)

(assert (=> b!950443 (= e!535113 (arrayNoDuplicates!0 (_keys!10716 thiss!1141) #b00000000000000000000000000000000 Nil!19339))))

(assert (= (and d!115183 res!637211) b!950441))

(assert (= (and b!950441 res!637212) b!950442))

(assert (= (and b!950442 res!637213) b!950443))

(declare-fun m!882871 () Bool)

(assert (=> d!115183 m!882871))

(declare-fun m!882873 () Bool)

(assert (=> b!950441 m!882873))

(declare-fun m!882875 () Bool)

(assert (=> b!950442 m!882875))

(declare-fun m!882877 () Bool)

(assert (=> b!950443 m!882877))

(assert (=> start!81208 d!115183))

(declare-fun b!950456 () Bool)

(declare-fun e!535120 () SeekEntryResult!9141)

(assert (=> b!950456 (= e!535120 Undefined!9141)))

(declare-fun b!950457 () Bool)

(declare-fun e!535121 () SeekEntryResult!9141)

(assert (=> b!950457 (= e!535120 e!535121)))

(declare-fun lt!428051 () (_ BitVec 64))

(declare-fun lt!428050 () SeekEntryResult!9141)

(assert (=> b!950457 (= lt!428051 (select (arr!27661 (_keys!10716 thiss!1141)) (index!38937 lt!428050)))))

(declare-fun c!99253 () Bool)

(assert (=> b!950457 (= c!99253 (= lt!428051 key!756))))

(declare-fun b!950458 () Bool)

(declare-fun e!535122 () SeekEntryResult!9141)

(assert (=> b!950458 (= e!535122 (MissingZero!9141 (index!38937 lt!428050)))))

(declare-fun b!950459 () Bool)

(declare-fun c!99252 () Bool)

(assert (=> b!950459 (= c!99252 (= lt!428051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950459 (= e!535121 e!535122)))

(declare-fun d!115185 () Bool)

(declare-fun lt!428052 () SeekEntryResult!9141)

(assert (=> d!115185 (and (or ((_ is MissingVacant!9141) lt!428052) (not ((_ is Found!9141) lt!428052)) (and (bvsge (index!38936 lt!428052) #b00000000000000000000000000000000) (bvslt (index!38936 lt!428052) (size!28138 (_keys!10716 thiss!1141))))) (not ((_ is MissingVacant!9141) lt!428052)) (or (not ((_ is Found!9141) lt!428052)) (= (select (arr!27661 (_keys!10716 thiss!1141)) (index!38936 lt!428052)) key!756)))))

(assert (=> d!115185 (= lt!428052 e!535120)))

(declare-fun c!99251 () Bool)

(assert (=> d!115185 (= c!99251 (and ((_ is Intermediate!9141) lt!428050) (undefined!9953 lt!428050)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57522 (_ BitVec 32)) SeekEntryResult!9141)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115185 (= lt!428050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27580 thiss!1141)) key!756 (_keys!10716 thiss!1141) (mask!27580 thiss!1141)))))

(assert (=> d!115185 (validMask!0 (mask!27580 thiss!1141))))

(assert (=> d!115185 (= (seekEntry!0 key!756 (_keys!10716 thiss!1141) (mask!27580 thiss!1141)) lt!428052)))

(declare-fun b!950460 () Bool)

(assert (=> b!950460 (= e!535121 (Found!9141 (index!38937 lt!428050)))))

(declare-fun b!950461 () Bool)

(declare-fun lt!428049 () SeekEntryResult!9141)

(assert (=> b!950461 (= e!535122 (ite ((_ is MissingVacant!9141) lt!428049) (MissingZero!9141 (index!38938 lt!428049)) lt!428049))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57522 (_ BitVec 32)) SeekEntryResult!9141)

(assert (=> b!950461 (= lt!428049 (seekKeyOrZeroReturnVacant!0 (x!81759 lt!428050) (index!38937 lt!428050) (index!38937 lt!428050) key!756 (_keys!10716 thiss!1141) (mask!27580 thiss!1141)))))

(assert (= (and d!115185 c!99251) b!950456))

(assert (= (and d!115185 (not c!99251)) b!950457))

(assert (= (and b!950457 c!99253) b!950460))

(assert (= (and b!950457 (not c!99253)) b!950459))

(assert (= (and b!950459 c!99252) b!950458))

(assert (= (and b!950459 (not c!99252)) b!950461))

(declare-fun m!882879 () Bool)

(assert (=> b!950457 m!882879))

(declare-fun m!882881 () Bool)

(assert (=> d!115185 m!882881))

(declare-fun m!882883 () Bool)

(assert (=> d!115185 m!882883))

(assert (=> d!115185 m!882883))

(declare-fun m!882885 () Bool)

(assert (=> d!115185 m!882885))

(assert (=> d!115185 m!882763))

(declare-fun m!882887 () Bool)

(assert (=> b!950461 m!882887))

(assert (=> b!950316 d!115185))

(declare-fun b!950468 () Bool)

(declare-fun e!535128 () Bool)

(assert (=> b!950468 (= e!535128 tp_is_empty!20751)))

(declare-fun b!950469 () Bool)

(declare-fun e!535127 () Bool)

(assert (=> b!950469 (= e!535127 tp_is_empty!20751)))

(declare-fun mapIsEmpty!33044 () Bool)

(declare-fun mapRes!33044 () Bool)

(assert (=> mapIsEmpty!33044 mapRes!33044))

(declare-fun condMapEmpty!33044 () Bool)

(declare-fun mapDefault!33044 () ValueCell!9894)

(assert (=> mapNonEmpty!33038 (= condMapEmpty!33044 (= mapRest!33038 ((as const (Array (_ BitVec 32) ValueCell!9894)) mapDefault!33044)))))

(assert (=> mapNonEmpty!33038 (= tp!63325 (and e!535127 mapRes!33044))))

(declare-fun mapNonEmpty!33044 () Bool)

(declare-fun tp!63334 () Bool)

(assert (=> mapNonEmpty!33044 (= mapRes!33044 (and tp!63334 e!535128))))

(declare-fun mapValue!33044 () ValueCell!9894)

(declare-fun mapRest!33044 () (Array (_ BitVec 32) ValueCell!9894))

(declare-fun mapKey!33044 () (_ BitVec 32))

(assert (=> mapNonEmpty!33044 (= mapRest!33038 (store mapRest!33044 mapKey!33044 mapValue!33044))))

(assert (= (and mapNonEmpty!33038 condMapEmpty!33044) mapIsEmpty!33044))

(assert (= (and mapNonEmpty!33038 (not condMapEmpty!33044)) mapNonEmpty!33044))

(assert (= (and mapNonEmpty!33044 ((_ is ValueCellFull!9894) mapValue!33044)) b!950468))

(assert (= (and mapNonEmpty!33038 ((_ is ValueCellFull!9894) mapDefault!33044)) b!950469))

(declare-fun m!882889 () Bool)

(assert (=> mapNonEmpty!33044 m!882889))

(declare-fun b_lambda!14369 () Bool)

(assert (= b_lambda!14367 (or (and b!950313 b_free!18243) b_lambda!14369)))

(check-sat (not b!950367) (not b!950442) (not mapNonEmpty!33044) (not b!950429) (not b!950461) (not bm!41387) (not b!950416) (not d!115177) (not b!950443) b_and!29703 (not b!950424) (not d!115181) (not bm!41385) (not bm!41386) (not b_next!18243) (not bm!41388) (not b!950412) (not b!950369) (not b!950348) (not b!950432) (not b!950419) tp_is_empty!20751 (not d!115185) (not b!950418) (not d!115179) (not b!950431) (not b!950359) (not b_lambda!14369) (not b!950441) (not d!115183) (not b!950354))
(check-sat b_and!29703 (not b_next!18243))
