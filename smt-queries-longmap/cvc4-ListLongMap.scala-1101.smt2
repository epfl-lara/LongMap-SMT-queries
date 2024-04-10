; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22588 () Bool)

(assert start!22588)

(declare-fun b!236159 () Bool)

(declare-fun b_free!6359 () Bool)

(declare-fun b_next!6359 () Bool)

(assert (=> b!236159 (= b_free!6359 (not b_next!6359))))

(declare-fun tp!22253 () Bool)

(declare-fun b_and!13293 () Bool)

(assert (=> b!236159 (= tp!22253 b_and!13293)))

(declare-fun b!236158 () Bool)

(declare-fun e!153389 () Bool)

(declare-datatypes ((V!7941 0))(
  ( (V!7942 (val!3155 Int)) )
))
(declare-datatypes ((ValueCell!2767 0))(
  ( (ValueCellFull!2767 (v!5185 V!7941)) (EmptyCell!2767) )
))
(declare-datatypes ((array!11705 0))(
  ( (array!11706 (arr!5562 (Array (_ BitVec 32) ValueCell!2767)) (size!5899 (_ BitVec 32))) )
))
(declare-datatypes ((array!11707 0))(
  ( (array!11708 (arr!5563 (Array (_ BitVec 32) (_ BitVec 64))) (size!5900 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3434 0))(
  ( (LongMapFixedSize!3435 (defaultEntry!4390 Int) (mask!10375 (_ BitVec 32)) (extraKeys!4127 (_ BitVec 32)) (zeroValue!4231 V!7941) (minValue!4231 V!7941) (_size!1766 (_ BitVec 32)) (_keys!6469 array!11707) (_values!4373 array!11705) (_vacant!1766 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3434)

(assert (=> b!236158 (= e!153389 (not (= (size!5899 (_values!4373 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10375 thiss!1504)))))))

(declare-fun e!153390 () Bool)

(declare-fun e!153385 () Bool)

(declare-fun tp_is_empty!6221 () Bool)

(declare-fun array_inv!3669 (array!11707) Bool)

(declare-fun array_inv!3670 (array!11705) Bool)

(assert (=> b!236159 (= e!153385 (and tp!22253 tp_is_empty!6221 (array_inv!3669 (_keys!6469 thiss!1504)) (array_inv!3670 (_values!4373 thiss!1504)) e!153390))))

(declare-fun mapNonEmpty!10535 () Bool)

(declare-fun mapRes!10535 () Bool)

(declare-fun tp!22252 () Bool)

(declare-fun e!153386 () Bool)

(assert (=> mapNonEmpty!10535 (= mapRes!10535 (and tp!22252 e!153386))))

(declare-fun mapKey!10535 () (_ BitVec 32))

(declare-fun mapValue!10535 () ValueCell!2767)

(declare-fun mapRest!10535 () (Array (_ BitVec 32) ValueCell!2767))

(assert (=> mapNonEmpty!10535 (= (arr!5562 (_values!4373 thiss!1504)) (store mapRest!10535 mapKey!10535 mapValue!10535))))

(declare-fun mapIsEmpty!10535 () Bool)

(assert (=> mapIsEmpty!10535 mapRes!10535))

(declare-fun b!236160 () Bool)

(assert (=> b!236160 (= e!153386 tp_is_empty!6221)))

(declare-fun b!236161 () Bool)

(declare-fun res!115822 () Bool)

(assert (=> b!236161 (=> (not res!115822) (not e!153389))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4650 0))(
  ( (tuple2!4651 (_1!2336 (_ BitVec 64)) (_2!2336 V!7941)) )
))
(declare-datatypes ((List!3554 0))(
  ( (Nil!3551) (Cons!3550 (h!4202 tuple2!4650) (t!8533 List!3554)) )
))
(declare-datatypes ((ListLongMap!3563 0))(
  ( (ListLongMap!3564 (toList!1797 List!3554)) )
))
(declare-fun contains!1675 (ListLongMap!3563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1325 (array!11707 array!11705 (_ BitVec 32) (_ BitVec 32) V!7941 V!7941 (_ BitVec 32) Int) ListLongMap!3563)

(assert (=> b!236161 (= res!115822 (not (contains!1675 (getCurrentListMap!1325 (_keys!6469 thiss!1504) (_values!4373 thiss!1504) (mask!10375 thiss!1504) (extraKeys!4127 thiss!1504) (zeroValue!4231 thiss!1504) (minValue!4231 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4390 thiss!1504)) key!932)))))

(declare-fun b!236162 () Bool)

(declare-fun res!115823 () Bool)

(assert (=> b!236162 (=> (not res!115823) (not e!153389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236162 (= res!115823 (validMask!0 (mask!10375 thiss!1504)))))

(declare-fun b!236163 () Bool)

(declare-fun res!115824 () Bool)

(declare-fun e!153391 () Bool)

(assert (=> b!236163 (=> (not res!115824) (not e!153391))))

(assert (=> b!236163 (= res!115824 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236164 () Bool)

(declare-fun e!153388 () Bool)

(assert (=> b!236164 (= e!153390 (and e!153388 mapRes!10535))))

(declare-fun condMapEmpty!10535 () Bool)

(declare-fun mapDefault!10535 () ValueCell!2767)

