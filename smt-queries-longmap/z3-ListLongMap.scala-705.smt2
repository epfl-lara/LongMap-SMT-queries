; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16738 () Bool)

(assert start!16738)

(declare-fun b!168121 () Bool)

(declare-fun b_free!4039 () Bool)

(declare-fun b_next!4039 () Bool)

(assert (=> b!168121 (= b_free!4039 (not b_next!4039))))

(declare-fun tp!14718 () Bool)

(declare-fun b_and!10467 () Bool)

(assert (=> b!168121 (= tp!14718 b_and!10467)))

(declare-fun b!168119 () Bool)

(declare-fun res!80001 () Bool)

(declare-fun e!110477 () Bool)

(assert (=> b!168119 (=> res!80001 e!110477)))

(declare-datatypes ((V!4769 0))(
  ( (V!4770 (val!1965 Int)) )
))
(declare-datatypes ((ValueCell!1577 0))(
  ( (ValueCellFull!1577 (v!3831 V!4769)) (EmptyCell!1577) )
))
(declare-datatypes ((array!6765 0))(
  ( (array!6766 (arr!3218 (Array (_ BitVec 32) (_ BitVec 64))) (size!3506 (_ BitVec 32))) )
))
(declare-datatypes ((array!6767 0))(
  ( (array!6768 (arr!3219 (Array (_ BitVec 32) ValueCell!1577)) (size!3507 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2062 0))(
  ( (LongMapFixedSize!2063 (defaultEntry!3473 Int) (mask!8232 (_ BitVec 32)) (extraKeys!3214 (_ BitVec 32)) (zeroValue!3316 V!4769) (minValue!3316 V!4769) (_size!1080 (_ BitVec 32)) (_keys!5298 array!6765) (_values!3456 array!6767) (_vacant!1080 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2062)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6765 (_ BitVec 32)) Bool)

(assert (=> b!168119 (= res!80001 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5298 thiss!1248) (mask!8232 thiss!1248))))))

(declare-fun b!168120 () Bool)

(assert (=> b!168120 (= e!110477 true)))

(declare-fun lt!84087 () Bool)

(declare-datatypes ((List!2132 0))(
  ( (Nil!2129) (Cons!2128 (h!2745 (_ BitVec 64)) (t!6926 List!2132)) )
))
(declare-fun arrayNoDuplicates!0 (array!6765 (_ BitVec 32) List!2132) Bool)

(assert (=> b!168120 (= lt!84087 (arrayNoDuplicates!0 (_keys!5298 thiss!1248) #b00000000000000000000000000000000 Nil!2129))))

(declare-fun mapNonEmpty!6480 () Bool)

(declare-fun mapRes!6480 () Bool)

(declare-fun tp!14717 () Bool)

(declare-fun e!110475 () Bool)

(assert (=> mapNonEmpty!6480 (= mapRes!6480 (and tp!14717 e!110475))))

(declare-fun mapRest!6480 () (Array (_ BitVec 32) ValueCell!1577))

(declare-fun mapValue!6480 () ValueCell!1577)

(declare-fun mapKey!6480 () (_ BitVec 32))

(assert (=> mapNonEmpty!6480 (= (arr!3219 (_values!3456 thiss!1248)) (store mapRest!6480 mapKey!6480 mapValue!6480))))

(declare-fun e!110481 () Bool)

(declare-fun e!110480 () Bool)

(declare-fun tp_is_empty!3841 () Bool)

(declare-fun array_inv!2061 (array!6765) Bool)

(declare-fun array_inv!2062 (array!6767) Bool)

(assert (=> b!168121 (= e!110481 (and tp!14718 tp_is_empty!3841 (array_inv!2061 (_keys!5298 thiss!1248)) (array_inv!2062 (_values!3456 thiss!1248)) e!110480))))

(declare-fun e!110483 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!486 0))(
  ( (MissingZero!486 (index!4112 (_ BitVec 32))) (Found!486 (index!4113 (_ BitVec 32))) (Intermediate!486 (undefined!1298 Bool) (index!4114 (_ BitVec 32)) (x!18578 (_ BitVec 32))) (Undefined!486) (MissingVacant!486 (index!4115 (_ BitVec 32))) )
))
(declare-fun lt!84088 () SeekEntryResult!486)

(declare-fun b!168122 () Bool)

(assert (=> b!168122 (= e!110483 (= (select (arr!3218 (_keys!5298 thiss!1248)) (index!4113 lt!84088)) key!828))))

(declare-fun b!168123 () Bool)

(assert (=> b!168123 (= e!110475 tp_is_empty!3841)))

(declare-fun b!168124 () Bool)

(declare-datatypes ((Unit!5167 0))(
  ( (Unit!5168) )
))
(declare-fun e!110478 () Unit!5167)

(declare-fun lt!84091 () Unit!5167)

(assert (=> b!168124 (= e!110478 lt!84091)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!118 (array!6765 array!6767 (_ BitVec 32) (_ BitVec 32) V!4769 V!4769 (_ BitVec 64) Int) Unit!5167)

(assert (=> b!168124 (= lt!84091 (lemmaInListMapThenSeekEntryOrOpenFindsIt!118 (_keys!5298 thiss!1248) (_values!3456 thiss!1248) (mask!8232 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) key!828 (defaultEntry!3473 thiss!1248)))))

(declare-fun res!80005 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168124 (= res!80005 (inRange!0 (index!4113 lt!84088) (mask!8232 thiss!1248)))))

(assert (=> b!168124 (=> (not res!80005) (not e!110483))))

(assert (=> b!168124 e!110483))

(declare-fun b!168125 () Bool)

(declare-fun e!110479 () Bool)

(assert (=> b!168125 (= e!110480 (and e!110479 mapRes!6480))))

(declare-fun condMapEmpty!6480 () Bool)

(declare-fun mapDefault!6480 () ValueCell!1577)

(assert (=> b!168125 (= condMapEmpty!6480 (= (arr!3219 (_values!3456 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1577)) mapDefault!6480)))))

(declare-fun b!168126 () Bool)

(declare-fun res!80004 () Bool)

(declare-fun e!110474 () Bool)

(assert (=> b!168126 (=> (not res!80004) (not e!110474))))

(assert (=> b!168126 (= res!80004 (not (= key!828 (bvneg key!828))))))

(declare-fun res!80006 () Bool)

(assert (=> start!16738 (=> (not res!80006) (not e!110474))))

(declare-fun valid!906 (LongMapFixedSize!2062) Bool)

(assert (=> start!16738 (= res!80006 (valid!906 thiss!1248))))

(assert (=> start!16738 e!110474))

(assert (=> start!16738 e!110481))

(assert (=> start!16738 true))

(assert (=> start!16738 tp_is_empty!3841))

(declare-fun b!168127 () Bool)

(declare-fun e!110482 () Bool)

(assert (=> b!168127 (= e!110482 (not e!110477))))

(declare-fun res!80007 () Bool)

(assert (=> b!168127 (=> res!80007 e!110477)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168127 (= res!80007 (not (validMask!0 (mask!8232 thiss!1248))))))

(declare-fun v!309 () V!4769)

(declare-datatypes ((tuple2!3118 0))(
  ( (tuple2!3119 (_1!1570 (_ BitVec 64)) (_2!1570 V!4769)) )
))
(declare-datatypes ((List!2133 0))(
  ( (Nil!2130) (Cons!2129 (h!2746 tuple2!3118) (t!6927 List!2133)) )
))
(declare-datatypes ((ListLongMap!2079 0))(
  ( (ListLongMap!2080 (toList!1055 List!2133)) )
))
(declare-fun lt!84093 () ListLongMap!2079)

(declare-fun +!223 (ListLongMap!2079 tuple2!3118) ListLongMap!2079)

(declare-fun getCurrentListMap!717 (array!6765 array!6767 (_ BitVec 32) (_ BitVec 32) V!4769 V!4769 (_ BitVec 32) Int) ListLongMap!2079)

(assert (=> b!168127 (= (+!223 lt!84093 (tuple2!3119 key!828 v!309)) (getCurrentListMap!717 (_keys!5298 thiss!1248) (array!6768 (store (arr!3219 (_values!3456 thiss!1248)) (index!4113 lt!84088) (ValueCellFull!1577 v!309)) (size!3507 (_values!3456 thiss!1248))) (mask!8232 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3473 thiss!1248)))))

(declare-fun lt!84092 () Unit!5167)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!81 (array!6765 array!6767 (_ BitVec 32) (_ BitVec 32) V!4769 V!4769 (_ BitVec 32) (_ BitVec 64) V!4769 Int) Unit!5167)

(assert (=> b!168127 (= lt!84092 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!81 (_keys!5298 thiss!1248) (_values!3456 thiss!1248) (mask!8232 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) (index!4113 lt!84088) key!828 v!309 (defaultEntry!3473 thiss!1248)))))

