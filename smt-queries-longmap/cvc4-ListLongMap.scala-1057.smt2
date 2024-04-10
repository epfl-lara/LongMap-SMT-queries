; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22028 () Bool)

(assert start!22028)

(declare-fun b!227208 () Bool)

(declare-fun b_free!6095 () Bool)

(declare-fun b_next!6095 () Bool)

(assert (=> b!227208 (= b_free!6095 (not b_next!6095))))

(declare-fun tp!21427 () Bool)

(declare-fun b_and!12993 () Bool)

(assert (=> b!227208 (= tp!21427 b_and!12993)))

(declare-fun b!227193 () Bool)

(declare-fun e!147392 () Bool)

(declare-fun e!147393 () Bool)

(declare-fun mapRes!10105 () Bool)

(assert (=> b!227193 (= e!147392 (and e!147393 mapRes!10105))))

(declare-fun condMapEmpty!10105 () Bool)

(declare-datatypes ((V!7589 0))(
  ( (V!7590 (val!3023 Int)) )
))
(declare-datatypes ((ValueCell!2635 0))(
  ( (ValueCellFull!2635 (v!5043 V!7589)) (EmptyCell!2635) )
))
(declare-datatypes ((array!11157 0))(
  ( (array!11158 (arr!5298 (Array (_ BitVec 32) ValueCell!2635)) (size!5631 (_ BitVec 32))) )
))
(declare-datatypes ((array!11159 0))(
  ( (array!11160 (arr!5299 (Array (_ BitVec 32) (_ BitVec 64))) (size!5632 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3170 0))(
  ( (LongMapFixedSize!3171 (defaultEntry!4244 Int) (mask!10102 (_ BitVec 32)) (extraKeys!3981 (_ BitVec 32)) (zeroValue!4085 V!7589) (minValue!4085 V!7589) (_size!1634 (_ BitVec 32)) (_keys!6298 array!11159) (_values!4227 array!11157) (_vacant!1634 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3170)

(declare-fun mapDefault!10105 () ValueCell!2635)

