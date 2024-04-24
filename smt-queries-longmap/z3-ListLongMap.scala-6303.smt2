; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80844 () Bool)

(assert start!80844)

(declare-fun b!947375 () Bool)

(declare-fun b_free!18139 () Bool)

(declare-fun b_next!18139 () Bool)

(assert (=> b!947375 (= b_free!18139 (not b_next!18139))))

(declare-fun tp!62959 () Bool)

(declare-fun b_and!29571 () Bool)

(assert (=> b!947375 (= tp!62959 b_and!29571)))

(declare-fun b!947372 () Bool)

(declare-fun e!533120 () Bool)

(declare-fun e!533117 () Bool)

(declare-fun mapRes!32828 () Bool)

(assert (=> b!947372 (= e!533120 (and e!533117 mapRes!32828))))

(declare-fun condMapEmpty!32828 () Bool)

(declare-datatypes ((V!32495 0))(
  ( (V!32496 (val!10374 Int)) )
))
(declare-datatypes ((ValueCell!9842 0))(
  ( (ValueCellFull!9842 (v!12905 V!32495)) (EmptyCell!9842) )
))
(declare-datatypes ((array!57331 0))(
  ( (array!57332 (arr!27577 (Array (_ BitVec 32) ValueCell!9842)) (size!28049 (_ BitVec 32))) )
))
(declare-datatypes ((array!57333 0))(
  ( (array!57334 (arr!27578 (Array (_ BitVec 32) (_ BitVec 64))) (size!28050 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4834 0))(
  ( (LongMapFixedSize!4835 (defaultEntry!5714 Int) (mask!27462 (_ BitVec 32)) (extraKeys!5446 (_ BitVec 32)) (zeroValue!5550 V!32495) (minValue!5550 V!32495) (_size!2472 (_ BitVec 32)) (_keys!10638 array!57333) (_values!5737 array!57331) (_vacant!2472 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4834)

(declare-fun mapDefault!32828 () ValueCell!9842)

(assert (=> b!947372 (= condMapEmpty!32828 (= (arr!27577 (_values!5737 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9842)) mapDefault!32828)))))

(declare-fun b!947373 () Bool)

(declare-fun tp_is_empty!20647 () Bool)

(assert (=> b!947373 (= e!533117 tp_is_empty!20647)))

(declare-fun b!947374 () Bool)

(declare-fun res!635727 () Bool)

(declare-fun e!533122 () Bool)

(assert (=> b!947374 (=> (not res!635727) (not e!533122))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!947374 (= res!635727 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!533121 () Bool)

(declare-fun array_inv!21502 (array!57333) Bool)

(declare-fun array_inv!21503 (array!57331) Bool)

(assert (=> b!947375 (= e!533121 (and tp!62959 tp_is_empty!20647 (array_inv!21502 (_keys!10638 thiss!1141)) (array_inv!21503 (_values!5737 thiss!1141)) e!533120))))

(declare-fun mapIsEmpty!32828 () Bool)

(assert (=> mapIsEmpty!32828 mapRes!32828))

(declare-fun b!947376 () Bool)

(declare-fun e!533123 () Bool)

(declare-fun e!533119 () Bool)

(assert (=> b!947376 (= e!533123 (not e!533119))))

(declare-fun res!635728 () Bool)

(assert (=> b!947376 (=> res!635728 e!533119)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947376 (= res!635728 (not (validMask!0 (mask!27462 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947376 (arrayContainsKey!0 (_keys!10638 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9061 0))(
  ( (MissingZero!9061 (index!38615 (_ BitVec 32))) (Found!9061 (index!38616 (_ BitVec 32))) (Intermediate!9061 (undefined!9873 Bool) (index!38617 (_ BitVec 32)) (x!81361 (_ BitVec 32))) (Undefined!9061) (MissingVacant!9061 (index!38618 (_ BitVec 32))) )
))
(declare-fun lt!426663 () SeekEntryResult!9061)

(declare-datatypes ((Unit!31885 0))(
  ( (Unit!31886) )
))
(declare-fun lt!426664 () Unit!31885)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57333 (_ BitVec 64) (_ BitVec 32)) Unit!31885)

(assert (=> b!947376 (= lt!426664 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10638 thiss!1141) key!756 (index!38616 lt!426663)))))

(declare-fun b!947377 () Bool)

(declare-fun e!533124 () Bool)

(assert (=> b!947377 (= e!533124 tp_is_empty!20647)))

(declare-fun res!635730 () Bool)

(assert (=> start!80844 (=> (not res!635730) (not e!533122))))

(declare-fun valid!1852 (LongMapFixedSize!4834) Bool)

(assert (=> start!80844 (= res!635730 (valid!1852 thiss!1141))))

(assert (=> start!80844 e!533122))

(assert (=> start!80844 e!533121))

(assert (=> start!80844 true))

(declare-fun b!947378 () Bool)

(assert (=> b!947378 (= e!533119 (or (not (= (size!28049 (_values!5737 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27462 thiss!1141)))) (not (= (size!28050 (_keys!10638 thiss!1141)) (size!28049 (_values!5737 thiss!1141)))) (bvsge (mask!27462 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!947379 () Bool)

(assert (=> b!947379 (= e!533122 e!533123)))

(declare-fun res!635729 () Bool)

(assert (=> b!947379 (=> (not res!635729) (not e!533123))))

(get-info :version)

(assert (=> b!947379 (= res!635729 ((_ is Found!9061) lt!426663))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57333 (_ BitVec 32)) SeekEntryResult!9061)

(assert (=> b!947379 (= lt!426663 (seekEntry!0 key!756 (_keys!10638 thiss!1141) (mask!27462 thiss!1141)))))

(declare-fun mapNonEmpty!32828 () Bool)

(declare-fun tp!62960 () Bool)

(assert (=> mapNonEmpty!32828 (= mapRes!32828 (and tp!62960 e!533124))))

(declare-fun mapKey!32828 () (_ BitVec 32))

(declare-fun mapRest!32828 () (Array (_ BitVec 32) ValueCell!9842))

(declare-fun mapValue!32828 () ValueCell!9842)

(assert (=> mapNonEmpty!32828 (= (arr!27577 (_values!5737 thiss!1141)) (store mapRest!32828 mapKey!32828 mapValue!32828))))

(assert (= (and start!80844 res!635730) b!947374))

(assert (= (and b!947374 res!635727) b!947379))

(assert (= (and b!947379 res!635729) b!947376))

(assert (= (and b!947376 (not res!635728)) b!947378))

(assert (= (and b!947372 condMapEmpty!32828) mapIsEmpty!32828))

(assert (= (and b!947372 (not condMapEmpty!32828)) mapNonEmpty!32828))

(assert (= (and mapNonEmpty!32828 ((_ is ValueCellFull!9842) mapValue!32828)) b!947377))

(assert (= (and b!947372 ((_ is ValueCellFull!9842) mapDefault!32828)) b!947373))

(assert (= b!947375 b!947372))

(assert (= start!80844 b!947375))

(declare-fun m!881119 () Bool)

(assert (=> b!947376 m!881119))

(declare-fun m!881121 () Bool)

(assert (=> b!947376 m!881121))

(declare-fun m!881123 () Bool)

(assert (=> b!947376 m!881123))

(declare-fun m!881125 () Bool)

(assert (=> mapNonEmpty!32828 m!881125))

(declare-fun m!881127 () Bool)

(assert (=> start!80844 m!881127))

(declare-fun m!881129 () Bool)

(assert (=> b!947379 m!881129))

(declare-fun m!881131 () Bool)

(assert (=> b!947375 m!881131))

(declare-fun m!881133 () Bool)

(assert (=> b!947375 m!881133))

(check-sat (not b!947375) tp_is_empty!20647 (not start!80844) (not mapNonEmpty!32828) b_and!29571 (not b!947376) (not b!947379) (not b_next!18139))
(check-sat b_and!29571 (not b_next!18139))
(get-model)

(declare-fun d!114869 () Bool)

(assert (=> d!114869 (= (array_inv!21502 (_keys!10638 thiss!1141)) (bvsge (size!28050 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947375 d!114869))

(declare-fun d!114871 () Bool)

(assert (=> d!114871 (= (array_inv!21503 (_values!5737 thiss!1141)) (bvsge (size!28049 (_values!5737 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947375 d!114871))

(declare-fun b!947440 () Bool)

(declare-fun e!533179 () SeekEntryResult!9061)

(declare-fun lt!426687 () SeekEntryResult!9061)

(assert (=> b!947440 (= e!533179 (Found!9061 (index!38617 lt!426687)))))

(declare-fun b!947441 () Bool)

(declare-fun e!533181 () SeekEntryResult!9061)

(assert (=> b!947441 (= e!533181 e!533179)))

(declare-fun lt!426685 () (_ BitVec 64))

(assert (=> b!947441 (= lt!426685 (select (arr!27578 (_keys!10638 thiss!1141)) (index!38617 lt!426687)))))

(declare-fun c!98864 () Bool)

(assert (=> b!947441 (= c!98864 (= lt!426685 key!756))))

(declare-fun b!947442 () Bool)

(declare-fun c!98862 () Bool)

(assert (=> b!947442 (= c!98862 (= lt!426685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533180 () SeekEntryResult!9061)

(assert (=> b!947442 (= e!533179 e!533180)))

(declare-fun d!114873 () Bool)

(declare-fun lt!426688 () SeekEntryResult!9061)

(assert (=> d!114873 (and (or ((_ is MissingVacant!9061) lt!426688) (not ((_ is Found!9061) lt!426688)) (and (bvsge (index!38616 lt!426688) #b00000000000000000000000000000000) (bvslt (index!38616 lt!426688) (size!28050 (_keys!10638 thiss!1141))))) (not ((_ is MissingVacant!9061) lt!426688)) (or (not ((_ is Found!9061) lt!426688)) (= (select (arr!27578 (_keys!10638 thiss!1141)) (index!38616 lt!426688)) key!756)))))

(assert (=> d!114873 (= lt!426688 e!533181)))

(declare-fun c!98863 () Bool)

(assert (=> d!114873 (= c!98863 (and ((_ is Intermediate!9061) lt!426687) (undefined!9873 lt!426687)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57333 (_ BitVec 32)) SeekEntryResult!9061)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114873 (= lt!426687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27462 thiss!1141)) key!756 (_keys!10638 thiss!1141) (mask!27462 thiss!1141)))))

(assert (=> d!114873 (validMask!0 (mask!27462 thiss!1141))))

(assert (=> d!114873 (= (seekEntry!0 key!756 (_keys!10638 thiss!1141) (mask!27462 thiss!1141)) lt!426688)))

(declare-fun b!947443 () Bool)

(assert (=> b!947443 (= e!533181 Undefined!9061)))

(declare-fun b!947444 () Bool)

(declare-fun lt!426686 () SeekEntryResult!9061)

(assert (=> b!947444 (= e!533180 (ite ((_ is MissingVacant!9061) lt!426686) (MissingZero!9061 (index!38618 lt!426686)) lt!426686))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57333 (_ BitVec 32)) SeekEntryResult!9061)

(assert (=> b!947444 (= lt!426686 (seekKeyOrZeroReturnVacant!0 (x!81361 lt!426687) (index!38617 lt!426687) (index!38617 lt!426687) key!756 (_keys!10638 thiss!1141) (mask!27462 thiss!1141)))))

(declare-fun b!947445 () Bool)

(assert (=> b!947445 (= e!533180 (MissingZero!9061 (index!38617 lt!426687)))))

(assert (= (and d!114873 c!98863) b!947443))

(assert (= (and d!114873 (not c!98863)) b!947441))

(assert (= (and b!947441 c!98864) b!947440))

(assert (= (and b!947441 (not c!98864)) b!947442))

(assert (= (and b!947442 c!98862) b!947445))

(assert (= (and b!947442 (not c!98862)) b!947444))

(declare-fun m!881167 () Bool)

(assert (=> b!947441 m!881167))

(declare-fun m!881169 () Bool)

(assert (=> d!114873 m!881169))

(declare-fun m!881171 () Bool)

(assert (=> d!114873 m!881171))

(assert (=> d!114873 m!881171))

(declare-fun m!881173 () Bool)

(assert (=> d!114873 m!881173))

(assert (=> d!114873 m!881119))

(declare-fun m!881175 () Bool)

(assert (=> b!947444 m!881175))

(assert (=> b!947379 d!114873))

(declare-fun d!114875 () Bool)

(declare-fun res!635761 () Bool)

(declare-fun e!533184 () Bool)

(assert (=> d!114875 (=> (not res!635761) (not e!533184))))

(declare-fun simpleValid!358 (LongMapFixedSize!4834) Bool)

(assert (=> d!114875 (= res!635761 (simpleValid!358 thiss!1141))))

(assert (=> d!114875 (= (valid!1852 thiss!1141) e!533184)))

(declare-fun b!947452 () Bool)

(declare-fun res!635762 () Bool)

(assert (=> b!947452 (=> (not res!635762) (not e!533184))))

(declare-fun arrayCountValidKeys!0 (array!57333 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947452 (= res!635762 (= (arrayCountValidKeys!0 (_keys!10638 thiss!1141) #b00000000000000000000000000000000 (size!28050 (_keys!10638 thiss!1141))) (_size!2472 thiss!1141)))))

(declare-fun b!947453 () Bool)

(declare-fun res!635763 () Bool)

(assert (=> b!947453 (=> (not res!635763) (not e!533184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57333 (_ BitVec 32)) Bool)

(assert (=> b!947453 (= res!635763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10638 thiss!1141) (mask!27462 thiss!1141)))))

(declare-fun b!947454 () Bool)

(declare-datatypes ((List!19283 0))(
  ( (Nil!19280) (Cons!19279 (h!20439 (_ BitVec 64)) (t!27596 List!19283)) )
))
(declare-fun arrayNoDuplicates!0 (array!57333 (_ BitVec 32) List!19283) Bool)

(assert (=> b!947454 (= e!533184 (arrayNoDuplicates!0 (_keys!10638 thiss!1141) #b00000000000000000000000000000000 Nil!19280))))

(assert (= (and d!114875 res!635761) b!947452))

(assert (= (and b!947452 res!635762) b!947453))

(assert (= (and b!947453 res!635763) b!947454))

(declare-fun m!881177 () Bool)

(assert (=> d!114875 m!881177))

(declare-fun m!881179 () Bool)

(assert (=> b!947452 m!881179))

(declare-fun m!881181 () Bool)

(assert (=> b!947453 m!881181))

(declare-fun m!881183 () Bool)

(assert (=> b!947454 m!881183))

(assert (=> start!80844 d!114875))

(declare-fun d!114877 () Bool)

(assert (=> d!114877 (= (validMask!0 (mask!27462 thiss!1141)) (and (or (= (mask!27462 thiss!1141) #b00000000000000000000000000000111) (= (mask!27462 thiss!1141) #b00000000000000000000000000001111) (= (mask!27462 thiss!1141) #b00000000000000000000000000011111) (= (mask!27462 thiss!1141) #b00000000000000000000000000111111) (= (mask!27462 thiss!1141) #b00000000000000000000000001111111) (= (mask!27462 thiss!1141) #b00000000000000000000000011111111) (= (mask!27462 thiss!1141) #b00000000000000000000000111111111) (= (mask!27462 thiss!1141) #b00000000000000000000001111111111) (= (mask!27462 thiss!1141) #b00000000000000000000011111111111) (= (mask!27462 thiss!1141) #b00000000000000000000111111111111) (= (mask!27462 thiss!1141) #b00000000000000000001111111111111) (= (mask!27462 thiss!1141) #b00000000000000000011111111111111) (= (mask!27462 thiss!1141) #b00000000000000000111111111111111) (= (mask!27462 thiss!1141) #b00000000000000001111111111111111) (= (mask!27462 thiss!1141) #b00000000000000011111111111111111) (= (mask!27462 thiss!1141) #b00000000000000111111111111111111) (= (mask!27462 thiss!1141) #b00000000000001111111111111111111) (= (mask!27462 thiss!1141) #b00000000000011111111111111111111) (= (mask!27462 thiss!1141) #b00000000000111111111111111111111) (= (mask!27462 thiss!1141) #b00000000001111111111111111111111) (= (mask!27462 thiss!1141) #b00000000011111111111111111111111) (= (mask!27462 thiss!1141) #b00000000111111111111111111111111) (= (mask!27462 thiss!1141) #b00000001111111111111111111111111) (= (mask!27462 thiss!1141) #b00000011111111111111111111111111) (= (mask!27462 thiss!1141) #b00000111111111111111111111111111) (= (mask!27462 thiss!1141) #b00001111111111111111111111111111) (= (mask!27462 thiss!1141) #b00011111111111111111111111111111) (= (mask!27462 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27462 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947376 d!114877))

(declare-fun d!114879 () Bool)

(declare-fun res!635768 () Bool)

(declare-fun e!533189 () Bool)

(assert (=> d!114879 (=> res!635768 e!533189)))

(assert (=> d!114879 (= res!635768 (= (select (arr!27578 (_keys!10638 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114879 (= (arrayContainsKey!0 (_keys!10638 thiss!1141) key!756 #b00000000000000000000000000000000) e!533189)))

(declare-fun b!947459 () Bool)

(declare-fun e!533190 () Bool)

(assert (=> b!947459 (= e!533189 e!533190)))

(declare-fun res!635769 () Bool)

(assert (=> b!947459 (=> (not res!635769) (not e!533190))))

(assert (=> b!947459 (= res!635769 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28050 (_keys!10638 thiss!1141))))))

(declare-fun b!947460 () Bool)

(assert (=> b!947460 (= e!533190 (arrayContainsKey!0 (_keys!10638 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114879 (not res!635768)) b!947459))

(assert (= (and b!947459 res!635769) b!947460))

(declare-fun m!881185 () Bool)

(assert (=> d!114879 m!881185))

(declare-fun m!881187 () Bool)

(assert (=> b!947460 m!881187))

(assert (=> b!947376 d!114879))

(declare-fun d!114881 () Bool)

(assert (=> d!114881 (arrayContainsKey!0 (_keys!10638 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426691 () Unit!31885)

(declare-fun choose!13 (array!57333 (_ BitVec 64) (_ BitVec 32)) Unit!31885)

(assert (=> d!114881 (= lt!426691 (choose!13 (_keys!10638 thiss!1141) key!756 (index!38616 lt!426663)))))

(assert (=> d!114881 (bvsge (index!38616 lt!426663) #b00000000000000000000000000000000)))

(assert (=> d!114881 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10638 thiss!1141) key!756 (index!38616 lt!426663)) lt!426691)))

(declare-fun bs!26619 () Bool)

(assert (= bs!26619 d!114881))

(assert (=> bs!26619 m!881121))

(declare-fun m!881189 () Bool)

(assert (=> bs!26619 m!881189))

(assert (=> b!947376 d!114881))

(declare-fun condMapEmpty!32837 () Bool)

(declare-fun mapDefault!32837 () ValueCell!9842)

(assert (=> mapNonEmpty!32828 (= condMapEmpty!32837 (= mapRest!32828 ((as const (Array (_ BitVec 32) ValueCell!9842)) mapDefault!32837)))))

(declare-fun e!533196 () Bool)

(declare-fun mapRes!32837 () Bool)

(assert (=> mapNonEmpty!32828 (= tp!62960 (and e!533196 mapRes!32837))))

(declare-fun b!947468 () Bool)

(assert (=> b!947468 (= e!533196 tp_is_empty!20647)))

(declare-fun mapNonEmpty!32837 () Bool)

(declare-fun tp!62975 () Bool)

(declare-fun e!533195 () Bool)

(assert (=> mapNonEmpty!32837 (= mapRes!32837 (and tp!62975 e!533195))))

(declare-fun mapKey!32837 () (_ BitVec 32))

(declare-fun mapValue!32837 () ValueCell!9842)

(declare-fun mapRest!32837 () (Array (_ BitVec 32) ValueCell!9842))

(assert (=> mapNonEmpty!32837 (= mapRest!32828 (store mapRest!32837 mapKey!32837 mapValue!32837))))

(declare-fun mapIsEmpty!32837 () Bool)

(assert (=> mapIsEmpty!32837 mapRes!32837))

(declare-fun b!947467 () Bool)

(assert (=> b!947467 (= e!533195 tp_is_empty!20647)))

(assert (= (and mapNonEmpty!32828 condMapEmpty!32837) mapIsEmpty!32837))

(assert (= (and mapNonEmpty!32828 (not condMapEmpty!32837)) mapNonEmpty!32837))

(assert (= (and mapNonEmpty!32837 ((_ is ValueCellFull!9842) mapValue!32837)) b!947467))

(assert (= (and mapNonEmpty!32828 ((_ is ValueCellFull!9842) mapDefault!32837)) b!947468))

(declare-fun m!881191 () Bool)

(assert (=> mapNonEmpty!32837 m!881191))

(check-sat (not b!947460) (not mapNonEmpty!32837) (not b_next!18139) (not b!947452) (not d!114873) tp_is_empty!20647 (not b!947453) (not d!114875) (not d!114881) b_and!29571 (not b!947454) (not b!947444))
(check-sat b_and!29571 (not b_next!18139))
