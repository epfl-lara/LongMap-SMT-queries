; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16564 () Bool)

(assert start!16564)

(declare-fun b!164979 () Bool)

(declare-fun b_free!3869 () Bool)

(declare-fun b_next!3869 () Bool)

(assert (=> b!164979 (= b_free!3869 (not b_next!3869))))

(declare-fun tp!14207 () Bool)

(declare-fun b_and!10283 () Bool)

(assert (=> b!164979 (= tp!14207 b_and!10283)))

(declare-fun b!164975 () Bool)

(declare-fun res!78198 () Bool)

(declare-fun e!108229 () Bool)

(assert (=> b!164975 (=> (not res!78198) (not e!108229))))

(declare-datatypes ((V!4541 0))(
  ( (V!4542 (val!1880 Int)) )
))
(declare-datatypes ((ValueCell!1492 0))(
  ( (ValueCellFull!1492 (v!3745 V!4541)) (EmptyCell!1492) )
))
(declare-datatypes ((array!6439 0))(
  ( (array!6440 (arr!3055 (Array (_ BitVec 32) (_ BitVec 64))) (size!3343 (_ BitVec 32))) )
))
(declare-datatypes ((array!6441 0))(
  ( (array!6442 (arr!3056 (Array (_ BitVec 32) ValueCell!1492)) (size!3344 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1892 0))(
  ( (LongMapFixedSize!1893 (defaultEntry!3388 Int) (mask!8089 (_ BitVec 32)) (extraKeys!3129 (_ BitVec 32)) (zeroValue!3231 V!4541) (minValue!3231 V!4541) (_size!995 (_ BitVec 32)) (_keys!5213 array!6439) (_values!3371 array!6441) (_vacant!995 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1892)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164975 (= res!78198 (validMask!0 (mask!8089 thiss!1248)))))

(declare-fun b!164976 () Bool)

(declare-fun e!108232 () Bool)

(assert (=> b!164976 (= e!108232 e!108229)))

(declare-fun res!78197 () Bool)

(assert (=> b!164976 (=> (not res!78197) (not e!108229))))

(declare-datatypes ((SeekEntryResult!426 0))(
  ( (MissingZero!426 (index!3872 (_ BitVec 32))) (Found!426 (index!3873 (_ BitVec 32))) (Intermediate!426 (undefined!1238 Bool) (index!3874 (_ BitVec 32)) (x!18286 (_ BitVec 32))) (Undefined!426) (MissingVacant!426 (index!3875 (_ BitVec 32))) )
))
(declare-fun lt!82987 () SeekEntryResult!426)

(assert (=> b!164976 (= res!78197 (and (not (is-Undefined!426 lt!82987)) (not (is-MissingVacant!426 lt!82987)) (not (is-MissingZero!426 lt!82987)) (is-Found!426 lt!82987)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6439 (_ BitVec 32)) SeekEntryResult!426)

(assert (=> b!164976 (= lt!82987 (seekEntryOrOpen!0 key!828 (_keys!5213 thiss!1248) (mask!8089 thiss!1248)))))

(declare-fun b!164977 () Bool)

(declare-fun res!78199 () Bool)

(assert (=> b!164977 (=> (not res!78199) (not e!108229))))

(declare-datatypes ((tuple2!3050 0))(
  ( (tuple2!3051 (_1!1536 (_ BitVec 64)) (_2!1536 V!4541)) )
))
(declare-datatypes ((List!2032 0))(
  ( (Nil!2029) (Cons!2028 (h!2645 tuple2!3050) (t!6834 List!2032)) )
))
(declare-datatypes ((ListLongMap!2005 0))(
  ( (ListLongMap!2006 (toList!1018 List!2032)) )
))
(declare-fun contains!1060 (ListLongMap!2005 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!676 (array!6439 array!6441 (_ BitVec 32) (_ BitVec 32) V!4541 V!4541 (_ BitVec 32) Int) ListLongMap!2005)

(assert (=> b!164977 (= res!78199 (contains!1060 (getCurrentListMap!676 (_keys!5213 thiss!1248) (_values!3371 thiss!1248) (mask!8089 thiss!1248) (extraKeys!3129 thiss!1248) (zeroValue!3231 thiss!1248) (minValue!3231 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3388 thiss!1248)) key!828))))

(declare-fun b!164978 () Bool)

(declare-fun e!108228 () Bool)

(declare-fun tp_is_empty!3671 () Bool)

(assert (=> b!164978 (= e!108228 tp_is_empty!3671)))

(declare-fun e!108227 () Bool)

(declare-fun e!108231 () Bool)

(declare-fun array_inv!1961 (array!6439) Bool)

(declare-fun array_inv!1962 (array!6441) Bool)

(assert (=> b!164979 (= e!108231 (and tp!14207 tp_is_empty!3671 (array_inv!1961 (_keys!5213 thiss!1248)) (array_inv!1962 (_values!3371 thiss!1248)) e!108227))))

(declare-fun b!164980 () Bool)

(declare-fun res!78200 () Bool)

(assert (=> b!164980 (=> (not res!78200) (not e!108232))))

(assert (=> b!164980 (= res!78200 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6225 () Bool)

(declare-fun mapRes!6225 () Bool)

(assert (=> mapIsEmpty!6225 mapRes!6225))

(declare-fun b!164981 () Bool)

(declare-fun e!108233 () Bool)

(assert (=> b!164981 (= e!108227 (and e!108233 mapRes!6225))))

(declare-fun condMapEmpty!6225 () Bool)

(declare-fun mapDefault!6225 () ValueCell!1492)

