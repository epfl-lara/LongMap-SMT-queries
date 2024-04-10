; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78522 () Bool)

(assert start!78522)

(declare-fun b!915390 () Bool)

(declare-fun e!513733 () Bool)

(declare-fun tp_is_empty!19243 () Bool)

(assert (=> b!915390 (= e!513733 tp_is_empty!19243)))

(declare-fun res!617183 () Bool)

(declare-fun e!513732 () Bool)

(assert (=> start!78522 (=> (not res!617183) (not e!513732))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78522 (= res!617183 (validMask!0 mask!1881))))

(assert (=> start!78522 e!513732))

(assert (=> start!78522 true))

(declare-datatypes ((V!30623 0))(
  ( (V!30624 (val!9672 Int)) )
))
(declare-datatypes ((ValueCell!9140 0))(
  ( (ValueCellFull!9140 (v!12190 V!30623)) (EmptyCell!9140) )
))
(declare-datatypes ((array!54484 0))(
  ( (array!54485 (arr!26187 (Array (_ BitVec 32) ValueCell!9140)) (size!26646 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54484)

(declare-fun e!513735 () Bool)

(declare-fun array_inv!20442 (array!54484) Bool)

(assert (=> start!78522 (and (array_inv!20442 _values!1231) e!513735)))

(declare-datatypes ((array!54486 0))(
  ( (array!54487 (arr!26188 (Array (_ BitVec 32) (_ BitVec 64))) (size!26647 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54486)

(declare-fun array_inv!20443 (array!54486) Bool)

(assert (=> start!78522 (array_inv!20443 _keys!1487)))

(declare-fun b!915391 () Bool)

(declare-fun res!617184 () Bool)

(assert (=> b!915391 (=> (not res!617184) (not e!513732))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915391 (= res!617184 (and (= (size!26646 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26647 _keys!1487) (size!26646 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915392 () Bool)

(assert (=> b!915392 (= e!513732 false)))

(declare-fun lt!411664 () Bool)

(declare-datatypes ((List!18370 0))(
  ( (Nil!18367) (Cons!18366 (h!19512 (_ BitVec 64)) (t!25983 List!18370)) )
))
(declare-fun arrayNoDuplicates!0 (array!54486 (_ BitVec 32) List!18370) Bool)

(assert (=> b!915392 (= lt!411664 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18367))))

(declare-fun mapIsEmpty!30621 () Bool)

(declare-fun mapRes!30621 () Bool)

(assert (=> mapIsEmpty!30621 mapRes!30621))

(declare-fun b!915393 () Bool)

(declare-fun res!617185 () Bool)

(assert (=> b!915393 (=> (not res!617185) (not e!513732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54486 (_ BitVec 32)) Bool)

(assert (=> b!915393 (= res!617185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30621 () Bool)

(declare-fun tp!58688 () Bool)

(declare-fun e!513734 () Bool)

(assert (=> mapNonEmpty!30621 (= mapRes!30621 (and tp!58688 e!513734))))

(declare-fun mapRest!30621 () (Array (_ BitVec 32) ValueCell!9140))

(declare-fun mapValue!30621 () ValueCell!9140)

(declare-fun mapKey!30621 () (_ BitVec 32))

(assert (=> mapNonEmpty!30621 (= (arr!26187 _values!1231) (store mapRest!30621 mapKey!30621 mapValue!30621))))

(declare-fun b!915394 () Bool)

(assert (=> b!915394 (= e!513735 (and e!513733 mapRes!30621))))

(declare-fun condMapEmpty!30621 () Bool)

(declare-fun mapDefault!30621 () ValueCell!9140)

