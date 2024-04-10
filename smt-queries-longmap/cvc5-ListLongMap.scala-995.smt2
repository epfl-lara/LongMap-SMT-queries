; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21472 () Bool)

(assert start!21472)

(declare-fun b!215510 () Bool)

(declare-fun b_free!5719 () Bool)

(declare-fun b_next!5719 () Bool)

(assert (=> b!215510 (= b_free!5719 (not b_next!5719))))

(declare-fun tp!20271 () Bool)

(declare-fun b_and!12609 () Bool)

(assert (=> b!215510 (= tp!20271 b_and!12609)))

(declare-fun b!215505 () Bool)

(declare-fun e!140188 () Bool)

(declare-fun tp_is_empty!5581 () Bool)

(assert (=> b!215505 (= e!140188 tp_is_empty!5581)))

(declare-fun mapNonEmpty!9514 () Bool)

(declare-fun mapRes!9514 () Bool)

(declare-fun tp!20272 () Bool)

(declare-fun e!140191 () Bool)

(assert (=> mapNonEmpty!9514 (= mapRes!9514 (and tp!20272 e!140191))))

(declare-datatypes ((V!7089 0))(
  ( (V!7090 (val!2835 Int)) )
))
(declare-datatypes ((ValueCell!2447 0))(
  ( (ValueCellFull!2447 (v!4853 V!7089)) (EmptyCell!2447) )
))
(declare-fun mapRest!9514 () (Array (_ BitVec 32) ValueCell!2447))

(declare-datatypes ((array!10389 0))(
  ( (array!10390 (arr!4922 (Array (_ BitVec 32) ValueCell!2447)) (size!5252 (_ BitVec 32))) )
))
(declare-datatypes ((array!10391 0))(
  ( (array!10392 (arr!4923 (Array (_ BitVec 32) (_ BitVec 64))) (size!5253 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2794 0))(
  ( (LongMapFixedSize!2795 (defaultEntry!4047 Int) (mask!9749 (_ BitVec 32)) (extraKeys!3784 (_ BitVec 32)) (zeroValue!3888 V!7089) (minValue!3888 V!7089) (_size!1446 (_ BitVec 32)) (_keys!6081 array!10391) (_values!4030 array!10389) (_vacant!1446 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2794)

(declare-fun mapValue!9514 () ValueCell!2447)

(declare-fun mapKey!9514 () (_ BitVec 32))

(assert (=> mapNonEmpty!9514 (= (arr!4922 (_values!4030 thiss!1504)) (store mapRest!9514 mapKey!9514 mapValue!9514))))

(declare-fun b!215506 () Bool)

(declare-fun res!105414 () Bool)

(declare-fun e!140190 () Bool)

(assert (=> b!215506 (=> (not res!105414) (not e!140190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215506 (= res!105414 (validMask!0 (mask!9749 thiss!1504)))))

(declare-fun b!215507 () Bool)

(declare-fun e!140193 () Bool)

(assert (=> b!215507 (= e!140193 e!140190)))

(declare-fun res!105413 () Bool)

(assert (=> b!215507 (=> (not res!105413) (not e!140190))))

(declare-datatypes ((SeekEntryResult!731 0))(
  ( (MissingZero!731 (index!5094 (_ BitVec 32))) (Found!731 (index!5095 (_ BitVec 32))) (Intermediate!731 (undefined!1543 Bool) (index!5096 (_ BitVec 32)) (x!22513 (_ BitVec 32))) (Undefined!731) (MissingVacant!731 (index!5097 (_ BitVec 32))) )
))
(declare-fun lt!110973 () SeekEntryResult!731)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215507 (= res!105413 (or (= lt!110973 (MissingZero!731 index!297)) (= lt!110973 (MissingVacant!731 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10391 (_ BitVec 32)) SeekEntryResult!731)

(assert (=> b!215507 (= lt!110973 (seekEntryOrOpen!0 key!932 (_keys!6081 thiss!1504) (mask!9749 thiss!1504)))))

(declare-fun b!215508 () Bool)

(assert (=> b!215508 (= e!140190 (and (= (size!5252 (_values!4030 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9749 thiss!1504))) (= (size!5253 (_keys!6081 thiss!1504)) (size!5252 (_values!4030 thiss!1504))) (bvslt (mask!9749 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215509 () Bool)

(declare-fun e!140192 () Bool)

(assert (=> b!215509 (= e!140192 (and e!140188 mapRes!9514))))

(declare-fun condMapEmpty!9514 () Bool)

(declare-fun mapDefault!9514 () ValueCell!2447)

