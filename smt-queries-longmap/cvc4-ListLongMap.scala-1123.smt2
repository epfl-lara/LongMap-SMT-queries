; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23054 () Bool)

(assert start!23054)

(declare-fun b!241573 () Bool)

(declare-fun b_free!6491 () Bool)

(declare-fun b_next!6491 () Bool)

(assert (=> b!241573 (= b_free!6491 (not b_next!6491))))

(declare-fun tp!22681 () Bool)

(declare-fun b_and!13463 () Bool)

(assert (=> b!241573 (= tp!22681 b_and!13463)))

(declare-fun b!241572 () Bool)

(declare-datatypes ((Unit!7441 0))(
  ( (Unit!7442) )
))
(declare-fun e!156776 () Unit!7441)

(declare-fun Unit!7443 () Unit!7441)

(assert (=> b!241572 (= e!156776 Unit!7443)))

(declare-fun lt!121402 () Unit!7441)

(declare-datatypes ((V!8117 0))(
  ( (V!8118 (val!3221 Int)) )
))
(declare-datatypes ((ValueCell!2833 0))(
  ( (ValueCellFull!2833 (v!5260 V!8117)) (EmptyCell!2833) )
))
(declare-datatypes ((array!11987 0))(
  ( (array!11988 (arr!5694 (Array (_ BitVec 32) ValueCell!2833)) (size!6036 (_ BitVec 32))) )
))
(declare-datatypes ((array!11989 0))(
  ( (array!11990 (arr!5695 (Array (_ BitVec 32) (_ BitVec 64))) (size!6037 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3566 0))(
  ( (LongMapFixedSize!3567 (defaultEntry!4476 Int) (mask!10547 (_ BitVec 32)) (extraKeys!4213 (_ BitVec 32)) (zeroValue!4317 V!8117) (minValue!4317 V!8117) (_size!1832 (_ BitVec 32)) (_keys!6582 array!11989) (_values!4459 array!11987) (_vacant!1832 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3566)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!349 (array!11989 array!11987 (_ BitVec 32) (_ BitVec 32) V!8117 V!8117 (_ BitVec 64) Int) Unit!7441)

(assert (=> b!241572 (= lt!121402 (lemmaInListMapThenSeekEntryOrOpenFindsIt!349 (_keys!6582 thiss!1504) (_values!4459 thiss!1504) (mask!10547 thiss!1504) (extraKeys!4213 thiss!1504) (zeroValue!4317 thiss!1504) (minValue!4317 thiss!1504) key!932 (defaultEntry!4476 thiss!1504)))))

(assert (=> b!241572 false))

(declare-fun tp_is_empty!6353 () Bool)

(declare-fun e!156783 () Bool)

(declare-fun e!156780 () Bool)

(declare-fun array_inv!3769 (array!11989) Bool)

(declare-fun array_inv!3770 (array!11987) Bool)

(assert (=> b!241573 (= e!156780 (and tp!22681 tp_is_empty!6353 (array_inv!3769 (_keys!6582 thiss!1504)) (array_inv!3770 (_values!4459 thiss!1504)) e!156783))))

(declare-fun mapNonEmpty!10765 () Bool)

(declare-fun mapRes!10765 () Bool)

(declare-fun tp!22680 () Bool)

(declare-fun e!156781 () Bool)

(assert (=> mapNonEmpty!10765 (= mapRes!10765 (and tp!22680 e!156781))))

(declare-fun mapValue!10765 () ValueCell!2833)

(declare-fun mapKey!10765 () (_ BitVec 32))

(declare-fun mapRest!10765 () (Array (_ BitVec 32) ValueCell!2833))

(assert (=> mapNonEmpty!10765 (= (arr!5694 (_values!4459 thiss!1504)) (store mapRest!10765 mapKey!10765 mapValue!10765))))

(declare-fun b!241575 () Bool)

(declare-fun res!118415 () Bool)

(declare-datatypes ((SeekEntryResult!1057 0))(
  ( (MissingZero!1057 (index!6398 (_ BitVec 32))) (Found!1057 (index!6399 (_ BitVec 32))) (Intermediate!1057 (undefined!1869 Bool) (index!6400 (_ BitVec 32)) (x!24219 (_ BitVec 32))) (Undefined!1057) (MissingVacant!1057 (index!6401 (_ BitVec 32))) )
))
(declare-fun lt!121406 () SeekEntryResult!1057)

(assert (=> b!241575 (= res!118415 (= (select (arr!5695 (_keys!6582 thiss!1504)) (index!6401 lt!121406)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156784 () Bool)

(assert (=> b!241575 (=> (not res!118415) (not e!156784))))

(declare-fun b!241576 () Bool)

(declare-fun e!156786 () Bool)

(assert (=> b!241576 (= e!156783 (and e!156786 mapRes!10765))))

(declare-fun condMapEmpty!10765 () Bool)

(declare-fun mapDefault!10765 () ValueCell!2833)

