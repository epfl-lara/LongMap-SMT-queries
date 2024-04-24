; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109056 () Bool)

(assert start!109056)

(declare-fun b_free!28345 () Bool)

(declare-fun b_next!28345 () Bool)

(assert (=> start!109056 (= b_free!28345 (not b_next!28345))))

(declare-fun tp!100150 () Bool)

(declare-fun b_and!46413 () Bool)

(assert (=> start!109056 (= tp!100150 b_and!46413)))

(declare-fun mapIsEmpty!52535 () Bool)

(declare-fun mapRes!52535 () Bool)

(assert (=> mapIsEmpty!52535 mapRes!52535))

(declare-fun b!1286576 () Bool)

(declare-fun res!854346 () Bool)

(declare-fun e!734996 () Bool)

(assert (=> b!1286576 (=> (not res!854346) (not e!734996))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85057 0))(
  ( (array!85058 (arr!41026 (Array (_ BitVec 32) (_ BitVec 64))) (size!41577 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85057)

(assert (=> b!1286576 (= res!854346 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41577 _keys!1741))))))

(declare-fun b!1286577 () Bool)

(declare-fun e!734997 () Bool)

(declare-fun tp_is_empty!33985 () Bool)

(assert (=> b!1286577 (= e!734997 tp_is_empty!33985)))

(declare-fun b!1286578 () Bool)

(declare-fun e!734995 () Bool)

(assert (=> b!1286578 (= e!734995 tp_is_empty!33985)))

(declare-fun mapNonEmpty!52535 () Bool)

(declare-fun tp!100151 () Bool)

(assert (=> mapNonEmpty!52535 (= mapRes!52535 (and tp!100151 e!734997))))

(declare-fun mapKey!52535 () (_ BitVec 32))

(declare-datatypes ((V!50417 0))(
  ( (V!50418 (val!17067 Int)) )
))
(declare-datatypes ((ValueCell!16094 0))(
  ( (ValueCellFull!16094 (v!19664 V!50417)) (EmptyCell!16094) )
))
(declare-datatypes ((array!85059 0))(
  ( (array!85060 (arr!41027 (Array (_ BitVec 32) ValueCell!16094)) (size!41578 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85059)

(declare-fun mapValue!52535 () ValueCell!16094)

(declare-fun mapRest!52535 () (Array (_ BitVec 32) ValueCell!16094))

(assert (=> mapNonEmpty!52535 (= (arr!41027 _values!1445) (store mapRest!52535 mapKey!52535 mapValue!52535))))

(declare-fun b!1286579 () Bool)

(declare-fun res!854349 () Bool)

(assert (=> b!1286579 (=> (not res!854349) (not e!734996))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286579 (= res!854349 (and (= (size!41578 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41577 _keys!1741) (size!41578 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286580 () Bool)

(declare-fun res!854350 () Bool)

(assert (=> b!1286580 (=> (not res!854350) (not e!734996))))

(declare-datatypes ((List!29099 0))(
  ( (Nil!29096) (Cons!29095 (h!30313 (_ BitVec 64)) (t!42635 List!29099)) )
))
(declare-fun arrayNoDuplicates!0 (array!85057 (_ BitVec 32) List!29099) Bool)

(assert (=> b!1286580 (= res!854350 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29096))))

(declare-fun b!1286581 () Bool)

(declare-fun e!734993 () Bool)

(assert (=> b!1286581 (= e!734993 (and e!734995 mapRes!52535))))

(declare-fun condMapEmpty!52535 () Bool)

(declare-fun mapDefault!52535 () ValueCell!16094)

(assert (=> b!1286581 (= condMapEmpty!52535 (= (arr!41027 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16094)) mapDefault!52535)))))

(declare-fun b!1286582 () Bool)

(assert (=> b!1286582 (= e!734996 false)))

(declare-fun minValue!1387 () V!50417)

(declare-fun zeroValue!1387 () V!50417)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!577379 () Bool)

(declare-datatypes ((tuple2!21898 0))(
  ( (tuple2!21899 (_1!10960 (_ BitVec 64)) (_2!10960 V!50417)) )
))
(declare-datatypes ((List!29100 0))(
  ( (Nil!29097) (Cons!29096 (h!30314 tuple2!21898) (t!42636 List!29100)) )
))
(declare-datatypes ((ListLongMap!19563 0))(
  ( (ListLongMap!19564 (toList!9797 List!29100)) )
))
(declare-fun contains!7928 (ListLongMap!19563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4861 (array!85057 array!85059 (_ BitVec 32) (_ BitVec 32) V!50417 V!50417 (_ BitVec 32) Int) ListLongMap!19563)

(assert (=> b!1286582 (= lt!577379 (contains!7928 (getCurrentListMap!4861 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!854348 () Bool)

(assert (=> start!109056 (=> (not res!854348) (not e!734996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109056 (= res!854348 (validMask!0 mask!2175))))

(assert (=> start!109056 e!734996))

(assert (=> start!109056 tp_is_empty!33985))

(assert (=> start!109056 true))

(declare-fun array_inv!31329 (array!85059) Bool)

(assert (=> start!109056 (and (array_inv!31329 _values!1445) e!734993)))

(declare-fun array_inv!31330 (array!85057) Bool)

(assert (=> start!109056 (array_inv!31330 _keys!1741)))

(assert (=> start!109056 tp!100150))

(declare-fun b!1286583 () Bool)

(declare-fun res!854347 () Bool)

(assert (=> b!1286583 (=> (not res!854347) (not e!734996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85057 (_ BitVec 32)) Bool)

(assert (=> b!1286583 (= res!854347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109056 res!854348) b!1286579))

(assert (= (and b!1286579 res!854349) b!1286583))

(assert (= (and b!1286583 res!854347) b!1286580))

(assert (= (and b!1286580 res!854350) b!1286576))

(assert (= (and b!1286576 res!854346) b!1286582))

(assert (= (and b!1286581 condMapEmpty!52535) mapIsEmpty!52535))

(assert (= (and b!1286581 (not condMapEmpty!52535)) mapNonEmpty!52535))

(get-info :version)

(assert (= (and mapNonEmpty!52535 ((_ is ValueCellFull!16094) mapValue!52535)) b!1286577))

(assert (= (and b!1286581 ((_ is ValueCellFull!16094) mapDefault!52535)) b!1286578))

(assert (= start!109056 b!1286581))

(declare-fun m!1180297 () Bool)

(assert (=> b!1286580 m!1180297))

(declare-fun m!1180299 () Bool)

(assert (=> b!1286583 m!1180299))

(declare-fun m!1180301 () Bool)

(assert (=> b!1286582 m!1180301))

(assert (=> b!1286582 m!1180301))

(declare-fun m!1180303 () Bool)

(assert (=> b!1286582 m!1180303))

(declare-fun m!1180305 () Bool)

(assert (=> start!109056 m!1180305))

(declare-fun m!1180307 () Bool)

(assert (=> start!109056 m!1180307))

(declare-fun m!1180309 () Bool)

(assert (=> start!109056 m!1180309))

(declare-fun m!1180311 () Bool)

(assert (=> mapNonEmpty!52535 m!1180311))

(check-sat (not b!1286580) (not start!109056) (not b_next!28345) (not b!1286582) (not mapNonEmpty!52535) b_and!46413 (not b!1286583) tp_is_empty!33985)
(check-sat b_and!46413 (not b_next!28345))
