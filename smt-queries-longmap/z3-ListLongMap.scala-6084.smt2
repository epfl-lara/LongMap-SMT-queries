; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78594 () Bool)

(assert start!78594)

(declare-fun b_free!16825 () Bool)

(declare-fun b_next!16825 () Bool)

(assert (=> start!78594 (= b_free!16825 (not b_next!16825))))

(declare-fun tp!58917 () Bool)

(declare-fun b_and!27421 () Bool)

(assert (=> start!78594 (= tp!58917 b_and!27421)))

(declare-fun b!916165 () Bool)

(declare-fun res!617685 () Bool)

(declare-fun e!514265 () Bool)

(assert (=> b!916165 (=> (not res!617685) (not e!514265))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54643 0))(
  ( (array!54644 (arr!26267 (Array (_ BitVec 32) (_ BitVec 64))) (size!26728 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54643)

(assert (=> b!916165 (= res!617685 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26728 _keys!1487))))))

(declare-fun b!916166 () Bool)

(declare-fun e!514264 () Bool)

(assert (=> b!916166 (= e!514264 false)))

(declare-datatypes ((V!30743 0))(
  ( (V!30744 (val!9717 Int)) )
))
(declare-fun lt!411548 () V!30743)

(declare-datatypes ((tuple2!12652 0))(
  ( (tuple2!12653 (_1!6337 (_ BitVec 64)) (_2!6337 V!30743)) )
))
(declare-datatypes ((List!18449 0))(
  ( (Nil!18446) (Cons!18445 (h!19591 tuple2!12652) (t!26053 List!18449)) )
))
(declare-datatypes ((ListLongMap!11339 0))(
  ( (ListLongMap!11340 (toList!5685 List!18449)) )
))
(declare-fun lt!411547 () ListLongMap!11339)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!530 (ListLongMap!11339 (_ BitVec 64)) V!30743)

(assert (=> b!916166 (= lt!411548 (apply!530 lt!411547 k0!1099))))

(declare-fun mapIsEmpty!30756 () Bool)

(declare-fun mapRes!30756 () Bool)

(assert (=> mapIsEmpty!30756 mapRes!30756))

(declare-fun b!916168 () Bool)

(declare-fun e!514263 () Bool)

(declare-fun tp_is_empty!19333 () Bool)

(assert (=> b!916168 (= e!514263 tp_is_empty!19333)))

(declare-fun b!916169 () Bool)

(assert (=> b!916169 (= e!514265 e!514264)))

(declare-fun res!617683 () Bool)

(assert (=> b!916169 (=> (not res!617683) (not e!514264))))

(declare-fun contains!4695 (ListLongMap!11339 (_ BitVec 64)) Bool)

