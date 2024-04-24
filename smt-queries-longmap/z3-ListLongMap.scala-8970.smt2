; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108770 () Bool)

(assert start!108770)

(declare-fun b_free!28093 () Bool)

(declare-fun b_next!28093 () Bool)

(assert (=> start!108770 (= b_free!28093 (not b_next!28093))))

(declare-fun tp!99389 () Bool)

(declare-fun b_and!46155 () Bool)

(assert (=> start!108770 (= tp!99389 b_and!46155)))

(declare-fun mapIsEmpty!52151 () Bool)

(declare-fun mapRes!52151 () Bool)

(assert (=> mapIsEmpty!52151 mapRes!52151))

(declare-fun b!1282600 () Bool)

(declare-fun e!732911 () Bool)

(declare-fun tp_is_empty!33733 () Bool)

(assert (=> b!1282600 (= e!732911 tp_is_empty!33733)))

(declare-fun b!1282601 () Bool)

(declare-fun res!851652 () Bool)

(declare-fun e!732909 () Bool)

(assert (=> b!1282601 (=> (not res!851652) (not e!732909))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84569 0))(
  ( (array!84570 (arr!40784 (Array (_ BitVec 32) (_ BitVec 64))) (size!41335 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84569)

(assert (=> b!1282601 (= res!851652 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41335 _keys!1741))))))

(declare-fun b!1282602 () Bool)

(declare-fun res!851658 () Bool)

(assert (=> b!1282602 (=> (not res!851658) (not e!732909))))

(declare-datatypes ((V!50081 0))(
  ( (V!50082 (val!16941 Int)) )
))
(declare-fun minValue!1387 () V!50081)

(declare-fun zeroValue!1387 () V!50081)

