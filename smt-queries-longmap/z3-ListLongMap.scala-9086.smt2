; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109524 () Bool)

(assert start!109524)

(declare-fun b_free!28789 () Bool)

(declare-fun b_next!28789 () Bool)

(assert (=> start!109524 (= b_free!28789 (not b_next!28789))))

(declare-fun tp!101486 () Bool)

(declare-fun b_and!46881 () Bool)

(assert (=> start!109524 (= tp!101486 b_and!46881)))

(declare-fun b!1294709 () Bool)

(declare-fun e!739006 () Bool)

(declare-fun tp_is_empty!34429 () Bool)

(assert (=> b!1294709 (= e!739006 tp_is_empty!34429)))

(declare-fun b!1294710 () Bool)

(declare-fun res!859995 () Bool)

(declare-fun e!739003 () Bool)

(assert (=> b!1294710 (=> (not res!859995) (not e!739003))))

(declare-datatypes ((V!51009 0))(
  ( (V!51010 (val!17289 Int)) )
))
(declare-fun zeroValue!1387 () V!51009)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16316 0))(
  ( (ValueCellFull!16316 (v!19887 V!51009)) (EmptyCell!16316) )
))
(declare-datatypes ((array!85917 0))(
  ( (array!85918 (arr!41455 (Array (_ BitVec 32) ValueCell!16316)) (size!42006 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85917)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85919 0))(
  ( (array!85920 (arr!41456 (Array (_ BitVec 32) (_ BitVec 64))) (size!42007 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85919)

(declare-fun minValue!1387 () V!51009)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22260 0))(
  ( (tuple2!22261 (_1!11141 (_ BitVec 64)) (_2!11141 V!51009)) )
))
(declare-datatypes ((List!29426 0))(
  ( (Nil!29423) (Cons!29422 (h!30640 tuple2!22260) (t!42982 List!29426)) )
))
(declare-datatypes ((ListLongMap!19925 0))(
  ( (ListLongMap!19926 (toList!9978 List!29426)) )
))
(declare-fun contains!8109 (ListLongMap!19925 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5008 (array!85919 array!85917 (_ BitVec 32) (_ BitVec 32) V!51009 V!51009 (_ BitVec 32) Int) ListLongMap!19925)

(assert (=> b!1294710 (= res!859995 (contains!8109 (getCurrentListMap!5008 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294711 () Bool)

(declare-fun res!859991 () Bool)

(assert (=> b!1294711 (=> (not res!859991) (not e!739003))))

(declare-datatypes ((List!29427 0))(
  ( (Nil!29424) (Cons!29423 (h!30641 (_ BitVec 64)) (t!42983 List!29427)) )
))
(declare-fun arrayNoDuplicates!0 (array!85919 (_ BitVec 32) List!29427) Bool)

(assert (=> b!1294711 (= res!859991 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29424))))

(declare-fun b!1294712 () Bool)

(declare-fun res!859993 () Bool)

(assert (=> b!1294712 (=> (not res!859993) (not e!739003))))

(assert (=> b!1294712 (= res!859993 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42007 _keys!1741))))))

(declare-fun b!1294713 () Bool)

(declare-fun res!859997 () Bool)

(assert (=> b!1294713 (=> (not res!859997) (not e!739003))))

(assert (=> b!1294713 (= res!859997 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42007 _keys!1741))))))

(declare-fun mapIsEmpty!53204 () Bool)

(declare-fun mapRes!53204 () Bool)

(assert (=> mapIsEmpty!53204 mapRes!53204))

(declare-fun b!1294714 () Bool)

(declare-fun res!859994 () Bool)

