; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16740 () Bool)

(assert start!16740)

(declare-fun b!168190 () Bool)

(declare-fun b_free!4045 () Bool)

(declare-fun b_next!4045 () Bool)

(assert (=> b!168190 (= b_free!4045 (not b_next!4045))))

(declare-fun tp!14736 () Bool)

(declare-fun b_and!10459 () Bool)

(assert (=> b!168190 (= tp!14736 b_and!10459)))

(declare-fun b!168189 () Bool)

(declare-fun res!80048 () Bool)

(declare-fun e!110547 () Bool)

(assert (=> b!168189 (=> res!80048 e!110547)))

(declare-datatypes ((V!4777 0))(
  ( (V!4778 (val!1968 Int)) )
))
(declare-datatypes ((ValueCell!1580 0))(
  ( (ValueCellFull!1580 (v!3833 V!4777)) (EmptyCell!1580) )
))
(declare-datatypes ((array!6791 0))(
  ( (array!6792 (arr!3231 (Array (_ BitVec 32) (_ BitVec 64))) (size!3519 (_ BitVec 32))) )
))
(declare-datatypes ((array!6793 0))(
  ( (array!6794 (arr!3232 (Array (_ BitVec 32) ValueCell!1580)) (size!3520 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2068 0))(
  ( (LongMapFixedSize!2069 (defaultEntry!3476 Int) (mask!8237 (_ BitVec 32)) (extraKeys!3217 (_ BitVec 32)) (zeroValue!3319 V!4777) (minValue!3319 V!4777) (_size!1083 (_ BitVec 32)) (_keys!5301 array!6791) (_values!3459 array!6793) (_vacant!1083 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2068)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6791 (_ BitVec 32)) Bool)

(assert (=> b!168189 (= res!80048 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5301 thiss!1248) (mask!8237 thiss!1248))))))

(declare-fun e!110546 () Bool)

(declare-fun tp_is_empty!3847 () Bool)

(declare-fun e!110548 () Bool)

(declare-fun array_inv!2075 (array!6791) Bool)

(declare-fun array_inv!2076 (array!6793) Bool)

(assert (=> b!168190 (= e!110548 (and tp!14736 tp_is_empty!3847 (array_inv!2075 (_keys!5301 thiss!1248)) (array_inv!2076 (_values!3459 thiss!1248)) e!110546))))

(declare-fun b!168191 () Bool)

(assert (=> b!168191 (= e!110547 true)))

(declare-fun lt!84097 () Bool)

(declare-datatypes ((List!2150 0))(
  ( (Nil!2147) (Cons!2146 (h!2763 (_ BitVec 64)) (t!6952 List!2150)) )
))
(declare-fun arrayNoDuplicates!0 (array!6791 (_ BitVec 32) List!2150) Bool)

(assert (=> b!168191 (= lt!84097 (arrayNoDuplicates!0 (_keys!5301 thiss!1248) #b00000000000000000000000000000000 Nil!2147))))

(declare-fun b!168192 () Bool)

(declare-fun e!110542 () Bool)

(assert (=> b!168192 (= e!110542 tp_is_empty!3847)))

(declare-fun b!168193 () Bool)

(declare-datatypes ((Unit!5166 0))(
  ( (Unit!5167) )
))
(declare-fun e!110544 () Unit!5166)

(declare-fun lt!84095 () Unit!5166)

(assert (=> b!168193 (= e!110544 lt!84095)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!117 (array!6791 array!6793 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 64) Int) Unit!5166)

(assert (=> b!168193 (= lt!84095 (lemmaInListMapThenSeekEntryOrOpenFindsIt!117 (_keys!5301 thiss!1248) (_values!3459 thiss!1248) (mask!8237 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) key!828 (defaultEntry!3476 thiss!1248)))))

(declare-fun res!80046 () Bool)

(declare-datatypes ((SeekEntryResult!494 0))(
  ( (MissingZero!494 (index!4144 (_ BitVec 32))) (Found!494 (index!4145 (_ BitVec 32))) (Intermediate!494 (undefined!1306 Bool) (index!4146 (_ BitVec 32)) (x!18594 (_ BitVec 32))) (Undefined!494) (MissingVacant!494 (index!4147 (_ BitVec 32))) )
))
(declare-fun lt!84091 () SeekEntryResult!494)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168193 (= res!80046 (inRange!0 (index!4145 lt!84091) (mask!8237 thiss!1248)))))

(declare-fun e!110545 () Bool)

(assert (=> b!168193 (=> (not res!80046) (not e!110545))))

(assert (=> b!168193 e!110545))

(declare-fun mapNonEmpty!6489 () Bool)

(declare-fun mapRes!6489 () Bool)

(declare-fun tp!14735 () Bool)

(assert (=> mapNonEmpty!6489 (= mapRes!6489 (and tp!14735 e!110542))))

(declare-fun mapValue!6489 () ValueCell!1580)

(declare-fun mapRest!6489 () (Array (_ BitVec 32) ValueCell!1580))

(declare-fun mapKey!6489 () (_ BitVec 32))

(assert (=> mapNonEmpty!6489 (= (arr!3232 (_values!3459 thiss!1248)) (store mapRest!6489 mapKey!6489 mapValue!6489))))

(declare-fun b!168194 () Bool)

(declare-fun e!110540 () Bool)

(assert (=> b!168194 (= e!110540 tp_is_empty!3847)))

(declare-fun b!168195 () Bool)

(declare-fun e!110549 () Bool)

(assert (=> b!168195 (= e!110549 (not e!110547))))

(declare-fun res!80045 () Bool)

(assert (=> b!168195 (=> res!80045 e!110547)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168195 (= res!80045 (not (validMask!0 (mask!8237 thiss!1248))))))

(declare-datatypes ((tuple2!3160 0))(
  ( (tuple2!3161 (_1!1591 (_ BitVec 64)) (_2!1591 V!4777)) )
))
(declare-datatypes ((List!2151 0))(
  ( (Nil!2148) (Cons!2147 (h!2764 tuple2!3160) (t!6953 List!2151)) )
))
(declare-datatypes ((ListLongMap!2115 0))(
  ( (ListLongMap!2116 (toList!1073 List!2151)) )
))
(declare-fun lt!84092 () ListLongMap!2115)

(declare-fun v!309 () V!4777)

(declare-fun +!225 (ListLongMap!2115 tuple2!3160) ListLongMap!2115)

(declare-fun getCurrentListMap!731 (array!6791 array!6793 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 32) Int) ListLongMap!2115)

(assert (=> b!168195 (= (+!225 lt!84092 (tuple2!3161 key!828 v!309)) (getCurrentListMap!731 (_keys!5301 thiss!1248) (array!6794 (store (arr!3232 (_values!3459 thiss!1248)) (index!4145 lt!84091) (ValueCellFull!1580 v!309)) (size!3520 (_values!3459 thiss!1248))) (mask!8237 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3476 thiss!1248)))))

(declare-fun lt!84094 () Unit!5166)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!80 (array!6791 array!6793 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 32) (_ BitVec 64) V!4777 Int) Unit!5166)

