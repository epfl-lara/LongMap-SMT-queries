; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90864 () Bool)

(assert start!90864)

(declare-fun b!1038406 () Bool)

(declare-fun b_free!20947 () Bool)

(declare-fun b_next!20947 () Bool)

(assert (=> b!1038406 (= b_free!20947 (not b_next!20947))))

(declare-fun tp!74004 () Bool)

(declare-fun b_and!33453 () Bool)

(assert (=> b!1038406 (= tp!74004 b_and!33453)))

(declare-fun b!1038402 () Bool)

(declare-fun e!587564 () Bool)

(declare-fun e!587566 () Bool)

(assert (=> b!1038402 (= e!587564 e!587566)))

(declare-fun res!692713 () Bool)

(assert (=> b!1038402 (=> (not res!692713) (not e!587566))))

(declare-datatypes ((SeekEntryResult!9766 0))(
  ( (MissingZero!9766 (index!41435 (_ BitVec 32))) (Found!9766 (index!41436 (_ BitVec 32))) (Intermediate!9766 (undefined!10578 Bool) (index!41437 (_ BitVec 32)) (x!92666 (_ BitVec 32))) (Undefined!9766) (MissingVacant!9766 (index!41438 (_ BitVec 32))) )
))
(declare-fun lt!457580 () SeekEntryResult!9766)

(get-info :version)

