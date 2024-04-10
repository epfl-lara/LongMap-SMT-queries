; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108512 () Bool)

(assert start!108512)

(declare-fun b_free!28059 () Bool)

(declare-fun b_next!28059 () Bool)

(assert (=> start!108512 (= b_free!28059 (not b_next!28059))))

(declare-fun tp!99286 () Bool)

(declare-fun b_and!46119 () Bool)

(assert (=> start!108512 (= tp!99286 b_and!46119)))

(declare-fun b!1280785 () Bool)

(declare-fun res!850778 () Bool)

(declare-fun e!731810 () Bool)

(assert (=> b!1280785 (=> (not res!850778) (not e!731810))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84474 0))(
  ( (array!84475 (arr!40741 (Array (_ BitVec 32) (_ BitVec 64))) (size!41291 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84474)

(assert (=> b!1280785 (= res!850778 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41291 _keys!1741)) (not (= (select (arr!40741 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1280786 () Bool)

(declare-fun e!731807 () Bool)

(declare-fun tp_is_empty!33699 () Bool)

(assert (=> b!1280786 (= e!731807 tp_is_empty!33699)))

(declare-fun b!1280787 () Bool)

(assert (=> b!1280787 (= e!731810 (not true))))

(declare-datatypes ((V!50035 0))(
  ( (V!50036 (val!16924 Int)) )
))
(declare-fun minValue!1387 () V!50035)

(declare-fun zeroValue!1387 () V!50035)

(declare-datatypes ((ValueCell!15951 0))(
  ( (ValueCellFull!15951 (v!19524 V!50035)) (EmptyCell!15951) )
))
(declare-datatypes ((array!84476 0))(
  ( (array!84477 (arr!40742 (Array (_ BitVec 32) ValueCell!15951)) (size!41292 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84476)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21666 0))(
  ( (tuple2!21667 (_1!10844 (_ BitVec 64)) (_2!10844 V!50035)) )
))
(declare-datatypes ((List!28861 0))(
  ( (Nil!28858) (Cons!28857 (h!30066 tuple2!21666) (t!42401 List!28861)) )
))
(declare-datatypes ((ListLongMap!19323 0))(
  ( (ListLongMap!19324 (toList!9677 List!28861)) )
))
(declare-fun contains!7792 (ListLongMap!19323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4761 (array!84474 array!84476 (_ BitVec 32) (_ BitVec 32) V!50035 V!50035 (_ BitVec 32) Int) ListLongMap!19323)

(assert (=> b!1280787 (contains!7792 (getCurrentListMap!4761 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42411 0))(
  ( (Unit!42412) )
))
(declare-fun lt!576161 () Unit!42411)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!10 (array!84474 array!84476 (_ BitVec 32) (_ BitVec 32) V!50035 V!50035 (_ BitVec 64) (_ BitVec 32) Int) Unit!42411)

(assert (=> b!1280787 (= lt!576161 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!10 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280788 () Bool)

(declare-fun res!850777 () Bool)

(assert (=> b!1280788 (=> (not res!850777) (not e!731810))))

(assert (=> b!1280788 (= res!850777 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41291 _keys!1741))))))

(declare-fun b!1280789 () Bool)

(declare-fun res!850779 () Bool)

(assert (=> b!1280789 (=> (not res!850779) (not e!731810))))

(declare-datatypes ((List!28862 0))(
  ( (Nil!28859) (Cons!28858 (h!30067 (_ BitVec 64)) (t!42402 List!28862)) )
))
(declare-fun arrayNoDuplicates!0 (array!84474 (_ BitVec 32) List!28862) Bool)

(assert (=> b!1280789 (= res!850779 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28859))))

(declare-fun b!1280790 () Bool)

(declare-fun res!850781 () Bool)

(assert (=> b!1280790 (=> (not res!850781) (not e!731810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84474 (_ BitVec 32)) Bool)

(assert (=> b!1280790 (= res!850781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52100 () Bool)

(declare-fun mapRes!52100 () Bool)

(declare-fun tp!99287 () Bool)

(declare-fun e!731808 () Bool)

(assert (=> mapNonEmpty!52100 (= mapRes!52100 (and tp!99287 e!731808))))

(declare-fun mapKey!52100 () (_ BitVec 32))

(declare-fun mapValue!52100 () ValueCell!15951)

(declare-fun mapRest!52100 () (Array (_ BitVec 32) ValueCell!15951))

(assert (=> mapNonEmpty!52100 (= (arr!40742 _values!1445) (store mapRest!52100 mapKey!52100 mapValue!52100))))

(declare-fun mapIsEmpty!52100 () Bool)

(assert (=> mapIsEmpty!52100 mapRes!52100))

(declare-fun b!1280792 () Bool)

(declare-fun res!850775 () Bool)

(assert (=> b!1280792 (=> (not res!850775) (not e!731810))))

(assert (=> b!1280792 (= res!850775 (and (= (size!41292 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41291 _keys!1741) (size!41292 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280793 () Bool)

(assert (=> b!1280793 (= e!731808 tp_is_empty!33699)))

(declare-fun b!1280794 () Bool)

(declare-fun res!850780 () Bool)

(assert (=> b!1280794 (=> (not res!850780) (not e!731810))))

(assert (=> b!1280794 (= res!850780 (contains!7792 (getCurrentListMap!4761 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280791 () Bool)

(declare-fun e!731809 () Bool)

(assert (=> b!1280791 (= e!731809 (and e!731807 mapRes!52100))))

(declare-fun condMapEmpty!52100 () Bool)

(declare-fun mapDefault!52100 () ValueCell!15951)

(assert (=> b!1280791 (= condMapEmpty!52100 (= (arr!40742 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15951)) mapDefault!52100)))))

(declare-fun res!850776 () Bool)

(assert (=> start!108512 (=> (not res!850776) (not e!731810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108512 (= res!850776 (validMask!0 mask!2175))))

(assert (=> start!108512 e!731810))

(assert (=> start!108512 tp_is_empty!33699))

(assert (=> start!108512 true))

(declare-fun array_inv!30919 (array!84476) Bool)

(assert (=> start!108512 (and (array_inv!30919 _values!1445) e!731809)))

(declare-fun array_inv!30920 (array!84474) Bool)

(assert (=> start!108512 (array_inv!30920 _keys!1741)))

(assert (=> start!108512 tp!99286))

(assert (= (and start!108512 res!850776) b!1280792))

(assert (= (and b!1280792 res!850775) b!1280790))

(assert (= (and b!1280790 res!850781) b!1280789))

(assert (= (and b!1280789 res!850779) b!1280788))

(assert (= (and b!1280788 res!850777) b!1280794))

(assert (= (and b!1280794 res!850780) b!1280785))

(assert (= (and b!1280785 res!850778) b!1280787))

(assert (= (and b!1280791 condMapEmpty!52100) mapIsEmpty!52100))

(assert (= (and b!1280791 (not condMapEmpty!52100)) mapNonEmpty!52100))

(get-info :version)

(assert (= (and mapNonEmpty!52100 ((_ is ValueCellFull!15951) mapValue!52100)) b!1280793))

(assert (= (and b!1280791 ((_ is ValueCellFull!15951) mapDefault!52100)) b!1280786))

(assert (= start!108512 b!1280791))

(declare-fun m!1175333 () Bool)

(assert (=> b!1280789 m!1175333))

(declare-fun m!1175335 () Bool)

(assert (=> start!108512 m!1175335))

(declare-fun m!1175337 () Bool)

(assert (=> start!108512 m!1175337))

(declare-fun m!1175339 () Bool)

(assert (=> start!108512 m!1175339))

(declare-fun m!1175341 () Bool)

(assert (=> b!1280794 m!1175341))

(assert (=> b!1280794 m!1175341))

(declare-fun m!1175343 () Bool)

(assert (=> b!1280794 m!1175343))

(declare-fun m!1175345 () Bool)

(assert (=> b!1280787 m!1175345))

(assert (=> b!1280787 m!1175345))

(declare-fun m!1175347 () Bool)

(assert (=> b!1280787 m!1175347))

(declare-fun m!1175349 () Bool)

(assert (=> b!1280787 m!1175349))

(declare-fun m!1175351 () Bool)

(assert (=> b!1280785 m!1175351))

(declare-fun m!1175353 () Bool)

(assert (=> mapNonEmpty!52100 m!1175353))

(declare-fun m!1175355 () Bool)

(assert (=> b!1280790 m!1175355))

(check-sat (not mapNonEmpty!52100) (not b!1280787) (not b_next!28059) (not b!1280794) b_and!46119 (not b!1280789) (not b!1280790) tp_is_empty!33699 (not start!108512))
(check-sat b_and!46119 (not b_next!28059))
