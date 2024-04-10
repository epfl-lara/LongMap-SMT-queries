; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108882 () Bool)

(assert start!108882)

(declare-fun b_free!28395 () Bool)

(declare-fun b_next!28395 () Bool)

(assert (=> start!108882 (= b_free!28395 (not b_next!28395))))

(declare-fun tp!100301 () Bool)

(declare-fun b_and!46461 () Bool)

(assert (=> start!108882 (= tp!100301 b_and!46461)))

(declare-fun mapNonEmpty!52610 () Bool)

(declare-fun mapRes!52610 () Bool)

(declare-fun tp!100300 () Bool)

(declare-fun e!734522 () Bool)

(assert (=> mapNonEmpty!52610 (= mapRes!52610 (and tp!100300 e!734522))))

(declare-datatypes ((V!50483 0))(
  ( (V!50484 (val!17092 Int)) )
))
(declare-datatypes ((ValueCell!16119 0))(
  ( (ValueCellFull!16119 (v!19694 V!50483)) (EmptyCell!16119) )
))
(declare-fun mapRest!52610 () (Array (_ BitVec 32) ValueCell!16119))

(declare-datatypes ((array!85122 0))(
  ( (array!85123 (arr!41063 (Array (_ BitVec 32) ValueCell!16119)) (size!41613 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85122)

(declare-fun mapKey!52610 () (_ BitVec 32))

(declare-fun mapValue!52610 () ValueCell!16119)

(assert (=> mapNonEmpty!52610 (= (arr!41063 _values!1445) (store mapRest!52610 mapKey!52610 mapValue!52610))))

(declare-fun b!1285954 () Bool)

(declare-fun e!734525 () Bool)

(declare-fun e!734521 () Bool)

(assert (=> b!1285954 (= e!734525 (and e!734521 mapRes!52610))))

(declare-fun condMapEmpty!52610 () Bool)

(declare-fun mapDefault!52610 () ValueCell!16119)

(assert (=> b!1285954 (= condMapEmpty!52610 (= (arr!41063 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16119)) mapDefault!52610)))))

(declare-fun b!1285955 () Bool)

(declare-fun e!734523 () Bool)

(assert (=> b!1285955 (= e!734523 false)))

(declare-fun minValue!1387 () V!50483)

(declare-fun zeroValue!1387 () V!50483)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576961 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85124 0))(
  ( (array!85125 (arr!41064 (Array (_ BitVec 32) (_ BitVec 64))) (size!41614 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85124)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21912 0))(
  ( (tuple2!21913 (_1!10967 (_ BitVec 64)) (_2!10967 V!50483)) )
))
(declare-datatypes ((List!29099 0))(
  ( (Nil!29096) (Cons!29095 (h!30304 tuple2!21912) (t!42643 List!29099)) )
))
(declare-datatypes ((ListLongMap!19569 0))(
  ( (ListLongMap!19570 (toList!9800 List!29099)) )
))
(declare-fun contains!7917 (ListLongMap!19569 (_ BitVec 64)) Bool)

(declare-fun +!4309 (ListLongMap!19569 tuple2!21912) ListLongMap!19569)

(declare-fun getCurrentListMapNoExtraKeys!5939 (array!85124 array!85122 (_ BitVec 32) (_ BitVec 32) V!50483 V!50483 (_ BitVec 32) Int) ListLongMap!19569)

