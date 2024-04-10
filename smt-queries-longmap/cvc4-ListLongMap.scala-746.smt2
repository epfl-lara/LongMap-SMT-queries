; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17384 () Bool)

(assert start!17384)

(declare-fun b!174506 () Bool)

(declare-fun b_free!4319 () Bool)

(declare-fun b_next!4319 () Bool)

(assert (=> b!174506 (= b_free!4319 (not b_next!4319))))

(declare-fun tp!15625 () Bool)

(declare-fun b_and!10785 () Bool)

(assert (=> b!174506 (= tp!15625 b_and!10785)))

(declare-fun b!174504 () Bool)

(declare-fun res!82772 () Bool)

(declare-fun e!115242 () Bool)

(assert (=> b!174504 (=> (not res!82772) (not e!115242))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!174504 (= res!82772 (not (= key!828 (bvneg key!828))))))

(declare-fun b!174505 () Bool)

(declare-fun res!82770 () Bool)

(assert (=> b!174505 (=> (not res!82770) (not e!115242))))

(declare-datatypes ((V!5101 0))(
  ( (V!5102 (val!2090 Int)) )
))
(declare-datatypes ((ValueCell!1702 0))(
  ( (ValueCellFull!1702 (v!3961 V!5101)) (EmptyCell!1702) )
))
(declare-datatypes ((array!7315 0))(
  ( (array!7316 (arr!3475 (Array (_ BitVec 32) (_ BitVec 64))) (size!3775 (_ BitVec 32))) )
))
(declare-datatypes ((array!7317 0))(
  ( (array!7318 (arr!3476 (Array (_ BitVec 32) ValueCell!1702)) (size!3776 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2312 0))(
  ( (LongMapFixedSize!2313 (defaultEntry!3606 Int) (mask!8483 (_ BitVec 32)) (extraKeys!3343 (_ BitVec 32)) (zeroValue!3447 V!5101) (minValue!3447 V!5101) (_size!1205 (_ BitVec 32)) (_keys!5449 array!7315) (_values!3589 array!7317) (_vacant!1205 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2312)

(declare-datatypes ((tuple2!3248 0))(
  ( (tuple2!3249 (_1!1635 (_ BitVec 64)) (_2!1635 V!5101)) )
))
(declare-datatypes ((List!2211 0))(
  ( (Nil!2208) (Cons!2207 (h!2824 tuple2!3248) (t!7023 List!2211)) )
))
(declare-datatypes ((ListLongMap!2175 0))(
  ( (ListLongMap!2176 (toList!1103 List!2211)) )
))
(declare-fun contains!1159 (ListLongMap!2175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!755 (array!7315 array!7317 (_ BitVec 32) (_ BitVec 32) V!5101 V!5101 (_ BitVec 32) Int) ListLongMap!2175)

(assert (=> b!174505 (= res!82770 (contains!1159 (getCurrentListMap!755 (_keys!5449 thiss!1248) (_values!3589 thiss!1248) (mask!8483 thiss!1248) (extraKeys!3343 thiss!1248) (zeroValue!3447 thiss!1248) (minValue!3447 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3606 thiss!1248)) key!828))))

(declare-fun e!115241 () Bool)

(declare-fun tp_is_empty!4091 () Bool)

(declare-fun e!115238 () Bool)

(declare-fun array_inv!2225 (array!7315) Bool)

(declare-fun array_inv!2226 (array!7317) Bool)

(assert (=> b!174506 (= e!115238 (and tp!15625 tp_is_empty!4091 (array_inv!2225 (_keys!5449 thiss!1248)) (array_inv!2226 (_values!3589 thiss!1248)) e!115241))))

(declare-fun b!174507 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!174507 (= e!115242 (not (validMask!0 (mask!8483 thiss!1248))))))

(declare-fun b!174508 () Bool)

(declare-fun res!82771 () Bool)

(assert (=> b!174508 (=> (not res!82771) (not e!115242))))

(declare-datatypes ((SeekEntryResult!545 0))(
  ( (MissingZero!545 (index!4348 (_ BitVec 32))) (Found!545 (index!4349 (_ BitVec 32))) (Intermediate!545 (undefined!1357 Bool) (index!4350 (_ BitVec 32)) (x!19215 (_ BitVec 32))) (Undefined!545) (MissingVacant!545 (index!4351 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7315 (_ BitVec 32)) SeekEntryResult!545)

(assert (=> b!174508 (= res!82771 (is-Undefined!545 (seekEntryOrOpen!0 key!828 (_keys!5449 thiss!1248) (mask!8483 thiss!1248))))))

(declare-fun res!82773 () Bool)

(assert (=> start!17384 (=> (not res!82773) (not e!115242))))

(declare-fun valid!977 (LongMapFixedSize!2312) Bool)

(assert (=> start!17384 (= res!82773 (valid!977 thiss!1248))))

(assert (=> start!17384 e!115242))

(assert (=> start!17384 e!115238))

(assert (=> start!17384 true))

(declare-fun mapIsEmpty!6968 () Bool)

(declare-fun mapRes!6968 () Bool)

(assert (=> mapIsEmpty!6968 mapRes!6968))

(declare-fun b!174509 () Bool)

(declare-fun e!115239 () Bool)

(assert (=> b!174509 (= e!115239 tp_is_empty!4091)))

(declare-fun b!174510 () Bool)

(declare-fun e!115237 () Bool)

(assert (=> b!174510 (= e!115237 tp_is_empty!4091)))

(declare-fun mapNonEmpty!6968 () Bool)

(declare-fun tp!15626 () Bool)

(assert (=> mapNonEmpty!6968 (= mapRes!6968 (and tp!15626 e!115239))))

(declare-fun mapValue!6968 () ValueCell!1702)

(declare-fun mapKey!6968 () (_ BitVec 32))

(declare-fun mapRest!6968 () (Array (_ BitVec 32) ValueCell!1702))

(assert (=> mapNonEmpty!6968 (= (arr!3476 (_values!3589 thiss!1248)) (store mapRest!6968 mapKey!6968 mapValue!6968))))

(declare-fun b!174511 () Bool)

(assert (=> b!174511 (= e!115241 (and e!115237 mapRes!6968))))

(declare-fun condMapEmpty!6968 () Bool)

(declare-fun mapDefault!6968 () ValueCell!1702)

