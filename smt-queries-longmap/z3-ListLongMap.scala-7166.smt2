; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91426 () Bool)

(assert start!91426)

(declare-fun b!1041788 () Bool)

(declare-fun b_free!21049 () Bool)

(declare-fun b_next!21049 () Bool)

(assert (=> b!1041788 (= b_free!21049 (not b_next!21049))))

(declare-fun tp!74366 () Bool)

(declare-fun b_and!33555 () Bool)

(assert (=> b!1041788 (= tp!74366 b_and!33555)))

(declare-fun mapIsEmpty!38755 () Bool)

(declare-fun mapRes!38755 () Bool)

(assert (=> mapIsEmpty!38755 mapRes!38755))

(declare-fun b!1041783 () Bool)

(declare-fun e!590048 () Bool)

(declare-fun e!590049 () Bool)

(assert (=> b!1041783 (= e!590048 e!590049)))

(declare-fun res!694284 () Bool)

(assert (=> b!1041783 (=> (not res!694284) (not e!590049))))

(declare-datatypes ((SeekEntryResult!9810 0))(
  ( (MissingZero!9810 (index!41611 (_ BitVec 32))) (Found!9810 (index!41612 (_ BitVec 32))) (Intermediate!9810 (undefined!10622 Bool) (index!41613 (_ BitVec 32)) (x!93018 (_ BitVec 32))) (Undefined!9810) (MissingVacant!9810 (index!41614 (_ BitVec 32))) )
))
(declare-fun lt!459039 () SeekEntryResult!9810)

(get-info :version)

