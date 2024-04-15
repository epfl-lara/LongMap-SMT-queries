; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91612 () Bool)

(assert start!91612)

(declare-fun b!1042938 () Bool)

(declare-fun b_free!21079 () Bool)

(declare-fun b_next!21079 () Bool)

(assert (=> b!1042938 (= b_free!21079 (not b_next!21079))))

(declare-fun tp!74471 () Bool)

(declare-fun b_and!33585 () Bool)

(assert (=> b!1042938 (= tp!74471 b_and!33585)))

(declare-fun b!1042927 () Bool)

(declare-fun e!590851 () Bool)

(declare-fun e!590854 () Bool)

(declare-fun mapRes!38816 () Bool)

(assert (=> b!1042927 (= e!590851 (and e!590854 mapRes!38816))))

(declare-fun condMapEmpty!38816 () Bool)

(declare-datatypes ((V!37939 0))(
  ( (V!37940 (val!12450 Int)) )
))
(declare-datatypes ((ValueCell!11696 0))(
  ( (ValueCellFull!11696 (v!15040 V!37939)) (EmptyCell!11696) )
))
(declare-datatypes ((array!65697 0))(
  ( (array!65698 (arr!31602 (Array (_ BitVec 32) (_ BitVec 64))) (size!32139 (_ BitVec 32))) )
))
(declare-datatypes ((array!65699 0))(
  ( (array!65700 (arr!31603 (Array (_ BitVec 32) ValueCell!11696)) (size!32140 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5986 0))(
  ( (LongMapFixedSize!5987 (defaultEntry!6375 Int) (mask!30451 (_ BitVec 32)) (extraKeys!6103 (_ BitVec 32)) (zeroValue!6209 V!37939) (minValue!6209 V!37939) (_size!3048 (_ BitVec 32)) (_keys!11627 array!65697) (_values!6398 array!65699) (_vacant!3048 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5986)

(declare-fun mapDefault!38816 () ValueCell!11696)

(assert (=> b!1042927 (= condMapEmpty!38816 (= (arr!31603 (_values!6398 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11696)) mapDefault!38816)))))

(declare-fun mapIsEmpty!38816 () Bool)

(assert (=> mapIsEmpty!38816 mapRes!38816))

(declare-fun b!1042928 () Bool)

(declare-fun res!694889 () Bool)

(declare-fun e!590848 () Bool)

(assert (=> b!1042928 (=> res!694889 e!590848)))

(declare-datatypes ((List!22020 0))(
  ( (Nil!22017) (Cons!22016 (h!23224 (_ BitVec 64)) (t!31225 List!22020)) )
))
(declare-fun arrayNoDuplicates!0 (array!65697 (_ BitVec 32) List!22020) Bool)

(assert (=> b!1042928 (= res!694889 (not (arrayNoDuplicates!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 Nil!22017)))))

(declare-fun b!1042929 () Bool)

(declare-fun res!694890 () Bool)

(assert (=> b!1042929 (=> res!694890 e!590848)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65697 (_ BitVec 32)) Bool)

(assert (=> b!1042929 (= res!694890 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11627 thiss!1427) (mask!30451 thiss!1427))))))

(declare-fun b!1042930 () Bool)

(declare-fun e!590855 () Bool)

(assert (=> b!1042930 (= e!590855 (not e!590848))))

(declare-fun res!694888 () Bool)

(assert (=> b!1042930 (=> res!694888 e!590848)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042930 (= res!694888 (not (validMask!0 (mask!30451 thiss!1427))))))

(declare-fun lt!459550 () array!65697)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042930 (not (arrayContainsKey!0 lt!459550 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33945 0))(
  ( (Unit!33946) )
))
(declare-fun lt!459548 () Unit!33945)

(declare-datatypes ((SeekEntryResult!9824 0))(
  ( (MissingZero!9824 (index!41667 (_ BitVec 32))) (Found!9824 (index!41668 (_ BitVec 32))) (Intermediate!9824 (undefined!10636 Bool) (index!41669 (_ BitVec 32)) (x!93121 (_ BitVec 32))) (Undefined!9824) (MissingVacant!9824 (index!41670 (_ BitVec 32))) )
))
(declare-fun lt!459551 () SeekEntryResult!9824)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65697 (_ BitVec 32) (_ BitVec 64)) Unit!33945)

(assert (=> b!1042930 (= lt!459548 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11627 thiss!1427) (index!41668 lt!459551) key!909))))

(assert (=> b!1042930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459550 (mask!30451 thiss!1427))))

(declare-fun lt!459549 () Unit!33945)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65697 (_ BitVec 32) (_ BitVec 32)) Unit!33945)

(assert (=> b!1042930 (= lt!459549 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11627 thiss!1427) (index!41668 lt!459551) (mask!30451 thiss!1427)))))

