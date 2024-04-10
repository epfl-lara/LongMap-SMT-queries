; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16952 () Bool)

(assert start!16952)

(declare-fun b!170423 () Bool)

(declare-fun b_free!4199 () Bool)

(declare-fun b_next!4199 () Bool)

(assert (=> b!170423 (= b_free!4199 (not b_next!4199))))

(declare-fun tp!15221 () Bool)

(declare-fun b_and!10613 () Bool)

(assert (=> b!170423 (= tp!15221 b_and!10613)))

(declare-fun res!81016 () Bool)

(declare-fun e!112452 () Bool)

(assert (=> start!16952 (=> (not res!81016) (not e!112452))))

(declare-datatypes ((V!4941 0))(
  ( (V!4942 (val!2030 Int)) )
))
(declare-datatypes ((ValueCell!1642 0))(
  ( (ValueCellFull!1642 (v!3895 V!4941)) (EmptyCell!1642) )
))
(declare-datatypes ((array!7051 0))(
  ( (array!7052 (arr!3355 (Array (_ BitVec 32) (_ BitVec 64))) (size!3648 (_ BitVec 32))) )
))
(declare-datatypes ((array!7053 0))(
  ( (array!7054 (arr!3356 (Array (_ BitVec 32) ValueCell!1642)) (size!3649 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2192 0))(
  ( (LongMapFixedSize!2193 (defaultEntry!3538 Int) (mask!8350 (_ BitVec 32)) (extraKeys!3279 (_ BitVec 32)) (zeroValue!3381 V!4941) (minValue!3381 V!4941) (_size!1145 (_ BitVec 32)) (_keys!5368 array!7051) (_values!3521 array!7053) (_vacant!1145 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2192)

(declare-fun valid!938 (LongMapFixedSize!2192) Bool)

(assert (=> start!16952 (= res!81016 (valid!938 thiss!1248))))

(assert (=> start!16952 e!112452))

(declare-fun e!112448 () Bool)

(assert (=> start!16952 e!112448))

(assert (=> start!16952 true))

(declare-fun b!170422 () Bool)

(declare-fun e!112451 () Bool)

(declare-fun tp_is_empty!3971 () Bool)

(assert (=> b!170422 (= e!112451 tp_is_empty!3971)))

(declare-fun e!112450 () Bool)

(declare-fun array_inv!2147 (array!7051) Bool)

(declare-fun array_inv!2148 (array!7053) Bool)

(assert (=> b!170423 (= e!112448 (and tp!15221 tp_is_empty!3971 (array_inv!2147 (_keys!5368 thiss!1248)) (array_inv!2148 (_values!3521 thiss!1248)) e!112450))))

(declare-fun b!170424 () Bool)

(declare-fun e!112447 () Bool)

(declare-fun mapRes!6743 () Bool)

(assert (=> b!170424 (= e!112450 (and e!112447 mapRes!6743))))

(declare-fun condMapEmpty!6743 () Bool)

(declare-fun mapDefault!6743 () ValueCell!1642)

