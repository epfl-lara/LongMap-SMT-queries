; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78422 () Bool)

(assert start!78422)

(declare-fun mapNonEmpty!30522 () Bool)

(declare-fun mapRes!30522 () Bool)

(declare-fun tp!58589 () Bool)

(declare-fun e!513220 () Bool)

(assert (=> mapNonEmpty!30522 (= mapRes!30522 (and tp!58589 e!513220))))

(declare-datatypes ((V!30547 0))(
  ( (V!30548 (val!9644 Int)) )
))
(declare-datatypes ((ValueCell!9112 0))(
  ( (ValueCellFull!9112 (v!12161 V!30547)) (EmptyCell!9112) )
))
(declare-fun mapValue!30522 () ValueCell!9112)

(declare-fun mapKey!30522 () (_ BitVec 32))

(declare-datatypes ((array!54366 0))(
  ( (array!54367 (arr!26133 (Array (_ BitVec 32) ValueCell!9112)) (size!26592 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54366)

(declare-fun mapRest!30522 () (Array (_ BitVec 32) ValueCell!9112))

(assert (=> mapNonEmpty!30522 (= (arr!26133 _values!1231) (store mapRest!30522 mapKey!30522 mapValue!30522))))

(declare-fun mapIsEmpty!30522 () Bool)

(assert (=> mapIsEmpty!30522 mapRes!30522))

(declare-datatypes ((array!54368 0))(
  ( (array!54369 (arr!26134 (Array (_ BitVec 32) (_ BitVec 64))) (size!26593 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54368)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun b!914762 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun e!513221 () Bool)

(assert (=> b!914762 (= e!513221 (and (= (size!26592 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26593 _keys!1487) (size!26592 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011) (not (= (size!26593 _keys!1487) (bvadd #b00000000000000000000000000000001 mask!1881)))))))

(declare-fun b!914763 () Bool)

(declare-fun e!513219 () Bool)

(declare-fun e!513218 () Bool)

(assert (=> b!914763 (= e!513219 (and e!513218 mapRes!30522))))

(declare-fun condMapEmpty!30522 () Bool)

(declare-fun mapDefault!30522 () ValueCell!9112)

