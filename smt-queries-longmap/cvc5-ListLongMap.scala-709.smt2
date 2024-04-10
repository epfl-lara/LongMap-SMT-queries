; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16758 () Bool)

(assert start!16758)

(declare-fun b!168542 () Bool)

(declare-fun b_free!4063 () Bool)

(declare-fun b_next!4063 () Bool)

(assert (=> b!168542 (= b_free!4063 (not b_next!4063))))

(declare-fun tp!14789 () Bool)

(declare-fun b_and!10477 () Bool)

(assert (=> b!168542 (= tp!14789 b_and!10477)))

(declare-fun b!168540 () Bool)

(declare-fun e!110810 () Bool)

(declare-fun e!110811 () Bool)

(assert (=> b!168540 (= e!110810 (not e!110811))))

(declare-fun res!80233 () Bool)

(assert (=> b!168540 (=> res!80233 e!110811)))

(declare-datatypes ((V!4801 0))(
  ( (V!4802 (val!1977 Int)) )
))
(declare-datatypes ((ValueCell!1589 0))(
  ( (ValueCellFull!1589 (v!3842 V!4801)) (EmptyCell!1589) )
))
(declare-datatypes ((array!6827 0))(
  ( (array!6828 (arr!3249 (Array (_ BitVec 32) (_ BitVec 64))) (size!3537 (_ BitVec 32))) )
))
(declare-datatypes ((array!6829 0))(
  ( (array!6830 (arr!3250 (Array (_ BitVec 32) ValueCell!1589)) (size!3538 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2086 0))(
  ( (LongMapFixedSize!2087 (defaultEntry!3485 Int) (mask!8252 (_ BitVec 32)) (extraKeys!3226 (_ BitVec 32)) (zeroValue!3328 V!4801) (minValue!3328 V!4801) (_size!1092 (_ BitVec 32)) (_keys!5310 array!6827) (_values!3468 array!6829) (_vacant!1092 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2086)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168540 (= res!80233 (not (validMask!0 (mask!8252 thiss!1248))))))

(declare-datatypes ((tuple2!3170 0))(
  ( (tuple2!3171 (_1!1596 (_ BitVec 64)) (_2!1596 V!4801)) )
))
(declare-datatypes ((List!2163 0))(
  ( (Nil!2160) (Cons!2159 (h!2776 tuple2!3170) (t!6965 List!2163)) )
))
(declare-datatypes ((ListLongMap!2125 0))(
  ( (ListLongMap!2126 (toList!1078 List!2163)) )
))
(declare-fun lt!84284 () ListLongMap!2125)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4801)

(declare-datatypes ((SeekEntryResult!503 0))(
  ( (MissingZero!503 (index!4180 (_ BitVec 32))) (Found!503 (index!4181 (_ BitVec 32))) (Intermediate!503 (undefined!1315 Bool) (index!4182 (_ BitVec 32)) (x!18627 (_ BitVec 32))) (Undefined!503) (MissingVacant!503 (index!4183 (_ BitVec 32))) )
))
(declare-fun lt!84282 () SeekEntryResult!503)

(declare-fun +!230 (ListLongMap!2125 tuple2!3170) ListLongMap!2125)

(declare-fun getCurrentListMap!736 (array!6827 array!6829 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 32) Int) ListLongMap!2125)

(assert (=> b!168540 (= (+!230 lt!84284 (tuple2!3171 key!828 v!309)) (getCurrentListMap!736 (_keys!5310 thiss!1248) (array!6830 (store (arr!3250 (_values!3468 thiss!1248)) (index!4181 lt!84282) (ValueCellFull!1589 v!309)) (size!3538 (_values!3468 thiss!1248))) (mask!8252 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3485 thiss!1248)))))

(declare-datatypes ((Unit!5191 0))(
  ( (Unit!5192) )
))
(declare-fun lt!84285 () Unit!5191)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!85 (array!6827 array!6829 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 32) (_ BitVec 64) V!4801 Int) Unit!5191)

(assert (=> b!168540 (= lt!84285 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!85 (_keys!5310 thiss!1248) (_values!3468 thiss!1248) (mask!8252 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) (index!4181 lt!84282) key!828 v!309 (defaultEntry!3485 thiss!1248)))))

(declare-fun lt!84286 () Unit!5191)

(declare-fun e!110817 () Unit!5191)

(assert (=> b!168540 (= lt!84286 e!110817)))

(declare-fun c!30376 () Bool)

(declare-fun contains!1120 (ListLongMap!2125 (_ BitVec 64)) Bool)

(assert (=> b!168540 (= c!30376 (contains!1120 lt!84284 key!828))))

(assert (=> b!168540 (= lt!84284 (getCurrentListMap!736 (_keys!5310 thiss!1248) (_values!3468 thiss!1248) (mask!8252 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3485 thiss!1248)))))

