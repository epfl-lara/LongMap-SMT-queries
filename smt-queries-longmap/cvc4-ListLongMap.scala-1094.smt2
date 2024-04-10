; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22428 () Bool)

(assert start!22428)

(declare-fun b!234720 () Bool)

(declare-fun b_free!6317 () Bool)

(declare-fun b_next!6317 () Bool)

(assert (=> b!234720 (= b_free!6317 (not b_next!6317))))

(declare-fun tp!22111 () Bool)

(declare-fun b_and!13237 () Bool)

(assert (=> b!234720 (= tp!22111 b_and!13237)))

(declare-fun b!234712 () Bool)

(declare-fun e!152457 () Bool)

(declare-fun tp_is_empty!6179 () Bool)

(assert (=> b!234712 (= e!152457 tp_is_empty!6179)))

(declare-fun b!234713 () Bool)

(declare-fun e!152453 () Bool)

(declare-datatypes ((V!7885 0))(
  ( (V!7886 (val!3134 Int)) )
))
(declare-datatypes ((ValueCell!2746 0))(
  ( (ValueCellFull!2746 (v!5159 V!7885)) (EmptyCell!2746) )
))
(declare-datatypes ((array!11611 0))(
  ( (array!11612 (arr!5520 (Array (_ BitVec 32) ValueCell!2746)) (size!5856 (_ BitVec 32))) )
))
(declare-datatypes ((array!11613 0))(
  ( (array!11614 (arr!5521 (Array (_ BitVec 32) (_ BitVec 64))) (size!5857 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3392 0))(
  ( (LongMapFixedSize!3393 (defaultEntry!4363 Int) (mask!10317 (_ BitVec 32)) (extraKeys!4100 (_ BitVec 32)) (zeroValue!4204 V!7885) (minValue!4204 V!7885) (_size!1745 (_ BitVec 32)) (_keys!6431 array!11613) (_values!4346 array!11611) (_vacant!1745 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3392)

(assert (=> b!234713 (= e!152453 (and (= (size!5856 (_values!4346 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10317 thiss!1504))) (= (size!5857 (_keys!6431 thiss!1504)) (size!5856 (_values!4346 thiss!1504))) (bvsge (mask!10317 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4100 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4100 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!234714 () Bool)

(declare-fun res!115119 () Bool)

(assert (=> b!234714 (=> (not res!115119) (not e!152453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234714 (= res!115119 (validMask!0 (mask!10317 thiss!1504)))))

(declare-fun b!234715 () Bool)

(declare-fun e!152456 () Bool)

(declare-fun e!152459 () Bool)

(declare-fun mapRes!10456 () Bool)

(assert (=> b!234715 (= e!152456 (and e!152459 mapRes!10456))))

(declare-fun condMapEmpty!10456 () Bool)

(declare-fun mapDefault!10456 () ValueCell!2746)

