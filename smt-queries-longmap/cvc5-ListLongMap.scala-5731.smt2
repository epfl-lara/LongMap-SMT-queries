; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74182 () Bool)

(assert start!74182)

(declare-fun b!872614 () Bool)

(declare-fun e!485965 () Bool)

(declare-fun e!485964 () Bool)

(declare-fun mapRes!27434 () Bool)

(assert (=> b!872614 (= e!485965 (and e!485964 mapRes!27434))))

(declare-fun condMapEmpty!27434 () Bool)

(declare-datatypes ((V!28009 0))(
  ( (V!28010 (val!8658 Int)) )
))
(declare-datatypes ((ValueCell!8171 0))(
  ( (ValueCellFull!8171 (v!11083 V!28009)) (EmptyCell!8171) )
))
(declare-datatypes ((array!50574 0))(
  ( (array!50575 (arr!24317 (Array (_ BitVec 32) ValueCell!8171)) (size!24757 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50574)

(declare-fun mapDefault!27434 () ValueCell!8171)

