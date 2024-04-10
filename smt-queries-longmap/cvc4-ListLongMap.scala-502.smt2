; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11648 () Bool)

(assert start!11648)

(declare-fun b!97365 () Bool)

(declare-fun b_free!2421 () Bool)

(declare-fun b_next!2421 () Bool)

(assert (=> b!97365 (= b_free!2421 (not b_next!2421))))

(declare-fun tp!9548 () Bool)

(declare-fun b_and!5971 () Bool)

(assert (=> b!97365 (= tp!9548 b_and!5971)))

(declare-fun b!97354 () Bool)

(declare-fun b_free!2423 () Bool)

(declare-fun b_next!2423 () Bool)

(assert (=> b!97354 (= b_free!2423 (not b_next!2423))))

(declare-fun tp!9545 () Bool)

(declare-fun b_and!5973 () Bool)

(assert (=> b!97354 (= tp!9545 b_and!5973)))

(declare-fun b!97348 () Bool)

(declare-fun e!63480 () Bool)

(declare-fun e!63483 () Bool)

(declare-fun mapRes!3734 () Bool)

(assert (=> b!97348 (= e!63480 (and e!63483 mapRes!3734))))

(declare-fun condMapEmpty!3733 () Bool)

(declare-datatypes ((V!3149 0))(
  ( (V!3150 (val!1358 Int)) )
))
(declare-datatypes ((array!4233 0))(
  ( (array!4234 (arr!2011 (Array (_ BitVec 32) (_ BitVec 64))) (size!2261 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!970 0))(
  ( (ValueCellFull!970 (v!2795 V!3149)) (EmptyCell!970) )
))
(declare-datatypes ((array!4235 0))(
  ( (array!4236 (arr!2012 (Array (_ BitVec 32) ValueCell!970)) (size!2262 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!848 0))(
  ( (LongMapFixedSize!849 (defaultEntry!2479 Int) (mask!6574 (_ BitVec 32)) (extraKeys!2300 (_ BitVec 32)) (zeroValue!2362 V!3149) (minValue!2362 V!3149) (_size!473 (_ BitVec 32)) (_keys!4169 array!4233) (_values!2462 array!4235) (_vacant!473 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!648 0))(
  ( (Cell!649 (v!2796 LongMapFixedSize!848)) )
))
(declare-datatypes ((LongMap!648 0))(
  ( (LongMap!649 (underlying!335 Cell!648)) )
))
(declare-fun thiss!992 () LongMap!648)

(declare-fun mapDefault!3733 () ValueCell!970)

