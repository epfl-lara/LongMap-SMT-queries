; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108462 () Bool)

(assert start!108462)

(declare-fun b_free!28009 () Bool)

(declare-fun b_next!28009 () Bool)

(assert (=> start!108462 (= b_free!28009 (not b_next!28009))))

(declare-fun tp!99138 () Bool)

(declare-fun b_and!46051 () Bool)

(assert (=> start!108462 (= tp!99138 b_and!46051)))

(declare-fun b!1280057 () Bool)

(declare-fun e!731402 () Bool)

(assert (=> b!1280057 (= e!731402 false)))

(declare-datatypes ((V!49969 0))(
  ( (V!49970 (val!16899 Int)) )
))
(declare-fun zeroValue!1387 () V!49969)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15926 0))(
  ( (ValueCellFull!15926 (v!19498 V!49969)) (EmptyCell!15926) )
))
(declare-datatypes ((array!84269 0))(
  ( (array!84270 (arr!40639 (Array (_ BitVec 32) ValueCell!15926)) (size!41191 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84269)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84271 0))(
  ( (array!84272 (arr!40640 (Array (_ BitVec 32) (_ BitVec 64))) (size!41192 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84271)

(declare-fun minValue!1387 () V!49969)

(declare-fun lt!575908 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21698 0))(
  ( (tuple2!21699 (_1!10860 (_ BitVec 64)) (_2!10860 V!49969)) )
))
(declare-datatypes ((List!28890 0))(
  ( (Nil!28887) (Cons!28886 (h!30095 tuple2!21698) (t!42422 List!28890)) )
))
(declare-datatypes ((ListLongMap!19355 0))(
  ( (ListLongMap!19356 (toList!9693 List!28890)) )
))
(declare-fun contains!7738 (ListLongMap!19355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4667 (array!84271 array!84269 (_ BitVec 32) (_ BitVec 32) V!49969 V!49969 (_ BitVec 32) Int) ListLongMap!19355)

(assert (=> b!1280057 (= lt!575908 (contains!7738 (getCurrentListMap!4667 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280058 () Bool)

(declare-fun res!850313 () Bool)

(assert (=> b!1280058 (=> (not res!850313) (not e!731402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84271 (_ BitVec 32)) Bool)

(assert (=> b!1280058 (= res!850313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280059 () Bool)

(declare-fun e!731404 () Bool)

(declare-fun e!731403 () Bool)

(declare-fun mapRes!52025 () Bool)

(assert (=> b!1280059 (= e!731404 (and e!731403 mapRes!52025))))

(declare-fun condMapEmpty!52025 () Bool)

(declare-fun mapDefault!52025 () ValueCell!15926)

(assert (=> b!1280059 (= condMapEmpty!52025 (= (arr!40639 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15926)) mapDefault!52025)))))

(declare-fun b!1280060 () Bool)

(declare-fun e!731406 () Bool)

(declare-fun tp_is_empty!33649 () Bool)

(assert (=> b!1280060 (= e!731406 tp_is_empty!33649)))

(declare-fun b!1280061 () Bool)

(declare-fun res!850309 () Bool)

(assert (=> b!1280061 (=> (not res!850309) (not e!731402))))

(declare-datatypes ((List!28891 0))(
  ( (Nil!28888) (Cons!28887 (h!30096 (_ BitVec 64)) (t!42423 List!28891)) )
))
(declare-fun arrayNoDuplicates!0 (array!84271 (_ BitVec 32) List!28891) Bool)

(assert (=> b!1280061 (= res!850309 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28888))))

(declare-fun b!1280062 () Bool)

(declare-fun res!850310 () Bool)

(assert (=> b!1280062 (=> (not res!850310) (not e!731402))))

(assert (=> b!1280062 (= res!850310 (and (= (size!41191 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41192 _keys!1741) (size!41191 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52025 () Bool)

(assert (=> mapIsEmpty!52025 mapRes!52025))

(declare-fun mapNonEmpty!52025 () Bool)

(declare-fun tp!99137 () Bool)

(assert (=> mapNonEmpty!52025 (= mapRes!52025 (and tp!99137 e!731406))))

(declare-fun mapValue!52025 () ValueCell!15926)

(declare-fun mapKey!52025 () (_ BitVec 32))

(declare-fun mapRest!52025 () (Array (_ BitVec 32) ValueCell!15926))

(assert (=> mapNonEmpty!52025 (= (arr!40639 _values!1445) (store mapRest!52025 mapKey!52025 mapValue!52025))))

(declare-fun res!850312 () Bool)

(assert (=> start!108462 (=> (not res!850312) (not e!731402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108462 (= res!850312 (validMask!0 mask!2175))))

(assert (=> start!108462 e!731402))

(assert (=> start!108462 tp_is_empty!33649))

(assert (=> start!108462 true))

(declare-fun array_inv!31015 (array!84269) Bool)

(assert (=> start!108462 (and (array_inv!31015 _values!1445) e!731404)))

(declare-fun array_inv!31016 (array!84271) Bool)

(assert (=> start!108462 (array_inv!31016 _keys!1741)))

(assert (=> start!108462 tp!99138))

(declare-fun b!1280063 () Bool)

(declare-fun res!850311 () Bool)

(assert (=> b!1280063 (=> (not res!850311) (not e!731402))))

(assert (=> b!1280063 (= res!850311 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41192 _keys!1741))))))

(declare-fun b!1280064 () Bool)

(assert (=> b!1280064 (= e!731403 tp_is_empty!33649)))

(assert (= (and start!108462 res!850312) b!1280062))

(assert (= (and b!1280062 res!850310) b!1280058))

(assert (= (and b!1280058 res!850313) b!1280061))

(assert (= (and b!1280061 res!850309) b!1280063))

(assert (= (and b!1280063 res!850311) b!1280057))

(assert (= (and b!1280059 condMapEmpty!52025) mapIsEmpty!52025))

(assert (= (and b!1280059 (not condMapEmpty!52025)) mapNonEmpty!52025))

(get-info :version)

(assert (= (and mapNonEmpty!52025 ((_ is ValueCellFull!15926) mapValue!52025)) b!1280060))

(assert (= (and b!1280059 ((_ is ValueCellFull!15926) mapDefault!52025)) b!1280064))

(assert (= start!108462 b!1280059))

(declare-fun m!1174353 () Bool)

(assert (=> start!108462 m!1174353))

(declare-fun m!1174355 () Bool)

(assert (=> start!108462 m!1174355))

(declare-fun m!1174357 () Bool)

(assert (=> start!108462 m!1174357))

(declare-fun m!1174359 () Bool)

(assert (=> b!1280058 m!1174359))

(declare-fun m!1174361 () Bool)

(assert (=> b!1280061 m!1174361))

(declare-fun m!1174363 () Bool)

(assert (=> mapNonEmpty!52025 m!1174363))

(declare-fun m!1174365 () Bool)

(assert (=> b!1280057 m!1174365))

(assert (=> b!1280057 m!1174365))

(declare-fun m!1174367 () Bool)

(assert (=> b!1280057 m!1174367))

(check-sat (not b_next!28009) (not b!1280061) tp_is_empty!33649 (not start!108462) b_and!46051 (not mapNonEmpty!52025) (not b!1280057) (not b!1280058))
(check-sat b_and!46051 (not b_next!28009))
