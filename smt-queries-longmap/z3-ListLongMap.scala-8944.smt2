; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108390 () Bool)

(assert start!108390)

(declare-fun b_free!27937 () Bool)

(declare-fun b_next!27937 () Bool)

(assert (=> start!108390 (= b_free!27937 (not b_next!27937))))

(declare-fun tp!98921 () Bool)

(declare-fun b_and!45979 () Bool)

(assert (=> start!108390 (= tp!98921 b_and!45979)))

(declare-fun b!1279184 () Bool)

(declare-fun e!730864 () Bool)

(declare-fun e!730866 () Bool)

(declare-fun mapRes!51917 () Bool)

(assert (=> b!1279184 (= e!730864 (and e!730866 mapRes!51917))))

(declare-fun condMapEmpty!51917 () Bool)

(declare-datatypes ((V!49873 0))(
  ( (V!49874 (val!16863 Int)) )
))
(declare-datatypes ((ValueCell!15890 0))(
  ( (ValueCellFull!15890 (v!19462 V!49873)) (EmptyCell!15890) )
))
(declare-datatypes ((array!84131 0))(
  ( (array!84132 (arr!40570 (Array (_ BitVec 32) ValueCell!15890)) (size!41122 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84131)

(declare-fun mapDefault!51917 () ValueCell!15890)

(assert (=> b!1279184 (= condMapEmpty!51917 (= (arr!40570 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15890)) mapDefault!51917)))))

(declare-fun b!1279185 () Bool)

(declare-fun tp_is_empty!33577 () Bool)

(assert (=> b!1279185 (= e!730866 tp_is_empty!33577)))

(declare-fun b!1279186 () Bool)

(declare-fun res!849761 () Bool)

(declare-fun e!730862 () Bool)

(assert (=> b!1279186 (=> (not res!849761) (not e!730862))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84133 0))(
  ( (array!84134 (arr!40571 (Array (_ BitVec 32) (_ BitVec 64))) (size!41123 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84133)

(assert (=> b!1279186 (= res!849761 (and (= (size!41122 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41123 _keys!1741) (size!41122 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279187 () Bool)

(assert (=> b!1279187 (= e!730862 false)))

(declare-fun minValue!1387 () V!49873)

(declare-fun zeroValue!1387 () V!49873)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!575809 () Bool)

(declare-datatypes ((tuple2!21654 0))(
  ( (tuple2!21655 (_1!10838 (_ BitVec 64)) (_2!10838 V!49873)) )
))
(declare-datatypes ((List!28845 0))(
  ( (Nil!28842) (Cons!28841 (h!30050 tuple2!21654) (t!42377 List!28845)) )
))
(declare-datatypes ((ListLongMap!19311 0))(
  ( (ListLongMap!19312 (toList!9671 List!28845)) )
))
(declare-fun contains!7716 (ListLongMap!19311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4645 (array!84133 array!84131 (_ BitVec 32) (_ BitVec 32) V!49873 V!49873 (_ BitVec 32) Int) ListLongMap!19311)

(assert (=> b!1279187 (= lt!575809 (contains!7716 (getCurrentListMap!4645 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279188 () Bool)

(declare-fun res!849760 () Bool)

(assert (=> b!1279188 (=> (not res!849760) (not e!730862))))

(declare-datatypes ((List!28846 0))(
  ( (Nil!28843) (Cons!28842 (h!30051 (_ BitVec 64)) (t!42378 List!28846)) )
))
(declare-fun arrayNoDuplicates!0 (array!84133 (_ BitVec 32) List!28846) Bool)

(assert (=> b!1279188 (= res!849760 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28843))))

(declare-fun mapNonEmpty!51917 () Bool)

(declare-fun tp!98922 () Bool)

(declare-fun e!730865 () Bool)

(assert (=> mapNonEmpty!51917 (= mapRes!51917 (and tp!98922 e!730865))))

(declare-fun mapValue!51917 () ValueCell!15890)

(declare-fun mapRest!51917 () (Array (_ BitVec 32) ValueCell!15890))

(declare-fun mapKey!51917 () (_ BitVec 32))

(assert (=> mapNonEmpty!51917 (= (arr!40570 _values!1445) (store mapRest!51917 mapKey!51917 mapValue!51917))))

(declare-fun b!1279189 () Bool)

(declare-fun res!849762 () Bool)

(assert (=> b!1279189 (=> (not res!849762) (not e!730862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84133 (_ BitVec 32)) Bool)

(assert (=> b!1279189 (= res!849762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279190 () Bool)

(assert (=> b!1279190 (= e!730865 tp_is_empty!33577)))

(declare-fun mapIsEmpty!51917 () Bool)

(assert (=> mapIsEmpty!51917 mapRes!51917))

(declare-fun b!1279191 () Bool)

(declare-fun res!849764 () Bool)

(assert (=> b!1279191 (=> (not res!849764) (not e!730862))))

(assert (=> b!1279191 (= res!849764 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41123 _keys!1741))))))

(declare-fun res!849763 () Bool)

(assert (=> start!108390 (=> (not res!849763) (not e!730862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108390 (= res!849763 (validMask!0 mask!2175))))

(assert (=> start!108390 e!730862))

(assert (=> start!108390 tp_is_empty!33577))

(assert (=> start!108390 true))

(declare-fun array_inv!30967 (array!84131) Bool)

(assert (=> start!108390 (and (array_inv!30967 _values!1445) e!730864)))

(declare-fun array_inv!30968 (array!84133) Bool)

(assert (=> start!108390 (array_inv!30968 _keys!1741)))

(assert (=> start!108390 tp!98921))

(assert (= (and start!108390 res!849763) b!1279186))

(assert (= (and b!1279186 res!849761) b!1279189))

(assert (= (and b!1279189 res!849762) b!1279188))

(assert (= (and b!1279188 res!849760) b!1279191))

(assert (= (and b!1279191 res!849764) b!1279187))

(assert (= (and b!1279184 condMapEmpty!51917) mapIsEmpty!51917))

(assert (= (and b!1279184 (not condMapEmpty!51917)) mapNonEmpty!51917))

(get-info :version)

(assert (= (and mapNonEmpty!51917 ((_ is ValueCellFull!15890) mapValue!51917)) b!1279190))

(assert (= (and b!1279184 ((_ is ValueCellFull!15890) mapDefault!51917)) b!1279185))

(assert (= start!108390 b!1279184))

(declare-fun m!1173777 () Bool)

(assert (=> b!1279189 m!1173777))

(declare-fun m!1173779 () Bool)

(assert (=> b!1279187 m!1173779))

(assert (=> b!1279187 m!1173779))

(declare-fun m!1173781 () Bool)

(assert (=> b!1279187 m!1173781))

(declare-fun m!1173783 () Bool)

(assert (=> b!1279188 m!1173783))

(declare-fun m!1173785 () Bool)

(assert (=> start!108390 m!1173785))

(declare-fun m!1173787 () Bool)

(assert (=> start!108390 m!1173787))

(declare-fun m!1173789 () Bool)

(assert (=> start!108390 m!1173789))

(declare-fun m!1173791 () Bool)

(assert (=> mapNonEmpty!51917 m!1173791))

(check-sat (not b!1279189) b_and!45979 (not b!1279188) (not mapNonEmpty!51917) (not b_next!27937) tp_is_empty!33577 (not b!1279187) (not start!108390))
(check-sat b_and!45979 (not b_next!27937))
