; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16200 () Bool)

(assert start!16200)

(declare-fun b!161607 () Bool)

(declare-fun b_free!3661 () Bool)

(declare-fun b_next!3661 () Bool)

(assert (=> b!161607 (= b_free!3661 (not b_next!3661))))

(declare-fun tp!13552 () Bool)

(declare-fun b_and!10075 () Bool)

(assert (=> b!161607 (= tp!13552 b_and!10075)))

(declare-fun mapIsEmpty!5882 () Bool)

(declare-fun mapRes!5882 () Bool)

(assert (=> mapIsEmpty!5882 mapRes!5882))

(declare-fun b!161606 () Bool)

(declare-fun e!105642 () Bool)

(declare-fun tp_is_empty!3463 () Bool)

(assert (=> b!161606 (= e!105642 tp_is_empty!3463)))

(declare-fun mapNonEmpty!5882 () Bool)

(declare-fun tp!13553 () Bool)

(declare-fun e!105644 () Bool)

(assert (=> mapNonEmpty!5882 (= mapRes!5882 (and tp!13553 e!105644))))

(declare-datatypes ((V!4265 0))(
  ( (V!4266 (val!1776 Int)) )
))
(declare-datatypes ((ValueCell!1388 0))(
  ( (ValueCellFull!1388 (v!3641 V!4265)) (EmptyCell!1388) )
))
(declare-fun mapRest!5882 () (Array (_ BitVec 32) ValueCell!1388))

(declare-fun mapKey!5882 () (_ BitVec 32))

(declare-fun mapValue!5882 () ValueCell!1388)

(declare-datatypes ((array!6005 0))(
  ( (array!6006 (arr!2847 (Array (_ BitVec 32) (_ BitVec 64))) (size!3131 (_ BitVec 32))) )
))
(declare-datatypes ((array!6007 0))(
  ( (array!6008 (arr!2848 (Array (_ BitVec 32) ValueCell!1388)) (size!3132 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1684 0))(
  ( (LongMapFixedSize!1685 (defaultEntry!3284 Int) (mask!7880 (_ BitVec 32)) (extraKeys!3025 (_ BitVec 32)) (zeroValue!3127 V!4265) (minValue!3127 V!4265) (_size!891 (_ BitVec 32)) (_keys!5085 array!6005) (_values!3267 array!6007) (_vacant!891 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1684)

(assert (=> mapNonEmpty!5882 (= (arr!2848 (_values!3267 thiss!1248)) (store mapRest!5882 mapKey!5882 mapValue!5882))))

(declare-fun e!105645 () Bool)

(declare-fun e!105641 () Bool)

(declare-fun array_inv!1817 (array!6005) Bool)

(declare-fun array_inv!1818 (array!6007) Bool)

(assert (=> b!161607 (= e!105641 (and tp!13552 tp_is_empty!3463 (array_inv!1817 (_keys!5085 thiss!1248)) (array_inv!1818 (_values!3267 thiss!1248)) e!105645))))

(declare-fun b!161608 () Bool)

(declare-fun e!105643 () Bool)

(assert (=> b!161608 (= e!105643 false)))

(declare-datatypes ((SeekEntryResult!357 0))(
  ( (MissingZero!357 (index!3596 (_ BitVec 32))) (Found!357 (index!3597 (_ BitVec 32))) (Intermediate!357 (undefined!1169 Bool) (index!3598 (_ BitVec 32)) (x!17837 (_ BitVec 32))) (Undefined!357) (MissingVacant!357 (index!3599 (_ BitVec 32))) )
))
(declare-fun lt!82249 () SeekEntryResult!357)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6005 (_ BitVec 32)) SeekEntryResult!357)

(assert (=> b!161608 (= lt!82249 (seekEntryOrOpen!0 key!828 (_keys!5085 thiss!1248) (mask!7880 thiss!1248)))))

(declare-fun b!161609 () Bool)

(assert (=> b!161609 (= e!105644 tp_is_empty!3463)))

(declare-fun b!161610 () Bool)

(assert (=> b!161610 (= e!105645 (and e!105642 mapRes!5882))))

(declare-fun condMapEmpty!5882 () Bool)

(declare-fun mapDefault!5882 () ValueCell!1388)

