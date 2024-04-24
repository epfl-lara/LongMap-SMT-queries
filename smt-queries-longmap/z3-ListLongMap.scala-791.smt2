; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18814 () Bool)

(assert start!18814)

(declare-fun b!185961 () Bool)

(declare-fun b_free!4585 () Bool)

(declare-fun b_next!4585 () Bool)

(assert (=> b!185961 (= b_free!4585 (not b_next!4585))))

(declare-fun tp!16553 () Bool)

(declare-fun b_and!11201 () Bool)

(assert (=> b!185961 (= tp!16553 b_and!11201)))

(declare-datatypes ((SeekEntryResult!628 0))(
  ( (MissingZero!628 (index!4682 (_ BitVec 32))) (Found!628 (index!4683 (_ BitVec 32))) (Intermediate!628 (undefined!1440 Bool) (index!4684 (_ BitVec 32)) (x!20174 (_ BitVec 32))) (Undefined!628) (MissingVacant!628 (index!4685 (_ BitVec 32))) )
))
(declare-fun lt!91957 () SeekEntryResult!628)

(declare-fun e!122364 () Bool)

(declare-datatypes ((V!5457 0))(
  ( (V!5458 (val!2223 Int)) )
))
(declare-datatypes ((ValueCell!1835 0))(
  ( (ValueCellFull!1835 (v!4135 V!5457)) (EmptyCell!1835) )
))
(declare-datatypes ((array!7909 0))(
  ( (array!7910 (arr!3734 (Array (_ BitVec 32) (_ BitVec 64))) (size!4050 (_ BitVec 32))) )
))
(declare-datatypes ((array!7911 0))(
  ( (array!7912 (arr!3735 (Array (_ BitVec 32) ValueCell!1835)) (size!4051 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2578 0))(
  ( (LongMapFixedSize!2579 (defaultEntry!3791 Int) (mask!8908 (_ BitVec 32)) (extraKeys!3528 (_ BitVec 32)) (zeroValue!3632 V!5457) (minValue!3632 V!5457) (_size!1338 (_ BitVec 32)) (_keys!5732 array!7909) (_values!3774 array!7911) (_vacant!1338 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2578)

(declare-fun b!185954 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!185954 (= e!122364 (= (select (arr!3734 (_keys!5732 thiss!1248)) (index!4683 lt!91957)) key!828))))

(declare-fun res!87981 () Bool)

(declare-fun e!122363 () Bool)

(assert (=> start!18814 (=> (not res!87981) (not e!122363))))

(declare-fun valid!1086 (LongMapFixedSize!2578) Bool)

(assert (=> start!18814 (= res!87981 (valid!1086 thiss!1248))))

(assert (=> start!18814 e!122363))

(declare-fun e!122365 () Bool)

(assert (=> start!18814 e!122365))

(assert (=> start!18814 true))

(declare-fun b!185955 () Bool)

(declare-fun e!122368 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185955 (= e!122368 (not (validMask!0 (mask!8908 thiss!1248))))))

(declare-datatypes ((Unit!5602 0))(
  ( (Unit!5603) )
))
(declare-fun lt!91958 () Unit!5602)

(declare-fun e!122370 () Unit!5602)

(assert (=> b!185955 (= lt!91958 e!122370)))

(declare-fun c!33338 () Bool)

(declare-datatypes ((tuple2!3408 0))(
  ( (tuple2!3409 (_1!1715 (_ BitVec 64)) (_2!1715 V!5457)) )
))
(declare-datatypes ((List!2336 0))(
  ( (Nil!2333) (Cons!2332 (h!2965 tuple2!3408) (t!7212 List!2336)) )
))
(declare-datatypes ((ListLongMap!2329 0))(
  ( (ListLongMap!2330 (toList!1180 List!2336)) )
))
(declare-fun contains!1288 (ListLongMap!2329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!832 (array!7909 array!7911 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 32) Int) ListLongMap!2329)

(assert (=> b!185955 (= c!33338 (contains!1288 (getCurrentListMap!832 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)) key!828))))

(declare-fun b!185956 () Bool)

(declare-fun res!87982 () Bool)

(assert (=> b!185956 (=> (not res!87982) (not e!122363))))

(assert (=> b!185956 (= res!87982 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185957 () Bool)

(declare-fun e!122366 () Bool)

(declare-fun tp_is_empty!4357 () Bool)

(assert (=> b!185957 (= e!122366 tp_is_empty!4357)))

(declare-fun mapNonEmpty!7497 () Bool)

(declare-fun mapRes!7497 () Bool)

(declare-fun tp!16554 () Bool)

(declare-fun e!122367 () Bool)

(assert (=> mapNonEmpty!7497 (= mapRes!7497 (and tp!16554 e!122367))))

(declare-fun mapValue!7497 () ValueCell!1835)

(declare-fun mapKey!7497 () (_ BitVec 32))

(declare-fun mapRest!7497 () (Array (_ BitVec 32) ValueCell!1835))

(assert (=> mapNonEmpty!7497 (= (arr!3735 (_values!3774 thiss!1248)) (store mapRest!7497 mapKey!7497 mapValue!7497))))

(declare-fun b!185958 () Bool)

(declare-fun Unit!5604 () Unit!5602)

(assert (=> b!185958 (= e!122370 Unit!5604)))

(declare-fun lt!91956 () Unit!5602)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!137 (array!7909 array!7911 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 64) Int) Unit!5602)

(assert (=> b!185958 (= lt!91956 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!137 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)))))

(assert (=> b!185958 false))

(declare-fun b!185959 () Bool)

(assert (=> b!185959 (= e!122367 tp_is_empty!4357)))

(declare-fun b!185960 () Bool)

(declare-fun e!122371 () Bool)

(assert (=> b!185960 (= e!122371 (and e!122366 mapRes!7497))))

(declare-fun condMapEmpty!7497 () Bool)

(declare-fun mapDefault!7497 () ValueCell!1835)

(assert (=> b!185960 (= condMapEmpty!7497 (= (arr!3735 (_values!3774 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1835)) mapDefault!7497)))))

(declare-fun array_inv!2409 (array!7909) Bool)

(declare-fun array_inv!2410 (array!7911) Bool)

(assert (=> b!185961 (= e!122365 (and tp!16553 tp_is_empty!4357 (array_inv!2409 (_keys!5732 thiss!1248)) (array_inv!2410 (_values!3774 thiss!1248)) e!122371))))

