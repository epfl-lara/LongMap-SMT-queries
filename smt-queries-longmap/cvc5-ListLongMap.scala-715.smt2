; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16794 () Bool)

(assert start!16794)

(declare-fun b!169122 () Bool)

(declare-fun b_free!4099 () Bool)

(declare-fun b_next!4099 () Bool)

(assert (=> b!169122 (= b_free!4099 (not b_next!4099))))

(declare-fun tp!14901 () Bool)

(declare-fun b_and!10513 () Bool)

(assert (=> b!169122 (= tp!14901 b_and!10513)))

(declare-fun b!169123 () Bool)

(declare-fun b_free!4101 () Bool)

(declare-fun b_next!4101 () Bool)

(assert (=> b!169123 (= b_free!4101 (not b_next!4101))))

(declare-fun tp!14902 () Bool)

(declare-fun b_and!10515 () Bool)

(assert (=> b!169123 (= tp!14902 b_and!10515)))

(declare-fun b!169121 () Bool)

(declare-fun e!111335 () Bool)

(declare-fun e!111330 () Bool)

(declare-fun mapRes!6572 () Bool)

(assert (=> b!169121 (= e!111335 (and e!111330 mapRes!6572))))

(declare-fun condMapEmpty!6573 () Bool)

(declare-datatypes ((V!4849 0))(
  ( (V!4850 (val!1995 Int)) )
))
(declare-datatypes ((ValueCell!1607 0))(
  ( (ValueCellFull!1607 (v!3860 V!4849)) (EmptyCell!1607) )
))
(declare-datatypes ((array!6899 0))(
  ( (array!6900 (arr!3285 (Array (_ BitVec 32) (_ BitVec 64))) (size!3573 (_ BitVec 32))) )
))
(declare-datatypes ((array!6901 0))(
  ( (array!6902 (arr!3286 (Array (_ BitVec 32) ValueCell!1607)) (size!3574 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2122 0))(
  ( (LongMapFixedSize!2123 (defaultEntry!3503 Int) (mask!8282 (_ BitVec 32)) (extraKeys!3244 (_ BitVec 32)) (zeroValue!3346 V!4849) (minValue!3346 V!4849) (_size!1110 (_ BitVec 32)) (_keys!5328 array!6899) (_values!3486 array!6901) (_vacant!1110 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2122)

(declare-fun mapDefault!6572 () ValueCell!1607)

