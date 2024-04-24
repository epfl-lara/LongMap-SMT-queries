; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91016 () Bool)

(assert start!91016)

(declare-fun b!1039139 () Bool)

(declare-fun b_free!20917 () Bool)

(declare-fun b_next!20917 () Bool)

(assert (=> b!1039139 (= b_free!20917 (not b_next!20917))))

(declare-fun tp!73905 () Bool)

(declare-fun b_and!33459 () Bool)

(assert (=> b!1039139 (= tp!73905 b_and!33459)))

(declare-fun b!1039132 () Bool)

(declare-fun res!692879 () Bool)

(declare-fun e!587986 () Bool)

(assert (=> b!1039132 (=> res!692879 e!587986)))

(declare-datatypes ((List!21913 0))(
  ( (Nil!21910) (Cons!21909 (h!23121 (_ BitVec 64)) (t!31119 List!21913)) )
))
(declare-fun contains!6053 (List!21913 (_ BitVec 64)) Bool)

(assert (=> b!1039132 (= res!692879 (contains!6053 Nil!21910 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38493 () Bool)

(declare-fun mapRes!38493 () Bool)

(declare-fun tp!73906 () Bool)

(declare-fun e!587987 () Bool)

(assert (=> mapNonEmpty!38493 (= mapRes!38493 (and tp!73906 e!587987))))

(declare-datatypes ((V!37723 0))(
  ( (V!37724 (val!12369 Int)) )
))
(declare-datatypes ((ValueCell!11615 0))(
  ( (ValueCellFull!11615 (v!14949 V!37723)) (EmptyCell!11615) )
))
(declare-fun mapValue!38493 () ValueCell!11615)

(declare-fun mapKey!38493 () (_ BitVec 32))

(declare-fun mapRest!38493 () (Array (_ BitVec 32) ValueCell!11615))

(declare-datatypes ((array!65433 0))(
  ( (array!65434 (arr!31489 (Array (_ BitVec 32) (_ BitVec 64))) (size!32020 (_ BitVec 32))) )
))
(declare-datatypes ((array!65435 0))(
  ( (array!65436 (arr!31490 (Array (_ BitVec 32) ValueCell!11615)) (size!32021 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5824 0))(
  ( (LongMapFixedSize!5825 (defaultEntry!6294 Int) (mask!30282 (_ BitVec 32)) (extraKeys!6022 (_ BitVec 32)) (zeroValue!6128 V!37723) (minValue!6128 V!37723) (_size!2967 (_ BitVec 32)) (_keys!11531 array!65433) (_values!6317 array!65435) (_vacant!2967 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5824)

(assert (=> mapNonEmpty!38493 (= (arr!31490 (_values!6317 thiss!1427)) (store mapRest!38493 mapKey!38493 mapValue!38493))))

(declare-fun b!1039133 () Bool)

(declare-fun e!587983 () Bool)

(declare-fun tp_is_empty!24637 () Bool)

(assert (=> b!1039133 (= e!587983 tp_is_empty!24637)))

(declare-fun b!1039134 () Bool)

(declare-fun res!692880 () Bool)

(declare-fun e!587981 () Bool)

(assert (=> b!1039134 (=> (not res!692880) (not e!587981))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039134 (= res!692880 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38493 () Bool)

(assert (=> mapIsEmpty!38493 mapRes!38493))

(declare-fun b!1039135 () Bool)

(declare-fun res!692882 () Bool)

(assert (=> b!1039135 (=> res!692882 e!587986)))

(declare-fun noDuplicate!1490 (List!21913) Bool)

(assert (=> b!1039135 (= res!692882 (not (noDuplicate!1490 Nil!21910)))))

(declare-fun b!1039136 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65433 (_ BitVec 32) List!21913) Bool)

(assert (=> b!1039136 (= e!587986 (arrayNoDuplicates!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 Nil!21910))))

(declare-fun b!1039137 () Bool)

(declare-fun res!692877 () Bool)

(assert (=> b!1039137 (=> res!692877 e!587986)))

(assert (=> b!1039137 (= res!692877 (contains!6053 Nil!21910 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039138 () Bool)

(declare-fun e!587984 () Bool)

(assert (=> b!1039138 (= e!587984 (and e!587983 mapRes!38493))))

(declare-fun condMapEmpty!38493 () Bool)

(declare-fun mapDefault!38493 () ValueCell!11615)

(assert (=> b!1039138 (= condMapEmpty!38493 (= (arr!31490 (_values!6317 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11615)) mapDefault!38493)))))

(declare-fun e!587982 () Bool)

(declare-fun array_inv!24359 (array!65433) Bool)

(declare-fun array_inv!24360 (array!65435) Bool)

(assert (=> b!1039139 (= e!587982 (and tp!73905 tp_is_empty!24637 (array_inv!24359 (_keys!11531 thiss!1427)) (array_inv!24360 (_values!6317 thiss!1427)) e!587984))))

(declare-fun b!1039140 () Bool)

(declare-fun e!587988 () Bool)

(assert (=> b!1039140 (= e!587981 e!587988)))

(declare-fun res!692876 () Bool)

(assert (=> b!1039140 (=> (not res!692876) (not e!587988))))

(declare-datatypes ((SeekEntryResult!9716 0))(
  ( (MissingZero!9716 (index!41235 (_ BitVec 32))) (Found!9716 (index!41236 (_ BitVec 32))) (Intermediate!9716 (undefined!10528 Bool) (index!41237 (_ BitVec 32)) (x!92577 (_ BitVec 32))) (Undefined!9716) (MissingVacant!9716 (index!41238 (_ BitVec 32))) )
))
(declare-fun lt!458104 () SeekEntryResult!9716)

(get-info :version)

(assert (=> b!1039140 (= res!692876 ((_ is Found!9716) lt!458104))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65433 (_ BitVec 32)) SeekEntryResult!9716)

(assert (=> b!1039140 (= lt!458104 (seekEntry!0 key!909 (_keys!11531 thiss!1427) (mask!30282 thiss!1427)))))

(declare-fun res!692881 () Bool)

(assert (=> start!91016 (=> (not res!692881) (not e!587981))))

(declare-fun valid!2200 (LongMapFixedSize!5824) Bool)

(assert (=> start!91016 (= res!692881 (valid!2200 thiss!1427))))

(assert (=> start!91016 e!587981))

(assert (=> start!91016 e!587982))

(assert (=> start!91016 true))

(declare-fun b!1039141 () Bool)

(assert (=> b!1039141 (= e!587987 tp_is_empty!24637)))

(declare-fun b!1039142 () Bool)

(assert (=> b!1039142 (= e!587988 (not e!587986))))

(declare-fun res!692878 () Bool)

(assert (=> b!1039142 (=> res!692878 e!587986)))

(assert (=> b!1039142 (= res!692878 (or (bvsge (size!32020 (_keys!11531 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65433 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039142 (= (arrayCountValidKeys!0 (array!65434 (store (arr!31489 (_keys!11531 thiss!1427)) (index!41236 lt!458104) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32020 (_keys!11531 thiss!1427))) #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33961 0))(
  ( (Unit!33962) )
))
(declare-fun lt!458105 () Unit!33961)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65433 (_ BitVec 32) (_ BitVec 64)) Unit!33961)

(assert (=> b!1039142 (= lt!458105 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11531 thiss!1427) (index!41236 lt!458104) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!91016 res!692881) b!1039134))

(assert (= (and b!1039134 res!692880) b!1039140))

(assert (= (and b!1039140 res!692876) b!1039142))

(assert (= (and b!1039142 (not res!692878)) b!1039135))

(assert (= (and b!1039135 (not res!692882)) b!1039132))

(assert (= (and b!1039132 (not res!692879)) b!1039137))

(assert (= (and b!1039137 (not res!692877)) b!1039136))

(assert (= (and b!1039138 condMapEmpty!38493) mapIsEmpty!38493))

(assert (= (and b!1039138 (not condMapEmpty!38493)) mapNonEmpty!38493))

(assert (= (and mapNonEmpty!38493 ((_ is ValueCellFull!11615) mapValue!38493)) b!1039141))

(assert (= (and b!1039138 ((_ is ValueCellFull!11615) mapDefault!38493)) b!1039133))

(assert (= b!1039139 b!1039138))

(assert (= start!91016 b!1039139))

(declare-fun m!959589 () Bool)

(assert (=> b!1039136 m!959589))

(declare-fun m!959591 () Bool)

(assert (=> b!1039132 m!959591))

(declare-fun m!959593 () Bool)

(assert (=> b!1039140 m!959593))

(declare-fun m!959595 () Bool)

(assert (=> b!1039139 m!959595))

(declare-fun m!959597 () Bool)

(assert (=> b!1039139 m!959597))

(declare-fun m!959599 () Bool)

(assert (=> b!1039135 m!959599))

(declare-fun m!959601 () Bool)

(assert (=> mapNonEmpty!38493 m!959601))

(declare-fun m!959603 () Bool)

(assert (=> b!1039142 m!959603))

(declare-fun m!959605 () Bool)

(assert (=> b!1039142 m!959605))

(declare-fun m!959607 () Bool)

(assert (=> b!1039142 m!959607))

(declare-fun m!959609 () Bool)

(assert (=> b!1039142 m!959609))

(declare-fun m!959611 () Bool)

(assert (=> start!91016 m!959611))

(declare-fun m!959613 () Bool)

(assert (=> b!1039137 m!959613))

(check-sat tp_is_empty!24637 (not start!91016) (not b!1039136) (not b_next!20917) (not b!1039139) (not b!1039135) (not b!1039140) (not b!1039132) (not mapNonEmpty!38493) (not b!1039137) b_and!33459 (not b!1039142))
(check-sat b_and!33459 (not b_next!20917))
(get-model)

(declare-fun d!125743 () Bool)

(assert (=> d!125743 (= (array_inv!24359 (_keys!11531 thiss!1427)) (bvsge (size!32020 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039139 d!125743))

(declare-fun d!125745 () Bool)

(assert (=> d!125745 (= (array_inv!24360 (_values!6317 thiss!1427)) (bvsge (size!32021 (_values!6317 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039139 d!125745))

(declare-fun d!125747 () Bool)

(declare-fun res!692931 () Bool)

(declare-fun e!588039 () Bool)

(assert (=> d!125747 (=> (not res!692931) (not e!588039))))

(declare-fun simpleValid!420 (LongMapFixedSize!5824) Bool)

(assert (=> d!125747 (= res!692931 (simpleValid!420 thiss!1427))))

(assert (=> d!125747 (= (valid!2200 thiss!1427) e!588039)))

(declare-fun b!1039215 () Bool)

(declare-fun res!692932 () Bool)

(assert (=> b!1039215 (=> (not res!692932) (not e!588039))))

(assert (=> b!1039215 (= res!692932 (= (arrayCountValidKeys!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))) (_size!2967 thiss!1427)))))

(declare-fun b!1039216 () Bool)

(declare-fun res!692933 () Bool)

(assert (=> b!1039216 (=> (not res!692933) (not e!588039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65433 (_ BitVec 32)) Bool)

(assert (=> b!1039216 (= res!692933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11531 thiss!1427) (mask!30282 thiss!1427)))))

(declare-fun b!1039217 () Bool)

(assert (=> b!1039217 (= e!588039 (arrayNoDuplicates!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 Nil!21910))))

(assert (= (and d!125747 res!692931) b!1039215))

(assert (= (and b!1039215 res!692932) b!1039216))

(assert (= (and b!1039216 res!692933) b!1039217))

(declare-fun m!959667 () Bool)

(assert (=> d!125747 m!959667))

(assert (=> b!1039215 m!959607))

(declare-fun m!959669 () Bool)

(assert (=> b!1039216 m!959669))

(assert (=> b!1039217 m!959589))

(assert (=> start!91016 d!125747))

(declare-fun d!125749 () Bool)

(declare-fun lt!458120 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!520 (List!21913) (InoxSet (_ BitVec 64)))

(assert (=> d!125749 (= lt!458120 (select (content!520 Nil!21910) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588044 () Bool)

(assert (=> d!125749 (= lt!458120 e!588044)))

(declare-fun res!692938 () Bool)

(assert (=> d!125749 (=> (not res!692938) (not e!588044))))

(assert (=> d!125749 (= res!692938 ((_ is Cons!21909) Nil!21910))))

(assert (=> d!125749 (= (contains!6053 Nil!21910 #b1000000000000000000000000000000000000000000000000000000000000000) lt!458120)))

(declare-fun b!1039222 () Bool)

(declare-fun e!588045 () Bool)

(assert (=> b!1039222 (= e!588044 e!588045)))

(declare-fun res!692939 () Bool)

(assert (=> b!1039222 (=> res!692939 e!588045)))

(assert (=> b!1039222 (= res!692939 (= (h!23121 Nil!21910) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039223 () Bool)

(assert (=> b!1039223 (= e!588045 (contains!6053 (t!31119 Nil!21910) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125749 res!692938) b!1039222))

(assert (= (and b!1039222 (not res!692939)) b!1039223))

(declare-fun m!959671 () Bool)

(assert (=> d!125749 m!959671))

(declare-fun m!959673 () Bool)

(assert (=> d!125749 m!959673))

(declare-fun m!959675 () Bool)

(assert (=> b!1039223 m!959675))

(assert (=> b!1039137 d!125749))

(declare-fun b!1039232 () Bool)

(declare-fun e!588050 () (_ BitVec 32))

(declare-fun call!43997 () (_ BitVec 32))

(assert (=> b!1039232 (= e!588050 call!43997)))

(declare-fun b!1039233 () Bool)

(declare-fun e!588051 () (_ BitVec 32))

(assert (=> b!1039233 (= e!588051 e!588050)))

(declare-fun c!105573 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039233 (= c!105573 (validKeyInArray!0 (select (arr!31489 (array!65434 (store (arr!31489 (_keys!11531 thiss!1427)) (index!41236 lt!458104) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32020 (_keys!11531 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43994 () Bool)

(assert (=> bm!43994 (= call!43997 (arrayCountValidKeys!0 (array!65434 (store (arr!31489 (_keys!11531 thiss!1427)) (index!41236 lt!458104) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32020 (_keys!11531 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32020 (_keys!11531 thiss!1427))))))

(declare-fun d!125751 () Bool)

(declare-fun lt!458123 () (_ BitVec 32))

(assert (=> d!125751 (and (bvsge lt!458123 #b00000000000000000000000000000000) (bvsle lt!458123 (bvsub (size!32020 (array!65434 (store (arr!31489 (_keys!11531 thiss!1427)) (index!41236 lt!458104) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32020 (_keys!11531 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125751 (= lt!458123 e!588051)))

(declare-fun c!105574 () Bool)

(assert (=> d!125751 (= c!105574 (bvsge #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))))))

(assert (=> d!125751 (and (bvsle #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32020 (_keys!11531 thiss!1427)) (size!32020 (array!65434 (store (arr!31489 (_keys!11531 thiss!1427)) (index!41236 lt!458104) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32020 (_keys!11531 thiss!1427))))))))

(assert (=> d!125751 (= (arrayCountValidKeys!0 (array!65434 (store (arr!31489 (_keys!11531 thiss!1427)) (index!41236 lt!458104) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32020 (_keys!11531 thiss!1427))) #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))) lt!458123)))

(declare-fun b!1039234 () Bool)

(assert (=> b!1039234 (= e!588050 (bvadd #b00000000000000000000000000000001 call!43997))))

(declare-fun b!1039235 () Bool)

(assert (=> b!1039235 (= e!588051 #b00000000000000000000000000000000)))

(assert (= (and d!125751 c!105574) b!1039235))

(assert (= (and d!125751 (not c!105574)) b!1039233))

(assert (= (and b!1039233 c!105573) b!1039234))

(assert (= (and b!1039233 (not c!105573)) b!1039232))

(assert (= (or b!1039234 b!1039232) bm!43994))

(declare-fun m!959677 () Bool)

(assert (=> b!1039233 m!959677))

(assert (=> b!1039233 m!959677))

(declare-fun m!959679 () Bool)

(assert (=> b!1039233 m!959679))

(declare-fun m!959681 () Bool)

(assert (=> bm!43994 m!959681))

(assert (=> b!1039142 d!125751))

(declare-fun b!1039236 () Bool)

(declare-fun e!588052 () (_ BitVec 32))

(declare-fun call!43998 () (_ BitVec 32))

(assert (=> b!1039236 (= e!588052 call!43998)))

(declare-fun b!1039237 () Bool)

(declare-fun e!588053 () (_ BitVec 32))

(assert (=> b!1039237 (= e!588053 e!588052)))

(declare-fun c!105575 () Bool)

(assert (=> b!1039237 (= c!105575 (validKeyInArray!0 (select (arr!31489 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43995 () Bool)

(assert (=> bm!43995 (= call!43998 (arrayCountValidKeys!0 (_keys!11531 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32020 (_keys!11531 thiss!1427))))))

(declare-fun d!125753 () Bool)

(declare-fun lt!458124 () (_ BitVec 32))

(assert (=> d!125753 (and (bvsge lt!458124 #b00000000000000000000000000000000) (bvsle lt!458124 (bvsub (size!32020 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125753 (= lt!458124 e!588053)))

(declare-fun c!105576 () Bool)

(assert (=> d!125753 (= c!105576 (bvsge #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))))))

(assert (=> d!125753 (and (bvsle #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32020 (_keys!11531 thiss!1427)) (size!32020 (_keys!11531 thiss!1427))))))

(assert (=> d!125753 (= (arrayCountValidKeys!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))) lt!458124)))

(declare-fun b!1039238 () Bool)

(assert (=> b!1039238 (= e!588052 (bvadd #b00000000000000000000000000000001 call!43998))))

(declare-fun b!1039239 () Bool)

(assert (=> b!1039239 (= e!588053 #b00000000000000000000000000000000)))

(assert (= (and d!125753 c!105576) b!1039239))

(assert (= (and d!125753 (not c!105576)) b!1039237))

(assert (= (and b!1039237 c!105575) b!1039238))

(assert (= (and b!1039237 (not c!105575)) b!1039236))

(assert (= (or b!1039238 b!1039236) bm!43995))

(declare-fun m!959683 () Bool)

(assert (=> b!1039237 m!959683))

(assert (=> b!1039237 m!959683))

(declare-fun m!959685 () Bool)

(assert (=> b!1039237 m!959685))

(declare-fun m!959687 () Bool)

(assert (=> bm!43995 m!959687))

(assert (=> b!1039142 d!125753))

(declare-fun b!1039250 () Bool)

(declare-fun e!588059 () Bool)

(assert (=> b!1039250 (= e!588059 (bvslt (size!32020 (_keys!11531 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1039251 () Bool)

(declare-fun e!588058 () Bool)

(assert (=> b!1039251 (= e!588058 (= (arrayCountValidKeys!0 (array!65434 (store (arr!31489 (_keys!11531 thiss!1427)) (index!41236 lt!458104) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32020 (_keys!11531 thiss!1427))) #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039249 () Bool)

(declare-fun res!692949 () Bool)

(assert (=> b!1039249 (=> (not res!692949) (not e!588059))))

(assert (=> b!1039249 (= res!692949 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125755 () Bool)

(assert (=> d!125755 e!588058))

(declare-fun res!692948 () Bool)

(assert (=> d!125755 (=> (not res!692948) (not e!588058))))

(assert (=> d!125755 (= res!692948 (and (bvsge (index!41236 lt!458104) #b00000000000000000000000000000000) (bvslt (index!41236 lt!458104) (size!32020 (_keys!11531 thiss!1427)))))))

(declare-fun lt!458127 () Unit!33961)

(declare-fun choose!82 (array!65433 (_ BitVec 32) (_ BitVec 64)) Unit!33961)

(assert (=> d!125755 (= lt!458127 (choose!82 (_keys!11531 thiss!1427) (index!41236 lt!458104) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125755 e!588059))

(declare-fun res!692951 () Bool)

(assert (=> d!125755 (=> (not res!692951) (not e!588059))))

(assert (=> d!125755 (= res!692951 (and (bvsge (index!41236 lt!458104) #b00000000000000000000000000000000) (bvslt (index!41236 lt!458104) (size!32020 (_keys!11531 thiss!1427)))))))

(assert (=> d!125755 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11531 thiss!1427) (index!41236 lt!458104) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458127)))

(declare-fun b!1039248 () Bool)

(declare-fun res!692950 () Bool)

(assert (=> b!1039248 (=> (not res!692950) (not e!588059))))

(assert (=> b!1039248 (= res!692950 (validKeyInArray!0 (select (arr!31489 (_keys!11531 thiss!1427)) (index!41236 lt!458104))))))

(assert (= (and d!125755 res!692951) b!1039248))

(assert (= (and b!1039248 res!692950) b!1039249))

(assert (= (and b!1039249 res!692949) b!1039250))

(assert (= (and d!125755 res!692948) b!1039251))

(assert (=> b!1039251 m!959603))

(assert (=> b!1039251 m!959605))

(assert (=> b!1039251 m!959607))

(declare-fun m!959689 () Bool)

(assert (=> b!1039249 m!959689))

(declare-fun m!959691 () Bool)

(assert (=> d!125755 m!959691))

(declare-fun m!959693 () Bool)

(assert (=> b!1039248 m!959693))

(assert (=> b!1039248 m!959693))

(declare-fun m!959695 () Bool)

(assert (=> b!1039248 m!959695))

(assert (=> b!1039142 d!125755))

(declare-fun b!1039262 () Bool)

(declare-fun e!588070 () Bool)

(declare-fun call!44001 () Bool)

(assert (=> b!1039262 (= e!588070 call!44001)))

(declare-fun b!1039263 () Bool)

(declare-fun e!588071 () Bool)

(assert (=> b!1039263 (= e!588071 (contains!6053 Nil!21910 (select (arr!31489 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43998 () Bool)

(declare-fun c!105579 () Bool)

(assert (=> bm!43998 (= call!44001 (arrayNoDuplicates!0 (_keys!11531 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105579 (Cons!21909 (select (arr!31489 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000) Nil!21910) Nil!21910)))))

(declare-fun b!1039264 () Bool)

(assert (=> b!1039264 (= e!588070 call!44001)))

(declare-fun d!125757 () Bool)

(declare-fun res!692960 () Bool)

(declare-fun e!588068 () Bool)

(assert (=> d!125757 (=> res!692960 e!588068)))

(assert (=> d!125757 (= res!692960 (bvsge #b00000000000000000000000000000000 (size!32020 (_keys!11531 thiss!1427))))))

(assert (=> d!125757 (= (arrayNoDuplicates!0 (_keys!11531 thiss!1427) #b00000000000000000000000000000000 Nil!21910) e!588068)))

(declare-fun b!1039265 () Bool)

(declare-fun e!588069 () Bool)

(assert (=> b!1039265 (= e!588069 e!588070)))

(assert (=> b!1039265 (= c!105579 (validKeyInArray!0 (select (arr!31489 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039266 () Bool)

(assert (=> b!1039266 (= e!588068 e!588069)))

(declare-fun res!692958 () Bool)

(assert (=> b!1039266 (=> (not res!692958) (not e!588069))))

(assert (=> b!1039266 (= res!692958 (not e!588071))))

(declare-fun res!692959 () Bool)

(assert (=> b!1039266 (=> (not res!692959) (not e!588071))))

(assert (=> b!1039266 (= res!692959 (validKeyInArray!0 (select (arr!31489 (_keys!11531 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125757 (not res!692960)) b!1039266))

(assert (= (and b!1039266 res!692959) b!1039263))

(assert (= (and b!1039266 res!692958) b!1039265))

(assert (= (and b!1039265 c!105579) b!1039262))

(assert (= (and b!1039265 (not c!105579)) b!1039264))

(assert (= (or b!1039262 b!1039264) bm!43998))

(assert (=> b!1039263 m!959683))

(assert (=> b!1039263 m!959683))

(declare-fun m!959697 () Bool)

(assert (=> b!1039263 m!959697))

(assert (=> bm!43998 m!959683))

(declare-fun m!959699 () Bool)

(assert (=> bm!43998 m!959699))

(assert (=> b!1039265 m!959683))

(assert (=> b!1039265 m!959683))

(assert (=> b!1039265 m!959685))

(assert (=> b!1039266 m!959683))

(assert (=> b!1039266 m!959683))

(assert (=> b!1039266 m!959685))

(assert (=> b!1039136 d!125757))

(declare-fun d!125759 () Bool)

(declare-fun res!692965 () Bool)

(declare-fun e!588076 () Bool)

(assert (=> d!125759 (=> res!692965 e!588076)))

(assert (=> d!125759 (= res!692965 ((_ is Nil!21910) Nil!21910))))

(assert (=> d!125759 (= (noDuplicate!1490 Nil!21910) e!588076)))

(declare-fun b!1039271 () Bool)

(declare-fun e!588077 () Bool)

(assert (=> b!1039271 (= e!588076 e!588077)))

(declare-fun res!692966 () Bool)

(assert (=> b!1039271 (=> (not res!692966) (not e!588077))))

(assert (=> b!1039271 (= res!692966 (not (contains!6053 (t!31119 Nil!21910) (h!23121 Nil!21910))))))

(declare-fun b!1039272 () Bool)

(assert (=> b!1039272 (= e!588077 (noDuplicate!1490 (t!31119 Nil!21910)))))

(assert (= (and d!125759 (not res!692965)) b!1039271))

(assert (= (and b!1039271 res!692966) b!1039272))

(declare-fun m!959701 () Bool)

(assert (=> b!1039271 m!959701))

(declare-fun m!959703 () Bool)

(assert (=> b!1039272 m!959703))

(assert (=> b!1039135 d!125759))

(declare-fun d!125761 () Bool)

(declare-fun lt!458128 () Bool)

(assert (=> d!125761 (= lt!458128 (select (content!520 Nil!21910) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588078 () Bool)

(assert (=> d!125761 (= lt!458128 e!588078)))

(declare-fun res!692967 () Bool)

(assert (=> d!125761 (=> (not res!692967) (not e!588078))))

(assert (=> d!125761 (= res!692967 ((_ is Cons!21909) Nil!21910))))

(assert (=> d!125761 (= (contains!6053 Nil!21910 #b0000000000000000000000000000000000000000000000000000000000000000) lt!458128)))

(declare-fun b!1039273 () Bool)

(declare-fun e!588079 () Bool)

(assert (=> b!1039273 (= e!588078 e!588079)))

(declare-fun res!692968 () Bool)

(assert (=> b!1039273 (=> res!692968 e!588079)))

(assert (=> b!1039273 (= res!692968 (= (h!23121 Nil!21910) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039274 () Bool)

(assert (=> b!1039274 (= e!588079 (contains!6053 (t!31119 Nil!21910) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125761 res!692967) b!1039273))

(assert (= (and b!1039273 (not res!692968)) b!1039274))

(assert (=> d!125761 m!959671))

(declare-fun m!959705 () Bool)

(assert (=> d!125761 m!959705))

(declare-fun m!959707 () Bool)

(assert (=> b!1039274 m!959707))

(assert (=> b!1039132 d!125761))

(declare-fun b!1039287 () Bool)

(declare-fun e!588086 () SeekEntryResult!9716)

(declare-fun lt!458137 () SeekEntryResult!9716)

(assert (=> b!1039287 (= e!588086 (MissingZero!9716 (index!41237 lt!458137)))))

(declare-fun b!1039288 () Bool)

(declare-fun e!588087 () SeekEntryResult!9716)

(assert (=> b!1039288 (= e!588087 (Found!9716 (index!41237 lt!458137)))))

(declare-fun b!1039289 () Bool)

(declare-fun e!588088 () SeekEntryResult!9716)

(assert (=> b!1039289 (= e!588088 e!588087)))

(declare-fun lt!458140 () (_ BitVec 64))

(assert (=> b!1039289 (= lt!458140 (select (arr!31489 (_keys!11531 thiss!1427)) (index!41237 lt!458137)))))

(declare-fun c!105588 () Bool)

(assert (=> b!1039289 (= c!105588 (= lt!458140 key!909))))

(declare-fun b!1039290 () Bool)

(declare-fun c!105586 () Bool)

(assert (=> b!1039290 (= c!105586 (= lt!458140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1039290 (= e!588087 e!588086)))

(declare-fun b!1039291 () Bool)

(declare-fun lt!458139 () SeekEntryResult!9716)

(assert (=> b!1039291 (= e!588086 (ite ((_ is MissingVacant!9716) lt!458139) (MissingZero!9716 (index!41238 lt!458139)) lt!458139))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65433 (_ BitVec 32)) SeekEntryResult!9716)

(assert (=> b!1039291 (= lt!458139 (seekKeyOrZeroReturnVacant!0 (x!92577 lt!458137) (index!41237 lt!458137) (index!41237 lt!458137) key!909 (_keys!11531 thiss!1427) (mask!30282 thiss!1427)))))

(declare-fun b!1039292 () Bool)

(assert (=> b!1039292 (= e!588088 Undefined!9716)))

(declare-fun d!125763 () Bool)

(declare-fun lt!458138 () SeekEntryResult!9716)

(assert (=> d!125763 (and (or ((_ is MissingVacant!9716) lt!458138) (not ((_ is Found!9716) lt!458138)) (and (bvsge (index!41236 lt!458138) #b00000000000000000000000000000000) (bvslt (index!41236 lt!458138) (size!32020 (_keys!11531 thiss!1427))))) (not ((_ is MissingVacant!9716) lt!458138)) (or (not ((_ is Found!9716) lt!458138)) (= (select (arr!31489 (_keys!11531 thiss!1427)) (index!41236 lt!458138)) key!909)))))

(assert (=> d!125763 (= lt!458138 e!588088)))

(declare-fun c!105587 () Bool)

(assert (=> d!125763 (= c!105587 (and ((_ is Intermediate!9716) lt!458137) (undefined!10528 lt!458137)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65433 (_ BitVec 32)) SeekEntryResult!9716)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125763 (= lt!458137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30282 thiss!1427)) key!909 (_keys!11531 thiss!1427) (mask!30282 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125763 (validMask!0 (mask!30282 thiss!1427))))

(assert (=> d!125763 (= (seekEntry!0 key!909 (_keys!11531 thiss!1427) (mask!30282 thiss!1427)) lt!458138)))

(assert (= (and d!125763 c!105587) b!1039292))

(assert (= (and d!125763 (not c!105587)) b!1039289))

(assert (= (and b!1039289 c!105588) b!1039288))

(assert (= (and b!1039289 (not c!105588)) b!1039290))

(assert (= (and b!1039290 c!105586) b!1039287))

(assert (= (and b!1039290 (not c!105586)) b!1039291))

(declare-fun m!959709 () Bool)

(assert (=> b!1039289 m!959709))

(declare-fun m!959711 () Bool)

(assert (=> b!1039291 m!959711))

(declare-fun m!959713 () Bool)

(assert (=> d!125763 m!959713))

(declare-fun m!959715 () Bool)

(assert (=> d!125763 m!959715))

(assert (=> d!125763 m!959715))

(declare-fun m!959717 () Bool)

(assert (=> d!125763 m!959717))

(declare-fun m!959719 () Bool)

(assert (=> d!125763 m!959719))

(assert (=> b!1039140 d!125763))

(declare-fun condMapEmpty!38502 () Bool)

(declare-fun mapDefault!38502 () ValueCell!11615)

(assert (=> mapNonEmpty!38493 (= condMapEmpty!38502 (= mapRest!38493 ((as const (Array (_ BitVec 32) ValueCell!11615)) mapDefault!38502)))))

(declare-fun e!588093 () Bool)

(declare-fun mapRes!38502 () Bool)

(assert (=> mapNonEmpty!38493 (= tp!73906 (and e!588093 mapRes!38502))))

(declare-fun b!1039299 () Bool)

(declare-fun e!588094 () Bool)

(assert (=> b!1039299 (= e!588094 tp_is_empty!24637)))

(declare-fun b!1039300 () Bool)

(assert (=> b!1039300 (= e!588093 tp_is_empty!24637)))

(declare-fun mapIsEmpty!38502 () Bool)

(assert (=> mapIsEmpty!38502 mapRes!38502))

(declare-fun mapNonEmpty!38502 () Bool)

(declare-fun tp!73921 () Bool)

(assert (=> mapNonEmpty!38502 (= mapRes!38502 (and tp!73921 e!588094))))

(declare-fun mapRest!38502 () (Array (_ BitVec 32) ValueCell!11615))

(declare-fun mapValue!38502 () ValueCell!11615)

(declare-fun mapKey!38502 () (_ BitVec 32))

(assert (=> mapNonEmpty!38502 (= mapRest!38493 (store mapRest!38502 mapKey!38502 mapValue!38502))))

(assert (= (and mapNonEmpty!38493 condMapEmpty!38502) mapIsEmpty!38502))

(assert (= (and mapNonEmpty!38493 (not condMapEmpty!38502)) mapNonEmpty!38502))

(assert (= (and mapNonEmpty!38502 ((_ is ValueCellFull!11615) mapValue!38502)) b!1039299))

(assert (= (and mapNonEmpty!38493 ((_ is ValueCellFull!11615) mapDefault!38502)) b!1039300))

(declare-fun m!959721 () Bool)

(assert (=> mapNonEmpty!38502 m!959721))

(check-sat (not b!1039237) (not d!125763) (not b_next!20917) (not d!125761) (not b!1039216) (not b!1039215) (not bm!43998) (not b!1039248) (not b!1039272) (not b!1039251) (not b!1039271) tp_is_empty!24637 (not b!1039217) (not b!1039223) (not b!1039266) (not d!125749) (not b!1039274) (not bm!43994) (not mapNonEmpty!38502) (not d!125747) (not b!1039265) (not b!1039249) (not b!1039291) (not d!125755) (not bm!43995) (not b!1039263) b_and!33459 (not b!1039233))
(check-sat b_and!33459 (not b_next!20917))
