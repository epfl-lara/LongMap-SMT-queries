; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16576 () Bool)

(assert start!16576)

(declare-fun b!165176 () Bool)

(declare-fun b_free!3881 () Bool)

(declare-fun b_next!3881 () Bool)

(assert (=> b!165176 (= b_free!3881 (not b_next!3881))))

(declare-fun tp!14243 () Bool)

(declare-fun b_and!10295 () Bool)

(assert (=> b!165176 (= tp!14243 b_and!10295)))

(declare-fun b!165173 () Bool)

(declare-fun res!78324 () Bool)

(declare-fun e!108358 () Bool)

(assert (=> b!165173 (=> (not res!78324) (not e!108358))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165173 (= res!78324 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165174 () Bool)

(declare-fun res!78323 () Bool)

(declare-fun e!108356 () Bool)

(assert (=> b!165174 (=> (not res!78323) (not e!108356))))

(declare-datatypes ((V!4557 0))(
  ( (V!4558 (val!1886 Int)) )
))
(declare-datatypes ((ValueCell!1498 0))(
  ( (ValueCellFull!1498 (v!3751 V!4557)) (EmptyCell!1498) )
))
(declare-datatypes ((array!6463 0))(
  ( (array!6464 (arr!3067 (Array (_ BitVec 32) (_ BitVec 64))) (size!3355 (_ BitVec 32))) )
))
(declare-datatypes ((array!6465 0))(
  ( (array!6466 (arr!3068 (Array (_ BitVec 32) ValueCell!1498)) (size!3356 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1904 0))(
  ( (LongMapFixedSize!1905 (defaultEntry!3394 Int) (mask!8099 (_ BitVec 32)) (extraKeys!3135 (_ BitVec 32)) (zeroValue!3237 V!4557) (minValue!3237 V!4557) (_size!1001 (_ BitVec 32)) (_keys!5219 array!6463) (_values!3377 array!6465) (_vacant!1001 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1904)

(assert (=> b!165174 (= res!78323 (and (= (size!3356 (_values!3377 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8099 thiss!1248))) (= (size!3355 (_keys!5219 thiss!1248)) (size!3356 (_values!3377 thiss!1248))) (bvsge (mask!8099 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3135 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3135 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!78322 () Bool)

(assert (=> start!16576 (=> (not res!78322) (not e!108358))))

(declare-fun valid!843 (LongMapFixedSize!1904) Bool)

(assert (=> start!16576 (= res!78322 (valid!843 thiss!1248))))

(assert (=> start!16576 e!108358))

(declare-fun e!108353 () Bool)

(assert (=> start!16576 e!108353))

(assert (=> start!16576 true))

(declare-fun b!165175 () Bool)

(declare-fun e!108357 () Bool)

(declare-fun tp_is_empty!3683 () Bool)

(assert (=> b!165175 (= e!108357 tp_is_empty!3683)))

(declare-fun e!108355 () Bool)

(declare-fun array_inv!1969 (array!6463) Bool)

(declare-fun array_inv!1970 (array!6465) Bool)

(assert (=> b!165176 (= e!108353 (and tp!14243 tp_is_empty!3683 (array_inv!1969 (_keys!5219 thiss!1248)) (array_inv!1970 (_values!3377 thiss!1248)) e!108355))))

(declare-fun b!165177 () Bool)

(declare-fun res!78321 () Bool)

(assert (=> b!165177 (=> (not res!78321) (not e!108356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6463 (_ BitVec 32)) Bool)

(assert (=> b!165177 (= res!78321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5219 thiss!1248) (mask!8099 thiss!1248)))))

(declare-fun b!165178 () Bool)

(assert (=> b!165178 (= e!108356 false)))

(declare-fun lt!83023 () Bool)

(declare-datatypes ((List!2038 0))(
  ( (Nil!2035) (Cons!2034 (h!2651 (_ BitVec 64)) (t!6840 List!2038)) )
))
(declare-fun arrayNoDuplicates!0 (array!6463 (_ BitVec 32) List!2038) Bool)

(assert (=> b!165178 (= lt!83023 (arrayNoDuplicates!0 (_keys!5219 thiss!1248) #b00000000000000000000000000000000 Nil!2035))))

(declare-fun b!165179 () Bool)

(declare-fun res!78325 () Bool)

(assert (=> b!165179 (=> (not res!78325) (not e!108356))))

(declare-datatypes ((tuple2!3056 0))(
  ( (tuple2!3057 (_1!1539 (_ BitVec 64)) (_2!1539 V!4557)) )
))
(declare-datatypes ((List!2039 0))(
  ( (Nil!2036) (Cons!2035 (h!2652 tuple2!3056) (t!6841 List!2039)) )
))
(declare-datatypes ((ListLongMap!2011 0))(
  ( (ListLongMap!2012 (toList!1021 List!2039)) )
))
(declare-fun contains!1063 (ListLongMap!2011 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!679 (array!6463 array!6465 (_ BitVec 32) (_ BitVec 32) V!4557 V!4557 (_ BitVec 32) Int) ListLongMap!2011)

(assert (=> b!165179 (= res!78325 (contains!1063 (getCurrentListMap!679 (_keys!5219 thiss!1248) (_values!3377 thiss!1248) (mask!8099 thiss!1248) (extraKeys!3135 thiss!1248) (zeroValue!3237 thiss!1248) (minValue!3237 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3394 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!6243 () Bool)

(declare-fun mapRes!6243 () Bool)

(declare-fun tp!14244 () Bool)

(declare-fun e!108354 () Bool)

(assert (=> mapNonEmpty!6243 (= mapRes!6243 (and tp!14244 e!108354))))

(declare-fun mapValue!6243 () ValueCell!1498)

(declare-fun mapKey!6243 () (_ BitVec 32))

(declare-fun mapRest!6243 () (Array (_ BitVec 32) ValueCell!1498))

(assert (=> mapNonEmpty!6243 (= (arr!3068 (_values!3377 thiss!1248)) (store mapRest!6243 mapKey!6243 mapValue!6243))))

(declare-fun b!165180 () Bool)

(assert (=> b!165180 (= e!108358 e!108356)))

(declare-fun res!78326 () Bool)

(assert (=> b!165180 (=> (not res!78326) (not e!108356))))

(declare-datatypes ((SeekEntryResult!430 0))(
  ( (MissingZero!430 (index!3888 (_ BitVec 32))) (Found!430 (index!3889 (_ BitVec 32))) (Intermediate!430 (undefined!1242 Bool) (index!3890 (_ BitVec 32)) (x!18306 (_ BitVec 32))) (Undefined!430) (MissingVacant!430 (index!3891 (_ BitVec 32))) )
))
(declare-fun lt!83022 () SeekEntryResult!430)

(assert (=> b!165180 (= res!78326 (and (not (is-Undefined!430 lt!83022)) (not (is-MissingVacant!430 lt!83022)) (not (is-MissingZero!430 lt!83022)) (is-Found!430 lt!83022)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6463 (_ BitVec 32)) SeekEntryResult!430)

(assert (=> b!165180 (= lt!83022 (seekEntryOrOpen!0 key!828 (_keys!5219 thiss!1248) (mask!8099 thiss!1248)))))

(declare-fun b!165181 () Bool)

(assert (=> b!165181 (= e!108354 tp_is_empty!3683)))

(declare-fun mapIsEmpty!6243 () Bool)

(assert (=> mapIsEmpty!6243 mapRes!6243))

(declare-fun b!165182 () Bool)

(assert (=> b!165182 (= e!108355 (and e!108357 mapRes!6243))))

(declare-fun condMapEmpty!6243 () Bool)

(declare-fun mapDefault!6243 () ValueCell!1498)

