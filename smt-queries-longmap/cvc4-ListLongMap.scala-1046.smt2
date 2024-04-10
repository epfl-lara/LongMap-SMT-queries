; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21962 () Bool)

(assert start!21962)

(declare-fun b!224764 () Bool)

(declare-fun b_free!6029 () Bool)

(declare-fun b_next!6029 () Bool)

(assert (=> b!224764 (= b_free!6029 (not b_next!6029))))

(declare-fun tp!21228 () Bool)

(declare-fun b_and!12927 () Bool)

(assert (=> b!224764 (= tp!21228 b_and!12927)))

(declare-fun b!224757 () Bool)

(declare-fun e!145913 () Bool)

(declare-fun e!145908 () Bool)

(declare-fun mapRes!10006 () Bool)

(assert (=> b!224757 (= e!145913 (and e!145908 mapRes!10006))))

(declare-fun condMapEmpty!10006 () Bool)

(declare-datatypes ((V!7501 0))(
  ( (V!7502 (val!2990 Int)) )
))
(declare-datatypes ((ValueCell!2602 0))(
  ( (ValueCellFull!2602 (v!5010 V!7501)) (EmptyCell!2602) )
))
(declare-datatypes ((array!11025 0))(
  ( (array!11026 (arr!5232 (Array (_ BitVec 32) ValueCell!2602)) (size!5565 (_ BitVec 32))) )
))
(declare-datatypes ((array!11027 0))(
  ( (array!11028 (arr!5233 (Array (_ BitVec 32) (_ BitVec 64))) (size!5566 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3104 0))(
  ( (LongMapFixedSize!3105 (defaultEntry!4211 Int) (mask!10047 (_ BitVec 32)) (extraKeys!3948 (_ BitVec 32)) (zeroValue!4052 V!7501) (minValue!4052 V!7501) (_size!1601 (_ BitVec 32)) (_keys!6265 array!11027) (_values!4194 array!11025) (_vacant!1601 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3104)

(declare-fun mapDefault!10006 () ValueCell!2602)

