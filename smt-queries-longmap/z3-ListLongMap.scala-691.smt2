; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16654 () Bool)

(assert start!16654)

(declare-fun b!166487 () Bool)

(declare-fun b_free!3955 () Bool)

(declare-fun b_next!3955 () Bool)

(assert (=> b!166487 (= b_free!3955 (not b_next!3955))))

(declare-fun tp!14465 () Bool)

(declare-fun b_and!10383 () Bool)

(assert (=> b!166487 (= tp!14465 b_and!10383)))

(declare-fun mapNonEmpty!6354 () Bool)

(declare-fun mapRes!6354 () Bool)

(declare-fun tp!14466 () Bool)

(declare-fun e!109216 () Bool)

(assert (=> mapNonEmpty!6354 (= mapRes!6354 (and tp!14466 e!109216))))

(declare-datatypes ((V!4657 0))(
  ( (V!4658 (val!1923 Int)) )
))
(declare-datatypes ((ValueCell!1535 0))(
  ( (ValueCellFull!1535 (v!3789 V!4657)) (EmptyCell!1535) )
))
(declare-fun mapRest!6354 () (Array (_ BitVec 32) ValueCell!1535))

(declare-datatypes ((array!6597 0))(
  ( (array!6598 (arr!3134 (Array (_ BitVec 32) (_ BitVec 64))) (size!3422 (_ BitVec 32))) )
))
(declare-datatypes ((array!6599 0))(
  ( (array!6600 (arr!3135 (Array (_ BitVec 32) ValueCell!1535)) (size!3423 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1978 0))(
  ( (LongMapFixedSize!1979 (defaultEntry!3431 Int) (mask!8162 (_ BitVec 32)) (extraKeys!3172 (_ BitVec 32)) (zeroValue!3274 V!4657) (minValue!3274 V!4657) (_size!1038 (_ BitVec 32)) (_keys!5256 array!6597) (_values!3414 array!6599) (_vacant!1038 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1978)

(declare-fun mapValue!6354 () ValueCell!1535)

(declare-fun mapKey!6354 () (_ BitVec 32))

(assert (=> mapNonEmpty!6354 (= (arr!3135 (_values!3414 thiss!1248)) (store mapRest!6354 mapKey!6354 mapValue!6354))))

(declare-fun b!166481 () Bool)

(declare-datatypes ((Unit!5073 0))(
  ( (Unit!5074) )
))
(declare-fun e!109221 () Unit!5073)

(declare-fun lt!83363 () Unit!5073)

(assert (=> b!166481 (= e!109221 lt!83363)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!91 (array!6597 array!6599 (_ BitVec 32) (_ BitVec 32) V!4657 V!4657 (_ BitVec 64) Int) Unit!5073)

(assert (=> b!166481 (= lt!83363 (lemmaInListMapThenSeekEntryOrOpenFindsIt!91 (_keys!5256 thiss!1248) (_values!3414 thiss!1248) (mask!8162 thiss!1248) (extraKeys!3172 thiss!1248) (zeroValue!3274 thiss!1248) (minValue!3274 thiss!1248) key!828 (defaultEntry!3431 thiss!1248)))))

(declare-fun res!79120 () Bool)

(declare-datatypes ((SeekEntryResult!452 0))(
  ( (MissingZero!452 (index!3976 (_ BitVec 32))) (Found!452 (index!3977 (_ BitVec 32))) (Intermediate!452 (undefined!1264 Bool) (index!3978 (_ BitVec 32)) (x!18432 (_ BitVec 32))) (Undefined!452) (MissingVacant!452 (index!3979 (_ BitVec 32))) )
))
(declare-fun lt!83364 () SeekEntryResult!452)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166481 (= res!79120 (inRange!0 (index!3977 lt!83364) (mask!8162 thiss!1248)))))

(declare-fun e!109220 () Bool)

(assert (=> b!166481 (=> (not res!79120) (not e!109220))))

(assert (=> b!166481 e!109220))

(declare-fun b!166482 () Bool)

(declare-fun e!109218 () Bool)

(declare-fun e!109215 () Bool)

(assert (=> b!166482 (= e!109218 e!109215)))

(declare-fun res!79123 () Bool)

(assert (=> b!166482 (=> (not res!79123) (not e!109215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166482 (= res!79123 (validMask!0 (mask!8162 thiss!1248)))))

(declare-fun lt!83367 () Unit!5073)

(assert (=> b!166482 (= lt!83367 e!109221)))

(declare-fun c!30227 () Bool)

(declare-datatypes ((tuple2!3060 0))(
  ( (tuple2!3061 (_1!1541 (_ BitVec 64)) (_2!1541 V!4657)) )
))
(declare-datatypes ((List!2078 0))(
  ( (Nil!2075) (Cons!2074 (h!2691 tuple2!3060) (t!6872 List!2078)) )
))
(declare-datatypes ((ListLongMap!2021 0))(
  ( (ListLongMap!2022 (toList!1026 List!2078)) )
))
(declare-fun contains!1078 (ListLongMap!2021 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!688 (array!6597 array!6599 (_ BitVec 32) (_ BitVec 32) V!4657 V!4657 (_ BitVec 32) Int) ListLongMap!2021)

(assert (=> b!166482 (= c!30227 (contains!1078 (getCurrentListMap!688 (_keys!5256 thiss!1248) (_values!3414 thiss!1248) (mask!8162 thiss!1248) (extraKeys!3172 thiss!1248) (zeroValue!3274 thiss!1248) (minValue!3274 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3431 thiss!1248)) key!828))))

(declare-fun b!166483 () Bool)

(declare-fun e!109217 () Bool)

(declare-fun tp_is_empty!3757 () Bool)

(assert (=> b!166483 (= e!109217 tp_is_empty!3757)))

(declare-fun b!166484 () Bool)

(declare-fun e!109222 () Bool)

(assert (=> b!166484 (= e!109222 (and e!109217 mapRes!6354))))

(declare-fun condMapEmpty!6354 () Bool)

(declare-fun mapDefault!6354 () ValueCell!1535)

(assert (=> b!166484 (= condMapEmpty!6354 (= (arr!3135 (_values!3414 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1535)) mapDefault!6354)))))

(declare-fun b!166485 () Bool)

(declare-fun e!109219 () Bool)

(assert (=> b!166485 (= e!109219 e!109218)))

(declare-fun res!79124 () Bool)

(assert (=> b!166485 (=> (not res!79124) (not e!109218))))

(get-info :version)

(assert (=> b!166485 (= res!79124 (and (not ((_ is Undefined!452) lt!83364)) (not ((_ is MissingVacant!452) lt!83364)) (not ((_ is MissingZero!452) lt!83364)) ((_ is Found!452) lt!83364)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6597 (_ BitVec 32)) SeekEntryResult!452)

(assert (=> b!166485 (= lt!83364 (seekEntryOrOpen!0 key!828 (_keys!5256 thiss!1248) (mask!8162 thiss!1248)))))

(declare-fun b!166486 () Bool)

(declare-fun res!79119 () Bool)

(assert (=> b!166486 (=> (not res!79119) (not e!109219))))

(assert (=> b!166486 (= res!79119 (not (= key!828 (bvneg key!828))))))

(declare-fun res!79125 () Bool)

(assert (=> start!16654 (=> (not res!79125) (not e!109219))))

(declare-fun valid!881 (LongMapFixedSize!1978) Bool)

(assert (=> start!16654 (= res!79125 (valid!881 thiss!1248))))

(assert (=> start!16654 e!109219))

(declare-fun e!109223 () Bool)

(assert (=> start!16654 e!109223))

(assert (=> start!16654 true))

(declare-fun array_inv!2007 (array!6597) Bool)

(declare-fun array_inv!2008 (array!6599) Bool)

(assert (=> b!166487 (= e!109223 (and tp!14465 tp_is_empty!3757 (array_inv!2007 (_keys!5256 thiss!1248)) (array_inv!2008 (_values!3414 thiss!1248)) e!109222))))

(declare-fun b!166488 () Bool)

(assert (=> b!166488 (= e!109220 (= (select (arr!3134 (_keys!5256 thiss!1248)) (index!3977 lt!83364)) key!828))))

(declare-fun b!166489 () Bool)

(declare-fun res!79121 () Bool)

(assert (=> b!166489 (=> (not res!79121) (not e!109215))))

(assert (=> b!166489 (= res!79121 (and (= (size!3423 (_values!3414 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8162 thiss!1248))) (= (size!3422 (_keys!5256 thiss!1248)) (size!3423 (_values!3414 thiss!1248))) (bvsge (mask!8162 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3172 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3172 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166490 () Bool)

(assert (=> b!166490 (= e!109215 false)))

(declare-fun lt!83365 () Bool)

(declare-datatypes ((List!2079 0))(
  ( (Nil!2076) (Cons!2075 (h!2692 (_ BitVec 64)) (t!6873 List!2079)) )
))
(declare-fun arrayNoDuplicates!0 (array!6597 (_ BitVec 32) List!2079) Bool)

(assert (=> b!166490 (= lt!83365 (arrayNoDuplicates!0 (_keys!5256 thiss!1248) #b00000000000000000000000000000000 Nil!2076))))

(declare-fun mapIsEmpty!6354 () Bool)

(assert (=> mapIsEmpty!6354 mapRes!6354))

(declare-fun b!166491 () Bool)

(declare-fun res!79122 () Bool)

(assert (=> b!166491 (=> (not res!79122) (not e!109215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6597 (_ BitVec 32)) Bool)

(assert (=> b!166491 (= res!79122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5256 thiss!1248) (mask!8162 thiss!1248)))))

(declare-fun b!166492 () Bool)

(assert (=> b!166492 (= e!109216 tp_is_empty!3757)))

(declare-fun b!166493 () Bool)

(declare-fun Unit!5075 () Unit!5073)

(assert (=> b!166493 (= e!109221 Unit!5075)))

(declare-fun lt!83366 () Unit!5073)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!87 (array!6597 array!6599 (_ BitVec 32) (_ BitVec 32) V!4657 V!4657 (_ BitVec 64) Int) Unit!5073)

(assert (=> b!166493 (= lt!83366 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!87 (_keys!5256 thiss!1248) (_values!3414 thiss!1248) (mask!8162 thiss!1248) (extraKeys!3172 thiss!1248) (zeroValue!3274 thiss!1248) (minValue!3274 thiss!1248) key!828 (defaultEntry!3431 thiss!1248)))))

(assert (=> b!166493 false))

(assert (= (and start!16654 res!79125) b!166486))

(assert (= (and b!166486 res!79119) b!166485))

(assert (= (and b!166485 res!79124) b!166482))

(assert (= (and b!166482 c!30227) b!166481))

(assert (= (and b!166482 (not c!30227)) b!166493))

(assert (= (and b!166481 res!79120) b!166488))

(assert (= (and b!166482 res!79123) b!166489))

(assert (= (and b!166489 res!79121) b!166491))

(assert (= (and b!166491 res!79122) b!166490))

(assert (= (and b!166484 condMapEmpty!6354) mapIsEmpty!6354))

(assert (= (and b!166484 (not condMapEmpty!6354)) mapNonEmpty!6354))

(assert (= (and mapNonEmpty!6354 ((_ is ValueCellFull!1535) mapValue!6354)) b!166492))

(assert (= (and b!166484 ((_ is ValueCellFull!1535) mapDefault!6354)) b!166483))

(assert (= b!166487 b!166484))

(assert (= start!16654 b!166487))

(declare-fun m!196061 () Bool)

(assert (=> b!166487 m!196061))

(declare-fun m!196063 () Bool)

(assert (=> b!166487 m!196063))

(declare-fun m!196065 () Bool)

(assert (=> b!166493 m!196065))

(declare-fun m!196067 () Bool)

(assert (=> mapNonEmpty!6354 m!196067))

(declare-fun m!196069 () Bool)

(assert (=> b!166485 m!196069))

(declare-fun m!196071 () Bool)

(assert (=> start!16654 m!196071))

(declare-fun m!196073 () Bool)

(assert (=> b!166490 m!196073))

(declare-fun m!196075 () Bool)

(assert (=> b!166491 m!196075))

(declare-fun m!196077 () Bool)

(assert (=> b!166488 m!196077))

(declare-fun m!196079 () Bool)

(assert (=> b!166482 m!196079))

(declare-fun m!196081 () Bool)

(assert (=> b!166482 m!196081))

(assert (=> b!166482 m!196081))

(declare-fun m!196083 () Bool)

(assert (=> b!166482 m!196083))

(declare-fun m!196085 () Bool)

(assert (=> b!166481 m!196085))

(declare-fun m!196087 () Bool)

(assert (=> b!166481 m!196087))

(check-sat (not b!166491) (not b!166482) (not b!166487) (not b!166481) tp_is_empty!3757 b_and!10383 (not mapNonEmpty!6354) (not start!16654) (not b!166490) (not b!166493) (not b!166485) (not b_next!3955))
(check-sat b_and!10383 (not b_next!3955))
