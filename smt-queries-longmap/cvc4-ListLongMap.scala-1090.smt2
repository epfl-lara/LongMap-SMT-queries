; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22240 () Bool)

(assert start!22240)

(declare-fun b!233365 () Bool)

(declare-fun b_free!6293 () Bool)

(declare-fun b_next!6293 () Bool)

(assert (=> b!233365 (= b_free!6293 (not b_next!6293))))

(declare-fun tp!22023 () Bool)

(declare-fun b_and!13193 () Bool)

(assert (=> b!233365 (= tp!22023 b_and!13193)))

(declare-fun b!233364 () Bool)

(declare-fun res!114536 () Bool)

(declare-fun e!151601 () Bool)

(assert (=> b!233364 (=> (not res!114536) (not e!151601))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!233364 (= res!114536 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!151604 () Bool)

(declare-fun tp_is_empty!6155 () Bool)

(declare-fun e!151605 () Bool)

(declare-datatypes ((V!7853 0))(
  ( (V!7854 (val!3122 Int)) )
))
(declare-datatypes ((ValueCell!2734 0))(
  ( (ValueCellFull!2734 (v!5143 V!7853)) (EmptyCell!2734) )
))
(declare-datatypes ((array!11555 0))(
  ( (array!11556 (arr!5496 (Array (_ BitVec 32) ValueCell!2734)) (size!5829 (_ BitVec 32))) )
))
(declare-datatypes ((array!11557 0))(
  ( (array!11558 (arr!5497 (Array (_ BitVec 32) (_ BitVec 64))) (size!5830 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3368 0))(
  ( (LongMapFixedSize!3369 (defaultEntry!4344 Int) (mask!10270 (_ BitVec 32)) (extraKeys!4081 (_ BitVec 32)) (zeroValue!4185 V!7853) (minValue!4185 V!7853) (_size!1733 (_ BitVec 32)) (_keys!6399 array!11557) (_values!4327 array!11555) (_vacant!1733 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3368)

(declare-fun array_inv!3621 (array!11557) Bool)

(declare-fun array_inv!3622 (array!11555) Bool)

(assert (=> b!233365 (= e!151604 (and tp!22023 tp_is_empty!6155 (array_inv!3621 (_keys!6399 thiss!1504)) (array_inv!3622 (_values!4327 thiss!1504)) e!151605))))

(declare-fun b!233367 () Bool)

(declare-fun e!151607 () Bool)

(assert (=> b!233367 (= e!151607 (not (= (size!5829 (_values!4327 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10270 thiss!1504)))))))

(declare-fun b!233368 () Bool)

(declare-fun e!151606 () Bool)

(assert (=> b!233368 (= e!151606 tp_is_empty!6155)))

(declare-fun b!233369 () Bool)

(declare-fun res!114534 () Bool)

(assert (=> b!233369 (=> (not res!114534) (not e!151607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233369 (= res!114534 (validMask!0 (mask!10270 thiss!1504)))))

(declare-fun mapNonEmpty!10405 () Bool)

(declare-fun mapRes!10405 () Bool)

(declare-fun tp!22024 () Bool)

(assert (=> mapNonEmpty!10405 (= mapRes!10405 (and tp!22024 e!151606))))

(declare-fun mapKey!10405 () (_ BitVec 32))

(declare-fun mapRest!10405 () (Array (_ BitVec 32) ValueCell!2734))

(declare-fun mapValue!10405 () ValueCell!2734)

(assert (=> mapNonEmpty!10405 (= (arr!5496 (_values!4327 thiss!1504)) (store mapRest!10405 mapKey!10405 mapValue!10405))))

(declare-fun b!233370 () Bool)

(declare-fun e!151603 () Bool)

(assert (=> b!233370 (= e!151603 tp_is_empty!6155)))

(declare-fun b!233371 () Bool)

(assert (=> b!233371 (= e!151605 (and e!151603 mapRes!10405))))

(declare-fun condMapEmpty!10405 () Bool)

(declare-fun mapDefault!10405 () ValueCell!2734)