(declare-fun b!185962 () Bool)

(declare-fun lt!91955 () Unit!5602)

(assert (=> b!185962 (= e!122370 lt!91955)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!145 (array!7909 array!7911 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 64) Int) Unit!5602)

(assert (=> b!185962 (= lt!91955 (lemmaInListMapThenSeekEntryOrOpenFindsIt!145 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)))))

(declare-fun res!87983 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185962 (= res!87983 (inRange!0 (index!4683 lt!91957) (mask!8908 thiss!1248)))))

(assert (=> b!185962 (=> (not res!87983) (not e!122364))))

(assert (=> b!185962 e!122364))

(declare-fun mapIsEmpty!7497 () Bool)

(assert (=> mapIsEmpty!7497 mapRes!7497))

(declare-fun b!185963 () Bool)

(assert (=> b!185963 (= e!122363 e!122368)))

(declare-fun res!87980 () Bool)

(assert (=> b!185963 (=> (not res!87980) (not e!122368))))

(get-info :version)

(assert (=> b!185963 (= res!87980 (and (not ((_ is Undefined!628) lt!91957)) (not ((_ is MissingVacant!628) lt!91957)) (not ((_ is MissingZero!628) lt!91957)) ((_ is Found!628) lt!91957)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7909 (_ BitVec 32)) SeekEntryResult!628)

(assert (=> b!185963 (= lt!91957 (seekEntryOrOpen!0 key!828 (_keys!5732 thiss!1248) (mask!8908 thiss!1248)))))

(assert (= (and start!18814 res!87981) b!185956))

(assert (= (and b!185956 res!87982) b!185963))

(assert (= (and b!185963 res!87980) b!185955))

(assert (= (and b!185955 c!33338) b!185962))

(assert (= (and b!185955 (not c!33338)) b!185958))

(assert (= (and b!185962 res!87983) b!185954))

(assert (= (and b!185960 condMapEmpty!7497) mapIsEmpty!7497))

(assert (= (and b!185960 (not condMapEmpty!7497)) mapNonEmpty!7497))

(assert (= (and mapNonEmpty!7497 ((_ is ValueCellFull!1835) mapValue!7497)) b!185959))

(assert (= (and b!185960 ((_ is ValueCellFull!1835) mapDefault!7497)) b!185957))

(assert (= b!185961 b!185960))

(assert (= start!18814 b!185961))

(declare-fun m!213155 () Bool)

(assert (=> b!185961 m!213155))

(declare-fun m!213157 () Bool)

(assert (=> b!185961 m!213157))

(declare-fun m!213159 () Bool)

(assert (=> mapNonEmpty!7497 m!213159))

(declare-fun m!213161 () Bool)

(assert (=> b!185955 m!213161))

(declare-fun m!213163 () Bool)

(assert (=> b!185955 m!213163))

(assert (=> b!185955 m!213163))

(declare-fun m!213165 () Bool)

(assert (=> b!185955 m!213165))

(declare-fun m!213167 () Bool)

(assert (=> b!185958 m!213167))

(declare-fun m!213169 () Bool)

(assert (=> b!185963 m!213169))

(declare-fun m!213171 () Bool)

(assert (=> start!18814 m!213171))

(declare-fun m!213173 () Bool)

(assert (=> b!185954 m!213173))

(declare-fun m!213175 () Bool)

(assert (=> b!185962 m!213175))

(declare-fun m!213177 () Bool)

(assert (=> b!185962 m!213177))

(check-sat (not b!185955) (not b!185963) (not b!185958) (not start!18814) (not b_next!4585) tp_is_empty!4357 b_and!11201 (not b!185961) (not mapNonEmpty!7497) (not b!185962))
(check-sat b_and!11201 (not b_next!4585))
(get-model)

(declare-fun b!186036 () Bool)

(declare-fun lt!91991 () SeekEntryResult!628)

(declare-fun e!122432 () SeekEntryResult!628)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7909 (_ BitVec 32)) SeekEntryResult!628)

(assert (=> b!186036 (= e!122432 (seekKeyOrZeroReturnVacant!0 (x!20174 lt!91991) (index!4684 lt!91991) (index!4684 lt!91991) key!828 (_keys!5732 thiss!1248) (mask!8908 thiss!1248)))))

(declare-fun b!186037 () Bool)

(declare-fun e!122434 () SeekEntryResult!628)

(assert (=> b!186037 (= e!122434 (Found!628 (index!4684 lt!91991)))))

(declare-fun d!55217 () Bool)

(declare-fun lt!91989 () SeekEntryResult!628)

