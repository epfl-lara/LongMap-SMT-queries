; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108780 () Bool)

(assert start!108780)

(declare-fun b_free!28293 () Bool)

(declare-fun b_next!28293 () Bool)

(assert (=> start!108780 (= b_free!28293 (not b_next!28293))))

(declare-fun tp!99994 () Bool)

(declare-fun b_and!46359 () Bool)

(assert (=> start!108780 (= tp!99994 b_and!46359)))

(declare-fun b!1284548 () Bool)

(declare-fun e!733760 () Bool)

(declare-fun e!733757 () Bool)

(declare-fun mapRes!52457 () Bool)

(assert (=> b!1284548 (= e!733760 (and e!733757 mapRes!52457))))

(declare-fun condMapEmpty!52457 () Bool)

(declare-datatypes ((V!50347 0))(
  ( (V!50348 (val!17041 Int)) )
))
(declare-datatypes ((ValueCell!16068 0))(
  ( (ValueCellFull!16068 (v!19643 V!50347)) (EmptyCell!16068) )
))
(declare-datatypes ((array!84924 0))(
  ( (array!84925 (arr!40964 (Array (_ BitVec 32) ValueCell!16068)) (size!41514 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84924)

(declare-fun mapDefault!52457 () ValueCell!16068)

(assert (=> b!1284548 (= condMapEmpty!52457 (= (arr!40964 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16068)) mapDefault!52457)))))

(declare-fun b!1284549 () Bool)

(declare-fun res!853339 () Bool)

(declare-fun e!733756 () Bool)

(assert (=> b!1284549 (=> (not res!853339) (not e!733756))))

(declare-datatypes ((array!84926 0))(
  ( (array!84927 (arr!40965 (Array (_ BitVec 32) (_ BitVec 64))) (size!41515 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84926)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84926 (_ BitVec 32)) Bool)

(assert (=> b!1284549 (= res!853339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284550 () Bool)

(declare-fun res!853340 () Bool)

(assert (=> b!1284550 (=> (not res!853340) (not e!733756))))

(declare-datatypes ((List!29029 0))(
  ( (Nil!29026) (Cons!29025 (h!30234 (_ BitVec 64)) (t!42573 List!29029)) )
))
(declare-fun arrayNoDuplicates!0 (array!84926 (_ BitVec 32) List!29029) Bool)

(assert (=> b!1284550 (= res!853340 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29026))))

(declare-fun b!1284551 () Bool)

(declare-fun e!733759 () Bool)

(declare-fun tp_is_empty!33933 () Bool)

(assert (=> b!1284551 (= e!733759 tp_is_empty!33933)))

(declare-fun mapIsEmpty!52457 () Bool)

(assert (=> mapIsEmpty!52457 mapRes!52457))

(declare-fun b!1284552 () Bool)

(declare-fun res!853341 () Bool)

(assert (=> b!1284552 (=> (not res!853341) (not e!733756))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284552 (= res!853341 (and (= (size!41514 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41515 _keys!1741) (size!41514 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284553 () Bool)

(assert (=> b!1284553 (= e!733756 false)))

(declare-fun minValue!1387 () V!50347)

(declare-fun zeroValue!1387 () V!50347)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576826 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21836 0))(
  ( (tuple2!21837 (_1!10929 (_ BitVec 64)) (_2!10929 V!50347)) )
))
(declare-datatypes ((List!29030 0))(
  ( (Nil!29027) (Cons!29026 (h!30235 tuple2!21836) (t!42574 List!29030)) )
))
(declare-datatypes ((ListLongMap!19493 0))(
  ( (ListLongMap!19494 (toList!9762 List!29030)) )
))
(declare-fun contains!7879 (ListLongMap!19493 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4841 (array!84926 array!84924 (_ BitVec 32) (_ BitVec 32) V!50347 V!50347 (_ BitVec 32) Int) ListLongMap!19493)

(assert (=> b!1284553 (= lt!576826 (contains!7879 (getCurrentListMap!4841 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284554 () Bool)

(declare-fun res!853337 () Bool)

(assert (=> b!1284554 (=> (not res!853337) (not e!733756))))

(assert (=> b!1284554 (= res!853337 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41515 _keys!1741))))))

(declare-fun res!853338 () Bool)

(assert (=> start!108780 (=> (not res!853338) (not e!733756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108780 (= res!853338 (validMask!0 mask!2175))))

(assert (=> start!108780 e!733756))

(assert (=> start!108780 tp_is_empty!33933))

(assert (=> start!108780 true))

(declare-fun array_inv!31071 (array!84924) Bool)

(assert (=> start!108780 (and (array_inv!31071 _values!1445) e!733760)))

(declare-fun array_inv!31072 (array!84926) Bool)

(assert (=> start!108780 (array_inv!31072 _keys!1741)))

(assert (=> start!108780 tp!99994))

(declare-fun b!1284555 () Bool)

(assert (=> b!1284555 (= e!733757 tp_is_empty!33933)))

(declare-fun mapNonEmpty!52457 () Bool)

(declare-fun tp!99995 () Bool)

(assert (=> mapNonEmpty!52457 (= mapRes!52457 (and tp!99995 e!733759))))

(declare-fun mapRest!52457 () (Array (_ BitVec 32) ValueCell!16068))

(declare-fun mapKey!52457 () (_ BitVec 32))

(declare-fun mapValue!52457 () ValueCell!16068)

(assert (=> mapNonEmpty!52457 (= (arr!40964 _values!1445) (store mapRest!52457 mapKey!52457 mapValue!52457))))

(assert (= (and start!108780 res!853338) b!1284552))

(assert (= (and b!1284552 res!853341) b!1284549))

(assert (= (and b!1284549 res!853339) b!1284550))

(assert (= (and b!1284550 res!853340) b!1284554))

(assert (= (and b!1284554 res!853337) b!1284553))

(assert (= (and b!1284548 condMapEmpty!52457) mapIsEmpty!52457))

(assert (= (and b!1284548 (not condMapEmpty!52457)) mapNonEmpty!52457))

(get-info :version)

(assert (= (and mapNonEmpty!52457 ((_ is ValueCellFull!16068) mapValue!52457)) b!1284551))

(assert (= (and b!1284548 ((_ is ValueCellFull!16068) mapDefault!52457)) b!1284555))

(assert (= start!108780 b!1284548))

(declare-fun m!1178197 () Bool)

(assert (=> b!1284550 m!1178197))

(declare-fun m!1178199 () Bool)

(assert (=> start!108780 m!1178199))

(declare-fun m!1178201 () Bool)

(assert (=> start!108780 m!1178201))

(declare-fun m!1178203 () Bool)

(assert (=> start!108780 m!1178203))

(declare-fun m!1178205 () Bool)

(assert (=> b!1284553 m!1178205))

(assert (=> b!1284553 m!1178205))

(declare-fun m!1178207 () Bool)

(assert (=> b!1284553 m!1178207))

(declare-fun m!1178209 () Bool)

(assert (=> b!1284549 m!1178209))

(declare-fun m!1178211 () Bool)

(assert (=> mapNonEmpty!52457 m!1178211))

(check-sat (not b!1284553) (not b!1284550) (not start!108780) tp_is_empty!33933 (not mapNonEmpty!52457) (not b_next!28293) b_and!46359 (not b!1284549))
(check-sat b_and!46359 (not b_next!28293))
