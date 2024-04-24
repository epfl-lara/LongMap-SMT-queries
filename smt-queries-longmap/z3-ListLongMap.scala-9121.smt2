; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109734 () Bool)

(assert start!109734)

(declare-fun b_free!28999 () Bool)

(declare-fun b_next!28999 () Bool)

(assert (=> start!109734 (= b_free!28999 (not b_next!28999))))

(declare-fun tp!102115 () Bool)

(declare-fun b_and!47091 () Bool)

(assert (=> start!109734 (= tp!102115 b_and!47091)))

(declare-fun b!1298328 () Bool)

(declare-fun res!862506 () Bool)

(declare-fun e!740813 () Bool)

(assert (=> b!1298328 (=> (not res!862506) (not e!740813))))

(declare-datatypes ((array!86329 0))(
  ( (array!86330 (arr!41661 (Array (_ BitVec 32) (_ BitVec 64))) (size!42212 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86329)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86329 (_ BitVec 32)) Bool)

(assert (=> b!1298328 (= res!862506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298329 () Bool)

(declare-fun res!862507 () Bool)

(assert (=> b!1298329 (=> (not res!862507) (not e!740813))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298329 (= res!862507 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42212 _keys!1741))))))

(declare-fun b!1298330 () Bool)

(declare-fun e!740812 () Bool)

(declare-fun e!740814 () Bool)

(declare-fun mapRes!53519 () Bool)

(assert (=> b!1298330 (= e!740812 (and e!740814 mapRes!53519))))

(declare-fun condMapEmpty!53519 () Bool)

(declare-datatypes ((V!51289 0))(
  ( (V!51290 (val!17394 Int)) )
))
(declare-datatypes ((ValueCell!16421 0))(
  ( (ValueCellFull!16421 (v!19992 V!51289)) (EmptyCell!16421) )
))
(declare-datatypes ((array!86331 0))(
  ( (array!86332 (arr!41662 (Array (_ BitVec 32) ValueCell!16421)) (size!42213 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86331)

(declare-fun mapDefault!53519 () ValueCell!16421)

(assert (=> b!1298330 (= condMapEmpty!53519 (= (arr!41662 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16421)) mapDefault!53519)))))

(declare-fun b!1298332 () Bool)

(declare-fun tp_is_empty!34639 () Bool)

(assert (=> b!1298332 (= e!740814 tp_is_empty!34639)))

(declare-fun b!1298333 () Bool)

(declare-fun res!862505 () Bool)

(assert (=> b!1298333 (=> (not res!862505) (not e!740813))))

(declare-datatypes ((List!29584 0))(
  ( (Nil!29581) (Cons!29580 (h!30798 (_ BitVec 64)) (t!43140 List!29584)) )
))
(declare-fun arrayNoDuplicates!0 (array!86329 (_ BitVec 32) List!29584) Bool)

(assert (=> b!1298333 (= res!862505 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29581))))

(declare-fun mapIsEmpty!53519 () Bool)

(assert (=> mapIsEmpty!53519 mapRes!53519))

(declare-fun b!1298334 () Bool)

(declare-fun res!862503 () Bool)

(assert (=> b!1298334 (=> (not res!862503) (not e!740813))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298334 (= res!862503 (and (= (size!42213 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42212 _keys!1741) (size!42213 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298335 () Bool)

(declare-fun e!740810 () Bool)

(assert (=> b!1298335 (= e!740810 tp_is_empty!34639)))

(declare-fun mapNonEmpty!53519 () Bool)

(declare-fun tp!102116 () Bool)

(assert (=> mapNonEmpty!53519 (= mapRes!53519 (and tp!102116 e!740810))))

(declare-fun mapKey!53519 () (_ BitVec 32))

(declare-fun mapValue!53519 () ValueCell!16421)

(declare-fun mapRest!53519 () (Array (_ BitVec 32) ValueCell!16421))

(assert (=> mapNonEmpty!53519 (= (arr!41662 _values!1445) (store mapRest!53519 mapKey!53519 mapValue!53519))))

(declare-fun b!1298331 () Bool)

(assert (=> b!1298331 (= e!740813 false)))

(declare-fun minValue!1387 () V!51289)

(declare-fun zeroValue!1387 () V!51289)

(declare-fun lt!581028 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22418 0))(
  ( (tuple2!22419 (_1!11220 (_ BitVec 64)) (_2!11220 V!51289)) )
))
(declare-datatypes ((List!29585 0))(
  ( (Nil!29582) (Cons!29581 (h!30799 tuple2!22418) (t!43141 List!29585)) )
))
(declare-datatypes ((ListLongMap!20083 0))(
  ( (ListLongMap!20084 (toList!10057 List!29585)) )
))
(declare-fun contains!8187 (ListLongMap!20083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5076 (array!86329 array!86331 (_ BitVec 32) (_ BitVec 32) V!51289 V!51289 (_ BitVec 32) Int) ListLongMap!20083)

(assert (=> b!1298331 (= lt!581028 (contains!8187 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!862504 () Bool)

(assert (=> start!109734 (=> (not res!862504) (not e!740813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109734 (= res!862504 (validMask!0 mask!2175))))

(assert (=> start!109734 e!740813))

(assert (=> start!109734 tp_is_empty!34639))

(assert (=> start!109734 true))

(declare-fun array_inv!31771 (array!86331) Bool)

(assert (=> start!109734 (and (array_inv!31771 _values!1445) e!740812)))

(declare-fun array_inv!31772 (array!86329) Bool)

(assert (=> start!109734 (array_inv!31772 _keys!1741)))

(assert (=> start!109734 tp!102115))

(assert (= (and start!109734 res!862504) b!1298334))

(assert (= (and b!1298334 res!862503) b!1298328))

(assert (= (and b!1298328 res!862506) b!1298333))

(assert (= (and b!1298333 res!862505) b!1298329))

(assert (= (and b!1298329 res!862507) b!1298331))

(assert (= (and b!1298330 condMapEmpty!53519) mapIsEmpty!53519))

(assert (= (and b!1298330 (not condMapEmpty!53519)) mapNonEmpty!53519))

(get-info :version)

(assert (= (and mapNonEmpty!53519 ((_ is ValueCellFull!16421) mapValue!53519)) b!1298335))

(assert (= (and b!1298330 ((_ is ValueCellFull!16421) mapDefault!53519)) b!1298332))

(assert (= start!109734 b!1298330))

(declare-fun m!1190373 () Bool)

(assert (=> b!1298328 m!1190373))

(declare-fun m!1190375 () Bool)

(assert (=> mapNonEmpty!53519 m!1190375))

(declare-fun m!1190377 () Bool)

(assert (=> b!1298333 m!1190377))

(declare-fun m!1190379 () Bool)

(assert (=> start!109734 m!1190379))

(declare-fun m!1190381 () Bool)

(assert (=> start!109734 m!1190381))

(declare-fun m!1190383 () Bool)

(assert (=> start!109734 m!1190383))

(declare-fun m!1190385 () Bool)

(assert (=> b!1298331 m!1190385))

(assert (=> b!1298331 m!1190385))

(declare-fun m!1190387 () Bool)

(assert (=> b!1298331 m!1190387))

(check-sat (not b!1298328) (not start!109734) (not b!1298333) tp_is_empty!34639 (not mapNonEmpty!53519) (not b!1298331) b_and!47091 (not b_next!28999))
(check-sat b_and!47091 (not b_next!28999))
