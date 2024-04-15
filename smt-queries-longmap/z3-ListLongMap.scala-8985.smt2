; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108670 () Bool)

(assert start!108670)

(declare-fun b_free!28183 () Bool)

(declare-fun b_next!28183 () Bool)

(assert (=> start!108670 (= b_free!28183 (not b_next!28183))))

(declare-fun tp!99666 () Bool)

(declare-fun b_and!46231 () Bool)

(assert (=> start!108670 (= tp!99666 b_and!46231)))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun b!1282675 () Bool)

(declare-fun e!732903 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84609 0))(
  ( (array!84610 (arr!40807 (Array (_ BitVec 32) (_ BitVec 64))) (size!41359 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84609)

(assert (=> b!1282675 (= e!732903 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsgt from!2144 (size!41359 _keys!1741))))))

(declare-fun res!851997 () Bool)

(assert (=> start!108670 (=> (not res!851997) (not e!732903))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108670 (= res!851997 (validMask!0 mask!2175))))

(assert (=> start!108670 e!732903))

(declare-fun tp_is_empty!33823 () Bool)

(assert (=> start!108670 tp_is_empty!33823))

(assert (=> start!108670 true))

(declare-datatypes ((V!50201 0))(
  ( (V!50202 (val!16986 Int)) )
))
(declare-datatypes ((ValueCell!16013 0))(
  ( (ValueCellFull!16013 (v!19587 V!50201)) (EmptyCell!16013) )
))
(declare-datatypes ((array!84611 0))(
  ( (array!84612 (arr!40808 (Array (_ BitVec 32) ValueCell!16013)) (size!41360 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84611)

(declare-fun e!732902 () Bool)

(declare-fun array_inv!31113 (array!84611) Bool)

(assert (=> start!108670 (and (array_inv!31113 _values!1445) e!732902)))

(declare-fun array_inv!31114 (array!84609) Bool)

(assert (=> start!108670 (array_inv!31114 _keys!1741)))

(assert (=> start!108670 tp!99666))

(declare-fun b!1282676 () Bool)

(declare-fun res!851996 () Bool)

(assert (=> b!1282676 (=> (not res!851996) (not e!732903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282676 (= res!851996 (validKeyInArray!0 (select (arr!40807 _keys!1741) from!2144)))))

(declare-fun b!1282677 () Bool)

(declare-fun res!852002 () Bool)

(assert (=> b!1282677 (=> (not res!852002) (not e!732903))))

(assert (=> b!1282677 (= res!852002 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41359 _keys!1741))))))

(declare-fun b!1282678 () Bool)

(declare-fun res!851999 () Bool)

(assert (=> b!1282678 (=> (not res!851999) (not e!732903))))

(declare-fun minValue!1387 () V!50201)

(declare-fun zeroValue!1387 () V!50201)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21816 0))(
  ( (tuple2!21817 (_1!10919 (_ BitVec 64)) (_2!10919 V!50201)) )
))
(declare-datatypes ((List!29003 0))(
  ( (Nil!29000) (Cons!28999 (h!30208 tuple2!21816) (t!42539 List!29003)) )
))
(declare-datatypes ((ListLongMap!19473 0))(
  ( (ListLongMap!19474 (toList!9752 List!29003)) )
))
(declare-fun contains!7799 (ListLongMap!19473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4726 (array!84609 array!84611 (_ BitVec 32) (_ BitVec 32) V!50201 V!50201 (_ BitVec 32) Int) ListLongMap!19473)

(assert (=> b!1282678 (= res!851999 (contains!7799 (getCurrentListMap!4726 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282679 () Bool)

(declare-fun res!852003 () Bool)

(assert (=> b!1282679 (=> (not res!852003) (not e!732903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84609 (_ BitVec 32)) Bool)

(assert (=> b!1282679 (= res!852003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282680 () Bool)

(declare-fun res!852000 () Bool)

(assert (=> b!1282680 (=> (not res!852000) (not e!732903))))

(declare-datatypes ((List!29004 0))(
  ( (Nil!29001) (Cons!29000 (h!30209 (_ BitVec 64)) (t!42540 List!29004)) )
))
(declare-fun arrayNoDuplicates!0 (array!84609 (_ BitVec 32) List!29004) Bool)

(assert (=> b!1282680 (= res!852000 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29001))))

(declare-fun b!1282681 () Bool)

(declare-fun res!851998 () Bool)

(assert (=> b!1282681 (=> (not res!851998) (not e!732903))))

(assert (=> b!1282681 (= res!851998 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41359 _keys!1741))))))

(declare-fun b!1282682 () Bool)

(declare-fun e!732904 () Bool)

(assert (=> b!1282682 (= e!732904 tp_is_empty!33823)))

(declare-fun mapNonEmpty!52292 () Bool)

(declare-fun mapRes!52292 () Bool)

(declare-fun tp!99665 () Bool)

(declare-fun e!732905 () Bool)

(assert (=> mapNonEmpty!52292 (= mapRes!52292 (and tp!99665 e!732905))))

(declare-fun mapRest!52292 () (Array (_ BitVec 32) ValueCell!16013))

(declare-fun mapValue!52292 () ValueCell!16013)

(declare-fun mapKey!52292 () (_ BitVec 32))

(assert (=> mapNonEmpty!52292 (= (arr!40808 _values!1445) (store mapRest!52292 mapKey!52292 mapValue!52292))))

(declare-fun b!1282683 () Bool)

(assert (=> b!1282683 (= e!732902 (and e!732904 mapRes!52292))))

(declare-fun condMapEmpty!52292 () Bool)

(declare-fun mapDefault!52292 () ValueCell!16013)

(assert (=> b!1282683 (= condMapEmpty!52292 (= (arr!40808 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16013)) mapDefault!52292)))))

(declare-fun b!1282684 () Bool)

(assert (=> b!1282684 (= e!732905 tp_is_empty!33823)))

(declare-fun mapIsEmpty!52292 () Bool)

(assert (=> mapIsEmpty!52292 mapRes!52292))

(declare-fun b!1282685 () Bool)

(declare-fun res!852001 () Bool)

(assert (=> b!1282685 (=> (not res!852001) (not e!732903))))

(assert (=> b!1282685 (= res!852001 (and (= (size!41360 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41359 _keys!1741) (size!41360 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108670 res!851997) b!1282685))

(assert (= (and b!1282685 res!852001) b!1282679))

(assert (= (and b!1282679 res!852003) b!1282680))

(assert (= (and b!1282680 res!852000) b!1282677))

(assert (= (and b!1282677 res!852002) b!1282678))

(assert (= (and b!1282678 res!851999) b!1282681))

(assert (= (and b!1282681 res!851998) b!1282676))

(assert (= (and b!1282676 res!851996) b!1282675))

(assert (= (and b!1282683 condMapEmpty!52292) mapIsEmpty!52292))

(assert (= (and b!1282683 (not condMapEmpty!52292)) mapNonEmpty!52292))

(get-info :version)

(assert (= (and mapNonEmpty!52292 ((_ is ValueCellFull!16013) mapValue!52292)) b!1282684))

(assert (= (and b!1282683 ((_ is ValueCellFull!16013) mapDefault!52292)) b!1282682))

(assert (= start!108670 b!1282683))

(declare-fun m!1176337 () Bool)

(assert (=> start!108670 m!1176337))

(declare-fun m!1176339 () Bool)

(assert (=> start!108670 m!1176339))

(declare-fun m!1176341 () Bool)

(assert (=> start!108670 m!1176341))

(declare-fun m!1176343 () Bool)

(assert (=> b!1282676 m!1176343))

(assert (=> b!1282676 m!1176343))

(declare-fun m!1176345 () Bool)

(assert (=> b!1282676 m!1176345))

(declare-fun m!1176347 () Bool)

(assert (=> b!1282679 m!1176347))

(declare-fun m!1176349 () Bool)

(assert (=> b!1282680 m!1176349))

(declare-fun m!1176351 () Bool)

(assert (=> b!1282678 m!1176351))

(assert (=> b!1282678 m!1176351))

(declare-fun m!1176353 () Bool)

(assert (=> b!1282678 m!1176353))

(declare-fun m!1176355 () Bool)

(assert (=> mapNonEmpty!52292 m!1176355))

(check-sat (not b_next!28183) tp_is_empty!33823 (not b!1282678) b_and!46231 (not b!1282679) (not mapNonEmpty!52292) (not b!1282680) (not start!108670) (not b!1282676))
(check-sat b_and!46231 (not b_next!28183))