(assert (=> b!916169 (= res!617683 (contains!4695 lt!411547 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9185 0))(
  ( (ValueCellFull!9185 (v!12234 V!30743)) (EmptyCell!9185) )
))
(declare-datatypes ((array!54645 0))(
  ( (array!54646 (arr!26268 (Array (_ BitVec 32) ValueCell!9185)) (size!26729 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54645)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30743)

(declare-fun minValue!1173 () V!30743)

(declare-fun getCurrentListMap!2884 (array!54643 array!54645 (_ BitVec 32) (_ BitVec 32) V!30743 V!30743 (_ BitVec 32) Int) ListLongMap!11339)

(assert (=> b!916169 (= lt!411547 (getCurrentListMap!2884 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30756 () Bool)

(declare-fun tp!58916 () Bool)

(declare-fun e!514261 () Bool)

(assert (=> mapNonEmpty!30756 (= mapRes!30756 (and tp!58916 e!514261))))

(declare-fun mapValue!30756 () ValueCell!9185)

(declare-fun mapKey!30756 () (_ BitVec 32))

(declare-fun mapRest!30756 () (Array (_ BitVec 32) ValueCell!9185))

(assert (=> mapNonEmpty!30756 (= (arr!26268 _values!1231) (store mapRest!30756 mapKey!30756 mapValue!30756))))

(declare-fun b!916170 () Bool)

(assert (=> b!916170 (= e!514261 tp_is_empty!19333)))

(declare-fun b!916171 () Bool)

(declare-fun e!514262 () Bool)

(assert (=> b!916171 (= e!514262 (and e!514263 mapRes!30756))))

(declare-fun condMapEmpty!30756 () Bool)

(declare-fun mapDefault!30756 () ValueCell!9185)

(assert (=> b!916171 (= condMapEmpty!30756 (= (arr!26268 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9185)) mapDefault!30756)))))

(declare-fun res!617687 () Bool)

(assert (=> start!78594 (=> (not res!617687) (not e!514265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78594 (= res!617687 (validMask!0 mask!1881))))

(assert (=> start!78594 e!514265))

(assert (=> start!78594 true))

(declare-fun array_inv!20574 (array!54645) Bool)

(assert (=> start!78594 (and (array_inv!20574 _values!1231) e!514262)))

(assert (=> start!78594 tp!58917))

(declare-fun array_inv!20575 (array!54643) Bool)

(assert (=> start!78594 (array_inv!20575 _keys!1487)))

(assert (=> start!78594 tp_is_empty!19333))

(declare-fun b!916167 () Bool)

(declare-fun res!617682 () Bool)

(assert (=> b!916167 (=> (not res!617682) (not e!514265))))

(assert (=> b!916167 (= res!617682 (and (= (size!26729 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26728 _keys!1487) (size!26729 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916172 () Bool)

(declare-fun res!617686 () Bool)

(assert (=> b!916172 (=> (not res!617686) (not e!514265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54643 (_ BitVec 32)) Bool)

(assert (=> b!916172 (= res!617686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916173 () Bool)

(declare-fun res!617684 () Bool)

(assert (=> b!916173 (=> (not res!617684) (not e!514265))))

(declare-datatypes ((List!18450 0))(
  ( (Nil!18447) (Cons!18446 (h!19592 (_ BitVec 64)) (t!26054 List!18450)) )
))
(declare-fun arrayNoDuplicates!0 (array!54643 (_ BitVec 32) List!18450) Bool)

(assert (=> b!916173 (= res!617684 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18447))))

(assert (= (and start!78594 res!617687) b!916167))

(assert (= (and b!916167 res!617682) b!916172))

(assert (= (and b!916172 res!617686) b!916173))

(assert (= (and b!916173 res!617684) b!916165))

(assert (= (and b!916165 res!617685) b!916169))

(assert (= (and b!916169 res!617683) b!916166))

(assert (= (and b!916171 condMapEmpty!30756) mapIsEmpty!30756))

(assert (= (and b!916171 (not condMapEmpty!30756)) mapNonEmpty!30756))

(get-info :version)

(assert (= (and mapNonEmpty!30756 ((_ is ValueCellFull!9185) mapValue!30756)) b!916170))

(assert (= (and b!916171 ((_ is ValueCellFull!9185) mapDefault!30756)) b!916168))

(assert (= start!78594 b!916171))

(declare-fun m!849685 () Bool)

(assert (=> mapNonEmpty!30756 m!849685))

(declare-fun m!849687 () Bool)

(assert (=> start!78594 m!849687))

(declare-fun m!849689 () Bool)

(assert (=> start!78594 m!849689))

(declare-fun m!849691 () Bool)

(assert (=> start!78594 m!849691))

(declare-fun m!849693 () Bool)

(assert (=> b!916169 m!849693))

(declare-fun m!849695 () Bool)

(assert (=> b!916169 m!849695))

(declare-fun m!849697 () Bool)

(assert (=> b!916172 m!849697))

(declare-fun m!849699 () Bool)

(assert (=> b!916166 m!849699))

(declare-fun m!849701 () Bool)

(assert (=> b!916173 m!849701))

(check-sat (not b_next!16825) (not b!916166) b_and!27421 tp_is_empty!19333 (not b!916173) (not mapNonEmpty!30756) (not start!78594) (not b!916172) (not b!916169))
(check-sat b_and!27421 (not b_next!16825))
