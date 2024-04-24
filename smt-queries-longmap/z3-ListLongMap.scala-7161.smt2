; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91430 () Bool)

(assert start!91430)

(declare-fun b!1041988 () Bool)

(declare-fun b_free!21019 () Bool)

(declare-fun b_next!21019 () Bool)

(assert (=> b!1041988 (= b_free!21019 (not b_next!21019))))

(declare-fun tp!74258 () Bool)

(declare-fun b_and!33561 () Bool)

(assert (=> b!1041988 (= tp!74258 b_and!33561)))

(declare-fun b!1041987 () Bool)

(declare-fun e!590058 () Bool)

(declare-fun e!590059 () Bool)

(declare-fun mapRes!38692 () Bool)

(assert (=> b!1041987 (= e!590058 (and e!590059 mapRes!38692))))

(declare-fun condMapEmpty!38692 () Bool)

(declare-datatypes ((V!37859 0))(
  ( (V!37860 (val!12420 Int)) )
))
(declare-datatypes ((ValueCell!11666 0))(
  ( (ValueCellFull!11666 (v!15003 V!37859)) (EmptyCell!11666) )
))
(declare-datatypes ((array!65667 0))(
  ( (array!65668 (arr!31591 (Array (_ BitVec 32) (_ BitVec 64))) (size!32123 (_ BitVec 32))) )
))
(declare-datatypes ((array!65669 0))(
  ( (array!65670 (arr!31592 (Array (_ BitVec 32) ValueCell!11666)) (size!32124 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5926 0))(
  ( (LongMapFixedSize!5927 (defaultEntry!6345 Int) (mask!30406 (_ BitVec 32)) (extraKeys!6073 (_ BitVec 32)) (zeroValue!6179 V!37859) (minValue!6179 V!37859) (_size!3018 (_ BitVec 32)) (_keys!11607 array!65667) (_values!6368 array!65669) (_vacant!3018 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5926)

(declare-fun mapDefault!38692 () ValueCell!11666)

(assert (=> b!1041987 (= condMapEmpty!38692 (= (arr!31592 (_values!6368 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11666)) mapDefault!38692)))))

(declare-fun tp_is_empty!24739 () Bool)

(declare-fun e!590062 () Bool)

(declare-fun array_inv!24425 (array!65667) Bool)

(declare-fun array_inv!24426 (array!65669) Bool)

(assert (=> b!1041988 (= e!590062 (and tp!74258 tp_is_empty!24739 (array_inv!24425 (_keys!11607 thiss!1427)) (array_inv!24426 (_values!6368 thiss!1427)) e!590058))))

(declare-fun mapIsEmpty!38692 () Bool)

(assert (=> mapIsEmpty!38692 mapRes!38692))

(declare-fun b!1041989 () Bool)

(declare-fun e!590057 () Bool)

(assert (=> b!1041989 (= e!590057 tp_is_empty!24739)))

(declare-fun b!1041990 () Bool)

(declare-fun e!590063 () Bool)

(declare-fun e!590061 () Bool)

(assert (=> b!1041990 (= e!590063 e!590061)))

(declare-fun res!694288 () Bool)

(assert (=> b!1041990 (=> (not res!694288) (not e!590061))))

(declare-datatypes ((SeekEntryResult!9755 0))(
  ( (MissingZero!9755 (index!41391 (_ BitVec 32))) (Found!9755 (index!41392 (_ BitVec 32))) (Intermediate!9755 (undefined!10567 Bool) (index!41393 (_ BitVec 32)) (x!92881 (_ BitVec 32))) (Undefined!9755) (MissingVacant!9755 (index!41394 (_ BitVec 32))) )
))
(declare-fun lt!459162 () SeekEntryResult!9755)

(get-info :version)

(assert (=> b!1041990 (= res!694288 ((_ is Found!9755) lt!459162))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65667 (_ BitVec 32)) SeekEntryResult!9755)

(assert (=> b!1041990 (= lt!459162 (seekEntry!0 key!909 (_keys!11607 thiss!1427) (mask!30406 thiss!1427)))))

(declare-fun b!1041991 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041991 (= e!590061 (not (validMask!0 (mask!30406 thiss!1427))))))

(declare-fun lt!459163 () array!65667)

(declare-fun arrayContainsKey!0 (array!65667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041991 (not (arrayContainsKey!0 lt!459163 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34027 0))(
  ( (Unit!34028) )
))
(declare-fun lt!459165 () Unit!34027)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65667 (_ BitVec 32) (_ BitVec 64)) Unit!34027)

(assert (=> b!1041991 (= lt!459165 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11607 thiss!1427) (index!41392 lt!459162) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65667 (_ BitVec 32)) Bool)

(assert (=> b!1041991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459163 (mask!30406 thiss!1427))))

(declare-fun lt!459166 () Unit!34027)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65667 (_ BitVec 32) (_ BitVec 32)) Unit!34027)

(assert (=> b!1041991 (= lt!459166 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11607 thiss!1427) (index!41392 lt!459162) (mask!30406 thiss!1427)))))

(declare-datatypes ((List!21951 0))(
  ( (Nil!21948) (Cons!21947 (h!23160 (_ BitVec 64)) (t!31157 List!21951)) )
))
(declare-fun arrayNoDuplicates!0 (array!65667 (_ BitVec 32) List!21951) Bool)

