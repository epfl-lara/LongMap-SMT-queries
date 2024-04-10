; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108822 () Bool)

(assert start!108822)

(declare-fun b_free!28335 () Bool)

(declare-fun b_next!28335 () Bool)

(assert (=> start!108822 (= b_free!28335 (not b_next!28335))))

(declare-fun tp!100120 () Bool)

(declare-fun b_and!46401 () Bool)

(assert (=> start!108822 (= tp!100120 b_and!46401)))

(declare-fun b!1285151 () Bool)

(declare-fun res!853751 () Bool)

(declare-fun e!734073 () Bool)

(assert (=> b!1285151 (=> (not res!853751) (not e!734073))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85008 0))(
  ( (array!85009 (arr!41006 (Array (_ BitVec 32) (_ BitVec 64))) (size!41556 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85008)

(assert (=> b!1285151 (= res!853751 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41556 _keys!1741))))))

(declare-fun b!1285152 () Bool)

(declare-fun res!853752 () Bool)

(assert (=> b!1285152 (=> (not res!853752) (not e!734073))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85008 (_ BitVec 32)) Bool)

(assert (=> b!1285152 (= res!853752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285154 () Bool)

(assert (=> b!1285154 (= e!734073 false)))

(declare-datatypes ((V!50403 0))(
  ( (V!50404 (val!17062 Int)) )
))
(declare-fun minValue!1387 () V!50403)

(declare-fun zeroValue!1387 () V!50403)

(declare-fun lt!576880 () Bool)

(declare-datatypes ((ValueCell!16089 0))(
  ( (ValueCellFull!16089 (v!19664 V!50403)) (EmptyCell!16089) )
))
(declare-datatypes ((array!85010 0))(
  ( (array!85011 (arr!41007 (Array (_ BitVec 32) ValueCell!16089)) (size!41557 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85010)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21866 0))(
  ( (tuple2!21867 (_1!10944 (_ BitVec 64)) (_2!10944 V!50403)) )
))
(declare-datatypes ((List!29059 0))(
  ( (Nil!29056) (Cons!29055 (h!30264 tuple2!21866) (t!42603 List!29059)) )
))
(declare-datatypes ((ListLongMap!19523 0))(
  ( (ListLongMap!19524 (toList!9777 List!29059)) )
))
(declare-fun contains!7894 (ListLongMap!19523 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4855 (array!85008 array!85010 (_ BitVec 32) (_ BitVec 32) V!50403 V!50403 (_ BitVec 32) Int) ListLongMap!19523)

(assert (=> b!1285154 (= lt!576880 (contains!7894 (getCurrentListMap!4855 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285155 () Bool)

(declare-fun e!734071 () Bool)

(declare-fun e!734074 () Bool)

(declare-fun mapRes!52520 () Bool)

(assert (=> b!1285155 (= e!734071 (and e!734074 mapRes!52520))))

(declare-fun condMapEmpty!52520 () Bool)

(declare-fun mapDefault!52520 () ValueCell!16089)

(assert (=> b!1285155 (= condMapEmpty!52520 (= (arr!41007 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16089)) mapDefault!52520)))))

(declare-fun b!1285156 () Bool)

(declare-fun res!853754 () Bool)

(assert (=> b!1285156 (=> (not res!853754) (not e!734073))))

(assert (=> b!1285156 (= res!853754 (and (= (size!41557 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41556 _keys!1741) (size!41557 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52520 () Bool)

(assert (=> mapIsEmpty!52520 mapRes!52520))

(declare-fun b!1285157 () Bool)

(declare-fun res!853753 () Bool)

(assert (=> b!1285157 (=> (not res!853753) (not e!734073))))

(declare-datatypes ((List!29060 0))(
  ( (Nil!29057) (Cons!29056 (h!30265 (_ BitVec 64)) (t!42604 List!29060)) )
))
(declare-fun arrayNoDuplicates!0 (array!85008 (_ BitVec 32) List!29060) Bool)

(assert (=> b!1285157 (= res!853753 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29057))))

(declare-fun mapNonEmpty!52520 () Bool)

(declare-fun tp!100121 () Bool)

(declare-fun e!734075 () Bool)

(assert (=> mapNonEmpty!52520 (= mapRes!52520 (and tp!100121 e!734075))))

(declare-fun mapRest!52520 () (Array (_ BitVec 32) ValueCell!16089))

(declare-fun mapKey!52520 () (_ BitVec 32))

(declare-fun mapValue!52520 () ValueCell!16089)

(assert (=> mapNonEmpty!52520 (= (arr!41007 _values!1445) (store mapRest!52520 mapKey!52520 mapValue!52520))))

(declare-fun b!1285158 () Bool)

(declare-fun tp_is_empty!33975 () Bool)

(assert (=> b!1285158 (= e!734075 tp_is_empty!33975)))

(declare-fun res!853755 () Bool)

(assert (=> start!108822 (=> (not res!853755) (not e!734073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108822 (= res!853755 (validMask!0 mask!2175))))

(assert (=> start!108822 e!734073))

(assert (=> start!108822 tp_is_empty!33975))

(assert (=> start!108822 true))

(declare-fun array_inv!31101 (array!85010) Bool)

(assert (=> start!108822 (and (array_inv!31101 _values!1445) e!734071)))

(declare-fun array_inv!31102 (array!85008) Bool)

(assert (=> start!108822 (array_inv!31102 _keys!1741)))

(assert (=> start!108822 tp!100120))

(declare-fun b!1285153 () Bool)

(assert (=> b!1285153 (= e!734074 tp_is_empty!33975)))

(assert (= (and start!108822 res!853755) b!1285156))

(assert (= (and b!1285156 res!853754) b!1285152))

(assert (= (and b!1285152 res!853752) b!1285157))

(assert (= (and b!1285157 res!853753) b!1285151))

(assert (= (and b!1285151 res!853751) b!1285154))

(assert (= (and b!1285155 condMapEmpty!52520) mapIsEmpty!52520))

(assert (= (and b!1285155 (not condMapEmpty!52520)) mapNonEmpty!52520))

(get-info :version)

(assert (= (and mapNonEmpty!52520 ((_ is ValueCellFull!16089) mapValue!52520)) b!1285158))

(assert (= (and b!1285155 ((_ is ValueCellFull!16089) mapDefault!52520)) b!1285153))

(assert (= start!108822 b!1285155))

(declare-fun m!1178605 () Bool)

(assert (=> mapNonEmpty!52520 m!1178605))

(declare-fun m!1178607 () Bool)

(assert (=> b!1285154 m!1178607))

(assert (=> b!1285154 m!1178607))

(declare-fun m!1178609 () Bool)

(assert (=> b!1285154 m!1178609))

(declare-fun m!1178611 () Bool)

(assert (=> b!1285152 m!1178611))

(declare-fun m!1178613 () Bool)

(assert (=> start!108822 m!1178613))

(declare-fun m!1178615 () Bool)

(assert (=> start!108822 m!1178615))

(declare-fun m!1178617 () Bool)

(assert (=> start!108822 m!1178617))

(declare-fun m!1178619 () Bool)

(assert (=> b!1285157 m!1178619))

(check-sat (not mapNonEmpty!52520) (not b_next!28335) b_and!46401 tp_is_empty!33975 (not b!1285157) (not b!1285152) (not start!108822) (not b!1285154))
(check-sat b_and!46401 (not b_next!28335))
