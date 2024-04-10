; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17936 () Bool)

(assert start!17936)

(declare-fun b!178765 () Bool)

(declare-fun b_free!4411 () Bool)

(declare-fun b_next!4411 () Bool)

(assert (=> b!178765 (= b_free!4411 (not b_next!4411))))

(declare-fun tp!15950 () Bool)

(declare-fun b_and!10933 () Bool)

(assert (=> b!178765 (= tp!15950 b_and!10933)))

(declare-fun b!178763 () Bool)

(declare-fun res!84676 () Bool)

(declare-fun e!117810 () Bool)

(assert (=> b!178763 (=> (not res!84676) (not e!117810))))

(declare-datatypes ((V!5225 0))(
  ( (V!5226 (val!2136 Int)) )
))
(declare-datatypes ((ValueCell!1748 0))(
  ( (ValueCellFull!1748 (v!4021 V!5225)) (EmptyCell!1748) )
))
(declare-datatypes ((array!7527 0))(
  ( (array!7528 (arr!3567 (Array (_ BitVec 32) (_ BitVec 64))) (size!3874 (_ BitVec 32))) )
))
(declare-datatypes ((array!7529 0))(
  ( (array!7530 (arr!3568 (Array (_ BitVec 32) ValueCell!1748)) (size!3875 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2404 0))(
  ( (LongMapFixedSize!2405 (defaultEntry!3673 Int) (mask!8641 (_ BitVec 32)) (extraKeys!3410 (_ BitVec 32)) (zeroValue!3514 V!5225) (minValue!3514 V!5225) (_size!1251 (_ BitVec 32)) (_keys!5554 array!7527) (_values!3656 array!7529) (_vacant!1251 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2404)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3320 0))(
  ( (tuple2!3321 (_1!1671 (_ BitVec 64)) (_2!1671 V!5225)) )
))
(declare-datatypes ((List!2266 0))(
  ( (Nil!2263) (Cons!2262 (h!2886 tuple2!3320) (t!7106 List!2266)) )
))
(declare-datatypes ((ListLongMap!2247 0))(
  ( (ListLongMap!2248 (toList!1139 List!2266)) )
))
(declare-fun contains!1211 (ListLongMap!2247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!791 (array!7527 array!7529 (_ BitVec 32) (_ BitVec 32) V!5225 V!5225 (_ BitVec 32) Int) ListLongMap!2247)

(assert (=> b!178763 (= res!84676 (not (contains!1211 (getCurrentListMap!791 (_keys!5554 thiss!1248) (_values!3656 thiss!1248) (mask!8641 thiss!1248) (extraKeys!3410 thiss!1248) (zeroValue!3514 thiss!1248) (minValue!3514 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3673 thiss!1248)) key!828)))))

(declare-fun b!178764 () Bool)

(declare-fun res!84678 () Bool)

(assert (=> b!178764 (=> (not res!84678) (not e!117810))))

(declare-datatypes ((SeekEntryResult!577 0))(
  ( (MissingZero!577 (index!4476 (_ BitVec 32))) (Found!577 (index!4477 (_ BitVec 32))) (Intermediate!577 (undefined!1389 Bool) (index!4478 (_ BitVec 32)) (x!19571 (_ BitVec 32))) (Undefined!577) (MissingVacant!577 (index!4479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7527 (_ BitVec 32)) SeekEntryResult!577)

(assert (=> b!178764 (= res!84678 (is-Undefined!577 (seekEntryOrOpen!0 key!828 (_keys!5554 thiss!1248) (mask!8641 thiss!1248))))))

(declare-fun res!84680 () Bool)

(assert (=> start!17936 (=> (not res!84680) (not e!117810))))

(declare-fun valid!1006 (LongMapFixedSize!2404) Bool)

(assert (=> start!17936 (= res!84680 (valid!1006 thiss!1248))))

(assert (=> start!17936 e!117810))

(declare-fun e!117813 () Bool)

(assert (=> start!17936 e!117813))

(assert (=> start!17936 true))

(declare-fun mapNonEmpty!7155 () Bool)

(declare-fun mapRes!7155 () Bool)

(declare-fun tp!15951 () Bool)

(declare-fun e!117815 () Bool)

(assert (=> mapNonEmpty!7155 (= mapRes!7155 (and tp!15951 e!117815))))

(declare-fun mapRest!7155 () (Array (_ BitVec 32) ValueCell!1748))

(declare-fun mapKey!7155 () (_ BitVec 32))

(declare-fun mapValue!7155 () ValueCell!1748)

(assert (=> mapNonEmpty!7155 (= (arr!3568 (_values!3656 thiss!1248)) (store mapRest!7155 mapKey!7155 mapValue!7155))))

(declare-fun tp_is_empty!4183 () Bool)

(declare-fun e!117812 () Bool)

(declare-fun array_inv!2293 (array!7527) Bool)

(declare-fun array_inv!2294 (array!7529) Bool)

(assert (=> b!178765 (= e!117813 (and tp!15950 tp_is_empty!4183 (array_inv!2293 (_keys!5554 thiss!1248)) (array_inv!2294 (_values!3656 thiss!1248)) e!117812))))

(declare-fun b!178766 () Bool)

(declare-fun res!84679 () Bool)

(assert (=> b!178766 (=> (not res!84679) (not e!117810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178766 (= res!84679 (validMask!0 (mask!8641 thiss!1248)))))

(declare-fun b!178767 () Bool)

(assert (=> b!178767 (= e!117815 tp_is_empty!4183)))

(declare-fun b!178768 () Bool)

(declare-fun e!117811 () Bool)

(assert (=> b!178768 (= e!117812 (and e!117811 mapRes!7155))))

(declare-fun condMapEmpty!7155 () Bool)

(declare-fun mapDefault!7155 () ValueCell!1748)

