; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111322 () Bool)

(assert start!111322)

(declare-fun res!874332 () Bool)

(declare-fun e!751681 () Bool)

(assert (=> start!111322 (=> (not res!874332) (not e!751681))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111322 (= res!874332 (validMask!0 mask!2019))))

(assert (=> start!111322 e!751681))

(assert (=> start!111322 true))

(declare-datatypes ((V!52835 0))(
  ( (V!52836 (val!17974 Int)) )
))
(declare-datatypes ((ValueCell!17001 0))(
  ( (ValueCellFull!17001 (v!20604 V!52835)) (EmptyCell!17001) )
))
(declare-datatypes ((array!88556 0))(
  ( (array!88557 (arr!42752 (Array (_ BitVec 32) ValueCell!17001)) (size!43302 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88556)

(declare-fun e!751682 () Bool)

(declare-fun array_inv!32289 (array!88556) Bool)

(assert (=> start!111322 (and (array_inv!32289 _values!1337) e!751682)))

(declare-datatypes ((array!88558 0))(
  ( (array!88559 (arr!42753 (Array (_ BitVec 32) (_ BitVec 64))) (size!43303 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88558)

(declare-fun array_inv!32290 (array!88558) Bool)

(assert (=> start!111322 (array_inv!32290 _keys!1609)))

(declare-fun b!1317339 () Bool)

(declare-fun res!874334 () Bool)

(assert (=> b!1317339 (=> (not res!874334) (not e!751681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88558 (_ BitVec 32)) Bool)

(assert (=> b!1317339 (= res!874334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55346 () Bool)

(declare-fun mapRes!55346 () Bool)

(assert (=> mapIsEmpty!55346 mapRes!55346))

(declare-fun b!1317340 () Bool)

(declare-fun e!751680 () Bool)

(declare-fun tp_is_empty!35799 () Bool)

(assert (=> b!1317340 (= e!751680 tp_is_empty!35799)))

(declare-fun b!1317341 () Bool)

(assert (=> b!1317341 (= e!751681 false)))

(declare-fun lt!586353 () Bool)

(declare-datatypes ((List!30303 0))(
  ( (Nil!30300) (Cons!30299 (h!31508 (_ BitVec 64)) (t!43911 List!30303)) )
))
(declare-fun arrayNoDuplicates!0 (array!88558 (_ BitVec 32) List!30303) Bool)

(assert (=> b!1317341 (= lt!586353 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30300))))

(declare-fun b!1317342 () Bool)

(declare-fun res!874333 () Bool)

(assert (=> b!1317342 (=> (not res!874333) (not e!751681))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317342 (= res!874333 (and (= (size!43302 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43303 _keys!1609) (size!43302 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55346 () Bool)

(declare-fun tp!105452 () Bool)

(declare-fun e!751683 () Bool)

(assert (=> mapNonEmpty!55346 (= mapRes!55346 (and tp!105452 e!751683))))

(declare-fun mapRest!55346 () (Array (_ BitVec 32) ValueCell!17001))

(declare-fun mapValue!55346 () ValueCell!17001)

(declare-fun mapKey!55346 () (_ BitVec 32))

(assert (=> mapNonEmpty!55346 (= (arr!42752 _values!1337) (store mapRest!55346 mapKey!55346 mapValue!55346))))

(declare-fun b!1317343 () Bool)

(assert (=> b!1317343 (= e!751683 tp_is_empty!35799)))

(declare-fun b!1317344 () Bool)

(assert (=> b!1317344 (= e!751682 (and e!751680 mapRes!55346))))

(declare-fun condMapEmpty!55346 () Bool)

(declare-fun mapDefault!55346 () ValueCell!17001)

(assert (=> b!1317344 (= condMapEmpty!55346 (= (arr!42752 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17001)) mapDefault!55346)))))

(assert (= (and start!111322 res!874332) b!1317342))

(assert (= (and b!1317342 res!874333) b!1317339))

(assert (= (and b!1317339 res!874334) b!1317341))

(assert (= (and b!1317344 condMapEmpty!55346) mapIsEmpty!55346))

(assert (= (and b!1317344 (not condMapEmpty!55346)) mapNonEmpty!55346))

(get-info :version)

(assert (= (and mapNonEmpty!55346 ((_ is ValueCellFull!17001) mapValue!55346)) b!1317343))

(assert (= (and b!1317344 ((_ is ValueCellFull!17001) mapDefault!55346)) b!1317340))

(assert (= start!111322 b!1317344))

(declare-fun m!1205235 () Bool)

(assert (=> start!111322 m!1205235))

(declare-fun m!1205237 () Bool)

(assert (=> start!111322 m!1205237))

(declare-fun m!1205239 () Bool)

(assert (=> start!111322 m!1205239))

(declare-fun m!1205241 () Bool)

(assert (=> b!1317339 m!1205241))

(declare-fun m!1205243 () Bool)

(assert (=> b!1317341 m!1205243))

(declare-fun m!1205245 () Bool)

(assert (=> mapNonEmpty!55346 m!1205245))

(check-sat (not start!111322) (not b!1317341) (not mapNonEmpty!55346) tp_is_empty!35799 (not b!1317339))
(check-sat)
