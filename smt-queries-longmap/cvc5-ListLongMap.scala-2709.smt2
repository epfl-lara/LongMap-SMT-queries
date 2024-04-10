; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40072 () Bool)

(assert start!40072)

(declare-fun b_free!10339 () Bool)

(declare-fun b_next!10339 () Bool)

(assert (=> start!40072 (= b_free!10339 (not b_next!10339))))

(declare-fun tp!36546 () Bool)

(declare-fun b_and!18307 () Bool)

(assert (=> start!40072 (= tp!36546 b_and!18307)))

(declare-fun b!437492 () Bool)

(declare-fun e!258207 () Bool)

(declare-fun tp_is_empty!11491 () Bool)

(assert (=> b!437492 (= e!258207 tp_is_empty!11491)))

(declare-fun b!437493 () Bool)

(declare-fun res!258102 () Bool)

(declare-fun e!258201 () Bool)

(assert (=> b!437493 (=> (not res!258102) (not e!258201))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26801 0))(
  ( (array!26802 (arr!12850 (Array (_ BitVec 32) (_ BitVec 64))) (size!13202 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26801)

(assert (=> b!437493 (= res!258102 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13202 _keys!709))))))

(declare-fun b!437494 () Bool)

(declare-fun res!258107 () Bool)

(assert (=> b!437494 (=> (not res!258107) (not e!258201))))

(declare-datatypes ((List!7673 0))(
  ( (Nil!7670) (Cons!7669 (h!8525 (_ BitVec 64)) (t!13429 List!7673)) )
))
(declare-fun arrayNoDuplicates!0 (array!26801 (_ BitVec 32) List!7673) Bool)

(assert (=> b!437494 (= res!258107 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7670))))

(declare-fun b!437495 () Bool)

(declare-fun e!258205 () Bool)

(declare-fun e!258204 () Bool)

(declare-fun mapRes!18858 () Bool)

(assert (=> b!437495 (= e!258205 (and e!258204 mapRes!18858))))

(declare-fun condMapEmpty!18858 () Bool)

(declare-datatypes ((V!16427 0))(
  ( (V!16428 (val!5790 Int)) )
))
(declare-datatypes ((ValueCell!5402 0))(
  ( (ValueCellFull!5402 (v!8037 V!16427)) (EmptyCell!5402) )
))
(declare-datatypes ((array!26803 0))(
  ( (array!26804 (arr!12851 (Array (_ BitVec 32) ValueCell!5402)) (size!13203 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26803)

(declare-fun mapDefault!18858 () ValueCell!5402)

