; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21646 () Bool)

(assert start!21646)

(declare-fun b!217129 () Bool)

(declare-fun b_free!5795 () Bool)

(declare-fun b_next!5795 () Bool)

(assert (=> b!217129 (= b_free!5795 (not b_next!5795))))

(declare-fun tp!20520 () Bool)

(declare-fun b_and!12685 () Bool)

(assert (=> b!217129 (= tp!20520 b_and!12685)))

(declare-fun tp_is_empty!5657 () Bool)

(declare-datatypes ((V!7189 0))(
  ( (V!7190 (val!2873 Int)) )
))
(declare-datatypes ((ValueCell!2485 0))(
  ( (ValueCellFull!2485 (v!4891 V!7189)) (EmptyCell!2485) )
))
(declare-datatypes ((array!10553 0))(
  ( (array!10554 (arr!4998 (Array (_ BitVec 32) ValueCell!2485)) (size!5330 (_ BitVec 32))) )
))
(declare-datatypes ((array!10555 0))(
  ( (array!10556 (arr!4999 (Array (_ BitVec 32) (_ BitVec 64))) (size!5331 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2870 0))(
  ( (LongMapFixedSize!2871 (defaultEntry!4085 Int) (mask!9834 (_ BitVec 32)) (extraKeys!3822 (_ BitVec 32)) (zeroValue!3926 V!7189) (minValue!3926 V!7189) (_size!1484 (_ BitVec 32)) (_keys!6134 array!10555) (_values!4068 array!10553) (_vacant!1484 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2870)

(declare-fun e!141259 () Bool)

(declare-fun e!141260 () Bool)

(declare-fun array_inv!3309 (array!10555) Bool)

(declare-fun array_inv!3310 (array!10553) Bool)

(assert (=> b!217129 (= e!141259 (and tp!20520 tp_is_empty!5657 (array_inv!3309 (_keys!6134 thiss!1504)) (array_inv!3310 (_values!4068 thiss!1504)) e!141260))))

(declare-fun b!217130 () Bool)

(declare-fun res!106274 () Bool)

(declare-fun e!141257 () Bool)

(assert (=> b!217130 (=> (not res!106274) (not e!141257))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217130 (= res!106274 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217131 () Bool)

(declare-fun e!141256 () Bool)

(assert (=> b!217131 (= e!141256 tp_is_empty!5657)))

(declare-fun b!217132 () Bool)

(declare-fun e!141258 () Bool)

(assert (=> b!217132 (= e!141257 e!141258)))

(declare-fun res!106276 () Bool)

(assert (=> b!217132 (=> (not res!106276) (not e!141258))))

(declare-datatypes ((SeekEntryResult!761 0))(
  ( (MissingZero!761 (index!5214 (_ BitVec 32))) (Found!761 (index!5215 (_ BitVec 32))) (Intermediate!761 (undefined!1573 Bool) (index!5216 (_ BitVec 32)) (x!22705 (_ BitVec 32))) (Undefined!761) (MissingVacant!761 (index!5217 (_ BitVec 32))) )
))
(declare-fun lt!111291 () SeekEntryResult!761)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217132 (= res!106276 (or (= lt!111291 (MissingZero!761 index!297)) (= lt!111291 (MissingVacant!761 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10555 (_ BitVec 32)) SeekEntryResult!761)

(assert (=> b!217132 (= lt!111291 (seekEntryOrOpen!0 key!932 (_keys!6134 thiss!1504) (mask!9834 thiss!1504)))))

(declare-fun b!217133 () Bool)

(declare-fun res!106273 () Bool)

(assert (=> b!217133 (=> (not res!106273) (not e!141258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217133 (= res!106273 (validMask!0 (mask!9834 thiss!1504)))))

(declare-fun b!217134 () Bool)

(declare-fun e!141261 () Bool)

(declare-fun mapRes!9648 () Bool)

(assert (=> b!217134 (= e!141260 (and e!141261 mapRes!9648))))

(declare-fun condMapEmpty!9648 () Bool)

(declare-fun mapDefault!9648 () ValueCell!2485)

