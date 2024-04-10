; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76952 () Bool)

(assert start!76952)

(declare-fun b!899294 () Bool)

(declare-fun b_free!16031 () Bool)

(declare-fun b_next!16031 () Bool)

(assert (=> b!899294 (= b_free!16031 (not b_next!16031))))

(declare-fun tp!56169 () Bool)

(declare-fun b_and!26337 () Bool)

(assert (=> b!899294 (= tp!56169 b_and!26337)))

(declare-fun b!899292 () Bool)

(declare-fun e!503175 () Bool)

(declare-fun e!503180 () Bool)

(declare-fun mapRes!29201 () Bool)

(assert (=> b!899292 (= e!503175 (and e!503180 mapRes!29201))))

(declare-fun condMapEmpty!29201 () Bool)

(declare-datatypes ((array!52760 0))(
  ( (array!52761 (arr!25355 (Array (_ BitVec 32) (_ BitVec 64))) (size!25812 (_ BitVec 32))) )
))
(declare-datatypes ((V!29443 0))(
  ( (V!29444 (val!9230 Int)) )
))
(declare-datatypes ((ValueCell!8698 0))(
  ( (ValueCellFull!8698 (v!11723 V!29443)) (EmptyCell!8698) )
))
(declare-datatypes ((array!52762 0))(
  ( (array!52763 (arr!25356 (Array (_ BitVec 32) ValueCell!8698)) (size!25813 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4412 0))(
  ( (LongMapFixedSize!4413 (defaultEntry!5428 Int) (mask!26180 (_ BitVec 32)) (extraKeys!5148 (_ BitVec 32)) (zeroValue!5252 V!29443) (minValue!5252 V!29443) (_size!2261 (_ BitVec 32)) (_keys!10215 array!52760) (_values!5439 array!52762) (_vacant!2261 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4412)

(declare-fun mapDefault!29201 () ValueCell!8698)