(assert (=> b!1041991 (arrayNoDuplicates!0 lt!459163 #b00000000000000000000000000000000 Nil!21948)))

(declare-fun lt!459164 () Unit!34027)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65667 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21951) Unit!34027)

(assert (=> b!1041991 (= lt!459164 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11607 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41392 lt!459162) #b00000000000000000000000000000000 Nil!21948))))

(declare-fun arrayCountValidKeys!0 (array!65667 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041991 (= (arrayCountValidKeys!0 lt!459163 #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11607 thiss!1427) #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041991 (= lt!459163 (array!65668 (store (arr!31591 (_keys!11607 thiss!1427)) (index!41392 lt!459162) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32123 (_keys!11607 thiss!1427))))))

(declare-fun lt!459161 () Unit!34027)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65667 (_ BitVec 32) (_ BitVec 64)) Unit!34027)

(assert (=> b!1041991 (= lt!459161 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11607 thiss!1427) (index!41392 lt!459162) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38692 () Bool)

(declare-fun tp!74257 () Bool)

(assert (=> mapNonEmpty!38692 (= mapRes!38692 (and tp!74257 e!590057))))

(declare-fun mapValue!38692 () ValueCell!11666)

(declare-fun mapRest!38692 () (Array (_ BitVec 32) ValueCell!11666))

(declare-fun mapKey!38692 () (_ BitVec 32))

(assert (=> mapNonEmpty!38692 (= (arr!31592 (_values!6368 thiss!1427)) (store mapRest!38692 mapKey!38692 mapValue!38692))))

(declare-fun res!694286 () Bool)

(assert (=> start!91430 (=> (not res!694286) (not e!590063))))

(declare-fun valid!2234 (LongMapFixedSize!5926) Bool)

(assert (=> start!91430 (= res!694286 (valid!2234 thiss!1427))))

(assert (=> start!91430 e!590063))

(assert (=> start!91430 e!590062))

(assert (=> start!91430 true))

(declare-fun b!1041992 () Bool)

(assert (=> b!1041992 (= e!590059 tp_is_empty!24739)))

(declare-fun b!1041993 () Bool)

(declare-fun res!694287 () Bool)

(assert (=> b!1041993 (=> (not res!694287) (not e!590063))))

(assert (=> b!1041993 (= res!694287 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91430 res!694286) b!1041993))

(assert (= (and b!1041993 res!694287) b!1041990))

(assert (= (and b!1041990 res!694288) b!1041991))

(assert (= (and b!1041987 condMapEmpty!38692) mapIsEmpty!38692))

(assert (= (and b!1041987 (not condMapEmpty!38692)) mapNonEmpty!38692))

(assert (= (and mapNonEmpty!38692 ((_ is ValueCellFull!11666) mapValue!38692)) b!1041989))

(assert (= (and b!1041987 ((_ is ValueCellFull!11666) mapDefault!38692)) b!1041992))

(assert (= b!1041988 b!1041987))

(assert (= start!91430 b!1041988))

(declare-fun m!961849 () Bool)

(assert (=> b!1041988 m!961849))

(declare-fun m!961851 () Bool)

(assert (=> b!1041988 m!961851))

(declare-fun m!961853 () Bool)

(assert (=> start!91430 m!961853))

(declare-fun m!961855 () Bool)

(assert (=> mapNonEmpty!38692 m!961855))

(declare-fun m!961857 () Bool)

(assert (=> b!1041990 m!961857))

(declare-fun m!961859 () Bool)

(assert (=> b!1041991 m!961859))

(declare-fun m!961861 () Bool)

(assert (=> b!1041991 m!961861))

(declare-fun m!961863 () Bool)

(assert (=> b!1041991 m!961863))

(declare-fun m!961865 () Bool)

(assert (=> b!1041991 m!961865))

(declare-fun m!961867 () Bool)

(assert (=> b!1041991 m!961867))

(declare-fun m!961869 () Bool)

(assert (=> b!1041991 m!961869))

(declare-fun m!961871 () Bool)

(assert (=> b!1041991 m!961871))

(declare-fun m!961873 () Bool)

(assert (=> b!1041991 m!961873))

(declare-fun m!961875 () Bool)

(assert (=> b!1041991 m!961875))

(declare-fun m!961877 () Bool)

(assert (=> b!1041991 m!961877))

(declare-fun m!961879 () Bool)

(assert (=> b!1041991 m!961879))

(check-sat (not b!1041991) (not b!1041988) tp_is_empty!24739 b_and!33561 (not b_next!21019) (not mapNonEmpty!38692) (not b!1041990) (not start!91430))
(check-sat b_and!33561 (not b_next!21019))
(get-model)

(declare-fun b!1042048 () Bool)

(declare-fun e!590113 () SeekEntryResult!9755)

(assert (=> b!1042048 (= e!590113 Undefined!9755)))

(declare-fun d!126151 () Bool)

(declare-fun lt!459213 () SeekEntryResult!9755)

(assert (=> d!126151 (and (or ((_ is MissingVacant!9755) lt!459213) (not ((_ is Found!9755) lt!459213)) (and (bvsge (index!41392 lt!459213) #b00000000000000000000000000000000) (bvslt (index!41392 lt!459213) (size!32123 (_keys!11607 thiss!1427))))) (not ((_ is MissingVacant!9755) lt!459213)) (or (not ((_ is Found!9755) lt!459213)) (= (select (arr!31591 (_keys!11607 thiss!1427)) (index!41392 lt!459213)) key!909)))))

(assert (=> d!126151 (= lt!459213 e!590113)))

(declare-fun c!105933 () Bool)

(declare-fun lt!459212 () SeekEntryResult!9755)

(assert (=> d!126151 (= c!105933 (and ((_ is Intermediate!9755) lt!459212) (undefined!10567 lt!459212)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65667 (_ BitVec 32)) SeekEntryResult!9755)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126151 (= lt!459212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30406 thiss!1427)) key!909 (_keys!11607 thiss!1427) (mask!30406 thiss!1427)))))

(assert (=> d!126151 (validMask!0 (mask!30406 thiss!1427))))

(assert (=> d!126151 (= (seekEntry!0 key!909 (_keys!11607 thiss!1427) (mask!30406 thiss!1427)) lt!459213)))

(declare-fun b!1042049 () Bool)

(declare-fun e!590114 () SeekEntryResult!9755)

(declare-fun lt!459211 () SeekEntryResult!9755)

(assert (=> b!1042049 (= e!590114 (ite ((_ is MissingVacant!9755) lt!459211) (MissingZero!9755 (index!41394 lt!459211)) lt!459211))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65667 (_ BitVec 32)) SeekEntryResult!9755)

(assert (=> b!1042049 (= lt!459211 (seekKeyOrZeroReturnVacant!0 (x!92881 lt!459212) (index!41393 lt!459212) (index!41393 lt!459212) key!909 (_keys!11607 thiss!1427) (mask!30406 thiss!1427)))))

(declare-fun b!1042050 () Bool)

(declare-fun c!105932 () Bool)

(declare-fun lt!459214 () (_ BitVec 64))

(assert (=> b!1042050 (= c!105932 (= lt!459214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590112 () SeekEntryResult!9755)

(assert (=> b!1042050 (= e!590112 e!590114)))

(declare-fun b!1042051 () Bool)

(assert (=> b!1042051 (= e!590113 e!590112)))

(assert (=> b!1042051 (= lt!459214 (select (arr!31591 (_keys!11607 thiss!1427)) (index!41393 lt!459212)))))

(declare-fun c!105931 () Bool)

(assert (=> b!1042051 (= c!105931 (= lt!459214 key!909))))

(declare-fun b!1042052 () Bool)

(assert (=> b!1042052 (= e!590114 (MissingZero!9755 (index!41393 lt!459212)))))

(declare-fun b!1042053 () Bool)

(assert (=> b!1042053 (= e!590112 (Found!9755 (index!41393 lt!459212)))))

(assert (= (and d!126151 c!105933) b!1042048))

(assert (= (and d!126151 (not c!105933)) b!1042051))

(assert (= (and b!1042051 c!105931) b!1042053))

(assert (= (and b!1042051 (not c!105931)) b!1042050))

(assert (= (and b!1042050 c!105932) b!1042052))

(assert (= (and b!1042050 (not c!105932)) b!1042049))

(declare-fun m!961945 () Bool)

(assert (=> d!126151 m!961945))

(declare-fun m!961947 () Bool)

(assert (=> d!126151 m!961947))

(assert (=> d!126151 m!961947))

(declare-fun m!961949 () Bool)

(assert (=> d!126151 m!961949))

(assert (=> d!126151 m!961875))

(declare-fun m!961951 () Bool)

(assert (=> b!1042049 m!961951))

(declare-fun m!961953 () Bool)

(assert (=> b!1042051 m!961953))

(assert (=> b!1041990 d!126151))

(declare-fun d!126153 () Bool)

(declare-fun res!694313 () Bool)

(declare-fun e!590117 () Bool)

(assert (=> d!126153 (=> (not res!694313) (not e!590117))))

(declare-fun simpleValid!435 (LongMapFixedSize!5926) Bool)

(assert (=> d!126153 (= res!694313 (simpleValid!435 thiss!1427))))

(assert (=> d!126153 (= (valid!2234 thiss!1427) e!590117)))

(declare-fun b!1042060 () Bool)

(declare-fun res!694314 () Bool)

(assert (=> b!1042060 (=> (not res!694314) (not e!590117))))

(assert (=> b!1042060 (= res!694314 (= (arrayCountValidKeys!0 (_keys!11607 thiss!1427) #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))) (_size!3018 thiss!1427)))))

(declare-fun b!1042061 () Bool)

(declare-fun res!694315 () Bool)

(assert (=> b!1042061 (=> (not res!694315) (not e!590117))))

(assert (=> b!1042061 (= res!694315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11607 thiss!1427) (mask!30406 thiss!1427)))))

(declare-fun b!1042062 () Bool)

(assert (=> b!1042062 (= e!590117 (arrayNoDuplicates!0 (_keys!11607 thiss!1427) #b00000000000000000000000000000000 Nil!21948))))

(assert (= (and d!126153 res!694313) b!1042060))

(assert (= (and b!1042060 res!694314) b!1042061))

(assert (= (and b!1042061 res!694315) b!1042062))

(declare-fun m!961955 () Bool)

(assert (=> d!126153 m!961955))

(assert (=> b!1042060 m!961879))

(declare-fun m!961957 () Bool)

(assert (=> b!1042061 m!961957))

(declare-fun m!961959 () Bool)

(assert (=> b!1042062 m!961959))

(assert (=> start!91430 d!126153))

(declare-fun d!126155 () Bool)

(assert (=> d!126155 (= (array_inv!24425 (_keys!11607 thiss!1427)) (bvsge (size!32123 (_keys!11607 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041988 d!126155))

(declare-fun d!126157 () Bool)

(assert (=> d!126157 (= (array_inv!24426 (_values!6368 thiss!1427)) (bvsge (size!32124 (_values!6368 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041988 d!126157))

(declare-fun d!126159 () Bool)

(declare-fun e!590120 () Bool)

(assert (=> d!126159 e!590120))

(declare-fun res!694318 () Bool)

(assert (=> d!126159 (=> (not res!694318) (not e!590120))))

(assert (=> d!126159 (= res!694318 (bvslt (index!41392 lt!459162) (size!32123 (_keys!11607 thiss!1427))))))

(declare-fun lt!459217 () Unit!34027)

(declare-fun choose!121 (array!65667 (_ BitVec 32) (_ BitVec 64)) Unit!34027)

(assert (=> d!126159 (= lt!459217 (choose!121 (_keys!11607 thiss!1427) (index!41392 lt!459162) key!909))))

(assert (=> d!126159 (bvsge (index!41392 lt!459162) #b00000000000000000000000000000000)))

(assert (=> d!126159 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11607 thiss!1427) (index!41392 lt!459162) key!909) lt!459217)))

(declare-fun b!1042065 () Bool)

(assert (=> b!1042065 (= e!590120 (not (arrayContainsKey!0 (array!65668 (store (arr!31591 (_keys!11607 thiss!1427)) (index!41392 lt!459162) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32123 (_keys!11607 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126159 res!694318) b!1042065))

(declare-fun m!961961 () Bool)

(assert (=> d!126159 m!961961))

(assert (=> b!1042065 m!961873))

(declare-fun m!961963 () Bool)

(assert (=> b!1042065 m!961963))

(assert (=> b!1041991 d!126159))

(declare-fun d!126161 () Bool)

(declare-fun e!590123 () Bool)

(assert (=> d!126161 e!590123))

(declare-fun res!694321 () Bool)

(assert (=> d!126161 (=> (not res!694321) (not e!590123))))

(assert (=> d!126161 (= res!694321 (and (bvsge (index!41392 lt!459162) #b00000000000000000000000000000000) (bvslt (index!41392 lt!459162) (size!32123 (_keys!11607 thiss!1427)))))))

(declare-fun lt!459220 () Unit!34027)

(declare-fun choose!25 (array!65667 (_ BitVec 32) (_ BitVec 32)) Unit!34027)

(assert (=> d!126161 (= lt!459220 (choose!25 (_keys!11607 thiss!1427) (index!41392 lt!459162) (mask!30406 thiss!1427)))))

(assert (=> d!126161 (validMask!0 (mask!30406 thiss!1427))))

(assert (=> d!126161 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11607 thiss!1427) (index!41392 lt!459162) (mask!30406 thiss!1427)) lt!459220)))

(declare-fun b!1042068 () Bool)

(assert (=> b!1042068 (= e!590123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65668 (store (arr!31591 (_keys!11607 thiss!1427)) (index!41392 lt!459162) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32123 (_keys!11607 thiss!1427))) (mask!30406 thiss!1427)))))

(assert (= (and d!126161 res!694321) b!1042068))

(declare-fun m!961965 () Bool)

(assert (=> d!126161 m!961965))

(assert (=> d!126161 m!961875))

(assert (=> b!1042068 m!961873))

(declare-fun m!961967 () Bool)

(assert (=> b!1042068 m!961967))

(assert (=> b!1041991 d!126161))

(declare-fun d!126163 () Bool)

(assert (=> d!126163 (= (validMask!0 (mask!30406 thiss!1427)) (and (or (= (mask!30406 thiss!1427) #b00000000000000000000000000000111) (= (mask!30406 thiss!1427) #b00000000000000000000000000001111) (= (mask!30406 thiss!1427) #b00000000000000000000000000011111) (= (mask!30406 thiss!1427) #b00000000000000000000000000111111) (= (mask!30406 thiss!1427) #b00000000000000000000000001111111) (= (mask!30406 thiss!1427) #b00000000000000000000000011111111) (= (mask!30406 thiss!1427) #b00000000000000000000000111111111) (= (mask!30406 thiss!1427) #b00000000000000000000001111111111) (= (mask!30406 thiss!1427) #b00000000000000000000011111111111) (= (mask!30406 thiss!1427) #b00000000000000000000111111111111) (= (mask!30406 thiss!1427) #b00000000000000000001111111111111) (= (mask!30406 thiss!1427) #b00000000000000000011111111111111) (= (mask!30406 thiss!1427) #b00000000000000000111111111111111) (= (mask!30406 thiss!1427) #b00000000000000001111111111111111) (= (mask!30406 thiss!1427) #b00000000000000011111111111111111) (= (mask!30406 thiss!1427) #b00000000000000111111111111111111) (= (mask!30406 thiss!1427) #b00000000000001111111111111111111) (= (mask!30406 thiss!1427) #b00000000000011111111111111111111) (= (mask!30406 thiss!1427) #b00000000000111111111111111111111) (= (mask!30406 thiss!1427) #b00000000001111111111111111111111) (= (mask!30406 thiss!1427) #b00000000011111111111111111111111) (= (mask!30406 thiss!1427) #b00000000111111111111111111111111) (= (mask!30406 thiss!1427) #b00000001111111111111111111111111) (= (mask!30406 thiss!1427) #b00000011111111111111111111111111) (= (mask!30406 thiss!1427) #b00000111111111111111111111111111) (= (mask!30406 thiss!1427) #b00001111111111111111111111111111) (= (mask!30406 thiss!1427) #b00011111111111111111111111111111) (= (mask!30406 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30406 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1041991 d!126163))

(declare-fun d!126165 () Bool)

(declare-fun e!590126 () Bool)

(assert (=> d!126165 e!590126))

(declare-fun res!694324 () Bool)

(assert (=> d!126165 (=> (not res!694324) (not e!590126))))

(assert (=> d!126165 (= res!694324 (and (bvsge (index!41392 lt!459162) #b00000000000000000000000000000000) (bvslt (index!41392 lt!459162) (size!32123 (_keys!11607 thiss!1427)))))))

(declare-fun lt!459223 () Unit!34027)

(declare-fun choose!53 (array!65667 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21951) Unit!34027)

(assert (=> d!126165 (= lt!459223 (choose!53 (_keys!11607 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41392 lt!459162) #b00000000000000000000000000000000 Nil!21948))))

(assert (=> d!126165 (bvslt (size!32123 (_keys!11607 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126165 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11607 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41392 lt!459162) #b00000000000000000000000000000000 Nil!21948) lt!459223)))

(declare-fun b!1042071 () Bool)

(assert (=> b!1042071 (= e!590126 (arrayNoDuplicates!0 (array!65668 (store (arr!31591 (_keys!11607 thiss!1427)) (index!41392 lt!459162) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32123 (_keys!11607 thiss!1427))) #b00000000000000000000000000000000 Nil!21948))))

(assert (= (and d!126165 res!694324) b!1042071))

(declare-fun m!961969 () Bool)

(assert (=> d!126165 m!961969))

(assert (=> b!1042071 m!961873))

(declare-fun m!961971 () Bool)

(assert (=> b!1042071 m!961971))

(assert (=> b!1041991 d!126165))

(declare-fun b!1042082 () Bool)

(declare-fun e!590135 () Bool)

(declare-fun call!44137 () Bool)

(assert (=> b!1042082 (= e!590135 call!44137)))

(declare-fun d!126167 () Bool)

(declare-fun res!694333 () Bool)

(declare-fun e!590138 () Bool)

(assert (=> d!126167 (=> res!694333 e!590138)))

(assert (=> d!126167 (= res!694333 (bvsge #b00000000000000000000000000000000 (size!32123 lt!459163)))))

(assert (=> d!126167 (= (arrayNoDuplicates!0 lt!459163 #b00000000000000000000000000000000 Nil!21948) e!590138)))

(declare-fun b!1042083 () Bool)

(declare-fun e!590136 () Bool)

(assert (=> b!1042083 (= e!590136 e!590135)))

(declare-fun c!105936 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042083 (= c!105936 (validKeyInArray!0 (select (arr!31591 lt!459163) #b00000000000000000000000000000000)))))

(declare-fun b!1042084 () Bool)

(assert (=> b!1042084 (= e!590135 call!44137)))

(declare-fun b!1042085 () Bool)

(assert (=> b!1042085 (= e!590138 e!590136)))

(declare-fun res!694331 () Bool)

(assert (=> b!1042085 (=> (not res!694331) (not e!590136))))

(declare-fun e!590137 () Bool)

(assert (=> b!1042085 (= res!694331 (not e!590137))))

(declare-fun res!694332 () Bool)

(assert (=> b!1042085 (=> (not res!694332) (not e!590137))))

(assert (=> b!1042085 (= res!694332 (validKeyInArray!0 (select (arr!31591 lt!459163) #b00000000000000000000000000000000)))))

(declare-fun b!1042086 () Bool)

(declare-fun contains!6077 (List!21951 (_ BitVec 64)) Bool)

(assert (=> b!1042086 (= e!590137 (contains!6077 Nil!21948 (select (arr!31591 lt!459163) #b00000000000000000000000000000000)))))

(declare-fun bm!44134 () Bool)

(assert (=> bm!44134 (= call!44137 (arrayNoDuplicates!0 lt!459163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105936 (Cons!21947 (select (arr!31591 lt!459163) #b00000000000000000000000000000000) Nil!21948) Nil!21948)))))

(assert (= (and d!126167 (not res!694333)) b!1042085))

(assert (= (and b!1042085 res!694332) b!1042086))

(assert (= (and b!1042085 res!694331) b!1042083))

(assert (= (and b!1042083 c!105936) b!1042082))

(assert (= (and b!1042083 (not c!105936)) b!1042084))

(assert (= (or b!1042082 b!1042084) bm!44134))

(declare-fun m!961973 () Bool)

(assert (=> b!1042083 m!961973))

(assert (=> b!1042083 m!961973))

(declare-fun m!961975 () Bool)

(assert (=> b!1042083 m!961975))

(assert (=> b!1042085 m!961973))

(assert (=> b!1042085 m!961973))

(assert (=> b!1042085 m!961975))

(assert (=> b!1042086 m!961973))

(assert (=> b!1042086 m!961973))

(declare-fun m!961977 () Bool)

(assert (=> b!1042086 m!961977))

(assert (=> bm!44134 m!961973))

(declare-fun m!961979 () Bool)

(assert (=> bm!44134 m!961979))

(assert (=> b!1041991 d!126167))

(declare-fun b!1042095 () Bool)

(declare-fun e!590146 () Bool)

(declare-fun call!44140 () Bool)

(assert (=> b!1042095 (= e!590146 call!44140)))

(declare-fun b!1042096 () Bool)

(declare-fun e!590145 () Bool)

(assert (=> b!1042096 (= e!590146 e!590145)))

(declare-fun lt!459232 () (_ BitVec 64))

(assert (=> b!1042096 (= lt!459232 (select (arr!31591 lt!459163) #b00000000000000000000000000000000))))

(declare-fun lt!459231 () Unit!34027)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65667 (_ BitVec 64) (_ BitVec 32)) Unit!34027)

(assert (=> b!1042096 (= lt!459231 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459163 lt!459232 #b00000000000000000000000000000000))))

(assert (=> b!1042096 (arrayContainsKey!0 lt!459163 lt!459232 #b00000000000000000000000000000000)))

(declare-fun lt!459230 () Unit!34027)

(assert (=> b!1042096 (= lt!459230 lt!459231)))

(declare-fun res!694338 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65667 (_ BitVec 32)) SeekEntryResult!9755)

(assert (=> b!1042096 (= res!694338 (= (seekEntryOrOpen!0 (select (arr!31591 lt!459163) #b00000000000000000000000000000000) lt!459163 (mask!30406 thiss!1427)) (Found!9755 #b00000000000000000000000000000000)))))

(assert (=> b!1042096 (=> (not res!694338) (not e!590145))))

(declare-fun bm!44137 () Bool)

(assert (=> bm!44137 (= call!44140 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459163 (mask!30406 thiss!1427)))))

(declare-fun b!1042097 () Bool)

(assert (=> b!1042097 (= e!590145 call!44140)))

(declare-fun d!126169 () Bool)

(declare-fun res!694339 () Bool)

(declare-fun e!590147 () Bool)

(assert (=> d!126169 (=> res!694339 e!590147)))

(assert (=> d!126169 (= res!694339 (bvsge #b00000000000000000000000000000000 (size!32123 lt!459163)))))

(assert (=> d!126169 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459163 (mask!30406 thiss!1427)) e!590147)))

(declare-fun b!1042098 () Bool)

(assert (=> b!1042098 (= e!590147 e!590146)))

(declare-fun c!105939 () Bool)

(assert (=> b!1042098 (= c!105939 (validKeyInArray!0 (select (arr!31591 lt!459163) #b00000000000000000000000000000000)))))

(assert (= (and d!126169 (not res!694339)) b!1042098))

(assert (= (and b!1042098 c!105939) b!1042096))

(assert (= (and b!1042098 (not c!105939)) b!1042095))

(assert (= (and b!1042096 res!694338) b!1042097))

(assert (= (or b!1042097 b!1042095) bm!44137))

(assert (=> b!1042096 m!961973))

(declare-fun m!961981 () Bool)

(assert (=> b!1042096 m!961981))

(declare-fun m!961983 () Bool)

(assert (=> b!1042096 m!961983))

(assert (=> b!1042096 m!961973))

(declare-fun m!961985 () Bool)

(assert (=> b!1042096 m!961985))

(declare-fun m!961987 () Bool)

(assert (=> bm!44137 m!961987))

(assert (=> b!1042098 m!961973))

(assert (=> b!1042098 m!961973))

(assert (=> b!1042098 m!961975))

(assert (=> b!1041991 d!126169))

(declare-fun d!126171 () Bool)

(declare-fun res!694344 () Bool)

(declare-fun e!590152 () Bool)

(assert (=> d!126171 (=> res!694344 e!590152)))

(assert (=> d!126171 (= res!694344 (= (select (arr!31591 lt!459163) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126171 (= (arrayContainsKey!0 lt!459163 key!909 #b00000000000000000000000000000000) e!590152)))

(declare-fun b!1042103 () Bool)

(declare-fun e!590153 () Bool)

(assert (=> b!1042103 (= e!590152 e!590153)))

(declare-fun res!694345 () Bool)

(assert (=> b!1042103 (=> (not res!694345) (not e!590153))))

(assert (=> b!1042103 (= res!694345 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32123 lt!459163)))))

(declare-fun b!1042104 () Bool)

(assert (=> b!1042104 (= e!590153 (arrayContainsKey!0 lt!459163 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126171 (not res!694344)) b!1042103))

(assert (= (and b!1042103 res!694345) b!1042104))

(assert (=> d!126171 m!961973))

(declare-fun m!961989 () Bool)

(assert (=> b!1042104 m!961989))

(assert (=> b!1041991 d!126171))

(declare-fun d!126173 () Bool)

(declare-fun lt!459235 () (_ BitVec 32))

(assert (=> d!126173 (and (bvsge lt!459235 #b00000000000000000000000000000000) (bvsle lt!459235 (bvsub (size!32123 (_keys!11607 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!590158 () (_ BitVec 32))

(assert (=> d!126173 (= lt!459235 e!590158)))

(declare-fun c!105944 () Bool)

(assert (=> d!126173 (= c!105944 (bvsge #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))))))

(assert (=> d!126173 (and (bvsle #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32123 (_keys!11607 thiss!1427)) (size!32123 (_keys!11607 thiss!1427))))))

(assert (=> d!126173 (= (arrayCountValidKeys!0 (_keys!11607 thiss!1427) #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))) lt!459235)))

(declare-fun b!1042113 () Bool)

(assert (=> b!1042113 (= e!590158 #b00000000000000000000000000000000)))

(declare-fun b!1042114 () Bool)

(declare-fun e!590159 () (_ BitVec 32))

(declare-fun call!44143 () (_ BitVec 32))

(assert (=> b!1042114 (= e!590159 (bvadd #b00000000000000000000000000000001 call!44143))))

(declare-fun bm!44140 () Bool)

(assert (=> bm!44140 (= call!44143 (arrayCountValidKeys!0 (_keys!11607 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32123 (_keys!11607 thiss!1427))))))

(declare-fun b!1042115 () Bool)

(assert (=> b!1042115 (= e!590159 call!44143)))

(declare-fun b!1042116 () Bool)

(assert (=> b!1042116 (= e!590158 e!590159)))

(declare-fun c!105945 () Bool)

(assert (=> b!1042116 (= c!105945 (validKeyInArray!0 (select (arr!31591 (_keys!11607 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126173 c!105944) b!1042113))

(assert (= (and d!126173 (not c!105944)) b!1042116))

(assert (= (and b!1042116 c!105945) b!1042114))

(assert (= (and b!1042116 (not c!105945)) b!1042115))

(assert (= (or b!1042114 b!1042115) bm!44140))

(declare-fun m!961991 () Bool)

(assert (=> bm!44140 m!961991))

(declare-fun m!961993 () Bool)

(assert (=> b!1042116 m!961993))

(assert (=> b!1042116 m!961993))

(declare-fun m!961995 () Bool)

(assert (=> b!1042116 m!961995))

(assert (=> b!1041991 d!126173))

(declare-fun b!1042125 () Bool)

(declare-fun res!694354 () Bool)

(declare-fun e!590164 () Bool)

(assert (=> b!1042125 (=> (not res!694354) (not e!590164))))

(assert (=> b!1042125 (= res!694354 (validKeyInArray!0 (select (arr!31591 (_keys!11607 thiss!1427)) (index!41392 lt!459162))))))

(declare-fun d!126175 () Bool)

(declare-fun e!590165 () Bool)

(assert (=> d!126175 e!590165))

(declare-fun res!694356 () Bool)

(assert (=> d!126175 (=> (not res!694356) (not e!590165))))

(assert (=> d!126175 (= res!694356 (and (bvsge (index!41392 lt!459162) #b00000000000000000000000000000000) (bvslt (index!41392 lt!459162) (size!32123 (_keys!11607 thiss!1427)))))))

(declare-fun lt!459238 () Unit!34027)

(declare-fun choose!82 (array!65667 (_ BitVec 32) (_ BitVec 64)) Unit!34027)

(assert (=> d!126175 (= lt!459238 (choose!82 (_keys!11607 thiss!1427) (index!41392 lt!459162) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126175 e!590164))

(declare-fun res!694357 () Bool)

(assert (=> d!126175 (=> (not res!694357) (not e!590164))))

(assert (=> d!126175 (= res!694357 (and (bvsge (index!41392 lt!459162) #b00000000000000000000000000000000) (bvslt (index!41392 lt!459162) (size!32123 (_keys!11607 thiss!1427)))))))

(assert (=> d!126175 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11607 thiss!1427) (index!41392 lt!459162) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459238)))

(declare-fun b!1042126 () Bool)

(declare-fun res!694355 () Bool)

(assert (=> b!1042126 (=> (not res!694355) (not e!590164))))

(assert (=> b!1042126 (= res!694355 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042127 () Bool)

(assert (=> b!1042127 (= e!590164 (bvslt (size!32123 (_keys!11607 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1042128 () Bool)

(assert (=> b!1042128 (= e!590165 (= (arrayCountValidKeys!0 (array!65668 (store (arr!31591 (_keys!11607 thiss!1427)) (index!41392 lt!459162) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32123 (_keys!11607 thiss!1427))) #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11607 thiss!1427) #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126175 res!694357) b!1042125))

(assert (= (and b!1042125 res!694354) b!1042126))

(assert (= (and b!1042126 res!694355) b!1042127))

(assert (= (and d!126175 res!694356) b!1042128))

(declare-fun m!961997 () Bool)

(assert (=> b!1042125 m!961997))

(assert (=> b!1042125 m!961997))

(declare-fun m!961999 () Bool)

(assert (=> b!1042125 m!961999))

(declare-fun m!962001 () Bool)

(assert (=> d!126175 m!962001))

(declare-fun m!962003 () Bool)

(assert (=> b!1042126 m!962003))

(assert (=> b!1042128 m!961873))

(declare-fun m!962005 () Bool)

(assert (=> b!1042128 m!962005))

(assert (=> b!1042128 m!961879))

(assert (=> b!1041991 d!126175))

(declare-fun d!126177 () Bool)

(declare-fun lt!459239 () (_ BitVec 32))

(assert (=> d!126177 (and (bvsge lt!459239 #b00000000000000000000000000000000) (bvsle lt!459239 (bvsub (size!32123 lt!459163) #b00000000000000000000000000000000)))))

(declare-fun e!590166 () (_ BitVec 32))

(assert (=> d!126177 (= lt!459239 e!590166)))

(declare-fun c!105946 () Bool)

(assert (=> d!126177 (= c!105946 (bvsge #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))))))

(assert (=> d!126177 (and (bvsle #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32123 (_keys!11607 thiss!1427)) (size!32123 lt!459163)))))

(assert (=> d!126177 (= (arrayCountValidKeys!0 lt!459163 #b00000000000000000000000000000000 (size!32123 (_keys!11607 thiss!1427))) lt!459239)))

(declare-fun b!1042129 () Bool)

(assert (=> b!1042129 (= e!590166 #b00000000000000000000000000000000)))

(declare-fun b!1042130 () Bool)

(declare-fun e!590167 () (_ BitVec 32))

(declare-fun call!44144 () (_ BitVec 32))

(assert (=> b!1042130 (= e!590167 (bvadd #b00000000000000000000000000000001 call!44144))))

(declare-fun bm!44141 () Bool)

(assert (=> bm!44141 (= call!44144 (arrayCountValidKeys!0 lt!459163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32123 (_keys!11607 thiss!1427))))))

(declare-fun b!1042131 () Bool)

(assert (=> b!1042131 (= e!590167 call!44144)))

(declare-fun b!1042132 () Bool)

(assert (=> b!1042132 (= e!590166 e!590167)))

(declare-fun c!105947 () Bool)

(assert (=> b!1042132 (= c!105947 (validKeyInArray!0 (select (arr!31591 lt!459163) #b00000000000000000000000000000000)))))

(assert (= (and d!126177 c!105946) b!1042129))

(assert (= (and d!126177 (not c!105946)) b!1042132))

(assert (= (and b!1042132 c!105947) b!1042130))

(assert (= (and b!1042132 (not c!105947)) b!1042131))

(assert (= (or b!1042130 b!1042131) bm!44141))

(declare-fun m!962007 () Bool)

(assert (=> bm!44141 m!962007))

(assert (=> b!1042132 m!961973))

(assert (=> b!1042132 m!961973))

(assert (=> b!1042132 m!961975))

(assert (=> b!1041991 d!126177))

(declare-fun b!1042139 () Bool)

(declare-fun e!590173 () Bool)

(assert (=> b!1042139 (= e!590173 tp_is_empty!24739)))

(declare-fun mapNonEmpty!38701 () Bool)

(declare-fun mapRes!38701 () Bool)

(declare-fun tp!74273 () Bool)

(assert (=> mapNonEmpty!38701 (= mapRes!38701 (and tp!74273 e!590173))))

(declare-fun mapValue!38701 () ValueCell!11666)

(declare-fun mapKey!38701 () (_ BitVec 32))

(declare-fun mapRest!38701 () (Array (_ BitVec 32) ValueCell!11666))

(assert (=> mapNonEmpty!38701 (= mapRest!38692 (store mapRest!38701 mapKey!38701 mapValue!38701))))

(declare-fun condMapEmpty!38701 () Bool)

(declare-fun mapDefault!38701 () ValueCell!11666)

(assert (=> mapNonEmpty!38692 (= condMapEmpty!38701 (= mapRest!38692 ((as const (Array (_ BitVec 32) ValueCell!11666)) mapDefault!38701)))))

(declare-fun e!590172 () Bool)

(assert (=> mapNonEmpty!38692 (= tp!74257 (and e!590172 mapRes!38701))))

(declare-fun mapIsEmpty!38701 () Bool)

(assert (=> mapIsEmpty!38701 mapRes!38701))

(declare-fun b!1042140 () Bool)

(assert (=> b!1042140 (= e!590172 tp_is_empty!24739)))

(assert (= (and mapNonEmpty!38692 condMapEmpty!38701) mapIsEmpty!38701))

(assert (= (and mapNonEmpty!38692 (not condMapEmpty!38701)) mapNonEmpty!38701))

(assert (= (and mapNonEmpty!38701 ((_ is ValueCellFull!11666) mapValue!38701)) b!1042139))

(assert (= (and mapNonEmpty!38692 ((_ is ValueCellFull!11666) mapDefault!38701)) b!1042140))

(declare-fun m!962009 () Bool)

(assert (=> mapNonEmpty!38701 m!962009))

(check-sat (not b!1042128) (not b!1042116) (not b!1042086) b_and!33561 (not b_next!21019) (not b!1042083) (not b!1042126) (not b!1042098) (not b!1042065) (not b!1042071) (not d!126151) (not d!126159) (not b!1042060) (not b!1042104) (not bm!44134) (not b!1042049) (not b!1042061) tp_is_empty!24739 (not d!126165) (not d!126161) (not bm!44141) (not b!1042132) (not b!1042125) (not b!1042096) (not bm!44140) (not b!1042068) (not mapNonEmpty!38701) (not d!126175) (not b!1042085) (not d!126153) (not b!1042062) (not bm!44137))
(check-sat b_and!33561 (not b_next!21019))
