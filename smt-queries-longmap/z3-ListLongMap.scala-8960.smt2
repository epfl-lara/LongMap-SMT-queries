; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108486 () Bool)

(assert start!108486)

(declare-fun b_free!28033 () Bool)

(declare-fun b_next!28033 () Bool)

(assert (=> start!108486 (= b_free!28033 (not b_next!28033))))

(declare-fun tp!99209 () Bool)

(declare-fun b_and!46075 () Bool)

(assert (=> start!108486 (= tp!99209 b_and!46075)))

(declare-fun b!1280345 () Bool)

(declare-fun e!731584 () Bool)

(assert (=> b!1280345 (= e!731584 false)))

(declare-datatypes ((V!50001 0))(
  ( (V!50002 (val!16911 Int)) )
))
(declare-fun minValue!1387 () V!50001)

(declare-fun zeroValue!1387 () V!50001)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575944 () Bool)

(declare-datatypes ((ValueCell!15938 0))(
  ( (ValueCellFull!15938 (v!19510 V!50001)) (EmptyCell!15938) )
))
(declare-datatypes ((array!84317 0))(
  ( (array!84318 (arr!40663 (Array (_ BitVec 32) ValueCell!15938)) (size!41215 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84317)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!84319 0))(
  ( (array!84320 (arr!40664 (Array (_ BitVec 32) (_ BitVec 64))) (size!41216 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84319)

(declare-datatypes ((tuple2!21714 0))(
  ( (tuple2!21715 (_1!10868 (_ BitVec 64)) (_2!10868 V!50001)) )
))
(declare-datatypes ((List!28907 0))(
  ( (Nil!28904) (Cons!28903 (h!30112 tuple2!21714) (t!42439 List!28907)) )
))
(declare-datatypes ((ListLongMap!19371 0))(
  ( (ListLongMap!19372 (toList!9701 List!28907)) )
))
(declare-fun contains!7746 (ListLongMap!19371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4675 (array!84319 array!84317 (_ BitVec 32) (_ BitVec 32) V!50001 V!50001 (_ BitVec 32) Int) ListLongMap!19371)

(assert (=> b!1280345 (= lt!575944 (contains!7746 (getCurrentListMap!4675 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280346 () Bool)

(declare-fun e!731585 () Bool)

(declare-fun tp_is_empty!33673 () Bool)

(assert (=> b!1280346 (= e!731585 tp_is_empty!33673)))

(declare-fun b!1280348 () Bool)

(declare-fun res!850490 () Bool)

(assert (=> b!1280348 (=> (not res!850490) (not e!731584))))

(assert (=> b!1280348 (= res!850490 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41216 _keys!1741))))))

(declare-fun b!1280349 () Bool)

(declare-fun e!731582 () Bool)

(assert (=> b!1280349 (= e!731582 tp_is_empty!33673)))

(declare-fun b!1280350 () Bool)

(declare-fun res!850491 () Bool)

(assert (=> b!1280350 (=> (not res!850491) (not e!731584))))

(declare-datatypes ((List!28908 0))(
  ( (Nil!28905) (Cons!28904 (h!30113 (_ BitVec 64)) (t!42440 List!28908)) )
))
(declare-fun arrayNoDuplicates!0 (array!84319 (_ BitVec 32) List!28908) Bool)

(assert (=> b!1280350 (= res!850491 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28905))))

(declare-fun b!1280351 () Bool)

(declare-fun res!850493 () Bool)

(assert (=> b!1280351 (=> (not res!850493) (not e!731584))))

(assert (=> b!1280351 (= res!850493 (and (= (size!41215 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41216 _keys!1741) (size!41215 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52061 () Bool)

(declare-fun mapRes!52061 () Bool)

(assert (=> mapIsEmpty!52061 mapRes!52061))

(declare-fun b!1280352 () Bool)

(declare-fun res!850489 () Bool)

(assert (=> b!1280352 (=> (not res!850489) (not e!731584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84319 (_ BitVec 32)) Bool)

(assert (=> b!1280352 (= res!850489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52061 () Bool)

(declare-fun tp!99210 () Bool)

(assert (=> mapNonEmpty!52061 (= mapRes!52061 (and tp!99210 e!731582))))

(declare-fun mapRest!52061 () (Array (_ BitVec 32) ValueCell!15938))

(declare-fun mapKey!52061 () (_ BitVec 32))

(declare-fun mapValue!52061 () ValueCell!15938)

(assert (=> mapNonEmpty!52061 (= (arr!40663 _values!1445) (store mapRest!52061 mapKey!52061 mapValue!52061))))

(declare-fun res!850492 () Bool)

(assert (=> start!108486 (=> (not res!850492) (not e!731584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108486 (= res!850492 (validMask!0 mask!2175))))

(assert (=> start!108486 e!731584))

(assert (=> start!108486 tp_is_empty!33673))

(assert (=> start!108486 true))

(declare-fun e!731586 () Bool)

(declare-fun array_inv!31029 (array!84317) Bool)

(assert (=> start!108486 (and (array_inv!31029 _values!1445) e!731586)))

(declare-fun array_inv!31030 (array!84319) Bool)

(assert (=> start!108486 (array_inv!31030 _keys!1741)))

(assert (=> start!108486 tp!99209))

(declare-fun b!1280347 () Bool)

(assert (=> b!1280347 (= e!731586 (and e!731585 mapRes!52061))))

(declare-fun condMapEmpty!52061 () Bool)

(declare-fun mapDefault!52061 () ValueCell!15938)

(assert (=> b!1280347 (= condMapEmpty!52061 (= (arr!40663 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15938)) mapDefault!52061)))))

(assert (= (and start!108486 res!850492) b!1280351))

(assert (= (and b!1280351 res!850493) b!1280352))

(assert (= (and b!1280352 res!850489) b!1280350))

(assert (= (and b!1280350 res!850491) b!1280348))

(assert (= (and b!1280348 res!850490) b!1280345))

(assert (= (and b!1280347 condMapEmpty!52061) mapIsEmpty!52061))

(assert (= (and b!1280347 (not condMapEmpty!52061)) mapNonEmpty!52061))

(get-info :version)

(assert (= (and mapNonEmpty!52061 ((_ is ValueCellFull!15938) mapValue!52061)) b!1280349))

(assert (= (and b!1280347 ((_ is ValueCellFull!15938) mapDefault!52061)) b!1280346))

(assert (= start!108486 b!1280347))

(declare-fun m!1174545 () Bool)

(assert (=> start!108486 m!1174545))

(declare-fun m!1174547 () Bool)

(assert (=> start!108486 m!1174547))

(declare-fun m!1174549 () Bool)

(assert (=> start!108486 m!1174549))

(declare-fun m!1174551 () Bool)

(assert (=> b!1280350 m!1174551))

(declare-fun m!1174553 () Bool)

(assert (=> b!1280352 m!1174553))

(declare-fun m!1174555 () Bool)

(assert (=> b!1280345 m!1174555))

(assert (=> b!1280345 m!1174555))

(declare-fun m!1174557 () Bool)

(assert (=> b!1280345 m!1174557))

(declare-fun m!1174559 () Bool)

(assert (=> mapNonEmpty!52061 m!1174559))

(check-sat (not b!1280352) (not b!1280345) tp_is_empty!33673 (not b_next!28033) (not b!1280350) (not start!108486) (not mapNonEmpty!52061) b_and!46075)
(check-sat b_and!46075 (not b_next!28033))
