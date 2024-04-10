; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108500 () Bool)

(assert start!108500)

(declare-fun b_free!28047 () Bool)

(declare-fun b_next!28047 () Bool)

(assert (=> start!108500 (= b_free!28047 (not b_next!28047))))

(declare-fun tp!99250 () Bool)

(declare-fun b_and!46107 () Bool)

(assert (=> start!108500 (= tp!99250 b_and!46107)))

(declare-fun res!850649 () Bool)

(declare-fun e!731716 () Bool)

(assert (=> start!108500 (=> (not res!850649) (not e!731716))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108500 (= res!850649 (validMask!0 mask!2175))))

(assert (=> start!108500 e!731716))

(declare-fun tp_is_empty!33687 () Bool)

(assert (=> start!108500 tp_is_empty!33687))

(assert (=> start!108500 true))

(declare-datatypes ((V!50019 0))(
  ( (V!50020 (val!16918 Int)) )
))
(declare-datatypes ((ValueCell!15945 0))(
  ( (ValueCellFull!15945 (v!19518 V!50019)) (EmptyCell!15945) )
))
(declare-datatypes ((array!84450 0))(
  ( (array!84451 (arr!40729 (Array (_ BitVec 32) ValueCell!15945)) (size!41279 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84450)

(declare-fun e!731717 () Bool)

(declare-fun array_inv!30909 (array!84450) Bool)

(assert (=> start!108500 (and (array_inv!30909 _values!1445) e!731717)))

(declare-datatypes ((array!84452 0))(
  ( (array!84453 (arr!40730 (Array (_ BitVec 32) (_ BitVec 64))) (size!41280 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84452)

(declare-fun array_inv!30910 (array!84452) Bool)

(assert (=> start!108500 (array_inv!30910 _keys!1741)))

(assert (=> start!108500 tp!99250))

(declare-fun b!1280605 () Bool)

(declare-fun res!850650 () Bool)

(assert (=> b!1280605 (=> (not res!850650) (not e!731716))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280605 (= res!850650 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41280 _keys!1741))))))

(declare-fun mapIsEmpty!52082 () Bool)

(declare-fun mapRes!52082 () Bool)

(assert (=> mapIsEmpty!52082 mapRes!52082))

(declare-fun b!1280606 () Bool)

(declare-fun res!850655 () Bool)

(assert (=> b!1280606 (=> (not res!850655) (not e!731716))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1280606 (= res!850655 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41280 _keys!1741)) (not (= (select (arr!40730 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapNonEmpty!52082 () Bool)

(declare-fun tp!99251 () Bool)

(declare-fun e!731719 () Bool)

(assert (=> mapNonEmpty!52082 (= mapRes!52082 (and tp!99251 e!731719))))

(declare-fun mapValue!52082 () ValueCell!15945)

(declare-fun mapRest!52082 () (Array (_ BitVec 32) ValueCell!15945))

(declare-fun mapKey!52082 () (_ BitVec 32))

(assert (=> mapNonEmpty!52082 (= (arr!40729 _values!1445) (store mapRest!52082 mapKey!52082 mapValue!52082))))

(declare-fun b!1280607 () Bool)

(declare-fun res!850651 () Bool)

(assert (=> b!1280607 (=> (not res!850651) (not e!731716))))

(declare-fun minValue!1387 () V!50019)

(declare-fun zeroValue!1387 () V!50019)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21654 0))(
  ( (tuple2!21655 (_1!10838 (_ BitVec 64)) (_2!10838 V!50019)) )
))
(declare-datatypes ((List!28851 0))(
  ( (Nil!28848) (Cons!28847 (h!30056 tuple2!21654) (t!42391 List!28851)) )
))
(declare-datatypes ((ListLongMap!19311 0))(
  ( (ListLongMap!19312 (toList!9671 List!28851)) )
))
(declare-fun contains!7786 (ListLongMap!19311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4755 (array!84452 array!84450 (_ BitVec 32) (_ BitVec 32) V!50019 V!50019 (_ BitVec 32) Int) ListLongMap!19311)

(assert (=> b!1280607 (= res!850651 (contains!7786 (getCurrentListMap!4755 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280608 () Bool)

(declare-fun res!850654 () Bool)

(assert (=> b!1280608 (=> (not res!850654) (not e!731716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84452 (_ BitVec 32)) Bool)

(assert (=> b!1280608 (= res!850654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280609 () Bool)

(declare-fun e!731718 () Bool)

(assert (=> b!1280609 (= e!731718 tp_is_empty!33687)))

(declare-fun b!1280610 () Bool)

(declare-fun res!850653 () Bool)

(assert (=> b!1280610 (=> (not res!850653) (not e!731716))))

(assert (=> b!1280610 (= res!850653 (and (= (size!41279 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41280 _keys!1741) (size!41279 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280611 () Bool)

(declare-fun res!850652 () Bool)

(assert (=> b!1280611 (=> (not res!850652) (not e!731716))))

(declare-datatypes ((List!28852 0))(
  ( (Nil!28849) (Cons!28848 (h!30057 (_ BitVec 64)) (t!42392 List!28852)) )
))
(declare-fun arrayNoDuplicates!0 (array!84452 (_ BitVec 32) List!28852) Bool)

(assert (=> b!1280611 (= res!850652 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28849))))

(declare-fun b!1280612 () Bool)

(assert (=> b!1280612 (= e!731719 tp_is_empty!33687)))

(declare-fun b!1280613 () Bool)

(assert (=> b!1280613 (= e!731716 (not true))))

(assert (=> b!1280613 (contains!7786 (getCurrentListMap!4755 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42399 0))(
  ( (Unit!42400) )
))
(declare-fun lt!576143 () Unit!42399)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!4 (array!84452 array!84450 (_ BitVec 32) (_ BitVec 32) V!50019 V!50019 (_ BitVec 64) (_ BitVec 32) Int) Unit!42399)

(assert (=> b!1280613 (= lt!576143 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!4 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280614 () Bool)

(assert (=> b!1280614 (= e!731717 (and e!731718 mapRes!52082))))

(declare-fun condMapEmpty!52082 () Bool)

(declare-fun mapDefault!52082 () ValueCell!15945)

(assert (=> b!1280614 (= condMapEmpty!52082 (= (arr!40729 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15945)) mapDefault!52082)))))

(assert (= (and start!108500 res!850649) b!1280610))

(assert (= (and b!1280610 res!850653) b!1280608))

(assert (= (and b!1280608 res!850654) b!1280611))

(assert (= (and b!1280611 res!850652) b!1280605))

(assert (= (and b!1280605 res!850650) b!1280607))

(assert (= (and b!1280607 res!850651) b!1280606))

(assert (= (and b!1280606 res!850655) b!1280613))

(assert (= (and b!1280614 condMapEmpty!52082) mapIsEmpty!52082))

(assert (= (and b!1280614 (not condMapEmpty!52082)) mapNonEmpty!52082))

(get-info :version)

(assert (= (and mapNonEmpty!52082 ((_ is ValueCellFull!15945) mapValue!52082)) b!1280612))

(assert (= (and b!1280614 ((_ is ValueCellFull!15945) mapDefault!52082)) b!1280609))

(assert (= start!108500 b!1280614))

(declare-fun m!1175189 () Bool)

(assert (=> b!1280611 m!1175189))

(declare-fun m!1175191 () Bool)

(assert (=> b!1280613 m!1175191))

(assert (=> b!1280613 m!1175191))

(declare-fun m!1175193 () Bool)

(assert (=> b!1280613 m!1175193))

(declare-fun m!1175195 () Bool)

(assert (=> b!1280613 m!1175195))

(declare-fun m!1175197 () Bool)

(assert (=> mapNonEmpty!52082 m!1175197))

(declare-fun m!1175199 () Bool)

(assert (=> b!1280607 m!1175199))

(assert (=> b!1280607 m!1175199))

(declare-fun m!1175201 () Bool)

(assert (=> b!1280607 m!1175201))

(declare-fun m!1175203 () Bool)

(assert (=> b!1280608 m!1175203))

(declare-fun m!1175205 () Bool)

(assert (=> b!1280606 m!1175205))

(declare-fun m!1175207 () Bool)

(assert (=> start!108500 m!1175207))

(declare-fun m!1175209 () Bool)

(assert (=> start!108500 m!1175209))

(declare-fun m!1175211 () Bool)

(assert (=> start!108500 m!1175211))

(check-sat (not b!1280613) b_and!46107 (not b!1280607) (not start!108500) (not b_next!28047) (not b!1280608) tp_is_empty!33687 (not mapNonEmpty!52082) (not b!1280611))
(check-sat b_and!46107 (not b_next!28047))
