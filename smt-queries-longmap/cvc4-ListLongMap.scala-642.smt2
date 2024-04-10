; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16204 () Bool)

(assert start!16204)

(declare-fun b!161647 () Bool)

(declare-fun b_free!3665 () Bool)

(declare-fun b_next!3665 () Bool)

(assert (=> b!161647 (= b_free!3665 (not b_next!3665))))

(declare-fun tp!13565 () Bool)

(declare-fun b_and!10079 () Bool)

(assert (=> b!161647 (= tp!13565 b_and!10079)))

(declare-fun b!161642 () Bool)

(declare-fun e!105676 () Bool)

(declare-fun tp_is_empty!3467 () Bool)

(assert (=> b!161642 (= e!105676 tp_is_empty!3467)))

(declare-fun b!161643 () Bool)

(declare-fun e!105679 () Bool)

(assert (=> b!161643 (= e!105679 tp_is_empty!3467)))

(declare-fun res!76595 () Bool)

(declare-fun e!105681 () Bool)

(assert (=> start!16204 (=> (not res!76595) (not e!105681))))

(declare-datatypes ((V!4269 0))(
  ( (V!4270 (val!1778 Int)) )
))
(declare-datatypes ((ValueCell!1390 0))(
  ( (ValueCellFull!1390 (v!3643 V!4269)) (EmptyCell!1390) )
))
(declare-datatypes ((array!6013 0))(
  ( (array!6014 (arr!2851 (Array (_ BitVec 32) (_ BitVec 64))) (size!3135 (_ BitVec 32))) )
))
(declare-datatypes ((array!6015 0))(
  ( (array!6016 (arr!2852 (Array (_ BitVec 32) ValueCell!1390)) (size!3136 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1688 0))(
  ( (LongMapFixedSize!1689 (defaultEntry!3286 Int) (mask!7882 (_ BitVec 32)) (extraKeys!3027 (_ BitVec 32)) (zeroValue!3129 V!4269) (minValue!3129 V!4269) (_size!893 (_ BitVec 32)) (_keys!5087 array!6013) (_values!3269 array!6015) (_vacant!893 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1688)

(declare-fun valid!772 (LongMapFixedSize!1688) Bool)

(assert (=> start!16204 (= res!76595 (valid!772 thiss!1248))))

(assert (=> start!16204 e!105681))

(declare-fun e!105677 () Bool)

(assert (=> start!16204 e!105677))

(assert (=> start!16204 true))

(declare-fun mapNonEmpty!5888 () Bool)

(declare-fun mapRes!5888 () Bool)

(declare-fun tp!13564 () Bool)

(assert (=> mapNonEmpty!5888 (= mapRes!5888 (and tp!13564 e!105679))))

(declare-fun mapValue!5888 () ValueCell!1390)

(declare-fun mapRest!5888 () (Array (_ BitVec 32) ValueCell!1390))

(declare-fun mapKey!5888 () (_ BitVec 32))

(assert (=> mapNonEmpty!5888 (= (arr!2852 (_values!3269 thiss!1248)) (store mapRest!5888 mapKey!5888 mapValue!5888))))

(declare-fun b!161644 () Bool)

(declare-fun e!105680 () Bool)

(assert (=> b!161644 (= e!105680 (and e!105676 mapRes!5888))))

(declare-fun condMapEmpty!5888 () Bool)

(declare-fun mapDefault!5888 () ValueCell!1390)

