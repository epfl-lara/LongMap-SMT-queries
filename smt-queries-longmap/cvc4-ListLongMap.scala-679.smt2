; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16582 () Bool)

(assert start!16582)

(declare-fun b!165282 () Bool)

(declare-fun b_free!3887 () Bool)

(declare-fun b_next!3887 () Bool)

(assert (=> b!165282 (= b_free!3887 (not b_next!3887))))

(declare-fun tp!14261 () Bool)

(declare-fun b_and!10301 () Bool)

(assert (=> b!165282 (= tp!14261 b_and!10301)))

(declare-fun b!165272 () Bool)

(declare-fun e!108417 () Bool)

(declare-fun tp_is_empty!3689 () Bool)

(assert (=> b!165272 (= e!108417 tp_is_empty!3689)))

(declare-fun b!165273 () Bool)

(declare-fun res!78389 () Bool)

(declare-fun e!108421 () Bool)

(assert (=> b!165273 (=> (not res!78389) (not e!108421))))

(declare-datatypes ((V!4565 0))(
  ( (V!4566 (val!1889 Int)) )
))
(declare-datatypes ((ValueCell!1501 0))(
  ( (ValueCellFull!1501 (v!3754 V!4565)) (EmptyCell!1501) )
))
(declare-datatypes ((array!6475 0))(
  ( (array!6476 (arr!3073 (Array (_ BitVec 32) (_ BitVec 64))) (size!3361 (_ BitVec 32))) )
))
(declare-datatypes ((array!6477 0))(
  ( (array!6478 (arr!3074 (Array (_ BitVec 32) ValueCell!1501)) (size!3362 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1910 0))(
  ( (LongMapFixedSize!1911 (defaultEntry!3397 Int) (mask!8104 (_ BitVec 32)) (extraKeys!3138 (_ BitVec 32)) (zeroValue!3240 V!4565) (minValue!3240 V!4565) (_size!1004 (_ BitVec 32)) (_keys!5222 array!6475) (_values!3380 array!6477) (_vacant!1004 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1910)

(assert (=> b!165273 (= res!78389 (and (= (size!3362 (_values!3380 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8104 thiss!1248))) (= (size!3361 (_keys!5222 thiss!1248)) (size!3362 (_values!3380 thiss!1248))) (bvsge (mask!8104 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3138 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3138 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165274 () Bool)

(declare-fun res!78388 () Bool)

(assert (=> b!165274 (=> (not res!78388) (not e!108421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6475 (_ BitVec 32)) Bool)

(assert (=> b!165274 (= res!78388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5222 thiss!1248) (mask!8104 thiss!1248)))))

(declare-fun b!165275 () Bool)

(declare-fun res!78386 () Bool)

(assert (=> b!165275 (=> (not res!78386) (not e!108421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165275 (= res!78386 (validMask!0 (mask!8104 thiss!1248)))))

(declare-fun b!165276 () Bool)

(declare-fun res!78387 () Bool)

(assert (=> b!165276 (=> (not res!78387) (not e!108421))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3060 0))(
  ( (tuple2!3061 (_1!1541 (_ BitVec 64)) (_2!1541 V!4565)) )
))
(declare-datatypes ((List!2043 0))(
  ( (Nil!2040) (Cons!2039 (h!2656 tuple2!3060) (t!6845 List!2043)) )
))
(declare-datatypes ((ListLongMap!2015 0))(
  ( (ListLongMap!2016 (toList!1023 List!2043)) )
))
(declare-fun contains!1065 (ListLongMap!2015 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!681 (array!6475 array!6477 (_ BitVec 32) (_ BitVec 32) V!4565 V!4565 (_ BitVec 32) Int) ListLongMap!2015)

(assert (=> b!165276 (= res!78387 (not (contains!1065 (getCurrentListMap!681 (_keys!5222 thiss!1248) (_values!3380 thiss!1248) (mask!8104 thiss!1248) (extraKeys!3138 thiss!1248) (zeroValue!3240 thiss!1248) (minValue!3240 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3397 thiss!1248)) key!828)))))

(declare-fun b!165277 () Bool)

(declare-fun res!78384 () Bool)

(declare-fun e!108419 () Bool)

(assert (=> b!165277 (=> (not res!78384) (not e!108419))))

(assert (=> b!165277 (= res!78384 (not (= key!828 (bvneg key!828))))))

(declare-fun res!78385 () Bool)

(assert (=> start!16582 (=> (not res!78385) (not e!108419))))

(declare-fun valid!845 (LongMapFixedSize!1910) Bool)

(assert (=> start!16582 (= res!78385 (valid!845 thiss!1248))))

(assert (=> start!16582 e!108419))

(declare-fun e!108416 () Bool)

(assert (=> start!16582 e!108416))

(assert (=> start!16582 true))

(declare-fun mapNonEmpty!6252 () Bool)

(declare-fun mapRes!6252 () Bool)

(declare-fun tp!14262 () Bool)

(declare-fun e!108418 () Bool)

(assert (=> mapNonEmpty!6252 (= mapRes!6252 (and tp!14262 e!108418))))

(declare-fun mapRest!6252 () (Array (_ BitVec 32) ValueCell!1501))

(declare-fun mapValue!6252 () ValueCell!1501)

(declare-fun mapKey!6252 () (_ BitVec 32))

(assert (=> mapNonEmpty!6252 (= (arr!3074 (_values!3380 thiss!1248)) (store mapRest!6252 mapKey!6252 mapValue!6252))))

(declare-fun b!165278 () Bool)

(assert (=> b!165278 (= e!108419 e!108421)))

(declare-fun res!78390 () Bool)

(assert (=> b!165278 (=> (not res!78390) (not e!108421))))

(declare-datatypes ((SeekEntryResult!432 0))(
  ( (MissingZero!432 (index!3896 (_ BitVec 32))) (Found!432 (index!3897 (_ BitVec 32))) (Intermediate!432 (undefined!1244 Bool) (index!3898 (_ BitVec 32)) (x!18316 (_ BitVec 32))) (Undefined!432) (MissingVacant!432 (index!3899 (_ BitVec 32))) )
))
(declare-fun lt!83040 () SeekEntryResult!432)

(assert (=> b!165278 (= res!78390 (and (not (is-Undefined!432 lt!83040)) (not (is-MissingVacant!432 lt!83040)) (not (is-MissingZero!432 lt!83040)) (is-Found!432 lt!83040)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6475 (_ BitVec 32)) SeekEntryResult!432)

(assert (=> b!165278 (= lt!83040 (seekEntryOrOpen!0 key!828 (_keys!5222 thiss!1248) (mask!8104 thiss!1248)))))

(declare-fun b!165279 () Bool)

(assert (=> b!165279 (= e!108421 false)))

(declare-fun lt!83041 () Bool)

(declare-datatypes ((List!2044 0))(
  ( (Nil!2041) (Cons!2040 (h!2657 (_ BitVec 64)) (t!6846 List!2044)) )
))
(declare-fun arrayNoDuplicates!0 (array!6475 (_ BitVec 32) List!2044) Bool)

(assert (=> b!165279 (= lt!83041 (arrayNoDuplicates!0 (_keys!5222 thiss!1248) #b00000000000000000000000000000000 Nil!2041))))

(declare-fun b!165280 () Bool)

(assert (=> b!165280 (= e!108418 tp_is_empty!3689)))

(declare-fun mapIsEmpty!6252 () Bool)

(assert (=> mapIsEmpty!6252 mapRes!6252))

(declare-fun b!165281 () Bool)

(declare-fun e!108422 () Bool)

(assert (=> b!165281 (= e!108422 (and e!108417 mapRes!6252))))

(declare-fun condMapEmpty!6252 () Bool)

(declare-fun mapDefault!6252 () ValueCell!1501)

