; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78514 () Bool)

(assert start!78514)

(declare-fun b!915318 () Bool)

(declare-fun res!617148 () Bool)

(declare-fun e!513676 () Bool)

(assert (=> b!915318 (=> (not res!617148) (not e!513676))))

(declare-datatypes ((array!54468 0))(
  ( (array!54469 (arr!26179 (Array (_ BitVec 32) (_ BitVec 64))) (size!26638 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54468)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54468 (_ BitVec 32)) Bool)

(assert (=> b!915318 (= res!617148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30609 () Bool)

(declare-fun mapRes!30609 () Bool)

(declare-fun tp!58676 () Bool)

(declare-fun e!513675 () Bool)

(assert (=> mapNonEmpty!30609 (= mapRes!30609 (and tp!58676 e!513675))))

(declare-fun mapKey!30609 () (_ BitVec 32))

(declare-datatypes ((V!30611 0))(
  ( (V!30612 (val!9668 Int)) )
))
(declare-datatypes ((ValueCell!9136 0))(
  ( (ValueCellFull!9136 (v!12186 V!30611)) (EmptyCell!9136) )
))
(declare-fun mapRest!30609 () (Array (_ BitVec 32) ValueCell!9136))

(declare-datatypes ((array!54470 0))(
  ( (array!54471 (arr!26180 (Array (_ BitVec 32) ValueCell!9136)) (size!26639 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54470)

(declare-fun mapValue!30609 () ValueCell!9136)

(assert (=> mapNonEmpty!30609 (= (arr!26180 _values!1231) (store mapRest!30609 mapKey!30609 mapValue!30609))))

(declare-fun b!915319 () Bool)

(declare-fun e!513673 () Bool)

(declare-fun tp_is_empty!19235 () Bool)

(assert (=> b!915319 (= e!513673 tp_is_empty!19235)))

(declare-fun b!915320 () Bool)

(declare-fun res!617149 () Bool)

(assert (=> b!915320 (=> (not res!617149) (not e!513676))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915320 (= res!617149 (and (= (size!26639 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26638 _keys!1487) (size!26639 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915321 () Bool)

(declare-fun e!513674 () Bool)

(assert (=> b!915321 (= e!513674 (and e!513673 mapRes!30609))))

(declare-fun condMapEmpty!30609 () Bool)

(declare-fun mapDefault!30609 () ValueCell!9136)

