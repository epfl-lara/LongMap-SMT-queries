; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78572 () Bool)

(assert start!78572)

(declare-fun b_free!16785 () Bool)

(declare-fun b_next!16785 () Bool)

(assert (=> start!78572 (= b_free!16785 (not b_next!16785))))

(declare-fun tp!58796 () Bool)

(declare-fun b_and!27407 () Bool)

(assert (=> start!78572 (= tp!58796 b_and!27407)))

(declare-fun mapIsEmpty!30696 () Bool)

(declare-fun mapRes!30696 () Bool)

(assert (=> mapIsEmpty!30696 mapRes!30696))

(declare-fun res!617485 () Bool)

(declare-fun e!514108 () Bool)

(assert (=> start!78572 (=> (not res!617485) (not e!514108))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78572 (= res!617485 (validMask!0 mask!1881))))

(assert (=> start!78572 e!514108))

(assert (=> start!78572 true))

(declare-datatypes ((V!30689 0))(
  ( (V!30690 (val!9697 Int)) )
))
(declare-datatypes ((ValueCell!9165 0))(
  ( (ValueCellFull!9165 (v!12215 V!30689)) (EmptyCell!9165) )
))
(declare-datatypes ((array!54580 0))(
  ( (array!54581 (arr!26235 (Array (_ BitVec 32) ValueCell!9165)) (size!26694 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54580)

(declare-fun e!514111 () Bool)

(declare-fun array_inv!20470 (array!54580) Bool)

(assert (=> start!78572 (and (array_inv!20470 _values!1231) e!514111)))

(assert (=> start!78572 tp!58796))

(declare-datatypes ((array!54582 0))(
  ( (array!54583 (arr!26236 (Array (_ BitVec 32) (_ BitVec 64))) (size!26695 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54582)

(declare-fun array_inv!20471 (array!54582) Bool)

(assert (=> start!78572 (array_inv!20471 _keys!1487)))

(declare-fun tp_is_empty!19293 () Bool)

(assert (=> start!78572 tp_is_empty!19293))

(declare-fun mapNonEmpty!30696 () Bool)

(declare-fun tp!58795 () Bool)

(declare-fun e!514107 () Bool)

(assert (=> mapNonEmpty!30696 (= mapRes!30696 (and tp!58795 e!514107))))

(declare-fun mapValue!30696 () ValueCell!9165)

(declare-fun mapKey!30696 () (_ BitVec 32))

(declare-fun mapRest!30696 () (Array (_ BitVec 32) ValueCell!9165))

(assert (=> mapNonEmpty!30696 (= (arr!26235 _values!1231) (store mapRest!30696 mapKey!30696 mapValue!30696))))

(declare-fun b!915913 () Bool)

(declare-fun res!617484 () Bool)

(assert (=> b!915913 (=> (not res!617484) (not e!514108))))

(declare-datatypes ((List!18393 0))(
  ( (Nil!18390) (Cons!18389 (h!19535 (_ BitVec 64)) (t!26006 List!18393)) )
))
(declare-fun arrayNoDuplicates!0 (array!54582 (_ BitVec 32) List!18393) Bool)

(assert (=> b!915913 (= res!617484 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18390))))

(declare-fun b!915914 () Bool)

(assert (=> b!915914 (= e!514108 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!411730 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30689)

(declare-fun minValue!1173 () V!30689)

(declare-datatypes ((tuple2!12582 0))(
  ( (tuple2!12583 (_1!6302 (_ BitVec 64)) (_2!6302 V!30689)) )
))
(declare-datatypes ((List!18394 0))(
  ( (Nil!18391) (Cons!18390 (h!19536 tuple2!12582) (t!26007 List!18394)) )
))
(declare-datatypes ((ListLongMap!11279 0))(
  ( (ListLongMap!11280 (toList!5655 List!18394)) )
))
(declare-fun contains!4709 (ListLongMap!11279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2916 (array!54582 array!54580 (_ BitVec 32) (_ BitVec 32) V!30689 V!30689 (_ BitVec 32) Int) ListLongMap!11279)

(assert (=> b!915914 (= lt!411730 (contains!4709 (getCurrentListMap!2916 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!915915 () Bool)

(declare-fun e!514109 () Bool)

(assert (=> b!915915 (= e!514111 (and e!514109 mapRes!30696))))

(declare-fun condMapEmpty!30696 () Bool)

(declare-fun mapDefault!30696 () ValueCell!9165)

(assert (=> b!915915 (= condMapEmpty!30696 (= (arr!26235 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9165)) mapDefault!30696)))))

(declare-fun b!915916 () Bool)

(declare-fun res!617482 () Bool)

(assert (=> b!915916 (=> (not res!617482) (not e!514108))))

(assert (=> b!915916 (= res!617482 (and (= (size!26694 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26695 _keys!1487) (size!26694 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915917 () Bool)

(declare-fun res!617483 () Bool)

(assert (=> b!915917 (=> (not res!617483) (not e!514108))))

(assert (=> b!915917 (= res!617483 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26695 _keys!1487))))))

(declare-fun b!915918 () Bool)

(assert (=> b!915918 (= e!514107 tp_is_empty!19293)))

(declare-fun b!915919 () Bool)

(assert (=> b!915919 (= e!514109 tp_is_empty!19293)))

(declare-fun b!915920 () Bool)

(declare-fun res!617481 () Bool)

(assert (=> b!915920 (=> (not res!617481) (not e!514108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54582 (_ BitVec 32)) Bool)

(assert (=> b!915920 (= res!617481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78572 res!617485) b!915916))

(assert (= (and b!915916 res!617482) b!915920))

(assert (= (and b!915920 res!617481) b!915913))

(assert (= (and b!915913 res!617484) b!915917))

(assert (= (and b!915917 res!617483) b!915914))

(assert (= (and b!915915 condMapEmpty!30696) mapIsEmpty!30696))

(assert (= (and b!915915 (not condMapEmpty!30696)) mapNonEmpty!30696))

(get-info :version)

(assert (= (and mapNonEmpty!30696 ((_ is ValueCellFull!9165) mapValue!30696)) b!915918))

(assert (= (and b!915915 ((_ is ValueCellFull!9165) mapDefault!30696)) b!915919))

(assert (= start!78572 b!915915))

(declare-fun m!850123 () Bool)

(assert (=> b!915920 m!850123))

(declare-fun m!850125 () Bool)

(assert (=> start!78572 m!850125))

(declare-fun m!850127 () Bool)

(assert (=> start!78572 m!850127))

(declare-fun m!850129 () Bool)

(assert (=> start!78572 m!850129))

(declare-fun m!850131 () Bool)

(assert (=> b!915913 m!850131))

(declare-fun m!850133 () Bool)

(assert (=> b!915914 m!850133))

(assert (=> b!915914 m!850133))

(declare-fun m!850135 () Bool)

(assert (=> b!915914 m!850135))

(declare-fun m!850137 () Bool)

(assert (=> mapNonEmpty!30696 m!850137))

(check-sat (not mapNonEmpty!30696) (not b!915913) (not b!915914) (not b!915920) (not start!78572) tp_is_empty!19293 b_and!27407 (not b_next!16785))
(check-sat b_and!27407 (not b_next!16785))
