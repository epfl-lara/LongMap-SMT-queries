; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76140 () Bool)

(assert start!76140)

(declare-fun b!894346 () Bool)

(declare-fun b_free!15877 () Bool)

(declare-fun b_next!15877 () Bool)

(assert (=> b!894346 (= b_free!15877 (not b_next!15877))))

(declare-fun tp!55622 () Bool)

(declare-fun b_and!26143 () Bool)

(assert (=> b!894346 (= tp!55622 b_and!26143)))

(declare-fun b!894344 () Bool)

(declare-fun e!499549 () Bool)

(declare-fun e!499550 () Bool)

(declare-fun mapRes!28884 () Bool)

(assert (=> b!894344 (= e!499549 (and e!499550 mapRes!28884))))

(declare-fun condMapEmpty!28884 () Bool)

(declare-datatypes ((array!52385 0))(
  ( (array!52386 (arr!25193 (Array (_ BitVec 32) (_ BitVec 64))) (size!25641 (_ BitVec 32))) )
))
(declare-datatypes ((V!29239 0))(
  ( (V!29240 (val!9153 Int)) )
))
(declare-datatypes ((ValueCell!8621 0))(
  ( (ValueCellFull!8621 (v!11640 V!29239)) (EmptyCell!8621) )
))
(declare-datatypes ((array!52387 0))(
  ( (array!52388 (arr!25194 (Array (_ BitVec 32) ValueCell!8621)) (size!25642 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4258 0))(
  ( (LongMapFixedSize!4259 (defaultEntry!5341 Int) (mask!25897 (_ BitVec 32)) (extraKeys!5037 (_ BitVec 32)) (zeroValue!5141 V!29239) (minValue!5141 V!29239) (_size!2184 (_ BitVec 32)) (_keys!10034 array!52385) (_values!5328 array!52387) (_vacant!2184 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4258)

(declare-fun mapDefault!28884 () ValueCell!8621)

(assert (=> b!894344 (= condMapEmpty!28884 (= (arr!25194 (_values!5328 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8621)) mapDefault!28884)))))

(declare-fun res!605280 () Bool)

(declare-fun e!499551 () Bool)

(assert (=> start!76140 (=> (not res!605280) (not e!499551))))

(declare-fun valid!1654 (LongMapFixedSize!4258) Bool)

(assert (=> start!76140 (= res!605280 (valid!1654 thiss!1181))))

(assert (=> start!76140 e!499551))

(declare-fun e!499548 () Bool)

(assert (=> start!76140 e!499548))

(assert (=> start!76140 true))

(declare-fun b!894345 () Bool)

(declare-fun tp_is_empty!18205 () Bool)

(assert (=> b!894345 (= e!499550 tp_is_empty!18205)))

(declare-fun mapNonEmpty!28884 () Bool)

(declare-fun tp!55623 () Bool)

(declare-fun e!499547 () Bool)

(assert (=> mapNonEmpty!28884 (= mapRes!28884 (and tp!55623 e!499547))))

(declare-fun mapValue!28884 () ValueCell!8621)

(declare-fun mapRest!28884 () (Array (_ BitVec 32) ValueCell!8621))

(declare-fun mapKey!28884 () (_ BitVec 32))

(assert (=> mapNonEmpty!28884 (= (arr!25194 (_values!5328 thiss!1181)) (store mapRest!28884 mapKey!28884 mapValue!28884))))

(declare-fun array_inv!19838 (array!52385) Bool)

(declare-fun array_inv!19839 (array!52387) Bool)

(assert (=> b!894346 (= e!499548 (and tp!55622 tp_is_empty!18205 (array_inv!19838 (_keys!10034 thiss!1181)) (array_inv!19839 (_values!5328 thiss!1181)) e!499549))))

(declare-fun b!894347 () Bool)

(declare-fun res!605282 () Bool)

(assert (=> b!894347 (=> (not res!605282) (not e!499551))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!894347 (= res!605282 (not (= key!785 (bvneg key!785))))))

(declare-fun b!894348 () Bool)

(declare-fun e!499552 () Bool)

(assert (=> b!894348 (= e!499551 e!499552)))

(declare-fun res!605281 () Bool)

(assert (=> b!894348 (=> (not res!605281) (not e!499552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894348 (= res!605281 (validMask!0 (mask!25897 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8875 0))(
  ( (MissingZero!8875 (index!37871 (_ BitVec 32))) (Found!8875 (index!37872 (_ BitVec 32))) (Intermediate!8875 (undefined!9687 Bool) (index!37873 (_ BitVec 32)) (x!76066 (_ BitVec 32))) (Undefined!8875) (MissingVacant!8875 (index!37874 (_ BitVec 32))) )
))
(declare-fun lt!404072 () SeekEntryResult!8875)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52385 (_ BitVec 32)) SeekEntryResult!8875)

(assert (=> b!894348 (= lt!404072 (seekEntry!0 key!785 (_keys!10034 thiss!1181) (mask!25897 thiss!1181)))))

(declare-fun b!894349 () Bool)

(assert (=> b!894349 (= e!499552 (not (= (size!25642 (_values!5328 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25897 thiss!1181)))))))

(declare-fun mapIsEmpty!28884 () Bool)

(assert (=> mapIsEmpty!28884 mapRes!28884))

(declare-fun b!894350 () Bool)

(assert (=> b!894350 (= e!499547 tp_is_empty!18205)))

(assert (= (and start!76140 res!605280) b!894347))

(assert (= (and b!894347 res!605282) b!894348))

(assert (= (and b!894348 res!605281) b!894349))

(assert (= (and b!894344 condMapEmpty!28884) mapIsEmpty!28884))

(assert (= (and b!894344 (not condMapEmpty!28884)) mapNonEmpty!28884))

(get-info :version)

(assert (= (and mapNonEmpty!28884 ((_ is ValueCellFull!8621) mapValue!28884)) b!894350))

(assert (= (and b!894344 ((_ is ValueCellFull!8621) mapDefault!28884)) b!894345))

(assert (= b!894346 b!894344))

(assert (= start!76140 b!894346))

(declare-fun m!831839 () Bool)

(assert (=> start!76140 m!831839))

(declare-fun m!831841 () Bool)

(assert (=> mapNonEmpty!28884 m!831841))

(declare-fun m!831843 () Bool)

(assert (=> b!894346 m!831843))

(declare-fun m!831845 () Bool)

(assert (=> b!894346 m!831845))

(declare-fun m!831847 () Bool)

(assert (=> b!894348 m!831847))

(declare-fun m!831849 () Bool)

(assert (=> b!894348 m!831849))

(check-sat b_and!26143 (not b!894348) (not start!76140) (not b_next!15877) tp_is_empty!18205 (not b!894346) (not mapNonEmpty!28884))
(check-sat b_and!26143 (not b_next!15877))
(get-model)

(declare-fun d!110469 () Bool)

(assert (=> d!110469 (= (array_inv!19838 (_keys!10034 thiss!1181)) (bvsge (size!25641 (_keys!10034 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894346 d!110469))

(declare-fun d!110471 () Bool)

(assert (=> d!110471 (= (array_inv!19839 (_values!5328 thiss!1181)) (bvsge (size!25642 (_values!5328 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894346 d!110471))

(declare-fun d!110473 () Bool)

(assert (=> d!110473 (= (validMask!0 (mask!25897 thiss!1181)) (and (or (= (mask!25897 thiss!1181) #b00000000000000000000000000000111) (= (mask!25897 thiss!1181) #b00000000000000000000000000001111) (= (mask!25897 thiss!1181) #b00000000000000000000000000011111) (= (mask!25897 thiss!1181) #b00000000000000000000000000111111) (= (mask!25897 thiss!1181) #b00000000000000000000000001111111) (= (mask!25897 thiss!1181) #b00000000000000000000000011111111) (= (mask!25897 thiss!1181) #b00000000000000000000000111111111) (= (mask!25897 thiss!1181) #b00000000000000000000001111111111) (= (mask!25897 thiss!1181) #b00000000000000000000011111111111) (= (mask!25897 thiss!1181) #b00000000000000000000111111111111) (= (mask!25897 thiss!1181) #b00000000000000000001111111111111) (= (mask!25897 thiss!1181) #b00000000000000000011111111111111) (= (mask!25897 thiss!1181) #b00000000000000000111111111111111) (= (mask!25897 thiss!1181) #b00000000000000001111111111111111) (= (mask!25897 thiss!1181) #b00000000000000011111111111111111) (= (mask!25897 thiss!1181) #b00000000000000111111111111111111) (= (mask!25897 thiss!1181) #b00000000000001111111111111111111) (= (mask!25897 thiss!1181) #b00000000000011111111111111111111) (= (mask!25897 thiss!1181) #b00000000000111111111111111111111) (= (mask!25897 thiss!1181) #b00000000001111111111111111111111) (= (mask!25897 thiss!1181) #b00000000011111111111111111111111) (= (mask!25897 thiss!1181) #b00000000111111111111111111111111) (= (mask!25897 thiss!1181) #b00000001111111111111111111111111) (= (mask!25897 thiss!1181) #b00000011111111111111111111111111) (= (mask!25897 thiss!1181) #b00000111111111111111111111111111) (= (mask!25897 thiss!1181) #b00001111111111111111111111111111) (= (mask!25897 thiss!1181) #b00011111111111111111111111111111) (= (mask!25897 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25897 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!894348 d!110473))

(declare-fun b!894405 () Bool)

(declare-fun e!499602 () SeekEntryResult!8875)

(declare-fun e!499604 () SeekEntryResult!8875)

(assert (=> b!894405 (= e!499602 e!499604)))

(declare-fun lt!404088 () (_ BitVec 64))

(declare-fun lt!404089 () SeekEntryResult!8875)

(assert (=> b!894405 (= lt!404088 (select (arr!25193 (_keys!10034 thiss!1181)) (index!37873 lt!404089)))))

(declare-fun c!94352 () Bool)

(assert (=> b!894405 (= c!94352 (= lt!404088 key!785))))

(declare-fun b!894406 () Bool)

(assert (=> b!894406 (= e!499602 Undefined!8875)))

(declare-fun b!894408 () Bool)

(declare-fun e!499603 () SeekEntryResult!8875)

(assert (=> b!894408 (= e!499603 (MissingZero!8875 (index!37873 lt!404089)))))

(declare-fun b!894409 () Bool)

(declare-fun c!94353 () Bool)

(assert (=> b!894409 (= c!94353 (= lt!404088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894409 (= e!499604 e!499603)))

(declare-fun b!894410 () Bool)

(declare-fun lt!404087 () SeekEntryResult!8875)

(assert (=> b!894410 (= e!499603 (ite ((_ is MissingVacant!8875) lt!404087) (MissingZero!8875 (index!37874 lt!404087)) lt!404087))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52385 (_ BitVec 32)) SeekEntryResult!8875)

(assert (=> b!894410 (= lt!404087 (seekKeyOrZeroReturnVacant!0 (x!76066 lt!404089) (index!37873 lt!404089) (index!37873 lt!404089) key!785 (_keys!10034 thiss!1181) (mask!25897 thiss!1181)))))

(declare-fun d!110475 () Bool)

(declare-fun lt!404090 () SeekEntryResult!8875)

(assert (=> d!110475 (and (or ((_ is MissingVacant!8875) lt!404090) (not ((_ is Found!8875) lt!404090)) (and (bvsge (index!37872 lt!404090) #b00000000000000000000000000000000) (bvslt (index!37872 lt!404090) (size!25641 (_keys!10034 thiss!1181))))) (not ((_ is MissingVacant!8875) lt!404090)) (or (not ((_ is Found!8875) lt!404090)) (= (select (arr!25193 (_keys!10034 thiss!1181)) (index!37872 lt!404090)) key!785)))))

(assert (=> d!110475 (= lt!404090 e!499602)))

(declare-fun c!94351 () Bool)

(assert (=> d!110475 (= c!94351 (and ((_ is Intermediate!8875) lt!404089) (undefined!9687 lt!404089)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52385 (_ BitVec 32)) SeekEntryResult!8875)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110475 (= lt!404089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25897 thiss!1181)) key!785 (_keys!10034 thiss!1181) (mask!25897 thiss!1181)))))

(assert (=> d!110475 (validMask!0 (mask!25897 thiss!1181))))

(assert (=> d!110475 (= (seekEntry!0 key!785 (_keys!10034 thiss!1181) (mask!25897 thiss!1181)) lt!404090)))

(declare-fun b!894407 () Bool)

(assert (=> b!894407 (= e!499604 (Found!8875 (index!37873 lt!404089)))))

(assert (= (and d!110475 c!94351) b!894406))

(assert (= (and d!110475 (not c!94351)) b!894405))

(assert (= (and b!894405 c!94352) b!894407))

(assert (= (and b!894405 (not c!94352)) b!894409))

(assert (= (and b!894409 c!94353) b!894408))

(assert (= (and b!894409 (not c!94353)) b!894410))

(declare-fun m!831875 () Bool)

(assert (=> b!894405 m!831875))

(declare-fun m!831877 () Bool)

(assert (=> b!894410 m!831877))

(declare-fun m!831879 () Bool)

(assert (=> d!110475 m!831879))

(declare-fun m!831881 () Bool)

(assert (=> d!110475 m!831881))

(assert (=> d!110475 m!831881))

(declare-fun m!831883 () Bool)

(assert (=> d!110475 m!831883))

(assert (=> d!110475 m!831847))

(assert (=> b!894348 d!110475))

(declare-fun d!110477 () Bool)

(declare-fun res!605307 () Bool)

(declare-fun e!499607 () Bool)

(assert (=> d!110477 (=> (not res!605307) (not e!499607))))

(declare-fun simpleValid!301 (LongMapFixedSize!4258) Bool)

(assert (=> d!110477 (= res!605307 (simpleValid!301 thiss!1181))))

(assert (=> d!110477 (= (valid!1654 thiss!1181) e!499607)))

(declare-fun b!894417 () Bool)

(declare-fun res!605308 () Bool)

(assert (=> b!894417 (=> (not res!605308) (not e!499607))))

(declare-fun arrayCountValidKeys!0 (array!52385 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894417 (= res!605308 (= (arrayCountValidKeys!0 (_keys!10034 thiss!1181) #b00000000000000000000000000000000 (size!25641 (_keys!10034 thiss!1181))) (_size!2184 thiss!1181)))))

(declare-fun b!894418 () Bool)

(declare-fun res!605309 () Bool)

(assert (=> b!894418 (=> (not res!605309) (not e!499607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52385 (_ BitVec 32)) Bool)

(assert (=> b!894418 (= res!605309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10034 thiss!1181) (mask!25897 thiss!1181)))))

(declare-fun b!894419 () Bool)

(declare-datatypes ((List!17816 0))(
  ( (Nil!17813) (Cons!17812 (h!18945 (_ BitVec 64)) (t!25146 List!17816)) )
))
(declare-fun arrayNoDuplicates!0 (array!52385 (_ BitVec 32) List!17816) Bool)

(assert (=> b!894419 (= e!499607 (arrayNoDuplicates!0 (_keys!10034 thiss!1181) #b00000000000000000000000000000000 Nil!17813))))

(assert (= (and d!110477 res!605307) b!894417))

(assert (= (and b!894417 res!605308) b!894418))

(assert (= (and b!894418 res!605309) b!894419))

(declare-fun m!831885 () Bool)

(assert (=> d!110477 m!831885))

(declare-fun m!831887 () Bool)

(assert (=> b!894417 m!831887))

(declare-fun m!831889 () Bool)

(assert (=> b!894418 m!831889))

(declare-fun m!831891 () Bool)

(assert (=> b!894419 m!831891))

(assert (=> start!76140 d!110477))

(declare-fun mapIsEmpty!28893 () Bool)

(declare-fun mapRes!28893 () Bool)

(assert (=> mapIsEmpty!28893 mapRes!28893))

(declare-fun condMapEmpty!28893 () Bool)

(declare-fun mapDefault!28893 () ValueCell!8621)

(assert (=> mapNonEmpty!28884 (= condMapEmpty!28893 (= mapRest!28884 ((as const (Array (_ BitVec 32) ValueCell!8621)) mapDefault!28893)))))

(declare-fun e!499612 () Bool)

(assert (=> mapNonEmpty!28884 (= tp!55623 (and e!499612 mapRes!28893))))

(declare-fun b!894427 () Bool)

(assert (=> b!894427 (= e!499612 tp_is_empty!18205)))

(declare-fun b!894426 () Bool)

(declare-fun e!499613 () Bool)

(assert (=> b!894426 (= e!499613 tp_is_empty!18205)))

(declare-fun mapNonEmpty!28893 () Bool)

(declare-fun tp!55638 () Bool)

(assert (=> mapNonEmpty!28893 (= mapRes!28893 (and tp!55638 e!499613))))

(declare-fun mapRest!28893 () (Array (_ BitVec 32) ValueCell!8621))

(declare-fun mapValue!28893 () ValueCell!8621)

(declare-fun mapKey!28893 () (_ BitVec 32))

(assert (=> mapNonEmpty!28893 (= mapRest!28884 (store mapRest!28893 mapKey!28893 mapValue!28893))))

(assert (= (and mapNonEmpty!28884 condMapEmpty!28893) mapIsEmpty!28893))

(assert (= (and mapNonEmpty!28884 (not condMapEmpty!28893)) mapNonEmpty!28893))

(assert (= (and mapNonEmpty!28893 ((_ is ValueCellFull!8621) mapValue!28893)) b!894426))

(assert (= (and mapNonEmpty!28884 ((_ is ValueCellFull!8621) mapDefault!28893)) b!894427))

(declare-fun m!831893 () Bool)

(assert (=> mapNonEmpty!28893 m!831893))

(check-sat (not b!894417) (not b!894410) (not d!110477) tp_is_empty!18205 (not b!894418) (not mapNonEmpty!28893) b_and!26143 (not d!110475) (not b!894419) (not b_next!15877))
(check-sat b_and!26143 (not b_next!15877))
(get-model)

(declare-fun b!894446 () Bool)

(declare-fun lt!404096 () SeekEntryResult!8875)

(assert (=> b!894446 (and (bvsge (index!37873 lt!404096) #b00000000000000000000000000000000) (bvslt (index!37873 lt!404096) (size!25641 (_keys!10034 thiss!1181))))))

(declare-fun res!605317 () Bool)

(assert (=> b!894446 (= res!605317 (= (select (arr!25193 (_keys!10034 thiss!1181)) (index!37873 lt!404096)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499624 () Bool)

(assert (=> b!894446 (=> res!605317 e!499624)))

(declare-fun d!110479 () Bool)

(declare-fun e!499627 () Bool)

(assert (=> d!110479 e!499627))

(declare-fun c!94360 () Bool)

(assert (=> d!110479 (= c!94360 (and ((_ is Intermediate!8875) lt!404096) (undefined!9687 lt!404096)))))

(declare-fun e!499626 () SeekEntryResult!8875)

(assert (=> d!110479 (= lt!404096 e!499626)))

(declare-fun c!94361 () Bool)

(assert (=> d!110479 (= c!94361 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!404095 () (_ BitVec 64))

(assert (=> d!110479 (= lt!404095 (select (arr!25193 (_keys!10034 thiss!1181)) (toIndex!0 key!785 (mask!25897 thiss!1181))))))

(assert (=> d!110479 (validMask!0 (mask!25897 thiss!1181))))

(assert (=> d!110479 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25897 thiss!1181)) key!785 (_keys!10034 thiss!1181) (mask!25897 thiss!1181)) lt!404096)))

(declare-fun b!894447 () Bool)

(assert (=> b!894447 (and (bvsge (index!37873 lt!404096) #b00000000000000000000000000000000) (bvslt (index!37873 lt!404096) (size!25641 (_keys!10034 thiss!1181))))))

(assert (=> b!894447 (= e!499624 (= (select (arr!25193 (_keys!10034 thiss!1181)) (index!37873 lt!404096)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894448 () Bool)

(assert (=> b!894448 (and (bvsge (index!37873 lt!404096) #b00000000000000000000000000000000) (bvslt (index!37873 lt!404096) (size!25641 (_keys!10034 thiss!1181))))))

(declare-fun res!605316 () Bool)

(assert (=> b!894448 (= res!605316 (= (select (arr!25193 (_keys!10034 thiss!1181)) (index!37873 lt!404096)) key!785))))

(assert (=> b!894448 (=> res!605316 e!499624)))

(declare-fun e!499625 () Bool)

(assert (=> b!894448 (= e!499625 e!499624)))

(declare-fun b!894449 () Bool)

(declare-fun e!499628 () SeekEntryResult!8875)

(assert (=> b!894449 (= e!499626 e!499628)))

(declare-fun c!94362 () Bool)

(assert (=> b!894449 (= c!94362 (or (= lt!404095 key!785) (= (bvadd lt!404095 lt!404095) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!894450 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894450 (= e!499628 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25897 thiss!1181)) #b00000000000000000000000000000000 (mask!25897 thiss!1181)) key!785 (_keys!10034 thiss!1181) (mask!25897 thiss!1181)))))

(declare-fun b!894451 () Bool)

(assert (=> b!894451 (= e!499626 (Intermediate!8875 true (toIndex!0 key!785 (mask!25897 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894452 () Bool)

(assert (=> b!894452 (= e!499628 (Intermediate!8875 false (toIndex!0 key!785 (mask!25897 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894453 () Bool)

(assert (=> b!894453 (= e!499627 e!499625)))

(declare-fun res!605318 () Bool)

(assert (=> b!894453 (= res!605318 (and ((_ is Intermediate!8875) lt!404096) (not (undefined!9687 lt!404096)) (bvslt (x!76066 lt!404096) #b01111111111111111111111111111110) (bvsge (x!76066 lt!404096) #b00000000000000000000000000000000) (bvsge (x!76066 lt!404096) #b00000000000000000000000000000000)))))

(assert (=> b!894453 (=> (not res!605318) (not e!499625))))

(declare-fun b!894454 () Bool)

(assert (=> b!894454 (= e!499627 (bvsge (x!76066 lt!404096) #b01111111111111111111111111111110))))

(assert (= (and d!110479 c!94361) b!894451))

(assert (= (and d!110479 (not c!94361)) b!894449))

(assert (= (and b!894449 c!94362) b!894452))

(assert (= (and b!894449 (not c!94362)) b!894450))

(assert (= (and d!110479 c!94360) b!894454))

(assert (= (and d!110479 (not c!94360)) b!894453))

(assert (= (and b!894453 res!605318) b!894448))

(assert (= (and b!894448 (not res!605316)) b!894446))

(assert (= (and b!894446 (not res!605317)) b!894447))

(declare-fun m!831895 () Bool)

(assert (=> b!894446 m!831895))

(assert (=> b!894448 m!831895))

(assert (=> b!894450 m!831881))

(declare-fun m!831897 () Bool)

(assert (=> b!894450 m!831897))

(assert (=> b!894450 m!831897))

(declare-fun m!831899 () Bool)

(assert (=> b!894450 m!831899))

(assert (=> b!894447 m!831895))

(assert (=> d!110479 m!831881))

(declare-fun m!831901 () Bool)

(assert (=> d!110479 m!831901))

(assert (=> d!110479 m!831847))

(assert (=> d!110475 d!110479))

(declare-fun d!110481 () Bool)

(declare-fun lt!404102 () (_ BitVec 32))

(declare-fun lt!404101 () (_ BitVec 32))

(assert (=> d!110481 (= lt!404102 (bvmul (bvxor lt!404101 (bvlshr lt!404101 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110481 (= lt!404101 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110481 (and (bvsge (mask!25897 thiss!1181) #b00000000000000000000000000000000) (let ((res!605319 (let ((h!18946 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76083 (bvmul (bvxor h!18946 (bvlshr h!18946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76083 (bvlshr x!76083 #b00000000000000000000000000001101)) (mask!25897 thiss!1181)))))) (and (bvslt res!605319 (bvadd (mask!25897 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605319 #b00000000000000000000000000000000))))))

(assert (=> d!110481 (= (toIndex!0 key!785 (mask!25897 thiss!1181)) (bvand (bvxor lt!404102 (bvlshr lt!404102 #b00000000000000000000000000001101)) (mask!25897 thiss!1181)))))

(assert (=> d!110475 d!110481))

(assert (=> d!110475 d!110473))

(declare-fun b!894465 () Bool)

(declare-fun e!499640 () Bool)

(declare-fun call!39695 () Bool)

(assert (=> b!894465 (= e!499640 call!39695)))

(declare-fun b!894466 () Bool)

(declare-fun e!499639 () Bool)

(assert (=> b!894466 (= e!499639 e!499640)))

(declare-fun c!94365 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!894466 (= c!94365 (validKeyInArray!0 (select (arr!25193 (_keys!10034 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110483 () Bool)

(declare-fun res!605326 () Bool)

(declare-fun e!499638 () Bool)

(assert (=> d!110483 (=> res!605326 e!499638)))

(assert (=> d!110483 (= res!605326 (bvsge #b00000000000000000000000000000000 (size!25641 (_keys!10034 thiss!1181))))))

(assert (=> d!110483 (= (arrayNoDuplicates!0 (_keys!10034 thiss!1181) #b00000000000000000000000000000000 Nil!17813) e!499638)))

(declare-fun b!894467 () Bool)

(assert (=> b!894467 (= e!499640 call!39695)))

(declare-fun b!894468 () Bool)

(declare-fun e!499637 () Bool)

(declare-fun contains!4364 (List!17816 (_ BitVec 64)) Bool)

(assert (=> b!894468 (= e!499637 (contains!4364 Nil!17813 (select (arr!25193 (_keys!10034 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894469 () Bool)

(assert (=> b!894469 (= e!499638 e!499639)))

(declare-fun res!605327 () Bool)

(assert (=> b!894469 (=> (not res!605327) (not e!499639))))

(assert (=> b!894469 (= res!605327 (not e!499637))))

(declare-fun res!605328 () Bool)

(assert (=> b!894469 (=> (not res!605328) (not e!499637))))

(assert (=> b!894469 (= res!605328 (validKeyInArray!0 (select (arr!25193 (_keys!10034 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39692 () Bool)

(assert (=> bm!39692 (= call!39695 (arrayNoDuplicates!0 (_keys!10034 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94365 (Cons!17812 (select (arr!25193 (_keys!10034 thiss!1181)) #b00000000000000000000000000000000) Nil!17813) Nil!17813)))))

(assert (= (and d!110483 (not res!605326)) b!894469))

(assert (= (and b!894469 res!605328) b!894468))

(assert (= (and b!894469 res!605327) b!894466))

(assert (= (and b!894466 c!94365) b!894467))

(assert (= (and b!894466 (not c!94365)) b!894465))

(assert (= (or b!894467 b!894465) bm!39692))

(declare-fun m!831903 () Bool)

(assert (=> b!894466 m!831903))

(assert (=> b!894466 m!831903))

(declare-fun m!831905 () Bool)

(assert (=> b!894466 m!831905))

(assert (=> b!894468 m!831903))

(assert (=> b!894468 m!831903))

(declare-fun m!831907 () Bool)

(assert (=> b!894468 m!831907))

(assert (=> b!894469 m!831903))

(assert (=> b!894469 m!831903))

(assert (=> b!894469 m!831905))

(assert (=> bm!39692 m!831903))

(declare-fun m!831909 () Bool)

(assert (=> bm!39692 m!831909))

(assert (=> b!894419 d!110483))

(declare-fun b!894482 () Bool)

(declare-fun e!499649 () SeekEntryResult!8875)

(assert (=> b!894482 (= e!499649 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76066 lt!404089) #b00000000000000000000000000000001) (nextIndex!0 (index!37873 lt!404089) (x!76066 lt!404089) (mask!25897 thiss!1181)) (index!37873 lt!404089) key!785 (_keys!10034 thiss!1181) (mask!25897 thiss!1181)))))

(declare-fun b!894483 () Bool)

(declare-fun e!499647 () SeekEntryResult!8875)

(assert (=> b!894483 (= e!499647 (Found!8875 (index!37873 lt!404089)))))

(declare-fun b!894485 () Bool)

(declare-fun c!94372 () Bool)

(declare-fun lt!404108 () (_ BitVec 64))

(assert (=> b!894485 (= c!94372 (= lt!404108 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894485 (= e!499647 e!499649)))

(declare-fun b!894486 () Bool)

(assert (=> b!894486 (= e!499649 (MissingVacant!8875 (index!37873 lt!404089)))))

(declare-fun b!894487 () Bool)

(declare-fun e!499648 () SeekEntryResult!8875)

(assert (=> b!894487 (= e!499648 e!499647)))

(declare-fun c!94373 () Bool)

(assert (=> b!894487 (= c!94373 (= lt!404108 key!785))))

(declare-fun d!110485 () Bool)

(declare-fun lt!404107 () SeekEntryResult!8875)

(assert (=> d!110485 (and (or ((_ is Undefined!8875) lt!404107) (not ((_ is Found!8875) lt!404107)) (and (bvsge (index!37872 lt!404107) #b00000000000000000000000000000000) (bvslt (index!37872 lt!404107) (size!25641 (_keys!10034 thiss!1181))))) (or ((_ is Undefined!8875) lt!404107) ((_ is Found!8875) lt!404107) (not ((_ is MissingVacant!8875) lt!404107)) (not (= (index!37874 lt!404107) (index!37873 lt!404089))) (and (bvsge (index!37874 lt!404107) #b00000000000000000000000000000000) (bvslt (index!37874 lt!404107) (size!25641 (_keys!10034 thiss!1181))))) (or ((_ is Undefined!8875) lt!404107) (ite ((_ is Found!8875) lt!404107) (= (select (arr!25193 (_keys!10034 thiss!1181)) (index!37872 lt!404107)) key!785) (and ((_ is MissingVacant!8875) lt!404107) (= (index!37874 lt!404107) (index!37873 lt!404089)) (= (select (arr!25193 (_keys!10034 thiss!1181)) (index!37874 lt!404107)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110485 (= lt!404107 e!499648)))

(declare-fun c!94374 () Bool)

(assert (=> d!110485 (= c!94374 (bvsge (x!76066 lt!404089) #b01111111111111111111111111111110))))

(assert (=> d!110485 (= lt!404108 (select (arr!25193 (_keys!10034 thiss!1181)) (index!37873 lt!404089)))))

(assert (=> d!110485 (validMask!0 (mask!25897 thiss!1181))))

(assert (=> d!110485 (= (seekKeyOrZeroReturnVacant!0 (x!76066 lt!404089) (index!37873 lt!404089) (index!37873 lt!404089) key!785 (_keys!10034 thiss!1181) (mask!25897 thiss!1181)) lt!404107)))

(declare-fun b!894484 () Bool)

(assert (=> b!894484 (= e!499648 Undefined!8875)))

(assert (= (and d!110485 c!94374) b!894484))

(assert (= (and d!110485 (not c!94374)) b!894487))

(assert (= (and b!894487 c!94373) b!894483))

(assert (= (and b!894487 (not c!94373)) b!894485))

(assert (= (and b!894485 c!94372) b!894486))

(assert (= (and b!894485 (not c!94372)) b!894482))

(declare-fun m!831911 () Bool)

(assert (=> b!894482 m!831911))

(assert (=> b!894482 m!831911))

(declare-fun m!831913 () Bool)

(assert (=> b!894482 m!831913))

(declare-fun m!831915 () Bool)

(assert (=> d!110485 m!831915))

(declare-fun m!831917 () Bool)

(assert (=> d!110485 m!831917))

(assert (=> d!110485 m!831875))

(assert (=> d!110485 m!831847))

(assert (=> b!894410 d!110485))

(declare-fun b!894496 () Bool)

(declare-fun e!499654 () (_ BitVec 32))

(declare-fun e!499655 () (_ BitVec 32))

(assert (=> b!894496 (= e!499654 e!499655)))

(declare-fun c!94379 () Bool)

(assert (=> b!894496 (= c!94379 (validKeyInArray!0 (select (arr!25193 (_keys!10034 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894497 () Bool)

(declare-fun call!39698 () (_ BitVec 32))

(assert (=> b!894497 (= e!499655 call!39698)))

(declare-fun bm!39695 () Bool)

(assert (=> bm!39695 (= call!39698 (arrayCountValidKeys!0 (_keys!10034 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25641 (_keys!10034 thiss!1181))))))

(declare-fun b!894498 () Bool)

(assert (=> b!894498 (= e!499655 (bvadd #b00000000000000000000000000000001 call!39698))))

(declare-fun d!110487 () Bool)

(declare-fun lt!404111 () (_ BitVec 32))

(assert (=> d!110487 (and (bvsge lt!404111 #b00000000000000000000000000000000) (bvsle lt!404111 (bvsub (size!25641 (_keys!10034 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110487 (= lt!404111 e!499654)))

(declare-fun c!94380 () Bool)

(assert (=> d!110487 (= c!94380 (bvsge #b00000000000000000000000000000000 (size!25641 (_keys!10034 thiss!1181))))))

(assert (=> d!110487 (and (bvsle #b00000000000000000000000000000000 (size!25641 (_keys!10034 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25641 (_keys!10034 thiss!1181)) (size!25641 (_keys!10034 thiss!1181))))))

(assert (=> d!110487 (= (arrayCountValidKeys!0 (_keys!10034 thiss!1181) #b00000000000000000000000000000000 (size!25641 (_keys!10034 thiss!1181))) lt!404111)))

(declare-fun b!894499 () Bool)

(assert (=> b!894499 (= e!499654 #b00000000000000000000000000000000)))

(assert (= (and d!110487 c!94380) b!894499))

(assert (= (and d!110487 (not c!94380)) b!894496))

(assert (= (and b!894496 c!94379) b!894498))

(assert (= (and b!894496 (not c!94379)) b!894497))

(assert (= (or b!894498 b!894497) bm!39695))

(assert (=> b!894496 m!831903))

(assert (=> b!894496 m!831903))

(assert (=> b!894496 m!831905))

(declare-fun m!831919 () Bool)

(assert (=> bm!39695 m!831919))

(assert (=> b!894417 d!110487))

(declare-fun b!894509 () Bool)

(declare-fun res!605340 () Bool)

(declare-fun e!499658 () Bool)

(assert (=> b!894509 (=> (not res!605340) (not e!499658))))

(declare-fun size!25647 (LongMapFixedSize!4258) (_ BitVec 32))

(assert (=> b!894509 (= res!605340 (bvsge (size!25647 thiss!1181) (_size!2184 thiss!1181)))))

(declare-fun b!894511 () Bool)

(assert (=> b!894511 (= e!499658 (and (bvsge (extraKeys!5037 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5037 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2184 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!894510 () Bool)

(declare-fun res!605337 () Bool)

(assert (=> b!894510 (=> (not res!605337) (not e!499658))))

(assert (=> b!894510 (= res!605337 (= (size!25647 thiss!1181) (bvadd (_size!2184 thiss!1181) (bvsdiv (bvadd (extraKeys!5037 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!110489 () Bool)

(declare-fun res!605338 () Bool)

(assert (=> d!110489 (=> (not res!605338) (not e!499658))))

(assert (=> d!110489 (= res!605338 (validMask!0 (mask!25897 thiss!1181)))))

(assert (=> d!110489 (= (simpleValid!301 thiss!1181) e!499658)))

(declare-fun b!894508 () Bool)

(declare-fun res!605339 () Bool)

(assert (=> b!894508 (=> (not res!605339) (not e!499658))))

(assert (=> b!894508 (= res!605339 (and (= (size!25642 (_values!5328 thiss!1181)) (bvadd (mask!25897 thiss!1181) #b00000000000000000000000000000001)) (= (size!25641 (_keys!10034 thiss!1181)) (size!25642 (_values!5328 thiss!1181))) (bvsge (_size!2184 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2184 thiss!1181) (bvadd (mask!25897 thiss!1181) #b00000000000000000000000000000001))))))

(assert (= (and d!110489 res!605338) b!894508))

(assert (= (and b!894508 res!605339) b!894509))

(assert (= (and b!894509 res!605340) b!894510))

(assert (= (and b!894510 res!605337) b!894511))

(declare-fun m!831921 () Bool)

(assert (=> b!894509 m!831921))

(assert (=> b!894510 m!831921))

(assert (=> d!110489 m!831847))

(assert (=> d!110477 d!110489))

(declare-fun bm!39698 () Bool)

(declare-fun call!39701 () Bool)

(assert (=> bm!39698 (= call!39701 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10034 thiss!1181) (mask!25897 thiss!1181)))))

(declare-fun b!894520 () Bool)

(declare-fun e!499667 () Bool)

(declare-fun e!499665 () Bool)

(assert (=> b!894520 (= e!499667 e!499665)))

(declare-fun c!94383 () Bool)

(assert (=> b!894520 (= c!94383 (validKeyInArray!0 (select (arr!25193 (_keys!10034 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894521 () Bool)

(assert (=> b!894521 (= e!499665 call!39701)))

(declare-fun b!894522 () Bool)

(declare-fun e!499666 () Bool)

(assert (=> b!894522 (= e!499666 call!39701)))

(declare-fun d!110491 () Bool)

(declare-fun res!605346 () Bool)

(assert (=> d!110491 (=> res!605346 e!499667)))

(assert (=> d!110491 (= res!605346 (bvsge #b00000000000000000000000000000000 (size!25641 (_keys!10034 thiss!1181))))))

(assert (=> d!110491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10034 thiss!1181) (mask!25897 thiss!1181)) e!499667)))

(declare-fun b!894523 () Bool)

(assert (=> b!894523 (= e!499665 e!499666)))

(declare-fun lt!404119 () (_ BitVec 64))

(assert (=> b!894523 (= lt!404119 (select (arr!25193 (_keys!10034 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30398 0))(
  ( (Unit!30399) )
))
(declare-fun lt!404120 () Unit!30398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52385 (_ BitVec 64) (_ BitVec 32)) Unit!30398)

(assert (=> b!894523 (= lt!404120 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10034 thiss!1181) lt!404119 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!894523 (arrayContainsKey!0 (_keys!10034 thiss!1181) lt!404119 #b00000000000000000000000000000000)))

(declare-fun lt!404118 () Unit!30398)

(assert (=> b!894523 (= lt!404118 lt!404120)))

(declare-fun res!605345 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52385 (_ BitVec 32)) SeekEntryResult!8875)

(assert (=> b!894523 (= res!605345 (= (seekEntryOrOpen!0 (select (arr!25193 (_keys!10034 thiss!1181)) #b00000000000000000000000000000000) (_keys!10034 thiss!1181) (mask!25897 thiss!1181)) (Found!8875 #b00000000000000000000000000000000)))))

(assert (=> b!894523 (=> (not res!605345) (not e!499666))))

(assert (= (and d!110491 (not res!605346)) b!894520))

(assert (= (and b!894520 c!94383) b!894523))

(assert (= (and b!894520 (not c!94383)) b!894521))

(assert (= (and b!894523 res!605345) b!894522))

(assert (= (or b!894522 b!894521) bm!39698))

(declare-fun m!831923 () Bool)

(assert (=> bm!39698 m!831923))

(assert (=> b!894520 m!831903))

(assert (=> b!894520 m!831903))

(assert (=> b!894520 m!831905))

(assert (=> b!894523 m!831903))

(declare-fun m!831925 () Bool)

(assert (=> b!894523 m!831925))

(declare-fun m!831927 () Bool)

(assert (=> b!894523 m!831927))

(assert (=> b!894523 m!831903))

(declare-fun m!831929 () Bool)

(assert (=> b!894523 m!831929))

(assert (=> b!894418 d!110491))

(declare-fun mapIsEmpty!28894 () Bool)

(declare-fun mapRes!28894 () Bool)

(assert (=> mapIsEmpty!28894 mapRes!28894))

(declare-fun condMapEmpty!28894 () Bool)

(declare-fun mapDefault!28894 () ValueCell!8621)

(assert (=> mapNonEmpty!28893 (= condMapEmpty!28894 (= mapRest!28893 ((as const (Array (_ BitVec 32) ValueCell!8621)) mapDefault!28894)))))

(declare-fun e!499668 () Bool)

(assert (=> mapNonEmpty!28893 (= tp!55638 (and e!499668 mapRes!28894))))

(declare-fun b!894525 () Bool)

(assert (=> b!894525 (= e!499668 tp_is_empty!18205)))

(declare-fun b!894524 () Bool)

(declare-fun e!499669 () Bool)

(assert (=> b!894524 (= e!499669 tp_is_empty!18205)))

(declare-fun mapNonEmpty!28894 () Bool)

(declare-fun tp!55639 () Bool)

(assert (=> mapNonEmpty!28894 (= mapRes!28894 (and tp!55639 e!499669))))

(declare-fun mapKey!28894 () (_ BitVec 32))

(declare-fun mapValue!28894 () ValueCell!8621)

(declare-fun mapRest!28894 () (Array (_ BitVec 32) ValueCell!8621))

(assert (=> mapNonEmpty!28894 (= mapRest!28893 (store mapRest!28894 mapKey!28894 mapValue!28894))))

(assert (= (and mapNonEmpty!28893 condMapEmpty!28894) mapIsEmpty!28894))

(assert (= (and mapNonEmpty!28893 (not condMapEmpty!28894)) mapNonEmpty!28894))

(assert (= (and mapNonEmpty!28894 ((_ is ValueCellFull!8621) mapValue!28894)) b!894524))

(assert (= (and mapNonEmpty!28893 ((_ is ValueCellFull!8621) mapDefault!28894)) b!894525))

(declare-fun m!831931 () Bool)

(assert (=> mapNonEmpty!28894 m!831931))

(check-sat (not d!110479) (not mapNonEmpty!28894) (not b!894450) (not d!110485) (not b!894468) (not b!894482) (not b!894496) (not bm!39692) (not b!894510) (not d!110489) tp_is_empty!18205 (not b!894466) (not b!894520) (not bm!39698) (not bm!39695) (not b!894523) (not b!894469) b_and!26143 (not b!894509) (not b_next!15877))
(check-sat b_and!26143 (not b_next!15877))
