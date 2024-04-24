; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16744 () Bool)

(assert start!16744)

(declare-fun b!168237 () Bool)

(declare-fun b_free!4045 () Bool)

(declare-fun b_next!4045 () Bool)

(assert (=> b!168237 (= b_free!4045 (not b_next!4045))))

(declare-fun tp!14736 () Bool)

(declare-fun b_and!10473 () Bool)

(assert (=> b!168237 (= tp!14736 b_and!10473)))

(declare-fun b!168236 () Bool)

(declare-fun e!110572 () Bool)

(declare-fun tp_is_empty!3847 () Bool)

(assert (=> b!168236 (= e!110572 tp_is_empty!3847)))

(declare-fun e!110566 () Bool)

(declare-datatypes ((V!4777 0))(
  ( (V!4778 (val!1968 Int)) )
))
(declare-datatypes ((ValueCell!1580 0))(
  ( (ValueCellFull!1580 (v!3834 V!4777)) (EmptyCell!1580) )
))
(declare-datatypes ((array!6777 0))(
  ( (array!6778 (arr!3224 (Array (_ BitVec 32) (_ BitVec 64))) (size!3512 (_ BitVec 32))) )
))
(declare-datatypes ((array!6779 0))(
  ( (array!6780 (arr!3225 (Array (_ BitVec 32) ValueCell!1580)) (size!3513 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2068 0))(
  ( (LongMapFixedSize!2069 (defaultEntry!3476 Int) (mask!8237 (_ BitVec 32)) (extraKeys!3217 (_ BitVec 32)) (zeroValue!3319 V!4777) (minValue!3319 V!4777) (_size!1083 (_ BitVec 32)) (_keys!5301 array!6777) (_values!3459 array!6779) (_vacant!1083 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2068)

(declare-fun e!110567 () Bool)

(declare-fun array_inv!2065 (array!6777) Bool)

(declare-fun array_inv!2066 (array!6779) Bool)

(assert (=> b!168237 (= e!110567 (and tp!14736 tp_is_empty!3847 (array_inv!2065 (_keys!5301 thiss!1248)) (array_inv!2066 (_values!3459 thiss!1248)) e!110566))))

(declare-fun b!168238 () Bool)

(declare-fun res!80068 () Bool)

(declare-fun e!110564 () Bool)

(assert (=> b!168238 (=> (not res!80068) (not e!110564))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168238 (= res!80068 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168239 () Bool)

(declare-fun e!110570 () Bool)

(assert (=> b!168239 (= e!110570 true)))

(declare-fun lt!84152 () Bool)

(declare-datatypes ((List!2137 0))(
  ( (Nil!2134) (Cons!2133 (h!2750 (_ BitVec 64)) (t!6931 List!2137)) )
))
(declare-fun arrayNoDuplicates!0 (array!6777 (_ BitVec 32) List!2137) Bool)

(assert (=> b!168239 (= lt!84152 (arrayNoDuplicates!0 (_keys!5301 thiss!1248) #b00000000000000000000000000000000 Nil!2134))))

(declare-fun b!168240 () Bool)

(declare-fun res!80070 () Bool)

(assert (=> b!168240 (=> res!80070 e!110570)))

(assert (=> b!168240 (= res!80070 (or (not (= (size!3513 (_values!3459 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8237 thiss!1248)))) (not (= (size!3512 (_keys!5301 thiss!1248)) (size!3513 (_values!3459 thiss!1248)))) (bvslt (mask!8237 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3217 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3217 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168241 () Bool)

(declare-fun e!110565 () Bool)

(assert (=> b!168241 (= e!110565 (not e!110570))))

(declare-fun res!80065 () Bool)

(assert (=> b!168241 (=> res!80065 e!110570)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168241 (= res!80065 (not (validMask!0 (mask!8237 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!488 0))(
  ( (MissingZero!488 (index!4120 (_ BitVec 32))) (Found!488 (index!4121 (_ BitVec 32))) (Intermediate!488 (undefined!1300 Bool) (index!4122 (_ BitVec 32)) (x!18588 (_ BitVec 32))) (Undefined!488) (MissingVacant!488 (index!4123 (_ BitVec 32))) )
))
(declare-fun lt!84151 () SeekEntryResult!488)

(declare-datatypes ((tuple2!3122 0))(
  ( (tuple2!3123 (_1!1572 (_ BitVec 64)) (_2!1572 V!4777)) )
))
(declare-datatypes ((List!2138 0))(
  ( (Nil!2135) (Cons!2134 (h!2751 tuple2!3122) (t!6932 List!2138)) )
))
(declare-datatypes ((ListLongMap!2083 0))(
  ( (ListLongMap!2084 (toList!1057 List!2138)) )
))
(declare-fun lt!84155 () ListLongMap!2083)

(declare-fun v!309 () V!4777)

(declare-fun +!225 (ListLongMap!2083 tuple2!3122) ListLongMap!2083)

(declare-fun getCurrentListMap!719 (array!6777 array!6779 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 32) Int) ListLongMap!2083)

(assert (=> b!168241 (= (+!225 lt!84155 (tuple2!3123 key!828 v!309)) (getCurrentListMap!719 (_keys!5301 thiss!1248) (array!6780 (store (arr!3225 (_values!3459 thiss!1248)) (index!4121 lt!84151) (ValueCellFull!1580 v!309)) (size!3513 (_values!3459 thiss!1248))) (mask!8237 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3476 thiss!1248)))))

(declare-datatypes ((Unit!5173 0))(
  ( (Unit!5174) )
))
(declare-fun lt!84154 () Unit!5173)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!83 (array!6777 array!6779 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 32) (_ BitVec 64) V!4777 Int) Unit!5173)

(assert (=> b!168241 (= lt!84154 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!83 (_keys!5301 thiss!1248) (_values!3459 thiss!1248) (mask!8237 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) (index!4121 lt!84151) key!828 v!309 (defaultEntry!3476 thiss!1248)))))

(declare-fun lt!84156 () Unit!5173)

(declare-fun e!110569 () Unit!5173)

(assert (=> b!168241 (= lt!84156 e!110569)))

(declare-fun c!30362 () Bool)

(declare-fun contains!1109 (ListLongMap!2083 (_ BitVec 64)) Bool)

(assert (=> b!168241 (= c!30362 (contains!1109 lt!84155 key!828))))

(assert (=> b!168241 (= lt!84155 (getCurrentListMap!719 (_keys!5301 thiss!1248) (_values!3459 thiss!1248) (mask!8237 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3476 thiss!1248)))))

(declare-fun b!168242 () Bool)

(declare-fun lt!84150 () Unit!5173)

(assert (=> b!168242 (= e!110569 lt!84150)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!120 (array!6777 array!6779 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 64) Int) Unit!5173)

(assert (=> b!168242 (= lt!84150 (lemmaInListMapThenSeekEntryOrOpenFindsIt!120 (_keys!5301 thiss!1248) (_values!3459 thiss!1248) (mask!8237 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) key!828 (defaultEntry!3476 thiss!1248)))))

(declare-fun res!80067 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168242 (= res!80067 (inRange!0 (index!4121 lt!84151) (mask!8237 thiss!1248)))))

(declare-fun e!110573 () Bool)

(assert (=> b!168242 (=> (not res!80067) (not e!110573))))

(assert (=> b!168242 e!110573))

(declare-fun b!168244 () Bool)

(declare-fun mapRes!6489 () Bool)

(assert (=> b!168244 (= e!110566 (and e!110572 mapRes!6489))))

(declare-fun condMapEmpty!6489 () Bool)

(declare-fun mapDefault!6489 () ValueCell!1580)

(assert (=> b!168244 (= condMapEmpty!6489 (= (arr!3225 (_values!3459 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1580)) mapDefault!6489)))))

(declare-fun mapIsEmpty!6489 () Bool)

(assert (=> mapIsEmpty!6489 mapRes!6489))

(declare-fun b!168245 () Bool)

(declare-fun res!80069 () Bool)

(assert (=> b!168245 (=> res!80069 e!110570)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6777 (_ BitVec 32)) Bool)

(assert (=> b!168245 (= res!80069 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5301 thiss!1248) (mask!8237 thiss!1248))))))

(declare-fun b!168246 () Bool)

(assert (=> b!168246 (= e!110573 (= (select (arr!3224 (_keys!5301 thiss!1248)) (index!4121 lt!84151)) key!828))))

(declare-fun b!168247 () Bool)

(declare-fun Unit!5175 () Unit!5173)

(assert (=> b!168247 (= e!110569 Unit!5175)))

(declare-fun lt!84153 () Unit!5173)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!111 (array!6777 array!6779 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 64) Int) Unit!5173)

(assert (=> b!168247 (= lt!84153 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!111 (_keys!5301 thiss!1248) (_values!3459 thiss!1248) (mask!8237 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) key!828 (defaultEntry!3476 thiss!1248)))))

(assert (=> b!168247 false))

(declare-fun b!168248 () Bool)

(declare-fun e!110568 () Bool)

(assert (=> b!168248 (= e!110568 tp_is_empty!3847)))

(declare-fun mapNonEmpty!6489 () Bool)

(declare-fun tp!14735 () Bool)

(assert (=> mapNonEmpty!6489 (= mapRes!6489 (and tp!14735 e!110568))))

(declare-fun mapKey!6489 () (_ BitVec 32))

(declare-fun mapRest!6489 () (Array (_ BitVec 32) ValueCell!1580))

(declare-fun mapValue!6489 () ValueCell!1580)

(assert (=> mapNonEmpty!6489 (= (arr!3225 (_values!3459 thiss!1248)) (store mapRest!6489 mapKey!6489 mapValue!6489))))

(declare-fun b!168243 () Bool)

(assert (=> b!168243 (= e!110564 e!110565)))

(declare-fun res!80066 () Bool)

(assert (=> b!168243 (=> (not res!80066) (not e!110565))))

(get-info :version)

(assert (=> b!168243 (= res!80066 (and (not ((_ is Undefined!488) lt!84151)) (not ((_ is MissingVacant!488) lt!84151)) (not ((_ is MissingZero!488) lt!84151)) ((_ is Found!488) lt!84151)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6777 (_ BitVec 32)) SeekEntryResult!488)

(assert (=> b!168243 (= lt!84151 (seekEntryOrOpen!0 key!828 (_keys!5301 thiss!1248) (mask!8237 thiss!1248)))))

(declare-fun res!80064 () Bool)

(assert (=> start!16744 (=> (not res!80064) (not e!110564))))

(declare-fun valid!909 (LongMapFixedSize!2068) Bool)

(assert (=> start!16744 (= res!80064 (valid!909 thiss!1248))))

(assert (=> start!16744 e!110564))

(assert (=> start!16744 e!110567))

(assert (=> start!16744 true))

(assert (=> start!16744 tp_is_empty!3847))

(assert (= (and start!16744 res!80064) b!168238))

(assert (= (and b!168238 res!80068) b!168243))

(assert (= (and b!168243 res!80066) b!168241))

(assert (= (and b!168241 c!30362) b!168242))

(assert (= (and b!168241 (not c!30362)) b!168247))

(assert (= (and b!168242 res!80067) b!168246))

(assert (= (and b!168241 (not res!80065)) b!168240))

(assert (= (and b!168240 (not res!80070)) b!168245))

(assert (= (and b!168245 (not res!80069)) b!168239))

(assert (= (and b!168244 condMapEmpty!6489) mapIsEmpty!6489))

(assert (= (and b!168244 (not condMapEmpty!6489)) mapNonEmpty!6489))

(assert (= (and mapNonEmpty!6489 ((_ is ValueCellFull!1580) mapValue!6489)) b!168248))

(assert (= (and b!168244 ((_ is ValueCellFull!1580) mapDefault!6489)) b!168236))

(assert (= b!168237 b!168244))

(assert (= start!16744 b!168237))

(declare-fun m!197465 () Bool)

(assert (=> mapNonEmpty!6489 m!197465))

(declare-fun m!197467 () Bool)

(assert (=> b!168245 m!197467))

(declare-fun m!197469 () Bool)

(assert (=> b!168241 m!197469))

(declare-fun m!197471 () Bool)

(assert (=> b!168241 m!197471))

(declare-fun m!197473 () Bool)

(assert (=> b!168241 m!197473))

(declare-fun m!197475 () Bool)

(assert (=> b!168241 m!197475))

(declare-fun m!197477 () Bool)

(assert (=> b!168241 m!197477))

(declare-fun m!197479 () Bool)

(assert (=> b!168241 m!197479))

(declare-fun m!197481 () Bool)

(assert (=> b!168241 m!197481))

(declare-fun m!197483 () Bool)

(assert (=> b!168247 m!197483))

(declare-fun m!197485 () Bool)

(assert (=> b!168239 m!197485))

(declare-fun m!197487 () Bool)

(assert (=> b!168242 m!197487))

(declare-fun m!197489 () Bool)

(assert (=> b!168242 m!197489))

(declare-fun m!197491 () Bool)

(assert (=> b!168243 m!197491))

(declare-fun m!197493 () Bool)

(assert (=> b!168237 m!197493))

(declare-fun m!197495 () Bool)

(assert (=> b!168237 m!197495))

(declare-fun m!197497 () Bool)

(assert (=> b!168246 m!197497))

(declare-fun m!197499 () Bool)

(assert (=> start!16744 m!197499))

(check-sat (not b!168239) tp_is_empty!3847 (not b_next!4045) b_and!10473 (not b!168247) (not b!168243) (not mapNonEmpty!6489) (not b!168237) (not b!168241) (not b!168245) (not start!16744) (not b!168242))
(check-sat b_and!10473 (not b_next!4045))
