; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108850 () Bool)

(assert start!108850)

(declare-fun b_free!28363 () Bool)

(declare-fun b_next!28363 () Bool)

(assert (=> start!108850 (= b_free!28363 (not b_next!28363))))

(declare-fun tp!100206 () Bool)

(declare-fun b_and!46411 () Bool)

(assert (=> start!108850 (= tp!100206 b_and!46411)))

(declare-fun b!1285423 () Bool)

(declare-fun e!734253 () Bool)

(assert (=> b!1285423 (= e!734253 false)))

(declare-datatypes ((V!50441 0))(
  ( (V!50442 (val!17076 Int)) )
))
(declare-fun minValue!1387 () V!50441)

(declare-fun zeroValue!1387 () V!50441)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16103 0))(
  ( (ValueCellFull!16103 (v!19677 V!50441)) (EmptyCell!16103) )
))
(declare-datatypes ((array!84951 0))(
  ( (array!84952 (arr!40978 (Array (_ BitVec 32) ValueCell!16103)) (size!41530 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84951)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576744 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84953 0))(
  ( (array!84954 (arr!40979 (Array (_ BitVec 32) (_ BitVec 64))) (size!41531 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84953)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21952 0))(
  ( (tuple2!21953 (_1!10987 (_ BitVec 64)) (_2!10987 V!50441)) )
))
(declare-datatypes ((List!29131 0))(
  ( (Nil!29128) (Cons!29127 (h!30336 tuple2!21952) (t!42667 List!29131)) )
))
(declare-datatypes ((ListLongMap!19609 0))(
  ( (ListLongMap!19610 (toList!9820 List!29131)) )
))
(declare-fun contains!7867 (ListLongMap!19609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4790 (array!84953 array!84951 (_ BitVec 32) (_ BitVec 32) V!50441 V!50441 (_ BitVec 32) Int) ListLongMap!19609)

(assert (=> b!1285423 (= lt!576744 (contains!7867 (getCurrentListMap!4790 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285424 () Bool)

(declare-fun res!853935 () Bool)

(assert (=> b!1285424 (=> (not res!853935) (not e!734253))))

(declare-datatypes ((List!29132 0))(
  ( (Nil!29129) (Cons!29128 (h!30337 (_ BitVec 64)) (t!42668 List!29132)) )
))
(declare-fun arrayNoDuplicates!0 (array!84953 (_ BitVec 32) List!29132) Bool)

(assert (=> b!1285424 (= res!853935 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29129))))

(declare-fun b!1285425 () Bool)

(declare-fun e!734255 () Bool)

(declare-fun e!734254 () Bool)

(declare-fun mapRes!52562 () Bool)

(assert (=> b!1285425 (= e!734255 (and e!734254 mapRes!52562))))

(declare-fun condMapEmpty!52562 () Bool)

(declare-fun mapDefault!52562 () ValueCell!16103)

(assert (=> b!1285425 (= condMapEmpty!52562 (= (arr!40978 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16103)) mapDefault!52562)))))

(declare-fun b!1285426 () Bool)

(declare-fun res!853937 () Bool)

(assert (=> b!1285426 (=> (not res!853937) (not e!734253))))

(assert (=> b!1285426 (= res!853937 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41531 _keys!1741))))))

(declare-fun mapIsEmpty!52562 () Bool)

(assert (=> mapIsEmpty!52562 mapRes!52562))

(declare-fun mapNonEmpty!52562 () Bool)

(declare-fun tp!100205 () Bool)

(declare-fun e!734256 () Bool)

(assert (=> mapNonEmpty!52562 (= mapRes!52562 (and tp!100205 e!734256))))

(declare-fun mapValue!52562 () ValueCell!16103)

(declare-fun mapRest!52562 () (Array (_ BitVec 32) ValueCell!16103))

(declare-fun mapKey!52562 () (_ BitVec 32))

(assert (=> mapNonEmpty!52562 (= (arr!40978 _values!1445) (store mapRest!52562 mapKey!52562 mapValue!52562))))

(declare-fun b!1285427 () Bool)

(declare-fun res!853938 () Bool)

(assert (=> b!1285427 (=> (not res!853938) (not e!734253))))

(assert (=> b!1285427 (= res!853938 (and (= (size!41530 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41531 _keys!1741) (size!41530 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285428 () Bool)

(declare-fun tp_is_empty!34003 () Bool)

(assert (=> b!1285428 (= e!734254 tp_is_empty!34003)))

(declare-fun res!853936 () Bool)

(assert (=> start!108850 (=> (not res!853936) (not e!734253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108850 (= res!853936 (validMask!0 mask!2175))))

(assert (=> start!108850 e!734253))

(assert (=> start!108850 tp_is_empty!34003))

(assert (=> start!108850 true))

(declare-fun array_inv!31237 (array!84951) Bool)

(assert (=> start!108850 (and (array_inv!31237 _values!1445) e!734255)))

(declare-fun array_inv!31238 (array!84953) Bool)

(assert (=> start!108850 (array_inv!31238 _keys!1741)))

(assert (=> start!108850 tp!100206))

(declare-fun b!1285429 () Bool)

(assert (=> b!1285429 (= e!734256 tp_is_empty!34003)))

(declare-fun b!1285430 () Bool)

(declare-fun res!853934 () Bool)

(assert (=> b!1285430 (=> (not res!853934) (not e!734253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84953 (_ BitVec 32)) Bool)

(assert (=> b!1285430 (= res!853934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108850 res!853936) b!1285427))

(assert (= (and b!1285427 res!853938) b!1285430))

(assert (= (and b!1285430 res!853934) b!1285424))

(assert (= (and b!1285424 res!853935) b!1285426))

(assert (= (and b!1285426 res!853937) b!1285423))

(assert (= (and b!1285425 condMapEmpty!52562) mapIsEmpty!52562))

(assert (= (and b!1285425 (not condMapEmpty!52562)) mapNonEmpty!52562))

(get-info :version)

(assert (= (and mapNonEmpty!52562 ((_ is ValueCellFull!16103) mapValue!52562)) b!1285429))

(assert (= (and b!1285425 ((_ is ValueCellFull!16103) mapDefault!52562)) b!1285428))

(assert (= start!108850 b!1285425))

(declare-fun m!1178329 () Bool)

(assert (=> start!108850 m!1178329))

(declare-fun m!1178331 () Bool)

(assert (=> start!108850 m!1178331))

(declare-fun m!1178333 () Bool)

(assert (=> start!108850 m!1178333))

(declare-fun m!1178335 () Bool)

(assert (=> b!1285423 m!1178335))

(assert (=> b!1285423 m!1178335))

(declare-fun m!1178337 () Bool)

(assert (=> b!1285423 m!1178337))

(declare-fun m!1178339 () Bool)

(assert (=> mapNonEmpty!52562 m!1178339))

(declare-fun m!1178341 () Bool)

(assert (=> b!1285430 m!1178341))

(declare-fun m!1178343 () Bool)

(assert (=> b!1285424 m!1178343))

(check-sat (not b!1285423) (not start!108850) b_and!46411 (not b!1285424) (not b!1285430) (not b_next!28363) tp_is_empty!34003 (not mapNonEmpty!52562))
(check-sat b_and!46411 (not b_next!28363))
