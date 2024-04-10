; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108828 () Bool)

(assert start!108828)

(declare-fun b_free!28341 () Bool)

(declare-fun b_next!28341 () Bool)

(assert (=> start!108828 (= b_free!28341 (not b_next!28341))))

(declare-fun tp!100138 () Bool)

(declare-fun b_and!46407 () Bool)

(assert (=> start!108828 (= tp!100138 b_and!46407)))

(declare-fun b!1285223 () Bool)

(declare-fun res!853797 () Bool)

(declare-fun e!734118 () Bool)

(assert (=> b!1285223 (=> (not res!853797) (not e!734118))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85020 0))(
  ( (array!85021 (arr!41012 (Array (_ BitVec 32) (_ BitVec 64))) (size!41562 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85020)

(assert (=> b!1285223 (= res!853797 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41562 _keys!1741))))))

(declare-fun b!1285224 () Bool)

(declare-fun res!853799 () Bool)

(assert (=> b!1285224 (=> (not res!853799) (not e!734118))))

(declare-datatypes ((List!29064 0))(
  ( (Nil!29061) (Cons!29060 (h!30269 (_ BitVec 64)) (t!42608 List!29064)) )
))
(declare-fun arrayNoDuplicates!0 (array!85020 (_ BitVec 32) List!29064) Bool)

(assert (=> b!1285224 (= res!853799 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29061))))

(declare-fun b!1285225 () Bool)

(declare-fun res!853798 () Bool)

(assert (=> b!1285225 (=> (not res!853798) (not e!734118))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50411 0))(
  ( (V!50412 (val!17065 Int)) )
))
(declare-datatypes ((ValueCell!16092 0))(
  ( (ValueCellFull!16092 (v!19667 V!50411)) (EmptyCell!16092) )
))
(declare-datatypes ((array!85022 0))(
  ( (array!85023 (arr!41013 (Array (_ BitVec 32) ValueCell!16092)) (size!41563 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85022)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285225 (= res!853798 (and (= (size!41563 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41562 _keys!1741) (size!41563 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!853800 () Bool)

(assert (=> start!108828 (=> (not res!853800) (not e!734118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108828 (= res!853800 (validMask!0 mask!2175))))

(assert (=> start!108828 e!734118))

(declare-fun tp_is_empty!33981 () Bool)

(assert (=> start!108828 tp_is_empty!33981))

(assert (=> start!108828 true))

(declare-fun e!734116 () Bool)

(declare-fun array_inv!31107 (array!85022) Bool)

(assert (=> start!108828 (and (array_inv!31107 _values!1445) e!734116)))

(declare-fun array_inv!31108 (array!85020) Bool)

(assert (=> start!108828 (array_inv!31108 _keys!1741)))

(assert (=> start!108828 tp!100138))

(declare-fun b!1285226 () Bool)

(declare-fun res!853796 () Bool)

(assert (=> b!1285226 (=> (not res!853796) (not e!734118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85020 (_ BitVec 32)) Bool)

(assert (=> b!1285226 (= res!853796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285227 () Bool)

(assert (=> b!1285227 (= e!734118 false)))

(declare-fun minValue!1387 () V!50411)

(declare-fun zeroValue!1387 () V!50411)

(declare-fun lt!576889 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21872 0))(
  ( (tuple2!21873 (_1!10947 (_ BitVec 64)) (_2!10947 V!50411)) )
))
(declare-datatypes ((List!29065 0))(
  ( (Nil!29062) (Cons!29061 (h!30270 tuple2!21872) (t!42609 List!29065)) )
))
(declare-datatypes ((ListLongMap!19529 0))(
  ( (ListLongMap!19530 (toList!9780 List!29065)) )
))
(declare-fun contains!7897 (ListLongMap!19529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4858 (array!85020 array!85022 (_ BitVec 32) (_ BitVec 32) V!50411 V!50411 (_ BitVec 32) Int) ListLongMap!19529)

(assert (=> b!1285227 (= lt!576889 (contains!7897 (getCurrentListMap!4858 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285228 () Bool)

(declare-fun e!734119 () Bool)

(declare-fun mapRes!52529 () Bool)

(assert (=> b!1285228 (= e!734116 (and e!734119 mapRes!52529))))

(declare-fun condMapEmpty!52529 () Bool)

(declare-fun mapDefault!52529 () ValueCell!16092)

(assert (=> b!1285228 (= condMapEmpty!52529 (= (arr!41013 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16092)) mapDefault!52529)))))

(declare-fun mapNonEmpty!52529 () Bool)

(declare-fun tp!100139 () Bool)

(declare-fun e!734117 () Bool)

(assert (=> mapNonEmpty!52529 (= mapRes!52529 (and tp!100139 e!734117))))

(declare-fun mapKey!52529 () (_ BitVec 32))

(declare-fun mapValue!52529 () ValueCell!16092)

(declare-fun mapRest!52529 () (Array (_ BitVec 32) ValueCell!16092))

(assert (=> mapNonEmpty!52529 (= (arr!41013 _values!1445) (store mapRest!52529 mapKey!52529 mapValue!52529))))

(declare-fun b!1285229 () Bool)

(assert (=> b!1285229 (= e!734119 tp_is_empty!33981)))

(declare-fun mapIsEmpty!52529 () Bool)

(assert (=> mapIsEmpty!52529 mapRes!52529))

(declare-fun b!1285230 () Bool)

(assert (=> b!1285230 (= e!734117 tp_is_empty!33981)))

(assert (= (and start!108828 res!853800) b!1285225))

(assert (= (and b!1285225 res!853798) b!1285226))

(assert (= (and b!1285226 res!853796) b!1285224))

(assert (= (and b!1285224 res!853799) b!1285223))

(assert (= (and b!1285223 res!853797) b!1285227))

(assert (= (and b!1285228 condMapEmpty!52529) mapIsEmpty!52529))

(assert (= (and b!1285228 (not condMapEmpty!52529)) mapNonEmpty!52529))

(get-info :version)

(assert (= (and mapNonEmpty!52529 ((_ is ValueCellFull!16092) mapValue!52529)) b!1285230))

(assert (= (and b!1285228 ((_ is ValueCellFull!16092) mapDefault!52529)) b!1285229))

(assert (= start!108828 b!1285228))

(declare-fun m!1178653 () Bool)

(assert (=> b!1285226 m!1178653))

(declare-fun m!1178655 () Bool)

(assert (=> b!1285227 m!1178655))

(assert (=> b!1285227 m!1178655))

(declare-fun m!1178657 () Bool)

(assert (=> b!1285227 m!1178657))

(declare-fun m!1178659 () Bool)

(assert (=> mapNonEmpty!52529 m!1178659))

(declare-fun m!1178661 () Bool)

(assert (=> start!108828 m!1178661))

(declare-fun m!1178663 () Bool)

(assert (=> start!108828 m!1178663))

(declare-fun m!1178665 () Bool)

(assert (=> start!108828 m!1178665))

(declare-fun m!1178667 () Bool)

(assert (=> b!1285224 m!1178667))

(check-sat (not b!1285226) tp_is_empty!33981 b_and!46407 (not b!1285224) (not b!1285227) (not mapNonEmpty!52529) (not b_next!28341) (not start!108828))
(check-sat b_and!46407 (not b_next!28341))
