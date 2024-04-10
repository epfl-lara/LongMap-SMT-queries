; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78468 () Bool)

(assert start!78468)

(declare-fun b!915014 () Bool)

(declare-fun e!513433 () Bool)

(declare-fun tp_is_empty!19211 () Bool)

(assert (=> b!915014 (= e!513433 tp_is_empty!19211)))

(declare-fun b!915015 () Bool)

(declare-fun e!513435 () Bool)

(assert (=> b!915015 (= e!513435 tp_is_empty!19211)))

(declare-fun b!915016 () Bool)

(declare-fun res!616979 () Bool)

(declare-fun e!513434 () Bool)

(assert (=> b!915016 (=> (not res!616979) (not e!513434))))

(declare-datatypes ((array!54418 0))(
  ( (array!54419 (arr!26156 (Array (_ BitVec 32) (_ BitVec 64))) (size!26615 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54418)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30579 0))(
  ( (V!30580 (val!9656 Int)) )
))
(declare-datatypes ((ValueCell!9124 0))(
  ( (ValueCellFull!9124 (v!12173 V!30579)) (EmptyCell!9124) )
))
(declare-datatypes ((array!54420 0))(
  ( (array!54421 (arr!26157 (Array (_ BitVec 32) ValueCell!9124)) (size!26616 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54420)

(assert (=> b!915016 (= res!616979 (and (= (size!26616 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26615 _keys!1487) (size!26616 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30567 () Bool)

(declare-fun mapRes!30567 () Bool)

(declare-fun tp!58634 () Bool)

(assert (=> mapNonEmpty!30567 (= mapRes!30567 (and tp!58634 e!513433))))

(declare-fun mapValue!30567 () ValueCell!9124)

(declare-fun mapKey!30567 () (_ BitVec 32))

(declare-fun mapRest!30567 () (Array (_ BitVec 32) ValueCell!9124))

(assert (=> mapNonEmpty!30567 (= (arr!26157 _values!1231) (store mapRest!30567 mapKey!30567 mapValue!30567))))

(declare-fun b!915017 () Bool)

(declare-fun e!513437 () Bool)

(assert (=> b!915017 (= e!513437 (and e!513435 mapRes!30567))))

(declare-fun condMapEmpty!30567 () Bool)

(declare-fun mapDefault!30567 () ValueCell!9124)

