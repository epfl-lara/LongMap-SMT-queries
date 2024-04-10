; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20250 () Bool)

(assert start!20250)

(declare-fun b_free!4909 () Bool)

(declare-fun b_next!4909 () Bool)

(assert (=> start!20250 (= b_free!4909 (not b_next!4909))))

(declare-fun tp!17758 () Bool)

(declare-fun b_and!11655 () Bool)

(assert (=> start!20250 (= tp!17758 b_and!11655)))

(declare-fun b!199184 () Bool)

(declare-fun res!94612 () Bool)

(declare-fun e!130796 () Bool)

(assert (=> b!199184 (=> (not res!94612) (not e!130796))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8771 0))(
  ( (array!8772 (arr!4136 (Array (_ BitVec 32) (_ BitVec 64))) (size!4461 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8771)

(assert (=> b!199184 (= res!94612 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4461 _keys!825))))))

(declare-fun b!199185 () Bool)

(declare-fun e!130797 () Bool)

(declare-fun tp_is_empty!4765 () Bool)

(assert (=> b!199185 (= e!130797 tp_is_empty!4765)))

(declare-fun b!199186 () Bool)

(declare-fun e!130798 () Bool)

(declare-fun e!130799 () Bool)

(declare-fun mapRes!8216 () Bool)

(assert (=> b!199186 (= e!130798 (and e!130799 mapRes!8216))))

(declare-fun condMapEmpty!8216 () Bool)

(declare-datatypes ((V!6001 0))(
  ( (V!6002 (val!2427 Int)) )
))
(declare-datatypes ((ValueCell!2039 0))(
  ( (ValueCellFull!2039 (v!4397 V!6001)) (EmptyCell!2039) )
))
(declare-datatypes ((array!8773 0))(
  ( (array!8774 (arr!4137 (Array (_ BitVec 32) ValueCell!2039)) (size!4462 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8773)

(declare-fun mapDefault!8216 () ValueCell!2039)

