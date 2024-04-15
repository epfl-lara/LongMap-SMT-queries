; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90930 () Bool)

(assert start!90930)

(declare-fun b!1038814 () Bool)

(declare-fun b_free!20959 () Bool)

(declare-fun b_next!20959 () Bool)

(assert (=> b!1038814 (= b_free!20959 (not b_next!20959))))

(declare-fun tp!74047 () Bool)

(declare-fun b_and!33465 () Bool)

(assert (=> b!1038814 (= tp!74047 b_and!33465)))

(declare-fun b!1038812 () Bool)

(declare-fun e!587861 () Bool)

(declare-fun tp_is_empty!24679 () Bool)

(assert (=> b!1038812 (= e!587861 tp_is_empty!24679)))

(declare-fun b!1038813 () Bool)

(declare-fun e!587865 () Bool)

(assert (=> b!1038813 (= e!587865 tp_is_empty!24679)))

(declare-fun e!587866 () Bool)

(declare-fun e!587868 () Bool)

(declare-datatypes ((V!37779 0))(
  ( (V!37780 (val!12390 Int)) )
))
(declare-datatypes ((ValueCell!11636 0))(
  ( (ValueCellFull!11636 (v!14976 V!37779)) (EmptyCell!11636) )
))
(declare-datatypes ((array!65417 0))(
  ( (array!65418 (arr!31482 (Array (_ BitVec 32) (_ BitVec 64))) (size!32015 (_ BitVec 32))) )
))
(declare-datatypes ((array!65419 0))(
  ( (array!65420 (arr!31483 (Array (_ BitVec 32) ValueCell!11636)) (size!32016 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5866 0))(
  ( (LongMapFixedSize!5867 (defaultEntry!6315 Int) (mask!30264 (_ BitVec 32)) (extraKeys!6043 (_ BitVec 32)) (zeroValue!6149 V!37779) (minValue!6149 V!37779) (_size!2988 (_ BitVec 32)) (_keys!11518 array!65417) (_values!6338 array!65419) (_vacant!2988 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5866)

(declare-fun array_inv!24343 (array!65417) Bool)

(declare-fun array_inv!24344 (array!65419) Bool)

(assert (=> b!1038814 (= e!587866 (and tp!74047 tp_is_empty!24679 (array_inv!24343 (_keys!11518 thiss!1427)) (array_inv!24344 (_values!6338 thiss!1427)) e!587868))))

(declare-fun mapIsEmpty!38572 () Bool)

(declare-fun mapRes!38572 () Bool)

(assert (=> mapIsEmpty!38572 mapRes!38572))

(declare-fun b!1038815 () Bool)

(declare-fun res!692895 () Bool)

(declare-fun e!587862 () Bool)

(assert (=> b!1038815 (=> (not res!692895) (not e!587862))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038815 (= res!692895 (not (= key!909 (bvneg key!909))))))

(declare-fun res!692892 () Bool)

(assert (=> start!90930 (=> (not res!692892) (not e!587862))))

(declare-fun valid!2199 (LongMapFixedSize!5866) Bool)

(assert (=> start!90930 (= res!692892 (valid!2199 thiss!1427))))

(assert (=> start!90930 e!587862))

(assert (=> start!90930 e!587866))

(assert (=> start!90930 true))

(declare-fun mapNonEmpty!38572 () Bool)

(declare-fun tp!74048 () Bool)

(assert (=> mapNonEmpty!38572 (= mapRes!38572 (and tp!74048 e!587865))))

(declare-fun mapKey!38572 () (_ BitVec 32))

(declare-fun mapValue!38572 () ValueCell!11636)

(declare-fun mapRest!38572 () (Array (_ BitVec 32) ValueCell!11636))

(assert (=> mapNonEmpty!38572 (= (arr!31483 (_values!6338 thiss!1427)) (store mapRest!38572 mapKey!38572 mapValue!38572))))

(declare-fun b!1038816 () Bool)

(declare-fun e!587864 () Bool)

(declare-fun e!587867 () Bool)

(assert (=> b!1038816 (= e!587864 (not e!587867))))

(declare-fun res!692893 () Bool)

(assert (=> b!1038816 (=> res!692893 e!587867)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038816 (= res!692893 (not (validMask!0 (mask!30264 thiss!1427))))))

(declare-fun lt!457730 () array!65417)

(declare-datatypes ((List!21977 0))(
  ( (Nil!21974) (Cons!21973 (h!23177 (_ BitVec 64)) (t!31182 List!21977)) )
))
(declare-fun arrayNoDuplicates!0 (array!65417 (_ BitVec 32) List!21977) Bool)

(assert (=> b!1038816 (arrayNoDuplicates!0 lt!457730 #b00000000000000000000000000000000 Nil!21974)))

(declare-datatypes ((Unit!33867 0))(
  ( (Unit!33868) )
))
(declare-fun lt!457727 () Unit!33867)

(declare-datatypes ((SeekEntryResult!9771 0))(
  ( (MissingZero!9771 (index!41455 (_ BitVec 32))) (Found!9771 (index!41456 (_ BitVec 32))) (Intermediate!9771 (undefined!10583 Bool) (index!41457 (_ BitVec 32)) (x!92712 (_ BitVec 32))) (Undefined!9771) (MissingVacant!9771 (index!41458 (_ BitVec 32))) )
))
(declare-fun lt!457728 () SeekEntryResult!9771)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65417 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21977) Unit!33867)

(assert (=> b!1038816 (= lt!457727 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11518 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41456 lt!457728) #b00000000000000000000000000000000 Nil!21974))))

(declare-fun arrayCountValidKeys!0 (array!65417 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038816 (= (arrayCountValidKeys!0 lt!457730 #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11518 thiss!1427) #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038816 (= lt!457730 (array!65418 (store (arr!31482 (_keys!11518 thiss!1427)) (index!41456 lt!457728) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32015 (_keys!11518 thiss!1427))))))

(declare-fun lt!457729 () Unit!33867)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65417 (_ BitVec 32) (_ BitVec 64)) Unit!33867)

(assert (=> b!1038816 (= lt!457729 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11518 thiss!1427) (index!41456 lt!457728) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038817 () Bool)

(assert (=> b!1038817 (= e!587862 e!587864)))

(declare-fun res!692894 () Bool)

(assert (=> b!1038817 (=> (not res!692894) (not e!587864))))

(get-info :version)

(assert (=> b!1038817 (= res!692894 ((_ is Found!9771) lt!457728))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65417 (_ BitVec 32)) SeekEntryResult!9771)

(assert (=> b!1038817 (= lt!457728 (seekEntry!0 key!909 (_keys!11518 thiss!1427) (mask!30264 thiss!1427)))))

(declare-fun b!1038818 () Bool)

(assert (=> b!1038818 (= e!587867 (or (not (= (size!32015 (_keys!11518 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30264 thiss!1427)))) (bvslt (index!41456 lt!457728) #b00000000000000000000000000000000) (bvslt (index!41456 lt!457728) (size!32015 (_keys!11518 thiss!1427)))))))

(declare-fun b!1038819 () Bool)

(assert (=> b!1038819 (= e!587868 (and e!587861 mapRes!38572))))

(declare-fun condMapEmpty!38572 () Bool)

(declare-fun mapDefault!38572 () ValueCell!11636)

(assert (=> b!1038819 (= condMapEmpty!38572 (= (arr!31483 (_values!6338 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11636)) mapDefault!38572)))))

(assert (= (and start!90930 res!692892) b!1038815))

(assert (= (and b!1038815 res!692895) b!1038817))

(assert (= (and b!1038817 res!692894) b!1038816))

(assert (= (and b!1038816 (not res!692893)) b!1038818))

(assert (= (and b!1038819 condMapEmpty!38572) mapIsEmpty!38572))

(assert (= (and b!1038819 (not condMapEmpty!38572)) mapNonEmpty!38572))

(assert (= (and mapNonEmpty!38572 ((_ is ValueCellFull!11636) mapValue!38572)) b!1038813))

(assert (= (and b!1038819 ((_ is ValueCellFull!11636) mapDefault!38572)) b!1038812))

(assert (= b!1038814 b!1038819))

(assert (= start!90930 b!1038814))

(declare-fun m!958153 () Bool)

(assert (=> b!1038816 m!958153))

(declare-fun m!958155 () Bool)

(assert (=> b!1038816 m!958155))

(declare-fun m!958157 () Bool)

(assert (=> b!1038816 m!958157))

(declare-fun m!958159 () Bool)

(assert (=> b!1038816 m!958159))

(declare-fun m!958161 () Bool)

(assert (=> b!1038816 m!958161))

(declare-fun m!958163 () Bool)

(assert (=> b!1038816 m!958163))

(declare-fun m!958165 () Bool)

(assert (=> b!1038816 m!958165))

(declare-fun m!958167 () Bool)

(assert (=> mapNonEmpty!38572 m!958167))

(declare-fun m!958169 () Bool)

(assert (=> start!90930 m!958169))

(declare-fun m!958171 () Bool)

(assert (=> b!1038817 m!958171))

(declare-fun m!958173 () Bool)

(assert (=> b!1038814 m!958173))

(declare-fun m!958175 () Bool)

(assert (=> b!1038814 m!958175))

(check-sat (not start!90930) (not b!1038814) (not mapNonEmpty!38572) (not b_next!20959) (not b!1038817) (not b!1038816) b_and!33465 tp_is_empty!24679)
(check-sat b_and!33465 (not b_next!20959))
(get-model)

(declare-fun b!1038878 () Bool)

(declare-fun e!587921 () Bool)

(assert (=> b!1038878 (= e!587921 (bvslt (size!32015 (_keys!11518 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038876 () Bool)

(declare-fun res!692928 () Bool)

(assert (=> b!1038876 (=> (not res!692928) (not e!587921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038876 (= res!692928 (validKeyInArray!0 (select (arr!31482 (_keys!11518 thiss!1427)) (index!41456 lt!457728))))))

(declare-fun b!1038877 () Bool)

(declare-fun res!692930 () Bool)

(assert (=> b!1038877 (=> (not res!692930) (not e!587921))))

(assert (=> b!1038877 (= res!692930 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125285 () Bool)

(declare-fun e!587922 () Bool)

(assert (=> d!125285 e!587922))

(declare-fun res!692929 () Bool)

(assert (=> d!125285 (=> (not res!692929) (not e!587922))))

(assert (=> d!125285 (= res!692929 (and (bvsge (index!41456 lt!457728) #b00000000000000000000000000000000) (bvslt (index!41456 lt!457728) (size!32015 (_keys!11518 thiss!1427)))))))

(declare-fun lt!457757 () Unit!33867)

(declare-fun choose!82 (array!65417 (_ BitVec 32) (_ BitVec 64)) Unit!33867)

(assert (=> d!125285 (= lt!457757 (choose!82 (_keys!11518 thiss!1427) (index!41456 lt!457728) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125285 e!587921))

(declare-fun res!692931 () Bool)

(assert (=> d!125285 (=> (not res!692931) (not e!587921))))

(assert (=> d!125285 (= res!692931 (and (bvsge (index!41456 lt!457728) #b00000000000000000000000000000000) (bvslt (index!41456 lt!457728) (size!32015 (_keys!11518 thiss!1427)))))))

(assert (=> d!125285 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11518 thiss!1427) (index!41456 lt!457728) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457757)))

(declare-fun b!1038879 () Bool)

(assert (=> b!1038879 (= e!587922 (= (arrayCountValidKeys!0 (array!65418 (store (arr!31482 (_keys!11518 thiss!1427)) (index!41456 lt!457728) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32015 (_keys!11518 thiss!1427))) #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11518 thiss!1427) #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!125285 res!692931) b!1038876))

(assert (= (and b!1038876 res!692928) b!1038877))

(assert (= (and b!1038877 res!692930) b!1038878))

(assert (= (and d!125285 res!692929) b!1038879))

(declare-fun m!958225 () Bool)

(assert (=> b!1038876 m!958225))

(assert (=> b!1038876 m!958225))

(declare-fun m!958227 () Bool)

(assert (=> b!1038876 m!958227))

(declare-fun m!958229 () Bool)

(assert (=> b!1038877 m!958229))

(declare-fun m!958231 () Bool)

(assert (=> d!125285 m!958231))

(assert (=> b!1038879 m!958161))

(declare-fun m!958233 () Bool)

(assert (=> b!1038879 m!958233))

(assert (=> b!1038879 m!958159))

(assert (=> b!1038816 d!125285))

(declare-fun d!125287 () Bool)

(declare-fun lt!457760 () (_ BitVec 32))

(assert (=> d!125287 (and (bvsge lt!457760 #b00000000000000000000000000000000) (bvsle lt!457760 (bvsub (size!32015 lt!457730) #b00000000000000000000000000000000)))))

(declare-fun e!587927 () (_ BitVec 32))

(assert (=> d!125287 (= lt!457760 e!587927)))

(declare-fun c!105254 () Bool)

(assert (=> d!125287 (= c!105254 (bvsge #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))))))

(assert (=> d!125287 (and (bvsle #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32015 (_keys!11518 thiss!1427)) (size!32015 lt!457730)))))

(assert (=> d!125287 (= (arrayCountValidKeys!0 lt!457730 #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))) lt!457760)))

(declare-fun b!1038888 () Bool)

(declare-fun e!587928 () (_ BitVec 32))

(declare-fun call!43951 () (_ BitVec 32))

(assert (=> b!1038888 (= e!587928 (bvadd #b00000000000000000000000000000001 call!43951))))

(declare-fun b!1038889 () Bool)

(assert (=> b!1038889 (= e!587927 #b00000000000000000000000000000000)))

(declare-fun b!1038890 () Bool)

(assert (=> b!1038890 (= e!587928 call!43951)))

(declare-fun b!1038891 () Bool)

(assert (=> b!1038891 (= e!587927 e!587928)))

(declare-fun c!105255 () Bool)

(assert (=> b!1038891 (= c!105255 (validKeyInArray!0 (select (arr!31482 lt!457730) #b00000000000000000000000000000000)))))

(declare-fun bm!43948 () Bool)

(assert (=> bm!43948 (= call!43951 (arrayCountValidKeys!0 lt!457730 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32015 (_keys!11518 thiss!1427))))))

(assert (= (and d!125287 c!105254) b!1038889))

(assert (= (and d!125287 (not c!105254)) b!1038891))

(assert (= (and b!1038891 c!105255) b!1038888))

(assert (= (and b!1038891 (not c!105255)) b!1038890))

(assert (= (or b!1038888 b!1038890) bm!43948))

(declare-fun m!958235 () Bool)

(assert (=> b!1038891 m!958235))

(assert (=> b!1038891 m!958235))

(declare-fun m!958237 () Bool)

(assert (=> b!1038891 m!958237))

(declare-fun m!958239 () Bool)

(assert (=> bm!43948 m!958239))

(assert (=> b!1038816 d!125287))

(declare-fun d!125289 () Bool)

(assert (=> d!125289 (= (validMask!0 (mask!30264 thiss!1427)) (and (or (= (mask!30264 thiss!1427) #b00000000000000000000000000000111) (= (mask!30264 thiss!1427) #b00000000000000000000000000001111) (= (mask!30264 thiss!1427) #b00000000000000000000000000011111) (= (mask!30264 thiss!1427) #b00000000000000000000000000111111) (= (mask!30264 thiss!1427) #b00000000000000000000000001111111) (= (mask!30264 thiss!1427) #b00000000000000000000000011111111) (= (mask!30264 thiss!1427) #b00000000000000000000000111111111) (= (mask!30264 thiss!1427) #b00000000000000000000001111111111) (= (mask!30264 thiss!1427) #b00000000000000000000011111111111) (= (mask!30264 thiss!1427) #b00000000000000000000111111111111) (= (mask!30264 thiss!1427) #b00000000000000000001111111111111) (= (mask!30264 thiss!1427) #b00000000000000000011111111111111) (= (mask!30264 thiss!1427) #b00000000000000000111111111111111) (= (mask!30264 thiss!1427) #b00000000000000001111111111111111) (= (mask!30264 thiss!1427) #b00000000000000011111111111111111) (= (mask!30264 thiss!1427) #b00000000000000111111111111111111) (= (mask!30264 thiss!1427) #b00000000000001111111111111111111) (= (mask!30264 thiss!1427) #b00000000000011111111111111111111) (= (mask!30264 thiss!1427) #b00000000000111111111111111111111) (= (mask!30264 thiss!1427) #b00000000001111111111111111111111) (= (mask!30264 thiss!1427) #b00000000011111111111111111111111) (= (mask!30264 thiss!1427) #b00000000111111111111111111111111) (= (mask!30264 thiss!1427) #b00000001111111111111111111111111) (= (mask!30264 thiss!1427) #b00000011111111111111111111111111) (= (mask!30264 thiss!1427) #b00000111111111111111111111111111) (= (mask!30264 thiss!1427) #b00001111111111111111111111111111) (= (mask!30264 thiss!1427) #b00011111111111111111111111111111) (= (mask!30264 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30264 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1038816 d!125289))

(declare-fun d!125291 () Bool)

(declare-fun e!587931 () Bool)

(assert (=> d!125291 e!587931))

(declare-fun res!692934 () Bool)

(assert (=> d!125291 (=> (not res!692934) (not e!587931))))

(assert (=> d!125291 (= res!692934 (and (bvsge (index!41456 lt!457728) #b00000000000000000000000000000000) (bvslt (index!41456 lt!457728) (size!32015 (_keys!11518 thiss!1427)))))))

(declare-fun lt!457763 () Unit!33867)

(declare-fun choose!53 (array!65417 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21977) Unit!33867)

(assert (=> d!125291 (= lt!457763 (choose!53 (_keys!11518 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41456 lt!457728) #b00000000000000000000000000000000 Nil!21974))))

(assert (=> d!125291 (bvslt (size!32015 (_keys!11518 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125291 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11518 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41456 lt!457728) #b00000000000000000000000000000000 Nil!21974) lt!457763)))

(declare-fun b!1038894 () Bool)

(assert (=> b!1038894 (= e!587931 (arrayNoDuplicates!0 (array!65418 (store (arr!31482 (_keys!11518 thiss!1427)) (index!41456 lt!457728) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32015 (_keys!11518 thiss!1427))) #b00000000000000000000000000000000 Nil!21974))))

(assert (= (and d!125291 res!692934) b!1038894))

(declare-fun m!958241 () Bool)

(assert (=> d!125291 m!958241))

(assert (=> b!1038894 m!958161))

(declare-fun m!958243 () Bool)

(assert (=> b!1038894 m!958243))

(assert (=> b!1038816 d!125291))

(declare-fun b!1038905 () Bool)

(declare-fun e!587943 () Bool)

(declare-fun e!587942 () Bool)

(assert (=> b!1038905 (= e!587943 e!587942)))

(declare-fun res!692941 () Bool)

(assert (=> b!1038905 (=> (not res!692941) (not e!587942))))

(declare-fun e!587940 () Bool)

(assert (=> b!1038905 (= res!692941 (not e!587940))))

(declare-fun res!692943 () Bool)

(assert (=> b!1038905 (=> (not res!692943) (not e!587940))))

(assert (=> b!1038905 (= res!692943 (validKeyInArray!0 (select (arr!31482 lt!457730) #b00000000000000000000000000000000)))))

(declare-fun b!1038906 () Bool)

(declare-fun e!587941 () Bool)

(declare-fun call!43954 () Bool)

(assert (=> b!1038906 (= e!587941 call!43954)))

(declare-fun bm!43951 () Bool)

(declare-fun c!105258 () Bool)

(assert (=> bm!43951 (= call!43954 (arrayNoDuplicates!0 lt!457730 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105258 (Cons!21973 (select (arr!31482 lt!457730) #b00000000000000000000000000000000) Nil!21974) Nil!21974)))))

(declare-fun b!1038907 () Bool)

(assert (=> b!1038907 (= e!587941 call!43954)))

(declare-fun b!1038908 () Bool)

(declare-fun contains!6021 (List!21977 (_ BitVec 64)) Bool)

(assert (=> b!1038908 (= e!587940 (contains!6021 Nil!21974 (select (arr!31482 lt!457730) #b00000000000000000000000000000000)))))

(declare-fun d!125293 () Bool)

(declare-fun res!692942 () Bool)

(assert (=> d!125293 (=> res!692942 e!587943)))

(assert (=> d!125293 (= res!692942 (bvsge #b00000000000000000000000000000000 (size!32015 lt!457730)))))

(assert (=> d!125293 (= (arrayNoDuplicates!0 lt!457730 #b00000000000000000000000000000000 Nil!21974) e!587943)))

(declare-fun b!1038909 () Bool)

(assert (=> b!1038909 (= e!587942 e!587941)))

(assert (=> b!1038909 (= c!105258 (validKeyInArray!0 (select (arr!31482 lt!457730) #b00000000000000000000000000000000)))))

(assert (= (and d!125293 (not res!692942)) b!1038905))

(assert (= (and b!1038905 res!692943) b!1038908))

(assert (= (and b!1038905 res!692941) b!1038909))

(assert (= (and b!1038909 c!105258) b!1038906))

(assert (= (and b!1038909 (not c!105258)) b!1038907))

(assert (= (or b!1038906 b!1038907) bm!43951))

(assert (=> b!1038905 m!958235))

(assert (=> b!1038905 m!958235))

(assert (=> b!1038905 m!958237))

(assert (=> bm!43951 m!958235))

(declare-fun m!958245 () Bool)

(assert (=> bm!43951 m!958245))

(assert (=> b!1038908 m!958235))

(assert (=> b!1038908 m!958235))

(declare-fun m!958247 () Bool)

(assert (=> b!1038908 m!958247))

(assert (=> b!1038909 m!958235))

(assert (=> b!1038909 m!958235))

(assert (=> b!1038909 m!958237))

(assert (=> b!1038816 d!125293))

(declare-fun d!125295 () Bool)

(declare-fun lt!457764 () (_ BitVec 32))

(assert (=> d!125295 (and (bvsge lt!457764 #b00000000000000000000000000000000) (bvsle lt!457764 (bvsub (size!32015 (_keys!11518 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!587944 () (_ BitVec 32))

(assert (=> d!125295 (= lt!457764 e!587944)))

(declare-fun c!105259 () Bool)

(assert (=> d!125295 (= c!105259 (bvsge #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))))))

(assert (=> d!125295 (and (bvsle #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32015 (_keys!11518 thiss!1427)) (size!32015 (_keys!11518 thiss!1427))))))

(assert (=> d!125295 (= (arrayCountValidKeys!0 (_keys!11518 thiss!1427) #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))) lt!457764)))

(declare-fun b!1038910 () Bool)

(declare-fun e!587945 () (_ BitVec 32))

(declare-fun call!43955 () (_ BitVec 32))

(assert (=> b!1038910 (= e!587945 (bvadd #b00000000000000000000000000000001 call!43955))))

(declare-fun b!1038911 () Bool)

(assert (=> b!1038911 (= e!587944 #b00000000000000000000000000000000)))

(declare-fun b!1038912 () Bool)

(assert (=> b!1038912 (= e!587945 call!43955)))

(declare-fun b!1038913 () Bool)

(assert (=> b!1038913 (= e!587944 e!587945)))

(declare-fun c!105260 () Bool)

(assert (=> b!1038913 (= c!105260 (validKeyInArray!0 (select (arr!31482 (_keys!11518 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43952 () Bool)

(assert (=> bm!43952 (= call!43955 (arrayCountValidKeys!0 (_keys!11518 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32015 (_keys!11518 thiss!1427))))))

(assert (= (and d!125295 c!105259) b!1038911))

(assert (= (and d!125295 (not c!105259)) b!1038913))

(assert (= (and b!1038913 c!105260) b!1038910))

(assert (= (and b!1038913 (not c!105260)) b!1038912))

(assert (= (or b!1038910 b!1038912) bm!43952))

(declare-fun m!958249 () Bool)

(assert (=> b!1038913 m!958249))

(assert (=> b!1038913 m!958249))

(declare-fun m!958251 () Bool)

(assert (=> b!1038913 m!958251))

(declare-fun m!958253 () Bool)

(assert (=> bm!43952 m!958253))

(assert (=> b!1038816 d!125295))

(declare-fun d!125297 () Bool)

(declare-fun res!692950 () Bool)

(declare-fun e!587948 () Bool)

(assert (=> d!125297 (=> (not res!692950) (not e!587948))))

(declare-fun simpleValid!425 (LongMapFixedSize!5866) Bool)

(assert (=> d!125297 (= res!692950 (simpleValid!425 thiss!1427))))

(assert (=> d!125297 (= (valid!2199 thiss!1427) e!587948)))

(declare-fun b!1038920 () Bool)

(declare-fun res!692951 () Bool)

(assert (=> b!1038920 (=> (not res!692951) (not e!587948))))

(assert (=> b!1038920 (= res!692951 (= (arrayCountValidKeys!0 (_keys!11518 thiss!1427) #b00000000000000000000000000000000 (size!32015 (_keys!11518 thiss!1427))) (_size!2988 thiss!1427)))))

(declare-fun b!1038921 () Bool)

(declare-fun res!692952 () Bool)

(assert (=> b!1038921 (=> (not res!692952) (not e!587948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65417 (_ BitVec 32)) Bool)

(assert (=> b!1038921 (= res!692952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11518 thiss!1427) (mask!30264 thiss!1427)))))

(declare-fun b!1038922 () Bool)

(assert (=> b!1038922 (= e!587948 (arrayNoDuplicates!0 (_keys!11518 thiss!1427) #b00000000000000000000000000000000 Nil!21974))))

(assert (= (and d!125297 res!692950) b!1038920))

(assert (= (and b!1038920 res!692951) b!1038921))

(assert (= (and b!1038921 res!692952) b!1038922))

(declare-fun m!958255 () Bool)

(assert (=> d!125297 m!958255))

(assert (=> b!1038920 m!958159))

(declare-fun m!958257 () Bool)

(assert (=> b!1038921 m!958257))

(declare-fun m!958259 () Bool)

(assert (=> b!1038922 m!958259))

(assert (=> start!90930 d!125297))

(declare-fun d!125299 () Bool)

(assert (=> d!125299 (= (array_inv!24343 (_keys!11518 thiss!1427)) (bvsge (size!32015 (_keys!11518 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038814 d!125299))

(declare-fun d!125301 () Bool)

(assert (=> d!125301 (= (array_inv!24344 (_values!6338 thiss!1427)) (bvsge (size!32016 (_values!6338 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038814 d!125301))

(declare-fun b!1038935 () Bool)

(declare-fun e!587955 () SeekEntryResult!9771)

(declare-fun lt!457774 () SeekEntryResult!9771)

(assert (=> b!1038935 (= e!587955 (MissingZero!9771 (index!41457 lt!457774)))))

(declare-fun b!1038936 () Bool)

(declare-fun e!587956 () SeekEntryResult!9771)

(assert (=> b!1038936 (= e!587956 (Found!9771 (index!41457 lt!457774)))))

(declare-fun b!1038937 () Bool)

(declare-fun c!105269 () Bool)

(declare-fun lt!457773 () (_ BitVec 64))

(assert (=> b!1038937 (= c!105269 (= lt!457773 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038937 (= e!587956 e!587955)))

(declare-fun d!125303 () Bool)

(declare-fun lt!457775 () SeekEntryResult!9771)

(assert (=> d!125303 (and (or ((_ is MissingVacant!9771) lt!457775) (not ((_ is Found!9771) lt!457775)) (and (bvsge (index!41456 lt!457775) #b00000000000000000000000000000000) (bvslt (index!41456 lt!457775) (size!32015 (_keys!11518 thiss!1427))))) (not ((_ is MissingVacant!9771) lt!457775)) (or (not ((_ is Found!9771) lt!457775)) (= (select (arr!31482 (_keys!11518 thiss!1427)) (index!41456 lt!457775)) key!909)))))

(declare-fun e!587957 () SeekEntryResult!9771)

(assert (=> d!125303 (= lt!457775 e!587957)))

(declare-fun c!105267 () Bool)

(assert (=> d!125303 (= c!105267 (and ((_ is Intermediate!9771) lt!457774) (undefined!10583 lt!457774)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65417 (_ BitVec 32)) SeekEntryResult!9771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125303 (= lt!457774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30264 thiss!1427)) key!909 (_keys!11518 thiss!1427) (mask!30264 thiss!1427)))))

(assert (=> d!125303 (validMask!0 (mask!30264 thiss!1427))))

(assert (=> d!125303 (= (seekEntry!0 key!909 (_keys!11518 thiss!1427) (mask!30264 thiss!1427)) lt!457775)))

(declare-fun b!1038938 () Bool)

(assert (=> b!1038938 (= e!587957 Undefined!9771)))

(declare-fun b!1038939 () Bool)

(assert (=> b!1038939 (= e!587957 e!587956)))

(assert (=> b!1038939 (= lt!457773 (select (arr!31482 (_keys!11518 thiss!1427)) (index!41457 lt!457774)))))

(declare-fun c!105268 () Bool)

(assert (=> b!1038939 (= c!105268 (= lt!457773 key!909))))

(declare-fun b!1038940 () Bool)

(declare-fun lt!457776 () SeekEntryResult!9771)

(assert (=> b!1038940 (= e!587955 (ite ((_ is MissingVacant!9771) lt!457776) (MissingZero!9771 (index!41458 lt!457776)) lt!457776))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65417 (_ BitVec 32)) SeekEntryResult!9771)

(assert (=> b!1038940 (= lt!457776 (seekKeyOrZeroReturnVacant!0 (x!92712 lt!457774) (index!41457 lt!457774) (index!41457 lt!457774) key!909 (_keys!11518 thiss!1427) (mask!30264 thiss!1427)))))

(assert (= (and d!125303 c!105267) b!1038938))

(assert (= (and d!125303 (not c!105267)) b!1038939))

(assert (= (and b!1038939 c!105268) b!1038936))

(assert (= (and b!1038939 (not c!105268)) b!1038937))

(assert (= (and b!1038937 c!105269) b!1038935))

(assert (= (and b!1038937 (not c!105269)) b!1038940))

(declare-fun m!958261 () Bool)

(assert (=> d!125303 m!958261))

(declare-fun m!958263 () Bool)

(assert (=> d!125303 m!958263))

(assert (=> d!125303 m!958263))

(declare-fun m!958265 () Bool)

(assert (=> d!125303 m!958265))

(assert (=> d!125303 m!958163))

(declare-fun m!958267 () Bool)

(assert (=> b!1038939 m!958267))

(declare-fun m!958269 () Bool)

(assert (=> b!1038940 m!958269))

(assert (=> b!1038817 d!125303))

(declare-fun b!1038948 () Bool)

(declare-fun e!587962 () Bool)

(assert (=> b!1038948 (= e!587962 tp_is_empty!24679)))

(declare-fun condMapEmpty!38581 () Bool)

(declare-fun mapDefault!38581 () ValueCell!11636)

(assert (=> mapNonEmpty!38572 (= condMapEmpty!38581 (= mapRest!38572 ((as const (Array (_ BitVec 32) ValueCell!11636)) mapDefault!38581)))))

(declare-fun mapRes!38581 () Bool)

(assert (=> mapNonEmpty!38572 (= tp!74048 (and e!587962 mapRes!38581))))

(declare-fun mapNonEmpty!38581 () Bool)

(declare-fun tp!74063 () Bool)

(declare-fun e!587963 () Bool)

(assert (=> mapNonEmpty!38581 (= mapRes!38581 (and tp!74063 e!587963))))

(declare-fun mapRest!38581 () (Array (_ BitVec 32) ValueCell!11636))

(declare-fun mapValue!38581 () ValueCell!11636)

(declare-fun mapKey!38581 () (_ BitVec 32))

(assert (=> mapNonEmpty!38581 (= mapRest!38572 (store mapRest!38581 mapKey!38581 mapValue!38581))))

(declare-fun b!1038947 () Bool)

(assert (=> b!1038947 (= e!587963 tp_is_empty!24679)))

(declare-fun mapIsEmpty!38581 () Bool)

(assert (=> mapIsEmpty!38581 mapRes!38581))

(assert (= (and mapNonEmpty!38572 condMapEmpty!38581) mapIsEmpty!38581))

(assert (= (and mapNonEmpty!38572 (not condMapEmpty!38581)) mapNonEmpty!38581))

(assert (= (and mapNonEmpty!38581 ((_ is ValueCellFull!11636) mapValue!38581)) b!1038947))

(assert (= (and mapNonEmpty!38572 ((_ is ValueCellFull!11636) mapDefault!38581)) b!1038948))

(declare-fun m!958271 () Bool)

(assert (=> mapNonEmpty!38581 m!958271))

(check-sat (not b!1038879) (not b!1038905) (not bm!43951) (not bm!43948) (not b!1038909) (not d!125303) (not d!125285) (not d!125297) (not b!1038921) (not b!1038876) (not b!1038913) (not b!1038908) (not b!1038922) (not b!1038891) (not b!1038894) (not mapNonEmpty!38581) (not b!1038877) (not b!1038940) (not d!125291) (not b_next!20959) (not b!1038920) b_and!33465 tp_is_empty!24679 (not bm!43952))
(check-sat b_and!33465 (not b_next!20959))
