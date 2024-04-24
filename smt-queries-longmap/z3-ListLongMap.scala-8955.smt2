; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108680 () Bool)

(assert start!108680)

(declare-fun b_free!28003 () Bool)

(declare-fun b_next!28003 () Bool)

(assert (=> start!108680 (= b_free!28003 (not b_next!28003))))

(declare-fun tp!99118 () Bool)

(declare-fun b_and!46065 () Bool)

(assert (=> start!108680 (= tp!99118 b_and!46065)))

(declare-fun b!1281354 () Bool)

(declare-fun res!850815 () Bool)

(declare-fun e!732235 () Bool)

(assert (=> b!1281354 (=> (not res!850815) (not e!732235))))

(declare-datatypes ((array!84395 0))(
  ( (array!84396 (arr!40697 (Array (_ BitVec 32) (_ BitVec 64))) (size!41248 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84395)

(declare-datatypes ((List!28856 0))(
  ( (Nil!28853) (Cons!28852 (h!30070 (_ BitVec 64)) (t!42388 List!28856)) )
))
(declare-fun arrayNoDuplicates!0 (array!84395 (_ BitVec 32) List!28856) Bool)

(assert (=> b!1281354 (= res!850815 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28853))))

(declare-fun b!1281355 () Bool)

(declare-fun res!850812 () Bool)

(assert (=> b!1281355 (=> (not res!850812) (not e!732235))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281355 (= res!850812 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41248 _keys!1741))))))

(declare-fun mapIsEmpty!52016 () Bool)

(declare-fun mapRes!52016 () Bool)

(assert (=> mapIsEmpty!52016 mapRes!52016))

(declare-fun res!850811 () Bool)

(assert (=> start!108680 (=> (not res!850811) (not e!732235))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108680 (= res!850811 (validMask!0 mask!2175))))

(assert (=> start!108680 e!732235))

(declare-fun tp_is_empty!33643 () Bool)

(assert (=> start!108680 tp_is_empty!33643))

(assert (=> start!108680 true))

(declare-datatypes ((V!49961 0))(
  ( (V!49962 (val!16896 Int)) )
))
(declare-datatypes ((ValueCell!15923 0))(
  ( (ValueCellFull!15923 (v!19491 V!49961)) (EmptyCell!15923) )
))
(declare-datatypes ((array!84397 0))(
  ( (array!84398 (arr!40698 (Array (_ BitVec 32) ValueCell!15923)) (size!41249 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84397)

(declare-fun e!732234 () Bool)

(declare-fun array_inv!31091 (array!84397) Bool)

(assert (=> start!108680 (and (array_inv!31091 _values!1445) e!732234)))

(declare-fun array_inv!31092 (array!84395) Bool)

(assert (=> start!108680 (array_inv!31092 _keys!1741)))

(assert (=> start!108680 tp!99118))

(declare-fun b!1281356 () Bool)

(declare-fun e!732236 () Bool)

(assert (=> b!1281356 (= e!732236 tp_is_empty!33643)))

(declare-fun b!1281357 () Bool)

(assert (=> b!1281357 (= e!732234 (and e!732236 mapRes!52016))))

(declare-fun condMapEmpty!52016 () Bool)

(declare-fun mapDefault!52016 () ValueCell!15923)

(assert (=> b!1281357 (= condMapEmpty!52016 (= (arr!40698 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15923)) mapDefault!52016)))))

(declare-fun b!1281358 () Bool)

(declare-fun res!850813 () Bool)

(assert (=> b!1281358 (=> (not res!850813) (not e!732235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84395 (_ BitVec 32)) Bool)

(assert (=> b!1281358 (= res!850813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281359 () Bool)

(assert (=> b!1281359 (= e!732235 false)))

(declare-fun minValue!1387 () V!49961)

(declare-fun zeroValue!1387 () V!49961)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576561 () Bool)

(declare-datatypes ((tuple2!21644 0))(
  ( (tuple2!21645 (_1!10833 (_ BitVec 64)) (_2!10833 V!49961)) )
))
(declare-datatypes ((List!28857 0))(
  ( (Nil!28854) (Cons!28853 (h!30071 tuple2!21644) (t!42389 List!28857)) )
))
(declare-datatypes ((ListLongMap!19309 0))(
  ( (ListLongMap!19310 (toList!9670 List!28857)) )
))
(declare-fun contains!7799 (ListLongMap!19309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4739 (array!84395 array!84397 (_ BitVec 32) (_ BitVec 32) V!49961 V!49961 (_ BitVec 32) Int) ListLongMap!19309)

(assert (=> b!1281359 (= lt!576561 (contains!7799 (getCurrentListMap!4739 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281360 () Bool)

(declare-fun e!732233 () Bool)

(assert (=> b!1281360 (= e!732233 tp_is_empty!33643)))

(declare-fun mapNonEmpty!52016 () Bool)

(declare-fun tp!99119 () Bool)

(assert (=> mapNonEmpty!52016 (= mapRes!52016 (and tp!99119 e!732233))))

(declare-fun mapRest!52016 () (Array (_ BitVec 32) ValueCell!15923))

(declare-fun mapKey!52016 () (_ BitVec 32))

(declare-fun mapValue!52016 () ValueCell!15923)

(assert (=> mapNonEmpty!52016 (= (arr!40698 _values!1445) (store mapRest!52016 mapKey!52016 mapValue!52016))))

(declare-fun b!1281361 () Bool)

(declare-fun res!850814 () Bool)

(assert (=> b!1281361 (=> (not res!850814) (not e!732235))))

(assert (=> b!1281361 (= res!850814 (and (= (size!41249 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41248 _keys!1741) (size!41249 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108680 res!850811) b!1281361))

(assert (= (and b!1281361 res!850814) b!1281358))

(assert (= (and b!1281358 res!850813) b!1281354))

(assert (= (and b!1281354 res!850815) b!1281355))

(assert (= (and b!1281355 res!850812) b!1281359))

(assert (= (and b!1281357 condMapEmpty!52016) mapIsEmpty!52016))

(assert (= (and b!1281357 (not condMapEmpty!52016)) mapNonEmpty!52016))

(get-info :version)

(assert (= (and mapNonEmpty!52016 ((_ is ValueCellFull!15923) mapValue!52016)) b!1281360))

(assert (= (and b!1281357 ((_ is ValueCellFull!15923) mapDefault!52016)) b!1281356))

(assert (= start!108680 b!1281357))

(declare-fun m!1176417 () Bool)

(assert (=> mapNonEmpty!52016 m!1176417))

(declare-fun m!1176419 () Bool)

(assert (=> b!1281359 m!1176419))

(assert (=> b!1281359 m!1176419))

(declare-fun m!1176421 () Bool)

(assert (=> b!1281359 m!1176421))

(declare-fun m!1176423 () Bool)

(assert (=> b!1281354 m!1176423))

(declare-fun m!1176425 () Bool)

(assert (=> b!1281358 m!1176425))

(declare-fun m!1176427 () Bool)

(assert (=> start!108680 m!1176427))

(declare-fun m!1176429 () Bool)

(assert (=> start!108680 m!1176429))

(declare-fun m!1176431 () Bool)

(assert (=> start!108680 m!1176431))

(check-sat (not b!1281358) tp_is_empty!33643 (not b!1281354) (not b_next!28003) (not mapNonEmpty!52016) b_and!46065 (not start!108680) (not b!1281359))
(check-sat b_and!46065 (not b_next!28003))
