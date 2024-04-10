; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21552 () Bool)

(assert start!21552)

(declare-fun b!216084 () Bool)

(declare-fun b_free!5741 () Bool)

(declare-fun b_next!5741 () Bool)

(assert (=> b!216084 (= b_free!5741 (not b_next!5741))))

(declare-fun tp!20348 () Bool)

(declare-fun b_and!12631 () Bool)

(assert (=> b!216084 (= tp!20348 b_and!12631)))

(declare-fun b!216078 () Bool)

(declare-fun e!140584 () Bool)

(declare-fun e!140590 () Bool)

(assert (=> b!216078 (= e!140584 e!140590)))

(declare-fun res!105655 () Bool)

(assert (=> b!216078 (=> (not res!105655) (not e!140590))))

(declare-datatypes ((SeekEntryResult!739 0))(
  ( (MissingZero!739 (index!5126 (_ BitVec 32))) (Found!739 (index!5127 (_ BitVec 32))) (Intermediate!739 (undefined!1551 Bool) (index!5128 (_ BitVec 32)) (x!22587 (_ BitVec 32))) (Undefined!739) (MissingVacant!739 (index!5129 (_ BitVec 32))) )
))
(declare-fun lt!111093 () SeekEntryResult!739)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216078 (= res!105655 (or (= lt!111093 (MissingZero!739 index!297)) (= lt!111093 (MissingVacant!739 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7117 0))(
  ( (V!7118 (val!2846 Int)) )
))
(declare-datatypes ((ValueCell!2458 0))(
  ( (ValueCellFull!2458 (v!4864 V!7117)) (EmptyCell!2458) )
))
(declare-datatypes ((array!10439 0))(
  ( (array!10440 (arr!4944 (Array (_ BitVec 32) ValueCell!2458)) (size!5276 (_ BitVec 32))) )
))
(declare-datatypes ((array!10441 0))(
  ( (array!10442 (arr!4945 (Array (_ BitVec 32) (_ BitVec 64))) (size!5277 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2816 0))(
  ( (LongMapFixedSize!2817 (defaultEntry!4058 Int) (mask!9780 (_ BitVec 32)) (extraKeys!3795 (_ BitVec 32)) (zeroValue!3899 V!7117) (minValue!3899 V!7117) (_size!1457 (_ BitVec 32)) (_keys!6101 array!10441) (_values!4041 array!10439) (_vacant!1457 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2816)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10441 (_ BitVec 32)) SeekEntryResult!739)

(assert (=> b!216078 (= lt!111093 (seekEntryOrOpen!0 key!932 (_keys!6101 thiss!1504) (mask!9780 thiss!1504)))))

(declare-fun mapIsEmpty!9558 () Bool)

(declare-fun mapRes!9558 () Bool)

(assert (=> mapIsEmpty!9558 mapRes!9558))

(declare-fun b!216079 () Bool)

(declare-fun e!140587 () Bool)

(declare-fun e!140588 () Bool)

(assert (=> b!216079 (= e!140587 (and e!140588 mapRes!9558))))

(declare-fun condMapEmpty!9558 () Bool)

(declare-fun mapDefault!9558 () ValueCell!2458)

