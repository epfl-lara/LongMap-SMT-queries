; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108548 () Bool)

(assert start!108548)

(declare-fun b_free!28095 () Bool)

(declare-fun b_next!28095 () Bool)

(assert (=> start!108548 (= b_free!28095 (not b_next!28095))))

(declare-fun tp!99394 () Bool)

(declare-fun b_and!46155 () Bool)

(assert (=> start!108548 (= tp!99394 b_and!46155)))

(declare-fun b!1281325 () Bool)

(declare-fun e!732076 () Bool)

(declare-fun tp_is_empty!33735 () Bool)

(assert (=> b!1281325 (= e!732076 tp_is_empty!33735)))

(declare-fun res!851158 () Bool)

(declare-fun e!732078 () Bool)

(assert (=> start!108548 (=> (not res!851158) (not e!732078))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108548 (= res!851158 (validMask!0 mask!2175))))

(assert (=> start!108548 e!732078))

(assert (=> start!108548 tp_is_empty!33735))

(assert (=> start!108548 true))

(declare-datatypes ((V!50083 0))(
  ( (V!50084 (val!16942 Int)) )
))
(declare-datatypes ((ValueCell!15969 0))(
  ( (ValueCellFull!15969 (v!19542 V!50083)) (EmptyCell!15969) )
))
(declare-datatypes ((array!84540 0))(
  ( (array!84541 (arr!40774 (Array (_ BitVec 32) ValueCell!15969)) (size!41324 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84540)

(declare-fun e!732080 () Bool)

(declare-fun array_inv!30939 (array!84540) Bool)

(assert (=> start!108548 (and (array_inv!30939 _values!1445) e!732080)))

(declare-datatypes ((array!84542 0))(
  ( (array!84543 (arr!40775 (Array (_ BitVec 32) (_ BitVec 64))) (size!41325 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84542)

(declare-fun array_inv!30940 (array!84542) Bool)

(assert (=> start!108548 (array_inv!30940 _keys!1741)))

(assert (=> start!108548 tp!99394))

(declare-fun b!1281326 () Bool)

(declare-fun mapRes!52154 () Bool)

(assert (=> b!1281326 (= e!732080 (and e!732076 mapRes!52154))))

(declare-fun condMapEmpty!52154 () Bool)

(declare-fun mapDefault!52154 () ValueCell!15969)

(assert (=> b!1281326 (= condMapEmpty!52154 (= (arr!40774 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15969)) mapDefault!52154)))))

(declare-fun b!1281327 () Bool)

(declare-fun res!851156 () Bool)

(assert (=> b!1281327 (=> (not res!851156) (not e!732078))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281327 (= res!851156 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41325 _keys!1741))))))

(declare-fun mapIsEmpty!52154 () Bool)

(assert (=> mapIsEmpty!52154 mapRes!52154))

(declare-fun b!1281328 () Bool)

(declare-fun res!851154 () Bool)

(assert (=> b!1281328 (=> (not res!851154) (not e!732078))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1281328 (= res!851154 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41325 _keys!1741)) (not (= (select (arr!40775 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapNonEmpty!52154 () Bool)

(declare-fun tp!99395 () Bool)

(declare-fun e!732077 () Bool)

(assert (=> mapNonEmpty!52154 (= mapRes!52154 (and tp!99395 e!732077))))

(declare-fun mapRest!52154 () (Array (_ BitVec 32) ValueCell!15969))

(declare-fun mapValue!52154 () ValueCell!15969)

(declare-fun mapKey!52154 () (_ BitVec 32))

(assert (=> mapNonEmpty!52154 (= (arr!40774 _values!1445) (store mapRest!52154 mapKey!52154 mapValue!52154))))

(declare-fun b!1281329 () Bool)

(declare-fun res!851157 () Bool)

(assert (=> b!1281329 (=> (not res!851157) (not e!732078))))

(declare-fun zeroValue!1387 () V!50083)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!50083)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21690 0))(
  ( (tuple2!21691 (_1!10856 (_ BitVec 64)) (_2!10856 V!50083)) )
))
(declare-datatypes ((List!28884 0))(
  ( (Nil!28881) (Cons!28880 (h!30089 tuple2!21690) (t!42424 List!28884)) )
))
(declare-datatypes ((ListLongMap!19347 0))(
  ( (ListLongMap!19348 (toList!9689 List!28884)) )
))
(declare-fun contains!7804 (ListLongMap!19347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4773 (array!84542 array!84540 (_ BitVec 32) (_ BitVec 32) V!50083 V!50083 (_ BitVec 32) Int) ListLongMap!19347)

(assert (=> b!1281329 (= res!851157 (contains!7804 (getCurrentListMap!4773 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281330 () Bool)

(declare-fun res!851153 () Bool)

(assert (=> b!1281330 (=> (not res!851153) (not e!732078))))

(assert (=> b!1281330 (= res!851153 (and (= (size!41324 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41325 _keys!1741) (size!41324 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281331 () Bool)

(declare-fun res!851159 () Bool)

(assert (=> b!1281331 (=> (not res!851159) (not e!732078))))

(declare-datatypes ((List!28885 0))(
  ( (Nil!28882) (Cons!28881 (h!30090 (_ BitVec 64)) (t!42425 List!28885)) )
))
(declare-fun arrayNoDuplicates!0 (array!84542 (_ BitVec 32) List!28885) Bool)

(assert (=> b!1281331 (= res!851159 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28882))))

(declare-fun b!1281332 () Bool)

(assert (=> b!1281332 (= e!732078 (not true))))

(assert (=> b!1281332 (contains!7804 (getCurrentListMap!4773 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42435 0))(
  ( (Unit!42436) )
))
(declare-fun lt!576215 () Unit!42435)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!22 (array!84542 array!84540 (_ BitVec 32) (_ BitVec 32) V!50083 V!50083 (_ BitVec 64) (_ BitVec 32) Int) Unit!42435)

(assert (=> b!1281332 (= lt!576215 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!22 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281333 () Bool)

(assert (=> b!1281333 (= e!732077 tp_is_empty!33735)))

(declare-fun b!1281334 () Bool)

(declare-fun res!851155 () Bool)

(assert (=> b!1281334 (=> (not res!851155) (not e!732078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84542 (_ BitVec 32)) Bool)

(assert (=> b!1281334 (= res!851155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108548 res!851158) b!1281330))

(assert (= (and b!1281330 res!851153) b!1281334))

(assert (= (and b!1281334 res!851155) b!1281331))

(assert (= (and b!1281331 res!851159) b!1281327))

(assert (= (and b!1281327 res!851156) b!1281329))

(assert (= (and b!1281329 res!851157) b!1281328))

(assert (= (and b!1281328 res!851154) b!1281332))

(assert (= (and b!1281326 condMapEmpty!52154) mapIsEmpty!52154))

(assert (= (and b!1281326 (not condMapEmpty!52154)) mapNonEmpty!52154))

(get-info :version)

(assert (= (and mapNonEmpty!52154 ((_ is ValueCellFull!15969) mapValue!52154)) b!1281333))

(assert (= (and b!1281326 ((_ is ValueCellFull!15969) mapDefault!52154)) b!1281325))

(assert (= start!108548 b!1281326))

(declare-fun m!1175765 () Bool)

(assert (=> b!1281332 m!1175765))

(assert (=> b!1281332 m!1175765))

(declare-fun m!1175767 () Bool)

(assert (=> b!1281332 m!1175767))

(declare-fun m!1175769 () Bool)

(assert (=> b!1281332 m!1175769))

(declare-fun m!1175771 () Bool)

(assert (=> start!108548 m!1175771))

(declare-fun m!1175773 () Bool)

(assert (=> start!108548 m!1175773))

(declare-fun m!1175775 () Bool)

(assert (=> start!108548 m!1175775))

(declare-fun m!1175777 () Bool)

(assert (=> b!1281334 m!1175777))

(declare-fun m!1175779 () Bool)

(assert (=> mapNonEmpty!52154 m!1175779))

(declare-fun m!1175781 () Bool)

(assert (=> b!1281328 m!1175781))

(declare-fun m!1175783 () Bool)

(assert (=> b!1281329 m!1175783))

(assert (=> b!1281329 m!1175783))

(declare-fun m!1175785 () Bool)

(assert (=> b!1281329 m!1175785))

(declare-fun m!1175787 () Bool)

(assert (=> b!1281331 m!1175787))

(check-sat (not mapNonEmpty!52154) (not b!1281334) (not b!1281329) b_and!46155 (not b!1281331) (not b_next!28095) (not start!108548) tp_is_empty!33735 (not b!1281332))
(check-sat b_and!46155 (not b_next!28095))
