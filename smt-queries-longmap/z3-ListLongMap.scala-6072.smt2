; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78542 () Bool)

(assert start!78542)

(declare-fun b!915570 () Bool)

(declare-fun res!617273 () Bool)

(declare-fun e!513883 () Bool)

(assert (=> b!915570 (=> (not res!617273) (not e!513883))))

(declare-datatypes ((array!54522 0))(
  ( (array!54523 (arr!26206 (Array (_ BitVec 32) (_ BitVec 64))) (size!26665 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54522)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30649 0))(
  ( (V!30650 (val!9682 Int)) )
))
(declare-datatypes ((ValueCell!9150 0))(
  ( (ValueCellFull!9150 (v!12200 V!30649)) (EmptyCell!9150) )
))
(declare-datatypes ((array!54524 0))(
  ( (array!54525 (arr!26207 (Array (_ BitVec 32) ValueCell!9150)) (size!26666 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54524)

(assert (=> b!915570 (= res!617273 (and (= (size!26666 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26665 _keys!1487) (size!26666 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30651 () Bool)

(declare-fun mapRes!30651 () Bool)

(declare-fun tp!58718 () Bool)

(declare-fun e!513882 () Bool)

(assert (=> mapNonEmpty!30651 (= mapRes!30651 (and tp!58718 e!513882))))

(declare-fun mapValue!30651 () ValueCell!9150)

(declare-fun mapKey!30651 () (_ BitVec 32))

(declare-fun mapRest!30651 () (Array (_ BitVec 32) ValueCell!9150))

(assert (=> mapNonEmpty!30651 (= (arr!26207 _values!1231) (store mapRest!30651 mapKey!30651 mapValue!30651))))

(declare-fun b!915571 () Bool)

(declare-fun res!617274 () Bool)

(assert (=> b!915571 (=> (not res!617274) (not e!513883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54522 (_ BitVec 32)) Bool)

(assert (=> b!915571 (= res!617274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915572 () Bool)

(declare-fun e!513886 () Bool)

(declare-fun tp_is_empty!19263 () Bool)

(assert (=> b!915572 (= e!513886 tp_is_empty!19263)))

(declare-fun res!617275 () Bool)

(assert (=> start!78542 (=> (not res!617275) (not e!513883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78542 (= res!617275 (validMask!0 mask!1881))))

(assert (=> start!78542 e!513883))

(assert (=> start!78542 true))

(declare-fun e!513884 () Bool)

(declare-fun array_inv!20454 (array!54524) Bool)

(assert (=> start!78542 (and (array_inv!20454 _values!1231) e!513884)))

(declare-fun array_inv!20455 (array!54522) Bool)

(assert (=> start!78542 (array_inv!20455 _keys!1487)))

(declare-fun mapIsEmpty!30651 () Bool)

(assert (=> mapIsEmpty!30651 mapRes!30651))

(declare-fun b!915573 () Bool)

(assert (=> b!915573 (= e!513882 tp_is_empty!19263)))

(declare-fun b!915574 () Bool)

(assert (=> b!915574 (= e!513884 (and e!513886 mapRes!30651))))

(declare-fun condMapEmpty!30651 () Bool)

(declare-fun mapDefault!30651 () ValueCell!9150)

(assert (=> b!915574 (= condMapEmpty!30651 (= (arr!26207 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9150)) mapDefault!30651)))))

(declare-fun b!915575 () Bool)

(assert (=> b!915575 (= e!513883 false)))

(declare-fun lt!411694 () Bool)

(declare-datatypes ((List!18379 0))(
  ( (Nil!18376) (Cons!18375 (h!19521 (_ BitVec 64)) (t!25992 List!18379)) )
))
(declare-fun arrayNoDuplicates!0 (array!54522 (_ BitVec 32) List!18379) Bool)

(assert (=> b!915575 (= lt!411694 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18376))))

(assert (= (and start!78542 res!617275) b!915570))

(assert (= (and b!915570 res!617273) b!915571))

(assert (= (and b!915571 res!617274) b!915575))

(assert (= (and b!915574 condMapEmpty!30651) mapIsEmpty!30651))

(assert (= (and b!915574 (not condMapEmpty!30651)) mapNonEmpty!30651))

(get-info :version)

(assert (= (and mapNonEmpty!30651 ((_ is ValueCellFull!9150) mapValue!30651)) b!915573))

(assert (= (and b!915574 ((_ is ValueCellFull!9150) mapDefault!30651)) b!915572))

(assert (= start!78542 b!915574))

(declare-fun m!849903 () Bool)

(assert (=> mapNonEmpty!30651 m!849903))

(declare-fun m!849905 () Bool)

(assert (=> b!915571 m!849905))

(declare-fun m!849907 () Bool)

(assert (=> start!78542 m!849907))

(declare-fun m!849909 () Bool)

(assert (=> start!78542 m!849909))

(declare-fun m!849911 () Bool)

(assert (=> start!78542 m!849911))

(declare-fun m!849913 () Bool)

(assert (=> b!915575 m!849913))

(check-sat (not mapNonEmpty!30651) tp_is_empty!19263 (not b!915575) (not b!915571) (not start!78542))
(check-sat)
