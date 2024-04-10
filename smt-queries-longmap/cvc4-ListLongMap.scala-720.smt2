; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16828 () Bool)

(assert start!16828)

(declare-fun b!169682 () Bool)

(declare-fun b_free!4163 () Bool)

(declare-fun b_next!4163 () Bool)

(assert (=> b!169682 (= b_free!4163 (not b_next!4163))))

(declare-fun tp!15089 () Bool)

(declare-fun b_and!10577 () Bool)

(assert (=> b!169682 (= tp!15089 b_and!10577)))

(declare-fun b!169678 () Bool)

(declare-fun e!111912 () Bool)

(declare-fun e!111914 () Bool)

(declare-fun mapRes!6666 () Bool)

(assert (=> b!169678 (= e!111912 (and e!111914 mapRes!6666))))

(declare-fun condMapEmpty!6666 () Bool)

(declare-datatypes ((V!4893 0))(
  ( (V!4894 (val!2012 Int)) )
))
(declare-datatypes ((ValueCell!1624 0))(
  ( (ValueCellFull!1624 (v!3877 V!4893)) (EmptyCell!1624) )
))
(declare-datatypes ((array!6967 0))(
  ( (array!6968 (arr!3319 (Array (_ BitVec 32) (_ BitVec 64))) (size!3607 (_ BitVec 32))) )
))
(declare-datatypes ((array!6969 0))(
  ( (array!6970 (arr!3320 (Array (_ BitVec 32) ValueCell!1624)) (size!3608 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2156 0))(
  ( (LongMapFixedSize!2157 (defaultEntry!3520 Int) (mask!8309 (_ BitVec 32)) (extraKeys!3261 (_ BitVec 32)) (zeroValue!3363 V!4893) (minValue!3363 V!4893) (_size!1127 (_ BitVec 32)) (_keys!5345 array!6967) (_values!3503 array!6969) (_vacant!1127 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2156)

(declare-fun mapDefault!6666 () ValueCell!1624)

