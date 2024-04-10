; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16810 () Bool)

(assert start!16810)

(declare-fun b!169429 () Bool)

(declare-fun b_free!4131 () Bool)

(declare-fun b_next!4131 () Bool)

(assert (=> b!169429 (= b_free!4131 (not b_next!4131))))

(declare-fun tp!15000 () Bool)

(declare-fun b_and!10545 () Bool)

(assert (=> b!169429 (= tp!15000 b_and!10545)))

(declare-fun b!169425 () Bool)

(declare-fun b_free!4133 () Bool)

(declare-fun b_next!4133 () Bool)

(assert (=> b!169425 (= b_free!4133 (not b_next!4133))))

(declare-fun tp!14997 () Bool)

(declare-fun b_and!10547 () Bool)

(assert (=> b!169425 (= tp!14997 b_and!10547)))

(declare-fun b!169419 () Bool)

(declare-fun res!80595 () Bool)

(declare-fun e!111635 () Bool)

(assert (=> b!169419 (=> (not res!80595) (not e!111635))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169419 (= res!80595 (not (= key!828 (bvneg key!828))))))

(declare-fun b!169420 () Bool)

(declare-fun e!111634 () Bool)

(declare-fun e!111644 () Bool)

(declare-fun mapRes!6620 () Bool)

(assert (=> b!169420 (= e!111634 (and e!111644 mapRes!6620))))

(declare-fun condMapEmpty!6621 () Bool)

(declare-datatypes ((V!4869 0))(
  ( (V!4870 (val!2003 Int)) )
))
(declare-datatypes ((ValueCell!1615 0))(
  ( (ValueCellFull!1615 (v!3868 V!4869)) (EmptyCell!1615) )
))
(declare-datatypes ((array!6931 0))(
  ( (array!6932 (arr!3301 (Array (_ BitVec 32) (_ BitVec 64))) (size!3589 (_ BitVec 32))) )
))
(declare-datatypes ((array!6933 0))(
  ( (array!6934 (arr!3302 (Array (_ BitVec 32) ValueCell!1615)) (size!3590 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2138 0))(
  ( (LongMapFixedSize!2139 (defaultEntry!3511 Int) (mask!8294 (_ BitVec 32)) (extraKeys!3252 (_ BitVec 32)) (zeroValue!3354 V!4869) (minValue!3354 V!4869) (_size!1118 (_ BitVec 32)) (_keys!5336 array!6931) (_values!3494 array!6933) (_vacant!1118 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3218 0))(
  ( (tuple2!3219 (_1!1620 Bool) (_2!1620 LongMapFixedSize!2138)) )
))
(declare-fun err!71 () tuple2!3218)

(declare-fun mapDefault!6621 () ValueCell!1615)

