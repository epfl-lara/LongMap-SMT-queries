; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21854 () Bool)

(assert start!21854)

(declare-fun b!220405 () Bool)

(declare-fun b_free!5921 () Bool)

(declare-fun b_next!5921 () Bool)

(assert (=> b!220405 (= b_free!5921 (not b_next!5921))))

(declare-fun tp!20905 () Bool)

(declare-fun b_and!12819 () Bool)

(assert (=> b!220405 (= tp!20905 b_and!12819)))

(declare-fun b!220390 () Bool)

(declare-fun res!108067 () Bool)

(declare-fun e!143305 () Bool)

(assert (=> b!220390 (=> (not res!108067) (not e!143305))))

(declare-datatypes ((V!7357 0))(
  ( (V!7358 (val!2936 Int)) )
))
(declare-datatypes ((ValueCell!2548 0))(
  ( (ValueCellFull!2548 (v!4956 V!7357)) (EmptyCell!2548) )
))
(declare-datatypes ((array!10809 0))(
  ( (array!10810 (arr!5124 (Array (_ BitVec 32) ValueCell!2548)) (size!5457 (_ BitVec 32))) )
))
(declare-datatypes ((array!10811 0))(
  ( (array!10812 (arr!5125 (Array (_ BitVec 32) (_ BitVec 64))) (size!5458 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2996 0))(
  ( (LongMapFixedSize!2997 (defaultEntry!4157 Int) (mask!9957 (_ BitVec 32)) (extraKeys!3894 (_ BitVec 32)) (zeroValue!3998 V!7357) (minValue!3998 V!7357) (_size!1547 (_ BitVec 32)) (_keys!6211 array!10811) (_values!4140 array!10809) (_vacant!1547 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2996)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220390 (= res!108067 (validMask!0 (mask!9957 thiss!1504)))))

(declare-fun b!220391 () Bool)

(declare-fun e!143297 () Bool)

(declare-fun e!143304 () Bool)

(assert (=> b!220391 (= e!143297 e!143304)))

(declare-fun res!108066 () Bool)

(assert (=> b!220391 (=> (not res!108066) (not e!143304))))

(declare-datatypes ((SeekEntryResult!811 0))(
  ( (MissingZero!811 (index!5414 (_ BitVec 32))) (Found!811 (index!5415 (_ BitVec 32))) (Intermediate!811 (undefined!1623 Bool) (index!5416 (_ BitVec 32)) (x!22951 (_ BitVec 32))) (Undefined!811) (MissingVacant!811 (index!5417 (_ BitVec 32))) )
))
(declare-fun lt!112169 () SeekEntryResult!811)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220391 (= res!108066 (or (= lt!112169 (MissingZero!811 index!297)) (= lt!112169 (MissingVacant!811 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10811 (_ BitVec 32)) SeekEntryResult!811)

(assert (=> b!220391 (= lt!112169 (seekEntryOrOpen!0 key!932 (_keys!6211 thiss!1504) (mask!9957 thiss!1504)))))

(declare-fun b!220392 () Bool)

(declare-fun e!143300 () Bool)

(declare-fun e!143302 () Bool)

(declare-fun mapRes!9844 () Bool)

(assert (=> b!220392 (= e!143300 (and e!143302 mapRes!9844))))

(declare-fun condMapEmpty!9844 () Bool)

(declare-fun mapDefault!9844 () ValueCell!2548)

