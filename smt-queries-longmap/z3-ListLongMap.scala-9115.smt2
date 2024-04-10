; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109476 () Bool)

(assert start!109476)

(declare-fun b_free!28965 () Bool)

(declare-fun b_next!28965 () Bool)

(assert (=> start!109476 (= b_free!28965 (not b_next!28965))))

(declare-fun tp!102013 () Bool)

(declare-fun b_and!47055 () Bool)

(assert (=> start!109476 (= tp!102013 b_and!47055)))

(declare-fun b!1296606 () Bool)

(declare-fun res!861721 () Bool)

(declare-fun e!739710 () Bool)

(assert (=> b!1296606 (=> (not res!861721) (not e!739710))))

(declare-datatypes ((array!86228 0))(
  ( (array!86229 (arr!41615 (Array (_ BitVec 32) (_ BitVec 64))) (size!42165 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86228)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86228 (_ BitVec 32)) Bool)

(assert (=> b!1296606 (= res!861721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53468 () Bool)

(declare-fun mapRes!53468 () Bool)

(assert (=> mapIsEmpty!53468 mapRes!53468))

(declare-fun b!1296607 () Bool)

(declare-fun e!739711 () Bool)

(declare-fun tp_is_empty!34605 () Bool)

(assert (=> b!1296607 (= e!739711 tp_is_empty!34605)))

(declare-fun b!1296608 () Bool)

(declare-fun e!739709 () Bool)

(assert (=> b!1296608 (= e!739709 tp_is_empty!34605)))

(declare-fun b!1296609 () Bool)

(declare-fun e!739712 () Bool)

(assert (=> b!1296609 (= e!739712 (and e!739709 mapRes!53468))))

(declare-fun condMapEmpty!53468 () Bool)

(declare-datatypes ((V!51243 0))(
  ( (V!51244 (val!17377 Int)) )
))
(declare-datatypes ((ValueCell!16404 0))(
  ( (ValueCellFull!16404 (v!19980 V!51243)) (EmptyCell!16404) )
))
(declare-datatypes ((array!86230 0))(
  ( (array!86231 (arr!41616 (Array (_ BitVec 32) ValueCell!16404)) (size!42166 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86230)

(declare-fun mapDefault!53468 () ValueCell!16404)

(assert (=> b!1296609 (= condMapEmpty!53468 (= (arr!41616 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16404)) mapDefault!53468)))))

(declare-fun b!1296610 () Bool)

(declare-fun res!861722 () Bool)

(assert (=> b!1296610 (=> (not res!861722) (not e!739710))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296610 (= res!861722 (and (= (size!42166 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42165 _keys!1741) (size!42166 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!861723 () Bool)

(assert (=> start!109476 (=> (not res!861723) (not e!739710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109476 (= res!861723 (validMask!0 mask!2175))))

(assert (=> start!109476 e!739710))

(assert (=> start!109476 tp_is_empty!34605))

(assert (=> start!109476 true))

(declare-fun array_inv!31501 (array!86230) Bool)

(assert (=> start!109476 (and (array_inv!31501 _values!1445) e!739712)))

(declare-fun array_inv!31502 (array!86228) Bool)

(assert (=> start!109476 (array_inv!31502 _keys!1741)))

(assert (=> start!109476 tp!102013))

(declare-fun b!1296611 () Bool)

(declare-fun res!861719 () Bool)

(assert (=> b!1296611 (=> (not res!861719) (not e!739710))))

(declare-datatypes ((List!29524 0))(
  ( (Nil!29521) (Cons!29520 (h!30729 (_ BitVec 64)) (t!43088 List!29524)) )
))
(declare-fun arrayNoDuplicates!0 (array!86228 (_ BitVec 32) List!29524) Bool)

(assert (=> b!1296611 (= res!861719 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29521))))

(declare-fun b!1296612 () Bool)

(declare-fun res!861720 () Bool)

(assert (=> b!1296612 (=> (not res!861720) (not e!739710))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1296612 (= res!861720 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42165 _keys!1741))))))

(declare-fun mapNonEmpty!53468 () Bool)

(declare-fun tp!102014 () Bool)

(assert (=> mapNonEmpty!53468 (= mapRes!53468 (and tp!102014 e!739711))))

(declare-fun mapRest!53468 () (Array (_ BitVec 32) ValueCell!16404))

(declare-fun mapKey!53468 () (_ BitVec 32))

(declare-fun mapValue!53468 () ValueCell!16404)

(assert (=> mapNonEmpty!53468 (= (arr!41616 _values!1445) (store mapRest!53468 mapKey!53468 mapValue!53468))))

(declare-fun b!1296613 () Bool)

(assert (=> b!1296613 (= e!739710 false)))

(declare-fun minValue!1387 () V!51243)

(declare-fun zeroValue!1387 () V!51243)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!580502 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22386 0))(
  ( (tuple2!22387 (_1!11204 (_ BitVec 64)) (_2!11204 V!51243)) )
))
(declare-datatypes ((List!29525 0))(
  ( (Nil!29522) (Cons!29521 (h!30730 tuple2!22386) (t!43089 List!29525)) )
))
(declare-datatypes ((ListLongMap!20043 0))(
  ( (ListLongMap!20044 (toList!10037 List!29525)) )
))
(declare-fun contains!8155 (ListLongMap!20043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5066 (array!86228 array!86230 (_ BitVec 32) (_ BitVec 32) V!51243 V!51243 (_ BitVec 32) Int) ListLongMap!20043)

(assert (=> b!1296613 (= lt!580502 (contains!8155 (getCurrentListMap!5066 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109476 res!861723) b!1296610))

(assert (= (and b!1296610 res!861722) b!1296606))

(assert (= (and b!1296606 res!861721) b!1296611))

(assert (= (and b!1296611 res!861719) b!1296612))

(assert (= (and b!1296612 res!861720) b!1296613))

(assert (= (and b!1296609 condMapEmpty!53468) mapIsEmpty!53468))

(assert (= (and b!1296609 (not condMapEmpty!53468)) mapNonEmpty!53468))

(get-info :version)

(assert (= (and mapNonEmpty!53468 ((_ is ValueCellFull!16404) mapValue!53468)) b!1296607))

(assert (= (and b!1296609 ((_ is ValueCellFull!16404) mapDefault!53468)) b!1296608))

(assert (= start!109476 b!1296609))

(declare-fun m!1188483 () Bool)

(assert (=> b!1296606 m!1188483))

(declare-fun m!1188485 () Bool)

(assert (=> b!1296613 m!1188485))

(assert (=> b!1296613 m!1188485))

(declare-fun m!1188487 () Bool)

(assert (=> b!1296613 m!1188487))

(declare-fun m!1188489 () Bool)

(assert (=> mapNonEmpty!53468 m!1188489))

(declare-fun m!1188491 () Bool)

(assert (=> start!109476 m!1188491))

(declare-fun m!1188493 () Bool)

(assert (=> start!109476 m!1188493))

(declare-fun m!1188495 () Bool)

(assert (=> start!109476 m!1188495))

(declare-fun m!1188497 () Bool)

(assert (=> b!1296611 m!1188497))

(check-sat (not mapNonEmpty!53468) tp_is_empty!34605 (not b_next!28965) (not b!1296611) b_and!47055 (not b!1296606) (not b!1296613) (not start!109476))
(check-sat b_and!47055 (not b_next!28965))
