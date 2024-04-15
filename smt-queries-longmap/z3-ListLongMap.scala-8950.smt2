; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108426 () Bool)

(assert start!108426)

(declare-fun b_free!27973 () Bool)

(declare-fun b_next!27973 () Bool)

(assert (=> start!108426 (= b_free!27973 (not b_next!27973))))

(declare-fun tp!99030 () Bool)

(declare-fun b_and!46015 () Bool)

(assert (=> start!108426 (= tp!99030 b_and!46015)))

(declare-fun mapNonEmpty!51971 () Bool)

(declare-fun mapRes!51971 () Bool)

(declare-fun tp!99029 () Bool)

(declare-fun e!731136 () Bool)

(assert (=> mapNonEmpty!51971 (= mapRes!51971 (and tp!99029 e!731136))))

(declare-datatypes ((V!49921 0))(
  ( (V!49922 (val!16881 Int)) )
))
(declare-datatypes ((ValueCell!15908 0))(
  ( (ValueCellFull!15908 (v!19480 V!49921)) (EmptyCell!15908) )
))
(declare-fun mapRest!51971 () (Array (_ BitVec 32) ValueCell!15908))

(declare-fun mapValue!51971 () ValueCell!15908)

(declare-datatypes ((array!84201 0))(
  ( (array!84202 (arr!40605 (Array (_ BitVec 32) ValueCell!15908)) (size!41157 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84201)

(declare-fun mapKey!51971 () (_ BitVec 32))

(assert (=> mapNonEmpty!51971 (= (arr!40605 _values!1445) (store mapRest!51971 mapKey!51971 mapValue!51971))))

(declare-fun b!1279625 () Bool)

(declare-fun res!850042 () Bool)

(declare-fun e!731132 () Bool)

(assert (=> b!1279625 (=> (not res!850042) (not e!731132))))

(declare-datatypes ((array!84203 0))(
  ( (array!84204 (arr!40606 (Array (_ BitVec 32) (_ BitVec 64))) (size!41158 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84203)

(declare-datatypes ((List!28866 0))(
  ( (Nil!28863) (Cons!28862 (h!30071 (_ BitVec 64)) (t!42398 List!28866)) )
))
(declare-fun arrayNoDuplicates!0 (array!84203 (_ BitVec 32) List!28866) Bool)

(assert (=> b!1279625 (= res!850042 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28863))))

(declare-fun b!1279626 () Bool)

(declare-fun res!850039 () Bool)

(assert (=> b!1279626 (=> (not res!850039) (not e!731132))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279626 (= res!850039 (and (= (size!41157 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41158 _keys!1741) (size!41157 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279627 () Bool)

(declare-fun res!850041 () Bool)

(assert (=> b!1279627 (=> (not res!850041) (not e!731132))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279627 (= res!850041 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41158 _keys!1741))))))

(declare-fun b!1279628 () Bool)

(declare-fun e!731135 () Bool)

(declare-fun e!731133 () Bool)

(assert (=> b!1279628 (= e!731135 (and e!731133 mapRes!51971))))

(declare-fun condMapEmpty!51971 () Bool)

(declare-fun mapDefault!51971 () ValueCell!15908)

(assert (=> b!1279628 (= condMapEmpty!51971 (= (arr!40605 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15908)) mapDefault!51971)))))

(declare-fun b!1279629 () Bool)

(declare-fun tp_is_empty!33613 () Bool)

(assert (=> b!1279629 (= e!731133 tp_is_empty!33613)))

(declare-fun res!850040 () Bool)

(assert (=> start!108426 (=> (not res!850040) (not e!731132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108426 (= res!850040 (validMask!0 mask!2175))))

(assert (=> start!108426 e!731132))

(assert (=> start!108426 tp_is_empty!33613))

(assert (=> start!108426 true))

(declare-fun array_inv!30991 (array!84201) Bool)

(assert (=> start!108426 (and (array_inv!30991 _values!1445) e!731135)))

(declare-fun array_inv!30992 (array!84203) Bool)

(assert (=> start!108426 (array_inv!30992 _keys!1741)))

(assert (=> start!108426 tp!99030))

(declare-fun mapIsEmpty!51971 () Bool)

(assert (=> mapIsEmpty!51971 mapRes!51971))

(declare-fun b!1279630 () Bool)

(assert (=> b!1279630 (= e!731136 tp_is_empty!33613)))

(declare-fun b!1279631 () Bool)

(assert (=> b!1279631 (= e!731132 false)))

(declare-fun minValue!1387 () V!49921)

(declare-fun zeroValue!1387 () V!49921)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!575854 () Bool)

(declare-datatypes ((tuple2!21678 0))(
  ( (tuple2!21679 (_1!10850 (_ BitVec 64)) (_2!10850 V!49921)) )
))
(declare-datatypes ((List!28867 0))(
  ( (Nil!28864) (Cons!28863 (h!30072 tuple2!21678) (t!42399 List!28867)) )
))
(declare-datatypes ((ListLongMap!19335 0))(
  ( (ListLongMap!19336 (toList!9683 List!28867)) )
))
(declare-fun contains!7728 (ListLongMap!19335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4657 (array!84203 array!84201 (_ BitVec 32) (_ BitVec 32) V!49921 V!49921 (_ BitVec 32) Int) ListLongMap!19335)

(assert (=> b!1279631 (= lt!575854 (contains!7728 (getCurrentListMap!4657 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279632 () Bool)

(declare-fun res!850043 () Bool)

(assert (=> b!1279632 (=> (not res!850043) (not e!731132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84203 (_ BitVec 32)) Bool)

(assert (=> b!1279632 (= res!850043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108426 res!850040) b!1279626))

(assert (= (and b!1279626 res!850039) b!1279632))

(assert (= (and b!1279632 res!850043) b!1279625))

(assert (= (and b!1279625 res!850042) b!1279627))

(assert (= (and b!1279627 res!850041) b!1279631))

(assert (= (and b!1279628 condMapEmpty!51971) mapIsEmpty!51971))

(assert (= (and b!1279628 (not condMapEmpty!51971)) mapNonEmpty!51971))

(get-info :version)

(assert (= (and mapNonEmpty!51971 ((_ is ValueCellFull!15908) mapValue!51971)) b!1279630))

(assert (= (and b!1279628 ((_ is ValueCellFull!15908) mapDefault!51971)) b!1279629))

(assert (= start!108426 b!1279628))

(declare-fun m!1174065 () Bool)

(assert (=> mapNonEmpty!51971 m!1174065))

(declare-fun m!1174067 () Bool)

(assert (=> b!1279632 m!1174067))

(declare-fun m!1174069 () Bool)

(assert (=> start!108426 m!1174069))

(declare-fun m!1174071 () Bool)

(assert (=> start!108426 m!1174071))

(declare-fun m!1174073 () Bool)

(assert (=> start!108426 m!1174073))

(declare-fun m!1174075 () Bool)

(assert (=> b!1279625 m!1174075))

(declare-fun m!1174077 () Bool)

(assert (=> b!1279631 m!1174077))

(assert (=> b!1279631 m!1174077))

(declare-fun m!1174079 () Bool)

(assert (=> b!1279631 m!1174079))

(check-sat b_and!46015 tp_is_empty!33613 (not b!1279625) (not b!1279632) (not b_next!27973) (not mapNonEmpty!51971) (not start!108426) (not b!1279631))
(check-sat b_and!46015 (not b_next!27973))
