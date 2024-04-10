; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14670 () Bool)

(assert start!14670)

(declare-fun b!138685 () Bool)

(declare-fun b_free!3001 () Bool)

(declare-fun b_next!3001 () Bool)

(assert (=> b!138685 (= b_free!3001 (not b_next!3001))))

(declare-fun tp!11470 () Bool)

(declare-fun b_and!8635 () Bool)

(assert (=> b!138685 (= tp!11470 b_and!8635)))

(declare-fun b!138693 () Bool)

(declare-fun b_free!3003 () Bool)

(declare-fun b_next!3003 () Bool)

(assert (=> b!138693 (= b_free!3003 (not b_next!3003))))

(declare-fun tp!11471 () Bool)

(declare-fun b_and!8637 () Bool)

(assert (=> b!138693 (= tp!11471 b_and!8637)))

(declare-datatypes ((V!3537 0))(
  ( (V!3538 (val!1503 Int)) )
))
(declare-datatypes ((array!4867 0))(
  ( (array!4868 (arr!2301 (Array (_ BitVec 32) (_ BitVec 64))) (size!2573 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1115 0))(
  ( (ValueCellFull!1115 (v!3264 V!3537)) (EmptyCell!1115) )
))
(declare-datatypes ((array!4869 0))(
  ( (array!4870 (arr!2302 (Array (_ BitVec 32) ValueCell!1115)) (size!2574 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1138 0))(
  ( (LongMapFixedSize!1139 (defaultEntry!2931 Int) (mask!7267 (_ BitVec 32)) (extraKeys!2686 (_ BitVec 32)) (zeroValue!2781 V!3537) (minValue!2781 V!3537) (_size!618 (_ BitVec 32)) (_keys!4690 array!4867) (_values!2914 array!4869) (_vacant!618 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!926 0))(
  ( (Cell!927 (v!3265 LongMapFixedSize!1138)) )
))
(declare-datatypes ((LongMap!926 0))(
  ( (LongMap!927 (underlying!474 Cell!926)) )
))
(declare-fun thiss!992 () LongMap!926)

(declare-fun e!90405 () Bool)

(declare-fun e!90414 () Bool)

(declare-fun tp_is_empty!2917 () Bool)

(declare-fun array_inv!1447 (array!4867) Bool)

(declare-fun array_inv!1448 (array!4869) Bool)

(assert (=> b!138685 (= e!90405 (and tp!11470 tp_is_empty!2917 (array_inv!1447 (_keys!4690 (v!3265 (underlying!474 thiss!992)))) (array_inv!1448 (_values!2914 (v!3265 (underlying!474 thiss!992)))) e!90414))))

(declare-fun b!138686 () Bool)

(declare-fun e!90411 () Bool)

(assert (=> b!138686 (= e!90411 tp_is_empty!2917)))

(declare-fun b!138687 () Bool)

(declare-fun e!90407 () Bool)

(declare-fun mapRes!4787 () Bool)

(assert (=> b!138687 (= e!90407 (and e!90411 mapRes!4787))))

(declare-fun condMapEmpty!4787 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1138)

(declare-fun mapDefault!4788 () ValueCell!1115)