(declare-fun lt!84090 () Unit!5167)

(assert (=> b!168127 (= lt!84090 e!110478)))

(declare-fun c!30353 () Bool)

(declare-fun contains!1107 (ListLongMap!2079 (_ BitVec 64)) Bool)

(assert (=> b!168127 (= c!30353 (contains!1107 lt!84093 key!828))))

(assert (=> b!168127 (= lt!84093 (getCurrentListMap!717 (_keys!5298 thiss!1248) (_values!3456 thiss!1248) (mask!8232 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3473 thiss!1248)))))

(declare-fun b!168128 () Bool)

(assert (=> b!168128 (= e!110474 e!110482)))

(declare-fun res!80002 () Bool)

(assert (=> b!168128 (=> (not res!80002) (not e!110482))))

(get-info :version)

(assert (=> b!168128 (= res!80002 (and (not ((_ is Undefined!486) lt!84088)) (not ((_ is MissingVacant!486) lt!84088)) (not ((_ is MissingZero!486) lt!84088)) ((_ is Found!486) lt!84088)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6765 (_ BitVec 32)) SeekEntryResult!486)

(assert (=> b!168128 (= lt!84088 (seekEntryOrOpen!0 key!828 (_keys!5298 thiss!1248) (mask!8232 thiss!1248)))))

(declare-fun b!168129 () Bool)

(declare-fun Unit!5169 () Unit!5167)

(assert (=> b!168129 (= e!110478 Unit!5169)))

(declare-fun lt!84089 () Unit!5167)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!109 (array!6765 array!6767 (_ BitVec 32) (_ BitVec 32) V!4769 V!4769 (_ BitVec 64) Int) Unit!5167)

(assert (=> b!168129 (= lt!84089 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!109 (_keys!5298 thiss!1248) (_values!3456 thiss!1248) (mask!8232 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) key!828 (defaultEntry!3473 thiss!1248)))))

