; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108710 () Bool)

(assert start!108710)

(declare-fun b_free!28033 () Bool)

(declare-fun b_next!28033 () Bool)

(assert (=> start!108710 (= b_free!28033 (not b_next!28033))))

(declare-fun tp!99208 () Bool)

(declare-fun b_and!46095 () Bool)

(assert (=> start!108710 (= tp!99208 b_and!46095)))

(declare-fun b!1281714 () Bool)

(declare-fun e!732458 () Bool)

(declare-fun tp_is_empty!33673 () Bool)

(assert (=> b!1281714 (= e!732458 tp_is_empty!33673)))

(declare-fun b!1281715 () Bool)

(declare-fun e!732461 () Bool)

(declare-fun mapRes!52061 () Bool)

(assert (=> b!1281715 (= e!732461 (and e!732458 mapRes!52061))))

(declare-fun condMapEmpty!52061 () Bool)

(declare-datatypes ((V!50001 0))(
  ( (V!50002 (val!16911 Int)) )
))
(declare-datatypes ((ValueCell!15938 0))(
  ( (ValueCellFull!15938 (v!19506 V!50001)) (EmptyCell!15938) )
))
(declare-datatypes ((array!84451 0))(
  ( (array!84452 (arr!40725 (Array (_ BitVec 32) ValueCell!15938)) (size!41276 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84451)

(declare-fun mapDefault!52061 () ValueCell!15938)

(assert (=> b!1281715 (= condMapEmpty!52061 (= (arr!40725 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15938)) mapDefault!52061)))))

(declare-fun b!1281716 () Bool)

(declare-fun res!851038 () Bool)

(declare-fun e!732462 () Bool)

(assert (=> b!1281716 (=> (not res!851038) (not e!732462))))

(declare-datatypes ((array!84453 0))(
  ( (array!84454 (arr!40726 (Array (_ BitVec 32) (_ BitVec 64))) (size!41277 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84453)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84453 (_ BitVec 32)) Bool)

(assert (=> b!1281716 (= res!851038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52061 () Bool)

(assert (=> mapIsEmpty!52061 mapRes!52061))

(declare-fun b!1281717 () Bool)

(declare-fun res!851036 () Bool)

(assert (=> b!1281717 (=> (not res!851036) (not e!732462))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281717 (= res!851036 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41277 _keys!1741))))))

(declare-fun b!1281718 () Bool)

(declare-fun e!732459 () Bool)

(assert (=> b!1281718 (= e!732459 tp_is_empty!33673)))

(declare-fun mapNonEmpty!52061 () Bool)

(declare-fun tp!99209 () Bool)

(assert (=> mapNonEmpty!52061 (= mapRes!52061 (and tp!99209 e!732459))))

(declare-fun mapKey!52061 () (_ BitVec 32))

(declare-fun mapValue!52061 () ValueCell!15938)

(declare-fun mapRest!52061 () (Array (_ BitVec 32) ValueCell!15938))

(assert (=> mapNonEmpty!52061 (= (arr!40725 _values!1445) (store mapRest!52061 mapKey!52061 mapValue!52061))))

(declare-fun b!1281719 () Bool)

(declare-fun res!851039 () Bool)

(assert (=> b!1281719 (=> (not res!851039) (not e!732462))))

(declare-datatypes ((List!28878 0))(
  ( (Nil!28875) (Cons!28874 (h!30092 (_ BitVec 64)) (t!42410 List!28878)) )
))
(declare-fun arrayNoDuplicates!0 (array!84453 (_ BitVec 32) List!28878) Bool)

(assert (=> b!1281719 (= res!851039 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28875))))

(declare-fun res!851037 () Bool)

(assert (=> start!108710 (=> (not res!851037) (not e!732462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108710 (= res!851037 (validMask!0 mask!2175))))

(assert (=> start!108710 e!732462))

(assert (=> start!108710 tp_is_empty!33673))

(assert (=> start!108710 true))

(declare-fun array_inv!31111 (array!84451) Bool)

(assert (=> start!108710 (and (array_inv!31111 _values!1445) e!732461)))

(declare-fun array_inv!31112 (array!84453) Bool)

(assert (=> start!108710 (array_inv!31112 _keys!1741)))

(assert (=> start!108710 tp!99208))

(declare-fun b!1281720 () Bool)

(declare-fun res!851040 () Bool)

(assert (=> b!1281720 (=> (not res!851040) (not e!732462))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281720 (= res!851040 (and (= (size!41276 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41277 _keys!1741) (size!41276 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281721 () Bool)

(assert (=> b!1281721 (= e!732462 false)))

(declare-fun minValue!1387 () V!50001)

(declare-fun zeroValue!1387 () V!50001)

(declare-fun lt!576606 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21664 0))(
  ( (tuple2!21665 (_1!10843 (_ BitVec 64)) (_2!10843 V!50001)) )
))
(declare-datatypes ((List!28879 0))(
  ( (Nil!28876) (Cons!28875 (h!30093 tuple2!21664) (t!42411 List!28879)) )
))
(declare-datatypes ((ListLongMap!19329 0))(
  ( (ListLongMap!19330 (toList!9680 List!28879)) )
))
(declare-fun contains!7809 (ListLongMap!19329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4749 (array!84453 array!84451 (_ BitVec 32) (_ BitVec 32) V!50001 V!50001 (_ BitVec 32) Int) ListLongMap!19329)

(assert (=> b!1281721 (= lt!576606 (contains!7809 (getCurrentListMap!4749 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108710 res!851037) b!1281720))

(assert (= (and b!1281720 res!851040) b!1281716))

(assert (= (and b!1281716 res!851038) b!1281719))

(assert (= (and b!1281719 res!851039) b!1281717))

(assert (= (and b!1281717 res!851036) b!1281721))

(assert (= (and b!1281715 condMapEmpty!52061) mapIsEmpty!52061))

(assert (= (and b!1281715 (not condMapEmpty!52061)) mapNonEmpty!52061))

(get-info :version)

(assert (= (and mapNonEmpty!52061 ((_ is ValueCellFull!15938) mapValue!52061)) b!1281718))

(assert (= (and b!1281715 ((_ is ValueCellFull!15938) mapDefault!52061)) b!1281714))

(assert (= start!108710 b!1281715))

(declare-fun m!1176657 () Bool)

(assert (=> start!108710 m!1176657))

(declare-fun m!1176659 () Bool)

(assert (=> start!108710 m!1176659))

(declare-fun m!1176661 () Bool)

(assert (=> start!108710 m!1176661))

(declare-fun m!1176663 () Bool)

(assert (=> b!1281721 m!1176663))

(assert (=> b!1281721 m!1176663))

(declare-fun m!1176665 () Bool)

(assert (=> b!1281721 m!1176665))

(declare-fun m!1176667 () Bool)

(assert (=> b!1281719 m!1176667))

(declare-fun m!1176669 () Bool)

(assert (=> mapNonEmpty!52061 m!1176669))

(declare-fun m!1176671 () Bool)

(assert (=> b!1281716 m!1176671))

(check-sat (not b!1281719) (not b!1281721) (not start!108710) (not b!1281716) b_and!46095 tp_is_empty!33673 (not mapNonEmpty!52061) (not b_next!28033))
(check-sat b_and!46095 (not b_next!28033))
