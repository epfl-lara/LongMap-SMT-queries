; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16768 () Bool)

(assert start!16768)

(declare-fun b!168711 () Bool)

(declare-fun b_free!4073 () Bool)

(declare-fun b_next!4073 () Bool)

(assert (=> b!168711 (= b_free!4073 (not b_next!4073))))

(declare-fun tp!14819 () Bool)

(declare-fun b_and!10487 () Bool)

(assert (=> b!168711 (= tp!14819 b_and!10487)))

(declare-datatypes ((V!4813 0))(
  ( (V!4814 (val!1982 Int)) )
))
(declare-datatypes ((ValueCell!1594 0))(
  ( (ValueCellFull!1594 (v!3847 V!4813)) (EmptyCell!1594) )
))
(declare-datatypes ((array!6847 0))(
  ( (array!6848 (arr!3259 (Array (_ BitVec 32) (_ BitVec 64))) (size!3547 (_ BitVec 32))) )
))
(declare-datatypes ((array!6849 0))(
  ( (array!6850 (arr!3260 (Array (_ BitVec 32) ValueCell!1594)) (size!3548 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2096 0))(
  ( (LongMapFixedSize!2097 (defaultEntry!3490 Int) (mask!8259 (_ BitVec 32)) (extraKeys!3231 (_ BitVec 32)) (zeroValue!3333 V!4813) (minValue!3333 V!4813) (_size!1097 (_ BitVec 32)) (_keys!5315 array!6847) (_values!3473 array!6849) (_vacant!1097 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2096)

(declare-fun e!110955 () Bool)

(declare-fun e!110960 () Bool)

(declare-fun tp_is_empty!3875 () Bool)

(declare-fun array_inv!2097 (array!6847) Bool)

(declare-fun array_inv!2098 (array!6849) Bool)

(assert (=> b!168711 (= e!110960 (and tp!14819 tp_is_empty!3875 (array_inv!2097 (_keys!5315 thiss!1248)) (array_inv!2098 (_values!3473 thiss!1248)) e!110955))))

(declare-fun b!168712 () Bool)

(declare-fun e!110953 () Bool)

(assert (=> b!168712 (= e!110953 (not true))))

(declare-fun lt!84427 () Bool)

(declare-fun lt!84421 () array!6849)

(declare-fun valid!907 (LongMapFixedSize!2096) Bool)

(assert (=> b!168712 (= lt!84427 (valid!907 (LongMapFixedSize!2097 (defaultEntry!3490 thiss!1248) (mask!8259 thiss!1248) (extraKeys!3231 thiss!1248) (zeroValue!3333 thiss!1248) (minValue!3333 thiss!1248) (_size!1097 thiss!1248) (_keys!5315 thiss!1248) lt!84421 (_vacant!1097 thiss!1248))))))

(declare-datatypes ((tuple2!3176 0))(
  ( (tuple2!3177 (_1!1599 (_ BitVec 64)) (_2!1599 V!4813)) )
))
(declare-datatypes ((List!2169 0))(
  ( (Nil!2166) (Cons!2165 (h!2782 tuple2!3176) (t!6971 List!2169)) )
))
(declare-datatypes ((ListLongMap!2131 0))(
  ( (ListLongMap!2132 (toList!1081 List!2169)) )
))
(declare-fun lt!84422 () ListLongMap!2131)

(declare-datatypes ((SeekEntryResult!507 0))(
  ( (MissingZero!507 (index!4196 (_ BitVec 32))) (Found!507 (index!4197 (_ BitVec 32))) (Intermediate!507 (undefined!1319 Bool) (index!4198 (_ BitVec 32)) (x!18639 (_ BitVec 32))) (Undefined!507) (MissingVacant!507 (index!4199 (_ BitVec 32))) )
))
(declare-fun lt!84423 () SeekEntryResult!507)

(declare-fun contains!1123 (ListLongMap!2131 (_ BitVec 64)) Bool)

(assert (=> b!168712 (contains!1123 lt!84422 (select (arr!3259 (_keys!5315 thiss!1248)) (index!4197 lt!84423)))))

(declare-datatypes ((Unit!5202 0))(
  ( (Unit!5203) )
))
(declare-fun lt!84426 () Unit!5202)

(declare-fun lemmaValidKeyInArrayIsInListMap!134 (array!6847 array!6849 (_ BitVec 32) (_ BitVec 32) V!4813 V!4813 (_ BitVec 32) Int) Unit!5202)

(assert (=> b!168712 (= lt!84426 (lemmaValidKeyInArrayIsInListMap!134 (_keys!5315 thiss!1248) lt!84421 (mask!8259 thiss!1248) (extraKeys!3231 thiss!1248) (zeroValue!3333 thiss!1248) (minValue!3333 thiss!1248) (index!4197 lt!84423) (defaultEntry!3490 thiss!1248)))))

(declare-fun lt!84425 () ListLongMap!2131)

(assert (=> b!168712 (= lt!84425 lt!84422)))

(declare-fun getCurrentListMap!739 (array!6847 array!6849 (_ BitVec 32) (_ BitVec 32) V!4813 V!4813 (_ BitVec 32) Int) ListLongMap!2131)

(assert (=> b!168712 (= lt!84422 (getCurrentListMap!739 (_keys!5315 thiss!1248) lt!84421 (mask!8259 thiss!1248) (extraKeys!3231 thiss!1248) (zeroValue!3333 thiss!1248) (minValue!3333 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3490 thiss!1248)))))

(declare-fun lt!84424 () ListLongMap!2131)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4813)

(declare-fun +!233 (ListLongMap!2131 tuple2!3176) ListLongMap!2131)

(assert (=> b!168712 (= lt!84425 (+!233 lt!84424 (tuple2!3177 key!828 v!309)))))

(assert (=> b!168712 (= lt!84421 (array!6850 (store (arr!3260 (_values!3473 thiss!1248)) (index!4197 lt!84423) (ValueCellFull!1594 v!309)) (size!3548 (_values!3473 thiss!1248))))))

(declare-fun lt!84419 () Unit!5202)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!88 (array!6847 array!6849 (_ BitVec 32) (_ BitVec 32) V!4813 V!4813 (_ BitVec 32) (_ BitVec 64) V!4813 Int) Unit!5202)

(assert (=> b!168712 (= lt!84419 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!88 (_keys!5315 thiss!1248) (_values!3473 thiss!1248) (mask!8259 thiss!1248) (extraKeys!3231 thiss!1248) (zeroValue!3333 thiss!1248) (minValue!3333 thiss!1248) (index!4197 lt!84423) key!828 v!309 (defaultEntry!3490 thiss!1248)))))

(declare-fun lt!84420 () Unit!5202)

(declare-fun e!110957 () Unit!5202)

(assert (=> b!168712 (= lt!84420 e!110957)))

(declare-fun c!30391 () Bool)

(assert (=> b!168712 (= c!30391 (contains!1123 lt!84424 key!828))))

(assert (=> b!168712 (= lt!84424 (getCurrentListMap!739 (_keys!5315 thiss!1248) (_values!3473 thiss!1248) (mask!8259 thiss!1248) (extraKeys!3231 thiss!1248) (zeroValue!3333 thiss!1248) (minValue!3333 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3490 thiss!1248)))))

(declare-fun b!168713 () Bool)

(declare-fun e!110954 () Bool)

(assert (=> b!168713 (= e!110954 tp_is_empty!3875)))

(declare-fun b!168714 () Bool)

(declare-fun e!110952 () Bool)

(assert (=> b!168714 (= e!110952 e!110953)))

(declare-fun res!80316 () Bool)

(assert (=> b!168714 (=> (not res!80316) (not e!110953))))

(assert (=> b!168714 (= res!80316 (and (not (is-Undefined!507 lt!84423)) (not (is-MissingVacant!507 lt!84423)) (not (is-MissingZero!507 lt!84423)) (is-Found!507 lt!84423)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6847 (_ BitVec 32)) SeekEntryResult!507)

(assert (=> b!168714 (= lt!84423 (seekEntryOrOpen!0 key!828 (_keys!5315 thiss!1248) (mask!8259 thiss!1248)))))

(declare-fun mapIsEmpty!6531 () Bool)

(declare-fun mapRes!6531 () Bool)

(assert (=> mapIsEmpty!6531 mapRes!6531))

(declare-fun b!168715 () Bool)

(declare-fun lt!84417 () Unit!5202)

(assert (=> b!168715 (= e!110957 lt!84417)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!127 (array!6847 array!6849 (_ BitVec 32) (_ BitVec 32) V!4813 V!4813 (_ BitVec 64) Int) Unit!5202)

(assert (=> b!168715 (= lt!84417 (lemmaInListMapThenSeekEntryOrOpenFindsIt!127 (_keys!5315 thiss!1248) (_values!3473 thiss!1248) (mask!8259 thiss!1248) (extraKeys!3231 thiss!1248) (zeroValue!3333 thiss!1248) (minValue!3333 thiss!1248) key!828 (defaultEntry!3490 thiss!1248)))))

(declare-fun res!80313 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168715 (= res!80313 (inRange!0 (index!4197 lt!84423) (mask!8259 thiss!1248)))))

(declare-fun e!110956 () Bool)

(assert (=> b!168715 (=> (not res!80313) (not e!110956))))

(assert (=> b!168715 e!110956))

(declare-fun mapNonEmpty!6531 () Bool)

(declare-fun tp!14820 () Bool)

(declare-fun e!110959 () Bool)

(assert (=> mapNonEmpty!6531 (= mapRes!6531 (and tp!14820 e!110959))))

(declare-fun mapRest!6531 () (Array (_ BitVec 32) ValueCell!1594))

(declare-fun mapValue!6531 () ValueCell!1594)

(declare-fun mapKey!6531 () (_ BitVec 32))

(assert (=> mapNonEmpty!6531 (= (arr!3260 (_values!3473 thiss!1248)) (store mapRest!6531 mapKey!6531 mapValue!6531))))

(declare-fun b!168716 () Bool)

(assert (=> b!168716 (= e!110955 (and e!110954 mapRes!6531))))

(declare-fun condMapEmpty!6531 () Bool)

(declare-fun mapDefault!6531 () ValueCell!1594)