(assert (=> b!1038402 (= res!692713 ((_ is Found!9766) lt!457580))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37763 0))(
  ( (V!37764 (val!12384 Int)) )
))
(declare-datatypes ((ValueCell!11630 0))(
  ( (ValueCellFull!11630 (v!14969 V!37763)) (EmptyCell!11630) )
))
(declare-datatypes ((array!65389 0))(
  ( (array!65390 (arr!31470 (Array (_ BitVec 32) (_ BitVec 64))) (size!32002 (_ BitVec 32))) )
))
(declare-datatypes ((array!65391 0))(
  ( (array!65392 (arr!31471 (Array (_ BitVec 32) ValueCell!11630)) (size!32003 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5854 0))(
  ( (LongMapFixedSize!5855 (defaultEntry!6309 Int) (mask!30246 (_ BitVec 32)) (extraKeys!6037 (_ BitVec 32)) (zeroValue!6143 V!37763) (minValue!6143 V!37763) (_size!2982 (_ BitVec 32)) (_keys!11507 array!65389) (_values!6332 array!65391) (_vacant!2982 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5854)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65389 (_ BitVec 32)) SeekEntryResult!9766)

(assert (=> b!1038402 (= lt!457580 (seekEntry!0 key!909 (_keys!11507 thiss!1427) (mask!30246 thiss!1427)))))

(declare-fun b!1038404 () Bool)

(declare-fun e!587567 () Bool)

(assert (=> b!1038404 (= e!587566 (not e!587567))))

(declare-fun res!692712 () Bool)

(assert (=> b!1038404 (=> res!692712 e!587567)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038404 (= res!692712 (not (validMask!0 (mask!30246 thiss!1427))))))

(declare-fun lt!457581 () array!65389)

(declare-datatypes ((List!21973 0))(
  ( (Nil!21970) (Cons!21969 (h!23172 (_ BitVec 64)) (t!31178 List!21973)) )
))
(declare-fun arrayNoDuplicates!0 (array!65389 (_ BitVec 32) List!21973) Bool)

(assert (=> b!1038404 (arrayNoDuplicates!0 lt!457581 #b00000000000000000000000000000000 Nil!21970)))

(declare-datatypes ((Unit!33859 0))(
  ( (Unit!33860) )
))
(declare-fun lt!457578 () Unit!33859)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21973) Unit!33859)

(assert (=> b!1038404 (= lt!457578 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11507 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41436 lt!457580) #b00000000000000000000000000000000 Nil!21970))))

(declare-fun arrayCountValidKeys!0 (array!65389 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038404 (= (arrayCountValidKeys!0 lt!457581 #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11507 thiss!1427) #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038404 (= lt!457581 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))))))

(declare-fun lt!457579 () Unit!33859)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65389 (_ BitVec 32) (_ BitVec 64)) Unit!33859)

(assert (=> b!1038404 (= lt!457579 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11507 thiss!1427) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038405 () Bool)

(declare-fun res!692714 () Bool)

(assert (=> b!1038405 (=> (not res!692714) (not e!587564))))

(assert (=> b!1038405 (= res!692714 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38547 () Bool)

(declare-fun mapRes!38547 () Bool)

(declare-fun tp!74005 () Bool)

(declare-fun e!587563 () Bool)

(assert (=> mapNonEmpty!38547 (= mapRes!38547 (and tp!74005 e!587563))))

(declare-fun mapRest!38547 () (Array (_ BitVec 32) ValueCell!11630))

(declare-fun mapValue!38547 () ValueCell!11630)

(declare-fun mapKey!38547 () (_ BitVec 32))

(assert (=> mapNonEmpty!38547 (= (arr!31471 (_values!6332 thiss!1427)) (store mapRest!38547 mapKey!38547 mapValue!38547))))

(declare-fun mapIsEmpty!38547 () Bool)

(assert (=> mapIsEmpty!38547 mapRes!38547))

(declare-fun e!587568 () Bool)

(declare-fun e!587562 () Bool)

(declare-fun tp_is_empty!24667 () Bool)

(declare-fun array_inv!24335 (array!65389) Bool)

(declare-fun array_inv!24336 (array!65391) Bool)

(assert (=> b!1038406 (= e!587562 (and tp!74004 tp_is_empty!24667 (array_inv!24335 (_keys!11507 thiss!1427)) (array_inv!24336 (_values!6332 thiss!1427)) e!587568))))

(declare-fun b!1038407 () Bool)

(assert (=> b!1038407 (= e!587567 (= (size!32002 (_keys!11507 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30246 thiss!1427))))))

(declare-fun b!1038403 () Bool)

(declare-fun e!587565 () Bool)

(assert (=> b!1038403 (= e!587565 tp_is_empty!24667)))

(declare-fun res!692711 () Bool)

(assert (=> start!90864 (=> (not res!692711) (not e!587564))))

(declare-fun valid!2196 (LongMapFixedSize!5854) Bool)

(assert (=> start!90864 (= res!692711 (valid!2196 thiss!1427))))

(assert (=> start!90864 e!587564))

(assert (=> start!90864 e!587562))

(assert (=> start!90864 true))

(declare-fun b!1038408 () Bool)

(assert (=> b!1038408 (= e!587563 tp_is_empty!24667)))

(declare-fun b!1038409 () Bool)

(assert (=> b!1038409 (= e!587568 (and e!587565 mapRes!38547))))

(declare-fun condMapEmpty!38547 () Bool)

(declare-fun mapDefault!38547 () ValueCell!11630)

(assert (=> b!1038409 (= condMapEmpty!38547 (= (arr!31471 (_values!6332 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11630)) mapDefault!38547)))))

(assert (= (and start!90864 res!692711) b!1038405))

(assert (= (and b!1038405 res!692714) b!1038402))

(assert (= (and b!1038402 res!692713) b!1038404))

(assert (= (and b!1038404 (not res!692712)) b!1038407))

(assert (= (and b!1038409 condMapEmpty!38547) mapIsEmpty!38547))

(assert (= (and b!1038409 (not condMapEmpty!38547)) mapNonEmpty!38547))

(assert (= (and mapNonEmpty!38547 ((_ is ValueCellFull!11630) mapValue!38547)) b!1038408))

(assert (= (and b!1038409 ((_ is ValueCellFull!11630) mapDefault!38547)) b!1038403))

(assert (= b!1038406 b!1038409))

(assert (= start!90864 b!1038406))

(declare-fun m!957849 () Bool)

(assert (=> start!90864 m!957849))

(declare-fun m!957851 () Bool)

(assert (=> b!1038404 m!957851))

(declare-fun m!957853 () Bool)

(assert (=> b!1038404 m!957853))

(declare-fun m!957855 () Bool)

(assert (=> b!1038404 m!957855))

(declare-fun m!957857 () Bool)

(assert (=> b!1038404 m!957857))

(declare-fun m!957859 () Bool)

(assert (=> b!1038404 m!957859))

(declare-fun m!957861 () Bool)

(assert (=> b!1038404 m!957861))

(declare-fun m!957863 () Bool)

(assert (=> b!1038404 m!957863))

(declare-fun m!957865 () Bool)

(assert (=> b!1038402 m!957865))

(declare-fun m!957867 () Bool)

(assert (=> b!1038406 m!957867))

(declare-fun m!957869 () Bool)

(assert (=> b!1038406 m!957869))

(declare-fun m!957871 () Bool)

(assert (=> mapNonEmpty!38547 m!957871))

(check-sat (not b!1038406) (not b_next!20947) (not mapNonEmpty!38547) (not b!1038404) (not start!90864) tp_is_empty!24667 b_and!33453 (not b!1038402))
(check-sat b_and!33453 (not b_next!20947))
(get-model)

(declare-fun bm!43925 () Bool)

(declare-fun call!43928 () Bool)

(declare-fun c!105182 () Bool)

(assert (=> bm!43925 (= call!43928 (arrayNoDuplicates!0 lt!457581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105182 (Cons!21969 (select (arr!31470 lt!457581) #b00000000000000000000000000000000) Nil!21970) Nil!21970)))))

(declare-fun b!1038468 () Bool)

(declare-fun e!587626 () Bool)

(declare-fun contains!6019 (List!21973 (_ BitVec 64)) Bool)

(assert (=> b!1038468 (= e!587626 (contains!6019 Nil!21970 (select (arr!31470 lt!457581) #b00000000000000000000000000000000)))))

(declare-fun b!1038469 () Bool)

(declare-fun e!587625 () Bool)

(declare-fun e!587628 () Bool)

(assert (=> b!1038469 (= e!587625 e!587628)))

(declare-fun res!692746 () Bool)

(assert (=> b!1038469 (=> (not res!692746) (not e!587628))))

(assert (=> b!1038469 (= res!692746 (not e!587626))))

(declare-fun res!692745 () Bool)

(assert (=> b!1038469 (=> (not res!692745) (not e!587626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038469 (= res!692745 (validKeyInArray!0 (select (arr!31470 lt!457581) #b00000000000000000000000000000000)))))

(declare-fun b!1038470 () Bool)

(declare-fun e!587627 () Bool)

(assert (=> b!1038470 (= e!587627 call!43928)))

(declare-fun b!1038471 () Bool)

(assert (=> b!1038471 (= e!587627 call!43928)))

(declare-fun b!1038472 () Bool)

(assert (=> b!1038472 (= e!587628 e!587627)))

(assert (=> b!1038472 (= c!105182 (validKeyInArray!0 (select (arr!31470 lt!457581) #b00000000000000000000000000000000)))))

(declare-fun d!125205 () Bool)

(declare-fun res!692747 () Bool)

(assert (=> d!125205 (=> res!692747 e!587625)))

(assert (=> d!125205 (= res!692747 (bvsge #b00000000000000000000000000000000 (size!32002 lt!457581)))))

(assert (=> d!125205 (= (arrayNoDuplicates!0 lt!457581 #b00000000000000000000000000000000 Nil!21970) e!587625)))

(assert (= (and d!125205 (not res!692747)) b!1038469))

(assert (= (and b!1038469 res!692745) b!1038468))

(assert (= (and b!1038469 res!692746) b!1038472))

(assert (= (and b!1038472 c!105182) b!1038470))

(assert (= (and b!1038472 (not c!105182)) b!1038471))

(assert (= (or b!1038470 b!1038471) bm!43925))

(declare-fun m!957921 () Bool)

(assert (=> bm!43925 m!957921))

(declare-fun m!957923 () Bool)

(assert (=> bm!43925 m!957923))

(assert (=> b!1038468 m!957921))

(assert (=> b!1038468 m!957921))

(declare-fun m!957925 () Bool)

(assert (=> b!1038468 m!957925))

(assert (=> b!1038469 m!957921))

(assert (=> b!1038469 m!957921))

(declare-fun m!957927 () Bool)

(assert (=> b!1038469 m!957927))

(assert (=> b!1038472 m!957921))

(assert (=> b!1038472 m!957921))

(assert (=> b!1038472 m!957927))

(assert (=> b!1038404 d!125205))

(declare-fun b!1038483 () Bool)

(declare-fun e!587634 () Bool)

(assert (=> b!1038483 (= e!587634 (bvslt (size!32002 (_keys!11507 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038484 () Bool)

(declare-fun e!587633 () Bool)

(assert (=> b!1038484 (= e!587633 (= (arrayCountValidKeys!0 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))) #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11507 thiss!1427) #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125207 () Bool)

(assert (=> d!125207 e!587633))

(declare-fun res!692757 () Bool)

(assert (=> d!125207 (=> (not res!692757) (not e!587633))))

(assert (=> d!125207 (= res!692757 (and (bvsge (index!41436 lt!457580) #b00000000000000000000000000000000) (bvslt (index!41436 lt!457580) (size!32002 (_keys!11507 thiss!1427)))))))

(declare-fun lt!457608 () Unit!33859)

(declare-fun choose!82 (array!65389 (_ BitVec 32) (_ BitVec 64)) Unit!33859)

(assert (=> d!125207 (= lt!457608 (choose!82 (_keys!11507 thiss!1427) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125207 e!587634))

(declare-fun res!692758 () Bool)

(assert (=> d!125207 (=> (not res!692758) (not e!587634))))

(assert (=> d!125207 (= res!692758 (and (bvsge (index!41436 lt!457580) #b00000000000000000000000000000000) (bvslt (index!41436 lt!457580) (size!32002 (_keys!11507 thiss!1427)))))))

(assert (=> d!125207 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11507 thiss!1427) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457608)))

(declare-fun b!1038481 () Bool)

(declare-fun res!692759 () Bool)

(assert (=> b!1038481 (=> (not res!692759) (not e!587634))))

(assert (=> b!1038481 (= res!692759 (validKeyInArray!0 (select (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580))))))

(declare-fun b!1038482 () Bool)

(declare-fun res!692756 () Bool)

(assert (=> b!1038482 (=> (not res!692756) (not e!587634))))

(assert (=> b!1038482 (= res!692756 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125207 res!692758) b!1038481))

(assert (= (and b!1038481 res!692759) b!1038482))

(assert (= (and b!1038482 res!692756) b!1038483))

(assert (= (and d!125207 res!692757) b!1038484))

(assert (=> b!1038484 m!957863))

(declare-fun m!957929 () Bool)

(assert (=> b!1038484 m!957929))

(assert (=> b!1038484 m!957857))

(declare-fun m!957931 () Bool)

(assert (=> d!125207 m!957931))

(declare-fun m!957933 () Bool)

(assert (=> b!1038481 m!957933))

(assert (=> b!1038481 m!957933))

(declare-fun m!957935 () Bool)

(assert (=> b!1038481 m!957935))

(declare-fun m!957937 () Bool)

(assert (=> b!1038482 m!957937))

(assert (=> b!1038404 d!125207))

(declare-fun d!125209 () Bool)

(assert (=> d!125209 (= (validMask!0 (mask!30246 thiss!1427)) (and (or (= (mask!30246 thiss!1427) #b00000000000000000000000000000111) (= (mask!30246 thiss!1427) #b00000000000000000000000000001111) (= (mask!30246 thiss!1427) #b00000000000000000000000000011111) (= (mask!30246 thiss!1427) #b00000000000000000000000000111111) (= (mask!30246 thiss!1427) #b00000000000000000000000001111111) (= (mask!30246 thiss!1427) #b00000000000000000000000011111111) (= (mask!30246 thiss!1427) #b00000000000000000000000111111111) (= (mask!30246 thiss!1427) #b00000000000000000000001111111111) (= (mask!30246 thiss!1427) #b00000000000000000000011111111111) (= (mask!30246 thiss!1427) #b00000000000000000000111111111111) (= (mask!30246 thiss!1427) #b00000000000000000001111111111111) (= (mask!30246 thiss!1427) #b00000000000000000011111111111111) (= (mask!30246 thiss!1427) #b00000000000000000111111111111111) (= (mask!30246 thiss!1427) #b00000000000000001111111111111111) (= (mask!30246 thiss!1427) #b00000000000000011111111111111111) (= (mask!30246 thiss!1427) #b00000000000000111111111111111111) (= (mask!30246 thiss!1427) #b00000000000001111111111111111111) (= (mask!30246 thiss!1427) #b00000000000011111111111111111111) (= (mask!30246 thiss!1427) #b00000000000111111111111111111111) (= (mask!30246 thiss!1427) #b00000000001111111111111111111111) (= (mask!30246 thiss!1427) #b00000000011111111111111111111111) (= (mask!30246 thiss!1427) #b00000000111111111111111111111111) (= (mask!30246 thiss!1427) #b00000001111111111111111111111111) (= (mask!30246 thiss!1427) #b00000011111111111111111111111111) (= (mask!30246 thiss!1427) #b00000111111111111111111111111111) (= (mask!30246 thiss!1427) #b00001111111111111111111111111111) (= (mask!30246 thiss!1427) #b00011111111111111111111111111111) (= (mask!30246 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30246 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1038404 d!125209))

(declare-fun b!1038493 () Bool)

(declare-fun e!587640 () (_ BitVec 32))

(declare-fun e!587639 () (_ BitVec 32))

(assert (=> b!1038493 (= e!587640 e!587639)))

(declare-fun c!105188 () Bool)

(assert (=> b!1038493 (= c!105188 (validKeyInArray!0 (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038494 () Bool)

(declare-fun call!43931 () (_ BitVec 32))

(assert (=> b!1038494 (= e!587639 call!43931)))

(declare-fun b!1038495 () Bool)

(assert (=> b!1038495 (= e!587640 #b00000000000000000000000000000000)))

(declare-fun d!125211 () Bool)

(declare-fun lt!457611 () (_ BitVec 32))

(assert (=> d!125211 (and (bvsge lt!457611 #b00000000000000000000000000000000) (bvsle lt!457611 (bvsub (size!32002 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125211 (= lt!457611 e!587640)))

(declare-fun c!105187 () Bool)

(assert (=> d!125211 (= c!105187 (bvsge #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))))))

(assert (=> d!125211 (and (bvsle #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32002 (_keys!11507 thiss!1427)) (size!32002 (_keys!11507 thiss!1427))))))

(assert (=> d!125211 (= (arrayCountValidKeys!0 (_keys!11507 thiss!1427) #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) lt!457611)))

(declare-fun bm!43928 () Bool)

(assert (=> bm!43928 (= call!43931 (arrayCountValidKeys!0 (_keys!11507 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))))))

(declare-fun b!1038496 () Bool)

(assert (=> b!1038496 (= e!587639 (bvadd #b00000000000000000000000000000001 call!43931))))

(assert (= (and d!125211 c!105187) b!1038495))

(assert (= (and d!125211 (not c!105187)) b!1038493))

(assert (= (and b!1038493 c!105188) b!1038496))

(assert (= (and b!1038493 (not c!105188)) b!1038494))

(assert (= (or b!1038496 b!1038494) bm!43928))

(declare-fun m!957939 () Bool)

(assert (=> b!1038493 m!957939))

(assert (=> b!1038493 m!957939))

(declare-fun m!957941 () Bool)

(assert (=> b!1038493 m!957941))

(declare-fun m!957943 () Bool)

(assert (=> bm!43928 m!957943))

(assert (=> b!1038404 d!125211))

(declare-fun b!1038497 () Bool)

(declare-fun e!587642 () (_ BitVec 32))

(declare-fun e!587641 () (_ BitVec 32))

(assert (=> b!1038497 (= e!587642 e!587641)))

(declare-fun c!105190 () Bool)

(assert (=> b!1038497 (= c!105190 (validKeyInArray!0 (select (arr!31470 lt!457581) #b00000000000000000000000000000000)))))

(declare-fun b!1038498 () Bool)

(declare-fun call!43932 () (_ BitVec 32))

(assert (=> b!1038498 (= e!587641 call!43932)))

(declare-fun b!1038499 () Bool)

(assert (=> b!1038499 (= e!587642 #b00000000000000000000000000000000)))

(declare-fun d!125213 () Bool)

(declare-fun lt!457612 () (_ BitVec 32))

(assert (=> d!125213 (and (bvsge lt!457612 #b00000000000000000000000000000000) (bvsle lt!457612 (bvsub (size!32002 lt!457581) #b00000000000000000000000000000000)))))

(assert (=> d!125213 (= lt!457612 e!587642)))

(declare-fun c!105189 () Bool)

(assert (=> d!125213 (= c!105189 (bvsge #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))))))

(assert (=> d!125213 (and (bvsle #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32002 (_keys!11507 thiss!1427)) (size!32002 lt!457581)))))

(assert (=> d!125213 (= (arrayCountValidKeys!0 lt!457581 #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) lt!457612)))

(declare-fun bm!43929 () Bool)

(assert (=> bm!43929 (= call!43932 (arrayCountValidKeys!0 lt!457581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))))))

(declare-fun b!1038500 () Bool)

(assert (=> b!1038500 (= e!587641 (bvadd #b00000000000000000000000000000001 call!43932))))

(assert (= (and d!125213 c!105189) b!1038499))

(assert (= (and d!125213 (not c!105189)) b!1038497))

(assert (= (and b!1038497 c!105190) b!1038500))

(assert (= (and b!1038497 (not c!105190)) b!1038498))

(assert (= (or b!1038500 b!1038498) bm!43929))

(assert (=> b!1038497 m!957921))

(assert (=> b!1038497 m!957921))

(assert (=> b!1038497 m!957927))

(declare-fun m!957945 () Bool)

(assert (=> bm!43929 m!957945))

(assert (=> b!1038404 d!125213))

(declare-fun d!125215 () Bool)

(declare-fun e!587645 () Bool)

(assert (=> d!125215 e!587645))

(declare-fun res!692762 () Bool)

(assert (=> d!125215 (=> (not res!692762) (not e!587645))))

(assert (=> d!125215 (= res!692762 (and (bvsge (index!41436 lt!457580) #b00000000000000000000000000000000) (bvslt (index!41436 lt!457580) (size!32002 (_keys!11507 thiss!1427)))))))

(declare-fun lt!457615 () Unit!33859)

(declare-fun choose!53 (array!65389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21973) Unit!33859)

(assert (=> d!125215 (= lt!457615 (choose!53 (_keys!11507 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41436 lt!457580) #b00000000000000000000000000000000 Nil!21970))))

(assert (=> d!125215 (bvslt (size!32002 (_keys!11507 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125215 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11507 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41436 lt!457580) #b00000000000000000000000000000000 Nil!21970) lt!457615)))

(declare-fun b!1038503 () Bool)

(assert (=> b!1038503 (= e!587645 (arrayNoDuplicates!0 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))) #b00000000000000000000000000000000 Nil!21970))))

(assert (= (and d!125215 res!692762) b!1038503))

(declare-fun m!957947 () Bool)

(assert (=> d!125215 m!957947))

(assert (=> b!1038503 m!957863))

(declare-fun m!957949 () Bool)

(assert (=> b!1038503 m!957949))

(assert (=> b!1038404 d!125215))

(declare-fun b!1038516 () Bool)

(declare-fun e!587654 () SeekEntryResult!9766)

(declare-fun lt!457624 () SeekEntryResult!9766)

(assert (=> b!1038516 (= e!587654 (MissingZero!9766 (index!41437 lt!457624)))))

(declare-fun b!1038517 () Bool)

(declare-fun e!587652 () SeekEntryResult!9766)

(declare-fun e!587653 () SeekEntryResult!9766)

(assert (=> b!1038517 (= e!587652 e!587653)))

(declare-fun lt!457627 () (_ BitVec 64))

(assert (=> b!1038517 (= lt!457627 (select (arr!31470 (_keys!11507 thiss!1427)) (index!41437 lt!457624)))))

(declare-fun c!105199 () Bool)

(assert (=> b!1038517 (= c!105199 (= lt!457627 key!909))))

(declare-fun b!1038518 () Bool)

(assert (=> b!1038518 (= e!587653 (Found!9766 (index!41437 lt!457624)))))

(declare-fun d!125217 () Bool)

(declare-fun lt!457625 () SeekEntryResult!9766)

(assert (=> d!125217 (and (or ((_ is MissingVacant!9766) lt!457625) (not ((_ is Found!9766) lt!457625)) (and (bvsge (index!41436 lt!457625) #b00000000000000000000000000000000) (bvslt (index!41436 lt!457625) (size!32002 (_keys!11507 thiss!1427))))) (not ((_ is MissingVacant!9766) lt!457625)) (or (not ((_ is Found!9766) lt!457625)) (= (select (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457625)) key!909)))))

(assert (=> d!125217 (= lt!457625 e!587652)))

(declare-fun c!105198 () Bool)

(assert (=> d!125217 (= c!105198 (and ((_ is Intermediate!9766) lt!457624) (undefined!10578 lt!457624)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65389 (_ BitVec 32)) SeekEntryResult!9766)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125217 (= lt!457624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30246 thiss!1427)) key!909 (_keys!11507 thiss!1427) (mask!30246 thiss!1427)))))

(assert (=> d!125217 (validMask!0 (mask!30246 thiss!1427))))

(assert (=> d!125217 (= (seekEntry!0 key!909 (_keys!11507 thiss!1427) (mask!30246 thiss!1427)) lt!457625)))

(declare-fun b!1038519 () Bool)

(declare-fun c!105197 () Bool)

(assert (=> b!1038519 (= c!105197 (= lt!457627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038519 (= e!587653 e!587654)))

(declare-fun b!1038520 () Bool)

(assert (=> b!1038520 (= e!587652 Undefined!9766)))

(declare-fun b!1038521 () Bool)

(declare-fun lt!457626 () SeekEntryResult!9766)

(assert (=> b!1038521 (= e!587654 (ite ((_ is MissingVacant!9766) lt!457626) (MissingZero!9766 (index!41438 lt!457626)) lt!457626))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65389 (_ BitVec 32)) SeekEntryResult!9766)

(assert (=> b!1038521 (= lt!457626 (seekKeyOrZeroReturnVacant!0 (x!92666 lt!457624) (index!41437 lt!457624) (index!41437 lt!457624) key!909 (_keys!11507 thiss!1427) (mask!30246 thiss!1427)))))

(assert (= (and d!125217 c!105198) b!1038520))

(assert (= (and d!125217 (not c!105198)) b!1038517))

(assert (= (and b!1038517 c!105199) b!1038518))

(assert (= (and b!1038517 (not c!105199)) b!1038519))

(assert (= (and b!1038519 c!105197) b!1038516))

(assert (= (and b!1038519 (not c!105197)) b!1038521))

(declare-fun m!957951 () Bool)

(assert (=> b!1038517 m!957951))

(declare-fun m!957953 () Bool)

(assert (=> d!125217 m!957953))

(declare-fun m!957955 () Bool)

(assert (=> d!125217 m!957955))

(assert (=> d!125217 m!957955))

(declare-fun m!957957 () Bool)

(assert (=> d!125217 m!957957))

(assert (=> d!125217 m!957853))

(declare-fun m!957959 () Bool)

(assert (=> b!1038521 m!957959))

(assert (=> b!1038402 d!125217))

(declare-fun d!125219 () Bool)

(assert (=> d!125219 (= (array_inv!24335 (_keys!11507 thiss!1427)) (bvsge (size!32002 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038406 d!125219))

(declare-fun d!125221 () Bool)

(assert (=> d!125221 (= (array_inv!24336 (_values!6332 thiss!1427)) (bvsge (size!32003 (_values!6332 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038406 d!125221))

(declare-fun d!125223 () Bool)

(declare-fun res!692769 () Bool)

(declare-fun e!587657 () Bool)

(assert (=> d!125223 (=> (not res!692769) (not e!587657))))

(declare-fun simpleValid!423 (LongMapFixedSize!5854) Bool)

(assert (=> d!125223 (= res!692769 (simpleValid!423 thiss!1427))))

(assert (=> d!125223 (= (valid!2196 thiss!1427) e!587657)))

(declare-fun b!1038528 () Bool)

(declare-fun res!692770 () Bool)

(assert (=> b!1038528 (=> (not res!692770) (not e!587657))))

(assert (=> b!1038528 (= res!692770 (= (arrayCountValidKeys!0 (_keys!11507 thiss!1427) #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) (_size!2982 thiss!1427)))))

(declare-fun b!1038529 () Bool)

(declare-fun res!692771 () Bool)

(assert (=> b!1038529 (=> (not res!692771) (not e!587657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65389 (_ BitVec 32)) Bool)

(assert (=> b!1038529 (= res!692771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11507 thiss!1427) (mask!30246 thiss!1427)))))

(declare-fun b!1038530 () Bool)

(assert (=> b!1038530 (= e!587657 (arrayNoDuplicates!0 (_keys!11507 thiss!1427) #b00000000000000000000000000000000 Nil!21970))))

(assert (= (and d!125223 res!692769) b!1038528))

(assert (= (and b!1038528 res!692770) b!1038529))

(assert (= (and b!1038529 res!692771) b!1038530))

(declare-fun m!957961 () Bool)

(assert (=> d!125223 m!957961))

(assert (=> b!1038528 m!957857))

(declare-fun m!957963 () Bool)

(assert (=> b!1038529 m!957963))

(declare-fun m!957965 () Bool)

(assert (=> b!1038530 m!957965))

(assert (=> start!90864 d!125223))

(declare-fun condMapEmpty!38556 () Bool)

(declare-fun mapDefault!38556 () ValueCell!11630)

(assert (=> mapNonEmpty!38547 (= condMapEmpty!38556 (= mapRest!38547 ((as const (Array (_ BitVec 32) ValueCell!11630)) mapDefault!38556)))))

(declare-fun e!587663 () Bool)

(declare-fun mapRes!38556 () Bool)

(assert (=> mapNonEmpty!38547 (= tp!74005 (and e!587663 mapRes!38556))))

(declare-fun mapNonEmpty!38556 () Bool)

(declare-fun tp!74020 () Bool)

(declare-fun e!587662 () Bool)

(assert (=> mapNonEmpty!38556 (= mapRes!38556 (and tp!74020 e!587662))))

(declare-fun mapRest!38556 () (Array (_ BitVec 32) ValueCell!11630))

(declare-fun mapValue!38556 () ValueCell!11630)

(declare-fun mapKey!38556 () (_ BitVec 32))

(assert (=> mapNonEmpty!38556 (= mapRest!38547 (store mapRest!38556 mapKey!38556 mapValue!38556))))

(declare-fun b!1038538 () Bool)

(assert (=> b!1038538 (= e!587663 tp_is_empty!24667)))

(declare-fun b!1038537 () Bool)

(assert (=> b!1038537 (= e!587662 tp_is_empty!24667)))

(declare-fun mapIsEmpty!38556 () Bool)

(assert (=> mapIsEmpty!38556 mapRes!38556))

(assert (= (and mapNonEmpty!38547 condMapEmpty!38556) mapIsEmpty!38556))

(assert (= (and mapNonEmpty!38547 (not condMapEmpty!38556)) mapNonEmpty!38556))

(assert (= (and mapNonEmpty!38556 ((_ is ValueCellFull!11630) mapValue!38556)) b!1038537))

(assert (= (and mapNonEmpty!38547 ((_ is ValueCellFull!11630) mapDefault!38556)) b!1038538))

(declare-fun m!957967 () Bool)

(assert (=> mapNonEmpty!38556 m!957967))

(check-sat (not b!1038503) (not b!1038497) (not bm!43928) (not b_next!20947) (not b!1038528) (not b!1038468) (not d!125207) (not b!1038469) (not b!1038530) (not d!125217) (not b!1038472) (not mapNonEmpty!38556) (not d!125215) (not b!1038484) (not b!1038521) (not bm!43925) b_and!33453 (not bm!43929) (not b!1038493) (not b!1038529) (not b!1038482) (not b!1038481) tp_is_empty!24667 (not d!125223))
(check-sat b_and!33453 (not b_next!20947))
(get-model)

(declare-fun b!1038557 () Bool)

(declare-fun e!587676 () SeekEntryResult!9766)

(assert (=> b!1038557 (= e!587676 (Intermediate!9766 false (toIndex!0 key!909 (mask!30246 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1038558 () Bool)

(declare-fun e!587674 () Bool)

(declare-fun e!587675 () Bool)

(assert (=> b!1038558 (= e!587674 e!587675)))

(declare-fun res!692780 () Bool)

(declare-fun lt!457633 () SeekEntryResult!9766)

(assert (=> b!1038558 (= res!692780 (and ((_ is Intermediate!9766) lt!457633) (not (undefined!10578 lt!457633)) (bvslt (x!92666 lt!457633) #b01111111111111111111111111111110) (bvsge (x!92666 lt!457633) #b00000000000000000000000000000000) (bvsge (x!92666 lt!457633) #b00000000000000000000000000000000)))))

(assert (=> b!1038558 (=> (not res!692780) (not e!587675))))

(declare-fun b!1038560 () Bool)

(declare-fun e!587677 () SeekEntryResult!9766)

(assert (=> b!1038560 (= e!587677 e!587676)))

(declare-fun c!105206 () Bool)

(declare-fun lt!457632 () (_ BitVec 64))

(assert (=> b!1038560 (= c!105206 (or (= lt!457632 key!909) (= (bvadd lt!457632 lt!457632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1038561 () Bool)

(assert (=> b!1038561 (= e!587677 (Intermediate!9766 true (toIndex!0 key!909 (mask!30246 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1038562 () Bool)

(assert (=> b!1038562 (and (bvsge (index!41437 lt!457633) #b00000000000000000000000000000000) (bvslt (index!41437 lt!457633) (size!32002 (_keys!11507 thiss!1427))))))

(declare-fun e!587678 () Bool)

(assert (=> b!1038562 (= e!587678 (= (select (arr!31470 (_keys!11507 thiss!1427)) (index!41437 lt!457633)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038563 () Bool)

(assert (=> b!1038563 (= e!587674 (bvsge (x!92666 lt!457633) #b01111111111111111111111111111110))))

(declare-fun b!1038564 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038564 (= e!587676 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30246 thiss!1427)) #b00000000000000000000000000000000 (mask!30246 thiss!1427)) key!909 (_keys!11507 thiss!1427) (mask!30246 thiss!1427)))))

(declare-fun b!1038565 () Bool)

(assert (=> b!1038565 (and (bvsge (index!41437 lt!457633) #b00000000000000000000000000000000) (bvslt (index!41437 lt!457633) (size!32002 (_keys!11507 thiss!1427))))))

(declare-fun res!692778 () Bool)

(assert (=> b!1038565 (= res!692778 (= (select (arr!31470 (_keys!11507 thiss!1427)) (index!41437 lt!457633)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038565 (=> res!692778 e!587678)))

(declare-fun b!1038559 () Bool)

(assert (=> b!1038559 (and (bvsge (index!41437 lt!457633) #b00000000000000000000000000000000) (bvslt (index!41437 lt!457633) (size!32002 (_keys!11507 thiss!1427))))))

(declare-fun res!692779 () Bool)

(assert (=> b!1038559 (= res!692779 (= (select (arr!31470 (_keys!11507 thiss!1427)) (index!41437 lt!457633)) key!909))))

(assert (=> b!1038559 (=> res!692779 e!587678)))

(assert (=> b!1038559 (= e!587675 e!587678)))

(declare-fun d!125225 () Bool)

(assert (=> d!125225 e!587674))

(declare-fun c!105208 () Bool)

(assert (=> d!125225 (= c!105208 (and ((_ is Intermediate!9766) lt!457633) (undefined!10578 lt!457633)))))

(assert (=> d!125225 (= lt!457633 e!587677)))

(declare-fun c!105207 () Bool)

(assert (=> d!125225 (= c!105207 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!125225 (= lt!457632 (select (arr!31470 (_keys!11507 thiss!1427)) (toIndex!0 key!909 (mask!30246 thiss!1427))))))

(assert (=> d!125225 (validMask!0 (mask!30246 thiss!1427))))

(assert (=> d!125225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30246 thiss!1427)) key!909 (_keys!11507 thiss!1427) (mask!30246 thiss!1427)) lt!457633)))

(assert (= (and d!125225 c!105207) b!1038561))

(assert (= (and d!125225 (not c!105207)) b!1038560))

(assert (= (and b!1038560 c!105206) b!1038557))

(assert (= (and b!1038560 (not c!105206)) b!1038564))

(assert (= (and d!125225 c!105208) b!1038563))

(assert (= (and d!125225 (not c!105208)) b!1038558))

(assert (= (and b!1038558 res!692780) b!1038559))

(assert (= (and b!1038559 (not res!692779)) b!1038565))

(assert (= (and b!1038565 (not res!692778)) b!1038562))

(declare-fun m!957969 () Bool)

(assert (=> b!1038565 m!957969))

(assert (=> b!1038562 m!957969))

(assert (=> b!1038559 m!957969))

(assert (=> b!1038564 m!957955))

(declare-fun m!957971 () Bool)

(assert (=> b!1038564 m!957971))

(assert (=> b!1038564 m!957971))

(declare-fun m!957973 () Bool)

(assert (=> b!1038564 m!957973))

(assert (=> d!125225 m!957955))

(declare-fun m!957975 () Bool)

(assert (=> d!125225 m!957975))

(assert (=> d!125225 m!957853))

(assert (=> d!125217 d!125225))

(declare-fun d!125227 () Bool)

(declare-fun lt!457639 () (_ BitVec 32))

(declare-fun lt!457638 () (_ BitVec 32))

(assert (=> d!125227 (= lt!457639 (bvmul (bvxor lt!457638 (bvlshr lt!457638 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125227 (= lt!457638 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125227 (and (bvsge (mask!30246 thiss!1427) #b00000000000000000000000000000000) (let ((res!692781 (let ((h!23174 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92683 (bvmul (bvxor h!23174 (bvlshr h!23174 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92683 (bvlshr x!92683 #b00000000000000000000000000001101)) (mask!30246 thiss!1427)))))) (and (bvslt res!692781 (bvadd (mask!30246 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!692781 #b00000000000000000000000000000000))))))

(assert (=> d!125227 (= (toIndex!0 key!909 (mask!30246 thiss!1427)) (bvand (bvxor lt!457639 (bvlshr lt!457639 #b00000000000000000000000000001101)) (mask!30246 thiss!1427)))))

(assert (=> d!125217 d!125227))

(assert (=> d!125217 d!125209))

(declare-fun b!1038578 () Bool)

(declare-fun e!587687 () SeekEntryResult!9766)

(declare-fun e!587685 () SeekEntryResult!9766)

(assert (=> b!1038578 (= e!587687 e!587685)))

(declare-fun c!105216 () Bool)

(declare-fun lt!457644 () (_ BitVec 64))

(assert (=> b!1038578 (= c!105216 (= lt!457644 key!909))))

(declare-fun b!1038579 () Bool)

(assert (=> b!1038579 (= e!587687 Undefined!9766)))

(declare-fun b!1038580 () Bool)

(declare-fun e!587686 () SeekEntryResult!9766)

(assert (=> b!1038580 (= e!587686 (MissingVacant!9766 (index!41437 lt!457624)))))

(declare-fun b!1038581 () Bool)

(assert (=> b!1038581 (= e!587686 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92666 lt!457624) #b00000000000000000000000000000001) (nextIndex!0 (index!41437 lt!457624) (x!92666 lt!457624) (mask!30246 thiss!1427)) (index!41437 lt!457624) key!909 (_keys!11507 thiss!1427) (mask!30246 thiss!1427)))))

(declare-fun lt!457645 () SeekEntryResult!9766)

(declare-fun d!125229 () Bool)

(assert (=> d!125229 (and (or ((_ is Undefined!9766) lt!457645) (not ((_ is Found!9766) lt!457645)) (and (bvsge (index!41436 lt!457645) #b00000000000000000000000000000000) (bvslt (index!41436 lt!457645) (size!32002 (_keys!11507 thiss!1427))))) (or ((_ is Undefined!9766) lt!457645) ((_ is Found!9766) lt!457645) (not ((_ is MissingVacant!9766) lt!457645)) (not (= (index!41438 lt!457645) (index!41437 lt!457624))) (and (bvsge (index!41438 lt!457645) #b00000000000000000000000000000000) (bvslt (index!41438 lt!457645) (size!32002 (_keys!11507 thiss!1427))))) (or ((_ is Undefined!9766) lt!457645) (ite ((_ is Found!9766) lt!457645) (= (select (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457645)) key!909) (and ((_ is MissingVacant!9766) lt!457645) (= (index!41438 lt!457645) (index!41437 lt!457624)) (= (select (arr!31470 (_keys!11507 thiss!1427)) (index!41438 lt!457645)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!125229 (= lt!457645 e!587687)))

(declare-fun c!105215 () Bool)

(assert (=> d!125229 (= c!105215 (bvsge (x!92666 lt!457624) #b01111111111111111111111111111110))))

(assert (=> d!125229 (= lt!457644 (select (arr!31470 (_keys!11507 thiss!1427)) (index!41437 lt!457624)))))

(assert (=> d!125229 (validMask!0 (mask!30246 thiss!1427))))

(assert (=> d!125229 (= (seekKeyOrZeroReturnVacant!0 (x!92666 lt!457624) (index!41437 lt!457624) (index!41437 lt!457624) key!909 (_keys!11507 thiss!1427) (mask!30246 thiss!1427)) lt!457645)))

(declare-fun b!1038582 () Bool)

(declare-fun c!105217 () Bool)

(assert (=> b!1038582 (= c!105217 (= lt!457644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038582 (= e!587685 e!587686)))

(declare-fun b!1038583 () Bool)

(assert (=> b!1038583 (= e!587685 (Found!9766 (index!41437 lt!457624)))))

(assert (= (and d!125229 c!105215) b!1038579))

(assert (= (and d!125229 (not c!105215)) b!1038578))

(assert (= (and b!1038578 c!105216) b!1038583))

(assert (= (and b!1038578 (not c!105216)) b!1038582))

(assert (= (and b!1038582 c!105217) b!1038580))

(assert (= (and b!1038582 (not c!105217)) b!1038581))

(declare-fun m!957977 () Bool)

(assert (=> b!1038581 m!957977))

(assert (=> b!1038581 m!957977))

(declare-fun m!957979 () Bool)

(assert (=> b!1038581 m!957979))

(declare-fun m!957981 () Bool)

(assert (=> d!125229 m!957981))

(declare-fun m!957983 () Bool)

(assert (=> d!125229 m!957983))

(assert (=> d!125229 m!957951))

(assert (=> d!125229 m!957853))

(assert (=> b!1038521 d!125229))

(declare-fun d!125231 () Bool)

(assert (=> d!125231 (= (validKeyInArray!0 (select (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580))) (and (not (= (select (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1038481 d!125231))

(declare-fun b!1038594 () Bool)

(declare-fun res!692790 () Bool)

(declare-fun e!587690 () Bool)

(assert (=> b!1038594 (=> (not res!692790) (not e!587690))))

(declare-fun size!32008 (LongMapFixedSize!5854) (_ BitVec 32))

(assert (=> b!1038594 (= res!692790 (= (size!32008 thiss!1427) (bvadd (_size!2982 thiss!1427) (bvsdiv (bvadd (extraKeys!6037 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!125233 () Bool)

(declare-fun res!692791 () Bool)

(assert (=> d!125233 (=> (not res!692791) (not e!587690))))

(assert (=> d!125233 (= res!692791 (validMask!0 (mask!30246 thiss!1427)))))

(assert (=> d!125233 (= (simpleValid!423 thiss!1427) e!587690)))

(declare-fun b!1038592 () Bool)

(declare-fun res!692793 () Bool)

(assert (=> b!1038592 (=> (not res!692793) (not e!587690))))

(assert (=> b!1038592 (= res!692793 (and (= (size!32003 (_values!6332 thiss!1427)) (bvadd (mask!30246 thiss!1427) #b00000000000000000000000000000001)) (= (size!32002 (_keys!11507 thiss!1427)) (size!32003 (_values!6332 thiss!1427))) (bvsge (_size!2982 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2982 thiss!1427) (bvadd (mask!30246 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1038595 () Bool)

(assert (=> b!1038595 (= e!587690 (and (bvsge (extraKeys!6037 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6037 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2982 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1038593 () Bool)

(declare-fun res!692792 () Bool)

(assert (=> b!1038593 (=> (not res!692792) (not e!587690))))

(assert (=> b!1038593 (= res!692792 (bvsge (size!32008 thiss!1427) (_size!2982 thiss!1427)))))

(assert (= (and d!125233 res!692791) b!1038592))

(assert (= (and b!1038592 res!692793) b!1038593))

(assert (= (and b!1038593 res!692792) b!1038594))

(assert (= (and b!1038594 res!692790) b!1038595))

(declare-fun m!957985 () Bool)

(assert (=> b!1038594 m!957985))

(assert (=> d!125233 m!957853))

(assert (=> b!1038593 m!957985))

(assert (=> d!125223 d!125233))

(declare-fun d!125235 () Bool)

(assert (=> d!125235 (= (validKeyInArray!0 (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1038493 d!125235))

(declare-fun d!125237 () Bool)

(assert (=> d!125237 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1038482 d!125237))

(assert (=> b!1038528 d!125211))

(declare-fun b!1038596 () Bool)

(declare-fun e!587692 () (_ BitVec 32))

(declare-fun e!587691 () (_ BitVec 32))

(assert (=> b!1038596 (= e!587692 e!587691)))

(declare-fun c!105219 () Bool)

(assert (=> b!1038596 (= c!105219 (validKeyInArray!0 (select (arr!31470 lt!457581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1038597 () Bool)

(declare-fun call!43933 () (_ BitVec 32))

(assert (=> b!1038597 (= e!587691 call!43933)))

(declare-fun b!1038598 () Bool)

(assert (=> b!1038598 (= e!587692 #b00000000000000000000000000000000)))

(declare-fun d!125239 () Bool)

(declare-fun lt!457646 () (_ BitVec 32))

(assert (=> d!125239 (and (bvsge lt!457646 #b00000000000000000000000000000000) (bvsle lt!457646 (bvsub (size!32002 lt!457581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125239 (= lt!457646 e!587692)))

(declare-fun c!105218 () Bool)

(assert (=> d!125239 (= c!105218 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))))))

(assert (=> d!125239 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32002 (_keys!11507 thiss!1427)) (size!32002 lt!457581)))))

(assert (=> d!125239 (= (arrayCountValidKeys!0 lt!457581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))) lt!457646)))

(declare-fun bm!43930 () Bool)

(assert (=> bm!43930 (= call!43933 (arrayCountValidKeys!0 lt!457581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))))))

(declare-fun b!1038599 () Bool)

(assert (=> b!1038599 (= e!587691 (bvadd #b00000000000000000000000000000001 call!43933))))

(assert (= (and d!125239 c!105218) b!1038598))

(assert (= (and d!125239 (not c!105218)) b!1038596))

(assert (= (and b!1038596 c!105219) b!1038599))

(assert (= (and b!1038596 (not c!105219)) b!1038597))

(assert (= (or b!1038599 b!1038597) bm!43930))

(declare-fun m!957987 () Bool)

(assert (=> b!1038596 m!957987))

(assert (=> b!1038596 m!957987))

(declare-fun m!957989 () Bool)

(assert (=> b!1038596 m!957989))

(declare-fun m!957991 () Bool)

(assert (=> bm!43930 m!957991))

(assert (=> bm!43929 d!125239))

(declare-fun d!125241 () Bool)

(declare-fun res!692799 () Bool)

(declare-fun e!587699 () Bool)

(assert (=> d!125241 (=> res!692799 e!587699)))

(assert (=> d!125241 (= res!692799 (bvsge #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))))))

(assert (=> d!125241 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11507 thiss!1427) (mask!30246 thiss!1427)) e!587699)))

(declare-fun bm!43933 () Bool)

(declare-fun call!43936 () Bool)

(assert (=> bm!43933 (= call!43936 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11507 thiss!1427) (mask!30246 thiss!1427)))))

(declare-fun b!1038608 () Bool)

(declare-fun e!587700 () Bool)

(assert (=> b!1038608 (= e!587700 call!43936)))

(declare-fun b!1038609 () Bool)

(declare-fun e!587701 () Bool)

(assert (=> b!1038609 (= e!587701 e!587700)))

(declare-fun lt!457654 () (_ BitVec 64))

(assert (=> b!1038609 (= lt!457654 (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457653 () Unit!33859)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65389 (_ BitVec 64) (_ BitVec 32)) Unit!33859)

(assert (=> b!1038609 (= lt!457653 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11507 thiss!1427) lt!457654 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1038609 (arrayContainsKey!0 (_keys!11507 thiss!1427) lt!457654 #b00000000000000000000000000000000)))

(declare-fun lt!457655 () Unit!33859)

(assert (=> b!1038609 (= lt!457655 lt!457653)))

(declare-fun res!692798 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65389 (_ BitVec 32)) SeekEntryResult!9766)

(assert (=> b!1038609 (= res!692798 (= (seekEntryOrOpen!0 (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000) (_keys!11507 thiss!1427) (mask!30246 thiss!1427)) (Found!9766 #b00000000000000000000000000000000)))))

(assert (=> b!1038609 (=> (not res!692798) (not e!587700))))

(declare-fun b!1038610 () Bool)

(assert (=> b!1038610 (= e!587701 call!43936)))

(declare-fun b!1038611 () Bool)

(assert (=> b!1038611 (= e!587699 e!587701)))

(declare-fun c!105222 () Bool)

(assert (=> b!1038611 (= c!105222 (validKeyInArray!0 (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125241 (not res!692799)) b!1038611))

(assert (= (and b!1038611 c!105222) b!1038609))

(assert (= (and b!1038611 (not c!105222)) b!1038610))

(assert (= (and b!1038609 res!692798) b!1038608))

(assert (= (or b!1038608 b!1038610) bm!43933))

(declare-fun m!957993 () Bool)

(assert (=> bm!43933 m!957993))

(assert (=> b!1038609 m!957939))

(declare-fun m!957995 () Bool)

(assert (=> b!1038609 m!957995))

(declare-fun m!957997 () Bool)

(assert (=> b!1038609 m!957997))

(assert (=> b!1038609 m!957939))

(declare-fun m!957999 () Bool)

(assert (=> b!1038609 m!957999))

(assert (=> b!1038611 m!957939))

(assert (=> b!1038611 m!957939))

(assert (=> b!1038611 m!957941))

(assert (=> b!1038529 d!125241))

(declare-fun b!1038612 () Bool)

(declare-fun e!587703 () (_ BitVec 32))

(declare-fun e!587702 () (_ BitVec 32))

(assert (=> b!1038612 (= e!587703 e!587702)))

(declare-fun c!105224 () Bool)

(assert (=> b!1038612 (= c!105224 (validKeyInArray!0 (select (arr!31470 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1038613 () Bool)

(declare-fun call!43937 () (_ BitVec 32))

(assert (=> b!1038613 (= e!587702 call!43937)))

(declare-fun b!1038614 () Bool)

(assert (=> b!1038614 (= e!587703 #b00000000000000000000000000000000)))

(declare-fun d!125243 () Bool)

(declare-fun lt!457656 () (_ BitVec 32))

(assert (=> d!125243 (and (bvsge lt!457656 #b00000000000000000000000000000000) (bvsle lt!457656 (bvsub (size!32002 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125243 (= lt!457656 e!587703)))

(declare-fun c!105223 () Bool)

(assert (=> d!125243 (= c!105223 (bvsge #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))))))

(assert (=> d!125243 (and (bvsle #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32002 (_keys!11507 thiss!1427)) (size!32002 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))))))))

(assert (=> d!125243 (= (arrayCountValidKeys!0 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))) #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) lt!457656)))

(declare-fun bm!43934 () Bool)

(assert (=> bm!43934 (= call!43937 (arrayCountValidKeys!0 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))))))

(declare-fun b!1038615 () Bool)

(assert (=> b!1038615 (= e!587702 (bvadd #b00000000000000000000000000000001 call!43937))))

(assert (= (and d!125243 c!105223) b!1038614))

(assert (= (and d!125243 (not c!105223)) b!1038612))

(assert (= (and b!1038612 c!105224) b!1038615))

(assert (= (and b!1038612 (not c!105224)) b!1038613))

(assert (= (or b!1038615 b!1038613) bm!43934))

(declare-fun m!958001 () Bool)

(assert (=> b!1038612 m!958001))

(assert (=> b!1038612 m!958001))

(declare-fun m!958003 () Bool)

(assert (=> b!1038612 m!958003))

(declare-fun m!958005 () Bool)

(assert (=> bm!43934 m!958005))

(assert (=> b!1038484 d!125243))

(assert (=> b!1038484 d!125211))

(declare-fun bm!43935 () Bool)

(declare-fun call!43938 () Bool)

(declare-fun c!105225 () Bool)

(assert (=> bm!43935 (= call!43938 (arrayNoDuplicates!0 (_keys!11507 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105225 (Cons!21969 (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000) Nil!21970) Nil!21970)))))

(declare-fun b!1038616 () Bool)

(declare-fun e!587705 () Bool)

(assert (=> b!1038616 (= e!587705 (contains!6019 Nil!21970 (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038617 () Bool)

(declare-fun e!587704 () Bool)

(declare-fun e!587707 () Bool)

(assert (=> b!1038617 (= e!587704 e!587707)))

(declare-fun res!692801 () Bool)

(assert (=> b!1038617 (=> (not res!692801) (not e!587707))))

(assert (=> b!1038617 (= res!692801 (not e!587705))))

(declare-fun res!692800 () Bool)

(assert (=> b!1038617 (=> (not res!692800) (not e!587705))))

(assert (=> b!1038617 (= res!692800 (validKeyInArray!0 (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038618 () Bool)

(declare-fun e!587706 () Bool)

(assert (=> b!1038618 (= e!587706 call!43938)))

(declare-fun b!1038619 () Bool)

(assert (=> b!1038619 (= e!587706 call!43938)))

(declare-fun b!1038620 () Bool)

(assert (=> b!1038620 (= e!587707 e!587706)))

(assert (=> b!1038620 (= c!105225 (validKeyInArray!0 (select (arr!31470 (_keys!11507 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125245 () Bool)

(declare-fun res!692802 () Bool)

(assert (=> d!125245 (=> res!692802 e!587704)))

(assert (=> d!125245 (= res!692802 (bvsge #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))))))

(assert (=> d!125245 (= (arrayNoDuplicates!0 (_keys!11507 thiss!1427) #b00000000000000000000000000000000 Nil!21970) e!587704)))

(assert (= (and d!125245 (not res!692802)) b!1038617))

(assert (= (and b!1038617 res!692800) b!1038616))

(assert (= (and b!1038617 res!692801) b!1038620))

(assert (= (and b!1038620 c!105225) b!1038618))

(assert (= (and b!1038620 (not c!105225)) b!1038619))

(assert (= (or b!1038618 b!1038619) bm!43935))

(assert (=> bm!43935 m!957939))

(declare-fun m!958007 () Bool)

(assert (=> bm!43935 m!958007))

(assert (=> b!1038616 m!957939))

(assert (=> b!1038616 m!957939))

(declare-fun m!958009 () Bool)

(assert (=> b!1038616 m!958009))

(assert (=> b!1038617 m!957939))

(assert (=> b!1038617 m!957939))

(assert (=> b!1038617 m!957941))

(assert (=> b!1038620 m!957939))

(assert (=> b!1038620 m!957939))

(assert (=> b!1038620 m!957941))

(assert (=> b!1038530 d!125245))

(declare-fun c!105226 () Bool)

(declare-fun call!43939 () Bool)

(declare-fun bm!43936 () Bool)

(assert (=> bm!43936 (= call!43939 (arrayNoDuplicates!0 lt!457581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105226 (Cons!21969 (select (arr!31470 lt!457581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105182 (Cons!21969 (select (arr!31470 lt!457581) #b00000000000000000000000000000000) Nil!21970) Nil!21970)) (ite c!105182 (Cons!21969 (select (arr!31470 lt!457581) #b00000000000000000000000000000000) Nil!21970) Nil!21970))))))

(declare-fun b!1038621 () Bool)

(declare-fun e!587709 () Bool)

(assert (=> b!1038621 (= e!587709 (contains!6019 (ite c!105182 (Cons!21969 (select (arr!31470 lt!457581) #b00000000000000000000000000000000) Nil!21970) Nil!21970) (select (arr!31470 lt!457581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1038622 () Bool)

(declare-fun e!587708 () Bool)

(declare-fun e!587711 () Bool)

(assert (=> b!1038622 (= e!587708 e!587711)))

(declare-fun res!692804 () Bool)

(assert (=> b!1038622 (=> (not res!692804) (not e!587711))))

(assert (=> b!1038622 (= res!692804 (not e!587709))))

(declare-fun res!692803 () Bool)

(assert (=> b!1038622 (=> (not res!692803) (not e!587709))))

(assert (=> b!1038622 (= res!692803 (validKeyInArray!0 (select (arr!31470 lt!457581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1038623 () Bool)

(declare-fun e!587710 () Bool)

(assert (=> b!1038623 (= e!587710 call!43939)))

(declare-fun b!1038624 () Bool)

(assert (=> b!1038624 (= e!587710 call!43939)))

(declare-fun b!1038625 () Bool)

(assert (=> b!1038625 (= e!587711 e!587710)))

(assert (=> b!1038625 (= c!105226 (validKeyInArray!0 (select (arr!31470 lt!457581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125247 () Bool)

(declare-fun res!692805 () Bool)

(assert (=> d!125247 (=> res!692805 e!587708)))

(assert (=> d!125247 (= res!692805 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 lt!457581)))))

(assert (=> d!125247 (= (arrayNoDuplicates!0 lt!457581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105182 (Cons!21969 (select (arr!31470 lt!457581) #b00000000000000000000000000000000) Nil!21970) Nil!21970)) e!587708)))

(assert (= (and d!125247 (not res!692805)) b!1038622))

(assert (= (and b!1038622 res!692803) b!1038621))

(assert (= (and b!1038622 res!692804) b!1038625))

(assert (= (and b!1038625 c!105226) b!1038623))

(assert (= (and b!1038625 (not c!105226)) b!1038624))

(assert (= (or b!1038623 b!1038624) bm!43936))

(assert (=> bm!43936 m!957987))

(declare-fun m!958011 () Bool)

(assert (=> bm!43936 m!958011))

(assert (=> b!1038621 m!957987))

(assert (=> b!1038621 m!957987))

(declare-fun m!958013 () Bool)

(assert (=> b!1038621 m!958013))

(assert (=> b!1038622 m!957987))

(assert (=> b!1038622 m!957987))

(assert (=> b!1038622 m!957989))

(assert (=> b!1038625 m!957987))

(assert (=> b!1038625 m!957987))

(assert (=> b!1038625 m!957989))

(assert (=> bm!43925 d!125247))

(declare-fun b!1038626 () Bool)

(declare-fun e!587713 () (_ BitVec 32))

(declare-fun e!587712 () (_ BitVec 32))

(assert (=> b!1038626 (= e!587713 e!587712)))

(declare-fun c!105228 () Bool)

(assert (=> b!1038626 (= c!105228 (validKeyInArray!0 (select (arr!31470 (_keys!11507 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1038627 () Bool)

(declare-fun call!43940 () (_ BitVec 32))

(assert (=> b!1038627 (= e!587712 call!43940)))

(declare-fun b!1038628 () Bool)

(assert (=> b!1038628 (= e!587713 #b00000000000000000000000000000000)))

(declare-fun d!125249 () Bool)

(declare-fun lt!457657 () (_ BitVec 32))

(assert (=> d!125249 (and (bvsge lt!457657 #b00000000000000000000000000000000) (bvsle lt!457657 (bvsub (size!32002 (_keys!11507 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125249 (= lt!457657 e!587713)))

(declare-fun c!105227 () Bool)

(assert (=> d!125249 (= c!105227 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))))))

(assert (=> d!125249 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32002 (_keys!11507 thiss!1427)) (size!32002 (_keys!11507 thiss!1427))))))

(assert (=> d!125249 (= (arrayCountValidKeys!0 (_keys!11507 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))) lt!457657)))

(declare-fun bm!43937 () Bool)

(assert (=> bm!43937 (= call!43940 (arrayCountValidKeys!0 (_keys!11507 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32002 (_keys!11507 thiss!1427))))))

(declare-fun b!1038629 () Bool)

(assert (=> b!1038629 (= e!587712 (bvadd #b00000000000000000000000000000001 call!43940))))

(assert (= (and d!125249 c!105227) b!1038628))

(assert (= (and d!125249 (not c!105227)) b!1038626))

(assert (= (and b!1038626 c!105228) b!1038629))

(assert (= (and b!1038626 (not c!105228)) b!1038627))

(assert (= (or b!1038629 b!1038627) bm!43937))

(declare-fun m!958015 () Bool)

(assert (=> b!1038626 m!958015))

(assert (=> b!1038626 m!958015))

(declare-fun m!958017 () Bool)

(assert (=> b!1038626 m!958017))

(declare-fun m!958019 () Bool)

(assert (=> bm!43937 m!958019))

(assert (=> bm!43928 d!125249))

(declare-fun bm!43938 () Bool)

(declare-fun call!43941 () Bool)

(declare-fun c!105229 () Bool)

(assert (=> bm!43938 (= call!43941 (arrayNoDuplicates!0 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105229 (Cons!21969 (select (arr!31470 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427)))) #b00000000000000000000000000000000) Nil!21970) Nil!21970)))))

(declare-fun b!1038630 () Bool)

(declare-fun e!587715 () Bool)

(assert (=> b!1038630 (= e!587715 (contains!6019 Nil!21970 (select (arr!31470 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1038631 () Bool)

(declare-fun e!587714 () Bool)

(declare-fun e!587717 () Bool)

(assert (=> b!1038631 (= e!587714 e!587717)))

(declare-fun res!692807 () Bool)

(assert (=> b!1038631 (=> (not res!692807) (not e!587717))))

(assert (=> b!1038631 (= res!692807 (not e!587715))))

(declare-fun res!692806 () Bool)

(assert (=> b!1038631 (=> (not res!692806) (not e!587715))))

(assert (=> b!1038631 (= res!692806 (validKeyInArray!0 (select (arr!31470 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1038632 () Bool)

(declare-fun e!587716 () Bool)

(assert (=> b!1038632 (= e!587716 call!43941)))

(declare-fun b!1038633 () Bool)

(assert (=> b!1038633 (= e!587716 call!43941)))

(declare-fun b!1038634 () Bool)

(assert (=> b!1038634 (= e!587717 e!587716)))

(assert (=> b!1038634 (= c!105229 (validKeyInArray!0 (select (arr!31470 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125251 () Bool)

(declare-fun res!692808 () Bool)

(assert (=> d!125251 (=> res!692808 e!587714)))

(assert (=> d!125251 (= res!692808 (bvsge #b00000000000000000000000000000000 (size!32002 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))))))))

(assert (=> d!125251 (= (arrayNoDuplicates!0 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))) #b00000000000000000000000000000000 Nil!21970) e!587714)))

(assert (= (and d!125251 (not res!692808)) b!1038631))

(assert (= (and b!1038631 res!692806) b!1038630))

(assert (= (and b!1038631 res!692807) b!1038634))

(assert (= (and b!1038634 c!105229) b!1038632))

(assert (= (and b!1038634 (not c!105229)) b!1038633))

(assert (= (or b!1038632 b!1038633) bm!43938))

(assert (=> bm!43938 m!958001))

(declare-fun m!958021 () Bool)

(assert (=> bm!43938 m!958021))

(assert (=> b!1038630 m!958001))

(assert (=> b!1038630 m!958001))

(declare-fun m!958023 () Bool)

(assert (=> b!1038630 m!958023))

(assert (=> b!1038631 m!958001))

(assert (=> b!1038631 m!958001))

(assert (=> b!1038631 m!958003))

(assert (=> b!1038634 m!958001))

(assert (=> b!1038634 m!958001))

(assert (=> b!1038634 m!958003))

(assert (=> b!1038503 d!125251))

(declare-fun d!125253 () Bool)

(declare-fun lt!457660 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!519 (List!21973) (InoxSet (_ BitVec 64)))

(assert (=> d!125253 (= lt!457660 (select (content!519 Nil!21970) (select (arr!31470 lt!457581) #b00000000000000000000000000000000)))))

(declare-fun e!587722 () Bool)

(assert (=> d!125253 (= lt!457660 e!587722)))

(declare-fun res!692813 () Bool)

(assert (=> d!125253 (=> (not res!692813) (not e!587722))))

(assert (=> d!125253 (= res!692813 ((_ is Cons!21969) Nil!21970))))

(assert (=> d!125253 (= (contains!6019 Nil!21970 (select (arr!31470 lt!457581) #b00000000000000000000000000000000)) lt!457660)))

(declare-fun b!1038639 () Bool)

(declare-fun e!587723 () Bool)

(assert (=> b!1038639 (= e!587722 e!587723)))

(declare-fun res!692814 () Bool)

(assert (=> b!1038639 (=> res!692814 e!587723)))

(assert (=> b!1038639 (= res!692814 (= (h!23172 Nil!21970) (select (arr!31470 lt!457581) #b00000000000000000000000000000000)))))

(declare-fun b!1038640 () Bool)

(assert (=> b!1038640 (= e!587723 (contains!6019 (t!31178 Nil!21970) (select (arr!31470 lt!457581) #b00000000000000000000000000000000)))))

(assert (= (and d!125253 res!692813) b!1038639))

(assert (= (and b!1038639 (not res!692814)) b!1038640))

(declare-fun m!958025 () Bool)

(assert (=> d!125253 m!958025))

(assert (=> d!125253 m!957921))

(declare-fun m!958027 () Bool)

(assert (=> d!125253 m!958027))

(assert (=> b!1038640 m!957921))

(declare-fun m!958029 () Bool)

(assert (=> b!1038640 m!958029))

(assert (=> b!1038468 d!125253))

(declare-fun d!125255 () Bool)

(assert (=> d!125255 (= (validKeyInArray!0 (select (arr!31470 lt!457581) #b00000000000000000000000000000000)) (and (not (= (select (arr!31470 lt!457581) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31470 lt!457581) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1038469 d!125255))

(declare-fun d!125257 () Bool)

(assert (=> d!125257 (arrayNoDuplicates!0 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))) #b00000000000000000000000000000000 Nil!21970)))

(assert (=> d!125257 true))

(declare-fun _$66!44 () Unit!33859)

(assert (=> d!125257 (= (choose!53 (_keys!11507 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41436 lt!457580) #b00000000000000000000000000000000 Nil!21970) _$66!44)))

(declare-fun bs!30377 () Bool)

(assert (= bs!30377 d!125257))

(assert (=> bs!30377 m!957863))

(assert (=> bs!30377 m!957949))

(assert (=> d!125215 d!125257))

(declare-fun d!125259 () Bool)

(assert (=> d!125259 (= (arrayCountValidKeys!0 (array!65390 (store (arr!31470 (_keys!11507 thiss!1427)) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11507 thiss!1427))) #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11507 thiss!1427) #b00000000000000000000000000000000 (size!32002 (_keys!11507 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!125259 true))

(declare-fun _$79!20 () Unit!33859)

(assert (=> d!125259 (= (choose!82 (_keys!11507 thiss!1427) (index!41436 lt!457580) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!20)))

(declare-fun bs!30378 () Bool)

(assert (= bs!30378 d!125259))

(assert (=> bs!30378 m!957863))

(assert (=> bs!30378 m!957929))

(assert (=> bs!30378 m!957857))

(assert (=> d!125207 d!125259))

(assert (=> b!1038472 d!125255))

(assert (=> b!1038497 d!125255))

(declare-fun condMapEmpty!38557 () Bool)

(declare-fun mapDefault!38557 () ValueCell!11630)

(assert (=> mapNonEmpty!38556 (= condMapEmpty!38557 (= mapRest!38556 ((as const (Array (_ BitVec 32) ValueCell!11630)) mapDefault!38557)))))

(declare-fun e!587725 () Bool)

(declare-fun mapRes!38557 () Bool)

(assert (=> mapNonEmpty!38556 (= tp!74020 (and e!587725 mapRes!38557))))

(declare-fun mapNonEmpty!38557 () Bool)

(declare-fun tp!74021 () Bool)

(declare-fun e!587724 () Bool)

(assert (=> mapNonEmpty!38557 (= mapRes!38557 (and tp!74021 e!587724))))

(declare-fun mapValue!38557 () ValueCell!11630)

(declare-fun mapKey!38557 () (_ BitVec 32))

(declare-fun mapRest!38557 () (Array (_ BitVec 32) ValueCell!11630))

(assert (=> mapNonEmpty!38557 (= mapRest!38556 (store mapRest!38557 mapKey!38557 mapValue!38557))))

(declare-fun b!1038642 () Bool)

(assert (=> b!1038642 (= e!587725 tp_is_empty!24667)))

(declare-fun b!1038641 () Bool)

(assert (=> b!1038641 (= e!587724 tp_is_empty!24667)))

(declare-fun mapIsEmpty!38557 () Bool)

(assert (=> mapIsEmpty!38557 mapRes!38557))

(assert (= (and mapNonEmpty!38556 condMapEmpty!38557) mapIsEmpty!38557))

(assert (= (and mapNonEmpty!38556 (not condMapEmpty!38557)) mapNonEmpty!38557))

(assert (= (and mapNonEmpty!38557 ((_ is ValueCellFull!11630) mapValue!38557)) b!1038641))

(assert (= (and mapNonEmpty!38556 ((_ is ValueCellFull!11630) mapDefault!38557)) b!1038642))

(declare-fun m!958031 () Bool)

(assert (=> mapNonEmpty!38557 m!958031))

(check-sat (not b!1038630) (not b!1038611) (not b!1038617) (not bm!43934) (not bm!43933) (not b!1038620) (not b!1038593) (not d!125229) (not b!1038581) (not d!125259) (not b!1038596) (not b!1038594) (not d!125233) (not b_next!20947) (not d!125253) b_and!33453 (not d!125257) (not mapNonEmpty!38557) (not bm!43935) (not bm!43930) (not b!1038621) (not bm!43938) (not b!1038564) (not b!1038640) (not d!125225) (not bm!43937) (not b!1038609) (not b!1038612) (not b!1038626) (not bm!43936) (not b!1038622) (not b!1038625) tp_is_empty!24667 (not b!1038634) (not b!1038631) (not b!1038616))
(check-sat b_and!33453 (not b_next!20947))
