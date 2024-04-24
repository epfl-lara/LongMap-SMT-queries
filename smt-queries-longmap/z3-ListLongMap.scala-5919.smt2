; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76972 () Bool)

(assert start!76972)

(declare-fun b!899342 () Bool)

(declare-fun b_free!16015 () Bool)

(declare-fun b_next!16015 () Bool)

(assert (=> b!899342 (= b_free!16015 (not b_next!16015))))

(declare-fun tp!56114 () Bool)

(declare-fun b_and!26319 () Bool)

(assert (=> b!899342 (= tp!56114 b_and!26319)))

(declare-fun b!899335 () Bool)

(declare-fun e!503152 () Bool)

(declare-datatypes ((SeekEntryResult!8879 0))(
  ( (MissingZero!8879 (index!37887 (_ BitVec 32))) (Found!8879 (index!37888 (_ BitVec 32))) (Intermediate!8879 (undefined!9691 Bool) (index!37889 (_ BitVec 32)) (x!76540 (_ BitVec 32))) (Undefined!8879) (MissingVacant!8879 (index!37890 (_ BitVec 32))) )
))
(declare-fun lt!405953 () SeekEntryResult!8879)

(declare-datatypes ((array!52763 0))(
  ( (array!52764 (arr!25354 (Array (_ BitVec 32) (_ BitVec 64))) (size!25810 (_ BitVec 32))) )
))
(declare-datatypes ((V!29423 0))(
  ( (V!29424 (val!9222 Int)) )
))
(declare-datatypes ((ValueCell!8690 0))(
  ( (ValueCellFull!8690 (v!11710 V!29423)) (EmptyCell!8690) )
))
(declare-datatypes ((array!52765 0))(
  ( (array!52766 (arr!25355 (Array (_ BitVec 32) ValueCell!8690)) (size!25811 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4396 0))(
  ( (LongMapFixedSize!4397 (defaultEntry!5412 Int) (mask!26185 (_ BitVec 32)) (extraKeys!5128 (_ BitVec 32)) (zeroValue!5232 V!29423) (minValue!5232 V!29423) (_size!2253 (_ BitVec 32)) (_keys!10215 array!52763) (_values!5419 array!52765) (_vacant!2253 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4396)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899335 (= e!503152 (inRange!0 (index!37888 lt!405953) (mask!26185 thiss!1181)))))

(declare-fun mapIsEmpty!29169 () Bool)

(declare-fun mapRes!29169 () Bool)

(assert (=> mapIsEmpty!29169 mapRes!29169))

(declare-fun res!607495 () Bool)

(declare-fun e!503155 () Bool)

(assert (=> start!76972 (=> (not res!607495) (not e!503155))))

(declare-fun valid!1702 (LongMapFixedSize!4396) Bool)

(assert (=> start!76972 (= res!607495 (valid!1702 thiss!1181))))

(assert (=> start!76972 e!503155))

(declare-fun e!503151 () Bool)

(assert (=> start!76972 e!503151))

(assert (=> start!76972 true))

(declare-fun b!899336 () Bool)

(declare-fun e!503149 () Bool)

(declare-fun e!503154 () Bool)

(assert (=> b!899336 (= e!503149 (and e!503154 mapRes!29169))))

(declare-fun condMapEmpty!29169 () Bool)

(declare-fun mapDefault!29169 () ValueCell!8690)

(assert (=> b!899336 (= condMapEmpty!29169 (= (arr!25355 (_values!5419 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8690)) mapDefault!29169)))))

(declare-fun b!899337 () Bool)

(declare-fun e!503156 () Bool)

(declare-fun tp_is_empty!18343 () Bool)

(assert (=> b!899337 (= e!503156 tp_is_empty!18343)))

(declare-fun b!899338 () Bool)

(declare-fun e!503153 () Bool)

(assert (=> b!899338 (= e!503153 (= (size!25811 (_values!5419 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26185 thiss!1181))))))

(declare-fun b!899339 () Bool)

(declare-fun res!607494 () Bool)

(assert (=> b!899339 (=> (not res!607494) (not e!503155))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!899339 (= res!607494 (not (= key!785 (bvneg key!785))))))

(declare-fun b!899340 () Bool)

(assert (=> b!899340 (= e!503154 tp_is_empty!18343)))

(declare-fun b!899341 () Bool)

(declare-fun e!503148 () Bool)

(assert (=> b!899341 (= e!503148 e!503153)))

(declare-fun res!607496 () Bool)

(assert (=> b!899341 (=> res!607496 e!503153)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!899341 (= res!607496 (not (validMask!0 (mask!26185 thiss!1181))))))

(declare-datatypes ((tuple2!11950 0))(
  ( (tuple2!11951 (_1!5986 (_ BitVec 64)) (_2!5986 V!29423)) )
))
(declare-datatypes ((List!17790 0))(
  ( (Nil!17787) (Cons!17786 (h!18934 tuple2!11950) (t!25123 List!17790)) )
))
(declare-datatypes ((ListLongMap!10649 0))(
  ( (ListLongMap!10650 (toList!5340 List!17790)) )
))
(declare-fun contains!4381 (ListLongMap!10649 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2612 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 32) Int) ListLongMap!10649)

(assert (=> b!899341 (contains!4381 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953)))))

(declare-datatypes ((Unit!30528 0))(
  ( (Unit!30529) )
))
(declare-fun lt!405955 () Unit!30528)

(declare-fun lemmaValidKeyInArrayIsInListMap!242 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 32) Int) Unit!30528)

(assert (=> b!899341 (= lt!405955 (lemmaValidKeyInArrayIsInListMap!242 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (index!37888 lt!405953) (defaultEntry!5412 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!899341 (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405954 () Unit!30528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52763 (_ BitVec 64) (_ BitVec 32)) Unit!30528)

(assert (=> b!899341 (= lt!405954 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10215 thiss!1181) key!785 (index!37888 lt!405953)))))

(declare-fun array_inv!19952 (array!52763) Bool)

(declare-fun array_inv!19953 (array!52765) Bool)

(assert (=> b!899342 (= e!503151 (and tp!56114 tp_is_empty!18343 (array_inv!19952 (_keys!10215 thiss!1181)) (array_inv!19953 (_values!5419 thiss!1181)) e!503149))))

(declare-fun mapNonEmpty!29169 () Bool)

(declare-fun tp!56115 () Bool)

(assert (=> mapNonEmpty!29169 (= mapRes!29169 (and tp!56115 e!503156))))

(declare-fun mapKey!29169 () (_ BitVec 32))

(declare-fun mapRest!29169 () (Array (_ BitVec 32) ValueCell!8690))

(declare-fun mapValue!29169 () ValueCell!8690)

(assert (=> mapNonEmpty!29169 (= (arr!25355 (_values!5419 thiss!1181)) (store mapRest!29169 mapKey!29169 mapValue!29169))))

(declare-fun b!899343 () Bool)

(assert (=> b!899343 (= e!503155 (not e!503148))))

(declare-fun res!607493 () Bool)

(assert (=> b!899343 (=> res!607493 e!503148)))

(get-info :version)

(assert (=> b!899343 (= res!607493 (not ((_ is Found!8879) lt!405953)))))

(assert (=> b!899343 e!503152))

(declare-fun res!607492 () Bool)

(assert (=> b!899343 (=> res!607492 e!503152)))

(assert (=> b!899343 (= res!607492 (not ((_ is Found!8879) lt!405953)))))

(declare-fun lt!405956 () Unit!30528)

(declare-fun lemmaSeekEntryGivesInRangeIndex!100 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 64)) Unit!30528)

