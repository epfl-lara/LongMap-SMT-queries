; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22368 () Bool)

(assert start!22368)

(declare-fun b!234272 () Bool)

(declare-fun b_free!6307 () Bool)

(declare-fun b_next!6307 () Bool)

(assert (=> b!234272 (= b_free!6307 (not b_next!6307))))

(declare-fun tp!22076 () Bool)

(declare-fun b_and!13221 () Bool)

(assert (=> b!234272 (= tp!22076 b_and!13221)))

(declare-datatypes ((V!7873 0))(
  ( (V!7874 (val!3129 Int)) )
))
(declare-datatypes ((ValueCell!2741 0))(
  ( (ValueCellFull!2741 (v!5153 V!7873)) (EmptyCell!2741) )
))
(declare-datatypes ((array!11589 0))(
  ( (array!11590 (arr!5510 (Array (_ BitVec 32) ValueCell!2741)) (size!5845 (_ BitVec 32))) )
))
(declare-datatypes ((array!11591 0))(
  ( (array!11592 (arr!5511 (Array (_ BitVec 32) (_ BitVec 64))) (size!5846 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3382 0))(
  ( (LongMapFixedSize!3383 (defaultEntry!4356 Int) (mask!10302 (_ BitVec 32)) (extraKeys!4093 (_ BitVec 32)) (zeroValue!4197 V!7873) (minValue!4197 V!7873) (_size!1740 (_ BitVec 32)) (_keys!6420 array!11591) (_values!4339 array!11589) (_vacant!1740 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3382)

(declare-fun tp_is_empty!6169 () Bool)

(declare-fun e!152172 () Bool)

(declare-fun e!152175 () Bool)

(declare-fun array_inv!3631 (array!11591) Bool)

(declare-fun array_inv!3632 (array!11589) Bool)

(assert (=> b!234272 (= e!152172 (and tp!22076 tp_is_empty!6169 (array_inv!3631 (_keys!6420 thiss!1504)) (array_inv!3632 (_values!4339 thiss!1504)) e!152175))))

(declare-fun b!234273 () Bool)

(declare-fun e!152171 () Bool)

(assert (=> b!234273 (= e!152171 tp_is_empty!6169)))

(declare-fun res!114926 () Bool)

(declare-fun e!152170 () Bool)

(assert (=> start!22368 (=> (not res!114926) (not e!152170))))

(declare-fun valid!1335 (LongMapFixedSize!3382) Bool)

(assert (=> start!22368 (= res!114926 (valid!1335 thiss!1504))))

(assert (=> start!22368 e!152170))

(assert (=> start!22368 e!152172))

(assert (=> start!22368 true))

(declare-fun b!234274 () Bool)

(declare-fun e!152169 () Bool)

(assert (=> b!234274 (= e!152169 (and (= (size!5845 (_values!4339 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10302 thiss!1504))) (= (size!5846 (_keys!6420 thiss!1504)) (size!5845 (_values!4339 thiss!1504))) (bvsge (mask!10302 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4093 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!234275 () Bool)

(declare-fun e!152173 () Bool)

(assert (=> b!234275 (= e!152173 tp_is_empty!6169)))

(declare-fun b!234276 () Bool)

(declare-fun mapRes!10437 () Bool)

(assert (=> b!234276 (= e!152175 (and e!152173 mapRes!10437))))

(declare-fun condMapEmpty!10437 () Bool)

(declare-fun mapDefault!10437 () ValueCell!2741)

