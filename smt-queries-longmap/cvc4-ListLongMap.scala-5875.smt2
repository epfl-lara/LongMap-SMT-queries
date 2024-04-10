; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75784 () Bool)

(assert start!75784)

(declare-fun b!891334 () Bool)

(declare-fun b_free!15755 () Bool)

(declare-fun b_next!15755 () Bool)

(assert (=> b!891334 (= b_free!15755 (not b_next!15755))))

(declare-fun tp!55234 () Bool)

(declare-fun b_and!25995 () Bool)

(assert (=> b!891334 (= tp!55234 b_and!25995)))

(declare-fun b!891331 () Bool)

(declare-fun e!497354 () Bool)

(declare-fun e!497358 () Bool)

(declare-fun mapRes!28679 () Bool)

(assert (=> b!891331 (= e!497354 (and e!497358 mapRes!28679))))

(declare-fun condMapEmpty!28679 () Bool)

(declare-datatypes ((array!52146 0))(
  ( (array!52147 (arr!25079 (Array (_ BitVec 32) (_ BitVec 64))) (size!25523 (_ BitVec 32))) )
))
(declare-datatypes ((V!29075 0))(
  ( (V!29076 (val!9092 Int)) )
))
(declare-datatypes ((ValueCell!8560 0))(
  ( (ValueCellFull!8560 (v!11570 V!29075)) (EmptyCell!8560) )
))
(declare-datatypes ((array!52148 0))(
  ( (array!52149 (arr!25080 (Array (_ BitVec 32) ValueCell!8560)) (size!25524 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4136 0))(
  ( (LongMapFixedSize!4137 (defaultEntry!5265 Int) (mask!25756 (_ BitVec 32)) (extraKeys!4959 (_ BitVec 32)) (zeroValue!5063 V!29075) (minValue!5063 V!29075) (_size!2123 (_ BitVec 32)) (_keys!9948 array!52146) (_values!5250 array!52148) (_vacant!2123 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4136)

(declare-fun mapDefault!28679 () ValueCell!8560)