(assert (=> b!1285955 (= lt!576961 (contains!7917 (+!4309 (getCurrentListMapNoExtraKeys!5939 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1285956 () Bool)

(declare-fun tp_is_empty!34035 () Bool)

(assert (=> b!1285956 (= e!734522 tp_is_empty!34035)))

(declare-fun b!1285957 () Bool)

(declare-fun res!854288 () Bool)

(assert (=> b!1285957 (=> (not res!854288) (not e!734523))))

(assert (=> b!1285957 (= res!854288 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41614 _keys!1741))))))

(declare-fun mapIsEmpty!52610 () Bool)

(assert (=> mapIsEmpty!52610 mapRes!52610))

(declare-fun res!854287 () Bool)

(assert (=> start!108882 (=> (not res!854287) (not e!734523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108882 (= res!854287 (validMask!0 mask!2175))))

(assert (=> start!108882 e!734523))

(assert (=> start!108882 tp_is_empty!34035))

(assert (=> start!108882 true))

(declare-fun array_inv!31137 (array!85122) Bool)

(assert (=> start!108882 (and (array_inv!31137 _values!1445) e!734525)))

(declare-fun array_inv!31138 (array!85124) Bool)

(assert (=> start!108882 (array_inv!31138 _keys!1741)))

(assert (=> start!108882 tp!100301))

(declare-fun b!1285958 () Bool)

(declare-fun res!854285 () Bool)

(assert (=> b!1285958 (=> (not res!854285) (not e!734523))))

(assert (=> b!1285958 (= res!854285 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1285959 () Bool)

(declare-fun res!854291 () Bool)

(assert (=> b!1285959 (=> (not res!854291) (not e!734523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85124 (_ BitVec 32)) Bool)

(assert (=> b!1285959 (= res!854291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285960 () Bool)

(assert (=> b!1285960 (= e!734521 tp_is_empty!34035)))

(declare-fun b!1285961 () Bool)

(declare-fun res!854292 () Bool)

(assert (=> b!1285961 (=> (not res!854292) (not e!734523))))

(declare-datatypes ((List!29100 0))(
  ( (Nil!29097) (Cons!29096 (h!30305 (_ BitVec 64)) (t!42644 List!29100)) )
))
(declare-fun arrayNoDuplicates!0 (array!85124 (_ BitVec 32) List!29100) Bool)

(assert (=> b!1285961 (= res!854292 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29097))))

(declare-fun b!1285962 () Bool)

(declare-fun res!854289 () Bool)

(assert (=> b!1285962 (=> (not res!854289) (not e!734523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285962 (= res!854289 (validKeyInArray!0 (select (arr!41064 _keys!1741) from!2144)))))

(declare-fun b!1285963 () Bool)

(declare-fun res!854290 () Bool)

(assert (=> b!1285963 (=> (not res!854290) (not e!734523))))

(declare-fun getCurrentListMap!4878 (array!85124 array!85122 (_ BitVec 32) (_ BitVec 32) V!50483 V!50483 (_ BitVec 32) Int) ListLongMap!19569)

(assert (=> b!1285963 (= res!854290 (contains!7917 (getCurrentListMap!4878 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285964 () Bool)

(declare-fun res!854284 () Bool)

(assert (=> b!1285964 (=> (not res!854284) (not e!734523))))

(assert (=> b!1285964 (= res!854284 (and (= (size!41613 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41614 _keys!1741) (size!41613 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285965 () Bool)

(declare-fun res!854286 () Bool)

(assert (=> b!1285965 (=> (not res!854286) (not e!734523))))

(assert (=> b!1285965 (= res!854286 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41614 _keys!1741))))))

(assert (= (and start!108882 res!854287) b!1285964))

(assert (= (and b!1285964 res!854284) b!1285959))

(assert (= (and b!1285959 res!854291) b!1285961))

(assert (= (and b!1285961 res!854292) b!1285957))

(assert (= (and b!1285957 res!854288) b!1285963))

(assert (= (and b!1285963 res!854290) b!1285965))

(assert (= (and b!1285965 res!854286) b!1285962))

(assert (= (and b!1285962 res!854289) b!1285958))

(assert (= (and b!1285958 res!854285) b!1285955))

(assert (= (and b!1285954 condMapEmpty!52610) mapIsEmpty!52610))

(assert (= (and b!1285954 (not condMapEmpty!52610)) mapNonEmpty!52610))

(get-info :version)

(assert (= (and mapNonEmpty!52610 ((_ is ValueCellFull!16119) mapValue!52610)) b!1285956))

(assert (= (and b!1285954 ((_ is ValueCellFull!16119) mapDefault!52610)) b!1285960))

(assert (= start!108882 b!1285954))

(declare-fun m!1179137 () Bool)

(assert (=> start!108882 m!1179137))

(declare-fun m!1179139 () Bool)

(assert (=> start!108882 m!1179139))

(declare-fun m!1179141 () Bool)

(assert (=> start!108882 m!1179141))

(declare-fun m!1179143 () Bool)

(assert (=> b!1285962 m!1179143))

(assert (=> b!1285962 m!1179143))

(declare-fun m!1179145 () Bool)

(assert (=> b!1285962 m!1179145))

(declare-fun m!1179147 () Bool)

(assert (=> b!1285959 m!1179147))

(declare-fun m!1179149 () Bool)

(assert (=> b!1285963 m!1179149))

(assert (=> b!1285963 m!1179149))

(declare-fun m!1179151 () Bool)

(assert (=> b!1285963 m!1179151))

(declare-fun m!1179153 () Bool)

(assert (=> b!1285955 m!1179153))

(assert (=> b!1285955 m!1179153))

(declare-fun m!1179155 () Bool)

(assert (=> b!1285955 m!1179155))

(assert (=> b!1285955 m!1179155))

(declare-fun m!1179157 () Bool)

(assert (=> b!1285955 m!1179157))

(declare-fun m!1179159 () Bool)

(assert (=> mapNonEmpty!52610 m!1179159))

(declare-fun m!1179161 () Bool)

(assert (=> b!1285961 m!1179161))

(check-sat (not b!1285961) (not b_next!28395) (not start!108882) (not b!1285962) tp_is_empty!34035 (not b!1285963) b_and!46461 (not b!1285959) (not mapNonEmpty!52610) (not b!1285955))
(check-sat b_and!46461 (not b_next!28395))
