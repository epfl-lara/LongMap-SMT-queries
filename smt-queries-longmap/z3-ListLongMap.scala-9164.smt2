; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110060 () Bool)

(assert start!110060)

(declare-fun b_free!29259 () Bool)

(declare-fun b_next!29259 () Bool)

(assert (=> start!110060 (= b_free!29259 (not b_next!29259))))

(declare-fun tp!102928 () Bool)

(declare-fun b_and!47423 () Bool)

(assert (=> start!110060 (= tp!102928 b_and!47423)))

(declare-fun b!1303406 () Bool)

(declare-fun res!865699 () Bool)

(declare-fun e!743458 () Bool)

(assert (=> b!1303406 (=> (not res!865699) (not e!743458))))

(declare-datatypes ((V!51635 0))(
  ( (V!51636 (val!17524 Int)) )
))
(declare-fun minValue!1387 () V!51635)

(declare-fun zeroValue!1387 () V!51635)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16551 0))(
  ( (ValueCellFull!16551 (v!20140 V!51635)) (EmptyCell!16551) )
))
(declare-datatypes ((array!86812 0))(
  ( (array!86813 (arr!41897 (Array (_ BitVec 32) ValueCell!16551)) (size!42447 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86812)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!86814 0))(
  ( (array!86815 (arr!41898 (Array (_ BitVec 32) (_ BitVec 64))) (size!42448 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86814)

(declare-datatypes ((tuple2!22614 0))(
  ( (tuple2!22615 (_1!11318 (_ BitVec 64)) (_2!11318 V!51635)) )
))
(declare-datatypes ((List!29740 0))(
  ( (Nil!29737) (Cons!29736 (h!30945 tuple2!22614) (t!43334 List!29740)) )
))
(declare-datatypes ((ListLongMap!20271 0))(
  ( (ListLongMap!20272 (toList!10151 List!29740)) )
))
(declare-fun contains!8287 (ListLongMap!20271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5173 (array!86814 array!86812 (_ BitVec 32) (_ BitVec 32) V!51635 V!51635 (_ BitVec 32) Int) ListLongMap!20271)

(assert (=> b!1303406 (= res!865699 (contains!8287 (getCurrentListMap!5173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1303407 () Bool)

(declare-fun e!743453 () Bool)

(declare-fun tp_is_empty!34899 () Bool)

(assert (=> b!1303407 (= e!743453 tp_is_empty!34899)))

(declare-fun b!1303408 () Bool)

(declare-fun res!865701 () Bool)

(assert (=> b!1303408 (=> (not res!865701) (not e!743458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86814 (_ BitVec 32)) Bool)

(assert (=> b!1303408 (= res!865701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303409 () Bool)

(declare-fun res!865693 () Bool)

(assert (=> b!1303409 (=> (not res!865693) (not e!743458))))

(declare-datatypes ((List!29741 0))(
  ( (Nil!29738) (Cons!29737 (h!30946 (_ BitVec 64)) (t!43335 List!29741)) )
))
(declare-fun arrayNoDuplicates!0 (array!86814 (_ BitVec 32) List!29741) Bool)

(assert (=> b!1303409 (= res!865693 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29738))))

(declare-fun b!1303410 () Bool)

(declare-fun res!865694 () Bool)

(assert (=> b!1303410 (=> (not res!865694) (not e!743458))))

(assert (=> b!1303410 (= res!865694 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42448 _keys!1741))))))

(declare-fun b!1303411 () Bool)

(declare-fun e!743457 () Bool)

(assert (=> b!1303411 (= e!743457 tp_is_empty!34899)))

(declare-fun b!1303412 () Bool)

(declare-fun res!865698 () Bool)

(assert (=> b!1303412 (=> (not res!865698) (not e!743458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303412 (= res!865698 (not (validKeyInArray!0 (select (arr!41898 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53941 () Bool)

(declare-fun mapRes!53941 () Bool)

(assert (=> mapIsEmpty!53941 mapRes!53941))

(declare-fun b!1303413 () Bool)

(declare-fun e!743456 () Bool)

(assert (=> b!1303413 (= e!743458 (not e!743456))))

(declare-fun res!865696 () Bool)

(assert (=> b!1303413 (=> res!865696 e!743456)))

(assert (=> b!1303413 (= res!865696 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1303413 (not (contains!8287 (ListLongMap!20272 Nil!29737) k0!1205))))

(declare-datatypes ((Unit!43156 0))(
  ( (Unit!43157) )
))
(declare-fun lt!583271 () Unit!43156)

(declare-fun emptyContainsNothing!216 ((_ BitVec 64)) Unit!43156)

(assert (=> b!1303413 (= lt!583271 (emptyContainsNothing!216 k0!1205))))

(declare-fun b!1303414 () Bool)

(assert (=> b!1303414 (= e!743456 true)))

(assert (=> b!1303414 false))

(declare-fun lt!583274 () ListLongMap!20271)

(declare-fun lt!583272 () Unit!43156)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!89 ((_ BitVec 64) (_ BitVec 64) V!51635 ListLongMap!20271) Unit!43156)

(assert (=> b!1303414 (= lt!583272 (lemmaInListMapAfterAddingDiffThenInBefore!89 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!583274))))

(declare-fun lt!583270 () ListLongMap!20271)

(declare-fun +!4476 (ListLongMap!20271 tuple2!22614) ListLongMap!20271)

(assert (=> b!1303414 (not (contains!8287 (+!4476 lt!583270 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583273 () Unit!43156)

(declare-fun addStillNotContains!473 (ListLongMap!20271 (_ BitVec 64) V!51635 (_ BitVec 64)) Unit!43156)

(assert (=> b!1303414 (= lt!583273 (addStillNotContains!473 lt!583270 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1303414 (not (contains!8287 lt!583274 k0!1205))))

(assert (=> b!1303414 (= lt!583274 (+!4476 lt!583270 (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583275 () Unit!43156)

(assert (=> b!1303414 (= lt!583275 (addStillNotContains!473 lt!583270 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6109 (array!86814 array!86812 (_ BitVec 32) (_ BitVec 32) V!51635 V!51635 (_ BitVec 32) Int) ListLongMap!20271)

(assert (=> b!1303414 (= lt!583270 (getCurrentListMapNoExtraKeys!6109 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303415 () Bool)

(declare-fun res!865695 () Bool)

(assert (=> b!1303415 (=> (not res!865695) (not e!743458))))

(assert (=> b!1303415 (= res!865695 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42448 _keys!1741))))))

(declare-fun b!1303416 () Bool)

(declare-fun res!865697 () Bool)

(assert (=> b!1303416 (=> (not res!865697) (not e!743458))))

(assert (=> b!1303416 (= res!865697 (and (= (size!42447 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42448 _keys!1741) (size!42447 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303417 () Bool)

(declare-fun e!743454 () Bool)

(assert (=> b!1303417 (= e!743454 (and e!743457 mapRes!53941))))

(declare-fun condMapEmpty!53941 () Bool)

(declare-fun mapDefault!53941 () ValueCell!16551)

(assert (=> b!1303417 (= condMapEmpty!53941 (= (arr!41897 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16551)) mapDefault!53941)))))

(declare-fun mapNonEmpty!53941 () Bool)

(declare-fun tp!102927 () Bool)

(assert (=> mapNonEmpty!53941 (= mapRes!53941 (and tp!102927 e!743453))))

(declare-fun mapRest!53941 () (Array (_ BitVec 32) ValueCell!16551))

(declare-fun mapValue!53941 () ValueCell!16551)

(declare-fun mapKey!53941 () (_ BitVec 32))

(assert (=> mapNonEmpty!53941 (= (arr!41897 _values!1445) (store mapRest!53941 mapKey!53941 mapValue!53941))))

(declare-fun res!865700 () Bool)

(assert (=> start!110060 (=> (not res!865700) (not e!743458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110060 (= res!865700 (validMask!0 mask!2175))))

(assert (=> start!110060 e!743458))

(assert (=> start!110060 tp_is_empty!34899))

(assert (=> start!110060 true))

(declare-fun array_inv!31687 (array!86812) Bool)

(assert (=> start!110060 (and (array_inv!31687 _values!1445) e!743454)))

(declare-fun array_inv!31688 (array!86814) Bool)

(assert (=> start!110060 (array_inv!31688 _keys!1741)))

(assert (=> start!110060 tp!102928))

(assert (= (and start!110060 res!865700) b!1303416))

(assert (= (and b!1303416 res!865697) b!1303408))

(assert (= (and b!1303408 res!865701) b!1303409))

(assert (= (and b!1303409 res!865693) b!1303415))

(assert (= (and b!1303415 res!865695) b!1303406))

(assert (= (and b!1303406 res!865699) b!1303410))

(assert (= (and b!1303410 res!865694) b!1303412))

(assert (= (and b!1303412 res!865698) b!1303413))

(assert (= (and b!1303413 (not res!865696)) b!1303414))

(assert (= (and b!1303417 condMapEmpty!53941) mapIsEmpty!53941))

(assert (= (and b!1303417 (not condMapEmpty!53941)) mapNonEmpty!53941))

(get-info :version)

(assert (= (and mapNonEmpty!53941 ((_ is ValueCellFull!16551) mapValue!53941)) b!1303407))

(assert (= (and b!1303417 ((_ is ValueCellFull!16551) mapDefault!53941)) b!1303411))

(assert (= start!110060 b!1303417))

(declare-fun m!1194311 () Bool)

(assert (=> start!110060 m!1194311))

(declare-fun m!1194313 () Bool)

(assert (=> start!110060 m!1194313))

(declare-fun m!1194315 () Bool)

(assert (=> start!110060 m!1194315))

(declare-fun m!1194317 () Bool)

(assert (=> b!1303409 m!1194317))

(declare-fun m!1194319 () Bool)

(assert (=> mapNonEmpty!53941 m!1194319))

(declare-fun m!1194321 () Bool)

(assert (=> b!1303408 m!1194321))

(declare-fun m!1194323 () Bool)

(assert (=> b!1303412 m!1194323))

(assert (=> b!1303412 m!1194323))

(declare-fun m!1194325 () Bool)

(assert (=> b!1303412 m!1194325))

(declare-fun m!1194327 () Bool)

(assert (=> b!1303413 m!1194327))

(declare-fun m!1194329 () Bool)

(assert (=> b!1303413 m!1194329))

(declare-fun m!1194331 () Bool)

(assert (=> b!1303414 m!1194331))

(declare-fun m!1194333 () Bool)

(assert (=> b!1303414 m!1194333))

(declare-fun m!1194335 () Bool)

(assert (=> b!1303414 m!1194335))

(declare-fun m!1194337 () Bool)

(assert (=> b!1303414 m!1194337))

(declare-fun m!1194339 () Bool)

(assert (=> b!1303414 m!1194339))

(declare-fun m!1194341 () Bool)

(assert (=> b!1303414 m!1194341))

(assert (=> b!1303414 m!1194335))

(declare-fun m!1194343 () Bool)

(assert (=> b!1303414 m!1194343))

(declare-fun m!1194345 () Bool)

(assert (=> b!1303414 m!1194345))

(declare-fun m!1194347 () Bool)

(assert (=> b!1303406 m!1194347))

(assert (=> b!1303406 m!1194347))

(declare-fun m!1194349 () Bool)

(assert (=> b!1303406 m!1194349))

(check-sat (not b_next!29259) tp_is_empty!34899 (not b!1303408) b_and!47423 (not mapNonEmpty!53941) (not b!1303406) (not b!1303413) (not b!1303409) (not b!1303412) (not b!1303414) (not start!110060))
(check-sat b_and!47423 (not b_next!29259))
