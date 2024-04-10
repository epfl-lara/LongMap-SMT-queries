; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74188 () Bool)

(assert start!74188)

(declare-fun b!872683 () Bool)

(declare-fun e!486006 () Bool)

(declare-fun e!486010 () Bool)

(declare-fun mapRes!27443 () Bool)

(assert (=> b!872683 (= e!486006 (and e!486010 mapRes!27443))))

(declare-fun condMapEmpty!27443 () Bool)

(declare-datatypes ((V!28017 0))(
  ( (V!28018 (val!8661 Int)) )
))
(declare-datatypes ((ValueCell!8174 0))(
  ( (ValueCellFull!8174 (v!11086 V!28017)) (EmptyCell!8174) )
))
(declare-datatypes ((array!50584 0))(
  ( (array!50585 (arr!24322 (Array (_ BitVec 32) ValueCell!8174)) (size!24762 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50584)

(declare-fun mapDefault!27443 () ValueCell!8174)

