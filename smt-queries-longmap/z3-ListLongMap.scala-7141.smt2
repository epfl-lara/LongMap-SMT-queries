; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90724 () Bool)

(assert start!90724)

(declare-fun b!1037398 () Bool)

(declare-fun b_free!20901 () Bool)

(declare-fun b_next!20901 () Bool)

(assert (=> b!1037398 (= b_free!20901 (not b_next!20901))))

(declare-fun tp!73848 () Bool)

(declare-fun b_and!33433 () Bool)

(assert (=> b!1037398 (= tp!73848 b_and!33433)))

(declare-fun b!1037397 () Bool)

(declare-fun e!586826 () Bool)

(declare-datatypes ((V!37701 0))(
  ( (V!37702 (val!12361 Int)) )
))
(declare-datatypes ((ValueCell!11607 0))(
  ( (ValueCellFull!11607 (v!14944 V!37701)) (EmptyCell!11607) )
))
(declare-datatypes ((array!65346 0))(
  ( (array!65347 (arr!31455 (Array (_ BitVec 32) (_ BitVec 64))) (size!31985 (_ BitVec 32))) )
))
(declare-datatypes ((array!65348 0))(
  ( (array!65349 (arr!31456 (Array (_ BitVec 32) ValueCell!11607)) (size!31986 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5808 0))(
  ( (LongMapFixedSize!5809 (defaultEntry!6286 Int) (mask!30205 (_ BitVec 32)) (extraKeys!6014 (_ BitVec 32)) (zeroValue!6120 V!37701) (minValue!6120 V!37701) (_size!2959 (_ BitVec 32)) (_keys!11482 array!65346) (_values!6309 array!65348) (_vacant!2959 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5808)

(assert (=> b!1037397 (= e!586826 (not (or (bvsge (size!31985 (_keys!11482 thiss!1427)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))))))))

(declare-datatypes ((SeekEntryResult!9754 0))(
  ( (MissingZero!9754 (index!41387 (_ BitVec 32))) (Found!9754 (index!41388 (_ BitVec 32))) (Intermediate!9754 (undefined!10566 Bool) (index!41389 (_ BitVec 32)) (x!92545 (_ BitVec 32))) (Undefined!9754) (MissingVacant!9754 (index!41390 (_ BitVec 32))) )
))
(declare-fun lt!457480 () SeekEntryResult!9754)

(declare-fun arrayCountValidKeys!0 (array!65346 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037397 (= (arrayCountValidKeys!0 (array!65347 (store (arr!31455 (_keys!11482 thiss!1427)) (index!41388 lt!457480) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31985 (_keys!11482 thiss!1427))) #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11482 thiss!1427) #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33951 0))(
  ( (Unit!33952) )
))
(declare-fun lt!457481 () Unit!33951)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65346 (_ BitVec 32) (_ BitVec 64)) Unit!33951)

(assert (=> b!1037397 (= lt!457481 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11482 thiss!1427) (index!41388 lt!457480) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38460 () Bool)

(declare-fun mapRes!38460 () Bool)

(assert (=> mapIsEmpty!38460 mapRes!38460))

(declare-fun e!586830 () Bool)

(declare-fun tp_is_empty!24621 () Bool)

(declare-fun e!586825 () Bool)

(declare-fun array_inv!24329 (array!65346) Bool)

(declare-fun array_inv!24330 (array!65348) Bool)

(assert (=> b!1037398 (= e!586830 (and tp!73848 tp_is_empty!24621 (array_inv!24329 (_keys!11482 thiss!1427)) (array_inv!24330 (_values!6309 thiss!1427)) e!586825))))

(declare-fun b!1037399 () Bool)

(declare-fun res!692169 () Bool)

(declare-fun e!586828 () Bool)

(assert (=> b!1037399 (=> (not res!692169) (not e!586828))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037399 (= res!692169 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037400 () Bool)

(declare-fun e!586827 () Bool)

(assert (=> b!1037400 (= e!586827 tp_is_empty!24621)))

(declare-fun b!1037401 () Bool)

(assert (=> b!1037401 (= e!586828 e!586826)))

(declare-fun res!692167 () Bool)

(assert (=> b!1037401 (=> (not res!692167) (not e!586826))))

(get-info :version)

(assert (=> b!1037401 (= res!692167 ((_ is Found!9754) lt!457480))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65346 (_ BitVec 32)) SeekEntryResult!9754)

(assert (=> b!1037401 (= lt!457480 (seekEntry!0 key!909 (_keys!11482 thiss!1427) (mask!30205 thiss!1427)))))

(declare-fun mapNonEmpty!38460 () Bool)

(declare-fun tp!73849 () Bool)

(assert (=> mapNonEmpty!38460 (= mapRes!38460 (and tp!73849 e!586827))))

(declare-fun mapRest!38460 () (Array (_ BitVec 32) ValueCell!11607))

(declare-fun mapValue!38460 () ValueCell!11607)

(declare-fun mapKey!38460 () (_ BitVec 32))

(assert (=> mapNonEmpty!38460 (= (arr!31456 (_values!6309 thiss!1427)) (store mapRest!38460 mapKey!38460 mapValue!38460))))

(declare-fun b!1037402 () Bool)

(declare-fun e!586831 () Bool)

(assert (=> b!1037402 (= e!586825 (and e!586831 mapRes!38460))))

(declare-fun condMapEmpty!38460 () Bool)

(declare-fun mapDefault!38460 () ValueCell!11607)

(assert (=> b!1037402 (= condMapEmpty!38460 (= (arr!31456 (_values!6309 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11607)) mapDefault!38460)))))

(declare-fun b!1037396 () Bool)

(assert (=> b!1037396 (= e!586831 tp_is_empty!24621)))

(declare-fun res!692168 () Bool)

(assert (=> start!90724 (=> (not res!692168) (not e!586828))))

(declare-fun valid!2189 (LongMapFixedSize!5808) Bool)

(assert (=> start!90724 (= res!692168 (valid!2189 thiss!1427))))

(assert (=> start!90724 e!586828))

(assert (=> start!90724 e!586830))

(assert (=> start!90724 true))

(assert (= (and start!90724 res!692168) b!1037399))

(assert (= (and b!1037399 res!692169) b!1037401))

(assert (= (and b!1037401 res!692167) b!1037397))

(assert (= (and b!1037402 condMapEmpty!38460) mapIsEmpty!38460))

(assert (= (and b!1037402 (not condMapEmpty!38460)) mapNonEmpty!38460))

(assert (= (and mapNonEmpty!38460 ((_ is ValueCellFull!11607) mapValue!38460)) b!1037400))

(assert (= (and b!1037402 ((_ is ValueCellFull!11607) mapDefault!38460)) b!1037396))

(assert (= b!1037398 b!1037402))

(assert (= start!90724 b!1037398))

(declare-fun m!957619 () Bool)

(assert (=> b!1037401 m!957619))

(declare-fun m!957621 () Bool)

(assert (=> start!90724 m!957621))

(declare-fun m!957623 () Bool)

(assert (=> mapNonEmpty!38460 m!957623))

(declare-fun m!957625 () Bool)

(assert (=> b!1037397 m!957625))

(declare-fun m!957627 () Bool)

(assert (=> b!1037397 m!957627))

(declare-fun m!957629 () Bool)

(assert (=> b!1037397 m!957629))

(declare-fun m!957631 () Bool)

(assert (=> b!1037397 m!957631))

(declare-fun m!957633 () Bool)

(assert (=> b!1037398 m!957633))

(declare-fun m!957635 () Bool)

(assert (=> b!1037398 m!957635))

(check-sat (not b!1037397) b_and!33433 (not b!1037401) (not mapNonEmpty!38460) (not b!1037398) tp_is_empty!24621 (not start!90724) (not b_next!20901))
(check-sat b_and!33433 (not b_next!20901))
(get-model)

(declare-fun d!125225 () Bool)

(declare-fun res!692185 () Bool)

(declare-fun e!586855 () Bool)

(assert (=> d!125225 (=> (not res!692185) (not e!586855))))

(declare-fun simpleValid!417 (LongMapFixedSize!5808) Bool)

(assert (=> d!125225 (= res!692185 (simpleValid!417 thiss!1427))))

(assert (=> d!125225 (= (valid!2189 thiss!1427) e!586855)))

(declare-fun b!1037430 () Bool)

(declare-fun res!692186 () Bool)

(assert (=> b!1037430 (=> (not res!692186) (not e!586855))))

(assert (=> b!1037430 (= res!692186 (= (arrayCountValidKeys!0 (_keys!11482 thiss!1427) #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))) (_size!2959 thiss!1427)))))

(declare-fun b!1037431 () Bool)

(declare-fun res!692187 () Bool)

(assert (=> b!1037431 (=> (not res!692187) (not e!586855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65346 (_ BitVec 32)) Bool)

(assert (=> b!1037431 (= res!692187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11482 thiss!1427) (mask!30205 thiss!1427)))))

(declare-fun b!1037432 () Bool)

(declare-datatypes ((List!21923 0))(
  ( (Nil!21920) (Cons!21919 (h!23122 (_ BitVec 64)) (t!31137 List!21923)) )
))
(declare-fun arrayNoDuplicates!0 (array!65346 (_ BitVec 32) List!21923) Bool)

(assert (=> b!1037432 (= e!586855 (arrayNoDuplicates!0 (_keys!11482 thiss!1427) #b00000000000000000000000000000000 Nil!21920))))

(assert (= (and d!125225 res!692185) b!1037430))

(assert (= (and b!1037430 res!692186) b!1037431))

(assert (= (and b!1037431 res!692187) b!1037432))

(declare-fun m!957655 () Bool)

(assert (=> d!125225 m!957655))

(assert (=> b!1037430 m!957629))

(declare-fun m!957657 () Bool)

(assert (=> b!1037431 m!957657))

(declare-fun m!957659 () Bool)

(assert (=> b!1037432 m!957659))

(assert (=> start!90724 d!125225))

(declare-fun d!125227 () Bool)

(assert (=> d!125227 (= (array_inv!24329 (_keys!11482 thiss!1427)) (bvsge (size!31985 (_keys!11482 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037398 d!125227))

(declare-fun d!125229 () Bool)

(assert (=> d!125229 (= (array_inv!24330 (_values!6309 thiss!1427)) (bvsge (size!31986 (_values!6309 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037398 d!125229))

(declare-fun d!125231 () Bool)

(declare-fun lt!457490 () (_ BitVec 32))

(assert (=> d!125231 (and (bvsge lt!457490 #b00000000000000000000000000000000) (bvsle lt!457490 (bvsub (size!31985 (array!65347 (store (arr!31455 (_keys!11482 thiss!1427)) (index!41388 lt!457480) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31985 (_keys!11482 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!586861 () (_ BitVec 32))

(assert (=> d!125231 (= lt!457490 e!586861)))

(declare-fun c!105112 () Bool)

(assert (=> d!125231 (= c!105112 (bvsge #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))))))

(assert (=> d!125231 (and (bvsle #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31985 (_keys!11482 thiss!1427)) (size!31985 (array!65347 (store (arr!31455 (_keys!11482 thiss!1427)) (index!41388 lt!457480) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31985 (_keys!11482 thiss!1427))))))))

(assert (=> d!125231 (= (arrayCountValidKeys!0 (array!65347 (store (arr!31455 (_keys!11482 thiss!1427)) (index!41388 lt!457480) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31985 (_keys!11482 thiss!1427))) #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))) lt!457490)))

(declare-fun b!1037441 () Bool)

(declare-fun e!586860 () (_ BitVec 32))

(declare-fun call!43918 () (_ BitVec 32))

(assert (=> b!1037441 (= e!586860 (bvadd #b00000000000000000000000000000001 call!43918))))

(declare-fun b!1037442 () Bool)

(assert (=> b!1037442 (= e!586861 #b00000000000000000000000000000000)))

(declare-fun b!1037443 () Bool)

(assert (=> b!1037443 (= e!586860 call!43918)))

(declare-fun b!1037444 () Bool)

(assert (=> b!1037444 (= e!586861 e!586860)))

(declare-fun c!105113 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037444 (= c!105113 (validKeyInArray!0 (select (arr!31455 (array!65347 (store (arr!31455 (_keys!11482 thiss!1427)) (index!41388 lt!457480) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31985 (_keys!11482 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43915 () Bool)

(assert (=> bm!43915 (= call!43918 (arrayCountValidKeys!0 (array!65347 (store (arr!31455 (_keys!11482 thiss!1427)) (index!41388 lt!457480) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31985 (_keys!11482 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31985 (_keys!11482 thiss!1427))))))

(assert (= (and d!125231 c!105112) b!1037442))

(assert (= (and d!125231 (not c!105112)) b!1037444))

(assert (= (and b!1037444 c!105113) b!1037441))

(assert (= (and b!1037444 (not c!105113)) b!1037443))

(assert (= (or b!1037441 b!1037443) bm!43915))

(declare-fun m!957661 () Bool)

(assert (=> b!1037444 m!957661))

(assert (=> b!1037444 m!957661))

(declare-fun m!957663 () Bool)

(assert (=> b!1037444 m!957663))

(declare-fun m!957665 () Bool)

(assert (=> bm!43915 m!957665))

(assert (=> b!1037397 d!125231))

(declare-fun d!125233 () Bool)

(declare-fun lt!457491 () (_ BitVec 32))

(assert (=> d!125233 (and (bvsge lt!457491 #b00000000000000000000000000000000) (bvsle lt!457491 (bvsub (size!31985 (_keys!11482 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586863 () (_ BitVec 32))

(assert (=> d!125233 (= lt!457491 e!586863)))

(declare-fun c!105114 () Bool)

(assert (=> d!125233 (= c!105114 (bvsge #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))))))

(assert (=> d!125233 (and (bvsle #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31985 (_keys!11482 thiss!1427)) (size!31985 (_keys!11482 thiss!1427))))))

(assert (=> d!125233 (= (arrayCountValidKeys!0 (_keys!11482 thiss!1427) #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))) lt!457491)))

(declare-fun b!1037445 () Bool)

(declare-fun e!586862 () (_ BitVec 32))

(declare-fun call!43919 () (_ BitVec 32))

(assert (=> b!1037445 (= e!586862 (bvadd #b00000000000000000000000000000001 call!43919))))

(declare-fun b!1037446 () Bool)

(assert (=> b!1037446 (= e!586863 #b00000000000000000000000000000000)))

(declare-fun b!1037447 () Bool)

(assert (=> b!1037447 (= e!586862 call!43919)))

(declare-fun b!1037448 () Bool)

(assert (=> b!1037448 (= e!586863 e!586862)))

(declare-fun c!105115 () Bool)

(assert (=> b!1037448 (= c!105115 (validKeyInArray!0 (select (arr!31455 (_keys!11482 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43916 () Bool)

(assert (=> bm!43916 (= call!43919 (arrayCountValidKeys!0 (_keys!11482 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31985 (_keys!11482 thiss!1427))))))

(assert (= (and d!125233 c!105114) b!1037446))

(assert (= (and d!125233 (not c!105114)) b!1037448))

(assert (= (and b!1037448 c!105115) b!1037445))

(assert (= (and b!1037448 (not c!105115)) b!1037447))

(assert (= (or b!1037445 b!1037447) bm!43916))

(declare-fun m!957667 () Bool)

(assert (=> b!1037448 m!957667))

(assert (=> b!1037448 m!957667))

(declare-fun m!957669 () Bool)

(assert (=> b!1037448 m!957669))

(declare-fun m!957671 () Bool)

(assert (=> bm!43916 m!957671))

(assert (=> b!1037397 d!125233))

(declare-fun b!1037458 () Bool)

(declare-fun res!692199 () Bool)

(declare-fun e!586869 () Bool)

(assert (=> b!1037458 (=> (not res!692199) (not e!586869))))

(assert (=> b!1037458 (= res!692199 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037459 () Bool)

(assert (=> b!1037459 (= e!586869 (bvslt (size!31985 (_keys!11482 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1037460 () Bool)

(declare-fun e!586868 () Bool)

(assert (=> b!1037460 (= e!586868 (= (arrayCountValidKeys!0 (array!65347 (store (arr!31455 (_keys!11482 thiss!1427)) (index!41388 lt!457480) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31985 (_keys!11482 thiss!1427))) #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11482 thiss!1427) #b00000000000000000000000000000000 (size!31985 (_keys!11482 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125235 () Bool)

(assert (=> d!125235 e!586868))

(declare-fun res!692197 () Bool)

(assert (=> d!125235 (=> (not res!692197) (not e!586868))))

(assert (=> d!125235 (= res!692197 (and (bvsge (index!41388 lt!457480) #b00000000000000000000000000000000) (bvslt (index!41388 lt!457480) (size!31985 (_keys!11482 thiss!1427)))))))

(declare-fun lt!457494 () Unit!33951)

(declare-fun choose!82 (array!65346 (_ BitVec 32) (_ BitVec 64)) Unit!33951)

(assert (=> d!125235 (= lt!457494 (choose!82 (_keys!11482 thiss!1427) (index!41388 lt!457480) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125235 e!586869))

(declare-fun res!692198 () Bool)

(assert (=> d!125235 (=> (not res!692198) (not e!586869))))

(assert (=> d!125235 (= res!692198 (and (bvsge (index!41388 lt!457480) #b00000000000000000000000000000000) (bvslt (index!41388 lt!457480) (size!31985 (_keys!11482 thiss!1427)))))))

(assert (=> d!125235 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11482 thiss!1427) (index!41388 lt!457480) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457494)))

(declare-fun b!1037457 () Bool)

(declare-fun res!692196 () Bool)

(assert (=> b!1037457 (=> (not res!692196) (not e!586869))))

(assert (=> b!1037457 (= res!692196 (validKeyInArray!0 (select (arr!31455 (_keys!11482 thiss!1427)) (index!41388 lt!457480))))))

(assert (= (and d!125235 res!692198) b!1037457))

(assert (= (and b!1037457 res!692196) b!1037458))

(assert (= (and b!1037458 res!692199) b!1037459))

(assert (= (and d!125235 res!692197) b!1037460))

(declare-fun m!957673 () Bool)

(assert (=> b!1037458 m!957673))

(assert (=> b!1037460 m!957625))

(assert (=> b!1037460 m!957627))

(assert (=> b!1037460 m!957629))

(declare-fun m!957675 () Bool)

(assert (=> d!125235 m!957675))

(declare-fun m!957677 () Bool)

(assert (=> b!1037457 m!957677))

(assert (=> b!1037457 m!957677))

(declare-fun m!957679 () Bool)

(assert (=> b!1037457 m!957679))

(assert (=> b!1037397 d!125235))

(declare-fun d!125237 () Bool)

(declare-fun lt!457506 () SeekEntryResult!9754)

(assert (=> d!125237 (and (or ((_ is MissingVacant!9754) lt!457506) (not ((_ is Found!9754) lt!457506)) (and (bvsge (index!41388 lt!457506) #b00000000000000000000000000000000) (bvslt (index!41388 lt!457506) (size!31985 (_keys!11482 thiss!1427))))) (not ((_ is MissingVacant!9754) lt!457506)) (or (not ((_ is Found!9754) lt!457506)) (= (select (arr!31455 (_keys!11482 thiss!1427)) (index!41388 lt!457506)) key!909)))))

(declare-fun e!586876 () SeekEntryResult!9754)

(assert (=> d!125237 (= lt!457506 e!586876)))

(declare-fun c!105123 () Bool)

(declare-fun lt!457504 () SeekEntryResult!9754)

(assert (=> d!125237 (= c!105123 (and ((_ is Intermediate!9754) lt!457504) (undefined!10566 lt!457504)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65346 (_ BitVec 32)) SeekEntryResult!9754)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125237 (= lt!457504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30205 thiss!1427)) key!909 (_keys!11482 thiss!1427) (mask!30205 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125237 (validMask!0 (mask!30205 thiss!1427))))

(assert (=> d!125237 (= (seekEntry!0 key!909 (_keys!11482 thiss!1427) (mask!30205 thiss!1427)) lt!457506)))

(declare-fun b!1037473 () Bool)

(declare-fun e!586878 () SeekEntryResult!9754)

(assert (=> b!1037473 (= e!586878 (Found!9754 (index!41389 lt!457504)))))

(declare-fun b!1037474 () Bool)

(declare-fun e!586877 () SeekEntryResult!9754)

(assert (=> b!1037474 (= e!586877 (MissingZero!9754 (index!41389 lt!457504)))))

(declare-fun b!1037475 () Bool)

(assert (=> b!1037475 (= e!586876 Undefined!9754)))

(declare-fun b!1037476 () Bool)

(declare-fun c!105122 () Bool)

(declare-fun lt!457505 () (_ BitVec 64))

(assert (=> b!1037476 (= c!105122 (= lt!457505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037476 (= e!586878 e!586877)))

(declare-fun b!1037477 () Bool)

(declare-fun lt!457503 () SeekEntryResult!9754)

(assert (=> b!1037477 (= e!586877 (ite ((_ is MissingVacant!9754) lt!457503) (MissingZero!9754 (index!41390 lt!457503)) lt!457503))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65346 (_ BitVec 32)) SeekEntryResult!9754)

(assert (=> b!1037477 (= lt!457503 (seekKeyOrZeroReturnVacant!0 (x!92545 lt!457504) (index!41389 lt!457504) (index!41389 lt!457504) key!909 (_keys!11482 thiss!1427) (mask!30205 thiss!1427)))))

(declare-fun b!1037478 () Bool)

(assert (=> b!1037478 (= e!586876 e!586878)))

(assert (=> b!1037478 (= lt!457505 (select (arr!31455 (_keys!11482 thiss!1427)) (index!41389 lt!457504)))))

(declare-fun c!105124 () Bool)

(assert (=> b!1037478 (= c!105124 (= lt!457505 key!909))))

(assert (= (and d!125237 c!105123) b!1037475))

(assert (= (and d!125237 (not c!105123)) b!1037478))

(assert (= (and b!1037478 c!105124) b!1037473))

(assert (= (and b!1037478 (not c!105124)) b!1037476))

(assert (= (and b!1037476 c!105122) b!1037474))

(assert (= (and b!1037476 (not c!105122)) b!1037477))

(declare-fun m!957681 () Bool)

(assert (=> d!125237 m!957681))

(declare-fun m!957683 () Bool)

(assert (=> d!125237 m!957683))

(assert (=> d!125237 m!957683))

(declare-fun m!957685 () Bool)

(assert (=> d!125237 m!957685))

(declare-fun m!957687 () Bool)

(assert (=> d!125237 m!957687))

(declare-fun m!957689 () Bool)

(assert (=> b!1037477 m!957689))

(declare-fun m!957691 () Bool)

(assert (=> b!1037478 m!957691))

(assert (=> b!1037401 d!125237))

(declare-fun condMapEmpty!38466 () Bool)

(declare-fun mapDefault!38466 () ValueCell!11607)

(assert (=> mapNonEmpty!38460 (= condMapEmpty!38466 (= mapRest!38460 ((as const (Array (_ BitVec 32) ValueCell!11607)) mapDefault!38466)))))

(declare-fun e!586884 () Bool)

(declare-fun mapRes!38466 () Bool)

(assert (=> mapNonEmpty!38460 (= tp!73849 (and e!586884 mapRes!38466))))

(declare-fun b!1037485 () Bool)

(declare-fun e!586883 () Bool)

(assert (=> b!1037485 (= e!586883 tp_is_empty!24621)))

(declare-fun mapIsEmpty!38466 () Bool)

(assert (=> mapIsEmpty!38466 mapRes!38466))

(declare-fun mapNonEmpty!38466 () Bool)

(declare-fun tp!73858 () Bool)

(assert (=> mapNonEmpty!38466 (= mapRes!38466 (and tp!73858 e!586883))))

(declare-fun mapValue!38466 () ValueCell!11607)

(declare-fun mapRest!38466 () (Array (_ BitVec 32) ValueCell!11607))

(declare-fun mapKey!38466 () (_ BitVec 32))

(assert (=> mapNonEmpty!38466 (= mapRest!38460 (store mapRest!38466 mapKey!38466 mapValue!38466))))

(declare-fun b!1037486 () Bool)

(assert (=> b!1037486 (= e!586884 tp_is_empty!24621)))

(assert (= (and mapNonEmpty!38460 condMapEmpty!38466) mapIsEmpty!38466))

(assert (= (and mapNonEmpty!38460 (not condMapEmpty!38466)) mapNonEmpty!38466))

(assert (= (and mapNonEmpty!38466 ((_ is ValueCellFull!11607) mapValue!38466)) b!1037485))

(assert (= (and mapNonEmpty!38460 ((_ is ValueCellFull!11607) mapDefault!38466)) b!1037486))

(declare-fun m!957693 () Bool)

(assert (=> mapNonEmpty!38466 m!957693))

(check-sat (not b!1037432) b_and!33433 (not b!1037460) (not bm!43915) (not b!1037444) tp_is_empty!24621 (not b_next!20901) (not b!1037431) (not b!1037458) (not d!125235) (not bm!43916) (not mapNonEmpty!38466) (not b!1037448) (not b!1037477) (not b!1037457) (not d!125237) (not d!125225) (not b!1037430))
(check-sat b_and!33433 (not b_next!20901))
