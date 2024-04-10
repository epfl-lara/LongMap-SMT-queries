; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78498 () Bool)

(assert start!78498)

(declare-fun mapNonEmpty!30585 () Bool)

(declare-fun mapRes!30585 () Bool)

(declare-fun tp!58652 () Bool)

(declare-fun e!513552 () Bool)

(assert (=> mapNonEmpty!30585 (= mapRes!30585 (and tp!58652 e!513552))))

(declare-datatypes ((V!30591 0))(
  ( (V!30592 (val!9660 Int)) )
))
(declare-datatypes ((ValueCell!9128 0))(
  ( (ValueCellFull!9128 (v!12178 V!30591)) (EmptyCell!9128) )
))
(declare-fun mapRest!30585 () (Array (_ BitVec 32) ValueCell!9128))

(declare-fun mapKey!30585 () (_ BitVec 32))

(declare-fun mapValue!30585 () ValueCell!9128)

(declare-datatypes ((array!54438 0))(
  ( (array!54439 (arr!26164 (Array (_ BitVec 32) ValueCell!9128)) (size!26623 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54438)

(assert (=> mapNonEmpty!30585 (= (arr!26164 _values!1231) (store mapRest!30585 mapKey!30585 mapValue!30585))))

(declare-fun res!617075 () Bool)

(declare-fun e!513555 () Bool)

(assert (=> start!78498 (=> (not res!617075) (not e!513555))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78498 (= res!617075 (validMask!0 mask!1881))))

(assert (=> start!78498 e!513555))

(assert (=> start!78498 true))

(declare-fun e!513556 () Bool)

(declare-fun array_inv!20428 (array!54438) Bool)

(assert (=> start!78498 (and (array_inv!20428 _values!1231) e!513556)))

(declare-datatypes ((array!54440 0))(
  ( (array!54441 (arr!26165 (Array (_ BitVec 32) (_ BitVec 64))) (size!26624 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54440)

(declare-fun array_inv!20429 (array!54440) Bool)

(assert (=> start!78498 (array_inv!20429 _keys!1487)))

(declare-fun b!915174 () Bool)

(assert (=> b!915174 (= e!513555 false)))

(declare-fun lt!411628 () Bool)

(declare-datatypes ((List!18362 0))(
  ( (Nil!18359) (Cons!18358 (h!19504 (_ BitVec 64)) (t!25975 List!18362)) )
))
(declare-fun arrayNoDuplicates!0 (array!54440 (_ BitVec 32) List!18362) Bool)

(assert (=> b!915174 (= lt!411628 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18359))))

(declare-fun b!915175 () Bool)

(declare-fun e!513554 () Bool)

(assert (=> b!915175 (= e!513556 (and e!513554 mapRes!30585))))

(declare-fun condMapEmpty!30585 () Bool)

(declare-fun mapDefault!30585 () ValueCell!9128)

