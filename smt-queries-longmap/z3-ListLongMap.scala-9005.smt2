; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108790 () Bool)

(assert start!108790)

(declare-fun b_free!28303 () Bool)

(declare-fun b_next!28303 () Bool)

(assert (=> start!108790 (= b_free!28303 (not b_next!28303))))

(declare-fun tp!100026 () Bool)

(declare-fun b_and!46351 () Bool)

(assert (=> start!108790 (= tp!100026 b_and!46351)))

(declare-fun b!1284604 () Bool)

(declare-fun res!853389 () Bool)

(declare-fun e!733802 () Bool)

(assert (=> b!1284604 (=> (not res!853389) (not e!733802))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84837 0))(
  ( (array!84838 (arr!40921 (Array (_ BitVec 32) (_ BitVec 64))) (size!41473 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84837)

(assert (=> b!1284604 (= res!853389 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41473 _keys!1741))))))

(declare-fun b!1284605 () Bool)

(declare-fun e!733806 () Bool)

(declare-fun tp_is_empty!33943 () Bool)

(assert (=> b!1284605 (= e!733806 tp_is_empty!33943)))

(declare-fun mapNonEmpty!52472 () Bool)

(declare-fun mapRes!52472 () Bool)

(declare-fun tp!100025 () Bool)

(assert (=> mapNonEmpty!52472 (= mapRes!52472 (and tp!100025 e!733806))))

(declare-fun mapKey!52472 () (_ BitVec 32))

(declare-datatypes ((V!50361 0))(
  ( (V!50362 (val!17046 Int)) )
))
(declare-datatypes ((ValueCell!16073 0))(
  ( (ValueCellFull!16073 (v!19647 V!50361)) (EmptyCell!16073) )
))
(declare-datatypes ((array!84839 0))(
  ( (array!84840 (arr!40922 (Array (_ BitVec 32) ValueCell!16073)) (size!41474 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84839)

(declare-fun mapValue!52472 () ValueCell!16073)

(declare-fun mapRest!52472 () (Array (_ BitVec 32) ValueCell!16073))

(assert (=> mapNonEmpty!52472 (= (arr!40922 _values!1445) (store mapRest!52472 mapKey!52472 mapValue!52472))))

(declare-fun b!1284606 () Bool)

(declare-fun res!853387 () Bool)

(assert (=> b!1284606 (=> (not res!853387) (not e!733802))))

(declare-datatypes ((List!29092 0))(
  ( (Nil!29089) (Cons!29088 (h!30297 (_ BitVec 64)) (t!42628 List!29092)) )
))
(declare-fun arrayNoDuplicates!0 (array!84837 (_ BitVec 32) List!29092) Bool)

(assert (=> b!1284606 (= res!853387 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29089))))

(declare-fun b!1284607 () Bool)

(assert (=> b!1284607 (= e!733802 false)))

(declare-fun minValue!1387 () V!50361)

(declare-fun zeroValue!1387 () V!50361)

(declare-fun lt!576663 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21912 0))(
  ( (tuple2!21913 (_1!10967 (_ BitVec 64)) (_2!10967 V!50361)) )
))
(declare-datatypes ((List!29093 0))(
  ( (Nil!29090) (Cons!29089 (h!30298 tuple2!21912) (t!42629 List!29093)) )
))
(declare-datatypes ((ListLongMap!19569 0))(
  ( (ListLongMap!19570 (toList!9800 List!29093)) )
))
(declare-fun contains!7847 (ListLongMap!19569 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4770 (array!84837 array!84839 (_ BitVec 32) (_ BitVec 32) V!50361 V!50361 (_ BitVec 32) Int) ListLongMap!19569)

(assert (=> b!1284607 (= lt!576663 (contains!7847 (getCurrentListMap!4770 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284608 () Bool)

(declare-fun e!733805 () Bool)

(assert (=> b!1284608 (= e!733805 tp_is_empty!33943)))

(declare-fun res!853385 () Bool)

(assert (=> start!108790 (=> (not res!853385) (not e!733802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108790 (= res!853385 (validMask!0 mask!2175))))

(assert (=> start!108790 e!733802))

(assert (=> start!108790 tp_is_empty!33943))

(assert (=> start!108790 true))

(declare-fun e!733804 () Bool)

(declare-fun array_inv!31201 (array!84839) Bool)

(assert (=> start!108790 (and (array_inv!31201 _values!1445) e!733804)))

(declare-fun array_inv!31202 (array!84837) Bool)

(assert (=> start!108790 (array_inv!31202 _keys!1741)))

(assert (=> start!108790 tp!100026))

(declare-fun mapIsEmpty!52472 () Bool)

(assert (=> mapIsEmpty!52472 mapRes!52472))

(declare-fun b!1284609 () Bool)

(assert (=> b!1284609 (= e!733804 (and e!733805 mapRes!52472))))

(declare-fun condMapEmpty!52472 () Bool)

(declare-fun mapDefault!52472 () ValueCell!16073)

(assert (=> b!1284609 (= condMapEmpty!52472 (= (arr!40922 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16073)) mapDefault!52472)))))

(declare-fun b!1284610 () Bool)

(declare-fun res!853388 () Bool)

(assert (=> b!1284610 (=> (not res!853388) (not e!733802))))

(assert (=> b!1284610 (= res!853388 (and (= (size!41474 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41473 _keys!1741) (size!41474 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284611 () Bool)

(declare-fun res!853386 () Bool)

(assert (=> b!1284611 (=> (not res!853386) (not e!733802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84837 (_ BitVec 32)) Bool)

(assert (=> b!1284611 (= res!853386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108790 res!853385) b!1284610))

(assert (= (and b!1284610 res!853388) b!1284611))

(assert (= (and b!1284611 res!853386) b!1284606))

(assert (= (and b!1284606 res!853387) b!1284604))

(assert (= (and b!1284604 res!853389) b!1284607))

(assert (= (and b!1284609 condMapEmpty!52472) mapIsEmpty!52472))

(assert (= (and b!1284609 (not condMapEmpty!52472)) mapNonEmpty!52472))

(get-info :version)

(assert (= (and mapNonEmpty!52472 ((_ is ValueCellFull!16073) mapValue!52472)) b!1284605))

(assert (= (and b!1284609 ((_ is ValueCellFull!16073) mapDefault!52472)) b!1284608))

(assert (= start!108790 b!1284609))

(declare-fun m!1177777 () Bool)

(assert (=> b!1284611 m!1177777))

(declare-fun m!1177779 () Bool)

(assert (=> b!1284606 m!1177779))

(declare-fun m!1177781 () Bool)

(assert (=> start!108790 m!1177781))

(declare-fun m!1177783 () Bool)

(assert (=> start!108790 m!1177783))

(declare-fun m!1177785 () Bool)

(assert (=> start!108790 m!1177785))

(declare-fun m!1177787 () Bool)

(assert (=> mapNonEmpty!52472 m!1177787))

(declare-fun m!1177789 () Bool)

(assert (=> b!1284607 m!1177789))

(assert (=> b!1284607 m!1177789))

(declare-fun m!1177791 () Bool)

(assert (=> b!1284607 m!1177791))

(check-sat (not b!1284606) b_and!46351 (not b_next!28303) (not b!1284611) tp_is_empty!33943 (not b!1284607) (not mapNonEmpty!52472) (not start!108790))
(check-sat b_and!46351 (not b_next!28303))
