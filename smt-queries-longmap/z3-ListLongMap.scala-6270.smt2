; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80196 () Bool)

(assert start!80196)

(declare-fun b!942059 () Bool)

(declare-fun b_free!17941 () Bool)

(declare-fun b_next!17941 () Bool)

(assert (=> b!942059 (= b_free!17941 (not b_next!17941))))

(declare-fun tp!62324 () Bool)

(declare-fun b_and!29327 () Bool)

(assert (=> b!942059 (= tp!62324 b_and!29327)))

(declare-fun b!942053 () Bool)

(declare-fun res!633119 () Bool)

(declare-fun e!529654 () Bool)

(assert (=> b!942053 (=> (not res!633119) (not e!529654))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942053 (= res!633119 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942054 () Bool)

(declare-fun res!633122 () Bool)

(assert (=> b!942054 (=> (not res!633122) (not e!529654))))

(declare-datatypes ((V!32231 0))(
  ( (V!32232 (val!10275 Int)) )
))
(declare-datatypes ((ValueCell!9743 0))(
  ( (ValueCellFull!9743 (v!12805 V!32231)) (EmptyCell!9743) )
))
(declare-datatypes ((array!56825 0))(
  ( (array!56826 (arr!27341 (Array (_ BitVec 32) ValueCell!9743)) (size!27808 (_ BitVec 32))) )
))
(declare-datatypes ((array!56827 0))(
  ( (array!56828 (arr!27342 (Array (_ BitVec 32) (_ BitVec 64))) (size!27809 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4636 0))(
  ( (LongMapFixedSize!4637 (defaultEntry!5609 Int) (mask!27204 (_ BitVec 32)) (extraKeys!5341 (_ BitVec 32)) (zeroValue!5445 V!32231) (minValue!5445 V!32231) (_size!2373 (_ BitVec 32)) (_keys!10474 array!56827) (_values!5632 array!56825) (_vacant!2373 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4636)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9030 0))(
  ( (MissingZero!9030 (index!38491 (_ BitVec 32))) (Found!9030 (index!38492 (_ BitVec 32))) (Intermediate!9030 (undefined!9842 Bool) (index!38493 (_ BitVec 32)) (x!80898 (_ BitVec 32))) (Undefined!9030) (MissingVacant!9030 (index!38494 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56827 (_ BitVec 32)) SeekEntryResult!9030)

(assert (=> b!942054 (= res!633122 (not ((_ is Found!9030) (seekEntry!0 key!756 (_keys!10474 thiss!1141) (mask!27204 thiss!1141)))))))

(declare-fun mapIsEmpty!32489 () Bool)

(declare-fun mapRes!32489 () Bool)

(assert (=> mapIsEmpty!32489 mapRes!32489))

(declare-fun b!942055 () Bool)

(declare-fun res!633120 () Bool)

(assert (=> b!942055 (=> (not res!633120) (not e!529654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56827 (_ BitVec 32)) Bool)

(assert (=> b!942055 (= res!633120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10474 thiss!1141) (mask!27204 thiss!1141)))))

(declare-fun b!942056 () Bool)

(declare-fun e!529656 () Bool)

(declare-fun e!529655 () Bool)

(assert (=> b!942056 (= e!529656 (and e!529655 mapRes!32489))))

(declare-fun condMapEmpty!32489 () Bool)

(declare-fun mapDefault!32489 () ValueCell!9743)

(assert (=> b!942056 (= condMapEmpty!32489 (= (arr!27341 (_values!5632 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9743)) mapDefault!32489)))))

(declare-fun b!942058 () Bool)

(declare-fun e!529657 () Bool)

(declare-fun tp_is_empty!20449 () Bool)

(assert (=> b!942058 (= e!529657 tp_is_empty!20449)))

(declare-fun e!529653 () Bool)

(declare-fun array_inv!21312 (array!56827) Bool)

(declare-fun array_inv!21313 (array!56825) Bool)

(assert (=> b!942059 (= e!529653 (and tp!62324 tp_is_empty!20449 (array_inv!21312 (_keys!10474 thiss!1141)) (array_inv!21313 (_values!5632 thiss!1141)) e!529656))))

(declare-fun b!942060 () Bool)

(assert (=> b!942060 (= e!529655 tp_is_empty!20449)))

(declare-fun b!942061 () Bool)

(declare-fun res!633118 () Bool)

(assert (=> b!942061 (=> (not res!633118) (not e!529654))))

(assert (=> b!942061 (= res!633118 (and (= (size!27808 (_values!5632 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27204 thiss!1141))) (= (size!27809 (_keys!10474 thiss!1141)) (size!27808 (_values!5632 thiss!1141))) (bvsge (mask!27204 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5341 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5341 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32489 () Bool)

(declare-fun tp!62323 () Bool)

(assert (=> mapNonEmpty!32489 (= mapRes!32489 (and tp!62323 e!529657))))

(declare-fun mapRest!32489 () (Array (_ BitVec 32) ValueCell!9743))

(declare-fun mapKey!32489 () (_ BitVec 32))

(declare-fun mapValue!32489 () ValueCell!9743)

(assert (=> mapNonEmpty!32489 (= (arr!27341 (_values!5632 thiss!1141)) (store mapRest!32489 mapKey!32489 mapValue!32489))))

(declare-fun b!942062 () Bool)

(declare-fun res!633123 () Bool)

(assert (=> b!942062 (=> (not res!633123) (not e!529654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942062 (= res!633123 (validMask!0 (mask!27204 thiss!1141)))))

(declare-fun b!942057 () Bool)

(declare-datatypes ((List!19222 0))(
  ( (Nil!19219) (Cons!19218 (h!20368 (_ BitVec 64)) (t!27528 List!19222)) )
))
(declare-fun arrayNoDuplicates!0 (array!56827 (_ BitVec 32) List!19222) Bool)

(assert (=> b!942057 (= e!529654 (not (arrayNoDuplicates!0 (_keys!10474 thiss!1141) #b00000000000000000000000000000000 Nil!19219)))))

(declare-fun res!633121 () Bool)

(assert (=> start!80196 (=> (not res!633121) (not e!529654))))

(declare-fun valid!1784 (LongMapFixedSize!4636) Bool)

(assert (=> start!80196 (= res!633121 (valid!1784 thiss!1141))))

(assert (=> start!80196 e!529654))

(assert (=> start!80196 e!529653))

(assert (=> start!80196 true))

(assert (= (and start!80196 res!633121) b!942053))

(assert (= (and b!942053 res!633119) b!942054))

(assert (= (and b!942054 res!633122) b!942062))

(assert (= (and b!942062 res!633123) b!942061))

(assert (= (and b!942061 res!633118) b!942055))

(assert (= (and b!942055 res!633120) b!942057))

(assert (= (and b!942056 condMapEmpty!32489) mapIsEmpty!32489))

(assert (= (and b!942056 (not condMapEmpty!32489)) mapNonEmpty!32489))

(assert (= (and mapNonEmpty!32489 ((_ is ValueCellFull!9743) mapValue!32489)) b!942058))

(assert (= (and b!942056 ((_ is ValueCellFull!9743) mapDefault!32489)) b!942060))

(assert (= b!942059 b!942056))

(assert (= start!80196 b!942059))

(declare-fun m!876181 () Bool)

(assert (=> b!942054 m!876181))

(declare-fun m!876183 () Bool)

(assert (=> mapNonEmpty!32489 m!876183))

(declare-fun m!876185 () Bool)

(assert (=> b!942062 m!876185))

(declare-fun m!876187 () Bool)

(assert (=> b!942057 m!876187))

(declare-fun m!876189 () Bool)

(assert (=> b!942059 m!876189))

(declare-fun m!876191 () Bool)

(assert (=> b!942059 m!876191))

(declare-fun m!876193 () Bool)

(assert (=> b!942055 m!876193))

(declare-fun m!876195 () Bool)

(assert (=> start!80196 m!876195))

(check-sat b_and!29327 (not b!942057) (not b!942059) (not start!80196) (not b!942054) (not b!942062) (not b!942055) (not mapNonEmpty!32489) tp_is_empty!20449 (not b_next!17941))
(check-sat b_and!29327 (not b_next!17941))
(get-model)

(declare-fun bm!40927 () Bool)

(declare-fun call!40930 () Bool)

(assert (=> bm!40927 (= call!40930 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10474 thiss!1141) (mask!27204 thiss!1141)))))

(declare-fun b!942131 () Bool)

(declare-fun e!529701 () Bool)

(declare-fun e!529702 () Bool)

(assert (=> b!942131 (= e!529701 e!529702)))

(declare-fun lt!424906 () (_ BitVec 64))

(assert (=> b!942131 (= lt!424906 (select (arr!27342 (_keys!10474 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31695 0))(
  ( (Unit!31696) )
))
(declare-fun lt!424905 () Unit!31695)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56827 (_ BitVec 64) (_ BitVec 32)) Unit!31695)

(assert (=> b!942131 (= lt!424905 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10474 thiss!1141) lt!424906 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942131 (arrayContainsKey!0 (_keys!10474 thiss!1141) lt!424906 #b00000000000000000000000000000000)))

(declare-fun lt!424907 () Unit!31695)

(assert (=> b!942131 (= lt!424907 lt!424905)))

(declare-fun res!633165 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56827 (_ BitVec 32)) SeekEntryResult!9030)

(assert (=> b!942131 (= res!633165 (= (seekEntryOrOpen!0 (select (arr!27342 (_keys!10474 thiss!1141)) #b00000000000000000000000000000000) (_keys!10474 thiss!1141) (mask!27204 thiss!1141)) (Found!9030 #b00000000000000000000000000000000)))))

(assert (=> b!942131 (=> (not res!633165) (not e!529702))))

(declare-fun d!113975 () Bool)

(declare-fun res!633164 () Bool)

(declare-fun e!529703 () Bool)

(assert (=> d!113975 (=> res!633164 e!529703)))

(assert (=> d!113975 (= res!633164 (bvsge #b00000000000000000000000000000000 (size!27809 (_keys!10474 thiss!1141))))))

(assert (=> d!113975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10474 thiss!1141) (mask!27204 thiss!1141)) e!529703)))

(declare-fun b!942132 () Bool)

(assert (=> b!942132 (= e!529703 e!529701)))

(declare-fun c!98150 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942132 (= c!98150 (validKeyInArray!0 (select (arr!27342 (_keys!10474 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942133 () Bool)

(assert (=> b!942133 (= e!529701 call!40930)))

(declare-fun b!942134 () Bool)

(assert (=> b!942134 (= e!529702 call!40930)))

(assert (= (and d!113975 (not res!633164)) b!942132))

(assert (= (and b!942132 c!98150) b!942131))

(assert (= (and b!942132 (not c!98150)) b!942133))

(assert (= (and b!942131 res!633165) b!942134))

(assert (= (or b!942134 b!942133) bm!40927))

(declare-fun m!876229 () Bool)

(assert (=> bm!40927 m!876229))

(declare-fun m!876231 () Bool)

(assert (=> b!942131 m!876231))

(declare-fun m!876233 () Bool)

(assert (=> b!942131 m!876233))

(declare-fun m!876235 () Bool)

(assert (=> b!942131 m!876235))

(assert (=> b!942131 m!876231))

(declare-fun m!876237 () Bool)

(assert (=> b!942131 m!876237))

(assert (=> b!942132 m!876231))

(assert (=> b!942132 m!876231))

(declare-fun m!876239 () Bool)

(assert (=> b!942132 m!876239))

(assert (=> b!942055 d!113975))

(declare-fun d!113977 () Bool)

(declare-fun res!633172 () Bool)

(declare-fun e!529706 () Bool)

(assert (=> d!113977 (=> (not res!633172) (not e!529706))))

(declare-fun simpleValid!346 (LongMapFixedSize!4636) Bool)

(assert (=> d!113977 (= res!633172 (simpleValid!346 thiss!1141))))

(assert (=> d!113977 (= (valid!1784 thiss!1141) e!529706)))

(declare-fun b!942141 () Bool)

(declare-fun res!633173 () Bool)

(assert (=> b!942141 (=> (not res!633173) (not e!529706))))

(declare-fun arrayCountValidKeys!0 (array!56827 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942141 (= res!633173 (= (arrayCountValidKeys!0 (_keys!10474 thiss!1141) #b00000000000000000000000000000000 (size!27809 (_keys!10474 thiss!1141))) (_size!2373 thiss!1141)))))

(declare-fun b!942142 () Bool)

(declare-fun res!633174 () Bool)

(assert (=> b!942142 (=> (not res!633174) (not e!529706))))

(assert (=> b!942142 (= res!633174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10474 thiss!1141) (mask!27204 thiss!1141)))))

(declare-fun b!942143 () Bool)

(assert (=> b!942143 (= e!529706 (arrayNoDuplicates!0 (_keys!10474 thiss!1141) #b00000000000000000000000000000000 Nil!19219))))

(assert (= (and d!113977 res!633172) b!942141))

(assert (= (and b!942141 res!633173) b!942142))

(assert (= (and b!942142 res!633174) b!942143))

(declare-fun m!876241 () Bool)

(assert (=> d!113977 m!876241))

(declare-fun m!876243 () Bool)

(assert (=> b!942141 m!876243))

(assert (=> b!942142 m!876193))

(assert (=> b!942143 m!876187))

(assert (=> start!80196 d!113977))

(declare-fun d!113979 () Bool)

(assert (=> d!113979 (= (array_inv!21312 (_keys!10474 thiss!1141)) (bvsge (size!27809 (_keys!10474 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942059 d!113979))

(declare-fun d!113981 () Bool)

(assert (=> d!113981 (= (array_inv!21313 (_values!5632 thiss!1141)) (bvsge (size!27808 (_values!5632 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942059 d!113981))

(declare-fun d!113983 () Bool)

(assert (=> d!113983 (= (validMask!0 (mask!27204 thiss!1141)) (and (or (= (mask!27204 thiss!1141) #b00000000000000000000000000000111) (= (mask!27204 thiss!1141) #b00000000000000000000000000001111) (= (mask!27204 thiss!1141) #b00000000000000000000000000011111) (= (mask!27204 thiss!1141) #b00000000000000000000000000111111) (= (mask!27204 thiss!1141) #b00000000000000000000000001111111) (= (mask!27204 thiss!1141) #b00000000000000000000000011111111) (= (mask!27204 thiss!1141) #b00000000000000000000000111111111) (= (mask!27204 thiss!1141) #b00000000000000000000001111111111) (= (mask!27204 thiss!1141) #b00000000000000000000011111111111) (= (mask!27204 thiss!1141) #b00000000000000000000111111111111) (= (mask!27204 thiss!1141) #b00000000000000000001111111111111) (= (mask!27204 thiss!1141) #b00000000000000000011111111111111) (= (mask!27204 thiss!1141) #b00000000000000000111111111111111) (= (mask!27204 thiss!1141) #b00000000000000001111111111111111) (= (mask!27204 thiss!1141) #b00000000000000011111111111111111) (= (mask!27204 thiss!1141) #b00000000000000111111111111111111) (= (mask!27204 thiss!1141) #b00000000000001111111111111111111) (= (mask!27204 thiss!1141) #b00000000000011111111111111111111) (= (mask!27204 thiss!1141) #b00000000000111111111111111111111) (= (mask!27204 thiss!1141) #b00000000001111111111111111111111) (= (mask!27204 thiss!1141) #b00000000011111111111111111111111) (= (mask!27204 thiss!1141) #b00000000111111111111111111111111) (= (mask!27204 thiss!1141) #b00000001111111111111111111111111) (= (mask!27204 thiss!1141) #b00000011111111111111111111111111) (= (mask!27204 thiss!1141) #b00000111111111111111111111111111) (= (mask!27204 thiss!1141) #b00001111111111111111111111111111) (= (mask!27204 thiss!1141) #b00011111111111111111111111111111) (= (mask!27204 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27204 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942062 d!113983))

(declare-fun b!942156 () Bool)

(declare-fun e!529715 () SeekEntryResult!9030)

(declare-fun lt!424916 () SeekEntryResult!9030)

(assert (=> b!942156 (= e!529715 (ite ((_ is MissingVacant!9030) lt!424916) (MissingZero!9030 (index!38494 lt!424916)) lt!424916))))

(declare-fun lt!424917 () SeekEntryResult!9030)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56827 (_ BitVec 32)) SeekEntryResult!9030)

(assert (=> b!942156 (= lt!424916 (seekKeyOrZeroReturnVacant!0 (x!80898 lt!424917) (index!38493 lt!424917) (index!38493 lt!424917) key!756 (_keys!10474 thiss!1141) (mask!27204 thiss!1141)))))

(declare-fun d!113985 () Bool)

(declare-fun lt!424918 () SeekEntryResult!9030)

(assert (=> d!113985 (and (or ((_ is MissingVacant!9030) lt!424918) (not ((_ is Found!9030) lt!424918)) (and (bvsge (index!38492 lt!424918) #b00000000000000000000000000000000) (bvslt (index!38492 lt!424918) (size!27809 (_keys!10474 thiss!1141))))) (not ((_ is MissingVacant!9030) lt!424918)) (or (not ((_ is Found!9030) lt!424918)) (= (select (arr!27342 (_keys!10474 thiss!1141)) (index!38492 lt!424918)) key!756)))))

(declare-fun e!529713 () SeekEntryResult!9030)

(assert (=> d!113985 (= lt!424918 e!529713)))

(declare-fun c!98158 () Bool)

(assert (=> d!113985 (= c!98158 (and ((_ is Intermediate!9030) lt!424917) (undefined!9842 lt!424917)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56827 (_ BitVec 32)) SeekEntryResult!9030)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113985 (= lt!424917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27204 thiss!1141)) key!756 (_keys!10474 thiss!1141) (mask!27204 thiss!1141)))))

(assert (=> d!113985 (validMask!0 (mask!27204 thiss!1141))))

(assert (=> d!113985 (= (seekEntry!0 key!756 (_keys!10474 thiss!1141) (mask!27204 thiss!1141)) lt!424918)))

(declare-fun b!942157 () Bool)

(assert (=> b!942157 (= e!529713 Undefined!9030)))

(declare-fun b!942158 () Bool)

(declare-fun e!529714 () SeekEntryResult!9030)

(assert (=> b!942158 (= e!529713 e!529714)))

(declare-fun lt!424919 () (_ BitVec 64))

(assert (=> b!942158 (= lt!424919 (select (arr!27342 (_keys!10474 thiss!1141)) (index!38493 lt!424917)))))

(declare-fun c!98159 () Bool)

(assert (=> b!942158 (= c!98159 (= lt!424919 key!756))))

(declare-fun b!942159 () Bool)

(declare-fun c!98157 () Bool)

(assert (=> b!942159 (= c!98157 (= lt!424919 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942159 (= e!529714 e!529715)))

(declare-fun b!942160 () Bool)

(assert (=> b!942160 (= e!529714 (Found!9030 (index!38493 lt!424917)))))

(declare-fun b!942161 () Bool)

(assert (=> b!942161 (= e!529715 (MissingZero!9030 (index!38493 lt!424917)))))

(assert (= (and d!113985 c!98158) b!942157))

(assert (= (and d!113985 (not c!98158)) b!942158))

(assert (= (and b!942158 c!98159) b!942160))

(assert (= (and b!942158 (not c!98159)) b!942159))

(assert (= (and b!942159 c!98157) b!942161))

(assert (= (and b!942159 (not c!98157)) b!942156))

(declare-fun m!876245 () Bool)

(assert (=> b!942156 m!876245))

(declare-fun m!876247 () Bool)

(assert (=> d!113985 m!876247))

(declare-fun m!876249 () Bool)

(assert (=> d!113985 m!876249))

(assert (=> d!113985 m!876249))

(declare-fun m!876251 () Bool)

(assert (=> d!113985 m!876251))

(assert (=> d!113985 m!876185))

(declare-fun m!876253 () Bool)

(assert (=> b!942158 m!876253))

(assert (=> b!942054 d!113985))

(declare-fun d!113987 () Bool)

(declare-fun res!633182 () Bool)

(declare-fun e!529724 () Bool)

(assert (=> d!113987 (=> res!633182 e!529724)))

(assert (=> d!113987 (= res!633182 (bvsge #b00000000000000000000000000000000 (size!27809 (_keys!10474 thiss!1141))))))

(assert (=> d!113987 (= (arrayNoDuplicates!0 (_keys!10474 thiss!1141) #b00000000000000000000000000000000 Nil!19219) e!529724)))

(declare-fun b!942172 () Bool)

(declare-fun e!529726 () Bool)

(declare-fun call!40933 () Bool)

(assert (=> b!942172 (= e!529726 call!40933)))

(declare-fun bm!40930 () Bool)

(declare-fun c!98162 () Bool)

(assert (=> bm!40930 (= call!40933 (arrayNoDuplicates!0 (_keys!10474 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98162 (Cons!19218 (select (arr!27342 (_keys!10474 thiss!1141)) #b00000000000000000000000000000000) Nil!19219) Nil!19219)))))

(declare-fun b!942173 () Bool)

(declare-fun e!529727 () Bool)

(assert (=> b!942173 (= e!529724 e!529727)))

(declare-fun res!633181 () Bool)

(assert (=> b!942173 (=> (not res!633181) (not e!529727))))

(declare-fun e!529725 () Bool)

(assert (=> b!942173 (= res!633181 (not e!529725))))

(declare-fun res!633183 () Bool)

(assert (=> b!942173 (=> (not res!633183) (not e!529725))))

(assert (=> b!942173 (= res!633183 (validKeyInArray!0 (select (arr!27342 (_keys!10474 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942174 () Bool)

(assert (=> b!942174 (= e!529727 e!529726)))

(assert (=> b!942174 (= c!98162 (validKeyInArray!0 (select (arr!27342 (_keys!10474 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942175 () Bool)

(declare-fun contains!5098 (List!19222 (_ BitVec 64)) Bool)

(assert (=> b!942175 (= e!529725 (contains!5098 Nil!19219 (select (arr!27342 (_keys!10474 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942176 () Bool)

(assert (=> b!942176 (= e!529726 call!40933)))

(assert (= (and d!113987 (not res!633182)) b!942173))

(assert (= (and b!942173 res!633183) b!942175))

(assert (= (and b!942173 res!633181) b!942174))

(assert (= (and b!942174 c!98162) b!942172))

(assert (= (and b!942174 (not c!98162)) b!942176))

(assert (= (or b!942172 b!942176) bm!40930))

(assert (=> bm!40930 m!876231))

(declare-fun m!876255 () Bool)

(assert (=> bm!40930 m!876255))

(assert (=> b!942173 m!876231))

(assert (=> b!942173 m!876231))

(assert (=> b!942173 m!876239))

(assert (=> b!942174 m!876231))

(assert (=> b!942174 m!876231))

(assert (=> b!942174 m!876239))

(assert (=> b!942175 m!876231))

(assert (=> b!942175 m!876231))

(declare-fun m!876257 () Bool)

(assert (=> b!942175 m!876257))

(assert (=> b!942057 d!113987))

(declare-fun condMapEmpty!32498 () Bool)

(declare-fun mapDefault!32498 () ValueCell!9743)

(assert (=> mapNonEmpty!32489 (= condMapEmpty!32498 (= mapRest!32489 ((as const (Array (_ BitVec 32) ValueCell!9743)) mapDefault!32498)))))

(declare-fun e!529733 () Bool)

(declare-fun mapRes!32498 () Bool)

(assert (=> mapNonEmpty!32489 (= tp!62323 (and e!529733 mapRes!32498))))

(declare-fun b!942184 () Bool)

(assert (=> b!942184 (= e!529733 tp_is_empty!20449)))

(declare-fun mapNonEmpty!32498 () Bool)

(declare-fun tp!62339 () Bool)

(declare-fun e!529732 () Bool)

(assert (=> mapNonEmpty!32498 (= mapRes!32498 (and tp!62339 e!529732))))

(declare-fun mapRest!32498 () (Array (_ BitVec 32) ValueCell!9743))

(declare-fun mapKey!32498 () (_ BitVec 32))

(declare-fun mapValue!32498 () ValueCell!9743)

(assert (=> mapNonEmpty!32498 (= mapRest!32489 (store mapRest!32498 mapKey!32498 mapValue!32498))))

(declare-fun mapIsEmpty!32498 () Bool)

(assert (=> mapIsEmpty!32498 mapRes!32498))

(declare-fun b!942183 () Bool)

(assert (=> b!942183 (= e!529732 tp_is_empty!20449)))

(assert (= (and mapNonEmpty!32489 condMapEmpty!32498) mapIsEmpty!32498))

(assert (= (and mapNonEmpty!32489 (not condMapEmpty!32498)) mapNonEmpty!32498))

(assert (= (and mapNonEmpty!32498 ((_ is ValueCellFull!9743) mapValue!32498)) b!942183))

(assert (= (and mapNonEmpty!32489 ((_ is ValueCellFull!9743) mapDefault!32498)) b!942184))

(declare-fun m!876259 () Bool)

(assert (=> mapNonEmpty!32498 m!876259))

(check-sat (not d!113977) (not mapNonEmpty!32498) (not b!942141) (not b!942142) (not b!942175) (not bm!40930) (not b_next!17941) (not b!942132) (not b!942173) (not b!942131) b_and!29327 (not d!113985) (not b!942156) tp_is_empty!20449 (not b!942174) (not bm!40927) (not b!942143))
(check-sat b_and!29327 (not b_next!17941))
