; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78534 () Bool)

(assert start!78534)

(declare-fun b_free!16765 () Bool)

(declare-fun b_next!16765 () Bool)

(assert (=> start!78534 (= b_free!16765 (not b_next!16765))))

(declare-fun tp!58736 () Bool)

(declare-fun b_and!27361 () Bool)

(assert (=> start!78534 (= tp!58736 b_and!27361)))

(declare-fun res!617223 () Bool)

(declare-fun e!513811 () Bool)

(assert (=> start!78534 (=> (not res!617223) (not e!513811))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78534 (= res!617223 (validMask!0 mask!1881))))

(assert (=> start!78534 e!513811))

(assert (=> start!78534 true))

(declare-datatypes ((V!30663 0))(
  ( (V!30664 (val!9687 Int)) )
))
(declare-datatypes ((ValueCell!9155 0))(
  ( (ValueCellFull!9155 (v!12204 V!30663)) (EmptyCell!9155) )
))
(declare-datatypes ((array!54533 0))(
  ( (array!54534 (arr!26212 (Array (_ BitVec 32) ValueCell!9155)) (size!26673 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54533)

(declare-fun e!513812 () Bool)

(declare-fun array_inv!20540 (array!54533) Bool)

(assert (=> start!78534 (and (array_inv!20540 _values!1231) e!513812)))

(assert (=> start!78534 tp!58736))

(declare-datatypes ((array!54535 0))(
  ( (array!54536 (arr!26213 (Array (_ BitVec 32) (_ BitVec 64))) (size!26674 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54535)

(declare-fun array_inv!20541 (array!54535) Bool)

(assert (=> start!78534 (array_inv!20541 _keys!1487)))

(declare-fun tp_is_empty!19273 () Bool)

(assert (=> start!78534 tp_is_empty!19273))

(declare-fun b!915434 () Bool)

(declare-fun res!617222 () Bool)

(assert (=> b!915434 (=> (not res!617222) (not e!513811))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!915434 (= res!617222 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26674 _keys!1487))))))

(declare-fun b!915435 () Bool)

(declare-fun res!617225 () Bool)

(assert (=> b!915435 (=> (not res!617225) (not e!513811))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915435 (= res!617225 (and (= (size!26673 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26674 _keys!1487) (size!26673 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915436 () Bool)

(declare-fun e!513809 () Bool)

(assert (=> b!915436 (= e!513809 tp_is_empty!19273)))

(declare-fun b!915437 () Bool)

(assert (=> b!915437 (= e!513811 false)))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!411464 () Bool)

(declare-fun zeroValue!1173 () V!30663)

(declare-fun minValue!1173 () V!30663)

(declare-datatypes ((tuple2!12618 0))(
  ( (tuple2!12619 (_1!6320 (_ BitVec 64)) (_2!6320 V!30663)) )
))
(declare-datatypes ((List!18416 0))(
  ( (Nil!18413) (Cons!18412 (h!19558 tuple2!12618) (t!26020 List!18416)) )
))
(declare-datatypes ((ListLongMap!11305 0))(
  ( (ListLongMap!11306 (toList!5668 List!18416)) )
))
(declare-fun contains!4678 (ListLongMap!11305 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2867 (array!54535 array!54533 (_ BitVec 32) (_ BitVec 32) V!30663 V!30663 (_ BitVec 32) Int) ListLongMap!11305)

(assert (=> b!915437 (= lt!411464 (contains!4678 (getCurrentListMap!2867 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!915438 () Bool)

(declare-fun e!513810 () Bool)

(declare-fun mapRes!30666 () Bool)

(assert (=> b!915438 (= e!513812 (and e!513810 mapRes!30666))))

(declare-fun condMapEmpty!30666 () Bool)

(declare-fun mapDefault!30666 () ValueCell!9155)

(assert (=> b!915438 (= condMapEmpty!30666 (= (arr!26212 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9155)) mapDefault!30666)))))

(declare-fun mapIsEmpty!30666 () Bool)

(assert (=> mapIsEmpty!30666 mapRes!30666))

(declare-fun mapNonEmpty!30666 () Bool)

(declare-fun tp!58737 () Bool)

(assert (=> mapNonEmpty!30666 (= mapRes!30666 (and tp!58737 e!513809))))

(declare-fun mapValue!30666 () ValueCell!9155)

(declare-fun mapRest!30666 () (Array (_ BitVec 32) ValueCell!9155))

(declare-fun mapKey!30666 () (_ BitVec 32))

(assert (=> mapNonEmpty!30666 (= (arr!26212 _values!1231) (store mapRest!30666 mapKey!30666 mapValue!30666))))

(declare-fun b!915439 () Bool)

(declare-fun res!617224 () Bool)

(assert (=> b!915439 (=> (not res!617224) (not e!513811))))

(declare-datatypes ((List!18417 0))(
  ( (Nil!18414) (Cons!18413 (h!19559 (_ BitVec 64)) (t!26021 List!18417)) )
))
(declare-fun arrayNoDuplicates!0 (array!54535 (_ BitVec 32) List!18417) Bool)

(assert (=> b!915439 (= res!617224 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18414))))

(declare-fun b!915440 () Bool)

(assert (=> b!915440 (= e!513810 tp_is_empty!19273)))

(declare-fun b!915441 () Bool)

(declare-fun res!617221 () Bool)

(assert (=> b!915441 (=> (not res!617221) (not e!513811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54535 (_ BitVec 32)) Bool)

(assert (=> b!915441 (= res!617221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78534 res!617223) b!915435))

(assert (= (and b!915435 res!617225) b!915441))

(assert (= (and b!915441 res!617221) b!915439))

(assert (= (and b!915439 res!617224) b!915434))

(assert (= (and b!915434 res!617222) b!915437))

(assert (= (and b!915438 condMapEmpty!30666) mapIsEmpty!30666))

(assert (= (and b!915438 (not condMapEmpty!30666)) mapNonEmpty!30666))

(get-info :version)

(assert (= (and mapNonEmpty!30666 ((_ is ValueCellFull!9155) mapValue!30666)) b!915436))

(assert (= (and b!915438 ((_ is ValueCellFull!9155) mapDefault!30666)) b!915440))

(assert (= start!78534 b!915438))

(declare-fun m!849205 () Bool)

(assert (=> b!915441 m!849205))

(declare-fun m!849207 () Bool)

(assert (=> start!78534 m!849207))

(declare-fun m!849209 () Bool)

(assert (=> start!78534 m!849209))

(declare-fun m!849211 () Bool)

(assert (=> start!78534 m!849211))

(declare-fun m!849213 () Bool)

(assert (=> b!915439 m!849213))

(declare-fun m!849215 () Bool)

(assert (=> b!915437 m!849215))

(assert (=> b!915437 m!849215))

(declare-fun m!849217 () Bool)

(assert (=> b!915437 m!849217))

(declare-fun m!849219 () Bool)

(assert (=> mapNonEmpty!30666 m!849219))

(check-sat b_and!27361 (not b_next!16765) (not mapNonEmpty!30666) tp_is_empty!19273 (not b!915437) (not b!915439) (not b!915441) (not start!78534))
(check-sat b_and!27361 (not b_next!16765))
