; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16400 () Bool)

(assert start!16400)

(declare-fun b!163364 () Bool)

(declare-fun b_free!3793 () Bool)

(declare-fun b_next!3793 () Bool)

(assert (=> b!163364 (= b_free!3793 (not b_next!3793))))

(declare-fun tp!13962 () Bool)

(declare-fun b_and!10207 () Bool)

(assert (=> b!163364 (= tp!13962 b_and!10207)))

(declare-fun b!163359 () Bool)

(declare-fun e!107180 () Bool)

(declare-fun e!107177 () Bool)

(assert (=> b!163359 (= e!107180 e!107177)))

(declare-fun res!77320 () Bool)

(assert (=> b!163359 (=> (not res!77320) (not e!107177))))

(declare-datatypes ((SeekEntryResult!399 0))(
  ( (MissingZero!399 (index!3764 (_ BitVec 32))) (Found!399 (index!3765 (_ BitVec 32))) (Intermediate!399 (undefined!1211 Bool) (index!3766 (_ BitVec 32)) (x!18105 (_ BitVec 32))) (Undefined!399) (MissingVacant!399 (index!3767 (_ BitVec 32))) )
))
(declare-fun lt!82669 () SeekEntryResult!399)

(assert (=> b!163359 (= res!77320 (and (not (is-Undefined!399 lt!82669)) (not (is-MissingVacant!399 lt!82669)) (not (is-MissingZero!399 lt!82669)) (is-Found!399 lt!82669)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4441 0))(
  ( (V!4442 (val!1842 Int)) )
))
(declare-datatypes ((ValueCell!1454 0))(
  ( (ValueCellFull!1454 (v!3707 V!4441)) (EmptyCell!1454) )
))
(declare-datatypes ((array!6277 0))(
  ( (array!6278 (arr!2979 (Array (_ BitVec 32) (_ BitVec 64))) (size!3265 (_ BitVec 32))) )
))
(declare-datatypes ((array!6279 0))(
  ( (array!6280 (arr!2980 (Array (_ BitVec 32) ValueCell!1454)) (size!3266 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1816 0))(
  ( (LongMapFixedSize!1817 (defaultEntry!3350 Int) (mask!8006 (_ BitVec 32)) (extraKeys!3091 (_ BitVec 32)) (zeroValue!3193 V!4441) (minValue!3193 V!4441) (_size!957 (_ BitVec 32)) (_keys!5161 array!6277) (_values!3333 array!6279) (_vacant!957 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1816)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6277 (_ BitVec 32)) SeekEntryResult!399)

(assert (=> b!163359 (= lt!82669 (seekEntryOrOpen!0 key!828 (_keys!5161 thiss!1248) (mask!8006 thiss!1248)))))

(declare-fun mapIsEmpty!6094 () Bool)

(declare-fun mapRes!6094 () Bool)

(assert (=> mapIsEmpty!6094 mapRes!6094))

(declare-fun mapNonEmpty!6094 () Bool)

(declare-fun tp!13963 () Bool)

(declare-fun e!107176 () Bool)

(assert (=> mapNonEmpty!6094 (= mapRes!6094 (and tp!13963 e!107176))))

(declare-fun mapRest!6094 () (Array (_ BitVec 32) ValueCell!1454))

(declare-fun mapValue!6094 () ValueCell!1454)

(declare-fun mapKey!6094 () (_ BitVec 32))

(assert (=> mapNonEmpty!6094 (= (arr!2980 (_values!3333 thiss!1248)) (store mapRest!6094 mapKey!6094 mapValue!6094))))

(declare-fun b!163360 () Bool)

(declare-fun res!77317 () Bool)

(assert (=> b!163360 (=> (not res!77317) (not e!107177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163360 (= res!77317 (validMask!0 (mask!8006 thiss!1248)))))

(declare-fun b!163362 () Bool)

(assert (=> b!163362 (= e!107177 (and (= (size!3266 (_values!3333 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8006 thiss!1248))) (= (size!3265 (_keys!5161 thiss!1248)) (size!3266 (_values!3333 thiss!1248))) (bvsge (mask!8006 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3091 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!163363 () Bool)

(declare-fun tp_is_empty!3595 () Bool)

(assert (=> b!163363 (= e!107176 tp_is_empty!3595)))

(declare-fun e!107182 () Bool)

(declare-fun e!107179 () Bool)

(declare-fun array_inv!1907 (array!6277) Bool)

(declare-fun array_inv!1908 (array!6279) Bool)

(assert (=> b!163364 (= e!107182 (and tp!13962 tp_is_empty!3595 (array_inv!1907 (_keys!5161 thiss!1248)) (array_inv!1908 (_values!3333 thiss!1248)) e!107179))))

(declare-fun b!163365 () Bool)

(declare-fun res!77319 () Bool)

(assert (=> b!163365 (=> (not res!77319) (not e!107180))))

(assert (=> b!163365 (= res!77319 (not (= key!828 (bvneg key!828))))))

(declare-fun b!163366 () Bool)

(declare-fun e!107178 () Bool)

(assert (=> b!163366 (= e!107178 tp_is_empty!3595)))

(declare-fun b!163361 () Bool)

(assert (=> b!163361 (= e!107179 (and e!107178 mapRes!6094))))

(declare-fun condMapEmpty!6094 () Bool)

(declare-fun mapDefault!6094 () ValueCell!1454)

