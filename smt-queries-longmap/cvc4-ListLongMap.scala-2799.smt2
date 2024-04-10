; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40686 () Bool)

(assert start!40686)

(declare-fun b_free!10697 () Bool)

(declare-fun b_next!10697 () Bool)

(assert (=> start!40686 (= b_free!10697 (not b_next!10697))))

(declare-fun tp!37911 () Bool)

(declare-fun b_and!18705 () Bool)

(assert (=> start!40686 (= tp!37911 b_and!18705)))

(declare-fun b!449852 () Bool)

(declare-fun res!267667 () Bool)

(declare-fun e!263696 () Bool)

(assert (=> b!449852 (=> (not res!267667) (not e!263696))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449852 (= res!267667 (bvsle from!863 i!563))))

(declare-fun b!449853 () Bool)

(declare-fun res!267672 () Bool)

(declare-fun e!263695 () Bool)

(assert (=> b!449853 (=> (not res!267672) (not e!263695))))

(declare-datatypes ((array!27877 0))(
  ( (array!27878 (arr!13384 (Array (_ BitVec 32) (_ BitVec 64))) (size!13736 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27877)

(declare-datatypes ((List!8026 0))(
  ( (Nil!8023) (Cons!8022 (h!8878 (_ BitVec 64)) (t!13788 List!8026)) )
))
(declare-fun arrayNoDuplicates!0 (array!27877 (_ BitVec 32) List!8026) Bool)

(assert (=> b!449853 (= res!267672 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8023))))

(declare-fun b!449854 () Bool)

(declare-fun e!263691 () Bool)

(declare-fun e!263694 () Bool)

(declare-fun mapRes!19686 () Bool)

(assert (=> b!449854 (= e!263691 (and e!263694 mapRes!19686))))

(declare-fun condMapEmpty!19686 () Bool)

(declare-datatypes ((V!17151 0))(
  ( (V!17152 (val!6062 Int)) )
))
(declare-datatypes ((ValueCell!5674 0))(
  ( (ValueCellFull!5674 (v!8317 V!17151)) (EmptyCell!5674) )
))
(declare-datatypes ((array!27879 0))(
  ( (array!27880 (arr!13385 (Array (_ BitVec 32) ValueCell!5674)) (size!13737 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27879)

(declare-fun mapDefault!19686 () ValueCell!5674)