(declare-fun b!168541 () Bool)

(declare-fun Unit!5193 () Unit!5191)

(assert (=> b!168541 (= e!110817 Unit!5193)))

(declare-fun lt!84280 () Unit!5191)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!126 (array!6827 array!6829 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 64) Int) Unit!5191)

(assert (=> b!168541 (= lt!84280 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!126 (_keys!5310 thiss!1248) (_values!3468 thiss!1248) (mask!8252 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) key!828 (defaultEntry!3485 thiss!1248)))))

(assert (=> b!168541 false))

(declare-fun mapIsEmpty!6516 () Bool)

(declare-fun mapRes!6516 () Bool)

(assert (=> mapIsEmpty!6516 mapRes!6516))

(declare-fun tp_is_empty!3865 () Bool)

(declare-fun e!110815 () Bool)

(declare-fun e!110812 () Bool)

(declare-fun array_inv!2091 (array!6827) Bool)

(declare-fun array_inv!2092 (array!6829) Bool)

(assert (=> b!168542 (= e!110812 (and tp!14789 tp_is_empty!3865 (array_inv!2091 (_keys!5310 thiss!1248)) (array_inv!2092 (_values!3468 thiss!1248)) e!110815))))

(declare-fun b!168543 () Bool)

(declare-fun res!80237 () Bool)

(declare-fun e!110819 () Bool)

(assert (=> b!168543 (=> (not res!80237) (not e!110819))))

(assert (=> b!168543 (= res!80237 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168544 () Bool)

(declare-fun e!110816 () Bool)

(assert (=> b!168544 (= e!110816 tp_is_empty!3865)))

(declare-fun res!80238 () Bool)

(assert (=> start!16758 (=> (not res!80238) (not e!110819))))

(declare-fun valid!903 (LongMapFixedSize!2086) Bool)

(assert (=> start!16758 (= res!80238 (valid!903 thiss!1248))))

(assert (=> start!16758 e!110819))

(assert (=> start!16758 e!110812))

(assert (=> start!16758 true))

(assert (=> start!16758 tp_is_empty!3865))

(declare-fun mapNonEmpty!6516 () Bool)

(declare-fun tp!14790 () Bool)

(declare-fun e!110818 () Bool)

(assert (=> mapNonEmpty!6516 (= mapRes!6516 (and tp!14790 e!110818))))

(declare-fun mapRest!6516 () (Array (_ BitVec 32) ValueCell!1589))

(declare-fun mapKey!6516 () (_ BitVec 32))

(declare-fun mapValue!6516 () ValueCell!1589)

(assert (=> mapNonEmpty!6516 (= (arr!3250 (_values!3468 thiss!1248)) (store mapRest!6516 mapKey!6516 mapValue!6516))))

(declare-fun b!168545 () Bool)

(assert (=> b!168545 (= e!110811 true)))

(declare-fun lt!84283 () Bool)

(declare-datatypes ((List!2164 0))(
  ( (Nil!2161) (Cons!2160 (h!2777 (_ BitVec 64)) (t!6966 List!2164)) )
))
(declare-fun arrayNoDuplicates!0 (array!6827 (_ BitVec 32) List!2164) Bool)

(assert (=> b!168545 (= lt!84283 (arrayNoDuplicates!0 (_keys!5310 thiss!1248) #b00000000000000000000000000000000 Nil!2161))))

(declare-fun b!168546 () Bool)

(assert (=> b!168546 (= e!110819 e!110810)))

(declare-fun res!80232 () Bool)

(assert (=> b!168546 (=> (not res!80232) (not e!110810))))

(assert (=> b!168546 (= res!80232 (and (not (is-Undefined!503 lt!84282)) (not (is-MissingVacant!503 lt!84282)) (not (is-MissingZero!503 lt!84282)) (is-Found!503 lt!84282)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6827 (_ BitVec 32)) SeekEntryResult!503)

(assert (=> b!168546 (= lt!84282 (seekEntryOrOpen!0 key!828 (_keys!5310 thiss!1248) (mask!8252 thiss!1248)))))

(declare-fun e!110814 () Bool)

(declare-fun b!168547 () Bool)

(assert (=> b!168547 (= e!110814 (= (select (arr!3249 (_keys!5310 thiss!1248)) (index!4181 lt!84282)) key!828))))

(declare-fun b!168548 () Bool)

(declare-fun res!80235 () Bool)

(assert (=> b!168548 (=> res!80235 e!110811)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6827 (_ BitVec 32)) Bool)

(assert (=> b!168548 (= res!80235 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5310 thiss!1248) (mask!8252 thiss!1248))))))

(declare-fun b!168549 () Bool)

(assert (=> b!168549 (= e!110815 (and e!110816 mapRes!6516))))

(declare-fun condMapEmpty!6516 () Bool)

(declare-fun mapDefault!6516 () ValueCell!1589)

