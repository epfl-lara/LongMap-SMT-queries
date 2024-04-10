; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21694 () Bool)

(assert start!21694)

(declare-fun b!217925 () Bool)

(declare-fun b_free!5843 () Bool)

(declare-fun b_next!5843 () Bool)

(assert (=> b!217925 (= b_free!5843 (not b_next!5843))))

(declare-fun tp!20663 () Bool)

(declare-fun b_and!12733 () Bool)

(assert (=> b!217925 (= tp!20663 b_and!12733)))

(declare-fun mapIsEmpty!9720 () Bool)

(declare-fun mapRes!9720 () Bool)

(assert (=> mapIsEmpty!9720 mapRes!9720))

(declare-fun b!217921 () Bool)

(declare-fun e!141760 () Bool)

(declare-fun e!141763 () Bool)

(assert (=> b!217921 (= e!141760 (and e!141763 mapRes!9720))))

(declare-fun condMapEmpty!9720 () Bool)

(declare-datatypes ((V!7253 0))(
  ( (V!7254 (val!2897 Int)) )
))
(declare-datatypes ((ValueCell!2509 0))(
  ( (ValueCellFull!2509 (v!4915 V!7253)) (EmptyCell!2509) )
))
(declare-datatypes ((array!10649 0))(
  ( (array!10650 (arr!5046 (Array (_ BitVec 32) ValueCell!2509)) (size!5378 (_ BitVec 32))) )
))
(declare-datatypes ((array!10651 0))(
  ( (array!10652 (arr!5047 (Array (_ BitVec 32) (_ BitVec 64))) (size!5379 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2918 0))(
  ( (LongMapFixedSize!2919 (defaultEntry!4109 Int) (mask!9874 (_ BitVec 32)) (extraKeys!3846 (_ BitVec 32)) (zeroValue!3950 V!7253) (minValue!3950 V!7253) (_size!1508 (_ BitVec 32)) (_keys!6158 array!10651) (_values!4092 array!10649) (_vacant!1508 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2918)

(declare-fun mapDefault!9720 () ValueCell!2509)

