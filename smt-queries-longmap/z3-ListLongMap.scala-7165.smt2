; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91374 () Bool)

(assert start!91374)

(declare-fun b!1041657 () Bool)

(declare-fun b_free!21045 () Bool)

(declare-fun b_next!21045 () Bool)

(assert (=> b!1041657 (= b_free!21045 (not b_next!21045))))

(declare-fun tp!74350 () Bool)

(declare-fun b_and!33577 () Bool)

(assert (=> b!1041657 (= tp!74350 b_and!33577)))

(declare-fun mapIsEmpty!38745 () Bool)

(declare-fun mapRes!38745 () Bool)

(assert (=> mapIsEmpty!38745 mapRes!38745))

(declare-fun b!1041653 () Bool)

(declare-fun e!589948 () Bool)

(declare-fun tp_is_empty!24765 () Bool)

(assert (=> b!1041653 (= e!589948 tp_is_empty!24765)))

(declare-fun b!1041654 () Bool)

(declare-fun e!589945 () Bool)

(declare-fun e!589947 () Bool)

(assert (=> b!1041654 (= e!589945 (not e!589947))))

(declare-fun res!694227 () Bool)

(assert (=> b!1041654 (=> res!694227 e!589947)))

(declare-datatypes ((V!37893 0))(
  ( (V!37894 (val!12433 Int)) )
))
(declare-datatypes ((ValueCell!11679 0))(
  ( (ValueCellFull!11679 (v!15022 V!37893)) (EmptyCell!11679) )
))
(declare-datatypes ((array!65678 0))(
  ( (array!65679 (arr!31599 (Array (_ BitVec 32) (_ BitVec 64))) (size!32132 (_ BitVec 32))) )
))
(declare-datatypes ((array!65680 0))(
  ( (array!65681 (arr!31600 (Array (_ BitVec 32) ValueCell!11679)) (size!32133 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5952 0))(
  ( (LongMapFixedSize!5953 (defaultEntry!6358 Int) (mask!30393 (_ BitVec 32)) (extraKeys!6086 (_ BitVec 32)) (zeroValue!6192 V!37893) (minValue!6192 V!37893) (_size!3031 (_ BitVec 32)) (_keys!11596 array!65678) (_values!6381 array!65680) (_vacant!3031 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5952)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041654 (= res!694227 (not (validMask!0 (mask!30393 thiss!1427))))))

(declare-fun lt!459121 () array!65678)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041654 (not (arrayContainsKey!0 lt!459121 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9810 0))(
  ( (MissingZero!9810 (index!41611 (_ BitVec 32))) (Found!9810 (index!41612 (_ BitVec 32))) (Intermediate!9810 (undefined!10622 Bool) (index!41613 (_ BitVec 32)) (x!92996 (_ BitVec 32))) (Undefined!9810) (MissingVacant!9810 (index!41614 (_ BitVec 32))) )
))
(declare-fun lt!459119 () SeekEntryResult!9810)

(declare-datatypes ((Unit!34037 0))(
  ( (Unit!34038) )
))
(declare-fun lt!459122 () Unit!34037)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65678 (_ BitVec 32) (_ BitVec 64)) Unit!34037)

(assert (=> b!1041654 (= lt!459122 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11596 thiss!1427) (index!41612 lt!459119) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65678 (_ BitVec 32)) Bool)

(assert (=> b!1041654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459121 (mask!30393 thiss!1427))))

(declare-fun lt!459120 () Unit!34037)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65678 (_ BitVec 32) (_ BitVec 32)) Unit!34037)

(assert (=> b!1041654 (= lt!459120 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11596 thiss!1427) (index!41612 lt!459119) (mask!30393 thiss!1427)))))

(declare-datatypes ((List!21970 0))(
  ( (Nil!21967) (Cons!21966 (h!23172 (_ BitVec 64)) (t!31184 List!21970)) )
))
(declare-fun arrayNoDuplicates!0 (array!65678 (_ BitVec 32) List!21970) Bool)

