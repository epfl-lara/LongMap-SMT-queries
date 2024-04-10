; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78484 () Bool)

(assert start!78484)

(declare-fun b!915119 () Bool)

(declare-fun res!617046 () Bool)

(declare-fun e!513507 () Bool)

(assert (=> b!915119 (=> (not res!617046) (not e!513507))))

(declare-datatypes ((array!54432 0))(
  ( (array!54433 (arr!26162 (Array (_ BitVec 32) (_ BitVec 64))) (size!26621 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54432)

(assert (=> b!915119 (= res!617046 (and (bvsle #b00000000000000000000000000000000 (size!26621 _keys!1487)) (bvslt (size!26621 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!915120 () Bool)

(declare-fun e!513511 () Bool)

(declare-fun tp_is_empty!19217 () Bool)

(assert (=> b!915120 (= e!513511 tp_is_empty!19217)))

(declare-fun mapIsEmpty!30579 () Bool)

(declare-fun mapRes!30579 () Bool)

(assert (=> mapIsEmpty!30579 mapRes!30579))

(declare-fun mapNonEmpty!30579 () Bool)

(declare-fun tp!58646 () Bool)

(declare-fun e!513512 () Bool)

(assert (=> mapNonEmpty!30579 (= mapRes!30579 (and tp!58646 e!513512))))

(declare-datatypes ((V!30587 0))(
  ( (V!30588 (val!9659 Int)) )
))
(declare-datatypes ((ValueCell!9127 0))(
  ( (ValueCellFull!9127 (v!12176 V!30587)) (EmptyCell!9127) )
))
(declare-fun mapRest!30579 () (Array (_ BitVec 32) ValueCell!9127))

(declare-datatypes ((array!54434 0))(
  ( (array!54435 (arr!26163 (Array (_ BitVec 32) ValueCell!9127)) (size!26622 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54434)

(declare-fun mapKey!30579 () (_ BitVec 32))

(declare-fun mapValue!30579 () ValueCell!9127)

(assert (=> mapNonEmpty!30579 (= (arr!26163 _values!1231) (store mapRest!30579 mapKey!30579 mapValue!30579))))

(declare-fun b!915121 () Bool)

(declare-fun res!617045 () Bool)

(assert (=> b!915121 (=> (not res!617045) (not e!513507))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915121 (= res!617045 (and (= (size!26622 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26621 _keys!1487) (size!26622 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915122 () Bool)

(declare-fun res!617043 () Bool)

(assert (=> b!915122 (=> (not res!617043) (not e!513507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54432 (_ BitVec 32)) Bool)

(assert (=> b!915122 (= res!617043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617047 () Bool)

(assert (=> start!78484 (=> (not res!617047) (not e!513507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78484 (= res!617047 (validMask!0 mask!1881))))

(assert (=> start!78484 e!513507))

(assert (=> start!78484 true))

(declare-fun e!513508 () Bool)

(declare-fun array_inv!20426 (array!54434) Bool)

(assert (=> start!78484 (and (array_inv!20426 _values!1231) e!513508)))

(declare-fun array_inv!20427 (array!54432) Bool)

(assert (=> start!78484 (array_inv!20427 _keys!1487)))

(declare-fun b!915123 () Bool)

(declare-fun e!513510 () Bool)

(assert (=> b!915123 (= e!513507 e!513510)))

(declare-fun res!617048 () Bool)

(assert (=> b!915123 (=> res!617048 e!513510)))

(declare-datatypes ((List!18361 0))(
  ( (Nil!18358) (Cons!18357 (h!19503 (_ BitVec 64)) (t!25974 List!18361)) )
))
(declare-fun contains!4703 (List!18361 (_ BitVec 64)) Bool)

(assert (=> b!915123 (= res!617048 (contains!4703 Nil!18358 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!915124 () Bool)

(assert (=> b!915124 (= e!513510 (contains!4703 Nil!18358 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!915125 () Bool)

(assert (=> b!915125 (= e!513512 tp_is_empty!19217)))

(declare-fun b!915126 () Bool)

(assert (=> b!915126 (= e!513508 (and e!513511 mapRes!30579))))

(declare-fun condMapEmpty!30579 () Bool)

(declare-fun mapDefault!30579 () ValueCell!9127)

