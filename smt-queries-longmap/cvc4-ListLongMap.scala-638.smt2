; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16180 () Bool)

(assert start!16180)

(declare-fun b!161346 () Bool)

(declare-fun b_free!3641 () Bool)

(declare-fun b_next!3641 () Bool)

(assert (=> b!161346 (= b_free!3641 (not b_next!3641))))

(declare-fun tp!13493 () Bool)

(declare-fun b_and!10055 () Bool)

(assert (=> b!161346 (= tp!13493 b_and!10055)))

(declare-fun b!161342 () Bool)

(declare-fun e!105438 () Bool)

(declare-fun tp_is_empty!3443 () Bool)

(assert (=> b!161342 (= e!105438 tp_is_empty!3443)))

(declare-fun b!161343 () Bool)

(declare-fun e!105434 () Bool)

(declare-fun e!105435 () Bool)

(declare-fun mapRes!5852 () Bool)

(assert (=> b!161343 (= e!105434 (and e!105435 mapRes!5852))))

(declare-fun condMapEmpty!5852 () Bool)

(declare-datatypes ((V!4237 0))(
  ( (V!4238 (val!1766 Int)) )
))
(declare-datatypes ((ValueCell!1378 0))(
  ( (ValueCellFull!1378 (v!3631 V!4237)) (EmptyCell!1378) )
))
(declare-datatypes ((array!5965 0))(
  ( (array!5966 (arr!2827 (Array (_ BitVec 32) (_ BitVec 64))) (size!3111 (_ BitVec 32))) )
))
(declare-datatypes ((array!5967 0))(
  ( (array!5968 (arr!2828 (Array (_ BitVec 32) ValueCell!1378)) (size!3112 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1664 0))(
  ( (LongMapFixedSize!1665 (defaultEntry!3274 Int) (mask!7862 (_ BitVec 32)) (extraKeys!3015 (_ BitVec 32)) (zeroValue!3117 V!4237) (minValue!3117 V!4237) (_size!881 (_ BitVec 32)) (_keys!5075 array!5965) (_values!3257 array!5967) (_vacant!881 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1664)

(declare-fun mapDefault!5852 () ValueCell!1378)

