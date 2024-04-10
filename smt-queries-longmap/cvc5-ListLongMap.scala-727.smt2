; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16954 () Bool)

(assert start!16954)

(declare-fun b!170446 () Bool)

(declare-fun b_free!4201 () Bool)

(declare-fun b_next!4201 () Bool)

(assert (=> b!170446 (= b_free!4201 (not b_next!4201))))

(declare-fun tp!15227 () Bool)

(declare-fun b_and!10615 () Bool)

(assert (=> b!170446 (= tp!15227 b_and!10615)))

(declare-fun b!170443 () Bool)

(declare-fun e!112467 () Bool)

(declare-fun e!112469 () Bool)

(declare-fun mapRes!6746 () Bool)

(assert (=> b!170443 (= e!112467 (and e!112469 mapRes!6746))))

(declare-fun condMapEmpty!6746 () Bool)

(declare-datatypes ((V!4945 0))(
  ( (V!4946 (val!2031 Int)) )
))
(declare-datatypes ((ValueCell!1643 0))(
  ( (ValueCellFull!1643 (v!3896 V!4945)) (EmptyCell!1643) )
))
(declare-datatypes ((array!7055 0))(
  ( (array!7056 (arr!3357 (Array (_ BitVec 32) (_ BitVec 64))) (size!3650 (_ BitVec 32))) )
))
(declare-datatypes ((array!7057 0))(
  ( (array!7058 (arr!3358 (Array (_ BitVec 32) ValueCell!1643)) (size!3651 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2194 0))(
  ( (LongMapFixedSize!2195 (defaultEntry!3539 Int) (mask!8353 (_ BitVec 32)) (extraKeys!3280 (_ BitVec 32)) (zeroValue!3382 V!4945) (minValue!3382 V!4945) (_size!1146 (_ BitVec 32)) (_keys!5369 array!7055) (_values!3522 array!7057) (_vacant!1146 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2194)

(declare-fun mapDefault!6746 () ValueCell!1643)