(assert (=> d!55217 (and (or ((_ is Undefined!628) lt!91989) (not ((_ is Found!628) lt!91989)) (and (bvsge (index!4683 lt!91989) #b00000000000000000000000000000000) (bvslt (index!4683 lt!91989) (size!4050 (_keys!5732 thiss!1248))))) (or ((_ is Undefined!628) lt!91989) ((_ is Found!628) lt!91989) (not ((_ is MissingZero!628) lt!91989)) (and (bvsge (index!4682 lt!91989) #b00000000000000000000000000000000) (bvslt (index!4682 lt!91989) (size!4050 (_keys!5732 thiss!1248))))) (or ((_ is Undefined!628) lt!91989) ((_ is Found!628) lt!91989) ((_ is MissingZero!628) lt!91989) (not ((_ is MissingVacant!628) lt!91989)) (and (bvsge (index!4685 lt!91989) #b00000000000000000000000000000000) (bvslt (index!4685 lt!91989) (size!4050 (_keys!5732 thiss!1248))))) (or ((_ is Undefined!628) lt!91989) (ite ((_ is Found!628) lt!91989) (= (select (arr!3734 (_keys!5732 thiss!1248)) (index!4683 lt!91989)) key!828) (ite ((_ is MissingZero!628) lt!91989) (= (select (arr!3734 (_keys!5732 thiss!1248)) (index!4682 lt!91989)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!628) lt!91989) (= (select (arr!3734 (_keys!5732 thiss!1248)) (index!4685 lt!91989)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!122433 () SeekEntryResult!628)

(assert (=> d!55217 (= lt!91989 e!122433)))

(declare-fun c!33353 () Bool)

(assert (=> d!55217 (= c!33353 (and ((_ is Intermediate!628) lt!91991) (undefined!1440 lt!91991)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7909 (_ BitVec 32)) SeekEntryResult!628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55217 (= lt!91991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8908 thiss!1248)) key!828 (_keys!5732 thiss!1248) (mask!8908 thiss!1248)))))

(assert (=> d!55217 (validMask!0 (mask!8908 thiss!1248))))

(assert (=> d!55217 (= (seekEntryOrOpen!0 key!828 (_keys!5732 thiss!1248) (mask!8908 thiss!1248)) lt!91989)))

(declare-fun b!186038 () Bool)

(declare-fun c!33351 () Bool)

(declare-fun lt!91990 () (_ BitVec 64))

(assert (=> b!186038 (= c!33351 (= lt!91990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186038 (= e!122434 e!122432)))

(declare-fun b!186039 () Bool)

(assert (=> b!186039 (= e!122432 (MissingZero!628 (index!4684 lt!91991)))))

(declare-fun b!186040 () Bool)

(assert (=> b!186040 (= e!122433 e!122434)))

(assert (=> b!186040 (= lt!91990 (select (arr!3734 (_keys!5732 thiss!1248)) (index!4684 lt!91991)))))

(declare-fun c!33352 () Bool)

(assert (=> b!186040 (= c!33352 (= lt!91990 key!828))))

(declare-fun b!186041 () Bool)

(assert (=> b!186041 (= e!122433 Undefined!628)))

(assert (= (and d!55217 c!33353) b!186041))

(assert (= (and d!55217 (not c!33353)) b!186040))

(assert (= (and b!186040 c!33352) b!186037))

(assert (= (and b!186040 (not c!33352)) b!186038))

(assert (= (and b!186038 c!33351) b!186039))

(assert (= (and b!186038 (not c!33351)) b!186036))

(declare-fun m!213227 () Bool)

(assert (=> b!186036 m!213227))

(declare-fun m!213229 () Bool)

(assert (=> d!55217 m!213229))

(declare-fun m!213231 () Bool)

(assert (=> d!55217 m!213231))

(declare-fun m!213233 () Bool)

(assert (=> d!55217 m!213233))

(declare-fun m!213235 () Bool)

(assert (=> d!55217 m!213235))

(declare-fun m!213237 () Bool)

(assert (=> d!55217 m!213237))

(assert (=> d!55217 m!213235))

(assert (=> d!55217 m!213161))

(declare-fun m!213239 () Bool)

(assert (=> b!186040 m!213239))

(assert (=> b!185963 d!55217))

(declare-fun d!55219 () Bool)

(assert (=> d!55219 (= (validMask!0 (mask!8908 thiss!1248)) (and (or (= (mask!8908 thiss!1248) #b00000000000000000000000000000111) (= (mask!8908 thiss!1248) #b00000000000000000000000000001111) (= (mask!8908 thiss!1248) #b00000000000000000000000000011111) (= (mask!8908 thiss!1248) #b00000000000000000000000000111111) (= (mask!8908 thiss!1248) #b00000000000000000000000001111111) (= (mask!8908 thiss!1248) #b00000000000000000000000011111111) (= (mask!8908 thiss!1248) #b00000000000000000000000111111111) (= (mask!8908 thiss!1248) #b00000000000000000000001111111111) (= (mask!8908 thiss!1248) #b00000000000000000000011111111111) (= (mask!8908 thiss!1248) #b00000000000000000000111111111111) (= (mask!8908 thiss!1248) #b00000000000000000001111111111111) (= (mask!8908 thiss!1248) #b00000000000000000011111111111111) (= (mask!8908 thiss!1248) #b00000000000000000111111111111111) (= (mask!8908 thiss!1248) #b00000000000000001111111111111111) (= (mask!8908 thiss!1248) #b00000000000000011111111111111111) (= (mask!8908 thiss!1248) #b00000000000000111111111111111111) (= (mask!8908 thiss!1248) #b00000000000001111111111111111111) (= (mask!8908 thiss!1248) #b00000000000011111111111111111111) (= (mask!8908 thiss!1248) #b00000000000111111111111111111111) (= (mask!8908 thiss!1248) #b00000000001111111111111111111111) (= (mask!8908 thiss!1248) #b00000000011111111111111111111111) (= (mask!8908 thiss!1248) #b00000000111111111111111111111111) (= (mask!8908 thiss!1248) #b00000001111111111111111111111111) (= (mask!8908 thiss!1248) #b00000011111111111111111111111111) (= (mask!8908 thiss!1248) #b00000111111111111111111111111111) (= (mask!8908 thiss!1248) #b00001111111111111111111111111111) (= (mask!8908 thiss!1248) #b00011111111111111111111111111111) (= (mask!8908 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8908 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185955 d!55219))

(declare-fun d!55221 () Bool)

(declare-fun e!122440 () Bool)

(assert (=> d!55221 e!122440))

(declare-fun res!88010 () Bool)

(assert (=> d!55221 (=> res!88010 e!122440)))

(declare-fun lt!92003 () Bool)

(assert (=> d!55221 (= res!88010 (not lt!92003))))

(declare-fun lt!92002 () Bool)

(assert (=> d!55221 (= lt!92003 lt!92002)))

(declare-fun lt!92001 () Unit!5602)

(declare-fun e!122439 () Unit!5602)

(assert (=> d!55221 (= lt!92001 e!122439)))

(declare-fun c!33356 () Bool)

(assert (=> d!55221 (= c!33356 lt!92002)))

(declare-fun containsKey!228 (List!2336 (_ BitVec 64)) Bool)

(assert (=> d!55221 (= lt!92002 (containsKey!228 (toList!1180 (getCurrentListMap!832 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248))) key!828))))

(assert (=> d!55221 (= (contains!1288 (getCurrentListMap!832 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)) key!828) lt!92003)))

(declare-fun b!186048 () Bool)

(declare-fun lt!92000 () Unit!5602)

(assert (=> b!186048 (= e!122439 lt!92000)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!176 (List!2336 (_ BitVec 64)) Unit!5602)

(assert (=> b!186048 (= lt!92000 (lemmaContainsKeyImpliesGetValueByKeyDefined!176 (toList!1180 (getCurrentListMap!832 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248))) key!828))))

(declare-datatypes ((Option!231 0))(
  ( (Some!230 (v!4138 V!5457)) (None!229) )
))
(declare-fun isDefined!177 (Option!231) Bool)

(declare-fun getValueByKey!225 (List!2336 (_ BitVec 64)) Option!231)

(assert (=> b!186048 (isDefined!177 (getValueByKey!225 (toList!1180 (getCurrentListMap!832 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248))) key!828))))

(declare-fun b!186049 () Bool)

(declare-fun Unit!5611 () Unit!5602)

(assert (=> b!186049 (= e!122439 Unit!5611)))

(declare-fun b!186050 () Bool)

(assert (=> b!186050 (= e!122440 (isDefined!177 (getValueByKey!225 (toList!1180 (getCurrentListMap!832 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248))) key!828)))))

(assert (= (and d!55221 c!33356) b!186048))

(assert (= (and d!55221 (not c!33356)) b!186049))

(assert (= (and d!55221 (not res!88010)) b!186050))

(declare-fun m!213241 () Bool)

(assert (=> d!55221 m!213241))

(declare-fun m!213243 () Bool)

(assert (=> b!186048 m!213243))

(declare-fun m!213245 () Bool)

(assert (=> b!186048 m!213245))

(assert (=> b!186048 m!213245))

(declare-fun m!213247 () Bool)

(assert (=> b!186048 m!213247))

(assert (=> b!186050 m!213245))

(assert (=> b!186050 m!213245))

(assert (=> b!186050 m!213247))

(assert (=> b!185955 d!55221))

(declare-fun b!186093 () Bool)

(declare-fun e!122469 () Bool)

(declare-fun e!122478 () Bool)

(assert (=> b!186093 (= e!122469 e!122478)))

(declare-fun res!88034 () Bool)

(declare-fun call!18744 () Bool)

(assert (=> b!186093 (= res!88034 call!18744)))

(assert (=> b!186093 (=> (not res!88034) (not e!122478))))

(declare-fun b!186094 () Bool)

(declare-fun e!122477 () Bool)

(declare-fun call!18745 () Bool)

(assert (=> b!186094 (= e!122477 (not call!18745))))

(declare-fun b!186095 () Bool)

(declare-fun e!122475 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!186095 (= e!122475 (validKeyInArray!0 (select (arr!3734 (_keys!5732 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186096 () Bool)

(declare-fun e!122474 () Bool)

(declare-fun lt!92061 () ListLongMap!2329)

(declare-fun apply!167 (ListLongMap!2329 (_ BitVec 64)) V!5457)

(declare-fun get!2154 (ValueCell!1835 V!5457) V!5457)

(declare-fun dynLambda!510 (Int (_ BitVec 64)) V!5457)

(assert (=> b!186096 (= e!122474 (= (apply!167 lt!92061 (select (arr!3734 (_keys!5732 thiss!1248)) #b00000000000000000000000000000000)) (get!2154 (select (arr!3735 (_values!3774 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!510 (defaultEntry!3791 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186096 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4051 (_values!3774 thiss!1248))))))

(assert (=> b!186096 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4050 (_keys!5732 thiss!1248))))))

(declare-fun bm!18739 () Bool)

(declare-fun call!18743 () ListLongMap!2329)

(declare-fun call!18747 () ListLongMap!2329)

(assert (=> bm!18739 (= call!18743 call!18747)))

(declare-fun b!186097 () Bool)

(declare-fun e!122471 () ListLongMap!2329)

(declare-fun call!18746 () ListLongMap!2329)

(declare-fun +!287 (ListLongMap!2329 tuple2!3408) ListLongMap!2329)

(assert (=> b!186097 (= e!122471 (+!287 call!18746 (tuple2!3409 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3632 thiss!1248))))))

(declare-fun b!186098 () Bool)

(declare-fun e!122472 () ListLongMap!2329)

(declare-fun call!18742 () ListLongMap!2329)

(assert (=> b!186098 (= e!122472 call!18742)))

(declare-fun b!186099 () Bool)

(assert (=> b!186099 (= e!122478 (= (apply!167 lt!92061 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3632 thiss!1248)))))

(declare-fun b!186100 () Bool)

(declare-fun res!88037 () Bool)

(declare-fun e!122473 () Bool)

(assert (=> b!186100 (=> (not res!88037) (not e!122473))))

(assert (=> b!186100 (= res!88037 e!122477)))

(declare-fun c!33370 () Bool)

(assert (=> b!186100 (= c!33370 (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!186101 () Bool)

(declare-fun e!122479 () Unit!5602)

(declare-fun lt!92067 () Unit!5602)

(assert (=> b!186101 (= e!122479 lt!92067)))

(declare-fun lt!92051 () ListLongMap!2329)

(declare-fun getCurrentListMapNoExtraKeys!198 (array!7909 array!7911 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 32) Int) ListLongMap!2329)

(assert (=> b!186101 (= lt!92051 (getCurrentListMapNoExtraKeys!198 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)))))

(declare-fun lt!92053 () (_ BitVec 64))

(assert (=> b!186101 (= lt!92053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92055 () (_ BitVec 64))

(assert (=> b!186101 (= lt!92055 (select (arr!3734 (_keys!5732 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92065 () Unit!5602)

(declare-fun addStillContains!143 (ListLongMap!2329 (_ BitVec 64) V!5457 (_ BitVec 64)) Unit!5602)

(assert (=> b!186101 (= lt!92065 (addStillContains!143 lt!92051 lt!92053 (zeroValue!3632 thiss!1248) lt!92055))))

(assert (=> b!186101 (contains!1288 (+!287 lt!92051 (tuple2!3409 lt!92053 (zeroValue!3632 thiss!1248))) lt!92055)))

(declare-fun lt!92057 () Unit!5602)

(assert (=> b!186101 (= lt!92057 lt!92065)))

(declare-fun lt!92069 () ListLongMap!2329)

(assert (=> b!186101 (= lt!92069 (getCurrentListMapNoExtraKeys!198 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)))))

(declare-fun lt!92058 () (_ BitVec 64))

(assert (=> b!186101 (= lt!92058 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92062 () (_ BitVec 64))

(assert (=> b!186101 (= lt!92062 (select (arr!3734 (_keys!5732 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92064 () Unit!5602)

(declare-fun addApplyDifferent!143 (ListLongMap!2329 (_ BitVec 64) V!5457 (_ BitVec 64)) Unit!5602)

(assert (=> b!186101 (= lt!92064 (addApplyDifferent!143 lt!92069 lt!92058 (minValue!3632 thiss!1248) lt!92062))))

(assert (=> b!186101 (= (apply!167 (+!287 lt!92069 (tuple2!3409 lt!92058 (minValue!3632 thiss!1248))) lt!92062) (apply!167 lt!92069 lt!92062))))

(declare-fun lt!92056 () Unit!5602)

(assert (=> b!186101 (= lt!92056 lt!92064)))

(declare-fun lt!92059 () ListLongMap!2329)

(assert (=> b!186101 (= lt!92059 (getCurrentListMapNoExtraKeys!198 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)))))

(declare-fun lt!92066 () (_ BitVec 64))

(assert (=> b!186101 (= lt!92066 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92050 () (_ BitVec 64))

(assert (=> b!186101 (= lt!92050 (select (arr!3734 (_keys!5732 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92054 () Unit!5602)

(assert (=> b!186101 (= lt!92054 (addApplyDifferent!143 lt!92059 lt!92066 (zeroValue!3632 thiss!1248) lt!92050))))

(assert (=> b!186101 (= (apply!167 (+!287 lt!92059 (tuple2!3409 lt!92066 (zeroValue!3632 thiss!1248))) lt!92050) (apply!167 lt!92059 lt!92050))))

(declare-fun lt!92052 () Unit!5602)

(assert (=> b!186101 (= lt!92052 lt!92054)))

(declare-fun lt!92049 () ListLongMap!2329)

(assert (=> b!186101 (= lt!92049 (getCurrentListMapNoExtraKeys!198 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)))))

(declare-fun lt!92063 () (_ BitVec 64))

(assert (=> b!186101 (= lt!92063 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92068 () (_ BitVec 64))

(assert (=> b!186101 (= lt!92068 (select (arr!3734 (_keys!5732 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186101 (= lt!92067 (addApplyDifferent!143 lt!92049 lt!92063 (minValue!3632 thiss!1248) lt!92068))))

(assert (=> b!186101 (= (apply!167 (+!287 lt!92049 (tuple2!3409 lt!92063 (minValue!3632 thiss!1248))) lt!92068) (apply!167 lt!92049 lt!92068))))

(declare-fun b!186102 () Bool)

(assert (=> b!186102 (= e!122473 e!122469)))

(declare-fun c!33371 () Bool)

(assert (=> b!186102 (= c!33371 (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!186103 () Bool)

(declare-fun Unit!5612 () Unit!5602)

(assert (=> b!186103 (= e!122479 Unit!5612)))

(declare-fun d!55223 () Bool)

(assert (=> d!55223 e!122473))

(declare-fun res!88035 () Bool)

(assert (=> d!55223 (=> (not res!88035) (not e!122473))))

(assert (=> d!55223 (= res!88035 (or (bvsge #b00000000000000000000000000000000 (size!4050 (_keys!5732 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4050 (_keys!5732 thiss!1248))))))))

(declare-fun lt!92048 () ListLongMap!2329)

(assert (=> d!55223 (= lt!92061 lt!92048)))

(declare-fun lt!92060 () Unit!5602)

(assert (=> d!55223 (= lt!92060 e!122479)))

(declare-fun c!33372 () Bool)

(assert (=> d!55223 (= c!33372 e!122475)))

(declare-fun res!88031 () Bool)

(assert (=> d!55223 (=> (not res!88031) (not e!122475))))

(assert (=> d!55223 (= res!88031 (bvslt #b00000000000000000000000000000000 (size!4050 (_keys!5732 thiss!1248))))))

(assert (=> d!55223 (= lt!92048 e!122471)))

(declare-fun c!33369 () Bool)

(assert (=> d!55223 (= c!33369 (and (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55223 (validMask!0 (mask!8908 thiss!1248))))

(assert (=> d!55223 (= (getCurrentListMap!832 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)) lt!92061)))

(declare-fun bm!18740 () Bool)

(assert (=> bm!18740 (= call!18745 (contains!1288 lt!92061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186104 () Bool)

(declare-fun c!33374 () Bool)

(assert (=> b!186104 (= c!33374 (and (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!122468 () ListLongMap!2329)

(assert (=> b!186104 (= e!122468 e!122472)))

(declare-fun b!186105 () Bool)

(declare-fun call!18748 () ListLongMap!2329)

(assert (=> b!186105 (= e!122472 call!18748)))

(declare-fun b!186106 () Bool)

(declare-fun e!122476 () Bool)

(assert (=> b!186106 (= e!122476 e!122474)))

(declare-fun res!88029 () Bool)

(assert (=> b!186106 (=> (not res!88029) (not e!122474))))

(assert (=> b!186106 (= res!88029 (contains!1288 lt!92061 (select (arr!3734 (_keys!5732 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4050 (_keys!5732 thiss!1248))))))

(declare-fun b!186107 () Bool)

(assert (=> b!186107 (= e!122468 call!18742)))

(declare-fun bm!18741 () Bool)

(declare-fun c!33373 () Bool)

(assert (=> bm!18741 (= call!18746 (+!287 (ite c!33369 call!18747 (ite c!33373 call!18743 call!18748)) (ite (or c!33369 c!33373) (tuple2!3409 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3632 thiss!1248)) (tuple2!3409 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3632 thiss!1248)))))))

(declare-fun b!186108 () Bool)

(declare-fun e!122467 () Bool)

(assert (=> b!186108 (= e!122477 e!122467)))

(declare-fun res!88033 () Bool)

(assert (=> b!186108 (= res!88033 call!18745)))

(assert (=> b!186108 (=> (not res!88033) (not e!122467))))

(declare-fun b!186109 () Bool)

(declare-fun e!122470 () Bool)

(assert (=> b!186109 (= e!122470 (validKeyInArray!0 (select (arr!3734 (_keys!5732 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186110 () Bool)

(assert (=> b!186110 (= e!122471 e!122468)))

(assert (=> b!186110 (= c!33373 (and (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18742 () Bool)

(assert (=> bm!18742 (= call!18747 (getCurrentListMapNoExtraKeys!198 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)))))

(declare-fun b!186111 () Bool)

(assert (=> b!186111 (= e!122467 (= (apply!167 lt!92061 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3632 thiss!1248)))))

(declare-fun bm!18743 () Bool)

(assert (=> bm!18743 (= call!18748 call!18743)))

(declare-fun b!186112 () Bool)

(assert (=> b!186112 (= e!122469 (not call!18744))))

(declare-fun bm!18744 () Bool)

(assert (=> bm!18744 (= call!18744 (contains!1288 lt!92061 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186113 () Bool)

(declare-fun res!88030 () Bool)

(assert (=> b!186113 (=> (not res!88030) (not e!122473))))

(assert (=> b!186113 (= res!88030 e!122476)))

(declare-fun res!88036 () Bool)

(assert (=> b!186113 (=> res!88036 e!122476)))

(assert (=> b!186113 (= res!88036 (not e!122470))))

(declare-fun res!88032 () Bool)

(assert (=> b!186113 (=> (not res!88032) (not e!122470))))

(assert (=> b!186113 (= res!88032 (bvslt #b00000000000000000000000000000000 (size!4050 (_keys!5732 thiss!1248))))))

(declare-fun bm!18745 () Bool)

(assert (=> bm!18745 (= call!18742 call!18746)))

(assert (= (and d!55223 c!33369) b!186097))

(assert (= (and d!55223 (not c!33369)) b!186110))

(assert (= (and b!186110 c!33373) b!186107))

(assert (= (and b!186110 (not c!33373)) b!186104))

(assert (= (and b!186104 c!33374) b!186098))

(assert (= (and b!186104 (not c!33374)) b!186105))

(assert (= (or b!186098 b!186105) bm!18743))

(assert (= (or b!186107 bm!18743) bm!18739))

(assert (= (or b!186107 b!186098) bm!18745))

(assert (= (or b!186097 bm!18739) bm!18742))

(assert (= (or b!186097 bm!18745) bm!18741))

(assert (= (and d!55223 res!88031) b!186095))

(assert (= (and d!55223 c!33372) b!186101))

(assert (= (and d!55223 (not c!33372)) b!186103))

(assert (= (and d!55223 res!88035) b!186113))

(assert (= (and b!186113 res!88032) b!186109))

(assert (= (and b!186113 (not res!88036)) b!186106))

(assert (= (and b!186106 res!88029) b!186096))

(assert (= (and b!186113 res!88030) b!186100))

(assert (= (and b!186100 c!33370) b!186108))

(assert (= (and b!186100 (not c!33370)) b!186094))

(assert (= (and b!186108 res!88033) b!186111))

(assert (= (or b!186108 b!186094) bm!18740))

(assert (= (and b!186100 res!88037) b!186102))

(assert (= (and b!186102 c!33371) b!186093))

(assert (= (and b!186102 (not c!33371)) b!186112))

(assert (= (and b!186093 res!88034) b!186099))

(assert (= (or b!186093 b!186112) bm!18744))

(declare-fun b_lambda!7277 () Bool)

(assert (=> (not b_lambda!7277) (not b!186096)))

(declare-fun t!7216 () Bool)

(declare-fun tb!2837 () Bool)

(assert (=> (and b!185961 (= (defaultEntry!3791 thiss!1248) (defaultEntry!3791 thiss!1248)) t!7216) tb!2837))

(declare-fun result!4805 () Bool)

(assert (=> tb!2837 (= result!4805 tp_is_empty!4357)))

(assert (=> b!186096 t!7216))

(declare-fun b_and!11207 () Bool)

(assert (= b_and!11201 (and (=> t!7216 result!4805) b_and!11207)))

(declare-fun m!213249 () Bool)

(assert (=> b!186111 m!213249))

(declare-fun m!213251 () Bool)

(assert (=> b!186097 m!213251))

(declare-fun m!213253 () Bool)

(assert (=> b!186106 m!213253))

(assert (=> b!186106 m!213253))

(declare-fun m!213255 () Bool)

(assert (=> b!186106 m!213255))

(declare-fun m!213257 () Bool)

(assert (=> b!186099 m!213257))

(assert (=> b!186095 m!213253))

(assert (=> b!186095 m!213253))

(declare-fun m!213259 () Bool)

(assert (=> b!186095 m!213259))

(declare-fun m!213261 () Bool)

(assert (=> bm!18744 m!213261))

(declare-fun m!213263 () Bool)

(assert (=> bm!18740 m!213263))

(declare-fun m!213265 () Bool)

(assert (=> bm!18741 m!213265))

(assert (=> b!186109 m!213253))

(assert (=> b!186109 m!213253))

(assert (=> b!186109 m!213259))

(declare-fun m!213267 () Bool)

(assert (=> b!186096 m!213267))

(assert (=> b!186096 m!213267))

(declare-fun m!213269 () Bool)

(assert (=> b!186096 m!213269))

(declare-fun m!213271 () Bool)

(assert (=> b!186096 m!213271))

(assert (=> b!186096 m!213253))

(declare-fun m!213273 () Bool)

(assert (=> b!186096 m!213273))

(assert (=> b!186096 m!213253))

(assert (=> b!186096 m!213269))

(declare-fun m!213275 () Bool)

(assert (=> b!186101 m!213275))

(declare-fun m!213277 () Bool)

(assert (=> b!186101 m!213277))

(declare-fun m!213279 () Bool)

(assert (=> b!186101 m!213279))

(declare-fun m!213281 () Bool)

(assert (=> b!186101 m!213281))

(declare-fun m!213283 () Bool)

(assert (=> b!186101 m!213283))

(declare-fun m!213285 () Bool)

(assert (=> b!186101 m!213285))

(declare-fun m!213287 () Bool)

(assert (=> b!186101 m!213287))

(declare-fun m!213289 () Bool)

(assert (=> b!186101 m!213289))

(assert (=> b!186101 m!213275))

(declare-fun m!213291 () Bool)

(assert (=> b!186101 m!213291))

(assert (=> b!186101 m!213253))

(declare-fun m!213293 () Bool)

(assert (=> b!186101 m!213293))

(assert (=> b!186101 m!213281))

(declare-fun m!213295 () Bool)

(assert (=> b!186101 m!213295))

(declare-fun m!213297 () Bool)

(assert (=> b!186101 m!213297))

(declare-fun m!213299 () Bool)

(assert (=> b!186101 m!213299))

(assert (=> b!186101 m!213287))

(assert (=> b!186101 m!213299))

(declare-fun m!213301 () Bool)

(assert (=> b!186101 m!213301))

(declare-fun m!213303 () Bool)

(assert (=> b!186101 m!213303))

(declare-fun m!213305 () Bool)

(assert (=> b!186101 m!213305))

(assert (=> d!55223 m!213161))

(assert (=> bm!18742 m!213279))

(assert (=> b!185955 d!55223))

(declare-fun d!55225 () Bool)

(declare-fun res!88044 () Bool)

(declare-fun e!122482 () Bool)

(assert (=> d!55225 (=> (not res!88044) (not e!122482))))

(declare-fun simpleValid!183 (LongMapFixedSize!2578) Bool)

(assert (=> d!55225 (= res!88044 (simpleValid!183 thiss!1248))))

(assert (=> d!55225 (= (valid!1086 thiss!1248) e!122482)))

(declare-fun b!186122 () Bool)

(declare-fun res!88045 () Bool)

(assert (=> b!186122 (=> (not res!88045) (not e!122482))))

(declare-fun arrayCountValidKeys!0 (array!7909 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186122 (= res!88045 (= (arrayCountValidKeys!0 (_keys!5732 thiss!1248) #b00000000000000000000000000000000 (size!4050 (_keys!5732 thiss!1248))) (_size!1338 thiss!1248)))))

(declare-fun b!186123 () Bool)

(declare-fun res!88046 () Bool)

(assert (=> b!186123 (=> (not res!88046) (not e!122482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7909 (_ BitVec 32)) Bool)

(assert (=> b!186123 (= res!88046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5732 thiss!1248) (mask!8908 thiss!1248)))))

(declare-fun b!186124 () Bool)

(declare-datatypes ((List!2339 0))(
  ( (Nil!2336) (Cons!2335 (h!2968 (_ BitVec 64)) (t!7217 List!2339)) )
))
(declare-fun arrayNoDuplicates!0 (array!7909 (_ BitVec 32) List!2339) Bool)

(assert (=> b!186124 (= e!122482 (arrayNoDuplicates!0 (_keys!5732 thiss!1248) #b00000000000000000000000000000000 Nil!2336))))

(assert (= (and d!55225 res!88044) b!186122))

(assert (= (and b!186122 res!88045) b!186123))

(assert (= (and b!186123 res!88046) b!186124))

(declare-fun m!213307 () Bool)

(assert (=> d!55225 m!213307))

(declare-fun m!213309 () Bool)

(assert (=> b!186122 m!213309))

(declare-fun m!213311 () Bool)

(assert (=> b!186123 m!213311))

(declare-fun m!213313 () Bool)

(assert (=> b!186124 m!213313))

(assert (=> start!18814 d!55225))

(declare-fun d!55227 () Bool)

(assert (=> d!55227 (= (array_inv!2409 (_keys!5732 thiss!1248)) (bvsge (size!4050 (_keys!5732 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185961 d!55227))

(declare-fun d!55229 () Bool)

(assert (=> d!55229 (= (array_inv!2410 (_values!3774 thiss!1248)) (bvsge (size!4051 (_values!3774 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185961 d!55229))

(declare-fun d!55231 () Bool)

(declare-fun e!122485 () Bool)

(assert (=> d!55231 e!122485))

(declare-fun res!88051 () Bool)

(assert (=> d!55231 (=> (not res!88051) (not e!122485))))

(declare-fun lt!92074 () SeekEntryResult!628)

(assert (=> d!55231 (= res!88051 ((_ is Found!628) lt!92074))))

(assert (=> d!55231 (= lt!92074 (seekEntryOrOpen!0 key!828 (_keys!5732 thiss!1248) (mask!8908 thiss!1248)))))

(declare-fun lt!92075 () Unit!5602)

(declare-fun choose!989 (array!7909 array!7911 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 64) Int) Unit!5602)

(assert (=> d!55231 (= lt!92075 (choose!989 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)))))

(assert (=> d!55231 (validMask!0 (mask!8908 thiss!1248))))

(assert (=> d!55231 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!145 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)) lt!92075)))

(declare-fun b!186129 () Bool)

(declare-fun res!88052 () Bool)

(assert (=> b!186129 (=> (not res!88052) (not e!122485))))

(assert (=> b!186129 (= res!88052 (inRange!0 (index!4683 lt!92074) (mask!8908 thiss!1248)))))

(declare-fun b!186130 () Bool)

(assert (=> b!186130 (= e!122485 (= (select (arr!3734 (_keys!5732 thiss!1248)) (index!4683 lt!92074)) key!828))))

(assert (=> b!186130 (and (bvsge (index!4683 lt!92074) #b00000000000000000000000000000000) (bvslt (index!4683 lt!92074) (size!4050 (_keys!5732 thiss!1248))))))

(assert (= (and d!55231 res!88051) b!186129))

(assert (= (and b!186129 res!88052) b!186130))

(assert (=> d!55231 m!213169))

(declare-fun m!213315 () Bool)

(assert (=> d!55231 m!213315))

(assert (=> d!55231 m!213161))

(declare-fun m!213317 () Bool)

(assert (=> b!186129 m!213317))

(declare-fun m!213319 () Bool)

(assert (=> b!186130 m!213319))

(assert (=> b!185962 d!55231))

(declare-fun d!55233 () Bool)

(assert (=> d!55233 (= (inRange!0 (index!4683 lt!91957) (mask!8908 thiss!1248)) (and (bvsge (index!4683 lt!91957) #b00000000000000000000000000000000) (bvslt (index!4683 lt!91957) (bvadd (mask!8908 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!185962 d!55233))

(declare-fun b!186147 () Bool)

(declare-fun e!122494 () Bool)

(declare-fun lt!92081 () SeekEntryResult!628)

(assert (=> b!186147 (= e!122494 ((_ is Undefined!628) lt!92081))))

(declare-fun b!186148 () Bool)

(assert (=> b!186148 (and (bvsge (index!4682 lt!92081) #b00000000000000000000000000000000) (bvslt (index!4682 lt!92081) (size!4050 (_keys!5732 thiss!1248))))))

(declare-fun res!88061 () Bool)

(assert (=> b!186148 (= res!88061 (= (select (arr!3734 (_keys!5732 thiss!1248)) (index!4682 lt!92081)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122495 () Bool)

(assert (=> b!186148 (=> (not res!88061) (not e!122495))))

(declare-fun b!186149 () Bool)

(declare-fun e!122496 () Bool)

(assert (=> b!186149 (= e!122496 e!122495)))

(declare-fun res!88062 () Bool)

(declare-fun call!18753 () Bool)

(assert (=> b!186149 (= res!88062 call!18753)))

(assert (=> b!186149 (=> (not res!88062) (not e!122495))))

(declare-fun d!55235 () Bool)

(assert (=> d!55235 e!122496))

(declare-fun c!33380 () Bool)

(assert (=> d!55235 (= c!33380 ((_ is MissingZero!628) lt!92081))))

(assert (=> d!55235 (= lt!92081 (seekEntryOrOpen!0 key!828 (_keys!5732 thiss!1248) (mask!8908 thiss!1248)))))

(declare-fun lt!92080 () Unit!5602)

(declare-fun choose!990 (array!7909 array!7911 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 64) Int) Unit!5602)

(assert (=> d!55235 (= lt!92080 (choose!990 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)))))

(assert (=> d!55235 (validMask!0 (mask!8908 thiss!1248))))

(assert (=> d!55235 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!137 (_keys!5732 thiss!1248) (_values!3774 thiss!1248) (mask!8908 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)) lt!92080)))

(declare-fun bm!18750 () Bool)

(declare-fun call!18754 () Bool)

(declare-fun arrayContainsKey!0 (array!7909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18750 (= call!18754 (arrayContainsKey!0 (_keys!5732 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun bm!18751 () Bool)

(assert (=> bm!18751 (= call!18753 (inRange!0 (ite c!33380 (index!4682 lt!92081) (index!4685 lt!92081)) (mask!8908 thiss!1248)))))

(declare-fun b!186150 () Bool)

(assert (=> b!186150 (= e!122495 (not call!18754))))

(declare-fun b!186151 () Bool)

(declare-fun e!122497 () Bool)

(assert (=> b!186151 (= e!122497 (not call!18754))))

(declare-fun b!186152 () Bool)

(assert (=> b!186152 (= e!122496 e!122494)))

(declare-fun c!33379 () Bool)

(assert (=> b!186152 (= c!33379 ((_ is MissingVacant!628) lt!92081))))

(declare-fun b!186153 () Bool)

(declare-fun res!88063 () Bool)

(assert (=> b!186153 (=> (not res!88063) (not e!122497))))

(assert (=> b!186153 (= res!88063 call!18753)))

(assert (=> b!186153 (= e!122494 e!122497)))

(declare-fun b!186154 () Bool)

(declare-fun res!88064 () Bool)

(assert (=> b!186154 (=> (not res!88064) (not e!122497))))

(assert (=> b!186154 (= res!88064 (= (select (arr!3734 (_keys!5732 thiss!1248)) (index!4685 lt!92081)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186154 (and (bvsge (index!4685 lt!92081) #b00000000000000000000000000000000) (bvslt (index!4685 lt!92081) (size!4050 (_keys!5732 thiss!1248))))))

(assert (= (and d!55235 c!33380) b!186149))

(assert (= (and d!55235 (not c!33380)) b!186152))

(assert (= (and b!186149 res!88062) b!186148))

(assert (= (and b!186148 res!88061) b!186150))

(assert (= (and b!186152 c!33379) b!186153))

(assert (= (and b!186152 (not c!33379)) b!186147))

(assert (= (and b!186153 res!88063) b!186154))

(assert (= (and b!186154 res!88064) b!186151))

(assert (= (or b!186149 b!186153) bm!18751))

(assert (= (or b!186150 b!186151) bm!18750))

(declare-fun m!213321 () Bool)

(assert (=> b!186154 m!213321))

(declare-fun m!213323 () Bool)

(assert (=> b!186148 m!213323))

(declare-fun m!213325 () Bool)

(assert (=> bm!18751 m!213325))

(declare-fun m!213327 () Bool)

(assert (=> bm!18750 m!213327))

(assert (=> d!55235 m!213169))

(declare-fun m!213329 () Bool)

(assert (=> d!55235 m!213329))

(assert (=> d!55235 m!213161))

(assert (=> b!185958 d!55235))

(declare-fun mapIsEmpty!7506 () Bool)

(declare-fun mapRes!7506 () Bool)

(assert (=> mapIsEmpty!7506 mapRes!7506))

(declare-fun condMapEmpty!7506 () Bool)

(declare-fun mapDefault!7506 () ValueCell!1835)

(assert (=> mapNonEmpty!7497 (= condMapEmpty!7506 (= mapRest!7497 ((as const (Array (_ BitVec 32) ValueCell!1835)) mapDefault!7506)))))

(declare-fun e!122503 () Bool)

(assert (=> mapNonEmpty!7497 (= tp!16554 (and e!122503 mapRes!7506))))

(declare-fun b!186161 () Bool)

(declare-fun e!122502 () Bool)

(assert (=> b!186161 (= e!122502 tp_is_empty!4357)))

(declare-fun b!186162 () Bool)

(assert (=> b!186162 (= e!122503 tp_is_empty!4357)))

(declare-fun mapNonEmpty!7506 () Bool)

(declare-fun tp!16569 () Bool)

(assert (=> mapNonEmpty!7506 (= mapRes!7506 (and tp!16569 e!122502))))

(declare-fun mapValue!7506 () ValueCell!1835)

(declare-fun mapKey!7506 () (_ BitVec 32))

(declare-fun mapRest!7506 () (Array (_ BitVec 32) ValueCell!1835))

(assert (=> mapNonEmpty!7506 (= mapRest!7497 (store mapRest!7506 mapKey!7506 mapValue!7506))))

(assert (= (and mapNonEmpty!7497 condMapEmpty!7506) mapIsEmpty!7506))

(assert (= (and mapNonEmpty!7497 (not condMapEmpty!7506)) mapNonEmpty!7506))

(assert (= (and mapNonEmpty!7506 ((_ is ValueCellFull!1835) mapValue!7506)) b!186161))

(assert (= (and mapNonEmpty!7497 ((_ is ValueCellFull!1835) mapDefault!7506)) b!186162))

(declare-fun m!213331 () Bool)

(assert (=> mapNonEmpty!7506 m!213331))

(declare-fun b_lambda!7279 () Bool)

(assert (= b_lambda!7277 (or (and b!185961 b_free!4585) b_lambda!7279)))

(check-sat (not b!186122) (not b!186096) (not d!55235) (not d!55231) (not b!186123) (not b!186124) (not b!186106) (not b_next!4585) (not b!186050) (not bm!18741) (not d!55223) (not b!186048) (not bm!18742) (not b_lambda!7279) (not mapNonEmpty!7506) (not b!186095) (not bm!18750) (not bm!18751) (not b!186036) (not b!186109) (not d!55225) (not bm!18744) (not b!186099) tp_is_empty!4357 (not b!186129) (not b!186111) (not b!186097) (not d!55221) (not d!55217) b_and!11207 (not b!186101) (not bm!18740))
(check-sat b_and!11207 (not b_next!4585))
