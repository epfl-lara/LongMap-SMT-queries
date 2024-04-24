; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109074 () Bool)

(assert start!109074)

(declare-fun b_free!28363 () Bool)

(declare-fun b_next!28363 () Bool)

(assert (=> start!109074 (= b_free!28363 (not b_next!28363))))

(declare-fun tp!100205 () Bool)

(declare-fun b_and!46431 () Bool)

(assert (=> start!109074 (= tp!100205 b_and!46431)))

(declare-fun b!1286792 () Bool)

(declare-fun res!854484 () Bool)

(declare-fun e!735132 () Bool)

(assert (=> b!1286792 (=> (not res!854484) (not e!735132))))

(declare-datatypes ((array!85091 0))(
  ( (array!85092 (arr!41043 (Array (_ BitVec 32) (_ BitVec 64))) (size!41594 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85091)

(declare-datatypes ((List!29110 0))(
  ( (Nil!29107) (Cons!29106 (h!30324 (_ BitVec 64)) (t!42646 List!29110)) )
))
(declare-fun arrayNoDuplicates!0 (array!85091 (_ BitVec 32) List!29110) Bool)

(assert (=> b!1286792 (= res!854484 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29107))))

(declare-fun b!1286793 () Bool)

(declare-fun e!735129 () Bool)

(declare-fun tp_is_empty!34003 () Bool)

(assert (=> b!1286793 (= e!735129 tp_is_empty!34003)))

(declare-fun b!1286794 () Bool)

(declare-fun e!735131 () Bool)

(assert (=> b!1286794 (= e!735131 tp_is_empty!34003)))

(declare-fun b!1286795 () Bool)

(declare-fun e!735130 () Bool)

(declare-fun mapRes!52562 () Bool)

(assert (=> b!1286795 (= e!735130 (and e!735129 mapRes!52562))))

(declare-fun condMapEmpty!52562 () Bool)

(declare-datatypes ((V!50441 0))(
  ( (V!50442 (val!17076 Int)) )
))
(declare-datatypes ((ValueCell!16103 0))(
  ( (ValueCellFull!16103 (v!19673 V!50441)) (EmptyCell!16103) )
))
(declare-datatypes ((array!85093 0))(
  ( (array!85094 (arr!41044 (Array (_ BitVec 32) ValueCell!16103)) (size!41595 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85093)

(declare-fun mapDefault!52562 () ValueCell!16103)

(assert (=> b!1286795 (= condMapEmpty!52562 (= (arr!41044 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16103)) mapDefault!52562)))))

(declare-fun b!1286796 () Bool)

(declare-fun res!854485 () Bool)

(assert (=> b!1286796 (=> (not res!854485) (not e!735132))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85091 (_ BitVec 32)) Bool)

(assert (=> b!1286796 (= res!854485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52562 () Bool)

(assert (=> mapIsEmpty!52562 mapRes!52562))

(declare-fun mapNonEmpty!52562 () Bool)

(declare-fun tp!100204 () Bool)

(assert (=> mapNonEmpty!52562 (= mapRes!52562 (and tp!100204 e!735131))))

(declare-fun mapKey!52562 () (_ BitVec 32))

(declare-fun mapValue!52562 () ValueCell!16103)

(declare-fun mapRest!52562 () (Array (_ BitVec 32) ValueCell!16103))

(assert (=> mapNonEmpty!52562 (= (arr!41044 _values!1445) (store mapRest!52562 mapKey!52562 mapValue!52562))))

(declare-fun b!1286797 () Bool)

(declare-fun res!854481 () Bool)

(assert (=> b!1286797 (=> (not res!854481) (not e!735132))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1286797 (= res!854481 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41594 _keys!1741))))))

(declare-fun b!1286798 () Bool)

(assert (=> b!1286798 (= e!735132 false)))

(declare-fun minValue!1387 () V!50441)

(declare-fun zeroValue!1387 () V!50441)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!577406 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21910 0))(
  ( (tuple2!21911 (_1!10966 (_ BitVec 64)) (_2!10966 V!50441)) )
))
(declare-datatypes ((List!29111 0))(
  ( (Nil!29108) (Cons!29107 (h!30325 tuple2!21910) (t!42647 List!29111)) )
))
(declare-datatypes ((ListLongMap!19575 0))(
  ( (ListLongMap!19576 (toList!9803 List!29111)) )
))
(declare-fun contains!7934 (ListLongMap!19575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4867 (array!85091 array!85093 (_ BitVec 32) (_ BitVec 32) V!50441 V!50441 (_ BitVec 32) Int) ListLongMap!19575)

(assert (=> b!1286798 (= lt!577406 (contains!7934 (getCurrentListMap!4867 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286799 () Bool)

(declare-fun res!854482 () Bool)

(assert (=> b!1286799 (=> (not res!854482) (not e!735132))))

(assert (=> b!1286799 (= res!854482 (and (= (size!41595 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41594 _keys!1741) (size!41595 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!854483 () Bool)

(assert (=> start!109074 (=> (not res!854483) (not e!735132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109074 (= res!854483 (validMask!0 mask!2175))))

(assert (=> start!109074 e!735132))

(assert (=> start!109074 tp_is_empty!34003))

(assert (=> start!109074 true))

(declare-fun array_inv!31339 (array!85093) Bool)

(assert (=> start!109074 (and (array_inv!31339 _values!1445) e!735130)))

(declare-fun array_inv!31340 (array!85091) Bool)

(assert (=> start!109074 (array_inv!31340 _keys!1741)))

(assert (=> start!109074 tp!100205))

(assert (= (and start!109074 res!854483) b!1286799))

(assert (= (and b!1286799 res!854482) b!1286796))

(assert (= (and b!1286796 res!854485) b!1286792))

(assert (= (and b!1286792 res!854484) b!1286797))

(assert (= (and b!1286797 res!854481) b!1286798))

(assert (= (and b!1286795 condMapEmpty!52562) mapIsEmpty!52562))

(assert (= (and b!1286795 (not condMapEmpty!52562)) mapNonEmpty!52562))

(get-info :version)

(assert (= (and mapNonEmpty!52562 ((_ is ValueCellFull!16103) mapValue!52562)) b!1286794))

(assert (= (and b!1286795 ((_ is ValueCellFull!16103) mapDefault!52562)) b!1286793))

(assert (= start!109074 b!1286795))

(declare-fun m!1180441 () Bool)

(assert (=> b!1286792 m!1180441))

(declare-fun m!1180443 () Bool)

(assert (=> b!1286796 m!1180443))

(declare-fun m!1180445 () Bool)

(assert (=> b!1286798 m!1180445))

(assert (=> b!1286798 m!1180445))

(declare-fun m!1180447 () Bool)

(assert (=> b!1286798 m!1180447))

(declare-fun m!1180449 () Bool)

(assert (=> mapNonEmpty!52562 m!1180449))

(declare-fun m!1180451 () Bool)

(assert (=> start!109074 m!1180451))

(declare-fun m!1180453 () Bool)

(assert (=> start!109074 m!1180453))

(declare-fun m!1180455 () Bool)

(assert (=> start!109074 m!1180455))

(check-sat (not b_next!28363) b_and!46431 (not b!1286798) (not mapNonEmpty!52562) (not start!109074) (not b!1286792) tp_is_empty!34003 (not b!1286796))
(check-sat b_and!46431 (not b_next!28363))
