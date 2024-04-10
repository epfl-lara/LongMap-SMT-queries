; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17860 () Bool)

(assert start!17860)

(declare-fun b!178192 () Bool)

(declare-fun b_free!4399 () Bool)

(declare-fun b_next!4399 () Bool)

(assert (=> b!178192 (= b_free!4399 (not b_next!4399))))

(declare-fun tp!15907 () Bool)

(declare-fun b_and!10913 () Bool)

(assert (=> b!178192 (= tp!15907 b_and!10913)))

(declare-fun b!178187 () Bool)

(declare-fun e!117463 () Bool)

(declare-fun tp_is_empty!4171 () Bool)

(assert (=> b!178187 (= e!117463 tp_is_empty!4171)))

(declare-fun b!178188 () Bool)

(declare-fun res!84427 () Bool)

(declare-fun e!117464 () Bool)

(assert (=> b!178188 (=> (not res!84427) (not e!117464))))

(declare-datatypes ((V!5209 0))(
  ( (V!5210 (val!2130 Int)) )
))
(declare-datatypes ((ValueCell!1742 0))(
  ( (ValueCellFull!1742 (v!4013 V!5209)) (EmptyCell!1742) )
))
(declare-datatypes ((array!7499 0))(
  ( (array!7500 (arr!3555 (Array (_ BitVec 32) (_ BitVec 64))) (size!3861 (_ BitVec 32))) )
))
(declare-datatypes ((array!7501 0))(
  ( (array!7502 (arr!3556 (Array (_ BitVec 32) ValueCell!1742)) (size!3862 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2392 0))(
  ( (LongMapFixedSize!2393 (defaultEntry!3664 Int) (mask!8620 (_ BitVec 32)) (extraKeys!3401 (_ BitVec 32)) (zeroValue!3505 V!5209) (minValue!3505 V!5209) (_size!1245 (_ BitVec 32)) (_keys!5540 array!7499) (_values!3647 array!7501) (_vacant!1245 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2392)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178188 (= res!84427 (validMask!0 (mask!8620 thiss!1248)))))

(declare-fun res!84425 () Bool)

(assert (=> start!17860 (=> (not res!84425) (not e!117464))))

(declare-fun valid!1002 (LongMapFixedSize!2392) Bool)

(assert (=> start!17860 (= res!84425 (valid!1002 thiss!1248))))

(assert (=> start!17860 e!117464))

(declare-fun e!117465 () Bool)

(assert (=> start!17860 e!117465))

(assert (=> start!17860 true))

(declare-fun b!178189 () Bool)

(declare-fun res!84428 () Bool)

(assert (=> b!178189 (=> (not res!84428) (not e!117464))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!178189 (= res!84428 (not (= key!828 (bvneg key!828))))))

(declare-fun b!178190 () Bool)

(assert (=> b!178190 (= e!117464 (and (= (size!3862 (_values!3647 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8620 thiss!1248))) (= (size!3861 (_keys!5540 thiss!1248)) (size!3862 (_values!3647 thiss!1248))) (bvslt (mask!8620 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!178191 () Bool)

(declare-fun res!84426 () Bool)

(assert (=> b!178191 (=> (not res!84426) (not e!117464))))

(declare-datatypes ((tuple2!3312 0))(
  ( (tuple2!3313 (_1!1667 (_ BitVec 64)) (_2!1667 V!5209)) )
))
(declare-datatypes ((List!2260 0))(
  ( (Nil!2257) (Cons!2256 (h!2879 tuple2!3312) (t!7096 List!2260)) )
))
(declare-datatypes ((ListLongMap!2239 0))(
  ( (ListLongMap!2240 (toList!1135 List!2260)) )
))
(declare-fun contains!1205 (ListLongMap!2239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!787 (array!7499 array!7501 (_ BitVec 32) (_ BitVec 32) V!5209 V!5209 (_ BitVec 32) Int) ListLongMap!2239)

(assert (=> b!178191 (= res!84426 (not (contains!1205 (getCurrentListMap!787 (_keys!5540 thiss!1248) (_values!3647 thiss!1248) (mask!8620 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)) key!828)))))

(declare-fun e!117462 () Bool)

(declare-fun array_inv!2283 (array!7499) Bool)

(declare-fun array_inv!2284 (array!7501) Bool)

(assert (=> b!178192 (= e!117465 (and tp!15907 tp_is_empty!4171 (array_inv!2283 (_keys!5540 thiss!1248)) (array_inv!2284 (_values!3647 thiss!1248)) e!117462))))

(declare-fun mapNonEmpty!7130 () Bool)

(declare-fun mapRes!7130 () Bool)

(declare-fun tp!15908 () Bool)

(assert (=> mapNonEmpty!7130 (= mapRes!7130 (and tp!15908 e!117463))))

(declare-fun mapRest!7130 () (Array (_ BitVec 32) ValueCell!1742))

(declare-fun mapValue!7130 () ValueCell!1742)

(declare-fun mapKey!7130 () (_ BitVec 32))

(assert (=> mapNonEmpty!7130 (= (arr!3556 (_values!3647 thiss!1248)) (store mapRest!7130 mapKey!7130 mapValue!7130))))

(declare-fun mapIsEmpty!7130 () Bool)

(assert (=> mapIsEmpty!7130 mapRes!7130))

(declare-fun b!178193 () Bool)

(declare-fun res!84429 () Bool)

(assert (=> b!178193 (=> (not res!84429) (not e!117464))))

(declare-datatypes ((SeekEntryResult!572 0))(
  ( (MissingZero!572 (index!4456 (_ BitVec 32))) (Found!572 (index!4457 (_ BitVec 32))) (Intermediate!572 (undefined!1384 Bool) (index!4458 (_ BitVec 32)) (x!19522 (_ BitVec 32))) (Undefined!572) (MissingVacant!572 (index!4459 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7499 (_ BitVec 32)) SeekEntryResult!572)

(assert (=> b!178193 (= res!84429 (is-Undefined!572 (seekEntryOrOpen!0 key!828 (_keys!5540 thiss!1248) (mask!8620 thiss!1248))))))

(declare-fun b!178194 () Bool)

(declare-fun e!117461 () Bool)

(assert (=> b!178194 (= e!117462 (and e!117461 mapRes!7130))))

(declare-fun condMapEmpty!7130 () Bool)

(declare-fun mapDefault!7130 () ValueCell!1742)

