; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16744 () Bool)

(assert start!16744)

(declare-fun b!168269 () Bool)

(declare-fun b_free!4049 () Bool)

(declare-fun b_next!4049 () Bool)

(assert (=> b!168269 (= b_free!4049 (not b_next!4049))))

(declare-fun tp!14748 () Bool)

(declare-fun b_and!10463 () Bool)

(assert (=> b!168269 (= tp!14748 b_and!10463)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun b!168267 () Bool)

(declare-datatypes ((V!4781 0))(
  ( (V!4782 (val!1970 Int)) )
))
(declare-datatypes ((ValueCell!1582 0))(
  ( (ValueCellFull!1582 (v!3835 V!4781)) (EmptyCell!1582) )
))
(declare-datatypes ((array!6799 0))(
  ( (array!6800 (arr!3235 (Array (_ BitVec 32) (_ BitVec 64))) (size!3523 (_ BitVec 32))) )
))
(declare-datatypes ((array!6801 0))(
  ( (array!6802 (arr!3236 (Array (_ BitVec 32) ValueCell!1582)) (size!3524 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2072 0))(
  ( (LongMapFixedSize!2073 (defaultEntry!3478 Int) (mask!8239 (_ BitVec 32)) (extraKeys!3219 (_ BitVec 32)) (zeroValue!3321 V!4781) (minValue!3321 V!4781) (_size!1085 (_ BitVec 32)) (_keys!5303 array!6799) (_values!3461 array!6801) (_vacant!1085 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2072)

(declare-datatypes ((SeekEntryResult!496 0))(
  ( (MissingZero!496 (index!4152 (_ BitVec 32))) (Found!496 (index!4153 (_ BitVec 32))) (Intermediate!496 (undefined!1308 Bool) (index!4154 (_ BitVec 32)) (x!18596 (_ BitVec 32))) (Undefined!496) (MissingVacant!496 (index!4155 (_ BitVec 32))) )
))
(declare-fun lt!84133 () SeekEntryResult!496)

(declare-fun e!110607 () Bool)

(assert (=> b!168267 (= e!110607 (= (select (arr!3235 (_keys!5303 thiss!1248)) (index!4153 lt!84133)) key!828))))

(declare-fun b!168268 () Bool)

(declare-fun res!80089 () Bool)

(declare-fun e!110605 () Bool)

(assert (=> b!168268 (=> res!80089 e!110605)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6799 (_ BitVec 32)) Bool)

(assert (=> b!168268 (= res!80089 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5303 thiss!1248) (mask!8239 thiss!1248))))))

(declare-fun tp_is_empty!3851 () Bool)

(declare-fun e!110601 () Bool)

(declare-fun e!110604 () Bool)

(declare-fun array_inv!2079 (array!6799) Bool)

(declare-fun array_inv!2080 (array!6801) Bool)

(assert (=> b!168269 (= e!110601 (and tp!14748 tp_is_empty!3851 (array_inv!2079 (_keys!5303 thiss!1248)) (array_inv!2080 (_values!3461 thiss!1248)) e!110604))))

(declare-fun b!168270 () Bool)

(declare-fun res!80086 () Bool)

(declare-fun e!110609 () Bool)

(assert (=> b!168270 (=> (not res!80086) (not e!110609))))

(assert (=> b!168270 (= res!80086 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6495 () Bool)

(declare-fun mapRes!6495 () Bool)

(declare-fun tp!14747 () Bool)

(declare-fun e!110600 () Bool)

(assert (=> mapNonEmpty!6495 (= mapRes!6495 (and tp!14747 e!110600))))

(declare-fun mapKey!6495 () (_ BitVec 32))

(declare-fun mapRest!6495 () (Array (_ BitVec 32) ValueCell!1582))

(declare-fun mapValue!6495 () ValueCell!1582)

(assert (=> mapNonEmpty!6495 (= (arr!3236 (_values!3461 thiss!1248)) (store mapRest!6495 mapKey!6495 mapValue!6495))))

(declare-fun b!168272 () Bool)

(declare-datatypes ((Unit!5172 0))(
  ( (Unit!5173) )
))
(declare-fun e!110606 () Unit!5172)

(declare-fun Unit!5174 () Unit!5172)

(assert (=> b!168272 (= e!110606 Unit!5174)))

(declare-fun lt!84139 () Unit!5172)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!121 (array!6799 array!6801 (_ BitVec 32) (_ BitVec 32) V!4781 V!4781 (_ BitVec 64) Int) Unit!5172)

(assert (=> b!168272 (= lt!84139 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!121 (_keys!5303 thiss!1248) (_values!3461 thiss!1248) (mask!8239 thiss!1248) (extraKeys!3219 thiss!1248) (zeroValue!3321 thiss!1248) (minValue!3321 thiss!1248) key!828 (defaultEntry!3478 thiss!1248)))))

(assert (=> b!168272 false))

(declare-fun b!168273 () Bool)

(declare-fun lt!84134 () Unit!5172)

(assert (=> b!168273 (= e!110606 lt!84134)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!119 (array!6799 array!6801 (_ BitVec 32) (_ BitVec 32) V!4781 V!4781 (_ BitVec 64) Int) Unit!5172)

(assert (=> b!168273 (= lt!84134 (lemmaInListMapThenSeekEntryOrOpenFindsIt!119 (_keys!5303 thiss!1248) (_values!3461 thiss!1248) (mask!8239 thiss!1248) (extraKeys!3219 thiss!1248) (zeroValue!3321 thiss!1248) (minValue!3321 thiss!1248) key!828 (defaultEntry!3478 thiss!1248)))))

(declare-fun res!80091 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168273 (= res!80091 (inRange!0 (index!4153 lt!84133) (mask!8239 thiss!1248)))))

(assert (=> b!168273 (=> (not res!80091) (not e!110607))))

(assert (=> b!168273 e!110607))

(declare-fun b!168274 () Bool)

(assert (=> b!168274 (= e!110605 true)))

(declare-fun lt!84137 () Bool)

(declare-datatypes ((List!2154 0))(
  ( (Nil!2151) (Cons!2150 (h!2767 (_ BitVec 64)) (t!6956 List!2154)) )
))
(declare-fun arrayNoDuplicates!0 (array!6799 (_ BitVec 32) List!2154) Bool)

(assert (=> b!168274 (= lt!84137 (arrayNoDuplicates!0 (_keys!5303 thiss!1248) #b00000000000000000000000000000000 Nil!2151))))

(declare-fun b!168275 () Bool)

(declare-fun e!110608 () Bool)

(assert (=> b!168275 (= e!110608 (not e!110605))))

(declare-fun res!80085 () Bool)

(assert (=> b!168275 (=> res!80085 e!110605)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168275 (= res!80085 (not (validMask!0 (mask!8239 thiss!1248))))))

(declare-fun v!309 () V!4781)

(declare-datatypes ((tuple2!3164 0))(
  ( (tuple2!3165 (_1!1593 (_ BitVec 64)) (_2!1593 V!4781)) )
))
(declare-datatypes ((List!2155 0))(
  ( (Nil!2152) (Cons!2151 (h!2768 tuple2!3164) (t!6957 List!2155)) )
))
(declare-datatypes ((ListLongMap!2119 0))(
  ( (ListLongMap!2120 (toList!1075 List!2155)) )
))
(declare-fun lt!84136 () ListLongMap!2119)

(declare-fun +!227 (ListLongMap!2119 tuple2!3164) ListLongMap!2119)

(declare-fun getCurrentListMap!733 (array!6799 array!6801 (_ BitVec 32) (_ BitVec 32) V!4781 V!4781 (_ BitVec 32) Int) ListLongMap!2119)

(assert (=> b!168275 (= (+!227 lt!84136 (tuple2!3165 key!828 v!309)) (getCurrentListMap!733 (_keys!5303 thiss!1248) (array!6802 (store (arr!3236 (_values!3461 thiss!1248)) (index!4153 lt!84133) (ValueCellFull!1582 v!309)) (size!3524 (_values!3461 thiss!1248))) (mask!8239 thiss!1248) (extraKeys!3219 thiss!1248) (zeroValue!3321 thiss!1248) (minValue!3321 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3478 thiss!1248)))))

(declare-fun lt!84138 () Unit!5172)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!82 (array!6799 array!6801 (_ BitVec 32) (_ BitVec 32) V!4781 V!4781 (_ BitVec 32) (_ BitVec 64) V!4781 Int) Unit!5172)

(assert (=> b!168275 (= lt!84138 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!82 (_keys!5303 thiss!1248) (_values!3461 thiss!1248) (mask!8239 thiss!1248) (extraKeys!3219 thiss!1248) (zeroValue!3321 thiss!1248) (minValue!3321 thiss!1248) (index!4153 lt!84133) key!828 v!309 (defaultEntry!3478 thiss!1248)))))

(declare-fun lt!84135 () Unit!5172)

(assert (=> b!168275 (= lt!84135 e!110606)))

(declare-fun c!30355 () Bool)

(declare-fun contains!1117 (ListLongMap!2119 (_ BitVec 64)) Bool)

(assert (=> b!168275 (= c!30355 (contains!1117 lt!84136 key!828))))

(assert (=> b!168275 (= lt!84136 (getCurrentListMap!733 (_keys!5303 thiss!1248) (_values!3461 thiss!1248) (mask!8239 thiss!1248) (extraKeys!3219 thiss!1248) (zeroValue!3321 thiss!1248) (minValue!3321 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3478 thiss!1248)))))

(declare-fun b!168276 () Bool)

(assert (=> b!168276 (= e!110609 e!110608)))

(declare-fun res!80090 () Bool)

(assert (=> b!168276 (=> (not res!80090) (not e!110608))))

(assert (=> b!168276 (= res!80090 (and (not (is-Undefined!496 lt!84133)) (not (is-MissingVacant!496 lt!84133)) (not (is-MissingZero!496 lt!84133)) (is-Found!496 lt!84133)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6799 (_ BitVec 32)) SeekEntryResult!496)

(assert (=> b!168276 (= lt!84133 (seekEntryOrOpen!0 key!828 (_keys!5303 thiss!1248) (mask!8239 thiss!1248)))))

(declare-fun b!168277 () Bool)

(declare-fun e!110603 () Bool)

(assert (=> b!168277 (= e!110603 tp_is_empty!3851)))

(declare-fun b!168278 () Bool)

(assert (=> b!168278 (= e!110600 tp_is_empty!3851)))

(declare-fun res!80087 () Bool)

(assert (=> start!16744 (=> (not res!80087) (not e!110609))))

(declare-fun valid!898 (LongMapFixedSize!2072) Bool)

(assert (=> start!16744 (= res!80087 (valid!898 thiss!1248))))

(assert (=> start!16744 e!110609))

(assert (=> start!16744 e!110601))

(assert (=> start!16744 true))

(assert (=> start!16744 tp_is_empty!3851))

(declare-fun b!168271 () Bool)

(declare-fun res!80088 () Bool)

(assert (=> b!168271 (=> res!80088 e!110605)))

(assert (=> b!168271 (= res!80088 (or (not (= (size!3524 (_values!3461 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8239 thiss!1248)))) (not (= (size!3523 (_keys!5303 thiss!1248)) (size!3524 (_values!3461 thiss!1248)))) (bvslt (mask!8239 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3219 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3219 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168279 () Bool)

(assert (=> b!168279 (= e!110604 (and e!110603 mapRes!6495))))

(declare-fun condMapEmpty!6495 () Bool)

(declare-fun mapDefault!6495 () ValueCell!1582)

