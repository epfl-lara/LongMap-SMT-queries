; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78190 () Bool)

(assert start!78190)

(declare-fun b_free!16549 () Bool)

(declare-fun b_next!16549 () Bool)

(assert (=> start!78190 (= b_free!16549 (not b_next!16549))))

(declare-fun tp!57919 () Bool)

(declare-fun b_and!27131 () Bool)

(assert (=> start!78190 (= tp!57919 b_and!27131)))

(declare-fun res!614903 () Bool)

(declare-fun e!511285 () Bool)

(assert (=> start!78190 (=> (not res!614903) (not e!511285))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78190 (= res!614903 (validMask!0 mask!1756))))

(assert (=> start!78190 e!511285))

(declare-datatypes ((V!30255 0))(
  ( (V!30256 (val!9534 Int)) )
))
(declare-datatypes ((ValueCell!9002 0))(
  ( (ValueCellFull!9002 (v!12040 V!30255)) (EmptyCell!9002) )
))
(declare-datatypes ((array!54005 0))(
  ( (array!54006 (arr!25954 (Array (_ BitVec 32) ValueCell!9002)) (size!26414 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54005)

(declare-fun e!511286 () Bool)

(declare-fun array_inv!20364 (array!54005) Bool)

(assert (=> start!78190 (and (array_inv!20364 _values!1152) e!511286)))

(assert (=> start!78190 tp!57919))

(assert (=> start!78190 true))

(declare-fun tp_is_empty!18967 () Bool)

(assert (=> start!78190 tp_is_empty!18967))

(declare-datatypes ((array!54007 0))(
  ( (array!54008 (arr!25955 (Array (_ BitVec 32) (_ BitVec 64))) (size!26415 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54007)

(declare-fun array_inv!20365 (array!54007) Bool)

(assert (=> start!78190 (array_inv!20365 _keys!1386)))

(declare-fun b!911682 () Bool)

(declare-fun res!614901 () Bool)

(assert (=> b!911682 (=> (not res!614901) (not e!511285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54007 (_ BitVec 32)) Bool)

(assert (=> b!911682 (= res!614901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911683 () Bool)

(declare-fun res!614900 () Bool)

(assert (=> b!911683 (=> (not res!614900) (not e!511285))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911683 (= res!614900 (and (= (size!26414 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26415 _keys!1386) (size!26414 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911684 () Bool)

(declare-fun e!511283 () Bool)

(assert (=> b!911684 (= e!511283 tp_is_empty!18967)))

(declare-fun b!911685 () Bool)

(declare-fun e!511287 () Bool)

(declare-fun mapRes!30172 () Bool)

(assert (=> b!911685 (= e!511286 (and e!511287 mapRes!30172))))

(declare-fun condMapEmpty!30172 () Bool)

(declare-fun mapDefault!30172 () ValueCell!9002)

(assert (=> b!911685 (= condMapEmpty!30172 (= (arr!25954 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9002)) mapDefault!30172)))))

(declare-fun b!911686 () Bool)

(assert (=> b!911686 (= e!511287 tp_is_empty!18967)))

(declare-fun b!911687 () Bool)

(assert (=> b!911687 (= e!511285 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410667 () Bool)

(declare-fun zeroValue!1094 () V!30255)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30255)

(declare-datatypes ((tuple2!12382 0))(
  ( (tuple2!12383 (_1!6202 (_ BitVec 64)) (_2!6202 V!30255)) )
))
(declare-datatypes ((List!18203 0))(
  ( (Nil!18200) (Cons!18199 (h!19351 tuple2!12382) (t!25780 List!18203)) )
))
(declare-datatypes ((ListLongMap!11081 0))(
  ( (ListLongMap!11082 (toList!5556 List!18203)) )
))
(declare-fun contains!4609 (ListLongMap!11081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2817 (array!54007 array!54005 (_ BitVec 32) (_ BitVec 32) V!30255 V!30255 (_ BitVec 32) Int) ListLongMap!11081)

(assert (=> b!911687 (= lt!410667 (contains!4609 (getCurrentListMap!2817 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30172 () Bool)

(assert (=> mapIsEmpty!30172 mapRes!30172))

(declare-fun b!911688 () Bool)

(declare-fun res!614902 () Bool)

(assert (=> b!911688 (=> (not res!614902) (not e!511285))))

(declare-datatypes ((List!18204 0))(
  ( (Nil!18201) (Cons!18200 (h!19352 (_ BitVec 64)) (t!25781 List!18204)) )
))
(declare-fun arrayNoDuplicates!0 (array!54007 (_ BitVec 32) List!18204) Bool)

(assert (=> b!911688 (= res!614902 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18201))))

(declare-fun mapNonEmpty!30172 () Bool)

(declare-fun tp!57918 () Bool)

(assert (=> mapNonEmpty!30172 (= mapRes!30172 (and tp!57918 e!511283))))

(declare-fun mapValue!30172 () ValueCell!9002)

(declare-fun mapRest!30172 () (Array (_ BitVec 32) ValueCell!9002))

(declare-fun mapKey!30172 () (_ BitVec 32))

(assert (=> mapNonEmpty!30172 (= (arr!25954 _values!1152) (store mapRest!30172 mapKey!30172 mapValue!30172))))

(assert (= (and start!78190 res!614903) b!911683))

(assert (= (and b!911683 res!614900) b!911682))

(assert (= (and b!911682 res!614901) b!911688))

(assert (= (and b!911688 res!614902) b!911687))

(assert (= (and b!911685 condMapEmpty!30172) mapIsEmpty!30172))

(assert (= (and b!911685 (not condMapEmpty!30172)) mapNonEmpty!30172))

(get-info :version)

(assert (= (and mapNonEmpty!30172 ((_ is ValueCellFull!9002) mapValue!30172)) b!911684))

(assert (= (and b!911685 ((_ is ValueCellFull!9002) mapDefault!30172)) b!911686))

(assert (= start!78190 b!911685))

(declare-fun m!846991 () Bool)

(assert (=> start!78190 m!846991))

(declare-fun m!846993 () Bool)

(assert (=> start!78190 m!846993))

(declare-fun m!846995 () Bool)

(assert (=> start!78190 m!846995))

(declare-fun m!846997 () Bool)

(assert (=> b!911688 m!846997))

(declare-fun m!846999 () Bool)

(assert (=> b!911682 m!846999))

(declare-fun m!847001 () Bool)

(assert (=> mapNonEmpty!30172 m!847001))

(declare-fun m!847003 () Bool)

(assert (=> b!911687 m!847003))

(assert (=> b!911687 m!847003))

(declare-fun m!847005 () Bool)

(assert (=> b!911687 m!847005))

(check-sat b_and!27131 (not b_next!16549) (not b!911687) (not b!911688) (not start!78190) (not mapNonEmpty!30172) tp_is_empty!18967 (not b!911682))
(check-sat b_and!27131 (not b_next!16549))
