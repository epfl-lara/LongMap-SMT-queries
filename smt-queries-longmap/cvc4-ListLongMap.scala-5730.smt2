; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74180 () Bool)

(assert start!74180)

(declare-fun b!872593 () Bool)

(declare-fun e!485948 () Bool)

(declare-fun e!485950 () Bool)

(declare-fun mapRes!27431 () Bool)

(assert (=> b!872593 (= e!485948 (and e!485950 mapRes!27431))))

(declare-fun condMapEmpty!27431 () Bool)

(declare-datatypes ((V!28005 0))(
  ( (V!28006 (val!8657 Int)) )
))
(declare-datatypes ((ValueCell!8170 0))(
  ( (ValueCellFull!8170 (v!11082 V!28005)) (EmptyCell!8170) )
))
(declare-datatypes ((array!50572 0))(
  ( (array!50573 (arr!24316 (Array (_ BitVec 32) ValueCell!8170)) (size!24756 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50572)

(declare-fun mapDefault!27431 () ValueCell!8170)