(assert (=> b!899343 (= lt!405956 (lemmaSeekEntryGivesInRangeIndex!100 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52763 (_ BitVec 32)) SeekEntryResult!8879)

(assert (=> b!899343 (= lt!405953 (seekEntry!0 key!785 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)))))

(assert (= (and start!76972 res!607495) b!899339))

(assert (= (and b!899339 res!607494) b!899343))

(assert (= (and b!899343 (not res!607492)) b!899335))

(assert (= (and b!899343 (not res!607493)) b!899341))

(assert (= (and b!899341 (not res!607496)) b!899338))

(assert (= (and b!899336 condMapEmpty!29169) mapIsEmpty!29169))

(assert (= (and b!899336 (not condMapEmpty!29169)) mapNonEmpty!29169))

(assert (= (and mapNonEmpty!29169 ((_ is ValueCellFull!8690) mapValue!29169)) b!899337))

(assert (= (and b!899336 ((_ is ValueCellFull!8690) mapDefault!29169)) b!899340))

(assert (= b!899342 b!899336))

(assert (= start!76972 b!899342))

(declare-fun m!836223 () Bool)

(assert (=> b!899341 m!836223))

(declare-fun m!836225 () Bool)

(assert (=> b!899341 m!836225))

(declare-fun m!836227 () Bool)

(assert (=> b!899341 m!836227))

(declare-fun m!836229 () Bool)

(assert (=> b!899341 m!836229))

(assert (=> b!899341 m!836229))

(assert (=> b!899341 m!836223))

(declare-fun m!836231 () Bool)

(assert (=> b!899341 m!836231))

(declare-fun m!836233 () Bool)

(assert (=> b!899341 m!836233))

(declare-fun m!836235 () Bool)

(assert (=> b!899341 m!836235))

(declare-fun m!836237 () Bool)

(assert (=> b!899335 m!836237))

(declare-fun m!836239 () Bool)

(assert (=> mapNonEmpty!29169 m!836239))

(declare-fun m!836241 () Bool)

(assert (=> b!899342 m!836241))

(declare-fun m!836243 () Bool)

(assert (=> b!899342 m!836243))

(declare-fun m!836245 () Bool)

(assert (=> b!899343 m!836245))

(declare-fun m!836247 () Bool)

(assert (=> b!899343 m!836247))

(declare-fun m!836249 () Bool)

(assert (=> start!76972 m!836249))

(check-sat (not mapNonEmpty!29169) (not b!899335) (not b!899343) (not start!76972) tp_is_empty!18343 (not b!899341) (not b_next!16015) (not b!899342) b_and!26319)
(check-sat b_and!26319 (not b_next!16015))
(get-model)

(declare-fun d!111561 () Bool)

(assert (=> d!111561 (= (inRange!0 (index!37888 lt!405953) (mask!26185 thiss!1181)) (and (bvsge (index!37888 lt!405953) #b00000000000000000000000000000000) (bvslt (index!37888 lt!405953) (bvadd (mask!26185 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899335 d!111561))

(declare-fun d!111563 () Bool)

(declare-fun e!503213 () Bool)

(assert (=> d!111563 e!503213))

(declare-fun res!607529 () Bool)

(assert (=> d!111563 (=> res!607529 e!503213)))

(declare-fun lt!405986 () SeekEntryResult!8879)

(assert (=> d!111563 (= res!607529 (not ((_ is Found!8879) lt!405986)))))

(assert (=> d!111563 (= lt!405986 (seekEntry!0 key!785 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)))))

(declare-fun lt!405985 () Unit!30528)

(declare-fun choose!1496 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 64)) Unit!30528)

(assert (=> d!111563 (= lt!405985 (choose!1496 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) key!785))))

(assert (=> d!111563 (validMask!0 (mask!26185 thiss!1181))))

(assert (=> d!111563 (= (lemmaSeekEntryGivesInRangeIndex!100 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) key!785) lt!405985)))

(declare-fun b!899400 () Bool)

(assert (=> b!899400 (= e!503213 (inRange!0 (index!37888 lt!405986) (mask!26185 thiss!1181)))))

(assert (= (and d!111563 (not res!607529)) b!899400))

(assert (=> d!111563 m!836247))

(declare-fun m!836307 () Bool)

(assert (=> d!111563 m!836307))

(assert (=> d!111563 m!836227))

(declare-fun m!836309 () Bool)

(assert (=> b!899400 m!836309))

(assert (=> b!899343 d!111563))

(declare-fun b!899413 () Bool)

(declare-fun e!503222 () SeekEntryResult!8879)

(declare-fun e!503221 () SeekEntryResult!8879)

(assert (=> b!899413 (= e!503222 e!503221)))

(declare-fun lt!405998 () (_ BitVec 64))

(declare-fun lt!405995 () SeekEntryResult!8879)

(assert (=> b!899413 (= lt!405998 (select (arr!25354 (_keys!10215 thiss!1181)) (index!37889 lt!405995)))))

(declare-fun c!95234 () Bool)

(assert (=> b!899413 (= c!95234 (= lt!405998 key!785))))

(declare-fun b!899414 () Bool)

(assert (=> b!899414 (= e!503221 (Found!8879 (index!37889 lt!405995)))))

(declare-fun b!899415 () Bool)

(declare-fun c!95232 () Bool)

(assert (=> b!899415 (= c!95232 (= lt!405998 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503220 () SeekEntryResult!8879)

(assert (=> b!899415 (= e!503221 e!503220)))

(declare-fun b!899417 () Bool)

(assert (=> b!899417 (= e!503222 Undefined!8879)))

(declare-fun b!899418 () Bool)

(assert (=> b!899418 (= e!503220 (MissingZero!8879 (index!37889 lt!405995)))))

(declare-fun b!899416 () Bool)

(declare-fun lt!405996 () SeekEntryResult!8879)

(assert (=> b!899416 (= e!503220 (ite ((_ is MissingVacant!8879) lt!405996) (MissingZero!8879 (index!37890 lt!405996)) lt!405996))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52763 (_ BitVec 32)) SeekEntryResult!8879)

(assert (=> b!899416 (= lt!405996 (seekKeyOrZeroReturnVacant!0 (x!76540 lt!405995) (index!37889 lt!405995) (index!37889 lt!405995) key!785 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)))))

(declare-fun d!111565 () Bool)

(declare-fun lt!405997 () SeekEntryResult!8879)

(assert (=> d!111565 (and (or ((_ is MissingVacant!8879) lt!405997) (not ((_ is Found!8879) lt!405997)) (and (bvsge (index!37888 lt!405997) #b00000000000000000000000000000000) (bvslt (index!37888 lt!405997) (size!25810 (_keys!10215 thiss!1181))))) (not ((_ is MissingVacant!8879) lt!405997)) (or (not ((_ is Found!8879) lt!405997)) (= (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405997)) key!785)))))

(assert (=> d!111565 (= lt!405997 e!503222)))

(declare-fun c!95233 () Bool)

(assert (=> d!111565 (= c!95233 (and ((_ is Intermediate!8879) lt!405995) (undefined!9691 lt!405995)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52763 (_ BitVec 32)) SeekEntryResult!8879)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111565 (= lt!405995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26185 thiss!1181)) key!785 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)))))

(assert (=> d!111565 (validMask!0 (mask!26185 thiss!1181))))

(assert (=> d!111565 (= (seekEntry!0 key!785 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)) lt!405997)))

(assert (= (and d!111565 c!95233) b!899417))

(assert (= (and d!111565 (not c!95233)) b!899413))

(assert (= (and b!899413 c!95234) b!899414))

(assert (= (and b!899413 (not c!95234)) b!899415))

(assert (= (and b!899415 c!95232) b!899418))

(assert (= (and b!899415 (not c!95232)) b!899416))

(declare-fun m!836311 () Bool)

(assert (=> b!899413 m!836311))

(declare-fun m!836313 () Bool)

(assert (=> b!899416 m!836313))

(declare-fun m!836315 () Bool)

(assert (=> d!111565 m!836315))

(declare-fun m!836317 () Bool)

(assert (=> d!111565 m!836317))

(assert (=> d!111565 m!836317))

(declare-fun m!836319 () Bool)

(assert (=> d!111565 m!836319))

(assert (=> d!111565 m!836227))

(assert (=> b!899343 d!111565))

(declare-fun d!111567 () Bool)

(declare-fun res!607536 () Bool)

(declare-fun e!503225 () Bool)

(assert (=> d!111567 (=> (not res!607536) (not e!503225))))

(declare-fun simpleValid!324 (LongMapFixedSize!4396) Bool)

(assert (=> d!111567 (= res!607536 (simpleValid!324 thiss!1181))))

(assert (=> d!111567 (= (valid!1702 thiss!1181) e!503225)))

(declare-fun b!899425 () Bool)

(declare-fun res!607537 () Bool)

(assert (=> b!899425 (=> (not res!607537) (not e!503225))))

(declare-fun arrayCountValidKeys!0 (array!52763 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899425 (= res!607537 (= (arrayCountValidKeys!0 (_keys!10215 thiss!1181) #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))) (_size!2253 thiss!1181)))))

(declare-fun b!899426 () Bool)

(declare-fun res!607538 () Bool)

(assert (=> b!899426 (=> (not res!607538) (not e!503225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52763 (_ BitVec 32)) Bool)

(assert (=> b!899426 (= res!607538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)))))

(declare-fun b!899427 () Bool)

(declare-datatypes ((List!17792 0))(
  ( (Nil!17789) (Cons!17788 (h!18936 (_ BitVec 64)) (t!25127 List!17792)) )
))
(declare-fun arrayNoDuplicates!0 (array!52763 (_ BitVec 32) List!17792) Bool)

(assert (=> b!899427 (= e!503225 (arrayNoDuplicates!0 (_keys!10215 thiss!1181) #b00000000000000000000000000000000 Nil!17789))))

(assert (= (and d!111567 res!607536) b!899425))

(assert (= (and b!899425 res!607537) b!899426))

(assert (= (and b!899426 res!607538) b!899427))

(declare-fun m!836321 () Bool)

(assert (=> d!111567 m!836321))

(declare-fun m!836323 () Bool)

(assert (=> b!899425 m!836323))

(declare-fun m!836325 () Bool)

(assert (=> b!899426 m!836325))

(declare-fun m!836327 () Bool)

(assert (=> b!899427 m!836327))

(assert (=> start!76972 d!111567))

(declare-fun d!111569 () Bool)

(assert (=> d!111569 (= (array_inv!19952 (_keys!10215 thiss!1181)) (bvsge (size!25810 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899342 d!111569))

(declare-fun d!111571 () Bool)

(assert (=> d!111571 (= (array_inv!19953 (_values!5419 thiss!1181)) (bvsge (size!25811 (_values!5419 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899342 d!111571))

(declare-fun d!111573 () Bool)

(declare-fun e!503228 () Bool)

(assert (=> d!111573 e!503228))

(declare-fun res!607541 () Bool)

(assert (=> d!111573 (=> (not res!607541) (not e!503228))))

(assert (=> d!111573 (= res!607541 (and (bvsge (index!37888 lt!405953) #b00000000000000000000000000000000) (bvslt (index!37888 lt!405953) (size!25810 (_keys!10215 thiss!1181)))))))

(declare-fun lt!406001 () Unit!30528)

(declare-fun choose!1497 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 32) Int) Unit!30528)

(assert (=> d!111573 (= lt!406001 (choose!1497 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (index!37888 lt!405953) (defaultEntry!5412 thiss!1181)))))

(assert (=> d!111573 (validMask!0 (mask!26185 thiss!1181))))

(assert (=> d!111573 (= (lemmaValidKeyInArrayIsInListMap!242 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (index!37888 lt!405953) (defaultEntry!5412 thiss!1181)) lt!406001)))

(declare-fun b!899430 () Bool)

(assert (=> b!899430 (= e!503228 (contains!4381 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))

(assert (= (and d!111573 res!607541) b!899430))

(declare-fun m!836329 () Bool)

(assert (=> d!111573 m!836329))

(assert (=> d!111573 m!836227))

(assert (=> b!899430 m!836229))

(assert (=> b!899430 m!836223))

(assert (=> b!899430 m!836229))

(assert (=> b!899430 m!836223))

(assert (=> b!899430 m!836231))

(assert (=> b!899341 d!111573))

(declare-fun d!111575 () Bool)

(assert (=> d!111575 (= (validMask!0 (mask!26185 thiss!1181)) (and (or (= (mask!26185 thiss!1181) #b00000000000000000000000000000111) (= (mask!26185 thiss!1181) #b00000000000000000000000000001111) (= (mask!26185 thiss!1181) #b00000000000000000000000000011111) (= (mask!26185 thiss!1181) #b00000000000000000000000000111111) (= (mask!26185 thiss!1181) #b00000000000000000000000001111111) (= (mask!26185 thiss!1181) #b00000000000000000000000011111111) (= (mask!26185 thiss!1181) #b00000000000000000000000111111111) (= (mask!26185 thiss!1181) #b00000000000000000000001111111111) (= (mask!26185 thiss!1181) #b00000000000000000000011111111111) (= (mask!26185 thiss!1181) #b00000000000000000000111111111111) (= (mask!26185 thiss!1181) #b00000000000000000001111111111111) (= (mask!26185 thiss!1181) #b00000000000000000011111111111111) (= (mask!26185 thiss!1181) #b00000000000000000111111111111111) (= (mask!26185 thiss!1181) #b00000000000000001111111111111111) (= (mask!26185 thiss!1181) #b00000000000000011111111111111111) (= (mask!26185 thiss!1181) #b00000000000000111111111111111111) (= (mask!26185 thiss!1181) #b00000000000001111111111111111111) (= (mask!26185 thiss!1181) #b00000000000011111111111111111111) (= (mask!26185 thiss!1181) #b00000000000111111111111111111111) (= (mask!26185 thiss!1181) #b00000000001111111111111111111111) (= (mask!26185 thiss!1181) #b00000000011111111111111111111111) (= (mask!26185 thiss!1181) #b00000000111111111111111111111111) (= (mask!26185 thiss!1181) #b00000001111111111111111111111111) (= (mask!26185 thiss!1181) #b00000011111111111111111111111111) (= (mask!26185 thiss!1181) #b00000111111111111111111111111111) (= (mask!26185 thiss!1181) #b00001111111111111111111111111111) (= (mask!26185 thiss!1181) #b00011111111111111111111111111111) (= (mask!26185 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26185 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!899341 d!111575))

(declare-fun d!111577 () Bool)

(declare-fun res!607546 () Bool)

(declare-fun e!503233 () Bool)

(assert (=> d!111577 (=> res!607546 e!503233)))

(assert (=> d!111577 (= res!607546 (= (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111577 (= (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 #b00000000000000000000000000000000) e!503233)))

(declare-fun b!899435 () Bool)

(declare-fun e!503234 () Bool)

(assert (=> b!899435 (= e!503233 e!503234)))

(declare-fun res!607547 () Bool)

(assert (=> b!899435 (=> (not res!607547) (not e!503234))))

(assert (=> b!899435 (= res!607547 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun b!899436 () Bool)

(assert (=> b!899436 (= e!503234 (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111577 (not res!607546)) b!899435))

(assert (= (and b!899435 res!607547) b!899436))

(declare-fun m!836331 () Bool)

(assert (=> d!111577 m!836331))

(declare-fun m!836333 () Bool)

(assert (=> b!899436 m!836333))

(assert (=> b!899341 d!111577))

(declare-fun d!111579 () Bool)

(assert (=> d!111579 (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406004 () Unit!30528)

(declare-fun choose!13 (array!52763 (_ BitVec 64) (_ BitVec 32)) Unit!30528)

(assert (=> d!111579 (= lt!406004 (choose!13 (_keys!10215 thiss!1181) key!785 (index!37888 lt!405953)))))

(assert (=> d!111579 (bvsge (index!37888 lt!405953) #b00000000000000000000000000000000)))

(assert (=> d!111579 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10215 thiss!1181) key!785 (index!37888 lt!405953)) lt!406004)))

(declare-fun bs!25227 () Bool)

(assert (= bs!25227 d!111579))

(assert (=> bs!25227 m!836225))

(declare-fun m!836335 () Bool)

(assert (=> bs!25227 m!836335))

(assert (=> b!899341 d!111579))

(declare-fun b!899479 () Bool)

(declare-fun e!503271 () Bool)

(declare-fun lt!406066 () ListLongMap!10649)

(declare-fun apply!406 (ListLongMap!10649 (_ BitVec 64)) V!29423)

(assert (=> b!899479 (= e!503271 (= (apply!406 lt!406066 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5232 thiss!1181)))))

(declare-fun call!39917 () ListLongMap!10649)

(declare-fun call!39920 () ListLongMap!10649)

(declare-fun call!39919 () ListLongMap!10649)

(declare-fun c!95252 () Bool)

(declare-fun bm!39913 () Bool)

(declare-fun call!39916 () ListLongMap!10649)

(declare-fun c!95248 () Bool)

(declare-fun +!2601 (ListLongMap!10649 tuple2!11950) ListLongMap!10649)

(assert (=> bm!39913 (= call!39917 (+!2601 (ite c!95248 call!39919 (ite c!95252 call!39916 call!39920)) (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(declare-fun bm!39914 () Bool)

(assert (=> bm!39914 (= call!39920 call!39916)))

(declare-fun b!899480 () Bool)

(declare-fun c!95247 () Bool)

(assert (=> b!899480 (= c!95247 (and (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!503273 () ListLongMap!10649)

(declare-fun e!503272 () ListLongMap!10649)

(assert (=> b!899480 (= e!503273 e!503272)))

(declare-fun b!899481 () Bool)

(declare-fun e!503270 () Bool)

(declare-fun get!13343 (ValueCell!8690 V!29423) V!29423)

(declare-fun dynLambda!1321 (Int (_ BitVec 64)) V!29423)

(assert (=> b!899481 (= e!503270 (= (apply!406 lt!406066 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)) (get!13343 (select (arr!25355 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1321 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25811 (_values!5419 thiss!1181))))))

(assert (=> b!899481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun d!111581 () Bool)

(declare-fun e!503264 () Bool)

(assert (=> d!111581 e!503264))

(declare-fun res!607567 () Bool)

(assert (=> d!111581 (=> (not res!607567) (not e!503264))))

(assert (=> d!111581 (= res!607567 (or (bvsge #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))))

(declare-fun lt!406061 () ListLongMap!10649)

(assert (=> d!111581 (= lt!406066 lt!406061)))

(declare-fun lt!406050 () Unit!30528)

(declare-fun e!503266 () Unit!30528)

(assert (=> d!111581 (= lt!406050 e!503266)))

(declare-fun c!95249 () Bool)

(declare-fun e!503263 () Bool)

(assert (=> d!111581 (= c!95249 e!503263)))

(declare-fun res!607569 () Bool)

(assert (=> d!111581 (=> (not res!607569) (not e!503263))))

(assert (=> d!111581 (= res!607569 (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun e!503267 () ListLongMap!10649)

(assert (=> d!111581 (= lt!406061 e!503267)))

(assert (=> d!111581 (= c!95248 (and (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111581 (validMask!0 (mask!26185 thiss!1181))))

(assert (=> d!111581 (= (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) lt!406066)))

(declare-fun b!899482 () Bool)

(declare-fun e!503269 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!899482 (= e!503269 (validKeyInArray!0 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899483 () Bool)

(declare-fun e!503262 () Bool)

(assert (=> b!899483 (= e!503264 e!503262)))

(declare-fun c!95250 () Bool)

(assert (=> b!899483 (= c!95250 (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!899484 () Bool)

(declare-fun e!503261 () Bool)

(declare-fun call!39922 () Bool)

(assert (=> b!899484 (= e!503261 (not call!39922))))

(declare-fun bm!39915 () Bool)

(declare-fun call!39918 () ListLongMap!10649)

(assert (=> bm!39915 (= call!39918 call!39917)))

(declare-fun b!899485 () Bool)

(declare-fun e!503265 () Bool)

(assert (=> b!899485 (= e!503265 e!503270)))

(declare-fun res!607574 () Bool)

(assert (=> b!899485 (=> (not res!607574) (not e!503270))))

(assert (=> b!899485 (= res!607574 (contains!4381 lt!406066 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun b!899486 () Bool)

(declare-fun call!39921 () Bool)

(assert (=> b!899486 (= e!503262 (not call!39921))))

(declare-fun bm!39916 () Bool)

(assert (=> bm!39916 (= call!39921 (contains!4381 lt!406066 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899487 () Bool)

(declare-fun e!503268 () Bool)

(assert (=> b!899487 (= e!503261 e!503268)))

(declare-fun res!607571 () Bool)

(assert (=> b!899487 (= res!607571 call!39922)))

(assert (=> b!899487 (=> (not res!607571) (not e!503268))))

(declare-fun b!899488 () Bool)

(declare-fun res!607568 () Bool)

(assert (=> b!899488 (=> (not res!607568) (not e!503264))))

(assert (=> b!899488 (= res!607568 e!503265)))

(declare-fun res!607573 () Bool)

(assert (=> b!899488 (=> res!607573 e!503265)))

(assert (=> b!899488 (= res!607573 (not e!503269))))

(declare-fun res!607570 () Bool)

(assert (=> b!899488 (=> (not res!607570) (not e!503269))))

(assert (=> b!899488 (= res!607570 (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun b!899489 () Bool)

(assert (=> b!899489 (= e!503272 call!39920)))

(declare-fun b!899490 () Bool)

(declare-fun lt!406064 () Unit!30528)

(assert (=> b!899490 (= e!503266 lt!406064)))

(declare-fun lt!406053 () ListLongMap!10649)

(declare-fun getCurrentListMapNoExtraKeys!3322 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 32) Int) ListLongMap!10649)

(assert (=> b!899490 (= lt!406053 (getCurrentListMapNoExtraKeys!3322 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))

(declare-fun lt!406057 () (_ BitVec 64))

(assert (=> b!899490 (= lt!406057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406067 () (_ BitVec 64))

(assert (=> b!899490 (= lt!406067 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406054 () Unit!30528)

(declare-fun addStillContains!332 (ListLongMap!10649 (_ BitVec 64) V!29423 (_ BitVec 64)) Unit!30528)

(assert (=> b!899490 (= lt!406054 (addStillContains!332 lt!406053 lt!406057 (zeroValue!5232 thiss!1181) lt!406067))))

(assert (=> b!899490 (contains!4381 (+!2601 lt!406053 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181))) lt!406067)))

(declare-fun lt!406070 () Unit!30528)

(assert (=> b!899490 (= lt!406070 lt!406054)))

(declare-fun lt!406062 () ListLongMap!10649)

(assert (=> b!899490 (= lt!406062 (getCurrentListMapNoExtraKeys!3322 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))

(declare-fun lt!406068 () (_ BitVec 64))

(assert (=> b!899490 (= lt!406068 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406060 () (_ BitVec 64))

(assert (=> b!899490 (= lt!406060 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406049 () Unit!30528)

(declare-fun addApplyDifferent!332 (ListLongMap!10649 (_ BitVec 64) V!29423 (_ BitVec 64)) Unit!30528)

(assert (=> b!899490 (= lt!406049 (addApplyDifferent!332 lt!406062 lt!406068 (minValue!5232 thiss!1181) lt!406060))))

(assert (=> b!899490 (= (apply!406 (+!2601 lt!406062 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181))) lt!406060) (apply!406 lt!406062 lt!406060))))

(declare-fun lt!406051 () Unit!30528)

(assert (=> b!899490 (= lt!406051 lt!406049)))

(declare-fun lt!406058 () ListLongMap!10649)

(assert (=> b!899490 (= lt!406058 (getCurrentListMapNoExtraKeys!3322 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))

(declare-fun lt!406055 () (_ BitVec 64))

(assert (=> b!899490 (= lt!406055 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406052 () (_ BitVec 64))

(assert (=> b!899490 (= lt!406052 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406069 () Unit!30528)

(assert (=> b!899490 (= lt!406069 (addApplyDifferent!332 lt!406058 lt!406055 (zeroValue!5232 thiss!1181) lt!406052))))

(assert (=> b!899490 (= (apply!406 (+!2601 lt!406058 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181))) lt!406052) (apply!406 lt!406058 lt!406052))))

(declare-fun lt!406059 () Unit!30528)

(assert (=> b!899490 (= lt!406059 lt!406069)))

(declare-fun lt!406056 () ListLongMap!10649)

(assert (=> b!899490 (= lt!406056 (getCurrentListMapNoExtraKeys!3322 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))

(declare-fun lt!406065 () (_ BitVec 64))

(assert (=> b!899490 (= lt!406065 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406063 () (_ BitVec 64))

(assert (=> b!899490 (= lt!406063 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899490 (= lt!406064 (addApplyDifferent!332 lt!406056 lt!406065 (minValue!5232 thiss!1181) lt!406063))))

(assert (=> b!899490 (= (apply!406 (+!2601 lt!406056 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181))) lt!406063) (apply!406 lt!406056 lt!406063))))

(declare-fun bm!39917 () Bool)

(assert (=> bm!39917 (= call!39922 (contains!4381 lt!406066 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899491 () Bool)

(assert (=> b!899491 (= e!503267 (+!2601 call!39917 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))

(declare-fun b!899492 () Bool)

(assert (=> b!899492 (= e!503267 e!503273)))

(assert (=> b!899492 (= c!95252 (and (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!899493 () Bool)

(assert (=> b!899493 (= e!503263 (validKeyInArray!0 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899494 () Bool)

(assert (=> b!899494 (= e!503273 call!39918)))

(declare-fun b!899495 () Bool)

(assert (=> b!899495 (= e!503262 e!503271)))

(declare-fun res!607566 () Bool)

(assert (=> b!899495 (= res!607566 call!39921)))

(assert (=> b!899495 (=> (not res!607566) (not e!503271))))

(declare-fun b!899496 () Bool)

(assert (=> b!899496 (= e!503268 (= (apply!406 lt!406066 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5232 thiss!1181)))))

(declare-fun b!899497 () Bool)

(assert (=> b!899497 (= e!503272 call!39918)))

(declare-fun bm!39918 () Bool)

(assert (=> bm!39918 (= call!39916 call!39919)))

(declare-fun b!899498 () Bool)

(declare-fun Unit!30532 () Unit!30528)

(assert (=> b!899498 (= e!503266 Unit!30532)))

(declare-fun bm!39919 () Bool)

(assert (=> bm!39919 (= call!39919 (getCurrentListMapNoExtraKeys!3322 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))

(declare-fun b!899499 () Bool)

(declare-fun res!607572 () Bool)

(assert (=> b!899499 (=> (not res!607572) (not e!503264))))

(assert (=> b!899499 (= res!607572 e!503261)))

(declare-fun c!95251 () Bool)

(assert (=> b!899499 (= c!95251 (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!111581 c!95248) b!899491))

(assert (= (and d!111581 (not c!95248)) b!899492))

(assert (= (and b!899492 c!95252) b!899494))

(assert (= (and b!899492 (not c!95252)) b!899480))

(assert (= (and b!899480 c!95247) b!899497))

(assert (= (and b!899480 (not c!95247)) b!899489))

(assert (= (or b!899497 b!899489) bm!39914))

(assert (= (or b!899494 bm!39914) bm!39918))

(assert (= (or b!899494 b!899497) bm!39915))

(assert (= (or b!899491 bm!39918) bm!39919))

(assert (= (or b!899491 bm!39915) bm!39913))

(assert (= (and d!111581 res!607569) b!899493))

(assert (= (and d!111581 c!95249) b!899490))

(assert (= (and d!111581 (not c!95249)) b!899498))

(assert (= (and d!111581 res!607567) b!899488))

(assert (= (and b!899488 res!607570) b!899482))

(assert (= (and b!899488 (not res!607573)) b!899485))

(assert (= (and b!899485 res!607574) b!899481))

(assert (= (and b!899488 res!607568) b!899499))

(assert (= (and b!899499 c!95251) b!899487))

(assert (= (and b!899499 (not c!95251)) b!899484))

(assert (= (and b!899487 res!607571) b!899496))

(assert (= (or b!899487 b!899484) bm!39917))

(assert (= (and b!899499 res!607572) b!899483))

(assert (= (and b!899483 c!95250) b!899495))

(assert (= (and b!899483 (not c!95250)) b!899486))

(assert (= (and b!899495 res!607566) b!899479))

(assert (= (or b!899495 b!899486) bm!39916))

(declare-fun b_lambda!12977 () Bool)

(assert (=> (not b_lambda!12977) (not b!899481)))

(declare-fun t!25126 () Bool)

(declare-fun tb!5185 () Bool)

(assert (=> (and b!899342 (= (defaultEntry!5412 thiss!1181) (defaultEntry!5412 thiss!1181)) t!25126) tb!5185))

(declare-fun result!10143 () Bool)

(assert (=> tb!5185 (= result!10143 tp_is_empty!18343)))

(assert (=> b!899481 t!25126))

(declare-fun b_and!26325 () Bool)

(assert (= b_and!26319 (and (=> t!25126 result!10143) b_and!26325)))

(assert (=> b!899485 m!836331))

(assert (=> b!899485 m!836331))

(declare-fun m!836337 () Bool)

(assert (=> b!899485 m!836337))

(declare-fun m!836339 () Bool)

(assert (=> bm!39917 m!836339))

(assert (=> b!899481 m!836331))

(assert (=> b!899481 m!836331))

(declare-fun m!836341 () Bool)

(assert (=> b!899481 m!836341))

(declare-fun m!836343 () Bool)

(assert (=> b!899481 m!836343))

(declare-fun m!836345 () Bool)

(assert (=> b!899481 m!836345))

(assert (=> b!899481 m!836343))

(declare-fun m!836347 () Bool)

(assert (=> b!899481 m!836347))

(assert (=> b!899481 m!836345))

(declare-fun m!836349 () Bool)

(assert (=> b!899496 m!836349))

(declare-fun m!836351 () Bool)

(assert (=> bm!39913 m!836351))

(declare-fun m!836353 () Bool)

(assert (=> b!899491 m!836353))

(declare-fun m!836355 () Bool)

(assert (=> b!899490 m!836355))

(declare-fun m!836357 () Bool)

(assert (=> b!899490 m!836357))

(declare-fun m!836359 () Bool)

(assert (=> b!899490 m!836359))

(declare-fun m!836361 () Bool)

(assert (=> b!899490 m!836361))

(declare-fun m!836363 () Bool)

(assert (=> b!899490 m!836363))

(declare-fun m!836365 () Bool)

(assert (=> b!899490 m!836365))

(declare-fun m!836367 () Bool)

(assert (=> b!899490 m!836367))

(declare-fun m!836369 () Bool)

(assert (=> b!899490 m!836369))

(declare-fun m!836371 () Bool)

(assert (=> b!899490 m!836371))

(declare-fun m!836373 () Bool)

(assert (=> b!899490 m!836373))

(declare-fun m!836375 () Bool)

(assert (=> b!899490 m!836375))

(assert (=> b!899490 m!836373))

(declare-fun m!836377 () Bool)

(assert (=> b!899490 m!836377))

(assert (=> b!899490 m!836331))

(assert (=> b!899490 m!836357))

(declare-fun m!836379 () Bool)

(assert (=> b!899490 m!836379))

(assert (=> b!899490 m!836377))

(declare-fun m!836381 () Bool)

(assert (=> b!899490 m!836381))

(declare-fun m!836383 () Bool)

(assert (=> b!899490 m!836383))

(assert (=> b!899490 m!836363))

(declare-fun m!836385 () Bool)

(assert (=> b!899490 m!836385))

(assert (=> b!899493 m!836331))

(assert (=> b!899493 m!836331))

(declare-fun m!836387 () Bool)

(assert (=> b!899493 m!836387))

(assert (=> bm!39919 m!836371))

(declare-fun m!836389 () Bool)

(assert (=> bm!39916 m!836389))

(assert (=> b!899482 m!836331))

(assert (=> b!899482 m!836331))

(assert (=> b!899482 m!836387))

(declare-fun m!836391 () Bool)

(assert (=> b!899479 m!836391))

(assert (=> d!111581 m!836227))

(assert (=> b!899341 d!111581))

(declare-fun d!111583 () Bool)

(declare-fun e!503279 () Bool)

(assert (=> d!111583 e!503279))

(declare-fun res!607577 () Bool)

(assert (=> d!111583 (=> res!607577 e!503279)))

(declare-fun lt!406082 () Bool)

(assert (=> d!111583 (= res!607577 (not lt!406082))))

(declare-fun lt!406079 () Bool)

(assert (=> d!111583 (= lt!406082 lt!406079)))

(declare-fun lt!406081 () Unit!30528)

(declare-fun e!503278 () Unit!30528)

(assert (=> d!111583 (= lt!406081 e!503278)))

(declare-fun c!95255 () Bool)

(assert (=> d!111583 (= c!95255 lt!406079)))

(declare-fun containsKey!427 (List!17790 (_ BitVec 64)) Bool)

(assert (=> d!111583 (= lt!406079 (containsKey!427 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))

(assert (=> d!111583 (= (contains!4381 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))) lt!406082)))

(declare-fun b!899508 () Bool)

(declare-fun lt!406080 () Unit!30528)

(assert (=> b!899508 (= e!503278 lt!406080)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!321 (List!17790 (_ BitVec 64)) Unit!30528)

(assert (=> b!899508 (= lt!406080 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))

(declare-datatypes ((Option!460 0))(
  ( (Some!459 (v!11713 V!29423)) (None!458) )
))
(declare-fun isDefined!329 (Option!460) Bool)

(declare-fun getValueByKey!454 (List!17790 (_ BitVec 64)) Option!460)

(assert (=> b!899508 (isDefined!329 (getValueByKey!454 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))

(declare-fun b!899509 () Bool)

(declare-fun Unit!30533 () Unit!30528)

(assert (=> b!899509 (= e!503278 Unit!30533)))

(declare-fun b!899510 () Bool)

(assert (=> b!899510 (= e!503279 (isDefined!329 (getValueByKey!454 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953)))))))

(assert (= (and d!111583 c!95255) b!899508))

(assert (= (and d!111583 (not c!95255)) b!899509))

(assert (= (and d!111583 (not res!607577)) b!899510))

(assert (=> d!111583 m!836223))

(declare-fun m!836393 () Bool)

(assert (=> d!111583 m!836393))

(assert (=> b!899508 m!836223))

(declare-fun m!836395 () Bool)

(assert (=> b!899508 m!836395))

(assert (=> b!899508 m!836223))

(declare-fun m!836397 () Bool)

(assert (=> b!899508 m!836397))

(assert (=> b!899508 m!836397))

(declare-fun m!836399 () Bool)

(assert (=> b!899508 m!836399))

(assert (=> b!899510 m!836223))

(assert (=> b!899510 m!836397))

(assert (=> b!899510 m!836397))

(assert (=> b!899510 m!836399))

(assert (=> b!899341 d!111583))

(declare-fun mapNonEmpty!29178 () Bool)

(declare-fun mapRes!29178 () Bool)

(declare-fun tp!56130 () Bool)

(declare-fun e!503285 () Bool)

(assert (=> mapNonEmpty!29178 (= mapRes!29178 (and tp!56130 e!503285))))

(declare-fun mapValue!29178 () ValueCell!8690)

(declare-fun mapKey!29178 () (_ BitVec 32))

(declare-fun mapRest!29178 () (Array (_ BitVec 32) ValueCell!8690))

(assert (=> mapNonEmpty!29178 (= mapRest!29169 (store mapRest!29178 mapKey!29178 mapValue!29178))))

(declare-fun condMapEmpty!29178 () Bool)

(declare-fun mapDefault!29178 () ValueCell!8690)

(assert (=> mapNonEmpty!29169 (= condMapEmpty!29178 (= mapRest!29169 ((as const (Array (_ BitVec 32) ValueCell!8690)) mapDefault!29178)))))

(declare-fun e!503284 () Bool)

(assert (=> mapNonEmpty!29169 (= tp!56115 (and e!503284 mapRes!29178))))

(declare-fun b!899517 () Bool)

(assert (=> b!899517 (= e!503285 tp_is_empty!18343)))

(declare-fun mapIsEmpty!29178 () Bool)

(assert (=> mapIsEmpty!29178 mapRes!29178))

(declare-fun b!899518 () Bool)

(assert (=> b!899518 (= e!503284 tp_is_empty!18343)))

(assert (= (and mapNonEmpty!29169 condMapEmpty!29178) mapIsEmpty!29178))

(assert (= (and mapNonEmpty!29169 (not condMapEmpty!29178)) mapNonEmpty!29178))

(assert (= (and mapNonEmpty!29178 ((_ is ValueCellFull!8690) mapValue!29178)) b!899517))

(assert (= (and mapNonEmpty!29169 ((_ is ValueCellFull!8690) mapDefault!29178)) b!899518))

(declare-fun m!836401 () Bool)

(assert (=> mapNonEmpty!29178 m!836401))

(declare-fun b_lambda!12979 () Bool)

(assert (= b_lambda!12977 (or (and b!899342 b_free!16015) b_lambda!12979)))

(check-sat (not b!899481) (not bm!39913) (not b!899427) (not d!111567) (not b!899510) (not b!899479) (not bm!39919) (not b!899436) (not b!899490) (not b!899400) (not d!111565) (not bm!39917) (not d!111581) (not mapNonEmpty!29178) (not b!899426) b_and!26325 (not b_lambda!12979) (not b!899430) (not b!899491) (not d!111579) (not b!899485) (not b!899496) (not b!899416) (not b!899425) tp_is_empty!18343 (not d!111573) (not d!111583) (not b!899482) (not bm!39916) (not b_next!16015) (not d!111563) (not b!899493) (not b!899508))
(check-sat b_and!26325 (not b_next!16015))
(get-model)

(declare-fun d!111585 () Bool)

(assert (=> d!111585 (contains!4381 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953)))))

(assert (=> d!111585 true))

(declare-fun _$16!178 () Unit!30528)

(assert (=> d!111585 (= (choose!1497 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (index!37888 lt!405953) (defaultEntry!5412 thiss!1181)) _$16!178)))

(declare-fun bs!25228 () Bool)

(assert (= bs!25228 d!111585))

(assert (=> bs!25228 m!836229))

(assert (=> bs!25228 m!836223))

(assert (=> bs!25228 m!836229))

(assert (=> bs!25228 m!836223))

(assert (=> bs!25228 m!836231))

(assert (=> d!111573 d!111585))

(assert (=> d!111573 d!111575))

(declare-fun b!899527 () Bool)

(declare-fun e!503292 () Bool)

(declare-fun e!503293 () Bool)

(assert (=> b!899527 (= e!503292 e!503293)))

(declare-fun c!95258 () Bool)

(assert (=> b!899527 (= c!95258 (validKeyInArray!0 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111587 () Bool)

(declare-fun res!607582 () Bool)

(assert (=> d!111587 (=> res!607582 e!503292)))

(assert (=> d!111587 (= res!607582 (bvsge #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(assert (=> d!111587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)) e!503292)))

(declare-fun b!899528 () Bool)

(declare-fun e!503294 () Bool)

(declare-fun call!39925 () Bool)

(assert (=> b!899528 (= e!503294 call!39925)))

(declare-fun b!899529 () Bool)

(assert (=> b!899529 (= e!503293 call!39925)))

(declare-fun bm!39922 () Bool)

(assert (=> bm!39922 (= call!39925 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10215 thiss!1181) (mask!26185 thiss!1181)))))

(declare-fun b!899530 () Bool)

(assert (=> b!899530 (= e!503293 e!503294)))

(declare-fun lt!406090 () (_ BitVec 64))

(assert (=> b!899530 (= lt!406090 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406089 () Unit!30528)

(assert (=> b!899530 (= lt!406089 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10215 thiss!1181) lt!406090 #b00000000000000000000000000000000))))

(assert (=> b!899530 (arrayContainsKey!0 (_keys!10215 thiss!1181) lt!406090 #b00000000000000000000000000000000)))

(declare-fun lt!406091 () Unit!30528)

(assert (=> b!899530 (= lt!406091 lt!406089)))

(declare-fun res!607583 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52763 (_ BitVec 32)) SeekEntryResult!8879)

(assert (=> b!899530 (= res!607583 (= (seekEntryOrOpen!0 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) (_keys!10215 thiss!1181) (mask!26185 thiss!1181)) (Found!8879 #b00000000000000000000000000000000)))))

(assert (=> b!899530 (=> (not res!607583) (not e!503294))))

(assert (= (and d!111587 (not res!607582)) b!899527))

(assert (= (and b!899527 c!95258) b!899530))

(assert (= (and b!899527 (not c!95258)) b!899529))

(assert (= (and b!899530 res!607583) b!899528))

(assert (= (or b!899528 b!899529) bm!39922))

(assert (=> b!899527 m!836331))

(assert (=> b!899527 m!836331))

(assert (=> b!899527 m!836387))

(declare-fun m!836403 () Bool)

(assert (=> bm!39922 m!836403))

(assert (=> b!899530 m!836331))

(declare-fun m!836405 () Bool)

(assert (=> b!899530 m!836405))

(declare-fun m!836407 () Bool)

(assert (=> b!899530 m!836407))

(assert (=> b!899530 m!836331))

(declare-fun m!836409 () Bool)

(assert (=> b!899530 m!836409))

(assert (=> b!899426 d!111587))

(declare-fun b!899539 () Bool)

(declare-fun e!503300 () (_ BitVec 32))

(declare-fun call!39928 () (_ BitVec 32))

(assert (=> b!899539 (= e!503300 call!39928)))

(declare-fun b!899540 () Bool)

(assert (=> b!899540 (= e!503300 (bvadd #b00000000000000000000000000000001 call!39928))))

(declare-fun b!899541 () Bool)

(declare-fun e!503299 () (_ BitVec 32))

(assert (=> b!899541 (= e!503299 #b00000000000000000000000000000000)))

(declare-fun b!899542 () Bool)

(assert (=> b!899542 (= e!503299 e!503300)))

(declare-fun c!95263 () Bool)

(assert (=> b!899542 (= c!95263 (validKeyInArray!0 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39925 () Bool)

(assert (=> bm!39925 (= call!39928 (arrayCountValidKeys!0 (_keys!10215 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun d!111589 () Bool)

(declare-fun lt!406094 () (_ BitVec 32))

(assert (=> d!111589 (and (bvsge lt!406094 #b00000000000000000000000000000000) (bvsle lt!406094 (bvsub (size!25810 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111589 (= lt!406094 e!503299)))

(declare-fun c!95264 () Bool)

(assert (=> d!111589 (= c!95264 (bvsge #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(assert (=> d!111589 (and (bvsle #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25810 (_keys!10215 thiss!1181)) (size!25810 (_keys!10215 thiss!1181))))))

(assert (=> d!111589 (= (arrayCountValidKeys!0 (_keys!10215 thiss!1181) #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))) lt!406094)))

(assert (= (and d!111589 c!95264) b!899541))

(assert (= (and d!111589 (not c!95264)) b!899542))

(assert (= (and b!899542 c!95263) b!899540))

(assert (= (and b!899542 (not c!95263)) b!899539))

(assert (= (or b!899540 b!899539) bm!39925))

(assert (=> b!899542 m!836331))

(assert (=> b!899542 m!836331))

(assert (=> b!899542 m!836387))

(declare-fun m!836411 () Bool)

(assert (=> bm!39925 m!836411))

(assert (=> b!899425 d!111589))

(declare-fun d!111591 () Bool)

(declare-fun e!503302 () Bool)

(assert (=> d!111591 e!503302))

(declare-fun res!607584 () Bool)

(assert (=> d!111591 (=> res!607584 e!503302)))

(declare-fun lt!406098 () Bool)

(assert (=> d!111591 (= res!607584 (not lt!406098))))

(declare-fun lt!406095 () Bool)

(assert (=> d!111591 (= lt!406098 lt!406095)))

(declare-fun lt!406097 () Unit!30528)

(declare-fun e!503301 () Unit!30528)

(assert (=> d!111591 (= lt!406097 e!503301)))

(declare-fun c!95265 () Bool)

(assert (=> d!111591 (= c!95265 lt!406095)))

(assert (=> d!111591 (= lt!406095 (containsKey!427 (toList!5340 lt!406066) (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111591 (= (contains!4381 lt!406066 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)) lt!406098)))

(declare-fun b!899543 () Bool)

(declare-fun lt!406096 () Unit!30528)

(assert (=> b!899543 (= e!503301 lt!406096)))

(assert (=> b!899543 (= lt!406096 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5340 lt!406066) (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899543 (isDefined!329 (getValueByKey!454 (toList!5340 lt!406066) (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899544 () Bool)

(declare-fun Unit!30534 () Unit!30528)

(assert (=> b!899544 (= e!503301 Unit!30534)))

(declare-fun b!899545 () Bool)

(assert (=> b!899545 (= e!503302 (isDefined!329 (getValueByKey!454 (toList!5340 lt!406066) (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111591 c!95265) b!899543))

(assert (= (and d!111591 (not c!95265)) b!899544))

(assert (= (and d!111591 (not res!607584)) b!899545))

(assert (=> d!111591 m!836331))

(declare-fun m!836413 () Bool)

(assert (=> d!111591 m!836413))

(assert (=> b!899543 m!836331))

(declare-fun m!836415 () Bool)

(assert (=> b!899543 m!836415))

(assert (=> b!899543 m!836331))

(declare-fun m!836417 () Bool)

(assert (=> b!899543 m!836417))

(assert (=> b!899543 m!836417))

(declare-fun m!836419 () Bool)

(assert (=> b!899543 m!836419))

(assert (=> b!899545 m!836331))

(assert (=> b!899545 m!836417))

(assert (=> b!899545 m!836417))

(assert (=> b!899545 m!836419))

(assert (=> b!899485 d!111591))

(declare-fun b!899557 () Bool)

(declare-fun e!503305 () Bool)

(assert (=> b!899557 (= e!503305 (and (bvsge (extraKeys!5128 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5128 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2253 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!899554 () Bool)

(declare-fun res!607594 () Bool)

(assert (=> b!899554 (=> (not res!607594) (not e!503305))))

(assert (=> b!899554 (= res!607594 (and (= (size!25811 (_values!5419 thiss!1181)) (bvadd (mask!26185 thiss!1181) #b00000000000000000000000000000001)) (= (size!25810 (_keys!10215 thiss!1181)) (size!25811 (_values!5419 thiss!1181))) (bvsge (_size!2253 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2253 thiss!1181) (bvadd (mask!26185 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!111593 () Bool)

(declare-fun res!607595 () Bool)

(assert (=> d!111593 (=> (not res!607595) (not e!503305))))

(assert (=> d!111593 (= res!607595 (validMask!0 (mask!26185 thiss!1181)))))

(assert (=> d!111593 (= (simpleValid!324 thiss!1181) e!503305)))

(declare-fun b!899556 () Bool)

(declare-fun res!607593 () Bool)

(assert (=> b!899556 (=> (not res!607593) (not e!503305))))

(declare-fun size!25816 (LongMapFixedSize!4396) (_ BitVec 32))

(assert (=> b!899556 (= res!607593 (= (size!25816 thiss!1181) (bvadd (_size!2253 thiss!1181) (bvsdiv (bvadd (extraKeys!5128 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!899555 () Bool)

(declare-fun res!607596 () Bool)

(assert (=> b!899555 (=> (not res!607596) (not e!503305))))

(assert (=> b!899555 (= res!607596 (bvsge (size!25816 thiss!1181) (_size!2253 thiss!1181)))))

(assert (= (and d!111593 res!607595) b!899554))

(assert (= (and b!899554 res!607594) b!899555))

(assert (= (and b!899555 res!607596) b!899556))

(assert (= (and b!899556 res!607593) b!899557))

(assert (=> d!111593 m!836227))

(declare-fun m!836421 () Bool)

(assert (=> b!899556 m!836421))

(assert (=> b!899555 m!836421))

(assert (=> d!111567 d!111593))

(declare-fun d!111595 () Bool)

(assert (=> d!111595 (isDefined!329 (getValueByKey!454 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))

(declare-fun lt!406101 () Unit!30528)

(declare-fun choose!1498 (List!17790 (_ BitVec 64)) Unit!30528)

(assert (=> d!111595 (= lt!406101 (choose!1498 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))

(declare-fun e!503308 () Bool)

(assert (=> d!111595 e!503308))

(declare-fun res!607599 () Bool)

(assert (=> d!111595 (=> (not res!607599) (not e!503308))))

(declare-fun isStrictlySorted!485 (List!17790) Bool)

(assert (=> d!111595 (= res!607599 (isStrictlySorted!485 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))))

(assert (=> d!111595 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))) lt!406101)))

(declare-fun b!899560 () Bool)

(assert (=> b!899560 (= e!503308 (containsKey!427 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))

(assert (= (and d!111595 res!607599) b!899560))

(assert (=> d!111595 m!836223))

(assert (=> d!111595 m!836397))

(assert (=> d!111595 m!836397))

(assert (=> d!111595 m!836399))

(assert (=> d!111595 m!836223))

(declare-fun m!836423 () Bool)

(assert (=> d!111595 m!836423))

(declare-fun m!836425 () Bool)

(assert (=> d!111595 m!836425))

(assert (=> b!899560 m!836223))

(assert (=> b!899560 m!836393))

(assert (=> b!899508 d!111595))

(declare-fun d!111597 () Bool)

(declare-fun isEmpty!690 (Option!460) Bool)

(assert (=> d!111597 (= (isDefined!329 (getValueByKey!454 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953)))) (not (isEmpty!690 (getValueByKey!454 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))))

(declare-fun bs!25229 () Bool)

(assert (= bs!25229 d!111597))

(assert (=> bs!25229 m!836397))

(declare-fun m!836427 () Bool)

(assert (=> bs!25229 m!836427))

(assert (=> b!899508 d!111597))

(declare-fun b!899569 () Bool)

(declare-fun e!503313 () Option!460)

(assert (=> b!899569 (= e!503313 (Some!459 (_2!5986 (h!18934 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))))))

(declare-fun b!899570 () Bool)

(declare-fun e!503314 () Option!460)

(assert (=> b!899570 (= e!503313 e!503314)))

(declare-fun c!95271 () Bool)

(assert (=> b!899570 (= c!95271 (and ((_ is Cons!17786) (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (not (= (_1!5986 (h!18934 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))))

(declare-fun d!111599 () Bool)

(declare-fun c!95270 () Bool)

(assert (=> d!111599 (= c!95270 (and ((_ is Cons!17786) (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (= (_1!5986 (h!18934 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953)))))))

(assert (=> d!111599 (= (getValueByKey!454 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))) e!503313)))

(declare-fun b!899571 () Bool)

(assert (=> b!899571 (= e!503314 (getValueByKey!454 (t!25123 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))

(declare-fun b!899572 () Bool)

(assert (=> b!899572 (= e!503314 None!458)))

(assert (= (and d!111599 c!95270) b!899569))

(assert (= (and d!111599 (not c!95270)) b!899570))

(assert (= (and b!899570 c!95271) b!899571))

(assert (= (and b!899570 (not c!95271)) b!899572))

(assert (=> b!899571 m!836223))

(declare-fun m!836429 () Bool)

(assert (=> b!899571 m!836429))

(assert (=> b!899508 d!111599))

(declare-fun b!899591 () Bool)

(declare-fun lt!406106 () SeekEntryResult!8879)

(assert (=> b!899591 (and (bvsge (index!37889 lt!406106) #b00000000000000000000000000000000) (bvslt (index!37889 lt!406106) (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun res!607608 () Bool)

(assert (=> b!899591 (= res!607608 (= (select (arr!25354 (_keys!10215 thiss!1181)) (index!37889 lt!406106)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503326 () Bool)

(assert (=> b!899591 (=> res!607608 e!503326)))

(declare-fun b!899592 () Bool)

(declare-fun e!503328 () SeekEntryResult!8879)

(assert (=> b!899592 (= e!503328 (Intermediate!8879 false (toIndex!0 key!785 (mask!26185 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!899593 () Bool)

(declare-fun e!503329 () SeekEntryResult!8879)

(assert (=> b!899593 (= e!503329 (Intermediate!8879 true (toIndex!0 key!785 (mask!26185 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!899594 () Bool)

(assert (=> b!899594 (= e!503329 e!503328)))

(declare-fun c!95279 () Bool)

(declare-fun lt!406107 () (_ BitVec 64))

(assert (=> b!899594 (= c!95279 (or (= lt!406107 key!785) (= (bvadd lt!406107 lt!406107) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899595 () Bool)

(assert (=> b!899595 (and (bvsge (index!37889 lt!406106) #b00000000000000000000000000000000) (bvslt (index!37889 lt!406106) (size!25810 (_keys!10215 thiss!1181))))))

(assert (=> b!899595 (= e!503326 (= (select (arr!25354 (_keys!10215 thiss!1181)) (index!37889 lt!406106)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899596 () Bool)

(declare-fun e!503325 () Bool)

(assert (=> b!899596 (= e!503325 (bvsge (x!76540 lt!406106) #b01111111111111111111111111111110))))

(declare-fun b!899597 () Bool)

(assert (=> b!899597 (and (bvsge (index!37889 lt!406106) #b00000000000000000000000000000000) (bvslt (index!37889 lt!406106) (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun res!607607 () Bool)

(assert (=> b!899597 (= res!607607 (= (select (arr!25354 (_keys!10215 thiss!1181)) (index!37889 lt!406106)) key!785))))

(assert (=> b!899597 (=> res!607607 e!503326)))

(declare-fun e!503327 () Bool)

(assert (=> b!899597 (= e!503327 e!503326)))

(declare-fun b!899598 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899598 (= e!503328 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26185 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!26185 thiss!1181)) key!785 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)))))

(declare-fun b!899599 () Bool)

(assert (=> b!899599 (= e!503325 e!503327)))

(declare-fun res!607606 () Bool)

(assert (=> b!899599 (= res!607606 (and ((_ is Intermediate!8879) lt!406106) (not (undefined!9691 lt!406106)) (bvslt (x!76540 lt!406106) #b01111111111111111111111111111110) (bvsge (x!76540 lt!406106) #b00000000000000000000000000000000) (bvsge (x!76540 lt!406106) #b00000000000000000000000000000000)))))

(assert (=> b!899599 (=> (not res!607606) (not e!503327))))

(declare-fun d!111601 () Bool)

(assert (=> d!111601 e!503325))

(declare-fun c!95280 () Bool)

(assert (=> d!111601 (= c!95280 (and ((_ is Intermediate!8879) lt!406106) (undefined!9691 lt!406106)))))

(assert (=> d!111601 (= lt!406106 e!503329)))

(declare-fun c!95278 () Bool)

(assert (=> d!111601 (= c!95278 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111601 (= lt!406107 (select (arr!25354 (_keys!10215 thiss!1181)) (toIndex!0 key!785 (mask!26185 thiss!1181))))))

(assert (=> d!111601 (validMask!0 (mask!26185 thiss!1181))))

(assert (=> d!111601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26185 thiss!1181)) key!785 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)) lt!406106)))

(assert (= (and d!111601 c!95278) b!899593))

(assert (= (and d!111601 (not c!95278)) b!899594))

(assert (= (and b!899594 c!95279) b!899592))

(assert (= (and b!899594 (not c!95279)) b!899598))

(assert (= (and d!111601 c!95280) b!899596))

(assert (= (and d!111601 (not c!95280)) b!899599))

(assert (= (and b!899599 res!607606) b!899597))

(assert (= (and b!899597 (not res!607607)) b!899591))

(assert (= (and b!899591 (not res!607608)) b!899595))

(declare-fun m!836431 () Bool)

(assert (=> b!899595 m!836431))

(assert (=> d!111601 m!836317))

(declare-fun m!836433 () Bool)

(assert (=> d!111601 m!836433))

(assert (=> d!111601 m!836227))

(assert (=> b!899591 m!836431))

(assert (=> b!899598 m!836317))

(declare-fun m!836435 () Bool)

(assert (=> b!899598 m!836435))

(assert (=> b!899598 m!836435))

(declare-fun m!836437 () Bool)

(assert (=> b!899598 m!836437))

(assert (=> b!899597 m!836431))

(assert (=> d!111565 d!111601))

(declare-fun d!111603 () Bool)

(declare-fun lt!406113 () (_ BitVec 32))

(declare-fun lt!406112 () (_ BitVec 32))

(assert (=> d!111603 (= lt!406113 (bvmul (bvxor lt!406112 (bvlshr lt!406112 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111603 (= lt!406112 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111603 (and (bvsge (mask!26185 thiss!1181) #b00000000000000000000000000000000) (let ((res!607609 (let ((h!18937 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76557 (bvmul (bvxor h!18937 (bvlshr h!18937 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76557 (bvlshr x!76557 #b00000000000000000000000000001101)) (mask!26185 thiss!1181)))))) (and (bvslt res!607609 (bvadd (mask!26185 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!607609 #b00000000000000000000000000000000))))))

(assert (=> d!111603 (= (toIndex!0 key!785 (mask!26185 thiss!1181)) (bvand (bvxor lt!406113 (bvlshr lt!406113 #b00000000000000000000000000001101)) (mask!26185 thiss!1181)))))

(assert (=> d!111565 d!111603))

(assert (=> d!111565 d!111575))

(assert (=> d!111579 d!111577))

(declare-fun d!111605 () Bool)

(assert (=> d!111605 (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111605 true))

(declare-fun _$60!418 () Unit!30528)

(assert (=> d!111605 (= (choose!13 (_keys!10215 thiss!1181) key!785 (index!37888 lt!405953)) _$60!418)))

(declare-fun bs!25230 () Bool)

(assert (= bs!25230 d!111605))

(assert (=> bs!25230 m!836225))

(assert (=> d!111579 d!111605))

(declare-fun b!899624 () Bool)

(declare-fun e!503347 () Bool)

(declare-fun e!503348 () Bool)

(assert (=> b!899624 (= e!503347 e!503348)))

(assert (=> b!899624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun res!607618 () Bool)

(declare-fun lt!406128 () ListLongMap!10649)

(assert (=> b!899624 (= res!607618 (contains!4381 lt!406128 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899624 (=> (not res!607618) (not e!503348))))

(declare-fun b!899625 () Bool)

(declare-fun e!503346 () Bool)

(assert (=> b!899625 (= e!503346 (= lt!406128 (getCurrentListMapNoExtraKeys!3322 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5412 thiss!1181))))))

(declare-fun b!899626 () Bool)

(declare-fun e!503344 () ListLongMap!10649)

(declare-fun call!39931 () ListLongMap!10649)

(assert (=> b!899626 (= e!503344 call!39931)))

(declare-fun bm!39928 () Bool)

(assert (=> bm!39928 (= call!39931 (getCurrentListMapNoExtraKeys!3322 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5412 thiss!1181)))))

(declare-fun b!899627 () Bool)

(declare-fun lt!406134 () Unit!30528)

(declare-fun lt!406133 () Unit!30528)

(assert (=> b!899627 (= lt!406134 lt!406133)))

(declare-fun lt!406129 () V!29423)

(declare-fun lt!406132 () (_ BitVec 64))

(declare-fun lt!406131 () ListLongMap!10649)

(declare-fun lt!406130 () (_ BitVec 64))

(assert (=> b!899627 (not (contains!4381 (+!2601 lt!406131 (tuple2!11951 lt!406130 lt!406129)) lt!406132))))

(declare-fun addStillNotContains!216 (ListLongMap!10649 (_ BitVec 64) V!29423 (_ BitVec 64)) Unit!30528)

(assert (=> b!899627 (= lt!406133 (addStillNotContains!216 lt!406131 lt!406130 lt!406129 lt!406132))))

(assert (=> b!899627 (= lt!406132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!899627 (= lt!406129 (get!13343 (select (arr!25355 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1321 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!899627 (= lt!406130 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899627 (= lt!406131 call!39931)))

(assert (=> b!899627 (= e!503344 (+!2601 call!39931 (tuple2!11951 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) (get!13343 (select (arr!25355 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1321 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!899628 () Bool)

(declare-fun isEmpty!691 (ListLongMap!10649) Bool)

(assert (=> b!899628 (= e!503346 (isEmpty!691 lt!406128))))

(declare-fun d!111607 () Bool)

(declare-fun e!503349 () Bool)

(assert (=> d!111607 e!503349))

(declare-fun res!607619 () Bool)

(assert (=> d!111607 (=> (not res!607619) (not e!503349))))

(assert (=> d!111607 (= res!607619 (not (contains!4381 lt!406128 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!503345 () ListLongMap!10649)

(assert (=> d!111607 (= lt!406128 e!503345)))

(declare-fun c!95289 () Bool)

(assert (=> d!111607 (= c!95289 (bvsge #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(assert (=> d!111607 (validMask!0 (mask!26185 thiss!1181))))

(assert (=> d!111607 (= (getCurrentListMapNoExtraKeys!3322 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) lt!406128)))

(declare-fun b!899629 () Bool)

(declare-fun res!607620 () Bool)

(assert (=> b!899629 (=> (not res!607620) (not e!503349))))

(assert (=> b!899629 (= res!607620 (not (contains!4381 lt!406128 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899630 () Bool)

(assert (=> b!899630 (= e!503345 e!503344)))

(declare-fun c!95292 () Bool)

(assert (=> b!899630 (= c!95292 (validKeyInArray!0 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899631 () Bool)

(assert (=> b!899631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(assert (=> b!899631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25811 (_values!5419 thiss!1181))))))

(assert (=> b!899631 (= e!503348 (= (apply!406 lt!406128 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)) (get!13343 (select (arr!25355 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1321 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!899632 () Bool)

(assert (=> b!899632 (= e!503347 e!503346)))

(declare-fun c!95291 () Bool)

(assert (=> b!899632 (= c!95291 (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun b!899633 () Bool)

(assert (=> b!899633 (= e!503345 (ListLongMap!10650 Nil!17787))))

(declare-fun b!899634 () Bool)

(declare-fun e!503350 () Bool)

(assert (=> b!899634 (= e!503350 (validKeyInArray!0 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899634 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!899635 () Bool)

(assert (=> b!899635 (= e!503349 e!503347)))

(declare-fun c!95290 () Bool)

(assert (=> b!899635 (= c!95290 e!503350)))

(declare-fun res!607621 () Bool)

(assert (=> b!899635 (=> (not res!607621) (not e!503350))))

(assert (=> b!899635 (= res!607621 (bvslt #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(assert (= (and d!111607 c!95289) b!899633))

(assert (= (and d!111607 (not c!95289)) b!899630))

(assert (= (and b!899630 c!95292) b!899627))

(assert (= (and b!899630 (not c!95292)) b!899626))

(assert (= (or b!899627 b!899626) bm!39928))

(assert (= (and d!111607 res!607619) b!899629))

(assert (= (and b!899629 res!607620) b!899635))

(assert (= (and b!899635 res!607621) b!899634))

(assert (= (and b!899635 c!95290) b!899624))

(assert (= (and b!899635 (not c!95290)) b!899632))

(assert (= (and b!899624 res!607618) b!899631))

(assert (= (and b!899632 c!95291) b!899625))

(assert (= (and b!899632 (not c!95291)) b!899628))

(declare-fun b_lambda!12981 () Bool)

(assert (=> (not b_lambda!12981) (not b!899627)))

(assert (=> b!899627 t!25126))

(declare-fun b_and!26327 () Bool)

(assert (= b_and!26325 (and (=> t!25126 result!10143) b_and!26327)))

(declare-fun b_lambda!12983 () Bool)

(assert (=> (not b_lambda!12983) (not b!899631)))

(assert (=> b!899631 t!25126))

(declare-fun b_and!26329 () Bool)

(assert (= b_and!26327 (and (=> t!25126 result!10143) b_and!26329)))

(assert (=> b!899627 m!836345))

(assert (=> b!899627 m!836343))

(assert (=> b!899627 m!836347))

(declare-fun m!836439 () Bool)

(assert (=> b!899627 m!836439))

(assert (=> b!899627 m!836331))

(declare-fun m!836441 () Bool)

(assert (=> b!899627 m!836441))

(declare-fun m!836443 () Bool)

(assert (=> b!899627 m!836443))

(declare-fun m!836445 () Bool)

(assert (=> b!899627 m!836445))

(assert (=> b!899627 m!836443))

(assert (=> b!899627 m!836343))

(assert (=> b!899627 m!836345))

(declare-fun m!836447 () Bool)

(assert (=> d!111607 m!836447))

(assert (=> d!111607 m!836227))

(declare-fun m!836449 () Bool)

(assert (=> b!899625 m!836449))

(assert (=> b!899630 m!836331))

(assert (=> b!899630 m!836331))

(assert (=> b!899630 m!836387))

(assert (=> bm!39928 m!836449))

(assert (=> b!899634 m!836331))

(assert (=> b!899634 m!836331))

(assert (=> b!899634 m!836387))

(declare-fun m!836451 () Bool)

(assert (=> b!899629 m!836451))

(assert (=> b!899624 m!836331))

(assert (=> b!899624 m!836331))

(declare-fun m!836453 () Bool)

(assert (=> b!899624 m!836453))

(assert (=> b!899631 m!836345))

(assert (=> b!899631 m!836343))

(assert (=> b!899631 m!836347))

(assert (=> b!899631 m!836331))

(assert (=> b!899631 m!836331))

(declare-fun m!836455 () Bool)

(assert (=> b!899631 m!836455))

(assert (=> b!899631 m!836343))

(assert (=> b!899631 m!836345))

(declare-fun m!836457 () Bool)

(assert (=> b!899628 m!836457))

(assert (=> bm!39919 d!111607))

(declare-fun d!111609 () Bool)

(assert (=> d!111609 (= (validKeyInArray!0 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899482 d!111609))

(declare-fun d!111611 () Bool)

(declare-fun get!13344 (Option!460) V!29423)

(assert (=> d!111611 (= (apply!406 lt!406066 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)) (get!13344 (getValueByKey!454 (toList!5340 lt!406066) (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25231 () Bool)

(assert (= bs!25231 d!111611))

(assert (=> bs!25231 m!836331))

(assert (=> bs!25231 m!836417))

(assert (=> bs!25231 m!836417))

(declare-fun m!836459 () Bool)

(assert (=> bs!25231 m!836459))

(assert (=> b!899481 d!111611))

(declare-fun d!111613 () Bool)

(declare-fun c!95295 () Bool)

(assert (=> d!111613 (= c!95295 ((_ is ValueCellFull!8690) (select (arr!25355 (_values!5419 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503353 () V!29423)

(assert (=> d!111613 (= (get!13343 (select (arr!25355 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1321 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!503353)))

(declare-fun b!899640 () Bool)

(declare-fun get!13345 (ValueCell!8690 V!29423) V!29423)

(assert (=> b!899640 (= e!503353 (get!13345 (select (arr!25355 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1321 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899641 () Bool)

(declare-fun get!13346 (ValueCell!8690 V!29423) V!29423)

(assert (=> b!899641 (= e!503353 (get!13346 (select (arr!25355 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1321 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111613 c!95295) b!899640))

(assert (= (and d!111613 (not c!95295)) b!899641))

(assert (=> b!899640 m!836345))

(assert (=> b!899640 m!836343))

(declare-fun m!836461 () Bool)

(assert (=> b!899640 m!836461))

(assert (=> b!899641 m!836345))

(assert (=> b!899641 m!836343))

(declare-fun m!836463 () Bool)

(assert (=> b!899641 m!836463))

(assert (=> b!899481 d!111613))

(declare-fun d!111615 () Bool)

(assert (=> d!111615 (= (apply!406 lt!406066 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13344 (getValueByKey!454 (toList!5340 lt!406066) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25232 () Bool)

(assert (= bs!25232 d!111615))

(declare-fun m!836465 () Bool)

(assert (=> bs!25232 m!836465))

(assert (=> bs!25232 m!836465))

(declare-fun m!836467 () Bool)

(assert (=> bs!25232 m!836467))

(assert (=> b!899496 d!111615))

(declare-fun d!111617 () Bool)

(declare-fun e!503356 () Bool)

(assert (=> d!111617 e!503356))

(declare-fun res!607626 () Bool)

(assert (=> d!111617 (=> (not res!607626) (not e!503356))))

(declare-fun lt!406146 () ListLongMap!10649)

(assert (=> d!111617 (= res!607626 (contains!4381 lt!406146 (_1!5986 (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))))

(declare-fun lt!406145 () List!17790)

(assert (=> d!111617 (= lt!406146 (ListLongMap!10650 lt!406145))))

(declare-fun lt!406143 () Unit!30528)

(declare-fun lt!406144 () Unit!30528)

(assert (=> d!111617 (= lt!406143 lt!406144)))

(assert (=> d!111617 (= (getValueByKey!454 lt!406145 (_1!5986 (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))) (Some!459 (_2!5986 (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!249 (List!17790 (_ BitVec 64) V!29423) Unit!30528)

(assert (=> d!111617 (= lt!406144 (lemmaContainsTupThenGetReturnValue!249 lt!406145 (_1!5986 (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))) (_2!5986 (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))))

(declare-fun insertStrictlySorted!306 (List!17790 (_ BitVec 64) V!29423) List!17790)

(assert (=> d!111617 (= lt!406145 (insertStrictlySorted!306 (toList!5340 (ite c!95248 call!39919 (ite c!95252 call!39916 call!39920))) (_1!5986 (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))) (_2!5986 (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))))

(assert (=> d!111617 (= (+!2601 (ite c!95248 call!39919 (ite c!95252 call!39916 call!39920)) (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))) lt!406146)))

(declare-fun b!899646 () Bool)

(declare-fun res!607627 () Bool)

(assert (=> b!899646 (=> (not res!607627) (not e!503356))))

(assert (=> b!899646 (= res!607627 (= (getValueByKey!454 (toList!5340 lt!406146) (_1!5986 (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))) (Some!459 (_2!5986 (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))))

(declare-fun b!899647 () Bool)

(declare-fun contains!4383 (List!17790 tuple2!11950) Bool)

(assert (=> b!899647 (= e!503356 (contains!4383 (toList!5340 lt!406146) (ite (or c!95248 c!95252) (tuple2!11951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(assert (= (and d!111617 res!607626) b!899646))

(assert (= (and b!899646 res!607627) b!899647))

(declare-fun m!836469 () Bool)

(assert (=> d!111617 m!836469))

(declare-fun m!836471 () Bool)

(assert (=> d!111617 m!836471))

(declare-fun m!836473 () Bool)

(assert (=> d!111617 m!836473))

(declare-fun m!836475 () Bool)

(assert (=> d!111617 m!836475))

(declare-fun m!836477 () Bool)

(assert (=> b!899646 m!836477))

(declare-fun m!836479 () Bool)

(assert (=> b!899647 m!836479))

(assert (=> bm!39913 d!111617))

(declare-fun d!111619 () Bool)

(assert (=> d!111619 (= (inRange!0 (index!37888 lt!405986) (mask!26185 thiss!1181)) (and (bvsge (index!37888 lt!405986) #b00000000000000000000000000000000) (bvslt (index!37888 lt!405986) (bvadd (mask!26185 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899400 d!111619))

(declare-fun d!111621 () Bool)

(declare-fun res!607628 () Bool)

(declare-fun e!503357 () Bool)

(assert (=> d!111621 (=> res!607628 e!503357)))

(assert (=> d!111621 (= res!607628 (= (select (arr!25354 (_keys!10215 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111621 (= (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!503357)))

(declare-fun b!899648 () Bool)

(declare-fun e!503358 () Bool)

(assert (=> b!899648 (= e!503357 e!503358)))

(declare-fun res!607629 () Bool)

(assert (=> b!899648 (=> (not res!607629) (not e!503358))))

(assert (=> b!899648 (= res!607629 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25810 (_keys!10215 thiss!1181))))))

(declare-fun b!899649 () Bool)

(assert (=> b!899649 (= e!503358 (arrayContainsKey!0 (_keys!10215 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111621 (not res!607628)) b!899648))

(assert (= (and b!899648 res!607629) b!899649))

(declare-fun m!836481 () Bool)

(assert (=> d!111621 m!836481))

(declare-fun m!836483 () Bool)

(assert (=> b!899649 m!836483))

(assert (=> b!899436 d!111621))

(declare-fun d!111623 () Bool)

(assert (=> d!111623 (= (apply!406 lt!406066 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13344 (getValueByKey!454 (toList!5340 lt!406066) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25233 () Bool)

(assert (= bs!25233 d!111623))

(declare-fun m!836485 () Bool)

(assert (=> bs!25233 m!836485))

(assert (=> bs!25233 m!836485))

(declare-fun m!836487 () Bool)

(assert (=> bs!25233 m!836487))

(assert (=> b!899479 d!111623))

(assert (=> b!899493 d!111609))

(assert (=> d!111563 d!111565))

(declare-fun d!111625 () Bool)

(declare-fun e!503361 () Bool)

(assert (=> d!111625 e!503361))

(declare-fun res!607632 () Bool)

(assert (=> d!111625 (=> res!607632 e!503361)))

(declare-fun lt!406149 () SeekEntryResult!8879)

(assert (=> d!111625 (= res!607632 (not ((_ is Found!8879) lt!406149)))))

(assert (=> d!111625 (= lt!406149 (seekEntry!0 key!785 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)))))

(assert (=> d!111625 true))

(declare-fun _$36!366 () Unit!30528)

(assert (=> d!111625 (= (choose!1496 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) key!785) _$36!366)))

(declare-fun b!899652 () Bool)

(assert (=> b!899652 (= e!503361 (inRange!0 (index!37888 lt!406149) (mask!26185 thiss!1181)))))

(assert (= (and d!111625 (not res!607632)) b!899652))

(assert (=> d!111625 m!836247))

(declare-fun m!836489 () Bool)

(assert (=> b!899652 m!836489))

(assert (=> d!111563 d!111625))

(assert (=> d!111563 d!111575))

(assert (=> d!111581 d!111575))

(declare-fun d!111627 () Bool)

(declare-fun e!503362 () Bool)

(assert (=> d!111627 e!503362))

(declare-fun res!607633 () Bool)

(assert (=> d!111627 (=> (not res!607633) (not e!503362))))

(declare-fun lt!406153 () ListLongMap!10649)

(assert (=> d!111627 (= res!607633 (contains!4381 lt!406153 (_1!5986 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(declare-fun lt!406152 () List!17790)

(assert (=> d!111627 (= lt!406153 (ListLongMap!10650 lt!406152))))

(declare-fun lt!406150 () Unit!30528)

(declare-fun lt!406151 () Unit!30528)

(assert (=> d!111627 (= lt!406150 lt!406151)))

(assert (=> d!111627 (= (getValueByKey!454 lt!406152 (_1!5986 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))) (Some!459 (_2!5986 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(assert (=> d!111627 (= lt!406151 (lemmaContainsTupThenGetReturnValue!249 lt!406152 (_1!5986 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))) (_2!5986 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(assert (=> d!111627 (= lt!406152 (insertStrictlySorted!306 (toList!5340 call!39917) (_1!5986 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))) (_2!5986 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(assert (=> d!111627 (= (+!2601 call!39917 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))) lt!406153)))

(declare-fun b!899653 () Bool)

(declare-fun res!607634 () Bool)

(assert (=> b!899653 (=> (not res!607634) (not e!503362))))

(assert (=> b!899653 (= res!607634 (= (getValueByKey!454 (toList!5340 lt!406153) (_1!5986 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))) (Some!459 (_2!5986 (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))))

(declare-fun b!899654 () Bool)

(assert (=> b!899654 (= e!503362 (contains!4383 (toList!5340 lt!406153) (tuple2!11951 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))

(assert (= (and d!111627 res!607633) b!899653))

(assert (= (and b!899653 res!607634) b!899654))

(declare-fun m!836491 () Bool)

(assert (=> d!111627 m!836491))

(declare-fun m!836493 () Bool)

(assert (=> d!111627 m!836493))

(declare-fun m!836495 () Bool)

(assert (=> d!111627 m!836495))

(declare-fun m!836497 () Bool)

(assert (=> d!111627 m!836497))

(declare-fun m!836499 () Bool)

(assert (=> b!899653 m!836499))

(declare-fun m!836501 () Bool)

(assert (=> b!899654 m!836501))

(assert (=> b!899491 d!111627))

(declare-fun d!111629 () Bool)

(declare-fun e!503363 () Bool)

(assert (=> d!111629 e!503363))

(declare-fun res!607635 () Bool)

(assert (=> d!111629 (=> (not res!607635) (not e!503363))))

(declare-fun lt!406157 () ListLongMap!10649)

(assert (=> d!111629 (= res!607635 (contains!4381 lt!406157 (_1!5986 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181)))))))

(declare-fun lt!406156 () List!17790)

(assert (=> d!111629 (= lt!406157 (ListLongMap!10650 lt!406156))))

(declare-fun lt!406154 () Unit!30528)

(declare-fun lt!406155 () Unit!30528)

(assert (=> d!111629 (= lt!406154 lt!406155)))

(assert (=> d!111629 (= (getValueByKey!454 lt!406156 (_1!5986 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181)))) (Some!459 (_2!5986 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181)))))))

(assert (=> d!111629 (= lt!406155 (lemmaContainsTupThenGetReturnValue!249 lt!406156 (_1!5986 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181))) (_2!5986 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181)))))))

(assert (=> d!111629 (= lt!406156 (insertStrictlySorted!306 (toList!5340 lt!406062) (_1!5986 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181))) (_2!5986 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181)))))))

(assert (=> d!111629 (= (+!2601 lt!406062 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181))) lt!406157)))

(declare-fun b!899655 () Bool)

(declare-fun res!607636 () Bool)

(assert (=> b!899655 (=> (not res!607636) (not e!503363))))

(assert (=> b!899655 (= res!607636 (= (getValueByKey!454 (toList!5340 lt!406157) (_1!5986 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181)))) (Some!459 (_2!5986 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181))))))))

(declare-fun b!899656 () Bool)

(assert (=> b!899656 (= e!503363 (contains!4383 (toList!5340 lt!406157) (tuple2!11951 lt!406068 (minValue!5232 thiss!1181))))))

(assert (= (and d!111629 res!607635) b!899655))

(assert (= (and b!899655 res!607636) b!899656))

(declare-fun m!836503 () Bool)

(assert (=> d!111629 m!836503))

(declare-fun m!836505 () Bool)

(assert (=> d!111629 m!836505))

(declare-fun m!836507 () Bool)

(assert (=> d!111629 m!836507))

(declare-fun m!836509 () Bool)

(assert (=> d!111629 m!836509))

(declare-fun m!836511 () Bool)

(assert (=> b!899655 m!836511))

(declare-fun m!836513 () Bool)

(assert (=> b!899656 m!836513))

(assert (=> b!899490 d!111629))

(declare-fun d!111631 () Bool)

(assert (=> d!111631 (= (apply!406 lt!406058 lt!406052) (get!13344 (getValueByKey!454 (toList!5340 lt!406058) lt!406052)))))

(declare-fun bs!25234 () Bool)

(assert (= bs!25234 d!111631))

(declare-fun m!836515 () Bool)

(assert (=> bs!25234 m!836515))

(assert (=> bs!25234 m!836515))

(declare-fun m!836517 () Bool)

(assert (=> bs!25234 m!836517))

(assert (=> b!899490 d!111631))

(declare-fun d!111633 () Bool)

(assert (=> d!111633 (= (apply!406 (+!2601 lt!406056 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181))) lt!406063) (get!13344 (getValueByKey!454 (toList!5340 (+!2601 lt!406056 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181)))) lt!406063)))))

(declare-fun bs!25235 () Bool)

(assert (= bs!25235 d!111633))

(declare-fun m!836519 () Bool)

(assert (=> bs!25235 m!836519))

(assert (=> bs!25235 m!836519))

(declare-fun m!836521 () Bool)

(assert (=> bs!25235 m!836521))

(assert (=> b!899490 d!111633))

(declare-fun d!111635 () Bool)

(assert (=> d!111635 (= (apply!406 (+!2601 lt!406062 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181))) lt!406060) (get!13344 (getValueByKey!454 (toList!5340 (+!2601 lt!406062 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181)))) lt!406060)))))

(declare-fun bs!25236 () Bool)

(assert (= bs!25236 d!111635))

(declare-fun m!836523 () Bool)

(assert (=> bs!25236 m!836523))

(assert (=> bs!25236 m!836523))

(declare-fun m!836525 () Bool)

(assert (=> bs!25236 m!836525))

(assert (=> b!899490 d!111635))

(declare-fun d!111637 () Bool)

(assert (=> d!111637 (= (apply!406 lt!406056 lt!406063) (get!13344 (getValueByKey!454 (toList!5340 lt!406056) lt!406063)))))

(declare-fun bs!25237 () Bool)

(assert (= bs!25237 d!111637))

(declare-fun m!836527 () Bool)

(assert (=> bs!25237 m!836527))

(assert (=> bs!25237 m!836527))

(declare-fun m!836529 () Bool)

(assert (=> bs!25237 m!836529))

(assert (=> b!899490 d!111637))

(declare-fun d!111639 () Bool)

(declare-fun e!503364 () Bool)

(assert (=> d!111639 e!503364))

(declare-fun res!607637 () Bool)

(assert (=> d!111639 (=> (not res!607637) (not e!503364))))

(declare-fun lt!406161 () ListLongMap!10649)

(assert (=> d!111639 (= res!607637 (contains!4381 lt!406161 (_1!5986 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181)))))))

(declare-fun lt!406160 () List!17790)

(assert (=> d!111639 (= lt!406161 (ListLongMap!10650 lt!406160))))

(declare-fun lt!406158 () Unit!30528)

(declare-fun lt!406159 () Unit!30528)

(assert (=> d!111639 (= lt!406158 lt!406159)))

(assert (=> d!111639 (= (getValueByKey!454 lt!406160 (_1!5986 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181)))) (Some!459 (_2!5986 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111639 (= lt!406159 (lemmaContainsTupThenGetReturnValue!249 lt!406160 (_1!5986 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181))) (_2!5986 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111639 (= lt!406160 (insertStrictlySorted!306 (toList!5340 lt!406053) (_1!5986 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181))) (_2!5986 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111639 (= (+!2601 lt!406053 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181))) lt!406161)))

(declare-fun b!899657 () Bool)

(declare-fun res!607638 () Bool)

(assert (=> b!899657 (=> (not res!607638) (not e!503364))))

(assert (=> b!899657 (= res!607638 (= (getValueByKey!454 (toList!5340 lt!406161) (_1!5986 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181)))) (Some!459 (_2!5986 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181))))))))

(declare-fun b!899658 () Bool)

(assert (=> b!899658 (= e!503364 (contains!4383 (toList!5340 lt!406161) (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181))))))

(assert (= (and d!111639 res!607637) b!899657))

(assert (= (and b!899657 res!607638) b!899658))

(declare-fun m!836531 () Bool)

(assert (=> d!111639 m!836531))

(declare-fun m!836533 () Bool)

(assert (=> d!111639 m!836533))

(declare-fun m!836535 () Bool)

(assert (=> d!111639 m!836535))

(declare-fun m!836537 () Bool)

(assert (=> d!111639 m!836537))

(declare-fun m!836539 () Bool)

(assert (=> b!899657 m!836539))

(declare-fun m!836541 () Bool)

(assert (=> b!899658 m!836541))

(assert (=> b!899490 d!111639))

(declare-fun d!111641 () Bool)

(assert (=> d!111641 (= (apply!406 (+!2601 lt!406062 (tuple2!11951 lt!406068 (minValue!5232 thiss!1181))) lt!406060) (apply!406 lt!406062 lt!406060))))

(declare-fun lt!406164 () Unit!30528)

(declare-fun choose!1499 (ListLongMap!10649 (_ BitVec 64) V!29423 (_ BitVec 64)) Unit!30528)

(assert (=> d!111641 (= lt!406164 (choose!1499 lt!406062 lt!406068 (minValue!5232 thiss!1181) lt!406060))))

(declare-fun e!503367 () Bool)

(assert (=> d!111641 e!503367))

(declare-fun res!607641 () Bool)

(assert (=> d!111641 (=> (not res!607641) (not e!503367))))

(assert (=> d!111641 (= res!607641 (contains!4381 lt!406062 lt!406060))))

(assert (=> d!111641 (= (addApplyDifferent!332 lt!406062 lt!406068 (minValue!5232 thiss!1181) lt!406060) lt!406164)))

(declare-fun b!899662 () Bool)

(assert (=> b!899662 (= e!503367 (not (= lt!406060 lt!406068)))))

(assert (= (and d!111641 res!607641) b!899662))

(assert (=> d!111641 m!836363))

(declare-fun m!836543 () Bool)

(assert (=> d!111641 m!836543))

(assert (=> d!111641 m!836363))

(assert (=> d!111641 m!836365))

(assert (=> d!111641 m!836369))

(declare-fun m!836545 () Bool)

(assert (=> d!111641 m!836545))

(assert (=> b!899490 d!111641))

(declare-fun d!111643 () Bool)

(assert (=> d!111643 (= (apply!406 lt!406062 lt!406060) (get!13344 (getValueByKey!454 (toList!5340 lt!406062) lt!406060)))))

(declare-fun bs!25238 () Bool)

(assert (= bs!25238 d!111643))

(declare-fun m!836547 () Bool)

(assert (=> bs!25238 m!836547))

(assert (=> bs!25238 m!836547))

(declare-fun m!836549 () Bool)

(assert (=> bs!25238 m!836549))

(assert (=> b!899490 d!111643))

(declare-fun d!111645 () Bool)

(assert (=> d!111645 (= (apply!406 (+!2601 lt!406058 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181))) lt!406052) (get!13344 (getValueByKey!454 (toList!5340 (+!2601 lt!406058 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181)))) lt!406052)))))

(declare-fun bs!25239 () Bool)

(assert (= bs!25239 d!111645))

(declare-fun m!836551 () Bool)

(assert (=> bs!25239 m!836551))

(assert (=> bs!25239 m!836551))

(declare-fun m!836553 () Bool)

(assert (=> bs!25239 m!836553))

(assert (=> b!899490 d!111645))

(assert (=> b!899490 d!111607))

(declare-fun d!111647 () Bool)

(declare-fun e!503368 () Bool)

(assert (=> d!111647 e!503368))

(declare-fun res!607642 () Bool)

(assert (=> d!111647 (=> (not res!607642) (not e!503368))))

(declare-fun lt!406168 () ListLongMap!10649)

(assert (=> d!111647 (= res!607642 (contains!4381 lt!406168 (_1!5986 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181)))))))

(declare-fun lt!406167 () List!17790)

(assert (=> d!111647 (= lt!406168 (ListLongMap!10650 lt!406167))))

(declare-fun lt!406165 () Unit!30528)

(declare-fun lt!406166 () Unit!30528)

(assert (=> d!111647 (= lt!406165 lt!406166)))

(assert (=> d!111647 (= (getValueByKey!454 lt!406167 (_1!5986 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181)))) (Some!459 (_2!5986 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111647 (= lt!406166 (lemmaContainsTupThenGetReturnValue!249 lt!406167 (_1!5986 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181))) (_2!5986 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111647 (= lt!406167 (insertStrictlySorted!306 (toList!5340 lt!406058) (_1!5986 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181))) (_2!5986 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111647 (= (+!2601 lt!406058 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181))) lt!406168)))

(declare-fun b!899663 () Bool)

(declare-fun res!607643 () Bool)

(assert (=> b!899663 (=> (not res!607643) (not e!503368))))

(assert (=> b!899663 (= res!607643 (= (getValueByKey!454 (toList!5340 lt!406168) (_1!5986 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181)))) (Some!459 (_2!5986 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181))))))))

(declare-fun b!899664 () Bool)

(assert (=> b!899664 (= e!503368 (contains!4383 (toList!5340 lt!406168) (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181))))))

(assert (= (and d!111647 res!607642) b!899663))

(assert (= (and b!899663 res!607643) b!899664))

(declare-fun m!836555 () Bool)

(assert (=> d!111647 m!836555))

(declare-fun m!836557 () Bool)

(assert (=> d!111647 m!836557))

(declare-fun m!836559 () Bool)

(assert (=> d!111647 m!836559))

(declare-fun m!836561 () Bool)

(assert (=> d!111647 m!836561))

(declare-fun m!836563 () Bool)

(assert (=> b!899663 m!836563))

(declare-fun m!836565 () Bool)

(assert (=> b!899664 m!836565))

(assert (=> b!899490 d!111647))

(declare-fun d!111649 () Bool)

(assert (=> d!111649 (contains!4381 (+!2601 lt!406053 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181))) lt!406067)))

(declare-fun lt!406171 () Unit!30528)

(declare-fun choose!1500 (ListLongMap!10649 (_ BitVec 64) V!29423 (_ BitVec 64)) Unit!30528)

(assert (=> d!111649 (= lt!406171 (choose!1500 lt!406053 lt!406057 (zeroValue!5232 thiss!1181) lt!406067))))

(assert (=> d!111649 (contains!4381 lt!406053 lt!406067)))

(assert (=> d!111649 (= (addStillContains!332 lt!406053 lt!406057 (zeroValue!5232 thiss!1181) lt!406067) lt!406171)))

(declare-fun bs!25240 () Bool)

(assert (= bs!25240 d!111649))

(assert (=> bs!25240 m!836357))

(assert (=> bs!25240 m!836357))

(assert (=> bs!25240 m!836359))

(declare-fun m!836567 () Bool)

(assert (=> bs!25240 m!836567))

(declare-fun m!836569 () Bool)

(assert (=> bs!25240 m!836569))

(assert (=> b!899490 d!111649))

(declare-fun d!111651 () Bool)

(assert (=> d!111651 (= (apply!406 (+!2601 lt!406058 (tuple2!11951 lt!406055 (zeroValue!5232 thiss!1181))) lt!406052) (apply!406 lt!406058 lt!406052))))

(declare-fun lt!406172 () Unit!30528)

(assert (=> d!111651 (= lt!406172 (choose!1499 lt!406058 lt!406055 (zeroValue!5232 thiss!1181) lt!406052))))

(declare-fun e!503369 () Bool)

(assert (=> d!111651 e!503369))

(declare-fun res!607644 () Bool)

(assert (=> d!111651 (=> (not res!607644) (not e!503369))))

(assert (=> d!111651 (= res!607644 (contains!4381 lt!406058 lt!406052))))

(assert (=> d!111651 (= (addApplyDifferent!332 lt!406058 lt!406055 (zeroValue!5232 thiss!1181) lt!406052) lt!406172)))

(declare-fun b!899666 () Bool)

(assert (=> b!899666 (= e!503369 (not (= lt!406052 lt!406055)))))

(assert (= (and d!111651 res!607644) b!899666))

(assert (=> d!111651 m!836377))

(declare-fun m!836571 () Bool)

(assert (=> d!111651 m!836571))

(assert (=> d!111651 m!836377))

(assert (=> d!111651 m!836381))

(assert (=> d!111651 m!836385))

(declare-fun m!836573 () Bool)

(assert (=> d!111651 m!836573))

(assert (=> b!899490 d!111651))

(declare-fun d!111653 () Bool)

(assert (=> d!111653 (= (apply!406 (+!2601 lt!406056 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181))) lt!406063) (apply!406 lt!406056 lt!406063))))

(declare-fun lt!406173 () Unit!30528)

(assert (=> d!111653 (= lt!406173 (choose!1499 lt!406056 lt!406065 (minValue!5232 thiss!1181) lt!406063))))

(declare-fun e!503370 () Bool)

(assert (=> d!111653 e!503370))

(declare-fun res!607645 () Bool)

(assert (=> d!111653 (=> (not res!607645) (not e!503370))))

(assert (=> d!111653 (= res!607645 (contains!4381 lt!406056 lt!406063))))

(assert (=> d!111653 (= (addApplyDifferent!332 lt!406056 lt!406065 (minValue!5232 thiss!1181) lt!406063) lt!406173)))

(declare-fun b!899667 () Bool)

(assert (=> b!899667 (= e!503370 (not (= lt!406063 lt!406065)))))

(assert (= (and d!111653 res!607645) b!899667))

(assert (=> d!111653 m!836373))

(declare-fun m!836575 () Bool)

(assert (=> d!111653 m!836575))

(assert (=> d!111653 m!836373))

(assert (=> d!111653 m!836375))

(assert (=> d!111653 m!836361))

(declare-fun m!836577 () Bool)

(assert (=> d!111653 m!836577))

(assert (=> b!899490 d!111653))

(declare-fun d!111655 () Bool)

(declare-fun e!503371 () Bool)

(assert (=> d!111655 e!503371))

(declare-fun res!607646 () Bool)

(assert (=> d!111655 (=> (not res!607646) (not e!503371))))

(declare-fun lt!406177 () ListLongMap!10649)

(assert (=> d!111655 (= res!607646 (contains!4381 lt!406177 (_1!5986 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181)))))))

(declare-fun lt!406176 () List!17790)

(assert (=> d!111655 (= lt!406177 (ListLongMap!10650 lt!406176))))

(declare-fun lt!406174 () Unit!30528)

(declare-fun lt!406175 () Unit!30528)

(assert (=> d!111655 (= lt!406174 lt!406175)))

(assert (=> d!111655 (= (getValueByKey!454 lt!406176 (_1!5986 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181)))) (Some!459 (_2!5986 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181)))))))

(assert (=> d!111655 (= lt!406175 (lemmaContainsTupThenGetReturnValue!249 lt!406176 (_1!5986 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181))) (_2!5986 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181)))))))

(assert (=> d!111655 (= lt!406176 (insertStrictlySorted!306 (toList!5340 lt!406056) (_1!5986 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181))) (_2!5986 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181)))))))

(assert (=> d!111655 (= (+!2601 lt!406056 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181))) lt!406177)))

(declare-fun b!899668 () Bool)

(declare-fun res!607647 () Bool)

(assert (=> b!899668 (=> (not res!607647) (not e!503371))))

(assert (=> b!899668 (= res!607647 (= (getValueByKey!454 (toList!5340 lt!406177) (_1!5986 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181)))) (Some!459 (_2!5986 (tuple2!11951 lt!406065 (minValue!5232 thiss!1181))))))))

(declare-fun b!899669 () Bool)

(assert (=> b!899669 (= e!503371 (contains!4383 (toList!5340 lt!406177) (tuple2!11951 lt!406065 (minValue!5232 thiss!1181))))))

(assert (= (and d!111655 res!607646) b!899668))

(assert (= (and b!899668 res!607647) b!899669))

(declare-fun m!836579 () Bool)

(assert (=> d!111655 m!836579))

(declare-fun m!836581 () Bool)

(assert (=> d!111655 m!836581))

(declare-fun m!836583 () Bool)

(assert (=> d!111655 m!836583))

(declare-fun m!836585 () Bool)

(assert (=> d!111655 m!836585))

(declare-fun m!836587 () Bool)

(assert (=> b!899668 m!836587))

(declare-fun m!836589 () Bool)

(assert (=> b!899669 m!836589))

(assert (=> b!899490 d!111655))

(declare-fun d!111657 () Bool)

(declare-fun e!503373 () Bool)

(assert (=> d!111657 e!503373))

(declare-fun res!607648 () Bool)

(assert (=> d!111657 (=> res!607648 e!503373)))

(declare-fun lt!406181 () Bool)

(assert (=> d!111657 (= res!607648 (not lt!406181))))

(declare-fun lt!406178 () Bool)

(assert (=> d!111657 (= lt!406181 lt!406178)))

(declare-fun lt!406180 () Unit!30528)

(declare-fun e!503372 () Unit!30528)

(assert (=> d!111657 (= lt!406180 e!503372)))

(declare-fun c!95296 () Bool)

(assert (=> d!111657 (= c!95296 lt!406178)))

(assert (=> d!111657 (= lt!406178 (containsKey!427 (toList!5340 (+!2601 lt!406053 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181)))) lt!406067))))

(assert (=> d!111657 (= (contains!4381 (+!2601 lt!406053 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181))) lt!406067) lt!406181)))

(declare-fun b!899670 () Bool)

(declare-fun lt!406179 () Unit!30528)

(assert (=> b!899670 (= e!503372 lt!406179)))

(assert (=> b!899670 (= lt!406179 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5340 (+!2601 lt!406053 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181)))) lt!406067))))

(assert (=> b!899670 (isDefined!329 (getValueByKey!454 (toList!5340 (+!2601 lt!406053 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181)))) lt!406067))))

(declare-fun b!899671 () Bool)

(declare-fun Unit!30535 () Unit!30528)

(assert (=> b!899671 (= e!503372 Unit!30535)))

(declare-fun b!899672 () Bool)

(assert (=> b!899672 (= e!503373 (isDefined!329 (getValueByKey!454 (toList!5340 (+!2601 lt!406053 (tuple2!11951 lt!406057 (zeroValue!5232 thiss!1181)))) lt!406067)))))

(assert (= (and d!111657 c!95296) b!899670))

(assert (= (and d!111657 (not c!95296)) b!899671))

(assert (= (and d!111657 (not res!607648)) b!899672))

(declare-fun m!836591 () Bool)

(assert (=> d!111657 m!836591))

(declare-fun m!836593 () Bool)

(assert (=> b!899670 m!836593))

(declare-fun m!836595 () Bool)

(assert (=> b!899670 m!836595))

(assert (=> b!899670 m!836595))

(declare-fun m!836597 () Bool)

(assert (=> b!899670 m!836597))

(assert (=> b!899672 m!836595))

(assert (=> b!899672 m!836595))

(assert (=> b!899672 m!836597))

(assert (=> b!899490 d!111657))

(declare-fun d!111659 () Bool)

(declare-fun lt!406187 () SeekEntryResult!8879)

(assert (=> d!111659 (and (or ((_ is Undefined!8879) lt!406187) (not ((_ is Found!8879) lt!406187)) (and (bvsge (index!37888 lt!406187) #b00000000000000000000000000000000) (bvslt (index!37888 lt!406187) (size!25810 (_keys!10215 thiss!1181))))) (or ((_ is Undefined!8879) lt!406187) ((_ is Found!8879) lt!406187) (not ((_ is MissingVacant!8879) lt!406187)) (not (= (index!37890 lt!406187) (index!37889 lt!405995))) (and (bvsge (index!37890 lt!406187) #b00000000000000000000000000000000) (bvslt (index!37890 lt!406187) (size!25810 (_keys!10215 thiss!1181))))) (or ((_ is Undefined!8879) lt!406187) (ite ((_ is Found!8879) lt!406187) (= (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!406187)) key!785) (and ((_ is MissingVacant!8879) lt!406187) (= (index!37890 lt!406187) (index!37889 lt!405995)) (= (select (arr!25354 (_keys!10215 thiss!1181)) (index!37890 lt!406187)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!503380 () SeekEntryResult!8879)

(assert (=> d!111659 (= lt!406187 e!503380)))

(declare-fun c!95303 () Bool)

(assert (=> d!111659 (= c!95303 (bvsge (x!76540 lt!405995) #b01111111111111111111111111111110))))

(declare-fun lt!406186 () (_ BitVec 64))

(assert (=> d!111659 (= lt!406186 (select (arr!25354 (_keys!10215 thiss!1181)) (index!37889 lt!405995)))))

(assert (=> d!111659 (validMask!0 (mask!26185 thiss!1181))))

(assert (=> d!111659 (= (seekKeyOrZeroReturnVacant!0 (x!76540 lt!405995) (index!37889 lt!405995) (index!37889 lt!405995) key!785 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)) lt!406187)))

(declare-fun b!899685 () Bool)

(declare-fun e!503381 () SeekEntryResult!8879)

(assert (=> b!899685 (= e!503381 (MissingVacant!8879 (index!37889 lt!405995)))))

(declare-fun b!899686 () Bool)

(declare-fun e!503382 () SeekEntryResult!8879)

(assert (=> b!899686 (= e!503380 e!503382)))

(declare-fun c!95305 () Bool)

(assert (=> b!899686 (= c!95305 (= lt!406186 key!785))))

(declare-fun b!899687 () Bool)

(assert (=> b!899687 (= e!503380 Undefined!8879)))

(declare-fun b!899688 () Bool)

(assert (=> b!899688 (= e!503381 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76540 lt!405995) #b00000000000000000000000000000001) (nextIndex!0 (index!37889 lt!405995) (bvadd (x!76540 lt!405995) #b00000000000000000000000000000001) (mask!26185 thiss!1181)) (index!37889 lt!405995) key!785 (_keys!10215 thiss!1181) (mask!26185 thiss!1181)))))

(declare-fun b!899689 () Bool)

(assert (=> b!899689 (= e!503382 (Found!8879 (index!37889 lt!405995)))))

(declare-fun b!899690 () Bool)

(declare-fun c!95304 () Bool)

(assert (=> b!899690 (= c!95304 (= lt!406186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899690 (= e!503382 e!503381)))

(assert (= (and d!111659 c!95303) b!899687))

(assert (= (and d!111659 (not c!95303)) b!899686))

(assert (= (and b!899686 c!95305) b!899689))

(assert (= (and b!899686 (not c!95305)) b!899690))

(assert (= (and b!899690 c!95304) b!899685))

(assert (= (and b!899690 (not c!95304)) b!899688))

(declare-fun m!836599 () Bool)

(assert (=> d!111659 m!836599))

(declare-fun m!836601 () Bool)

(assert (=> d!111659 m!836601))

(assert (=> d!111659 m!836311))

(assert (=> d!111659 m!836227))

(declare-fun m!836603 () Bool)

(assert (=> b!899688 m!836603))

(assert (=> b!899688 m!836603))

(declare-fun m!836605 () Bool)

(assert (=> b!899688 m!836605))

(assert (=> b!899416 d!111659))

(declare-fun d!111661 () Bool)

(declare-fun e!503384 () Bool)

(assert (=> d!111661 e!503384))

(declare-fun res!607649 () Bool)

(assert (=> d!111661 (=> res!607649 e!503384)))

(declare-fun lt!406191 () Bool)

(assert (=> d!111661 (= res!607649 (not lt!406191))))

(declare-fun lt!406188 () Bool)

(assert (=> d!111661 (= lt!406191 lt!406188)))

(declare-fun lt!406190 () Unit!30528)

(declare-fun e!503383 () Unit!30528)

(assert (=> d!111661 (= lt!406190 e!503383)))

(declare-fun c!95306 () Bool)

(assert (=> d!111661 (= c!95306 lt!406188)))

(assert (=> d!111661 (= lt!406188 (containsKey!427 (toList!5340 lt!406066) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111661 (= (contains!4381 lt!406066 #b0000000000000000000000000000000000000000000000000000000000000000) lt!406191)))

(declare-fun b!899691 () Bool)

(declare-fun lt!406189 () Unit!30528)

(assert (=> b!899691 (= e!503383 lt!406189)))

(assert (=> b!899691 (= lt!406189 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5340 lt!406066) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899691 (isDefined!329 (getValueByKey!454 (toList!5340 lt!406066) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899692 () Bool)

(declare-fun Unit!30536 () Unit!30528)

(assert (=> b!899692 (= e!503383 Unit!30536)))

(declare-fun b!899693 () Bool)

(assert (=> b!899693 (= e!503384 (isDefined!329 (getValueByKey!454 (toList!5340 lt!406066) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111661 c!95306) b!899691))

(assert (= (and d!111661 (not c!95306)) b!899692))

(assert (= (and d!111661 (not res!607649)) b!899693))

(declare-fun m!836607 () Bool)

(assert (=> d!111661 m!836607))

(declare-fun m!836609 () Bool)

(assert (=> b!899691 m!836609))

(assert (=> b!899691 m!836465))

(assert (=> b!899691 m!836465))

(declare-fun m!836611 () Bool)

(assert (=> b!899691 m!836611))

(assert (=> b!899693 m!836465))

(assert (=> b!899693 m!836465))

(assert (=> b!899693 m!836611))

(assert (=> bm!39917 d!111661))

(declare-fun d!111663 () Bool)

(declare-fun res!607654 () Bool)

(declare-fun e!503389 () Bool)

(assert (=> d!111663 (=> res!607654 e!503389)))

(assert (=> d!111663 (= res!607654 (and ((_ is Cons!17786) (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (= (_1!5986 (h!18934 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953)))))))

(assert (=> d!111663 (= (containsKey!427 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))) e!503389)))

(declare-fun b!899698 () Bool)

(declare-fun e!503390 () Bool)

(assert (=> b!899698 (= e!503389 e!503390)))

(declare-fun res!607655 () Bool)

(assert (=> b!899698 (=> (not res!607655) (not e!503390))))

(assert (=> b!899698 (= res!607655 (and (or (not ((_ is Cons!17786) (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (bvsle (_1!5986 (h!18934 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953)))) ((_ is Cons!17786) (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (bvslt (_1!5986 (h!18934 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953)))))))

(declare-fun b!899699 () Bool)

(assert (=> b!899699 (= e!503390 (containsKey!427 (t!25123 (toList!5340 (getCurrentListMap!2612 (_keys!10215 thiss!1181) (_values!5419 thiss!1181) (mask!26185 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (select (arr!25354 (_keys!10215 thiss!1181)) (index!37888 lt!405953))))))

(assert (= (and d!111663 (not res!607654)) b!899698))

(assert (= (and b!899698 res!607655) b!899699))

(assert (=> b!899699 m!836223))

(declare-fun m!836613 () Bool)

(assert (=> b!899699 m!836613))

(assert (=> d!111583 d!111663))

(declare-fun d!111665 () Bool)

(declare-fun e!503392 () Bool)

(assert (=> d!111665 e!503392))

(declare-fun res!607656 () Bool)

(assert (=> d!111665 (=> res!607656 e!503392)))

(declare-fun lt!406195 () Bool)

(assert (=> d!111665 (= res!607656 (not lt!406195))))

(declare-fun lt!406192 () Bool)

(assert (=> d!111665 (= lt!406195 lt!406192)))

(declare-fun lt!406194 () Unit!30528)

(declare-fun e!503391 () Unit!30528)

(assert (=> d!111665 (= lt!406194 e!503391)))

(declare-fun c!95307 () Bool)

(assert (=> d!111665 (= c!95307 lt!406192)))

(assert (=> d!111665 (= lt!406192 (containsKey!427 (toList!5340 lt!406066) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111665 (= (contains!4381 lt!406066 #b1000000000000000000000000000000000000000000000000000000000000000) lt!406195)))

(declare-fun b!899700 () Bool)

(declare-fun lt!406193 () Unit!30528)

(assert (=> b!899700 (= e!503391 lt!406193)))

(assert (=> b!899700 (= lt!406193 (lemmaContainsKeyImpliesGetValueByKeyDefined!321 (toList!5340 lt!406066) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899700 (isDefined!329 (getValueByKey!454 (toList!5340 lt!406066) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899701 () Bool)

(declare-fun Unit!30537 () Unit!30528)

(assert (=> b!899701 (= e!503391 Unit!30537)))

(declare-fun b!899702 () Bool)

(assert (=> b!899702 (= e!503392 (isDefined!329 (getValueByKey!454 (toList!5340 lt!406066) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111665 c!95307) b!899700))

(assert (= (and d!111665 (not c!95307)) b!899701))

(assert (= (and d!111665 (not res!607656)) b!899702))

(declare-fun m!836615 () Bool)

(assert (=> d!111665 m!836615))

(declare-fun m!836617 () Bool)

(assert (=> b!899700 m!836617))

(assert (=> b!899700 m!836485))

(assert (=> b!899700 m!836485))

(declare-fun m!836619 () Bool)

(assert (=> b!899700 m!836619))

(assert (=> b!899702 m!836485))

(assert (=> b!899702 m!836485))

(assert (=> b!899702 m!836619))

(assert (=> bm!39916 d!111665))

(declare-fun bm!39931 () Bool)

(declare-fun call!39934 () Bool)

(declare-fun c!95310 () Bool)

(assert (=> bm!39931 (= call!39934 (arrayNoDuplicates!0 (_keys!10215 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95310 (Cons!17788 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000) Nil!17789) Nil!17789)))))

(declare-fun b!899713 () Bool)

(declare-fun e!503403 () Bool)

(declare-fun contains!4384 (List!17792 (_ BitVec 64)) Bool)

(assert (=> b!899713 (= e!503403 (contains!4384 Nil!17789 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111667 () Bool)

(declare-fun res!607663 () Bool)

(declare-fun e!503402 () Bool)

(assert (=> d!111667 (=> res!607663 e!503402)))

(assert (=> d!111667 (= res!607663 (bvsge #b00000000000000000000000000000000 (size!25810 (_keys!10215 thiss!1181))))))

(assert (=> d!111667 (= (arrayNoDuplicates!0 (_keys!10215 thiss!1181) #b00000000000000000000000000000000 Nil!17789) e!503402)))

(declare-fun b!899714 () Bool)

(declare-fun e!503404 () Bool)

(assert (=> b!899714 (= e!503404 call!39934)))

(declare-fun b!899715 () Bool)

(declare-fun e!503401 () Bool)

(assert (=> b!899715 (= e!503402 e!503401)))

(declare-fun res!607664 () Bool)

(assert (=> b!899715 (=> (not res!607664) (not e!503401))))

(assert (=> b!899715 (= res!607664 (not e!503403))))

(declare-fun res!607665 () Bool)

(assert (=> b!899715 (=> (not res!607665) (not e!503403))))

(assert (=> b!899715 (= res!607665 (validKeyInArray!0 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899716 () Bool)

(assert (=> b!899716 (= e!503404 call!39934)))

(declare-fun b!899717 () Bool)

(assert (=> b!899717 (= e!503401 e!503404)))

(assert (=> b!899717 (= c!95310 (validKeyInArray!0 (select (arr!25354 (_keys!10215 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111667 (not res!607663)) b!899715))

(assert (= (and b!899715 res!607665) b!899713))

(assert (= (and b!899715 res!607664) b!899717))

(assert (= (and b!899717 c!95310) b!899714))

(assert (= (and b!899717 (not c!95310)) b!899716))

(assert (= (or b!899714 b!899716) bm!39931))

(assert (=> bm!39931 m!836331))

(declare-fun m!836621 () Bool)

(assert (=> bm!39931 m!836621))

(assert (=> b!899713 m!836331))

(assert (=> b!899713 m!836331))

(declare-fun m!836623 () Bool)

(assert (=> b!899713 m!836623))

(assert (=> b!899715 m!836331))

(assert (=> b!899715 m!836331))

(assert (=> b!899715 m!836387))

(assert (=> b!899717 m!836331))

(assert (=> b!899717 m!836331))

(assert (=> b!899717 m!836387))

(assert (=> b!899427 d!111667))

(assert (=> b!899510 d!111597))

(assert (=> b!899510 d!111599))

(assert (=> b!899430 d!111583))

(assert (=> b!899430 d!111581))

(declare-fun mapNonEmpty!29179 () Bool)

(declare-fun mapRes!29179 () Bool)

(declare-fun tp!56131 () Bool)

(declare-fun e!503406 () Bool)

(assert (=> mapNonEmpty!29179 (= mapRes!29179 (and tp!56131 e!503406))))

(declare-fun mapKey!29179 () (_ BitVec 32))

(declare-fun mapValue!29179 () ValueCell!8690)

(declare-fun mapRest!29179 () (Array (_ BitVec 32) ValueCell!8690))

(assert (=> mapNonEmpty!29179 (= mapRest!29178 (store mapRest!29179 mapKey!29179 mapValue!29179))))

(declare-fun condMapEmpty!29179 () Bool)

(declare-fun mapDefault!29179 () ValueCell!8690)

(assert (=> mapNonEmpty!29178 (= condMapEmpty!29179 (= mapRest!29178 ((as const (Array (_ BitVec 32) ValueCell!8690)) mapDefault!29179)))))

(declare-fun e!503405 () Bool)

(assert (=> mapNonEmpty!29178 (= tp!56130 (and e!503405 mapRes!29179))))

(declare-fun b!899718 () Bool)

(assert (=> b!899718 (= e!503406 tp_is_empty!18343)))

(declare-fun mapIsEmpty!29179 () Bool)

(assert (=> mapIsEmpty!29179 mapRes!29179))

(declare-fun b!899719 () Bool)

(assert (=> b!899719 (= e!503405 tp_is_empty!18343)))

(assert (= (and mapNonEmpty!29178 condMapEmpty!29179) mapIsEmpty!29179))

(assert (= (and mapNonEmpty!29178 (not condMapEmpty!29179)) mapNonEmpty!29179))

(assert (= (and mapNonEmpty!29179 ((_ is ValueCellFull!8690) mapValue!29179)) b!899718))

(assert (= (and mapNonEmpty!29178 ((_ is ValueCellFull!8690) mapDefault!29179)) b!899719))

(declare-fun m!836625 () Bool)

(assert (=> mapNonEmpty!29179 m!836625))

(declare-fun b_lambda!12985 () Bool)

(assert (= b_lambda!12983 (or (and b!899342 b_free!16015) b_lambda!12985)))

(declare-fun b_lambda!12987 () Bool)

(assert (= b_lambda!12981 (or (and b!899342 b_free!16015) b_lambda!12987)))

(check-sat (not d!111645) (not b!899625) (not d!111657) (not d!111629) (not b!899543) (not b_next!16015) (not d!111605) (not d!111607) (not b!899652) (not d!111625) (not d!111633) b_and!26329 (not b!899715) (not d!111649) (not mapNonEmpty!29179) (not d!111585) (not b!899624) (not b_lambda!12979) (not d!111611) (not b!899560) (not b!899542) (not b!899717) (not b!899530) (not d!111643) (not b!899598) (not d!111639) (not d!111631) (not d!111627) (not b!899640) (not b!899647) (not d!111617) (not b!899629) (not b!899713) (not b!899649) (not b!899693) (not b!899668) (not d!111595) (not d!111647) (not b!899630) (not d!111635) (not b!899654) (not d!111593) (not d!111615) (not d!111637) (not d!111651) (not d!111659) (not b!899555) (not b!899653) (not b!899655) (not d!111655) (not b!899669) (not b!899702) (not b!899527) (not b!899688) (not b!899670) (not d!111623) (not b!899571) tp_is_empty!18343 (not b!899663) (not bm!39931) (not b!899657) (not b!899634) (not b!899672) (not b!899631) (not d!111641) (not d!111665) (not b!899658) (not d!111597) (not b!899646) (not b!899664) (not b!899656) (not b_lambda!12987) (not d!111601) (not bm!39928) (not b!899545) (not d!111661) (not b!899691) (not b!899700) (not b!899699) (not b!899556) (not d!111653) (not bm!39922) (not b!899628) (not bm!39925) (not b_lambda!12985) (not b!899627) (not d!111591) (not b!899641))
(check-sat b_and!26329 (not b_next!16015))
