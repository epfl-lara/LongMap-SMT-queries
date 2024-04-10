; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22850 () Bool)

(assert start!22850)

(declare-fun b!238057 () Bool)

(declare-fun b_free!6391 () Bool)

(declare-fun b_next!6391 () Bool)

(assert (=> b!238057 (= b_free!6391 (not b_next!6391))))

(declare-fun tp!22371 () Bool)

(declare-fun b_and!13353 () Bool)

(assert (=> b!238057 (= tp!22371 b_and!13353)))

(declare-fun b!238053 () Bool)

(declare-fun res!116648 () Bool)

(declare-fun e!154576 () Bool)

(assert (=> b!238053 (=> (not res!116648) (not e!154576))))

(declare-datatypes ((V!7985 0))(
  ( (V!7986 (val!3171 Int)) )
))
(declare-datatypes ((ValueCell!2783 0))(
  ( (ValueCellFull!2783 (v!5207 V!7985)) (EmptyCell!2783) )
))
(declare-datatypes ((array!11781 0))(
  ( (array!11782 (arr!5594 (Array (_ BitVec 32) ValueCell!2783)) (size!5935 (_ BitVec 32))) )
))
(declare-datatypes ((array!11783 0))(
  ( (array!11784 (arr!5595 (Array (_ BitVec 32) (_ BitVec 64))) (size!5936 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3466 0))(
  ( (LongMapFixedSize!3467 (defaultEntry!4416 Int) (mask!10442 (_ BitVec 32)) (extraKeys!4153 (_ BitVec 32)) (zeroValue!4257 V!7985) (minValue!4257 V!7985) (_size!1782 (_ BitVec 32)) (_keys!6514 array!11783) (_values!4399 array!11781) (_vacant!1782 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3466)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4674 0))(
  ( (tuple2!4675 (_1!2348 (_ BitVec 64)) (_2!2348 V!7985)) )
))
(declare-datatypes ((List!3572 0))(
  ( (Nil!3569) (Cons!3568 (h!4224 tuple2!4674) (t!8563 List!3572)) )
))
(declare-datatypes ((ListLongMap!3587 0))(
  ( (ListLongMap!3588 (toList!1809 List!3572)) )
))
(declare-fun contains!1695 (ListLongMap!3587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1337 (array!11783 array!11781 (_ BitVec 32) (_ BitVec 32) V!7985 V!7985 (_ BitVec 32) Int) ListLongMap!3587)

(assert (=> b!238053 (= res!116648 (not (contains!1695 (getCurrentListMap!1337 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)) key!932)))))

(declare-fun b!238054 () Bool)

(declare-fun res!116650 () Bool)

(assert (=> b!238054 (=> (not res!116650) (not e!154576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11783 (_ BitVec 32)) Bool)

(assert (=> b!238054 (= res!116650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6514 thiss!1504) (mask!10442 thiss!1504)))))

(declare-fun b!238055 () Bool)

(declare-fun res!116647 () Bool)

(assert (=> b!238055 (=> (not res!116647) (not e!154576))))

(assert (=> b!238055 (= res!116647 (and (= (size!5935 (_values!4399 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10442 thiss!1504))) (= (size!5936 (_keys!6514 thiss!1504)) (size!5935 (_values!4399 thiss!1504))) (bvsge (mask!10442 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4153 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4153 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!238056 () Bool)

(declare-fun e!154575 () Bool)

(declare-fun tp_is_empty!6253 () Bool)

(assert (=> b!238056 (= e!154575 tp_is_empty!6253)))

(declare-fun e!154573 () Bool)

(declare-fun e!154572 () Bool)

(declare-fun array_inv!3695 (array!11783) Bool)

(declare-fun array_inv!3696 (array!11781) Bool)

(assert (=> b!238057 (= e!154573 (and tp!22371 tp_is_empty!6253 (array_inv!3695 (_keys!6514 thiss!1504)) (array_inv!3696 (_values!4399 thiss!1504)) e!154572))))

(declare-fun mapNonEmpty!10605 () Bool)

(declare-fun mapRes!10605 () Bool)

(declare-fun tp!22370 () Bool)

(declare-fun e!154574 () Bool)

(assert (=> mapNonEmpty!10605 (= mapRes!10605 (and tp!22370 e!154574))))

(declare-fun mapRest!10605 () (Array (_ BitVec 32) ValueCell!2783))

(declare-fun mapKey!10605 () (_ BitVec 32))

(declare-fun mapValue!10605 () ValueCell!2783)

(assert (=> mapNonEmpty!10605 (= (arr!5594 (_values!4399 thiss!1504)) (store mapRest!10605 mapKey!10605 mapValue!10605))))

(declare-fun res!116651 () Bool)

(declare-fun e!154577 () Bool)

(assert (=> start!22850 (=> (not res!116651) (not e!154577))))

(declare-fun valid!1368 (LongMapFixedSize!3466) Bool)

(assert (=> start!22850 (= res!116651 (valid!1368 thiss!1504))))

(assert (=> start!22850 e!154577))

(assert (=> start!22850 e!154573))

(assert (=> start!22850 true))

(declare-fun b!238058 () Bool)

(assert (=> b!238058 (= e!154572 (and e!154575 mapRes!10605))))

(declare-fun condMapEmpty!10605 () Bool)

(declare-fun mapDefault!10605 () ValueCell!2783)

