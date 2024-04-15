; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108754 () Bool)

(assert start!108754)

(declare-fun b_free!28267 () Bool)

(declare-fun b_next!28267 () Bool)

(assert (=> start!108754 (= b_free!28267 (not b_next!28267))))

(declare-fun tp!99918 () Bool)

(declare-fun b_and!46315 () Bool)

(assert (=> start!108754 (= tp!99918 b_and!46315)))

(declare-fun b!1284172 () Bool)

(declare-fun e!733534 () Bool)

(assert (=> b!1284172 (= e!733534 false)))

(declare-datatypes ((V!50313 0))(
  ( (V!50314 (val!17028 Int)) )
))
(declare-fun minValue!1387 () V!50313)

(declare-fun zeroValue!1387 () V!50313)

(declare-fun lt!576609 () Bool)

(declare-datatypes ((ValueCell!16055 0))(
  ( (ValueCellFull!16055 (v!19629 V!50313)) (EmptyCell!16055) )
))
(declare-datatypes ((array!84771 0))(
  ( (array!84772 (arr!40888 (Array (_ BitVec 32) ValueCell!16055)) (size!41440 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84771)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84773 0))(
  ( (array!84774 (arr!40889 (Array (_ BitVec 32) (_ BitVec 64))) (size!41441 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84773)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21884 0))(
  ( (tuple2!21885 (_1!10953 (_ BitVec 64)) (_2!10953 V!50313)) )
))
(declare-datatypes ((List!29066 0))(
  ( (Nil!29063) (Cons!29062 (h!30271 tuple2!21884) (t!42602 List!29066)) )
))
(declare-datatypes ((ListLongMap!19541 0))(
  ( (ListLongMap!19542 (toList!9786 List!29066)) )
))
(declare-fun contains!7833 (ListLongMap!19541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4756 (array!84773 array!84771 (_ BitVec 32) (_ BitVec 32) V!50313 V!50313 (_ BitVec 32) Int) ListLongMap!19541)

(assert (=> b!1284172 (= lt!576609 (contains!7833 (getCurrentListMap!4756 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284173 () Bool)

(declare-fun res!853115 () Bool)

(assert (=> b!1284173 (=> (not res!853115) (not e!733534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84773 (_ BitVec 32)) Bool)

(assert (=> b!1284173 (= res!853115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52418 () Bool)

(declare-fun mapRes!52418 () Bool)

(assert (=> mapIsEmpty!52418 mapRes!52418))

(declare-fun b!1284174 () Bool)

(declare-fun e!733533 () Bool)

(declare-fun e!733532 () Bool)

(assert (=> b!1284174 (= e!733533 (and e!733532 mapRes!52418))))

(declare-fun condMapEmpty!52418 () Bool)

(declare-fun mapDefault!52418 () ValueCell!16055)

(assert (=> b!1284174 (= condMapEmpty!52418 (= (arr!40888 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16055)) mapDefault!52418)))))

(declare-fun res!853116 () Bool)

(assert (=> start!108754 (=> (not res!853116) (not e!733534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108754 (= res!853116 (validMask!0 mask!2175))))

(assert (=> start!108754 e!733534))

(declare-fun tp_is_empty!33907 () Bool)

(assert (=> start!108754 tp_is_empty!33907))

(assert (=> start!108754 true))

(declare-fun array_inv!31173 (array!84771) Bool)

(assert (=> start!108754 (and (array_inv!31173 _values!1445) e!733533)))

(declare-fun array_inv!31174 (array!84773) Bool)

(assert (=> start!108754 (array_inv!31174 _keys!1741)))

(assert (=> start!108754 tp!99918))

(declare-fun b!1284175 () Bool)

(declare-fun res!853119 () Bool)

(assert (=> b!1284175 (=> (not res!853119) (not e!733534))))

(declare-datatypes ((List!29067 0))(
  ( (Nil!29064) (Cons!29063 (h!30272 (_ BitVec 64)) (t!42603 List!29067)) )
))
(declare-fun arrayNoDuplicates!0 (array!84773 (_ BitVec 32) List!29067) Bool)

(assert (=> b!1284175 (= res!853119 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29064))))

(declare-fun b!1284176 () Bool)

(assert (=> b!1284176 (= e!733532 tp_is_empty!33907)))

(declare-fun b!1284177 () Bool)

(declare-fun res!853118 () Bool)

(assert (=> b!1284177 (=> (not res!853118) (not e!733534))))

(assert (=> b!1284177 (= res!853118 (and (= (size!41440 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41441 _keys!1741) (size!41440 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284178 () Bool)

(declare-fun res!853117 () Bool)

(assert (=> b!1284178 (=> (not res!853117) (not e!733534))))

(assert (=> b!1284178 (= res!853117 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41441 _keys!1741))))))

(declare-fun mapNonEmpty!52418 () Bool)

(declare-fun tp!99917 () Bool)

(declare-fun e!733536 () Bool)

(assert (=> mapNonEmpty!52418 (= mapRes!52418 (and tp!99917 e!733536))))

(declare-fun mapRest!52418 () (Array (_ BitVec 32) ValueCell!16055))

(declare-fun mapValue!52418 () ValueCell!16055)

(declare-fun mapKey!52418 () (_ BitVec 32))

(assert (=> mapNonEmpty!52418 (= (arr!40888 _values!1445) (store mapRest!52418 mapKey!52418 mapValue!52418))))

(declare-fun b!1284179 () Bool)

(assert (=> b!1284179 (= e!733536 tp_is_empty!33907)))

(assert (= (and start!108754 res!853116) b!1284177))

(assert (= (and b!1284177 res!853118) b!1284173))

(assert (= (and b!1284173 res!853115) b!1284175))

(assert (= (and b!1284175 res!853119) b!1284178))

(assert (= (and b!1284178 res!853117) b!1284172))

(assert (= (and b!1284174 condMapEmpty!52418) mapIsEmpty!52418))

(assert (= (and b!1284174 (not condMapEmpty!52418)) mapNonEmpty!52418))

(get-info :version)

(assert (= (and mapNonEmpty!52418 ((_ is ValueCellFull!16055) mapValue!52418)) b!1284179))

(assert (= (and b!1284174 ((_ is ValueCellFull!16055) mapDefault!52418)) b!1284176))

(assert (= start!108754 b!1284174))

(declare-fun m!1177489 () Bool)

(assert (=> b!1284172 m!1177489))

(assert (=> b!1284172 m!1177489))

(declare-fun m!1177491 () Bool)

(assert (=> b!1284172 m!1177491))

(declare-fun m!1177493 () Bool)

(assert (=> mapNonEmpty!52418 m!1177493))

(declare-fun m!1177495 () Bool)

(assert (=> b!1284173 m!1177495))

(declare-fun m!1177497 () Bool)

(assert (=> start!108754 m!1177497))

(declare-fun m!1177499 () Bool)

(assert (=> start!108754 m!1177499))

(declare-fun m!1177501 () Bool)

(assert (=> start!108754 m!1177501))

(declare-fun m!1177503 () Bool)

(assert (=> b!1284175 m!1177503))

(check-sat tp_is_empty!33907 (not start!108754) b_and!46315 (not b_next!28267) (not mapNonEmpty!52418) (not b!1284173) (not b!1284175) (not b!1284172))
(check-sat b_and!46315 (not b_next!28267))
