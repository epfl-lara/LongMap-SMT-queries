; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40436 () Bool)

(assert start!40436)

(declare-fun b!444848 () Bool)

(declare-fun res!263851 () Bool)

(declare-fun e!261564 () Bool)

(assert (=> b!444848 (=> (not res!263851) (not e!261564))))

(declare-datatypes ((array!27449 0))(
  ( (array!27450 (arr!13172 (Array (_ BitVec 32) (_ BitVec 64))) (size!13524 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27449)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444848 (= res!263851 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!444849 () Bool)

(declare-fun e!261562 () Bool)

(declare-fun e!261561 () Bool)

(declare-fun mapRes!19359 () Bool)

(assert (=> b!444849 (= e!261562 (and e!261561 mapRes!19359))))

(declare-fun condMapEmpty!19359 () Bool)

(declare-datatypes ((V!16867 0))(
  ( (V!16868 (val!5955 Int)) )
))
(declare-datatypes ((ValueCell!5567 0))(
  ( (ValueCellFull!5567 (v!8206 V!16867)) (EmptyCell!5567) )
))
(declare-datatypes ((array!27451 0))(
  ( (array!27452 (arr!13173 (Array (_ BitVec 32) ValueCell!5567)) (size!13525 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27451)

(declare-fun mapDefault!19359 () ValueCell!5567)

