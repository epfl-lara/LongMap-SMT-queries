; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108846 () Bool)

(assert start!108846)

(declare-fun b_free!28359 () Bool)

(declare-fun b_next!28359 () Bool)

(assert (=> start!108846 (= b_free!28359 (not b_next!28359))))

(declare-fun tp!100192 () Bool)

(declare-fun b_and!46425 () Bool)

(assert (=> start!108846 (= tp!100192 b_and!46425)))

(declare-fun b!1285439 () Bool)

(declare-fun res!853933 () Bool)

(declare-fun e!734251 () Bool)

(assert (=> b!1285439 (=> (not res!853933) (not e!734251))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50435 0))(
  ( (V!50436 (val!17074 Int)) )
))
(declare-datatypes ((ValueCell!16101 0))(
  ( (ValueCellFull!16101 (v!19676 V!50435)) (EmptyCell!16101) )
))
(declare-datatypes ((array!85054 0))(
  ( (array!85055 (arr!41029 (Array (_ BitVec 32) ValueCell!16101)) (size!41579 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85054)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85056 0))(
  ( (array!85057 (arr!41030 (Array (_ BitVec 32) (_ BitVec 64))) (size!41580 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85056)

(assert (=> b!1285439 (= res!853933 (and (= (size!41579 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41580 _keys!1741) (size!41579 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52556 () Bool)

(declare-fun mapRes!52556 () Bool)

(assert (=> mapIsEmpty!52556 mapRes!52556))

(declare-fun b!1285440 () Bool)

(declare-fun res!853932 () Bool)

(assert (=> b!1285440 (=> (not res!853932) (not e!734251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85056 (_ BitVec 32)) Bool)

(assert (=> b!1285440 (= res!853932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285441 () Bool)

(declare-fun e!734255 () Bool)

(declare-fun tp_is_empty!33999 () Bool)

(assert (=> b!1285441 (= e!734255 tp_is_empty!33999)))

(declare-fun b!1285442 () Bool)

(assert (=> b!1285442 (= e!734251 false)))

(declare-fun zeroValue!1387 () V!50435)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun minValue!1387 () V!50435)

(declare-fun lt!576916 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21886 0))(
  ( (tuple2!21887 (_1!10954 (_ BitVec 64)) (_2!10954 V!50435)) )
))
(declare-datatypes ((List!29076 0))(
  ( (Nil!29073) (Cons!29072 (h!30281 tuple2!21886) (t!42620 List!29076)) )
))
(declare-datatypes ((ListLongMap!19543 0))(
  ( (ListLongMap!19544 (toList!9787 List!29076)) )
))
(declare-fun contains!7904 (ListLongMap!19543 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4865 (array!85056 array!85054 (_ BitVec 32) (_ BitVec 32) V!50435 V!50435 (_ BitVec 32) Int) ListLongMap!19543)

(assert (=> b!1285442 (= lt!576916 (contains!7904 (getCurrentListMap!4865 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285443 () Bool)

(declare-fun e!734252 () Bool)

(declare-fun e!734254 () Bool)

(assert (=> b!1285443 (= e!734252 (and e!734254 mapRes!52556))))

(declare-fun condMapEmpty!52556 () Bool)

(declare-fun mapDefault!52556 () ValueCell!16101)

(assert (=> b!1285443 (= condMapEmpty!52556 (= (arr!41029 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16101)) mapDefault!52556)))))

(declare-fun b!1285444 () Bool)

(declare-fun res!853934 () Bool)

(assert (=> b!1285444 (=> (not res!853934) (not e!734251))))

(declare-datatypes ((List!29077 0))(
  ( (Nil!29074) (Cons!29073 (h!30282 (_ BitVec 64)) (t!42621 List!29077)) )
))
(declare-fun arrayNoDuplicates!0 (array!85056 (_ BitVec 32) List!29077) Bool)

(assert (=> b!1285444 (= res!853934 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29074))))

(declare-fun b!1285446 () Bool)

(assert (=> b!1285446 (= e!734254 tp_is_empty!33999)))

(declare-fun mapNonEmpty!52556 () Bool)

(declare-fun tp!100193 () Bool)

(assert (=> mapNonEmpty!52556 (= mapRes!52556 (and tp!100193 e!734255))))

(declare-fun mapRest!52556 () (Array (_ BitVec 32) ValueCell!16101))

(declare-fun mapKey!52556 () (_ BitVec 32))

(declare-fun mapValue!52556 () ValueCell!16101)

(assert (=> mapNonEmpty!52556 (= (arr!41029 _values!1445) (store mapRest!52556 mapKey!52556 mapValue!52556))))

(declare-fun res!853935 () Bool)

(assert (=> start!108846 (=> (not res!853935) (not e!734251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108846 (= res!853935 (validMask!0 mask!2175))))

(assert (=> start!108846 e!734251))

(assert (=> start!108846 tp_is_empty!33999))

(assert (=> start!108846 true))

(declare-fun array_inv!31115 (array!85054) Bool)

(assert (=> start!108846 (and (array_inv!31115 _values!1445) e!734252)))

(declare-fun array_inv!31116 (array!85056) Bool)

(assert (=> start!108846 (array_inv!31116 _keys!1741)))

(assert (=> start!108846 tp!100192))

(declare-fun b!1285445 () Bool)

(declare-fun res!853931 () Bool)

(assert (=> b!1285445 (=> (not res!853931) (not e!734251))))

(assert (=> b!1285445 (= res!853931 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41580 _keys!1741))))))

(assert (= (and start!108846 res!853935) b!1285439))

(assert (= (and b!1285439 res!853933) b!1285440))

(assert (= (and b!1285440 res!853932) b!1285444))

(assert (= (and b!1285444 res!853934) b!1285445))

(assert (= (and b!1285445 res!853931) b!1285442))

(assert (= (and b!1285443 condMapEmpty!52556) mapIsEmpty!52556))

(assert (= (and b!1285443 (not condMapEmpty!52556)) mapNonEmpty!52556))

(get-info :version)

(assert (= (and mapNonEmpty!52556 ((_ is ValueCellFull!16101) mapValue!52556)) b!1285441))

(assert (= (and b!1285443 ((_ is ValueCellFull!16101) mapDefault!52556)) b!1285446))

(assert (= start!108846 b!1285443))

(declare-fun m!1178797 () Bool)

(assert (=> mapNonEmpty!52556 m!1178797))

(declare-fun m!1178799 () Bool)

(assert (=> start!108846 m!1178799))

(declare-fun m!1178801 () Bool)

(assert (=> start!108846 m!1178801))

(declare-fun m!1178803 () Bool)

(assert (=> start!108846 m!1178803))

(declare-fun m!1178805 () Bool)

(assert (=> b!1285440 m!1178805))

(declare-fun m!1178807 () Bool)

(assert (=> b!1285442 m!1178807))

(assert (=> b!1285442 m!1178807))

(declare-fun m!1178809 () Bool)

(assert (=> b!1285442 m!1178809))

(declare-fun m!1178811 () Bool)

(assert (=> b!1285444 m!1178811))

(check-sat tp_is_empty!33999 (not b!1285440) b_and!46425 (not b!1285444) (not start!108846) (not mapNonEmpty!52556) (not b!1285442) (not b_next!28359))
(check-sat b_and!46425 (not b_next!28359))
