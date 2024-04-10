; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21666 () Bool)

(assert start!21666)

(declare-fun b!217462 () Bool)

(declare-fun b_free!5815 () Bool)

(declare-fun b_next!5815 () Bool)

(assert (=> b!217462 (= b_free!5815 (not b_next!5815))))

(declare-fun tp!20580 () Bool)

(declare-fun b_and!12705 () Bool)

(assert (=> b!217462 (= tp!20580 b_and!12705)))

(declare-fun b!217459 () Bool)

(declare-fun res!106487 () Bool)

(declare-fun e!141468 () Bool)

(assert (=> b!217459 (=> (not res!106487) (not e!141468))))

(declare-datatypes ((V!7217 0))(
  ( (V!7218 (val!2883 Int)) )
))
(declare-datatypes ((ValueCell!2495 0))(
  ( (ValueCellFull!2495 (v!4901 V!7217)) (EmptyCell!2495) )
))
(declare-datatypes ((array!10593 0))(
  ( (array!10594 (arr!5018 (Array (_ BitVec 32) ValueCell!2495)) (size!5350 (_ BitVec 32))) )
))
(declare-datatypes ((array!10595 0))(
  ( (array!10596 (arr!5019 (Array (_ BitVec 32) (_ BitVec 64))) (size!5351 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2890 0))(
  ( (LongMapFixedSize!2891 (defaultEntry!4095 Int) (mask!9852 (_ BitVec 32)) (extraKeys!3832 (_ BitVec 32)) (zeroValue!3936 V!7217) (minValue!3936 V!7217) (_size!1494 (_ BitVec 32)) (_keys!6144 array!10595) (_values!4078 array!10593) (_vacant!1494 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2890)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10595 (_ BitVec 32)) Bool)

(assert (=> b!217459 (= res!106487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6144 thiss!1504) (mask!9852 thiss!1504)))))

(declare-fun b!217460 () Bool)

(assert (=> b!217460 (= e!141468 false)))

(declare-fun lt!111351 () Bool)

(declare-datatypes ((List!3192 0))(
  ( (Nil!3189) (Cons!3188 (h!3835 (_ BitVec 64)) (t!8147 List!3192)) )
))
(declare-fun arrayNoDuplicates!0 (array!10595 (_ BitVec 32) List!3192) Bool)

(assert (=> b!217460 (= lt!111351 (arrayNoDuplicates!0 (_keys!6144 thiss!1504) #b00000000000000000000000000000000 Nil!3189))))

(declare-fun b!217461 () Bool)

(declare-fun res!106482 () Bool)

(assert (=> b!217461 (=> (not res!106482) (not e!141468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217461 (= res!106482 (validMask!0 (mask!9852 thiss!1504)))))

(declare-fun e!141467 () Bool)

(declare-fun e!141471 () Bool)

(declare-fun tp_is_empty!5677 () Bool)

(declare-fun array_inv!3323 (array!10595) Bool)

(declare-fun array_inv!3324 (array!10593) Bool)

(assert (=> b!217462 (= e!141467 (and tp!20580 tp_is_empty!5677 (array_inv!3323 (_keys!6144 thiss!1504)) (array_inv!3324 (_values!4078 thiss!1504)) e!141471))))

(declare-fun b!217463 () Bool)

(declare-fun e!141466 () Bool)

(assert (=> b!217463 (= e!141466 tp_is_empty!5677)))

(declare-fun b!217464 () Bool)

(declare-fun e!141469 () Bool)

(declare-fun mapRes!9678 () Bool)

(assert (=> b!217464 (= e!141471 (and e!141469 mapRes!9678))))

(declare-fun condMapEmpty!9678 () Bool)

(declare-fun mapDefault!9678 () ValueCell!2495)

