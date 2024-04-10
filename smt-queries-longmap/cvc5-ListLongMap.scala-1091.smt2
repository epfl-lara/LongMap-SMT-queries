; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22292 () Bool)

(assert start!22292)

(declare-fun b!233696 () Bool)

(declare-fun b_free!6295 () Bool)

(declare-fun b_next!6295 () Bool)

(assert (=> b!233696 (= b_free!6295 (not b_next!6295))))

(declare-fun tp!22033 () Bool)

(declare-fun b_and!13201 () Bool)

(assert (=> b!233696 (= tp!22033 b_and!13201)))

(declare-fun e!151803 () Bool)

(declare-fun e!151804 () Bool)

(declare-datatypes ((V!7857 0))(
  ( (V!7858 (val!3123 Int)) )
))
(declare-datatypes ((ValueCell!2735 0))(
  ( (ValueCellFull!2735 (v!5145 V!7857)) (EmptyCell!2735) )
))
(declare-datatypes ((array!11561 0))(
  ( (array!11562 (arr!5498 (Array (_ BitVec 32) ValueCell!2735)) (size!5832 (_ BitVec 32))) )
))
(declare-datatypes ((array!11563 0))(
  ( (array!11564 (arr!5499 (Array (_ BitVec 32) (_ BitVec 64))) (size!5833 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3370 0))(
  ( (LongMapFixedSize!3371 (defaultEntry!4347 Int) (mask!10281 (_ BitVec 32)) (extraKeys!4084 (_ BitVec 32)) (zeroValue!4188 V!7857) (minValue!4188 V!7857) (_size!1734 (_ BitVec 32)) (_keys!6406 array!11563) (_values!4330 array!11561) (_vacant!1734 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3370)

(declare-fun tp_is_empty!6157 () Bool)

(declare-fun array_inv!3623 (array!11563) Bool)

(declare-fun array_inv!3624 (array!11561) Bool)

(assert (=> b!233696 (= e!151803 (and tp!22033 tp_is_empty!6157 (array_inv!3623 (_keys!6406 thiss!1504)) (array_inv!3624 (_values!4330 thiss!1504)) e!151804))))

(declare-fun b!233697 () Bool)

(declare-fun res!114674 () Bool)

(declare-fun e!151802 () Bool)

(assert (=> b!233697 (=> (not res!114674) (not e!151802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233697 (= res!114674 (validMask!0 (mask!10281 thiss!1504)))))

(declare-fun res!114672 () Bool)

(declare-fun e!151805 () Bool)

(assert (=> start!22292 (=> (not res!114672) (not e!151805))))

(declare-fun valid!1330 (LongMapFixedSize!3370) Bool)

(assert (=> start!22292 (= res!114672 (valid!1330 thiss!1504))))

(assert (=> start!22292 e!151805))

(assert (=> start!22292 e!151803))

(assert (=> start!22292 true))

(declare-fun b!233698 () Bool)

(declare-fun e!151806 () Bool)

(assert (=> b!233698 (= e!151806 tp_is_empty!6157)))

(declare-fun mapIsEmpty!10412 () Bool)

(declare-fun mapRes!10412 () Bool)

(assert (=> mapIsEmpty!10412 mapRes!10412))

(declare-fun b!233699 () Bool)

(declare-fun res!114673 () Bool)

(assert (=> b!233699 (=> (not res!114673) (not e!151802))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4606 0))(
  ( (tuple2!4607 (_1!2314 (_ BitVec 64)) (_2!2314 V!7857)) )
))
(declare-datatypes ((List!3518 0))(
  ( (Nil!3515) (Cons!3514 (h!4163 tuple2!4606) (t!8481 List!3518)) )
))
(declare-datatypes ((ListLongMap!3519 0))(
  ( (ListLongMap!3520 (toList!1775 List!3518)) )
))
(declare-fun contains!1645 (ListLongMap!3519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1303 (array!11563 array!11561 (_ BitVec 32) (_ BitVec 32) V!7857 V!7857 (_ BitVec 32) Int) ListLongMap!3519)

(assert (=> b!233699 (= res!114673 (contains!1645 (getCurrentListMap!1303 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10412 () Bool)

(declare-fun tp!22034 () Bool)

(assert (=> mapNonEmpty!10412 (= mapRes!10412 (and tp!22034 e!151806))))

(declare-fun mapValue!10412 () ValueCell!2735)

(declare-fun mapRest!10412 () (Array (_ BitVec 32) ValueCell!2735))

(declare-fun mapKey!10412 () (_ BitVec 32))

(assert (=> mapNonEmpty!10412 (= (arr!5498 (_values!4330 thiss!1504)) (store mapRest!10412 mapKey!10412 mapValue!10412))))

(declare-fun b!233700 () Bool)

(declare-fun e!151801 () Bool)

(assert (=> b!233700 (= e!151804 (and e!151801 mapRes!10412))))

(declare-fun condMapEmpty!10412 () Bool)

(declare-fun mapDefault!10412 () ValueCell!2735)

