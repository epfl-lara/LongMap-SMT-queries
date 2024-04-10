; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108386 () Bool)

(assert start!108386)

(declare-fun b_free!27933 () Bool)

(declare-fun b_next!27933 () Bool)

(assert (=> start!108386 (= b_free!27933 (not b_next!27933))))

(declare-fun tp!98908 () Bool)

(declare-fun b_and!45993 () Bool)

(assert (=> start!108386 (= tp!98908 b_and!45993)))

(declare-fun b!1279200 () Bool)

(declare-fun e!730861 () Bool)

(assert (=> b!1279200 (= e!730861 false)))

(declare-datatypes ((V!49867 0))(
  ( (V!49868 (val!16861 Int)) )
))
(declare-fun minValue!1387 () V!49867)

(declare-fun zeroValue!1387 () V!49867)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575981 () Bool)

(declare-datatypes ((ValueCell!15888 0))(
  ( (ValueCellFull!15888 (v!19461 V!49867)) (EmptyCell!15888) )
))
(declare-datatypes ((array!84234 0))(
  ( (array!84235 (arr!40621 (Array (_ BitVec 32) ValueCell!15888)) (size!41171 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84234)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!84236 0))(
  ( (array!84237 (arr!40622 (Array (_ BitVec 32) (_ BitVec 64))) (size!41172 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84236)

(declare-datatypes ((tuple2!21570 0))(
  ( (tuple2!21571 (_1!10796 (_ BitVec 64)) (_2!10796 V!49867)) )
))
(declare-datatypes ((List!28770 0))(
  ( (Nil!28767) (Cons!28766 (h!29975 tuple2!21570) (t!42310 List!28770)) )
))
(declare-datatypes ((ListLongMap!19227 0))(
  ( (ListLongMap!19228 (toList!9629 List!28770)) )
))
(declare-fun contains!7744 (ListLongMap!19227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4713 (array!84236 array!84234 (_ BitVec 32) (_ BitVec 32) V!49867 V!49867 (_ BitVec 32) Int) ListLongMap!19227)

(assert (=> b!1279200 (= lt!575981 (contains!7744 (getCurrentListMap!4713 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!51911 () Bool)

(declare-fun mapRes!51911 () Bool)

(assert (=> mapIsEmpty!51911 mapRes!51911))

(declare-fun b!1279201 () Bool)

(declare-fun e!730864 () Bool)

(declare-fun tp_is_empty!33573 () Bool)

(assert (=> b!1279201 (= e!730864 tp_is_empty!33573)))

(declare-fun b!1279202 () Bool)

(declare-fun res!849761 () Bool)

(assert (=> b!1279202 (=> (not res!849761) (not e!730861))))

(declare-datatypes ((List!28771 0))(
  ( (Nil!28768) (Cons!28767 (h!29976 (_ BitVec 64)) (t!42311 List!28771)) )
))
(declare-fun arrayNoDuplicates!0 (array!84236 (_ BitVec 32) List!28771) Bool)

(assert (=> b!1279202 (= res!849761 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28768))))

(declare-fun b!1279203 () Bool)

(declare-fun e!730863 () Bool)

(assert (=> b!1279203 (= e!730863 tp_is_empty!33573)))

(declare-fun b!1279204 () Bool)

(declare-fun e!730865 () Bool)

(assert (=> b!1279204 (= e!730865 (and e!730863 mapRes!51911))))

(declare-fun condMapEmpty!51911 () Bool)

(declare-fun mapDefault!51911 () ValueCell!15888)

(assert (=> b!1279204 (= condMapEmpty!51911 (= (arr!40621 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15888)) mapDefault!51911)))))

(declare-fun b!1279205 () Bool)

(declare-fun res!849760 () Bool)

(assert (=> b!1279205 (=> (not res!849760) (not e!730861))))

(assert (=> b!1279205 (= res!849760 (and (= (size!41171 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41172 _keys!1741) (size!41171 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279206 () Bool)

(declare-fun res!849758 () Bool)

(assert (=> b!1279206 (=> (not res!849758) (not e!730861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84236 (_ BitVec 32)) Bool)

(assert (=> b!1279206 (= res!849758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279207 () Bool)

(declare-fun res!849759 () Bool)

(assert (=> b!1279207 (=> (not res!849759) (not e!730861))))

(assert (=> b!1279207 (= res!849759 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41172 _keys!1741))))))

(declare-fun res!849757 () Bool)

(assert (=> start!108386 (=> (not res!849757) (not e!730861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108386 (= res!849757 (validMask!0 mask!2175))))

(assert (=> start!108386 e!730861))

(assert (=> start!108386 tp_is_empty!33573))

(assert (=> start!108386 true))

(declare-fun array_inv!30841 (array!84234) Bool)

(assert (=> start!108386 (and (array_inv!30841 _values!1445) e!730865)))

(declare-fun array_inv!30842 (array!84236) Bool)

(assert (=> start!108386 (array_inv!30842 _keys!1741)))

(assert (=> start!108386 tp!98908))

(declare-fun mapNonEmpty!51911 () Bool)

(declare-fun tp!98909 () Bool)

(assert (=> mapNonEmpty!51911 (= mapRes!51911 (and tp!98909 e!730864))))

(declare-fun mapKey!51911 () (_ BitVec 32))

(declare-fun mapRest!51911 () (Array (_ BitVec 32) ValueCell!15888))

(declare-fun mapValue!51911 () ValueCell!15888)

(assert (=> mapNonEmpty!51911 (= (arr!40621 _values!1445) (store mapRest!51911 mapKey!51911 mapValue!51911))))

(assert (= (and start!108386 res!849757) b!1279205))

(assert (= (and b!1279205 res!849760) b!1279206))

(assert (= (and b!1279206 res!849758) b!1279202))

(assert (= (and b!1279202 res!849761) b!1279207))

(assert (= (and b!1279207 res!849759) b!1279200))

(assert (= (and b!1279204 condMapEmpty!51911) mapIsEmpty!51911))

(assert (= (and b!1279204 (not condMapEmpty!51911)) mapNonEmpty!51911))

(get-info :version)

(assert (= (and mapNonEmpty!51911 ((_ is ValueCellFull!15888) mapValue!51911)) b!1279201))

(assert (= (and b!1279204 ((_ is ValueCellFull!15888) mapDefault!51911)) b!1279203))

(assert (= start!108386 b!1279204))

(declare-fun m!1174245 () Bool)

(assert (=> b!1279206 m!1174245))

(declare-fun m!1174247 () Bool)

(assert (=> start!108386 m!1174247))

(declare-fun m!1174249 () Bool)

(assert (=> start!108386 m!1174249))

(declare-fun m!1174251 () Bool)

(assert (=> start!108386 m!1174251))

(declare-fun m!1174253 () Bool)

(assert (=> mapNonEmpty!51911 m!1174253))

(declare-fun m!1174255 () Bool)

(assert (=> b!1279200 m!1174255))

(assert (=> b!1279200 m!1174255))

(declare-fun m!1174257 () Bool)

(assert (=> b!1279200 m!1174257))

(declare-fun m!1174259 () Bool)

(assert (=> b!1279202 m!1174259))

(check-sat (not b_next!27933) b_and!45993 tp_is_empty!33573 (not mapNonEmpty!51911) (not b!1279206) (not b!1279200) (not b!1279202) (not start!108386))
(check-sat b_and!45993 (not b_next!27933))
