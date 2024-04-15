; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111356 () Bool)

(assert start!111356)

(declare-fun b_free!30013 () Bool)

(declare-fun b_next!30013 () Bool)

(assert (=> start!111356 (= b_free!30013 (not b_next!30013))))

(declare-fun tp!105515 () Bool)

(declare-fun b_and!48215 () Bool)

(assert (=> start!111356 (= tp!105515 b_and!48215)))

(declare-fun res!874487 () Bool)

(declare-fun e!751906 () Bool)

(assert (=> start!111356 (=> (not res!874487) (not e!751906))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111356 (= res!874487 (validMask!0 mask!2019))))

(assert (=> start!111356 e!751906))

(declare-datatypes ((array!88535 0))(
  ( (array!88536 (arr!42742 (Array (_ BitVec 32) (_ BitVec 64))) (size!43294 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88535)

(declare-fun array_inv!32459 (array!88535) Bool)

(assert (=> start!111356 (array_inv!32459 _keys!1609)))

(assert (=> start!111356 true))

(declare-fun tp_is_empty!35833 () Bool)

(assert (=> start!111356 tp_is_empty!35833))

(declare-datatypes ((V!52881 0))(
  ( (V!52882 (val!17991 Int)) )
))
(declare-datatypes ((ValueCell!17018 0))(
  ( (ValueCellFull!17018 (v!20620 V!52881)) (EmptyCell!17018) )
))
(declare-datatypes ((array!88537 0))(
  ( (array!88538 (arr!42743 (Array (_ BitVec 32) ValueCell!17018)) (size!43295 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88537)

(declare-fun e!751904 () Bool)

(declare-fun array_inv!32460 (array!88537) Bool)

(assert (=> start!111356 (and (array_inv!32460 _values!1337) e!751904)))

(assert (=> start!111356 tp!105515))

(declare-fun b!1317606 () Bool)

(declare-fun e!751905 () Bool)

(assert (=> b!1317606 (= e!751905 tp_is_empty!35833)))

(declare-fun b!1317607 () Bool)

(assert (=> b!1317607 (= e!751906 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52881)

(declare-fun lt!586209 () Bool)

(declare-fun minValue!1279 () V!52881)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23236 0))(
  ( (tuple2!23237 (_1!11629 (_ BitVec 64)) (_2!11629 V!52881)) )
))
(declare-datatypes ((List!30376 0))(
  ( (Nil!30373) (Cons!30372 (h!31581 tuple2!23236) (t!43976 List!30376)) )
))
(declare-datatypes ((ListLongMap!20893 0))(
  ( (ListLongMap!20894 (toList!10462 List!30376)) )
))
(declare-fun contains!8545 (ListLongMap!20893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5357 (array!88535 array!88537 (_ BitVec 32) (_ BitVec 32) V!52881 V!52881 (_ BitVec 32) Int) ListLongMap!20893)

(assert (=> b!1317607 (= lt!586209 (contains!8545 (getCurrentListMap!5357 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1317608 () Bool)

(declare-fun res!874490 () Bool)

(assert (=> b!1317608 (=> (not res!874490) (not e!751906))))

(assert (=> b!1317608 (= res!874490 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43294 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317609 () Bool)

(declare-fun res!874489 () Bool)

(assert (=> b!1317609 (=> (not res!874489) (not e!751906))))

(assert (=> b!1317609 (= res!874489 (and (= (size!43295 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43294 _keys!1609) (size!43295 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55397 () Bool)

(declare-fun mapRes!55397 () Bool)

(assert (=> mapIsEmpty!55397 mapRes!55397))

(declare-fun mapNonEmpty!55397 () Bool)

(declare-fun tp!105516 () Bool)

(assert (=> mapNonEmpty!55397 (= mapRes!55397 (and tp!105516 e!751905))))

(declare-fun mapValue!55397 () ValueCell!17018)

(declare-fun mapKey!55397 () (_ BitVec 32))

(declare-fun mapRest!55397 () (Array (_ BitVec 32) ValueCell!17018))

(assert (=> mapNonEmpty!55397 (= (arr!42743 _values!1337) (store mapRest!55397 mapKey!55397 mapValue!55397))))

(declare-fun b!1317610 () Bool)

(declare-fun res!874488 () Bool)

(assert (=> b!1317610 (=> (not res!874488) (not e!751906))))

(declare-datatypes ((List!30377 0))(
  ( (Nil!30374) (Cons!30373 (h!31582 (_ BitVec 64)) (t!43977 List!30377)) )
))
(declare-fun arrayNoDuplicates!0 (array!88535 (_ BitVec 32) List!30377) Bool)

(assert (=> b!1317610 (= res!874488 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30374))))

(declare-fun b!1317611 () Bool)

(declare-fun e!751902 () Bool)

(assert (=> b!1317611 (= e!751904 (and e!751902 mapRes!55397))))

(declare-fun condMapEmpty!55397 () Bool)

(declare-fun mapDefault!55397 () ValueCell!17018)

(assert (=> b!1317611 (= condMapEmpty!55397 (= (arr!42743 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17018)) mapDefault!55397)))))

(declare-fun b!1317612 () Bool)

(assert (=> b!1317612 (= e!751902 tp_is_empty!35833)))

(declare-fun b!1317613 () Bool)

(declare-fun res!874491 () Bool)

(assert (=> b!1317613 (=> (not res!874491) (not e!751906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88535 (_ BitVec 32)) Bool)

(assert (=> b!1317613 (= res!874491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111356 res!874487) b!1317609))

(assert (= (and b!1317609 res!874489) b!1317613))

(assert (= (and b!1317613 res!874491) b!1317610))

(assert (= (and b!1317610 res!874488) b!1317608))

(assert (= (and b!1317608 res!874490) b!1317607))

(assert (= (and b!1317611 condMapEmpty!55397) mapIsEmpty!55397))

(assert (= (and b!1317611 (not condMapEmpty!55397)) mapNonEmpty!55397))

(get-info :version)

(assert (= (and mapNonEmpty!55397 ((_ is ValueCellFull!17018) mapValue!55397)) b!1317606))

(assert (= (and b!1317611 ((_ is ValueCellFull!17018) mapDefault!55397)) b!1317612))

(assert (= start!111356 b!1317611))

(declare-fun m!1204935 () Bool)

(assert (=> b!1317610 m!1204935))

(declare-fun m!1204937 () Bool)

(assert (=> mapNonEmpty!55397 m!1204937))

(declare-fun m!1204939 () Bool)

(assert (=> b!1317607 m!1204939))

(assert (=> b!1317607 m!1204939))

(declare-fun m!1204941 () Bool)

(assert (=> b!1317607 m!1204941))

(declare-fun m!1204943 () Bool)

(assert (=> b!1317613 m!1204943))

(declare-fun m!1204945 () Bool)

(assert (=> start!111356 m!1204945))

(declare-fun m!1204947 () Bool)

(assert (=> start!111356 m!1204947))

(declare-fun m!1204949 () Bool)

(assert (=> start!111356 m!1204949))

(check-sat (not b!1317610) (not b_next!30013) b_and!48215 (not b!1317613) (not b!1317607) (not start!111356) tp_is_empty!35833 (not mapNonEmpty!55397))
(check-sat b_and!48215 (not b_next!30013))
