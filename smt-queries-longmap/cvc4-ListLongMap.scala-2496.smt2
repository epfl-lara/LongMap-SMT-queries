; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38798 () Bool)

(assert start!38798)

(declare-fun b!404753 () Bool)

(declare-fun res!233480 () Bool)

(declare-fun e!243458 () Bool)

(assert (=> b!404753 (=> (not res!233480) (not e!243458))))

(declare-datatypes ((array!24329 0))(
  ( (array!24330 (arr!11614 (Array (_ BitVec 32) (_ BitVec 64))) (size!11966 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24329)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14727 0))(
  ( (V!14728 (val!5153 Int)) )
))
(declare-datatypes ((ValueCell!4765 0))(
  ( (ValueCellFull!4765 (v!7400 V!14727)) (EmptyCell!4765) )
))
(declare-datatypes ((array!24331 0))(
  ( (array!24332 (arr!11615 (Array (_ BitVec 32) ValueCell!4765)) (size!11967 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24331)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404753 (= res!233480 (and (= (size!11967 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11966 _keys!709) (size!11967 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404754 () Bool)

(declare-fun res!233485 () Bool)

(assert (=> b!404754 (=> (not res!233485) (not e!243458))))

(declare-datatypes ((List!6760 0))(
  ( (Nil!6757) (Cons!6756 (h!7612 (_ BitVec 64)) (t!11934 List!6760)) )
))
(declare-fun arrayNoDuplicates!0 (array!24329 (_ BitVec 32) List!6760) Bool)

(assert (=> b!404754 (= res!233485 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6757))))

(declare-fun b!404755 () Bool)

(declare-fun e!243457 () Bool)

(declare-fun tp_is_empty!10217 () Bool)

(assert (=> b!404755 (= e!243457 tp_is_empty!10217)))

(declare-fun b!404756 () Bool)

(declare-fun res!233483 () Bool)

(assert (=> b!404756 (=> (not res!233483) (not e!243458))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404756 (= res!233483 (validKeyInArray!0 k!794))))

(declare-fun b!404757 () Bool)

(declare-fun res!233484 () Bool)

(assert (=> b!404757 (=> (not res!233484) (not e!243458))))

(declare-fun arrayContainsKey!0 (array!24329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404757 (= res!233484 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!404758 () Bool)

(declare-fun res!233482 () Bool)

(assert (=> b!404758 (=> (not res!233482) (not e!243458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404758 (= res!233482 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16947 () Bool)

(declare-fun mapRes!16947 () Bool)

(declare-fun tp!33066 () Bool)

(assert (=> mapNonEmpty!16947 (= mapRes!16947 (and tp!33066 e!243457))))

(declare-fun mapKey!16947 () (_ BitVec 32))

(declare-fun mapRest!16947 () (Array (_ BitVec 32) ValueCell!4765))

(declare-fun mapValue!16947 () ValueCell!4765)

(assert (=> mapNonEmpty!16947 (= (arr!11615 _values!549) (store mapRest!16947 mapKey!16947 mapValue!16947))))

(declare-fun res!233486 () Bool)

(assert (=> start!38798 (=> (not res!233486) (not e!243458))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38798 (= res!233486 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11966 _keys!709))))))

(assert (=> start!38798 e!243458))

(assert (=> start!38798 true))

(declare-fun e!243460 () Bool)

(declare-fun array_inv!8492 (array!24331) Bool)

(assert (=> start!38798 (and (array_inv!8492 _values!549) e!243460)))

(declare-fun array_inv!8493 (array!24329) Bool)

(assert (=> start!38798 (array_inv!8493 _keys!709)))

(declare-fun b!404759 () Bool)

(declare-fun e!243459 () Bool)

(assert (=> b!404759 (= e!243458 e!243459)))

(declare-fun res!233487 () Bool)

(assert (=> b!404759 (=> (not res!233487) (not e!243459))))

(declare-fun lt!188231 () array!24329)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24329 (_ BitVec 32)) Bool)

(assert (=> b!404759 (= res!233487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188231 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404759 (= lt!188231 (array!24330 (store (arr!11614 _keys!709) i!563 k!794) (size!11966 _keys!709)))))

(declare-fun b!404760 () Bool)

(assert (=> b!404760 (= e!243459 false)))

(declare-fun lt!188230 () Bool)

(assert (=> b!404760 (= lt!188230 (arrayNoDuplicates!0 lt!188231 #b00000000000000000000000000000000 Nil!6757))))

(declare-fun mapIsEmpty!16947 () Bool)

(assert (=> mapIsEmpty!16947 mapRes!16947))

(declare-fun b!404761 () Bool)

(declare-fun res!233478 () Bool)

(assert (=> b!404761 (=> (not res!233478) (not e!243458))))

(assert (=> b!404761 (= res!233478 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11966 _keys!709))))))

(declare-fun b!404762 () Bool)

(declare-fun e!243461 () Bool)

(assert (=> b!404762 (= e!243460 (and e!243461 mapRes!16947))))

(declare-fun condMapEmpty!16947 () Bool)

(declare-fun mapDefault!16947 () ValueCell!4765)

