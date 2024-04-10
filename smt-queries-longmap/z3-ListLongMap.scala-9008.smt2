; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108810 () Bool)

(assert start!108810)

(declare-fun b_free!28323 () Bool)

(declare-fun b_next!28323 () Bool)

(assert (=> start!108810 (= b_free!28323 (not b_next!28323))))

(declare-fun tp!100084 () Bool)

(declare-fun b_and!46389 () Bool)

(assert (=> start!108810 (= tp!100084 b_and!46389)))

(declare-fun b!1284955 () Bool)

(declare-fun e!733983 () Bool)

(declare-fun tp_is_empty!33963 () Bool)

(assert (=> b!1284955 (= e!733983 tp_is_empty!33963)))

(declare-fun mapNonEmpty!52502 () Bool)

(declare-fun mapRes!52502 () Bool)

(declare-fun tp!100085 () Bool)

(assert (=> mapNonEmpty!52502 (= mapRes!52502 (and tp!100085 e!733983))))

(declare-datatypes ((V!50387 0))(
  ( (V!50388 (val!17056 Int)) )
))
(declare-datatypes ((ValueCell!16083 0))(
  ( (ValueCellFull!16083 (v!19658 V!50387)) (EmptyCell!16083) )
))
(declare-fun mapValue!52502 () ValueCell!16083)

(declare-fun mapRest!52502 () (Array (_ BitVec 32) ValueCell!16083))

(declare-fun mapKey!52502 () (_ BitVec 32))

