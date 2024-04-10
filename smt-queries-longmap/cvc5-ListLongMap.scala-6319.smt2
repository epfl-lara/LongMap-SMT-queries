; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81200 () Bool)

(assert start!81200)

(declare-fun b!950196 () Bool)

(declare-fun b_free!18235 () Bool)

(declare-fun b_next!18235 () Bool)

(assert (=> b!950196 (= b_free!18235 (not b_next!18235))))

(declare-fun tp!63300 () Bool)

(declare-fun b_and!29691 () Bool)

(assert (=> b!950196 (= tp!63300 b_and!29691)))

(declare-fun b!950194 () Bool)

(declare-fun e!534958 () Bool)

(declare-fun e!534959 () Bool)

(declare-fun mapRes!33026 () Bool)

(assert (=> b!950194 (= e!534958 (and e!534959 mapRes!33026))))

(declare-fun condMapEmpty!33026 () Bool)

(declare-datatypes ((V!32623 0))(
  ( (V!32624 (val!10422 Int)) )
))
(declare-datatypes ((ValueCell!9890 0))(
  ( (ValueCellFull!9890 (v!12965 V!32623)) (EmptyCell!9890) )
))
(declare-datatypes ((array!57504 0))(
  ( (array!57505 (arr!27652 (Array (_ BitVec 32) ValueCell!9890)) (size!28129 (_ BitVec 32))) )
))
(declare-datatypes ((array!57506 0))(
  ( (array!57507 (arr!27653 (Array (_ BitVec 32) (_ BitVec 64))) (size!28130 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4930 0))(
  ( (LongMapFixedSize!4931 (defaultEntry!5776 Int) (mask!27574 (_ BitVec 32)) (extraKeys!5508 (_ BitVec 32)) (zeroValue!5612 V!32623) (minValue!5612 V!32623) (_size!2520 (_ BitVec 32)) (_keys!10712 array!57506) (_values!5799 array!57504) (_vacant!2520 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4930)

(declare-fun mapDefault!33026 () ValueCell!9890)

