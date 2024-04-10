; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16186 () Bool)

(assert start!16186)

(declare-fun b!161430 () Bool)

(declare-fun b_free!3647 () Bool)

(declare-fun b_next!3647 () Bool)

(assert (=> b!161430 (= b_free!3647 (not b_next!3647))))

(declare-fun tp!13511 () Bool)

(declare-fun b_and!10061 () Bool)

(assert (=> b!161430 (= tp!13511 b_and!10061)))

(declare-fun b!161423 () Bool)

(declare-fun e!105498 () Bool)

(declare-fun tp_is_empty!3449 () Bool)

(assert (=> b!161423 (= e!105498 tp_is_empty!3449)))

(declare-fun res!76523 () Bool)

(declare-fun e!105501 () Bool)

(assert (=> start!16186 (=> (not res!76523) (not e!105501))))

(declare-datatypes ((V!4245 0))(
  ( (V!4246 (val!1769 Int)) )
))
(declare-datatypes ((ValueCell!1381 0))(
  ( (ValueCellFull!1381 (v!3634 V!4245)) (EmptyCell!1381) )
))
(declare-datatypes ((array!5977 0))(
  ( (array!5978 (arr!2833 (Array (_ BitVec 32) (_ BitVec 64))) (size!3117 (_ BitVec 32))) )
))
(declare-datatypes ((array!5979 0))(
  ( (array!5980 (arr!2834 (Array (_ BitVec 32) ValueCell!1381)) (size!3118 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1670 0))(
  ( (LongMapFixedSize!1671 (defaultEntry!3277 Int) (mask!7867 (_ BitVec 32)) (extraKeys!3018 (_ BitVec 32)) (zeroValue!3120 V!4245) (minValue!3120 V!4245) (_size!884 (_ BitVec 32)) (_keys!5078 array!5977) (_values!3260 array!5979) (_vacant!884 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1670)

(declare-fun valid!766 (LongMapFixedSize!1670) Bool)

(assert (=> start!16186 (= res!76523 (valid!766 thiss!1248))))

(assert (=> start!16186 e!105501))

(declare-fun e!105500 () Bool)

(assert (=> start!16186 e!105500))

(assert (=> start!16186 true))

(declare-fun b!161424 () Bool)

(declare-datatypes ((Unit!5015 0))(
  ( (Unit!5016) )
))
(declare-fun e!105497 () Unit!5015)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!78 (array!5977 array!5979 (_ BitVec 32) (_ BitVec 32) V!4245 V!4245 (_ BitVec 64) Int) Unit!5015)

(assert (=> b!161424 (= e!105497 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!78 (_keys!5078 thiss!1248) (_values!3260 thiss!1248) (mask!7867 thiss!1248) (extraKeys!3018 thiss!1248) (zeroValue!3120 thiss!1248) (minValue!3120 thiss!1248) key!828 (defaultEntry!3277 thiss!1248)))))

(declare-fun b!161425 () Bool)

(declare-fun e!105499 () Bool)

(declare-fun mapRes!5861 () Bool)

(assert (=> b!161425 (= e!105499 (and e!105498 mapRes!5861))))

(declare-fun condMapEmpty!5861 () Bool)

(declare-fun mapDefault!5861 () ValueCell!1381)

