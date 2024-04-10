; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109020 () Bool)

(assert start!109020)

(declare-fun b_free!28509 () Bool)

(declare-fun b_next!28509 () Bool)

(assert (=> start!109020 (= b_free!28509 (not b_next!28509))))

(declare-fun tp!100646 () Bool)

(declare-fun b_and!46599 () Bool)

(assert (=> start!109020 (= tp!100646 b_and!46599)))

(declare-fun b!1288445 () Bool)

(declare-fun res!855780 () Bool)

(declare-fun e!735722 () Bool)

(assert (=> b!1288445 (=> (not res!855780) (not e!735722))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85342 0))(
  ( (array!85343 (arr!41172 (Array (_ BitVec 32) (_ BitVec 64))) (size!41722 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85342)

(assert (=> b!1288445 (= res!855780 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41722 _keys!1741))))))

(declare-fun b!1288446 () Bool)

(declare-fun e!735721 () Bool)

(assert (=> b!1288446 (= e!735721 true)))

(declare-datatypes ((V!50635 0))(
  ( (V!50636 (val!17149 Int)) )
))
(declare-datatypes ((tuple2!22012 0))(
  ( (tuple2!22013 (_1!11017 (_ BitVec 64)) (_2!11017 V!50635)) )
))
(declare-datatypes ((List!29186 0))(
  ( (Nil!29183) (Cons!29182 (h!30391 tuple2!22012) (t!42750 List!29186)) )
))
(declare-datatypes ((ListLongMap!19669 0))(
  ( (ListLongMap!19670 (toList!9850 List!29186)) )
))
(declare-fun lt!577992 () ListLongMap!19669)

(declare-fun zeroValue!1387 () V!50635)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7968 (ListLongMap!19669 (_ BitVec 64)) Bool)

(declare-fun +!4326 (ListLongMap!19669 tuple2!22012) ListLongMap!19669)

