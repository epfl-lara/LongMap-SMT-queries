; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22042 () Bool)

(assert start!22042)

(declare-fun b!227677 () Bool)

(declare-fun b_free!6109 () Bool)

(declare-fun b_next!6109 () Bool)

(assert (=> b!227677 (= b_free!6109 (not b_next!6109))))

(declare-fun tp!21469 () Bool)

(declare-fun b_and!13007 () Bool)

(assert (=> b!227677 (= tp!21469 b_and!13007)))

(declare-fun b!227676 () Bool)

(declare-fun res!112083 () Bool)

(declare-fun e!147717 () Bool)

(assert (=> b!227676 (=> res!112083 e!147717)))

(declare-datatypes ((V!7609 0))(
  ( (V!7610 (val!3030 Int)) )
))
(declare-datatypes ((ValueCell!2642 0))(
  ( (ValueCellFull!2642 (v!5050 V!7609)) (EmptyCell!2642) )
))
(declare-datatypes ((array!11185 0))(
  ( (array!11186 (arr!5312 (Array (_ BitVec 32) ValueCell!2642)) (size!5645 (_ BitVec 32))) )
))
(declare-datatypes ((array!11187 0))(
  ( (array!11188 (arr!5313 (Array (_ BitVec 32) (_ BitVec 64))) (size!5646 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3184 0))(
  ( (LongMapFixedSize!3185 (defaultEntry!4251 Int) (mask!10115 (_ BitVec 32)) (extraKeys!3988 (_ BitVec 32)) (zeroValue!4092 V!7609) (minValue!4092 V!7609) (_size!1641 (_ BitVec 32)) (_keys!6305 array!11187) (_values!4234 array!11185) (_vacant!1641 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3184)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11187 (_ BitVec 32)) Bool)

(assert (=> b!227676 (= res!112083 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6305 thiss!1504) (mask!10115 thiss!1504))))))

(declare-fun tp_is_empty!5971 () Bool)

(declare-fun e!147719 () Bool)

(declare-fun e!147706 () Bool)

(declare-fun array_inv!3511 (array!11187) Bool)

(declare-fun array_inv!3512 (array!11185) Bool)

(assert (=> b!227677 (= e!147719 (and tp!21469 tp_is_empty!5971 (array_inv!3511 (_keys!6305 thiss!1504)) (array_inv!3512 (_values!4234 thiss!1504)) e!147706))))

(declare-fun b!227678 () Bool)

(declare-fun e!147715 () Bool)

(assert (=> b!227678 (= e!147715 tp_is_empty!5971)))

(declare-fun b!227679 () Bool)

(declare-fun e!147712 () Bool)

(declare-fun mapRes!10126 () Bool)

(assert (=> b!227679 (= e!147706 (and e!147712 mapRes!10126))))

(declare-fun condMapEmpty!10126 () Bool)

(declare-fun mapDefault!10126 () ValueCell!2642)