(declare-datatypes ((ValueCell!15968 0))(
  ( (ValueCellFull!15968 (v!19536 V!50081)) (EmptyCell!15968) )
))
(declare-datatypes ((array!84571 0))(
  ( (array!84572 (arr!40785 (Array (_ BitVec 32) ValueCell!15968)) (size!41336 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84571)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21708 0))(
  ( (tuple2!21709 (_1!10865 (_ BitVec 64)) (_2!10865 V!50081)) )
))
(declare-datatypes ((List!28923 0))(
  ( (Nil!28920) (Cons!28919 (h!30137 tuple2!21708) (t!42455 List!28923)) )
))
(declare-datatypes ((ListLongMap!19373 0))(
  ( (ListLongMap!19374 (toList!9702 List!28923)) )
))
(declare-fun contains!7831 (ListLongMap!19373 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4771 (array!84569 array!84571 (_ BitVec 32) (_ BitVec 32) V!50081 V!50081 (_ BitVec 32) Int) ListLongMap!19373)

(assert (=> b!1282602 (= res!851658 (contains!7831 (getCurrentListMap!4771 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282603 () Bool)

(declare-fun res!851655 () Bool)

(assert (=> b!1282603 (=> (not res!851655) (not e!732909))))

(assert (=> b!1282603 (= res!851655 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41335 _keys!1741)) (not (= (select (arr!40784 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapNonEmpty!52151 () Bool)

(declare-fun tp!99388 () Bool)

(assert (=> mapNonEmpty!52151 (= mapRes!52151 (and tp!99388 e!732911))))

(declare-fun mapKey!52151 () (_ BitVec 32))

(declare-fun mapRest!52151 () (Array (_ BitVec 32) ValueCell!15968))

(declare-fun mapValue!52151 () ValueCell!15968)

(assert (=> mapNonEmpty!52151 (= (arr!40785 _values!1445) (store mapRest!52151 mapKey!52151 mapValue!52151))))

(declare-fun res!851653 () Bool)

(assert (=> start!108770 (=> (not res!851653) (not e!732909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108770 (= res!851653 (validMask!0 mask!2175))))

(assert (=> start!108770 e!732909))

(assert (=> start!108770 tp_is_empty!33733))

(assert (=> start!108770 true))

(declare-fun e!732910 () Bool)

(declare-fun array_inv!31159 (array!84571) Bool)

(assert (=> start!108770 (and (array_inv!31159 _values!1445) e!732910)))

(declare-fun array_inv!31160 (array!84569) Bool)

(assert (=> start!108770 (array_inv!31160 _keys!1741)))

(assert (=> start!108770 tp!99389))

(declare-fun b!1282604 () Bool)

(declare-fun e!732908 () Bool)

(assert (=> b!1282604 (= e!732908 tp_is_empty!33733)))

(declare-fun b!1282605 () Bool)

(assert (=> b!1282605 (= e!732910 (and e!732908 mapRes!52151))))

(declare-fun condMapEmpty!52151 () Bool)

(declare-fun mapDefault!52151 () ValueCell!15968)

(assert (=> b!1282605 (= condMapEmpty!52151 (= (arr!40785 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15968)) mapDefault!52151)))))

(declare-fun b!1282606 () Bool)

(declare-fun res!851656 () Bool)

(assert (=> b!1282606 (=> (not res!851656) (not e!732909))))

(declare-datatypes ((List!28924 0))(
  ( (Nil!28921) (Cons!28920 (h!30138 (_ BitVec 64)) (t!42456 List!28924)) )
))
(declare-fun arrayNoDuplicates!0 (array!84569 (_ BitVec 32) List!28924) Bool)

(assert (=> b!1282606 (= res!851656 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28921))))

(declare-fun b!1282607 () Bool)

(assert (=> b!1282607 (= e!732909 (not true))))

(assert (=> b!1282607 (contains!7831 (getCurrentListMap!4771 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42394 0))(
  ( (Unit!42395) )
))
(declare-fun lt!576696 () Unit!42394)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!18 (array!84569 array!84571 (_ BitVec 32) (_ BitVec 32) V!50081 V!50081 (_ BitVec 64) (_ BitVec 32) Int) Unit!42394)

(assert (=> b!1282607 (= lt!576696 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!18 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1282608 () Bool)

(declare-fun res!851654 () Bool)

(assert (=> b!1282608 (=> (not res!851654) (not e!732909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84569 (_ BitVec 32)) Bool)

(assert (=> b!1282608 (= res!851654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282609 () Bool)

(declare-fun res!851657 () Bool)

(assert (=> b!1282609 (=> (not res!851657) (not e!732909))))

(assert (=> b!1282609 (= res!851657 (and (= (size!41336 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41335 _keys!1741) (size!41336 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108770 res!851653) b!1282609))

(assert (= (and b!1282609 res!851657) b!1282608))

(assert (= (and b!1282608 res!851654) b!1282606))

(assert (= (and b!1282606 res!851656) b!1282601))

(assert (= (and b!1282601 res!851652) b!1282602))

(assert (= (and b!1282602 res!851658) b!1282603))

(assert (= (and b!1282603 res!851655) b!1282607))

(assert (= (and b!1282605 condMapEmpty!52151) mapIsEmpty!52151))

(assert (= (and b!1282605 (not condMapEmpty!52151)) mapNonEmpty!52151))

(get-info :version)

(assert (= (and mapNonEmpty!52151 ((_ is ValueCellFull!15968) mapValue!52151)) b!1282600))

(assert (= (and b!1282605 ((_ is ValueCellFull!15968) mapDefault!52151)) b!1282604))

(assert (= start!108770 b!1282605))

(declare-fun m!1177353 () Bool)

(assert (=> start!108770 m!1177353))

(declare-fun m!1177355 () Bool)

(assert (=> start!108770 m!1177355))

(declare-fun m!1177357 () Bool)

(assert (=> start!108770 m!1177357))

(declare-fun m!1177359 () Bool)

(assert (=> b!1282607 m!1177359))

(assert (=> b!1282607 m!1177359))

(declare-fun m!1177361 () Bool)

(assert (=> b!1282607 m!1177361))

(declare-fun m!1177363 () Bool)

(assert (=> b!1282607 m!1177363))

(declare-fun m!1177365 () Bool)

(assert (=> mapNonEmpty!52151 m!1177365))

(declare-fun m!1177367 () Bool)

(assert (=> b!1282602 m!1177367))

(assert (=> b!1282602 m!1177367))

(declare-fun m!1177369 () Bool)

(assert (=> b!1282602 m!1177369))

(declare-fun m!1177371 () Bool)

(assert (=> b!1282606 m!1177371))

(declare-fun m!1177373 () Bool)

(assert (=> b!1282608 m!1177373))

(declare-fun m!1177375 () Bool)

(assert (=> b!1282603 m!1177375))

(check-sat (not mapNonEmpty!52151) tp_is_empty!33733 (not b!1282606) (not b_next!28093) (not b!1282607) (not start!108770) b_and!46155 (not b!1282602) (not b!1282608))
(check-sat b_and!46155 (not b_next!28093))
