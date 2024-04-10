; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16312 () Bool)

(assert start!16312)

(declare-fun b!162786 () Bool)

(declare-fun b_free!3773 () Bool)

(declare-fun b_next!3773 () Bool)

(assert (=> b!162786 (= b_free!3773 (not b_next!3773))))

(declare-fun tp!13888 () Bool)

(declare-fun b_and!10187 () Bool)

(assert (=> b!162786 (= tp!13888 b_and!10187)))

(declare-fun b!162784 () Bool)

(declare-fun res!77088 () Bool)

(declare-fun e!106783 () Bool)

(assert (=> b!162784 (=> (not res!77088) (not e!106783))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162784 (= res!77088 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162785 () Bool)

(declare-fun e!106787 () Bool)

(declare-fun e!106788 () Bool)

(declare-fun mapRes!6050 () Bool)

(assert (=> b!162785 (= e!106787 (and e!106788 mapRes!6050))))

(declare-fun condMapEmpty!6050 () Bool)

(declare-datatypes ((V!4413 0))(
  ( (V!4414 (val!1832 Int)) )
))
(declare-datatypes ((ValueCell!1444 0))(
  ( (ValueCellFull!1444 (v!3697 V!4413)) (EmptyCell!1444) )
))
(declare-datatypes ((array!6229 0))(
  ( (array!6230 (arr!2959 (Array (_ BitVec 32) (_ BitVec 64))) (size!3243 (_ BitVec 32))) )
))
(declare-datatypes ((array!6231 0))(
  ( (array!6232 (arr!2960 (Array (_ BitVec 32) ValueCell!1444)) (size!3244 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1796 0))(
  ( (LongMapFixedSize!1797 (defaultEntry!3340 Int) (mask!7972 (_ BitVec 32)) (extraKeys!3081 (_ BitVec 32)) (zeroValue!3183 V!4413) (minValue!3183 V!4413) (_size!947 (_ BitVec 32)) (_keys!5141 array!6229) (_values!3323 array!6231) (_vacant!947 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1796)

(declare-fun mapDefault!6050 () ValueCell!1444)

