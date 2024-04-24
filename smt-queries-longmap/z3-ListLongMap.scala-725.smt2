; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16930 () Bool)

(assert start!16930)

(declare-fun b!170300 () Bool)

(declare-fun b_free!4189 () Bool)

(declare-fun b_next!4189 () Bool)

(assert (=> b!170300 (= b_free!4189 (not b_next!4189))))

(declare-fun tp!15187 () Bool)

(declare-fun b_and!10617 () Bool)

(assert (=> b!170300 (= tp!15187 b_and!10617)))

(declare-fun b!170294 () Bool)

(declare-fun res!80956 () Bool)

(declare-fun e!112345 () Bool)

(assert (=> b!170294 (=> (not res!80956) (not e!112345))))

(declare-datatypes ((V!4929 0))(
  ( (V!4930 (val!2025 Int)) )
))
(declare-datatypes ((ValueCell!1637 0))(
  ( (ValueCellFull!1637 (v!3891 V!4929)) (EmptyCell!1637) )
))
(declare-datatypes ((array!7015 0))(
  ( (array!7016 (arr!3338 (Array (_ BitVec 32) (_ BitVec 64))) (size!3630 (_ BitVec 32))) )
))
(declare-datatypes ((array!7017 0))(
  ( (array!7018 (arr!3339 (Array (_ BitVec 32) ValueCell!1637)) (size!3631 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2182 0))(
  ( (LongMapFixedSize!2183 (defaultEntry!3533 Int) (mask!8341 (_ BitVec 32)) (extraKeys!3274 (_ BitVec 32)) (zeroValue!3376 V!4929) (minValue!3376 V!4929) (_size!1140 (_ BitVec 32)) (_keys!5362 array!7015) (_values!3516 array!7017) (_vacant!1140 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2182)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170294 (= res!80956 (validMask!0 (mask!8341 thiss!1248)))))

(declare-fun b!170295 () Bool)

(declare-fun e!112344 () Bool)

(declare-fun tp_is_empty!3961 () Bool)

(assert (=> b!170295 (= e!112344 tp_is_empty!3961)))

(declare-fun b!170296 () Bool)

(declare-fun e!112343 () Bool)

(assert (=> b!170296 (= e!112343 tp_is_empty!3961)))

(declare-fun b!170297 () Bool)

(assert (=> b!170297 (= e!112345 (and (= (size!3631 (_values!3516 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8341 thiss!1248))) (= (size!3630 (_keys!5362 thiss!1248)) (size!3631 (_values!3516 thiss!1248))) (bvsge (mask!8341 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3274 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3274 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!170298 () Bool)

(declare-fun e!112341 () Bool)

(declare-fun mapRes!6724 () Bool)

(assert (=> b!170298 (= e!112341 (and e!112343 mapRes!6724))))

(declare-fun condMapEmpty!6724 () Bool)

(declare-fun mapDefault!6724 () ValueCell!1637)

(assert (=> b!170298 (= condMapEmpty!6724 (= (arr!3339 (_values!3516 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1637)) mapDefault!6724)))))

(declare-fun mapNonEmpty!6724 () Bool)

(declare-fun tp!15186 () Bool)

(assert (=> mapNonEmpty!6724 (= mapRes!6724 (and tp!15186 e!112344))))

(declare-fun mapValue!6724 () ValueCell!1637)

(declare-fun mapRest!6724 () (Array (_ BitVec 32) ValueCell!1637))

(declare-fun mapKey!6724 () (_ BitVec 32))

(assert (=> mapNonEmpty!6724 (= (arr!3339 (_values!3516 thiss!1248)) (store mapRest!6724 mapKey!6724 mapValue!6724))))

(declare-fun res!80957 () Bool)

(assert (=> start!16930 (=> (not res!80957) (not e!112345))))

(declare-fun valid!951 (LongMapFixedSize!2182) Bool)

(assert (=> start!16930 (= res!80957 (valid!951 thiss!1248))))

(assert (=> start!16930 e!112345))

(declare-fun e!112342 () Bool)

(assert (=> start!16930 e!112342))

(assert (=> start!16930 true))

(declare-fun b!170299 () Bool)

(declare-fun res!80958 () Bool)

(assert (=> b!170299 (=> (not res!80958) (not e!112345))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170299 (= res!80958 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!6724 () Bool)

(assert (=> mapIsEmpty!6724 mapRes!6724))

(declare-fun array_inv!2147 (array!7015) Bool)

(declare-fun array_inv!2148 (array!7017) Bool)

(assert (=> b!170300 (= e!112342 (and tp!15187 tp_is_empty!3961 (array_inv!2147 (_keys!5362 thiss!1248)) (array_inv!2148 (_values!3516 thiss!1248)) e!112341))))

(assert (= (and start!16930 res!80957) b!170299))

(assert (= (and b!170299 res!80958) b!170294))

(assert (= (and b!170294 res!80956) b!170297))

(assert (= (and b!170298 condMapEmpty!6724) mapIsEmpty!6724))

(assert (= (and b!170298 (not condMapEmpty!6724)) mapNonEmpty!6724))

(get-info :version)

(assert (= (and mapNonEmpty!6724 ((_ is ValueCellFull!1637) mapValue!6724)) b!170295))

(assert (= (and b!170298 ((_ is ValueCellFull!1637) mapDefault!6724)) b!170296))

(assert (= b!170300 b!170298))

(assert (= start!16930 b!170300))

(declare-fun m!199043 () Bool)

(assert (=> b!170294 m!199043))

(declare-fun m!199045 () Bool)

(assert (=> mapNonEmpty!6724 m!199045))

(declare-fun m!199047 () Bool)

(assert (=> start!16930 m!199047))

(declare-fun m!199049 () Bool)

(assert (=> b!170300 m!199049))

(declare-fun m!199051 () Bool)

(assert (=> b!170300 m!199051))

(check-sat (not mapNonEmpty!6724) (not start!16930) (not b!170294) (not b_next!4189) (not b!170300) b_and!10617 tp_is_empty!3961)
(check-sat b_and!10617 (not b_next!4189))
(get-model)

(declare-fun d!51789 () Bool)

(declare-fun res!80983 () Bool)

(declare-fun e!112384 () Bool)

(assert (=> d!51789 (=> (not res!80983) (not e!112384))))

(declare-fun simpleValid!132 (LongMapFixedSize!2182) Bool)

(assert (=> d!51789 (= res!80983 (simpleValid!132 thiss!1248))))

(assert (=> d!51789 (= (valid!951 thiss!1248) e!112384)))

(declare-fun b!170349 () Bool)

(declare-fun res!80984 () Bool)

(assert (=> b!170349 (=> (not res!80984) (not e!112384))))

(declare-fun arrayCountValidKeys!0 (array!7015 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170349 (= res!80984 (= (arrayCountValidKeys!0 (_keys!5362 thiss!1248) #b00000000000000000000000000000000 (size!3630 (_keys!5362 thiss!1248))) (_size!1140 thiss!1248)))))

(declare-fun b!170350 () Bool)

(declare-fun res!80985 () Bool)

(assert (=> b!170350 (=> (not res!80985) (not e!112384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7015 (_ BitVec 32)) Bool)

(assert (=> b!170350 (= res!80985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5362 thiss!1248) (mask!8341 thiss!1248)))))

(declare-fun b!170351 () Bool)

(declare-datatypes ((List!2171 0))(
  ( (Nil!2168) (Cons!2167 (h!2784 (_ BitVec 64)) (t!6965 List!2171)) )
))
(declare-fun arrayNoDuplicates!0 (array!7015 (_ BitVec 32) List!2171) Bool)

(assert (=> b!170351 (= e!112384 (arrayNoDuplicates!0 (_keys!5362 thiss!1248) #b00000000000000000000000000000000 Nil!2168))))

(assert (= (and d!51789 res!80983) b!170349))

(assert (= (and b!170349 res!80984) b!170350))

(assert (= (and b!170350 res!80985) b!170351))

(declare-fun m!199073 () Bool)

(assert (=> d!51789 m!199073))

(declare-fun m!199075 () Bool)

(assert (=> b!170349 m!199075))

(declare-fun m!199077 () Bool)

(assert (=> b!170350 m!199077))

(declare-fun m!199079 () Bool)

(assert (=> b!170351 m!199079))

(assert (=> start!16930 d!51789))

(declare-fun d!51791 () Bool)

(assert (=> d!51791 (= (array_inv!2147 (_keys!5362 thiss!1248)) (bvsge (size!3630 (_keys!5362 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170300 d!51791))

(declare-fun d!51793 () Bool)

(assert (=> d!51793 (= (array_inv!2148 (_values!3516 thiss!1248)) (bvsge (size!3631 (_values!3516 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170300 d!51793))

(declare-fun d!51795 () Bool)

(assert (=> d!51795 (= (validMask!0 (mask!8341 thiss!1248)) (and (or (= (mask!8341 thiss!1248) #b00000000000000000000000000000111) (= (mask!8341 thiss!1248) #b00000000000000000000000000001111) (= (mask!8341 thiss!1248) #b00000000000000000000000000011111) (= (mask!8341 thiss!1248) #b00000000000000000000000000111111) (= (mask!8341 thiss!1248) #b00000000000000000000000001111111) (= (mask!8341 thiss!1248) #b00000000000000000000000011111111) (= (mask!8341 thiss!1248) #b00000000000000000000000111111111) (= (mask!8341 thiss!1248) #b00000000000000000000001111111111) (= (mask!8341 thiss!1248) #b00000000000000000000011111111111) (= (mask!8341 thiss!1248) #b00000000000000000000111111111111) (= (mask!8341 thiss!1248) #b00000000000000000001111111111111) (= (mask!8341 thiss!1248) #b00000000000000000011111111111111) (= (mask!8341 thiss!1248) #b00000000000000000111111111111111) (= (mask!8341 thiss!1248) #b00000000000000001111111111111111) (= (mask!8341 thiss!1248) #b00000000000000011111111111111111) (= (mask!8341 thiss!1248) #b00000000000000111111111111111111) (= (mask!8341 thiss!1248) #b00000000000001111111111111111111) (= (mask!8341 thiss!1248) #b00000000000011111111111111111111) (= (mask!8341 thiss!1248) #b00000000000111111111111111111111) (= (mask!8341 thiss!1248) #b00000000001111111111111111111111) (= (mask!8341 thiss!1248) #b00000000011111111111111111111111) (= (mask!8341 thiss!1248) #b00000000111111111111111111111111) (= (mask!8341 thiss!1248) #b00000001111111111111111111111111) (= (mask!8341 thiss!1248) #b00000011111111111111111111111111) (= (mask!8341 thiss!1248) #b00000111111111111111111111111111) (= (mask!8341 thiss!1248) #b00001111111111111111111111111111) (= (mask!8341 thiss!1248) #b00011111111111111111111111111111) (= (mask!8341 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8341 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170294 d!51795))

(declare-fun condMapEmpty!6733 () Bool)

(declare-fun mapDefault!6733 () ValueCell!1637)

(assert (=> mapNonEmpty!6724 (= condMapEmpty!6733 (= mapRest!6724 ((as const (Array (_ BitVec 32) ValueCell!1637)) mapDefault!6733)))))

(declare-fun e!112390 () Bool)

(declare-fun mapRes!6733 () Bool)

(assert (=> mapNonEmpty!6724 (= tp!15186 (and e!112390 mapRes!6733))))

(declare-fun b!170359 () Bool)

(assert (=> b!170359 (= e!112390 tp_is_empty!3961)))

(declare-fun mapNonEmpty!6733 () Bool)

(declare-fun tp!15202 () Bool)

(declare-fun e!112389 () Bool)

(assert (=> mapNonEmpty!6733 (= mapRes!6733 (and tp!15202 e!112389))))

(declare-fun mapKey!6733 () (_ BitVec 32))

(declare-fun mapRest!6733 () (Array (_ BitVec 32) ValueCell!1637))

(declare-fun mapValue!6733 () ValueCell!1637)

(assert (=> mapNonEmpty!6733 (= mapRest!6724 (store mapRest!6733 mapKey!6733 mapValue!6733))))

(declare-fun b!170358 () Bool)

(assert (=> b!170358 (= e!112389 tp_is_empty!3961)))

(declare-fun mapIsEmpty!6733 () Bool)

(assert (=> mapIsEmpty!6733 mapRes!6733))

(assert (= (and mapNonEmpty!6724 condMapEmpty!6733) mapIsEmpty!6733))

(assert (= (and mapNonEmpty!6724 (not condMapEmpty!6733)) mapNonEmpty!6733))

(assert (= (and mapNonEmpty!6733 ((_ is ValueCellFull!1637) mapValue!6733)) b!170358))

(assert (= (and mapNonEmpty!6724 ((_ is ValueCellFull!1637) mapDefault!6733)) b!170359))

(declare-fun m!199081 () Bool)

(assert (=> mapNonEmpty!6733 m!199081))

(check-sat (not b!170350) (not b!170351) (not mapNonEmpty!6733) (not d!51789) (not b!170349) (not b_next!4189) b_and!10617 tp_is_empty!3961)
(check-sat b_and!10617 (not b_next!4189))
(get-model)

(declare-fun b!170370 () Bool)

(declare-fun e!112401 () Bool)

(declare-fun e!112399 () Bool)

(assert (=> b!170370 (= e!112401 e!112399)))

(declare-fun res!80992 () Bool)

(assert (=> b!170370 (=> (not res!80992) (not e!112399))))

(declare-fun e!112400 () Bool)

(assert (=> b!170370 (= res!80992 (not e!112400))))

(declare-fun res!80993 () Bool)

(assert (=> b!170370 (=> (not res!80993) (not e!112400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170370 (= res!80993 (validKeyInArray!0 (select (arr!3338 (_keys!5362 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170371 () Bool)

(declare-fun e!112402 () Bool)

(declare-fun call!17362 () Bool)

(assert (=> b!170371 (= e!112402 call!17362)))

(declare-fun b!170372 () Bool)

(assert (=> b!170372 (= e!112399 e!112402)))

(declare-fun c!30491 () Bool)

(assert (=> b!170372 (= c!30491 (validKeyInArray!0 (select (arr!3338 (_keys!5362 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170373 () Bool)

(declare-fun contains!1137 (List!2171 (_ BitVec 64)) Bool)

(assert (=> b!170373 (= e!112400 (contains!1137 Nil!2168 (select (arr!3338 (_keys!5362 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51797 () Bool)

(declare-fun res!80994 () Bool)

(assert (=> d!51797 (=> res!80994 e!112401)))

(assert (=> d!51797 (= res!80994 (bvsge #b00000000000000000000000000000000 (size!3630 (_keys!5362 thiss!1248))))))

(assert (=> d!51797 (= (arrayNoDuplicates!0 (_keys!5362 thiss!1248) #b00000000000000000000000000000000 Nil!2168) e!112401)))

(declare-fun b!170374 () Bool)

(assert (=> b!170374 (= e!112402 call!17362)))

(declare-fun bm!17359 () Bool)

(assert (=> bm!17359 (= call!17362 (arrayNoDuplicates!0 (_keys!5362 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30491 (Cons!2167 (select (arr!3338 (_keys!5362 thiss!1248)) #b00000000000000000000000000000000) Nil!2168) Nil!2168)))))

(assert (= (and d!51797 (not res!80994)) b!170370))

(assert (= (and b!170370 res!80993) b!170373))

(assert (= (and b!170370 res!80992) b!170372))

(assert (= (and b!170372 c!30491) b!170371))

(assert (= (and b!170372 (not c!30491)) b!170374))

(assert (= (or b!170371 b!170374) bm!17359))

(declare-fun m!199083 () Bool)

(assert (=> b!170370 m!199083))

(assert (=> b!170370 m!199083))

(declare-fun m!199085 () Bool)

(assert (=> b!170370 m!199085))

(assert (=> b!170372 m!199083))

(assert (=> b!170372 m!199083))

(assert (=> b!170372 m!199085))

(assert (=> b!170373 m!199083))

(assert (=> b!170373 m!199083))

(declare-fun m!199087 () Bool)

(assert (=> b!170373 m!199087))

(assert (=> bm!17359 m!199083))

(declare-fun m!199089 () Bool)

(assert (=> bm!17359 m!199089))

(assert (=> b!170351 d!51797))

(declare-fun b!170383 () Bool)

(declare-fun res!81003 () Bool)

(declare-fun e!112405 () Bool)

(assert (=> b!170383 (=> (not res!81003) (not e!112405))))

(assert (=> b!170383 (= res!81003 (and (= (size!3631 (_values!3516 thiss!1248)) (bvadd (mask!8341 thiss!1248) #b00000000000000000000000000000001)) (= (size!3630 (_keys!5362 thiss!1248)) (size!3631 (_values!3516 thiss!1248))) (bvsge (_size!1140 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1140 thiss!1248) (bvadd (mask!8341 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!170385 () Bool)

(declare-fun res!81005 () Bool)

(assert (=> b!170385 (=> (not res!81005) (not e!112405))))

(declare-fun size!3636 (LongMapFixedSize!2182) (_ BitVec 32))

(assert (=> b!170385 (= res!81005 (= (size!3636 thiss!1248) (bvadd (_size!1140 thiss!1248) (bvsdiv (bvadd (extraKeys!3274 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!170384 () Bool)

(declare-fun res!81004 () Bool)

(assert (=> b!170384 (=> (not res!81004) (not e!112405))))

(assert (=> b!170384 (= res!81004 (bvsge (size!3636 thiss!1248) (_size!1140 thiss!1248)))))

(declare-fun b!170386 () Bool)

(assert (=> b!170386 (= e!112405 (and (bvsge (extraKeys!3274 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3274 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1140 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!51799 () Bool)

(declare-fun res!81006 () Bool)

(assert (=> d!51799 (=> (not res!81006) (not e!112405))))

(assert (=> d!51799 (= res!81006 (validMask!0 (mask!8341 thiss!1248)))))

(assert (=> d!51799 (= (simpleValid!132 thiss!1248) e!112405)))

(assert (= (and d!51799 res!81006) b!170383))

(assert (= (and b!170383 res!81003) b!170384))

(assert (= (and b!170384 res!81004) b!170385))

(assert (= (and b!170385 res!81005) b!170386))

(declare-fun m!199091 () Bool)

(assert (=> b!170385 m!199091))

(assert (=> b!170384 m!199091))

(assert (=> d!51799 m!199043))

(assert (=> d!51789 d!51799))

(declare-fun b!170395 () Bool)

(declare-fun e!112414 () Bool)

(declare-fun call!17365 () Bool)

(assert (=> b!170395 (= e!112414 call!17365)))

(declare-fun b!170396 () Bool)

(declare-fun e!112412 () Bool)

(assert (=> b!170396 (= e!112412 call!17365)))

(declare-fun b!170397 () Bool)

(assert (=> b!170397 (= e!112412 e!112414)))

(declare-fun lt!85065 () (_ BitVec 64))

(assert (=> b!170397 (= lt!85065 (select (arr!3338 (_keys!5362 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5245 0))(
  ( (Unit!5246) )
))
(declare-fun lt!85063 () Unit!5245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7015 (_ BitVec 64) (_ BitVec 32)) Unit!5245)

(assert (=> b!170397 (= lt!85063 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5362 thiss!1248) lt!85065 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170397 (arrayContainsKey!0 (_keys!5362 thiss!1248) lt!85065 #b00000000000000000000000000000000)))

(declare-fun lt!85064 () Unit!5245)

(assert (=> b!170397 (= lt!85064 lt!85063)))

(declare-fun res!81011 () Bool)

(declare-datatypes ((SeekEntryResult!525 0))(
  ( (MissingZero!525 (index!4268 (_ BitVec 32))) (Found!525 (index!4269 (_ BitVec 32))) (Intermediate!525 (undefined!1337 Bool) (index!4270 (_ BitVec 32)) (x!18855 (_ BitVec 32))) (Undefined!525) (MissingVacant!525 (index!4271 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7015 (_ BitVec 32)) SeekEntryResult!525)

(assert (=> b!170397 (= res!81011 (= (seekEntryOrOpen!0 (select (arr!3338 (_keys!5362 thiss!1248)) #b00000000000000000000000000000000) (_keys!5362 thiss!1248) (mask!8341 thiss!1248)) (Found!525 #b00000000000000000000000000000000)))))

(assert (=> b!170397 (=> (not res!81011) (not e!112414))))

(declare-fun bm!17362 () Bool)

(assert (=> bm!17362 (= call!17365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5362 thiss!1248) (mask!8341 thiss!1248)))))

(declare-fun d!51801 () Bool)

(declare-fun res!81012 () Bool)

(declare-fun e!112413 () Bool)

(assert (=> d!51801 (=> res!81012 e!112413)))

(assert (=> d!51801 (= res!81012 (bvsge #b00000000000000000000000000000000 (size!3630 (_keys!5362 thiss!1248))))))

(assert (=> d!51801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5362 thiss!1248) (mask!8341 thiss!1248)) e!112413)))

(declare-fun b!170398 () Bool)

(assert (=> b!170398 (= e!112413 e!112412)))

(declare-fun c!30494 () Bool)

(assert (=> b!170398 (= c!30494 (validKeyInArray!0 (select (arr!3338 (_keys!5362 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51801 (not res!81012)) b!170398))

(assert (= (and b!170398 c!30494) b!170397))

(assert (= (and b!170398 (not c!30494)) b!170396))

(assert (= (and b!170397 res!81011) b!170395))

(assert (= (or b!170395 b!170396) bm!17362))

(assert (=> b!170397 m!199083))

(declare-fun m!199093 () Bool)

(assert (=> b!170397 m!199093))

(declare-fun m!199095 () Bool)

(assert (=> b!170397 m!199095))

(assert (=> b!170397 m!199083))

(declare-fun m!199097 () Bool)

(assert (=> b!170397 m!199097))

(declare-fun m!199099 () Bool)

(assert (=> bm!17362 m!199099))

(assert (=> b!170398 m!199083))

(assert (=> b!170398 m!199083))

(assert (=> b!170398 m!199085))

(assert (=> b!170350 d!51801))

(declare-fun b!170407 () Bool)

(declare-fun e!112420 () (_ BitVec 32))

(assert (=> b!170407 (= e!112420 #b00000000000000000000000000000000)))

(declare-fun b!170408 () Bool)

(declare-fun e!112419 () (_ BitVec 32))

(declare-fun call!17368 () (_ BitVec 32))

(assert (=> b!170408 (= e!112419 call!17368)))

(declare-fun bm!17365 () Bool)

(assert (=> bm!17365 (= call!17368 (arrayCountValidKeys!0 (_keys!5362 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3630 (_keys!5362 thiss!1248))))))

(declare-fun b!170409 () Bool)

(assert (=> b!170409 (= e!112419 (bvadd #b00000000000000000000000000000001 call!17368))))

(declare-fun b!170410 () Bool)

(assert (=> b!170410 (= e!112420 e!112419)))

(declare-fun c!30499 () Bool)

(assert (=> b!170410 (= c!30499 (validKeyInArray!0 (select (arr!3338 (_keys!5362 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51803 () Bool)

(declare-fun lt!85068 () (_ BitVec 32))

(assert (=> d!51803 (and (bvsge lt!85068 #b00000000000000000000000000000000) (bvsle lt!85068 (bvsub (size!3630 (_keys!5362 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51803 (= lt!85068 e!112420)))

(declare-fun c!30500 () Bool)

(assert (=> d!51803 (= c!30500 (bvsge #b00000000000000000000000000000000 (size!3630 (_keys!5362 thiss!1248))))))

(assert (=> d!51803 (and (bvsle #b00000000000000000000000000000000 (size!3630 (_keys!5362 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3630 (_keys!5362 thiss!1248)) (size!3630 (_keys!5362 thiss!1248))))))

(assert (=> d!51803 (= (arrayCountValidKeys!0 (_keys!5362 thiss!1248) #b00000000000000000000000000000000 (size!3630 (_keys!5362 thiss!1248))) lt!85068)))

(assert (= (and d!51803 c!30500) b!170407))

(assert (= (and d!51803 (not c!30500)) b!170410))

(assert (= (and b!170410 c!30499) b!170409))

(assert (= (and b!170410 (not c!30499)) b!170408))

(assert (= (or b!170409 b!170408) bm!17365))

(declare-fun m!199101 () Bool)

(assert (=> bm!17365 m!199101))

(assert (=> b!170410 m!199083))

(assert (=> b!170410 m!199083))

(assert (=> b!170410 m!199085))

(assert (=> b!170349 d!51803))

(declare-fun condMapEmpty!6734 () Bool)

(declare-fun mapDefault!6734 () ValueCell!1637)

(assert (=> mapNonEmpty!6733 (= condMapEmpty!6734 (= mapRest!6733 ((as const (Array (_ BitVec 32) ValueCell!1637)) mapDefault!6734)))))

(declare-fun e!112422 () Bool)

(declare-fun mapRes!6734 () Bool)

(assert (=> mapNonEmpty!6733 (= tp!15202 (and e!112422 mapRes!6734))))

(declare-fun b!170412 () Bool)

(assert (=> b!170412 (= e!112422 tp_is_empty!3961)))

(declare-fun mapNonEmpty!6734 () Bool)

(declare-fun tp!15203 () Bool)

(declare-fun e!112421 () Bool)

(assert (=> mapNonEmpty!6734 (= mapRes!6734 (and tp!15203 e!112421))))

(declare-fun mapValue!6734 () ValueCell!1637)

(declare-fun mapKey!6734 () (_ BitVec 32))

(declare-fun mapRest!6734 () (Array (_ BitVec 32) ValueCell!1637))

(assert (=> mapNonEmpty!6734 (= mapRest!6733 (store mapRest!6734 mapKey!6734 mapValue!6734))))

(declare-fun b!170411 () Bool)

(assert (=> b!170411 (= e!112421 tp_is_empty!3961)))

(declare-fun mapIsEmpty!6734 () Bool)

(assert (=> mapIsEmpty!6734 mapRes!6734))

(assert (= (and mapNonEmpty!6733 condMapEmpty!6734) mapIsEmpty!6734))

(assert (= (and mapNonEmpty!6733 (not condMapEmpty!6734)) mapNonEmpty!6734))

(assert (= (and mapNonEmpty!6734 ((_ is ValueCellFull!1637) mapValue!6734)) b!170411))

(assert (= (and mapNonEmpty!6733 ((_ is ValueCellFull!1637) mapDefault!6734)) b!170412))

(declare-fun m!199103 () Bool)

(assert (=> mapNonEmpty!6734 m!199103))

(check-sat (not b!170385) (not mapNonEmpty!6734) (not bm!17359) (not b!170398) (not b!170372) (not bm!17362) (not b!170384) (not b_next!4189) (not b!170373) (not b!170370) (not b!170410) (not bm!17365) (not b!170397) (not d!51799) b_and!10617 tp_is_empty!3961)
(check-sat b_and!10617 (not b_next!4189))