(assert (=> b!1041654 (arrayNoDuplicates!0 lt!459121 #b00000000000000000000000000000000 Nil!21967)))

(declare-fun lt!459123 () Unit!34037)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65678 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21970) Unit!34037)

(assert (=> b!1041654 (= lt!459123 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11596 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41612 lt!459119) #b00000000000000000000000000000000 Nil!21967))))

(declare-fun arrayCountValidKeys!0 (array!65678 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041654 (= (arrayCountValidKeys!0 lt!459121 #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11596 thiss!1427) #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041654 (= lt!459121 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))))))

(declare-fun lt!459118 () Unit!34037)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65678 (_ BitVec 32) (_ BitVec 64)) Unit!34037)

(assert (=> b!1041654 (= lt!459118 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11596 thiss!1427) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1041655 () Bool)

(declare-fun e!589946 () Bool)

(declare-fun e!589950 () Bool)

(assert (=> b!1041655 (= e!589946 (and e!589950 mapRes!38745))))

(declare-fun condMapEmpty!38745 () Bool)

(declare-fun mapDefault!38745 () ValueCell!11679)

(assert (=> b!1041655 (= condMapEmpty!38745 (= (arr!31600 (_values!6381 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11679)) mapDefault!38745)))))

(declare-fun mapNonEmpty!38745 () Bool)

(declare-fun tp!74349 () Bool)

(assert (=> mapNonEmpty!38745 (= mapRes!38745 (and tp!74349 e!589948))))

(declare-fun mapKey!38745 () (_ BitVec 32))

(declare-fun mapValue!38745 () ValueCell!11679)

(declare-fun mapRest!38745 () (Array (_ BitVec 32) ValueCell!11679))

(assert (=> mapNonEmpty!38745 (= (arr!31600 (_values!6381 thiss!1427)) (store mapRest!38745 mapKey!38745 mapValue!38745))))

(declare-fun b!1041656 () Bool)

(declare-fun e!589949 () Bool)

(assert (=> b!1041656 (= e!589949 e!589945)))

(declare-fun res!694229 () Bool)

(assert (=> b!1041656 (=> (not res!694229) (not e!589945))))

(get-info :version)

(assert (=> b!1041656 (= res!694229 ((_ is Found!9810) lt!459119))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65678 (_ BitVec 32)) SeekEntryResult!9810)

(assert (=> b!1041656 (= lt!459119 (seekEntry!0 key!909 (_keys!11596 thiss!1427) (mask!30393 thiss!1427)))))

(declare-fun e!589952 () Bool)

(declare-fun array_inv!24415 (array!65678) Bool)

(declare-fun array_inv!24416 (array!65680) Bool)

(assert (=> b!1041657 (= e!589952 (and tp!74350 tp_is_empty!24765 (array_inv!24415 (_keys!11596 thiss!1427)) (array_inv!24416 (_values!6381 thiss!1427)) e!589946))))

(declare-fun b!1041658 () Bool)

(assert (=> b!1041658 (= e!589947 (or (not (= (size!32133 (_values!6381 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30393 thiss!1427)))) (not (= (size!32132 (_keys!11596 thiss!1427)) (size!32133 (_values!6381 thiss!1427)))) (bvslt (mask!30393 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!6086 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun res!694230 () Bool)

(assert (=> start!91374 (=> (not res!694230) (not e!589949))))

(declare-fun valid!2236 (LongMapFixedSize!5952) Bool)

(assert (=> start!91374 (= res!694230 (valid!2236 thiss!1427))))

(assert (=> start!91374 e!589949))

(assert (=> start!91374 e!589952))

(assert (=> start!91374 true))

(declare-fun b!1041659 () Bool)

(assert (=> b!1041659 (= e!589950 tp_is_empty!24765)))

(declare-fun b!1041660 () Bool)

(declare-fun res!694228 () Bool)

(assert (=> b!1041660 (=> (not res!694228) (not e!589949))))

(assert (=> b!1041660 (= res!694228 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91374 res!694230) b!1041660))

(assert (= (and b!1041660 res!694228) b!1041656))

(assert (= (and b!1041656 res!694229) b!1041654))

(assert (= (and b!1041654 (not res!694227)) b!1041658))

(assert (= (and b!1041655 condMapEmpty!38745) mapIsEmpty!38745))

(assert (= (and b!1041655 (not condMapEmpty!38745)) mapNonEmpty!38745))

(assert (= (and mapNonEmpty!38745 ((_ is ValueCellFull!11679) mapValue!38745)) b!1041653))

(assert (= (and b!1041655 ((_ is ValueCellFull!11679) mapDefault!38745)) b!1041659))

(assert (= b!1041657 b!1041655))

(assert (= start!91374 b!1041657))

(declare-fun m!961069 () Bool)

(assert (=> start!91374 m!961069))

(declare-fun m!961071 () Bool)

(assert (=> mapNonEmpty!38745 m!961071))

(declare-fun m!961073 () Bool)

(assert (=> b!1041654 m!961073))

(declare-fun m!961075 () Bool)

(assert (=> b!1041654 m!961075))

(declare-fun m!961077 () Bool)

(assert (=> b!1041654 m!961077))

(declare-fun m!961079 () Bool)

(assert (=> b!1041654 m!961079))

(declare-fun m!961081 () Bool)

(assert (=> b!1041654 m!961081))

(declare-fun m!961083 () Bool)

(assert (=> b!1041654 m!961083))

(declare-fun m!961085 () Bool)

(assert (=> b!1041654 m!961085))

(declare-fun m!961087 () Bool)

(assert (=> b!1041654 m!961087))

(declare-fun m!961089 () Bool)

(assert (=> b!1041654 m!961089))

(declare-fun m!961091 () Bool)

(assert (=> b!1041654 m!961091))

(declare-fun m!961093 () Bool)

(assert (=> b!1041654 m!961093))

(declare-fun m!961095 () Bool)

(assert (=> b!1041656 m!961095))

(declare-fun m!961097 () Bool)

(assert (=> b!1041657 m!961097))

(declare-fun m!961099 () Bool)

(assert (=> b!1041657 m!961099))

(check-sat (not mapNonEmpty!38745) (not start!91374) b_and!33577 (not b!1041657) (not b_next!21045) (not b!1041654) tp_is_empty!24765 (not b!1041656))
(check-sat b_and!33577 (not b_next!21045))
(get-model)

(declare-fun b!1041693 () Bool)

(declare-fun res!694254 () Bool)

(declare-fun e!589981 () Bool)

(assert (=> b!1041693 (=> (not res!694254) (not e!589981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041693 (= res!694254 (validKeyInArray!0 (select (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119))))))

(declare-fun d!125917 () Bool)

(declare-fun e!589982 () Bool)

(assert (=> d!125917 e!589982))

(declare-fun res!694253 () Bool)

(assert (=> d!125917 (=> (not res!694253) (not e!589982))))

(assert (=> d!125917 (= res!694253 (and (bvsge (index!41612 lt!459119) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459119) (size!32132 (_keys!11596 thiss!1427)))))))

(declare-fun lt!459144 () Unit!34037)

(declare-fun choose!82 (array!65678 (_ BitVec 32) (_ BitVec 64)) Unit!34037)

(assert (=> d!125917 (= lt!459144 (choose!82 (_keys!11596 thiss!1427) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125917 e!589981))

(declare-fun res!694251 () Bool)

(assert (=> d!125917 (=> (not res!694251) (not e!589981))))

(assert (=> d!125917 (= res!694251 (and (bvsge (index!41612 lt!459119) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459119) (size!32132 (_keys!11596 thiss!1427)))))))

(assert (=> d!125917 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11596 thiss!1427) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459144)))

(declare-fun b!1041695 () Bool)

(assert (=> b!1041695 (= e!589981 (bvslt (size!32132 (_keys!11596 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1041694 () Bool)

(declare-fun res!694252 () Bool)

(assert (=> b!1041694 (=> (not res!694252) (not e!589981))))

(assert (=> b!1041694 (= res!694252 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041696 () Bool)

(assert (=> b!1041696 (= e!589982 (= (arrayCountValidKeys!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11596 thiss!1427) #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!125917 res!694251) b!1041693))

(assert (= (and b!1041693 res!694254) b!1041694))

(assert (= (and b!1041694 res!694252) b!1041695))

(assert (= (and d!125917 res!694253) b!1041696))

(declare-fun m!961133 () Bool)

(assert (=> b!1041693 m!961133))

(assert (=> b!1041693 m!961133))

(declare-fun m!961135 () Bool)

(assert (=> b!1041693 m!961135))

(declare-fun m!961137 () Bool)

(assert (=> d!125917 m!961137))

(declare-fun m!961139 () Bool)

(assert (=> b!1041694 m!961139))

(assert (=> b!1041696 m!961089))

(declare-fun m!961141 () Bool)

(assert (=> b!1041696 m!961141))

(assert (=> b!1041696 m!961081))

(assert (=> b!1041654 d!125917))

(declare-fun b!1041705 () Bool)

(declare-fun e!589987 () (_ BitVec 32))

(declare-fun call!44128 () (_ BitVec 32))

(assert (=> b!1041705 (= e!589987 (bvadd #b00000000000000000000000000000001 call!44128))))

(declare-fun b!1041706 () Bool)

(declare-fun e!589988 () (_ BitVec 32))

(assert (=> b!1041706 (= e!589988 #b00000000000000000000000000000000)))

(declare-fun b!1041707 () Bool)

(assert (=> b!1041707 (= e!589987 call!44128)))

(declare-fun bm!44125 () Bool)

(assert (=> bm!44125 (= call!44128 (arrayCountValidKeys!0 lt!459121 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))))))

(declare-fun b!1041708 () Bool)

(assert (=> b!1041708 (= e!589988 e!589987)))

(declare-fun c!105689 () Bool)

(assert (=> b!1041708 (= c!105689 (validKeyInArray!0 (select (arr!31599 lt!459121) #b00000000000000000000000000000000)))))

(declare-fun d!125919 () Bool)

(declare-fun lt!459147 () (_ BitVec 32))

(assert (=> d!125919 (and (bvsge lt!459147 #b00000000000000000000000000000000) (bvsle lt!459147 (bvsub (size!32132 lt!459121) #b00000000000000000000000000000000)))))

(assert (=> d!125919 (= lt!459147 e!589988)))

(declare-fun c!105690 () Bool)

(assert (=> d!125919 (= c!105690 (bvsge #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))))))

(assert (=> d!125919 (and (bvsle #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32132 (_keys!11596 thiss!1427)) (size!32132 lt!459121)))))

(assert (=> d!125919 (= (arrayCountValidKeys!0 lt!459121 #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) lt!459147)))

(assert (= (and d!125919 c!105690) b!1041706))

(assert (= (and d!125919 (not c!105690)) b!1041708))

(assert (= (and b!1041708 c!105689) b!1041705))

(assert (= (and b!1041708 (not c!105689)) b!1041707))

(assert (= (or b!1041705 b!1041707) bm!44125))

(declare-fun m!961143 () Bool)

(assert (=> bm!44125 m!961143))

(declare-fun m!961145 () Bool)

(assert (=> b!1041708 m!961145))

(assert (=> b!1041708 m!961145))

(declare-fun m!961147 () Bool)

(assert (=> b!1041708 m!961147))

(assert (=> b!1041654 d!125919))

(declare-fun d!125921 () Bool)

(assert (=> d!125921 (= (validMask!0 (mask!30393 thiss!1427)) (and (or (= (mask!30393 thiss!1427) #b00000000000000000000000000000111) (= (mask!30393 thiss!1427) #b00000000000000000000000000001111) (= (mask!30393 thiss!1427) #b00000000000000000000000000011111) (= (mask!30393 thiss!1427) #b00000000000000000000000000111111) (= (mask!30393 thiss!1427) #b00000000000000000000000001111111) (= (mask!30393 thiss!1427) #b00000000000000000000000011111111) (= (mask!30393 thiss!1427) #b00000000000000000000000111111111) (= (mask!30393 thiss!1427) #b00000000000000000000001111111111) (= (mask!30393 thiss!1427) #b00000000000000000000011111111111) (= (mask!30393 thiss!1427) #b00000000000000000000111111111111) (= (mask!30393 thiss!1427) #b00000000000000000001111111111111) (= (mask!30393 thiss!1427) #b00000000000000000011111111111111) (= (mask!30393 thiss!1427) #b00000000000000000111111111111111) (= (mask!30393 thiss!1427) #b00000000000000001111111111111111) (= (mask!30393 thiss!1427) #b00000000000000011111111111111111) (= (mask!30393 thiss!1427) #b00000000000000111111111111111111) (= (mask!30393 thiss!1427) #b00000000000001111111111111111111) (= (mask!30393 thiss!1427) #b00000000000011111111111111111111) (= (mask!30393 thiss!1427) #b00000000000111111111111111111111) (= (mask!30393 thiss!1427) #b00000000001111111111111111111111) (= (mask!30393 thiss!1427) #b00000000011111111111111111111111) (= (mask!30393 thiss!1427) #b00000000111111111111111111111111) (= (mask!30393 thiss!1427) #b00000001111111111111111111111111) (= (mask!30393 thiss!1427) #b00000011111111111111111111111111) (= (mask!30393 thiss!1427) #b00000111111111111111111111111111) (= (mask!30393 thiss!1427) #b00001111111111111111111111111111) (= (mask!30393 thiss!1427) #b00011111111111111111111111111111) (= (mask!30393 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30393 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1041654 d!125921))

(declare-fun d!125923 () Bool)

(declare-fun res!694259 () Bool)

(declare-fun e!589993 () Bool)

(assert (=> d!125923 (=> res!694259 e!589993)))

(assert (=> d!125923 (= res!694259 (= (select (arr!31599 lt!459121) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125923 (= (arrayContainsKey!0 lt!459121 key!909 #b00000000000000000000000000000000) e!589993)))

(declare-fun b!1041713 () Bool)

(declare-fun e!589994 () Bool)

(assert (=> b!1041713 (= e!589993 e!589994)))

(declare-fun res!694260 () Bool)

(assert (=> b!1041713 (=> (not res!694260) (not e!589994))))

(assert (=> b!1041713 (= res!694260 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 lt!459121)))))

(declare-fun b!1041714 () Bool)

(assert (=> b!1041714 (= e!589994 (arrayContainsKey!0 lt!459121 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125923 (not res!694259)) b!1041713))

(assert (= (and b!1041713 res!694260) b!1041714))

(assert (=> d!125923 m!961145))

(declare-fun m!961149 () Bool)

(assert (=> b!1041714 m!961149))

(assert (=> b!1041654 d!125923))

(declare-fun b!1041725 () Bool)

(declare-fun e!590003 () Bool)

(declare-fun call!44131 () Bool)

(assert (=> b!1041725 (= e!590003 call!44131)))

(declare-fun bm!44128 () Bool)

(declare-fun c!105693 () Bool)

(assert (=> bm!44128 (= call!44131 (arrayNoDuplicates!0 lt!459121 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105693 (Cons!21966 (select (arr!31599 lt!459121) #b00000000000000000000000000000000) Nil!21967) Nil!21967)))))

(declare-fun b!1041726 () Bool)

(declare-fun e!590006 () Bool)

(declare-fun contains!6055 (List!21970 (_ BitVec 64)) Bool)

(assert (=> b!1041726 (= e!590006 (contains!6055 Nil!21967 (select (arr!31599 lt!459121) #b00000000000000000000000000000000)))))

(declare-fun b!1041727 () Bool)

(declare-fun e!590005 () Bool)

(assert (=> b!1041727 (= e!590005 e!590003)))

(assert (=> b!1041727 (= c!105693 (validKeyInArray!0 (select (arr!31599 lt!459121) #b00000000000000000000000000000000)))))

(declare-fun d!125925 () Bool)

(declare-fun res!694269 () Bool)

(declare-fun e!590004 () Bool)

(assert (=> d!125925 (=> res!694269 e!590004)))

(assert (=> d!125925 (= res!694269 (bvsge #b00000000000000000000000000000000 (size!32132 lt!459121)))))

(assert (=> d!125925 (= (arrayNoDuplicates!0 lt!459121 #b00000000000000000000000000000000 Nil!21967) e!590004)))

(declare-fun b!1041728 () Bool)

(assert (=> b!1041728 (= e!590004 e!590005)))

(declare-fun res!694268 () Bool)

(assert (=> b!1041728 (=> (not res!694268) (not e!590005))))

(assert (=> b!1041728 (= res!694268 (not e!590006))))

(declare-fun res!694267 () Bool)

(assert (=> b!1041728 (=> (not res!694267) (not e!590006))))

(assert (=> b!1041728 (= res!694267 (validKeyInArray!0 (select (arr!31599 lt!459121) #b00000000000000000000000000000000)))))

(declare-fun b!1041729 () Bool)

(assert (=> b!1041729 (= e!590003 call!44131)))

(assert (= (and d!125925 (not res!694269)) b!1041728))

(assert (= (and b!1041728 res!694267) b!1041726))

(assert (= (and b!1041728 res!694268) b!1041727))

(assert (= (and b!1041727 c!105693) b!1041729))

(assert (= (and b!1041727 (not c!105693)) b!1041725))

(assert (= (or b!1041729 b!1041725) bm!44128))

(assert (=> bm!44128 m!961145))

(declare-fun m!961151 () Bool)

(assert (=> bm!44128 m!961151))

(assert (=> b!1041726 m!961145))

(assert (=> b!1041726 m!961145))

(declare-fun m!961153 () Bool)

(assert (=> b!1041726 m!961153))

(assert (=> b!1041727 m!961145))

(assert (=> b!1041727 m!961145))

(assert (=> b!1041727 m!961147))

(assert (=> b!1041728 m!961145))

(assert (=> b!1041728 m!961145))

(assert (=> b!1041728 m!961147))

(assert (=> b!1041654 d!125925))

(declare-fun b!1041730 () Bool)

(declare-fun e!590007 () (_ BitVec 32))

(declare-fun call!44132 () (_ BitVec 32))

(assert (=> b!1041730 (= e!590007 (bvadd #b00000000000000000000000000000001 call!44132))))

(declare-fun b!1041731 () Bool)

(declare-fun e!590008 () (_ BitVec 32))

(assert (=> b!1041731 (= e!590008 #b00000000000000000000000000000000)))

(declare-fun b!1041732 () Bool)

(assert (=> b!1041732 (= e!590007 call!44132)))

(declare-fun bm!44129 () Bool)

(assert (=> bm!44129 (= call!44132 (arrayCountValidKeys!0 (_keys!11596 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))))))

(declare-fun b!1041733 () Bool)

(assert (=> b!1041733 (= e!590008 e!590007)))

(declare-fun c!105694 () Bool)

(assert (=> b!1041733 (= c!105694 (validKeyInArray!0 (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125927 () Bool)

(declare-fun lt!459148 () (_ BitVec 32))

(assert (=> d!125927 (and (bvsge lt!459148 #b00000000000000000000000000000000) (bvsle lt!459148 (bvsub (size!32132 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125927 (= lt!459148 e!590008)))

(declare-fun c!105695 () Bool)

(assert (=> d!125927 (= c!105695 (bvsge #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))))))

(assert (=> d!125927 (and (bvsle #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32132 (_keys!11596 thiss!1427)) (size!32132 (_keys!11596 thiss!1427))))))

(assert (=> d!125927 (= (arrayCountValidKeys!0 (_keys!11596 thiss!1427) #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) lt!459148)))

(assert (= (and d!125927 c!105695) b!1041731))

(assert (= (and d!125927 (not c!105695)) b!1041733))

(assert (= (and b!1041733 c!105694) b!1041730))

(assert (= (and b!1041733 (not c!105694)) b!1041732))

(assert (= (or b!1041730 b!1041732) bm!44129))

(declare-fun m!961155 () Bool)

(assert (=> bm!44129 m!961155))

(declare-fun m!961157 () Bool)

(assert (=> b!1041733 m!961157))

(assert (=> b!1041733 m!961157))

(declare-fun m!961159 () Bool)

(assert (=> b!1041733 m!961159))

(assert (=> b!1041654 d!125927))

(declare-fun d!125929 () Bool)

(declare-fun e!590011 () Bool)

(assert (=> d!125929 e!590011))

(declare-fun res!694272 () Bool)

(assert (=> d!125929 (=> (not res!694272) (not e!590011))))

(assert (=> d!125929 (= res!694272 (and (bvsge (index!41612 lt!459119) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459119) (size!32132 (_keys!11596 thiss!1427)))))))

(declare-fun lt!459151 () Unit!34037)

(declare-fun choose!25 (array!65678 (_ BitVec 32) (_ BitVec 32)) Unit!34037)

(assert (=> d!125929 (= lt!459151 (choose!25 (_keys!11596 thiss!1427) (index!41612 lt!459119) (mask!30393 thiss!1427)))))

(assert (=> d!125929 (validMask!0 (mask!30393 thiss!1427))))

(assert (=> d!125929 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11596 thiss!1427) (index!41612 lt!459119) (mask!30393 thiss!1427)) lt!459151)))

(declare-fun b!1041736 () Bool)

(assert (=> b!1041736 (= e!590011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) (mask!30393 thiss!1427)))))

(assert (= (and d!125929 res!694272) b!1041736))

(declare-fun m!961161 () Bool)

(assert (=> d!125929 m!961161))

(assert (=> d!125929 m!961091))

(assert (=> b!1041736 m!961089))

(declare-fun m!961163 () Bool)

(assert (=> b!1041736 m!961163))

(assert (=> b!1041654 d!125929))

(declare-fun d!125931 () Bool)

(declare-fun res!694278 () Bool)

(declare-fun e!590020 () Bool)

(assert (=> d!125931 (=> res!694278 e!590020)))

(assert (=> d!125931 (= res!694278 (bvsge #b00000000000000000000000000000000 (size!32132 lt!459121)))))

(assert (=> d!125931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459121 (mask!30393 thiss!1427)) e!590020)))

(declare-fun b!1041745 () Bool)

(declare-fun e!590018 () Bool)

(declare-fun call!44135 () Bool)

(assert (=> b!1041745 (= e!590018 call!44135)))

(declare-fun b!1041746 () Bool)

(assert (=> b!1041746 (= e!590020 e!590018)))

(declare-fun c!105698 () Bool)

(assert (=> b!1041746 (= c!105698 (validKeyInArray!0 (select (arr!31599 lt!459121) #b00000000000000000000000000000000)))))

(declare-fun b!1041747 () Bool)

(declare-fun e!590019 () Bool)

(assert (=> b!1041747 (= e!590019 call!44135)))

(declare-fun bm!44132 () Bool)

(assert (=> bm!44132 (= call!44135 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459121 (mask!30393 thiss!1427)))))

(declare-fun b!1041748 () Bool)

(assert (=> b!1041748 (= e!590018 e!590019)))

(declare-fun lt!459158 () (_ BitVec 64))

(assert (=> b!1041748 (= lt!459158 (select (arr!31599 lt!459121) #b00000000000000000000000000000000))))

(declare-fun lt!459160 () Unit!34037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65678 (_ BitVec 64) (_ BitVec 32)) Unit!34037)

(assert (=> b!1041748 (= lt!459160 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459121 lt!459158 #b00000000000000000000000000000000))))

(assert (=> b!1041748 (arrayContainsKey!0 lt!459121 lt!459158 #b00000000000000000000000000000000)))

(declare-fun lt!459159 () Unit!34037)

(assert (=> b!1041748 (= lt!459159 lt!459160)))

(declare-fun res!694277 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65678 (_ BitVec 32)) SeekEntryResult!9810)

(assert (=> b!1041748 (= res!694277 (= (seekEntryOrOpen!0 (select (arr!31599 lt!459121) #b00000000000000000000000000000000) lt!459121 (mask!30393 thiss!1427)) (Found!9810 #b00000000000000000000000000000000)))))

(assert (=> b!1041748 (=> (not res!694277) (not e!590019))))

(assert (= (and d!125931 (not res!694278)) b!1041746))

(assert (= (and b!1041746 c!105698) b!1041748))

(assert (= (and b!1041746 (not c!105698)) b!1041745))

(assert (= (and b!1041748 res!694277) b!1041747))

(assert (= (or b!1041747 b!1041745) bm!44132))

(assert (=> b!1041746 m!961145))

(assert (=> b!1041746 m!961145))

(assert (=> b!1041746 m!961147))

(declare-fun m!961165 () Bool)

(assert (=> bm!44132 m!961165))

(assert (=> b!1041748 m!961145))

(declare-fun m!961167 () Bool)

(assert (=> b!1041748 m!961167))

(declare-fun m!961169 () Bool)

(assert (=> b!1041748 m!961169))

(assert (=> b!1041748 m!961145))

(declare-fun m!961171 () Bool)

(assert (=> b!1041748 m!961171))

(assert (=> b!1041654 d!125931))

(declare-fun d!125933 () Bool)

(declare-fun e!590023 () Bool)

(assert (=> d!125933 e!590023))

(declare-fun res!694281 () Bool)

(assert (=> d!125933 (=> (not res!694281) (not e!590023))))

(assert (=> d!125933 (= res!694281 (bvslt (index!41612 lt!459119) (size!32132 (_keys!11596 thiss!1427))))))

(declare-fun lt!459163 () Unit!34037)

(declare-fun choose!121 (array!65678 (_ BitVec 32) (_ BitVec 64)) Unit!34037)

(assert (=> d!125933 (= lt!459163 (choose!121 (_keys!11596 thiss!1427) (index!41612 lt!459119) key!909))))

(assert (=> d!125933 (bvsge (index!41612 lt!459119) #b00000000000000000000000000000000)))

(assert (=> d!125933 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11596 thiss!1427) (index!41612 lt!459119) key!909) lt!459163)))

(declare-fun b!1041751 () Bool)

(assert (=> b!1041751 (= e!590023 (not (arrayContainsKey!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125933 res!694281) b!1041751))

(declare-fun m!961173 () Bool)

(assert (=> d!125933 m!961173))

(assert (=> b!1041751 m!961089))

(declare-fun m!961175 () Bool)

(assert (=> b!1041751 m!961175))

(assert (=> b!1041654 d!125933))

(declare-fun d!125935 () Bool)

(declare-fun e!590026 () Bool)

(assert (=> d!125935 e!590026))

(declare-fun res!694284 () Bool)

(assert (=> d!125935 (=> (not res!694284) (not e!590026))))

(assert (=> d!125935 (= res!694284 (and (bvsge (index!41612 lt!459119) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459119) (size!32132 (_keys!11596 thiss!1427)))))))

(declare-fun lt!459166 () Unit!34037)

(declare-fun choose!53 (array!65678 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21970) Unit!34037)

(assert (=> d!125935 (= lt!459166 (choose!53 (_keys!11596 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41612 lt!459119) #b00000000000000000000000000000000 Nil!21967))))

(assert (=> d!125935 (bvslt (size!32132 (_keys!11596 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125935 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11596 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41612 lt!459119) #b00000000000000000000000000000000 Nil!21967) lt!459166)))

(declare-fun b!1041754 () Bool)

(assert (=> b!1041754 (= e!590026 (arrayNoDuplicates!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) #b00000000000000000000000000000000 Nil!21967))))

(assert (= (and d!125935 res!694284) b!1041754))

(declare-fun m!961177 () Bool)

(assert (=> d!125935 m!961177))

(assert (=> b!1041754 m!961089))

(declare-fun m!961179 () Bool)

(assert (=> b!1041754 m!961179))

(assert (=> b!1041654 d!125935))

(declare-fun b!1041767 () Bool)

(declare-fun e!590033 () SeekEntryResult!9810)

(declare-fun lt!459177 () SeekEntryResult!9810)

(assert (=> b!1041767 (= e!590033 (MissingZero!9810 (index!41613 lt!459177)))))

(declare-fun b!1041768 () Bool)

(declare-fun e!590034 () SeekEntryResult!9810)

(declare-fun e!590035 () SeekEntryResult!9810)

(assert (=> b!1041768 (= e!590034 e!590035)))

(declare-fun lt!459176 () (_ BitVec 64))

(assert (=> b!1041768 (= lt!459176 (select (arr!31599 (_keys!11596 thiss!1427)) (index!41613 lt!459177)))))

(declare-fun c!105707 () Bool)

(assert (=> b!1041768 (= c!105707 (= lt!459176 key!909))))

(declare-fun b!1041769 () Bool)

(declare-fun c!105706 () Bool)

(assert (=> b!1041769 (= c!105706 (= lt!459176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041769 (= e!590035 e!590033)))

(declare-fun b!1041770 () Bool)

(declare-fun lt!459178 () SeekEntryResult!9810)

(assert (=> b!1041770 (= e!590033 (ite ((_ is MissingVacant!9810) lt!459178) (MissingZero!9810 (index!41614 lt!459178)) lt!459178))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65678 (_ BitVec 32)) SeekEntryResult!9810)

(assert (=> b!1041770 (= lt!459178 (seekKeyOrZeroReturnVacant!0 (x!92996 lt!459177) (index!41613 lt!459177) (index!41613 lt!459177) key!909 (_keys!11596 thiss!1427) (mask!30393 thiss!1427)))))

(declare-fun b!1041772 () Bool)

(assert (=> b!1041772 (= e!590034 Undefined!9810)))

(declare-fun b!1041771 () Bool)

(assert (=> b!1041771 (= e!590035 (Found!9810 (index!41613 lt!459177)))))

(declare-fun d!125937 () Bool)

(declare-fun lt!459175 () SeekEntryResult!9810)

(assert (=> d!125937 (and (or ((_ is MissingVacant!9810) lt!459175) (not ((_ is Found!9810) lt!459175)) (and (bvsge (index!41612 lt!459175) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459175) (size!32132 (_keys!11596 thiss!1427))))) (not ((_ is MissingVacant!9810) lt!459175)) (or (not ((_ is Found!9810) lt!459175)) (= (select (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459175)) key!909)))))

(assert (=> d!125937 (= lt!459175 e!590034)))

(declare-fun c!105705 () Bool)

(assert (=> d!125937 (= c!105705 (and ((_ is Intermediate!9810) lt!459177) (undefined!10622 lt!459177)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65678 (_ BitVec 32)) SeekEntryResult!9810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125937 (= lt!459177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30393 thiss!1427)) key!909 (_keys!11596 thiss!1427) (mask!30393 thiss!1427)))))

(assert (=> d!125937 (validMask!0 (mask!30393 thiss!1427))))

(assert (=> d!125937 (= (seekEntry!0 key!909 (_keys!11596 thiss!1427) (mask!30393 thiss!1427)) lt!459175)))

(assert (= (and d!125937 c!105705) b!1041772))

(assert (= (and d!125937 (not c!105705)) b!1041768))

(assert (= (and b!1041768 c!105707) b!1041771))

(assert (= (and b!1041768 (not c!105707)) b!1041769))

(assert (= (and b!1041769 c!105706) b!1041767))

(assert (= (and b!1041769 (not c!105706)) b!1041770))

(declare-fun m!961181 () Bool)

(assert (=> b!1041768 m!961181))

(declare-fun m!961183 () Bool)

(assert (=> b!1041770 m!961183))

(declare-fun m!961185 () Bool)

(assert (=> d!125937 m!961185))

(declare-fun m!961187 () Bool)

(assert (=> d!125937 m!961187))

(assert (=> d!125937 m!961187))

(declare-fun m!961189 () Bool)

(assert (=> d!125937 m!961189))

(assert (=> d!125937 m!961091))

(assert (=> b!1041656 d!125937))

(declare-fun d!125939 () Bool)

(declare-fun res!694291 () Bool)

(declare-fun e!590038 () Bool)

(assert (=> d!125939 (=> (not res!694291) (not e!590038))))

(declare-fun simpleValid!439 (LongMapFixedSize!5952) Bool)

(assert (=> d!125939 (= res!694291 (simpleValid!439 thiss!1427))))

(assert (=> d!125939 (= (valid!2236 thiss!1427) e!590038)))

(declare-fun b!1041779 () Bool)

(declare-fun res!694292 () Bool)

(assert (=> b!1041779 (=> (not res!694292) (not e!590038))))

(assert (=> b!1041779 (= res!694292 (= (arrayCountValidKeys!0 (_keys!11596 thiss!1427) #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) (_size!3031 thiss!1427)))))

(declare-fun b!1041780 () Bool)

(declare-fun res!694293 () Bool)

(assert (=> b!1041780 (=> (not res!694293) (not e!590038))))

(assert (=> b!1041780 (= res!694293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11596 thiss!1427) (mask!30393 thiss!1427)))))

(declare-fun b!1041781 () Bool)

(assert (=> b!1041781 (= e!590038 (arrayNoDuplicates!0 (_keys!11596 thiss!1427) #b00000000000000000000000000000000 Nil!21967))))

(assert (= (and d!125939 res!694291) b!1041779))

(assert (= (and b!1041779 res!694292) b!1041780))

(assert (= (and b!1041780 res!694293) b!1041781))

(declare-fun m!961191 () Bool)

(assert (=> d!125939 m!961191))

(assert (=> b!1041779 m!961081))

(declare-fun m!961193 () Bool)

(assert (=> b!1041780 m!961193))

(declare-fun m!961195 () Bool)

(assert (=> b!1041781 m!961195))

(assert (=> start!91374 d!125939))

(declare-fun d!125941 () Bool)

(assert (=> d!125941 (= (array_inv!24415 (_keys!11596 thiss!1427)) (bvsge (size!32132 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041657 d!125941))

(declare-fun d!125943 () Bool)

(assert (=> d!125943 (= (array_inv!24416 (_values!6381 thiss!1427)) (bvsge (size!32133 (_values!6381 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041657 d!125943))

(declare-fun b!1041788 () Bool)

(declare-fun e!590043 () Bool)

(assert (=> b!1041788 (= e!590043 tp_is_empty!24765)))

(declare-fun mapNonEmpty!38751 () Bool)

(declare-fun mapRes!38751 () Bool)

(declare-fun tp!74359 () Bool)

(assert (=> mapNonEmpty!38751 (= mapRes!38751 (and tp!74359 e!590043))))

(declare-fun mapKey!38751 () (_ BitVec 32))

(declare-fun mapValue!38751 () ValueCell!11679)

(declare-fun mapRest!38751 () (Array (_ BitVec 32) ValueCell!11679))

(assert (=> mapNonEmpty!38751 (= mapRest!38745 (store mapRest!38751 mapKey!38751 mapValue!38751))))

(declare-fun condMapEmpty!38751 () Bool)

(declare-fun mapDefault!38751 () ValueCell!11679)

(assert (=> mapNonEmpty!38745 (= condMapEmpty!38751 (= mapRest!38745 ((as const (Array (_ BitVec 32) ValueCell!11679)) mapDefault!38751)))))

(declare-fun e!590044 () Bool)

(assert (=> mapNonEmpty!38745 (= tp!74349 (and e!590044 mapRes!38751))))

(declare-fun mapIsEmpty!38751 () Bool)

(assert (=> mapIsEmpty!38751 mapRes!38751))

(declare-fun b!1041789 () Bool)

(assert (=> b!1041789 (= e!590044 tp_is_empty!24765)))

(assert (= (and mapNonEmpty!38745 condMapEmpty!38751) mapIsEmpty!38751))

(assert (= (and mapNonEmpty!38745 (not condMapEmpty!38751)) mapNonEmpty!38751))

(assert (= (and mapNonEmpty!38751 ((_ is ValueCellFull!11679) mapValue!38751)) b!1041788))

(assert (= (and mapNonEmpty!38745 ((_ is ValueCellFull!11679) mapDefault!38751)) b!1041789))

(declare-fun m!961197 () Bool)

(assert (=> mapNonEmpty!38751 m!961197))

(check-sat (not bm!44128) (not b!1041696) (not b!1041751) (not b!1041693) (not d!125917) (not mapNonEmpty!38751) (not b!1041736) (not b!1041726) (not d!125935) b_and!33577 (not d!125939) (not b!1041780) (not b!1041714) (not b!1041770) (not b!1041728) (not b!1041727) (not bm!44125) (not b!1041708) (not d!125929) (not b_next!21045) (not b!1041754) (not b!1041781) (not b!1041694) (not bm!44132) tp_is_empty!24765 (not b!1041748) (not b!1041779) (not b!1041733) (not b!1041746) (not d!125937) (not d!125933) (not bm!44129))
(check-sat b_and!33577 (not b_next!21045))
(get-model)

(declare-fun d!125945 () Bool)

(assert (=> d!125945 (arrayNoDuplicates!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) #b00000000000000000000000000000000 Nil!21967)))

(assert (=> d!125945 true))

(declare-fun _$66!53 () Unit!34037)

(assert (=> d!125945 (= (choose!53 (_keys!11596 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41612 lt!459119) #b00000000000000000000000000000000 Nil!21967) _$66!53)))

(declare-fun bs!30466 () Bool)

(assert (= bs!30466 d!125945))

(assert (=> bs!30466 m!961089))

(assert (=> bs!30466 m!961179))

(assert (=> d!125935 d!125945))

(declare-fun d!125947 () Bool)

(assert (=> d!125947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) (mask!30393 thiss!1427))))

(assert (=> d!125947 true))

(declare-fun _$44!27 () Unit!34037)

(assert (=> d!125947 (= (choose!25 (_keys!11596 thiss!1427) (index!41612 lt!459119) (mask!30393 thiss!1427)) _$44!27)))

(declare-fun bs!30467 () Bool)

(assert (= bs!30467 d!125947))

(assert (=> bs!30467 m!961089))

(assert (=> bs!30467 m!961163))

(assert (=> d!125929 d!125947))

(assert (=> d!125929 d!125921))

(declare-fun b!1041790 () Bool)

(declare-fun e!590045 () Bool)

(declare-fun call!44136 () Bool)

(assert (=> b!1041790 (= e!590045 call!44136)))

(declare-fun c!105708 () Bool)

(declare-fun bm!44133 () Bool)

(assert (=> bm!44133 (= call!44136 (arrayNoDuplicates!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105708 (Cons!21966 (select (arr!31599 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427)))) #b00000000000000000000000000000000) Nil!21967) Nil!21967)))))

(declare-fun b!1041791 () Bool)

(declare-fun e!590048 () Bool)

(assert (=> b!1041791 (= e!590048 (contains!6055 Nil!21967 (select (arr!31599 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1041792 () Bool)

(declare-fun e!590047 () Bool)

(assert (=> b!1041792 (= e!590047 e!590045)))

(assert (=> b!1041792 (= c!105708 (validKeyInArray!0 (select (arr!31599 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125949 () Bool)

(declare-fun res!694296 () Bool)

(declare-fun e!590046 () Bool)

(assert (=> d!125949 (=> res!694296 e!590046)))

(assert (=> d!125949 (= res!694296 (bvsge #b00000000000000000000000000000000 (size!32132 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))))))))

(assert (=> d!125949 (= (arrayNoDuplicates!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) #b00000000000000000000000000000000 Nil!21967) e!590046)))

(declare-fun b!1041793 () Bool)

(assert (=> b!1041793 (= e!590046 e!590047)))

(declare-fun res!694295 () Bool)

(assert (=> b!1041793 (=> (not res!694295) (not e!590047))))

(assert (=> b!1041793 (= res!694295 (not e!590048))))

(declare-fun res!694294 () Bool)

(assert (=> b!1041793 (=> (not res!694294) (not e!590048))))

(assert (=> b!1041793 (= res!694294 (validKeyInArray!0 (select (arr!31599 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1041794 () Bool)

(assert (=> b!1041794 (= e!590045 call!44136)))

(assert (= (and d!125949 (not res!694296)) b!1041793))

(assert (= (and b!1041793 res!694294) b!1041791))

(assert (= (and b!1041793 res!694295) b!1041792))

(assert (= (and b!1041792 c!105708) b!1041794))

(assert (= (and b!1041792 (not c!105708)) b!1041790))

(assert (= (or b!1041794 b!1041790) bm!44133))

(declare-fun m!961199 () Bool)

(assert (=> bm!44133 m!961199))

(declare-fun m!961201 () Bool)

(assert (=> bm!44133 m!961201))

(assert (=> b!1041791 m!961199))

(assert (=> b!1041791 m!961199))

(declare-fun m!961203 () Bool)

(assert (=> b!1041791 m!961203))

(assert (=> b!1041792 m!961199))

(assert (=> b!1041792 m!961199))

(declare-fun m!961205 () Bool)

(assert (=> b!1041792 m!961205))

(assert (=> b!1041793 m!961199))

(assert (=> b!1041793 m!961199))

(assert (=> b!1041793 m!961205))

(assert (=> b!1041754 d!125949))

(declare-fun d!125951 () Bool)

(assert (=> d!125951 (not (arrayContainsKey!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!125951 true))

(declare-fun _$59!29 () Unit!34037)

(assert (=> d!125951 (= (choose!121 (_keys!11596 thiss!1427) (index!41612 lt!459119) key!909) _$59!29)))

(declare-fun bs!30468 () Bool)

(assert (= bs!30468 d!125951))

(assert (=> bs!30468 m!961089))

(assert (=> bs!30468 m!961175))

(assert (=> d!125933 d!125951))

(declare-fun d!125953 () Bool)

(assert (=> d!125953 (= (validKeyInArray!0 (select (arr!31599 lt!459121) #b00000000000000000000000000000000)) (and (not (= (select (arr!31599 lt!459121) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31599 lt!459121) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041746 d!125953))

(declare-fun d!125955 () Bool)

(declare-fun res!694297 () Bool)

(declare-fun e!590049 () Bool)

(assert (=> d!125955 (=> res!694297 e!590049)))

(assert (=> d!125955 (= res!694297 (= (select (arr!31599 lt!459121) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!125955 (= (arrayContainsKey!0 lt!459121 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!590049)))

(declare-fun b!1041795 () Bool)

(declare-fun e!590050 () Bool)

(assert (=> b!1041795 (= e!590049 e!590050)))

(declare-fun res!694298 () Bool)

(assert (=> b!1041795 (=> (not res!694298) (not e!590050))))

(assert (=> b!1041795 (= res!694298 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32132 lt!459121)))))

(declare-fun b!1041796 () Bool)

(assert (=> b!1041796 (= e!590050 (arrayContainsKey!0 lt!459121 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!125955 (not res!694297)) b!1041795))

(assert (= (and b!1041795 res!694298) b!1041796))

(declare-fun m!961207 () Bool)

(assert (=> d!125955 m!961207))

(declare-fun m!961209 () Bool)

(assert (=> b!1041796 m!961209))

(assert (=> b!1041714 d!125955))

(declare-fun d!125957 () Bool)

(declare-fun res!694300 () Bool)

(declare-fun e!590053 () Bool)

(assert (=> d!125957 (=> res!694300 e!590053)))

(assert (=> d!125957 (= res!694300 (bvsge #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))))))

(assert (=> d!125957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11596 thiss!1427) (mask!30393 thiss!1427)) e!590053)))

(declare-fun b!1041797 () Bool)

(declare-fun e!590051 () Bool)

(declare-fun call!44137 () Bool)

(assert (=> b!1041797 (= e!590051 call!44137)))

(declare-fun b!1041798 () Bool)

(assert (=> b!1041798 (= e!590053 e!590051)))

(declare-fun c!105709 () Bool)

(assert (=> b!1041798 (= c!105709 (validKeyInArray!0 (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041799 () Bool)

(declare-fun e!590052 () Bool)

(assert (=> b!1041799 (= e!590052 call!44137)))

(declare-fun bm!44134 () Bool)

(assert (=> bm!44134 (= call!44137 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11596 thiss!1427) (mask!30393 thiss!1427)))))

(declare-fun b!1041800 () Bool)

(assert (=> b!1041800 (= e!590051 e!590052)))

(declare-fun lt!459179 () (_ BitVec 64))

(assert (=> b!1041800 (= lt!459179 (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459181 () Unit!34037)

(assert (=> b!1041800 (= lt!459181 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11596 thiss!1427) lt!459179 #b00000000000000000000000000000000))))

(assert (=> b!1041800 (arrayContainsKey!0 (_keys!11596 thiss!1427) lt!459179 #b00000000000000000000000000000000)))

(declare-fun lt!459180 () Unit!34037)

(assert (=> b!1041800 (= lt!459180 lt!459181)))

(declare-fun res!694299 () Bool)

(assert (=> b!1041800 (= res!694299 (= (seekEntryOrOpen!0 (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000) (_keys!11596 thiss!1427) (mask!30393 thiss!1427)) (Found!9810 #b00000000000000000000000000000000)))))

(assert (=> b!1041800 (=> (not res!694299) (not e!590052))))

(assert (= (and d!125957 (not res!694300)) b!1041798))

(assert (= (and b!1041798 c!105709) b!1041800))

(assert (= (and b!1041798 (not c!105709)) b!1041797))

(assert (= (and b!1041800 res!694299) b!1041799))

(assert (= (or b!1041799 b!1041797) bm!44134))

(assert (=> b!1041798 m!961157))

(assert (=> b!1041798 m!961157))

(assert (=> b!1041798 m!961159))

(declare-fun m!961211 () Bool)

(assert (=> bm!44134 m!961211))

(assert (=> b!1041800 m!961157))

(declare-fun m!961213 () Bool)

(assert (=> b!1041800 m!961213))

(declare-fun m!961215 () Bool)

(assert (=> b!1041800 m!961215))

(assert (=> b!1041800 m!961157))

(declare-fun m!961217 () Bool)

(assert (=> b!1041800 m!961217))

(assert (=> b!1041780 d!125957))

(declare-fun b!1041810 () Bool)

(declare-fun res!694310 () Bool)

(declare-fun e!590056 () Bool)

(assert (=> b!1041810 (=> (not res!694310) (not e!590056))))

(declare-fun size!32136 (LongMapFixedSize!5952) (_ BitVec 32))

(assert (=> b!1041810 (= res!694310 (bvsge (size!32136 thiss!1427) (_size!3031 thiss!1427)))))

(declare-fun b!1041812 () Bool)

(assert (=> b!1041812 (= e!590056 (and (bvsge (extraKeys!6086 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6086 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3031 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun d!125959 () Bool)

(declare-fun res!694312 () Bool)

(assert (=> d!125959 (=> (not res!694312) (not e!590056))))

(assert (=> d!125959 (= res!694312 (validMask!0 (mask!30393 thiss!1427)))))

(assert (=> d!125959 (= (simpleValid!439 thiss!1427) e!590056)))

(declare-fun b!1041809 () Bool)

(declare-fun res!694311 () Bool)

(assert (=> b!1041809 (=> (not res!694311) (not e!590056))))

(assert (=> b!1041809 (= res!694311 (and (= (size!32133 (_values!6381 thiss!1427)) (bvadd (mask!30393 thiss!1427) #b00000000000000000000000000000001)) (= (size!32132 (_keys!11596 thiss!1427)) (size!32133 (_values!6381 thiss!1427))) (bvsge (_size!3031 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3031 thiss!1427) (bvadd (mask!30393 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1041811 () Bool)

(declare-fun res!694309 () Bool)

(assert (=> b!1041811 (=> (not res!694309) (not e!590056))))

(assert (=> b!1041811 (= res!694309 (= (size!32136 thiss!1427) (bvadd (_size!3031 thiss!1427) (bvsdiv (bvadd (extraKeys!6086 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!125959 res!694312) b!1041809))

(assert (= (and b!1041809 res!694311) b!1041810))

(assert (= (and b!1041810 res!694310) b!1041811))

(assert (= (and b!1041811 res!694309) b!1041812))

(declare-fun m!961219 () Bool)

(assert (=> b!1041810 m!961219))

(assert (=> d!125959 m!961091))

(assert (=> b!1041811 m!961219))

(assert (=> d!125939 d!125959))

(assert (=> b!1041779 d!125927))

(declare-fun b!1041813 () Bool)

(declare-fun e!590057 () (_ BitVec 32))

(declare-fun call!44138 () (_ BitVec 32))

(assert (=> b!1041813 (= e!590057 (bvadd #b00000000000000000000000000000001 call!44138))))

(declare-fun b!1041814 () Bool)

(declare-fun e!590058 () (_ BitVec 32))

(assert (=> b!1041814 (= e!590058 #b00000000000000000000000000000000)))

(declare-fun b!1041815 () Bool)

(assert (=> b!1041815 (= e!590057 call!44138)))

(declare-fun bm!44135 () Bool)

(assert (=> bm!44135 (= call!44138 (arrayCountValidKeys!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))))))

(declare-fun b!1041816 () Bool)

(assert (=> b!1041816 (= e!590058 e!590057)))

(declare-fun c!105710 () Bool)

(assert (=> b!1041816 (= c!105710 (validKeyInArray!0 (select (arr!31599 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125961 () Bool)

(declare-fun lt!459182 () (_ BitVec 32))

(assert (=> d!125961 (and (bvsge lt!459182 #b00000000000000000000000000000000) (bvsle lt!459182 (bvsub (size!32132 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125961 (= lt!459182 e!590058)))

(declare-fun c!105711 () Bool)

(assert (=> d!125961 (= c!105711 (bvsge #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))))))

(assert (=> d!125961 (and (bvsle #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32132 (_keys!11596 thiss!1427)) (size!32132 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))))))))

(assert (=> d!125961 (= (arrayCountValidKeys!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) lt!459182)))

(assert (= (and d!125961 c!105711) b!1041814))

(assert (= (and d!125961 (not c!105711)) b!1041816))

(assert (= (and b!1041816 c!105710) b!1041813))

(assert (= (and b!1041816 (not c!105710)) b!1041815))

(assert (= (or b!1041813 b!1041815) bm!44135))

(declare-fun m!961221 () Bool)

(assert (=> bm!44135 m!961221))

(assert (=> b!1041816 m!961199))

(assert (=> b!1041816 m!961199))

(assert (=> b!1041816 m!961205))

(assert (=> b!1041696 d!125961))

(assert (=> b!1041696 d!125927))

(declare-fun d!125963 () Bool)

(assert (=> d!125963 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1041694 d!125963))

(declare-fun d!125965 () Bool)

(assert (=> d!125965 (= (validKeyInArray!0 (select (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119))) (and (not (= (select (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041693 d!125965))

(declare-fun b!1041835 () Bool)

(declare-fun e!590073 () SeekEntryResult!9810)

(assert (=> b!1041835 (= e!590073 (Intermediate!9810 true (toIndex!0 key!909 (mask!30393 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1041836 () Bool)

(declare-fun e!590071 () SeekEntryResult!9810)

(assert (=> b!1041836 (= e!590073 e!590071)))

(declare-fun c!105720 () Bool)

(declare-fun lt!459187 () (_ BitVec 64))

(assert (=> b!1041836 (= c!105720 (or (= lt!459187 key!909) (= (bvadd lt!459187 lt!459187) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041837 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041837 (= e!590071 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30393 thiss!1427)) #b00000000000000000000000000000000 (mask!30393 thiss!1427)) key!909 (_keys!11596 thiss!1427) (mask!30393 thiss!1427)))))

(declare-fun b!1041838 () Bool)

(assert (=> b!1041838 (= e!590071 (Intermediate!9810 false (toIndex!0 key!909 (mask!30393 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1041839 () Bool)

(declare-fun e!590069 () Bool)

(declare-fun e!590072 () Bool)

(assert (=> b!1041839 (= e!590069 e!590072)))

(declare-fun res!694321 () Bool)

(declare-fun lt!459188 () SeekEntryResult!9810)

(assert (=> b!1041839 (= res!694321 (and ((_ is Intermediate!9810) lt!459188) (not (undefined!10622 lt!459188)) (bvslt (x!92996 lt!459188) #b01111111111111111111111111111110) (bvsge (x!92996 lt!459188) #b00000000000000000000000000000000) (bvsge (x!92996 lt!459188) #b00000000000000000000000000000000)))))

(assert (=> b!1041839 (=> (not res!694321) (not e!590072))))

(declare-fun d!125967 () Bool)

(assert (=> d!125967 e!590069))

(declare-fun c!105719 () Bool)

(assert (=> d!125967 (= c!105719 (and ((_ is Intermediate!9810) lt!459188) (undefined!10622 lt!459188)))))

(assert (=> d!125967 (= lt!459188 e!590073)))

(declare-fun c!105718 () Bool)

(assert (=> d!125967 (= c!105718 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!125967 (= lt!459187 (select (arr!31599 (_keys!11596 thiss!1427)) (toIndex!0 key!909 (mask!30393 thiss!1427))))))

(assert (=> d!125967 (validMask!0 (mask!30393 thiss!1427))))

(assert (=> d!125967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30393 thiss!1427)) key!909 (_keys!11596 thiss!1427) (mask!30393 thiss!1427)) lt!459188)))

(declare-fun b!1041840 () Bool)

(assert (=> b!1041840 (and (bvsge (index!41613 lt!459188) #b00000000000000000000000000000000) (bvslt (index!41613 lt!459188) (size!32132 (_keys!11596 thiss!1427))))))

(declare-fun res!694320 () Bool)

(assert (=> b!1041840 (= res!694320 (= (select (arr!31599 (_keys!11596 thiss!1427)) (index!41613 lt!459188)) key!909))))

(declare-fun e!590070 () Bool)

(assert (=> b!1041840 (=> res!694320 e!590070)))

(assert (=> b!1041840 (= e!590072 e!590070)))

(declare-fun b!1041841 () Bool)

(assert (=> b!1041841 (= e!590069 (bvsge (x!92996 lt!459188) #b01111111111111111111111111111110))))

(declare-fun b!1041842 () Bool)

(assert (=> b!1041842 (and (bvsge (index!41613 lt!459188) #b00000000000000000000000000000000) (bvslt (index!41613 lt!459188) (size!32132 (_keys!11596 thiss!1427))))))

(declare-fun res!694319 () Bool)

(assert (=> b!1041842 (= res!694319 (= (select (arr!31599 (_keys!11596 thiss!1427)) (index!41613 lt!459188)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041842 (=> res!694319 e!590070)))

(declare-fun b!1041843 () Bool)

(assert (=> b!1041843 (and (bvsge (index!41613 lt!459188) #b00000000000000000000000000000000) (bvslt (index!41613 lt!459188) (size!32132 (_keys!11596 thiss!1427))))))

(assert (=> b!1041843 (= e!590070 (= (select (arr!31599 (_keys!11596 thiss!1427)) (index!41613 lt!459188)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125967 c!105718) b!1041835))

(assert (= (and d!125967 (not c!105718)) b!1041836))

(assert (= (and b!1041836 c!105720) b!1041838))

(assert (= (and b!1041836 (not c!105720)) b!1041837))

(assert (= (and d!125967 c!105719) b!1041841))

(assert (= (and d!125967 (not c!105719)) b!1041839))

(assert (= (and b!1041839 res!694321) b!1041840))

(assert (= (and b!1041840 (not res!694320)) b!1041842))

(assert (= (and b!1041842 (not res!694319)) b!1041843))

(assert (=> b!1041837 m!961187))

(declare-fun m!961223 () Bool)

(assert (=> b!1041837 m!961223))

(assert (=> b!1041837 m!961223))

(declare-fun m!961225 () Bool)

(assert (=> b!1041837 m!961225))

(assert (=> d!125967 m!961187))

(declare-fun m!961227 () Bool)

(assert (=> d!125967 m!961227))

(assert (=> d!125967 m!961091))

(declare-fun m!961229 () Bool)

(assert (=> b!1041842 m!961229))

(assert (=> b!1041843 m!961229))

(assert (=> b!1041840 m!961229))

(assert (=> d!125937 d!125967))

(declare-fun d!125969 () Bool)

(declare-fun lt!459194 () (_ BitVec 32))

(declare-fun lt!459193 () (_ BitVec 32))

(assert (=> d!125969 (= lt!459194 (bvmul (bvxor lt!459193 (bvlshr lt!459193 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125969 (= lt!459193 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125969 (and (bvsge (mask!30393 thiss!1427) #b00000000000000000000000000000000) (let ((res!694322 (let ((h!23173 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!93013 (bvmul (bvxor h!23173 (bvlshr h!23173 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!93013 (bvlshr x!93013 #b00000000000000000000000000001101)) (mask!30393 thiss!1427)))))) (and (bvslt res!694322 (bvadd (mask!30393 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!694322 #b00000000000000000000000000000000))))))

(assert (=> d!125969 (= (toIndex!0 key!909 (mask!30393 thiss!1427)) (bvand (bvxor lt!459194 (bvlshr lt!459194 #b00000000000000000000000000001101)) (mask!30393 thiss!1427)))))

(assert (=> d!125937 d!125969))

(assert (=> d!125937 d!125921))

(declare-fun b!1041844 () Bool)

(declare-fun e!590074 () (_ BitVec 32))

(declare-fun call!44139 () (_ BitVec 32))

(assert (=> b!1041844 (= e!590074 (bvadd #b00000000000000000000000000000001 call!44139))))

(declare-fun b!1041845 () Bool)

(declare-fun e!590075 () (_ BitVec 32))

(assert (=> b!1041845 (= e!590075 #b00000000000000000000000000000000)))

(declare-fun b!1041846 () Bool)

(assert (=> b!1041846 (= e!590074 call!44139)))

(declare-fun bm!44136 () Bool)

(assert (=> bm!44136 (= call!44139 (arrayCountValidKeys!0 lt!459121 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))))))

(declare-fun b!1041847 () Bool)

(assert (=> b!1041847 (= e!590075 e!590074)))

(declare-fun c!105721 () Bool)

(assert (=> b!1041847 (= c!105721 (validKeyInArray!0 (select (arr!31599 lt!459121) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125971 () Bool)

(declare-fun lt!459195 () (_ BitVec 32))

(assert (=> d!125971 (and (bvsge lt!459195 #b00000000000000000000000000000000) (bvsle lt!459195 (bvsub (size!32132 lt!459121) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125971 (= lt!459195 e!590075)))

(declare-fun c!105722 () Bool)

(assert (=> d!125971 (= c!105722 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))))))

(assert (=> d!125971 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32132 (_keys!11596 thiss!1427)) (size!32132 lt!459121)))))

(assert (=> d!125971 (= (arrayCountValidKeys!0 lt!459121 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))) lt!459195)))

(assert (= (and d!125971 c!105722) b!1041845))

(assert (= (and d!125971 (not c!105722)) b!1041847))

(assert (= (and b!1041847 c!105721) b!1041844))

(assert (= (and b!1041847 (not c!105721)) b!1041846))

(assert (= (or b!1041844 b!1041846) bm!44136))

(declare-fun m!961231 () Bool)

(assert (=> bm!44136 m!961231))

(assert (=> b!1041847 m!961207))

(assert (=> b!1041847 m!961207))

(declare-fun m!961233 () Bool)

(assert (=> b!1041847 m!961233))

(assert (=> bm!44125 d!125971))

(declare-fun b!1041860 () Bool)

(declare-fun c!105731 () Bool)

(declare-fun lt!459200 () (_ BitVec 64))

(assert (=> b!1041860 (= c!105731 (= lt!459200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590083 () SeekEntryResult!9810)

(declare-fun e!590082 () SeekEntryResult!9810)

(assert (=> b!1041860 (= e!590083 e!590082)))

(declare-fun b!1041861 () Bool)

(assert (=> b!1041861 (= e!590082 (MissingVacant!9810 (index!41613 lt!459177)))))

(declare-fun b!1041863 () Bool)

(declare-fun e!590084 () SeekEntryResult!9810)

(assert (=> b!1041863 (= e!590084 Undefined!9810)))

(declare-fun b!1041864 () Bool)

(assert (=> b!1041864 (= e!590082 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92996 lt!459177) #b00000000000000000000000000000001) (nextIndex!0 (index!41613 lt!459177) (x!92996 lt!459177) (mask!30393 thiss!1427)) (index!41613 lt!459177) key!909 (_keys!11596 thiss!1427) (mask!30393 thiss!1427)))))

(declare-fun b!1041865 () Bool)

(assert (=> b!1041865 (= e!590083 (Found!9810 (index!41613 lt!459177)))))

(declare-fun d!125973 () Bool)

(declare-fun lt!459201 () SeekEntryResult!9810)

(assert (=> d!125973 (and (or ((_ is Undefined!9810) lt!459201) (not ((_ is Found!9810) lt!459201)) (and (bvsge (index!41612 lt!459201) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459201) (size!32132 (_keys!11596 thiss!1427))))) (or ((_ is Undefined!9810) lt!459201) ((_ is Found!9810) lt!459201) (not ((_ is MissingVacant!9810) lt!459201)) (not (= (index!41614 lt!459201) (index!41613 lt!459177))) (and (bvsge (index!41614 lt!459201) #b00000000000000000000000000000000) (bvslt (index!41614 lt!459201) (size!32132 (_keys!11596 thiss!1427))))) (or ((_ is Undefined!9810) lt!459201) (ite ((_ is Found!9810) lt!459201) (= (select (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459201)) key!909) (and ((_ is MissingVacant!9810) lt!459201) (= (index!41614 lt!459201) (index!41613 lt!459177)) (= (select (arr!31599 (_keys!11596 thiss!1427)) (index!41614 lt!459201)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!125973 (= lt!459201 e!590084)))

(declare-fun c!105730 () Bool)

(assert (=> d!125973 (= c!105730 (bvsge (x!92996 lt!459177) #b01111111111111111111111111111110))))

(assert (=> d!125973 (= lt!459200 (select (arr!31599 (_keys!11596 thiss!1427)) (index!41613 lt!459177)))))

(assert (=> d!125973 (validMask!0 (mask!30393 thiss!1427))))

(assert (=> d!125973 (= (seekKeyOrZeroReturnVacant!0 (x!92996 lt!459177) (index!41613 lt!459177) (index!41613 lt!459177) key!909 (_keys!11596 thiss!1427) (mask!30393 thiss!1427)) lt!459201)))

(declare-fun b!1041862 () Bool)

(assert (=> b!1041862 (= e!590084 e!590083)))

(declare-fun c!105729 () Bool)

(assert (=> b!1041862 (= c!105729 (= lt!459200 key!909))))

(assert (= (and d!125973 c!105730) b!1041863))

(assert (= (and d!125973 (not c!105730)) b!1041862))

(assert (= (and b!1041862 c!105729) b!1041865))

(assert (= (and b!1041862 (not c!105729)) b!1041860))

(assert (= (and b!1041860 c!105731) b!1041861))

(assert (= (and b!1041860 (not c!105731)) b!1041864))

(declare-fun m!961235 () Bool)

(assert (=> b!1041864 m!961235))

(assert (=> b!1041864 m!961235))

(declare-fun m!961237 () Bool)

(assert (=> b!1041864 m!961237))

(declare-fun m!961239 () Bool)

(assert (=> d!125973 m!961239))

(declare-fun m!961241 () Bool)

(assert (=> d!125973 m!961241))

(assert (=> d!125973 m!961181))

(assert (=> d!125973 m!961091))

(assert (=> b!1041770 d!125973))

(declare-fun b!1041866 () Bool)

(declare-fun e!590085 () (_ BitVec 32))

(declare-fun call!44140 () (_ BitVec 32))

(assert (=> b!1041866 (= e!590085 (bvadd #b00000000000000000000000000000001 call!44140))))

(declare-fun b!1041867 () Bool)

(declare-fun e!590086 () (_ BitVec 32))

(assert (=> b!1041867 (= e!590086 #b00000000000000000000000000000000)))

(declare-fun b!1041868 () Bool)

(assert (=> b!1041868 (= e!590085 call!44140)))

(declare-fun bm!44137 () Bool)

(assert (=> bm!44137 (= call!44140 (arrayCountValidKeys!0 (_keys!11596 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))))))

(declare-fun b!1041869 () Bool)

(assert (=> b!1041869 (= e!590086 e!590085)))

(declare-fun c!105732 () Bool)

(assert (=> b!1041869 (= c!105732 (validKeyInArray!0 (select (arr!31599 (_keys!11596 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125975 () Bool)

(declare-fun lt!459202 () (_ BitVec 32))

(assert (=> d!125975 (and (bvsge lt!459202 #b00000000000000000000000000000000) (bvsle lt!459202 (bvsub (size!32132 (_keys!11596 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125975 (= lt!459202 e!590086)))

(declare-fun c!105733 () Bool)

(assert (=> d!125975 (= c!105733 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))))))

(assert (=> d!125975 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32132 (_keys!11596 thiss!1427)) (size!32132 (_keys!11596 thiss!1427))))))

(assert (=> d!125975 (= (arrayCountValidKeys!0 (_keys!11596 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 (_keys!11596 thiss!1427))) lt!459202)))

(assert (= (and d!125975 c!105733) b!1041867))

(assert (= (and d!125975 (not c!105733)) b!1041869))

(assert (= (and b!1041869 c!105732) b!1041866))

(assert (= (and b!1041869 (not c!105732)) b!1041868))

(assert (= (or b!1041866 b!1041868) bm!44137))

(declare-fun m!961243 () Bool)

(assert (=> bm!44137 m!961243))

(declare-fun m!961245 () Bool)

(assert (=> b!1041869 m!961245))

(assert (=> b!1041869 m!961245))

(declare-fun m!961247 () Bool)

(assert (=> b!1041869 m!961247))

(assert (=> bm!44129 d!125975))

(declare-fun d!125977 () Bool)

(assert (=> d!125977 (= (arrayCountValidKeys!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11596 thiss!1427) #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!125977 true))

(declare-fun _$79!29 () Unit!34037)

(assert (=> d!125977 (= (choose!82 (_keys!11596 thiss!1427) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!29)))

(declare-fun bs!30469 () Bool)

(assert (= bs!30469 d!125977))

(assert (=> bs!30469 m!961089))

(assert (=> bs!30469 m!961141))

(assert (=> bs!30469 m!961081))

(assert (=> d!125917 d!125977))

(declare-fun d!125979 () Bool)

(assert (=> d!125979 (arrayContainsKey!0 lt!459121 lt!459158 #b00000000000000000000000000000000)))

(declare-fun lt!459205 () Unit!34037)

(declare-fun choose!13 (array!65678 (_ BitVec 64) (_ BitVec 32)) Unit!34037)

(assert (=> d!125979 (= lt!459205 (choose!13 lt!459121 lt!459158 #b00000000000000000000000000000000))))

(assert (=> d!125979 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!125979 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459121 lt!459158 #b00000000000000000000000000000000) lt!459205)))

(declare-fun bs!30470 () Bool)

(assert (= bs!30470 d!125979))

(assert (=> bs!30470 m!961169))

(declare-fun m!961249 () Bool)

(assert (=> bs!30470 m!961249))

(assert (=> b!1041748 d!125979))

(declare-fun d!125981 () Bool)

(declare-fun res!694323 () Bool)

(declare-fun e!590087 () Bool)

(assert (=> d!125981 (=> res!694323 e!590087)))

(assert (=> d!125981 (= res!694323 (= (select (arr!31599 lt!459121) #b00000000000000000000000000000000) lt!459158))))

(assert (=> d!125981 (= (arrayContainsKey!0 lt!459121 lt!459158 #b00000000000000000000000000000000) e!590087)))

(declare-fun b!1041870 () Bool)

(declare-fun e!590088 () Bool)

(assert (=> b!1041870 (= e!590087 e!590088)))

(declare-fun res!694324 () Bool)

(assert (=> b!1041870 (=> (not res!694324) (not e!590088))))

(assert (=> b!1041870 (= res!694324 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 lt!459121)))))

(declare-fun b!1041871 () Bool)

(assert (=> b!1041871 (= e!590088 (arrayContainsKey!0 lt!459121 lt!459158 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125981 (not res!694323)) b!1041870))

(assert (= (and b!1041870 res!694324) b!1041871))

(assert (=> d!125981 m!961145))

(declare-fun m!961251 () Bool)

(assert (=> b!1041871 m!961251))

(assert (=> b!1041748 d!125981))

(declare-fun b!1041884 () Bool)

(declare-fun c!105741 () Bool)

(declare-fun lt!459214 () (_ BitVec 64))

(assert (=> b!1041884 (= c!105741 (= lt!459214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590097 () SeekEntryResult!9810)

(declare-fun e!590096 () SeekEntryResult!9810)

(assert (=> b!1041884 (= e!590097 e!590096)))

(declare-fun d!125983 () Bool)

(declare-fun lt!459213 () SeekEntryResult!9810)

(assert (=> d!125983 (and (or ((_ is Undefined!9810) lt!459213) (not ((_ is Found!9810) lt!459213)) (and (bvsge (index!41612 lt!459213) #b00000000000000000000000000000000) (bvslt (index!41612 lt!459213) (size!32132 lt!459121)))) (or ((_ is Undefined!9810) lt!459213) ((_ is Found!9810) lt!459213) (not ((_ is MissingZero!9810) lt!459213)) (and (bvsge (index!41611 lt!459213) #b00000000000000000000000000000000) (bvslt (index!41611 lt!459213) (size!32132 lt!459121)))) (or ((_ is Undefined!9810) lt!459213) ((_ is Found!9810) lt!459213) ((_ is MissingZero!9810) lt!459213) (not ((_ is MissingVacant!9810) lt!459213)) (and (bvsge (index!41614 lt!459213) #b00000000000000000000000000000000) (bvslt (index!41614 lt!459213) (size!32132 lt!459121)))) (or ((_ is Undefined!9810) lt!459213) (ite ((_ is Found!9810) lt!459213) (= (select (arr!31599 lt!459121) (index!41612 lt!459213)) (select (arr!31599 lt!459121) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9810) lt!459213) (= (select (arr!31599 lt!459121) (index!41611 lt!459213)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9810) lt!459213) (= (select (arr!31599 lt!459121) (index!41614 lt!459213)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!590095 () SeekEntryResult!9810)

(assert (=> d!125983 (= lt!459213 e!590095)))

(declare-fun c!105742 () Bool)

(declare-fun lt!459212 () SeekEntryResult!9810)

(assert (=> d!125983 (= c!105742 (and ((_ is Intermediate!9810) lt!459212) (undefined!10622 lt!459212)))))

(assert (=> d!125983 (= lt!459212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31599 lt!459121) #b00000000000000000000000000000000) (mask!30393 thiss!1427)) (select (arr!31599 lt!459121) #b00000000000000000000000000000000) lt!459121 (mask!30393 thiss!1427)))))

(assert (=> d!125983 (validMask!0 (mask!30393 thiss!1427))))

(assert (=> d!125983 (= (seekEntryOrOpen!0 (select (arr!31599 lt!459121) #b00000000000000000000000000000000) lt!459121 (mask!30393 thiss!1427)) lt!459213)))

(declare-fun b!1041885 () Bool)

(assert (=> b!1041885 (= e!590097 (Found!9810 (index!41613 lt!459212)))))

(declare-fun b!1041886 () Bool)

(assert (=> b!1041886 (= e!590095 Undefined!9810)))

(declare-fun b!1041887 () Bool)

(assert (=> b!1041887 (= e!590096 (seekKeyOrZeroReturnVacant!0 (x!92996 lt!459212) (index!41613 lt!459212) (index!41613 lt!459212) (select (arr!31599 lt!459121) #b00000000000000000000000000000000) lt!459121 (mask!30393 thiss!1427)))))

(declare-fun b!1041888 () Bool)

(assert (=> b!1041888 (= e!590095 e!590097)))

(assert (=> b!1041888 (= lt!459214 (select (arr!31599 lt!459121) (index!41613 lt!459212)))))

(declare-fun c!105740 () Bool)

(assert (=> b!1041888 (= c!105740 (= lt!459214 (select (arr!31599 lt!459121) #b00000000000000000000000000000000)))))

(declare-fun b!1041889 () Bool)

(assert (=> b!1041889 (= e!590096 (MissingZero!9810 (index!41613 lt!459212)))))

(assert (= (and d!125983 c!105742) b!1041886))

(assert (= (and d!125983 (not c!105742)) b!1041888))

(assert (= (and b!1041888 c!105740) b!1041885))

(assert (= (and b!1041888 (not c!105740)) b!1041884))

(assert (= (and b!1041884 c!105741) b!1041889))

(assert (= (and b!1041884 (not c!105741)) b!1041887))

(declare-fun m!961253 () Bool)

(assert (=> d!125983 m!961253))

(declare-fun m!961255 () Bool)

(assert (=> d!125983 m!961255))

(declare-fun m!961257 () Bool)

(assert (=> d!125983 m!961257))

(assert (=> d!125983 m!961145))

(declare-fun m!961259 () Bool)

(assert (=> d!125983 m!961259))

(declare-fun m!961261 () Bool)

(assert (=> d!125983 m!961261))

(assert (=> d!125983 m!961145))

(assert (=> d!125983 m!961257))

(assert (=> d!125983 m!961091))

(assert (=> b!1041887 m!961145))

(declare-fun m!961263 () Bool)

(assert (=> b!1041887 m!961263))

(declare-fun m!961265 () Bool)

(assert (=> b!1041888 m!961265))

(assert (=> b!1041748 d!125983))

(declare-fun b!1041890 () Bool)

(declare-fun e!590098 () Bool)

(declare-fun call!44141 () Bool)

(assert (=> b!1041890 (= e!590098 call!44141)))

(declare-fun bm!44138 () Bool)

(declare-fun c!105743 () Bool)

(assert (=> bm!44138 (= call!44141 (arrayNoDuplicates!0 (_keys!11596 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105743 (Cons!21966 (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000) Nil!21967) Nil!21967)))))

(declare-fun b!1041891 () Bool)

(declare-fun e!590101 () Bool)

(assert (=> b!1041891 (= e!590101 (contains!6055 Nil!21967 (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041892 () Bool)

(declare-fun e!590100 () Bool)

(assert (=> b!1041892 (= e!590100 e!590098)))

(assert (=> b!1041892 (= c!105743 (validKeyInArray!0 (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125985 () Bool)

(declare-fun res!694327 () Bool)

(declare-fun e!590099 () Bool)

(assert (=> d!125985 (=> res!694327 e!590099)))

(assert (=> d!125985 (= res!694327 (bvsge #b00000000000000000000000000000000 (size!32132 (_keys!11596 thiss!1427))))))

(assert (=> d!125985 (= (arrayNoDuplicates!0 (_keys!11596 thiss!1427) #b00000000000000000000000000000000 Nil!21967) e!590099)))

(declare-fun b!1041893 () Bool)

(assert (=> b!1041893 (= e!590099 e!590100)))

(declare-fun res!694326 () Bool)

(assert (=> b!1041893 (=> (not res!694326) (not e!590100))))

(assert (=> b!1041893 (= res!694326 (not e!590101))))

(declare-fun res!694325 () Bool)

(assert (=> b!1041893 (=> (not res!694325) (not e!590101))))

(assert (=> b!1041893 (= res!694325 (validKeyInArray!0 (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041894 () Bool)

(assert (=> b!1041894 (= e!590098 call!44141)))

(assert (= (and d!125985 (not res!694327)) b!1041893))

(assert (= (and b!1041893 res!694325) b!1041891))

(assert (= (and b!1041893 res!694326) b!1041892))

(assert (= (and b!1041892 c!105743) b!1041894))

(assert (= (and b!1041892 (not c!105743)) b!1041890))

(assert (= (or b!1041894 b!1041890) bm!44138))

(assert (=> bm!44138 m!961157))

(declare-fun m!961267 () Bool)

(assert (=> bm!44138 m!961267))

(assert (=> b!1041891 m!961157))

(assert (=> b!1041891 m!961157))

(declare-fun m!961269 () Bool)

(assert (=> b!1041891 m!961269))

(assert (=> b!1041892 m!961157))

(assert (=> b!1041892 m!961157))

(assert (=> b!1041892 m!961159))

(assert (=> b!1041893 m!961157))

(assert (=> b!1041893 m!961157))

(assert (=> b!1041893 m!961159))

(assert (=> b!1041781 d!125985))

(declare-fun d!125987 () Bool)

(declare-fun res!694329 () Bool)

(declare-fun e!590104 () Bool)

(assert (=> d!125987 (=> res!694329 e!590104)))

(assert (=> d!125987 (= res!694329 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 lt!459121)))))

(assert (=> d!125987 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459121 (mask!30393 thiss!1427)) e!590104)))

(declare-fun b!1041895 () Bool)

(declare-fun e!590102 () Bool)

(declare-fun call!44142 () Bool)

(assert (=> b!1041895 (= e!590102 call!44142)))

(declare-fun b!1041896 () Bool)

(assert (=> b!1041896 (= e!590104 e!590102)))

(declare-fun c!105744 () Bool)

(assert (=> b!1041896 (= c!105744 (validKeyInArray!0 (select (arr!31599 lt!459121) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041897 () Bool)

(declare-fun e!590103 () Bool)

(assert (=> b!1041897 (= e!590103 call!44142)))

(declare-fun bm!44139 () Bool)

(assert (=> bm!44139 (= call!44142 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!459121 (mask!30393 thiss!1427)))))

(declare-fun b!1041898 () Bool)

(assert (=> b!1041898 (= e!590102 e!590103)))

(declare-fun lt!459215 () (_ BitVec 64))

(assert (=> b!1041898 (= lt!459215 (select (arr!31599 lt!459121) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!459217 () Unit!34037)

(assert (=> b!1041898 (= lt!459217 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459121 lt!459215 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1041898 (arrayContainsKey!0 lt!459121 lt!459215 #b00000000000000000000000000000000)))

(declare-fun lt!459216 () Unit!34037)

(assert (=> b!1041898 (= lt!459216 lt!459217)))

(declare-fun res!694328 () Bool)

(assert (=> b!1041898 (= res!694328 (= (seekEntryOrOpen!0 (select (arr!31599 lt!459121) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!459121 (mask!30393 thiss!1427)) (Found!9810 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1041898 (=> (not res!694328) (not e!590103))))

(assert (= (and d!125987 (not res!694329)) b!1041896))

(assert (= (and b!1041896 c!105744) b!1041898))

(assert (= (and b!1041896 (not c!105744)) b!1041895))

(assert (= (and b!1041898 res!694328) b!1041897))

(assert (= (or b!1041897 b!1041895) bm!44139))

(assert (=> b!1041896 m!961207))

(assert (=> b!1041896 m!961207))

(assert (=> b!1041896 m!961233))

(declare-fun m!961271 () Bool)

(assert (=> bm!44139 m!961271))

(assert (=> b!1041898 m!961207))

(declare-fun m!961273 () Bool)

(assert (=> b!1041898 m!961273))

(declare-fun m!961275 () Bool)

(assert (=> b!1041898 m!961275))

(assert (=> b!1041898 m!961207))

(declare-fun m!961277 () Bool)

(assert (=> b!1041898 m!961277))

(assert (=> bm!44132 d!125987))

(assert (=> b!1041728 d!125953))

(declare-fun d!125989 () Bool)

(declare-fun res!694331 () Bool)

(declare-fun e!590107 () Bool)

(assert (=> d!125989 (=> res!694331 e!590107)))

(assert (=> d!125989 (= res!694331 (bvsge #b00000000000000000000000000000000 (size!32132 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))))))))

(assert (=> d!125989 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) (mask!30393 thiss!1427)) e!590107)))

(declare-fun b!1041899 () Bool)

(declare-fun e!590105 () Bool)

(declare-fun call!44143 () Bool)

(assert (=> b!1041899 (= e!590105 call!44143)))

(declare-fun b!1041900 () Bool)

(assert (=> b!1041900 (= e!590107 e!590105)))

(declare-fun c!105745 () Bool)

(assert (=> b!1041900 (= c!105745 (validKeyInArray!0 (select (arr!31599 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1041901 () Bool)

(declare-fun e!590106 () Bool)

(assert (=> b!1041901 (= e!590106 call!44143)))

(declare-fun bm!44140 () Bool)

(assert (=> bm!44140 (= call!44143 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) (mask!30393 thiss!1427)))))

(declare-fun b!1041902 () Bool)

(assert (=> b!1041902 (= e!590105 e!590106)))

(declare-fun lt!459218 () (_ BitVec 64))

(assert (=> b!1041902 (= lt!459218 (select (arr!31599 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!459220 () Unit!34037)

(assert (=> b!1041902 (= lt!459220 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) lt!459218 #b00000000000000000000000000000000))))

(assert (=> b!1041902 (arrayContainsKey!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) lt!459218 #b00000000000000000000000000000000)))

(declare-fun lt!459219 () Unit!34037)

(assert (=> b!1041902 (= lt!459219 lt!459220)))

(declare-fun res!694330 () Bool)

(assert (=> b!1041902 (= res!694330 (= (seekEntryOrOpen!0 (select (arr!31599 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427)))) #b00000000000000000000000000000000) (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) (mask!30393 thiss!1427)) (Found!9810 #b00000000000000000000000000000000)))))

(assert (=> b!1041902 (=> (not res!694330) (not e!590106))))

(assert (= (and d!125989 (not res!694331)) b!1041900))

(assert (= (and b!1041900 c!105745) b!1041902))

(assert (= (and b!1041900 (not c!105745)) b!1041899))

(assert (= (and b!1041902 res!694330) b!1041901))

(assert (= (or b!1041901 b!1041899) bm!44140))

(assert (=> b!1041900 m!961199))

(assert (=> b!1041900 m!961199))

(assert (=> b!1041900 m!961205))

(declare-fun m!961279 () Bool)

(assert (=> bm!44140 m!961279))

(assert (=> b!1041902 m!961199))

(declare-fun m!961281 () Bool)

(assert (=> b!1041902 m!961281))

(declare-fun m!961283 () Bool)

(assert (=> b!1041902 m!961283))

(assert (=> b!1041902 m!961199))

(declare-fun m!961285 () Bool)

(assert (=> b!1041902 m!961285))

(assert (=> b!1041736 d!125989))

(assert (=> b!1041727 d!125953))

(declare-fun d!125991 () Bool)

(declare-fun res!694332 () Bool)

(declare-fun e!590108 () Bool)

(assert (=> d!125991 (=> res!694332 e!590108)))

(assert (=> d!125991 (= res!694332 (= (select (arr!31599 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125991 (= (arrayContainsKey!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) key!909 #b00000000000000000000000000000000) e!590108)))

(declare-fun b!1041903 () Bool)

(declare-fun e!590109 () Bool)

(assert (=> b!1041903 (= e!590108 e!590109)))

(declare-fun res!694333 () Bool)

(assert (=> b!1041903 (=> (not res!694333) (not e!590109))))

(assert (=> b!1041903 (= res!694333 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))))))))

(declare-fun b!1041904 () Bool)

(assert (=> b!1041904 (= e!590109 (arrayContainsKey!0 (array!65679 (store (arr!31599 (_keys!11596 thiss!1427)) (index!41612 lt!459119) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32132 (_keys!11596 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125991 (not res!694332)) b!1041903))

(assert (= (and b!1041903 res!694333) b!1041904))

(assert (=> d!125991 m!961199))

(declare-fun m!961287 () Bool)

(assert (=> b!1041904 m!961287))

(assert (=> b!1041751 d!125991))

(declare-fun d!125993 () Bool)

(declare-fun lt!459223 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!522 (List!21970) (InoxSet (_ BitVec 64)))

(assert (=> d!125993 (= lt!459223 (select (content!522 Nil!21967) (select (arr!31599 lt!459121) #b00000000000000000000000000000000)))))

(declare-fun e!590115 () Bool)

(assert (=> d!125993 (= lt!459223 e!590115)))

(declare-fun res!694339 () Bool)

(assert (=> d!125993 (=> (not res!694339) (not e!590115))))

(assert (=> d!125993 (= res!694339 ((_ is Cons!21966) Nil!21967))))

(assert (=> d!125993 (= (contains!6055 Nil!21967 (select (arr!31599 lt!459121) #b00000000000000000000000000000000)) lt!459223)))

(declare-fun b!1041909 () Bool)

(declare-fun e!590114 () Bool)

(assert (=> b!1041909 (= e!590115 e!590114)))

(declare-fun res!694338 () Bool)

(assert (=> b!1041909 (=> res!694338 e!590114)))

(assert (=> b!1041909 (= res!694338 (= (h!23172 Nil!21967) (select (arr!31599 lt!459121) #b00000000000000000000000000000000)))))

(declare-fun b!1041910 () Bool)

(assert (=> b!1041910 (= e!590114 (contains!6055 (t!31184 Nil!21967) (select (arr!31599 lt!459121) #b00000000000000000000000000000000)))))

(assert (= (and d!125993 res!694339) b!1041909))

(assert (= (and b!1041909 (not res!694338)) b!1041910))

(declare-fun m!961289 () Bool)

(assert (=> d!125993 m!961289))

(assert (=> d!125993 m!961145))

(declare-fun m!961291 () Bool)

(assert (=> d!125993 m!961291))

(assert (=> b!1041910 m!961145))

(declare-fun m!961293 () Bool)

(assert (=> b!1041910 m!961293))

(assert (=> b!1041726 d!125993))

(assert (=> b!1041708 d!125953))

(declare-fun d!125995 () Bool)

(assert (=> d!125995 (= (validKeyInArray!0 (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31599 (_keys!11596 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041733 d!125995))

(declare-fun b!1041911 () Bool)

(declare-fun e!590116 () Bool)

(declare-fun call!44144 () Bool)

(assert (=> b!1041911 (= e!590116 call!44144)))

(declare-fun bm!44141 () Bool)

(declare-fun c!105746 () Bool)

(assert (=> bm!44141 (= call!44144 (arrayNoDuplicates!0 lt!459121 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105746 (Cons!21966 (select (arr!31599 lt!459121) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105693 (Cons!21966 (select (arr!31599 lt!459121) #b00000000000000000000000000000000) Nil!21967) Nil!21967)) (ite c!105693 (Cons!21966 (select (arr!31599 lt!459121) #b00000000000000000000000000000000) Nil!21967) Nil!21967))))))

(declare-fun b!1041912 () Bool)

(declare-fun e!590119 () Bool)

(assert (=> b!1041912 (= e!590119 (contains!6055 (ite c!105693 (Cons!21966 (select (arr!31599 lt!459121) #b00000000000000000000000000000000) Nil!21967) Nil!21967) (select (arr!31599 lt!459121) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041913 () Bool)

(declare-fun e!590118 () Bool)

(assert (=> b!1041913 (= e!590118 e!590116)))

(assert (=> b!1041913 (= c!105746 (validKeyInArray!0 (select (arr!31599 lt!459121) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125997 () Bool)

(declare-fun res!694342 () Bool)

(declare-fun e!590117 () Bool)

(assert (=> d!125997 (=> res!694342 e!590117)))

(assert (=> d!125997 (= res!694342 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32132 lt!459121)))))

(assert (=> d!125997 (= (arrayNoDuplicates!0 lt!459121 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105693 (Cons!21966 (select (arr!31599 lt!459121) #b00000000000000000000000000000000) Nil!21967) Nil!21967)) e!590117)))

(declare-fun b!1041914 () Bool)

(assert (=> b!1041914 (= e!590117 e!590118)))

(declare-fun res!694341 () Bool)

(assert (=> b!1041914 (=> (not res!694341) (not e!590118))))

(assert (=> b!1041914 (= res!694341 (not e!590119))))

(declare-fun res!694340 () Bool)

(assert (=> b!1041914 (=> (not res!694340) (not e!590119))))

(assert (=> b!1041914 (= res!694340 (validKeyInArray!0 (select (arr!31599 lt!459121) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041915 () Bool)

(assert (=> b!1041915 (= e!590116 call!44144)))

(assert (= (and d!125997 (not res!694342)) b!1041914))

(assert (= (and b!1041914 res!694340) b!1041912))

(assert (= (and b!1041914 res!694341) b!1041913))

(assert (= (and b!1041913 c!105746) b!1041915))

(assert (= (and b!1041913 (not c!105746)) b!1041911))

(assert (= (or b!1041915 b!1041911) bm!44141))

(assert (=> bm!44141 m!961207))

(declare-fun m!961295 () Bool)

(assert (=> bm!44141 m!961295))

(assert (=> b!1041912 m!961207))

(assert (=> b!1041912 m!961207))

(declare-fun m!961297 () Bool)

(assert (=> b!1041912 m!961297))

(assert (=> b!1041913 m!961207))

(assert (=> b!1041913 m!961207))

(assert (=> b!1041913 m!961233))

(assert (=> b!1041914 m!961207))

(assert (=> b!1041914 m!961207))

(assert (=> b!1041914 m!961233))

(assert (=> bm!44128 d!125997))

(declare-fun b!1041916 () Bool)

(declare-fun e!590120 () Bool)

(assert (=> b!1041916 (= e!590120 tp_is_empty!24765)))

(declare-fun mapNonEmpty!38752 () Bool)

(declare-fun mapRes!38752 () Bool)

(declare-fun tp!74360 () Bool)

(assert (=> mapNonEmpty!38752 (= mapRes!38752 (and tp!74360 e!590120))))

(declare-fun mapRest!38752 () (Array (_ BitVec 32) ValueCell!11679))

(declare-fun mapValue!38752 () ValueCell!11679)

(declare-fun mapKey!38752 () (_ BitVec 32))

(assert (=> mapNonEmpty!38752 (= mapRest!38751 (store mapRest!38752 mapKey!38752 mapValue!38752))))

(declare-fun condMapEmpty!38752 () Bool)

(declare-fun mapDefault!38752 () ValueCell!11679)

(assert (=> mapNonEmpty!38751 (= condMapEmpty!38752 (= mapRest!38751 ((as const (Array (_ BitVec 32) ValueCell!11679)) mapDefault!38752)))))

(declare-fun e!590121 () Bool)

(assert (=> mapNonEmpty!38751 (= tp!74359 (and e!590121 mapRes!38752))))

(declare-fun mapIsEmpty!38752 () Bool)

(assert (=> mapIsEmpty!38752 mapRes!38752))

(declare-fun b!1041917 () Bool)

(assert (=> b!1041917 (= e!590121 tp_is_empty!24765)))

(assert (= (and mapNonEmpty!38751 condMapEmpty!38752) mapIsEmpty!38752))

(assert (= (and mapNonEmpty!38751 (not condMapEmpty!38752)) mapNonEmpty!38752))

(assert (= (and mapNonEmpty!38752 ((_ is ValueCellFull!11679) mapValue!38752)) b!1041916))

(assert (= (and mapNonEmpty!38751 ((_ is ValueCellFull!11679) mapDefault!38752)) b!1041917))

(declare-fun m!961299 () Bool)

(assert (=> mapNonEmpty!38752 m!961299))

(check-sat (not b!1041898) (not bm!44140) (not b!1041887) (not bm!44139) (not b!1041913) (not bm!44133) (not b!1041792) (not b!1041796) (not bm!44136) (not b!1041912) (not b!1041892) (not bm!44135) (not d!125951) (not b!1041793) (not bm!44141) (not bm!44134) (not b!1041902) (not b!1041791) (not b!1041869) (not b!1041798) (not b!1041891) (not b!1041864) (not b!1041904) (not bm!44138) (not d!125983) (not b!1041910) (not b!1041811) (not d!125945) (not d!125959) (not b_next!21045) (not b!1041810) (not d!125967) (not d!125979) (not b!1041896) (not b!1041816) b_and!33577 (not d!125947) (not b!1041847) (not b!1041900) (not bm!44137) (not mapNonEmpty!38752) tp_is_empty!24765 (not d!125977) (not b!1041800) (not b!1041893) (not b!1041837) (not d!125973) (not b!1041914) (not b!1041871) (not d!125993))
(check-sat b_and!33577 (not b_next!21045))
