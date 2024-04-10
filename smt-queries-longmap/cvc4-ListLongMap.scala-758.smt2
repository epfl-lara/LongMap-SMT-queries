; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17752 () Bool)

(assert start!17752)

(declare-fun b!177469 () Bool)

(declare-fun b_free!4391 () Bool)

(declare-fun b_next!4391 () Bool)

(assert (=> b!177469 (= b_free!4391 (not b_next!4391))))

(declare-fun tp!15876 () Bool)

(declare-fun b_and!10893 () Bool)

(assert (=> b!177469 (= tp!15876 b_and!10893)))

(declare-fun res!84122 () Bool)

(declare-fun e!117034 () Bool)

(assert (=> start!17752 (=> (not res!84122) (not e!117034))))

(declare-datatypes ((V!5197 0))(
  ( (V!5198 (val!2126 Int)) )
))
(declare-datatypes ((ValueCell!1738 0))(
  ( (ValueCellFull!1738 (v!4007 V!5197)) (EmptyCell!1738) )
))
(declare-datatypes ((array!7479 0))(
  ( (array!7480 (arr!3547 (Array (_ BitVec 32) (_ BitVec 64))) (size!3851 (_ BitVec 32))) )
))
(declare-datatypes ((array!7481 0))(
  ( (array!7482 (arr!3548 (Array (_ BitVec 32) ValueCell!1738)) (size!3852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2384 0))(
  ( (LongMapFixedSize!2385 (defaultEntry!3656 Int) (mask!8596 (_ BitVec 32)) (extraKeys!3393 (_ BitVec 32)) (zeroValue!3497 V!5197) (minValue!3497 V!5197) (_size!1241 (_ BitVec 32)) (_keys!5524 array!7479) (_values!3639 array!7481) (_vacant!1241 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2384)

(declare-fun valid!999 (LongMapFixedSize!2384) Bool)

(assert (=> start!17752 (= res!84122 (valid!999 thiss!1248))))

(assert (=> start!17752 e!117034))

(declare-fun e!117030 () Bool)

(assert (=> start!17752 e!117030))

(assert (=> start!17752 true))

(declare-fun e!117033 () Bool)

(declare-fun tp_is_empty!4163 () Bool)

(declare-fun array_inv!2277 (array!7479) Bool)

(declare-fun array_inv!2278 (array!7481) Bool)

(assert (=> b!177469 (= e!117030 (and tp!15876 tp_is_empty!4163 (array_inv!2277 (_keys!5524 thiss!1248)) (array_inv!2278 (_values!3639 thiss!1248)) e!117033))))

(declare-fun b!177470 () Bool)

(assert (=> b!177470 (= e!117034 (not (= (size!3852 (_values!3639 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8596 thiss!1248)))))))

(declare-fun mapNonEmpty!7110 () Bool)

(declare-fun mapRes!7110 () Bool)

(declare-fun tp!15875 () Bool)

(declare-fun e!117032 () Bool)

(assert (=> mapNonEmpty!7110 (= mapRes!7110 (and tp!15875 e!117032))))

(declare-fun mapKey!7110 () (_ BitVec 32))

(declare-fun mapValue!7110 () ValueCell!1738)

(declare-fun mapRest!7110 () (Array (_ BitVec 32) ValueCell!1738))

(assert (=> mapNonEmpty!7110 (= (arr!3548 (_values!3639 thiss!1248)) (store mapRest!7110 mapKey!7110 mapValue!7110))))

(declare-fun mapIsEmpty!7110 () Bool)

(assert (=> mapIsEmpty!7110 mapRes!7110))

(declare-fun b!177471 () Bool)

(declare-fun res!84124 () Bool)

(assert (=> b!177471 (=> (not res!84124) (not e!117034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177471 (= res!84124 (validMask!0 (mask!8596 thiss!1248)))))

(declare-fun b!177472 () Bool)

(declare-fun e!117035 () Bool)

(assert (=> b!177472 (= e!117035 tp_is_empty!4163)))

(declare-fun b!177473 () Bool)

(assert (=> b!177473 (= e!117032 tp_is_empty!4163)))

(declare-fun b!177474 () Bool)

(declare-fun res!84121 () Bool)

(assert (=> b!177474 (=> (not res!84121) (not e!117034))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!569 0))(
  ( (MissingZero!569 (index!4444 (_ BitVec 32))) (Found!569 (index!4445 (_ BitVec 32))) (Intermediate!569 (undefined!1381 Bool) (index!4446 (_ BitVec 32)) (x!19467 (_ BitVec 32))) (Undefined!569) (MissingVacant!569 (index!4447 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7479 (_ BitVec 32)) SeekEntryResult!569)

(assert (=> b!177474 (= res!84121 (is-Undefined!569 (seekEntryOrOpen!0 key!828 (_keys!5524 thiss!1248) (mask!8596 thiss!1248))))))

(declare-fun b!177475 () Bool)

(declare-fun res!84125 () Bool)

(assert (=> b!177475 (=> (not res!84125) (not e!117034))))

(assert (=> b!177475 (= res!84125 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177476 () Bool)

(assert (=> b!177476 (= e!117033 (and e!117035 mapRes!7110))))

(declare-fun condMapEmpty!7110 () Bool)

(declare-fun mapDefault!7110 () ValueCell!1738)

