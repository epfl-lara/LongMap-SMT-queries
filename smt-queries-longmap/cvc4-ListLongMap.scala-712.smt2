; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16780 () Bool)

(assert start!16780)

(declare-fun b!168909 () Bool)

(declare-fun b_free!4085 () Bool)

(declare-fun b_next!4085 () Bool)

(assert (=> b!168909 (= b_free!4085 (not b_next!4085))))

(declare-fun tp!14856 () Bool)

(declare-fun b_and!10499 () Bool)

(assert (=> b!168909 (= tp!14856 b_and!10499)))

(declare-fun b!168908 () Bool)

(declare-fun res!80406 () Bool)

(declare-fun e!111138 () Bool)

(assert (=> b!168908 (=> (not res!80406) (not e!111138))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168908 (= res!80406 (not (= key!828 (bvneg key!828))))))

(declare-fun tp_is_empty!3887 () Bool)

(declare-datatypes ((V!4829 0))(
  ( (V!4830 (val!1988 Int)) )
))
(declare-datatypes ((ValueCell!1600 0))(
  ( (ValueCellFull!1600 (v!3853 V!4829)) (EmptyCell!1600) )
))
(declare-datatypes ((array!6871 0))(
  ( (array!6872 (arr!3271 (Array (_ BitVec 32) (_ BitVec 64))) (size!3559 (_ BitVec 32))) )
))
(declare-datatypes ((array!6873 0))(
  ( (array!6874 (arr!3272 (Array (_ BitVec 32) ValueCell!1600)) (size!3560 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2108 0))(
  ( (LongMapFixedSize!2109 (defaultEntry!3496 Int) (mask!8269 (_ BitVec 32)) (extraKeys!3237 (_ BitVec 32)) (zeroValue!3339 V!4829) (minValue!3339 V!4829) (_size!1103 (_ BitVec 32)) (_keys!5321 array!6871) (_values!3479 array!6873) (_vacant!1103 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2108)

(declare-fun e!111140 () Bool)

(declare-fun e!111134 () Bool)

(declare-fun array_inv!2105 (array!6871) Bool)

(declare-fun array_inv!2106 (array!6873) Bool)

(assert (=> b!168909 (= e!111140 (and tp!14856 tp_is_empty!3887 (array_inv!2105 (_keys!5321 thiss!1248)) (array_inv!2106 (_values!3479 thiss!1248)) e!111134))))

(declare-fun b!168910 () Bool)

(declare-fun e!111137 () Bool)

(assert (=> b!168910 (= e!111137 true)))

(declare-fun lt!84635 () Bool)

(declare-fun lt!84633 () LongMapFixedSize!2108)

(declare-datatypes ((tuple2!3188 0))(
  ( (tuple2!3189 (_1!1605 (_ BitVec 64)) (_2!1605 V!4829)) )
))
(declare-datatypes ((List!2175 0))(
  ( (Nil!2172) (Cons!2171 (h!2788 tuple2!3188) (t!6977 List!2175)) )
))
(declare-datatypes ((ListLongMap!2143 0))(
  ( (ListLongMap!2144 (toList!1087 List!2175)) )
))
(declare-fun contains!1129 (ListLongMap!2143 (_ BitVec 64)) Bool)

(declare-fun map!1807 (LongMapFixedSize!2108) ListLongMap!2143)

(assert (=> b!168910 (= lt!84635 (contains!1129 (map!1807 lt!84633) key!828))))

(declare-fun b!168911 () Bool)

(declare-datatypes ((Unit!5218 0))(
  ( (Unit!5219) )
))
(declare-fun e!111133 () Unit!5218)

(declare-fun Unit!5220 () Unit!5218)

(assert (=> b!168911 (= e!111133 Unit!5220)))

(declare-fun lt!84642 () Unit!5218)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!133 (array!6871 array!6873 (_ BitVec 32) (_ BitVec 32) V!4829 V!4829 (_ BitVec 64) Int) Unit!5218)

(assert (=> b!168911 (= lt!84642 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!133 (_keys!5321 thiss!1248) (_values!3479 thiss!1248) (mask!8269 thiss!1248) (extraKeys!3237 thiss!1248) (zeroValue!3339 thiss!1248) (minValue!3339 thiss!1248) key!828 (defaultEntry!3496 thiss!1248)))))

(assert (=> b!168911 false))

(declare-fun res!80402 () Bool)

(assert (=> start!16780 (=> (not res!80402) (not e!111138))))

(declare-fun valid!913 (LongMapFixedSize!2108) Bool)

(assert (=> start!16780 (= res!80402 (valid!913 thiss!1248))))

(assert (=> start!16780 e!111138))

(assert (=> start!16780 e!111140))

(assert (=> start!16780 true))

(assert (=> start!16780 tp_is_empty!3887))

(declare-fun mapIsEmpty!6549 () Bool)

(declare-fun mapRes!6549 () Bool)

(assert (=> mapIsEmpty!6549 mapRes!6549))

(declare-fun b!168912 () Bool)

(declare-fun e!111135 () Bool)

(assert (=> b!168912 (= e!111135 (not e!111137))))

(declare-fun res!80405 () Bool)

(assert (=> b!168912 (=> res!80405 e!111137)))

(assert (=> b!168912 (= res!80405 (not (valid!913 lt!84633)))))

(declare-fun lt!84643 () ListLongMap!2143)

(declare-datatypes ((SeekEntryResult!513 0))(
  ( (MissingZero!513 (index!4220 (_ BitVec 32))) (Found!513 (index!4221 (_ BitVec 32))) (Intermediate!513 (undefined!1325 Bool) (index!4222 (_ BitVec 32)) (x!18661 (_ BitVec 32))) (Undefined!513) (MissingVacant!513 (index!4223 (_ BitVec 32))) )
))
(declare-fun lt!84641 () SeekEntryResult!513)

(assert (=> b!168912 (contains!1129 lt!84643 (select (arr!3271 (_keys!5321 thiss!1248)) (index!4221 lt!84641)))))

(declare-fun lt!84636 () array!6873)

(declare-fun lt!84638 () Unit!5218)

(declare-fun lemmaValidKeyInArrayIsInListMap!140 (array!6871 array!6873 (_ BitVec 32) (_ BitVec 32) V!4829 V!4829 (_ BitVec 32) Int) Unit!5218)

(assert (=> b!168912 (= lt!84638 (lemmaValidKeyInArrayIsInListMap!140 (_keys!5321 thiss!1248) lt!84636 (mask!8269 thiss!1248) (extraKeys!3237 thiss!1248) (zeroValue!3339 thiss!1248) (minValue!3339 thiss!1248) (index!4221 lt!84641) (defaultEntry!3496 thiss!1248)))))

(assert (=> b!168912 (= lt!84633 (LongMapFixedSize!2109 (defaultEntry!3496 thiss!1248) (mask!8269 thiss!1248) (extraKeys!3237 thiss!1248) (zeroValue!3339 thiss!1248) (minValue!3339 thiss!1248) (_size!1103 thiss!1248) (_keys!5321 thiss!1248) lt!84636 (_vacant!1103 thiss!1248)))))

(declare-fun lt!84640 () ListLongMap!2143)

(assert (=> b!168912 (= lt!84640 lt!84643)))

(declare-fun getCurrentListMap!745 (array!6871 array!6873 (_ BitVec 32) (_ BitVec 32) V!4829 V!4829 (_ BitVec 32) Int) ListLongMap!2143)

(assert (=> b!168912 (= lt!84643 (getCurrentListMap!745 (_keys!5321 thiss!1248) lt!84636 (mask!8269 thiss!1248) (extraKeys!3237 thiss!1248) (zeroValue!3339 thiss!1248) (minValue!3339 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3496 thiss!1248)))))

(declare-fun lt!84632 () ListLongMap!2143)

(declare-fun v!309 () V!4829)

(declare-fun +!239 (ListLongMap!2143 tuple2!3188) ListLongMap!2143)

(assert (=> b!168912 (= lt!84640 (+!239 lt!84632 (tuple2!3189 key!828 v!309)))))

(assert (=> b!168912 (= lt!84636 (array!6874 (store (arr!3272 (_values!3479 thiss!1248)) (index!4221 lt!84641) (ValueCellFull!1600 v!309)) (size!3560 (_values!3479 thiss!1248))))))

(declare-fun lt!84639 () Unit!5218)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!94 (array!6871 array!6873 (_ BitVec 32) (_ BitVec 32) V!4829 V!4829 (_ BitVec 32) (_ BitVec 64) V!4829 Int) Unit!5218)

(assert (=> b!168912 (= lt!84639 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!94 (_keys!5321 thiss!1248) (_values!3479 thiss!1248) (mask!8269 thiss!1248) (extraKeys!3237 thiss!1248) (zeroValue!3339 thiss!1248) (minValue!3339 thiss!1248) (index!4221 lt!84641) key!828 v!309 (defaultEntry!3496 thiss!1248)))))

(declare-fun lt!84637 () Unit!5218)

(assert (=> b!168912 (= lt!84637 e!111133)))

(declare-fun c!30409 () Bool)

(assert (=> b!168912 (= c!30409 (contains!1129 lt!84632 key!828))))

(assert (=> b!168912 (= lt!84632 (getCurrentListMap!745 (_keys!5321 thiss!1248) (_values!3479 thiss!1248) (mask!8269 thiss!1248) (extraKeys!3237 thiss!1248) (zeroValue!3339 thiss!1248) (minValue!3339 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3496 thiss!1248)))))

(declare-fun b!168913 () Bool)

(declare-fun e!111131 () Bool)

(assert (=> b!168913 (= e!111134 (and e!111131 mapRes!6549))))

(declare-fun condMapEmpty!6549 () Bool)

(declare-fun mapDefault!6549 () ValueCell!1600)

