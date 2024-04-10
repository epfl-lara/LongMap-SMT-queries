; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108380 () Bool)

(assert start!108380)

(declare-fun b_free!27927 () Bool)

(declare-fun b_next!27927 () Bool)

(assert (=> start!108380 (= b_free!27927 (not b_next!27927))))

(declare-fun tp!98890 () Bool)

(declare-fun b_and!45987 () Bool)

(assert (=> start!108380 (= tp!98890 b_and!45987)))

(declare-fun mapNonEmpty!51902 () Bool)

(declare-fun mapRes!51902 () Bool)

(declare-fun tp!98891 () Bool)

(declare-fun e!730818 () Bool)

(assert (=> mapNonEmpty!51902 (= mapRes!51902 (and tp!98891 e!730818))))

(declare-datatypes ((V!49859 0))(
  ( (V!49860 (val!16858 Int)) )
))
(declare-datatypes ((ValueCell!15885 0))(
  ( (ValueCellFull!15885 (v!19458 V!49859)) (EmptyCell!15885) )
))
(declare-fun mapValue!51902 () ValueCell!15885)

(declare-datatypes ((array!84222 0))(
  ( (array!84223 (arr!40615 (Array (_ BitVec 32) ValueCell!15885)) (size!41165 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84222)

(declare-fun mapRest!51902 () (Array (_ BitVec 32) ValueCell!15885))

(declare-fun mapKey!51902 () (_ BitVec 32))

(assert (=> mapNonEmpty!51902 (= (arr!40615 _values!1445) (store mapRest!51902 mapKey!51902 mapValue!51902))))

(declare-fun mapIsEmpty!51902 () Bool)

(assert (=> mapIsEmpty!51902 mapRes!51902))

(declare-fun res!849712 () Bool)

(declare-fun e!730816 () Bool)

(assert (=> start!108380 (=> (not res!849712) (not e!730816))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108380 (= res!849712 (validMask!0 mask!2175))))

(assert (=> start!108380 e!730816))

(declare-fun tp_is_empty!33567 () Bool)

(assert (=> start!108380 tp_is_empty!33567))

(assert (=> start!108380 true))

(declare-fun e!730817 () Bool)

(declare-fun array_inv!30837 (array!84222) Bool)

(assert (=> start!108380 (and (array_inv!30837 _values!1445) e!730817)))

(declare-datatypes ((array!84224 0))(
  ( (array!84225 (arr!40616 (Array (_ BitVec 32) (_ BitVec 64))) (size!41166 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84224)

(declare-fun array_inv!30838 (array!84224) Bool)

(assert (=> start!108380 (array_inv!30838 _keys!1741)))

(assert (=> start!108380 tp!98890))

(declare-fun b!1279128 () Bool)

(declare-fun res!849713 () Bool)

(assert (=> b!1279128 (=> (not res!849713) (not e!730816))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279128 (= res!849713 (and (= (size!41165 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41166 _keys!1741) (size!41165 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279129 () Bool)

(declare-fun res!849714 () Bool)

(assert (=> b!1279129 (=> (not res!849714) (not e!730816))))

(declare-datatypes ((List!28765 0))(
  ( (Nil!28762) (Cons!28761 (h!29970 (_ BitVec 64)) (t!42305 List!28765)) )
))
(declare-fun arrayNoDuplicates!0 (array!84224 (_ BitVec 32) List!28765) Bool)

(assert (=> b!1279129 (= res!849714 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28762))))

(declare-fun b!1279130 () Bool)

(declare-fun e!730820 () Bool)

(assert (=> b!1279130 (= e!730817 (and e!730820 mapRes!51902))))

(declare-fun condMapEmpty!51902 () Bool)

(declare-fun mapDefault!51902 () ValueCell!15885)

(assert (=> b!1279130 (= condMapEmpty!51902 (= (arr!40615 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15885)) mapDefault!51902)))))

(declare-fun b!1279131 () Bool)

(assert (=> b!1279131 (= e!730820 tp_is_empty!33567)))

(declare-fun b!1279132 () Bool)

(assert (=> b!1279132 (= e!730818 tp_is_empty!33567)))

(declare-fun b!1279133 () Bool)

(declare-fun res!849716 () Bool)

(assert (=> b!1279133 (=> (not res!849716) (not e!730816))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279133 (= res!849716 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41166 _keys!1741))))))

(declare-fun b!1279134 () Bool)

(assert (=> b!1279134 (= e!730816 false)))

(declare-fun zeroValue!1387 () V!49859)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun minValue!1387 () V!49859)

(declare-fun lt!575972 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21566 0))(
  ( (tuple2!21567 (_1!10794 (_ BitVec 64)) (_2!10794 V!49859)) )
))
(declare-datatypes ((List!28766 0))(
  ( (Nil!28763) (Cons!28762 (h!29971 tuple2!21566) (t!42306 List!28766)) )
))
(declare-datatypes ((ListLongMap!19223 0))(
  ( (ListLongMap!19224 (toList!9627 List!28766)) )
))
(declare-fun contains!7742 (ListLongMap!19223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4711 (array!84224 array!84222 (_ BitVec 32) (_ BitVec 32) V!49859 V!49859 (_ BitVec 32) Int) ListLongMap!19223)

(assert (=> b!1279134 (= lt!575972 (contains!7742 (getCurrentListMap!4711 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279135 () Bool)

(declare-fun res!849715 () Bool)

(assert (=> b!1279135 (=> (not res!849715) (not e!730816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84224 (_ BitVec 32)) Bool)

(assert (=> b!1279135 (= res!849715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108380 res!849712) b!1279128))

(assert (= (and b!1279128 res!849713) b!1279135))

(assert (= (and b!1279135 res!849715) b!1279129))

(assert (= (and b!1279129 res!849714) b!1279133))

(assert (= (and b!1279133 res!849716) b!1279134))

(assert (= (and b!1279130 condMapEmpty!51902) mapIsEmpty!51902))

(assert (= (and b!1279130 (not condMapEmpty!51902)) mapNonEmpty!51902))

(get-info :version)

(assert (= (and mapNonEmpty!51902 ((_ is ValueCellFull!15885) mapValue!51902)) b!1279132))

(assert (= (and b!1279130 ((_ is ValueCellFull!15885) mapDefault!51902)) b!1279131))

(assert (= start!108380 b!1279130))

(declare-fun m!1174197 () Bool)

(assert (=> b!1279135 m!1174197))

(declare-fun m!1174199 () Bool)

(assert (=> mapNonEmpty!51902 m!1174199))

(declare-fun m!1174201 () Bool)

(assert (=> start!108380 m!1174201))

(declare-fun m!1174203 () Bool)

(assert (=> start!108380 m!1174203))

(declare-fun m!1174205 () Bool)

(assert (=> start!108380 m!1174205))

(declare-fun m!1174207 () Bool)

(assert (=> b!1279129 m!1174207))

(declare-fun m!1174209 () Bool)

(assert (=> b!1279134 m!1174209))

(assert (=> b!1279134 m!1174209))

(declare-fun m!1174211 () Bool)

(assert (=> b!1279134 m!1174211))

(check-sat (not b!1279129) (not b!1279135) (not b!1279134) b_and!45987 (not mapNonEmpty!51902) (not start!108380) tp_is_empty!33567 (not b_next!27927))
(check-sat b_and!45987 (not b_next!27927))
