; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108954 () Bool)

(assert start!108954)

(declare-fun b_free!28443 () Bool)

(declare-fun b_next!28443 () Bool)

(assert (=> start!108954 (= b_free!28443 (not b_next!28443))))

(declare-fun tp!100448 () Bool)

(declare-fun b_and!46533 () Bool)

(assert (=> start!108954 (= tp!100448 b_and!46533)))

(declare-fun b!1287333 () Bool)

(declare-fun e!735202 () Bool)

(declare-fun e!735200 () Bool)

(declare-fun mapRes!52685 () Bool)

(assert (=> b!1287333 (= e!735202 (and e!735200 mapRes!52685))))

(declare-fun condMapEmpty!52685 () Bool)

(declare-datatypes ((V!50547 0))(
  ( (V!50548 (val!17116 Int)) )
))
(declare-datatypes ((ValueCell!16143 0))(
  ( (ValueCellFull!16143 (v!19719 V!50547)) (EmptyCell!16143) )
))
(declare-datatypes ((array!85216 0))(
  ( (array!85217 (arr!41109 (Array (_ BitVec 32) ValueCell!16143)) (size!41659 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85216)

(declare-fun mapDefault!52685 () ValueCell!16143)

(assert (=> b!1287333 (= condMapEmpty!52685 (= (arr!41109 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16143)) mapDefault!52685)))))

(declare-fun b!1287334 () Bool)

(declare-fun e!735203 () Bool)

(assert (=> b!1287334 (= e!735203 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21956 0))(
  ( (tuple2!21957 (_1!10989 (_ BitVec 64)) (_2!10989 V!50547)) )
))
(declare-datatypes ((List!29138 0))(
  ( (Nil!29135) (Cons!29134 (h!30343 tuple2!21956) (t!42702 List!29138)) )
))
(declare-datatypes ((ListLongMap!19613 0))(
  ( (ListLongMap!19614 (toList!9822 List!29138)) )
))
(declare-fun contains!7940 (ListLongMap!19613 (_ BitVec 64)) Bool)

(assert (=> b!1287334 (not (contains!7940 (ListLongMap!19614 Nil!29135) k0!1205))))

(declare-datatypes ((Unit!42572 0))(
  ( (Unit!42573) )
))
(declare-fun lt!577856 () Unit!42572)

(declare-fun emptyContainsNothing!15 ((_ BitVec 64)) Unit!42572)

(assert (=> b!1287334 (= lt!577856 (emptyContainsNothing!15 k0!1205))))

(declare-fun b!1287335 () Bool)

(declare-fun e!735201 () Bool)

(declare-fun tp_is_empty!34083 () Bool)

(assert (=> b!1287335 (= e!735201 tp_is_empty!34083)))

(declare-fun b!1287336 () Bool)

(declare-fun res!854960 () Bool)

(assert (=> b!1287336 (=> (not res!854960) (not e!735203))))

(declare-fun minValue!1387 () V!50547)

(declare-fun zeroValue!1387 () V!50547)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85218 0))(
  ( (array!85219 (arr!41110 (Array (_ BitVec 32) (_ BitVec 64))) (size!41660 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85218)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4896 (array!85218 array!85216 (_ BitVec 32) (_ BitVec 32) V!50547 V!50547 (_ BitVec 32) Int) ListLongMap!19613)

(assert (=> b!1287336 (= res!854960 (contains!7940 (getCurrentListMap!4896 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287337 () Bool)

(declare-fun res!854958 () Bool)

(assert (=> b!1287337 (=> (not res!854958) (not e!735203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287337 (= res!854958 (not (validKeyInArray!0 (select (arr!41110 _keys!1741) from!2144))))))

(declare-fun b!1287338 () Bool)

(declare-fun res!854957 () Bool)

(assert (=> b!1287338 (=> (not res!854957) (not e!735203))))

(assert (=> b!1287338 (= res!854957 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41660 _keys!1741))))))

(declare-fun b!1287339 () Bool)

(declare-fun res!854962 () Bool)

(assert (=> b!1287339 (=> (not res!854962) (not e!735203))))

(assert (=> b!1287339 (= res!854962 (and (= (size!41659 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41660 _keys!1741) (size!41659 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!854963 () Bool)

(assert (=> start!108954 (=> (not res!854963) (not e!735203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108954 (= res!854963 (validMask!0 mask!2175))))

(assert (=> start!108954 e!735203))

(assert (=> start!108954 tp_is_empty!34083))

(assert (=> start!108954 true))

(declare-fun array_inv!31173 (array!85216) Bool)

(assert (=> start!108954 (and (array_inv!31173 _values!1445) e!735202)))

(declare-fun array_inv!31174 (array!85218) Bool)

(assert (=> start!108954 (array_inv!31174 _keys!1741)))

(assert (=> start!108954 tp!100448))

(declare-fun b!1287340 () Bool)

(declare-fun res!854964 () Bool)

(assert (=> b!1287340 (=> (not res!854964) (not e!735203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85218 (_ BitVec 32)) Bool)

(assert (=> b!1287340 (= res!854964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287341 () Bool)

(declare-fun res!854961 () Bool)

(assert (=> b!1287341 (=> (not res!854961) (not e!735203))))

(declare-datatypes ((List!29139 0))(
  ( (Nil!29136) (Cons!29135 (h!30344 (_ BitVec 64)) (t!42703 List!29139)) )
))
(declare-fun arrayNoDuplicates!0 (array!85218 (_ BitVec 32) List!29139) Bool)

(assert (=> b!1287341 (= res!854961 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29136))))

(declare-fun mapNonEmpty!52685 () Bool)

(declare-fun tp!100447 () Bool)

(assert (=> mapNonEmpty!52685 (= mapRes!52685 (and tp!100447 e!735201))))

(declare-fun mapKey!52685 () (_ BitVec 32))

(declare-fun mapValue!52685 () ValueCell!16143)

(declare-fun mapRest!52685 () (Array (_ BitVec 32) ValueCell!16143))

(assert (=> mapNonEmpty!52685 (= (arr!41109 _values!1445) (store mapRest!52685 mapKey!52685 mapValue!52685))))

(declare-fun mapIsEmpty!52685 () Bool)

(assert (=> mapIsEmpty!52685 mapRes!52685))

(declare-fun b!1287342 () Bool)

(assert (=> b!1287342 (= e!735200 tp_is_empty!34083)))

(declare-fun b!1287343 () Bool)

(declare-fun res!854959 () Bool)

(assert (=> b!1287343 (=> (not res!854959) (not e!735203))))

(assert (=> b!1287343 (= res!854959 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41660 _keys!1741))))))

(assert (= (and start!108954 res!854963) b!1287339))

(assert (= (and b!1287339 res!854962) b!1287340))

(assert (= (and b!1287340 res!854964) b!1287341))

(assert (= (and b!1287341 res!854961) b!1287343))

(assert (= (and b!1287343 res!854959) b!1287336))

(assert (= (and b!1287336 res!854960) b!1287338))

(assert (= (and b!1287338 res!854957) b!1287337))

(assert (= (and b!1287337 res!854958) b!1287334))

(assert (= (and b!1287333 condMapEmpty!52685) mapIsEmpty!52685))

(assert (= (and b!1287333 (not condMapEmpty!52685)) mapNonEmpty!52685))

(get-info :version)

(assert (= (and mapNonEmpty!52685 ((_ is ValueCellFull!16143) mapValue!52685)) b!1287335))

(assert (= (and b!1287333 ((_ is ValueCellFull!16143) mapDefault!52685)) b!1287342))

(assert (= start!108954 b!1287333))

(declare-fun m!1180223 () Bool)

(assert (=> b!1287340 m!1180223))

(declare-fun m!1180225 () Bool)

(assert (=> b!1287337 m!1180225))

(assert (=> b!1287337 m!1180225))

(declare-fun m!1180227 () Bool)

(assert (=> b!1287337 m!1180227))

(declare-fun m!1180229 () Bool)

(assert (=> b!1287341 m!1180229))

(declare-fun m!1180231 () Bool)

(assert (=> b!1287334 m!1180231))

(declare-fun m!1180233 () Bool)

(assert (=> b!1287334 m!1180233))

(declare-fun m!1180235 () Bool)

(assert (=> start!108954 m!1180235))

(declare-fun m!1180237 () Bool)

(assert (=> start!108954 m!1180237))

(declare-fun m!1180239 () Bool)

(assert (=> start!108954 m!1180239))

(declare-fun m!1180241 () Bool)

(assert (=> mapNonEmpty!52685 m!1180241))

(declare-fun m!1180243 () Bool)

(assert (=> b!1287336 m!1180243))

(assert (=> b!1287336 m!1180243))

(declare-fun m!1180245 () Bool)

(assert (=> b!1287336 m!1180245))

(check-sat (not mapNonEmpty!52685) (not b!1287334) tp_is_empty!34083 (not b_next!28443) (not b!1287341) (not b!1287340) (not b!1287337) (not b!1287336) (not start!108954) b_and!46533)
(check-sat b_and!46533 (not b_next!28443))
