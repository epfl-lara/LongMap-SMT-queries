; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17186 () Bool)

(assert start!17186)

(declare-fun b!172563 () Bool)

(declare-fun b_free!4265 () Bool)

(declare-fun b_next!4265 () Bool)

(assert (=> b!172563 (= b_free!4265 (not b_next!4265))))

(declare-fun tp!15444 () Bool)

(declare-fun b_and!10705 () Bool)

(assert (=> b!172563 (= tp!15444 b_and!10705)))

(declare-fun b!172561 () Bool)

(declare-fun e!113921 () Bool)

(declare-fun e!113923 () Bool)

(declare-fun mapRes!6868 () Bool)

(assert (=> b!172561 (= e!113921 (and e!113923 mapRes!6868))))

(declare-fun condMapEmpty!6868 () Bool)

(declare-datatypes ((V!5029 0))(
  ( (V!5030 (val!2063 Int)) )
))
(declare-datatypes ((ValueCell!1675 0))(
  ( (ValueCellFull!1675 (v!3931 V!5029)) (EmptyCell!1675) )
))
(declare-datatypes ((array!7197 0))(
  ( (array!7198 (arr!3421 (Array (_ BitVec 32) (_ BitVec 64))) (size!3718 (_ BitVec 32))) )
))
(declare-datatypes ((array!7199 0))(
  ( (array!7200 (arr!3422 (Array (_ BitVec 32) ValueCell!1675)) (size!3719 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2258 0))(
  ( (LongMapFixedSize!2259 (defaultEntry!3575 Int) (mask!8423 (_ BitVec 32)) (extraKeys!3314 (_ BitVec 32)) (zeroValue!3416 V!5029) (minValue!3418 V!5029) (_size!1178 (_ BitVec 32)) (_keys!5412 array!7197) (_values!3558 array!7199) (_vacant!1178 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2258)

(declare-fun mapDefault!6868 () ValueCell!1675)