(assert (=> b!1042930 (arrayNoDuplicates!0 lt!459550 #b00000000000000000000000000000000 Nil!22017)))

(declare-fun lt!459553 () Unit!33945)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65697 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22020) Unit!33945)

(assert (=> b!1042930 (= lt!459553 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11627 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41668 lt!459551) #b00000000000000000000000000000000 Nil!22017))))

(declare-fun arrayCountValidKeys!0 (array!65697 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042930 (= (arrayCountValidKeys!0 lt!459550 #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042930 (= lt!459550 (array!65698 (store (arr!31602 (_keys!11627 thiss!1427)) (index!41668 lt!459551) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11627 thiss!1427))))))

(declare-fun lt!459552 () Unit!33945)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65697 (_ BitVec 32) (_ BitVec 64)) Unit!33945)

(assert (=> b!1042930 (= lt!459552 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11627 thiss!1427) (index!41668 lt!459551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042931 () Bool)

(declare-fun e!590852 () Bool)

(assert (=> b!1042931 (= e!590852 e!590855)))

(declare-fun res!694891 () Bool)

(assert (=> b!1042931 (=> (not res!694891) (not e!590855))))

(get-info :version)

(assert (=> b!1042931 (= res!694891 ((_ is Found!9824) lt!459551))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65697 (_ BitVec 32)) SeekEntryResult!9824)

(assert (=> b!1042931 (= lt!459551 (seekEntry!0 key!909 (_keys!11627 thiss!1427) (mask!30451 thiss!1427)))))

(declare-fun b!1042932 () Bool)

(declare-fun res!694887 () Bool)

(assert (=> b!1042932 (=> (not res!694887) (not e!590852))))

(assert (=> b!1042932 (= res!694887 (not (= key!909 (bvneg key!909))))))

(declare-fun res!694892 () Bool)

(assert (=> start!91612 (=> (not res!694892) (not e!590852))))

(declare-fun valid!2239 (LongMapFixedSize!5986) Bool)

(assert (=> start!91612 (= res!694892 (valid!2239 thiss!1427))))

(assert (=> start!91612 e!590852))

(declare-fun e!590849 () Bool)

(assert (=> start!91612 e!590849))

(assert (=> start!91612 true))

(declare-fun b!1042933 () Bool)

(declare-fun tp_is_empty!24799 () Bool)

(assert (=> b!1042933 (= e!590854 tp_is_empty!24799)))

(declare-fun b!1042934 () Bool)

(assert (=> b!1042934 (= e!590848 (= (select (arr!31602 (_keys!11627 thiss!1427)) (index!41668 lt!459551)) key!909))))

(declare-fun b!1042935 () Bool)

(declare-fun res!694885 () Bool)

(assert (=> b!1042935 (=> res!694885 e!590848)))

(assert (=> b!1042935 (= res!694885 (or (not (= (size!32140 (_values!6398 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30451 thiss!1427)))) (not (= (size!32139 (_keys!11627 thiss!1427)) (size!32140 (_values!6398 thiss!1427)))) (bvslt (mask!30451 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6103 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6103 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1042936 () Bool)

(declare-fun res!694886 () Bool)

(assert (=> b!1042936 (=> res!694886 e!590848)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042936 (= res!694886 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1042937 () Bool)

(declare-fun e!590853 () Bool)

(assert (=> b!1042937 (= e!590853 tp_is_empty!24799)))

(declare-fun array_inv!24423 (array!65697) Bool)

(declare-fun array_inv!24424 (array!65699) Bool)

(assert (=> b!1042938 (= e!590849 (and tp!74471 tp_is_empty!24799 (array_inv!24423 (_keys!11627 thiss!1427)) (array_inv!24424 (_values!6398 thiss!1427)) e!590851))))

(declare-fun b!1042939 () Bool)

(declare-fun res!694893 () Bool)

(assert (=> b!1042939 (=> res!694893 e!590848)))

(assert (=> b!1042939 (= res!694893 (or (bvslt (index!41668 lt!459551) #b00000000000000000000000000000000) (bvsge (index!41668 lt!459551) (size!32139 (_keys!11627 thiss!1427)))))))

(declare-fun mapNonEmpty!38816 () Bool)

(declare-fun tp!74472 () Bool)

(assert (=> mapNonEmpty!38816 (= mapRes!38816 (and tp!74472 e!590853))))

(declare-fun mapRest!38816 () (Array (_ BitVec 32) ValueCell!11696))

(declare-fun mapValue!38816 () ValueCell!11696)

(declare-fun mapKey!38816 () (_ BitVec 32))

(assert (=> mapNonEmpty!38816 (= (arr!31603 (_values!6398 thiss!1427)) (store mapRest!38816 mapKey!38816 mapValue!38816))))

(assert (= (and start!91612 res!694892) b!1042932))

(assert (= (and b!1042932 res!694887) b!1042931))

(assert (= (and b!1042931 res!694891) b!1042930))

(assert (= (and b!1042930 (not res!694888)) b!1042935))

(assert (= (and b!1042935 (not res!694885)) b!1042929))

(assert (= (and b!1042929 (not res!694890)) b!1042928))

(assert (= (and b!1042928 (not res!694889)) b!1042939))

(assert (= (and b!1042939 (not res!694893)) b!1042936))

(assert (= (and b!1042936 (not res!694886)) b!1042934))

(assert (= (and b!1042927 condMapEmpty!38816) mapIsEmpty!38816))

(assert (= (and b!1042927 (not condMapEmpty!38816)) mapNonEmpty!38816))

(assert (= (and mapNonEmpty!38816 ((_ is ValueCellFull!11696) mapValue!38816)) b!1042937))

(assert (= (and b!1042927 ((_ is ValueCellFull!11696) mapDefault!38816)) b!1042933))

(assert (= b!1042938 b!1042927))

(assert (= start!91612 b!1042938))

(declare-fun m!961671 () Bool)

(assert (=> b!1042928 m!961671))

(declare-fun m!961673 () Bool)

(assert (=> start!91612 m!961673))

(declare-fun m!961675 () Bool)

(assert (=> b!1042934 m!961675))

(declare-fun m!961677 () Bool)

(assert (=> b!1042938 m!961677))

(declare-fun m!961679 () Bool)

(assert (=> b!1042938 m!961679))

(declare-fun m!961681 () Bool)

(assert (=> b!1042936 m!961681))

(declare-fun m!961683 () Bool)

(assert (=> b!1042930 m!961683))

(declare-fun m!961685 () Bool)

(assert (=> b!1042930 m!961685))

(declare-fun m!961687 () Bool)

(assert (=> b!1042930 m!961687))

(declare-fun m!961689 () Bool)

(assert (=> b!1042930 m!961689))

(declare-fun m!961691 () Bool)

(assert (=> b!1042930 m!961691))

(declare-fun m!961693 () Bool)

(assert (=> b!1042930 m!961693))

(declare-fun m!961695 () Bool)

(assert (=> b!1042930 m!961695))

(declare-fun m!961697 () Bool)

(assert (=> b!1042930 m!961697))

(declare-fun m!961699 () Bool)

(assert (=> b!1042930 m!961699))

(declare-fun m!961701 () Bool)

(assert (=> b!1042930 m!961701))

(declare-fun m!961703 () Bool)

(assert (=> b!1042930 m!961703))

(declare-fun m!961705 () Bool)

(assert (=> mapNonEmpty!38816 m!961705))

(declare-fun m!961707 () Bool)

(assert (=> b!1042931 m!961707))

(declare-fun m!961709 () Bool)

(assert (=> b!1042929 m!961709))

(check-sat (not b!1042929) (not mapNonEmpty!38816) (not b!1042936) (not b_next!21079) (not start!91612) tp_is_empty!24799 (not b!1042938) b_and!33585 (not b!1042930) (not b!1042931) (not b!1042928))
(check-sat b_and!33585 (not b_next!21079))
(get-model)

(declare-fun d!126071 () Bool)

(assert (=> d!126071 (= (array_inv!24423 (_keys!11627 thiss!1427)) (bvsge (size!32139 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042938 d!126071))

(declare-fun d!126073 () Bool)

(assert (=> d!126073 (= (array_inv!24424 (_values!6398 thiss!1427)) (bvsge (size!32140 (_values!6398 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042938 d!126073))

(declare-fun b!1043030 () Bool)

(declare-fun e!590911 () SeekEntryResult!9824)

(declare-fun e!590910 () SeekEntryResult!9824)

(assert (=> b!1043030 (= e!590911 e!590910)))

(declare-fun lt!459600 () (_ BitVec 64))

(declare-fun lt!459601 () SeekEntryResult!9824)

(assert (=> b!1043030 (= lt!459600 (select (arr!31602 (_keys!11627 thiss!1427)) (index!41669 lt!459601)))))

(declare-fun c!105876 () Bool)

(assert (=> b!1043030 (= c!105876 (= lt!459600 key!909))))

(declare-fun b!1043031 () Bool)

(declare-fun e!590912 () SeekEntryResult!9824)

(assert (=> b!1043031 (= e!590912 (MissingZero!9824 (index!41669 lt!459601)))))

(declare-fun b!1043032 () Bool)

(assert (=> b!1043032 (= e!590910 (Found!9824 (index!41669 lt!459601)))))

(declare-fun b!1043033 () Bool)

(declare-fun c!105877 () Bool)

(assert (=> b!1043033 (= c!105877 (= lt!459600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043033 (= e!590910 e!590912)))

(declare-fun d!126075 () Bool)

(declare-fun lt!459598 () SeekEntryResult!9824)

(assert (=> d!126075 (and (or ((_ is MissingVacant!9824) lt!459598) (not ((_ is Found!9824) lt!459598)) (and (bvsge (index!41668 lt!459598) #b00000000000000000000000000000000) (bvslt (index!41668 lt!459598) (size!32139 (_keys!11627 thiss!1427))))) (not ((_ is MissingVacant!9824) lt!459598)) (or (not ((_ is Found!9824) lt!459598)) (= (select (arr!31602 (_keys!11627 thiss!1427)) (index!41668 lt!459598)) key!909)))))

(assert (=> d!126075 (= lt!459598 e!590911)))

(declare-fun c!105875 () Bool)

(assert (=> d!126075 (= c!105875 (and ((_ is Intermediate!9824) lt!459601) (undefined!10636 lt!459601)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65697 (_ BitVec 32)) SeekEntryResult!9824)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126075 (= lt!459601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30451 thiss!1427)) key!909 (_keys!11627 thiss!1427) (mask!30451 thiss!1427)))))

(assert (=> d!126075 (validMask!0 (mask!30451 thiss!1427))))

(assert (=> d!126075 (= (seekEntry!0 key!909 (_keys!11627 thiss!1427) (mask!30451 thiss!1427)) lt!459598)))

(declare-fun b!1043034 () Bool)

(assert (=> b!1043034 (= e!590911 Undefined!9824)))

(declare-fun b!1043035 () Bool)

(declare-fun lt!459599 () SeekEntryResult!9824)

(assert (=> b!1043035 (= e!590912 (ite ((_ is MissingVacant!9824) lt!459599) (MissingZero!9824 (index!41670 lt!459599)) lt!459599))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65697 (_ BitVec 32)) SeekEntryResult!9824)

(assert (=> b!1043035 (= lt!459599 (seekKeyOrZeroReturnVacant!0 (x!93121 lt!459601) (index!41669 lt!459601) (index!41669 lt!459601) key!909 (_keys!11627 thiss!1427) (mask!30451 thiss!1427)))))

(assert (= (and d!126075 c!105875) b!1043034))

(assert (= (and d!126075 (not c!105875)) b!1043030))

(assert (= (and b!1043030 c!105876) b!1043032))

(assert (= (and b!1043030 (not c!105876)) b!1043033))

(assert (= (and b!1043033 c!105877) b!1043031))

(assert (= (and b!1043033 (not c!105877)) b!1043035))

(declare-fun m!961791 () Bool)

(assert (=> b!1043030 m!961791))

(declare-fun m!961793 () Bool)

(assert (=> d!126075 m!961793))

(declare-fun m!961795 () Bool)

(assert (=> d!126075 m!961795))

(assert (=> d!126075 m!961795))

(declare-fun m!961797 () Bool)

(assert (=> d!126075 m!961797))

(assert (=> d!126075 m!961685))

(declare-fun m!961799 () Bool)

(assert (=> b!1043035 m!961799))

(assert (=> b!1042931 d!126075))

(declare-fun d!126077 () Bool)

(assert (=> d!126077 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042936 d!126077))

(declare-fun d!126079 () Bool)

(declare-fun res!694952 () Bool)

(declare-fun e!590921 () Bool)

(assert (=> d!126079 (=> res!694952 e!590921)))

(assert (=> d!126079 (= res!694952 (bvsge #b00000000000000000000000000000000 (size!32139 lt!459550)))))

(assert (=> d!126079 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459550 (mask!30451 thiss!1427)) e!590921)))

(declare-fun b!1043044 () Bool)

(declare-fun e!590919 () Bool)

(assert (=> b!1043044 (= e!590921 e!590919)))

(declare-fun c!105880 () Bool)

(assert (=> b!1043044 (= c!105880 (validKeyInArray!0 (select (arr!31602 lt!459550) #b00000000000000000000000000000000)))))

(declare-fun b!1043045 () Bool)

(declare-fun e!590920 () Bool)

(declare-fun call!44190 () Bool)

(assert (=> b!1043045 (= e!590920 call!44190)))

(declare-fun b!1043046 () Bool)

(assert (=> b!1043046 (= e!590919 e!590920)))

(declare-fun lt!459609 () (_ BitVec 64))

(assert (=> b!1043046 (= lt!459609 (select (arr!31602 lt!459550) #b00000000000000000000000000000000))))

(declare-fun lt!459610 () Unit!33945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65697 (_ BitVec 64) (_ BitVec 32)) Unit!33945)

(assert (=> b!1043046 (= lt!459610 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459550 lt!459609 #b00000000000000000000000000000000))))

(assert (=> b!1043046 (arrayContainsKey!0 lt!459550 lt!459609 #b00000000000000000000000000000000)))

(declare-fun lt!459608 () Unit!33945)

(assert (=> b!1043046 (= lt!459608 lt!459610)))

(declare-fun res!694953 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65697 (_ BitVec 32)) SeekEntryResult!9824)

(assert (=> b!1043046 (= res!694953 (= (seekEntryOrOpen!0 (select (arr!31602 lt!459550) #b00000000000000000000000000000000) lt!459550 (mask!30451 thiss!1427)) (Found!9824 #b00000000000000000000000000000000)))))

(assert (=> b!1043046 (=> (not res!694953) (not e!590920))))

(declare-fun bm!44187 () Bool)

(assert (=> bm!44187 (= call!44190 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459550 (mask!30451 thiss!1427)))))

(declare-fun b!1043047 () Bool)

(assert (=> b!1043047 (= e!590919 call!44190)))

(assert (= (and d!126079 (not res!694952)) b!1043044))

(assert (= (and b!1043044 c!105880) b!1043046))

(assert (= (and b!1043044 (not c!105880)) b!1043047))

(assert (= (and b!1043046 res!694953) b!1043045))

(assert (= (or b!1043045 b!1043047) bm!44187))

(declare-fun m!961801 () Bool)

(assert (=> b!1043044 m!961801))

(assert (=> b!1043044 m!961801))

(declare-fun m!961803 () Bool)

(assert (=> b!1043044 m!961803))

(assert (=> b!1043046 m!961801))

(declare-fun m!961805 () Bool)

(assert (=> b!1043046 m!961805))

(declare-fun m!961807 () Bool)

(assert (=> b!1043046 m!961807))

(assert (=> b!1043046 m!961801))

(declare-fun m!961809 () Bool)

(assert (=> b!1043046 m!961809))

(declare-fun m!961811 () Bool)

(assert (=> bm!44187 m!961811))

(assert (=> b!1042930 d!126079))

(declare-fun d!126081 () Bool)

(declare-fun res!694958 () Bool)

(declare-fun e!590926 () Bool)

(assert (=> d!126081 (=> res!694958 e!590926)))

(assert (=> d!126081 (= res!694958 (= (select (arr!31602 lt!459550) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126081 (= (arrayContainsKey!0 lt!459550 key!909 #b00000000000000000000000000000000) e!590926)))

(declare-fun b!1043052 () Bool)

(declare-fun e!590927 () Bool)

(assert (=> b!1043052 (= e!590926 e!590927)))

(declare-fun res!694959 () Bool)

(assert (=> b!1043052 (=> (not res!694959) (not e!590927))))

(assert (=> b!1043052 (= res!694959 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 lt!459550)))))

(declare-fun b!1043053 () Bool)

(assert (=> b!1043053 (= e!590927 (arrayContainsKey!0 lt!459550 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126081 (not res!694958)) b!1043052))

(assert (= (and b!1043052 res!694959) b!1043053))

(assert (=> d!126081 m!961801))

(declare-fun m!961813 () Bool)

(assert (=> b!1043053 m!961813))

(assert (=> b!1042930 d!126081))

(declare-fun d!126083 () Bool)

(declare-fun e!590930 () Bool)

(assert (=> d!126083 e!590930))

(declare-fun res!694962 () Bool)

(assert (=> d!126083 (=> (not res!694962) (not e!590930))))

(assert (=> d!126083 (= res!694962 (bvslt (index!41668 lt!459551) (size!32139 (_keys!11627 thiss!1427))))))

(declare-fun lt!459613 () Unit!33945)

(declare-fun choose!121 (array!65697 (_ BitVec 32) (_ BitVec 64)) Unit!33945)

(assert (=> d!126083 (= lt!459613 (choose!121 (_keys!11627 thiss!1427) (index!41668 lt!459551) key!909))))

(assert (=> d!126083 (bvsge (index!41668 lt!459551) #b00000000000000000000000000000000)))

(assert (=> d!126083 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11627 thiss!1427) (index!41668 lt!459551) key!909) lt!459613)))

(declare-fun b!1043056 () Bool)

(assert (=> b!1043056 (= e!590930 (not (arrayContainsKey!0 (array!65698 (store (arr!31602 (_keys!11627 thiss!1427)) (index!41668 lt!459551) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11627 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126083 res!694962) b!1043056))

(declare-fun m!961815 () Bool)

(assert (=> d!126083 m!961815))

(assert (=> b!1043056 m!961697))

(declare-fun m!961817 () Bool)

(assert (=> b!1043056 m!961817))

(assert (=> b!1042930 d!126083))

(declare-fun b!1043067 () Bool)

(declare-fun e!590940 () Bool)

(declare-fun e!590941 () Bool)

(assert (=> b!1043067 (= e!590940 e!590941)))

(declare-fun res!694970 () Bool)

(assert (=> b!1043067 (=> (not res!694970) (not e!590941))))

(declare-fun e!590939 () Bool)

(assert (=> b!1043067 (= res!694970 (not e!590939))))

(declare-fun res!694969 () Bool)

(assert (=> b!1043067 (=> (not res!694969) (not e!590939))))

(assert (=> b!1043067 (= res!694969 (validKeyInArray!0 (select (arr!31602 lt!459550) #b00000000000000000000000000000000)))))

(declare-fun b!1043068 () Bool)

(declare-fun e!590942 () Bool)

(assert (=> b!1043068 (= e!590941 e!590942)))

(declare-fun c!105883 () Bool)

(assert (=> b!1043068 (= c!105883 (validKeyInArray!0 (select (arr!31602 lt!459550) #b00000000000000000000000000000000)))))

(declare-fun b!1043069 () Bool)

(declare-fun contains!6041 (List!22020 (_ BitVec 64)) Bool)

(assert (=> b!1043069 (= e!590939 (contains!6041 Nil!22017 (select (arr!31602 lt!459550) #b00000000000000000000000000000000)))))

(declare-fun b!1043071 () Bool)

(declare-fun call!44193 () Bool)

(assert (=> b!1043071 (= e!590942 call!44193)))

(declare-fun bm!44190 () Bool)

(assert (=> bm!44190 (= call!44193 (arrayNoDuplicates!0 lt!459550 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105883 (Cons!22016 (select (arr!31602 lt!459550) #b00000000000000000000000000000000) Nil!22017) Nil!22017)))))

(declare-fun d!126085 () Bool)

(declare-fun res!694971 () Bool)

(assert (=> d!126085 (=> res!694971 e!590940)))

(assert (=> d!126085 (= res!694971 (bvsge #b00000000000000000000000000000000 (size!32139 lt!459550)))))

(assert (=> d!126085 (= (arrayNoDuplicates!0 lt!459550 #b00000000000000000000000000000000 Nil!22017) e!590940)))

(declare-fun b!1043070 () Bool)

(assert (=> b!1043070 (= e!590942 call!44193)))

(assert (= (and d!126085 (not res!694971)) b!1043067))

(assert (= (and b!1043067 res!694969) b!1043069))

(assert (= (and b!1043067 res!694970) b!1043068))

(assert (= (and b!1043068 c!105883) b!1043071))

(assert (= (and b!1043068 (not c!105883)) b!1043070))

(assert (= (or b!1043071 b!1043070) bm!44190))

(assert (=> b!1043067 m!961801))

(assert (=> b!1043067 m!961801))

(assert (=> b!1043067 m!961803))

(assert (=> b!1043068 m!961801))

(assert (=> b!1043068 m!961801))

(assert (=> b!1043068 m!961803))

(assert (=> b!1043069 m!961801))

(assert (=> b!1043069 m!961801))

(declare-fun m!961819 () Bool)

(assert (=> b!1043069 m!961819))

(assert (=> bm!44190 m!961801))

(declare-fun m!961821 () Bool)

(assert (=> bm!44190 m!961821))

(assert (=> b!1042930 d!126085))

(declare-fun b!1043083 () Bool)

(declare-fun e!590948 () Bool)

(assert (=> b!1043083 (= e!590948 (= (arrayCountValidKeys!0 (array!65698 (store (arr!31602 (_keys!11627 thiss!1427)) (index!41668 lt!459551) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11627 thiss!1427))) #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1043082 () Bool)

(declare-fun e!590947 () Bool)

(assert (=> b!1043082 (= e!590947 (bvslt (size!32139 (_keys!11627 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1043080 () Bool)

(declare-fun res!694983 () Bool)

(assert (=> b!1043080 (=> (not res!694983) (not e!590947))))

(assert (=> b!1043080 (= res!694983 (validKeyInArray!0 (select (arr!31602 (_keys!11627 thiss!1427)) (index!41668 lt!459551))))))

(declare-fun b!1043081 () Bool)

(declare-fun res!694982 () Bool)

(assert (=> b!1043081 (=> (not res!694982) (not e!590947))))

(assert (=> b!1043081 (= res!694982 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!126087 () Bool)

(assert (=> d!126087 e!590948))

(declare-fun res!694980 () Bool)

(assert (=> d!126087 (=> (not res!694980) (not e!590948))))

(assert (=> d!126087 (= res!694980 (and (bvsge (index!41668 lt!459551) #b00000000000000000000000000000000) (bvslt (index!41668 lt!459551) (size!32139 (_keys!11627 thiss!1427)))))))

(declare-fun lt!459616 () Unit!33945)

(declare-fun choose!82 (array!65697 (_ BitVec 32) (_ BitVec 64)) Unit!33945)

(assert (=> d!126087 (= lt!459616 (choose!82 (_keys!11627 thiss!1427) (index!41668 lt!459551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126087 e!590947))

(declare-fun res!694981 () Bool)

(assert (=> d!126087 (=> (not res!694981) (not e!590947))))

(assert (=> d!126087 (= res!694981 (and (bvsge (index!41668 lt!459551) #b00000000000000000000000000000000) (bvslt (index!41668 lt!459551) (size!32139 (_keys!11627 thiss!1427)))))))

(assert (=> d!126087 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11627 thiss!1427) (index!41668 lt!459551) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459616)))

(assert (= (and d!126087 res!694981) b!1043080))

(assert (= (and b!1043080 res!694983) b!1043081))

(assert (= (and b!1043081 res!694982) b!1043082))

(assert (= (and d!126087 res!694980) b!1043083))

(assert (=> b!1043083 m!961697))

(declare-fun m!961823 () Bool)

(assert (=> b!1043083 m!961823))

(assert (=> b!1043083 m!961691))

(assert (=> b!1043080 m!961675))

(assert (=> b!1043080 m!961675))

(declare-fun m!961825 () Bool)

(assert (=> b!1043080 m!961825))

(declare-fun m!961827 () Bool)

(assert (=> b!1043081 m!961827))

(declare-fun m!961829 () Bool)

(assert (=> d!126087 m!961829))

(assert (=> b!1042930 d!126087))

(declare-fun d!126089 () Bool)

(assert (=> d!126089 (= (validMask!0 (mask!30451 thiss!1427)) (and (or (= (mask!30451 thiss!1427) #b00000000000000000000000000000111) (= (mask!30451 thiss!1427) #b00000000000000000000000000001111) (= (mask!30451 thiss!1427) #b00000000000000000000000000011111) (= (mask!30451 thiss!1427) #b00000000000000000000000000111111) (= (mask!30451 thiss!1427) #b00000000000000000000000001111111) (= (mask!30451 thiss!1427) #b00000000000000000000000011111111) (= (mask!30451 thiss!1427) #b00000000000000000000000111111111) (= (mask!30451 thiss!1427) #b00000000000000000000001111111111) (= (mask!30451 thiss!1427) #b00000000000000000000011111111111) (= (mask!30451 thiss!1427) #b00000000000000000000111111111111) (= (mask!30451 thiss!1427) #b00000000000000000001111111111111) (= (mask!30451 thiss!1427) #b00000000000000000011111111111111) (= (mask!30451 thiss!1427) #b00000000000000000111111111111111) (= (mask!30451 thiss!1427) #b00000000000000001111111111111111) (= (mask!30451 thiss!1427) #b00000000000000011111111111111111) (= (mask!30451 thiss!1427) #b00000000000000111111111111111111) (= (mask!30451 thiss!1427) #b00000000000001111111111111111111) (= (mask!30451 thiss!1427) #b00000000000011111111111111111111) (= (mask!30451 thiss!1427) #b00000000000111111111111111111111) (= (mask!30451 thiss!1427) #b00000000001111111111111111111111) (= (mask!30451 thiss!1427) #b00000000011111111111111111111111) (= (mask!30451 thiss!1427) #b00000000111111111111111111111111) (= (mask!30451 thiss!1427) #b00000001111111111111111111111111) (= (mask!30451 thiss!1427) #b00000011111111111111111111111111) (= (mask!30451 thiss!1427) #b00000111111111111111111111111111) (= (mask!30451 thiss!1427) #b00001111111111111111111111111111) (= (mask!30451 thiss!1427) #b00011111111111111111111111111111) (= (mask!30451 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30451 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042930 d!126089))

(declare-fun b!1043092 () Bool)

(declare-fun e!590954 () (_ BitVec 32))

(assert (=> b!1043092 (= e!590954 #b00000000000000000000000000000000)))

(declare-fun d!126091 () Bool)

(declare-fun lt!459619 () (_ BitVec 32))

(assert (=> d!126091 (and (bvsge lt!459619 #b00000000000000000000000000000000) (bvsle lt!459619 (bvsub (size!32139 lt!459550) #b00000000000000000000000000000000)))))

(assert (=> d!126091 (= lt!459619 e!590954)))

(declare-fun c!105888 () Bool)

(assert (=> d!126091 (= c!105888 (bvsge #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))))))

(assert (=> d!126091 (and (bvsle #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32139 (_keys!11627 thiss!1427)) (size!32139 lt!459550)))))

(assert (=> d!126091 (= (arrayCountValidKeys!0 lt!459550 #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))) lt!459619)))

(declare-fun b!1043093 () Bool)

(declare-fun e!590953 () (_ BitVec 32))

(assert (=> b!1043093 (= e!590954 e!590953)))

(declare-fun c!105889 () Bool)

(assert (=> b!1043093 (= c!105889 (validKeyInArray!0 (select (arr!31602 lt!459550) #b00000000000000000000000000000000)))))

(declare-fun b!1043094 () Bool)

(declare-fun call!44196 () (_ BitVec 32))

(assert (=> b!1043094 (= e!590953 (bvadd #b00000000000000000000000000000001 call!44196))))

(declare-fun b!1043095 () Bool)

(assert (=> b!1043095 (= e!590953 call!44196)))

(declare-fun bm!44193 () Bool)

(assert (=> bm!44193 (= call!44196 (arrayCountValidKeys!0 lt!459550 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11627 thiss!1427))))))

(assert (= (and d!126091 c!105888) b!1043092))

(assert (= (and d!126091 (not c!105888)) b!1043093))

(assert (= (and b!1043093 c!105889) b!1043094))

(assert (= (and b!1043093 (not c!105889)) b!1043095))

(assert (= (or b!1043094 b!1043095) bm!44193))

(assert (=> b!1043093 m!961801))

(assert (=> b!1043093 m!961801))

(assert (=> b!1043093 m!961803))

(declare-fun m!961831 () Bool)

(assert (=> bm!44193 m!961831))

(assert (=> b!1042930 d!126091))

(declare-fun b!1043096 () Bool)

(declare-fun e!590956 () (_ BitVec 32))

(assert (=> b!1043096 (= e!590956 #b00000000000000000000000000000000)))

(declare-fun d!126093 () Bool)

(declare-fun lt!459620 () (_ BitVec 32))

(assert (=> d!126093 (and (bvsge lt!459620 #b00000000000000000000000000000000) (bvsle lt!459620 (bvsub (size!32139 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126093 (= lt!459620 e!590956)))

(declare-fun c!105890 () Bool)

(assert (=> d!126093 (= c!105890 (bvsge #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))))))

(assert (=> d!126093 (and (bvsle #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32139 (_keys!11627 thiss!1427)) (size!32139 (_keys!11627 thiss!1427))))))

(assert (=> d!126093 (= (arrayCountValidKeys!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))) lt!459620)))

(declare-fun b!1043097 () Bool)

(declare-fun e!590955 () (_ BitVec 32))

(assert (=> b!1043097 (= e!590956 e!590955)))

(declare-fun c!105891 () Bool)

(assert (=> b!1043097 (= c!105891 (validKeyInArray!0 (select (arr!31602 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043098 () Bool)

(declare-fun call!44197 () (_ BitVec 32))

(assert (=> b!1043098 (= e!590955 (bvadd #b00000000000000000000000000000001 call!44197))))

(declare-fun b!1043099 () Bool)

(assert (=> b!1043099 (= e!590955 call!44197)))

(declare-fun bm!44194 () Bool)

(assert (=> bm!44194 (= call!44197 (arrayCountValidKeys!0 (_keys!11627 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32139 (_keys!11627 thiss!1427))))))

(assert (= (and d!126093 c!105890) b!1043096))

(assert (= (and d!126093 (not c!105890)) b!1043097))

(assert (= (and b!1043097 c!105891) b!1043098))

(assert (= (and b!1043097 (not c!105891)) b!1043099))

(assert (= (or b!1043098 b!1043099) bm!44194))

(declare-fun m!961833 () Bool)

(assert (=> b!1043097 m!961833))

(assert (=> b!1043097 m!961833))

(declare-fun m!961835 () Bool)

(assert (=> b!1043097 m!961835))

(declare-fun m!961837 () Bool)

(assert (=> bm!44194 m!961837))

(assert (=> b!1042930 d!126093))

(declare-fun d!126095 () Bool)

(declare-fun e!590959 () Bool)

(assert (=> d!126095 e!590959))

(declare-fun res!694986 () Bool)

(assert (=> d!126095 (=> (not res!694986) (not e!590959))))

(assert (=> d!126095 (= res!694986 (and (bvsge (index!41668 lt!459551) #b00000000000000000000000000000000) (bvslt (index!41668 lt!459551) (size!32139 (_keys!11627 thiss!1427)))))))

(declare-fun lt!459623 () Unit!33945)

(declare-fun choose!25 (array!65697 (_ BitVec 32) (_ BitVec 32)) Unit!33945)

(assert (=> d!126095 (= lt!459623 (choose!25 (_keys!11627 thiss!1427) (index!41668 lt!459551) (mask!30451 thiss!1427)))))

(assert (=> d!126095 (validMask!0 (mask!30451 thiss!1427))))

(assert (=> d!126095 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11627 thiss!1427) (index!41668 lt!459551) (mask!30451 thiss!1427)) lt!459623)))

(declare-fun b!1043102 () Bool)

(assert (=> b!1043102 (= e!590959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65698 (store (arr!31602 (_keys!11627 thiss!1427)) (index!41668 lt!459551) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11627 thiss!1427))) (mask!30451 thiss!1427)))))

(assert (= (and d!126095 res!694986) b!1043102))

(declare-fun m!961839 () Bool)

(assert (=> d!126095 m!961839))

(assert (=> d!126095 m!961685))

(assert (=> b!1043102 m!961697))

(declare-fun m!961841 () Bool)

(assert (=> b!1043102 m!961841))

(assert (=> b!1042930 d!126095))

(declare-fun d!126097 () Bool)

(declare-fun e!590962 () Bool)

(assert (=> d!126097 e!590962))

(declare-fun res!694989 () Bool)

(assert (=> d!126097 (=> (not res!694989) (not e!590962))))

(assert (=> d!126097 (= res!694989 (and (bvsge (index!41668 lt!459551) #b00000000000000000000000000000000) (bvslt (index!41668 lt!459551) (size!32139 (_keys!11627 thiss!1427)))))))

(declare-fun lt!459626 () Unit!33945)

(declare-fun choose!53 (array!65697 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22020) Unit!33945)

(assert (=> d!126097 (= lt!459626 (choose!53 (_keys!11627 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41668 lt!459551) #b00000000000000000000000000000000 Nil!22017))))

(assert (=> d!126097 (bvslt (size!32139 (_keys!11627 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126097 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11627 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41668 lt!459551) #b00000000000000000000000000000000 Nil!22017) lt!459626)))

(declare-fun b!1043105 () Bool)

(assert (=> b!1043105 (= e!590962 (arrayNoDuplicates!0 (array!65698 (store (arr!31602 (_keys!11627 thiss!1427)) (index!41668 lt!459551) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32139 (_keys!11627 thiss!1427))) #b00000000000000000000000000000000 Nil!22017))))

(assert (= (and d!126097 res!694989) b!1043105))

(declare-fun m!961843 () Bool)

(assert (=> d!126097 m!961843))

(assert (=> b!1043105 m!961697))

(declare-fun m!961845 () Bool)

(assert (=> b!1043105 m!961845))

(assert (=> b!1042930 d!126097))

(declare-fun b!1043106 () Bool)

(declare-fun e!590964 () Bool)

(declare-fun e!590965 () Bool)

(assert (=> b!1043106 (= e!590964 e!590965)))

(declare-fun res!694991 () Bool)

(assert (=> b!1043106 (=> (not res!694991) (not e!590965))))

(declare-fun e!590963 () Bool)

(assert (=> b!1043106 (= res!694991 (not e!590963))))

(declare-fun res!694990 () Bool)

(assert (=> b!1043106 (=> (not res!694990) (not e!590963))))

(assert (=> b!1043106 (= res!694990 (validKeyInArray!0 (select (arr!31602 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043107 () Bool)

(declare-fun e!590966 () Bool)

(assert (=> b!1043107 (= e!590965 e!590966)))

(declare-fun c!105892 () Bool)

(assert (=> b!1043107 (= c!105892 (validKeyInArray!0 (select (arr!31602 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043108 () Bool)

(assert (=> b!1043108 (= e!590963 (contains!6041 Nil!22017 (select (arr!31602 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043110 () Bool)

(declare-fun call!44198 () Bool)

(assert (=> b!1043110 (= e!590966 call!44198)))

(declare-fun bm!44195 () Bool)

(assert (=> bm!44195 (= call!44198 (arrayNoDuplicates!0 (_keys!11627 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105892 (Cons!22016 (select (arr!31602 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000) Nil!22017) Nil!22017)))))

(declare-fun d!126099 () Bool)

(declare-fun res!694992 () Bool)

(assert (=> d!126099 (=> res!694992 e!590964)))

(assert (=> d!126099 (= res!694992 (bvsge #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))))))

(assert (=> d!126099 (= (arrayNoDuplicates!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 Nil!22017) e!590964)))

(declare-fun b!1043109 () Bool)

(assert (=> b!1043109 (= e!590966 call!44198)))

(assert (= (and d!126099 (not res!694992)) b!1043106))

(assert (= (and b!1043106 res!694990) b!1043108))

(assert (= (and b!1043106 res!694991) b!1043107))

(assert (= (and b!1043107 c!105892) b!1043110))

(assert (= (and b!1043107 (not c!105892)) b!1043109))

(assert (= (or b!1043110 b!1043109) bm!44195))

(assert (=> b!1043106 m!961833))

(assert (=> b!1043106 m!961833))

(assert (=> b!1043106 m!961835))

(assert (=> b!1043107 m!961833))

(assert (=> b!1043107 m!961833))

(assert (=> b!1043107 m!961835))

(assert (=> b!1043108 m!961833))

(assert (=> b!1043108 m!961833))

(declare-fun m!961847 () Bool)

(assert (=> b!1043108 m!961847))

(assert (=> bm!44195 m!961833))

(declare-fun m!961849 () Bool)

(assert (=> bm!44195 m!961849))

(assert (=> b!1042928 d!126099))

(declare-fun d!126101 () Bool)

(declare-fun res!694999 () Bool)

(declare-fun e!590969 () Bool)

(assert (=> d!126101 (=> (not res!694999) (not e!590969))))

(declare-fun simpleValid!445 (LongMapFixedSize!5986) Bool)

(assert (=> d!126101 (= res!694999 (simpleValid!445 thiss!1427))))

(assert (=> d!126101 (= (valid!2239 thiss!1427) e!590969)))

(declare-fun b!1043117 () Bool)

(declare-fun res!695000 () Bool)

(assert (=> b!1043117 (=> (not res!695000) (not e!590969))))

(assert (=> b!1043117 (= res!695000 (= (arrayCountValidKeys!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))) (_size!3048 thiss!1427)))))

(declare-fun b!1043118 () Bool)

(declare-fun res!695001 () Bool)

(assert (=> b!1043118 (=> (not res!695001) (not e!590969))))

(assert (=> b!1043118 (= res!695001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11627 thiss!1427) (mask!30451 thiss!1427)))))

(declare-fun b!1043119 () Bool)

(assert (=> b!1043119 (= e!590969 (arrayNoDuplicates!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 Nil!22017))))

(assert (= (and d!126101 res!694999) b!1043117))

(assert (= (and b!1043117 res!695000) b!1043118))

(assert (= (and b!1043118 res!695001) b!1043119))

(declare-fun m!961851 () Bool)

(assert (=> d!126101 m!961851))

(assert (=> b!1043117 m!961691))

(assert (=> b!1043118 m!961709))

(assert (=> b!1043119 m!961671))

(assert (=> start!91612 d!126101))

(declare-fun d!126103 () Bool)

(declare-fun res!695002 () Bool)

(declare-fun e!590972 () Bool)

(assert (=> d!126103 (=> res!695002 e!590972)))

(assert (=> d!126103 (= res!695002 (bvsge #b00000000000000000000000000000000 (size!32139 (_keys!11627 thiss!1427))))))

(assert (=> d!126103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11627 thiss!1427) (mask!30451 thiss!1427)) e!590972)))

(declare-fun b!1043120 () Bool)

(declare-fun e!590970 () Bool)

(assert (=> b!1043120 (= e!590972 e!590970)))

(declare-fun c!105893 () Bool)

(assert (=> b!1043120 (= c!105893 (validKeyInArray!0 (select (arr!31602 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043121 () Bool)

(declare-fun e!590971 () Bool)

(declare-fun call!44199 () Bool)

(assert (=> b!1043121 (= e!590971 call!44199)))

(declare-fun b!1043122 () Bool)

(assert (=> b!1043122 (= e!590970 e!590971)))

(declare-fun lt!459628 () (_ BitVec 64))

(assert (=> b!1043122 (= lt!459628 (select (arr!31602 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459629 () Unit!33945)

(assert (=> b!1043122 (= lt!459629 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11627 thiss!1427) lt!459628 #b00000000000000000000000000000000))))

(assert (=> b!1043122 (arrayContainsKey!0 (_keys!11627 thiss!1427) lt!459628 #b00000000000000000000000000000000)))

(declare-fun lt!459627 () Unit!33945)

(assert (=> b!1043122 (= lt!459627 lt!459629)))

(declare-fun res!695003 () Bool)

(assert (=> b!1043122 (= res!695003 (= (seekEntryOrOpen!0 (select (arr!31602 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000) (_keys!11627 thiss!1427) (mask!30451 thiss!1427)) (Found!9824 #b00000000000000000000000000000000)))))

(assert (=> b!1043122 (=> (not res!695003) (not e!590971))))

(declare-fun bm!44196 () Bool)

(assert (=> bm!44196 (= call!44199 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11627 thiss!1427) (mask!30451 thiss!1427)))))

(declare-fun b!1043123 () Bool)

(assert (=> b!1043123 (= e!590970 call!44199)))

(assert (= (and d!126103 (not res!695002)) b!1043120))

(assert (= (and b!1043120 c!105893) b!1043122))

(assert (= (and b!1043120 (not c!105893)) b!1043123))

(assert (= (and b!1043122 res!695003) b!1043121))

(assert (= (or b!1043121 b!1043123) bm!44196))

(assert (=> b!1043120 m!961833))

(assert (=> b!1043120 m!961833))

(assert (=> b!1043120 m!961835))

(assert (=> b!1043122 m!961833))

(declare-fun m!961853 () Bool)

(assert (=> b!1043122 m!961853))

(declare-fun m!961855 () Bool)

(assert (=> b!1043122 m!961855))

(assert (=> b!1043122 m!961833))

(declare-fun m!961857 () Bool)

(assert (=> b!1043122 m!961857))

(declare-fun m!961859 () Bool)

(assert (=> bm!44196 m!961859))

(assert (=> b!1042929 d!126103))

(declare-fun b!1043130 () Bool)

(declare-fun e!590978 () Bool)

(assert (=> b!1043130 (= e!590978 tp_is_empty!24799)))

(declare-fun mapNonEmpty!38825 () Bool)

(declare-fun mapRes!38825 () Bool)

(declare-fun tp!74487 () Bool)

(assert (=> mapNonEmpty!38825 (= mapRes!38825 (and tp!74487 e!590978))))

(declare-fun mapKey!38825 () (_ BitVec 32))

(declare-fun mapValue!38825 () ValueCell!11696)

(declare-fun mapRest!38825 () (Array (_ BitVec 32) ValueCell!11696))

(assert (=> mapNonEmpty!38825 (= mapRest!38816 (store mapRest!38825 mapKey!38825 mapValue!38825))))

(declare-fun b!1043131 () Bool)

(declare-fun e!590977 () Bool)

(assert (=> b!1043131 (= e!590977 tp_is_empty!24799)))

(declare-fun condMapEmpty!38825 () Bool)

(declare-fun mapDefault!38825 () ValueCell!11696)

(assert (=> mapNonEmpty!38816 (= condMapEmpty!38825 (= mapRest!38816 ((as const (Array (_ BitVec 32) ValueCell!11696)) mapDefault!38825)))))

(assert (=> mapNonEmpty!38816 (= tp!74472 (and e!590977 mapRes!38825))))

(declare-fun mapIsEmpty!38825 () Bool)

(assert (=> mapIsEmpty!38825 mapRes!38825))

(assert (= (and mapNonEmpty!38816 condMapEmpty!38825) mapIsEmpty!38825))

(assert (= (and mapNonEmpty!38816 (not condMapEmpty!38825)) mapNonEmpty!38825))

(assert (= (and mapNonEmpty!38825 ((_ is ValueCellFull!11696) mapValue!38825)) b!1043130))

(assert (= (and mapNonEmpty!38816 ((_ is ValueCellFull!11696) mapDefault!38825)) b!1043131))

(declare-fun m!961861 () Bool)

(assert (=> mapNonEmpty!38825 m!961861))

(check-sat b_and!33585 (not b!1043105) (not b!1043107) (not b!1043046) (not b!1043117) (not b!1043053) (not d!126087) (not b!1043097) (not b!1043108) (not d!126083) (not bm!44195) (not bm!44194) (not b!1043056) (not b!1043083) (not bm!44193) (not bm!44196) (not b!1043122) (not b!1043093) (not b!1043069) (not d!126097) (not b!1043080) (not b!1043118) (not d!126095) (not b!1043106) (not mapNonEmpty!38825) (not b_next!21079) (not b!1043067) (not bm!44190) (not b!1043068) (not d!126075) (not b!1043119) tp_is_empty!24799 (not b!1043120) (not bm!44187) (not b!1043035) (not b!1043102) (not d!126101) (not b!1043081) (not b!1043044))
(check-sat b_and!33585 (not b_next!21079))
