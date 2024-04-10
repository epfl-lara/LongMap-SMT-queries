; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90784 () Bool)

(assert start!90784)

(declare-fun b!1037859 () Bool)

(declare-fun b_free!20919 () Bool)

(declare-fun b_next!20919 () Bool)

(assert (=> b!1037859 (= b_free!20919 (not b_next!20919))))

(declare-fun tp!73911 () Bool)

(declare-fun b_and!33451 () Bool)

(assert (=> b!1037859 (= tp!73911 b_and!33451)))

(declare-fun res!692392 () Bool)

(declare-fun e!587165 () Bool)

(assert (=> start!90784 (=> (not res!692392) (not e!587165))))

(declare-datatypes ((V!37725 0))(
  ( (V!37726 (val!12370 Int)) )
))
(declare-datatypes ((ValueCell!11616 0))(
  ( (ValueCellFull!11616 (v!14954 V!37725)) (EmptyCell!11616) )
))
(declare-datatypes ((array!65388 0))(
  ( (array!65389 (arr!31473 (Array (_ BitVec 32) (_ BitVec 64))) (size!32003 (_ BitVec 32))) )
))
(declare-datatypes ((array!65390 0))(
  ( (array!65391 (arr!31474 (Array (_ BitVec 32) ValueCell!11616)) (size!32004 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5826 0))(
  ( (LongMapFixedSize!5827 (defaultEntry!6295 Int) (mask!30223 (_ BitVec 32)) (extraKeys!6023 (_ BitVec 32)) (zeroValue!6129 V!37725) (minValue!6129 V!37725) (_size!2968 (_ BitVec 32)) (_keys!11494 array!65388) (_values!6318 array!65390) (_vacant!2968 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5826)

(declare-fun valid!2196 (LongMapFixedSize!5826) Bool)

(assert (=> start!90784 (= res!692392 (valid!2196 thiss!1427))))

(assert (=> start!90784 e!587165))

(declare-fun e!587169 () Bool)

(assert (=> start!90784 e!587169))

(assert (=> start!90784 true))

(declare-fun b!1037850 () Bool)

(declare-fun res!692391 () Bool)

(declare-fun e!587163 () Bool)

(assert (=> b!1037850 (=> res!692391 e!587163)))

(declare-datatypes ((List!21928 0))(
  ( (Nil!21925) (Cons!21924 (h!23127 (_ BitVec 64)) (t!31142 List!21928)) )
))
(declare-fun contains!6029 (List!21928 (_ BitVec 64)) Bool)

(assert (=> b!1037850 (= res!692391 (contains!6029 Nil!21925 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037851 () Bool)

(declare-fun res!692389 () Bool)

(assert (=> b!1037851 (=> (not res!692389) (not e!587165))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037851 (= res!692389 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037852 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65388 (_ BitVec 32) List!21928) Bool)

(assert (=> b!1037852 (= e!587163 (arrayNoDuplicates!0 (_keys!11494 thiss!1427) #b00000000000000000000000000000000 Nil!21925))))

(declare-fun mapIsEmpty!38496 () Bool)

(declare-fun mapRes!38496 () Bool)

(assert (=> mapIsEmpty!38496 mapRes!38496))

(declare-fun b!1037853 () Bool)

(declare-fun res!692387 () Bool)

(assert (=> b!1037853 (=> res!692387 e!587163)))

(assert (=> b!1037853 (= res!692387 (contains!6029 Nil!21925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037854 () Bool)

(declare-fun res!692388 () Bool)

(assert (=> b!1037854 (=> res!692388 e!587163)))

(declare-fun noDuplicate!1478 (List!21928) Bool)

(assert (=> b!1037854 (= res!692388 (not (noDuplicate!1478 Nil!21925)))))

(declare-fun b!1037855 () Bool)

(declare-fun e!587166 () Bool)

(declare-fun e!587168 () Bool)

(assert (=> b!1037855 (= e!587166 (and e!587168 mapRes!38496))))

(declare-fun condMapEmpty!38496 () Bool)

(declare-fun mapDefault!38496 () ValueCell!11616)

(assert (=> b!1037855 (= condMapEmpty!38496 (= (arr!31474 (_values!6318 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11616)) mapDefault!38496)))))

(declare-fun mapNonEmpty!38496 () Bool)

(declare-fun tp!73912 () Bool)

(declare-fun e!587164 () Bool)

(assert (=> mapNonEmpty!38496 (= mapRes!38496 (and tp!73912 e!587164))))

(declare-fun mapValue!38496 () ValueCell!11616)

(declare-fun mapRest!38496 () (Array (_ BitVec 32) ValueCell!11616))

(declare-fun mapKey!38496 () (_ BitVec 32))

(assert (=> mapNonEmpty!38496 (= (arr!31474 (_values!6318 thiss!1427)) (store mapRest!38496 mapKey!38496 mapValue!38496))))

(declare-fun b!1037856 () Bool)

(declare-fun tp_is_empty!24639 () Bool)

(assert (=> b!1037856 (= e!587168 tp_is_empty!24639)))

(declare-fun b!1037857 () Bool)

(assert (=> b!1037857 (= e!587164 tp_is_empty!24639)))

(declare-fun b!1037858 () Bool)

(declare-fun e!587167 () Bool)

(assert (=> b!1037858 (= e!587165 e!587167)))

(declare-fun res!692390 () Bool)

(assert (=> b!1037858 (=> (not res!692390) (not e!587167))))

(declare-datatypes ((SeekEntryResult!9762 0))(
  ( (MissingZero!9762 (index!41419 (_ BitVec 32))) (Found!9762 (index!41420 (_ BitVec 32))) (Intermediate!9762 (undefined!10574 Bool) (index!41421 (_ BitVec 32)) (x!92601 (_ BitVec 32))) (Undefined!9762) (MissingVacant!9762 (index!41422 (_ BitVec 32))) )
))
(declare-fun lt!457595 () SeekEntryResult!9762)

(get-info :version)

(assert (=> b!1037858 (= res!692390 ((_ is Found!9762) lt!457595))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65388 (_ BitVec 32)) SeekEntryResult!9762)

(assert (=> b!1037858 (= lt!457595 (seekEntry!0 key!909 (_keys!11494 thiss!1427) (mask!30223 thiss!1427)))))

(declare-fun array_inv!24341 (array!65388) Bool)

(declare-fun array_inv!24342 (array!65390) Bool)

(assert (=> b!1037859 (= e!587169 (and tp!73911 tp_is_empty!24639 (array_inv!24341 (_keys!11494 thiss!1427)) (array_inv!24342 (_values!6318 thiss!1427)) e!587166))))

(declare-fun b!1037860 () Bool)

(assert (=> b!1037860 (= e!587167 (not e!587163))))

(declare-fun res!692393 () Bool)

(assert (=> b!1037860 (=> res!692393 e!587163)))

(assert (=> b!1037860 (= res!692393 (or (bvsge (size!32003 (_keys!11494 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65388 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037860 (= (arrayCountValidKeys!0 (array!65389 (store (arr!31473 (_keys!11494 thiss!1427)) (index!41420 lt!457595) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32003 (_keys!11494 thiss!1427))) #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11494 thiss!1427) #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33963 0))(
  ( (Unit!33964) )
))
(declare-fun lt!457596 () Unit!33963)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65388 (_ BitVec 32) (_ BitVec 64)) Unit!33963)

(assert (=> b!1037860 (= lt!457596 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11494 thiss!1427) (index!41420 lt!457595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90784 res!692392) b!1037851))

(assert (= (and b!1037851 res!692389) b!1037858))

(assert (= (and b!1037858 res!692390) b!1037860))

(assert (= (and b!1037860 (not res!692393)) b!1037854))

(assert (= (and b!1037854 (not res!692388)) b!1037853))

(assert (= (and b!1037853 (not res!692387)) b!1037850))

(assert (= (and b!1037850 (not res!692391)) b!1037852))

(assert (= (and b!1037855 condMapEmpty!38496) mapIsEmpty!38496))

(assert (= (and b!1037855 (not condMapEmpty!38496)) mapNonEmpty!38496))

(assert (= (and mapNonEmpty!38496 ((_ is ValueCellFull!11616) mapValue!38496)) b!1037857))

(assert (= (and b!1037855 ((_ is ValueCellFull!11616) mapDefault!38496)) b!1037856))

(assert (= b!1037859 b!1037855))

(assert (= start!90784 b!1037859))

(declare-fun m!957951 () Bool)

(assert (=> b!1037850 m!957951))

(declare-fun m!957953 () Bool)

(assert (=> b!1037852 m!957953))

(declare-fun m!957955 () Bool)

(assert (=> b!1037858 m!957955))

(declare-fun m!957957 () Bool)

(assert (=> b!1037853 m!957957))

(declare-fun m!957959 () Bool)

(assert (=> b!1037854 m!957959))

(declare-fun m!957961 () Bool)

(assert (=> start!90784 m!957961))

(declare-fun m!957963 () Bool)

(assert (=> b!1037859 m!957963))

(declare-fun m!957965 () Bool)

(assert (=> b!1037859 m!957965))

(declare-fun m!957967 () Bool)

(assert (=> b!1037860 m!957967))

(declare-fun m!957969 () Bool)

(assert (=> b!1037860 m!957969))

(declare-fun m!957971 () Bool)

(assert (=> b!1037860 m!957971))

(declare-fun m!957973 () Bool)

(assert (=> b!1037860 m!957973))

(declare-fun m!957975 () Bool)

(assert (=> mapNonEmpty!38496 m!957975))

(check-sat (not b!1037854) (not b!1037853) (not mapNonEmpty!38496) tp_is_empty!24639 (not start!90784) (not b!1037860) (not b!1037850) (not b!1037858) (not b_next!20919) b_and!33451 (not b!1037852) (not b!1037859))
(check-sat b_and!33451 (not b_next!20919))
(get-model)

(declare-fun d!125281 () Bool)

(assert (=> d!125281 (= (array_inv!24341 (_keys!11494 thiss!1427)) (bvsge (size!32003 (_keys!11494 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037859 d!125281))

(declare-fun d!125283 () Bool)

(assert (=> d!125283 (= (array_inv!24342 (_values!6318 thiss!1427)) (bvsge (size!32004 (_values!6318 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037859 d!125283))

(declare-fun d!125285 () Bool)

(declare-fun lt!457605 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!517 (List!21928) (InoxSet (_ BitVec 64)))

(assert (=> d!125285 (= lt!457605 (select (content!517 Nil!21925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587198 () Bool)

(assert (=> d!125285 (= lt!457605 e!587198)))

(declare-fun res!692419 () Bool)

(assert (=> d!125285 (=> (not res!692419) (not e!587198))))

(assert (=> d!125285 (= res!692419 ((_ is Cons!21924) Nil!21925))))

(assert (=> d!125285 (= (contains!6029 Nil!21925 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457605)))

(declare-fun b!1037898 () Bool)

(declare-fun e!587199 () Bool)

(assert (=> b!1037898 (= e!587198 e!587199)))

(declare-fun res!692420 () Bool)

(assert (=> b!1037898 (=> res!692420 e!587199)))

(assert (=> b!1037898 (= res!692420 (= (h!23127 Nil!21925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037899 () Bool)

(assert (=> b!1037899 (= e!587199 (contains!6029 (t!31142 Nil!21925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125285 res!692419) b!1037898))

(assert (= (and b!1037898 (not res!692420)) b!1037899))

(declare-fun m!958003 () Bool)

(assert (=> d!125285 m!958003))

(declare-fun m!958005 () Bool)

(assert (=> d!125285 m!958005))

(declare-fun m!958007 () Bool)

(assert (=> b!1037899 m!958007))

(assert (=> b!1037850 d!125285))

(declare-fun d!125287 () Bool)

(declare-fun res!692425 () Bool)

(declare-fun e!587204 () Bool)

(assert (=> d!125287 (=> res!692425 e!587204)))

(assert (=> d!125287 (= res!692425 ((_ is Nil!21925) Nil!21925))))

(assert (=> d!125287 (= (noDuplicate!1478 Nil!21925) e!587204)))

(declare-fun b!1037904 () Bool)

(declare-fun e!587205 () Bool)

(assert (=> b!1037904 (= e!587204 e!587205)))

(declare-fun res!692426 () Bool)

(assert (=> b!1037904 (=> (not res!692426) (not e!587205))))

(assert (=> b!1037904 (= res!692426 (not (contains!6029 (t!31142 Nil!21925) (h!23127 Nil!21925))))))

(declare-fun b!1037905 () Bool)

(assert (=> b!1037905 (= e!587205 (noDuplicate!1478 (t!31142 Nil!21925)))))

(assert (= (and d!125287 (not res!692425)) b!1037904))

(assert (= (and b!1037904 res!692426) b!1037905))

(declare-fun m!958009 () Bool)

(assert (=> b!1037904 m!958009))

(declare-fun m!958011 () Bool)

(assert (=> b!1037905 m!958011))

(assert (=> b!1037854 d!125287))

(declare-fun bm!43927 () Bool)

(declare-fun call!43930 () Bool)

(declare-fun c!105161 () Bool)

(assert (=> bm!43927 (= call!43930 (arrayNoDuplicates!0 (_keys!11494 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105161 (Cons!21924 (select (arr!31473 (_keys!11494 thiss!1427)) #b00000000000000000000000000000000) Nil!21925) Nil!21925)))))

(declare-fun b!1037916 () Bool)

(declare-fun e!587217 () Bool)

(declare-fun e!587214 () Bool)

(assert (=> b!1037916 (= e!587217 e!587214)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037916 (= c!105161 (validKeyInArray!0 (select (arr!31473 (_keys!11494 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037917 () Bool)

(declare-fun e!587215 () Bool)

(assert (=> b!1037917 (= e!587215 (contains!6029 Nil!21925 (select (arr!31473 (_keys!11494 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037918 () Bool)

(declare-fun e!587216 () Bool)

(assert (=> b!1037918 (= e!587216 e!587217)))

(declare-fun res!692434 () Bool)

(assert (=> b!1037918 (=> (not res!692434) (not e!587217))))

(assert (=> b!1037918 (= res!692434 (not e!587215))))

(declare-fun res!692433 () Bool)

(assert (=> b!1037918 (=> (not res!692433) (not e!587215))))

(assert (=> b!1037918 (= res!692433 (validKeyInArray!0 (select (arr!31473 (_keys!11494 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037919 () Bool)

(assert (=> b!1037919 (= e!587214 call!43930)))

(declare-fun b!1037920 () Bool)

(assert (=> b!1037920 (= e!587214 call!43930)))

(declare-fun d!125289 () Bool)

(declare-fun res!692435 () Bool)

(assert (=> d!125289 (=> res!692435 e!587216)))

(assert (=> d!125289 (= res!692435 (bvsge #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))))))

(assert (=> d!125289 (= (arrayNoDuplicates!0 (_keys!11494 thiss!1427) #b00000000000000000000000000000000 Nil!21925) e!587216)))

(assert (= (and d!125289 (not res!692435)) b!1037918))

(assert (= (and b!1037918 res!692433) b!1037917))

(assert (= (and b!1037918 res!692434) b!1037916))

(assert (= (and b!1037916 c!105161) b!1037919))

(assert (= (and b!1037916 (not c!105161)) b!1037920))

(assert (= (or b!1037919 b!1037920) bm!43927))

(declare-fun m!958013 () Bool)

(assert (=> bm!43927 m!958013))

(declare-fun m!958015 () Bool)

(assert (=> bm!43927 m!958015))

(assert (=> b!1037916 m!958013))

(assert (=> b!1037916 m!958013))

(declare-fun m!958017 () Bool)

(assert (=> b!1037916 m!958017))

(assert (=> b!1037917 m!958013))

(assert (=> b!1037917 m!958013))

(declare-fun m!958019 () Bool)

(assert (=> b!1037917 m!958019))

(assert (=> b!1037918 m!958013))

(assert (=> b!1037918 m!958013))

(assert (=> b!1037918 m!958017))

(assert (=> b!1037852 d!125289))

(declare-fun bm!43930 () Bool)

(declare-fun call!43933 () (_ BitVec 32))

(assert (=> bm!43930 (= call!43933 (arrayCountValidKeys!0 (array!65389 (store (arr!31473 (_keys!11494 thiss!1427)) (index!41420 lt!457595) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32003 (_keys!11494 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32003 (_keys!11494 thiss!1427))))))

(declare-fun b!1037929 () Bool)

(declare-fun e!587222 () (_ BitVec 32))

(assert (=> b!1037929 (= e!587222 #b00000000000000000000000000000000)))

(declare-fun d!125291 () Bool)

(declare-fun lt!457608 () (_ BitVec 32))

(assert (=> d!125291 (and (bvsge lt!457608 #b00000000000000000000000000000000) (bvsle lt!457608 (bvsub (size!32003 (array!65389 (store (arr!31473 (_keys!11494 thiss!1427)) (index!41420 lt!457595) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32003 (_keys!11494 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125291 (= lt!457608 e!587222)))

(declare-fun c!105167 () Bool)

(assert (=> d!125291 (= c!105167 (bvsge #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))))))

(assert (=> d!125291 (and (bvsle #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32003 (_keys!11494 thiss!1427)) (size!32003 (array!65389 (store (arr!31473 (_keys!11494 thiss!1427)) (index!41420 lt!457595) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32003 (_keys!11494 thiss!1427))))))))

(assert (=> d!125291 (= (arrayCountValidKeys!0 (array!65389 (store (arr!31473 (_keys!11494 thiss!1427)) (index!41420 lt!457595) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32003 (_keys!11494 thiss!1427))) #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))) lt!457608)))

(declare-fun b!1037930 () Bool)

(declare-fun e!587223 () (_ BitVec 32))

(assert (=> b!1037930 (= e!587222 e!587223)))

(declare-fun c!105166 () Bool)

(assert (=> b!1037930 (= c!105166 (validKeyInArray!0 (select (arr!31473 (array!65389 (store (arr!31473 (_keys!11494 thiss!1427)) (index!41420 lt!457595) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32003 (_keys!11494 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1037931 () Bool)

(assert (=> b!1037931 (= e!587223 call!43933)))

(declare-fun b!1037932 () Bool)

(assert (=> b!1037932 (= e!587223 (bvadd #b00000000000000000000000000000001 call!43933))))

(assert (= (and d!125291 c!105167) b!1037929))

(assert (= (and d!125291 (not c!105167)) b!1037930))

(assert (= (and b!1037930 c!105166) b!1037932))

(assert (= (and b!1037930 (not c!105166)) b!1037931))

(assert (= (or b!1037932 b!1037931) bm!43930))

(declare-fun m!958021 () Bool)

(assert (=> bm!43930 m!958021))

(declare-fun m!958023 () Bool)

(assert (=> b!1037930 m!958023))

(assert (=> b!1037930 m!958023))

(declare-fun m!958025 () Bool)

(assert (=> b!1037930 m!958025))

(assert (=> b!1037860 d!125291))

(declare-fun bm!43931 () Bool)

(declare-fun call!43934 () (_ BitVec 32))

(assert (=> bm!43931 (= call!43934 (arrayCountValidKeys!0 (_keys!11494 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32003 (_keys!11494 thiss!1427))))))

(declare-fun b!1037933 () Bool)

(declare-fun e!587224 () (_ BitVec 32))

(assert (=> b!1037933 (= e!587224 #b00000000000000000000000000000000)))

(declare-fun d!125293 () Bool)

(declare-fun lt!457609 () (_ BitVec 32))

(assert (=> d!125293 (and (bvsge lt!457609 #b00000000000000000000000000000000) (bvsle lt!457609 (bvsub (size!32003 (_keys!11494 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125293 (= lt!457609 e!587224)))

(declare-fun c!105169 () Bool)

(assert (=> d!125293 (= c!105169 (bvsge #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))))))

(assert (=> d!125293 (and (bvsle #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32003 (_keys!11494 thiss!1427)) (size!32003 (_keys!11494 thiss!1427))))))

(assert (=> d!125293 (= (arrayCountValidKeys!0 (_keys!11494 thiss!1427) #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))) lt!457609)))

(declare-fun b!1037934 () Bool)

(declare-fun e!587225 () (_ BitVec 32))

(assert (=> b!1037934 (= e!587224 e!587225)))

(declare-fun c!105168 () Bool)

(assert (=> b!1037934 (= c!105168 (validKeyInArray!0 (select (arr!31473 (_keys!11494 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037935 () Bool)

(assert (=> b!1037935 (= e!587225 call!43934)))

(declare-fun b!1037936 () Bool)

(assert (=> b!1037936 (= e!587225 (bvadd #b00000000000000000000000000000001 call!43934))))

(assert (= (and d!125293 c!105169) b!1037933))

(assert (= (and d!125293 (not c!105169)) b!1037934))

(assert (= (and b!1037934 c!105168) b!1037936))

(assert (= (and b!1037934 (not c!105168)) b!1037935))

(assert (= (or b!1037936 b!1037935) bm!43931))

(declare-fun m!958027 () Bool)

(assert (=> bm!43931 m!958027))

(assert (=> b!1037934 m!958013))

(assert (=> b!1037934 m!958013))

(assert (=> b!1037934 m!958017))

(assert (=> b!1037860 d!125293))

(declare-fun b!1037947 () Bool)

(declare-fun e!587230 () Bool)

(assert (=> b!1037947 (= e!587230 (bvslt (size!32003 (_keys!11494 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1037946 () Bool)

(declare-fun res!692444 () Bool)

(assert (=> b!1037946 (=> (not res!692444) (not e!587230))))

(assert (=> b!1037946 (= res!692444 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037948 () Bool)

(declare-fun e!587231 () Bool)

(assert (=> b!1037948 (= e!587231 (= (arrayCountValidKeys!0 (array!65389 (store (arr!31473 (_keys!11494 thiss!1427)) (index!41420 lt!457595) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32003 (_keys!11494 thiss!1427))) #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11494 thiss!1427) #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1037945 () Bool)

(declare-fun res!692445 () Bool)

(assert (=> b!1037945 (=> (not res!692445) (not e!587230))))

(assert (=> b!1037945 (= res!692445 (validKeyInArray!0 (select (arr!31473 (_keys!11494 thiss!1427)) (index!41420 lt!457595))))))

(declare-fun d!125295 () Bool)

(assert (=> d!125295 e!587231))

(declare-fun res!692447 () Bool)

(assert (=> d!125295 (=> (not res!692447) (not e!587231))))

(assert (=> d!125295 (= res!692447 (and (bvsge (index!41420 lt!457595) #b00000000000000000000000000000000) (bvslt (index!41420 lt!457595) (size!32003 (_keys!11494 thiss!1427)))))))

(declare-fun lt!457612 () Unit!33963)

(declare-fun choose!82 (array!65388 (_ BitVec 32) (_ BitVec 64)) Unit!33963)

(assert (=> d!125295 (= lt!457612 (choose!82 (_keys!11494 thiss!1427) (index!41420 lt!457595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125295 e!587230))

(declare-fun res!692446 () Bool)

(assert (=> d!125295 (=> (not res!692446) (not e!587230))))

(assert (=> d!125295 (= res!692446 (and (bvsge (index!41420 lt!457595) #b00000000000000000000000000000000) (bvslt (index!41420 lt!457595) (size!32003 (_keys!11494 thiss!1427)))))))

(assert (=> d!125295 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11494 thiss!1427) (index!41420 lt!457595) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457612)))

(assert (= (and d!125295 res!692446) b!1037945))

(assert (= (and b!1037945 res!692445) b!1037946))

(assert (= (and b!1037946 res!692444) b!1037947))

(assert (= (and d!125295 res!692447) b!1037948))

(declare-fun m!958029 () Bool)

(assert (=> b!1037946 m!958029))

(assert (=> b!1037948 m!957967))

(assert (=> b!1037948 m!957969))

(assert (=> b!1037948 m!957971))

(declare-fun m!958031 () Bool)

(assert (=> b!1037945 m!958031))

(assert (=> b!1037945 m!958031))

(declare-fun m!958033 () Bool)

(assert (=> b!1037945 m!958033))

(declare-fun m!958035 () Bool)

(assert (=> d!125295 m!958035))

(assert (=> b!1037860 d!125295))

(declare-fun d!125297 () Bool)

(declare-fun res!692454 () Bool)

(declare-fun e!587234 () Bool)

(assert (=> d!125297 (=> (not res!692454) (not e!587234))))

(declare-fun simpleValid!420 (LongMapFixedSize!5826) Bool)

(assert (=> d!125297 (= res!692454 (simpleValid!420 thiss!1427))))

(assert (=> d!125297 (= (valid!2196 thiss!1427) e!587234)))

(declare-fun b!1037955 () Bool)

(declare-fun res!692455 () Bool)

(assert (=> b!1037955 (=> (not res!692455) (not e!587234))))

(assert (=> b!1037955 (= res!692455 (= (arrayCountValidKeys!0 (_keys!11494 thiss!1427) #b00000000000000000000000000000000 (size!32003 (_keys!11494 thiss!1427))) (_size!2968 thiss!1427)))))

(declare-fun b!1037956 () Bool)

(declare-fun res!692456 () Bool)

(assert (=> b!1037956 (=> (not res!692456) (not e!587234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65388 (_ BitVec 32)) Bool)

(assert (=> b!1037956 (= res!692456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11494 thiss!1427) (mask!30223 thiss!1427)))))

(declare-fun b!1037957 () Bool)

(assert (=> b!1037957 (= e!587234 (arrayNoDuplicates!0 (_keys!11494 thiss!1427) #b00000000000000000000000000000000 Nil!21925))))

(assert (= (and d!125297 res!692454) b!1037955))

(assert (= (and b!1037955 res!692455) b!1037956))

(assert (= (and b!1037956 res!692456) b!1037957))

(declare-fun m!958037 () Bool)

(assert (=> d!125297 m!958037))

(assert (=> b!1037955 m!957971))

(declare-fun m!958039 () Bool)

(assert (=> b!1037956 m!958039))

(assert (=> b!1037957 m!957953))

(assert (=> start!90784 d!125297))

(declare-fun d!125299 () Bool)

(declare-fun lt!457621 () SeekEntryResult!9762)

(assert (=> d!125299 (and (or ((_ is MissingVacant!9762) lt!457621) (not ((_ is Found!9762) lt!457621)) (and (bvsge (index!41420 lt!457621) #b00000000000000000000000000000000) (bvslt (index!41420 lt!457621) (size!32003 (_keys!11494 thiss!1427))))) (not ((_ is MissingVacant!9762) lt!457621)) (or (not ((_ is Found!9762) lt!457621)) (= (select (arr!31473 (_keys!11494 thiss!1427)) (index!41420 lt!457621)) key!909)))))

(declare-fun e!587243 () SeekEntryResult!9762)

(assert (=> d!125299 (= lt!457621 e!587243)))

(declare-fun c!105176 () Bool)

(declare-fun lt!457622 () SeekEntryResult!9762)

(assert (=> d!125299 (= c!105176 (and ((_ is Intermediate!9762) lt!457622) (undefined!10574 lt!457622)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65388 (_ BitVec 32)) SeekEntryResult!9762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125299 (= lt!457622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30223 thiss!1427)) key!909 (_keys!11494 thiss!1427) (mask!30223 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125299 (validMask!0 (mask!30223 thiss!1427))))

(assert (=> d!125299 (= (seekEntry!0 key!909 (_keys!11494 thiss!1427) (mask!30223 thiss!1427)) lt!457621)))

(declare-fun b!1037970 () Bool)

(declare-fun e!587242 () SeekEntryResult!9762)

(assert (=> b!1037970 (= e!587242 (Found!9762 (index!41421 lt!457622)))))

(declare-fun b!1037971 () Bool)

(declare-fun e!587241 () SeekEntryResult!9762)

(declare-fun lt!457624 () SeekEntryResult!9762)

(assert (=> b!1037971 (= e!587241 (ite ((_ is MissingVacant!9762) lt!457624) (MissingZero!9762 (index!41422 lt!457624)) lt!457624))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65388 (_ BitVec 32)) SeekEntryResult!9762)

(assert (=> b!1037971 (= lt!457624 (seekKeyOrZeroReturnVacant!0 (x!92601 lt!457622) (index!41421 lt!457622) (index!41421 lt!457622) key!909 (_keys!11494 thiss!1427) (mask!30223 thiss!1427)))))

(declare-fun b!1037972 () Bool)

(assert (=> b!1037972 (= e!587241 (MissingZero!9762 (index!41421 lt!457622)))))

(declare-fun b!1037973 () Bool)

(assert (=> b!1037973 (= e!587243 e!587242)))

(declare-fun lt!457623 () (_ BitVec 64))

(assert (=> b!1037973 (= lt!457623 (select (arr!31473 (_keys!11494 thiss!1427)) (index!41421 lt!457622)))))

(declare-fun c!105178 () Bool)

(assert (=> b!1037973 (= c!105178 (= lt!457623 key!909))))

(declare-fun b!1037974 () Bool)

(declare-fun c!105177 () Bool)

(assert (=> b!1037974 (= c!105177 (= lt!457623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037974 (= e!587242 e!587241)))

(declare-fun b!1037975 () Bool)

(assert (=> b!1037975 (= e!587243 Undefined!9762)))

(assert (= (and d!125299 c!105176) b!1037975))

(assert (= (and d!125299 (not c!105176)) b!1037973))

(assert (= (and b!1037973 c!105178) b!1037970))

(assert (= (and b!1037973 (not c!105178)) b!1037974))

(assert (= (and b!1037974 c!105177) b!1037972))

(assert (= (and b!1037974 (not c!105177)) b!1037971))

(declare-fun m!958041 () Bool)

(assert (=> d!125299 m!958041))

(declare-fun m!958043 () Bool)

(assert (=> d!125299 m!958043))

(assert (=> d!125299 m!958043))

(declare-fun m!958045 () Bool)

(assert (=> d!125299 m!958045))

(declare-fun m!958047 () Bool)

(assert (=> d!125299 m!958047))

(declare-fun m!958049 () Bool)

(assert (=> b!1037971 m!958049))

(declare-fun m!958051 () Bool)

(assert (=> b!1037973 m!958051))

(assert (=> b!1037858 d!125299))

(declare-fun d!125301 () Bool)

(declare-fun lt!457625 () Bool)

(assert (=> d!125301 (= lt!457625 (select (content!517 Nil!21925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587244 () Bool)

(assert (=> d!125301 (= lt!457625 e!587244)))

(declare-fun res!692457 () Bool)

(assert (=> d!125301 (=> (not res!692457) (not e!587244))))

(assert (=> d!125301 (= res!692457 ((_ is Cons!21924) Nil!21925))))

(assert (=> d!125301 (= (contains!6029 Nil!21925 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457625)))

(declare-fun b!1037976 () Bool)

(declare-fun e!587245 () Bool)

(assert (=> b!1037976 (= e!587244 e!587245)))

(declare-fun res!692458 () Bool)

(assert (=> b!1037976 (=> res!692458 e!587245)))

(assert (=> b!1037976 (= res!692458 (= (h!23127 Nil!21925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037977 () Bool)

(assert (=> b!1037977 (= e!587245 (contains!6029 (t!31142 Nil!21925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125301 res!692457) b!1037976))

(assert (= (and b!1037976 (not res!692458)) b!1037977))

(assert (=> d!125301 m!958003))

(declare-fun m!958053 () Bool)

(assert (=> d!125301 m!958053))

(declare-fun m!958055 () Bool)

(assert (=> b!1037977 m!958055))

(assert (=> b!1037853 d!125301))

(declare-fun condMapEmpty!38502 () Bool)

(declare-fun mapDefault!38502 () ValueCell!11616)

(assert (=> mapNonEmpty!38496 (= condMapEmpty!38502 (= mapRest!38496 ((as const (Array (_ BitVec 32) ValueCell!11616)) mapDefault!38502)))))

(declare-fun e!587250 () Bool)

(declare-fun mapRes!38502 () Bool)

(assert (=> mapNonEmpty!38496 (= tp!73912 (and e!587250 mapRes!38502))))

(declare-fun b!1037985 () Bool)

(assert (=> b!1037985 (= e!587250 tp_is_empty!24639)))

(declare-fun mapNonEmpty!38502 () Bool)

(declare-fun tp!73921 () Bool)

(declare-fun e!587251 () Bool)

(assert (=> mapNonEmpty!38502 (= mapRes!38502 (and tp!73921 e!587251))))

(declare-fun mapValue!38502 () ValueCell!11616)

(declare-fun mapRest!38502 () (Array (_ BitVec 32) ValueCell!11616))

(declare-fun mapKey!38502 () (_ BitVec 32))

(assert (=> mapNonEmpty!38502 (= mapRest!38496 (store mapRest!38502 mapKey!38502 mapValue!38502))))

(declare-fun b!1037984 () Bool)

(assert (=> b!1037984 (= e!587251 tp_is_empty!24639)))

(declare-fun mapIsEmpty!38502 () Bool)

(assert (=> mapIsEmpty!38502 mapRes!38502))

(assert (= (and mapNonEmpty!38496 condMapEmpty!38502) mapIsEmpty!38502))

(assert (= (and mapNonEmpty!38496 (not condMapEmpty!38502)) mapNonEmpty!38502))

(assert (= (and mapNonEmpty!38502 ((_ is ValueCellFull!11616) mapValue!38502)) b!1037984))

(assert (= (and mapNonEmpty!38496 ((_ is ValueCellFull!11616) mapDefault!38502)) b!1037985))

(declare-fun m!958057 () Bool)

(assert (=> mapNonEmpty!38502 m!958057))

(check-sat (not b!1037956) (not d!125295) (not b!1037899) (not bm!43930) (not b!1037948) (not b!1037957) (not b!1037955) (not d!125301) (not d!125297) (not b!1037930) (not b_next!20919) b_and!33451 (not b!1037945) (not bm!43927) (not b!1037916) (not b!1037946) tp_is_empty!24639 (not b!1037934) (not d!125299) (not b!1037977) (not bm!43931) (not b!1037905) (not b!1037918) (not b!1037917) (not b!1037904) (not d!125285) (not b!1037971) (not mapNonEmpty!38502))
(check-sat b_and!33451 (not b_next!20919))