(assert (=> b!168195 (= lt!84094 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!80 (_keys!5301 thiss!1248) (_values!3459 thiss!1248) (mask!8237 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) (index!4145 lt!84091) key!828 v!309 (defaultEntry!3476 thiss!1248)))))

(declare-fun lt!84093 () Unit!5166)

(assert (=> b!168195 (= lt!84093 e!110544)))

(declare-fun c!30349 () Bool)

(declare-fun contains!1115 (ListLongMap!2115 (_ BitVec 64)) Bool)

(assert (=> b!168195 (= c!30349 (contains!1115 lt!84092 key!828))))

(assert (=> b!168195 (= lt!84092 (getCurrentListMap!731 (_keys!5301 thiss!1248) (_values!3459 thiss!1248) (mask!8237 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3476 thiss!1248)))))

(declare-fun b!168196 () Bool)

(declare-fun Unit!5168 () Unit!5166)

(assert (=> b!168196 (= e!110544 Unit!5168)))

(declare-fun lt!84096 () Unit!5166)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!119 (array!6791 array!6793 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 64) Int) Unit!5166)

(assert (=> b!168196 (= lt!84096 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!119 (_keys!5301 thiss!1248) (_values!3459 thiss!1248) (mask!8237 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) key!828 (defaultEntry!3476 thiss!1248)))))

(assert (=> b!168196 false))

(declare-fun b!168197 () Bool)

(declare-fun res!80043 () Bool)

(declare-fun e!110543 () Bool)

(assert (=> b!168197 (=> (not res!80043) (not e!110543))))

(assert (=> b!168197 (= res!80043 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6489 () Bool)

(assert (=> mapIsEmpty!6489 mapRes!6489))

(declare-fun b!168198 () Bool)

(assert (=> b!168198 (= e!110543 e!110549)))

(declare-fun res!80047 () Bool)

(assert (=> b!168198 (=> (not res!80047) (not e!110549))))

(assert (=> b!168198 (= res!80047 (and (not (is-Undefined!494 lt!84091)) (not (is-MissingVacant!494 lt!84091)) (not (is-MissingZero!494 lt!84091)) (is-Found!494 lt!84091)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6791 (_ BitVec 32)) SeekEntryResult!494)

(assert (=> b!168198 (= lt!84091 (seekEntryOrOpen!0 key!828 (_keys!5301 thiss!1248) (mask!8237 thiss!1248)))))

(declare-fun res!80049 () Bool)

(assert (=> start!16740 (=> (not res!80049) (not e!110543))))

(declare-fun valid!896 (LongMapFixedSize!2068) Bool)

(assert (=> start!16740 (= res!80049 (valid!896 thiss!1248))))

(assert (=> start!16740 e!110543))

(assert (=> start!16740 e!110548))

(assert (=> start!16740 true))

(assert (=> start!16740 tp_is_empty!3847))

(declare-fun b!168199 () Bool)

(assert (=> b!168199 (= e!110546 (and e!110540 mapRes!6489))))

(declare-fun condMapEmpty!6489 () Bool)

(declare-fun mapDefault!6489 () ValueCell!1580)

