; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16774 () Bool)

(assert start!16774)

(declare-fun b!168818 () Bool)

(declare-fun b_free!4079 () Bool)

(declare-fun b_next!4079 () Bool)

(assert (=> b!168818 (= b_free!4079 (not b_next!4079))))

(declare-fun tp!14838 () Bool)

(declare-fun b_and!10493 () Bool)

(assert (=> b!168818 (= tp!14838 b_and!10493)))

(declare-fun b!168809 () Bool)

(declare-fun res!80358 () Bool)

(declare-fun e!111043 () Bool)

(assert (=> b!168809 (=> (not res!80358) (not e!111043))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168809 (= res!80358 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168810 () Bool)

(declare-fun e!111046 () Bool)

(assert (=> b!168810 (= e!111046 true)))

(declare-fun lt!84527 () Bool)

(declare-datatypes ((V!4821 0))(
  ( (V!4822 (val!1985 Int)) )
))
(declare-datatypes ((ValueCell!1597 0))(
  ( (ValueCellFull!1597 (v!3850 V!4821)) (EmptyCell!1597) )
))
(declare-datatypes ((array!6859 0))(
  ( (array!6860 (arr!3265 (Array (_ BitVec 32) (_ BitVec 64))) (size!3553 (_ BitVec 32))) )
))
(declare-datatypes ((array!6861 0))(
  ( (array!6862 (arr!3266 (Array (_ BitVec 32) ValueCell!1597)) (size!3554 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2102 0))(
  ( (LongMapFixedSize!2103 (defaultEntry!3493 Int) (mask!8264 (_ BitVec 32)) (extraKeys!3234 (_ BitVec 32)) (zeroValue!3336 V!4821) (minValue!3336 V!4821) (_size!1100 (_ BitVec 32)) (_keys!5318 array!6859) (_values!3476 array!6861) (_vacant!1100 (_ BitVec 32))) )
))
(declare-fun lt!84532 () LongMapFixedSize!2102)

(declare-datatypes ((tuple2!3182 0))(
  ( (tuple2!3183 (_1!1602 (_ BitVec 64)) (_2!1602 V!4821)) )
))
(declare-datatypes ((List!2172 0))(
  ( (Nil!2169) (Cons!2168 (h!2785 tuple2!3182) (t!6974 List!2172)) )
))
(declare-datatypes ((ListLongMap!2137 0))(
  ( (ListLongMap!2138 (toList!1084 List!2172)) )
))
(declare-fun contains!1126 (ListLongMap!2137 (_ BitVec 64)) Bool)

(declare-fun map!1802 (LongMapFixedSize!2102) ListLongMap!2137)

(assert (=> b!168810 (= lt!84527 (contains!1126 (map!1802 lt!84532) key!828))))

(declare-fun mapNonEmpty!6540 () Bool)

(declare-fun mapRes!6540 () Bool)

(declare-fun tp!14837 () Bool)

(declare-fun e!111049 () Bool)

(assert (=> mapNonEmpty!6540 (= mapRes!6540 (and tp!14837 e!111049))))

(declare-fun mapKey!6540 () (_ BitVec 32))

(declare-fun mapRest!6540 () (Array (_ BitVec 32) ValueCell!1597))

(declare-fun thiss!1248 () LongMapFixedSize!2102)

(declare-fun mapValue!6540 () ValueCell!1597)

(assert (=> mapNonEmpty!6540 (= (arr!3266 (_values!3476 thiss!1248)) (store mapRest!6540 mapKey!6540 mapValue!6540))))

(declare-fun b!168811 () Bool)

(declare-datatypes ((Unit!5210 0))(
  ( (Unit!5211) )
))
(declare-fun e!111041 () Unit!5210)

(declare-fun lt!84525 () Unit!5210)

(assert (=> b!168811 (= e!111041 lt!84525)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!130 (array!6859 array!6861 (_ BitVec 32) (_ BitVec 32) V!4821 V!4821 (_ BitVec 64) Int) Unit!5210)

(assert (=> b!168811 (= lt!84525 (lemmaInListMapThenSeekEntryOrOpenFindsIt!130 (_keys!5318 thiss!1248) (_values!3476 thiss!1248) (mask!8264 thiss!1248) (extraKeys!3234 thiss!1248) (zeroValue!3336 thiss!1248) (minValue!3336 thiss!1248) key!828 (defaultEntry!3493 thiss!1248)))))

(declare-fun res!80360 () Bool)

(declare-datatypes ((SeekEntryResult!510 0))(
  ( (MissingZero!510 (index!4208 (_ BitVec 32))) (Found!510 (index!4209 (_ BitVec 32))) (Intermediate!510 (undefined!1322 Bool) (index!4210 (_ BitVec 32)) (x!18650 (_ BitVec 32))) (Undefined!510) (MissingVacant!510 (index!4211 (_ BitVec 32))) )
))
(declare-fun lt!84533 () SeekEntryResult!510)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168811 (= res!80360 (inRange!0 (index!4209 lt!84533) (mask!8264 thiss!1248)))))

(declare-fun e!111048 () Bool)

(assert (=> b!168811 (=> (not res!80360) (not e!111048))))

(assert (=> b!168811 e!111048))

(declare-fun b!168812 () Bool)

(declare-fun e!111047 () Bool)

(assert (=> b!168812 (= e!111047 (not e!111046))))

(declare-fun res!80357 () Bool)

(assert (=> b!168812 (=> res!80357 e!111046)))

(declare-fun valid!910 (LongMapFixedSize!2102) Bool)

(assert (=> b!168812 (= res!80357 (not (valid!910 lt!84532)))))

(declare-fun lt!84528 () ListLongMap!2137)

(assert (=> b!168812 (contains!1126 lt!84528 (select (arr!3265 (_keys!5318 thiss!1248)) (index!4209 lt!84533)))))

(declare-fun lt!84524 () Unit!5210)

(declare-fun lt!84535 () array!6861)

(declare-fun lemmaValidKeyInArrayIsInListMap!137 (array!6859 array!6861 (_ BitVec 32) (_ BitVec 32) V!4821 V!4821 (_ BitVec 32) Int) Unit!5210)

(assert (=> b!168812 (= lt!84524 (lemmaValidKeyInArrayIsInListMap!137 (_keys!5318 thiss!1248) lt!84535 (mask!8264 thiss!1248) (extraKeys!3234 thiss!1248) (zeroValue!3336 thiss!1248) (minValue!3336 thiss!1248) (index!4209 lt!84533) (defaultEntry!3493 thiss!1248)))))

(assert (=> b!168812 (= lt!84532 (LongMapFixedSize!2103 (defaultEntry!3493 thiss!1248) (mask!8264 thiss!1248) (extraKeys!3234 thiss!1248) (zeroValue!3336 thiss!1248) (minValue!3336 thiss!1248) (_size!1100 thiss!1248) (_keys!5318 thiss!1248) lt!84535 (_vacant!1100 thiss!1248)))))

(declare-fun lt!84530 () ListLongMap!2137)

(assert (=> b!168812 (= lt!84530 lt!84528)))

(declare-fun getCurrentListMap!742 (array!6859 array!6861 (_ BitVec 32) (_ BitVec 32) V!4821 V!4821 (_ BitVec 32) Int) ListLongMap!2137)

(assert (=> b!168812 (= lt!84528 (getCurrentListMap!742 (_keys!5318 thiss!1248) lt!84535 (mask!8264 thiss!1248) (extraKeys!3234 thiss!1248) (zeroValue!3336 thiss!1248) (minValue!3336 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3493 thiss!1248)))))

(declare-fun lt!84529 () ListLongMap!2137)

(declare-fun v!309 () V!4821)

(declare-fun +!236 (ListLongMap!2137 tuple2!3182) ListLongMap!2137)

(assert (=> b!168812 (= lt!84530 (+!236 lt!84529 (tuple2!3183 key!828 v!309)))))

(assert (=> b!168812 (= lt!84535 (array!6862 (store (arr!3266 (_values!3476 thiss!1248)) (index!4209 lt!84533) (ValueCellFull!1597 v!309)) (size!3554 (_values!3476 thiss!1248))))))

(declare-fun lt!84534 () Unit!5210)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!91 (array!6859 array!6861 (_ BitVec 32) (_ BitVec 32) V!4821 V!4821 (_ BitVec 32) (_ BitVec 64) V!4821 Int) Unit!5210)

(assert (=> b!168812 (= lt!84534 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!91 (_keys!5318 thiss!1248) (_values!3476 thiss!1248) (mask!8264 thiss!1248) (extraKeys!3234 thiss!1248) (zeroValue!3336 thiss!1248) (minValue!3336 thiss!1248) (index!4209 lt!84533) key!828 v!309 (defaultEntry!3493 thiss!1248)))))

(declare-fun lt!84526 () Unit!5210)

(assert (=> b!168812 (= lt!84526 e!111041)))

(declare-fun c!30400 () Bool)

(assert (=> b!168812 (= c!30400 (contains!1126 lt!84529 key!828))))

(assert (=> b!168812 (= lt!84529 (getCurrentListMap!742 (_keys!5318 thiss!1248) (_values!3476 thiss!1248) (mask!8264 thiss!1248) (extraKeys!3234 thiss!1248) (zeroValue!3336 thiss!1248) (minValue!3336 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3493 thiss!1248)))))

(declare-fun b!168813 () Bool)

(declare-fun e!111044 () Bool)

(declare-fun tp_is_empty!3881 () Bool)

(assert (=> b!168813 (= e!111044 tp_is_empty!3881)))

(declare-fun b!168814 () Bool)

(assert (=> b!168814 (= e!111049 tp_is_empty!3881)))

(declare-fun b!168815 () Bool)

(declare-fun e!111045 () Bool)

(assert (=> b!168815 (= e!111045 (and e!111044 mapRes!6540))))

(declare-fun condMapEmpty!6540 () Bool)

(declare-fun mapDefault!6540 () ValueCell!1597)

