; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16162 () Bool)

(assert start!16162)

(declare-fun b!161084 () Bool)

(declare-fun b_free!3623 () Bool)

(declare-fun b_next!3623 () Bool)

(assert (=> b!161084 (= b_free!3623 (not b_next!3623))))

(declare-fun tp!13439 () Bool)

(declare-fun b_and!10037 () Bool)

(assert (=> b!161084 (= tp!13439 b_and!10037)))

(declare-fun mapIsEmpty!5825 () Bool)

(declare-fun mapRes!5825 () Bool)

(assert (=> mapIsEmpty!5825 mapRes!5825))

(declare-fun b!161079 () Bool)

(declare-fun e!105258 () Bool)

(declare-fun tp_is_empty!3425 () Bool)

(assert (=> b!161079 (= e!105258 tp_is_empty!3425)))

(declare-fun b!161080 () Bool)

(declare-fun e!105254 () Bool)

(assert (=> b!161080 (= e!105254 (and e!105258 mapRes!5825))))

(declare-fun condMapEmpty!5825 () Bool)

(declare-datatypes ((V!4213 0))(
  ( (V!4214 (val!1757 Int)) )
))
(declare-datatypes ((ValueCell!1369 0))(
  ( (ValueCellFull!1369 (v!3622 V!4213)) (EmptyCell!1369) )
))
(declare-datatypes ((array!5929 0))(
  ( (array!5930 (arr!2809 (Array (_ BitVec 32) (_ BitVec 64))) (size!3093 (_ BitVec 32))) )
))
(declare-datatypes ((array!5931 0))(
  ( (array!5932 (arr!2810 (Array (_ BitVec 32) ValueCell!1369)) (size!3094 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1646 0))(
  ( (LongMapFixedSize!1647 (defaultEntry!3265 Int) (mask!7847 (_ BitVec 32)) (extraKeys!3006 (_ BitVec 32)) (zeroValue!3108 V!4213) (minValue!3108 V!4213) (_size!872 (_ BitVec 32)) (_keys!5066 array!5929) (_values!3248 array!5931) (_vacant!872 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1646)

(declare-fun mapDefault!5825 () ValueCell!1369)

