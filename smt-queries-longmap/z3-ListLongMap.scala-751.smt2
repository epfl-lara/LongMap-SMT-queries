; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17592 () Bool)

(assert start!17592)

(declare-fun b!176038 () Bool)

(declare-fun b_free!4345 () Bool)

(declare-fun b_next!4345 () Bool)

(assert (=> b!176038 (= b_free!4345 (not b_next!4345))))

(declare-fun tp!15722 () Bool)

(declare-fun b_and!10847 () Bool)

(assert (=> b!176038 (= tp!15722 b_and!10847)))

(declare-fun mapNonEmpty!7025 () Bool)

(declare-fun mapRes!7025 () Bool)

(declare-fun tp!15721 () Bool)

(declare-fun e!116159 () Bool)

(assert (=> mapNonEmpty!7025 (= mapRes!7025 (and tp!15721 e!116159))))

(declare-datatypes ((V!5137 0))(
  ( (V!5138 (val!2103 Int)) )
))
(declare-datatypes ((ValueCell!1715 0))(
  ( (ValueCellFull!1715 (v!3980 V!5137)) (EmptyCell!1715) )
))
(declare-fun mapRest!7025 () (Array (_ BitVec 32) ValueCell!1715))

(declare-fun mapValue!7025 () ValueCell!1715)

