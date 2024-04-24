; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16756 () Bool)

(assert start!16756)

(declare-fun b!168480 () Bool)

(declare-fun b_free!4057 () Bool)

(declare-fun b_next!4057 () Bool)

(assert (=> b!168480 (= b_free!4057 (not b_next!4057))))

(declare-fun tp!14771 () Bool)

(declare-fun b_and!10485 () Bool)

(assert (=> b!168480 (= tp!14771 b_and!10485)))

(declare-fun b!168470 () Bool)

(declare-fun res!80194 () Bool)

(declare-fun e!110752 () Bool)

(assert (=> b!168470 (=> res!80194 e!110752)))

(declare-datatypes ((V!4793 0))(
  ( (V!4794 (val!1974 Int)) )
))
(declare-datatypes ((ValueCell!1586 0))(
  ( (ValueCellFull!1586 (v!3840 V!4793)) (EmptyCell!1586) )
))
(declare-datatypes ((array!6801 0))(
  ( (array!6802 (arr!3236 (Array (_ BitVec 32) (_ BitVec 64))) (size!3524 (_ BitVec 32))) )
))
(declare-datatypes ((array!6803 0))(
  ( (array!6804 (arr!3237 (Array (_ BitVec 32) ValueCell!1586)) (size!3525 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2080 0))(
  ( (LongMapFixedSize!2081 (defaultEntry!3482 Int) (mask!8247 (_ BitVec 32)) (extraKeys!3223 (_ BitVec 32)) (zeroValue!3325 V!4793) (minValue!3325 V!4793) (_size!1089 (_ BitVec 32)) (_keys!5307 array!6801) (_values!3465 array!6803) (_vacant!1089 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2080)

(assert (=> b!168470 (= res!80194 (or (not (= (size!3525 (_values!3465 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8247 thiss!1248)))) (not (= (size!3524 (_keys!5307 thiss!1248)) (size!3525 (_values!3465 thiss!1248)))) (bvslt (mask!8247 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3223 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3223 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168472 () Bool)

(declare-datatypes ((Unit!5189 0))(
  ( (Unit!5190) )
))
(declare-fun e!110753 () Unit!5189)

(declare-fun Unit!5191 () Unit!5189)

(assert (=> b!168472 (= e!110753 Unit!5191)))

(declare-fun lt!84281 () Unit!5189)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!115 (array!6801 array!6803 (_ BitVec 32) (_ BitVec 32) V!4793 V!4793 (_ BitVec 64) Int) Unit!5189)

(assert (=> b!168472 (= lt!84281 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!115 (_keys!5307 thiss!1248) (_values!3465 thiss!1248) (mask!8247 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) key!828 (defaultEntry!3482 thiss!1248)))))

(assert (=> b!168472 false))

(declare-fun b!168473 () Bool)

(declare-fun res!80196 () Bool)

(assert (=> b!168473 (=> res!80196 e!110752)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6801 (_ BitVec 32)) Bool)

(assert (=> b!168473 (= res!80196 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5307 thiss!1248) (mask!8247 thiss!1248))))))

(declare-fun b!168474 () Bool)

(declare-fun lt!84277 () Unit!5189)

(assert (=> b!168474 (= e!110753 lt!84277)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!123 (array!6801 array!6803 (_ BitVec 32) (_ BitVec 32) V!4793 V!4793 (_ BitVec 64) Int) Unit!5189)

(assert (=> b!168474 (= lt!84277 (lemmaInListMapThenSeekEntryOrOpenFindsIt!123 (_keys!5307 thiss!1248) (_values!3465 thiss!1248) (mask!8247 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) key!828 (defaultEntry!3482 thiss!1248)))))

(declare-fun res!80193 () Bool)

(declare-datatypes ((SeekEntryResult!494 0))(
  ( (MissingZero!494 (index!4144 (_ BitVec 32))) (Found!494 (index!4145 (_ BitVec 32))) (Intermediate!494 (undefined!1306 Bool) (index!4146 (_ BitVec 32)) (x!18610 (_ BitVec 32))) (Undefined!494) (MissingVacant!494 (index!4147 (_ BitVec 32))) )
))
(declare-fun lt!84282 () SeekEntryResult!494)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168474 (= res!80193 (inRange!0 (index!4145 lt!84282) (mask!8247 thiss!1248)))))

(declare-fun e!110747 () Bool)

(assert (=> b!168474 (=> (not res!80193) (not e!110747))))

(assert (=> b!168474 e!110747))

(declare-fun b!168475 () Bool)

(declare-fun e!110751 () Bool)

(assert (=> b!168475 (= e!110751 (not e!110752))))

(declare-fun res!80190 () Bool)

(assert (=> b!168475 (=> res!80190 e!110752)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168475 (= res!80190 (not (validMask!0 (mask!8247 thiss!1248))))))

(declare-datatypes ((tuple2!3132 0))(
  ( (tuple2!3133 (_1!1577 (_ BitVec 64)) (_2!1577 V!4793)) )
))
(declare-datatypes ((List!2144 0))(
  ( (Nil!2141) (Cons!2140 (h!2757 tuple2!3132) (t!6938 List!2144)) )
))
(declare-datatypes ((ListLongMap!2093 0))(
  ( (ListLongMap!2094 (toList!1062 List!2144)) )
))
(declare-fun lt!84280 () ListLongMap!2093)

(declare-fun v!309 () V!4793)

(declare-fun +!230 (ListLongMap!2093 tuple2!3132) ListLongMap!2093)

(declare-fun getCurrentListMap!724 (array!6801 array!6803 (_ BitVec 32) (_ BitVec 32) V!4793 V!4793 (_ BitVec 32) Int) ListLongMap!2093)

(assert (=> b!168475 (= (+!230 lt!84280 (tuple2!3133 key!828 v!309)) (getCurrentListMap!724 (_keys!5307 thiss!1248) (array!6804 (store (arr!3237 (_values!3465 thiss!1248)) (index!4145 lt!84282) (ValueCellFull!1586 v!309)) (size!3525 (_values!3465 thiss!1248))) (mask!8247 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3482 thiss!1248)))))

(declare-fun lt!84279 () Unit!5189)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!88 (array!6801 array!6803 (_ BitVec 32) (_ BitVec 32) V!4793 V!4793 (_ BitVec 32) (_ BitVec 64) V!4793 Int) Unit!5189)

(assert (=> b!168475 (= lt!84279 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!88 (_keys!5307 thiss!1248) (_values!3465 thiss!1248) (mask!8247 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) (index!4145 lt!84282) key!828 v!309 (defaultEntry!3482 thiss!1248)))))

(declare-fun lt!84278 () Unit!5189)

(assert (=> b!168475 (= lt!84278 e!110753)))

(declare-fun c!30380 () Bool)

(declare-fun contains!1114 (ListLongMap!2093 (_ BitVec 64)) Bool)

(assert (=> b!168475 (= c!30380 (contains!1114 lt!84280 key!828))))

(assert (=> b!168475 (= lt!84280 (getCurrentListMap!724 (_keys!5307 thiss!1248) (_values!3465 thiss!1248) (mask!8247 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3482 thiss!1248)))))

(declare-fun mapIsEmpty!6507 () Bool)

(declare-fun mapRes!6507 () Bool)

(assert (=> mapIsEmpty!6507 mapRes!6507))

(declare-fun b!168476 () Bool)

(declare-fun e!110744 () Bool)

(declare-fun e!110748 () Bool)

(assert (=> b!168476 (= e!110744 (and e!110748 mapRes!6507))))

(declare-fun condMapEmpty!6507 () Bool)

(declare-fun mapDefault!6507 () ValueCell!1586)

(assert (=> b!168476 (= condMapEmpty!6507 (= (arr!3237 (_values!3465 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1586)) mapDefault!6507)))))

(declare-fun b!168477 () Bool)

(declare-fun res!80195 () Bool)

(declare-fun e!110746 () Bool)

(assert (=> b!168477 (=> (not res!80195) (not e!110746))))

(assert (=> b!168477 (= res!80195 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168478 () Bool)

(assert (=> b!168478 (= e!110752 true)))

(declare-fun lt!84276 () Bool)

(declare-datatypes ((List!2145 0))(
  ( (Nil!2142) (Cons!2141 (h!2758 (_ BitVec 64)) (t!6939 List!2145)) )
))
(declare-fun arrayNoDuplicates!0 (array!6801 (_ BitVec 32) List!2145) Bool)

(assert (=> b!168478 (= lt!84276 (arrayNoDuplicates!0 (_keys!5307 thiss!1248) #b00000000000000000000000000000000 Nil!2142))))

(declare-fun mapNonEmpty!6507 () Bool)

(declare-fun tp!14772 () Bool)

(declare-fun e!110750 () Bool)

(assert (=> mapNonEmpty!6507 (= mapRes!6507 (and tp!14772 e!110750))))

(declare-fun mapKey!6507 () (_ BitVec 32))

(declare-fun mapValue!6507 () ValueCell!1586)

(declare-fun mapRest!6507 () (Array (_ BitVec 32) ValueCell!1586))

(assert (=> mapNonEmpty!6507 (= (arr!3237 (_values!3465 thiss!1248)) (store mapRest!6507 mapKey!6507 mapValue!6507))))

(declare-fun b!168479 () Bool)

(declare-fun tp_is_empty!3859 () Bool)

(assert (=> b!168479 (= e!110750 tp_is_empty!3859)))

(declare-fun e!110745 () Bool)

(declare-fun array_inv!2075 (array!6801) Bool)

(declare-fun array_inv!2076 (array!6803) Bool)

(assert (=> b!168480 (= e!110745 (and tp!14771 tp_is_empty!3859 (array_inv!2075 (_keys!5307 thiss!1248)) (array_inv!2076 (_values!3465 thiss!1248)) e!110744))))

(declare-fun b!168471 () Bool)

(assert (=> b!168471 (= e!110748 tp_is_empty!3859)))

(declare-fun res!80192 () Bool)

(assert (=> start!16756 (=> (not res!80192) (not e!110746))))

(declare-fun valid!913 (LongMapFixedSize!2080) Bool)

(assert (=> start!16756 (= res!80192 (valid!913 thiss!1248))))

(assert (=> start!16756 e!110746))

(assert (=> start!16756 e!110745))

(assert (=> start!16756 true))

(assert (=> start!16756 tp_is_empty!3859))

(declare-fun b!168481 () Bool)

(assert (=> b!168481 (= e!110747 (= (select (arr!3236 (_keys!5307 thiss!1248)) (index!4145 lt!84282)) key!828))))

(declare-fun b!168482 () Bool)

(assert (=> b!168482 (= e!110746 e!110751)))

(declare-fun res!80191 () Bool)

(assert (=> b!168482 (=> (not res!80191) (not e!110751))))

(get-info :version)

(assert (=> b!168482 (= res!80191 (and (not ((_ is Undefined!494) lt!84282)) (not ((_ is MissingVacant!494) lt!84282)) (not ((_ is MissingZero!494) lt!84282)) ((_ is Found!494) lt!84282)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6801 (_ BitVec 32)) SeekEntryResult!494)

(assert (=> b!168482 (= lt!84282 (seekEntryOrOpen!0 key!828 (_keys!5307 thiss!1248) (mask!8247 thiss!1248)))))

(assert (= (and start!16756 res!80192) b!168477))

(assert (= (and b!168477 res!80195) b!168482))

(assert (= (and b!168482 res!80191) b!168475))

(assert (= (and b!168475 c!30380) b!168474))

(assert (= (and b!168475 (not c!30380)) b!168472))

(assert (= (and b!168474 res!80193) b!168481))

(assert (= (and b!168475 (not res!80190)) b!168470))

(assert (= (and b!168470 (not res!80194)) b!168473))

(assert (= (and b!168473 (not res!80196)) b!168478))

(assert (= (and b!168476 condMapEmpty!6507) mapIsEmpty!6507))

(assert (= (and b!168476 (not condMapEmpty!6507)) mapNonEmpty!6507))

(assert (= (and mapNonEmpty!6507 ((_ is ValueCellFull!1586) mapValue!6507)) b!168479))

(assert (= (and b!168476 ((_ is ValueCellFull!1586) mapDefault!6507)) b!168471))

(assert (= b!168480 b!168476))

(assert (= start!16756 b!168480))

(declare-fun m!197681 () Bool)

(assert (=> start!16756 m!197681))

(declare-fun m!197683 () Bool)

(assert (=> b!168473 m!197683))

(declare-fun m!197685 () Bool)

(assert (=> b!168475 m!197685))

(declare-fun m!197687 () Bool)

(assert (=> b!168475 m!197687))

(declare-fun m!197689 () Bool)

(assert (=> b!168475 m!197689))

(declare-fun m!197691 () Bool)

(assert (=> b!168475 m!197691))

(declare-fun m!197693 () Bool)

(assert (=> b!168475 m!197693))

(declare-fun m!197695 () Bool)

(assert (=> b!168475 m!197695))

(declare-fun m!197697 () Bool)

(assert (=> b!168475 m!197697))

(declare-fun m!197699 () Bool)

(assert (=> b!168474 m!197699))

(declare-fun m!197701 () Bool)

(assert (=> b!168474 m!197701))

(declare-fun m!197703 () Bool)

(assert (=> mapNonEmpty!6507 m!197703))

(declare-fun m!197705 () Bool)

(assert (=> b!168482 m!197705))

(declare-fun m!197707 () Bool)

(assert (=> b!168472 m!197707))

(declare-fun m!197709 () Bool)

(assert (=> b!168478 m!197709))

(declare-fun m!197711 () Bool)

(assert (=> b!168480 m!197711))

(declare-fun m!197713 () Bool)

(assert (=> b!168480 m!197713))

(declare-fun m!197715 () Bool)

(assert (=> b!168481 m!197715))

(check-sat (not b!168472) (not mapNonEmpty!6507) tp_is_empty!3859 (not b!168474) (not b!168482) (not b!168473) (not b!168478) b_and!10485 (not b_next!4057) (not b!168475) (not b!168480) (not start!16756))
(check-sat b_and!10485 (not b_next!4057))
