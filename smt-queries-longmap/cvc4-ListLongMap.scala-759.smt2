; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17808 () Bool)

(assert start!17808)

(declare-fun b!177855 () Bool)

(declare-fun b_free!4397 () Bool)

(declare-fun b_next!4397 () Bool)

(assert (=> b!177855 (= b_free!4397 (not b_next!4397))))

(declare-fun tp!15898 () Bool)

(declare-fun b_and!10905 () Bool)

(assert (=> b!177855 (= tp!15898 b_and!10905)))

(declare-fun res!84289 () Bool)

(declare-fun e!117267 () Bool)

(assert (=> start!17808 (=> (not res!84289) (not e!117267))))

(declare-datatypes ((V!5205 0))(
  ( (V!5206 (val!2129 Int)) )
))
(declare-datatypes ((ValueCell!1741 0))(
  ( (ValueCellFull!1741 (v!4011 V!5205)) (EmptyCell!1741) )
))
(declare-datatypes ((array!7493 0))(
  ( (array!7494 (arr!3553 (Array (_ BitVec 32) (_ BitVec 64))) (size!3858 (_ BitVec 32))) )
))
(declare-datatypes ((array!7495 0))(
  ( (array!7496 (arr!3554 (Array (_ BitVec 32) ValueCell!1741)) (size!3859 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2390 0))(
  ( (LongMapFixedSize!2391 (defaultEntry!3661 Int) (mask!8609 (_ BitVec 32)) (extraKeys!3398 (_ BitVec 32)) (zeroValue!3502 V!5205) (minValue!3502 V!5205) (_size!1244 (_ BitVec 32)) (_keys!5533 array!7493) (_values!3644 array!7495) (_vacant!1244 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2390)

(declare-fun valid!1001 (LongMapFixedSize!2390) Bool)

(assert (=> start!17808 (= res!84289 (valid!1001 thiss!1248))))

(assert (=> start!17808 e!117267))

(declare-fun e!117264 () Bool)

(assert (=> start!17808 e!117264))

(assert (=> start!17808 true))

(declare-fun mapNonEmpty!7123 () Bool)

(declare-fun mapRes!7123 () Bool)

(declare-fun tp!15897 () Bool)

(declare-fun e!117265 () Bool)

(assert (=> mapNonEmpty!7123 (= mapRes!7123 (and tp!15897 e!117265))))

(declare-fun mapKey!7123 () (_ BitVec 32))

(declare-fun mapValue!7123 () ValueCell!1741)

(declare-fun mapRest!7123 () (Array (_ BitVec 32) ValueCell!1741))

(assert (=> mapNonEmpty!7123 (= (arr!3554 (_values!3644 thiss!1248)) (store mapRest!7123 mapKey!7123 mapValue!7123))))

(declare-fun e!117263 () Bool)

(declare-fun tp_is_empty!4169 () Bool)

(declare-fun array_inv!2281 (array!7493) Bool)

(declare-fun array_inv!2282 (array!7495) Bool)

(assert (=> b!177855 (= e!117264 (and tp!15898 tp_is_empty!4169 (array_inv!2281 (_keys!5533 thiss!1248)) (array_inv!2282 (_values!3644 thiss!1248)) e!117263))))

(declare-fun b!177856 () Bool)

(declare-fun res!84290 () Bool)

(assert (=> b!177856 (=> (not res!84290) (not e!117267))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!177856 (= res!84290 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177857 () Bool)

(declare-fun res!84291 () Bool)

(assert (=> b!177857 (=> (not res!84291) (not e!117267))))

(declare-datatypes ((SeekEntryResult!571 0))(
  ( (MissingZero!571 (index!4452 (_ BitVec 32))) (Found!571 (index!4453 (_ BitVec 32))) (Intermediate!571 (undefined!1383 Bool) (index!4454 (_ BitVec 32)) (x!19495 (_ BitVec 32))) (Undefined!571) (MissingVacant!571 (index!4455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7493 (_ BitVec 32)) SeekEntryResult!571)

(assert (=> b!177857 (= res!84291 (is-Undefined!571 (seekEntryOrOpen!0 key!828 (_keys!5533 thiss!1248) (mask!8609 thiss!1248))))))

(declare-fun b!177858 () Bool)

(declare-fun e!117268 () Bool)

(assert (=> b!177858 (= e!117268 tp_is_empty!4169)))

(declare-fun b!177859 () Bool)

(assert (=> b!177859 (= e!117263 (and e!117268 mapRes!7123))))

(declare-fun condMapEmpty!7123 () Bool)

(declare-fun mapDefault!7123 () ValueCell!1741)

