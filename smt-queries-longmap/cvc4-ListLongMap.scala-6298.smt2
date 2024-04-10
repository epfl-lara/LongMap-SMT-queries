; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80542 () Bool)

(assert start!80542)

(declare-fun b!945685 () Bool)

(declare-fun b_free!18113 () Bool)

(declare-fun b_next!18113 () Bool)

(assert (=> b!945685 (= b_free!18113 (not b_next!18113))))

(declare-fun tp!62862 () Bool)

(declare-fun b_and!29535 () Bool)

(assert (=> b!945685 (= tp!62862 b_and!29535)))

(declare-fun b!945680 () Bool)

(declare-fun e!531959 () Bool)

(declare-fun e!531958 () Bool)

(declare-fun mapRes!32771 () Bool)

(assert (=> b!945680 (= e!531959 (and e!531958 mapRes!32771))))

(declare-fun condMapEmpty!32771 () Bool)

(declare-datatypes ((V!32459 0))(
  ( (V!32460 (val!10361 Int)) )
))
(declare-datatypes ((ValueCell!9829 0))(
  ( (ValueCellFull!9829 (v!12895 V!32459)) (EmptyCell!9829) )
))
(declare-datatypes ((array!57218 0))(
  ( (array!57219 (arr!27530 (Array (_ BitVec 32) ValueCell!9829)) (size!27998 (_ BitVec 32))) )
))
(declare-datatypes ((array!57220 0))(
  ( (array!57221 (arr!27531 (Array (_ BitVec 32) (_ BitVec 64))) (size!27999 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4808 0))(
  ( (LongMapFixedSize!4809 (defaultEntry!5701 Int) (mask!27375 (_ BitVec 32)) (extraKeys!5433 (_ BitVec 32)) (zeroValue!5537 V!32459) (minValue!5537 V!32459) (_size!2459 (_ BitVec 32)) (_keys!10583 array!57220) (_values!5724 array!57218) (_vacant!2459 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4808)

(declare-fun mapDefault!32771 () ValueCell!9829)

