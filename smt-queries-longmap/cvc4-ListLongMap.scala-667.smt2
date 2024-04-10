; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16482 () Bool)

(assert start!16482)

(declare-fun b!163965 () Bool)

(declare-fun b_free!3815 () Bool)

(declare-fun b_next!3815 () Bool)

(assert (=> b!163965 (= b_free!3815 (not b_next!3815))))

(declare-fun tp!14039 () Bool)

(declare-fun b_and!10229 () Bool)

(assert (=> b!163965 (= tp!14039 b_and!10229)))

(declare-fun res!77584 () Bool)

(declare-fun e!107586 () Bool)

(assert (=> start!16482 (=> (not res!77584) (not e!107586))))

(declare-datatypes ((V!4469 0))(
  ( (V!4470 (val!1853 Int)) )
))
(declare-datatypes ((ValueCell!1465 0))(
  ( (ValueCellFull!1465 (v!3718 V!4469)) (EmptyCell!1465) )
))
(declare-datatypes ((array!6327 0))(
  ( (array!6328 (arr!3001 (Array (_ BitVec 32) (_ BitVec 64))) (size!3289 (_ BitVec 32))) )
))
(declare-datatypes ((array!6329 0))(
  ( (array!6330 (arr!3002 (Array (_ BitVec 32) ValueCell!1465)) (size!3290 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1838 0))(
  ( (LongMapFixedSize!1839 (defaultEntry!3361 Int) (mask!8038 (_ BitVec 32)) (extraKeys!3102 (_ BitVec 32)) (zeroValue!3204 V!4469) (minValue!3204 V!4469) (_size!968 (_ BitVec 32)) (_keys!5182 array!6327) (_values!3344 array!6329) (_vacant!968 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1838)

(declare-fun valid!820 (LongMapFixedSize!1838) Bool)

(assert (=> start!16482 (= res!77584 (valid!820 thiss!1248))))

(assert (=> start!16482 e!107586))

(declare-fun e!107583 () Bool)

(assert (=> start!16482 e!107583))

(assert (=> start!16482 true))

(declare-fun b!163961 () Bool)

(declare-fun res!77585 () Bool)

(declare-fun e!107588 () Bool)

(assert (=> b!163961 (=> (not res!77585) (not e!107588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163961 (= res!77585 (validMask!0 (mask!8038 thiss!1248)))))

(declare-fun b!163962 () Bool)

(declare-fun e!107587 () Bool)

(declare-fun tp_is_empty!3617 () Bool)

(assert (=> b!163962 (= e!107587 tp_is_empty!3617)))

(declare-fun b!163963 () Bool)

(declare-fun res!77586 () Bool)

(assert (=> b!163963 (=> (not res!77586) (not e!107588))))

(assert (=> b!163963 (= res!77586 (and (= (size!3290 (_values!3344 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8038 thiss!1248))) (= (size!3289 (_keys!5182 thiss!1248)) (size!3290 (_values!3344 thiss!1248))) (bvsge (mask!8038 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3102 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3102 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!163964 () Bool)

(assert (=> b!163964 (= e!107586 e!107588)))

(declare-fun res!77582 () Bool)

(assert (=> b!163964 (=> (not res!77582) (not e!107588))))

(declare-datatypes ((SeekEntryResult!408 0))(
  ( (MissingZero!408 (index!3800 (_ BitVec 32))) (Found!408 (index!3801 (_ BitVec 32))) (Intermediate!408 (undefined!1220 Bool) (index!3802 (_ BitVec 32)) (x!18180 (_ BitVec 32))) (Undefined!408) (MissingVacant!408 (index!3803 (_ BitVec 32))) )
))
(declare-fun lt!82798 () SeekEntryResult!408)

(assert (=> b!163964 (= res!77582 (and (not (is-Undefined!408 lt!82798)) (not (is-MissingVacant!408 lt!82798)) (not (is-MissingZero!408 lt!82798)) (is-Found!408 lt!82798)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6327 (_ BitVec 32)) SeekEntryResult!408)

(assert (=> b!163964 (= lt!82798 (seekEntryOrOpen!0 key!828 (_keys!5182 thiss!1248) (mask!8038 thiss!1248)))))

(declare-fun mapIsEmpty!6138 () Bool)

(declare-fun mapRes!6138 () Bool)

(assert (=> mapIsEmpty!6138 mapRes!6138))

(declare-fun e!107585 () Bool)

(declare-fun array_inv!1919 (array!6327) Bool)

(declare-fun array_inv!1920 (array!6329) Bool)

(assert (=> b!163965 (= e!107583 (and tp!14039 tp_is_empty!3617 (array_inv!1919 (_keys!5182 thiss!1248)) (array_inv!1920 (_values!3344 thiss!1248)) e!107585))))

(declare-fun b!163966 () Bool)

(declare-fun e!107582 () Bool)

(assert (=> b!163966 (= e!107582 tp_is_empty!3617)))

(declare-fun mapNonEmpty!6138 () Bool)

(declare-fun tp!14040 () Bool)

(assert (=> mapNonEmpty!6138 (= mapRes!6138 (and tp!14040 e!107587))))

(declare-fun mapKey!6138 () (_ BitVec 32))

(declare-fun mapValue!6138 () ValueCell!1465)

(declare-fun mapRest!6138 () (Array (_ BitVec 32) ValueCell!1465))

(assert (=> mapNonEmpty!6138 (= (arr!3002 (_values!3344 thiss!1248)) (store mapRest!6138 mapKey!6138 mapValue!6138))))

(declare-fun b!163967 () Bool)

(assert (=> b!163967 (= e!107585 (and e!107582 mapRes!6138))))

(declare-fun condMapEmpty!6138 () Bool)

(declare-fun mapDefault!6138 () ValueCell!1465)

