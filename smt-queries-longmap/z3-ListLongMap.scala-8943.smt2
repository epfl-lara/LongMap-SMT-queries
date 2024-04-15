; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108384 () Bool)

(assert start!108384)

(declare-fun b_free!27931 () Bool)

(declare-fun b_next!27931 () Bool)

(assert (=> start!108384 (= b_free!27931 (not b_next!27931))))

(declare-fun tp!98903 () Bool)

(declare-fun b_and!45973 () Bool)

(assert (=> start!108384 (= tp!98903 b_and!45973)))

(declare-fun b!1279112 () Bool)

(declare-fun e!730820 () Bool)

(declare-fun e!730821 () Bool)

(declare-fun mapRes!51908 () Bool)

(assert (=> b!1279112 (= e!730820 (and e!730821 mapRes!51908))))

(declare-fun condMapEmpty!51908 () Bool)

(declare-datatypes ((V!49865 0))(
  ( (V!49866 (val!16860 Int)) )
))
(declare-datatypes ((ValueCell!15887 0))(
  ( (ValueCellFull!15887 (v!19459 V!49865)) (EmptyCell!15887) )
))
(declare-datatypes ((array!84119 0))(
  ( (array!84120 (arr!40564 (Array (_ BitVec 32) ValueCell!15887)) (size!41116 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84119)

(declare-fun mapDefault!51908 () ValueCell!15887)

(assert (=> b!1279112 (= condMapEmpty!51908 (= (arr!40564 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15887)) mapDefault!51908)))))

(declare-fun b!1279113 () Bool)

(declare-fun res!849717 () Bool)

(declare-fun e!730817 () Bool)

(assert (=> b!1279113 (=> (not res!849717) (not e!730817))))

(declare-datatypes ((array!84121 0))(
  ( (array!84122 (arr!40565 (Array (_ BitVec 32) (_ BitVec 64))) (size!41117 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84121)

(declare-datatypes ((List!28840 0))(
  ( (Nil!28837) (Cons!28836 (h!30045 (_ BitVec 64)) (t!42372 List!28840)) )
))
(declare-fun arrayNoDuplicates!0 (array!84121 (_ BitVec 32) List!28840) Bool)

(assert (=> b!1279113 (= res!849717 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28837))))

(declare-fun b!1279114 () Bool)

(declare-fun e!730819 () Bool)

(declare-fun tp_is_empty!33571 () Bool)

(assert (=> b!1279114 (= e!730819 tp_is_empty!33571)))

(declare-fun b!1279115 () Bool)

(assert (=> b!1279115 (= e!730821 tp_is_empty!33571)))

(declare-fun b!1279116 () Bool)

(declare-fun res!849715 () Bool)

(assert (=> b!1279116 (=> (not res!849715) (not e!730817))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84121 (_ BitVec 32)) Bool)

(assert (=> b!1279116 (= res!849715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279117 () Bool)

(declare-fun res!849716 () Bool)

(assert (=> b!1279117 (=> (not res!849716) (not e!730817))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279117 (= res!849716 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41117 _keys!1741))))))

(declare-fun mapNonEmpty!51908 () Bool)

(declare-fun tp!98904 () Bool)

(assert (=> mapNonEmpty!51908 (= mapRes!51908 (and tp!98904 e!730819))))

(declare-fun mapKey!51908 () (_ BitVec 32))

(declare-fun mapRest!51908 () (Array (_ BitVec 32) ValueCell!15887))

(declare-fun mapValue!51908 () ValueCell!15887)

(assert (=> mapNonEmpty!51908 (= (arr!40564 _values!1445) (store mapRest!51908 mapKey!51908 mapValue!51908))))

(declare-fun b!1279118 () Bool)

(declare-fun res!849719 () Bool)

(assert (=> b!1279118 (=> (not res!849719) (not e!730817))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279118 (= res!849719 (and (= (size!41116 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41117 _keys!1741) (size!41116 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279119 () Bool)

(assert (=> b!1279119 (= e!730817 false)))

(declare-fun minValue!1387 () V!49865)

(declare-fun zeroValue!1387 () V!49865)

(declare-fun lt!575800 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21648 0))(
  ( (tuple2!21649 (_1!10835 (_ BitVec 64)) (_2!10835 V!49865)) )
))
(declare-datatypes ((List!28841 0))(
  ( (Nil!28838) (Cons!28837 (h!30046 tuple2!21648) (t!42373 List!28841)) )
))
(declare-datatypes ((ListLongMap!19305 0))(
  ( (ListLongMap!19306 (toList!9668 List!28841)) )
))
(declare-fun contains!7713 (ListLongMap!19305 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4642 (array!84121 array!84119 (_ BitVec 32) (_ BitVec 32) V!49865 V!49865 (_ BitVec 32) Int) ListLongMap!19305)

(assert (=> b!1279119 (= lt!575800 (contains!7713 (getCurrentListMap!4642 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!51908 () Bool)

(assert (=> mapIsEmpty!51908 mapRes!51908))

(declare-fun res!849718 () Bool)

(assert (=> start!108384 (=> (not res!849718) (not e!730817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108384 (= res!849718 (validMask!0 mask!2175))))

(assert (=> start!108384 e!730817))

(assert (=> start!108384 tp_is_empty!33571))

(assert (=> start!108384 true))

(declare-fun array_inv!30963 (array!84119) Bool)

(assert (=> start!108384 (and (array_inv!30963 _values!1445) e!730820)))

(declare-fun array_inv!30964 (array!84121) Bool)

(assert (=> start!108384 (array_inv!30964 _keys!1741)))

(assert (=> start!108384 tp!98903))

(assert (= (and start!108384 res!849718) b!1279118))

(assert (= (and b!1279118 res!849719) b!1279116))

(assert (= (and b!1279116 res!849715) b!1279113))

(assert (= (and b!1279113 res!849717) b!1279117))

(assert (= (and b!1279117 res!849716) b!1279119))

(assert (= (and b!1279112 condMapEmpty!51908) mapIsEmpty!51908))

(assert (= (and b!1279112 (not condMapEmpty!51908)) mapNonEmpty!51908))

(get-info :version)

(assert (= (and mapNonEmpty!51908 ((_ is ValueCellFull!15887) mapValue!51908)) b!1279114))

(assert (= (and b!1279112 ((_ is ValueCellFull!15887) mapDefault!51908)) b!1279115))

(assert (= start!108384 b!1279112))

(declare-fun m!1173729 () Bool)

(assert (=> start!108384 m!1173729))

(declare-fun m!1173731 () Bool)

(assert (=> start!108384 m!1173731))

(declare-fun m!1173733 () Bool)

(assert (=> start!108384 m!1173733))

(declare-fun m!1173735 () Bool)

(assert (=> b!1279119 m!1173735))

(assert (=> b!1279119 m!1173735))

(declare-fun m!1173737 () Bool)

(assert (=> b!1279119 m!1173737))

(declare-fun m!1173739 () Bool)

(assert (=> mapNonEmpty!51908 m!1173739))

(declare-fun m!1173741 () Bool)

(assert (=> b!1279116 m!1173741))

(declare-fun m!1173743 () Bool)

(assert (=> b!1279113 m!1173743))

(check-sat tp_is_empty!33571 (not b!1279113) (not b_next!27931) (not b!1279116) (not start!108384) (not b!1279119) b_and!45973 (not mapNonEmpty!51908))
(check-sat b_and!45973 (not b_next!27931))
