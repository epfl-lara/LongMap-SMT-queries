; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111320 () Bool)

(assert start!111320)

(declare-fun b!1317251 () Bool)

(declare-fun res!874295 () Bool)

(declare-fun e!751633 () Bool)

(assert (=> b!1317251 (=> (not res!874295) (not e!751633))))

(declare-datatypes ((array!88469 0))(
  ( (array!88470 (arr!42709 (Array (_ BitVec 32) (_ BitVec 64))) (size!43261 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88469)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52833 0))(
  ( (V!52834 (val!17973 Int)) )
))
(declare-datatypes ((ValueCell!17000 0))(
  ( (ValueCellFull!17000 (v!20602 V!52833)) (EmptyCell!17000) )
))
(declare-datatypes ((array!88471 0))(
  ( (array!88472 (arr!42710 (Array (_ BitVec 32) ValueCell!17000)) (size!43262 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88471)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1317251 (= res!874295 (and (= (size!43262 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43261 _keys!1609) (size!43262 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317252 () Bool)

(declare-fun e!751634 () Bool)

(declare-fun e!751636 () Bool)

(declare-fun mapRes!55343 () Bool)

(assert (=> b!1317252 (= e!751634 (and e!751636 mapRes!55343))))

(declare-fun condMapEmpty!55343 () Bool)

(declare-fun mapDefault!55343 () ValueCell!17000)

(assert (=> b!1317252 (= condMapEmpty!55343 (= (arr!42710 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17000)) mapDefault!55343)))))

(declare-fun b!1317253 () Bool)

(declare-fun e!751632 () Bool)

(declare-fun tp_is_empty!35797 () Bool)

(assert (=> b!1317253 (= e!751632 tp_is_empty!35797)))

(declare-fun mapIsEmpty!55343 () Bool)

(assert (=> mapIsEmpty!55343 mapRes!55343))

(declare-fun b!1317254 () Bool)

(assert (=> b!1317254 (= e!751633 false)))

(declare-fun lt!586164 () Bool)

(declare-datatypes ((List!30363 0))(
  ( (Nil!30360) (Cons!30359 (h!31568 (_ BitVec 64)) (t!43963 List!30363)) )
))
(declare-fun arrayNoDuplicates!0 (array!88469 (_ BitVec 32) List!30363) Bool)

(assert (=> b!1317254 (= lt!586164 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30360))))

(declare-fun res!874294 () Bool)

(assert (=> start!111320 (=> (not res!874294) (not e!751633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111320 (= res!874294 (validMask!0 mask!2019))))

(assert (=> start!111320 e!751633))

(assert (=> start!111320 true))

(declare-fun array_inv!32435 (array!88471) Bool)

(assert (=> start!111320 (and (array_inv!32435 _values!1337) e!751634)))

(declare-fun array_inv!32436 (array!88469) Bool)

(assert (=> start!111320 (array_inv!32436 _keys!1609)))

(declare-fun b!1317255 () Bool)

(assert (=> b!1317255 (= e!751636 tp_is_empty!35797)))

(declare-fun mapNonEmpty!55343 () Bool)

(declare-fun tp!105450 () Bool)

(assert (=> mapNonEmpty!55343 (= mapRes!55343 (and tp!105450 e!751632))))

(declare-fun mapKey!55343 () (_ BitVec 32))

(declare-fun mapValue!55343 () ValueCell!17000)

(declare-fun mapRest!55343 () (Array (_ BitVec 32) ValueCell!17000))

(assert (=> mapNonEmpty!55343 (= (arr!42710 _values!1337) (store mapRest!55343 mapKey!55343 mapValue!55343))))

(declare-fun b!1317256 () Bool)

(declare-fun res!874296 () Bool)

(assert (=> b!1317256 (=> (not res!874296) (not e!751633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88469 (_ BitVec 32)) Bool)

(assert (=> b!1317256 (= res!874296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111320 res!874294) b!1317251))

(assert (= (and b!1317251 res!874295) b!1317256))

(assert (= (and b!1317256 res!874296) b!1317254))

(assert (= (and b!1317252 condMapEmpty!55343) mapIsEmpty!55343))

(assert (= (and b!1317252 (not condMapEmpty!55343)) mapNonEmpty!55343))

(get-info :version)

(assert (= (and mapNonEmpty!55343 ((_ is ValueCellFull!17000) mapValue!55343)) b!1317253))

(assert (= (and b!1317252 ((_ is ValueCellFull!17000) mapDefault!55343)) b!1317255))

(assert (= start!111320 b!1317252))

(declare-fun m!1204707 () Bool)

(assert (=> b!1317254 m!1204707))

(declare-fun m!1204709 () Bool)

(assert (=> start!111320 m!1204709))

(declare-fun m!1204711 () Bool)

(assert (=> start!111320 m!1204711))

(declare-fun m!1204713 () Bool)

(assert (=> start!111320 m!1204713))

(declare-fun m!1204715 () Bool)

(assert (=> mapNonEmpty!55343 m!1204715))

(declare-fun m!1204717 () Bool)

(assert (=> b!1317256 m!1204717))

(check-sat (not b!1317256) tp_is_empty!35797 (not start!111320) (not mapNonEmpty!55343) (not b!1317254))
(check-sat)
