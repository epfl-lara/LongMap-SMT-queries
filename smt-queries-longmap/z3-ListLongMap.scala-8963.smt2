; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108504 () Bool)

(assert start!108504)

(declare-fun b_free!28051 () Bool)

(declare-fun b_next!28051 () Bool)

(assert (=> start!108504 (= b_free!28051 (not b_next!28051))))

(declare-fun tp!99264 () Bool)

(declare-fun b_and!46093 () Bool)

(assert (=> start!108504 (= tp!99264 b_and!46093)))

(declare-fun b!1280602 () Bool)

(declare-fun e!731717 () Bool)

(declare-fun e!731718 () Bool)

(declare-fun mapRes!52088 () Bool)

(assert (=> b!1280602 (= e!731717 (and e!731718 mapRes!52088))))

(declare-fun condMapEmpty!52088 () Bool)

(declare-datatypes ((V!50025 0))(
  ( (V!50026 (val!16920 Int)) )
))
(declare-datatypes ((ValueCell!15947 0))(
  ( (ValueCellFull!15947 (v!19519 V!50025)) (EmptyCell!15947) )
))
(declare-datatypes ((array!84349 0))(
  ( (array!84350 (arr!40679 (Array (_ BitVec 32) ValueCell!15947)) (size!41231 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84349)

(declare-fun mapDefault!52088 () ValueCell!15947)

(assert (=> b!1280602 (= condMapEmpty!52088 (= (arr!40679 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15947)) mapDefault!52088)))))

(declare-fun b!1280603 () Bool)

(declare-fun res!850666 () Bool)

(declare-fun e!731720 () Bool)

(assert (=> b!1280603 (=> (not res!850666) (not e!731720))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84351 0))(
  ( (array!84352 (arr!40680 (Array (_ BitVec 32) (_ BitVec 64))) (size!41232 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84351)

(assert (=> b!1280603 (= res!850666 (and (= (size!41231 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41232 _keys!1741) (size!41231 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280604 () Bool)

(declare-fun res!850667 () Bool)

(assert (=> b!1280604 (=> (not res!850667) (not e!731720))))

(declare-fun minValue!1387 () V!50025)

(declare-fun zeroValue!1387 () V!50025)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21726 0))(
  ( (tuple2!21727 (_1!10874 (_ BitVec 64)) (_2!10874 V!50025)) )
))
(declare-datatypes ((List!28920 0))(
  ( (Nil!28917) (Cons!28916 (h!30125 tuple2!21726) (t!42452 List!28920)) )
))
(declare-datatypes ((ListLongMap!19383 0))(
  ( (ListLongMap!19384 (toList!9707 List!28920)) )
))
(declare-fun contains!7752 (ListLongMap!19383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4681 (array!84351 array!84349 (_ BitVec 32) (_ BitVec 32) V!50025 V!50025 (_ BitVec 32) Int) ListLongMap!19383)

(assert (=> b!1280604 (= res!850667 (contains!7752 (getCurrentListMap!4681 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280605 () Bool)

(declare-fun res!850669 () Bool)

(assert (=> b!1280605 (=> (not res!850669) (not e!731720))))

(assert (=> b!1280605 (= res!850669 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41232 _keys!1741)) (not (= (select (arr!40680 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1280606 () Bool)

(declare-fun res!850668 () Bool)

(assert (=> b!1280606 (=> (not res!850668) (not e!731720))))

(declare-datatypes ((List!28921 0))(
  ( (Nil!28918) (Cons!28917 (h!30126 (_ BitVec 64)) (t!42453 List!28921)) )
))
(declare-fun arrayNoDuplicates!0 (array!84351 (_ BitVec 32) List!28921) Bool)

(assert (=> b!1280606 (= res!850668 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28918))))

(declare-fun mapIsEmpty!52088 () Bool)

(assert (=> mapIsEmpty!52088 mapRes!52088))

(declare-fun b!1280601 () Bool)

(declare-fun e!731719 () Bool)

(declare-fun tp_is_empty!33691 () Bool)

(assert (=> b!1280601 (= e!731719 tp_is_empty!33691)))

(declare-fun res!850665 () Bool)

(assert (=> start!108504 (=> (not res!850665) (not e!731720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108504 (= res!850665 (validMask!0 mask!2175))))

(assert (=> start!108504 e!731720))

(assert (=> start!108504 tp_is_empty!33691))

(assert (=> start!108504 true))

(declare-fun array_inv!31039 (array!84349) Bool)

(assert (=> start!108504 (and (array_inv!31039 _values!1445) e!731717)))

(declare-fun array_inv!31040 (array!84351) Bool)

(assert (=> start!108504 (array_inv!31040 _keys!1741)))

(assert (=> start!108504 tp!99264))

(declare-fun b!1280607 () Bool)

(assert (=> b!1280607 (= e!731718 tp_is_empty!33691)))

(declare-fun b!1280608 () Bool)

(assert (=> b!1280608 (= e!731720 (not true))))

(assert (=> b!1280608 (contains!7752 (getCurrentListMap!4681 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42247 0))(
  ( (Unit!42248) )
))
(declare-fun lt!575971 () Unit!42247)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!5 (array!84351 array!84349 (_ BitVec 32) (_ BitVec 32) V!50025 V!50025 (_ BitVec 64) (_ BitVec 32) Int) Unit!42247)

(assert (=> b!1280608 (= lt!575971 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!5 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280609 () Bool)

(declare-fun res!850670 () Bool)

(assert (=> b!1280609 (=> (not res!850670) (not e!731720))))

(assert (=> b!1280609 (= res!850670 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41232 _keys!1741))))))

(declare-fun mapNonEmpty!52088 () Bool)

(declare-fun tp!99263 () Bool)

(assert (=> mapNonEmpty!52088 (= mapRes!52088 (and tp!99263 e!731719))))

(declare-fun mapKey!52088 () (_ BitVec 32))

(declare-fun mapRest!52088 () (Array (_ BitVec 32) ValueCell!15947))

(declare-fun mapValue!52088 () ValueCell!15947)

(assert (=> mapNonEmpty!52088 (= (arr!40679 _values!1445) (store mapRest!52088 mapKey!52088 mapValue!52088))))

(declare-fun b!1280610 () Bool)

(declare-fun res!850664 () Bool)

(assert (=> b!1280610 (=> (not res!850664) (not e!731720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84351 (_ BitVec 32)) Bool)

(assert (=> b!1280610 (= res!850664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108504 res!850665) b!1280603))

(assert (= (and b!1280603 res!850666) b!1280610))

(assert (= (and b!1280610 res!850664) b!1280606))

(assert (= (and b!1280606 res!850668) b!1280609))

(assert (= (and b!1280609 res!850670) b!1280604))

(assert (= (and b!1280604 res!850667) b!1280605))

(assert (= (and b!1280605 res!850669) b!1280608))

(assert (= (and b!1280602 condMapEmpty!52088) mapIsEmpty!52088))

(assert (= (and b!1280602 (not condMapEmpty!52088)) mapNonEmpty!52088))

(get-info :version)

(assert (= (and mapNonEmpty!52088 ((_ is ValueCellFull!15947) mapValue!52088)) b!1280601))

(assert (= (and b!1280602 ((_ is ValueCellFull!15947) mapDefault!52088)) b!1280607))

(assert (= start!108504 b!1280602))

(declare-fun m!1174737 () Bool)

(assert (=> start!108504 m!1174737))

(declare-fun m!1174739 () Bool)

(assert (=> start!108504 m!1174739))

(declare-fun m!1174741 () Bool)

(assert (=> start!108504 m!1174741))

(declare-fun m!1174743 () Bool)

(assert (=> mapNonEmpty!52088 m!1174743))

(declare-fun m!1174745 () Bool)

(assert (=> b!1280605 m!1174745))

(declare-fun m!1174747 () Bool)

(assert (=> b!1280610 m!1174747))

(declare-fun m!1174749 () Bool)

(assert (=> b!1280606 m!1174749))

(declare-fun m!1174751 () Bool)

(assert (=> b!1280604 m!1174751))

(assert (=> b!1280604 m!1174751))

(declare-fun m!1174753 () Bool)

(assert (=> b!1280604 m!1174753))

(declare-fun m!1174755 () Bool)

(assert (=> b!1280608 m!1174755))

(assert (=> b!1280608 m!1174755))

(declare-fun m!1174757 () Bool)

(assert (=> b!1280608 m!1174757))

(declare-fun m!1174759 () Bool)

(assert (=> b!1280608 m!1174759))

(check-sat (not mapNonEmpty!52088) b_and!46093 (not start!108504) (not b!1280604) (not b!1280608) tp_is_empty!33691 (not b_next!28051) (not b!1280610) (not b!1280606))
(check-sat b_and!46093 (not b_next!28051))