(assert (=> b!168129 false))

(declare-fun b!168130 () Bool)

(assert (=> b!168130 (= e!110479 tp_is_empty!3841)))

(declare-fun b!168131 () Bool)

(declare-fun res!80003 () Bool)

(assert (=> b!168131 (=> res!80003 e!110477)))

(assert (=> b!168131 (= res!80003 (or (not (= (size!3507 (_values!3456 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8232 thiss!1248)))) (not (= (size!3506 (_keys!5298 thiss!1248)) (size!3507 (_values!3456 thiss!1248)))) (bvslt (mask!8232 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3214 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3214 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6480 () Bool)

(assert (=> mapIsEmpty!6480 mapRes!6480))

(assert (= (and start!16738 res!80006) b!168126))

(assert (= (and b!168126 res!80004) b!168128))

(assert (= (and b!168128 res!80002) b!168127))

(assert (= (and b!168127 c!30353) b!168124))

(assert (= (and b!168127 (not c!30353)) b!168129))

(assert (= (and b!168124 res!80005) b!168122))

(assert (= (and b!168127 (not res!80007)) b!168131))

(assert (= (and b!168131 (not res!80003)) b!168119))

(assert (= (and b!168119 (not res!80001)) b!168120))

(assert (= (and b!168125 condMapEmpty!6480) mapIsEmpty!6480))

(assert (= (and b!168125 (not condMapEmpty!6480)) mapNonEmpty!6480))

(assert (= (and mapNonEmpty!6480 ((_ is ValueCellFull!1577) mapValue!6480)) b!168123))

(assert (= (and b!168125 ((_ is ValueCellFull!1577) mapDefault!6480)) b!168130))

(assert (= b!168121 b!168125))

(assert (= start!16738 b!168121))

(declare-fun m!197357 () Bool)

(assert (=> b!168127 m!197357))

(declare-fun m!197359 () Bool)

(assert (=> b!168127 m!197359))

(declare-fun m!197361 () Bool)

(assert (=> b!168127 m!197361))

(declare-fun m!197363 () Bool)

(assert (=> b!168127 m!197363))

(declare-fun m!197365 () Bool)

(assert (=> b!168127 m!197365))

(declare-fun m!197367 () Bool)

(assert (=> b!168127 m!197367))

(declare-fun m!197369 () Bool)

(assert (=> b!168127 m!197369))

(declare-fun m!197371 () Bool)

(assert (=> b!168121 m!197371))

(declare-fun m!197373 () Bool)

(assert (=> b!168121 m!197373))

(declare-fun m!197375 () Bool)

(assert (=> b!168128 m!197375))

(declare-fun m!197377 () Bool)

(assert (=> b!168122 m!197377))

(declare-fun m!197379 () Bool)

(assert (=> start!16738 m!197379))

(declare-fun m!197381 () Bool)

(assert (=> mapNonEmpty!6480 m!197381))

(declare-fun m!197383 () Bool)

(assert (=> b!168124 m!197383))

(declare-fun m!197385 () Bool)

(assert (=> b!168124 m!197385))

(declare-fun m!197387 () Bool)

(assert (=> b!168129 m!197387))

(declare-fun m!197389 () Bool)

(assert (=> b!168120 m!197389))

(declare-fun m!197391 () Bool)

(assert (=> b!168119 m!197391))

(check-sat (not b!168120) (not b!168127) (not b!168129) (not mapNonEmpty!6480) (not b!168119) b_and!10467 (not start!16738) (not b_next!4039) (not b!168124) (not b!168128) (not b!168121) tp_is_empty!3841)
(check-sat b_and!10467 (not b_next!4039))