(assert (=> b!1288446 (not (contains!7968 (+!4326 lt!577992 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42620 0))(
  ( (Unit!42621) )
))
(declare-fun lt!577994 () Unit!42620)

(declare-fun addStillNotContains!344 (ListLongMap!19669 (_ BitVec 64) V!50635 (_ BitVec 64)) Unit!42620)

(assert (=> b!1288446 (= lt!577994 (addStillNotContains!344 lt!577992 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50635)

(declare-datatypes ((ValueCell!16176 0))(
  ( (ValueCellFull!16176 (v!19752 V!50635)) (EmptyCell!16176) )
))
(declare-datatypes ((array!85344 0))(
  ( (array!85345 (arr!41173 (Array (_ BitVec 32) ValueCell!16176)) (size!41723 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85344)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5957 (array!85342 array!85344 (_ BitVec 32) (_ BitVec 32) V!50635 V!50635 (_ BitVec 32) Int) ListLongMap!19669)

(assert (=> b!1288446 (= lt!577992 (getCurrentListMapNoExtraKeys!5957 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288447 () Bool)

(assert (=> b!1288447 (= e!735722 (not e!735721))))

(declare-fun res!855775 () Bool)

(assert (=> b!1288447 (=> res!855775 e!735721)))

(assert (=> b!1288447 (= res!855775 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288447 (not (contains!7968 (ListLongMap!19670 Nil!29183) k0!1205))))

(declare-fun lt!577993 () Unit!42620)

(declare-fun emptyContainsNothing!39 ((_ BitVec 64)) Unit!42620)

(assert (=> b!1288447 (= lt!577993 (emptyContainsNothing!39 k0!1205))))

(declare-fun b!1288448 () Bool)

(declare-fun res!855772 () Bool)

(assert (=> b!1288448 (=> (not res!855772) (not e!735722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85342 (_ BitVec 32)) Bool)

(assert (=> b!1288448 (= res!855772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288449 () Bool)

(declare-fun res!855774 () Bool)

(assert (=> b!1288449 (=> (not res!855774) (not e!735722))))

(assert (=> b!1288449 (= res!855774 (and (= (size!41723 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41722 _keys!1741) (size!41723 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288450 () Bool)

(declare-fun res!855773 () Bool)

(assert (=> b!1288450 (=> (not res!855773) (not e!735722))))

(declare-fun getCurrentListMap!4915 (array!85342 array!85344 (_ BitVec 32) (_ BitVec 32) V!50635 V!50635 (_ BitVec 32) Int) ListLongMap!19669)

(assert (=> b!1288450 (= res!855773 (contains!7968 (getCurrentListMap!4915 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52784 () Bool)

(declare-fun mapRes!52784 () Bool)

(declare-fun tp!100645 () Bool)

(declare-fun e!735719 () Bool)

(assert (=> mapNonEmpty!52784 (= mapRes!52784 (and tp!100645 e!735719))))

(declare-fun mapKey!52784 () (_ BitVec 32))

(declare-fun mapRest!52784 () (Array (_ BitVec 32) ValueCell!16176))

(declare-fun mapValue!52784 () ValueCell!16176)

(assert (=> mapNonEmpty!52784 (= (arr!41173 _values!1445) (store mapRest!52784 mapKey!52784 mapValue!52784))))

(declare-fun b!1288451 () Bool)

(declare-fun tp_is_empty!34149 () Bool)

(assert (=> b!1288451 (= e!735719 tp_is_empty!34149)))

(declare-fun b!1288452 () Bool)

(declare-fun e!735717 () Bool)

(declare-fun e!735718 () Bool)

(assert (=> b!1288452 (= e!735717 (and e!735718 mapRes!52784))))

(declare-fun condMapEmpty!52784 () Bool)

(declare-fun mapDefault!52784 () ValueCell!16176)

(assert (=> b!1288452 (= condMapEmpty!52784 (= (arr!41173 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16176)) mapDefault!52784)))))

(declare-fun b!1288453 () Bool)

(declare-fun res!855776 () Bool)

(assert (=> b!1288453 (=> (not res!855776) (not e!735722))))

(declare-datatypes ((List!29187 0))(
  ( (Nil!29184) (Cons!29183 (h!30392 (_ BitVec 64)) (t!42751 List!29187)) )
))
(declare-fun arrayNoDuplicates!0 (array!85342 (_ BitVec 32) List!29187) Bool)

(assert (=> b!1288453 (= res!855776 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29184))))

(declare-fun mapIsEmpty!52784 () Bool)

(assert (=> mapIsEmpty!52784 mapRes!52784))

(declare-fun b!1288455 () Bool)

(declare-fun res!855778 () Bool)

(assert (=> b!1288455 (=> (not res!855778) (not e!735722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288455 (= res!855778 (not (validKeyInArray!0 (select (arr!41172 _keys!1741) from!2144))))))

(declare-fun b!1288456 () Bool)

(declare-fun res!855779 () Bool)

(assert (=> b!1288456 (=> (not res!855779) (not e!735722))))

(assert (=> b!1288456 (= res!855779 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41722 _keys!1741))))))

(declare-fun b!1288454 () Bool)

(assert (=> b!1288454 (= e!735718 tp_is_empty!34149)))

(declare-fun res!855777 () Bool)

(assert (=> start!109020 (=> (not res!855777) (not e!735722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109020 (= res!855777 (validMask!0 mask!2175))))

(assert (=> start!109020 e!735722))

(assert (=> start!109020 tp_is_empty!34149))

(assert (=> start!109020 true))

(declare-fun array_inv!31219 (array!85344) Bool)

(assert (=> start!109020 (and (array_inv!31219 _values!1445) e!735717)))

(declare-fun array_inv!31220 (array!85342) Bool)

(assert (=> start!109020 (array_inv!31220 _keys!1741)))

(assert (=> start!109020 tp!100646))

(assert (= (and start!109020 res!855777) b!1288449))

(assert (= (and b!1288449 res!855774) b!1288448))

(assert (= (and b!1288448 res!855772) b!1288453))

(assert (= (and b!1288453 res!855776) b!1288445))

(assert (= (and b!1288445 res!855780) b!1288450))

(assert (= (and b!1288450 res!855773) b!1288456))

(assert (= (and b!1288456 res!855779) b!1288455))

(assert (= (and b!1288455 res!855778) b!1288447))

(assert (= (and b!1288447 (not res!855775)) b!1288446))

(assert (= (and b!1288452 condMapEmpty!52784) mapIsEmpty!52784))

(assert (= (and b!1288452 (not condMapEmpty!52784)) mapNonEmpty!52784))

(get-info :version)

(assert (= (and mapNonEmpty!52784 ((_ is ValueCellFull!16176) mapValue!52784)) b!1288451))

(assert (= (and b!1288452 ((_ is ValueCellFull!16176) mapDefault!52784)) b!1288454))

(assert (= start!109020 b!1288452))

(declare-fun m!1181059 () Bool)

(assert (=> start!109020 m!1181059))

(declare-fun m!1181061 () Bool)

(assert (=> start!109020 m!1181061))

(declare-fun m!1181063 () Bool)

(assert (=> start!109020 m!1181063))

(declare-fun m!1181065 () Bool)

(assert (=> b!1288448 m!1181065))

(declare-fun m!1181067 () Bool)

(assert (=> b!1288447 m!1181067))

(declare-fun m!1181069 () Bool)

(assert (=> b!1288447 m!1181069))

(declare-fun m!1181071 () Bool)

(assert (=> b!1288453 m!1181071))

(declare-fun m!1181073 () Bool)

(assert (=> mapNonEmpty!52784 m!1181073))

(declare-fun m!1181075 () Bool)

(assert (=> b!1288446 m!1181075))

(assert (=> b!1288446 m!1181075))

(declare-fun m!1181077 () Bool)

(assert (=> b!1288446 m!1181077))

(declare-fun m!1181079 () Bool)

(assert (=> b!1288446 m!1181079))

(declare-fun m!1181081 () Bool)

(assert (=> b!1288446 m!1181081))

(declare-fun m!1181083 () Bool)

(assert (=> b!1288455 m!1181083))

(assert (=> b!1288455 m!1181083))

(declare-fun m!1181085 () Bool)

(assert (=> b!1288455 m!1181085))

(declare-fun m!1181087 () Bool)

(assert (=> b!1288450 m!1181087))

(assert (=> b!1288450 m!1181087))

(declare-fun m!1181089 () Bool)

(assert (=> b!1288450 m!1181089))

(check-sat tp_is_empty!34149 (not mapNonEmpty!52784) (not start!109020) (not b!1288446) b_and!46599 (not b!1288447) (not b_next!28509) (not b!1288448) (not b!1288455) (not b!1288453) (not b!1288450))
(check-sat b_and!46599 (not b_next!28509))