(declare-datatypes ((array!7363 0))(
  ( (array!7364 (arr!3494 (Array (_ BitVec 32) (_ BitVec 64))) (size!3797 (_ BitVec 32))) )
))
(declare-datatypes ((array!7365 0))(
  ( (array!7366 (arr!3495 (Array (_ BitVec 32) ValueCell!1715)) (size!3798 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2338 0))(
  ( (LongMapFixedSize!2339 (defaultEntry!3627 Int) (mask!8536 (_ BitVec 32)) (extraKeys!3364 (_ BitVec 32)) (zeroValue!3468 V!5137) (minValue!3468 V!5137) (_size!1218 (_ BitVec 32)) (_keys!5484 array!7363) (_values!3610 array!7365) (_vacant!1218 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2338)

(declare-fun mapKey!7025 () (_ BitVec 32))

(assert (=> mapNonEmpty!7025 (= (arr!3495 (_values!3610 thiss!1248)) (store mapRest!7025 mapKey!7025 mapValue!7025))))

(declare-fun b!176034 () Bool)

(declare-fun res!83429 () Bool)

(declare-fun e!116162 () Bool)

(assert (=> b!176034 (=> (not res!83429) (not e!116162))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3228 0))(
  ( (tuple2!3229 (_1!1625 (_ BitVec 64)) (_2!1625 V!5137)) )
))
(declare-datatypes ((List!2207 0))(
  ( (Nil!2204) (Cons!2203 (h!2823 tuple2!3228) (t!7021 List!2207)) )
))
(declare-datatypes ((ListLongMap!2161 0))(
  ( (ListLongMap!2162 (toList!1096 List!2207)) )
))
(declare-fun contains!1169 (ListLongMap!2161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!751 (array!7363 array!7365 (_ BitVec 32) (_ BitVec 32) V!5137 V!5137 (_ BitVec 32) Int) ListLongMap!2161)

(assert (=> b!176034 (= res!83429 (contains!1169 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)) key!828))))

(declare-fun b!176035 () Bool)

(declare-fun e!116163 () Bool)

(declare-fun tp_is_empty!4117 () Bool)

(assert (=> b!176035 (= e!116163 tp_is_empty!4117)))

(declare-fun b!176036 () Bool)

(declare-fun res!83431 () Bool)

(assert (=> b!176036 (=> (not res!83431) (not e!116162))))

(assert (=> b!176036 (= res!83431 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176037 () Bool)

(declare-fun res!83430 () Bool)

(assert (=> b!176037 (=> (not res!83430) (not e!116162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176037 (= res!83430 (validMask!0 (mask!8536 thiss!1248)))))

(declare-fun mapIsEmpty!7025 () Bool)

(assert (=> mapIsEmpty!7025 mapRes!7025))

(declare-fun res!83433 () Bool)

(assert (=> start!17592 (=> (not res!83433) (not e!116162))))

(declare-fun valid!1002 (LongMapFixedSize!2338) Bool)

(assert (=> start!17592 (= res!83433 (valid!1002 thiss!1248))))

(assert (=> start!17592 e!116162))

(declare-fun e!116160 () Bool)

(assert (=> start!17592 e!116160))

(assert (=> start!17592 true))

(declare-fun e!116161 () Bool)

(declare-fun array_inv!2255 (array!7363) Bool)

(declare-fun array_inv!2256 (array!7365) Bool)

(assert (=> b!176038 (= e!116160 (and tp!15722 tp_is_empty!4117 (array_inv!2255 (_keys!5484 thiss!1248)) (array_inv!2256 (_values!3610 thiss!1248)) e!116161))))

(declare-fun b!176039 () Bool)

(declare-fun res!83432 () Bool)

(assert (=> b!176039 (=> (not res!83432) (not e!116162))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!548 0))(
  ( (MissingZero!548 (index!4360 (_ BitVec 32))) (Found!548 (index!4361 (_ BitVec 32))) (Intermediate!548 (undefined!1360 Bool) (index!4362 (_ BitVec 32)) (x!19332 (_ BitVec 32))) (Undefined!548) (MissingVacant!548 (index!4363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7363 (_ BitVec 32)) SeekEntryResult!548)

(assert (=> b!176039 (= res!83432 ((_ is Undefined!548) (seekEntryOrOpen!0 key!828 (_keys!5484 thiss!1248) (mask!8536 thiss!1248))))))

(declare-fun b!176040 () Bool)

(assert (=> b!176040 (= e!116162 (and (= (size!3798 (_values!3610 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8536 thiss!1248))) (= (size!3797 (_keys!5484 thiss!1248)) (size!3798 (_values!3610 thiss!1248))) (bvsge (mask!8536 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3364 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3364 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!176041 () Bool)

(assert (=> b!176041 (= e!116159 tp_is_empty!4117)))

(declare-fun b!176042 () Bool)

(assert (=> b!176042 (= e!116161 (and e!116163 mapRes!7025))))

(declare-fun condMapEmpty!7025 () Bool)

(declare-fun mapDefault!7025 () ValueCell!1715)

(assert (=> b!176042 (= condMapEmpty!7025 (= (arr!3495 (_values!3610 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1715)) mapDefault!7025)))))

(assert (= (and start!17592 res!83433) b!176036))

(assert (= (and b!176036 res!83431) b!176039))

(assert (= (and b!176039 res!83432) b!176034))

(assert (= (and b!176034 res!83429) b!176037))

(assert (= (and b!176037 res!83430) b!176040))

(assert (= (and b!176042 condMapEmpty!7025) mapIsEmpty!7025))

(assert (= (and b!176042 (not condMapEmpty!7025)) mapNonEmpty!7025))

(assert (= (and mapNonEmpty!7025 ((_ is ValueCellFull!1715) mapValue!7025)) b!176041))

(assert (= (and b!176042 ((_ is ValueCellFull!1715) mapDefault!7025)) b!176035))

(assert (= b!176038 b!176042))

(assert (= start!17592 b!176038))

(declare-fun m!205039 () Bool)

(assert (=> b!176034 m!205039))

(assert (=> b!176034 m!205039))

(declare-fun m!205041 () Bool)

(assert (=> b!176034 m!205041))

(declare-fun m!205043 () Bool)

(assert (=> b!176038 m!205043))

(declare-fun m!205045 () Bool)

(assert (=> b!176038 m!205045))

(declare-fun m!205047 () Bool)

(assert (=> start!17592 m!205047))

(declare-fun m!205049 () Bool)

(assert (=> b!176039 m!205049))

(declare-fun m!205051 () Bool)

(assert (=> b!176037 m!205051))

(declare-fun m!205053 () Bool)

(assert (=> mapNonEmpty!7025 m!205053))

(check-sat (not b_next!4345) (not b!176034) b_and!10847 (not b!176038) (not start!17592) tp_is_empty!4117 (not b!176039) (not b!176037) (not mapNonEmpty!7025))
(check-sat b_and!10847 (not b_next!4345))
(get-model)

(declare-fun b!176109 () Bool)

(declare-fun e!116207 () SeekEntryResult!548)

(declare-fun lt!87149 () SeekEntryResult!548)

(assert (=> b!176109 (= e!116207 (Found!548 (index!4362 lt!87149)))))

(declare-fun d!53653 () Bool)

(declare-fun lt!87148 () SeekEntryResult!548)

(assert (=> d!53653 (and (or ((_ is Undefined!548) lt!87148) (not ((_ is Found!548) lt!87148)) (and (bvsge (index!4361 lt!87148) #b00000000000000000000000000000000) (bvslt (index!4361 lt!87148) (size!3797 (_keys!5484 thiss!1248))))) (or ((_ is Undefined!548) lt!87148) ((_ is Found!548) lt!87148) (not ((_ is MissingZero!548) lt!87148)) (and (bvsge (index!4360 lt!87148) #b00000000000000000000000000000000) (bvslt (index!4360 lt!87148) (size!3797 (_keys!5484 thiss!1248))))) (or ((_ is Undefined!548) lt!87148) ((_ is Found!548) lt!87148) ((_ is MissingZero!548) lt!87148) (not ((_ is MissingVacant!548) lt!87148)) (and (bvsge (index!4363 lt!87148) #b00000000000000000000000000000000) (bvslt (index!4363 lt!87148) (size!3797 (_keys!5484 thiss!1248))))) (or ((_ is Undefined!548) lt!87148) (ite ((_ is Found!548) lt!87148) (= (select (arr!3494 (_keys!5484 thiss!1248)) (index!4361 lt!87148)) key!828) (ite ((_ is MissingZero!548) lt!87148) (= (select (arr!3494 (_keys!5484 thiss!1248)) (index!4360 lt!87148)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!548) lt!87148) (= (select (arr!3494 (_keys!5484 thiss!1248)) (index!4363 lt!87148)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!116208 () SeekEntryResult!548)

(assert (=> d!53653 (= lt!87148 e!116208)))

(declare-fun c!31564 () Bool)

(assert (=> d!53653 (= c!31564 (and ((_ is Intermediate!548) lt!87149) (undefined!1360 lt!87149)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7363 (_ BitVec 32)) SeekEntryResult!548)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53653 (= lt!87149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8536 thiss!1248)) key!828 (_keys!5484 thiss!1248) (mask!8536 thiss!1248)))))

(assert (=> d!53653 (validMask!0 (mask!8536 thiss!1248))))

(assert (=> d!53653 (= (seekEntryOrOpen!0 key!828 (_keys!5484 thiss!1248) (mask!8536 thiss!1248)) lt!87148)))

(declare-fun b!176110 () Bool)

(declare-fun c!31562 () Bool)

(declare-fun lt!87150 () (_ BitVec 64))

(assert (=> b!176110 (= c!31562 (= lt!87150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116206 () SeekEntryResult!548)

(assert (=> b!176110 (= e!116207 e!116206)))

(declare-fun b!176111 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7363 (_ BitVec 32)) SeekEntryResult!548)

(assert (=> b!176111 (= e!116206 (seekKeyOrZeroReturnVacant!0 (x!19332 lt!87149) (index!4362 lt!87149) (index!4362 lt!87149) key!828 (_keys!5484 thiss!1248) (mask!8536 thiss!1248)))))

(declare-fun b!176112 () Bool)

(assert (=> b!176112 (= e!116208 Undefined!548)))

(declare-fun b!176113 () Bool)

(assert (=> b!176113 (= e!116208 e!116207)))

(assert (=> b!176113 (= lt!87150 (select (arr!3494 (_keys!5484 thiss!1248)) (index!4362 lt!87149)))))

(declare-fun c!31563 () Bool)

(assert (=> b!176113 (= c!31563 (= lt!87150 key!828))))

(declare-fun b!176114 () Bool)

(assert (=> b!176114 (= e!116206 (MissingZero!548 (index!4362 lt!87149)))))

(assert (= (and d!53653 c!31564) b!176112))

(assert (= (and d!53653 (not c!31564)) b!176113))

(assert (= (and b!176113 c!31563) b!176109))

(assert (= (and b!176113 (not c!31563)) b!176110))

(assert (= (and b!176110 c!31562) b!176114))

(assert (= (and b!176110 (not c!31562)) b!176111))

(assert (=> d!53653 m!205051))

(declare-fun m!205087 () Bool)

(assert (=> d!53653 m!205087))

(declare-fun m!205089 () Bool)

(assert (=> d!53653 m!205089))

(declare-fun m!205091 () Bool)

(assert (=> d!53653 m!205091))

(declare-fun m!205093 () Bool)

(assert (=> d!53653 m!205093))

(assert (=> d!53653 m!205091))

(declare-fun m!205095 () Bool)

(assert (=> d!53653 m!205095))

(declare-fun m!205097 () Bool)

(assert (=> b!176111 m!205097))

(declare-fun m!205099 () Bool)

(assert (=> b!176113 m!205099))

(assert (=> b!176039 d!53653))

(declare-fun d!53655 () Bool)

(assert (=> d!53655 (= (validMask!0 (mask!8536 thiss!1248)) (and (or (= (mask!8536 thiss!1248) #b00000000000000000000000000000111) (= (mask!8536 thiss!1248) #b00000000000000000000000000001111) (= (mask!8536 thiss!1248) #b00000000000000000000000000011111) (= (mask!8536 thiss!1248) #b00000000000000000000000000111111) (= (mask!8536 thiss!1248) #b00000000000000000000000001111111) (= (mask!8536 thiss!1248) #b00000000000000000000000011111111) (= (mask!8536 thiss!1248) #b00000000000000000000000111111111) (= (mask!8536 thiss!1248) #b00000000000000000000001111111111) (= (mask!8536 thiss!1248) #b00000000000000000000011111111111) (= (mask!8536 thiss!1248) #b00000000000000000000111111111111) (= (mask!8536 thiss!1248) #b00000000000000000001111111111111) (= (mask!8536 thiss!1248) #b00000000000000000011111111111111) (= (mask!8536 thiss!1248) #b00000000000000000111111111111111) (= (mask!8536 thiss!1248) #b00000000000000001111111111111111) (= (mask!8536 thiss!1248) #b00000000000000011111111111111111) (= (mask!8536 thiss!1248) #b00000000000000111111111111111111) (= (mask!8536 thiss!1248) #b00000000000001111111111111111111) (= (mask!8536 thiss!1248) #b00000000000011111111111111111111) (= (mask!8536 thiss!1248) #b00000000000111111111111111111111) (= (mask!8536 thiss!1248) #b00000000001111111111111111111111) (= (mask!8536 thiss!1248) #b00000000011111111111111111111111) (= (mask!8536 thiss!1248) #b00000000111111111111111111111111) (= (mask!8536 thiss!1248) #b00000001111111111111111111111111) (= (mask!8536 thiss!1248) #b00000011111111111111111111111111) (= (mask!8536 thiss!1248) #b00000111111111111111111111111111) (= (mask!8536 thiss!1248) #b00001111111111111111111111111111) (= (mask!8536 thiss!1248) #b00011111111111111111111111111111) (= (mask!8536 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8536 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176037 d!53655))

(declare-fun d!53657 () Bool)

(declare-fun res!83470 () Bool)

(declare-fun e!116211 () Bool)

(assert (=> d!53657 (=> (not res!83470) (not e!116211))))

(declare-fun simpleValid!150 (LongMapFixedSize!2338) Bool)

(assert (=> d!53657 (= res!83470 (simpleValid!150 thiss!1248))))

(assert (=> d!53657 (= (valid!1002 thiss!1248) e!116211)))

(declare-fun b!176121 () Bool)

(declare-fun res!83471 () Bool)

(assert (=> b!176121 (=> (not res!83471) (not e!116211))))

(declare-fun arrayCountValidKeys!0 (array!7363 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176121 (= res!83471 (= (arrayCountValidKeys!0 (_keys!5484 thiss!1248) #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))) (_size!1218 thiss!1248)))))

(declare-fun b!176122 () Bool)

(declare-fun res!83472 () Bool)

(assert (=> b!176122 (=> (not res!83472) (not e!116211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7363 (_ BitVec 32)) Bool)

(assert (=> b!176122 (= res!83472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5484 thiss!1248) (mask!8536 thiss!1248)))))

(declare-fun b!176123 () Bool)

(declare-datatypes ((List!2210 0))(
  ( (Nil!2207) (Cons!2206 (h!2826 (_ BitVec 64)) (t!7026 List!2210)) )
))
(declare-fun arrayNoDuplicates!0 (array!7363 (_ BitVec 32) List!2210) Bool)

(assert (=> b!176123 (= e!116211 (arrayNoDuplicates!0 (_keys!5484 thiss!1248) #b00000000000000000000000000000000 Nil!2207))))

(assert (= (and d!53657 res!83470) b!176121))

(assert (= (and b!176121 res!83471) b!176122))

(assert (= (and b!176122 res!83472) b!176123))

(declare-fun m!205101 () Bool)

(assert (=> d!53657 m!205101))

(declare-fun m!205103 () Bool)

(assert (=> b!176121 m!205103))

(declare-fun m!205105 () Bool)

(assert (=> b!176122 m!205105))

(declare-fun m!205107 () Bool)

(assert (=> b!176123 m!205107))

(assert (=> start!17592 d!53657))

(declare-fun d!53659 () Bool)

(declare-fun e!116216 () Bool)

(assert (=> d!53659 e!116216))

(declare-fun res!83475 () Bool)

(assert (=> d!53659 (=> res!83475 e!116216)))

(declare-fun lt!87161 () Bool)

(assert (=> d!53659 (= res!83475 (not lt!87161))))

(declare-fun lt!87159 () Bool)

(assert (=> d!53659 (= lt!87161 lt!87159)))

(declare-datatypes ((Unit!5397 0))(
  ( (Unit!5398) )
))
(declare-fun lt!87160 () Unit!5397)

(declare-fun e!116217 () Unit!5397)

(assert (=> d!53659 (= lt!87160 e!116217)))

(declare-fun c!31567 () Bool)

(assert (=> d!53659 (= c!31567 lt!87159)))

(declare-fun containsKey!195 (List!2207 (_ BitVec 64)) Bool)

(assert (=> d!53659 (= lt!87159 (containsKey!195 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(assert (=> d!53659 (= (contains!1169 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)) key!828) lt!87161)))

(declare-fun b!176130 () Bool)

(declare-fun lt!87162 () Unit!5397)

(assert (=> b!176130 (= e!116217 lt!87162)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!143 (List!2207 (_ BitVec 64)) Unit!5397)

(assert (=> b!176130 (= lt!87162 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(declare-datatypes ((Option!198 0))(
  ( (Some!197 (v!3983 V!5137)) (None!196) )
))
(declare-fun isDefined!144 (Option!198) Bool)

(declare-fun getValueByKey!192 (List!2207 (_ BitVec 64)) Option!198)

(assert (=> b!176130 (isDefined!144 (getValueByKey!192 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(declare-fun b!176131 () Bool)

(declare-fun Unit!5399 () Unit!5397)

(assert (=> b!176131 (= e!116217 Unit!5399)))

(declare-fun b!176132 () Bool)

(assert (=> b!176132 (= e!116216 (isDefined!144 (getValueByKey!192 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828)))))

(assert (= (and d!53659 c!31567) b!176130))

(assert (= (and d!53659 (not c!31567)) b!176131))

(assert (= (and d!53659 (not res!83475)) b!176132))

(declare-fun m!205109 () Bool)

(assert (=> d!53659 m!205109))

(declare-fun m!205111 () Bool)

(assert (=> b!176130 m!205111))

(declare-fun m!205113 () Bool)

(assert (=> b!176130 m!205113))

(assert (=> b!176130 m!205113))

(declare-fun m!205115 () Bool)

(assert (=> b!176130 m!205115))

(assert (=> b!176132 m!205113))

(assert (=> b!176132 m!205113))

(assert (=> b!176132 m!205115))

(assert (=> b!176034 d!53659))

(declare-fun bm!17812 () Bool)

(declare-fun call!17816 () ListLongMap!2161)

(declare-fun getCurrentListMapNoExtraKeys!167 (array!7363 array!7365 (_ BitVec 32) (_ BitVec 32) V!5137 V!5137 (_ BitVec 32) Int) ListLongMap!2161)

(assert (=> bm!17812 (= call!17816 (getCurrentListMapNoExtraKeys!167 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))

(declare-fun b!176175 () Bool)

(declare-fun e!116251 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176175 (= e!116251 (validKeyInArray!0 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176176 () Bool)

(declare-fun e!116249 () Unit!5397)

(declare-fun lt!87226 () Unit!5397)

(assert (=> b!176176 (= e!116249 lt!87226)))

(declare-fun lt!87211 () ListLongMap!2161)

(assert (=> b!176176 (= lt!87211 (getCurrentListMapNoExtraKeys!167 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))

(declare-fun lt!87214 () (_ BitVec 64))

(assert (=> b!176176 (= lt!87214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87221 () (_ BitVec 64))

(assert (=> b!176176 (= lt!87221 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87215 () Unit!5397)

(declare-fun addStillContains!112 (ListLongMap!2161 (_ BitVec 64) V!5137 (_ BitVec 64)) Unit!5397)

(assert (=> b!176176 (= lt!87215 (addStillContains!112 lt!87211 lt!87214 (zeroValue!3468 thiss!1248) lt!87221))))

(declare-fun +!253 (ListLongMap!2161 tuple2!3228) ListLongMap!2161)

(assert (=> b!176176 (contains!1169 (+!253 lt!87211 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248))) lt!87221)))

(declare-fun lt!87228 () Unit!5397)

(assert (=> b!176176 (= lt!87228 lt!87215)))

(declare-fun lt!87209 () ListLongMap!2161)

(assert (=> b!176176 (= lt!87209 (getCurrentListMapNoExtraKeys!167 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))

(declare-fun lt!87210 () (_ BitVec 64))

(assert (=> b!176176 (= lt!87210 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87227 () (_ BitVec 64))

(assert (=> b!176176 (= lt!87227 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87220 () Unit!5397)

(declare-fun addApplyDifferent!112 (ListLongMap!2161 (_ BitVec 64) V!5137 (_ BitVec 64)) Unit!5397)

(assert (=> b!176176 (= lt!87220 (addApplyDifferent!112 lt!87209 lt!87210 (minValue!3468 thiss!1248) lt!87227))))

(declare-fun apply!136 (ListLongMap!2161 (_ BitVec 64)) V!5137)

(assert (=> b!176176 (= (apply!136 (+!253 lt!87209 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248))) lt!87227) (apply!136 lt!87209 lt!87227))))

(declare-fun lt!87223 () Unit!5397)

(assert (=> b!176176 (= lt!87223 lt!87220)))

(declare-fun lt!87219 () ListLongMap!2161)

(assert (=> b!176176 (= lt!87219 (getCurrentListMapNoExtraKeys!167 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))

(declare-fun lt!87217 () (_ BitVec 64))

(assert (=> b!176176 (= lt!87217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87222 () (_ BitVec 64))

(assert (=> b!176176 (= lt!87222 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87208 () Unit!5397)

(assert (=> b!176176 (= lt!87208 (addApplyDifferent!112 lt!87219 lt!87217 (zeroValue!3468 thiss!1248) lt!87222))))

(assert (=> b!176176 (= (apply!136 (+!253 lt!87219 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248))) lt!87222) (apply!136 lt!87219 lt!87222))))

(declare-fun lt!87225 () Unit!5397)

(assert (=> b!176176 (= lt!87225 lt!87208)))

(declare-fun lt!87218 () ListLongMap!2161)

(assert (=> b!176176 (= lt!87218 (getCurrentListMapNoExtraKeys!167 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))

(declare-fun lt!87212 () (_ BitVec 64))

(assert (=> b!176176 (= lt!87212 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87213 () (_ BitVec 64))

(assert (=> b!176176 (= lt!87213 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176176 (= lt!87226 (addApplyDifferent!112 lt!87218 lt!87212 (minValue!3468 thiss!1248) lt!87213))))

(assert (=> b!176176 (= (apply!136 (+!253 lt!87218 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248))) lt!87213) (apply!136 lt!87218 lt!87213))))

(declare-fun bm!17813 () Bool)

(declare-fun call!17820 () ListLongMap!2161)

(declare-fun call!17817 () ListLongMap!2161)

(assert (=> bm!17813 (= call!17820 call!17817)))

(declare-fun bm!17814 () Bool)

(declare-fun call!17819 () Bool)

(declare-fun lt!87224 () ListLongMap!2161)

(assert (=> bm!17814 (= call!17819 (contains!1169 lt!87224 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176177 () Bool)

(declare-fun e!116246 () ListLongMap!2161)

(declare-fun e!116248 () ListLongMap!2161)

(assert (=> b!176177 (= e!116246 e!116248)))

(declare-fun c!31582 () Bool)

(assert (=> b!176177 (= c!31582 (and (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!53661 () Bool)

(declare-fun e!116250 () Bool)

(assert (=> d!53661 e!116250))

(declare-fun res!83501 () Bool)

(assert (=> d!53661 (=> (not res!83501) (not e!116250))))

(assert (=> d!53661 (= res!83501 (or (bvsge #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))))

(declare-fun lt!87207 () ListLongMap!2161)

(assert (=> d!53661 (= lt!87224 lt!87207)))

(declare-fun lt!87216 () Unit!5397)

(assert (=> d!53661 (= lt!87216 e!116249)))

(declare-fun c!31581 () Bool)

(declare-fun e!116252 () Bool)

(assert (=> d!53661 (= c!31581 e!116252)))

(declare-fun res!83500 () Bool)

(assert (=> d!53661 (=> (not res!83500) (not e!116252))))

(assert (=> d!53661 (= res!83500 (bvslt #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(assert (=> d!53661 (= lt!87207 e!116246)))

(declare-fun c!31583 () Bool)

(assert (=> d!53661 (= c!31583 (and (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53661 (validMask!0 (mask!8536 thiss!1248))))

(assert (=> d!53661 (= (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)) lt!87224)))

(declare-fun b!176178 () Bool)

(declare-fun e!116247 () ListLongMap!2161)

(assert (=> b!176178 (= e!116247 call!17820)))

(declare-fun b!176179 () Bool)

(declare-fun e!116245 () Bool)

(declare-fun e!116253 () Bool)

(assert (=> b!176179 (= e!116245 e!116253)))

(declare-fun res!83499 () Bool)

(assert (=> b!176179 (=> (not res!83499) (not e!116253))))

(assert (=> b!176179 (= res!83499 (contains!1169 lt!87224 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(declare-fun b!176180 () Bool)

(declare-fun res!83496 () Bool)

(assert (=> b!176180 (=> (not res!83496) (not e!116250))))

(declare-fun e!116255 () Bool)

(assert (=> b!176180 (= res!83496 e!116255)))

(declare-fun c!31585 () Bool)

(assert (=> b!176180 (= c!31585 (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!176181 () Bool)

(declare-fun e!116254 () Bool)

(assert (=> b!176181 (= e!116254 (= (apply!136 lt!87224 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3468 thiss!1248)))))

(declare-fun b!176182 () Bool)

(declare-fun c!31584 () Bool)

(assert (=> b!176182 (= c!31584 (and (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!176182 (= e!116248 e!116247)))

(declare-fun b!176183 () Bool)

(declare-fun e!116244 () Bool)

(assert (=> b!176183 (= e!116244 (not call!17819))))

(declare-fun b!176184 () Bool)

(assert (=> b!176184 (= e!116250 e!116244)))

(declare-fun c!31580 () Bool)

(assert (=> b!176184 (= c!31580 (not (= (bvand (extraKeys!3364 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176185 () Bool)

(declare-fun call!17821 () ListLongMap!2161)

(assert (=> b!176185 (= e!116247 call!17821)))

(declare-fun call!17818 () ListLongMap!2161)

(declare-fun bm!17815 () Bool)

(assert (=> bm!17815 (= call!17817 (+!253 (ite c!31583 call!17816 (ite c!31582 call!17818 call!17821)) (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(declare-fun bm!17816 () Bool)

(declare-fun call!17815 () Bool)

(assert (=> bm!17816 (= call!17815 (contains!1169 lt!87224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176186 () Bool)

(declare-fun get!2004 (ValueCell!1715 V!5137) V!5137)

(declare-fun dynLambda!479 (Int (_ BitVec 64)) V!5137)

(assert (=> b!176186 (= e!116253 (= (apply!136 lt!87224 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)) (get!2004 (select (arr!3495 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3798 (_values!3610 thiss!1248))))))

(assert (=> b!176186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(declare-fun b!176187 () Bool)

(assert (=> b!176187 (= e!116248 call!17820)))

(declare-fun b!176188 () Bool)

(assert (=> b!176188 (= e!116255 (not call!17815))))

(declare-fun b!176189 () Bool)

(assert (=> b!176189 (= e!116252 (validKeyInArray!0 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176190 () Bool)

(assert (=> b!176190 (= e!116246 (+!253 call!17817 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))

(declare-fun bm!17817 () Bool)

(assert (=> bm!17817 (= call!17818 call!17816)))

(declare-fun b!176191 () Bool)

(declare-fun res!83502 () Bool)

(assert (=> b!176191 (=> (not res!83502) (not e!116250))))

(assert (=> b!176191 (= res!83502 e!116245)))

(declare-fun res!83495 () Bool)

(assert (=> b!176191 (=> res!83495 e!116245)))

(assert (=> b!176191 (= res!83495 (not e!116251))))

(declare-fun res!83498 () Bool)

(assert (=> b!176191 (=> (not res!83498) (not e!116251))))

(assert (=> b!176191 (= res!83498 (bvslt #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(declare-fun b!176192 () Bool)

(assert (=> b!176192 (= e!116244 e!116254)))

(declare-fun res!83497 () Bool)

(assert (=> b!176192 (= res!83497 call!17819)))

(assert (=> b!176192 (=> (not res!83497) (not e!116254))))

(declare-fun bm!17818 () Bool)

(assert (=> bm!17818 (= call!17821 call!17818)))

(declare-fun b!176193 () Bool)

(declare-fun Unit!5400 () Unit!5397)

(assert (=> b!176193 (= e!116249 Unit!5400)))

(declare-fun b!176194 () Bool)

(declare-fun e!116256 () Bool)

(assert (=> b!176194 (= e!116256 (= (apply!136 lt!87224 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3468 thiss!1248)))))

(declare-fun b!176195 () Bool)

(assert (=> b!176195 (= e!116255 e!116256)))

(declare-fun res!83494 () Bool)

(assert (=> b!176195 (= res!83494 call!17815)))

(assert (=> b!176195 (=> (not res!83494) (not e!116256))))

(assert (= (and d!53661 c!31583) b!176190))

(assert (= (and d!53661 (not c!31583)) b!176177))

(assert (= (and b!176177 c!31582) b!176187))

(assert (= (and b!176177 (not c!31582)) b!176182))

(assert (= (and b!176182 c!31584) b!176178))

(assert (= (and b!176182 (not c!31584)) b!176185))

(assert (= (or b!176178 b!176185) bm!17818))

(assert (= (or b!176187 bm!17818) bm!17817))

(assert (= (or b!176187 b!176178) bm!17813))

(assert (= (or b!176190 bm!17817) bm!17812))

(assert (= (or b!176190 bm!17813) bm!17815))

(assert (= (and d!53661 res!83500) b!176189))

(assert (= (and d!53661 c!31581) b!176176))

(assert (= (and d!53661 (not c!31581)) b!176193))

(assert (= (and d!53661 res!83501) b!176191))

(assert (= (and b!176191 res!83498) b!176175))

(assert (= (and b!176191 (not res!83495)) b!176179))

(assert (= (and b!176179 res!83499) b!176186))

(assert (= (and b!176191 res!83502) b!176180))

(assert (= (and b!176180 c!31585) b!176195))

(assert (= (and b!176180 (not c!31585)) b!176188))

(assert (= (and b!176195 res!83494) b!176194))

(assert (= (or b!176195 b!176188) bm!17816))

(assert (= (and b!176180 res!83496) b!176184))

(assert (= (and b!176184 c!31580) b!176192))

(assert (= (and b!176184 (not c!31580)) b!176183))

(assert (= (and b!176192 res!83497) b!176181))

(assert (= (or b!176192 b!176183) bm!17814))

(declare-fun b_lambda!7049 () Bool)

(assert (=> (not b_lambda!7049) (not b!176186)))

(declare-fun t!7025 () Bool)

(declare-fun tb!2775 () Bool)

(assert (=> (and b!176038 (= (defaultEntry!3627 thiss!1248) (defaultEntry!3627 thiss!1248)) t!7025) tb!2775))

(declare-fun result!4615 () Bool)

(assert (=> tb!2775 (= result!4615 tp_is_empty!4117)))

(assert (=> b!176186 t!7025))

(declare-fun b_and!10853 () Bool)

(assert (= b_and!10847 (and (=> t!7025 result!4615) b_and!10853)))

(assert (=> d!53661 m!205051))

(declare-fun m!205117 () Bool)

(assert (=> bm!17812 m!205117))

(declare-fun m!205119 () Bool)

(assert (=> b!176186 m!205119))

(declare-fun m!205121 () Bool)

(assert (=> b!176186 m!205121))

(assert (=> b!176186 m!205119))

(declare-fun m!205123 () Bool)

(assert (=> b!176186 m!205123))

(declare-fun m!205125 () Bool)

(assert (=> b!176186 m!205125))

(assert (=> b!176186 m!205121))

(declare-fun m!205127 () Bool)

(assert (=> b!176186 m!205127))

(assert (=> b!176186 m!205125))

(assert (=> b!176179 m!205119))

(assert (=> b!176179 m!205119))

(declare-fun m!205129 () Bool)

(assert (=> b!176179 m!205129))

(declare-fun m!205131 () Bool)

(assert (=> bm!17814 m!205131))

(declare-fun m!205133 () Bool)

(assert (=> b!176181 m!205133))

(declare-fun m!205135 () Bool)

(assert (=> bm!17815 m!205135))

(declare-fun m!205137 () Bool)

(assert (=> b!176190 m!205137))

(declare-fun m!205139 () Bool)

(assert (=> b!176194 m!205139))

(assert (=> b!176175 m!205119))

(assert (=> b!176175 m!205119))

(declare-fun m!205141 () Bool)

(assert (=> b!176175 m!205141))

(assert (=> b!176189 m!205119))

(assert (=> b!176189 m!205119))

(assert (=> b!176189 m!205141))

(declare-fun m!205143 () Bool)

(assert (=> b!176176 m!205143))

(declare-fun m!205145 () Bool)

(assert (=> b!176176 m!205145))

(declare-fun m!205147 () Bool)

(assert (=> b!176176 m!205147))

(declare-fun m!205149 () Bool)

(assert (=> b!176176 m!205149))

(declare-fun m!205151 () Bool)

(assert (=> b!176176 m!205151))

(declare-fun m!205153 () Bool)

(assert (=> b!176176 m!205153))

(declare-fun m!205155 () Bool)

(assert (=> b!176176 m!205155))

(declare-fun m!205157 () Bool)

(assert (=> b!176176 m!205157))

(declare-fun m!205159 () Bool)

(assert (=> b!176176 m!205159))

(assert (=> b!176176 m!205147))

(declare-fun m!205161 () Bool)

(assert (=> b!176176 m!205161))

(declare-fun m!205163 () Bool)

(assert (=> b!176176 m!205163))

(assert (=> b!176176 m!205117))

(declare-fun m!205165 () Bool)

(assert (=> b!176176 m!205165))

(assert (=> b!176176 m!205149))

(assert (=> b!176176 m!205119))

(declare-fun m!205167 () Bool)

(assert (=> b!176176 m!205167))

(assert (=> b!176176 m!205167))

(declare-fun m!205169 () Bool)

(assert (=> b!176176 m!205169))

(declare-fun m!205171 () Bool)

(assert (=> b!176176 m!205171))

(assert (=> b!176176 m!205155))

(declare-fun m!205173 () Bool)

(assert (=> bm!17816 m!205173))

(assert (=> b!176034 d!53661))

(declare-fun d!53663 () Bool)

(assert (=> d!53663 (= (array_inv!2255 (_keys!5484 thiss!1248)) (bvsge (size!3797 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176038 d!53663))

(declare-fun d!53665 () Bool)

(assert (=> d!53665 (= (array_inv!2256 (_values!3610 thiss!1248)) (bvsge (size!3798 (_values!3610 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176038 d!53665))

(declare-fun b!176205 () Bool)

(declare-fun e!116261 () Bool)

(assert (=> b!176205 (= e!116261 tp_is_empty!4117)))

(declare-fun mapIsEmpty!7034 () Bool)

(declare-fun mapRes!7034 () Bool)

(assert (=> mapIsEmpty!7034 mapRes!7034))

(declare-fun condMapEmpty!7034 () Bool)

(declare-fun mapDefault!7034 () ValueCell!1715)

(assert (=> mapNonEmpty!7025 (= condMapEmpty!7034 (= mapRest!7025 ((as const (Array (_ BitVec 32) ValueCell!1715)) mapDefault!7034)))))

(assert (=> mapNonEmpty!7025 (= tp!15721 (and e!116261 mapRes!7034))))

(declare-fun b!176204 () Bool)

(declare-fun e!116262 () Bool)

(assert (=> b!176204 (= e!116262 tp_is_empty!4117)))

(declare-fun mapNonEmpty!7034 () Bool)

(declare-fun tp!15737 () Bool)

(assert (=> mapNonEmpty!7034 (= mapRes!7034 (and tp!15737 e!116262))))

(declare-fun mapRest!7034 () (Array (_ BitVec 32) ValueCell!1715))

(declare-fun mapKey!7034 () (_ BitVec 32))

(declare-fun mapValue!7034 () ValueCell!1715)

(assert (=> mapNonEmpty!7034 (= mapRest!7025 (store mapRest!7034 mapKey!7034 mapValue!7034))))

(assert (= (and mapNonEmpty!7025 condMapEmpty!7034) mapIsEmpty!7034))

(assert (= (and mapNonEmpty!7025 (not condMapEmpty!7034)) mapNonEmpty!7034))

(assert (= (and mapNonEmpty!7034 ((_ is ValueCellFull!1715) mapValue!7034)) b!176204))

(assert (= (and mapNonEmpty!7025 ((_ is ValueCellFull!1715) mapDefault!7034)) b!176205))

(declare-fun m!205175 () Bool)

(assert (=> mapNonEmpty!7034 m!205175))

(declare-fun b_lambda!7051 () Bool)

(assert (= b_lambda!7049 (or (and b!176038 b_free!4345) b_lambda!7051)))

(check-sat (not b_next!4345) (not b!176121) (not b!176189) (not b!176111) (not b!176176) (not bm!17816) (not b!176130) (not b!176194) (not bm!17812) (not b!176122) (not b!176186) (not d!53657) (not b_lambda!7051) b_and!10853 (not b!176132) (not d!53659) (not mapNonEmpty!7034) (not d!53661) (not b!176123) (not bm!17814) (not b!176181) (not d!53653) (not b!176175) (not b!176179) tp_is_empty!4117 (not b!176190) (not bm!17815))
(check-sat b_and!10853 (not b_next!4345))
(get-model)

(declare-fun d!53667 () Bool)

(declare-fun e!116277 () Bool)

(assert (=> d!53667 e!116277))

(declare-fun res!83513 () Bool)

(assert (=> d!53667 (=> (not res!83513) (not e!116277))))

(declare-fun lt!87249 () ListLongMap!2161)

(assert (=> d!53667 (= res!83513 (not (contains!1169 lt!87249 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!116280 () ListLongMap!2161)

(assert (=> d!53667 (= lt!87249 e!116280)))

(declare-fun c!31596 () Bool)

(assert (=> d!53667 (= c!31596 (bvsge #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(assert (=> d!53667 (validMask!0 (mask!8536 thiss!1248))))

(assert (=> d!53667 (= (getCurrentListMapNoExtraKeys!167 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)) lt!87249)))

(declare-fun b!176230 () Bool)

(assert (=> b!176230 (= e!116280 (ListLongMap!2162 Nil!2204))))

(declare-fun b!176231 () Bool)

(declare-fun e!116278 () Bool)

(declare-fun e!116282 () Bool)

(assert (=> b!176231 (= e!116278 e!116282)))

(declare-fun c!31597 () Bool)

(assert (=> b!176231 (= c!31597 (bvslt #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(declare-fun b!176232 () Bool)

(declare-fun res!83511 () Bool)

(assert (=> b!176232 (=> (not res!83511) (not e!116277))))

(assert (=> b!176232 (= res!83511 (not (contains!1169 lt!87249 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176233 () Bool)

(declare-fun e!116279 () Bool)

(assert (=> b!176233 (= e!116278 e!116279)))

(assert (=> b!176233 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(declare-fun res!83512 () Bool)

(assert (=> b!176233 (= res!83512 (contains!1169 lt!87249 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176233 (=> (not res!83512) (not e!116279))))

(declare-fun b!176234 () Bool)

(declare-fun e!116283 () ListLongMap!2161)

(assert (=> b!176234 (= e!116280 e!116283)))

(declare-fun c!31595 () Bool)

(assert (=> b!176234 (= c!31595 (validKeyInArray!0 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176235 () Bool)

(declare-fun e!116281 () Bool)

(assert (=> b!176235 (= e!116281 (validKeyInArray!0 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176235 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!176236 () Bool)

(assert (=> b!176236 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(assert (=> b!176236 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3798 (_values!3610 thiss!1248))))))

(assert (=> b!176236 (= e!116279 (= (apply!136 lt!87249 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)) (get!2004 (select (arr!3495 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!176237 () Bool)

(assert (=> b!176237 (= e!116277 e!116278)))

(declare-fun c!31594 () Bool)

(assert (=> b!176237 (= c!31594 e!116281)))

(declare-fun res!83514 () Bool)

(assert (=> b!176237 (=> (not res!83514) (not e!116281))))

(assert (=> b!176237 (= res!83514 (bvslt #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(declare-fun b!176238 () Bool)

(declare-fun isEmpty!451 (ListLongMap!2161) Bool)

(assert (=> b!176238 (= e!116282 (isEmpty!451 lt!87249))))

(declare-fun b!176239 () Bool)

(declare-fun lt!87243 () Unit!5397)

(declare-fun lt!87246 () Unit!5397)

(assert (=> b!176239 (= lt!87243 lt!87246)))

(declare-fun lt!87248 () (_ BitVec 64))

(declare-fun lt!87245 () (_ BitVec 64))

(declare-fun lt!87247 () V!5137)

(declare-fun lt!87244 () ListLongMap!2161)

(assert (=> b!176239 (not (contains!1169 (+!253 lt!87244 (tuple2!3229 lt!87245 lt!87247)) lt!87248))))

(declare-fun addStillNotContains!78 (ListLongMap!2161 (_ BitVec 64) V!5137 (_ BitVec 64)) Unit!5397)

(assert (=> b!176239 (= lt!87246 (addStillNotContains!78 lt!87244 lt!87245 lt!87247 lt!87248))))

(assert (=> b!176239 (= lt!87248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!176239 (= lt!87247 (get!2004 (select (arr!3495 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176239 (= lt!87245 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!17824 () ListLongMap!2161)

(assert (=> b!176239 (= lt!87244 call!17824)))

(assert (=> b!176239 (= e!116283 (+!253 call!17824 (tuple2!3229 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000) (get!2004 (select (arr!3495 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!176240 () Bool)

(assert (=> b!176240 (= e!116282 (= lt!87249 (getCurrentListMapNoExtraKeys!167 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3627 thiss!1248))))))

(declare-fun bm!17821 () Bool)

(assert (=> bm!17821 (= call!17824 (getCurrentListMapNoExtraKeys!167 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3627 thiss!1248)))))

(declare-fun b!176241 () Bool)

(assert (=> b!176241 (= e!116283 call!17824)))

(assert (= (and d!53667 c!31596) b!176230))

(assert (= (and d!53667 (not c!31596)) b!176234))

(assert (= (and b!176234 c!31595) b!176239))

(assert (= (and b!176234 (not c!31595)) b!176241))

(assert (= (or b!176239 b!176241) bm!17821))

(assert (= (and d!53667 res!83513) b!176232))

(assert (= (and b!176232 res!83511) b!176237))

(assert (= (and b!176237 res!83514) b!176235))

(assert (= (and b!176237 c!31594) b!176233))

(assert (= (and b!176237 (not c!31594)) b!176231))

(assert (= (and b!176233 res!83512) b!176236))

(assert (= (and b!176231 c!31597) b!176240))

(assert (= (and b!176231 (not c!31597)) b!176238))

(declare-fun b_lambda!7053 () Bool)

(assert (=> (not b_lambda!7053) (not b!176236)))

(assert (=> b!176236 t!7025))

(declare-fun b_and!10855 () Bool)

(assert (= b_and!10853 (and (=> t!7025 result!4615) b_and!10855)))

(declare-fun b_lambda!7055 () Bool)

(assert (=> (not b_lambda!7055) (not b!176239)))

(assert (=> b!176239 t!7025))

(declare-fun b_and!10857 () Bool)

(assert (= b_and!10855 (and (=> t!7025 result!4615) b_and!10857)))

(assert (=> b!176236 m!205119))

(assert (=> b!176236 m!205125))

(assert (=> b!176236 m!205119))

(declare-fun m!205177 () Bool)

(assert (=> b!176236 m!205177))

(assert (=> b!176236 m!205121))

(assert (=> b!176236 m!205125))

(assert (=> b!176236 m!205121))

(assert (=> b!176236 m!205127))

(assert (=> b!176239 m!205119))

(assert (=> b!176239 m!205125))

(declare-fun m!205179 () Bool)

(assert (=> b!176239 m!205179))

(declare-fun m!205181 () Bool)

(assert (=> b!176239 m!205181))

(assert (=> b!176239 m!205121))

(assert (=> b!176239 m!205125))

(assert (=> b!176239 m!205121))

(assert (=> b!176239 m!205127))

(assert (=> b!176239 m!205179))

(declare-fun m!205183 () Bool)

(assert (=> b!176239 m!205183))

(declare-fun m!205185 () Bool)

(assert (=> b!176239 m!205185))

(assert (=> b!176233 m!205119))

(assert (=> b!176233 m!205119))

(declare-fun m!205187 () Bool)

(assert (=> b!176233 m!205187))

(assert (=> b!176234 m!205119))

(assert (=> b!176234 m!205119))

(assert (=> b!176234 m!205141))

(declare-fun m!205189 () Bool)

(assert (=> d!53667 m!205189))

(assert (=> d!53667 m!205051))

(declare-fun m!205191 () Bool)

(assert (=> b!176232 m!205191))

(declare-fun m!205193 () Bool)

(assert (=> b!176240 m!205193))

(assert (=> bm!17821 m!205193))

(declare-fun m!205195 () Bool)

(assert (=> b!176238 m!205195))

(assert (=> b!176235 m!205119))

(assert (=> b!176235 m!205119))

(assert (=> b!176235 m!205141))

(assert (=> bm!17812 d!53667))

(declare-fun d!53669 () Bool)

(assert (=> d!53669 (= (validKeyInArray!0 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176175 d!53669))

(declare-fun b!176252 () Bool)

(declare-fun res!83525 () Bool)

(declare-fun e!116286 () Bool)

(assert (=> b!176252 (=> (not res!83525) (not e!116286))))

(declare-fun size!3803 (LongMapFixedSize!2338) (_ BitVec 32))

(assert (=> b!176252 (= res!83525 (= (size!3803 thiss!1248) (bvadd (_size!1218 thiss!1248) (bvsdiv (bvadd (extraKeys!3364 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!176251 () Bool)

(declare-fun res!83524 () Bool)

(assert (=> b!176251 (=> (not res!83524) (not e!116286))))

(assert (=> b!176251 (= res!83524 (bvsge (size!3803 thiss!1248) (_size!1218 thiss!1248)))))

(declare-fun b!176253 () Bool)

(assert (=> b!176253 (= e!116286 (and (bvsge (extraKeys!3364 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3364 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1218 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!53671 () Bool)

(declare-fun res!83523 () Bool)

(assert (=> d!53671 (=> (not res!83523) (not e!116286))))

(assert (=> d!53671 (= res!83523 (validMask!0 (mask!8536 thiss!1248)))))

(assert (=> d!53671 (= (simpleValid!150 thiss!1248) e!116286)))

(declare-fun b!176250 () Bool)

(declare-fun res!83526 () Bool)

(assert (=> b!176250 (=> (not res!83526) (not e!116286))))

(assert (=> b!176250 (= res!83526 (and (= (size!3798 (_values!3610 thiss!1248)) (bvadd (mask!8536 thiss!1248) #b00000000000000000000000000000001)) (= (size!3797 (_keys!5484 thiss!1248)) (size!3798 (_values!3610 thiss!1248))) (bvsge (_size!1218 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1218 thiss!1248) (bvadd (mask!8536 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!53671 res!83523) b!176250))

(assert (= (and b!176250 res!83526) b!176251))

(assert (= (and b!176251 res!83524) b!176252))

(assert (= (and b!176252 res!83525) b!176253))

(declare-fun m!205197 () Bool)

(assert (=> b!176252 m!205197))

(assert (=> b!176251 m!205197))

(assert (=> d!53671 m!205051))

(assert (=> d!53657 d!53671))

(declare-fun d!53673 () Bool)

(declare-fun get!2005 (Option!198) V!5137)

(assert (=> d!53673 (= (apply!136 (+!253 lt!87218 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248))) lt!87213) (get!2005 (getValueByKey!192 (toList!1096 (+!253 lt!87218 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248)))) lt!87213)))))

(declare-fun bs!7280 () Bool)

(assert (= bs!7280 d!53673))

(declare-fun m!205199 () Bool)

(assert (=> bs!7280 m!205199))

(assert (=> bs!7280 m!205199))

(declare-fun m!205201 () Bool)

(assert (=> bs!7280 m!205201))

(assert (=> b!176176 d!53673))

(declare-fun d!53675 () Bool)

(assert (=> d!53675 (= (apply!136 lt!87218 lt!87213) (get!2005 (getValueByKey!192 (toList!1096 lt!87218) lt!87213)))))

(declare-fun bs!7281 () Bool)

(assert (= bs!7281 d!53675))

(declare-fun m!205203 () Bool)

(assert (=> bs!7281 m!205203))

(assert (=> bs!7281 m!205203))

(declare-fun m!205205 () Bool)

(assert (=> bs!7281 m!205205))

(assert (=> b!176176 d!53675))

(declare-fun d!53677 () Bool)

(declare-fun e!116289 () Bool)

(assert (=> d!53677 e!116289))

(declare-fun res!83531 () Bool)

(assert (=> d!53677 (=> (not res!83531) (not e!116289))))

(declare-fun lt!87258 () ListLongMap!2161)

(assert (=> d!53677 (= res!83531 (contains!1169 lt!87258 (_1!1625 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248)))))))

(declare-fun lt!87261 () List!2207)

(assert (=> d!53677 (= lt!87258 (ListLongMap!2162 lt!87261))))

(declare-fun lt!87259 () Unit!5397)

(declare-fun lt!87260 () Unit!5397)

(assert (=> d!53677 (= lt!87259 lt!87260)))

(assert (=> d!53677 (= (getValueByKey!192 lt!87261 (_1!1625 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248)))) (Some!197 (_2!1625 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!103 (List!2207 (_ BitVec 64) V!5137) Unit!5397)

(assert (=> d!53677 (= lt!87260 (lemmaContainsTupThenGetReturnValue!103 lt!87261 (_1!1625 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248))) (_2!1625 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248)))))))

(declare-fun insertStrictlySorted!106 (List!2207 (_ BitVec 64) V!5137) List!2207)

(assert (=> d!53677 (= lt!87261 (insertStrictlySorted!106 (toList!1096 lt!87219) (_1!1625 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248))) (_2!1625 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248)))))))

(assert (=> d!53677 (= (+!253 lt!87219 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248))) lt!87258)))

(declare-fun b!176258 () Bool)

(declare-fun res!83532 () Bool)

(assert (=> b!176258 (=> (not res!83532) (not e!116289))))

(assert (=> b!176258 (= res!83532 (= (getValueByKey!192 (toList!1096 lt!87258) (_1!1625 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248)))) (Some!197 (_2!1625 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248))))))))

(declare-fun b!176259 () Bool)

(declare-fun contains!1172 (List!2207 tuple2!3228) Bool)

(assert (=> b!176259 (= e!116289 (contains!1172 (toList!1096 lt!87258) (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248))))))

(assert (= (and d!53677 res!83531) b!176258))

(assert (= (and b!176258 res!83532) b!176259))

(declare-fun m!205207 () Bool)

(assert (=> d!53677 m!205207))

(declare-fun m!205209 () Bool)

(assert (=> d!53677 m!205209))

(declare-fun m!205211 () Bool)

(assert (=> d!53677 m!205211))

(declare-fun m!205213 () Bool)

(assert (=> d!53677 m!205213))

(declare-fun m!205215 () Bool)

(assert (=> b!176258 m!205215))

(declare-fun m!205217 () Bool)

(assert (=> b!176259 m!205217))

(assert (=> b!176176 d!53677))

(declare-fun d!53679 () Bool)

(assert (=> d!53679 (= (apply!136 (+!253 lt!87209 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248))) lt!87227) (get!2005 (getValueByKey!192 (toList!1096 (+!253 lt!87209 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248)))) lt!87227)))))

(declare-fun bs!7282 () Bool)

(assert (= bs!7282 d!53679))

(declare-fun m!205219 () Bool)

(assert (=> bs!7282 m!205219))

(assert (=> bs!7282 m!205219))

(declare-fun m!205221 () Bool)

(assert (=> bs!7282 m!205221))

(assert (=> b!176176 d!53679))

(declare-fun d!53681 () Bool)

(declare-fun e!116290 () Bool)

(assert (=> d!53681 e!116290))

(declare-fun res!83533 () Bool)

(assert (=> d!53681 (=> (not res!83533) (not e!116290))))

(declare-fun lt!87262 () ListLongMap!2161)

(assert (=> d!53681 (= res!83533 (contains!1169 lt!87262 (_1!1625 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248)))))))

(declare-fun lt!87265 () List!2207)

(assert (=> d!53681 (= lt!87262 (ListLongMap!2162 lt!87265))))

(declare-fun lt!87263 () Unit!5397)

(declare-fun lt!87264 () Unit!5397)

(assert (=> d!53681 (= lt!87263 lt!87264)))

(assert (=> d!53681 (= (getValueByKey!192 lt!87265 (_1!1625 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248)))) (Some!197 (_2!1625 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248)))))))

(assert (=> d!53681 (= lt!87264 (lemmaContainsTupThenGetReturnValue!103 lt!87265 (_1!1625 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248))) (_2!1625 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248)))))))

(assert (=> d!53681 (= lt!87265 (insertStrictlySorted!106 (toList!1096 lt!87218) (_1!1625 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248))) (_2!1625 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248)))))))

(assert (=> d!53681 (= (+!253 lt!87218 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248))) lt!87262)))

(declare-fun b!176260 () Bool)

(declare-fun res!83534 () Bool)

(assert (=> b!176260 (=> (not res!83534) (not e!116290))))

(assert (=> b!176260 (= res!83534 (= (getValueByKey!192 (toList!1096 lt!87262) (_1!1625 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248)))) (Some!197 (_2!1625 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248))))))))

(declare-fun b!176261 () Bool)

(assert (=> b!176261 (= e!116290 (contains!1172 (toList!1096 lt!87262) (tuple2!3229 lt!87212 (minValue!3468 thiss!1248))))))

(assert (= (and d!53681 res!83533) b!176260))

(assert (= (and b!176260 res!83534) b!176261))

(declare-fun m!205223 () Bool)

(assert (=> d!53681 m!205223))

(declare-fun m!205225 () Bool)

(assert (=> d!53681 m!205225))

(declare-fun m!205227 () Bool)

(assert (=> d!53681 m!205227))

(declare-fun m!205229 () Bool)

(assert (=> d!53681 m!205229))

(declare-fun m!205231 () Bool)

(assert (=> b!176260 m!205231))

(declare-fun m!205233 () Bool)

(assert (=> b!176261 m!205233))

(assert (=> b!176176 d!53681))

(declare-fun d!53683 () Bool)

(assert (=> d!53683 (= (apply!136 (+!253 lt!87219 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248))) lt!87222) (get!2005 (getValueByKey!192 (toList!1096 (+!253 lt!87219 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248)))) lt!87222)))))

(declare-fun bs!7283 () Bool)

(assert (= bs!7283 d!53683))

(declare-fun m!205235 () Bool)

(assert (=> bs!7283 m!205235))

(assert (=> bs!7283 m!205235))

(declare-fun m!205237 () Bool)

(assert (=> bs!7283 m!205237))

(assert (=> b!176176 d!53683))

(declare-fun d!53685 () Bool)

(declare-fun e!116291 () Bool)

(assert (=> d!53685 e!116291))

(declare-fun res!83535 () Bool)

(assert (=> d!53685 (=> res!83535 e!116291)))

(declare-fun lt!87268 () Bool)

(assert (=> d!53685 (= res!83535 (not lt!87268))))

(declare-fun lt!87266 () Bool)

(assert (=> d!53685 (= lt!87268 lt!87266)))

(declare-fun lt!87267 () Unit!5397)

(declare-fun e!116292 () Unit!5397)

(assert (=> d!53685 (= lt!87267 e!116292)))

(declare-fun c!31598 () Bool)

(assert (=> d!53685 (= c!31598 lt!87266)))

(assert (=> d!53685 (= lt!87266 (containsKey!195 (toList!1096 (+!253 lt!87211 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248)))) lt!87221))))

(assert (=> d!53685 (= (contains!1169 (+!253 lt!87211 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248))) lt!87221) lt!87268)))

(declare-fun b!176262 () Bool)

(declare-fun lt!87269 () Unit!5397)

(assert (=> b!176262 (= e!116292 lt!87269)))

(assert (=> b!176262 (= lt!87269 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1096 (+!253 lt!87211 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248)))) lt!87221))))

(assert (=> b!176262 (isDefined!144 (getValueByKey!192 (toList!1096 (+!253 lt!87211 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248)))) lt!87221))))

(declare-fun b!176263 () Bool)

(declare-fun Unit!5401 () Unit!5397)

(assert (=> b!176263 (= e!116292 Unit!5401)))

(declare-fun b!176264 () Bool)

(assert (=> b!176264 (= e!116291 (isDefined!144 (getValueByKey!192 (toList!1096 (+!253 lt!87211 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248)))) lt!87221)))))

(assert (= (and d!53685 c!31598) b!176262))

(assert (= (and d!53685 (not c!31598)) b!176263))

(assert (= (and d!53685 (not res!83535)) b!176264))

(declare-fun m!205239 () Bool)

(assert (=> d!53685 m!205239))

(declare-fun m!205241 () Bool)

(assert (=> b!176262 m!205241))

(declare-fun m!205243 () Bool)

(assert (=> b!176262 m!205243))

(assert (=> b!176262 m!205243))

(declare-fun m!205245 () Bool)

(assert (=> b!176262 m!205245))

(assert (=> b!176264 m!205243))

(assert (=> b!176264 m!205243))

(assert (=> b!176264 m!205245))

(assert (=> b!176176 d!53685))

(declare-fun d!53687 () Bool)

(assert (=> d!53687 (contains!1169 (+!253 lt!87211 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248))) lt!87221)))

(declare-fun lt!87272 () Unit!5397)

(declare-fun choose!950 (ListLongMap!2161 (_ BitVec 64) V!5137 (_ BitVec 64)) Unit!5397)

(assert (=> d!53687 (= lt!87272 (choose!950 lt!87211 lt!87214 (zeroValue!3468 thiss!1248) lt!87221))))

(assert (=> d!53687 (contains!1169 lt!87211 lt!87221)))

(assert (=> d!53687 (= (addStillContains!112 lt!87211 lt!87214 (zeroValue!3468 thiss!1248) lt!87221) lt!87272)))

(declare-fun bs!7284 () Bool)

(assert (= bs!7284 d!53687))

(assert (=> bs!7284 m!205155))

(assert (=> bs!7284 m!205155))

(assert (=> bs!7284 m!205157))

(declare-fun m!205247 () Bool)

(assert (=> bs!7284 m!205247))

(declare-fun m!205249 () Bool)

(assert (=> bs!7284 m!205249))

(assert (=> b!176176 d!53687))

(declare-fun d!53689 () Bool)

(assert (=> d!53689 (= (apply!136 (+!253 lt!87219 (tuple2!3229 lt!87217 (zeroValue!3468 thiss!1248))) lt!87222) (apply!136 lt!87219 lt!87222))))

(declare-fun lt!87275 () Unit!5397)

(declare-fun choose!951 (ListLongMap!2161 (_ BitVec 64) V!5137 (_ BitVec 64)) Unit!5397)

(assert (=> d!53689 (= lt!87275 (choose!951 lt!87219 lt!87217 (zeroValue!3468 thiss!1248) lt!87222))))

(declare-fun e!116295 () Bool)

(assert (=> d!53689 e!116295))

(declare-fun res!83538 () Bool)

(assert (=> d!53689 (=> (not res!83538) (not e!116295))))

(assert (=> d!53689 (= res!83538 (contains!1169 lt!87219 lt!87222))))

(assert (=> d!53689 (= (addApplyDifferent!112 lt!87219 lt!87217 (zeroValue!3468 thiss!1248) lt!87222) lt!87275)))

(declare-fun b!176269 () Bool)

(assert (=> b!176269 (= e!116295 (not (= lt!87222 lt!87217)))))

(assert (= (and d!53689 res!83538) b!176269))

(declare-fun m!205251 () Bool)

(assert (=> d!53689 m!205251))

(assert (=> d!53689 m!205147))

(assert (=> d!53689 m!205161))

(declare-fun m!205253 () Bool)

(assert (=> d!53689 m!205253))

(assert (=> d!53689 m!205147))

(assert (=> d!53689 m!205165))

(assert (=> b!176176 d!53689))

(declare-fun d!53691 () Bool)

(assert (=> d!53691 (= (apply!136 (+!253 lt!87209 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248))) lt!87227) (apply!136 lt!87209 lt!87227))))

(declare-fun lt!87276 () Unit!5397)

(assert (=> d!53691 (= lt!87276 (choose!951 lt!87209 lt!87210 (minValue!3468 thiss!1248) lt!87227))))

(declare-fun e!116296 () Bool)

(assert (=> d!53691 e!116296))

(declare-fun res!83539 () Bool)

(assert (=> d!53691 (=> (not res!83539) (not e!116296))))

(assert (=> d!53691 (= res!83539 (contains!1169 lt!87209 lt!87227))))

(assert (=> d!53691 (= (addApplyDifferent!112 lt!87209 lt!87210 (minValue!3468 thiss!1248) lt!87227) lt!87276)))

(declare-fun b!176270 () Bool)

(assert (=> b!176270 (= e!116296 (not (= lt!87227 lt!87210)))))

(assert (= (and d!53691 res!83539) b!176270))

(declare-fun m!205255 () Bool)

(assert (=> d!53691 m!205255))

(assert (=> d!53691 m!205149))

(assert (=> d!53691 m!205151))

(declare-fun m!205257 () Bool)

(assert (=> d!53691 m!205257))

(assert (=> d!53691 m!205149))

(assert (=> d!53691 m!205143))

(assert (=> b!176176 d!53691))

(assert (=> b!176176 d!53667))

(declare-fun d!53693 () Bool)

(declare-fun e!116297 () Bool)

(assert (=> d!53693 e!116297))

(declare-fun res!83540 () Bool)

(assert (=> d!53693 (=> (not res!83540) (not e!116297))))

(declare-fun lt!87277 () ListLongMap!2161)

(assert (=> d!53693 (= res!83540 (contains!1169 lt!87277 (_1!1625 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248)))))))

(declare-fun lt!87280 () List!2207)

(assert (=> d!53693 (= lt!87277 (ListLongMap!2162 lt!87280))))

(declare-fun lt!87278 () Unit!5397)

(declare-fun lt!87279 () Unit!5397)

(assert (=> d!53693 (= lt!87278 lt!87279)))

(assert (=> d!53693 (= (getValueByKey!192 lt!87280 (_1!1625 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248)))) (Some!197 (_2!1625 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248)))))))

(assert (=> d!53693 (= lt!87279 (lemmaContainsTupThenGetReturnValue!103 lt!87280 (_1!1625 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248))) (_2!1625 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248)))))))

(assert (=> d!53693 (= lt!87280 (insertStrictlySorted!106 (toList!1096 lt!87209) (_1!1625 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248))) (_2!1625 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248)))))))

(assert (=> d!53693 (= (+!253 lt!87209 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248))) lt!87277)))

(declare-fun b!176271 () Bool)

(declare-fun res!83541 () Bool)

(assert (=> b!176271 (=> (not res!83541) (not e!116297))))

(assert (=> b!176271 (= res!83541 (= (getValueByKey!192 (toList!1096 lt!87277) (_1!1625 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248)))) (Some!197 (_2!1625 (tuple2!3229 lt!87210 (minValue!3468 thiss!1248))))))))

(declare-fun b!176272 () Bool)

(assert (=> b!176272 (= e!116297 (contains!1172 (toList!1096 lt!87277) (tuple2!3229 lt!87210 (minValue!3468 thiss!1248))))))

(assert (= (and d!53693 res!83540) b!176271))

(assert (= (and b!176271 res!83541) b!176272))

(declare-fun m!205259 () Bool)

(assert (=> d!53693 m!205259))

(declare-fun m!205261 () Bool)

(assert (=> d!53693 m!205261))

(declare-fun m!205263 () Bool)

(assert (=> d!53693 m!205263))

(declare-fun m!205265 () Bool)

(assert (=> d!53693 m!205265))

(declare-fun m!205267 () Bool)

(assert (=> b!176271 m!205267))

(declare-fun m!205269 () Bool)

(assert (=> b!176272 m!205269))

(assert (=> b!176176 d!53693))

(declare-fun d!53695 () Bool)

(assert (=> d!53695 (= (apply!136 (+!253 lt!87218 (tuple2!3229 lt!87212 (minValue!3468 thiss!1248))) lt!87213) (apply!136 lt!87218 lt!87213))))

(declare-fun lt!87281 () Unit!5397)

(assert (=> d!53695 (= lt!87281 (choose!951 lt!87218 lt!87212 (minValue!3468 thiss!1248) lt!87213))))

(declare-fun e!116298 () Bool)

(assert (=> d!53695 e!116298))

(declare-fun res!83542 () Bool)

(assert (=> d!53695 (=> (not res!83542) (not e!116298))))

(assert (=> d!53695 (= res!83542 (contains!1169 lt!87218 lt!87213))))

(assert (=> d!53695 (= (addApplyDifferent!112 lt!87218 lt!87212 (minValue!3468 thiss!1248) lt!87213) lt!87281)))

(declare-fun b!176273 () Bool)

(assert (=> b!176273 (= e!116298 (not (= lt!87213 lt!87212)))))

(assert (= (and d!53695 res!83542) b!176273))

(declare-fun m!205271 () Bool)

(assert (=> d!53695 m!205271))

(assert (=> d!53695 m!205167))

(assert (=> d!53695 m!205169))

(declare-fun m!205273 () Bool)

(assert (=> d!53695 m!205273))

(assert (=> d!53695 m!205167))

(assert (=> d!53695 m!205171))

(assert (=> b!176176 d!53695))

(declare-fun d!53697 () Bool)

(assert (=> d!53697 (= (apply!136 lt!87219 lt!87222) (get!2005 (getValueByKey!192 (toList!1096 lt!87219) lt!87222)))))

(declare-fun bs!7285 () Bool)

(assert (= bs!7285 d!53697))

(declare-fun m!205275 () Bool)

(assert (=> bs!7285 m!205275))

(assert (=> bs!7285 m!205275))

(declare-fun m!205277 () Bool)

(assert (=> bs!7285 m!205277))

(assert (=> b!176176 d!53697))

(declare-fun d!53699 () Bool)

(declare-fun e!116299 () Bool)

(assert (=> d!53699 e!116299))

(declare-fun res!83543 () Bool)

(assert (=> d!53699 (=> (not res!83543) (not e!116299))))

(declare-fun lt!87282 () ListLongMap!2161)

(assert (=> d!53699 (= res!83543 (contains!1169 lt!87282 (_1!1625 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248)))))))

(declare-fun lt!87285 () List!2207)

(assert (=> d!53699 (= lt!87282 (ListLongMap!2162 lt!87285))))

(declare-fun lt!87283 () Unit!5397)

(declare-fun lt!87284 () Unit!5397)

(assert (=> d!53699 (= lt!87283 lt!87284)))

(assert (=> d!53699 (= (getValueByKey!192 lt!87285 (_1!1625 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248)))) (Some!197 (_2!1625 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248)))))))

(assert (=> d!53699 (= lt!87284 (lemmaContainsTupThenGetReturnValue!103 lt!87285 (_1!1625 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248))) (_2!1625 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248)))))))

(assert (=> d!53699 (= lt!87285 (insertStrictlySorted!106 (toList!1096 lt!87211) (_1!1625 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248))) (_2!1625 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248)))))))

(assert (=> d!53699 (= (+!253 lt!87211 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248))) lt!87282)))

(declare-fun b!176274 () Bool)

(declare-fun res!83544 () Bool)

(assert (=> b!176274 (=> (not res!83544) (not e!116299))))

(assert (=> b!176274 (= res!83544 (= (getValueByKey!192 (toList!1096 lt!87282) (_1!1625 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248)))) (Some!197 (_2!1625 (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248))))))))

(declare-fun b!176275 () Bool)

(assert (=> b!176275 (= e!116299 (contains!1172 (toList!1096 lt!87282) (tuple2!3229 lt!87214 (zeroValue!3468 thiss!1248))))))

(assert (= (and d!53699 res!83543) b!176274))

(assert (= (and b!176274 res!83544) b!176275))

(declare-fun m!205279 () Bool)

(assert (=> d!53699 m!205279))

(declare-fun m!205281 () Bool)

(assert (=> d!53699 m!205281))

(declare-fun m!205283 () Bool)

(assert (=> d!53699 m!205283))

(declare-fun m!205285 () Bool)

(assert (=> d!53699 m!205285))

(declare-fun m!205287 () Bool)

(assert (=> b!176274 m!205287))

(declare-fun m!205289 () Bool)

(assert (=> b!176275 m!205289))

(assert (=> b!176176 d!53699))

(declare-fun d!53701 () Bool)

(assert (=> d!53701 (= (apply!136 lt!87209 lt!87227) (get!2005 (getValueByKey!192 (toList!1096 lt!87209) lt!87227)))))

(declare-fun bs!7286 () Bool)

(assert (= bs!7286 d!53701))

(declare-fun m!205291 () Bool)

(assert (=> bs!7286 m!205291))

(assert (=> bs!7286 m!205291))

(declare-fun m!205293 () Bool)

(assert (=> bs!7286 m!205293))

(assert (=> b!176176 d!53701))

(declare-fun b!176284 () Bool)

(declare-fun e!116304 () (_ BitVec 32))

(declare-fun call!17827 () (_ BitVec 32))

(assert (=> b!176284 (= e!116304 (bvadd #b00000000000000000000000000000001 call!17827))))

(declare-fun d!53703 () Bool)

(declare-fun lt!87288 () (_ BitVec 32))

(assert (=> d!53703 (and (bvsge lt!87288 #b00000000000000000000000000000000) (bvsle lt!87288 (bvsub (size!3797 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!116305 () (_ BitVec 32))

(assert (=> d!53703 (= lt!87288 e!116305)))

(declare-fun c!31604 () Bool)

(assert (=> d!53703 (= c!31604 (bvsge #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(assert (=> d!53703 (and (bvsle #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3797 (_keys!5484 thiss!1248)) (size!3797 (_keys!5484 thiss!1248))))))

(assert (=> d!53703 (= (arrayCountValidKeys!0 (_keys!5484 thiss!1248) #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))) lt!87288)))

(declare-fun b!176285 () Bool)

(assert (=> b!176285 (= e!116305 e!116304)))

(declare-fun c!31603 () Bool)

(assert (=> b!176285 (= c!31603 (validKeyInArray!0 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17824 () Bool)

(assert (=> bm!17824 (= call!17827 (arrayCountValidKeys!0 (_keys!5484 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3797 (_keys!5484 thiss!1248))))))

(declare-fun b!176286 () Bool)

(assert (=> b!176286 (= e!116304 call!17827)))

(declare-fun b!176287 () Bool)

(assert (=> b!176287 (= e!116305 #b00000000000000000000000000000000)))

(assert (= (and d!53703 c!31604) b!176287))

(assert (= (and d!53703 (not c!31604)) b!176285))

(assert (= (and b!176285 c!31603) b!176284))

(assert (= (and b!176285 (not c!31603)) b!176286))

(assert (= (or b!176284 b!176286) bm!17824))

(assert (=> b!176285 m!205119))

(assert (=> b!176285 m!205119))

(assert (=> b!176285 m!205141))

(declare-fun m!205295 () Bool)

(assert (=> bm!17824 m!205295))

(assert (=> b!176121 d!53703))

(declare-fun d!53705 () Bool)

(declare-fun e!116319 () Bool)

(assert (=> d!53705 e!116319))

(declare-fun c!31612 () Bool)

(declare-fun lt!87293 () SeekEntryResult!548)

(assert (=> d!53705 (= c!31612 (and ((_ is Intermediate!548) lt!87293) (undefined!1360 lt!87293)))))

(declare-fun e!116316 () SeekEntryResult!548)

(assert (=> d!53705 (= lt!87293 e!116316)))

(declare-fun c!31613 () Bool)

(assert (=> d!53705 (= c!31613 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!87294 () (_ BitVec 64))

(assert (=> d!53705 (= lt!87294 (select (arr!3494 (_keys!5484 thiss!1248)) (toIndex!0 key!828 (mask!8536 thiss!1248))))))

(assert (=> d!53705 (validMask!0 (mask!8536 thiss!1248))))

(assert (=> d!53705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8536 thiss!1248)) key!828 (_keys!5484 thiss!1248) (mask!8536 thiss!1248)) lt!87293)))

(declare-fun b!176306 () Bool)

(declare-fun e!116317 () Bool)

(assert (=> b!176306 (= e!116319 e!116317)))

(declare-fun res!83553 () Bool)

(assert (=> b!176306 (= res!83553 (and ((_ is Intermediate!548) lt!87293) (not (undefined!1360 lt!87293)) (bvslt (x!19332 lt!87293) #b01111111111111111111111111111110) (bvsge (x!19332 lt!87293) #b00000000000000000000000000000000) (bvsge (x!19332 lt!87293) #b00000000000000000000000000000000)))))

(assert (=> b!176306 (=> (not res!83553) (not e!116317))))

(declare-fun b!176307 () Bool)

(assert (=> b!176307 (and (bvsge (index!4362 lt!87293) #b00000000000000000000000000000000) (bvslt (index!4362 lt!87293) (size!3797 (_keys!5484 thiss!1248))))))

(declare-fun res!83551 () Bool)

(assert (=> b!176307 (= res!83551 (= (select (arr!3494 (_keys!5484 thiss!1248)) (index!4362 lt!87293)) key!828))))

(declare-fun e!116318 () Bool)

(assert (=> b!176307 (=> res!83551 e!116318)))

(assert (=> b!176307 (= e!116317 e!116318)))

(declare-fun b!176308 () Bool)

(declare-fun e!116320 () SeekEntryResult!548)

(assert (=> b!176308 (= e!116316 e!116320)))

(declare-fun c!31611 () Bool)

(assert (=> b!176308 (= c!31611 (or (= lt!87294 key!828) (= (bvadd lt!87294 lt!87294) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176309 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176309 (= e!116320 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8536 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8536 thiss!1248)) key!828 (_keys!5484 thiss!1248) (mask!8536 thiss!1248)))))

(declare-fun b!176310 () Bool)

(assert (=> b!176310 (and (bvsge (index!4362 lt!87293) #b00000000000000000000000000000000) (bvslt (index!4362 lt!87293) (size!3797 (_keys!5484 thiss!1248))))))

(declare-fun res!83552 () Bool)

(assert (=> b!176310 (= res!83552 (= (select (arr!3494 (_keys!5484 thiss!1248)) (index!4362 lt!87293)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176310 (=> res!83552 e!116318)))

(declare-fun b!176311 () Bool)

(assert (=> b!176311 (= e!116319 (bvsge (x!19332 lt!87293) #b01111111111111111111111111111110))))

(declare-fun b!176312 () Bool)

(assert (=> b!176312 (and (bvsge (index!4362 lt!87293) #b00000000000000000000000000000000) (bvslt (index!4362 lt!87293) (size!3797 (_keys!5484 thiss!1248))))))

(assert (=> b!176312 (= e!116318 (= (select (arr!3494 (_keys!5484 thiss!1248)) (index!4362 lt!87293)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176313 () Bool)

(assert (=> b!176313 (= e!116316 (Intermediate!548 true (toIndex!0 key!828 (mask!8536 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!176314 () Bool)

(assert (=> b!176314 (= e!116320 (Intermediate!548 false (toIndex!0 key!828 (mask!8536 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!53705 c!31613) b!176313))

(assert (= (and d!53705 (not c!31613)) b!176308))

(assert (= (and b!176308 c!31611) b!176314))

(assert (= (and b!176308 (not c!31611)) b!176309))

(assert (= (and d!53705 c!31612) b!176311))

(assert (= (and d!53705 (not c!31612)) b!176306))

(assert (= (and b!176306 res!83553) b!176307))

(assert (= (and b!176307 (not res!83551)) b!176310))

(assert (= (and b!176310 (not res!83552)) b!176312))

(declare-fun m!205297 () Bool)

(assert (=> b!176312 m!205297))

(assert (=> d!53705 m!205091))

(declare-fun m!205299 () Bool)

(assert (=> d!53705 m!205299))

(assert (=> d!53705 m!205051))

(assert (=> b!176310 m!205297))

(assert (=> b!176309 m!205091))

(declare-fun m!205301 () Bool)

(assert (=> b!176309 m!205301))

(assert (=> b!176309 m!205301))

(declare-fun m!205303 () Bool)

(assert (=> b!176309 m!205303))

(assert (=> b!176307 m!205297))

(assert (=> d!53653 d!53705))

(declare-fun d!53707 () Bool)

(declare-fun lt!87300 () (_ BitVec 32))

(declare-fun lt!87299 () (_ BitVec 32))

(assert (=> d!53707 (= lt!87300 (bvmul (bvxor lt!87299 (bvlshr lt!87299 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53707 (= lt!87299 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53707 (and (bvsge (mask!8536 thiss!1248) #b00000000000000000000000000000000) (let ((res!83554 (let ((h!2827 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19350 (bvmul (bvxor h!2827 (bvlshr h!2827 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19350 (bvlshr x!19350 #b00000000000000000000000000001101)) (mask!8536 thiss!1248)))))) (and (bvslt res!83554 (bvadd (mask!8536 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!83554 #b00000000000000000000000000000000))))))

(assert (=> d!53707 (= (toIndex!0 key!828 (mask!8536 thiss!1248)) (bvand (bvxor lt!87300 (bvlshr lt!87300 #b00000000000000000000000000001101)) (mask!8536 thiss!1248)))))

(assert (=> d!53653 d!53707))

(assert (=> d!53653 d!53655))

(declare-fun d!53709 () Bool)

(declare-fun isEmpty!452 (Option!198) Bool)

(assert (=> d!53709 (= (isDefined!144 (getValueByKey!192 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828)) (not (isEmpty!452 (getValueByKey!192 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))))

(declare-fun bs!7287 () Bool)

(assert (= bs!7287 d!53709))

(assert (=> bs!7287 m!205113))

(declare-fun m!205305 () Bool)

(assert (=> bs!7287 m!205305))

(assert (=> b!176132 d!53709))

(declare-fun b!176323 () Bool)

(declare-fun e!116325 () Option!198)

(assert (=> b!176323 (= e!116325 (Some!197 (_2!1625 (h!2823 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))))))

(declare-fun b!176324 () Bool)

(declare-fun e!116326 () Option!198)

(assert (=> b!176324 (= e!116325 e!116326)))

(declare-fun c!31619 () Bool)

(assert (=> b!176324 (= c!31619 (and ((_ is Cons!2203) (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) (not (= (_1!1625 (h!2823 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) key!828))))))

(declare-fun d!53711 () Bool)

(declare-fun c!31618 () Bool)

(assert (=> d!53711 (= c!31618 (and ((_ is Cons!2203) (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) (= (_1!1625 (h!2823 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) key!828)))))

(assert (=> d!53711 (= (getValueByKey!192 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828) e!116325)))

(declare-fun b!176326 () Bool)

(assert (=> b!176326 (= e!116326 None!196)))

(declare-fun b!176325 () Bool)

(assert (=> b!176325 (= e!116326 (getValueByKey!192 (t!7021 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) key!828))))

(assert (= (and d!53711 c!31618) b!176323))

(assert (= (and d!53711 (not c!31618)) b!176324))

(assert (= (and b!176324 c!31619) b!176325))

(assert (= (and b!176324 (not c!31619)) b!176326))

(declare-fun m!205307 () Bool)

(assert (=> b!176325 m!205307))

(assert (=> b!176132 d!53711))

(assert (=> b!176189 d!53669))

(declare-fun d!53713 () Bool)

(declare-fun e!116327 () Bool)

(assert (=> d!53713 e!116327))

(declare-fun res!83555 () Bool)

(assert (=> d!53713 (=> (not res!83555) (not e!116327))))

(declare-fun lt!87301 () ListLongMap!2161)

(assert (=> d!53713 (= res!83555 (contains!1169 lt!87301 (_1!1625 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(declare-fun lt!87304 () List!2207)

(assert (=> d!53713 (= lt!87301 (ListLongMap!2162 lt!87304))))

(declare-fun lt!87302 () Unit!5397)

(declare-fun lt!87303 () Unit!5397)

(assert (=> d!53713 (= lt!87302 lt!87303)))

(assert (=> d!53713 (= (getValueByKey!192 lt!87304 (_1!1625 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))) (Some!197 (_2!1625 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(assert (=> d!53713 (= lt!87303 (lemmaContainsTupThenGetReturnValue!103 lt!87304 (_1!1625 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))) (_2!1625 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(assert (=> d!53713 (= lt!87304 (insertStrictlySorted!106 (toList!1096 call!17817) (_1!1625 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))) (_2!1625 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(assert (=> d!53713 (= (+!253 call!17817 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))) lt!87301)))

(declare-fun b!176327 () Bool)

(declare-fun res!83556 () Bool)

(assert (=> b!176327 (=> (not res!83556) (not e!116327))))

(assert (=> b!176327 (= res!83556 (= (getValueByKey!192 (toList!1096 lt!87301) (_1!1625 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))) (Some!197 (_2!1625 (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))))

(declare-fun b!176328 () Bool)

(assert (=> b!176328 (= e!116327 (contains!1172 (toList!1096 lt!87301) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))

(assert (= (and d!53713 res!83555) b!176327))

(assert (= (and b!176327 res!83556) b!176328))

(declare-fun m!205309 () Bool)

(assert (=> d!53713 m!205309))

(declare-fun m!205311 () Bool)

(assert (=> d!53713 m!205311))

(declare-fun m!205313 () Bool)

(assert (=> d!53713 m!205313))

(declare-fun m!205315 () Bool)

(assert (=> d!53713 m!205315))

(declare-fun m!205317 () Bool)

(assert (=> b!176327 m!205317))

(declare-fun m!205319 () Bool)

(assert (=> b!176328 m!205319))

(assert (=> b!176190 d!53713))

(declare-fun d!53715 () Bool)

(assert (=> d!53715 (= (apply!136 lt!87224 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2005 (getValueByKey!192 (toList!1096 lt!87224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7288 () Bool)

(assert (= bs!7288 d!53715))

(declare-fun m!205321 () Bool)

(assert (=> bs!7288 m!205321))

(assert (=> bs!7288 m!205321))

(declare-fun m!205323 () Bool)

(assert (=> bs!7288 m!205323))

(assert (=> b!176181 d!53715))

(declare-fun b!176341 () Bool)

(declare-fun e!116335 () SeekEntryResult!548)

(assert (=> b!176341 (= e!116335 (Found!548 (index!4362 lt!87149)))))

(declare-fun b!176342 () Bool)

(declare-fun e!116336 () SeekEntryResult!548)

(assert (=> b!176342 (= e!116336 (MissingVacant!548 (index!4362 lt!87149)))))

(declare-fun b!176343 () Bool)

(assert (=> b!176343 (= e!116336 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19332 lt!87149) #b00000000000000000000000000000001) (nextIndex!0 (index!4362 lt!87149) (bvadd (x!19332 lt!87149) #b00000000000000000000000000000001) (mask!8536 thiss!1248)) (index!4362 lt!87149) key!828 (_keys!5484 thiss!1248) (mask!8536 thiss!1248)))))

(declare-fun b!176344 () Bool)

(declare-fun e!116334 () SeekEntryResult!548)

(assert (=> b!176344 (= e!116334 e!116335)))

(declare-fun c!31627 () Bool)

(declare-fun lt!87309 () (_ BitVec 64))

(assert (=> b!176344 (= c!31627 (= lt!87309 key!828))))

(declare-fun b!176345 () Bool)

(declare-fun c!31626 () Bool)

(assert (=> b!176345 (= c!31626 (= lt!87309 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176345 (= e!116335 e!116336)))

(declare-fun d!53717 () Bool)

(declare-fun lt!87310 () SeekEntryResult!548)

(assert (=> d!53717 (and (or ((_ is Undefined!548) lt!87310) (not ((_ is Found!548) lt!87310)) (and (bvsge (index!4361 lt!87310) #b00000000000000000000000000000000) (bvslt (index!4361 lt!87310) (size!3797 (_keys!5484 thiss!1248))))) (or ((_ is Undefined!548) lt!87310) ((_ is Found!548) lt!87310) (not ((_ is MissingVacant!548) lt!87310)) (not (= (index!4363 lt!87310) (index!4362 lt!87149))) (and (bvsge (index!4363 lt!87310) #b00000000000000000000000000000000) (bvslt (index!4363 lt!87310) (size!3797 (_keys!5484 thiss!1248))))) (or ((_ is Undefined!548) lt!87310) (ite ((_ is Found!548) lt!87310) (= (select (arr!3494 (_keys!5484 thiss!1248)) (index!4361 lt!87310)) key!828) (and ((_ is MissingVacant!548) lt!87310) (= (index!4363 lt!87310) (index!4362 lt!87149)) (= (select (arr!3494 (_keys!5484 thiss!1248)) (index!4363 lt!87310)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53717 (= lt!87310 e!116334)))

(declare-fun c!31628 () Bool)

(assert (=> d!53717 (= c!31628 (bvsge (x!19332 lt!87149) #b01111111111111111111111111111110))))

(assert (=> d!53717 (= lt!87309 (select (arr!3494 (_keys!5484 thiss!1248)) (index!4362 lt!87149)))))

(assert (=> d!53717 (validMask!0 (mask!8536 thiss!1248))))

(assert (=> d!53717 (= (seekKeyOrZeroReturnVacant!0 (x!19332 lt!87149) (index!4362 lt!87149) (index!4362 lt!87149) key!828 (_keys!5484 thiss!1248) (mask!8536 thiss!1248)) lt!87310)))

(declare-fun b!176346 () Bool)

(assert (=> b!176346 (= e!116334 Undefined!548)))

(assert (= (and d!53717 c!31628) b!176346))

(assert (= (and d!53717 (not c!31628)) b!176344))

(assert (= (and b!176344 c!31627) b!176341))

(assert (= (and b!176344 (not c!31627)) b!176345))

(assert (= (and b!176345 c!31626) b!176342))

(assert (= (and b!176345 (not c!31626)) b!176343))

(declare-fun m!205325 () Bool)

(assert (=> b!176343 m!205325))

(assert (=> b!176343 m!205325))

(declare-fun m!205327 () Bool)

(assert (=> b!176343 m!205327))

(declare-fun m!205329 () Bool)

(assert (=> d!53717 m!205329))

(declare-fun m!205331 () Bool)

(assert (=> d!53717 m!205331))

(assert (=> d!53717 m!205099))

(assert (=> d!53717 m!205051))

(assert (=> b!176111 d!53717))

(declare-fun d!53719 () Bool)

(assert (=> d!53719 (= (apply!136 lt!87224 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)) (get!2005 (getValueByKey!192 (toList!1096 lt!87224) (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7289 () Bool)

(assert (= bs!7289 d!53719))

(assert (=> bs!7289 m!205119))

(declare-fun m!205333 () Bool)

(assert (=> bs!7289 m!205333))

(assert (=> bs!7289 m!205333))

(declare-fun m!205335 () Bool)

(assert (=> bs!7289 m!205335))

(assert (=> b!176186 d!53719))

(declare-fun d!53721 () Bool)

(declare-fun c!31631 () Bool)

(assert (=> d!53721 (= c!31631 ((_ is ValueCellFull!1715) (select (arr!3495 (_values!3610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!116339 () V!5137)

(assert (=> d!53721 (= (get!2004 (select (arr!3495 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!116339)))

(declare-fun b!176351 () Bool)

(declare-fun get!2006 (ValueCell!1715 V!5137) V!5137)

(assert (=> b!176351 (= e!116339 (get!2006 (select (arr!3495 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176352 () Bool)

(declare-fun get!2007 (ValueCell!1715 V!5137) V!5137)

(assert (=> b!176352 (= e!116339 (get!2007 (select (arr!3495 (_values!3610 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3627 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53721 c!31631) b!176351))

(assert (= (and d!53721 (not c!31631)) b!176352))

(assert (=> b!176351 m!205125))

(assert (=> b!176351 m!205121))

(declare-fun m!205337 () Bool)

(assert (=> b!176351 m!205337))

(assert (=> b!176352 m!205125))

(assert (=> b!176352 m!205121))

(declare-fun m!205339 () Bool)

(assert (=> b!176352 m!205339))

(assert (=> b!176186 d!53721))

(declare-fun d!53723 () Bool)

(assert (=> d!53723 (isDefined!144 (getValueByKey!192 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(declare-fun lt!87313 () Unit!5397)

(declare-fun choose!952 (List!2207 (_ BitVec 64)) Unit!5397)

(assert (=> d!53723 (= lt!87313 (choose!952 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(declare-fun e!116342 () Bool)

(assert (=> d!53723 e!116342))

(declare-fun res!83559 () Bool)

(assert (=> d!53723 (=> (not res!83559) (not e!116342))))

(declare-fun isStrictlySorted!323 (List!2207) Bool)

(assert (=> d!53723 (= res!83559 (isStrictlySorted!323 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))))))

(assert (=> d!53723 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828) lt!87313)))

(declare-fun b!176355 () Bool)

(assert (=> b!176355 (= e!116342 (containsKey!195 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828))))

(assert (= (and d!53723 res!83559) b!176355))

(assert (=> d!53723 m!205113))

(assert (=> d!53723 m!205113))

(assert (=> d!53723 m!205115))

(declare-fun m!205341 () Bool)

(assert (=> d!53723 m!205341))

(declare-fun m!205343 () Bool)

(assert (=> d!53723 m!205343))

(assert (=> b!176355 m!205109))

(assert (=> b!176130 d!53723))

(assert (=> b!176130 d!53709))

(assert (=> b!176130 d!53711))

(assert (=> d!53661 d!53655))

(declare-fun d!53725 () Bool)

(declare-fun e!116343 () Bool)

(assert (=> d!53725 e!116343))

(declare-fun res!83560 () Bool)

(assert (=> d!53725 (=> res!83560 e!116343)))

(declare-fun lt!87316 () Bool)

(assert (=> d!53725 (= res!83560 (not lt!87316))))

(declare-fun lt!87314 () Bool)

(assert (=> d!53725 (= lt!87316 lt!87314)))

(declare-fun lt!87315 () Unit!5397)

(declare-fun e!116344 () Unit!5397)

(assert (=> d!53725 (= lt!87315 e!116344)))

(declare-fun c!31632 () Bool)

(assert (=> d!53725 (= c!31632 lt!87314)))

(assert (=> d!53725 (= lt!87314 (containsKey!195 (toList!1096 lt!87224) (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53725 (= (contains!1169 lt!87224 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)) lt!87316)))

(declare-fun b!176356 () Bool)

(declare-fun lt!87317 () Unit!5397)

(assert (=> b!176356 (= e!116344 lt!87317)))

(assert (=> b!176356 (= lt!87317 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1096 lt!87224) (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176356 (isDefined!144 (getValueByKey!192 (toList!1096 lt!87224) (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176357 () Bool)

(declare-fun Unit!5402 () Unit!5397)

(assert (=> b!176357 (= e!116344 Unit!5402)))

(declare-fun b!176358 () Bool)

(assert (=> b!176358 (= e!116343 (isDefined!144 (getValueByKey!192 (toList!1096 lt!87224) (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53725 c!31632) b!176356))

(assert (= (and d!53725 (not c!31632)) b!176357))

(assert (= (and d!53725 (not res!83560)) b!176358))

(assert (=> d!53725 m!205119))

(declare-fun m!205345 () Bool)

(assert (=> d!53725 m!205345))

(assert (=> b!176356 m!205119))

(declare-fun m!205347 () Bool)

(assert (=> b!176356 m!205347))

(assert (=> b!176356 m!205119))

(assert (=> b!176356 m!205333))

(assert (=> b!176356 m!205333))

(declare-fun m!205349 () Bool)

(assert (=> b!176356 m!205349))

(assert (=> b!176358 m!205119))

(assert (=> b!176358 m!205333))

(assert (=> b!176358 m!205333))

(assert (=> b!176358 m!205349))

(assert (=> b!176179 d!53725))

(declare-fun bm!17827 () Bool)

(declare-fun call!17830 () Bool)

(assert (=> bm!17827 (= call!17830 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5484 thiss!1248) (mask!8536 thiss!1248)))))

(declare-fun b!176367 () Bool)

(declare-fun e!116351 () Bool)

(declare-fun e!116352 () Bool)

(assert (=> b!176367 (= e!116351 e!116352)))

(declare-fun c!31635 () Bool)

(assert (=> b!176367 (= c!31635 (validKeyInArray!0 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176368 () Bool)

(declare-fun e!116353 () Bool)

(assert (=> b!176368 (= e!116353 call!17830)))

(declare-fun d!53727 () Bool)

(declare-fun res!83565 () Bool)

(assert (=> d!53727 (=> res!83565 e!116351)))

(assert (=> d!53727 (= res!83565 (bvsge #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(assert (=> d!53727 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5484 thiss!1248) (mask!8536 thiss!1248)) e!116351)))

(declare-fun b!176369 () Bool)

(assert (=> b!176369 (= e!116352 call!17830)))

(declare-fun b!176370 () Bool)

(assert (=> b!176370 (= e!116352 e!116353)))

(declare-fun lt!87326 () (_ BitVec 64))

(assert (=> b!176370 (= lt!87326 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87325 () Unit!5397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7363 (_ BitVec 64) (_ BitVec 32)) Unit!5397)

(assert (=> b!176370 (= lt!87325 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5484 thiss!1248) lt!87326 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!176370 (arrayContainsKey!0 (_keys!5484 thiss!1248) lt!87326 #b00000000000000000000000000000000)))

(declare-fun lt!87324 () Unit!5397)

(assert (=> b!176370 (= lt!87324 lt!87325)))

(declare-fun res!83566 () Bool)

(assert (=> b!176370 (= res!83566 (= (seekEntryOrOpen!0 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000) (_keys!5484 thiss!1248) (mask!8536 thiss!1248)) (Found!548 #b00000000000000000000000000000000)))))

(assert (=> b!176370 (=> (not res!83566) (not e!116353))))

(assert (= (and d!53727 (not res!83565)) b!176367))

(assert (= (and b!176367 c!31635) b!176370))

(assert (= (and b!176367 (not c!31635)) b!176369))

(assert (= (and b!176370 res!83566) b!176368))

(assert (= (or b!176368 b!176369) bm!17827))

(declare-fun m!205351 () Bool)

(assert (=> bm!17827 m!205351))

(assert (=> b!176367 m!205119))

(assert (=> b!176367 m!205119))

(assert (=> b!176367 m!205141))

(assert (=> b!176370 m!205119))

(declare-fun m!205353 () Bool)

(assert (=> b!176370 m!205353))

(declare-fun m!205355 () Bool)

(assert (=> b!176370 m!205355))

(assert (=> b!176370 m!205119))

(declare-fun m!205357 () Bool)

(assert (=> b!176370 m!205357))

(assert (=> b!176122 d!53727))

(declare-fun d!53729 () Bool)

(declare-fun e!116354 () Bool)

(assert (=> d!53729 e!116354))

(declare-fun res!83567 () Bool)

(assert (=> d!53729 (=> (not res!83567) (not e!116354))))

(declare-fun lt!87327 () ListLongMap!2161)

(assert (=> d!53729 (= res!83567 (contains!1169 lt!87327 (_1!1625 (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))))

(declare-fun lt!87330 () List!2207)

(assert (=> d!53729 (= lt!87327 (ListLongMap!2162 lt!87330))))

(declare-fun lt!87328 () Unit!5397)

(declare-fun lt!87329 () Unit!5397)

(assert (=> d!53729 (= lt!87328 lt!87329)))

(assert (=> d!53729 (= (getValueByKey!192 lt!87330 (_1!1625 (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))) (Some!197 (_2!1625 (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))))

(assert (=> d!53729 (= lt!87329 (lemmaContainsTupThenGetReturnValue!103 lt!87330 (_1!1625 (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))) (_2!1625 (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))))

(assert (=> d!53729 (= lt!87330 (insertStrictlySorted!106 (toList!1096 (ite c!31583 call!17816 (ite c!31582 call!17818 call!17821))) (_1!1625 (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))) (_2!1625 (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))))))

(assert (=> d!53729 (= (+!253 (ite c!31583 call!17816 (ite c!31582 call!17818 call!17821)) (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))) lt!87327)))

(declare-fun b!176371 () Bool)

(declare-fun res!83568 () Bool)

(assert (=> b!176371 (=> (not res!83568) (not e!116354))))

(assert (=> b!176371 (= res!83568 (= (getValueByKey!192 (toList!1096 lt!87327) (_1!1625 (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248))))) (Some!197 (_2!1625 (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))))

(declare-fun b!176372 () Bool)

(assert (=> b!176372 (= e!116354 (contains!1172 (toList!1096 lt!87327) (ite (or c!31583 c!31582) (tuple2!3229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3468 thiss!1248)) (tuple2!3229 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3468 thiss!1248)))))))

(assert (= (and d!53729 res!83567) b!176371))

(assert (= (and b!176371 res!83568) b!176372))

(declare-fun m!205359 () Bool)

(assert (=> d!53729 m!205359))

(declare-fun m!205361 () Bool)

(assert (=> d!53729 m!205361))

(declare-fun m!205363 () Bool)

(assert (=> d!53729 m!205363))

(declare-fun m!205365 () Bool)

(assert (=> d!53729 m!205365))

(declare-fun m!205367 () Bool)

(assert (=> b!176371 m!205367))

(declare-fun m!205369 () Bool)

(assert (=> b!176372 m!205369))

(assert (=> bm!17815 d!53729))

(declare-fun d!53731 () Bool)

(declare-fun res!83573 () Bool)

(declare-fun e!116359 () Bool)

(assert (=> d!53731 (=> res!83573 e!116359)))

(assert (=> d!53731 (= res!83573 (and ((_ is Cons!2203) (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) (= (_1!1625 (h!2823 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) key!828)))))

(assert (=> d!53731 (= (containsKey!195 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))) key!828) e!116359)))

(declare-fun b!176377 () Bool)

(declare-fun e!116360 () Bool)

(assert (=> b!176377 (= e!116359 e!116360)))

(declare-fun res!83574 () Bool)

(assert (=> b!176377 (=> (not res!83574) (not e!116360))))

(assert (=> b!176377 (= res!83574 (and (or (not ((_ is Cons!2203) (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) (bvsle (_1!1625 (h!2823 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) key!828)) ((_ is Cons!2203) (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) (bvslt (_1!1625 (h!2823 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248))))) key!828)))))

(declare-fun b!176378 () Bool)

(assert (=> b!176378 (= e!116360 (containsKey!195 (t!7021 (toList!1096 (getCurrentListMap!751 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)))) key!828))))

(assert (= (and d!53731 (not res!83573)) b!176377))

(assert (= (and b!176377 res!83574) b!176378))

(declare-fun m!205371 () Bool)

(assert (=> b!176378 m!205371))

(assert (=> d!53659 d!53731))

(declare-fun d!53733 () Bool)

(declare-fun e!116361 () Bool)

(assert (=> d!53733 e!116361))

(declare-fun res!83575 () Bool)

(assert (=> d!53733 (=> res!83575 e!116361)))

(declare-fun lt!87333 () Bool)

(assert (=> d!53733 (= res!83575 (not lt!87333))))

(declare-fun lt!87331 () Bool)

(assert (=> d!53733 (= lt!87333 lt!87331)))

(declare-fun lt!87332 () Unit!5397)

(declare-fun e!116362 () Unit!5397)

(assert (=> d!53733 (= lt!87332 e!116362)))

(declare-fun c!31636 () Bool)

(assert (=> d!53733 (= c!31636 lt!87331)))

(assert (=> d!53733 (= lt!87331 (containsKey!195 (toList!1096 lt!87224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53733 (= (contains!1169 lt!87224 #b1000000000000000000000000000000000000000000000000000000000000000) lt!87333)))

(declare-fun b!176379 () Bool)

(declare-fun lt!87334 () Unit!5397)

(assert (=> b!176379 (= e!116362 lt!87334)))

(assert (=> b!176379 (= lt!87334 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1096 lt!87224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176379 (isDefined!144 (getValueByKey!192 (toList!1096 lt!87224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176380 () Bool)

(declare-fun Unit!5403 () Unit!5397)

(assert (=> b!176380 (= e!116362 Unit!5403)))

(declare-fun b!176381 () Bool)

(assert (=> b!176381 (= e!116361 (isDefined!144 (getValueByKey!192 (toList!1096 lt!87224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53733 c!31636) b!176379))

(assert (= (and d!53733 (not c!31636)) b!176380))

(assert (= (and d!53733 (not res!83575)) b!176381))

(declare-fun m!205373 () Bool)

(assert (=> d!53733 m!205373))

(declare-fun m!205375 () Bool)

(assert (=> b!176379 m!205375))

(assert (=> b!176379 m!205321))

(assert (=> b!176379 m!205321))

(declare-fun m!205377 () Bool)

(assert (=> b!176379 m!205377))

(assert (=> b!176381 m!205321))

(assert (=> b!176381 m!205321))

(assert (=> b!176381 m!205377))

(assert (=> bm!17814 d!53733))

(declare-fun b!176392 () Bool)

(declare-fun e!116373 () Bool)

(declare-fun e!116374 () Bool)

(assert (=> b!176392 (= e!116373 e!116374)))

(declare-fun c!31639 () Bool)

(assert (=> b!176392 (= c!31639 (validKeyInArray!0 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176393 () Bool)

(declare-fun e!116371 () Bool)

(assert (=> b!176393 (= e!116371 e!116373)))

(declare-fun res!83582 () Bool)

(assert (=> b!176393 (=> (not res!83582) (not e!116373))))

(declare-fun e!116372 () Bool)

(assert (=> b!176393 (= res!83582 (not e!116372))))

(declare-fun res!83584 () Bool)

(assert (=> b!176393 (=> (not res!83584) (not e!116372))))

(assert (=> b!176393 (= res!83584 (validKeyInArray!0 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176394 () Bool)

(declare-fun call!17833 () Bool)

(assert (=> b!176394 (= e!116374 call!17833)))

(declare-fun d!53735 () Bool)

(declare-fun res!83583 () Bool)

(assert (=> d!53735 (=> res!83583 e!116371)))

(assert (=> d!53735 (= res!83583 (bvsge #b00000000000000000000000000000000 (size!3797 (_keys!5484 thiss!1248))))))

(assert (=> d!53735 (= (arrayNoDuplicates!0 (_keys!5484 thiss!1248) #b00000000000000000000000000000000 Nil!2207) e!116371)))

(declare-fun b!176395 () Bool)

(assert (=> b!176395 (= e!116374 call!17833)))

(declare-fun b!176396 () Bool)

(declare-fun contains!1173 (List!2210 (_ BitVec 64)) Bool)

(assert (=> b!176396 (= e!116372 (contains!1173 Nil!2207 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17830 () Bool)

(assert (=> bm!17830 (= call!17833 (arrayNoDuplicates!0 (_keys!5484 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31639 (Cons!2206 (select (arr!3494 (_keys!5484 thiss!1248)) #b00000000000000000000000000000000) Nil!2207) Nil!2207)))))

(assert (= (and d!53735 (not res!83583)) b!176393))

(assert (= (and b!176393 res!83584) b!176396))

(assert (= (and b!176393 res!83582) b!176392))

(assert (= (and b!176392 c!31639) b!176394))

(assert (= (and b!176392 (not c!31639)) b!176395))

(assert (= (or b!176394 b!176395) bm!17830))

(assert (=> b!176392 m!205119))

(assert (=> b!176392 m!205119))

(assert (=> b!176392 m!205141))

(assert (=> b!176393 m!205119))

(assert (=> b!176393 m!205119))

(assert (=> b!176393 m!205141))

(assert (=> b!176396 m!205119))

(assert (=> b!176396 m!205119))

(declare-fun m!205379 () Bool)

(assert (=> b!176396 m!205379))

(assert (=> bm!17830 m!205119))

(declare-fun m!205381 () Bool)

(assert (=> bm!17830 m!205381))

(assert (=> b!176123 d!53735))

(declare-fun d!53737 () Bool)

(assert (=> d!53737 (= (apply!136 lt!87224 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2005 (getValueByKey!192 (toList!1096 lt!87224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7290 () Bool)

(assert (= bs!7290 d!53737))

(declare-fun m!205383 () Bool)

(assert (=> bs!7290 m!205383))

(assert (=> bs!7290 m!205383))

(declare-fun m!205385 () Bool)

(assert (=> bs!7290 m!205385))

(assert (=> b!176194 d!53737))

(declare-fun d!53739 () Bool)

(declare-fun e!116375 () Bool)

(assert (=> d!53739 e!116375))

(declare-fun res!83585 () Bool)

(assert (=> d!53739 (=> res!83585 e!116375)))

(declare-fun lt!87337 () Bool)

(assert (=> d!53739 (= res!83585 (not lt!87337))))

(declare-fun lt!87335 () Bool)

(assert (=> d!53739 (= lt!87337 lt!87335)))

(declare-fun lt!87336 () Unit!5397)

(declare-fun e!116376 () Unit!5397)

(assert (=> d!53739 (= lt!87336 e!116376)))

(declare-fun c!31640 () Bool)

(assert (=> d!53739 (= c!31640 lt!87335)))

(assert (=> d!53739 (= lt!87335 (containsKey!195 (toList!1096 lt!87224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53739 (= (contains!1169 lt!87224 #b0000000000000000000000000000000000000000000000000000000000000000) lt!87337)))

(declare-fun b!176397 () Bool)

(declare-fun lt!87338 () Unit!5397)

(assert (=> b!176397 (= e!116376 lt!87338)))

(assert (=> b!176397 (= lt!87338 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1096 lt!87224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176397 (isDefined!144 (getValueByKey!192 (toList!1096 lt!87224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176398 () Bool)

(declare-fun Unit!5404 () Unit!5397)

(assert (=> b!176398 (= e!116376 Unit!5404)))

(declare-fun b!176399 () Bool)

(assert (=> b!176399 (= e!116375 (isDefined!144 (getValueByKey!192 (toList!1096 lt!87224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53739 c!31640) b!176397))

(assert (= (and d!53739 (not c!31640)) b!176398))

(assert (= (and d!53739 (not res!83585)) b!176399))

(declare-fun m!205387 () Bool)

(assert (=> d!53739 m!205387))

(declare-fun m!205389 () Bool)

(assert (=> b!176397 m!205389))

(assert (=> b!176397 m!205383))

(assert (=> b!176397 m!205383))

(declare-fun m!205391 () Bool)

(assert (=> b!176397 m!205391))

(assert (=> b!176399 m!205383))

(assert (=> b!176399 m!205383))

(assert (=> b!176399 m!205391))

(assert (=> bm!17816 d!53739))

(declare-fun b!176401 () Bool)

(declare-fun e!116377 () Bool)

(assert (=> b!176401 (= e!116377 tp_is_empty!4117)))

(declare-fun mapIsEmpty!7035 () Bool)

(declare-fun mapRes!7035 () Bool)

(assert (=> mapIsEmpty!7035 mapRes!7035))

(declare-fun condMapEmpty!7035 () Bool)

(declare-fun mapDefault!7035 () ValueCell!1715)

(assert (=> mapNonEmpty!7034 (= condMapEmpty!7035 (= mapRest!7034 ((as const (Array (_ BitVec 32) ValueCell!1715)) mapDefault!7035)))))

(assert (=> mapNonEmpty!7034 (= tp!15737 (and e!116377 mapRes!7035))))

(declare-fun b!176400 () Bool)

(declare-fun e!116378 () Bool)

(assert (=> b!176400 (= e!116378 tp_is_empty!4117)))

(declare-fun mapNonEmpty!7035 () Bool)

(declare-fun tp!15738 () Bool)

(assert (=> mapNonEmpty!7035 (= mapRes!7035 (and tp!15738 e!116378))))

(declare-fun mapKey!7035 () (_ BitVec 32))

(declare-fun mapRest!7035 () (Array (_ BitVec 32) ValueCell!1715))

(declare-fun mapValue!7035 () ValueCell!1715)

(assert (=> mapNonEmpty!7035 (= mapRest!7034 (store mapRest!7035 mapKey!7035 mapValue!7035))))

(assert (= (and mapNonEmpty!7034 condMapEmpty!7035) mapIsEmpty!7035))

(assert (= (and mapNonEmpty!7034 (not condMapEmpty!7035)) mapNonEmpty!7035))

(assert (= (and mapNonEmpty!7035 ((_ is ValueCellFull!1715) mapValue!7035)) b!176400))

(assert (= (and mapNonEmpty!7034 ((_ is ValueCellFull!1715) mapDefault!7035)) b!176401))

(declare-fun m!205393 () Bool)

(assert (=> mapNonEmpty!7035 m!205393))

(declare-fun b_lambda!7057 () Bool)

(assert (= b_lambda!7053 (or (and b!176038 b_free!4345) b_lambda!7057)))

(declare-fun b_lambda!7059 () Bool)

(assert (= b_lambda!7055 (or (and b!176038 b_free!4345) b_lambda!7059)))

(check-sat (not d!53697) (not b!176234) (not b!176262) (not mapNonEmpty!7035) (not b!176260) (not b!176356) (not d!53737) (not b!176392) (not d!53699) (not b!176399) (not d!53693) (not b!176327) (not d!53725) (not b_next!4345) (not bm!17821) (not b!176251) (not d!53723) (not bm!17824) (not b!176378) (not b!176371) (not b_lambda!7057) (not d!53695) (not b!176272) (not b!176309) (not d!53713) (not b!176370) (not d!53691) (not d!53701) (not d!53733) (not b!176274) (not d!53739) b_and!10857 (not d!53687) (not b!176261) (not b!176233) (not b!176258) (not b!176393) (not b!176379) (not d!53675) (not b!176397) (not b!176235) (not d!53667) (not b!176328) (not b!176343) (not b!176240) (not b!176285) (not b!176264) (not d!53679) (not d!53681) (not b!176358) (not d!53729) (not b!176372) tp_is_empty!4117 (not b!176238) (not d!53719) (not b!176236) (not b!176239) (not d!53683) (not b!176367) (not b!176232) (not d!53717) (not b!176396) (not b_lambda!7059) (not d!53709) (not d!53689) (not b!176351) (not b!176252) (not d!53705) (not d!53677) (not b!176325) (not b!176355) (not d!53685) (not bm!17830) (not b!176381) (not bm!17827) (not b!176271) (not b!176275) (not d!53673) (not b!176352) (not b_lambda!7051) (not d!53715) (not b!176259) (not d!53671))
(check-sat b_and!10857 (not b_next!4345))
