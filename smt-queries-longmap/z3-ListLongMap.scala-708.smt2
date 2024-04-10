; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16754 () Bool)

(assert start!16754)

(declare-fun b!168469 () Bool)

(declare-fun b_free!4059 () Bool)

(declare-fun b_next!4059 () Bool)

(assert (=> b!168469 (= b_free!4059 (not b_next!4059))))

(declare-fun tp!14777 () Bool)

(declare-fun b_and!10473 () Bool)

(assert (=> b!168469 (= tp!14777 b_and!10473)))

(declare-fun res!80190 () Bool)

(declare-fun e!110759 () Bool)

(assert (=> start!16754 (=> (not res!80190) (not e!110759))))

(declare-datatypes ((V!4795 0))(
  ( (V!4796 (val!1975 Int)) )
))
(declare-datatypes ((ValueCell!1587 0))(
  ( (ValueCellFull!1587 (v!3840 V!4795)) (EmptyCell!1587) )
))
(declare-datatypes ((array!6819 0))(
  ( (array!6820 (arr!3245 (Array (_ BitVec 32) (_ BitVec 64))) (size!3533 (_ BitVec 32))) )
))
(declare-datatypes ((array!6821 0))(
  ( (array!6822 (arr!3246 (Array (_ BitVec 32) ValueCell!1587)) (size!3534 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2082 0))(
  ( (LongMapFixedSize!2083 (defaultEntry!3483 Int) (mask!8248 (_ BitVec 32)) (extraKeys!3224 (_ BitVec 32)) (zeroValue!3326 V!4795) (minValue!3326 V!4795) (_size!1090 (_ BitVec 32)) (_keys!5308 array!6819) (_values!3466 array!6821) (_vacant!1090 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2082)

(declare-fun valid!902 (LongMapFixedSize!2082) Bool)

(assert (=> start!16754 (= res!80190 (valid!902 thiss!1248))))

(assert (=> start!16754 e!110759))

(declare-fun e!110756 () Bool)

(assert (=> start!16754 e!110756))

(assert (=> start!16754 true))

(declare-fun tp_is_empty!3861 () Bool)

(assert (=> start!16754 tp_is_empty!3861))

(declare-fun b!168462 () Bool)

(declare-fun res!80193 () Bool)

(declare-fun e!110753 () Bool)

(assert (=> b!168462 (=> res!80193 e!110753)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6819 (_ BitVec 32)) Bool)

(assert (=> b!168462 (= res!80193 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5308 thiss!1248) (mask!8248 thiss!1248))))))

(declare-fun b!168463 () Bool)

(declare-fun e!110755 () Bool)

(assert (=> b!168463 (= e!110755 (not e!110753))))

(declare-fun res!80195 () Bool)

(assert (=> b!168463 (=> res!80195 e!110753)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168463 (= res!80195 (not (validMask!0 (mask!8248 thiss!1248))))))

(declare-datatypes ((tuple2!3168 0))(
  ( (tuple2!3169 (_1!1595 (_ BitVec 64)) (_2!1595 V!4795)) )
))
(declare-datatypes ((List!2160 0))(
  ( (Nil!2157) (Cons!2156 (h!2773 tuple2!3168) (t!6962 List!2160)) )
))
(declare-datatypes ((ListLongMap!2123 0))(
  ( (ListLongMap!2124 (toList!1077 List!2160)) )
))
(declare-fun lt!84242 () ListLongMap!2123)

(declare-datatypes ((SeekEntryResult!501 0))(
  ( (MissingZero!501 (index!4172 (_ BitVec 32))) (Found!501 (index!4173 (_ BitVec 32))) (Intermediate!501 (undefined!1313 Bool) (index!4174 (_ BitVec 32)) (x!18617 (_ BitVec 32))) (Undefined!501) (MissingVacant!501 (index!4175 (_ BitVec 32))) )
))
(declare-fun lt!84239 () SeekEntryResult!501)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4795)

(declare-fun +!229 (ListLongMap!2123 tuple2!3168) ListLongMap!2123)

(declare-fun getCurrentListMap!735 (array!6819 array!6821 (_ BitVec 32) (_ BitVec 32) V!4795 V!4795 (_ BitVec 32) Int) ListLongMap!2123)

(assert (=> b!168463 (= (+!229 lt!84242 (tuple2!3169 key!828 v!309)) (getCurrentListMap!735 (_keys!5308 thiss!1248) (array!6822 (store (arr!3246 (_values!3466 thiss!1248)) (index!4173 lt!84239) (ValueCellFull!1587 v!309)) (size!3534 (_values!3466 thiss!1248))) (mask!8248 thiss!1248) (extraKeys!3224 thiss!1248) (zeroValue!3326 thiss!1248) (minValue!3326 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3483 thiss!1248)))))

(declare-datatypes ((Unit!5186 0))(
  ( (Unit!5187) )
))
(declare-fun lt!84244 () Unit!5186)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!84 (array!6819 array!6821 (_ BitVec 32) (_ BitVec 32) V!4795 V!4795 (_ BitVec 32) (_ BitVec 64) V!4795 Int) Unit!5186)

(assert (=> b!168463 (= lt!84244 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!84 (_keys!5308 thiss!1248) (_values!3466 thiss!1248) (mask!8248 thiss!1248) (extraKeys!3224 thiss!1248) (zeroValue!3326 thiss!1248) (minValue!3326 thiss!1248) (index!4173 lt!84239) key!828 v!309 (defaultEntry!3483 thiss!1248)))))