(assert (=> b!1041783 (= res!694284 ((_ is Found!9810) lt!459039))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37899 0))(
  ( (V!37900 (val!12435 Int)) )
))
(declare-datatypes ((ValueCell!11681 0))(
  ( (ValueCellFull!11681 (v!15024 V!37899)) (EmptyCell!11681) )
))
(declare-datatypes ((array!65627 0))(
  ( (array!65628 (arr!31572 (Array (_ BitVec 32) (_ BitVec 64))) (size!32108 (_ BitVec 32))) )
))
(declare-datatypes ((array!65629 0))(
  ( (array!65630 (arr!31573 (Array (_ BitVec 32) ValueCell!11681)) (size!32109 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5956 0))(
  ( (LongMapFixedSize!5957 (defaultEntry!6360 Int) (mask!30401 (_ BitVec 32)) (extraKeys!6088 (_ BitVec 32)) (zeroValue!6194 V!37899) (minValue!6194 V!37899) (_size!3033 (_ BitVec 32)) (_keys!11599 array!65627) (_values!6383 array!65629) (_vacant!3033 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5956)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65627 (_ BitVec 32)) SeekEntryResult!9810)

(assert (=> b!1041783 (= lt!459039 (seekEntry!0 key!909 (_keys!11599 thiss!1427) (mask!30401 thiss!1427)))))

(declare-fun b!1041784 () Bool)

(declare-fun e!590050 () Bool)

(declare-fun tp_is_empty!24769 () Bool)

(assert (=> b!1041784 (= e!590050 tp_is_empty!24769)))

(declare-fun b!1041785 () Bool)

(declare-fun e!590053 () Bool)

(assert (=> b!1041785 (= e!590053 (and e!590050 mapRes!38755))))

(declare-fun condMapEmpty!38755 () Bool)

(declare-fun mapDefault!38755 () ValueCell!11681)

(assert (=> b!1041785 (= condMapEmpty!38755 (= (arr!31573 (_values!6383 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11681)) mapDefault!38755)))))

(declare-fun res!694287 () Bool)

(assert (=> start!91426 (=> (not res!694287) (not e!590048))))

(declare-fun valid!2227 (LongMapFixedSize!5956) Bool)

(assert (=> start!91426 (= res!694287 (valid!2227 thiss!1427))))

(assert (=> start!91426 e!590048))

(declare-fun e!590051 () Bool)

(assert (=> start!91426 e!590051))

(assert (=> start!91426 true))

(declare-fun mapNonEmpty!38755 () Bool)

(declare-fun tp!74365 () Bool)

(declare-fun e!590052 () Bool)

(assert (=> mapNonEmpty!38755 (= mapRes!38755 (and tp!74365 e!590052))))

(declare-fun mapRest!38755 () (Array (_ BitVec 32) ValueCell!11681))

(declare-fun mapValue!38755 () ValueCell!11681)

(declare-fun mapKey!38755 () (_ BitVec 32))

(assert (=> mapNonEmpty!38755 (= (arr!31573 (_values!6383 thiss!1427)) (store mapRest!38755 mapKey!38755 mapValue!38755))))

(declare-fun b!1041786 () Bool)

(declare-fun e!590047 () Bool)

(assert (=> b!1041786 (= e!590047 (or (not (= (size!32109 (_values!6383 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30401 thiss!1427)))) (not (= (size!32108 (_keys!11599 thiss!1427)) (size!32109 (_values!6383 thiss!1427)))) (bvslt (mask!30401 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6088 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6088 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1041787 () Bool)

(assert (=> b!1041787 (= e!590049 (not e!590047))))

(declare-fun res!694285 () Bool)

(assert (=> b!1041787 (=> res!694285 e!590047)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041787 (= res!694285 (not (validMask!0 (mask!30401 thiss!1427))))))

(declare-fun lt!459040 () array!65627)

(declare-fun arrayContainsKey!0 (array!65627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041787 (not (arrayContainsKey!0 lt!459040 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33927 0))(
  ( (Unit!33928) )
))
(declare-fun lt!459037 () Unit!33927)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65627 (_ BitVec 32) (_ BitVec 64)) Unit!33927)

(assert (=> b!1041787 (= lt!459037 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11599 thiss!1427) (index!41612 lt!459039) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65627 (_ BitVec 32)) Bool)

(assert (=> b!1041787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459040 (mask!30401 thiss!1427))))

(declare-fun lt!459038 () Unit!33927)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65627 (_ BitVec 32) (_ BitVec 32)) Unit!33927)

(assert (=> b!1041787 (= lt!459038 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11599 thiss!1427) (index!41612 lt!459039) (mask!30401 thiss!1427)))))

(declare-datatypes ((List!22009 0))(
  ( (Nil!22006) (Cons!22005 (h!23212 (_ BitVec 64)) (t!31214 List!22009)) )
))
(declare-fun arrayNoDuplicates!0 (array!65627 (_ BitVec 32) List!22009) Bool)

(assert (=> b!1041787 (arrayNoDuplicates!0 lt!459040 #b00000000000000000000000000000000 Nil!22006)))

(declare-fun lt!459041 () Unit!33927)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65627 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22009) Unit!33927)

(assert (=> b!1041787 (= lt!459041 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11599 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41612 lt!459039) #b00000000000000000000000000000000 Nil!22006))))

(declare-fun arrayCountValidKeys!0 (array!65627 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041787 (= (arrayCountValidKeys!0 lt!459040 #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11599 thiss!1427) #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041787 (= lt!459040 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))))))

(declare-fun lt!459036 () Unit!33927)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65627 (_ BitVec 32) (_ BitVec 64)) Unit!33927)

(assert (=> b!1041787 (= lt!459036 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11599 thiss!1427) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!24401 (array!65627) Bool)

(declare-fun array_inv!24402 (array!65629) Bool)

(assert (=> b!1041788 (= e!590051 (and tp!74366 tp_is_empty!24769 (array_inv!24401 (_keys!11599 thiss!1427)) (array_inv!24402 (_values!6383 thiss!1427)) e!590053))))

(declare-fun b!1041789 () Bool)

(declare-fun res!694286 () Bool)

(assert (=> b!1041789 (=> (not res!694286) (not e!590048))))

(assert (=> b!1041789 (= res!694286 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1041790 () Bool)

(assert (=> b!1041790 (= e!590052 tp_is_empty!24769)))

(assert (= (and start!91426 res!694287) b!1041789))

(assert (= (and b!1041789 res!694286) b!1041783))

(assert (= (and b!1041783 res!694284) b!1041787))

(assert (= (and b!1041787 (not res!694285)) b!1041786))

(assert (= (and b!1041785 condMapEmpty!38755) mapIsEmpty!38755))

(assert (= (and b!1041785 (not condMapEmpty!38755)) mapNonEmpty!38755))

(assert (= (and mapNonEmpty!38755 ((_ is ValueCellFull!11681) mapValue!38755)) b!1041790))

(assert (= (and b!1041785 ((_ is ValueCellFull!11681) mapDefault!38755)) b!1041784))

(assert (= b!1041788 b!1041785))

(assert (= start!91426 b!1041788))

(declare-fun m!960681 () Bool)

(assert (=> b!1041788 m!960681))

(declare-fun m!960683 () Bool)

(assert (=> b!1041788 m!960683))

(declare-fun m!960685 () Bool)

(assert (=> b!1041783 m!960685))

(declare-fun m!960687 () Bool)

(assert (=> mapNonEmpty!38755 m!960687))

(declare-fun m!960689 () Bool)

(assert (=> start!91426 m!960689))

(declare-fun m!960691 () Bool)

(assert (=> b!1041787 m!960691))

(declare-fun m!960693 () Bool)

(assert (=> b!1041787 m!960693))

(declare-fun m!960695 () Bool)

(assert (=> b!1041787 m!960695))

(declare-fun m!960697 () Bool)

(assert (=> b!1041787 m!960697))

(declare-fun m!960699 () Bool)

(assert (=> b!1041787 m!960699))

(declare-fun m!960701 () Bool)

(assert (=> b!1041787 m!960701))

(declare-fun m!960703 () Bool)

(assert (=> b!1041787 m!960703))

(declare-fun m!960705 () Bool)

(assert (=> b!1041787 m!960705))

(declare-fun m!960707 () Bool)

(assert (=> b!1041787 m!960707))

(declare-fun m!960709 () Bool)

(assert (=> b!1041787 m!960709))

(declare-fun m!960711 () Bool)

(assert (=> b!1041787 m!960711))

(check-sat (not b!1041783) (not b!1041787) (not mapNonEmpty!38755) (not start!91426) tp_is_empty!24769 (not b!1041788) b_and!33555 (not b_next!21049))
(check-sat b_and!33555 (not b_next!21049))
(get-model)

(declare-fun d!125851 () Bool)

(declare-fun res!694318 () Bool)

(declare-fun e!590105 () Bool)

(assert (=> d!125851 (=> (not res!694318) (not e!590105))))

(declare-fun simpleValid!440 (LongMapFixedSize!5956) Bool)

(assert (=> d!125851 (= res!694318 (simpleValid!440 thiss!1427))))

(assert (=> d!125851 (= (valid!2227 thiss!1427) e!590105)))

(declare-fun b!1041845 () Bool)

(declare-fun res!694319 () Bool)

(assert (=> b!1041845 (=> (not res!694319) (not e!590105))))

(assert (=> b!1041845 (= res!694319 (= (arrayCountValidKeys!0 (_keys!11599 thiss!1427) #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) (_size!3033 thiss!1427)))))

(declare-fun b!1041846 () Bool)

(declare-fun res!694320 () Bool)

(assert (=> b!1041846 (=> (not res!694320) (not e!590105))))

(assert (=> b!1041846 (= res!694320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11599 thiss!1427) (mask!30401 thiss!1427)))))

(declare-fun b!1041847 () Bool)

(assert (=> b!1041847 (= e!590105 (arrayNoDuplicates!0 (_keys!11599 thiss!1427) #b00000000000000000000000000000000 Nil!22006))))

(assert (= (and d!125851 res!694318) b!1041845))

(assert (= (and b!1041845 res!694319) b!1041846))

(assert (= (and b!1041846 res!694320) b!1041847))

(declare-fun m!960777 () Bool)

(assert (=> d!125851 m!960777))

(assert (=> b!1041845 m!960697))

(declare-fun m!960779 () Bool)

(assert (=> b!1041846 m!960779))

(declare-fun m!960781 () Bool)

(assert (=> b!1041847 m!960781))

(assert (=> start!91426 d!125851))

(declare-fun bm!44121 () Bool)

(declare-fun call!44124 () (_ BitVec 32))

(assert (=> bm!44121 (= call!44124 (arrayCountValidKeys!0 lt!459040 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))))))

(declare-fun b!1041856 () Bool)

(declare-fun e!590111 () (_ BitVec 32))

(assert (=> b!1041856 (= e!590111 call!44124)))

(declare-fun b!1041857 () Bool)

(declare-fun e!590110 () (_ BitVec 32))

(assert (=> b!1041857 (= e!590110 e!590111)))

(declare-fun c!105713 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041857 (= c!105713 (validKeyInArray!0 (select (arr!31572 lt!459040) #b00000000000000000000000000000000)))))

(declare-fun d!125853 () Bool)

(declare-fun lt!459080 () (_ BitVec 32))

(assert (=> d!125853 (and (bvsge lt!459080 #b00000000000000000000000000000000) (bvsle lt!459080 (bvsub (size!32108 lt!459040) #b00000000000000000000000000000000)))))

(assert (=> d!125853 (= lt!459080 e!590110)))

(declare-fun c!105712 () Bool)

(assert (=> d!125853 (= c!105712 (bvsge #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))))))

(assert (=> d!125853 (and (bvsle #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32108 (_keys!11599 thiss!1427)) (size!32108 lt!459040)))))

(assert (=> d!125853 (= (arrayCountValidKeys!0 lt!459040 #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) lt!459080)))

(declare-fun b!1041858 () Bool)

(assert (=> b!1041858 (= e!590111 (bvadd #b00000000000000000000000000000001 call!44124))))

(declare-fun b!1041859 () Bool)

(assert (=> b!1041859 (= e!590110 #b00000000000000000000000000000000)))

(assert (= (and d!125853 c!105712) b!1041859))

(assert (= (and d!125853 (not c!105712)) b!1041857))

(assert (= (and b!1041857 c!105713) b!1041858))

(assert (= (and b!1041857 (not c!105713)) b!1041856))

(assert (= (or b!1041858 b!1041856) bm!44121))

(declare-fun m!960783 () Bool)

(assert (=> bm!44121 m!960783))

(declare-fun m!960785 () Bool)

(assert (=> b!1041857 m!960785))

(assert (=> b!1041857 m!960785))

(declare-fun m!960787 () Bool)

(assert (=> b!1041857 m!960787))

(assert (=> b!1041787 d!125853))

(declare-fun d!125855 () Bool)

(declare-fun res!694325 () Bool)

(declare-fun e!590116 () Bool)

(assert (=> d!125855 (=> res!694325 e!590116)))

(assert (=> d!125855 (= res!694325 (= (select (arr!31572 lt!459040) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125855 (= (arrayContainsKey!0 lt!459040 key!909 #b00000000000000000000000000000000) e!590116)))

(declare-fun b!1041864 () Bool)

(declare-fun e!590117 () Bool)

(assert (=> b!1041864 (= e!590116 e!590117)))

(declare-fun res!694326 () Bool)

(assert (=> b!1041864 (=> (not res!694326) (not e!590117))))

(assert (=> b!1041864 (= res!694326 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 lt!459040)))))

(declare-fun b!1041865 () Bool)

(assert (=> b!1041865 (= e!590117 (arrayContainsKey!0 lt!459040 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125855 (not res!694325)) b!1041864))

(assert (= (and b!1041864 res!694326) b!1041865))

(assert (=> d!125855 m!960785))

(declare-fun m!960789 () Bool)

(assert (=> b!1041865 m!960789))

(assert (=> b!1041787 d!125855))

(declare-fun d!125857 () Bool)

(declare-fun e!590120 () Bool)

(assert (=> d!125857 e!590120))

(declare-fun res!694329 () Bool)

(assert (=> d!125857 (=> (not res!694329) (not e!590120))))

(assert (=> d!125857 (= res!694329 (bvslt (index!41612 lt!459039) (size!32108 (_keys!11599 thiss!1427))))))

(declare-fun lt!459083 () Unit!33927)

(declare-fun choose!121 (array!65627 (_ BitVec 32) (_ BitVec 64)) Unit!33927)

(assert (=> d!125857 (= lt!459083 (choose!121 (_keys!11599 thiss!1427) (index!41612 lt!459039) key!909))))

(assert (=> d!125857 (bvsge (index!41612 lt!459039) #b00000000000000000000000000000000)))

(assert (=> d!125857 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11599 thiss!1427) (index!41612 lt!459039) key!909) lt!459083)))

(declare-fun b!1041868 () Bool)

(assert (=> b!1041868 (= e!590120 (not (arrayContainsKey!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125857 res!694329) b!1041868))

(declare-fun m!960791 () Bool)

(assert (=> d!125857 m!960791))

(assert (=> b!1041868 m!960705))

(declare-fun m!960793 () Bool)

(assert (=> b!1041868 m!960793))

(assert (=> b!1041787 d!125857))

(declare-fun b!1041878 () Bool)

(declare-fun res!694341 () Bool)

(declare-fun e!590126 () Bool)

(assert (=> b!1041878 (=> (not res!694341) (not e!590126))))

(assert (=> b!1041878 (= res!694341 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041879 () Bool)

(assert (=> b!1041879 (= e!590126 (bvslt (size!32108 (_keys!11599 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1041880 () Bool)

(declare-fun e!590125 () Bool)

(assert (=> b!1041880 (= e!590125 (= (arrayCountValidKeys!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11599 thiss!1427) #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1041877 () Bool)

(declare-fun res!694338 () Bool)

(assert (=> b!1041877 (=> (not res!694338) (not e!590126))))

(assert (=> b!1041877 (= res!694338 (validKeyInArray!0 (select (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039))))))

(declare-fun d!125859 () Bool)

(assert (=> d!125859 e!590125))

(declare-fun res!694340 () Bool)

(assert (=> d!125859 (=> (not res!694340) (not e!590125))))

(assert (=> d!125859 (= res!694340 (and (bvsge (index!41612 lt!459039) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459039) (size!32108 (_keys!11599 thiss!1427)))))))

(declare-fun lt!459086 () Unit!33927)

(declare-fun choose!82 (array!65627 (_ BitVec 32) (_ BitVec 64)) Unit!33927)

(assert (=> d!125859 (= lt!459086 (choose!82 (_keys!11599 thiss!1427) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125859 e!590126))

(declare-fun res!694339 () Bool)

(assert (=> d!125859 (=> (not res!694339) (not e!590126))))

(assert (=> d!125859 (= res!694339 (and (bvsge (index!41612 lt!459039) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459039) (size!32108 (_keys!11599 thiss!1427)))))))

(assert (=> d!125859 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11599 thiss!1427) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459086)))

(assert (= (and d!125859 res!694339) b!1041877))

(assert (= (and b!1041877 res!694338) b!1041878))

(assert (= (and b!1041878 res!694341) b!1041879))

(assert (= (and d!125859 res!694340) b!1041880))

(declare-fun m!960795 () Bool)

(assert (=> b!1041878 m!960795))

(assert (=> b!1041880 m!960705))

(declare-fun m!960797 () Bool)

(assert (=> b!1041880 m!960797))

(assert (=> b!1041880 m!960697))

(declare-fun m!960799 () Bool)

(assert (=> b!1041877 m!960799))

(assert (=> b!1041877 m!960799))

(declare-fun m!960801 () Bool)

(assert (=> b!1041877 m!960801))

(declare-fun m!960803 () Bool)

(assert (=> d!125859 m!960803))

(assert (=> b!1041787 d!125859))

(declare-fun b!1041889 () Bool)

(declare-fun e!590135 () Bool)

(declare-fun call!44127 () Bool)

(assert (=> b!1041889 (= e!590135 call!44127)))

(declare-fun d!125861 () Bool)

(declare-fun res!694347 () Bool)

(declare-fun e!590133 () Bool)

(assert (=> d!125861 (=> res!694347 e!590133)))

(assert (=> d!125861 (= res!694347 (bvsge #b00000000000000000000000000000000 (size!32108 lt!459040)))))

(assert (=> d!125861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459040 (mask!30401 thiss!1427)) e!590133)))

(declare-fun b!1041890 () Bool)

(assert (=> b!1041890 (= e!590133 e!590135)))

(declare-fun c!105716 () Bool)

(assert (=> b!1041890 (= c!105716 (validKeyInArray!0 (select (arr!31572 lt!459040) #b00000000000000000000000000000000)))))

(declare-fun b!1041891 () Bool)

(declare-fun e!590134 () Bool)

(assert (=> b!1041891 (= e!590134 call!44127)))

(declare-fun b!1041892 () Bool)

(assert (=> b!1041892 (= e!590135 e!590134)))

(declare-fun lt!459093 () (_ BitVec 64))

(assert (=> b!1041892 (= lt!459093 (select (arr!31572 lt!459040) #b00000000000000000000000000000000))))

(declare-fun lt!459095 () Unit!33927)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65627 (_ BitVec 64) (_ BitVec 32)) Unit!33927)

(assert (=> b!1041892 (= lt!459095 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459040 lt!459093 #b00000000000000000000000000000000))))

(assert (=> b!1041892 (arrayContainsKey!0 lt!459040 lt!459093 #b00000000000000000000000000000000)))

(declare-fun lt!459094 () Unit!33927)

(assert (=> b!1041892 (= lt!459094 lt!459095)))

(declare-fun res!694346 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65627 (_ BitVec 32)) SeekEntryResult!9810)

(assert (=> b!1041892 (= res!694346 (= (seekEntryOrOpen!0 (select (arr!31572 lt!459040) #b00000000000000000000000000000000) lt!459040 (mask!30401 thiss!1427)) (Found!9810 #b00000000000000000000000000000000)))))

(assert (=> b!1041892 (=> (not res!694346) (not e!590134))))

(declare-fun bm!44124 () Bool)

(assert (=> bm!44124 (= call!44127 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459040 (mask!30401 thiss!1427)))))

(assert (= (and d!125861 (not res!694347)) b!1041890))

(assert (= (and b!1041890 c!105716) b!1041892))

(assert (= (and b!1041890 (not c!105716)) b!1041889))

(assert (= (and b!1041892 res!694346) b!1041891))

(assert (= (or b!1041891 b!1041889) bm!44124))

(assert (=> b!1041890 m!960785))

(assert (=> b!1041890 m!960785))

(assert (=> b!1041890 m!960787))

(assert (=> b!1041892 m!960785))

(declare-fun m!960805 () Bool)

(assert (=> b!1041892 m!960805))

(declare-fun m!960807 () Bool)

(assert (=> b!1041892 m!960807))

(assert (=> b!1041892 m!960785))

(declare-fun m!960809 () Bool)

(assert (=> b!1041892 m!960809))

(declare-fun m!960811 () Bool)

(assert (=> bm!44124 m!960811))

(assert (=> b!1041787 d!125861))

(declare-fun d!125863 () Bool)

(declare-fun e!590138 () Bool)

(assert (=> d!125863 e!590138))

(declare-fun res!694350 () Bool)

(assert (=> d!125863 (=> (not res!694350) (not e!590138))))

(assert (=> d!125863 (= res!694350 (and (bvsge (index!41612 lt!459039) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459039) (size!32108 (_keys!11599 thiss!1427)))))))

(declare-fun lt!459098 () Unit!33927)

(declare-fun choose!25 (array!65627 (_ BitVec 32) (_ BitVec 32)) Unit!33927)

(assert (=> d!125863 (= lt!459098 (choose!25 (_keys!11599 thiss!1427) (index!41612 lt!459039) (mask!30401 thiss!1427)))))

(assert (=> d!125863 (validMask!0 (mask!30401 thiss!1427))))

(assert (=> d!125863 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11599 thiss!1427) (index!41612 lt!459039) (mask!30401 thiss!1427)) lt!459098)))

(declare-fun b!1041895 () Bool)

(assert (=> b!1041895 (= e!590138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) (mask!30401 thiss!1427)))))

(assert (= (and d!125863 res!694350) b!1041895))

(declare-fun m!960813 () Bool)

(assert (=> d!125863 m!960813))

(assert (=> d!125863 m!960695))

(assert (=> b!1041895 m!960705))

(declare-fun m!960815 () Bool)

(assert (=> b!1041895 m!960815))

(assert (=> b!1041787 d!125863))

(declare-fun d!125865 () Bool)

(declare-fun e!590141 () Bool)

(assert (=> d!125865 e!590141))

(declare-fun res!694353 () Bool)

(assert (=> d!125865 (=> (not res!694353) (not e!590141))))

(assert (=> d!125865 (= res!694353 (and (bvsge (index!41612 lt!459039) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459039) (size!32108 (_keys!11599 thiss!1427)))))))

(declare-fun lt!459101 () Unit!33927)

(declare-fun choose!53 (array!65627 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22009) Unit!33927)

(assert (=> d!125865 (= lt!459101 (choose!53 (_keys!11599 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41612 lt!459039) #b00000000000000000000000000000000 Nil!22006))))

(assert (=> d!125865 (bvslt (size!32108 (_keys!11599 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125865 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11599 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41612 lt!459039) #b00000000000000000000000000000000 Nil!22006) lt!459101)))

(declare-fun b!1041898 () Bool)

(assert (=> b!1041898 (= e!590141 (arrayNoDuplicates!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) #b00000000000000000000000000000000 Nil!22006))))

(assert (= (and d!125865 res!694353) b!1041898))

(declare-fun m!960817 () Bool)

(assert (=> d!125865 m!960817))

(assert (=> b!1041898 m!960705))

(declare-fun m!960819 () Bool)

(assert (=> b!1041898 m!960819))

(assert (=> b!1041787 d!125865))

(declare-fun bm!44125 () Bool)

(declare-fun call!44128 () (_ BitVec 32))

(assert (=> bm!44125 (= call!44128 (arrayCountValidKeys!0 (_keys!11599 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))))))

(declare-fun b!1041899 () Bool)

(declare-fun e!590143 () (_ BitVec 32))

(assert (=> b!1041899 (= e!590143 call!44128)))

(declare-fun b!1041900 () Bool)

(declare-fun e!590142 () (_ BitVec 32))

(assert (=> b!1041900 (= e!590142 e!590143)))

(declare-fun c!105718 () Bool)

(assert (=> b!1041900 (= c!105718 (validKeyInArray!0 (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125867 () Bool)

(declare-fun lt!459102 () (_ BitVec 32))

(assert (=> d!125867 (and (bvsge lt!459102 #b00000000000000000000000000000000) (bvsle lt!459102 (bvsub (size!32108 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125867 (= lt!459102 e!590142)))

(declare-fun c!105717 () Bool)

(assert (=> d!125867 (= c!105717 (bvsge #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))))))

(assert (=> d!125867 (and (bvsle #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32108 (_keys!11599 thiss!1427)) (size!32108 (_keys!11599 thiss!1427))))))

(assert (=> d!125867 (= (arrayCountValidKeys!0 (_keys!11599 thiss!1427) #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) lt!459102)))

(declare-fun b!1041901 () Bool)

(assert (=> b!1041901 (= e!590143 (bvadd #b00000000000000000000000000000001 call!44128))))

(declare-fun b!1041902 () Bool)

(assert (=> b!1041902 (= e!590142 #b00000000000000000000000000000000)))

(assert (= (and d!125867 c!105717) b!1041902))

(assert (= (and d!125867 (not c!105717)) b!1041900))

(assert (= (and b!1041900 c!105718) b!1041901))

(assert (= (and b!1041900 (not c!105718)) b!1041899))

(assert (= (or b!1041901 b!1041899) bm!44125))

(declare-fun m!960821 () Bool)

(assert (=> bm!44125 m!960821))

(declare-fun m!960823 () Bool)

(assert (=> b!1041900 m!960823))

(assert (=> b!1041900 m!960823))

(declare-fun m!960825 () Bool)

(assert (=> b!1041900 m!960825))

(assert (=> b!1041787 d!125867))

(declare-fun d!125869 () Bool)

(assert (=> d!125869 (= (validMask!0 (mask!30401 thiss!1427)) (and (or (= (mask!30401 thiss!1427) #b00000000000000000000000000000111) (= (mask!30401 thiss!1427) #b00000000000000000000000000001111) (= (mask!30401 thiss!1427) #b00000000000000000000000000011111) (= (mask!30401 thiss!1427) #b00000000000000000000000000111111) (= (mask!30401 thiss!1427) #b00000000000000000000000001111111) (= (mask!30401 thiss!1427) #b00000000000000000000000011111111) (= (mask!30401 thiss!1427) #b00000000000000000000000111111111) (= (mask!30401 thiss!1427) #b00000000000000000000001111111111) (= (mask!30401 thiss!1427) #b00000000000000000000011111111111) (= (mask!30401 thiss!1427) #b00000000000000000000111111111111) (= (mask!30401 thiss!1427) #b00000000000000000001111111111111) (= (mask!30401 thiss!1427) #b00000000000000000011111111111111) (= (mask!30401 thiss!1427) #b00000000000000000111111111111111) (= (mask!30401 thiss!1427) #b00000000000000001111111111111111) (= (mask!30401 thiss!1427) #b00000000000000011111111111111111) (= (mask!30401 thiss!1427) #b00000000000000111111111111111111) (= (mask!30401 thiss!1427) #b00000000000001111111111111111111) (= (mask!30401 thiss!1427) #b00000000000011111111111111111111) (= (mask!30401 thiss!1427) #b00000000000111111111111111111111) (= (mask!30401 thiss!1427) #b00000000001111111111111111111111) (= (mask!30401 thiss!1427) #b00000000011111111111111111111111) (= (mask!30401 thiss!1427) #b00000000111111111111111111111111) (= (mask!30401 thiss!1427) #b00000001111111111111111111111111) (= (mask!30401 thiss!1427) #b00000011111111111111111111111111) (= (mask!30401 thiss!1427) #b00000111111111111111111111111111) (= (mask!30401 thiss!1427) #b00001111111111111111111111111111) (= (mask!30401 thiss!1427) #b00011111111111111111111111111111) (= (mask!30401 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30401 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1041787 d!125869))

(declare-fun b!1041913 () Bool)

(declare-fun e!590155 () Bool)

(declare-fun call!44131 () Bool)

(assert (=> b!1041913 (= e!590155 call!44131)))

(declare-fun b!1041914 () Bool)

(declare-fun e!590152 () Bool)

(declare-fun e!590153 () Bool)

(assert (=> b!1041914 (= e!590152 e!590153)))

(declare-fun res!694360 () Bool)

(assert (=> b!1041914 (=> (not res!694360) (not e!590153))))

(declare-fun e!590154 () Bool)

(assert (=> b!1041914 (= res!694360 (not e!590154))))

(declare-fun res!694361 () Bool)

(assert (=> b!1041914 (=> (not res!694361) (not e!590154))))

(assert (=> b!1041914 (= res!694361 (validKeyInArray!0 (select (arr!31572 lt!459040) #b00000000000000000000000000000000)))))

(declare-fun b!1041915 () Bool)

(declare-fun contains!6036 (List!22009 (_ BitVec 64)) Bool)

(assert (=> b!1041915 (= e!590154 (contains!6036 Nil!22006 (select (arr!31572 lt!459040) #b00000000000000000000000000000000)))))

(declare-fun b!1041916 () Bool)

(assert (=> b!1041916 (= e!590155 call!44131)))

(declare-fun b!1041917 () Bool)

(assert (=> b!1041917 (= e!590153 e!590155)))

(declare-fun c!105721 () Bool)

(assert (=> b!1041917 (= c!105721 (validKeyInArray!0 (select (arr!31572 lt!459040) #b00000000000000000000000000000000)))))

(declare-fun bm!44128 () Bool)

(assert (=> bm!44128 (= call!44131 (arrayNoDuplicates!0 lt!459040 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105721 (Cons!22005 (select (arr!31572 lt!459040) #b00000000000000000000000000000000) Nil!22006) Nil!22006)))))

(declare-fun d!125871 () Bool)

(declare-fun res!694362 () Bool)

(assert (=> d!125871 (=> res!694362 e!590152)))

(assert (=> d!125871 (= res!694362 (bvsge #b00000000000000000000000000000000 (size!32108 lt!459040)))))

(assert (=> d!125871 (= (arrayNoDuplicates!0 lt!459040 #b00000000000000000000000000000000 Nil!22006) e!590152)))

(assert (= (and d!125871 (not res!694362)) b!1041914))

(assert (= (and b!1041914 res!694361) b!1041915))

(assert (= (and b!1041914 res!694360) b!1041917))

(assert (= (and b!1041917 c!105721) b!1041913))

(assert (= (and b!1041917 (not c!105721)) b!1041916))

(assert (= (or b!1041913 b!1041916) bm!44128))

(assert (=> b!1041914 m!960785))

(assert (=> b!1041914 m!960785))

(assert (=> b!1041914 m!960787))

(assert (=> b!1041915 m!960785))

(assert (=> b!1041915 m!960785))

(declare-fun m!960827 () Bool)

(assert (=> b!1041915 m!960827))

(assert (=> b!1041917 m!960785))

(assert (=> b!1041917 m!960785))

(assert (=> b!1041917 m!960787))

(assert (=> bm!44128 m!960785))

(declare-fun m!960829 () Bool)

(assert (=> bm!44128 m!960829))

(assert (=> b!1041787 d!125871))

(declare-fun b!1041930 () Bool)

(declare-fun e!590162 () SeekEntryResult!9810)

(declare-fun lt!459112 () SeekEntryResult!9810)

(assert (=> b!1041930 (= e!590162 (MissingZero!9810 (index!41613 lt!459112)))))

(declare-fun b!1041931 () Bool)

(declare-fun c!105728 () Bool)

(declare-fun lt!459113 () (_ BitVec 64))

(assert (=> b!1041931 (= c!105728 (= lt!459113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590164 () SeekEntryResult!9810)

(assert (=> b!1041931 (= e!590164 e!590162)))

(declare-fun b!1041932 () Bool)

(declare-fun e!590163 () SeekEntryResult!9810)

(assert (=> b!1041932 (= e!590163 e!590164)))

(assert (=> b!1041932 (= lt!459113 (select (arr!31572 (_keys!11599 thiss!1427)) (index!41613 lt!459112)))))

(declare-fun c!105729 () Bool)

(assert (=> b!1041932 (= c!105729 (= lt!459113 key!909))))

(declare-fun b!1041933 () Bool)

(assert (=> b!1041933 (= e!590163 Undefined!9810)))

(declare-fun b!1041934 () Bool)

(assert (=> b!1041934 (= e!590164 (Found!9810 (index!41613 lt!459112)))))

(declare-fun b!1041935 () Bool)

(declare-fun lt!459111 () SeekEntryResult!9810)

(assert (=> b!1041935 (= e!590162 (ite ((_ is MissingVacant!9810) lt!459111) (MissingZero!9810 (index!41614 lt!459111)) lt!459111))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65627 (_ BitVec 32)) SeekEntryResult!9810)

(assert (=> b!1041935 (= lt!459111 (seekKeyOrZeroReturnVacant!0 (x!93018 lt!459112) (index!41613 lt!459112) (index!41613 lt!459112) key!909 (_keys!11599 thiss!1427) (mask!30401 thiss!1427)))))

(declare-fun d!125873 () Bool)

(declare-fun lt!459114 () SeekEntryResult!9810)

(assert (=> d!125873 (and (or ((_ is MissingVacant!9810) lt!459114) (not ((_ is Found!9810) lt!459114)) (and (bvsge (index!41612 lt!459114) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459114) (size!32108 (_keys!11599 thiss!1427))))) (not ((_ is MissingVacant!9810) lt!459114)) (or (not ((_ is Found!9810) lt!459114)) (= (select (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459114)) key!909)))))

(assert (=> d!125873 (= lt!459114 e!590163)))

(declare-fun c!105730 () Bool)

(assert (=> d!125873 (= c!105730 (and ((_ is Intermediate!9810) lt!459112) (undefined!10622 lt!459112)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65627 (_ BitVec 32)) SeekEntryResult!9810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125873 (= lt!459112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30401 thiss!1427)) key!909 (_keys!11599 thiss!1427) (mask!30401 thiss!1427)))))

(assert (=> d!125873 (validMask!0 (mask!30401 thiss!1427))))

(assert (=> d!125873 (= (seekEntry!0 key!909 (_keys!11599 thiss!1427) (mask!30401 thiss!1427)) lt!459114)))

(assert (= (and d!125873 c!105730) b!1041933))

(assert (= (and d!125873 (not c!105730)) b!1041932))

(assert (= (and b!1041932 c!105729) b!1041934))

(assert (= (and b!1041932 (not c!105729)) b!1041931))

(assert (= (and b!1041931 c!105728) b!1041930))

(assert (= (and b!1041931 (not c!105728)) b!1041935))

(declare-fun m!960831 () Bool)

(assert (=> b!1041932 m!960831))

(declare-fun m!960833 () Bool)

(assert (=> b!1041935 m!960833))

(declare-fun m!960835 () Bool)

(assert (=> d!125873 m!960835))

(declare-fun m!960837 () Bool)

(assert (=> d!125873 m!960837))

(assert (=> d!125873 m!960837))

(declare-fun m!960839 () Bool)

(assert (=> d!125873 m!960839))

(assert (=> d!125873 m!960695))

(assert (=> b!1041783 d!125873))

(declare-fun d!125875 () Bool)

(assert (=> d!125875 (= (array_inv!24401 (_keys!11599 thiss!1427)) (bvsge (size!32108 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041788 d!125875))

(declare-fun d!125877 () Bool)

(assert (=> d!125877 (= (array_inv!24402 (_values!6383 thiss!1427)) (bvsge (size!32109 (_values!6383 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041788 d!125877))

(declare-fun b!1041942 () Bool)

(declare-fun e!590170 () Bool)

(assert (=> b!1041942 (= e!590170 tp_is_empty!24769)))

(declare-fun mapIsEmpty!38764 () Bool)

(declare-fun mapRes!38764 () Bool)

(assert (=> mapIsEmpty!38764 mapRes!38764))

(declare-fun mapNonEmpty!38764 () Bool)

(declare-fun tp!74381 () Bool)

(assert (=> mapNonEmpty!38764 (= mapRes!38764 (and tp!74381 e!590170))))

(declare-fun mapKey!38764 () (_ BitVec 32))

(declare-fun mapValue!38764 () ValueCell!11681)

(declare-fun mapRest!38764 () (Array (_ BitVec 32) ValueCell!11681))

(assert (=> mapNonEmpty!38764 (= mapRest!38755 (store mapRest!38764 mapKey!38764 mapValue!38764))))

(declare-fun condMapEmpty!38764 () Bool)

(declare-fun mapDefault!38764 () ValueCell!11681)

(assert (=> mapNonEmpty!38755 (= condMapEmpty!38764 (= mapRest!38755 ((as const (Array (_ BitVec 32) ValueCell!11681)) mapDefault!38764)))))

(declare-fun e!590169 () Bool)

(assert (=> mapNonEmpty!38755 (= tp!74365 (and e!590169 mapRes!38764))))

(declare-fun b!1041943 () Bool)

(assert (=> b!1041943 (= e!590169 tp_is_empty!24769)))

(assert (= (and mapNonEmpty!38755 condMapEmpty!38764) mapIsEmpty!38764))

(assert (= (and mapNonEmpty!38755 (not condMapEmpty!38764)) mapNonEmpty!38764))

(assert (= (and mapNonEmpty!38764 ((_ is ValueCellFull!11681) mapValue!38764)) b!1041942))

(assert (= (and mapNonEmpty!38755 ((_ is ValueCellFull!11681) mapDefault!38764)) b!1041943))

(declare-fun m!960841 () Bool)

(assert (=> mapNonEmpty!38764 m!960841))

(check-sat (not b!1041900) (not b!1041895) (not d!125859) (not b!1041868) (not bm!44121) (not b!1041917) (not b!1041845) tp_is_empty!24769 (not b!1041880) (not b!1041935) (not b!1041877) (not b!1041857) (not b!1041865) (not b!1041914) (not b!1041878) (not mapNonEmpty!38764) (not d!125857) (not b!1041892) (not d!125863) (not b!1041890) (not b!1041915) (not bm!44125) (not d!125865) (not b!1041898) (not bm!44128) b_and!33555 (not d!125851) (not b!1041846) (not bm!44124) (not b!1041847) (not b_next!21049) (not d!125873))
(check-sat b_and!33555 (not b_next!21049))
(get-model)

(declare-fun d!125879 () Bool)

(assert (=> d!125879 (= (validKeyInArray!0 (select (arr!31572 lt!459040) #b00000000000000000000000000000000)) (and (not (= (select (arr!31572 lt!459040) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31572 lt!459040) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041890 d!125879))

(declare-fun d!125881 () Bool)

(declare-fun lt!459117 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!523 (List!22009) (InoxSet (_ BitVec 64)))

(assert (=> d!125881 (= lt!459117 (select (content!523 Nil!22006) (select (arr!31572 lt!459040) #b00000000000000000000000000000000)))))

(declare-fun e!590176 () Bool)

(assert (=> d!125881 (= lt!459117 e!590176)))

(declare-fun res!694367 () Bool)

(assert (=> d!125881 (=> (not res!694367) (not e!590176))))

(assert (=> d!125881 (= res!694367 ((_ is Cons!22005) Nil!22006))))

(assert (=> d!125881 (= (contains!6036 Nil!22006 (select (arr!31572 lt!459040) #b00000000000000000000000000000000)) lt!459117)))

(declare-fun b!1041948 () Bool)

(declare-fun e!590175 () Bool)

(assert (=> b!1041948 (= e!590176 e!590175)))

(declare-fun res!694368 () Bool)

(assert (=> b!1041948 (=> res!694368 e!590175)))

(assert (=> b!1041948 (= res!694368 (= (h!23212 Nil!22006) (select (arr!31572 lt!459040) #b00000000000000000000000000000000)))))

(declare-fun b!1041949 () Bool)

(assert (=> b!1041949 (= e!590175 (contains!6036 (t!31214 Nil!22006) (select (arr!31572 lt!459040) #b00000000000000000000000000000000)))))

(assert (= (and d!125881 res!694367) b!1041948))

(assert (= (and b!1041948 (not res!694368)) b!1041949))

(declare-fun m!960843 () Bool)

(assert (=> d!125881 m!960843))

(assert (=> d!125881 m!960785))

(declare-fun m!960845 () Bool)

(assert (=> d!125881 m!960845))

(assert (=> b!1041949 m!960785))

(declare-fun m!960847 () Bool)

(assert (=> b!1041949 m!960847))

(assert (=> b!1041915 d!125881))

(declare-fun bm!44129 () Bool)

(declare-fun call!44132 () (_ BitVec 32))

(assert (=> bm!44129 (= call!44132 (arrayCountValidKeys!0 (_keys!11599 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))))))

(declare-fun b!1041950 () Bool)

(declare-fun e!590178 () (_ BitVec 32))

(assert (=> b!1041950 (= e!590178 call!44132)))

(declare-fun b!1041951 () Bool)

(declare-fun e!590177 () (_ BitVec 32))

(assert (=> b!1041951 (= e!590177 e!590178)))

(declare-fun c!105732 () Bool)

(assert (=> b!1041951 (= c!105732 (validKeyInArray!0 (select (arr!31572 (_keys!11599 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125883 () Bool)

(declare-fun lt!459118 () (_ BitVec 32))

(assert (=> d!125883 (and (bvsge lt!459118 #b00000000000000000000000000000000) (bvsle lt!459118 (bvsub (size!32108 (_keys!11599 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125883 (= lt!459118 e!590177)))

(declare-fun c!105731 () Bool)

(assert (=> d!125883 (= c!105731 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))))))

(assert (=> d!125883 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32108 (_keys!11599 thiss!1427)) (size!32108 (_keys!11599 thiss!1427))))))

(assert (=> d!125883 (= (arrayCountValidKeys!0 (_keys!11599 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))) lt!459118)))

(declare-fun b!1041952 () Bool)

(assert (=> b!1041952 (= e!590178 (bvadd #b00000000000000000000000000000001 call!44132))))

(declare-fun b!1041953 () Bool)

(assert (=> b!1041953 (= e!590177 #b00000000000000000000000000000000)))

(assert (= (and d!125883 c!105731) b!1041953))

(assert (= (and d!125883 (not c!105731)) b!1041951))

(assert (= (and b!1041951 c!105732) b!1041952))

(assert (= (and b!1041951 (not c!105732)) b!1041950))

(assert (= (or b!1041952 b!1041950) bm!44129))

(declare-fun m!960849 () Bool)

(assert (=> bm!44129 m!960849))

(declare-fun m!960851 () Bool)

(assert (=> b!1041951 m!960851))

(assert (=> b!1041951 m!960851))

(declare-fun m!960853 () Bool)

(assert (=> b!1041951 m!960853))

(assert (=> bm!44125 d!125883))

(declare-fun d!125885 () Bool)

(declare-fun res!694369 () Bool)

(declare-fun e!590179 () Bool)

(assert (=> d!125885 (=> res!694369 e!590179)))

(assert (=> d!125885 (= res!694369 (= (select (arr!31572 lt!459040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!125885 (= (arrayContainsKey!0 lt!459040 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!590179)))

(declare-fun b!1041954 () Bool)

(declare-fun e!590180 () Bool)

(assert (=> b!1041954 (= e!590179 e!590180)))

(declare-fun res!694370 () Bool)

(assert (=> b!1041954 (=> (not res!694370) (not e!590180))))

(assert (=> b!1041954 (= res!694370 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32108 lt!459040)))))

(declare-fun b!1041955 () Bool)

(assert (=> b!1041955 (= e!590180 (arrayContainsKey!0 lt!459040 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!125885 (not res!694369)) b!1041954))

(assert (= (and b!1041954 res!694370) b!1041955))

(declare-fun m!960855 () Bool)

(assert (=> d!125885 m!960855))

(declare-fun m!960857 () Bool)

(assert (=> b!1041955 m!960857))

(assert (=> b!1041865 d!125885))

(declare-fun d!125887 () Bool)

(declare-fun res!694371 () Bool)

(declare-fun e!590181 () Bool)

(assert (=> d!125887 (=> res!694371 e!590181)))

(assert (=> d!125887 (= res!694371 (= (select (arr!31572 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125887 (= (arrayContainsKey!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) key!909 #b00000000000000000000000000000000) e!590181)))

(declare-fun b!1041956 () Bool)

(declare-fun e!590182 () Bool)

(assert (=> b!1041956 (= e!590181 e!590182)))

(declare-fun res!694372 () Bool)

(assert (=> b!1041956 (=> (not res!694372) (not e!590182))))

(assert (=> b!1041956 (= res!694372 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))))))))

(declare-fun b!1041957 () Bool)

(assert (=> b!1041957 (= e!590182 (arrayContainsKey!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125887 (not res!694371)) b!1041956))

(assert (= (and b!1041956 res!694372) b!1041957))

(declare-fun m!960859 () Bool)

(assert (=> d!125887 m!960859))

(declare-fun m!960861 () Bool)

(assert (=> b!1041957 m!960861))

(assert (=> b!1041868 d!125887))

(declare-fun bm!44130 () Bool)

(declare-fun call!44133 () (_ BitVec 32))

(assert (=> bm!44130 (= call!44133 (arrayCountValidKeys!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))))))

(declare-fun b!1041958 () Bool)

(declare-fun e!590184 () (_ BitVec 32))

(assert (=> b!1041958 (= e!590184 call!44133)))

(declare-fun b!1041959 () Bool)

(declare-fun e!590183 () (_ BitVec 32))

(assert (=> b!1041959 (= e!590183 e!590184)))

(declare-fun c!105734 () Bool)

(assert (=> b!1041959 (= c!105734 (validKeyInArray!0 (select (arr!31572 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125889 () Bool)

(declare-fun lt!459119 () (_ BitVec 32))

(assert (=> d!125889 (and (bvsge lt!459119 #b00000000000000000000000000000000) (bvsle lt!459119 (bvsub (size!32108 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125889 (= lt!459119 e!590183)))

(declare-fun c!105733 () Bool)

(assert (=> d!125889 (= c!105733 (bvsge #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))))))

(assert (=> d!125889 (and (bvsle #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32108 (_keys!11599 thiss!1427)) (size!32108 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))))))))

(assert (=> d!125889 (= (arrayCountValidKeys!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) lt!459119)))

(declare-fun b!1041960 () Bool)

(assert (=> b!1041960 (= e!590184 (bvadd #b00000000000000000000000000000001 call!44133))))

(declare-fun b!1041961 () Bool)

(assert (=> b!1041961 (= e!590183 #b00000000000000000000000000000000)))

(assert (= (and d!125889 c!105733) b!1041961))

(assert (= (and d!125889 (not c!105733)) b!1041959))

(assert (= (and b!1041959 c!105734) b!1041960))

(assert (= (and b!1041959 (not c!105734)) b!1041958))

(assert (= (or b!1041960 b!1041958) bm!44130))

(declare-fun m!960863 () Bool)

(assert (=> bm!44130 m!960863))

(assert (=> b!1041959 m!960859))

(assert (=> b!1041959 m!960859))

(declare-fun m!960865 () Bool)

(assert (=> b!1041959 m!960865))

(assert (=> b!1041880 d!125889))

(assert (=> b!1041880 d!125867))

(declare-fun b!1041974 () Bool)

(declare-fun e!590192 () SeekEntryResult!9810)

(declare-fun e!590193 () SeekEntryResult!9810)

(assert (=> b!1041974 (= e!590192 e!590193)))

(declare-fun c!105743 () Bool)

(declare-fun lt!459124 () (_ BitVec 64))

(assert (=> b!1041974 (= c!105743 (= lt!459124 key!909))))

(declare-fun b!1041975 () Bool)

(declare-fun e!590191 () SeekEntryResult!9810)

(assert (=> b!1041975 (= e!590191 (MissingVacant!9810 (index!41613 lt!459112)))))

(declare-fun b!1041976 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041976 (= e!590191 (seekKeyOrZeroReturnVacant!0 (bvadd (x!93018 lt!459112) #b00000000000000000000000000000001) (nextIndex!0 (index!41613 lt!459112) (x!93018 lt!459112) (mask!30401 thiss!1427)) (index!41613 lt!459112) key!909 (_keys!11599 thiss!1427) (mask!30401 thiss!1427)))))

(declare-fun b!1041977 () Bool)

(assert (=> b!1041977 (= e!590193 (Found!9810 (index!41613 lt!459112)))))

(declare-fun d!125891 () Bool)

(declare-fun lt!459125 () SeekEntryResult!9810)

(assert (=> d!125891 (and (or ((_ is Undefined!9810) lt!459125) (not ((_ is Found!9810) lt!459125)) (and (bvsge (index!41612 lt!459125) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459125) (size!32108 (_keys!11599 thiss!1427))))) (or ((_ is Undefined!9810) lt!459125) ((_ is Found!9810) lt!459125) (not ((_ is MissingVacant!9810) lt!459125)) (not (= (index!41614 lt!459125) (index!41613 lt!459112))) (and (bvsge (index!41614 lt!459125) #b00000000000000000000000000000000) (bvslt (index!41614 lt!459125) (size!32108 (_keys!11599 thiss!1427))))) (or ((_ is Undefined!9810) lt!459125) (ite ((_ is Found!9810) lt!459125) (= (select (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459125)) key!909) (and ((_ is MissingVacant!9810) lt!459125) (= (index!41614 lt!459125) (index!41613 lt!459112)) (= (select (arr!31572 (_keys!11599 thiss!1427)) (index!41614 lt!459125)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!125891 (= lt!459125 e!590192)))

(declare-fun c!105741 () Bool)

(assert (=> d!125891 (= c!105741 (bvsge (x!93018 lt!459112) #b01111111111111111111111111111110))))

(assert (=> d!125891 (= lt!459124 (select (arr!31572 (_keys!11599 thiss!1427)) (index!41613 lt!459112)))))

(assert (=> d!125891 (validMask!0 (mask!30401 thiss!1427))))

(assert (=> d!125891 (= (seekKeyOrZeroReturnVacant!0 (x!93018 lt!459112) (index!41613 lt!459112) (index!41613 lt!459112) key!909 (_keys!11599 thiss!1427) (mask!30401 thiss!1427)) lt!459125)))

(declare-fun b!1041978 () Bool)

(declare-fun c!105742 () Bool)

(assert (=> b!1041978 (= c!105742 (= lt!459124 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041978 (= e!590193 e!590191)))

(declare-fun b!1041979 () Bool)

(assert (=> b!1041979 (= e!590192 Undefined!9810)))

(assert (= (and d!125891 c!105741) b!1041979))

(assert (= (and d!125891 (not c!105741)) b!1041974))

(assert (= (and b!1041974 c!105743) b!1041977))

(assert (= (and b!1041974 (not c!105743)) b!1041978))

(assert (= (and b!1041978 c!105742) b!1041975))

(assert (= (and b!1041978 (not c!105742)) b!1041976))

(declare-fun m!960867 () Bool)

(assert (=> b!1041976 m!960867))

(assert (=> b!1041976 m!960867))

(declare-fun m!960869 () Bool)

(assert (=> b!1041976 m!960869))

(declare-fun m!960871 () Bool)

(assert (=> d!125891 m!960871))

(declare-fun m!960873 () Bool)

(assert (=> d!125891 m!960873))

(assert (=> d!125891 m!960831))

(assert (=> d!125891 m!960695))

(assert (=> b!1041935 d!125891))

(assert (=> b!1041914 d!125879))

(declare-fun b!1041980 () Bool)

(declare-fun e!590196 () Bool)

(declare-fun call!44134 () Bool)

(assert (=> b!1041980 (= e!590196 call!44134)))

(declare-fun d!125893 () Bool)

(declare-fun res!694374 () Bool)

(declare-fun e!590194 () Bool)

(assert (=> d!125893 (=> res!694374 e!590194)))

(assert (=> d!125893 (= res!694374 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 lt!459040)))))

(assert (=> d!125893 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459040 (mask!30401 thiss!1427)) e!590194)))

(declare-fun b!1041981 () Bool)

(assert (=> b!1041981 (= e!590194 e!590196)))

(declare-fun c!105744 () Bool)

(assert (=> b!1041981 (= c!105744 (validKeyInArray!0 (select (arr!31572 lt!459040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041982 () Bool)

(declare-fun e!590195 () Bool)

(assert (=> b!1041982 (= e!590195 call!44134)))

(declare-fun b!1041983 () Bool)

(assert (=> b!1041983 (= e!590196 e!590195)))

(declare-fun lt!459126 () (_ BitVec 64))

(assert (=> b!1041983 (= lt!459126 (select (arr!31572 lt!459040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!459128 () Unit!33927)

(assert (=> b!1041983 (= lt!459128 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459040 lt!459126 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1041983 (arrayContainsKey!0 lt!459040 lt!459126 #b00000000000000000000000000000000)))

(declare-fun lt!459127 () Unit!33927)

(assert (=> b!1041983 (= lt!459127 lt!459128)))

(declare-fun res!694373 () Bool)

(assert (=> b!1041983 (= res!694373 (= (seekEntryOrOpen!0 (select (arr!31572 lt!459040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!459040 (mask!30401 thiss!1427)) (Found!9810 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1041983 (=> (not res!694373) (not e!590195))))

(declare-fun bm!44131 () Bool)

(assert (=> bm!44131 (= call!44134 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!459040 (mask!30401 thiss!1427)))))

(assert (= (and d!125893 (not res!694374)) b!1041981))

(assert (= (and b!1041981 c!105744) b!1041983))

(assert (= (and b!1041981 (not c!105744)) b!1041980))

(assert (= (and b!1041983 res!694373) b!1041982))

(assert (= (or b!1041982 b!1041980) bm!44131))

(assert (=> b!1041981 m!960855))

(assert (=> b!1041981 m!960855))

(declare-fun m!960875 () Bool)

(assert (=> b!1041981 m!960875))

(assert (=> b!1041983 m!960855))

(declare-fun m!960877 () Bool)

(assert (=> b!1041983 m!960877))

(declare-fun m!960879 () Bool)

(assert (=> b!1041983 m!960879))

(assert (=> b!1041983 m!960855))

(declare-fun m!960881 () Bool)

(assert (=> b!1041983 m!960881))

(declare-fun m!960883 () Bool)

(assert (=> bm!44131 m!960883))

(assert (=> bm!44124 d!125893))

(declare-fun d!125895 () Bool)

(assert (=> d!125895 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1041878 d!125895))

(declare-fun d!125897 () Bool)

(assert (=> d!125897 (arrayContainsKey!0 lt!459040 lt!459093 #b00000000000000000000000000000000)))

(declare-fun lt!459131 () Unit!33927)

(declare-fun choose!13 (array!65627 (_ BitVec 64) (_ BitVec 32)) Unit!33927)

(assert (=> d!125897 (= lt!459131 (choose!13 lt!459040 lt!459093 #b00000000000000000000000000000000))))

(assert (=> d!125897 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!125897 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459040 lt!459093 #b00000000000000000000000000000000) lt!459131)))

(declare-fun bs!30445 () Bool)

(assert (= bs!30445 d!125897))

(assert (=> bs!30445 m!960807))

(declare-fun m!960885 () Bool)

(assert (=> bs!30445 m!960885))

(assert (=> b!1041892 d!125897))

(declare-fun d!125899 () Bool)

(declare-fun res!694375 () Bool)

(declare-fun e!590197 () Bool)

(assert (=> d!125899 (=> res!694375 e!590197)))

(assert (=> d!125899 (= res!694375 (= (select (arr!31572 lt!459040) #b00000000000000000000000000000000) lt!459093))))

(assert (=> d!125899 (= (arrayContainsKey!0 lt!459040 lt!459093 #b00000000000000000000000000000000) e!590197)))

(declare-fun b!1041984 () Bool)

(declare-fun e!590198 () Bool)

(assert (=> b!1041984 (= e!590197 e!590198)))

(declare-fun res!694376 () Bool)

(assert (=> b!1041984 (=> (not res!694376) (not e!590198))))

(assert (=> b!1041984 (= res!694376 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 lt!459040)))))

(declare-fun b!1041985 () Bool)

(assert (=> b!1041985 (= e!590198 (arrayContainsKey!0 lt!459040 lt!459093 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125899 (not res!694375)) b!1041984))

(assert (= (and b!1041984 res!694376) b!1041985))

(assert (=> d!125899 m!960785))

(declare-fun m!960887 () Bool)

(assert (=> b!1041985 m!960887))

(assert (=> b!1041892 d!125899))

(declare-fun b!1041998 () Bool)

(declare-fun e!590206 () SeekEntryResult!9810)

(assert (=> b!1041998 (= e!590206 Undefined!9810)))

(declare-fun b!1041999 () Bool)

(declare-fun e!590205 () SeekEntryResult!9810)

(declare-fun lt!459139 () SeekEntryResult!9810)

(assert (=> b!1041999 (= e!590205 (MissingZero!9810 (index!41613 lt!459139)))))

(declare-fun b!1042000 () Bool)

(assert (=> b!1042000 (= e!590205 (seekKeyOrZeroReturnVacant!0 (x!93018 lt!459139) (index!41613 lt!459139) (index!41613 lt!459139) (select (arr!31572 lt!459040) #b00000000000000000000000000000000) lt!459040 (mask!30401 thiss!1427)))))

(declare-fun b!1042002 () Bool)

(declare-fun e!590207 () SeekEntryResult!9810)

(assert (=> b!1042002 (= e!590207 (Found!9810 (index!41613 lt!459139)))))

(declare-fun b!1042003 () Bool)

(assert (=> b!1042003 (= e!590206 e!590207)))

(declare-fun lt!459138 () (_ BitVec 64))

(assert (=> b!1042003 (= lt!459138 (select (arr!31572 lt!459040) (index!41613 lt!459139)))))

(declare-fun c!105753 () Bool)

(assert (=> b!1042003 (= c!105753 (= lt!459138 (select (arr!31572 lt!459040) #b00000000000000000000000000000000)))))

(declare-fun d!125901 () Bool)

(declare-fun lt!459140 () SeekEntryResult!9810)

(assert (=> d!125901 (and (or ((_ is Undefined!9810) lt!459140) (not ((_ is Found!9810) lt!459140)) (and (bvsge (index!41612 lt!459140) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459140) (size!32108 lt!459040)))) (or ((_ is Undefined!9810) lt!459140) ((_ is Found!9810) lt!459140) (not ((_ is MissingZero!9810) lt!459140)) (and (bvsge (index!41611 lt!459140) #b00000000000000000000000000000000) (bvslt (index!41611 lt!459140) (size!32108 lt!459040)))) (or ((_ is Undefined!9810) lt!459140) ((_ is Found!9810) lt!459140) ((_ is MissingZero!9810) lt!459140) (not ((_ is MissingVacant!9810) lt!459140)) (and (bvsge (index!41614 lt!459140) #b00000000000000000000000000000000) (bvslt (index!41614 lt!459140) (size!32108 lt!459040)))) (or ((_ is Undefined!9810) lt!459140) (ite ((_ is Found!9810) lt!459140) (= (select (arr!31572 lt!459040) (index!41612 lt!459140)) (select (arr!31572 lt!459040) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9810) lt!459140) (= (select (arr!31572 lt!459040) (index!41611 lt!459140)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9810) lt!459140) (= (select (arr!31572 lt!459040) (index!41614 lt!459140)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125901 (= lt!459140 e!590206)))

(declare-fun c!105752 () Bool)

(assert (=> d!125901 (= c!105752 (and ((_ is Intermediate!9810) lt!459139) (undefined!10622 lt!459139)))))

(assert (=> d!125901 (= lt!459139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31572 lt!459040) #b00000000000000000000000000000000) (mask!30401 thiss!1427)) (select (arr!31572 lt!459040) #b00000000000000000000000000000000) lt!459040 (mask!30401 thiss!1427)))))

(assert (=> d!125901 (validMask!0 (mask!30401 thiss!1427))))

(assert (=> d!125901 (= (seekEntryOrOpen!0 (select (arr!31572 lt!459040) #b00000000000000000000000000000000) lt!459040 (mask!30401 thiss!1427)) lt!459140)))

(declare-fun b!1042001 () Bool)

(declare-fun c!105751 () Bool)

(assert (=> b!1042001 (= c!105751 (= lt!459138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042001 (= e!590207 e!590205)))

(assert (= (and d!125901 c!105752) b!1041998))

(assert (= (and d!125901 (not c!105752)) b!1042003))

(assert (= (and b!1042003 c!105753) b!1042002))

(assert (= (and b!1042003 (not c!105753)) b!1042001))

(assert (= (and b!1042001 c!105751) b!1041999))

(assert (= (and b!1042001 (not c!105751)) b!1042000))

(assert (=> b!1042000 m!960785))

(declare-fun m!960889 () Bool)

(assert (=> b!1042000 m!960889))

(declare-fun m!960891 () Bool)

(assert (=> b!1042003 m!960891))

(declare-fun m!960893 () Bool)

(assert (=> d!125901 m!960893))

(declare-fun m!960895 () Bool)

(assert (=> d!125901 m!960895))

(declare-fun m!960897 () Bool)

(assert (=> d!125901 m!960897))

(assert (=> d!125901 m!960695))

(assert (=> d!125901 m!960785))

(declare-fun m!960899 () Bool)

(assert (=> d!125901 m!960899))

(assert (=> d!125901 m!960899))

(assert (=> d!125901 m!960785))

(declare-fun m!960901 () Bool)

(assert (=> d!125901 m!960901))

(assert (=> b!1041892 d!125901))

(declare-fun d!125903 () Bool)

(assert (=> d!125903 (= (validKeyInArray!0 (select (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039))) (and (not (= (select (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041877 d!125903))

(declare-fun d!125905 () Bool)

(assert (=> d!125905 (= (arrayCountValidKeys!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11599 thiss!1427) #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!125905 true))

(declare-fun _$79!32 () Unit!33927)

(assert (=> d!125905 (= (choose!82 (_keys!11599 thiss!1427) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!32)))

(declare-fun bs!30446 () Bool)

(assert (= bs!30446 d!125905))

(assert (=> bs!30446 m!960705))

(assert (=> bs!30446 m!960797))

(assert (=> bs!30446 m!960697))

(assert (=> d!125859 d!125905))

(declare-fun d!125907 () Bool)

(declare-fun res!694388 () Bool)

(declare-fun e!590210 () Bool)

(assert (=> d!125907 (=> (not res!694388) (not e!590210))))

(assert (=> d!125907 (= res!694388 (validMask!0 (mask!30401 thiss!1427)))))

(assert (=> d!125907 (= (simpleValid!440 thiss!1427) e!590210)))

(declare-fun b!1042014 () Bool)

(declare-fun res!694387 () Bool)

(assert (=> b!1042014 (=> (not res!694387) (not e!590210))))

(declare-fun size!32114 (LongMapFixedSize!5956) (_ BitVec 32))

(assert (=> b!1042014 (= res!694387 (= (size!32114 thiss!1427) (bvadd (_size!3033 thiss!1427) (bvsdiv (bvadd (extraKeys!6088 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1042015 () Bool)

(assert (=> b!1042015 (= e!590210 (and (bvsge (extraKeys!6088 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6088 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3033 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1042012 () Bool)

(declare-fun res!694385 () Bool)

(assert (=> b!1042012 (=> (not res!694385) (not e!590210))))

(assert (=> b!1042012 (= res!694385 (and (= (size!32109 (_values!6383 thiss!1427)) (bvadd (mask!30401 thiss!1427) #b00000000000000000000000000000001)) (= (size!32108 (_keys!11599 thiss!1427)) (size!32109 (_values!6383 thiss!1427))) (bvsge (_size!3033 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3033 thiss!1427) (bvadd (mask!30401 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1042013 () Bool)

(declare-fun res!694386 () Bool)

(assert (=> b!1042013 (=> (not res!694386) (not e!590210))))

(assert (=> b!1042013 (= res!694386 (bvsge (size!32114 thiss!1427) (_size!3033 thiss!1427)))))

(assert (= (and d!125907 res!694388) b!1042012))

(assert (= (and b!1042012 res!694385) b!1042013))

(assert (= (and b!1042013 res!694386) b!1042014))

(assert (= (and b!1042014 res!694387) b!1042015))

(assert (=> d!125907 m!960695))

(declare-fun m!960903 () Bool)

(assert (=> b!1042014 m!960903))

(assert (=> b!1042013 m!960903))

(assert (=> d!125851 d!125907))

(declare-fun b!1042016 () Bool)

(declare-fun e!590213 () Bool)

(declare-fun call!44135 () Bool)

(assert (=> b!1042016 (= e!590213 call!44135)))

(declare-fun d!125909 () Bool)

(declare-fun res!694390 () Bool)

(declare-fun e!590211 () Bool)

(assert (=> d!125909 (=> res!694390 e!590211)))

(assert (=> d!125909 (= res!694390 (bvsge #b00000000000000000000000000000000 (size!32108 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))))))))

(assert (=> d!125909 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) (mask!30401 thiss!1427)) e!590211)))

(declare-fun b!1042017 () Bool)

(assert (=> b!1042017 (= e!590211 e!590213)))

(declare-fun c!105754 () Bool)

(assert (=> b!1042017 (= c!105754 (validKeyInArray!0 (select (arr!31572 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1042018 () Bool)

(declare-fun e!590212 () Bool)

(assert (=> b!1042018 (= e!590212 call!44135)))

(declare-fun b!1042019 () Bool)

(assert (=> b!1042019 (= e!590213 e!590212)))

(declare-fun lt!459141 () (_ BitVec 64))

(assert (=> b!1042019 (= lt!459141 (select (arr!31572 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!459143 () Unit!33927)

(assert (=> b!1042019 (= lt!459143 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) lt!459141 #b00000000000000000000000000000000))))

(assert (=> b!1042019 (arrayContainsKey!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) lt!459141 #b00000000000000000000000000000000)))

(declare-fun lt!459142 () Unit!33927)

(assert (=> b!1042019 (= lt!459142 lt!459143)))

(declare-fun res!694389 () Bool)

(assert (=> b!1042019 (= res!694389 (= (seekEntryOrOpen!0 (select (arr!31572 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427)))) #b00000000000000000000000000000000) (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) (mask!30401 thiss!1427)) (Found!9810 #b00000000000000000000000000000000)))))

(assert (=> b!1042019 (=> (not res!694389) (not e!590212))))

(declare-fun bm!44132 () Bool)

(assert (=> bm!44132 (= call!44135 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) (mask!30401 thiss!1427)))))

(assert (= (and d!125909 (not res!694390)) b!1042017))

(assert (= (and b!1042017 c!105754) b!1042019))

(assert (= (and b!1042017 (not c!105754)) b!1042016))

(assert (= (and b!1042019 res!694389) b!1042018))

(assert (= (or b!1042018 b!1042016) bm!44132))

(assert (=> b!1042017 m!960859))

(assert (=> b!1042017 m!960859))

(assert (=> b!1042017 m!960865))

(assert (=> b!1042019 m!960859))

(declare-fun m!960905 () Bool)

(assert (=> b!1042019 m!960905))

(declare-fun m!960907 () Bool)

(assert (=> b!1042019 m!960907))

(assert (=> b!1042019 m!960859))

(declare-fun m!960909 () Bool)

(assert (=> b!1042019 m!960909))

(declare-fun m!960911 () Bool)

(assert (=> bm!44132 m!960911))

(assert (=> b!1041895 d!125909))

(assert (=> b!1041845 d!125867))

(declare-fun b!1042020 () Bool)

(declare-fun e!590217 () Bool)

(declare-fun call!44136 () Bool)

(assert (=> b!1042020 (= e!590217 call!44136)))

(declare-fun b!1042021 () Bool)

(declare-fun e!590214 () Bool)

(declare-fun e!590215 () Bool)

(assert (=> b!1042021 (= e!590214 e!590215)))

(declare-fun res!694391 () Bool)

(assert (=> b!1042021 (=> (not res!694391) (not e!590215))))

(declare-fun e!590216 () Bool)

(assert (=> b!1042021 (= res!694391 (not e!590216))))

(declare-fun res!694392 () Bool)

(assert (=> b!1042021 (=> (not res!694392) (not e!590216))))

(assert (=> b!1042021 (= res!694392 (validKeyInArray!0 (select (arr!31572 lt!459040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1042022 () Bool)

(assert (=> b!1042022 (= e!590216 (contains!6036 (ite c!105721 (Cons!22005 (select (arr!31572 lt!459040) #b00000000000000000000000000000000) Nil!22006) Nil!22006) (select (arr!31572 lt!459040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1042023 () Bool)

(assert (=> b!1042023 (= e!590217 call!44136)))

(declare-fun b!1042024 () Bool)

(assert (=> b!1042024 (= e!590215 e!590217)))

(declare-fun c!105755 () Bool)

(assert (=> b!1042024 (= c!105755 (validKeyInArray!0 (select (arr!31572 lt!459040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44133 () Bool)

(assert (=> bm!44133 (= call!44136 (arrayNoDuplicates!0 lt!459040 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105755 (Cons!22005 (select (arr!31572 lt!459040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105721 (Cons!22005 (select (arr!31572 lt!459040) #b00000000000000000000000000000000) Nil!22006) Nil!22006)) (ite c!105721 (Cons!22005 (select (arr!31572 lt!459040) #b00000000000000000000000000000000) Nil!22006) Nil!22006))))))

(declare-fun d!125911 () Bool)

(declare-fun res!694393 () Bool)

(assert (=> d!125911 (=> res!694393 e!590214)))

(assert (=> d!125911 (= res!694393 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 lt!459040)))))

(assert (=> d!125911 (= (arrayNoDuplicates!0 lt!459040 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105721 (Cons!22005 (select (arr!31572 lt!459040) #b00000000000000000000000000000000) Nil!22006) Nil!22006)) e!590214)))

(assert (= (and d!125911 (not res!694393)) b!1042021))

(assert (= (and b!1042021 res!694392) b!1042022))

(assert (= (and b!1042021 res!694391) b!1042024))

(assert (= (and b!1042024 c!105755) b!1042020))

(assert (= (and b!1042024 (not c!105755)) b!1042023))

(assert (= (or b!1042020 b!1042023) bm!44133))

(assert (=> b!1042021 m!960855))

(assert (=> b!1042021 m!960855))

(assert (=> b!1042021 m!960875))

(assert (=> b!1042022 m!960855))

(assert (=> b!1042022 m!960855))

(declare-fun m!960913 () Bool)

(assert (=> b!1042022 m!960913))

(assert (=> b!1042024 m!960855))

(assert (=> b!1042024 m!960855))

(assert (=> b!1042024 m!960875))

(assert (=> bm!44133 m!960855))

(declare-fun m!960915 () Bool)

(assert (=> bm!44133 m!960915))

(assert (=> bm!44128 d!125911))

(assert (=> b!1041917 d!125879))

(declare-fun d!125913 () Bool)

(assert (=> d!125913 (= (validKeyInArray!0 (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041900 d!125913))

(declare-fun d!125915 () Bool)

(assert (=> d!125915 (not (arrayContainsKey!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!125915 true))

(declare-fun _$59!32 () Unit!33927)

(assert (=> d!125915 (= (choose!121 (_keys!11599 thiss!1427) (index!41612 lt!459039) key!909) _$59!32)))

(declare-fun bs!30447 () Bool)

(assert (= bs!30447 d!125915))

(assert (=> bs!30447 m!960705))

(assert (=> bs!30447 m!960793))

(assert (=> d!125857 d!125915))

(declare-fun d!125917 () Bool)

(assert (=> d!125917 (arrayNoDuplicates!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) #b00000000000000000000000000000000 Nil!22006)))

(assert (=> d!125917 true))

(declare-fun _$66!56 () Unit!33927)

(assert (=> d!125917 (= (choose!53 (_keys!11599 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41612 lt!459039) #b00000000000000000000000000000000 Nil!22006) _$66!56)))

(declare-fun bs!30448 () Bool)

(assert (= bs!30448 d!125917))

(assert (=> bs!30448 m!960705))

(assert (=> bs!30448 m!960819))

(assert (=> d!125865 d!125917))

(declare-fun b!1042025 () Bool)

(declare-fun e!590221 () Bool)

(declare-fun call!44137 () Bool)

(assert (=> b!1042025 (= e!590221 call!44137)))

(declare-fun b!1042026 () Bool)

(declare-fun e!590218 () Bool)

(declare-fun e!590219 () Bool)

(assert (=> b!1042026 (= e!590218 e!590219)))

(declare-fun res!694394 () Bool)

(assert (=> b!1042026 (=> (not res!694394) (not e!590219))))

(declare-fun e!590220 () Bool)

(assert (=> b!1042026 (= res!694394 (not e!590220))))

(declare-fun res!694395 () Bool)

(assert (=> b!1042026 (=> (not res!694395) (not e!590220))))

(assert (=> b!1042026 (= res!694395 (validKeyInArray!0 (select (arr!31572 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1042027 () Bool)

(assert (=> b!1042027 (= e!590220 (contains!6036 Nil!22006 (select (arr!31572 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1042028 () Bool)

(assert (=> b!1042028 (= e!590221 call!44137)))

(declare-fun b!1042029 () Bool)

(assert (=> b!1042029 (= e!590219 e!590221)))

(declare-fun c!105756 () Bool)

(assert (=> b!1042029 (= c!105756 (validKeyInArray!0 (select (arr!31572 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44134 () Bool)

(assert (=> bm!44134 (= call!44137 (arrayNoDuplicates!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105756 (Cons!22005 (select (arr!31572 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427)))) #b00000000000000000000000000000000) Nil!22006) Nil!22006)))))

(declare-fun d!125919 () Bool)

(declare-fun res!694396 () Bool)

(assert (=> d!125919 (=> res!694396 e!590218)))

(assert (=> d!125919 (= res!694396 (bvsge #b00000000000000000000000000000000 (size!32108 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))))))))

(assert (=> d!125919 (= (arrayNoDuplicates!0 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) #b00000000000000000000000000000000 Nil!22006) e!590218)))

(assert (= (and d!125919 (not res!694396)) b!1042026))

(assert (= (and b!1042026 res!694395) b!1042027))

(assert (= (and b!1042026 res!694394) b!1042029))

(assert (= (and b!1042029 c!105756) b!1042025))

(assert (= (and b!1042029 (not c!105756)) b!1042028))

(assert (= (or b!1042025 b!1042028) bm!44134))

(assert (=> b!1042026 m!960859))

(assert (=> b!1042026 m!960859))

(assert (=> b!1042026 m!960865))

(assert (=> b!1042027 m!960859))

(assert (=> b!1042027 m!960859))

(declare-fun m!960917 () Bool)

(assert (=> b!1042027 m!960917))

(assert (=> b!1042029 m!960859))

(assert (=> b!1042029 m!960859))

(assert (=> b!1042029 m!960865))

(assert (=> bm!44134 m!960859))

(declare-fun m!960919 () Bool)

(assert (=> bm!44134 m!960919))

(assert (=> b!1041898 d!125919))

(declare-fun b!1042030 () Bool)

(declare-fun e!590225 () Bool)

(declare-fun call!44138 () Bool)

(assert (=> b!1042030 (= e!590225 call!44138)))

(declare-fun b!1042031 () Bool)

(declare-fun e!590222 () Bool)

(declare-fun e!590223 () Bool)

(assert (=> b!1042031 (= e!590222 e!590223)))

(declare-fun res!694397 () Bool)

(assert (=> b!1042031 (=> (not res!694397) (not e!590223))))

(declare-fun e!590224 () Bool)

(assert (=> b!1042031 (= res!694397 (not e!590224))))

(declare-fun res!694398 () Bool)

(assert (=> b!1042031 (=> (not res!694398) (not e!590224))))

(assert (=> b!1042031 (= res!694398 (validKeyInArray!0 (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042032 () Bool)

(assert (=> b!1042032 (= e!590224 (contains!6036 Nil!22006 (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042033 () Bool)

(assert (=> b!1042033 (= e!590225 call!44138)))

(declare-fun b!1042034 () Bool)

(assert (=> b!1042034 (= e!590223 e!590225)))

(declare-fun c!105757 () Bool)

(assert (=> b!1042034 (= c!105757 (validKeyInArray!0 (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44135 () Bool)

(assert (=> bm!44135 (= call!44138 (arrayNoDuplicates!0 (_keys!11599 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105757 (Cons!22005 (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000) Nil!22006) Nil!22006)))))

(declare-fun d!125921 () Bool)

(declare-fun res!694399 () Bool)

(assert (=> d!125921 (=> res!694399 e!590222)))

(assert (=> d!125921 (= res!694399 (bvsge #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))))))

(assert (=> d!125921 (= (arrayNoDuplicates!0 (_keys!11599 thiss!1427) #b00000000000000000000000000000000 Nil!22006) e!590222)))

(assert (= (and d!125921 (not res!694399)) b!1042031))

(assert (= (and b!1042031 res!694398) b!1042032))

(assert (= (and b!1042031 res!694397) b!1042034))

(assert (= (and b!1042034 c!105757) b!1042030))

(assert (= (and b!1042034 (not c!105757)) b!1042033))

(assert (= (or b!1042030 b!1042033) bm!44135))

(assert (=> b!1042031 m!960823))

(assert (=> b!1042031 m!960823))

(assert (=> b!1042031 m!960825))

(assert (=> b!1042032 m!960823))

(assert (=> b!1042032 m!960823))

(declare-fun m!960921 () Bool)

(assert (=> b!1042032 m!960921))

(assert (=> b!1042034 m!960823))

(assert (=> b!1042034 m!960823))

(assert (=> b!1042034 m!960825))

(assert (=> bm!44135 m!960823))

(declare-fun m!960923 () Bool)

(assert (=> bm!44135 m!960923))

(assert (=> b!1041847 d!125921))

(declare-fun bm!44136 () Bool)

(declare-fun call!44139 () (_ BitVec 32))

(assert (=> bm!44136 (= call!44139 (arrayCountValidKeys!0 lt!459040 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))))))

(declare-fun b!1042035 () Bool)

(declare-fun e!590227 () (_ BitVec 32))

(assert (=> b!1042035 (= e!590227 call!44139)))

(declare-fun b!1042036 () Bool)

(declare-fun e!590226 () (_ BitVec 32))

(assert (=> b!1042036 (= e!590226 e!590227)))

(declare-fun c!105759 () Bool)

(assert (=> b!1042036 (= c!105759 (validKeyInArray!0 (select (arr!31572 lt!459040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125923 () Bool)

(declare-fun lt!459144 () (_ BitVec 32))

(assert (=> d!125923 (and (bvsge lt!459144 #b00000000000000000000000000000000) (bvsle lt!459144 (bvsub (size!32108 lt!459040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125923 (= lt!459144 e!590226)))

(declare-fun c!105758 () Bool)

(assert (=> d!125923 (= c!105758 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))))))

(assert (=> d!125923 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32108 (_keys!11599 thiss!1427)) (size!32108 lt!459040)))))

(assert (=> d!125923 (= (arrayCountValidKeys!0 lt!459040 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32108 (_keys!11599 thiss!1427))) lt!459144)))

(declare-fun b!1042037 () Bool)

(assert (=> b!1042037 (= e!590227 (bvadd #b00000000000000000000000000000001 call!44139))))

(declare-fun b!1042038 () Bool)

(assert (=> b!1042038 (= e!590226 #b00000000000000000000000000000000)))

(assert (= (and d!125923 c!105758) b!1042038))

(assert (= (and d!125923 (not c!105758)) b!1042036))

(assert (= (and b!1042036 c!105759) b!1042037))

(assert (= (and b!1042036 (not c!105759)) b!1042035))

(assert (= (or b!1042037 b!1042035) bm!44136))

(declare-fun m!960925 () Bool)

(assert (=> bm!44136 m!960925))

(assert (=> b!1042036 m!960855))

(assert (=> b!1042036 m!960855))

(assert (=> b!1042036 m!960875))

(assert (=> bm!44121 d!125923))

(declare-fun b!1042039 () Bool)

(declare-fun e!590230 () Bool)

(declare-fun call!44140 () Bool)

(assert (=> b!1042039 (= e!590230 call!44140)))

(declare-fun d!125925 () Bool)

(declare-fun res!694401 () Bool)

(declare-fun e!590228 () Bool)

(assert (=> d!125925 (=> res!694401 e!590228)))

(assert (=> d!125925 (= res!694401 (bvsge #b00000000000000000000000000000000 (size!32108 (_keys!11599 thiss!1427))))))

(assert (=> d!125925 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11599 thiss!1427) (mask!30401 thiss!1427)) e!590228)))

(declare-fun b!1042040 () Bool)

(assert (=> b!1042040 (= e!590228 e!590230)))

(declare-fun c!105760 () Bool)

(assert (=> b!1042040 (= c!105760 (validKeyInArray!0 (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042041 () Bool)

(declare-fun e!590229 () Bool)

(assert (=> b!1042041 (= e!590229 call!44140)))

(declare-fun b!1042042 () Bool)

(assert (=> b!1042042 (= e!590230 e!590229)))

(declare-fun lt!459145 () (_ BitVec 64))

(assert (=> b!1042042 (= lt!459145 (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459147 () Unit!33927)

(assert (=> b!1042042 (= lt!459147 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11599 thiss!1427) lt!459145 #b00000000000000000000000000000000))))

(assert (=> b!1042042 (arrayContainsKey!0 (_keys!11599 thiss!1427) lt!459145 #b00000000000000000000000000000000)))

(declare-fun lt!459146 () Unit!33927)

(assert (=> b!1042042 (= lt!459146 lt!459147)))

(declare-fun res!694400 () Bool)

(assert (=> b!1042042 (= res!694400 (= (seekEntryOrOpen!0 (select (arr!31572 (_keys!11599 thiss!1427)) #b00000000000000000000000000000000) (_keys!11599 thiss!1427) (mask!30401 thiss!1427)) (Found!9810 #b00000000000000000000000000000000)))))

(assert (=> b!1042042 (=> (not res!694400) (not e!590229))))

(declare-fun bm!44137 () Bool)

(assert (=> bm!44137 (= call!44140 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11599 thiss!1427) (mask!30401 thiss!1427)))))

(assert (= (and d!125925 (not res!694401)) b!1042040))

(assert (= (and b!1042040 c!105760) b!1042042))

(assert (= (and b!1042040 (not c!105760)) b!1042039))

(assert (= (and b!1042042 res!694400) b!1042041))

(assert (= (or b!1042041 b!1042039) bm!44137))

(assert (=> b!1042040 m!960823))

(assert (=> b!1042040 m!960823))

(assert (=> b!1042040 m!960825))

(assert (=> b!1042042 m!960823))

(declare-fun m!960927 () Bool)

(assert (=> b!1042042 m!960927))

(declare-fun m!960929 () Bool)

(assert (=> b!1042042 m!960929))

(assert (=> b!1042042 m!960823))

(declare-fun m!960931 () Bool)

(assert (=> b!1042042 m!960931))

(declare-fun m!960933 () Bool)

(assert (=> bm!44137 m!960933))

(assert (=> b!1041846 d!125925))

(assert (=> b!1041857 d!125879))

(declare-fun b!1042061 () Bool)

(declare-fun lt!459153 () SeekEntryResult!9810)

(assert (=> b!1042061 (and (bvsge (index!41613 lt!459153) #b00000000000000000000000000000000) (bvslt (index!41613 lt!459153) (size!32108 (_keys!11599 thiss!1427))))))

(declare-fun e!590242 () Bool)

(assert (=> b!1042061 (= e!590242 (= (select (arr!31572 (_keys!11599 thiss!1427)) (index!41613 lt!459153)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!125927 () Bool)

(declare-fun e!590243 () Bool)

(assert (=> d!125927 e!590243))

(declare-fun c!105768 () Bool)

(assert (=> d!125927 (= c!105768 (and ((_ is Intermediate!9810) lt!459153) (undefined!10622 lt!459153)))))

(declare-fun e!590241 () SeekEntryResult!9810)

(assert (=> d!125927 (= lt!459153 e!590241)))

(declare-fun c!105767 () Bool)

(assert (=> d!125927 (= c!105767 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!459152 () (_ BitVec 64))

(assert (=> d!125927 (= lt!459152 (select (arr!31572 (_keys!11599 thiss!1427)) (toIndex!0 key!909 (mask!30401 thiss!1427))))))

(assert (=> d!125927 (validMask!0 (mask!30401 thiss!1427))))

(assert (=> d!125927 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30401 thiss!1427)) key!909 (_keys!11599 thiss!1427) (mask!30401 thiss!1427)) lt!459153)))

(declare-fun b!1042062 () Bool)

(assert (=> b!1042062 (= e!590241 (Intermediate!9810 true (toIndex!0 key!909 (mask!30401 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1042063 () Bool)

(declare-fun e!590245 () SeekEntryResult!9810)

(assert (=> b!1042063 (= e!590241 e!590245)))

(declare-fun c!105769 () Bool)

(assert (=> b!1042063 (= c!105769 (or (= lt!459152 key!909) (= (bvadd lt!459152 lt!459152) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042064 () Bool)

(assert (=> b!1042064 (= e!590243 (bvsge (x!93018 lt!459153) #b01111111111111111111111111111110))))

(declare-fun b!1042065 () Bool)

(assert (=> b!1042065 (= e!590245 (Intermediate!9810 false (toIndex!0 key!909 (mask!30401 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1042066 () Bool)

(assert (=> b!1042066 (and (bvsge (index!41613 lt!459153) #b00000000000000000000000000000000) (bvslt (index!41613 lt!459153) (size!32108 (_keys!11599 thiss!1427))))))

(declare-fun res!694410 () Bool)

(assert (=> b!1042066 (= res!694410 (= (select (arr!31572 (_keys!11599 thiss!1427)) (index!41613 lt!459153)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042066 (=> res!694410 e!590242)))

(declare-fun b!1042067 () Bool)

(assert (=> b!1042067 (and (bvsge (index!41613 lt!459153) #b00000000000000000000000000000000) (bvslt (index!41613 lt!459153) (size!32108 (_keys!11599 thiss!1427))))))

(declare-fun res!694409 () Bool)

(assert (=> b!1042067 (= res!694409 (= (select (arr!31572 (_keys!11599 thiss!1427)) (index!41613 lt!459153)) key!909))))

(assert (=> b!1042067 (=> res!694409 e!590242)))

(declare-fun e!590244 () Bool)

(assert (=> b!1042067 (= e!590244 e!590242)))

(declare-fun b!1042068 () Bool)

(assert (=> b!1042068 (= e!590245 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30401 thiss!1427)) #b00000000000000000000000000000000 (mask!30401 thiss!1427)) key!909 (_keys!11599 thiss!1427) (mask!30401 thiss!1427)))))

(declare-fun b!1042069 () Bool)

(assert (=> b!1042069 (= e!590243 e!590244)))

(declare-fun res!694408 () Bool)

(assert (=> b!1042069 (= res!694408 (and ((_ is Intermediate!9810) lt!459153) (not (undefined!10622 lt!459153)) (bvslt (x!93018 lt!459153) #b01111111111111111111111111111110) (bvsge (x!93018 lt!459153) #b00000000000000000000000000000000) (bvsge (x!93018 lt!459153) #b00000000000000000000000000000000)))))

(assert (=> b!1042069 (=> (not res!694408) (not e!590244))))

(assert (= (and d!125927 c!105767) b!1042062))

(assert (= (and d!125927 (not c!105767)) b!1042063))

(assert (= (and b!1042063 c!105769) b!1042065))

(assert (= (and b!1042063 (not c!105769)) b!1042068))

(assert (= (and d!125927 c!105768) b!1042064))

(assert (= (and d!125927 (not c!105768)) b!1042069))

(assert (= (and b!1042069 res!694408) b!1042067))

(assert (= (and b!1042067 (not res!694409)) b!1042066))

(assert (= (and b!1042066 (not res!694410)) b!1042061))

(declare-fun m!960935 () Bool)

(assert (=> b!1042061 m!960935))

(assert (=> b!1042067 m!960935))

(assert (=> b!1042068 m!960837))

(declare-fun m!960937 () Bool)

(assert (=> b!1042068 m!960937))

(assert (=> b!1042068 m!960937))

(declare-fun m!960939 () Bool)

(assert (=> b!1042068 m!960939))

(assert (=> b!1042066 m!960935))

(assert (=> d!125927 m!960837))

(declare-fun m!960941 () Bool)

(assert (=> d!125927 m!960941))

(assert (=> d!125927 m!960695))

(assert (=> d!125873 d!125927))

(declare-fun d!125929 () Bool)

(declare-fun lt!459159 () (_ BitVec 32))

(declare-fun lt!459158 () (_ BitVec 32))

(assert (=> d!125929 (= lt!459159 (bvmul (bvxor lt!459158 (bvlshr lt!459158 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125929 (= lt!459158 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125929 (and (bvsge (mask!30401 thiss!1427) #b00000000000000000000000000000000) (let ((res!694411 (let ((h!23213 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!93037 (bvmul (bvxor h!23213 (bvlshr h!23213 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!93037 (bvlshr x!93037 #b00000000000000000000000000001101)) (mask!30401 thiss!1427)))))) (and (bvslt res!694411 (bvadd (mask!30401 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!694411 #b00000000000000000000000000000000))))))

(assert (=> d!125929 (= (toIndex!0 key!909 (mask!30401 thiss!1427)) (bvand (bvxor lt!459159 (bvlshr lt!459159 #b00000000000000000000000000001101)) (mask!30401 thiss!1427)))))

(assert (=> d!125873 d!125929))

(assert (=> d!125873 d!125869))

(declare-fun d!125931 () Bool)

(assert (=> d!125931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65628 (store (arr!31572 (_keys!11599 thiss!1427)) (index!41612 lt!459039) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11599 thiss!1427))) (mask!30401 thiss!1427))))

(assert (=> d!125931 true))

(declare-fun _$44!30 () Unit!33927)

(assert (=> d!125931 (= (choose!25 (_keys!11599 thiss!1427) (index!41612 lt!459039) (mask!30401 thiss!1427)) _$44!30)))

(declare-fun bs!30449 () Bool)

(assert (= bs!30449 d!125931))

(assert (=> bs!30449 m!960705))

(assert (=> bs!30449 m!960815))

(assert (=> d!125863 d!125931))

(assert (=> d!125863 d!125869))

(declare-fun b!1042070 () Bool)

(declare-fun e!590247 () Bool)

(assert (=> b!1042070 (= e!590247 tp_is_empty!24769)))

(declare-fun mapIsEmpty!38765 () Bool)

(declare-fun mapRes!38765 () Bool)

(assert (=> mapIsEmpty!38765 mapRes!38765))

(declare-fun mapNonEmpty!38765 () Bool)

(declare-fun tp!74382 () Bool)

(assert (=> mapNonEmpty!38765 (= mapRes!38765 (and tp!74382 e!590247))))

(declare-fun mapKey!38765 () (_ BitVec 32))

(declare-fun mapValue!38765 () ValueCell!11681)

(declare-fun mapRest!38765 () (Array (_ BitVec 32) ValueCell!11681))

(assert (=> mapNonEmpty!38765 (= mapRest!38764 (store mapRest!38765 mapKey!38765 mapValue!38765))))

(declare-fun condMapEmpty!38765 () Bool)

(declare-fun mapDefault!38765 () ValueCell!11681)

(assert (=> mapNonEmpty!38764 (= condMapEmpty!38765 (= mapRest!38764 ((as const (Array (_ BitVec 32) ValueCell!11681)) mapDefault!38765)))))

(declare-fun e!590246 () Bool)

(assert (=> mapNonEmpty!38764 (= tp!74381 (and e!590246 mapRes!38765))))

(declare-fun b!1042071 () Bool)

(assert (=> b!1042071 (= e!590246 tp_is_empty!24769)))

(assert (= (and mapNonEmpty!38764 condMapEmpty!38765) mapIsEmpty!38765))

(assert (= (and mapNonEmpty!38764 (not condMapEmpty!38765)) mapNonEmpty!38765))

(assert (= (and mapNonEmpty!38765 ((_ is ValueCellFull!11681) mapValue!38765)) b!1042070))

(assert (= (and mapNonEmpty!38764 ((_ is ValueCellFull!11681) mapDefault!38765)) b!1042071))

(declare-fun m!960943 () Bool)

(assert (=> mapNonEmpty!38765 m!960943))

(check-sat (not b!1042013) (not d!125897) (not b!1042024) (not bm!44132) (not b!1042040) (not b!1042019) (not bm!44131) (not b!1042032) (not b!1041959) (not b!1042017) (not bm!44129) (not bm!44130) (not d!125915) (not d!125907) (not d!125905) (not b!1042027) (not d!125901) (not d!125891) (not bm!44133) (not b!1041985) (not d!125881) (not b!1041957) (not b!1041951) (not b!1042014) (not b!1042034) (not b!1042068) (not b!1042036) (not bm!44136) (not b!1042026) (not d!125927) (not bm!44137) (not b!1041981) (not b!1041955) (not b!1042021) tp_is_empty!24769 (not b!1041976) (not b!1042042) (not d!125931) (not d!125917) b_and!33555 (not b!1042000) (not b!1042031) (not bm!44134) (not b!1041949) (not b!1042029) (not b!1042022) (not mapNonEmpty!38765) (not bm!44135) (not b_next!21049) (not b!1041983))
(check-sat b_and!33555 (not b_next!21049))