(assert (=> b!1294714 (=> (not res!859994) (not e!739003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85919 (_ BitVec 32)) Bool)

(assert (=> b!1294714 (= res!859994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294716 () Bool)

(declare-fun e!739008 () Bool)

(assert (=> b!1294716 (= e!739003 (not e!739008))))

(declare-fun res!859999 () Bool)

(assert (=> b!1294716 (=> res!859999 e!739008)))

(assert (=> b!1294716 (= res!859999 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1294716 (not (contains!8109 (ListLongMap!19926 Nil!29423) k0!1205))))

(declare-datatypes ((Unit!42793 0))(
  ( (Unit!42794) )
))
(declare-fun lt!580025 () Unit!42793)

(declare-fun emptyContainsNothing!139 ((_ BitVec 64)) Unit!42793)

(assert (=> b!1294716 (= lt!580025 (emptyContainsNothing!139 k0!1205))))

(declare-fun b!1294717 () Bool)

(declare-fun e!739004 () Bool)

(declare-fun e!739005 () Bool)

(assert (=> b!1294717 (= e!739004 (and e!739005 mapRes!53204))))

(declare-fun condMapEmpty!53204 () Bool)

(declare-fun mapDefault!53204 () ValueCell!16316)

(assert (=> b!1294717 (= condMapEmpty!53204 (= (arr!41455 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16316)) mapDefault!53204)))))

(declare-fun b!1294718 () Bool)

(assert (=> b!1294718 (= e!739008 true)))

(declare-fun lt!580026 () ListLongMap!19925)

(declare-fun +!4447 (ListLongMap!19925 tuple2!22260) ListLongMap!19925)

(assert (=> b!1294718 (not (contains!8109 (+!4447 lt!580026 (tuple2!22261 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!580024 () Unit!42793)

(declare-fun addStillNotContains!423 (ListLongMap!19925 (_ BitVec 64) V!51009 (_ BitVec 64)) Unit!42793)

(assert (=> b!1294718 (= lt!580024 (addStillNotContains!423 lt!580026 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6087 (array!85919 array!85917 (_ BitVec 32) (_ BitVec 32) V!51009 V!51009 (_ BitVec 32) Int) ListLongMap!19925)

(assert (=> b!1294718 (= lt!580026 (getCurrentListMapNoExtraKeys!6087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1294719 () Bool)

(declare-fun res!859996 () Bool)

(assert (=> b!1294719 (=> (not res!859996) (not e!739003))))

(assert (=> b!1294719 (= res!859996 (and (= (size!42006 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42007 _keys!1741) (size!42006 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!859998 () Bool)

(assert (=> start!109524 (=> (not res!859998) (not e!739003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109524 (= res!859998 (validMask!0 mask!2175))))

(assert (=> start!109524 e!739003))

(assert (=> start!109524 tp_is_empty!34429))

(assert (=> start!109524 true))

(declare-fun array_inv!31635 (array!85917) Bool)

(assert (=> start!109524 (and (array_inv!31635 _values!1445) e!739004)))

(declare-fun array_inv!31636 (array!85919) Bool)

(assert (=> start!109524 (array_inv!31636 _keys!1741)))

(assert (=> start!109524 tp!101486))

(declare-fun b!1294715 () Bool)

(declare-fun res!859992 () Bool)

(assert (=> b!1294715 (=> (not res!859992) (not e!739003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294715 (= res!859992 (not (validKeyInArray!0 (select (arr!41456 _keys!1741) from!2144))))))

(declare-fun b!1294720 () Bool)

(assert (=> b!1294720 (= e!739005 tp_is_empty!34429)))

(declare-fun mapNonEmpty!53204 () Bool)

(declare-fun tp!101485 () Bool)

(assert (=> mapNonEmpty!53204 (= mapRes!53204 (and tp!101485 e!739006))))

(declare-fun mapKey!53204 () (_ BitVec 32))

(declare-fun mapValue!53204 () ValueCell!16316)

(declare-fun mapRest!53204 () (Array (_ BitVec 32) ValueCell!16316))

(assert (=> mapNonEmpty!53204 (= (arr!41455 _values!1445) (store mapRest!53204 mapKey!53204 mapValue!53204))))

(assert (= (and start!109524 res!859998) b!1294719))

(assert (= (and b!1294719 res!859996) b!1294714))

(assert (= (and b!1294714 res!859994) b!1294711))

(assert (= (and b!1294711 res!859991) b!1294712))

(assert (= (and b!1294712 res!859993) b!1294710))

(assert (= (and b!1294710 res!859995) b!1294713))

(assert (= (and b!1294713 res!859997) b!1294715))

(assert (= (and b!1294715 res!859992) b!1294716))

(assert (= (and b!1294716 (not res!859999)) b!1294718))

(assert (= (and b!1294717 condMapEmpty!53204) mapIsEmpty!53204))

(assert (= (and b!1294717 (not condMapEmpty!53204)) mapNonEmpty!53204))

(get-info :version)

(assert (= (and mapNonEmpty!53204 ((_ is ValueCellFull!16316) mapValue!53204)) b!1294709))

(assert (= (and b!1294717 ((_ is ValueCellFull!16316) mapDefault!53204)) b!1294720))

(assert (= start!109524 b!1294717))

(declare-fun m!1187421 () Bool)

(assert (=> b!1294711 m!1187421))

(declare-fun m!1187423 () Bool)

(assert (=> b!1294714 m!1187423))

(declare-fun m!1187425 () Bool)

(assert (=> b!1294716 m!1187425))

(declare-fun m!1187427 () Bool)

(assert (=> b!1294716 m!1187427))

(declare-fun m!1187429 () Bool)

(assert (=> start!109524 m!1187429))

(declare-fun m!1187431 () Bool)

(assert (=> start!109524 m!1187431))

(declare-fun m!1187433 () Bool)

(assert (=> start!109524 m!1187433))

(declare-fun m!1187435 () Bool)

(assert (=> mapNonEmpty!53204 m!1187435))

(declare-fun m!1187437 () Bool)

(assert (=> b!1294710 m!1187437))

(assert (=> b!1294710 m!1187437))

(declare-fun m!1187439 () Bool)

(assert (=> b!1294710 m!1187439))

(declare-fun m!1187441 () Bool)

(assert (=> b!1294715 m!1187441))

(assert (=> b!1294715 m!1187441))

(declare-fun m!1187443 () Bool)

(assert (=> b!1294715 m!1187443))

(declare-fun m!1187445 () Bool)

(assert (=> b!1294718 m!1187445))

(assert (=> b!1294718 m!1187445))

(declare-fun m!1187447 () Bool)

(assert (=> b!1294718 m!1187447))

(declare-fun m!1187449 () Bool)

(assert (=> b!1294718 m!1187449))

(declare-fun m!1187451 () Bool)

(assert (=> b!1294718 m!1187451))

(check-sat (not mapNonEmpty!53204) (not b_next!28789) (not start!109524) (not b!1294711) b_and!46881 tp_is_empty!34429 (not b!1294710) (not b!1294718) (not b!1294715) (not b!1294716) (not b!1294714))
(check-sat b_and!46881 (not b_next!28789))
