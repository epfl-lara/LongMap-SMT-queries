; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111344 () Bool)

(assert start!111344)

(declare-fun b!1317469 () Bool)

(declare-fun e!751813 () Bool)

(declare-fun tp_is_empty!35821 () Bool)

(assert (=> b!1317469 (= e!751813 tp_is_empty!35821)))

(declare-datatypes ((array!88515 0))(
  ( (array!88516 (arr!42732 (Array (_ BitVec 32) (_ BitVec 64))) (size!43284 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88515)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun e!751814 () Bool)

(declare-fun b!1317470 () Bool)

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1317470 (= e!751814 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43284 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!2000 (size!43284 _keys!1609))))))

(declare-fun b!1317471 () Bool)

(declare-fun res!874404 () Bool)

(assert (=> b!1317471 (=> (not res!874404) (not e!751814))))

(declare-datatypes ((V!52865 0))(
  ( (V!52866 (val!17985 Int)) )
))
(declare-datatypes ((ValueCell!17012 0))(
  ( (ValueCellFull!17012 (v!20614 V!52865)) (EmptyCell!17012) )
))
(declare-datatypes ((array!88517 0))(
  ( (array!88518 (arr!42733 (Array (_ BitVec 32) ValueCell!17012)) (size!43285 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88517)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1317471 (= res!874404 (and (= (size!43285 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43284 _keys!1609) (size!43285 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55379 () Bool)

(declare-fun mapRes!55379 () Bool)

(declare-fun tp!105486 () Bool)

(assert (=> mapNonEmpty!55379 (= mapRes!55379 (and tp!105486 e!751813))))

(declare-fun mapRest!55379 () (Array (_ BitVec 32) ValueCell!17012))

(declare-fun mapKey!55379 () (_ BitVec 32))

(declare-fun mapValue!55379 () ValueCell!17012)

(assert (=> mapNonEmpty!55379 (= (arr!42733 _values!1337) (store mapRest!55379 mapKey!55379 mapValue!55379))))

(declare-fun b!1317472 () Bool)

(declare-fun e!751815 () Bool)

(declare-fun e!751816 () Bool)

(assert (=> b!1317472 (= e!751815 (and e!751816 mapRes!55379))))

(declare-fun condMapEmpty!55379 () Bool)

(declare-fun mapDefault!55379 () ValueCell!17012)

(assert (=> b!1317472 (= condMapEmpty!55379 (= (arr!42733 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17012)) mapDefault!55379)))))

(declare-fun b!1317473 () Bool)

(declare-fun res!874407 () Bool)

(assert (=> b!1317473 (=> (not res!874407) (not e!751814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88515 (_ BitVec 32)) Bool)

(assert (=> b!1317473 (= res!874407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317474 () Bool)

(assert (=> b!1317474 (= e!751816 tp_is_empty!35821)))

(declare-fun b!1317475 () Bool)

(declare-fun res!874406 () Bool)

(assert (=> b!1317475 (=> (not res!874406) (not e!751814))))

(declare-datatypes ((List!30372 0))(
  ( (Nil!30369) (Cons!30368 (h!31577 (_ BitVec 64)) (t!43972 List!30372)) )
))
(declare-fun arrayNoDuplicates!0 (array!88515 (_ BitVec 32) List!30372) Bool)

(assert (=> b!1317475 (= res!874406 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30369))))

(declare-fun mapIsEmpty!55379 () Bool)

(assert (=> mapIsEmpty!55379 mapRes!55379))

(declare-fun res!874405 () Bool)

(assert (=> start!111344 (=> (not res!874405) (not e!751814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111344 (= res!874405 (validMask!0 mask!2019))))

(assert (=> start!111344 e!751814))

(declare-fun array_inv!32453 (array!88515) Bool)

(assert (=> start!111344 (array_inv!32453 _keys!1609)))

(assert (=> start!111344 true))

(declare-fun array_inv!32454 (array!88517) Bool)

(assert (=> start!111344 (and (array_inv!32454 _values!1337) e!751815)))

(assert (= (and start!111344 res!874405) b!1317471))

(assert (= (and b!1317471 res!874404) b!1317473))

(assert (= (and b!1317473 res!874407) b!1317475))

(assert (= (and b!1317475 res!874406) b!1317470))

(assert (= (and b!1317472 condMapEmpty!55379) mapIsEmpty!55379))

(assert (= (and b!1317472 (not condMapEmpty!55379)) mapNonEmpty!55379))

(get-info :version)

(assert (= (and mapNonEmpty!55379 ((_ is ValueCellFull!17012) mapValue!55379)) b!1317469))

(assert (= (and b!1317472 ((_ is ValueCellFull!17012) mapDefault!55379)) b!1317474))

(assert (= start!111344 b!1317472))

(declare-fun m!1204851 () Bool)

(assert (=> mapNonEmpty!55379 m!1204851))

(declare-fun m!1204853 () Bool)

(assert (=> b!1317473 m!1204853))

(declare-fun m!1204855 () Bool)

(assert (=> b!1317475 m!1204855))

(declare-fun m!1204857 () Bool)

(assert (=> start!111344 m!1204857))

(declare-fun m!1204859 () Bool)

(assert (=> start!111344 m!1204859))

(declare-fun m!1204861 () Bool)

(assert (=> start!111344 m!1204861))

(check-sat (not b!1317473) (not b!1317475) (not mapNonEmpty!55379) (not start!111344) tp_is_empty!35821)
(check-sat)
