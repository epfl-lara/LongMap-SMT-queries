; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108510 () Bool)

(assert start!108510)

(declare-fun b_free!28057 () Bool)

(declare-fun b_next!28057 () Bool)

(assert (=> start!108510 (= b_free!28057 (not b_next!28057))))

(declare-fun tp!99281 () Bool)

(declare-fun b_and!46099 () Bool)

(assert (=> start!108510 (= tp!99281 b_and!46099)))

(declare-fun b!1280691 () Bool)

(declare-fun res!850732 () Bool)

(declare-fun e!731762 () Bool)

(assert (=> b!1280691 (=> (not res!850732) (not e!731762))))

(declare-datatypes ((array!84361 0))(
  ( (array!84362 (arr!40685 (Array (_ BitVec 32) (_ BitVec 64))) (size!41237 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84361)

(declare-datatypes ((List!28924 0))(
  ( (Nil!28921) (Cons!28920 (h!30129 (_ BitVec 64)) (t!42456 List!28924)) )
))
(declare-fun arrayNoDuplicates!0 (array!84361 (_ BitVec 32) List!28924) Bool)

(assert (=> b!1280691 (= res!850732 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28921))))

(declare-fun b!1280692 () Bool)

(declare-fun res!850729 () Bool)

(assert (=> b!1280692 (=> (not res!850729) (not e!731762))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1280692 (= res!850729 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41237 _keys!1741)) (not (= (select (arr!40685 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1280693 () Bool)

(declare-fun res!850733 () Bool)

(assert (=> b!1280693 (=> (not res!850733) (not e!731762))))

(declare-datatypes ((V!50033 0))(
  ( (V!50034 (val!16923 Int)) )
))
(declare-fun minValue!1387 () V!50033)

(declare-fun zeroValue!1387 () V!50033)

(declare-datatypes ((ValueCell!15950 0))(
  ( (ValueCellFull!15950 (v!19522 V!50033)) (EmptyCell!15950) )
))
(declare-datatypes ((array!84363 0))(
  ( (array!84364 (arr!40686 (Array (_ BitVec 32) ValueCell!15950)) (size!41238 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84363)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21732 0))(
  ( (tuple2!21733 (_1!10877 (_ BitVec 64)) (_2!10877 V!50033)) )
))
(declare-datatypes ((List!28925 0))(
  ( (Nil!28922) (Cons!28921 (h!30130 tuple2!21732) (t!42457 List!28925)) )
))
(declare-datatypes ((ListLongMap!19389 0))(
  ( (ListLongMap!19390 (toList!9710 List!28925)) )
))
(declare-fun contains!7755 (ListLongMap!19389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4684 (array!84361 array!84363 (_ BitVec 32) (_ BitVec 32) V!50033 V!50033 (_ BitVec 32) Int) ListLongMap!19389)

(assert (=> b!1280693 (= res!850733 (contains!7755 (getCurrentListMap!4684 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280694 () Bool)

(declare-fun e!731765 () Bool)

(declare-fun tp_is_empty!33697 () Bool)

(assert (=> b!1280694 (= e!731765 tp_is_empty!33697)))

(declare-fun b!1280695 () Bool)

(declare-fun e!731766 () Bool)

(declare-fun mapRes!52097 () Bool)

(assert (=> b!1280695 (= e!731766 (and e!731765 mapRes!52097))))

(declare-fun condMapEmpty!52097 () Bool)

(declare-fun mapDefault!52097 () ValueCell!15950)

(assert (=> b!1280695 (= condMapEmpty!52097 (= (arr!40686 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15950)) mapDefault!52097)))))

(declare-fun b!1280696 () Bool)

(assert (=> b!1280696 (= e!731762 (not true))))

(assert (=> b!1280696 (contains!7755 (getCurrentListMap!4684 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42251 0))(
  ( (Unit!42252) )
))
(declare-fun lt!575980 () Unit!42251)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!7 (array!84361 array!84363 (_ BitVec 32) (_ BitVec 32) V!50033 V!50033 (_ BitVec 64) (_ BitVec 32) Int) Unit!42251)

(assert (=> b!1280696 (= lt!575980 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!7 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!52097 () Bool)

(declare-fun tp!99282 () Bool)

(declare-fun e!731764 () Bool)

(assert (=> mapNonEmpty!52097 (= mapRes!52097 (and tp!99282 e!731764))))

(declare-fun mapKey!52097 () (_ BitVec 32))

(declare-fun mapRest!52097 () (Array (_ BitVec 32) ValueCell!15950))

(declare-fun mapValue!52097 () ValueCell!15950)

(assert (=> mapNonEmpty!52097 (= (arr!40686 _values!1445) (store mapRest!52097 mapKey!52097 mapValue!52097))))

(declare-fun res!850727 () Bool)

(assert (=> start!108510 (=> (not res!850727) (not e!731762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108510 (= res!850727 (validMask!0 mask!2175))))

(assert (=> start!108510 e!731762))

(assert (=> start!108510 tp_is_empty!33697))

(assert (=> start!108510 true))

(declare-fun array_inv!31041 (array!84363) Bool)

(assert (=> start!108510 (and (array_inv!31041 _values!1445) e!731766)))

(declare-fun array_inv!31042 (array!84361) Bool)

(assert (=> start!108510 (array_inv!31042 _keys!1741)))

(assert (=> start!108510 tp!99281))

(declare-fun b!1280697 () Bool)

(declare-fun res!850731 () Bool)

(assert (=> b!1280697 (=> (not res!850731) (not e!731762))))

(assert (=> b!1280697 (= res!850731 (and (= (size!41238 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41237 _keys!1741) (size!41238 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280698 () Bool)

(declare-fun res!850728 () Bool)

(assert (=> b!1280698 (=> (not res!850728) (not e!731762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84361 (_ BitVec 32)) Bool)

(assert (=> b!1280698 (= res!850728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280699 () Bool)

(declare-fun res!850730 () Bool)

(assert (=> b!1280699 (=> (not res!850730) (not e!731762))))

(assert (=> b!1280699 (= res!850730 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41237 _keys!1741))))))

(declare-fun mapIsEmpty!52097 () Bool)

(assert (=> mapIsEmpty!52097 mapRes!52097))

(declare-fun b!1280700 () Bool)

(assert (=> b!1280700 (= e!731764 tp_is_empty!33697)))

(assert (= (and start!108510 res!850727) b!1280697))

(assert (= (and b!1280697 res!850731) b!1280698))

(assert (= (and b!1280698 res!850728) b!1280691))

(assert (= (and b!1280691 res!850732) b!1280699))

(assert (= (and b!1280699 res!850730) b!1280693))

(assert (= (and b!1280693 res!850733) b!1280692))

(assert (= (and b!1280692 res!850729) b!1280696))

(assert (= (and b!1280695 condMapEmpty!52097) mapIsEmpty!52097))

(assert (= (and b!1280695 (not condMapEmpty!52097)) mapNonEmpty!52097))

(get-info :version)

(assert (= (and mapNonEmpty!52097 ((_ is ValueCellFull!15950) mapValue!52097)) b!1280700))

(assert (= (and b!1280695 ((_ is ValueCellFull!15950) mapDefault!52097)) b!1280694))

(assert (= start!108510 b!1280695))

(declare-fun m!1174809 () Bool)

(assert (=> mapNonEmpty!52097 m!1174809))

(declare-fun m!1174811 () Bool)

(assert (=> b!1280696 m!1174811))

(assert (=> b!1280696 m!1174811))

(declare-fun m!1174813 () Bool)

(assert (=> b!1280696 m!1174813))

(declare-fun m!1174815 () Bool)

(assert (=> b!1280696 m!1174815))

(declare-fun m!1174817 () Bool)

(assert (=> b!1280692 m!1174817))

(declare-fun m!1174819 () Bool)

(assert (=> b!1280698 m!1174819))

(declare-fun m!1174821 () Bool)

(assert (=> b!1280693 m!1174821))

(assert (=> b!1280693 m!1174821))

(declare-fun m!1174823 () Bool)

(assert (=> b!1280693 m!1174823))

(declare-fun m!1174825 () Bool)

(assert (=> start!108510 m!1174825))

(declare-fun m!1174827 () Bool)

(assert (=> start!108510 m!1174827))

(declare-fun m!1174829 () Bool)

(assert (=> start!108510 m!1174829))

(declare-fun m!1174831 () Bool)

(assert (=> b!1280691 m!1174831))

(check-sat (not b_next!28057) (not b!1280691) tp_is_empty!33697 (not b!1280693) (not b!1280698) (not start!108510) (not mapNonEmpty!52097) b_and!46099 (not b!1280696))
(check-sat b_and!46099 (not b_next!28057))
