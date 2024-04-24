; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108764 () Bool)

(assert start!108764)

(declare-fun b_free!28087 () Bool)

(declare-fun b_next!28087 () Bool)

(assert (=> start!108764 (= b_free!28087 (not b_next!28087))))

(declare-fun tp!99371 () Bool)

(declare-fun b_and!46149 () Bool)

(assert (=> start!108764 (= tp!99371 b_and!46149)))

(declare-fun b!1282510 () Bool)

(declare-fun res!851590 () Bool)

(declare-fun e!732863 () Bool)

(assert (=> b!1282510 (=> (not res!851590) (not e!732863))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84557 0))(
  ( (array!84558 (arr!40778 (Array (_ BitVec 32) (_ BitVec 64))) (size!41329 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84557)

(assert (=> b!1282510 (= res!851590 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41329 _keys!1741))))))

(declare-fun b!1282511 () Bool)

(declare-fun res!851594 () Bool)

(assert (=> b!1282511 (=> (not res!851594) (not e!732863))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1282511 (= res!851594 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41329 _keys!1741)) (not (= (select (arr!40778 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1282512 () Bool)

(declare-fun res!851592 () Bool)

(assert (=> b!1282512 (=> (not res!851592) (not e!732863))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50073 0))(
  ( (V!50074 (val!16938 Int)) )
))
(declare-datatypes ((ValueCell!15965 0))(
  ( (ValueCellFull!15965 (v!19533 V!50073)) (EmptyCell!15965) )
))
(declare-datatypes ((array!84559 0))(
  ( (array!84560 (arr!40779 (Array (_ BitVec 32) ValueCell!15965)) (size!41330 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84559)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282512 (= res!851592 (and (= (size!41330 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41329 _keys!1741) (size!41330 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282513 () Bool)

(declare-fun res!851595 () Bool)

(assert (=> b!1282513 (=> (not res!851595) (not e!732863))))

(declare-fun minValue!1387 () V!50073)

(declare-fun zeroValue!1387 () V!50073)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21704 0))(
  ( (tuple2!21705 (_1!10863 (_ BitVec 64)) (_2!10863 V!50073)) )
))
(declare-datatypes ((List!28920 0))(
  ( (Nil!28917) (Cons!28916 (h!30134 tuple2!21704) (t!42452 List!28920)) )
))
(declare-datatypes ((ListLongMap!19369 0))(
  ( (ListLongMap!19370 (toList!9700 List!28920)) )
))
(declare-fun contains!7829 (ListLongMap!19369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4769 (array!84557 array!84559 (_ BitVec 32) (_ BitVec 32) V!50073 V!50073 (_ BitVec 32) Int) ListLongMap!19369)

(assert (=> b!1282513 (= res!851595 (contains!7829 (getCurrentListMap!4769 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282514 () Bool)

(declare-fun res!851591 () Bool)

(assert (=> b!1282514 (=> (not res!851591) (not e!732863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84557 (_ BitVec 32)) Bool)

(assert (=> b!1282514 (= res!851591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282515 () Bool)

(declare-fun e!732864 () Bool)

(declare-fun e!732866 () Bool)

(declare-fun mapRes!52142 () Bool)

(assert (=> b!1282515 (= e!732864 (and e!732866 mapRes!52142))))

(declare-fun condMapEmpty!52142 () Bool)

(declare-fun mapDefault!52142 () ValueCell!15965)

(assert (=> b!1282515 (= condMapEmpty!52142 (= (arr!40779 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15965)) mapDefault!52142)))))

(declare-fun b!1282516 () Bool)

(assert (=> b!1282516 (= e!732863 (not true))))

(assert (=> b!1282516 (contains!7829 (getCurrentListMap!4769 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42390 0))(
  ( (Unit!42391) )
))
(declare-fun lt!576687 () Unit!42390)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!16 (array!84557 array!84559 (_ BitVec 32) (_ BitVec 32) V!50073 V!50073 (_ BitVec 64) (_ BitVec 32) Int) Unit!42390)

(assert (=> b!1282516 (= lt!576687 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!16 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun res!851593 () Bool)

(assert (=> start!108764 (=> (not res!851593) (not e!732863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108764 (= res!851593 (validMask!0 mask!2175))))

(assert (=> start!108764 e!732863))

(declare-fun tp_is_empty!33727 () Bool)

(assert (=> start!108764 tp_is_empty!33727))

(assert (=> start!108764 true))

(declare-fun array_inv!31155 (array!84559) Bool)

(assert (=> start!108764 (and (array_inv!31155 _values!1445) e!732864)))

(declare-fun array_inv!31156 (array!84557) Bool)

(assert (=> start!108764 (array_inv!31156 _keys!1741)))

(assert (=> start!108764 tp!99371))

(declare-fun b!1282517 () Bool)

(declare-fun e!732867 () Bool)

(assert (=> b!1282517 (= e!732867 tp_is_empty!33727)))

(declare-fun b!1282518 () Bool)

(declare-fun res!851589 () Bool)

(assert (=> b!1282518 (=> (not res!851589) (not e!732863))))

(declare-datatypes ((List!28921 0))(
  ( (Nil!28918) (Cons!28917 (h!30135 (_ BitVec 64)) (t!42453 List!28921)) )
))
(declare-fun arrayNoDuplicates!0 (array!84557 (_ BitVec 32) List!28921) Bool)

(assert (=> b!1282518 (= res!851589 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28918))))

(declare-fun mapNonEmpty!52142 () Bool)

(declare-fun tp!99370 () Bool)

(assert (=> mapNonEmpty!52142 (= mapRes!52142 (and tp!99370 e!732867))))

(declare-fun mapKey!52142 () (_ BitVec 32))

(declare-fun mapRest!52142 () (Array (_ BitVec 32) ValueCell!15965))

(declare-fun mapValue!52142 () ValueCell!15965)

(assert (=> mapNonEmpty!52142 (= (arr!40779 _values!1445) (store mapRest!52142 mapKey!52142 mapValue!52142))))

(declare-fun mapIsEmpty!52142 () Bool)

(assert (=> mapIsEmpty!52142 mapRes!52142))

(declare-fun b!1282519 () Bool)

(assert (=> b!1282519 (= e!732866 tp_is_empty!33727)))

(assert (= (and start!108764 res!851593) b!1282512))

(assert (= (and b!1282512 res!851592) b!1282514))

(assert (= (and b!1282514 res!851591) b!1282518))

(assert (= (and b!1282518 res!851589) b!1282510))

(assert (= (and b!1282510 res!851590) b!1282513))

(assert (= (and b!1282513 res!851595) b!1282511))

(assert (= (and b!1282511 res!851594) b!1282516))

(assert (= (and b!1282515 condMapEmpty!52142) mapIsEmpty!52142))

(assert (= (and b!1282515 (not condMapEmpty!52142)) mapNonEmpty!52142))

(get-info :version)

(assert (= (and mapNonEmpty!52142 ((_ is ValueCellFull!15965) mapValue!52142)) b!1282517))

(assert (= (and b!1282515 ((_ is ValueCellFull!15965) mapDefault!52142)) b!1282519))

(assert (= start!108764 b!1282515))

(declare-fun m!1177281 () Bool)

(assert (=> b!1282518 m!1177281))

(declare-fun m!1177283 () Bool)

(assert (=> b!1282513 m!1177283))

(assert (=> b!1282513 m!1177283))

(declare-fun m!1177285 () Bool)

(assert (=> b!1282513 m!1177285))

(declare-fun m!1177287 () Bool)

(assert (=> b!1282514 m!1177287))

(declare-fun m!1177289 () Bool)

(assert (=> b!1282516 m!1177289))

(assert (=> b!1282516 m!1177289))

(declare-fun m!1177291 () Bool)

(assert (=> b!1282516 m!1177291))

(declare-fun m!1177293 () Bool)

(assert (=> b!1282516 m!1177293))

(declare-fun m!1177295 () Bool)

(assert (=> b!1282511 m!1177295))

(declare-fun m!1177297 () Bool)

(assert (=> mapNonEmpty!52142 m!1177297))

(declare-fun m!1177299 () Bool)

(assert (=> start!108764 m!1177299))

(declare-fun m!1177301 () Bool)

(assert (=> start!108764 m!1177301))

(declare-fun m!1177303 () Bool)

(assert (=> start!108764 m!1177303))

(check-sat (not b!1282516) b_and!46149 (not b!1282513) (not b!1282514) (not mapNonEmpty!52142) (not start!108764) (not b!1282518) tp_is_empty!33727 (not b_next!28087))
(check-sat b_and!46149 (not b_next!28087))
