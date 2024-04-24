; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78714 () Bool)

(assert start!78714)

(declare-fun b!916511 () Bool)

(declare-fun e!514497 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54579 0))(
  ( (array!54580 (arr!26230 (Array (_ BitVec 32) (_ BitVec 64))) (size!26690 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54579)

(assert (=> b!916511 (= e!514497 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26690 _keys!1487)) (bvsgt from!1844 (size!26690 _keys!1487))))))

(declare-fun b!916512 () Bool)

(declare-fun e!514495 () Bool)

(declare-fun tp_is_empty!19267 () Bool)

(assert (=> b!916512 (= e!514495 tp_is_empty!19267)))

(declare-fun res!617640 () Bool)

(assert (=> start!78714 (=> (not res!617640) (not e!514497))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78714 (= res!617640 (validMask!0 mask!1881))))

(assert (=> start!78714 e!514497))

(declare-fun array_inv!20570 (array!54579) Bool)

(assert (=> start!78714 (array_inv!20570 _keys!1487)))

(assert (=> start!78714 true))

(declare-datatypes ((V!30655 0))(
  ( (V!30656 (val!9684 Int)) )
))
(declare-datatypes ((ValueCell!9152 0))(
  ( (ValueCellFull!9152 (v!12199 V!30655)) (EmptyCell!9152) )
))
(declare-datatypes ((array!54581 0))(
  ( (array!54582 (arr!26231 (Array (_ BitVec 32) ValueCell!9152)) (size!26691 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54581)

(declare-fun e!514498 () Bool)

(declare-fun array_inv!20571 (array!54581) Bool)

(assert (=> start!78714 (and (array_inv!20571 _values!1231) e!514498)))

(declare-fun b!916513 () Bool)

(declare-fun res!617637 () Bool)

(assert (=> b!916513 (=> (not res!617637) (not e!514497))))

(declare-datatypes ((List!18364 0))(
  ( (Nil!18361) (Cons!18360 (h!19512 (_ BitVec 64)) (t!25969 List!18364)) )
))
(declare-fun arrayNoDuplicates!0 (array!54579 (_ BitVec 32) List!18364) Bool)

(assert (=> b!916513 (= res!617637 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18361))))

(declare-fun b!916514 () Bool)

(declare-fun e!514496 () Bool)

(declare-fun mapRes!30657 () Bool)

(assert (=> b!916514 (= e!514498 (and e!514496 mapRes!30657))))

(declare-fun condMapEmpty!30657 () Bool)

(declare-fun mapDefault!30657 () ValueCell!9152)

(assert (=> b!916514 (= condMapEmpty!30657 (= (arr!26231 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9152)) mapDefault!30657)))))

(declare-fun mapNonEmpty!30657 () Bool)

(declare-fun tp!58725 () Bool)

(assert (=> mapNonEmpty!30657 (= mapRes!30657 (and tp!58725 e!514495))))

(declare-fun mapKey!30657 () (_ BitVec 32))

(declare-fun mapValue!30657 () ValueCell!9152)

(declare-fun mapRest!30657 () (Array (_ BitVec 32) ValueCell!9152))

(assert (=> mapNonEmpty!30657 (= (arr!26231 _values!1231) (store mapRest!30657 mapKey!30657 mapValue!30657))))

(declare-fun mapIsEmpty!30657 () Bool)

(assert (=> mapIsEmpty!30657 mapRes!30657))

(declare-fun b!916515 () Bool)

(declare-fun res!617639 () Bool)

(assert (=> b!916515 (=> (not res!617639) (not e!514497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54579 (_ BitVec 32)) Bool)

(assert (=> b!916515 (= res!617639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916516 () Bool)

(assert (=> b!916516 (= e!514496 tp_is_empty!19267)))

(declare-fun b!916517 () Bool)

(declare-fun res!617638 () Bool)

(assert (=> b!916517 (=> (not res!617638) (not e!514497))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916517 (= res!617638 (and (= (size!26691 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26690 _keys!1487) (size!26691 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78714 res!617640) b!916517))

(assert (= (and b!916517 res!617638) b!916515))

(assert (= (and b!916515 res!617639) b!916513))

(assert (= (and b!916513 res!617637) b!916511))

(assert (= (and b!916514 condMapEmpty!30657) mapIsEmpty!30657))

(assert (= (and b!916514 (not condMapEmpty!30657)) mapNonEmpty!30657))

(get-info :version)

(assert (= (and mapNonEmpty!30657 ((_ is ValueCellFull!9152) mapValue!30657)) b!916512))

(assert (= (and b!916514 ((_ is ValueCellFull!9152) mapDefault!30657)) b!916516))

(assert (= start!78714 b!916514))

(declare-fun m!851221 () Bool)

(assert (=> start!78714 m!851221))

(declare-fun m!851223 () Bool)

(assert (=> start!78714 m!851223))

(declare-fun m!851225 () Bool)

(assert (=> start!78714 m!851225))

(declare-fun m!851227 () Bool)

(assert (=> b!916513 m!851227))

(declare-fun m!851229 () Bool)

(assert (=> mapNonEmpty!30657 m!851229))

(declare-fun m!851231 () Bool)

(assert (=> b!916515 m!851231))

(check-sat (not start!78714) tp_is_empty!19267 (not mapNonEmpty!30657) (not b!916515) (not b!916513))
(check-sat)