(declare-datatypes ((array!84984 0))(
  ( (array!84985 (arr!40994 (Array (_ BitVec 32) ValueCell!16083)) (size!41544 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84984)

(assert (=> mapNonEmpty!52502 (= (arr!40994 _values!1445) (store mapRest!52502 mapKey!52502 mapValue!52502))))

(declare-fun b!1284956 () Bool)

(declare-fun res!853610 () Bool)

(declare-fun e!733981 () Bool)

(assert (=> b!1284956 (=> (not res!853610) (not e!733981))))

(declare-fun minValue!1387 () V!50387)

(declare-fun zeroValue!1387 () V!50387)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84986 0))(
  ( (array!84987 (arr!40995 (Array (_ BitVec 32) (_ BitVec 64))) (size!41545 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84986)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21854 0))(
  ( (tuple2!21855 (_1!10938 (_ BitVec 64)) (_2!10938 V!50387)) )
))
(declare-datatypes ((List!29048 0))(
  ( (Nil!29045) (Cons!29044 (h!30253 tuple2!21854) (t!42592 List!29048)) )
))
(declare-datatypes ((ListLongMap!19511 0))(
  ( (ListLongMap!19512 (toList!9771 List!29048)) )
))
(declare-fun contains!7888 (ListLongMap!19511 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4850 (array!84986 array!84984 (_ BitVec 32) (_ BitVec 32) V!50387 V!50387 (_ BitVec 32) Int) ListLongMap!19511)

(assert (=> b!1284956 (= res!853610 (contains!7888 (getCurrentListMap!4850 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284957 () Bool)

(declare-fun res!853617 () Bool)

(assert (=> b!1284957 (=> (not res!853617) (not e!733981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284957 (= res!853617 (validKeyInArray!0 (select (arr!40995 _keys!1741) from!2144)))))

(declare-fun b!1284958 () Bool)

(declare-fun e!733982 () Bool)

(assert (=> b!1284958 (= e!733982 tp_is_empty!33963)))

(declare-fun b!1284959 () Bool)

(declare-fun res!853614 () Bool)

(assert (=> b!1284959 (=> (not res!853614) (not e!733981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84986 (_ BitVec 32)) Bool)

(assert (=> b!1284959 (= res!853614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284960 () Bool)

(declare-fun res!853612 () Bool)

(assert (=> b!1284960 (=> (not res!853612) (not e!733981))))

(declare-datatypes ((List!29049 0))(
  ( (Nil!29046) (Cons!29045 (h!30254 (_ BitVec 64)) (t!42593 List!29049)) )
))
(declare-fun arrayNoDuplicates!0 (array!84986 (_ BitVec 32) List!29049) Bool)

(assert (=> b!1284960 (= res!853612 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29046))))

(declare-fun mapIsEmpty!52502 () Bool)

(assert (=> mapIsEmpty!52502 mapRes!52502))

(declare-fun b!1284961 () Bool)

(declare-fun res!853615 () Bool)

(assert (=> b!1284961 (=> (not res!853615) (not e!733981))))

(assert (=> b!1284961 (= res!853615 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41545 _keys!1741))))))

(declare-fun b!1284962 () Bool)

(declare-fun e!733984 () Bool)

(assert (=> b!1284962 (= e!733984 (and e!733982 mapRes!52502))))

(declare-fun condMapEmpty!52502 () Bool)

(declare-fun mapDefault!52502 () ValueCell!16083)

(assert (=> b!1284962 (= condMapEmpty!52502 (= (arr!40994 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16083)) mapDefault!52502)))))

(declare-fun b!1284963 () Bool)

(declare-fun res!853616 () Bool)

(assert (=> b!1284963 (=> (not res!853616) (not e!733981))))

(assert (=> b!1284963 (= res!853616 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41545 _keys!1741))))))

(declare-fun b!1284964 () Bool)

(declare-fun res!853609 () Bool)

(assert (=> b!1284964 (=> (not res!853609) (not e!733981))))

(assert (=> b!1284964 (= res!853609 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1284966 () Bool)

(assert (=> b!1284966 (= e!733981 false)))

(declare-fun lt!576862 () Bool)

(declare-fun +!4302 (ListLongMap!19511 tuple2!21854) ListLongMap!19511)

(declare-fun getCurrentListMapNoExtraKeys!5932 (array!84986 array!84984 (_ BitVec 32) (_ BitVec 32) V!50387 V!50387 (_ BitVec 32) Int) ListLongMap!19511)

(assert (=> b!1284966 (= lt!576862 (contains!7888 (+!4302 (getCurrentListMapNoExtraKeys!5932 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21855 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun b!1284965 () Bool)

(declare-fun res!853613 () Bool)

(assert (=> b!1284965 (=> (not res!853613) (not e!733981))))

(assert (=> b!1284965 (= res!853613 (and (= (size!41544 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41545 _keys!1741) (size!41544 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!853611 () Bool)

(assert (=> start!108810 (=> (not res!853611) (not e!733981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108810 (= res!853611 (validMask!0 mask!2175))))

(assert (=> start!108810 e!733981))

(assert (=> start!108810 tp_is_empty!33963))

(assert (=> start!108810 true))

(declare-fun array_inv!31091 (array!84984) Bool)

(assert (=> start!108810 (and (array_inv!31091 _values!1445) e!733984)))

(declare-fun array_inv!31092 (array!84986) Bool)

(assert (=> start!108810 (array_inv!31092 _keys!1741)))

(assert (=> start!108810 tp!100084))

(assert (= (and start!108810 res!853611) b!1284965))

(assert (= (and b!1284965 res!853613) b!1284959))

(assert (= (and b!1284959 res!853614) b!1284960))

(assert (= (and b!1284960 res!853612) b!1284961))

(assert (= (and b!1284961 res!853615) b!1284956))

(assert (= (and b!1284956 res!853610) b!1284963))

(assert (= (and b!1284963 res!853616) b!1284957))

(assert (= (and b!1284957 res!853617) b!1284964))

(assert (= (and b!1284964 res!853609) b!1284966))

(assert (= (and b!1284962 condMapEmpty!52502) mapIsEmpty!52502))

(assert (= (and b!1284962 (not condMapEmpty!52502)) mapNonEmpty!52502))

(get-info :version)

(assert (= (and mapNonEmpty!52502 ((_ is ValueCellFull!16083) mapValue!52502)) b!1284955))

(assert (= (and b!1284962 ((_ is ValueCellFull!16083) mapDefault!52502)) b!1284958))

(assert (= start!108810 b!1284962))

(declare-fun m!1178459 () Bool)

(assert (=> b!1284960 m!1178459))

(declare-fun m!1178461 () Bool)

(assert (=> b!1284959 m!1178461))

(declare-fun m!1178463 () Bool)

(assert (=> mapNonEmpty!52502 m!1178463))

(declare-fun m!1178465 () Bool)

(assert (=> b!1284957 m!1178465))

(assert (=> b!1284957 m!1178465))

(declare-fun m!1178467 () Bool)

(assert (=> b!1284957 m!1178467))

(declare-fun m!1178469 () Bool)

(assert (=> start!108810 m!1178469))

(declare-fun m!1178471 () Bool)

(assert (=> start!108810 m!1178471))

(declare-fun m!1178473 () Bool)

(assert (=> start!108810 m!1178473))

(declare-fun m!1178475 () Bool)

(assert (=> b!1284966 m!1178475))

(assert (=> b!1284966 m!1178475))

(declare-fun m!1178477 () Bool)

(assert (=> b!1284966 m!1178477))

(assert (=> b!1284966 m!1178477))

(declare-fun m!1178479 () Bool)

(assert (=> b!1284966 m!1178479))

(declare-fun m!1178481 () Bool)

(assert (=> b!1284956 m!1178481))

(assert (=> b!1284956 m!1178481))

(declare-fun m!1178483 () Bool)

(assert (=> b!1284956 m!1178483))

(check-sat b_and!46389 (not b_next!28323) tp_is_empty!33963 (not b!1284960) (not b!1284956) (not start!108810) (not b!1284966) (not b!1284957) (not b!1284959) (not mapNonEmpty!52502))
(check-sat b_and!46389 (not b_next!28323))
