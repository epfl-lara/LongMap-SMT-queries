; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90974 () Bool)

(assert start!90974)

(declare-fun b!1038821 () Bool)

(declare-fun b_free!20905 () Bool)

(declare-fun b_next!20905 () Bool)

(assert (=> b!1038821 (= b_free!20905 (not b_next!20905))))

(declare-fun tp!73863 () Bool)

(declare-fun b_and!33447 () Bool)

(assert (=> b!1038821 (= tp!73863 b_and!33447)))

(declare-fun res!692721 () Bool)

(declare-fun e!587746 () Bool)

(assert (=> start!90974 (=> (not res!692721) (not e!587746))))

(declare-datatypes ((V!37707 0))(
  ( (V!37708 (val!12363 Int)) )
))
(declare-datatypes ((ValueCell!11609 0))(
  ( (ValueCellFull!11609 (v!14942 V!37707)) (EmptyCell!11609) )
))
(declare-datatypes ((array!65405 0))(
  ( (array!65406 (arr!31477 (Array (_ BitVec 32) (_ BitVec 64))) (size!32008 (_ BitVec 32))) )
))
(declare-datatypes ((array!65407 0))(
  ( (array!65408 (arr!31478 (Array (_ BitVec 32) ValueCell!11609)) (size!32009 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5812 0))(
  ( (LongMapFixedSize!5813 (defaultEntry!6288 Int) (mask!30270 (_ BitVec 32)) (extraKeys!6016 (_ BitVec 32)) (zeroValue!6122 V!37707) (minValue!6122 V!37707) (_size!2961 (_ BitVec 32)) (_keys!11523 array!65405) (_values!6311 array!65407) (_vacant!2961 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5812)

(declare-fun valid!2197 (LongMapFixedSize!5812) Bool)

(assert (=> start!90974 (= res!692721 (valid!2197 thiss!1427))))

(assert (=> start!90974 e!587746))

(declare-fun e!587744 () Bool)

(assert (=> start!90974 e!587744))

(assert (=> start!90974 true))

(declare-fun b!1038818 () Bool)

(declare-fun e!587750 () Bool)

(declare-fun tp_is_empty!24625 () Bool)

(assert (=> b!1038818 (= e!587750 tp_is_empty!24625)))

(declare-fun b!1038819 () Bool)

(declare-fun e!587749 () Bool)

(assert (=> b!1038819 (= e!587746 e!587749)))

(declare-fun res!692720 () Bool)

(assert (=> b!1038819 (=> (not res!692720) (not e!587749))))

(declare-datatypes ((SeekEntryResult!9712 0))(
  ( (MissingZero!9712 (index!41219 (_ BitVec 32))) (Found!9712 (index!41220 (_ BitVec 32))) (Intermediate!9712 (undefined!10524 Bool) (index!41221 (_ BitVec 32)) (x!92541 (_ BitVec 32))) (Undefined!9712) (MissingVacant!9712 (index!41222 (_ BitVec 32))) )
))
(declare-fun lt!458026 () SeekEntryResult!9712)

(get-info :version)

(assert (=> b!1038819 (= res!692720 ((_ is Found!9712) lt!458026))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65405 (_ BitVec 32)) SeekEntryResult!9712)

(assert (=> b!1038819 (= lt!458026 (seekEntry!0 key!909 (_keys!11523 thiss!1427) (mask!30270 thiss!1427)))))

(declare-fun mapNonEmpty!38469 () Bool)

(declare-fun mapRes!38469 () Bool)

(declare-fun tp!73864 () Bool)

(declare-fun e!587747 () Bool)

(assert (=> mapNonEmpty!38469 (= mapRes!38469 (and tp!73864 e!587747))))

(declare-fun mapRest!38469 () (Array (_ BitVec 32) ValueCell!11609))

(declare-fun mapValue!38469 () ValueCell!11609)

(declare-fun mapKey!38469 () (_ BitVec 32))

(assert (=> mapNonEmpty!38469 (= (arr!31478 (_values!6311 thiss!1427)) (store mapRest!38469 mapKey!38469 mapValue!38469))))

(declare-fun b!1038820 () Bool)

(assert (=> b!1038820 (= e!587747 tp_is_empty!24625)))

(declare-fun e!587745 () Bool)

(declare-fun array_inv!24351 (array!65405) Bool)

(declare-fun array_inv!24352 (array!65407) Bool)

(assert (=> b!1038821 (= e!587744 (and tp!73863 tp_is_empty!24625 (array_inv!24351 (_keys!11523 thiss!1427)) (array_inv!24352 (_values!6311 thiss!1427)) e!587745))))

(declare-fun b!1038822 () Bool)

(declare-fun e!587748 () Bool)

(declare-datatypes ((List!21909 0))(
  ( (Nil!21906) (Cons!21905 (h!23117 (_ BitVec 64)) (t!31115 List!21909)) )
))
(declare-fun noDuplicate!1486 (List!21909) Bool)

(assert (=> b!1038822 (= e!587748 (noDuplicate!1486 Nil!21906))))

(declare-fun b!1038823 () Bool)

(assert (=> b!1038823 (= e!587745 (and e!587750 mapRes!38469))))

(declare-fun condMapEmpty!38469 () Bool)

(declare-fun mapDefault!38469 () ValueCell!11609)

(assert (=> b!1038823 (= condMapEmpty!38469 (= (arr!31478 (_values!6311 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11609)) mapDefault!38469)))))

(declare-fun b!1038824 () Bool)

(declare-fun res!692718 () Bool)

(assert (=> b!1038824 (=> (not res!692718) (not e!587746))))

(assert (=> b!1038824 (= res!692718 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038825 () Bool)

(assert (=> b!1038825 (= e!587749 (not e!587748))))

(declare-fun res!692719 () Bool)

(assert (=> b!1038825 (=> res!692719 e!587748)))

(assert (=> b!1038825 (= res!692719 (or (bvsge (size!32008 (_keys!11523 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65405 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038825 (= (arrayCountValidKeys!0 (array!65406 (store (arr!31477 (_keys!11523 thiss!1427)) (index!41220 lt!458026) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32008 (_keys!11523 thiss!1427))) #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11523 thiss!1427) #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33955 0))(
  ( (Unit!33956) )
))
(declare-fun lt!458027 () Unit!33955)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65405 (_ BitVec 32) (_ BitVec 64)) Unit!33955)

(assert (=> b!1038825 (= lt!458027 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11523 thiss!1427) (index!41220 lt!458026) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38469 () Bool)

(assert (=> mapIsEmpty!38469 mapRes!38469))

(assert (= (and start!90974 res!692721) b!1038824))

(assert (= (and b!1038824 res!692718) b!1038819))

(assert (= (and b!1038819 res!692720) b!1038825))

(assert (= (and b!1038825 (not res!692719)) b!1038822))

(assert (= (and b!1038823 condMapEmpty!38469) mapIsEmpty!38469))

(assert (= (and b!1038823 (not condMapEmpty!38469)) mapNonEmpty!38469))

(assert (= (and mapNonEmpty!38469 ((_ is ValueCellFull!11609) mapValue!38469)) b!1038820))

(assert (= (and b!1038823 ((_ is ValueCellFull!11609) mapDefault!38469)) b!1038818))

(assert (= b!1038821 b!1038823))

(assert (= start!90974 b!1038821))

(declare-fun m!959359 () Bool)

(assert (=> b!1038825 m!959359))

(declare-fun m!959361 () Bool)

(assert (=> b!1038825 m!959361))

(declare-fun m!959363 () Bool)

(assert (=> b!1038825 m!959363))

(declare-fun m!959365 () Bool)

(assert (=> b!1038825 m!959365))

(declare-fun m!959367 () Bool)

(assert (=> b!1038819 m!959367))

(declare-fun m!959369 () Bool)

(assert (=> mapNonEmpty!38469 m!959369))

(declare-fun m!959371 () Bool)

(assert (=> b!1038822 m!959371))

(declare-fun m!959373 () Bool)

(assert (=> start!90974 m!959373))

(declare-fun m!959375 () Bool)

(assert (=> b!1038821 m!959375))

(declare-fun m!959377 () Bool)

(assert (=> b!1038821 m!959377))

(check-sat (not b_next!20905) (not mapNonEmpty!38469) tp_is_empty!24625 (not b!1038825) (not b!1038821) (not b!1038819) (not start!90974) (not b!1038822) b_and!33447)
(check-sat b_and!33447 (not b_next!20905))
(get-model)

(declare-fun d!125703 () Bool)

(assert (=> d!125703 (= (array_inv!24351 (_keys!11523 thiss!1427)) (bvsge (size!32008 (_keys!11523 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038821 d!125703))

(declare-fun d!125705 () Bool)

(assert (=> d!125705 (= (array_inv!24352 (_values!6311 thiss!1427)) (bvsge (size!32009 (_values!6311 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038821 d!125705))

(declare-fun d!125707 () Bool)

(declare-fun res!692750 () Bool)

(declare-fun e!587804 () Bool)

(assert (=> d!125707 (=> res!692750 e!587804)))

(assert (=> d!125707 (= res!692750 ((_ is Nil!21906) Nil!21906))))

(assert (=> d!125707 (= (noDuplicate!1486 Nil!21906) e!587804)))

(declare-fun b!1038878 () Bool)

(declare-fun e!587805 () Bool)

(assert (=> b!1038878 (= e!587804 e!587805)))

(declare-fun res!692751 () Bool)

(assert (=> b!1038878 (=> (not res!692751) (not e!587805))))

(declare-fun contains!6050 (List!21909 (_ BitVec 64)) Bool)

(assert (=> b!1038878 (= res!692751 (not (contains!6050 (t!31115 Nil!21906) (h!23117 Nil!21906))))))

(declare-fun b!1038879 () Bool)

(assert (=> b!1038879 (= e!587805 (noDuplicate!1486 (t!31115 Nil!21906)))))

(assert (= (and d!125707 (not res!692750)) b!1038878))

(assert (= (and b!1038878 res!692751) b!1038879))

(declare-fun m!959419 () Bool)

(assert (=> b!1038878 m!959419))

(declare-fun m!959421 () Bool)

(assert (=> b!1038879 m!959421))

(assert (=> b!1038822 d!125707))

(declare-fun b!1038892 () Bool)

(declare-fun c!105541 () Bool)

(declare-fun lt!458048 () (_ BitVec 64))

(assert (=> b!1038892 (= c!105541 (= lt!458048 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587813 () SeekEntryResult!9712)

(declare-fun e!587812 () SeekEntryResult!9712)

(assert (=> b!1038892 (= e!587813 e!587812)))

(declare-fun d!125709 () Bool)

(declare-fun lt!458049 () SeekEntryResult!9712)

(assert (=> d!125709 (and (or ((_ is MissingVacant!9712) lt!458049) (not ((_ is Found!9712) lt!458049)) (and (bvsge (index!41220 lt!458049) #b00000000000000000000000000000000) (bvslt (index!41220 lt!458049) (size!32008 (_keys!11523 thiss!1427))))) (not ((_ is MissingVacant!9712) lt!458049)) (or (not ((_ is Found!9712) lt!458049)) (= (select (arr!31477 (_keys!11523 thiss!1427)) (index!41220 lt!458049)) key!909)))))

(declare-fun e!587814 () SeekEntryResult!9712)

(assert (=> d!125709 (= lt!458049 e!587814)))

(declare-fun c!105542 () Bool)

(declare-fun lt!458051 () SeekEntryResult!9712)

(assert (=> d!125709 (= c!105542 (and ((_ is Intermediate!9712) lt!458051) (undefined!10524 lt!458051)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65405 (_ BitVec 32)) SeekEntryResult!9712)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125709 (= lt!458051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30270 thiss!1427)) key!909 (_keys!11523 thiss!1427) (mask!30270 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125709 (validMask!0 (mask!30270 thiss!1427))))

(assert (=> d!125709 (= (seekEntry!0 key!909 (_keys!11523 thiss!1427) (mask!30270 thiss!1427)) lt!458049)))

(declare-fun b!1038893 () Bool)

(declare-fun lt!458050 () SeekEntryResult!9712)

(assert (=> b!1038893 (= e!587812 (ite ((_ is MissingVacant!9712) lt!458050) (MissingZero!9712 (index!41222 lt!458050)) lt!458050))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65405 (_ BitVec 32)) SeekEntryResult!9712)

(assert (=> b!1038893 (= lt!458050 (seekKeyOrZeroReturnVacant!0 (x!92541 lt!458051) (index!41221 lt!458051) (index!41221 lt!458051) key!909 (_keys!11523 thiss!1427) (mask!30270 thiss!1427)))))

(declare-fun b!1038894 () Bool)

(assert (=> b!1038894 (= e!587813 (Found!9712 (index!41221 lt!458051)))))

(declare-fun b!1038895 () Bool)

(assert (=> b!1038895 (= e!587812 (MissingZero!9712 (index!41221 lt!458051)))))

(declare-fun b!1038896 () Bool)

(assert (=> b!1038896 (= e!587814 Undefined!9712)))

(declare-fun b!1038897 () Bool)

(assert (=> b!1038897 (= e!587814 e!587813)))

(assert (=> b!1038897 (= lt!458048 (select (arr!31477 (_keys!11523 thiss!1427)) (index!41221 lt!458051)))))

(declare-fun c!105543 () Bool)

(assert (=> b!1038897 (= c!105543 (= lt!458048 key!909))))

(assert (= (and d!125709 c!105542) b!1038896))

(assert (= (and d!125709 (not c!105542)) b!1038897))

(assert (= (and b!1038897 c!105543) b!1038894))

(assert (= (and b!1038897 (not c!105543)) b!1038892))

(assert (= (and b!1038892 c!105541) b!1038895))

(assert (= (and b!1038892 (not c!105541)) b!1038893))

(declare-fun m!959423 () Bool)

(assert (=> d!125709 m!959423))

(declare-fun m!959425 () Bool)

(assert (=> d!125709 m!959425))

(assert (=> d!125709 m!959425))

(declare-fun m!959427 () Bool)

(assert (=> d!125709 m!959427))

(declare-fun m!959429 () Bool)

(assert (=> d!125709 m!959429))

(declare-fun m!959431 () Bool)

(assert (=> b!1038893 m!959431))

(declare-fun m!959433 () Bool)

(assert (=> b!1038897 m!959433))

(assert (=> b!1038819 d!125709))

(declare-fun d!125711 () Bool)

(declare-fun res!692758 () Bool)

(declare-fun e!587817 () Bool)

(assert (=> d!125711 (=> (not res!692758) (not e!587817))))

(declare-fun simpleValid!418 (LongMapFixedSize!5812) Bool)

(assert (=> d!125711 (= res!692758 (simpleValid!418 thiss!1427))))

(assert (=> d!125711 (= (valid!2197 thiss!1427) e!587817)))

(declare-fun b!1038904 () Bool)

(declare-fun res!692759 () Bool)

(assert (=> b!1038904 (=> (not res!692759) (not e!587817))))

(assert (=> b!1038904 (= res!692759 (= (arrayCountValidKeys!0 (_keys!11523 thiss!1427) #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))) (_size!2961 thiss!1427)))))

(declare-fun b!1038905 () Bool)

(declare-fun res!692760 () Bool)

(assert (=> b!1038905 (=> (not res!692760) (not e!587817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65405 (_ BitVec 32)) Bool)

(assert (=> b!1038905 (= res!692760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11523 thiss!1427) (mask!30270 thiss!1427)))))

(declare-fun b!1038906 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65405 (_ BitVec 32) List!21909) Bool)

(assert (=> b!1038906 (= e!587817 (arrayNoDuplicates!0 (_keys!11523 thiss!1427) #b00000000000000000000000000000000 Nil!21906))))

(assert (= (and d!125711 res!692758) b!1038904))

(assert (= (and b!1038904 res!692759) b!1038905))

(assert (= (and b!1038905 res!692760) b!1038906))

(declare-fun m!959435 () Bool)

(assert (=> d!125711 m!959435))

(assert (=> b!1038904 m!959363))

(declare-fun m!959437 () Bool)

(assert (=> b!1038905 m!959437))

(declare-fun m!959439 () Bool)

(assert (=> b!1038906 m!959439))

(assert (=> start!90974 d!125711))

(declare-fun b!1038915 () Bool)

(declare-fun e!587823 () (_ BitVec 32))

(assert (=> b!1038915 (= e!587823 #b00000000000000000000000000000000)))

(declare-fun d!125713 () Bool)

(declare-fun lt!458054 () (_ BitVec 32))

(assert (=> d!125713 (and (bvsge lt!458054 #b00000000000000000000000000000000) (bvsle lt!458054 (bvsub (size!32008 (array!65406 (store (arr!31477 (_keys!11523 thiss!1427)) (index!41220 lt!458026) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32008 (_keys!11523 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125713 (= lt!458054 e!587823)))

(declare-fun c!105549 () Bool)

(assert (=> d!125713 (= c!105549 (bvsge #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))))))

(assert (=> d!125713 (and (bvsle #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32008 (_keys!11523 thiss!1427)) (size!32008 (array!65406 (store (arr!31477 (_keys!11523 thiss!1427)) (index!41220 lt!458026) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32008 (_keys!11523 thiss!1427))))))))

(assert (=> d!125713 (= (arrayCountValidKeys!0 (array!65406 (store (arr!31477 (_keys!11523 thiss!1427)) (index!41220 lt!458026) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32008 (_keys!11523 thiss!1427))) #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))) lt!458054)))

(declare-fun bm!43986 () Bool)

(declare-fun call!43989 () (_ BitVec 32))

(assert (=> bm!43986 (= call!43989 (arrayCountValidKeys!0 (array!65406 (store (arr!31477 (_keys!11523 thiss!1427)) (index!41220 lt!458026) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32008 (_keys!11523 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32008 (_keys!11523 thiss!1427))))))

(declare-fun b!1038916 () Bool)

(declare-fun e!587822 () (_ BitVec 32))

(assert (=> b!1038916 (= e!587823 e!587822)))

(declare-fun c!105548 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038916 (= c!105548 (validKeyInArray!0 (select (arr!31477 (array!65406 (store (arr!31477 (_keys!11523 thiss!1427)) (index!41220 lt!458026) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32008 (_keys!11523 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1038917 () Bool)

(assert (=> b!1038917 (= e!587822 call!43989)))

(declare-fun b!1038918 () Bool)

(assert (=> b!1038918 (= e!587822 (bvadd #b00000000000000000000000000000001 call!43989))))

(assert (= (and d!125713 c!105549) b!1038915))

(assert (= (and d!125713 (not c!105549)) b!1038916))

(assert (= (and b!1038916 c!105548) b!1038918))

(assert (= (and b!1038916 (not c!105548)) b!1038917))

(assert (= (or b!1038918 b!1038917) bm!43986))

(declare-fun m!959441 () Bool)

(assert (=> bm!43986 m!959441))

(declare-fun m!959443 () Bool)

(assert (=> b!1038916 m!959443))

(assert (=> b!1038916 m!959443))

(declare-fun m!959445 () Bool)

(assert (=> b!1038916 m!959445))

(assert (=> b!1038825 d!125713))

(declare-fun b!1038919 () Bool)

(declare-fun e!587825 () (_ BitVec 32))

(assert (=> b!1038919 (= e!587825 #b00000000000000000000000000000000)))

(declare-fun d!125715 () Bool)

(declare-fun lt!458055 () (_ BitVec 32))

(assert (=> d!125715 (and (bvsge lt!458055 #b00000000000000000000000000000000) (bvsle lt!458055 (bvsub (size!32008 (_keys!11523 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125715 (= lt!458055 e!587825)))

(declare-fun c!105551 () Bool)

(assert (=> d!125715 (= c!105551 (bvsge #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))))))

(assert (=> d!125715 (and (bvsle #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32008 (_keys!11523 thiss!1427)) (size!32008 (_keys!11523 thiss!1427))))))

(assert (=> d!125715 (= (arrayCountValidKeys!0 (_keys!11523 thiss!1427) #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))) lt!458055)))

(declare-fun bm!43987 () Bool)

(declare-fun call!43990 () (_ BitVec 32))

(assert (=> bm!43987 (= call!43990 (arrayCountValidKeys!0 (_keys!11523 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32008 (_keys!11523 thiss!1427))))))

(declare-fun b!1038920 () Bool)

(declare-fun e!587824 () (_ BitVec 32))

(assert (=> b!1038920 (= e!587825 e!587824)))

(declare-fun c!105550 () Bool)

(assert (=> b!1038920 (= c!105550 (validKeyInArray!0 (select (arr!31477 (_keys!11523 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038921 () Bool)

(assert (=> b!1038921 (= e!587824 call!43990)))

(declare-fun b!1038922 () Bool)

(assert (=> b!1038922 (= e!587824 (bvadd #b00000000000000000000000000000001 call!43990))))

(assert (= (and d!125715 c!105551) b!1038919))

(assert (= (and d!125715 (not c!105551)) b!1038920))

(assert (= (and b!1038920 c!105550) b!1038922))

(assert (= (and b!1038920 (not c!105550)) b!1038921))

(assert (= (or b!1038922 b!1038921) bm!43987))

(declare-fun m!959447 () Bool)

(assert (=> bm!43987 m!959447))

(declare-fun m!959449 () Bool)

(assert (=> b!1038920 m!959449))

(assert (=> b!1038920 m!959449))

(declare-fun m!959451 () Bool)

(assert (=> b!1038920 m!959451))

(assert (=> b!1038825 d!125715))

(declare-fun b!1038934 () Bool)

(declare-fun e!587830 () Bool)

(assert (=> b!1038934 (= e!587830 (= (arrayCountValidKeys!0 (array!65406 (store (arr!31477 (_keys!11523 thiss!1427)) (index!41220 lt!458026) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32008 (_keys!11523 thiss!1427))) #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11523 thiss!1427) #b00000000000000000000000000000000 (size!32008 (_keys!11523 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1038932 () Bool)

(declare-fun res!692772 () Bool)

(declare-fun e!587831 () Bool)

(assert (=> b!1038932 (=> (not res!692772) (not e!587831))))

(assert (=> b!1038932 (= res!692772 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125717 () Bool)

(assert (=> d!125717 e!587830))

(declare-fun res!692771 () Bool)

(assert (=> d!125717 (=> (not res!692771) (not e!587830))))

(assert (=> d!125717 (= res!692771 (and (bvsge (index!41220 lt!458026) #b00000000000000000000000000000000) (bvslt (index!41220 lt!458026) (size!32008 (_keys!11523 thiss!1427)))))))

(declare-fun lt!458058 () Unit!33955)

(declare-fun choose!82 (array!65405 (_ BitVec 32) (_ BitVec 64)) Unit!33955)

(assert (=> d!125717 (= lt!458058 (choose!82 (_keys!11523 thiss!1427) (index!41220 lt!458026) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125717 e!587831))

(declare-fun res!692769 () Bool)

(assert (=> d!125717 (=> (not res!692769) (not e!587831))))

(assert (=> d!125717 (= res!692769 (and (bvsge (index!41220 lt!458026) #b00000000000000000000000000000000) (bvslt (index!41220 lt!458026) (size!32008 (_keys!11523 thiss!1427)))))))

(assert (=> d!125717 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11523 thiss!1427) (index!41220 lt!458026) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458058)))

(declare-fun b!1038933 () Bool)

(assert (=> b!1038933 (= e!587831 (bvslt (size!32008 (_keys!11523 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038931 () Bool)

(declare-fun res!692770 () Bool)

(assert (=> b!1038931 (=> (not res!692770) (not e!587831))))

(assert (=> b!1038931 (= res!692770 (validKeyInArray!0 (select (arr!31477 (_keys!11523 thiss!1427)) (index!41220 lt!458026))))))

(assert (= (and d!125717 res!692769) b!1038931))

(assert (= (and b!1038931 res!692770) b!1038932))

(assert (= (and b!1038932 res!692772) b!1038933))

(assert (= (and d!125717 res!692771) b!1038934))

(assert (=> b!1038934 m!959359))

(assert (=> b!1038934 m!959361))

(assert (=> b!1038934 m!959363))

(declare-fun m!959453 () Bool)

(assert (=> b!1038932 m!959453))

(declare-fun m!959455 () Bool)

(assert (=> d!125717 m!959455))

(declare-fun m!959457 () Bool)

(assert (=> b!1038931 m!959457))

(assert (=> b!1038931 m!959457))

(declare-fun m!959459 () Bool)

(assert (=> b!1038931 m!959459))

(assert (=> b!1038825 d!125717))

(declare-fun condMapEmpty!38478 () Bool)

(declare-fun mapDefault!38478 () ValueCell!11609)

(assert (=> mapNonEmpty!38469 (= condMapEmpty!38478 (= mapRest!38469 ((as const (Array (_ BitVec 32) ValueCell!11609)) mapDefault!38478)))))

(declare-fun e!587836 () Bool)

(declare-fun mapRes!38478 () Bool)

(assert (=> mapNonEmpty!38469 (= tp!73864 (and e!587836 mapRes!38478))))

(declare-fun mapNonEmpty!38478 () Bool)

(declare-fun tp!73879 () Bool)

(declare-fun e!587837 () Bool)

(assert (=> mapNonEmpty!38478 (= mapRes!38478 (and tp!73879 e!587837))))

(declare-fun mapRest!38478 () (Array (_ BitVec 32) ValueCell!11609))

(declare-fun mapKey!38478 () (_ BitVec 32))

(declare-fun mapValue!38478 () ValueCell!11609)

(assert (=> mapNonEmpty!38478 (= mapRest!38469 (store mapRest!38478 mapKey!38478 mapValue!38478))))

(declare-fun b!1038942 () Bool)

(assert (=> b!1038942 (= e!587836 tp_is_empty!24625)))

(declare-fun mapIsEmpty!38478 () Bool)

(assert (=> mapIsEmpty!38478 mapRes!38478))

(declare-fun b!1038941 () Bool)

(assert (=> b!1038941 (= e!587837 tp_is_empty!24625)))

(assert (= (and mapNonEmpty!38469 condMapEmpty!38478) mapIsEmpty!38478))

(assert (= (and mapNonEmpty!38469 (not condMapEmpty!38478)) mapNonEmpty!38478))

(assert (= (and mapNonEmpty!38478 ((_ is ValueCellFull!11609) mapValue!38478)) b!1038941))

(assert (= (and mapNonEmpty!38469 ((_ is ValueCellFull!11609) mapDefault!38478)) b!1038942))

(declare-fun m!959461 () Bool)

(assert (=> mapNonEmpty!38478 m!959461))

(check-sat (not d!125711) (not b!1038878) tp_is_empty!24625 (not b!1038879) (not b!1038905) (not b!1038934) (not b!1038920) (not b!1038904) (not mapNonEmpty!38478) (not b!1038931) (not bm!43987) (not b!1038906) (not b!1038916) (not bm!43986) (not b_next!20905) (not d!125717) (not b!1038932) (not b!1038893) (not d!125709) b_and!33447)
(check-sat b_and!33447 (not b_next!20905))
