; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80216 () Bool)

(assert start!80216)

(declare-fun b!942325 () Bool)

(declare-fun b_free!17943 () Bool)

(declare-fun b_next!17943 () Bool)

(assert (=> b!942325 (= b_free!17943 (not b_next!17943))))

(declare-fun tp!62328 () Bool)

(declare-fun b_and!29355 () Bool)

(assert (=> b!942325 (= tp!62328 b_and!29355)))

(declare-fun b!942322 () Bool)

(declare-fun e!529824 () Bool)

(declare-fun tp_is_empty!20451 () Bool)

(assert (=> b!942322 (= e!529824 tp_is_empty!20451)))

(declare-fun b!942323 () Bool)

(declare-fun res!633251 () Bool)

(declare-fun e!529819 () Bool)

(assert (=> b!942323 (=> (not res!633251) (not e!529819))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942323 (= res!633251 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942324 () Bool)

(declare-fun res!633247 () Bool)

(assert (=> b!942324 (=> (not res!633247) (not e!529819))))

(declare-datatypes ((V!32233 0))(
  ( (V!32234 (val!10276 Int)) )
))
(declare-datatypes ((ValueCell!9744 0))(
  ( (ValueCellFull!9744 (v!12807 V!32233)) (EmptyCell!9744) )
))
(declare-datatypes ((array!56864 0))(
  ( (array!56865 (arr!27360 (Array (_ BitVec 32) ValueCell!9744)) (size!27825 (_ BitVec 32))) )
))
(declare-datatypes ((array!56866 0))(
  ( (array!56867 (arr!27361 (Array (_ BitVec 32) (_ BitVec 64))) (size!27826 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4638 0))(
  ( (LongMapFixedSize!4639 (defaultEntry!5610 Int) (mask!27212 (_ BitVec 32)) (extraKeys!5342 (_ BitVec 32)) (zeroValue!5446 V!32233) (minValue!5446 V!32233) (_size!2374 (_ BitVec 32)) (_keys!10480 array!56866) (_values!5633 array!56864) (_vacant!2374 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4638)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942324 (= res!633247 (validMask!0 (mask!27212 thiss!1141)))))

(declare-fun e!529821 () Bool)

(declare-fun e!529823 () Bool)

(declare-fun array_inv!21260 (array!56866) Bool)

(declare-fun array_inv!21261 (array!56864) Bool)

(assert (=> b!942325 (= e!529823 (and tp!62328 tp_is_empty!20451 (array_inv!21260 (_keys!10480 thiss!1141)) (array_inv!21261 (_values!5633 thiss!1141)) e!529821))))

(declare-fun b!942326 () Bool)

(declare-fun res!633246 () Bool)

(assert (=> b!942326 (=> (not res!633246) (not e!529819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56866 (_ BitVec 32)) Bool)

(assert (=> b!942326 (= res!633246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10480 thiss!1141) (mask!27212 thiss!1141)))))

(declare-fun b!942327 () Bool)

(declare-fun mapRes!32492 () Bool)

(assert (=> b!942327 (= e!529821 (and e!529824 mapRes!32492))))

(declare-fun condMapEmpty!32492 () Bool)

(declare-fun mapDefault!32492 () ValueCell!9744)

(assert (=> b!942327 (= condMapEmpty!32492 (= (arr!27360 (_values!5633 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9744)) mapDefault!32492)))))

(declare-fun mapIsEmpty!32492 () Bool)

(assert (=> mapIsEmpty!32492 mapRes!32492))

(declare-fun res!633249 () Bool)

(assert (=> start!80216 (=> (not res!633249) (not e!529819))))

(declare-fun valid!1775 (LongMapFixedSize!4638) Bool)

(assert (=> start!80216 (= res!633249 (valid!1775 thiss!1141))))

(assert (=> start!80216 e!529819))

(assert (=> start!80216 e!529823))

(assert (=> start!80216 true))

(declare-fun b!942328 () Bool)

(declare-fun res!633250 () Bool)

(assert (=> b!942328 (=> (not res!633250) (not e!529819))))

(assert (=> b!942328 (= res!633250 (and (= (size!27825 (_values!5633 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27212 thiss!1141))) (= (size!27826 (_keys!10480 thiss!1141)) (size!27825 (_values!5633 thiss!1141))) (bvsge (mask!27212 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5342 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5342 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942329 () Bool)

(declare-datatypes ((List!19212 0))(
  ( (Nil!19209) (Cons!19208 (h!20358 (_ BitVec 64)) (t!27527 List!19212)) )
))
(declare-fun arrayNoDuplicates!0 (array!56866 (_ BitVec 32) List!19212) Bool)

(assert (=> b!942329 (= e!529819 (not (arrayNoDuplicates!0 (_keys!10480 thiss!1141) #b00000000000000000000000000000000 Nil!19209)))))

(declare-fun b!942330 () Bool)

(declare-fun e!529820 () Bool)

(assert (=> b!942330 (= e!529820 tp_is_empty!20451)))

(declare-fun mapNonEmpty!32492 () Bool)

(declare-fun tp!62329 () Bool)

(assert (=> mapNonEmpty!32492 (= mapRes!32492 (and tp!62329 e!529820))))

(declare-fun mapValue!32492 () ValueCell!9744)

(declare-fun mapRest!32492 () (Array (_ BitVec 32) ValueCell!9744))

(declare-fun mapKey!32492 () (_ BitVec 32))

(assert (=> mapNonEmpty!32492 (= (arr!27360 (_values!5633 thiss!1141)) (store mapRest!32492 mapKey!32492 mapValue!32492))))

(declare-fun b!942331 () Bool)

(declare-fun res!633248 () Bool)

(assert (=> b!942331 (=> (not res!633248) (not e!529819))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9031 0))(
  ( (MissingZero!9031 (index!38495 (_ BitVec 32))) (Found!9031 (index!38496 (_ BitVec 32))) (Intermediate!9031 (undefined!9843 Bool) (index!38497 (_ BitVec 32)) (x!80904 (_ BitVec 32))) (Undefined!9031) (MissingVacant!9031 (index!38498 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56866 (_ BitVec 32)) SeekEntryResult!9031)

(assert (=> b!942331 (= res!633248 (not ((_ is Found!9031) (seekEntry!0 key!756 (_keys!10480 thiss!1141) (mask!27212 thiss!1141)))))))

(assert (= (and start!80216 res!633249) b!942323))

(assert (= (and b!942323 res!633251) b!942331))

(assert (= (and b!942331 res!633248) b!942324))

(assert (= (and b!942324 res!633247) b!942328))

(assert (= (and b!942328 res!633250) b!942326))

(assert (= (and b!942326 res!633246) b!942329))

(assert (= (and b!942327 condMapEmpty!32492) mapIsEmpty!32492))

(assert (= (and b!942327 (not condMapEmpty!32492)) mapNonEmpty!32492))

(assert (= (and mapNonEmpty!32492 ((_ is ValueCellFull!9744) mapValue!32492)) b!942330))

(assert (= (and b!942327 ((_ is ValueCellFull!9744) mapDefault!32492)) b!942322))

(assert (= b!942325 b!942327))

(assert (= start!80216 b!942325))

(declare-fun m!876955 () Bool)

(assert (=> b!942329 m!876955))

(declare-fun m!876957 () Bool)

(assert (=> mapNonEmpty!32492 m!876957))

(declare-fun m!876959 () Bool)

(assert (=> b!942331 m!876959))

(declare-fun m!876961 () Bool)

(assert (=> b!942326 m!876961))

(declare-fun m!876963 () Bool)

(assert (=> start!80216 m!876963))

(declare-fun m!876965 () Bool)

(assert (=> b!942324 m!876965))

(declare-fun m!876967 () Bool)

(assert (=> b!942325 m!876967))

(declare-fun m!876969 () Bool)

(assert (=> b!942325 m!876969))

(check-sat (not b!942331) (not b!942324) (not b!942329) tp_is_empty!20451 b_and!29355 (not start!80216) (not b!942326) (not b_next!17943) (not b!942325) (not mapNonEmpty!32492))
(check-sat b_and!29355 (not b_next!17943))
(get-model)

(declare-fun d!114173 () Bool)

(assert (=> d!114173 (= (array_inv!21260 (_keys!10480 thiss!1141)) (bvsge (size!27826 (_keys!10480 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942325 d!114173))

(declare-fun d!114175 () Bool)

(assert (=> d!114175 (= (array_inv!21261 (_values!5633 thiss!1141)) (bvsge (size!27825 (_values!5633 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942325 d!114175))

(declare-fun b!942372 () Bool)

(declare-fun e!529851 () Bool)

(declare-fun e!529853 () Bool)

(assert (=> b!942372 (= e!529851 e!529853)))

(declare-fun res!633276 () Bool)

(assert (=> b!942372 (=> (not res!633276) (not e!529853))))

(declare-fun e!529852 () Bool)

(assert (=> b!942372 (= res!633276 (not e!529852))))

(declare-fun res!633277 () Bool)

(assert (=> b!942372 (=> (not res!633277) (not e!529852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942372 (= res!633277 (validKeyInArray!0 (select (arr!27361 (_keys!10480 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942374 () Bool)

(declare-fun e!529854 () Bool)

(assert (=> b!942374 (= e!529853 e!529854)))

(declare-fun c!98215 () Bool)

(assert (=> b!942374 (= c!98215 (validKeyInArray!0 (select (arr!27361 (_keys!10480 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942375 () Bool)

(declare-fun call!40956 () Bool)

(assert (=> b!942375 (= e!529854 call!40956)))

(declare-fun bm!40953 () Bool)

(assert (=> bm!40953 (= call!40956 (arrayNoDuplicates!0 (_keys!10480 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98215 (Cons!19208 (select (arr!27361 (_keys!10480 thiss!1141)) #b00000000000000000000000000000000) Nil!19209) Nil!19209)))))

(declare-fun b!942376 () Bool)

(declare-fun contains!5135 (List!19212 (_ BitVec 64)) Bool)

(assert (=> b!942376 (= e!529852 (contains!5135 Nil!19209 (select (arr!27361 (_keys!10480 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114177 () Bool)

(declare-fun res!633278 () Bool)

(assert (=> d!114177 (=> res!633278 e!529851)))

(assert (=> d!114177 (= res!633278 (bvsge #b00000000000000000000000000000000 (size!27826 (_keys!10480 thiss!1141))))))

(assert (=> d!114177 (= (arrayNoDuplicates!0 (_keys!10480 thiss!1141) #b00000000000000000000000000000000 Nil!19209) e!529851)))

(declare-fun b!942373 () Bool)

(assert (=> b!942373 (= e!529854 call!40956)))

(assert (= (and d!114177 (not res!633278)) b!942372))

(assert (= (and b!942372 res!633277) b!942376))

(assert (= (and b!942372 res!633276) b!942374))

(assert (= (and b!942374 c!98215) b!942373))

(assert (= (and b!942374 (not c!98215)) b!942375))

(assert (= (or b!942373 b!942375) bm!40953))

(declare-fun m!876987 () Bool)

(assert (=> b!942372 m!876987))

(assert (=> b!942372 m!876987))

(declare-fun m!876989 () Bool)

(assert (=> b!942372 m!876989))

(assert (=> b!942374 m!876987))

(assert (=> b!942374 m!876987))

(assert (=> b!942374 m!876989))

(assert (=> bm!40953 m!876987))

(declare-fun m!876991 () Bool)

(assert (=> bm!40953 m!876991))

(assert (=> b!942376 m!876987))

(assert (=> b!942376 m!876987))

(declare-fun m!876993 () Bool)

(assert (=> b!942376 m!876993))

(assert (=> b!942329 d!114177))

(declare-fun d!114179 () Bool)

(assert (=> d!114179 (= (validMask!0 (mask!27212 thiss!1141)) (and (or (= (mask!27212 thiss!1141) #b00000000000000000000000000000111) (= (mask!27212 thiss!1141) #b00000000000000000000000000001111) (= (mask!27212 thiss!1141) #b00000000000000000000000000011111) (= (mask!27212 thiss!1141) #b00000000000000000000000000111111) (= (mask!27212 thiss!1141) #b00000000000000000000000001111111) (= (mask!27212 thiss!1141) #b00000000000000000000000011111111) (= (mask!27212 thiss!1141) #b00000000000000000000000111111111) (= (mask!27212 thiss!1141) #b00000000000000000000001111111111) (= (mask!27212 thiss!1141) #b00000000000000000000011111111111) (= (mask!27212 thiss!1141) #b00000000000000000000111111111111) (= (mask!27212 thiss!1141) #b00000000000000000001111111111111) (= (mask!27212 thiss!1141) #b00000000000000000011111111111111) (= (mask!27212 thiss!1141) #b00000000000000000111111111111111) (= (mask!27212 thiss!1141) #b00000000000000001111111111111111) (= (mask!27212 thiss!1141) #b00000000000000011111111111111111) (= (mask!27212 thiss!1141) #b00000000000000111111111111111111) (= (mask!27212 thiss!1141) #b00000000000001111111111111111111) (= (mask!27212 thiss!1141) #b00000000000011111111111111111111) (= (mask!27212 thiss!1141) #b00000000000111111111111111111111) (= (mask!27212 thiss!1141) #b00000000001111111111111111111111) (= (mask!27212 thiss!1141) #b00000000011111111111111111111111) (= (mask!27212 thiss!1141) #b00000000111111111111111111111111) (= (mask!27212 thiss!1141) #b00000001111111111111111111111111) (= (mask!27212 thiss!1141) #b00000011111111111111111111111111) (= (mask!27212 thiss!1141) #b00000111111111111111111111111111) (= (mask!27212 thiss!1141) #b00001111111111111111111111111111) (= (mask!27212 thiss!1141) #b00011111111111111111111111111111) (= (mask!27212 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27212 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942324 d!114179))

(declare-fun b!942385 () Bool)

(declare-fun e!529861 () Bool)

(declare-fun e!529862 () Bool)

(assert (=> b!942385 (= e!529861 e!529862)))

(declare-fun c!98218 () Bool)

(assert (=> b!942385 (= c!98218 (validKeyInArray!0 (select (arr!27361 (_keys!10480 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114181 () Bool)

(declare-fun res!633284 () Bool)

(assert (=> d!114181 (=> res!633284 e!529861)))

(assert (=> d!114181 (= res!633284 (bvsge #b00000000000000000000000000000000 (size!27826 (_keys!10480 thiss!1141))))))

(assert (=> d!114181 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10480 thiss!1141) (mask!27212 thiss!1141)) e!529861)))

(declare-fun bm!40956 () Bool)

(declare-fun call!40959 () Bool)

(assert (=> bm!40956 (= call!40959 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10480 thiss!1141) (mask!27212 thiss!1141)))))

(declare-fun b!942386 () Bool)

(assert (=> b!942386 (= e!529862 call!40959)))

(declare-fun b!942387 () Bool)

(declare-fun e!529863 () Bool)

(assert (=> b!942387 (= e!529863 call!40959)))

(declare-fun b!942388 () Bool)

(assert (=> b!942388 (= e!529862 e!529863)))

(declare-fun lt!425141 () (_ BitVec 64))

(assert (=> b!942388 (= lt!425141 (select (arr!27361 (_keys!10480 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31810 0))(
  ( (Unit!31811) )
))
(declare-fun lt!425142 () Unit!31810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56866 (_ BitVec 64) (_ BitVec 32)) Unit!31810)

(assert (=> b!942388 (= lt!425142 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10480 thiss!1141) lt!425141 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942388 (arrayContainsKey!0 (_keys!10480 thiss!1141) lt!425141 #b00000000000000000000000000000000)))

(declare-fun lt!425143 () Unit!31810)

(assert (=> b!942388 (= lt!425143 lt!425142)))

(declare-fun res!633283 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56866 (_ BitVec 32)) SeekEntryResult!9031)

(assert (=> b!942388 (= res!633283 (= (seekEntryOrOpen!0 (select (arr!27361 (_keys!10480 thiss!1141)) #b00000000000000000000000000000000) (_keys!10480 thiss!1141) (mask!27212 thiss!1141)) (Found!9031 #b00000000000000000000000000000000)))))

(assert (=> b!942388 (=> (not res!633283) (not e!529863))))

(assert (= (and d!114181 (not res!633284)) b!942385))

(assert (= (and b!942385 c!98218) b!942388))

(assert (= (and b!942385 (not c!98218)) b!942386))

(assert (= (and b!942388 res!633283) b!942387))

(assert (= (or b!942387 b!942386) bm!40956))

(assert (=> b!942385 m!876987))

(assert (=> b!942385 m!876987))

(assert (=> b!942385 m!876989))

(declare-fun m!876995 () Bool)

(assert (=> bm!40956 m!876995))

(assert (=> b!942388 m!876987))

(declare-fun m!876997 () Bool)

(assert (=> b!942388 m!876997))

(declare-fun m!876999 () Bool)

(assert (=> b!942388 m!876999))

(assert (=> b!942388 m!876987))

(declare-fun m!877001 () Bool)

(assert (=> b!942388 m!877001))

(assert (=> b!942326 d!114181))

(declare-fun d!114183 () Bool)

(declare-fun res!633291 () Bool)

(declare-fun e!529866 () Bool)

(assert (=> d!114183 (=> (not res!633291) (not e!529866))))

(declare-fun simpleValid!346 (LongMapFixedSize!4638) Bool)

(assert (=> d!114183 (= res!633291 (simpleValid!346 thiss!1141))))

(assert (=> d!114183 (= (valid!1775 thiss!1141) e!529866)))

(declare-fun b!942395 () Bool)

(declare-fun res!633292 () Bool)

(assert (=> b!942395 (=> (not res!633292) (not e!529866))))

(declare-fun arrayCountValidKeys!0 (array!56866 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942395 (= res!633292 (= (arrayCountValidKeys!0 (_keys!10480 thiss!1141) #b00000000000000000000000000000000 (size!27826 (_keys!10480 thiss!1141))) (_size!2374 thiss!1141)))))

(declare-fun b!942396 () Bool)

(declare-fun res!633293 () Bool)

(assert (=> b!942396 (=> (not res!633293) (not e!529866))))

(assert (=> b!942396 (= res!633293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10480 thiss!1141) (mask!27212 thiss!1141)))))

(declare-fun b!942397 () Bool)

(assert (=> b!942397 (= e!529866 (arrayNoDuplicates!0 (_keys!10480 thiss!1141) #b00000000000000000000000000000000 Nil!19209))))

(assert (= (and d!114183 res!633291) b!942395))

(assert (= (and b!942395 res!633292) b!942396))

(assert (= (and b!942396 res!633293) b!942397))

(declare-fun m!877003 () Bool)

(assert (=> d!114183 m!877003))

(declare-fun m!877005 () Bool)

(assert (=> b!942395 m!877005))

(assert (=> b!942396 m!876961))

(assert (=> b!942397 m!876955))

(assert (=> start!80216 d!114183))

(declare-fun b!942410 () Bool)

(declare-fun e!529874 () SeekEntryResult!9031)

(declare-fun lt!425155 () SeekEntryResult!9031)

(assert (=> b!942410 (= e!529874 (Found!9031 (index!38497 lt!425155)))))

(declare-fun b!942411 () Bool)

(declare-fun e!529873 () SeekEntryResult!9031)

(assert (=> b!942411 (= e!529873 e!529874)))

(declare-fun lt!425153 () (_ BitVec 64))

(assert (=> b!942411 (= lt!425153 (select (arr!27361 (_keys!10480 thiss!1141)) (index!38497 lt!425155)))))

(declare-fun c!98227 () Bool)

(assert (=> b!942411 (= c!98227 (= lt!425153 key!756))))

(declare-fun b!942413 () Bool)

(declare-fun e!529875 () SeekEntryResult!9031)

(declare-fun lt!425152 () SeekEntryResult!9031)

(assert (=> b!942413 (= e!529875 (ite ((_ is MissingVacant!9031) lt!425152) (MissingZero!9031 (index!38498 lt!425152)) lt!425152))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56866 (_ BitVec 32)) SeekEntryResult!9031)

(assert (=> b!942413 (= lt!425152 (seekKeyOrZeroReturnVacant!0 (x!80904 lt!425155) (index!38497 lt!425155) (index!38497 lt!425155) key!756 (_keys!10480 thiss!1141) (mask!27212 thiss!1141)))))

(declare-fun d!114185 () Bool)

(declare-fun lt!425154 () SeekEntryResult!9031)

(assert (=> d!114185 (and (or ((_ is MissingVacant!9031) lt!425154) (not ((_ is Found!9031) lt!425154)) (and (bvsge (index!38496 lt!425154) #b00000000000000000000000000000000) (bvslt (index!38496 lt!425154) (size!27826 (_keys!10480 thiss!1141))))) (not ((_ is MissingVacant!9031) lt!425154)) (or (not ((_ is Found!9031) lt!425154)) (= (select (arr!27361 (_keys!10480 thiss!1141)) (index!38496 lt!425154)) key!756)))))

(assert (=> d!114185 (= lt!425154 e!529873)))

(declare-fun c!98225 () Bool)

(assert (=> d!114185 (= c!98225 (and ((_ is Intermediate!9031) lt!425155) (undefined!9843 lt!425155)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56866 (_ BitVec 32)) SeekEntryResult!9031)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114185 (= lt!425155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27212 thiss!1141)) key!756 (_keys!10480 thiss!1141) (mask!27212 thiss!1141)))))

(assert (=> d!114185 (validMask!0 (mask!27212 thiss!1141))))

(assert (=> d!114185 (= (seekEntry!0 key!756 (_keys!10480 thiss!1141) (mask!27212 thiss!1141)) lt!425154)))

(declare-fun b!942412 () Bool)

(declare-fun c!98226 () Bool)

(assert (=> b!942412 (= c!98226 (= lt!425153 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942412 (= e!529874 e!529875)))

(declare-fun b!942414 () Bool)

(assert (=> b!942414 (= e!529873 Undefined!9031)))

(declare-fun b!942415 () Bool)

(assert (=> b!942415 (= e!529875 (MissingZero!9031 (index!38497 lt!425155)))))

(assert (= (and d!114185 c!98225) b!942414))

(assert (= (and d!114185 (not c!98225)) b!942411))

(assert (= (and b!942411 c!98227) b!942410))

(assert (= (and b!942411 (not c!98227)) b!942412))

(assert (= (and b!942412 c!98226) b!942415))

(assert (= (and b!942412 (not c!98226)) b!942413))

(declare-fun m!877007 () Bool)

(assert (=> b!942411 m!877007))

(declare-fun m!877009 () Bool)

(assert (=> b!942413 m!877009))

(declare-fun m!877011 () Bool)

(assert (=> d!114185 m!877011))

(declare-fun m!877013 () Bool)

(assert (=> d!114185 m!877013))

(assert (=> d!114185 m!877013))

(declare-fun m!877015 () Bool)

(assert (=> d!114185 m!877015))

(assert (=> d!114185 m!876965))

(assert (=> b!942331 d!114185))

(declare-fun mapNonEmpty!32498 () Bool)

(declare-fun mapRes!32498 () Bool)

(declare-fun tp!62338 () Bool)

(declare-fun e!529880 () Bool)

(assert (=> mapNonEmpty!32498 (= mapRes!32498 (and tp!62338 e!529880))))

(declare-fun mapKey!32498 () (_ BitVec 32))

(declare-fun mapValue!32498 () ValueCell!9744)

(declare-fun mapRest!32498 () (Array (_ BitVec 32) ValueCell!9744))

(assert (=> mapNonEmpty!32498 (= mapRest!32492 (store mapRest!32498 mapKey!32498 mapValue!32498))))

(declare-fun condMapEmpty!32498 () Bool)

(declare-fun mapDefault!32498 () ValueCell!9744)

(assert (=> mapNonEmpty!32492 (= condMapEmpty!32498 (= mapRest!32492 ((as const (Array (_ BitVec 32) ValueCell!9744)) mapDefault!32498)))))

(declare-fun e!529881 () Bool)

(assert (=> mapNonEmpty!32492 (= tp!62329 (and e!529881 mapRes!32498))))

(declare-fun mapIsEmpty!32498 () Bool)

(assert (=> mapIsEmpty!32498 mapRes!32498))

(declare-fun b!942423 () Bool)

(assert (=> b!942423 (= e!529881 tp_is_empty!20451)))

(declare-fun b!942422 () Bool)

(assert (=> b!942422 (= e!529880 tp_is_empty!20451)))

(assert (= (and mapNonEmpty!32492 condMapEmpty!32498) mapIsEmpty!32498))

(assert (= (and mapNonEmpty!32492 (not condMapEmpty!32498)) mapNonEmpty!32498))

(assert (= (and mapNonEmpty!32498 ((_ is ValueCellFull!9744) mapValue!32498)) b!942422))

(assert (= (and mapNonEmpty!32492 ((_ is ValueCellFull!9744) mapDefault!32498)) b!942423))

(declare-fun m!877017 () Bool)

(assert (=> mapNonEmpty!32498 m!877017))

(check-sat (not b!942395) (not mapNonEmpty!32498) (not b!942396) b_and!29355 (not bm!40953) (not b!942374) tp_is_empty!20451 (not b!942397) (not b!942372) (not bm!40956) (not b!942413) (not b!942376) (not b!942385) (not d!114185) (not b_next!17943) (not d!114183) (not b!942388))
(check-sat b_and!29355 (not b_next!17943))
