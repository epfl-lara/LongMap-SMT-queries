; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81022 () Bool)

(assert start!81022)

(declare-fun b!948785 () Bool)

(declare-fun b_free!18205 () Bool)

(declare-fun b_next!18205 () Bool)

(assert (=> b!948785 (= b_free!18205 (not b_next!18205))))

(declare-fun tp!63193 () Bool)

(declare-fun b_and!29643 () Bool)

(assert (=> b!948785 (= tp!63193 b_and!29643)))

(declare-fun res!636450 () Bool)

(declare-fun e!534114 () Bool)

(assert (=> start!81022 (=> (not res!636450) (not e!534114))))

(declare-datatypes ((V!32583 0))(
  ( (V!32584 (val!10407 Int)) )
))
(declare-datatypes ((ValueCell!9875 0))(
  ( (ValueCellFull!9875 (v!12945 V!32583)) (EmptyCell!9875) )
))
(declare-datatypes ((array!57434 0))(
  ( (array!57435 (arr!27622 (Array (_ BitVec 32) ValueCell!9875)) (size!28097 (_ BitVec 32))) )
))
(declare-datatypes ((array!57436 0))(
  ( (array!57437 (arr!27623 (Array (_ BitVec 32) (_ BitVec 64))) (size!28098 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4900 0))(
  ( (LongMapFixedSize!4901 (defaultEntry!5754 Int) (mask!27522 (_ BitVec 32)) (extraKeys!5486 (_ BitVec 32)) (zeroValue!5590 V!32583) (minValue!5590 V!32583) (_size!2505 (_ BitVec 32)) (_keys!10677 array!57436) (_values!5777 array!57434) (_vacant!2505 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4900)

(declare-fun valid!1866 (LongMapFixedSize!4900) Bool)

(assert (=> start!81022 (= res!636450 (valid!1866 thiss!1141))))

(assert (=> start!81022 e!534114))

(declare-fun e!534112 () Bool)

(assert (=> start!81022 e!534112))

(assert (=> start!81022 true))

(declare-fun b!948782 () Bool)

(declare-fun e!534115 () Bool)

(declare-fun e!534111 () Bool)

(declare-fun mapRes!32964 () Bool)

(assert (=> b!948782 (= e!534115 (and e!534111 mapRes!32964))))

(declare-fun condMapEmpty!32964 () Bool)

(declare-fun mapDefault!32964 () ValueCell!9875)

