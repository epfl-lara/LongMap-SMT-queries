; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108774 () Bool)

(assert start!108774)

(declare-fun b_free!28287 () Bool)

(declare-fun b_next!28287 () Bool)

(assert (=> start!108774 (= b_free!28287 (not b_next!28287))))

(declare-fun tp!99976 () Bool)

(declare-fun b_and!46353 () Bool)

(assert (=> start!108774 (= tp!99976 b_and!46353)))

(declare-fun b!1284476 () Bool)

(declare-fun res!853294 () Bool)

(declare-fun e!733711 () Bool)

(assert (=> b!1284476 (=> (not res!853294) (not e!733711))))

(declare-datatypes ((array!84912 0))(
  ( (array!84913 (arr!40958 (Array (_ BitVec 32) (_ BitVec 64))) (size!41508 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84912)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84912 (_ BitVec 32)) Bool)

(assert (=> b!1284476 (= res!853294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!853293 () Bool)

(assert (=> start!108774 (=> (not res!853293) (not e!733711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108774 (= res!853293 (validMask!0 mask!2175))))

(assert (=> start!108774 e!733711))

(declare-fun tp_is_empty!33927 () Bool)

(assert (=> start!108774 tp_is_empty!33927))

(assert (=> start!108774 true))

(declare-datatypes ((V!50339 0))(
  ( (V!50340 (val!17038 Int)) )
))
(declare-datatypes ((ValueCell!16065 0))(
  ( (ValueCellFull!16065 (v!19640 V!50339)) (EmptyCell!16065) )
))
(declare-datatypes ((array!84914 0))(
  ( (array!84915 (arr!40959 (Array (_ BitVec 32) ValueCell!16065)) (size!41509 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84914)

(declare-fun e!733712 () Bool)

(declare-fun array_inv!31065 (array!84914) Bool)

(assert (=> start!108774 (and (array_inv!31065 _values!1445) e!733712)))

(declare-fun array_inv!31066 (array!84912) Bool)

(assert (=> start!108774 (array_inv!31066 _keys!1741)))

(assert (=> start!108774 tp!99976))

(declare-fun b!1284477 () Bool)

(declare-fun res!853292 () Bool)

(assert (=> b!1284477 (=> (not res!853292) (not e!733711))))

(declare-datatypes ((List!29023 0))(
  ( (Nil!29020) (Cons!29019 (h!30228 (_ BitVec 64)) (t!42567 List!29023)) )
))
(declare-fun arrayNoDuplicates!0 (array!84912 (_ BitVec 32) List!29023) Bool)

(assert (=> b!1284477 (= res!853292 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29020))))

(declare-fun b!1284478 () Bool)

(declare-fun e!733714 () Bool)

(assert (=> b!1284478 (= e!733714 tp_is_empty!33927)))

(declare-fun b!1284479 () Bool)

(declare-fun res!853295 () Bool)

(assert (=> b!1284479 (=> (not res!853295) (not e!733711))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284479 (= res!853295 (and (= (size!41509 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41508 _keys!1741) (size!41509 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284480 () Bool)

(assert (=> b!1284480 (= e!733711 false)))

(declare-fun minValue!1387 () V!50339)

(declare-fun zeroValue!1387 () V!50339)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576817 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21830 0))(
  ( (tuple2!21831 (_1!10926 (_ BitVec 64)) (_2!10926 V!50339)) )
))
(declare-datatypes ((List!29024 0))(
  ( (Nil!29021) (Cons!29020 (h!30229 tuple2!21830) (t!42568 List!29024)) )
))
(declare-datatypes ((ListLongMap!19487 0))(
  ( (ListLongMap!19488 (toList!9759 List!29024)) )
))
(declare-fun contains!7876 (ListLongMap!19487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4838 (array!84912 array!84914 (_ BitVec 32) (_ BitVec 32) V!50339 V!50339 (_ BitVec 32) Int) ListLongMap!19487)

(assert (=> b!1284480 (= lt!576817 (contains!7876 (getCurrentListMap!4838 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284481 () Bool)

(declare-fun res!853296 () Bool)

(assert (=> b!1284481 (=> (not res!853296) (not e!733711))))

(assert (=> b!1284481 (= res!853296 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41508 _keys!1741))))))

(declare-fun mapNonEmpty!52448 () Bool)

(declare-fun mapRes!52448 () Bool)

(declare-fun tp!99977 () Bool)

(assert (=> mapNonEmpty!52448 (= mapRes!52448 (and tp!99977 e!733714))))

(declare-fun mapRest!52448 () (Array (_ BitVec 32) ValueCell!16065))

(declare-fun mapKey!52448 () (_ BitVec 32))

(declare-fun mapValue!52448 () ValueCell!16065)

(assert (=> mapNonEmpty!52448 (= (arr!40959 _values!1445) (store mapRest!52448 mapKey!52448 mapValue!52448))))

(declare-fun mapIsEmpty!52448 () Bool)

(assert (=> mapIsEmpty!52448 mapRes!52448))

(declare-fun b!1284482 () Bool)

(declare-fun e!733713 () Bool)

(assert (=> b!1284482 (= e!733712 (and e!733713 mapRes!52448))))

(declare-fun condMapEmpty!52448 () Bool)

(declare-fun mapDefault!52448 () ValueCell!16065)

(assert (=> b!1284482 (= condMapEmpty!52448 (= (arr!40959 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16065)) mapDefault!52448)))))

(declare-fun b!1284483 () Bool)

(assert (=> b!1284483 (= e!733713 tp_is_empty!33927)))

(assert (= (and start!108774 res!853293) b!1284479))

(assert (= (and b!1284479 res!853295) b!1284476))

(assert (= (and b!1284476 res!853294) b!1284477))

(assert (= (and b!1284477 res!853292) b!1284481))

(assert (= (and b!1284481 res!853296) b!1284480))

(assert (= (and b!1284482 condMapEmpty!52448) mapIsEmpty!52448))

(assert (= (and b!1284482 (not condMapEmpty!52448)) mapNonEmpty!52448))

(get-info :version)

(assert (= (and mapNonEmpty!52448 ((_ is ValueCellFull!16065) mapValue!52448)) b!1284478))

(assert (= (and b!1284482 ((_ is ValueCellFull!16065) mapDefault!52448)) b!1284483))

(assert (= start!108774 b!1284482))

(declare-fun m!1178149 () Bool)

(assert (=> b!1284476 m!1178149))

(declare-fun m!1178151 () Bool)

(assert (=> start!108774 m!1178151))

(declare-fun m!1178153 () Bool)

(assert (=> start!108774 m!1178153))

(declare-fun m!1178155 () Bool)

(assert (=> start!108774 m!1178155))

(declare-fun m!1178157 () Bool)

(assert (=> b!1284480 m!1178157))

(assert (=> b!1284480 m!1178157))

(declare-fun m!1178159 () Bool)

(assert (=> b!1284480 m!1178159))

(declare-fun m!1178161 () Bool)

(assert (=> mapNonEmpty!52448 m!1178161))

(declare-fun m!1178163 () Bool)

(assert (=> b!1284477 m!1178163))

(check-sat (not b_next!28287) (not mapNonEmpty!52448) (not start!108774) (not b!1284476) (not b!1284480) b_and!46353 (not b!1284477) tp_is_empty!33927)
(check-sat b_and!46353 (not b_next!28287))
