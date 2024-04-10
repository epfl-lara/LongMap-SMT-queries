; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20800 () Bool)

(assert start!20800)

(declare-fun b_free!5453 () Bool)

(declare-fun b_next!5453 () Bool)

(assert (=> start!20800 (= b_free!5453 (not b_next!5453))))

(declare-fun tp!19400 () Bool)

(declare-fun b_and!12199 () Bool)

(assert (=> start!20800 (= tp!19400 b_and!12199)))

(declare-fun b!208460 () Bool)

(declare-fun res!101414 () Bool)

(declare-fun e!135955 () Bool)

(assert (=> b!208460 (=> (not res!101414) (not e!135955))))

(declare-datatypes ((array!9833 0))(
  ( (array!9834 (arr!4667 (Array (_ BitVec 32) (_ BitVec 64))) (size!4992 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9833)

(declare-datatypes ((List!2991 0))(
  ( (Nil!2988) (Cons!2987 (h!3629 (_ BitVec 64)) (t!7922 List!2991)) )
))
(declare-fun arrayNoDuplicates!0 (array!9833 (_ BitVec 32) List!2991) Bool)

(assert (=> b!208460 (= res!101414 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2988))))

(declare-fun b!208461 () Bool)

(declare-fun e!135957 () Bool)

(declare-fun e!135959 () Bool)

(declare-fun mapRes!9041 () Bool)

(assert (=> b!208461 (= e!135957 (and e!135959 mapRes!9041))))

(declare-fun condMapEmpty!9041 () Bool)

(declare-datatypes ((V!6733 0))(
  ( (V!6734 (val!2702 Int)) )
))
(declare-datatypes ((ValueCell!2314 0))(
  ( (ValueCellFull!2314 (v!4672 V!6733)) (EmptyCell!2314) )
))
(declare-datatypes ((array!9835 0))(
  ( (array!9836 (arr!4668 (Array (_ BitVec 32) ValueCell!2314)) (size!4993 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9835)

(declare-fun mapDefault!9041 () ValueCell!2314)

