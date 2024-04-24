; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108722 () Bool)

(assert start!108722)

(declare-fun b_free!28045 () Bool)

(declare-fun b_next!28045 () Bool)

(assert (=> start!108722 (= b_free!28045 (not b_next!28045))))

(declare-fun tp!99245 () Bool)

(declare-fun b_and!46107 () Bool)

(assert (=> start!108722 (= tp!99245 b_and!46107)))

(declare-fun b!1281880 () Bool)

(declare-fun res!851150 () Bool)

(declare-fun e!732550 () Bool)

(assert (=> b!1281880 (=> (not res!851150) (not e!732550))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50017 0))(
  ( (V!50018 (val!16917 Int)) )
))
(declare-datatypes ((ValueCell!15944 0))(
  ( (ValueCellFull!15944 (v!19512 V!50017)) (EmptyCell!15944) )
))
(declare-datatypes ((array!84475 0))(
  ( (array!84476 (arr!40737 (Array (_ BitVec 32) ValueCell!15944)) (size!41288 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84475)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84477 0))(
  ( (array!84478 (arr!40738 (Array (_ BitVec 32) (_ BitVec 64))) (size!41289 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84477)

(assert (=> b!1281880 (= res!851150 (and (= (size!41288 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41289 _keys!1741) (size!41288 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281881 () Bool)

(declare-fun res!851152 () Bool)

(assert (=> b!1281881 (=> (not res!851152) (not e!732550))))

(declare-fun minValue!1387 () V!50017)

(declare-fun zeroValue!1387 () V!50017)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21674 0))(
  ( (tuple2!21675 (_1!10848 (_ BitVec 64)) (_2!10848 V!50017)) )
))
(declare-datatypes ((List!28888 0))(
  ( (Nil!28885) (Cons!28884 (h!30102 tuple2!21674) (t!42420 List!28888)) )
))
(declare-datatypes ((ListLongMap!19339 0))(
  ( (ListLongMap!19340 (toList!9685 List!28888)) )
))
(declare-fun contains!7814 (ListLongMap!19339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4754 (array!84477 array!84475 (_ BitVec 32) (_ BitVec 32) V!50017 V!50017 (_ BitVec 32) Int) ListLongMap!19339)

(assert (=> b!1281881 (= res!851152 (contains!7814 (getCurrentListMap!4754 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281882 () Bool)

(declare-fun e!732549 () Bool)

(declare-fun tp_is_empty!33685 () Bool)

(assert (=> b!1281882 (= e!732549 tp_is_empty!33685)))

(declare-fun b!1281883 () Bool)

(declare-fun e!732551 () Bool)

(declare-fun mapRes!52079 () Bool)

(assert (=> b!1281883 (= e!732551 (and e!732549 mapRes!52079))))

(declare-fun condMapEmpty!52079 () Bool)

(declare-fun mapDefault!52079 () ValueCell!15944)

(assert (=> b!1281883 (= condMapEmpty!52079 (= (arr!40737 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15944)) mapDefault!52079)))))

(declare-fun b!1281884 () Bool)

(assert (=> b!1281884 (= e!732550 (not true))))

(assert (=> b!1281884 (contains!7814 (getCurrentListMap!4754 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42362 0))(
  ( (Unit!42363) )
))
(declare-fun lt!576624 () Unit!42362)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!2 (array!84477 array!84475 (_ BitVec 32) (_ BitVec 32) V!50017 V!50017 (_ BitVec 64) (_ BitVec 32) Int) Unit!42362)

(assert (=> b!1281884 (= lt!576624 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!2 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281885 () Bool)

(declare-fun res!851148 () Bool)

(assert (=> b!1281885 (=> (not res!851148) (not e!732550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84477 (_ BitVec 32)) Bool)

(assert (=> b!1281885 (= res!851148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!851151 () Bool)

(assert (=> start!108722 (=> (not res!851151) (not e!732550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108722 (= res!851151 (validMask!0 mask!2175))))

(assert (=> start!108722 e!732550))

(assert (=> start!108722 tp_is_empty!33685))

(assert (=> start!108722 true))

(declare-fun array_inv!31121 (array!84475) Bool)

(assert (=> start!108722 (and (array_inv!31121 _values!1445) e!732551)))

(declare-fun array_inv!31122 (array!84477) Bool)

(assert (=> start!108722 (array_inv!31122 _keys!1741)))

(assert (=> start!108722 tp!99245))

(declare-fun b!1281886 () Bool)

(declare-fun res!851153 () Bool)

(assert (=> b!1281886 (=> (not res!851153) (not e!732550))))

(assert (=> b!1281886 (= res!851153 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41289 _keys!1741)) (not (= (select (arr!40738 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1281887 () Bool)

(declare-fun res!851154 () Bool)

(assert (=> b!1281887 (=> (not res!851154) (not e!732550))))

(assert (=> b!1281887 (= res!851154 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41289 _keys!1741))))))

(declare-fun b!1281888 () Bool)

(declare-fun e!732548 () Bool)

(assert (=> b!1281888 (= e!732548 tp_is_empty!33685)))

(declare-fun mapNonEmpty!52079 () Bool)

(declare-fun tp!99244 () Bool)

(assert (=> mapNonEmpty!52079 (= mapRes!52079 (and tp!99244 e!732548))))

(declare-fun mapKey!52079 () (_ BitVec 32))

(declare-fun mapValue!52079 () ValueCell!15944)

(declare-fun mapRest!52079 () (Array (_ BitVec 32) ValueCell!15944))

(assert (=> mapNonEmpty!52079 (= (arr!40737 _values!1445) (store mapRest!52079 mapKey!52079 mapValue!52079))))

(declare-fun mapIsEmpty!52079 () Bool)

(assert (=> mapIsEmpty!52079 mapRes!52079))

(declare-fun b!1281889 () Bool)

(declare-fun res!851149 () Bool)

(assert (=> b!1281889 (=> (not res!851149) (not e!732550))))

(declare-datatypes ((List!28889 0))(
  ( (Nil!28886) (Cons!28885 (h!30103 (_ BitVec 64)) (t!42421 List!28889)) )
))
(declare-fun arrayNoDuplicates!0 (array!84477 (_ BitVec 32) List!28889) Bool)

(assert (=> b!1281889 (= res!851149 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28886))))

(assert (= (and start!108722 res!851151) b!1281880))

(assert (= (and b!1281880 res!851150) b!1281885))

(assert (= (and b!1281885 res!851148) b!1281889))

(assert (= (and b!1281889 res!851149) b!1281887))

(assert (= (and b!1281887 res!851154) b!1281881))

(assert (= (and b!1281881 res!851152) b!1281886))

(assert (= (and b!1281886 res!851153) b!1281884))

(assert (= (and b!1281883 condMapEmpty!52079) mapIsEmpty!52079))

(assert (= (and b!1281883 (not condMapEmpty!52079)) mapNonEmpty!52079))

(get-info :version)

(assert (= (and mapNonEmpty!52079 ((_ is ValueCellFull!15944) mapValue!52079)) b!1281888))

(assert (= (and b!1281883 ((_ is ValueCellFull!15944) mapDefault!52079)) b!1281882))

(assert (= start!108722 b!1281883))

(declare-fun m!1176777 () Bool)

(assert (=> start!108722 m!1176777))

(declare-fun m!1176779 () Bool)

(assert (=> start!108722 m!1176779))

(declare-fun m!1176781 () Bool)

(assert (=> start!108722 m!1176781))

(declare-fun m!1176783 () Bool)

(assert (=> mapNonEmpty!52079 m!1176783))

(declare-fun m!1176785 () Bool)

(assert (=> b!1281881 m!1176785))

(assert (=> b!1281881 m!1176785))

(declare-fun m!1176787 () Bool)

(assert (=> b!1281881 m!1176787))

(declare-fun m!1176789 () Bool)

(assert (=> b!1281889 m!1176789))

(declare-fun m!1176791 () Bool)

(assert (=> b!1281886 m!1176791))

(declare-fun m!1176793 () Bool)

(assert (=> b!1281884 m!1176793))

(assert (=> b!1281884 m!1176793))

(declare-fun m!1176795 () Bool)

(assert (=> b!1281884 m!1176795))

(declare-fun m!1176797 () Bool)

(assert (=> b!1281884 m!1176797))

(declare-fun m!1176799 () Bool)

(assert (=> b!1281885 m!1176799))

(check-sat (not b!1281885) (not b!1281884) (not start!108722) b_and!46107 (not mapNonEmpty!52079) (not b!1281889) (not b_next!28045) (not b!1281881) tp_is_empty!33685)
(check-sat b_and!46107 (not b_next!28045))
