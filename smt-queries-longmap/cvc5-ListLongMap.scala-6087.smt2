; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78630 () Bool)

(assert start!78630)

(declare-fun b_free!16843 () Bool)

(declare-fun b_next!16843 () Bool)

(assert (=> start!78630 (= b_free!16843 (not b_next!16843))))

(declare-fun tp!58970 () Bool)

(declare-fun b_and!27465 () Bool)

(assert (=> start!78630 (= tp!58970 b_and!27465)))

(declare-fun b!916647 () Bool)

(declare-fun res!617958 () Bool)

(declare-fun e!514572 () Bool)

(assert (=> b!916647 (=> (not res!617958) (not e!514572))))

(declare-datatypes ((array!54688 0))(
  ( (array!54689 (arr!26289 (Array (_ BitVec 32) (_ BitVec 64))) (size!26748 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54688)

(declare-datatypes ((List!18432 0))(
  ( (Nil!18429) (Cons!18428 (h!19574 (_ BitVec 64)) (t!26045 List!18432)) )
))
(declare-fun arrayNoDuplicates!0 (array!54688 (_ BitVec 32) List!18432) Bool)

(assert (=> b!916647 (= res!617958 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18429))))

(declare-fun b!916648 () Bool)

(declare-fun res!617954 () Bool)

(assert (=> b!916648 (=> (not res!617954) (not e!514572))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54688 (_ BitVec 32)) Bool)

(assert (=> b!916648 (= res!617954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916649 () Bool)

(declare-fun res!617957 () Bool)

(assert (=> b!916649 (=> (not res!617957) (not e!514572))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916649 (= res!617957 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26748 _keys!1487))))))

(declare-fun b!916650 () Bool)

(declare-fun e!514576 () Bool)

(declare-fun e!514575 () Bool)

(declare-fun mapRes!30783 () Bool)

(assert (=> b!916650 (= e!514576 (and e!514575 mapRes!30783))))

(declare-fun condMapEmpty!30783 () Bool)

(declare-datatypes ((V!30767 0))(
  ( (V!30768 (val!9726 Int)) )
))
(declare-datatypes ((ValueCell!9194 0))(
  ( (ValueCellFull!9194 (v!12244 V!30767)) (EmptyCell!9194) )
))
(declare-datatypes ((array!54690 0))(
  ( (array!54691 (arr!26290 (Array (_ BitVec 32) ValueCell!9194)) (size!26749 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54690)

(declare-fun mapDefault!30783 () ValueCell!9194)

