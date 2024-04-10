; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80236 () Bool)

(assert start!80236)

(declare-fun b!942487 () Bool)

(declare-fun b_free!17949 () Bool)

(declare-fun b_next!17949 () Bool)

(assert (=> b!942487 (= b_free!17949 (not b_next!17949))))

(declare-fun tp!62350 () Bool)

(declare-fun b_and!29361 () Bool)

(assert (=> b!942487 (= tp!62350 b_and!29361)))

(declare-fun b!942479 () Bool)

(declare-fun res!633335 () Bool)

(declare-fun e!529912 () Bool)

(assert (=> b!942479 (=> (not res!633335) (not e!529912))))

(declare-datatypes ((V!32241 0))(
  ( (V!32242 (val!10279 Int)) )
))
(declare-datatypes ((ValueCell!9747 0))(
  ( (ValueCellFull!9747 (v!12810 V!32241)) (EmptyCell!9747) )
))
(declare-datatypes ((array!56878 0))(
  ( (array!56879 (arr!27366 (Array (_ BitVec 32) ValueCell!9747)) (size!27831 (_ BitVec 32))) )
))
(declare-datatypes ((array!56880 0))(
  ( (array!56881 (arr!27367 (Array (_ BitVec 32) (_ BitVec 64))) (size!27832 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4644 0))(
  ( (LongMapFixedSize!4645 (defaultEntry!5613 Int) (mask!27220 (_ BitVec 32)) (extraKeys!5345 (_ BitVec 32)) (zeroValue!5449 V!32241) (minValue!5449 V!32241) (_size!2377 (_ BitVec 32)) (_keys!10485 array!56880) (_values!5636 array!56878) (_vacant!2377 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4644)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56880 (_ BitVec 32)) Bool)

(assert (=> b!942479 (= res!633335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10485 thiss!1141) (mask!27220 thiss!1141)))))

(declare-fun b!942480 () Bool)

(declare-fun res!633334 () Bool)

(assert (=> b!942480 (=> (not res!633334) (not e!529912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942480 (= res!633334 (validMask!0 (mask!27220 thiss!1141)))))

(declare-fun b!942481 () Bool)

(declare-fun res!633333 () Bool)

(assert (=> b!942481 (=> (not res!633333) (not e!529912))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942481 (= res!633333 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!633332 () Bool)

(assert (=> start!80236 (=> (not res!633332) (not e!529912))))

(declare-fun valid!1777 (LongMapFixedSize!4644) Bool)

(assert (=> start!80236 (= res!633332 (valid!1777 thiss!1141))))

(assert (=> start!80236 e!529912))

(declare-fun e!529917 () Bool)

(assert (=> start!80236 e!529917))

(assert (=> start!80236 true))

(declare-fun mapNonEmpty!32504 () Bool)

(declare-fun mapRes!32504 () Bool)

(declare-fun tp!62349 () Bool)

(declare-fun e!529916 () Bool)

(assert (=> mapNonEmpty!32504 (= mapRes!32504 (and tp!62349 e!529916))))

(declare-fun mapValue!32504 () ValueCell!9747)

(declare-fun mapRest!32504 () (Array (_ BitVec 32) ValueCell!9747))

(declare-fun mapKey!32504 () (_ BitVec 32))

(assert (=> mapNonEmpty!32504 (= (arr!27366 (_values!5636 thiss!1141)) (store mapRest!32504 mapKey!32504 mapValue!32504))))

(declare-fun b!942482 () Bool)

(declare-fun res!633329 () Bool)

(assert (=> b!942482 (=> (not res!633329) (not e!529912))))

(assert (=> b!942482 (= res!633329 (and (= (size!27831 (_values!5636 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27220 thiss!1141))) (= (size!27832 (_keys!10485 thiss!1141)) (size!27831 (_values!5636 thiss!1141))) (bvsge (mask!27220 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5345 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5345 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942483 () Bool)

(declare-fun tp_is_empty!20457 () Bool)

(assert (=> b!942483 (= e!529916 tp_is_empty!20457)))

(declare-fun b!942484 () Bool)

(declare-fun e!529915 () Bool)

(declare-fun e!529914 () Bool)

(assert (=> b!942484 (= e!529915 (and e!529914 mapRes!32504))))

(declare-fun condMapEmpty!32504 () Bool)

(declare-fun mapDefault!32504 () ValueCell!9747)

(assert (=> b!942484 (= condMapEmpty!32504 (= (arr!27366 (_values!5636 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9747)) mapDefault!32504)))))

(declare-fun b!942485 () Bool)

(declare-fun res!633330 () Bool)

(assert (=> b!942485 (=> (not res!633330) (not e!529912))))

(declare-datatypes ((List!19215 0))(
  ( (Nil!19212) (Cons!19211 (h!20361 (_ BitVec 64)) (t!27530 List!19215)) )
))
(declare-fun arrayNoDuplicates!0 (array!56880 (_ BitVec 32) List!19215) Bool)

(assert (=> b!942485 (= res!633330 (arrayNoDuplicates!0 (_keys!10485 thiss!1141) #b00000000000000000000000000000000 Nil!19212))))

(declare-fun b!942486 () Bool)

(assert (=> b!942486 (= e!529914 tp_is_empty!20457)))

(declare-fun array_inv!21262 (array!56880) Bool)

(declare-fun array_inv!21263 (array!56878) Bool)

(assert (=> b!942487 (= e!529917 (and tp!62350 tp_is_empty!20457 (array_inv!21262 (_keys!10485 thiss!1141)) (array_inv!21263 (_values!5636 thiss!1141)) e!529915))))

(declare-fun mapIsEmpty!32504 () Bool)

(assert (=> mapIsEmpty!32504 mapRes!32504))

(declare-fun b!942488 () Bool)

(assert (=> b!942488 (= e!529912 (bvsgt #b00000000000000000000000000000000 (size!27832 (_keys!10485 thiss!1141))))))

(declare-fun b!942489 () Bool)

(declare-fun res!633331 () Bool)

(assert (=> b!942489 (=> (not res!633331) (not e!529912))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9032 0))(
  ( (MissingZero!9032 (index!38499 (_ BitVec 32))) (Found!9032 (index!38500 (_ BitVec 32))) (Intermediate!9032 (undefined!9844 Bool) (index!38501 (_ BitVec 32)) (x!80921 (_ BitVec 32))) (Undefined!9032) (MissingVacant!9032 (index!38502 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56880 (_ BitVec 32)) SeekEntryResult!9032)

(assert (=> b!942489 (= res!633331 (not ((_ is Found!9032) (seekEntry!0 key!756 (_keys!10485 thiss!1141) (mask!27220 thiss!1141)))))))

(assert (= (and start!80236 res!633332) b!942481))

(assert (= (and b!942481 res!633333) b!942489))

(assert (= (and b!942489 res!633331) b!942480))

(assert (= (and b!942480 res!633334) b!942482))

(assert (= (and b!942482 res!633329) b!942479))

(assert (= (and b!942479 res!633335) b!942485))

(assert (= (and b!942485 res!633330) b!942488))

(assert (= (and b!942484 condMapEmpty!32504) mapIsEmpty!32504))

(assert (= (and b!942484 (not condMapEmpty!32504)) mapNonEmpty!32504))

(assert (= (and mapNonEmpty!32504 ((_ is ValueCellFull!9747) mapValue!32504)) b!942483))

(assert (= (and b!942484 ((_ is ValueCellFull!9747) mapDefault!32504)) b!942486))

(assert (= b!942487 b!942484))

(assert (= start!80236 b!942487))

(declare-fun m!877035 () Bool)

(assert (=> b!942485 m!877035))

(declare-fun m!877037 () Bool)

(assert (=> b!942487 m!877037))

(declare-fun m!877039 () Bool)

(assert (=> b!942487 m!877039))

(declare-fun m!877041 () Bool)

(assert (=> mapNonEmpty!32504 m!877041))

(declare-fun m!877043 () Bool)

(assert (=> start!80236 m!877043))

(declare-fun m!877045 () Bool)

(assert (=> b!942489 m!877045))

(declare-fun m!877047 () Bool)

(assert (=> b!942480 m!877047))

(declare-fun m!877049 () Bool)

(assert (=> b!942479 m!877049))

(check-sat (not b!942489) (not b_next!17949) (not b!942487) (not b!942479) (not mapNonEmpty!32504) tp_is_empty!20457 b_and!29361 (not start!80236) (not b!942480) (not b!942485))
(check-sat b_and!29361 (not b_next!17949))
(get-model)

(declare-fun d!114189 () Bool)

(declare-fun res!633363 () Bool)

(declare-fun e!529938 () Bool)

(assert (=> d!114189 (=> (not res!633363) (not e!529938))))

(declare-fun simpleValid!347 (LongMapFixedSize!4644) Bool)

(assert (=> d!114189 (= res!633363 (simpleValid!347 thiss!1141))))

(assert (=> d!114189 (= (valid!1777 thiss!1141) e!529938)))

(declare-fun b!942529 () Bool)

(declare-fun res!633364 () Bool)

(assert (=> b!942529 (=> (not res!633364) (not e!529938))))

(declare-fun arrayCountValidKeys!0 (array!56880 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942529 (= res!633364 (= (arrayCountValidKeys!0 (_keys!10485 thiss!1141) #b00000000000000000000000000000000 (size!27832 (_keys!10485 thiss!1141))) (_size!2377 thiss!1141)))))

(declare-fun b!942530 () Bool)

(declare-fun res!633365 () Bool)

(assert (=> b!942530 (=> (not res!633365) (not e!529938))))

(assert (=> b!942530 (= res!633365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10485 thiss!1141) (mask!27220 thiss!1141)))))

(declare-fun b!942531 () Bool)

(assert (=> b!942531 (= e!529938 (arrayNoDuplicates!0 (_keys!10485 thiss!1141) #b00000000000000000000000000000000 Nil!19212))))

(assert (= (and d!114189 res!633363) b!942529))

(assert (= (and b!942529 res!633364) b!942530))

(assert (= (and b!942530 res!633365) b!942531))

(declare-fun m!877067 () Bool)

(assert (=> d!114189 m!877067))

(declare-fun m!877069 () Bool)

(assert (=> b!942529 m!877069))

(assert (=> b!942530 m!877049))

(assert (=> b!942531 m!877035))

(assert (=> start!80236 d!114189))

(declare-fun d!114191 () Bool)

(assert (=> d!114191 (= (validMask!0 (mask!27220 thiss!1141)) (and (or (= (mask!27220 thiss!1141) #b00000000000000000000000000000111) (= (mask!27220 thiss!1141) #b00000000000000000000000000001111) (= (mask!27220 thiss!1141) #b00000000000000000000000000011111) (= (mask!27220 thiss!1141) #b00000000000000000000000000111111) (= (mask!27220 thiss!1141) #b00000000000000000000000001111111) (= (mask!27220 thiss!1141) #b00000000000000000000000011111111) (= (mask!27220 thiss!1141) #b00000000000000000000000111111111) (= (mask!27220 thiss!1141) #b00000000000000000000001111111111) (= (mask!27220 thiss!1141) #b00000000000000000000011111111111) (= (mask!27220 thiss!1141) #b00000000000000000000111111111111) (= (mask!27220 thiss!1141) #b00000000000000000001111111111111) (= (mask!27220 thiss!1141) #b00000000000000000011111111111111) (= (mask!27220 thiss!1141) #b00000000000000000111111111111111) (= (mask!27220 thiss!1141) #b00000000000000001111111111111111) (= (mask!27220 thiss!1141) #b00000000000000011111111111111111) (= (mask!27220 thiss!1141) #b00000000000000111111111111111111) (= (mask!27220 thiss!1141) #b00000000000001111111111111111111) (= (mask!27220 thiss!1141) #b00000000000011111111111111111111) (= (mask!27220 thiss!1141) #b00000000000111111111111111111111) (= (mask!27220 thiss!1141) #b00000000001111111111111111111111) (= (mask!27220 thiss!1141) #b00000000011111111111111111111111) (= (mask!27220 thiss!1141) #b00000000111111111111111111111111) (= (mask!27220 thiss!1141) #b00000001111111111111111111111111) (= (mask!27220 thiss!1141) #b00000011111111111111111111111111) (= (mask!27220 thiss!1141) #b00000111111111111111111111111111) (= (mask!27220 thiss!1141) #b00001111111111111111111111111111) (= (mask!27220 thiss!1141) #b00011111111111111111111111111111) (= (mask!27220 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27220 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942480 d!114191))

(declare-fun bm!40959 () Bool)

(declare-fun call!40962 () Bool)

(assert (=> bm!40959 (= call!40962 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10485 thiss!1141) (mask!27220 thiss!1141)))))

(declare-fun b!942540 () Bool)

(declare-fun e!529945 () Bool)

(assert (=> b!942540 (= e!529945 call!40962)))

(declare-fun b!942542 () Bool)

(declare-fun e!529947 () Bool)

(assert (=> b!942542 (= e!529947 e!529945)))

(declare-fun lt!425163 () (_ BitVec 64))

(assert (=> b!942542 (= lt!425163 (select (arr!27367 (_keys!10485 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31812 0))(
  ( (Unit!31813) )
))
(declare-fun lt!425162 () Unit!31812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56880 (_ BitVec 64) (_ BitVec 32)) Unit!31812)

(assert (=> b!942542 (= lt!425162 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10485 thiss!1141) lt!425163 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942542 (arrayContainsKey!0 (_keys!10485 thiss!1141) lt!425163 #b00000000000000000000000000000000)))

(declare-fun lt!425164 () Unit!31812)

(assert (=> b!942542 (= lt!425164 lt!425162)))

(declare-fun res!633370 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56880 (_ BitVec 32)) SeekEntryResult!9032)

(assert (=> b!942542 (= res!633370 (= (seekEntryOrOpen!0 (select (arr!27367 (_keys!10485 thiss!1141)) #b00000000000000000000000000000000) (_keys!10485 thiss!1141) (mask!27220 thiss!1141)) (Found!9032 #b00000000000000000000000000000000)))))

(assert (=> b!942542 (=> (not res!633370) (not e!529945))))

(declare-fun b!942543 () Bool)

(assert (=> b!942543 (= e!529947 call!40962)))

(declare-fun d!114193 () Bool)

(declare-fun res!633371 () Bool)

(declare-fun e!529946 () Bool)

(assert (=> d!114193 (=> res!633371 e!529946)))

(assert (=> d!114193 (= res!633371 (bvsge #b00000000000000000000000000000000 (size!27832 (_keys!10485 thiss!1141))))))

(assert (=> d!114193 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10485 thiss!1141) (mask!27220 thiss!1141)) e!529946)))

(declare-fun b!942541 () Bool)

(assert (=> b!942541 (= e!529946 e!529947)))

(declare-fun c!98230 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942541 (= c!98230 (validKeyInArray!0 (select (arr!27367 (_keys!10485 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114193 (not res!633371)) b!942541))

(assert (= (and b!942541 c!98230) b!942542))

(assert (= (and b!942541 (not c!98230)) b!942543))

(assert (= (and b!942542 res!633370) b!942540))

(assert (= (or b!942540 b!942543) bm!40959))

(declare-fun m!877071 () Bool)

(assert (=> bm!40959 m!877071))

(declare-fun m!877073 () Bool)

(assert (=> b!942542 m!877073))

(declare-fun m!877075 () Bool)

(assert (=> b!942542 m!877075))

(declare-fun m!877077 () Bool)

(assert (=> b!942542 m!877077))

(assert (=> b!942542 m!877073))

(declare-fun m!877079 () Bool)

(assert (=> b!942542 m!877079))

(assert (=> b!942541 m!877073))

(assert (=> b!942541 m!877073))

(declare-fun m!877081 () Bool)

(assert (=> b!942541 m!877081))

(assert (=> b!942479 d!114193))

(declare-fun b!942556 () Bool)

(declare-fun e!529956 () SeekEntryResult!9032)

(assert (=> b!942556 (= e!529956 Undefined!9032)))

(declare-fun d!114195 () Bool)

(declare-fun lt!425175 () SeekEntryResult!9032)

(assert (=> d!114195 (and (or ((_ is MissingVacant!9032) lt!425175) (not ((_ is Found!9032) lt!425175)) (and (bvsge (index!38500 lt!425175) #b00000000000000000000000000000000) (bvslt (index!38500 lt!425175) (size!27832 (_keys!10485 thiss!1141))))) (not ((_ is MissingVacant!9032) lt!425175)) (or (not ((_ is Found!9032) lt!425175)) (= (select (arr!27367 (_keys!10485 thiss!1141)) (index!38500 lt!425175)) key!756)))))

(assert (=> d!114195 (= lt!425175 e!529956)))

(declare-fun c!98237 () Bool)

(declare-fun lt!425176 () SeekEntryResult!9032)

(assert (=> d!114195 (= c!98237 (and ((_ is Intermediate!9032) lt!425176) (undefined!9844 lt!425176)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56880 (_ BitVec 32)) SeekEntryResult!9032)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114195 (= lt!425176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27220 thiss!1141)) key!756 (_keys!10485 thiss!1141) (mask!27220 thiss!1141)))))

(assert (=> d!114195 (validMask!0 (mask!27220 thiss!1141))))

(assert (=> d!114195 (= (seekEntry!0 key!756 (_keys!10485 thiss!1141) (mask!27220 thiss!1141)) lt!425175)))

(declare-fun b!942557 () Bool)

(declare-fun e!529954 () SeekEntryResult!9032)

(assert (=> b!942557 (= e!529956 e!529954)))

(declare-fun lt!425173 () (_ BitVec 64))

(assert (=> b!942557 (= lt!425173 (select (arr!27367 (_keys!10485 thiss!1141)) (index!38501 lt!425176)))))

(declare-fun c!98239 () Bool)

(assert (=> b!942557 (= c!98239 (= lt!425173 key!756))))

(declare-fun b!942558 () Bool)

(declare-fun c!98238 () Bool)

(assert (=> b!942558 (= c!98238 (= lt!425173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529955 () SeekEntryResult!9032)

(assert (=> b!942558 (= e!529954 e!529955)))

(declare-fun b!942559 () Bool)

(assert (=> b!942559 (= e!529955 (MissingZero!9032 (index!38501 lt!425176)))))

(declare-fun b!942560 () Bool)

(assert (=> b!942560 (= e!529954 (Found!9032 (index!38501 lt!425176)))))

(declare-fun b!942561 () Bool)

(declare-fun lt!425174 () SeekEntryResult!9032)

(assert (=> b!942561 (= e!529955 (ite ((_ is MissingVacant!9032) lt!425174) (MissingZero!9032 (index!38502 lt!425174)) lt!425174))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56880 (_ BitVec 32)) SeekEntryResult!9032)

(assert (=> b!942561 (= lt!425174 (seekKeyOrZeroReturnVacant!0 (x!80921 lt!425176) (index!38501 lt!425176) (index!38501 lt!425176) key!756 (_keys!10485 thiss!1141) (mask!27220 thiss!1141)))))

(assert (= (and d!114195 c!98237) b!942556))

(assert (= (and d!114195 (not c!98237)) b!942557))

(assert (= (and b!942557 c!98239) b!942560))

(assert (= (and b!942557 (not c!98239)) b!942558))

(assert (= (and b!942558 c!98238) b!942559))

(assert (= (and b!942558 (not c!98238)) b!942561))

(declare-fun m!877083 () Bool)

(assert (=> d!114195 m!877083))

(declare-fun m!877085 () Bool)

(assert (=> d!114195 m!877085))

(assert (=> d!114195 m!877085))

(declare-fun m!877087 () Bool)

(assert (=> d!114195 m!877087))

(assert (=> d!114195 m!877047))

(declare-fun m!877089 () Bool)

(assert (=> b!942557 m!877089))

(declare-fun m!877091 () Bool)

(assert (=> b!942561 m!877091))

(assert (=> b!942489 d!114195))

(declare-fun d!114197 () Bool)

(declare-fun res!633378 () Bool)

(declare-fun e!529967 () Bool)

(assert (=> d!114197 (=> res!633378 e!529967)))

(assert (=> d!114197 (= res!633378 (bvsge #b00000000000000000000000000000000 (size!27832 (_keys!10485 thiss!1141))))))

(assert (=> d!114197 (= (arrayNoDuplicates!0 (_keys!10485 thiss!1141) #b00000000000000000000000000000000 Nil!19212) e!529967)))

(declare-fun bm!40962 () Bool)

(declare-fun call!40965 () Bool)

(declare-fun c!98242 () Bool)

(assert (=> bm!40962 (= call!40965 (arrayNoDuplicates!0 (_keys!10485 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98242 (Cons!19211 (select (arr!27367 (_keys!10485 thiss!1141)) #b00000000000000000000000000000000) Nil!19212) Nil!19212)))))

(declare-fun b!942572 () Bool)

(declare-fun e!529966 () Bool)

(declare-fun contains!5136 (List!19215 (_ BitVec 64)) Bool)

(assert (=> b!942572 (= e!529966 (contains!5136 Nil!19212 (select (arr!27367 (_keys!10485 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942573 () Bool)

(declare-fun e!529965 () Bool)

(declare-fun e!529968 () Bool)

(assert (=> b!942573 (= e!529965 e!529968)))

(assert (=> b!942573 (= c!98242 (validKeyInArray!0 (select (arr!27367 (_keys!10485 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942574 () Bool)

(assert (=> b!942574 (= e!529968 call!40965)))

(declare-fun b!942575 () Bool)

(assert (=> b!942575 (= e!529968 call!40965)))

(declare-fun b!942576 () Bool)

(assert (=> b!942576 (= e!529967 e!529965)))

(declare-fun res!633379 () Bool)

(assert (=> b!942576 (=> (not res!633379) (not e!529965))))

(assert (=> b!942576 (= res!633379 (not e!529966))))

(declare-fun res!633380 () Bool)

(assert (=> b!942576 (=> (not res!633380) (not e!529966))))

(assert (=> b!942576 (= res!633380 (validKeyInArray!0 (select (arr!27367 (_keys!10485 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114197 (not res!633378)) b!942576))

(assert (= (and b!942576 res!633380) b!942572))

(assert (= (and b!942576 res!633379) b!942573))

(assert (= (and b!942573 c!98242) b!942574))

(assert (= (and b!942573 (not c!98242)) b!942575))

(assert (= (or b!942574 b!942575) bm!40962))

(assert (=> bm!40962 m!877073))

(declare-fun m!877093 () Bool)

(assert (=> bm!40962 m!877093))

(assert (=> b!942572 m!877073))

(assert (=> b!942572 m!877073))

(declare-fun m!877095 () Bool)

(assert (=> b!942572 m!877095))

(assert (=> b!942573 m!877073))

(assert (=> b!942573 m!877073))

(assert (=> b!942573 m!877081))

(assert (=> b!942576 m!877073))

(assert (=> b!942576 m!877073))

(assert (=> b!942576 m!877081))

(assert (=> b!942485 d!114197))

(declare-fun d!114199 () Bool)

(assert (=> d!114199 (= (array_inv!21262 (_keys!10485 thiss!1141)) (bvsge (size!27832 (_keys!10485 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942487 d!114199))

(declare-fun d!114201 () Bool)

(assert (=> d!114201 (= (array_inv!21263 (_values!5636 thiss!1141)) (bvsge (size!27831 (_values!5636 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942487 d!114201))

(declare-fun b!942584 () Bool)

(declare-fun e!529974 () Bool)

(assert (=> b!942584 (= e!529974 tp_is_empty!20457)))

(declare-fun mapNonEmpty!32510 () Bool)

(declare-fun mapRes!32510 () Bool)

(declare-fun tp!62359 () Bool)

(declare-fun e!529973 () Bool)

(assert (=> mapNonEmpty!32510 (= mapRes!32510 (and tp!62359 e!529973))))

(declare-fun mapValue!32510 () ValueCell!9747)

(declare-fun mapKey!32510 () (_ BitVec 32))

(declare-fun mapRest!32510 () (Array (_ BitVec 32) ValueCell!9747))

(assert (=> mapNonEmpty!32510 (= mapRest!32504 (store mapRest!32510 mapKey!32510 mapValue!32510))))

(declare-fun b!942583 () Bool)

(assert (=> b!942583 (= e!529973 tp_is_empty!20457)))

(declare-fun condMapEmpty!32510 () Bool)

(declare-fun mapDefault!32510 () ValueCell!9747)

(assert (=> mapNonEmpty!32504 (= condMapEmpty!32510 (= mapRest!32504 ((as const (Array (_ BitVec 32) ValueCell!9747)) mapDefault!32510)))))

(assert (=> mapNonEmpty!32504 (= tp!62349 (and e!529974 mapRes!32510))))

(declare-fun mapIsEmpty!32510 () Bool)

(assert (=> mapIsEmpty!32510 mapRes!32510))

(assert (= (and mapNonEmpty!32504 condMapEmpty!32510) mapIsEmpty!32510))

(assert (= (and mapNonEmpty!32504 (not condMapEmpty!32510)) mapNonEmpty!32510))

(assert (= (and mapNonEmpty!32510 ((_ is ValueCellFull!9747) mapValue!32510)) b!942583))

(assert (= (and mapNonEmpty!32504 ((_ is ValueCellFull!9747) mapDefault!32510)) b!942584))

(declare-fun m!877097 () Bool)

(assert (=> mapNonEmpty!32510 m!877097))

(check-sat (not b!942529) (not mapNonEmpty!32510) (not bm!40962) (not b_next!17949) (not b!942542) (not b!942530) tp_is_empty!20457 (not b!942561) b_and!29361 (not bm!40959) (not d!114195) (not b!942572) (not b!942573) (not b!942576) (not d!114189) (not b!942541) (not b!942531))
(check-sat b_and!29361 (not b_next!17949))
