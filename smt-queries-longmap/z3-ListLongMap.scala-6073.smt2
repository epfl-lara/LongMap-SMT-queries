; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78528 () Bool)

(assert start!78528)

(declare-fun b!915369 () Bool)

(declare-fun e!513765 () Bool)

(declare-fun tp_is_empty!19267 () Bool)

(assert (=> b!915369 (= e!513765 tp_is_empty!19267)))

(declare-fun mapNonEmpty!30657 () Bool)

(declare-fun mapRes!30657 () Bool)

(declare-fun tp!58725 () Bool)

(declare-fun e!513768 () Bool)

(assert (=> mapNonEmpty!30657 (= mapRes!30657 (and tp!58725 e!513768))))

(declare-datatypes ((V!30655 0))(
  ( (V!30656 (val!9684 Int)) )
))
(declare-datatypes ((ValueCell!9152 0))(
  ( (ValueCellFull!9152 (v!12201 V!30655)) (EmptyCell!9152) )
))
(declare-fun mapValue!30657 () ValueCell!9152)

(declare-fun mapKey!30657 () (_ BitVec 32))

(declare-fun mapRest!30657 () (Array (_ BitVec 32) ValueCell!9152))

(declare-datatypes ((array!54523 0))(
  ( (array!54524 (arr!26207 (Array (_ BitVec 32) ValueCell!9152)) (size!26668 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54523)

(assert (=> mapNonEmpty!30657 (= (arr!26207 _values!1231) (store mapRest!30657 mapKey!30657 mapValue!30657))))

(declare-fun b!915370 () Bool)

(declare-fun e!513764 () Bool)

(assert (=> b!915370 (= e!513764 (and e!513765 mapRes!30657))))

(declare-fun condMapEmpty!30657 () Bool)

(declare-fun mapDefault!30657 () ValueCell!9152)

(assert (=> b!915370 (= condMapEmpty!30657 (= (arr!26207 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9152)) mapDefault!30657)))))

(declare-fun res!617184 () Bool)

(declare-fun e!513766 () Bool)

(assert (=> start!78528 (=> (not res!617184) (not e!513766))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78528 (= res!617184 (validMask!0 mask!1881))))

(assert (=> start!78528 e!513766))

(declare-datatypes ((array!54525 0))(
  ( (array!54526 (arr!26208 (Array (_ BitVec 32) (_ BitVec 64))) (size!26669 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54525)

(declare-fun array_inv!20536 (array!54525) Bool)

(assert (=> start!78528 (array_inv!20536 _keys!1487)))

(assert (=> start!78528 true))

(declare-fun array_inv!20537 (array!54523) Bool)

(assert (=> start!78528 (and (array_inv!20537 _values!1231) e!513764)))

(declare-fun b!915371 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!915371 (= e!513766 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26669 _keys!1487)) (bvsgt from!1844 (size!26669 _keys!1487))))))

(declare-fun b!915372 () Bool)

(declare-fun res!617183 () Bool)

(assert (=> b!915372 (=> (not res!617183) (not e!513766))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915372 (= res!617183 (and (= (size!26668 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26669 _keys!1487) (size!26668 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915373 () Bool)

(declare-fun res!617186 () Bool)

(assert (=> b!915373 (=> (not res!617186) (not e!513766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54525 (_ BitVec 32)) Bool)

(assert (=> b!915373 (= res!617186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915374 () Bool)

(declare-fun res!617185 () Bool)

(assert (=> b!915374 (=> (not res!617185) (not e!513766))))

(declare-datatypes ((List!18414 0))(
  ( (Nil!18411) (Cons!18410 (h!19556 (_ BitVec 64)) (t!26018 List!18414)) )
))
(declare-fun arrayNoDuplicates!0 (array!54525 (_ BitVec 32) List!18414) Bool)

(assert (=> b!915374 (= res!617185 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18411))))

(declare-fun b!915375 () Bool)

(assert (=> b!915375 (= e!513768 tp_is_empty!19267)))

(declare-fun mapIsEmpty!30657 () Bool)

(assert (=> mapIsEmpty!30657 mapRes!30657))

(assert (= (and start!78528 res!617184) b!915372))

(assert (= (and b!915372 res!617183) b!915373))

(assert (= (and b!915373 res!617186) b!915374))

(assert (= (and b!915374 res!617185) b!915371))

(assert (= (and b!915370 condMapEmpty!30657) mapIsEmpty!30657))

(assert (= (and b!915370 (not condMapEmpty!30657)) mapNonEmpty!30657))

(get-info :version)

(assert (= (and mapNonEmpty!30657 ((_ is ValueCellFull!9152) mapValue!30657)) b!915375))

(assert (= (and b!915370 ((_ is ValueCellFull!9152) mapDefault!30657)) b!915369))

(assert (= start!78528 b!915370))

(declare-fun m!849169 () Bool)

(assert (=> mapNonEmpty!30657 m!849169))

(declare-fun m!849171 () Bool)

(assert (=> start!78528 m!849171))

(declare-fun m!849173 () Bool)

(assert (=> start!78528 m!849173))

(declare-fun m!849175 () Bool)

(assert (=> start!78528 m!849175))

(declare-fun m!849177 () Bool)

(assert (=> b!915373 m!849177))

(declare-fun m!849179 () Bool)

(assert (=> b!915374 m!849179))

(check-sat (not mapNonEmpty!30657) (not b!915374) tp_is_empty!19267 (not start!78528) (not b!915373))
(check-sat)
