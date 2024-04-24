; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108704 () Bool)

(assert start!108704)

(declare-fun b_free!28027 () Bool)

(declare-fun b_next!28027 () Bool)

(assert (=> start!108704 (= b_free!28027 (not b_next!28027))))

(declare-fun tp!99190 () Bool)

(declare-fun b_and!46089 () Bool)

(assert (=> start!108704 (= tp!99190 b_and!46089)))

(declare-fun b!1281642 () Bool)

(declare-fun e!732415 () Bool)

(declare-fun tp_is_empty!33667 () Bool)

(assert (=> b!1281642 (= e!732415 tp_is_empty!33667)))

(declare-fun b!1281643 () Bool)

(declare-fun res!850994 () Bool)

(declare-fun e!732413 () Bool)

(assert (=> b!1281643 (=> (not res!850994) (not e!732413))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49993 0))(
  ( (V!49994 (val!16908 Int)) )
))
(declare-datatypes ((ValueCell!15935 0))(
  ( (ValueCellFull!15935 (v!19503 V!49993)) (EmptyCell!15935) )
))
(declare-datatypes ((array!84439 0))(
  ( (array!84440 (arr!40719 (Array (_ BitVec 32) ValueCell!15935)) (size!41270 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84439)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84441 0))(
  ( (array!84442 (arr!40720 (Array (_ BitVec 32) (_ BitVec 64))) (size!41271 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84441)

(assert (=> b!1281643 (= res!850994 (and (= (size!41270 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41271 _keys!1741) (size!41270 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!850992 () Bool)

(assert (=> start!108704 (=> (not res!850992) (not e!732413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108704 (= res!850992 (validMask!0 mask!2175))))

(assert (=> start!108704 e!732413))

(assert (=> start!108704 tp_is_empty!33667))

(assert (=> start!108704 true))

(declare-fun e!732416 () Bool)

(declare-fun array_inv!31105 (array!84439) Bool)

(assert (=> start!108704 (and (array_inv!31105 _values!1445) e!732416)))

(declare-fun array_inv!31106 (array!84441) Bool)

(assert (=> start!108704 (array_inv!31106 _keys!1741)))

(assert (=> start!108704 tp!99190))

(declare-fun b!1281644 () Bool)

(assert (=> b!1281644 (= e!732413 false)))

(declare-fun minValue!1387 () V!49993)

(declare-fun zeroValue!1387 () V!49993)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576597 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21658 0))(
  ( (tuple2!21659 (_1!10840 (_ BitVec 64)) (_2!10840 V!49993)) )
))
(declare-datatypes ((List!28872 0))(
  ( (Nil!28869) (Cons!28868 (h!30086 tuple2!21658) (t!42404 List!28872)) )
))
(declare-datatypes ((ListLongMap!19323 0))(
  ( (ListLongMap!19324 (toList!9677 List!28872)) )
))
(declare-fun contains!7806 (ListLongMap!19323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4746 (array!84441 array!84439 (_ BitVec 32) (_ BitVec 32) V!49993 V!49993 (_ BitVec 32) Int) ListLongMap!19323)

(assert (=> b!1281644 (= lt!576597 (contains!7806 (getCurrentListMap!4746 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281645 () Bool)

(declare-fun res!850993 () Bool)

(assert (=> b!1281645 (=> (not res!850993) (not e!732413))))

(assert (=> b!1281645 (= res!850993 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41271 _keys!1741))))))

(declare-fun b!1281646 () Bool)

(declare-fun res!850995 () Bool)

(assert (=> b!1281646 (=> (not res!850995) (not e!732413))))

(declare-datatypes ((List!28873 0))(
  ( (Nil!28870) (Cons!28869 (h!30087 (_ BitVec 64)) (t!42405 List!28873)) )
))
(declare-fun arrayNoDuplicates!0 (array!84441 (_ BitVec 32) List!28873) Bool)

(assert (=> b!1281646 (= res!850995 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28870))))

(declare-fun mapIsEmpty!52052 () Bool)

(declare-fun mapRes!52052 () Bool)

(assert (=> mapIsEmpty!52052 mapRes!52052))

(declare-fun b!1281647 () Bool)

(declare-fun res!850991 () Bool)

(assert (=> b!1281647 (=> (not res!850991) (not e!732413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84441 (_ BitVec 32)) Bool)

(assert (=> b!1281647 (= res!850991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281648 () Bool)

(declare-fun e!732414 () Bool)

(assert (=> b!1281648 (= e!732414 tp_is_empty!33667)))

(declare-fun mapNonEmpty!52052 () Bool)

(declare-fun tp!99191 () Bool)

(assert (=> mapNonEmpty!52052 (= mapRes!52052 (and tp!99191 e!732414))))

(declare-fun mapValue!52052 () ValueCell!15935)

(declare-fun mapKey!52052 () (_ BitVec 32))

(declare-fun mapRest!52052 () (Array (_ BitVec 32) ValueCell!15935))

(assert (=> mapNonEmpty!52052 (= (arr!40719 _values!1445) (store mapRest!52052 mapKey!52052 mapValue!52052))))

(declare-fun b!1281649 () Bool)

(assert (=> b!1281649 (= e!732416 (and e!732415 mapRes!52052))))

(declare-fun condMapEmpty!52052 () Bool)

(declare-fun mapDefault!52052 () ValueCell!15935)

(assert (=> b!1281649 (= condMapEmpty!52052 (= (arr!40719 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15935)) mapDefault!52052)))))

(assert (= (and start!108704 res!850992) b!1281643))

(assert (= (and b!1281643 res!850994) b!1281647))

(assert (= (and b!1281647 res!850991) b!1281646))

(assert (= (and b!1281646 res!850995) b!1281645))

(assert (= (and b!1281645 res!850993) b!1281644))

(assert (= (and b!1281649 condMapEmpty!52052) mapIsEmpty!52052))

(assert (= (and b!1281649 (not condMapEmpty!52052)) mapNonEmpty!52052))

(get-info :version)

(assert (= (and mapNonEmpty!52052 ((_ is ValueCellFull!15935) mapValue!52052)) b!1281648))

(assert (= (and b!1281649 ((_ is ValueCellFull!15935) mapDefault!52052)) b!1281642))

(assert (= start!108704 b!1281649))

(declare-fun m!1176609 () Bool)

(assert (=> b!1281647 m!1176609))

(declare-fun m!1176611 () Bool)

(assert (=> b!1281644 m!1176611))

(assert (=> b!1281644 m!1176611))

(declare-fun m!1176613 () Bool)

(assert (=> b!1281644 m!1176613))

(declare-fun m!1176615 () Bool)

(assert (=> start!108704 m!1176615))

(declare-fun m!1176617 () Bool)

(assert (=> start!108704 m!1176617))

(declare-fun m!1176619 () Bool)

(assert (=> start!108704 m!1176619))

(declare-fun m!1176621 () Bool)

(assert (=> mapNonEmpty!52052 m!1176621))

(declare-fun m!1176623 () Bool)

(assert (=> b!1281646 m!1176623))

(check-sat (not b_next!28027) (not mapNonEmpty!52052) b_and!46089 (not b!1281646) tp_is_empty!33667 (not b!1281647) (not start!108704) (not b!1281644))
(check-sat b_and!46089 (not b_next!28027))
