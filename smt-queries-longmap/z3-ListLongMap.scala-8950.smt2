; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108428 () Bool)

(assert start!108428)

(declare-fun b_free!27975 () Bool)

(declare-fun b_next!27975 () Bool)

(assert (=> start!108428 (= b_free!27975 (not b_next!27975))))

(declare-fun tp!99035 () Bool)

(declare-fun b_and!46035 () Bool)

(assert (=> start!108428 (= tp!99035 b_and!46035)))

(declare-fun b!1279713 () Bool)

(declare-fun res!850083 () Bool)

(declare-fun e!731179 () Bool)

(assert (=> b!1279713 (=> (not res!850083) (not e!731179))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49923 0))(
  ( (V!49924 (val!16882 Int)) )
))
(declare-datatypes ((ValueCell!15909 0))(
  ( (ValueCellFull!15909 (v!19482 V!49923)) (EmptyCell!15909) )
))
(declare-datatypes ((array!84312 0))(
  ( (array!84313 (arr!40660 (Array (_ BitVec 32) ValueCell!15909)) (size!41210 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84312)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84314 0))(
  ( (array!84315 (arr!40661 (Array (_ BitVec 32) (_ BitVec 64))) (size!41211 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84314)

(assert (=> b!1279713 (= res!850083 (and (= (size!41210 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41211 _keys!1741) (size!41210 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279714 () Bool)

(declare-fun e!731177 () Bool)

(declare-fun tp_is_empty!33615 () Bool)

(assert (=> b!1279714 (= e!731177 tp_is_empty!33615)))

(declare-fun mapNonEmpty!51974 () Bool)

(declare-fun mapRes!51974 () Bool)

(declare-fun tp!99034 () Bool)

(assert (=> mapNonEmpty!51974 (= mapRes!51974 (and tp!99034 e!731177))))

(declare-fun mapValue!51974 () ValueCell!15909)

(declare-fun mapRest!51974 () (Array (_ BitVec 32) ValueCell!15909))

(declare-fun mapKey!51974 () (_ BitVec 32))

(assert (=> mapNonEmpty!51974 (= (arr!40660 _values!1445) (store mapRest!51974 mapKey!51974 mapValue!51974))))

(declare-fun b!1279715 () Bool)

(declare-fun e!731178 () Bool)

(assert (=> b!1279715 (= e!731178 tp_is_empty!33615)))

(declare-fun b!1279716 () Bool)

(declare-fun e!731176 () Bool)

(assert (=> b!1279716 (= e!731176 (and e!731178 mapRes!51974))))

(declare-fun condMapEmpty!51974 () Bool)

(declare-fun mapDefault!51974 () ValueCell!15909)

(assert (=> b!1279716 (= condMapEmpty!51974 (= (arr!40660 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15909)) mapDefault!51974)))))

(declare-fun b!1279717 () Bool)

(declare-fun res!850084 () Bool)

(assert (=> b!1279717 (=> (not res!850084) (not e!731179))))

(declare-datatypes ((List!28799 0))(
  ( (Nil!28796) (Cons!28795 (h!30004 (_ BitVec 64)) (t!42339 List!28799)) )
))
(declare-fun arrayNoDuplicates!0 (array!84314 (_ BitVec 32) List!28799) Bool)

(assert (=> b!1279717 (= res!850084 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28796))))

(declare-fun b!1279718 () Bool)

(declare-fun res!850085 () Bool)

(assert (=> b!1279718 (=> (not res!850085) (not e!731179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84314 (_ BitVec 32)) Bool)

(assert (=> b!1279718 (= res!850085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279719 () Bool)

(declare-fun res!850081 () Bool)

(assert (=> b!1279719 (=> (not res!850081) (not e!731179))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279719 (= res!850081 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41211 _keys!1741))))))

(declare-fun res!850082 () Bool)

(assert (=> start!108428 (=> (not res!850082) (not e!731179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108428 (= res!850082 (validMask!0 mask!2175))))

(assert (=> start!108428 e!731179))

(assert (=> start!108428 tp_is_empty!33615))

(assert (=> start!108428 true))

(declare-fun array_inv!30867 (array!84312) Bool)

(assert (=> start!108428 (and (array_inv!30867 _values!1445) e!731176)))

(declare-fun array_inv!30868 (array!84314) Bool)

(assert (=> start!108428 (array_inv!30868 _keys!1741)))

(assert (=> start!108428 tp!99035))

(declare-fun b!1279720 () Bool)

(assert (=> b!1279720 (= e!731179 false)))

(declare-fun minValue!1387 () V!49923)

(declare-fun zeroValue!1387 () V!49923)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576035 () Bool)

(declare-datatypes ((tuple2!21600 0))(
  ( (tuple2!21601 (_1!10811 (_ BitVec 64)) (_2!10811 V!49923)) )
))
(declare-datatypes ((List!28800 0))(
  ( (Nil!28797) (Cons!28796 (h!30005 tuple2!21600) (t!42340 List!28800)) )
))
(declare-datatypes ((ListLongMap!19257 0))(
  ( (ListLongMap!19258 (toList!9644 List!28800)) )
))
(declare-fun contains!7759 (ListLongMap!19257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4728 (array!84314 array!84312 (_ BitVec 32) (_ BitVec 32) V!49923 V!49923 (_ BitVec 32) Int) ListLongMap!19257)

(assert (=> b!1279720 (= lt!576035 (contains!7759 (getCurrentListMap!4728 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!51974 () Bool)

(assert (=> mapIsEmpty!51974 mapRes!51974))

(assert (= (and start!108428 res!850082) b!1279713))

(assert (= (and b!1279713 res!850083) b!1279718))

(assert (= (and b!1279718 res!850085) b!1279717))

(assert (= (and b!1279717 res!850084) b!1279719))

(assert (= (and b!1279719 res!850081) b!1279720))

(assert (= (and b!1279716 condMapEmpty!51974) mapIsEmpty!51974))

(assert (= (and b!1279716 (not condMapEmpty!51974)) mapNonEmpty!51974))

(get-info :version)

(assert (= (and mapNonEmpty!51974 ((_ is ValueCellFull!15909) mapValue!51974)) b!1279714))

(assert (= (and b!1279716 ((_ is ValueCellFull!15909) mapDefault!51974)) b!1279715))

(assert (= start!108428 b!1279716))

(declare-fun m!1174581 () Bool)

(assert (=> b!1279720 m!1174581))

(assert (=> b!1279720 m!1174581))

(declare-fun m!1174583 () Bool)

(assert (=> b!1279720 m!1174583))

(declare-fun m!1174585 () Bool)

(assert (=> start!108428 m!1174585))

(declare-fun m!1174587 () Bool)

(assert (=> start!108428 m!1174587))

(declare-fun m!1174589 () Bool)

(assert (=> start!108428 m!1174589))

(declare-fun m!1174591 () Bool)

(assert (=> b!1279717 m!1174591))

(declare-fun m!1174593 () Bool)

(assert (=> b!1279718 m!1174593))

(declare-fun m!1174595 () Bool)

(assert (=> mapNonEmpty!51974 m!1174595))

(check-sat (not mapNonEmpty!51974) (not b_next!27975) b_and!46035 (not b!1279717) tp_is_empty!33615 (not b!1279718) (not start!108428) (not b!1279720))
(check-sat b_and!46035 (not b_next!27975))
