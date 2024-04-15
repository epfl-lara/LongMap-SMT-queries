; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108634 () Bool)

(assert start!108634)

(declare-fun b_free!28147 () Bool)

(declare-fun b_next!28147 () Bool)

(assert (=> start!108634 (= b_free!28147 (not b_next!28147))))

(declare-fun tp!99558 () Bool)

(declare-fun b_and!46195 () Bool)

(assert (=> start!108634 (= tp!99558 b_and!46195)))

(declare-fun b!1282237 () Bool)

(declare-fun e!732634 () Bool)

(declare-fun e!732633 () Bool)

(declare-fun mapRes!52238 () Bool)

(assert (=> b!1282237 (= e!732634 (and e!732633 mapRes!52238))))

(declare-fun condMapEmpty!52238 () Bool)

(declare-datatypes ((V!50153 0))(
  ( (V!50154 (val!16968 Int)) )
))
(declare-datatypes ((ValueCell!15995 0))(
  ( (ValueCellFull!15995 (v!19569 V!50153)) (EmptyCell!15995) )
))
(declare-datatypes ((array!84539 0))(
  ( (array!84540 (arr!40772 (Array (_ BitVec 32) ValueCell!15995)) (size!41324 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84539)

(declare-fun mapDefault!52238 () ValueCell!15995)

(assert (=> b!1282237 (= condMapEmpty!52238 (= (arr!40772 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15995)) mapDefault!52238)))))

(declare-fun res!851722 () Bool)

(declare-fun e!732636 () Bool)

(assert (=> start!108634 (=> (not res!851722) (not e!732636))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108634 (= res!851722 (validMask!0 mask!2175))))

(assert (=> start!108634 e!732636))

(declare-fun tp_is_empty!33787 () Bool)

(assert (=> start!108634 tp_is_empty!33787))

(assert (=> start!108634 true))

(declare-fun array_inv!31093 (array!84539) Bool)

(assert (=> start!108634 (and (array_inv!31093 _values!1445) e!732634)))

(declare-datatypes ((array!84541 0))(
  ( (array!84542 (arr!40773 (Array (_ BitVec 32) (_ BitVec 64))) (size!41325 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84541)

(declare-fun array_inv!31094 (array!84541) Bool)

(assert (=> start!108634 (array_inv!31094 _keys!1741)))

(assert (=> start!108634 tp!99558))

(declare-fun b!1282238 () Bool)

(declare-fun res!851723 () Bool)

(assert (=> b!1282238 (=> (not res!851723) (not e!732636))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282238 (= res!851723 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41325 _keys!1741))))))

(declare-fun b!1282239 () Bool)

(assert (=> b!1282239 (= e!732633 tp_is_empty!33787)))

(declare-fun b!1282240 () Bool)

(declare-fun e!732635 () Bool)

(assert (=> b!1282240 (= e!732635 tp_is_empty!33787)))

(declare-fun b!1282241 () Bool)

(declare-fun res!851720 () Bool)

(assert (=> b!1282241 (=> (not res!851720) (not e!732636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84541 (_ BitVec 32)) Bool)

(assert (=> b!1282241 (= res!851720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282242 () Bool)

(declare-fun res!851721 () Bool)

(assert (=> b!1282242 (=> (not res!851721) (not e!732636))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282242 (= res!851721 (and (= (size!41324 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41325 _keys!1741) (size!41324 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52238 () Bool)

(assert (=> mapIsEmpty!52238 mapRes!52238))

(declare-fun b!1282243 () Bool)

(declare-fun res!851724 () Bool)

(assert (=> b!1282243 (=> (not res!851724) (not e!732636))))

(declare-datatypes ((List!28984 0))(
  ( (Nil!28981) (Cons!28980 (h!30189 (_ BitVec 64)) (t!42520 List!28984)) )
))
(declare-fun arrayNoDuplicates!0 (array!84541 (_ BitVec 32) List!28984) Bool)

(assert (=> b!1282243 (= res!851724 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28981))))

(declare-fun mapNonEmpty!52238 () Bool)

(declare-fun tp!99557 () Bool)

(assert (=> mapNonEmpty!52238 (= mapRes!52238 (and tp!99557 e!732635))))

(declare-fun mapKey!52238 () (_ BitVec 32))

(declare-fun mapValue!52238 () ValueCell!15995)

(declare-fun mapRest!52238 () (Array (_ BitVec 32) ValueCell!15995))

(assert (=> mapNonEmpty!52238 (= (arr!40772 _values!1445) (store mapRest!52238 mapKey!52238 mapValue!52238))))

(declare-fun b!1282244 () Bool)

(assert (=> b!1282244 (= e!732636 false)))

(declare-fun minValue!1387 () V!50153)

(declare-fun zeroValue!1387 () V!50153)

(declare-fun lt!576339 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21796 0))(
  ( (tuple2!21797 (_1!10909 (_ BitVec 64)) (_2!10909 V!50153)) )
))
(declare-datatypes ((List!28985 0))(
  ( (Nil!28982) (Cons!28981 (h!30190 tuple2!21796) (t!42521 List!28985)) )
))
(declare-datatypes ((ListLongMap!19453 0))(
  ( (ListLongMap!19454 (toList!9742 List!28985)) )
))
(declare-fun contains!7789 (ListLongMap!19453 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4716 (array!84541 array!84539 (_ BitVec 32) (_ BitVec 32) V!50153 V!50153 (_ BitVec 32) Int) ListLongMap!19453)

(assert (=> b!1282244 (= lt!576339 (contains!7789 (getCurrentListMap!4716 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108634 res!851722) b!1282242))

(assert (= (and b!1282242 res!851721) b!1282241))

(assert (= (and b!1282241 res!851720) b!1282243))

(assert (= (and b!1282243 res!851724) b!1282238))

(assert (= (and b!1282238 res!851723) b!1282244))

(assert (= (and b!1282237 condMapEmpty!52238) mapIsEmpty!52238))

(assert (= (and b!1282237 (not condMapEmpty!52238)) mapNonEmpty!52238))

(get-info :version)

(assert (= (and mapNonEmpty!52238 ((_ is ValueCellFull!15995) mapValue!52238)) b!1282240))

(assert (= (and b!1282237 ((_ is ValueCellFull!15995) mapDefault!52238)) b!1282239))

(assert (= start!108634 b!1282237))

(declare-fun m!1176049 () Bool)

(assert (=> start!108634 m!1176049))

(declare-fun m!1176051 () Bool)

(assert (=> start!108634 m!1176051))

(declare-fun m!1176053 () Bool)

(assert (=> start!108634 m!1176053))

(declare-fun m!1176055 () Bool)

(assert (=> mapNonEmpty!52238 m!1176055))

(declare-fun m!1176057 () Bool)

(assert (=> b!1282244 m!1176057))

(assert (=> b!1282244 m!1176057))

(declare-fun m!1176059 () Bool)

(assert (=> b!1282244 m!1176059))

(declare-fun m!1176061 () Bool)

(assert (=> b!1282243 m!1176061))

(declare-fun m!1176063 () Bool)

(assert (=> b!1282241 m!1176063))

(check-sat (not b!1282243) tp_is_empty!33787 (not mapNonEmpty!52238) (not start!108634) (not b_next!28147) (not b!1282244) (not b!1282241) b_and!46195)
(check-sat b_and!46195 (not b_next!28147))
