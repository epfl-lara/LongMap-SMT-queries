; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17456 () Bool)

(assert start!17456)

(declare-fun b!175031 () Bool)

(declare-fun b_free!4327 () Bool)

(declare-fun b_next!4327 () Bool)

(assert (=> b!175031 (= b_free!4327 (not b_next!4327))))

(declare-fun tp!15657 () Bool)

(declare-fun b_and!10801 () Bool)

(assert (=> b!175031 (= tp!15657 b_and!10801)))

(declare-fun b!175025 () Bool)

(declare-fun e!115556 () Bool)

(declare-fun tp_is_empty!4099 () Bool)

(assert (=> b!175025 (= e!115556 tp_is_empty!4099)))

(declare-fun mapNonEmpty!6987 () Bool)

(declare-fun mapRes!6987 () Bool)

(declare-fun tp!15656 () Bool)

(declare-fun e!115551 () Bool)

(assert (=> mapNonEmpty!6987 (= mapRes!6987 (and tp!15656 e!115551))))

(declare-datatypes ((V!5113 0))(
  ( (V!5114 (val!2094 Int)) )
))
(declare-datatypes ((ValueCell!1706 0))(
  ( (ValueCellFull!1706 (v!3967 V!5113)) (EmptyCell!1706) )
))
(declare-fun mapValue!6987 () ValueCell!1706)

(declare-fun mapKey!6987 () (_ BitVec 32))

(declare-fun mapRest!6987 () (Array (_ BitVec 32) ValueCell!1706))

(declare-datatypes ((array!7335 0))(
  ( (array!7336 (arr!3483 (Array (_ BitVec 32) (_ BitVec 64))) (size!3784 (_ BitVec 32))) )
))
(declare-datatypes ((array!7337 0))(
  ( (array!7338 (arr!3484 (Array (_ BitVec 32) ValueCell!1706)) (size!3785 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2320 0))(
  ( (LongMapFixedSize!2321 (defaultEntry!3613 Int) (mask!8502 (_ BitVec 32)) (extraKeys!3350 (_ BitVec 32)) (zeroValue!3454 V!5113) (minValue!3454 V!5113) (_size!1209 (_ BitVec 32)) (_keys!5461 array!7335) (_values!3596 array!7337) (_vacant!1209 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2320)

(assert (=> mapNonEmpty!6987 (= (arr!3484 (_values!3596 thiss!1248)) (store mapRest!6987 mapKey!6987 mapValue!6987))))

(declare-fun b!175026 () Bool)

(declare-fun res!82994 () Bool)

(declare-fun e!115554 () Bool)

(assert (=> b!175026 (=> (not res!82994) (not e!115554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175026 (= res!82994 (validMask!0 (mask!8502 thiss!1248)))))

(declare-fun b!175027 () Bool)

(declare-fun res!82992 () Bool)

(assert (=> b!175027 (=> (not res!82992) (not e!115554))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!548 0))(
  ( (MissingZero!548 (index!4360 (_ BitVec 32))) (Found!548 (index!4361 (_ BitVec 32))) (Intermediate!548 (undefined!1360 Bool) (index!4362 (_ BitVec 32)) (x!19262 (_ BitVec 32))) (Undefined!548) (MissingVacant!548 (index!4363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7335 (_ BitVec 32)) SeekEntryResult!548)

(assert (=> b!175027 (= res!82992 (is-Undefined!548 (seekEntryOrOpen!0 key!828 (_keys!5461 thiss!1248) (mask!8502 thiss!1248))))))

(declare-fun b!175028 () Bool)

(declare-fun res!82990 () Bool)

(assert (=> b!175028 (=> (not res!82990) (not e!115554))))

(assert (=> b!175028 (= res!82990 (not (= key!828 (bvneg key!828))))))

(declare-fun b!175029 () Bool)

(declare-fun res!82993 () Bool)

(assert (=> b!175029 (=> (not res!82993) (not e!115554))))

(declare-datatypes ((tuple2!3256 0))(
  ( (tuple2!3257 (_1!1639 (_ BitVec 64)) (_2!1639 V!5113)) )
))
(declare-datatypes ((List!2217 0))(
  ( (Nil!2214) (Cons!2213 (h!2831 tuple2!3256) (t!7033 List!2217)) )
))
(declare-datatypes ((ListLongMap!2183 0))(
  ( (ListLongMap!2184 (toList!1107 List!2217)) )
))
(declare-fun contains!1165 (ListLongMap!2183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!759 (array!7335 array!7337 (_ BitVec 32) (_ BitVec 32) V!5113 V!5113 (_ BitVec 32) Int) ListLongMap!2183)

(assert (=> b!175029 (= res!82993 (contains!1165 (getCurrentListMap!759 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)) key!828))))

(declare-fun b!175030 () Bool)

(assert (=> b!175030 (= e!115551 tp_is_empty!4099)))

(declare-fun e!115555 () Bool)

(declare-fun e!115552 () Bool)

(declare-fun array_inv!2231 (array!7335) Bool)

(declare-fun array_inv!2232 (array!7337) Bool)

(assert (=> b!175031 (= e!115552 (and tp!15657 tp_is_empty!4099 (array_inv!2231 (_keys!5461 thiss!1248)) (array_inv!2232 (_values!3596 thiss!1248)) e!115555))))

(declare-fun b!175032 () Bool)

(assert (=> b!175032 (= e!115555 (and e!115556 mapRes!6987))))

(declare-fun condMapEmpty!6987 () Bool)

(declare-fun mapDefault!6987 () ValueCell!1706)

