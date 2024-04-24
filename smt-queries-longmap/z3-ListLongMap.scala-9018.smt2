; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109092 () Bool)

(assert start!109092)

(declare-fun b_free!28381 () Bool)

(declare-fun b_next!28381 () Bool)

(assert (=> start!109092 (= b_free!28381 (not b_next!28381))))

(declare-fun tp!100259 () Bool)

(declare-fun b_and!46449 () Bool)

(assert (=> start!109092 (= tp!100259 b_and!46449)))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun b!1287014 () Bool)

(declare-fun e!735267 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85127 0))(
  ( (array!85128 (arr!41061 (Array (_ BitVec 32) (_ BitVec 64))) (size!41612 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85127)

(assert (=> b!1287014 (= e!735267 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt from!2144 (size!41612 _keys!1741))))))

(declare-fun res!854626 () Bool)

(assert (=> start!109092 (=> (not res!854626) (not e!735267))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109092 (= res!854626 (validMask!0 mask!2175))))

(assert (=> start!109092 e!735267))

(declare-fun tp_is_empty!34021 () Bool)

(assert (=> start!109092 tp_is_empty!34021))

(assert (=> start!109092 true))

(declare-datatypes ((V!50465 0))(
  ( (V!50466 (val!17085 Int)) )
))
(declare-datatypes ((ValueCell!16112 0))(
  ( (ValueCellFull!16112 (v!19682 V!50465)) (EmptyCell!16112) )
))
(declare-datatypes ((array!85129 0))(
  ( (array!85130 (arr!41062 (Array (_ BitVec 32) ValueCell!16112)) (size!41613 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85129)

(declare-fun e!735266 () Bool)

(declare-fun array_inv!31351 (array!85129) Bool)

(assert (=> start!109092 (and (array_inv!31351 _values!1445) e!735266)))

(declare-fun array_inv!31352 (array!85127) Bool)

(assert (=> start!109092 (array_inv!31352 _keys!1741)))

(assert (=> start!109092 tp!100259))

(declare-fun b!1287015 () Bool)

(declare-fun e!735265 () Bool)

(declare-fun mapRes!52589 () Bool)

(assert (=> b!1287015 (= e!735266 (and e!735265 mapRes!52589))))

(declare-fun condMapEmpty!52589 () Bool)

(declare-fun mapDefault!52589 () ValueCell!16112)

(assert (=> b!1287015 (= condMapEmpty!52589 (= (arr!41062 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16112)) mapDefault!52589)))))

(declare-fun mapNonEmpty!52589 () Bool)

(declare-fun tp!100258 () Bool)

(declare-fun e!735264 () Bool)

(assert (=> mapNonEmpty!52589 (= mapRes!52589 (and tp!100258 e!735264))))

(declare-fun mapValue!52589 () ValueCell!16112)

(declare-fun mapKey!52589 () (_ BitVec 32))

(declare-fun mapRest!52589 () (Array (_ BitVec 32) ValueCell!16112))

(assert (=> mapNonEmpty!52589 (= (arr!41062 _values!1445) (store mapRest!52589 mapKey!52589 mapValue!52589))))

(declare-fun b!1287016 () Bool)

(declare-fun res!854628 () Bool)

(assert (=> b!1287016 (=> (not res!854628) (not e!735267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287016 (= res!854628 (validKeyInArray!0 (select (arr!41061 _keys!1741) from!2144)))))

(declare-fun b!1287017 () Bool)

(declare-fun res!854629 () Bool)

(assert (=> b!1287017 (=> (not res!854629) (not e!735267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85127 (_ BitVec 32)) Bool)

(assert (=> b!1287017 (= res!854629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287018 () Bool)

(declare-fun res!854623 () Bool)

(assert (=> b!1287018 (=> (not res!854623) (not e!735267))))

(declare-datatypes ((List!29121 0))(
  ( (Nil!29118) (Cons!29117 (h!30335 (_ BitVec 64)) (t!42657 List!29121)) )
))
(declare-fun arrayNoDuplicates!0 (array!85127 (_ BitVec 32) List!29121) Bool)

(assert (=> b!1287018 (= res!854623 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29118))))

(declare-fun b!1287019 () Bool)

(declare-fun res!854627 () Bool)

(assert (=> b!1287019 (=> (not res!854627) (not e!735267))))

(assert (=> b!1287019 (= res!854627 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41612 _keys!1741))))))

(declare-fun mapIsEmpty!52589 () Bool)

(assert (=> mapIsEmpty!52589 mapRes!52589))

(declare-fun b!1287020 () Bool)

(declare-fun res!854625 () Bool)

(assert (=> b!1287020 (=> (not res!854625) (not e!735267))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1287020 (= res!854625 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41612 _keys!1741))))))

(declare-fun b!1287021 () Bool)

(assert (=> b!1287021 (= e!735265 tp_is_empty!34021)))

(declare-fun b!1287022 () Bool)

(declare-fun res!854622 () Bool)

(assert (=> b!1287022 (=> (not res!854622) (not e!735267))))

(declare-fun minValue!1387 () V!50465)

(declare-fun zeroValue!1387 () V!50465)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21922 0))(
  ( (tuple2!21923 (_1!10972 (_ BitVec 64)) (_2!10972 V!50465)) )
))
(declare-datatypes ((List!29122 0))(
  ( (Nil!29119) (Cons!29118 (h!30336 tuple2!21922) (t!42658 List!29122)) )
))
(declare-datatypes ((ListLongMap!19587 0))(
  ( (ListLongMap!19588 (toList!9809 List!29122)) )
))
(declare-fun contains!7940 (ListLongMap!19587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4873 (array!85127 array!85129 (_ BitVec 32) (_ BitVec 32) V!50465 V!50465 (_ BitVec 32) Int) ListLongMap!19587)

(assert (=> b!1287022 (= res!854622 (contains!7940 (getCurrentListMap!4873 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287023 () Bool)

(declare-fun res!854624 () Bool)

(assert (=> b!1287023 (=> (not res!854624) (not e!735267))))

(assert (=> b!1287023 (= res!854624 (and (= (size!41613 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41612 _keys!1741) (size!41613 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287024 () Bool)

(assert (=> b!1287024 (= e!735264 tp_is_empty!34021)))

(assert (= (and start!109092 res!854626) b!1287023))

(assert (= (and b!1287023 res!854624) b!1287017))

(assert (= (and b!1287017 res!854629) b!1287018))

(assert (= (and b!1287018 res!854623) b!1287019))

(assert (= (and b!1287019 res!854627) b!1287022))

(assert (= (and b!1287022 res!854622) b!1287020))

(assert (= (and b!1287020 res!854625) b!1287016))

(assert (= (and b!1287016 res!854628) b!1287014))

(assert (= (and b!1287015 condMapEmpty!52589) mapIsEmpty!52589))

(assert (= (and b!1287015 (not condMapEmpty!52589)) mapNonEmpty!52589))

(get-info :version)

(assert (= (and mapNonEmpty!52589 ((_ is ValueCellFull!16112) mapValue!52589)) b!1287024))

(assert (= (and b!1287015 ((_ is ValueCellFull!16112) mapDefault!52589)) b!1287021))

(assert (= start!109092 b!1287015))

(declare-fun m!1180585 () Bool)

(assert (=> b!1287018 m!1180585))

(declare-fun m!1180587 () Bool)

(assert (=> start!109092 m!1180587))

(declare-fun m!1180589 () Bool)

(assert (=> start!109092 m!1180589))

(declare-fun m!1180591 () Bool)

(assert (=> start!109092 m!1180591))

(declare-fun m!1180593 () Bool)

(assert (=> b!1287017 m!1180593))

(declare-fun m!1180595 () Bool)

(assert (=> b!1287022 m!1180595))

(assert (=> b!1287022 m!1180595))

(declare-fun m!1180597 () Bool)

(assert (=> b!1287022 m!1180597))

(declare-fun m!1180599 () Bool)

(assert (=> b!1287016 m!1180599))

(assert (=> b!1287016 m!1180599))

(declare-fun m!1180601 () Bool)

(assert (=> b!1287016 m!1180601))

(declare-fun m!1180603 () Bool)

(assert (=> mapNonEmpty!52589 m!1180603))

(check-sat b_and!46449 (not start!109092) (not b!1287022) (not b!1287016) (not b!1287018) (not b_next!28381) (not mapNonEmpty!52589) tp_is_empty!34021 (not b!1287017))
(check-sat b_and!46449 (not b_next!28381))
