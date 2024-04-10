; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21304 () Bool)

(assert start!21304)

(declare-fun b!214433 () Bool)

(declare-fun b_free!5675 () Bool)

(declare-fun b_next!5675 () Bool)

(assert (=> b!214433 (= b_free!5675 (not b_next!5675))))

(declare-fun tp!20113 () Bool)

(declare-fun b_and!12565 () Bool)

(assert (=> b!214433 (= tp!20113 b_and!12565)))

(declare-fun b!214430 () Bool)

(declare-fun res!104976 () Bool)

(declare-fun e!139460 () Bool)

(assert (=> b!214430 (=> (not res!104976) (not e!139460))))

(declare-datatypes ((V!7029 0))(
  ( (V!7030 (val!2813 Int)) )
))
(declare-datatypes ((ValueCell!2425 0))(
  ( (ValueCellFull!2425 (v!4831 V!7029)) (EmptyCell!2425) )
))
(declare-datatypes ((array!10285 0))(
  ( (array!10286 (arr!4878 (Array (_ BitVec 32) ValueCell!2425)) (size!5205 (_ BitVec 32))) )
))
(declare-datatypes ((array!10287 0))(
  ( (array!10288 (arr!4879 (Array (_ BitVec 32) (_ BitVec 64))) (size!5206 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2750 0))(
  ( (LongMapFixedSize!2751 (defaultEntry!4025 Int) (mask!9684 (_ BitVec 32)) (extraKeys!3762 (_ BitVec 32)) (zeroValue!3866 V!7029) (minValue!3866 V!7029) (_size!1424 (_ BitVec 32)) (_keys!6043 array!10287) (_values!4008 array!10285) (_vacant!1424 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2750)

(assert (=> b!214430 (= res!104976 (and (bvsge (mask!9684 thiss!1504) #b00000000000000000000000000000000) (= (size!5206 (_keys!6043 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9684 thiss!1504)))))))

(declare-fun b!214431 () Bool)

(declare-fun res!104975 () Bool)

(assert (=> b!214431 (=> (not res!104975) (not e!139460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214431 (= res!104975 (validMask!0 (mask!9684 thiss!1504)))))

(declare-fun b!214432 () Bool)

(declare-fun e!139459 () Bool)

(declare-fun tp_is_empty!5537 () Bool)

(assert (=> b!214432 (= e!139459 tp_is_empty!5537)))

(declare-fun e!139463 () Bool)

(declare-fun e!139461 () Bool)

(declare-fun array_inv!3225 (array!10287) Bool)

(declare-fun array_inv!3226 (array!10285) Bool)

(assert (=> b!214433 (= e!139463 (and tp!20113 tp_is_empty!5537 (array_inv!3225 (_keys!6043 thiss!1504)) (array_inv!3226 (_values!4008 thiss!1504)) e!139461))))

(declare-fun b!214434 () Bool)

(declare-fun e!139464 () Bool)

(assert (=> b!214434 (= e!139464 tp_is_empty!5537)))

(declare-fun b!214435 () Bool)

(declare-fun mapRes!9421 () Bool)

(assert (=> b!214435 (= e!139461 (and e!139459 mapRes!9421))))

(declare-fun condMapEmpty!9421 () Bool)

(declare-fun mapDefault!9421 () ValueCell!2425)

