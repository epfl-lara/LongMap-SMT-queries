; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108596 () Bool)

(assert start!108596)

(declare-fun b_free!27919 () Bool)

(declare-fun b_next!27919 () Bool)

(assert (=> start!108596 (= b_free!27919 (not b_next!27919))))

(declare-fun tp!98866 () Bool)

(declare-fun b_and!45981 () Bool)

(assert (=> start!108596 (= tp!98866 b_and!45981)))

(declare-fun b!1280337 () Bool)

(declare-fun res!850176 () Bool)

(declare-fun e!731605 () Bool)

(assert (=> b!1280337 (=> (not res!850176) (not e!731605))))

(declare-datatypes ((array!84235 0))(
  ( (array!84236 (arr!40617 (Array (_ BitVec 32) (_ BitVec 64))) (size!41168 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84235)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84235 (_ BitVec 32)) Bool)

(assert (=> b!1280337 (= res!850176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280338 () Bool)

(declare-fun res!850175 () Bool)

(assert (=> b!1280338 (=> (not res!850175) (not e!731605))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280338 (= res!850175 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41168 _keys!1741))))))

(declare-fun b!1280339 () Bool)

(declare-fun e!731603 () Bool)

(declare-fun tp_is_empty!33559 () Bool)

(assert (=> b!1280339 (= e!731603 tp_is_empty!33559)))

(declare-fun mapIsEmpty!51890 () Bool)

(declare-fun mapRes!51890 () Bool)

(assert (=> mapIsEmpty!51890 mapRes!51890))

(declare-fun res!850173 () Bool)

(assert (=> start!108596 (=> (not res!850173) (not e!731605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108596 (= res!850173 (validMask!0 mask!2175))))

(assert (=> start!108596 e!731605))

(assert (=> start!108596 tp_is_empty!33559))

(assert (=> start!108596 true))

(declare-datatypes ((V!49849 0))(
  ( (V!49850 (val!16854 Int)) )
))
(declare-datatypes ((ValueCell!15881 0))(
  ( (ValueCellFull!15881 (v!19449 V!49849)) (EmptyCell!15881) )
))
(declare-datatypes ((array!84237 0))(
  ( (array!84238 (arr!40618 (Array (_ BitVec 32) ValueCell!15881)) (size!41169 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84237)

(declare-fun e!731604 () Bool)

(declare-fun array_inv!31033 (array!84237) Bool)

(assert (=> start!108596 (and (array_inv!31033 _values!1445) e!731604)))

(declare-fun array_inv!31034 (array!84235) Bool)

(assert (=> start!108596 (array_inv!31034 _keys!1741)))

(assert (=> start!108596 tp!98866))

(declare-fun b!1280340 () Bool)

(assert (=> b!1280340 (= e!731605 false)))

(declare-fun minValue!1387 () V!49849)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!576444 () Bool)

(declare-fun zeroValue!1387 () V!49849)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21584 0))(
  ( (tuple2!21585 (_1!10803 (_ BitVec 64)) (_2!10803 V!49849)) )
))
(declare-datatypes ((List!28797 0))(
  ( (Nil!28794) (Cons!28793 (h!30011 tuple2!21584) (t!42329 List!28797)) )
))
(declare-datatypes ((ListLongMap!19249 0))(
  ( (ListLongMap!19250 (toList!9640 List!28797)) )
))
(declare-fun contains!7769 (ListLongMap!19249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4709 (array!84235 array!84237 (_ BitVec 32) (_ BitVec 32) V!49849 V!49849 (_ BitVec 32) Int) ListLongMap!19249)

(assert (=> b!1280340 (= lt!576444 (contains!7769 (getCurrentListMap!4709 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!51890 () Bool)

(declare-fun tp!98867 () Bool)

(assert (=> mapNonEmpty!51890 (= mapRes!51890 (and tp!98867 e!731603))))

(declare-fun mapRest!51890 () (Array (_ BitVec 32) ValueCell!15881))

(declare-fun mapKey!51890 () (_ BitVec 32))

(declare-fun mapValue!51890 () ValueCell!15881)

(assert (=> mapNonEmpty!51890 (= (arr!40618 _values!1445) (store mapRest!51890 mapKey!51890 mapValue!51890))))

(declare-fun b!1280341 () Bool)

(declare-fun e!731606 () Bool)

(assert (=> b!1280341 (= e!731606 tp_is_empty!33559)))

(declare-fun b!1280342 () Bool)

(declare-fun res!850172 () Bool)

(assert (=> b!1280342 (=> (not res!850172) (not e!731605))))

(assert (=> b!1280342 (= res!850172 (and (= (size!41169 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41168 _keys!1741) (size!41169 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280343 () Bool)

(assert (=> b!1280343 (= e!731604 (and e!731606 mapRes!51890))))

(declare-fun condMapEmpty!51890 () Bool)

(declare-fun mapDefault!51890 () ValueCell!15881)

(assert (=> b!1280343 (= condMapEmpty!51890 (= (arr!40618 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15881)) mapDefault!51890)))))

(declare-fun b!1280344 () Bool)

(declare-fun res!850174 () Bool)

(assert (=> b!1280344 (=> (not res!850174) (not e!731605))))

(declare-datatypes ((List!28798 0))(
  ( (Nil!28795) (Cons!28794 (h!30012 (_ BitVec 64)) (t!42330 List!28798)) )
))
(declare-fun arrayNoDuplicates!0 (array!84235 (_ BitVec 32) List!28798) Bool)

(assert (=> b!1280344 (= res!850174 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28795))))

(assert (= (and start!108596 res!850173) b!1280342))

(assert (= (and b!1280342 res!850172) b!1280337))

(assert (= (and b!1280337 res!850176) b!1280344))

(assert (= (and b!1280344 res!850174) b!1280338))

(assert (= (and b!1280338 res!850175) b!1280340))

(assert (= (and b!1280343 condMapEmpty!51890) mapIsEmpty!51890))

(assert (= (and b!1280343 (not condMapEmpty!51890)) mapNonEmpty!51890))

(get-info :version)

(assert (= (and mapNonEmpty!51890 ((_ is ValueCellFull!15881) mapValue!51890)) b!1280339))

(assert (= (and b!1280343 ((_ is ValueCellFull!15881) mapDefault!51890)) b!1280341))

(assert (= start!108596 b!1280343))

(declare-fun m!1175745 () Bool)

(assert (=> start!108596 m!1175745))

(declare-fun m!1175747 () Bool)

(assert (=> start!108596 m!1175747))

(declare-fun m!1175749 () Bool)

(assert (=> start!108596 m!1175749))

(declare-fun m!1175751 () Bool)

(assert (=> b!1280340 m!1175751))

(assert (=> b!1280340 m!1175751))

(declare-fun m!1175753 () Bool)

(assert (=> b!1280340 m!1175753))

(declare-fun m!1175755 () Bool)

(assert (=> b!1280337 m!1175755))

(declare-fun m!1175757 () Bool)

(assert (=> b!1280344 m!1175757))

(declare-fun m!1175759 () Bool)

(assert (=> mapNonEmpty!51890 m!1175759))

(check-sat (not b!1280337) tp_is_empty!33559 (not b!1280340) b_and!45981 (not b!1280344) (not b_next!27919) (not start!108596) (not mapNonEmpty!51890))
(check-sat b_and!45981 (not b_next!27919))
