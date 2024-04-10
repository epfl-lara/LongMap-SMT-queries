; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80198 () Bool)

(assert start!80198)

(declare-fun b!942192 () Bool)

(declare-fun b_free!17937 () Bool)

(declare-fun b_next!17937 () Bool)

(assert (=> b!942192 (= b_free!17937 (not b_next!17937))))

(declare-fun tp!62308 () Bool)

(declare-fun b_and!29349 () Bool)

(assert (=> b!942192 (= tp!62308 b_and!29349)))

(declare-fun b!942189 () Bool)

(declare-fun e!529740 () Bool)

(declare-fun tp_is_empty!20445 () Bool)

(assert (=> b!942189 (= e!529740 tp_is_empty!20445)))

(declare-fun res!633183 () Bool)

(declare-fun e!529739 () Bool)

(assert (=> start!80198 (=> (not res!633183) (not e!529739))))

(declare-datatypes ((V!32225 0))(
  ( (V!32226 (val!10273 Int)) )
))
(declare-datatypes ((ValueCell!9741 0))(
  ( (ValueCellFull!9741 (v!12804 V!32225)) (EmptyCell!9741) )
))
(declare-datatypes ((array!56850 0))(
  ( (array!56851 (arr!27354 (Array (_ BitVec 32) ValueCell!9741)) (size!27819 (_ BitVec 32))) )
))
(declare-datatypes ((array!56852 0))(
  ( (array!56853 (arr!27355 (Array (_ BitVec 32) (_ BitVec 64))) (size!27820 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4632 0))(
  ( (LongMapFixedSize!4633 (defaultEntry!5607 Int) (mask!27204 (_ BitVec 32)) (extraKeys!5339 (_ BitVec 32)) (zeroValue!5443 V!32225) (minValue!5443 V!32225) (_size!2371 (_ BitVec 32)) (_keys!10475 array!56852) (_values!5630 array!56850) (_vacant!2371 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4632)

(declare-fun valid!1772 (LongMapFixedSize!4632) Bool)

(assert (=> start!80198 (= res!633183 (valid!1772 thiss!1141))))

(assert (=> start!80198 e!529739))

(declare-fun e!529741 () Bool)

(assert (=> start!80198 e!529741))

(assert (=> start!80198 true))

(declare-fun b!942190 () Bool)

(declare-fun e!529743 () Bool)

(declare-fun e!529738 () Bool)

(declare-fun mapRes!32480 () Bool)

(assert (=> b!942190 (= e!529743 (and e!529738 mapRes!32480))))

(declare-fun condMapEmpty!32480 () Bool)

(declare-fun mapDefault!32480 () ValueCell!9741)

(assert (=> b!942190 (= condMapEmpty!32480 (= (arr!27354 (_values!5630 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9741)) mapDefault!32480)))))

(declare-fun mapIsEmpty!32480 () Bool)

(assert (=> mapIsEmpty!32480 mapRes!32480))

(declare-fun b!942191 () Bool)

(declare-fun res!633182 () Bool)

(assert (=> b!942191 (=> (not res!633182) (not e!529739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942191 (= res!633182 (validMask!0 (mask!27204 thiss!1141)))))

(declare-fun array_inv!21254 (array!56852) Bool)

(declare-fun array_inv!21255 (array!56850) Bool)

(assert (=> b!942192 (= e!529741 (and tp!62308 tp_is_empty!20445 (array_inv!21254 (_keys!10475 thiss!1141)) (array_inv!21255 (_values!5630 thiss!1141)) e!529743))))

(declare-fun b!942193 () Bool)

(assert (=> b!942193 (= e!529738 tp_is_empty!20445)))

(declare-fun b!942194 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56852 (_ BitVec 32)) Bool)

(assert (=> b!942194 (= e!529739 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10475 thiss!1141) (mask!27204 thiss!1141))))))

(declare-fun b!942195 () Bool)

(declare-fun res!633181 () Bool)

(assert (=> b!942195 (=> (not res!633181) (not e!529739))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9029 0))(
  ( (MissingZero!9029 (index!38487 (_ BitVec 32))) (Found!9029 (index!38488 (_ BitVec 32))) (Intermediate!9029 (undefined!9841 Bool) (index!38489 (_ BitVec 32)) (x!80886 (_ BitVec 32))) (Undefined!9029) (MissingVacant!9029 (index!38490 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56852 (_ BitVec 32)) SeekEntryResult!9029)

(assert (=> b!942195 (= res!633181 (not ((_ is Found!9029) (seekEntry!0 key!756 (_keys!10475 thiss!1141) (mask!27204 thiss!1141)))))))

(declare-fun b!942196 () Bool)

(declare-fun res!633184 () Bool)

(assert (=> b!942196 (=> (not res!633184) (not e!529739))))

(assert (=> b!942196 (= res!633184 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32480 () Bool)

(declare-fun tp!62307 () Bool)

(assert (=> mapNonEmpty!32480 (= mapRes!32480 (and tp!62307 e!529740))))

(declare-fun mapValue!32480 () ValueCell!9741)

(declare-fun mapRest!32480 () (Array (_ BitVec 32) ValueCell!9741))

(declare-fun mapKey!32480 () (_ BitVec 32))

(assert (=> mapNonEmpty!32480 (= (arr!27354 (_values!5630 thiss!1141)) (store mapRest!32480 mapKey!32480 mapValue!32480))))

(declare-fun b!942197 () Bool)

(declare-fun res!633185 () Bool)

(assert (=> b!942197 (=> (not res!633185) (not e!529739))))

(assert (=> b!942197 (= res!633185 (and (= (size!27819 (_values!5630 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27204 thiss!1141))) (= (size!27820 (_keys!10475 thiss!1141)) (size!27819 (_values!5630 thiss!1141))) (bvsge (mask!27204 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5339 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5339 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!80198 res!633183) b!942196))

(assert (= (and b!942196 res!633184) b!942195))

(assert (= (and b!942195 res!633181) b!942191))

(assert (= (and b!942191 res!633182) b!942197))

(assert (= (and b!942197 res!633185) b!942194))

(assert (= (and b!942190 condMapEmpty!32480) mapIsEmpty!32480))

(assert (= (and b!942190 (not condMapEmpty!32480)) mapNonEmpty!32480))

(assert (= (and mapNonEmpty!32480 ((_ is ValueCellFull!9741) mapValue!32480)) b!942189))

(assert (= (and b!942190 ((_ is ValueCellFull!9741) mapDefault!32480)) b!942193))

(assert (= b!942192 b!942190))

(assert (= start!80198 b!942192))

(declare-fun m!876881 () Bool)

(assert (=> mapNonEmpty!32480 m!876881))

(declare-fun m!876883 () Bool)

(assert (=> start!80198 m!876883))

(declare-fun m!876885 () Bool)

(assert (=> b!942192 m!876885))

(declare-fun m!876887 () Bool)

(assert (=> b!942192 m!876887))

(declare-fun m!876889 () Bool)

(assert (=> b!942191 m!876889))

(declare-fun m!876891 () Bool)

(assert (=> b!942195 m!876891))

(declare-fun m!876893 () Bool)

(assert (=> b!942194 m!876893))

(check-sat (not b!942191) (not b!942192) (not start!80198) (not b_next!17937) (not mapNonEmpty!32480) b_and!29349 (not b!942194) (not b!942195) tp_is_empty!20445)
(check-sat b_and!29349 (not b_next!17937))
(get-model)

(declare-fun d!114159 () Bool)

(assert (=> d!114159 (= (validMask!0 (mask!27204 thiss!1141)) (and (or (= (mask!27204 thiss!1141) #b00000000000000000000000000000111) (= (mask!27204 thiss!1141) #b00000000000000000000000000001111) (= (mask!27204 thiss!1141) #b00000000000000000000000000011111) (= (mask!27204 thiss!1141) #b00000000000000000000000000111111) (= (mask!27204 thiss!1141) #b00000000000000000000000001111111) (= (mask!27204 thiss!1141) #b00000000000000000000000011111111) (= (mask!27204 thiss!1141) #b00000000000000000000000111111111) (= (mask!27204 thiss!1141) #b00000000000000000000001111111111) (= (mask!27204 thiss!1141) #b00000000000000000000011111111111) (= (mask!27204 thiss!1141) #b00000000000000000000111111111111) (= (mask!27204 thiss!1141) #b00000000000000000001111111111111) (= (mask!27204 thiss!1141) #b00000000000000000011111111111111) (= (mask!27204 thiss!1141) #b00000000000000000111111111111111) (= (mask!27204 thiss!1141) #b00000000000000001111111111111111) (= (mask!27204 thiss!1141) #b00000000000000011111111111111111) (= (mask!27204 thiss!1141) #b00000000000000111111111111111111) (= (mask!27204 thiss!1141) #b00000000000001111111111111111111) (= (mask!27204 thiss!1141) #b00000000000011111111111111111111) (= (mask!27204 thiss!1141) #b00000000000111111111111111111111) (= (mask!27204 thiss!1141) #b00000000001111111111111111111111) (= (mask!27204 thiss!1141) #b00000000011111111111111111111111) (= (mask!27204 thiss!1141) #b00000000111111111111111111111111) (= (mask!27204 thiss!1141) #b00000001111111111111111111111111) (= (mask!27204 thiss!1141) #b00000011111111111111111111111111) (= (mask!27204 thiss!1141) #b00000111111111111111111111111111) (= (mask!27204 thiss!1141) #b00001111111111111111111111111111) (= (mask!27204 thiss!1141) #b00011111111111111111111111111111) (= (mask!27204 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27204 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942191 d!114159))

(declare-fun d!114161 () Bool)

(declare-fun res!633207 () Bool)

(declare-fun e!529764 () Bool)

(assert (=> d!114161 (=> (not res!633207) (not e!529764))))

(declare-fun simpleValid!345 (LongMapFixedSize!4632) Bool)

(assert (=> d!114161 (= res!633207 (simpleValid!345 thiss!1141))))

(assert (=> d!114161 (= (valid!1772 thiss!1141) e!529764)))

(declare-fun b!942231 () Bool)

(declare-fun res!633208 () Bool)

(assert (=> b!942231 (=> (not res!633208) (not e!529764))))

(declare-fun arrayCountValidKeys!0 (array!56852 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942231 (= res!633208 (= (arrayCountValidKeys!0 (_keys!10475 thiss!1141) #b00000000000000000000000000000000 (size!27820 (_keys!10475 thiss!1141))) (_size!2371 thiss!1141)))))

(declare-fun b!942232 () Bool)

(declare-fun res!633209 () Bool)

(assert (=> b!942232 (=> (not res!633209) (not e!529764))))

(assert (=> b!942232 (= res!633209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10475 thiss!1141) (mask!27204 thiss!1141)))))

(declare-fun b!942233 () Bool)

(declare-datatypes ((List!19210 0))(
  ( (Nil!19207) (Cons!19206 (h!20356 (_ BitVec 64)) (t!27525 List!19210)) )
))
(declare-fun arrayNoDuplicates!0 (array!56852 (_ BitVec 32) List!19210) Bool)

(assert (=> b!942233 (= e!529764 (arrayNoDuplicates!0 (_keys!10475 thiss!1141) #b00000000000000000000000000000000 Nil!19207))))

(assert (= (and d!114161 res!633207) b!942231))

(assert (= (and b!942231 res!633208) b!942232))

(assert (= (and b!942232 res!633209) b!942233))

(declare-fun m!876909 () Bool)

(assert (=> d!114161 m!876909))

(declare-fun m!876911 () Bool)

(assert (=> b!942231 m!876911))

(assert (=> b!942232 m!876893))

(declare-fun m!876913 () Bool)

(assert (=> b!942233 m!876913))

(assert (=> start!80198 d!114161))

(declare-fun d!114163 () Bool)

(assert (=> d!114163 (= (array_inv!21254 (_keys!10475 thiss!1141)) (bvsge (size!27820 (_keys!10475 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942192 d!114163))

(declare-fun d!114165 () Bool)

(assert (=> d!114165 (= (array_inv!21255 (_values!5630 thiss!1141)) (bvsge (size!27819 (_values!5630 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942192 d!114165))

(declare-fun b!942246 () Bool)

(declare-fun e!529771 () SeekEntryResult!9029)

(assert (=> b!942246 (= e!529771 Undefined!9029)))

(declare-fun b!942247 () Bool)

(declare-fun e!529772 () SeekEntryResult!9029)

(assert (=> b!942247 (= e!529771 e!529772)))

(declare-fun lt!425125 () (_ BitVec 64))

(declare-fun lt!425122 () SeekEntryResult!9029)

(assert (=> b!942247 (= lt!425125 (select (arr!27355 (_keys!10475 thiss!1141)) (index!38489 lt!425122)))))

(declare-fun c!98209 () Bool)

(assert (=> b!942247 (= c!98209 (= lt!425125 key!756))))

(declare-fun b!942248 () Bool)

(declare-fun e!529773 () SeekEntryResult!9029)

(assert (=> b!942248 (= e!529773 (MissingZero!9029 (index!38489 lt!425122)))))

(declare-fun d!114167 () Bool)

(declare-fun lt!425123 () SeekEntryResult!9029)

(assert (=> d!114167 (and (or ((_ is MissingVacant!9029) lt!425123) (not ((_ is Found!9029) lt!425123)) (and (bvsge (index!38488 lt!425123) #b00000000000000000000000000000000) (bvslt (index!38488 lt!425123) (size!27820 (_keys!10475 thiss!1141))))) (not ((_ is MissingVacant!9029) lt!425123)) (or (not ((_ is Found!9029) lt!425123)) (= (select (arr!27355 (_keys!10475 thiss!1141)) (index!38488 lt!425123)) key!756)))))

(assert (=> d!114167 (= lt!425123 e!529771)))

(declare-fun c!98207 () Bool)

(assert (=> d!114167 (= c!98207 (and ((_ is Intermediate!9029) lt!425122) (undefined!9841 lt!425122)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56852 (_ BitVec 32)) SeekEntryResult!9029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114167 (= lt!425122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27204 thiss!1141)) key!756 (_keys!10475 thiss!1141) (mask!27204 thiss!1141)))))

(assert (=> d!114167 (validMask!0 (mask!27204 thiss!1141))))

(assert (=> d!114167 (= (seekEntry!0 key!756 (_keys!10475 thiss!1141) (mask!27204 thiss!1141)) lt!425123)))

(declare-fun b!942249 () Bool)

(declare-fun lt!425124 () SeekEntryResult!9029)

(assert (=> b!942249 (= e!529773 (ite ((_ is MissingVacant!9029) lt!425124) (MissingZero!9029 (index!38490 lt!425124)) lt!425124))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56852 (_ BitVec 32)) SeekEntryResult!9029)

(assert (=> b!942249 (= lt!425124 (seekKeyOrZeroReturnVacant!0 (x!80886 lt!425122) (index!38489 lt!425122) (index!38489 lt!425122) key!756 (_keys!10475 thiss!1141) (mask!27204 thiss!1141)))))

(declare-fun b!942250 () Bool)

(assert (=> b!942250 (= e!529772 (Found!9029 (index!38489 lt!425122)))))

(declare-fun b!942251 () Bool)

(declare-fun c!98208 () Bool)

(assert (=> b!942251 (= c!98208 (= lt!425125 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942251 (= e!529772 e!529773)))

(assert (= (and d!114167 c!98207) b!942246))

(assert (= (and d!114167 (not c!98207)) b!942247))

(assert (= (and b!942247 c!98209) b!942250))

(assert (= (and b!942247 (not c!98209)) b!942251))

(assert (= (and b!942251 c!98208) b!942248))

(assert (= (and b!942251 (not c!98208)) b!942249))

(declare-fun m!876915 () Bool)

(assert (=> b!942247 m!876915))

(declare-fun m!876917 () Bool)

(assert (=> d!114167 m!876917))

(declare-fun m!876919 () Bool)

(assert (=> d!114167 m!876919))

(assert (=> d!114167 m!876919))

(declare-fun m!876921 () Bool)

(assert (=> d!114167 m!876921))

(assert (=> d!114167 m!876889))

(declare-fun m!876923 () Bool)

(assert (=> b!942249 m!876923))

(assert (=> b!942195 d!114167))

(declare-fun d!114169 () Bool)

(declare-fun res!633214 () Bool)

(declare-fun e!529782 () Bool)

(assert (=> d!114169 (=> res!633214 e!529782)))

(assert (=> d!114169 (= res!633214 (bvsge #b00000000000000000000000000000000 (size!27820 (_keys!10475 thiss!1141))))))

(assert (=> d!114169 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10475 thiss!1141) (mask!27204 thiss!1141)) e!529782)))

(declare-fun b!942260 () Bool)

(declare-fun e!529780 () Bool)

(declare-fun call!40953 () Bool)

(assert (=> b!942260 (= e!529780 call!40953)))

(declare-fun bm!40950 () Bool)

(assert (=> bm!40950 (= call!40953 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10475 thiss!1141) (mask!27204 thiss!1141)))))

(declare-fun b!942261 () Bool)

(assert (=> b!942261 (= e!529782 e!529780)))

(declare-fun c!98212 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942261 (= c!98212 (validKeyInArray!0 (select (arr!27355 (_keys!10475 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942262 () Bool)

(declare-fun e!529781 () Bool)

(assert (=> b!942262 (= e!529780 e!529781)))

(declare-fun lt!425134 () (_ BitVec 64))

(assert (=> b!942262 (= lt!425134 (select (arr!27355 (_keys!10475 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31808 0))(
  ( (Unit!31809) )
))
(declare-fun lt!425132 () Unit!31808)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56852 (_ BitVec 64) (_ BitVec 32)) Unit!31808)

(assert (=> b!942262 (= lt!425132 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10475 thiss!1141) lt!425134 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942262 (arrayContainsKey!0 (_keys!10475 thiss!1141) lt!425134 #b00000000000000000000000000000000)))

(declare-fun lt!425133 () Unit!31808)

(assert (=> b!942262 (= lt!425133 lt!425132)))

(declare-fun res!633215 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56852 (_ BitVec 32)) SeekEntryResult!9029)

(assert (=> b!942262 (= res!633215 (= (seekEntryOrOpen!0 (select (arr!27355 (_keys!10475 thiss!1141)) #b00000000000000000000000000000000) (_keys!10475 thiss!1141) (mask!27204 thiss!1141)) (Found!9029 #b00000000000000000000000000000000)))))

(assert (=> b!942262 (=> (not res!633215) (not e!529781))))

(declare-fun b!942263 () Bool)

(assert (=> b!942263 (= e!529781 call!40953)))

(assert (= (and d!114169 (not res!633214)) b!942261))

(assert (= (and b!942261 c!98212) b!942262))

(assert (= (and b!942261 (not c!98212)) b!942260))

(assert (= (and b!942262 res!633215) b!942263))

(assert (= (or b!942263 b!942260) bm!40950))

(declare-fun m!876925 () Bool)

(assert (=> bm!40950 m!876925))

(declare-fun m!876927 () Bool)

(assert (=> b!942261 m!876927))

(assert (=> b!942261 m!876927))

(declare-fun m!876929 () Bool)

(assert (=> b!942261 m!876929))

(assert (=> b!942262 m!876927))

(declare-fun m!876931 () Bool)

(assert (=> b!942262 m!876931))

(declare-fun m!876933 () Bool)

(assert (=> b!942262 m!876933))

(assert (=> b!942262 m!876927))

(declare-fun m!876935 () Bool)

(assert (=> b!942262 m!876935))

(assert (=> b!942194 d!114169))

(declare-fun b!942271 () Bool)

(declare-fun e!529788 () Bool)

(assert (=> b!942271 (= e!529788 tp_is_empty!20445)))

(declare-fun mapNonEmpty!32486 () Bool)

(declare-fun mapRes!32486 () Bool)

(declare-fun tp!62317 () Bool)

(declare-fun e!529787 () Bool)

(assert (=> mapNonEmpty!32486 (= mapRes!32486 (and tp!62317 e!529787))))

(declare-fun mapRest!32486 () (Array (_ BitVec 32) ValueCell!9741))

(declare-fun mapValue!32486 () ValueCell!9741)

(declare-fun mapKey!32486 () (_ BitVec 32))

(assert (=> mapNonEmpty!32486 (= mapRest!32480 (store mapRest!32486 mapKey!32486 mapValue!32486))))

(declare-fun b!942270 () Bool)

(assert (=> b!942270 (= e!529787 tp_is_empty!20445)))

(declare-fun mapIsEmpty!32486 () Bool)

(assert (=> mapIsEmpty!32486 mapRes!32486))

(declare-fun condMapEmpty!32486 () Bool)

(declare-fun mapDefault!32486 () ValueCell!9741)

(assert (=> mapNonEmpty!32480 (= condMapEmpty!32486 (= mapRest!32480 ((as const (Array (_ BitVec 32) ValueCell!9741)) mapDefault!32486)))))

(assert (=> mapNonEmpty!32480 (= tp!62307 (and e!529788 mapRes!32486))))

(assert (= (and mapNonEmpty!32480 condMapEmpty!32486) mapIsEmpty!32486))

(assert (= (and mapNonEmpty!32480 (not condMapEmpty!32486)) mapNonEmpty!32486))

(assert (= (and mapNonEmpty!32486 ((_ is ValueCellFull!9741) mapValue!32486)) b!942270))

(assert (= (and mapNonEmpty!32480 ((_ is ValueCellFull!9741) mapDefault!32486)) b!942271))

(declare-fun m!876937 () Bool)

(assert (=> mapNonEmpty!32486 m!876937))

(check-sat (not b!942262) (not b!942261) (not b!942233) (not b!942249) (not d!114161) (not b_next!17937) (not mapNonEmpty!32486) (not bm!40950) (not b!942232) b_and!29349 tp_is_empty!20445 (not b!942231) (not d!114167))
(check-sat b_and!29349 (not b_next!17937))