(declare-fun lt!84238 () Unit!5186)

(declare-fun e!110757 () Unit!5186)

(assert (=> b!168463 (= lt!84238 e!110757)))

(declare-fun c!30370 () Bool)

(declare-fun contains!1119 (ListLongMap!2123 (_ BitVec 64)) Bool)

(assert (=> b!168463 (= c!30370 (contains!1119 lt!84242 key!828))))

(assert (=> b!168463 (= lt!84242 (getCurrentListMap!735 (_keys!5308 thiss!1248) (_values!3466 thiss!1248) (mask!8248 thiss!1248) (extraKeys!3224 thiss!1248) (zeroValue!3326 thiss!1248) (minValue!3326 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3483 thiss!1248)))))

(declare-fun e!110750 () Bool)

(declare-fun b!168464 () Bool)

(assert (=> b!168464 (= e!110750 (= (select (arr!3245 (_keys!5308 thiss!1248)) (index!4173 lt!84239)) key!828))))

(declare-fun b!168465 () Bool)

(declare-fun res!80191 () Bool)

(assert (=> b!168465 (=> (not res!80191) (not e!110759))))

(assert (=> b!168465 (= res!80191 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168466 () Bool)

(declare-fun res!80194 () Bool)

(assert (=> b!168466 (=> res!80194 e!110753)))

(assert (=> b!168466 (= res!80194 (or (not (= (size!3534 (_values!3466 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8248 thiss!1248)))) (not (= (size!3533 (_keys!5308 thiss!1248)) (size!3534 (_values!3466 thiss!1248)))) (bvslt (mask!8248 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3224 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3224 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6510 () Bool)

(declare-fun mapRes!6510 () Bool)

(declare-fun tp!14778 () Bool)

(declare-fun e!110751 () Bool)

(assert (=> mapNonEmpty!6510 (= mapRes!6510 (and tp!14778 e!110751))))

(declare-fun mapRest!6510 () (Array (_ BitVec 32) ValueCell!1587))

(declare-fun mapValue!6510 () ValueCell!1587)

(declare-fun mapKey!6510 () (_ BitVec 32))

(assert (=> mapNonEmpty!6510 (= (arr!3246 (_values!3466 thiss!1248)) (store mapRest!6510 mapKey!6510 mapValue!6510))))

(declare-fun b!168467 () Bool)

(assert (=> b!168467 (= e!110751 tp_is_empty!3861)))

(declare-fun b!168468 () Bool)

(assert (=> b!168468 (= e!110753 true)))

(declare-fun lt!84241 () Bool)

(declare-datatypes ((List!2161 0))(
  ( (Nil!2158) (Cons!2157 (h!2774 (_ BitVec 64)) (t!6963 List!2161)) )
))
(declare-fun arrayNoDuplicates!0 (array!6819 (_ BitVec 32) List!2161) Bool)

(assert (=> b!168468 (= lt!84241 (arrayNoDuplicates!0 (_keys!5308 thiss!1248) #b00000000000000000000000000000000 Nil!2158))))

(declare-fun e!110758 () Bool)

(declare-fun array_inv!2089 (array!6819) Bool)

(declare-fun array_inv!2090 (array!6821) Bool)

(assert (=> b!168469 (= e!110756 (and tp!14777 tp_is_empty!3861 (array_inv!2089 (_keys!5308 thiss!1248)) (array_inv!2090 (_values!3466 thiss!1248)) e!110758))))

(declare-fun b!168470 () Bool)

(declare-fun Unit!5188 () Unit!5186)

(assert (=> b!168470 (= e!110757 Unit!5188)))

(declare-fun lt!84243 () Unit!5186)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!125 (array!6819 array!6821 (_ BitVec 32) (_ BitVec 32) V!4795 V!4795 (_ BitVec 64) Int) Unit!5186)

(assert (=> b!168470 (= lt!84243 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!125 (_keys!5308 thiss!1248) (_values!3466 thiss!1248) (mask!8248 thiss!1248) (extraKeys!3224 thiss!1248) (zeroValue!3326 thiss!1248) (minValue!3326 thiss!1248) key!828 (defaultEntry!3483 thiss!1248)))))

(assert (=> b!168470 false))

(declare-fun mapIsEmpty!6510 () Bool)

(assert (=> mapIsEmpty!6510 mapRes!6510))

(declare-fun b!168471 () Bool)

(declare-fun lt!84240 () Unit!5186)

(assert (=> b!168471 (= e!110757 lt!84240)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!122 (array!6819 array!6821 (_ BitVec 32) (_ BitVec 32) V!4795 V!4795 (_ BitVec 64) Int) Unit!5186)

(assert (=> b!168471 (= lt!84240 (lemmaInListMapThenSeekEntryOrOpenFindsIt!122 (_keys!5308 thiss!1248) (_values!3466 thiss!1248) (mask!8248 thiss!1248) (extraKeys!3224 thiss!1248) (zeroValue!3326 thiss!1248) (minValue!3326 thiss!1248) key!828 (defaultEntry!3483 thiss!1248)))))

(declare-fun res!80196 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168471 (= res!80196 (inRange!0 (index!4173 lt!84239) (mask!8248 thiss!1248)))))

(assert (=> b!168471 (=> (not res!80196) (not e!110750))))

(assert (=> b!168471 e!110750))

(declare-fun b!168472 () Bool)

(declare-fun e!110752 () Bool)

(assert (=> b!168472 (= e!110752 tp_is_empty!3861)))

(declare-fun b!168473 () Bool)

(assert (=> b!168473 (= e!110759 e!110755)))

(declare-fun res!80192 () Bool)

(assert (=> b!168473 (=> (not res!80192) (not e!110755))))

(get-info :version)

(assert (=> b!168473 (= res!80192 (and (not ((_ is Undefined!501) lt!84239)) (not ((_ is MissingVacant!501) lt!84239)) (not ((_ is MissingZero!501) lt!84239)) ((_ is Found!501) lt!84239)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6819 (_ BitVec 32)) SeekEntryResult!501)

(assert (=> b!168473 (= lt!84239 (seekEntryOrOpen!0 key!828 (_keys!5308 thiss!1248) (mask!8248 thiss!1248)))))

(declare-fun b!168474 () Bool)

(assert (=> b!168474 (= e!110758 (and e!110752 mapRes!6510))))

(declare-fun condMapEmpty!6510 () Bool)

(declare-fun mapDefault!6510 () ValueCell!1587)

(assert (=> b!168474 (= condMapEmpty!6510 (= (arr!3246 (_values!3466 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1587)) mapDefault!6510)))))

(assert (= (and start!16754 res!80190) b!168465))

(assert (= (and b!168465 res!80191) b!168473))

(assert (= (and b!168473 res!80192) b!168463))

(assert (= (and b!168463 c!30370) b!168471))

(assert (= (and b!168463 (not c!30370)) b!168470))

(assert (= (and b!168471 res!80196) b!168464))

(assert (= (and b!168463 (not res!80195)) b!168466))

(assert (= (and b!168466 (not res!80194)) b!168462))

(assert (= (and b!168462 (not res!80193)) b!168468))

(assert (= (and b!168474 condMapEmpty!6510) mapIsEmpty!6510))

(assert (= (and b!168474 (not condMapEmpty!6510)) mapNonEmpty!6510))

(assert (= (and mapNonEmpty!6510 ((_ is ValueCellFull!1587) mapValue!6510)) b!168467))

(assert (= (and b!168474 ((_ is ValueCellFull!1587) mapDefault!6510)) b!168472))

(assert (= b!168469 b!168474))

(assert (= start!16754 b!168469))

(declare-fun m!197535 () Bool)

(assert (=> b!168463 m!197535))

(declare-fun m!197537 () Bool)

(assert (=> b!168463 m!197537))

(declare-fun m!197539 () Bool)

(assert (=> b!168463 m!197539))

(declare-fun m!197541 () Bool)

(assert (=> b!168463 m!197541))

(declare-fun m!197543 () Bool)

(assert (=> b!168463 m!197543))

(declare-fun m!197545 () Bool)

(assert (=> b!168463 m!197545))

(declare-fun m!197547 () Bool)

(assert (=> b!168463 m!197547))

(declare-fun m!197549 () Bool)

(assert (=> b!168470 m!197549))

(declare-fun m!197551 () Bool)

(assert (=> start!16754 m!197551))

(declare-fun m!197553 () Bool)

(assert (=> b!168462 m!197553))

(declare-fun m!197555 () Bool)

(assert (=> b!168464 m!197555))

(declare-fun m!197557 () Bool)

(assert (=> b!168469 m!197557))

(declare-fun m!197559 () Bool)

(assert (=> b!168469 m!197559))

(declare-fun m!197561 () Bool)

(assert (=> b!168471 m!197561))

(declare-fun m!197563 () Bool)

(assert (=> b!168471 m!197563))

(declare-fun m!197565 () Bool)

(assert (=> mapNonEmpty!6510 m!197565))

(declare-fun m!197567 () Bool)

(assert (=> b!168468 m!197567))

(declare-fun m!197569 () Bool)

(assert (=> b!168473 m!197569))

(check-sat (not b!168468) (not b!168470) (not b!168462) (not b!168463) (not b_next!4059) (not start!16754) (not b!168471) tp_is_empty!3861 (not b!168473) b_and!10473 (not mapNonEmpty!6510) (not b!168469))
(check-sat b_and!10473 (not b_next!4059))
