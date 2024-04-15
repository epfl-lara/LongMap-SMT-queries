; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4010 () Bool)

(assert start!4010)

(declare-fun b_free!925 () Bool)

(declare-fun b_next!925 () Bool)

(assert (=> start!4010 (= b_free!925 (not b_next!925))))

(declare-fun tp!4195 () Bool)

(declare-fun b_and!1729 () Bool)

(assert (=> start!4010 (= tp!4195 b_and!1729)))

(declare-fun res!17528 () Bool)

(declare-fun e!18881 () Bool)

(assert (=> start!4010 (=> (not res!17528) (not e!18881))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4010 (= res!17528 (validMask!0 mask!2294))))

(assert (=> start!4010 e!18881))

(assert (=> start!4010 true))

(assert (=> start!4010 tp!4195))

(declare-datatypes ((V!1531 0))(
  ( (V!1532 (val!666 Int)) )
))
(declare-datatypes ((ValueCell!440 0))(
  ( (ValueCellFull!440 (v!1754 V!1531)) (EmptyCell!440) )
))
(declare-datatypes ((array!1765 0))(
  ( (array!1766 (arr!836 (Array (_ BitVec 32) ValueCell!440)) (size!937 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1765)

(declare-fun e!18878 () Bool)

(declare-fun array_inv!585 (array!1765) Bool)

(assert (=> start!4010 (and (array_inv!585 _values!1501) e!18878)))

(declare-datatypes ((array!1767 0))(
  ( (array!1768 (arr!837 (Array (_ BitVec 32) (_ BitVec 64))) (size!938 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1767)

(declare-fun array_inv!586 (array!1767) Bool)

(assert (=> start!4010 (array_inv!586 _keys!1833)))

(declare-fun tp_is_empty!1279 () Bool)

(assert (=> start!4010 tp_is_empty!1279))

(declare-fun b!29247 () Bool)

(declare-fun res!17526 () Bool)

(assert (=> b!29247 (=> (not res!17526) (not e!18881))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29247 (= res!17526 (validKeyInArray!0 k0!1304))))

(declare-fun b!29248 () Bool)

(declare-fun e!18880 () Bool)

(assert (=> b!29248 (= e!18880 tp_is_empty!1279)))

(declare-fun b!29249 () Bool)

(declare-fun e!18882 () Bool)

(assert (=> b!29249 (= e!18882 tp_is_empty!1279)))

(declare-fun mapNonEmpty!1447 () Bool)

(declare-fun mapRes!1447 () Bool)

(declare-fun tp!4194 () Bool)

(assert (=> mapNonEmpty!1447 (= mapRes!1447 (and tp!4194 e!18882))))

(declare-fun mapRest!1447 () (Array (_ BitVec 32) ValueCell!440))

(declare-fun mapKey!1447 () (_ BitVec 32))

(declare-fun mapValue!1447 () ValueCell!440)

(assert (=> mapNonEmpty!1447 (= (arr!836 _values!1501) (store mapRest!1447 mapKey!1447 mapValue!1447))))

(declare-fun b!29250 () Bool)

(declare-fun e!18879 () Bool)

(assert (=> b!29250 (= e!18879 (not true))))

(declare-fun lt!11186 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1767 (_ BitVec 32)) Bool)

(assert (=> b!29250 (arrayForallSeekEntryOrOpenFound!0 lt!11186 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!680 0))(
  ( (Unit!681) )
))
(declare-fun lt!11185 () Unit!680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!680)

(assert (=> b!29250 (= lt!11185 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11186))))

(declare-datatypes ((SeekEntryResult!85 0))(
  ( (MissingZero!85 (index!2462 (_ BitVec 32))) (Found!85 (index!2463 (_ BitVec 32))) (Intermediate!85 (undefined!897 Bool) (index!2464 (_ BitVec 32)) (x!6411 (_ BitVec 32))) (Undefined!85) (MissingVacant!85 (index!2465 (_ BitVec 32))) )
))
(declare-fun lt!11187 () SeekEntryResult!85)

(get-info :version)

(assert (=> b!29250 (and ((_ is Found!85) lt!11187) (= (index!2463 lt!11187) lt!11186))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1767 (_ BitVec 32)) SeekEntryResult!85)

(assert (=> b!29250 (= lt!11187 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!11184 () Unit!680)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1767 (_ BitVec 32)) Unit!680)

(assert (=> b!29250 (= lt!11184 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11186 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1112 0))(
  ( (tuple2!1113 (_1!567 (_ BitVec 64)) (_2!567 V!1531)) )
))
(declare-datatypes ((List!695 0))(
  ( (Nil!692) (Cons!691 (h!1258 tuple2!1112) (t!3381 List!695)) )
))
(declare-datatypes ((ListLongMap!677 0))(
  ( (ListLongMap!678 (toList!354 List!695)) )
))
(declare-fun lt!11183 () ListLongMap!677)

(declare-fun contains!295 (ListLongMap!677 (_ BitVec 64)) Bool)

(assert (=> b!29250 (contains!295 lt!11183 (select (arr!837 _keys!1833) lt!11186))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11188 () Unit!680)

(declare-fun zeroValue!1443 () V!1531)

(declare-fun minValue!1443 () V!1531)

(declare-fun lemmaValidKeyInArrayIsInListMap!30 (array!1767 array!1765 (_ BitVec 32) (_ BitVec 32) V!1531 V!1531 (_ BitVec 32) Int) Unit!680)

(assert (=> b!29250 (= lt!11188 (lemmaValidKeyInArrayIsInListMap!30 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11186 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1767 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29250 (= lt!11186 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29251 () Bool)

(declare-fun res!17524 () Bool)

(assert (=> b!29251 (=> (not res!17524) (not e!18881))))

(assert (=> b!29251 (= res!17524 (and (= (size!937 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!938 _keys!1833) (size!937 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29252 () Bool)

(assert (=> b!29252 (= e!18881 e!18879)))

(declare-fun res!17530 () Bool)

(assert (=> b!29252 (=> (not res!17530) (not e!18879))))

(assert (=> b!29252 (= res!17530 (not (contains!295 lt!11183 k0!1304)))))

(declare-fun getCurrentListMap!181 (array!1767 array!1765 (_ BitVec 32) (_ BitVec 32) V!1531 V!1531 (_ BitVec 32) Int) ListLongMap!677)

(assert (=> b!29252 (= lt!11183 (getCurrentListMap!181 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29253 () Bool)

(declare-fun res!17529 () Bool)

(assert (=> b!29253 (=> (not res!17529) (not e!18881))))

(declare-datatypes ((List!696 0))(
  ( (Nil!693) (Cons!692 (h!1259 (_ BitVec 64)) (t!3382 List!696)) )
))
(declare-fun arrayNoDuplicates!0 (array!1767 (_ BitVec 32) List!696) Bool)

(assert (=> b!29253 (= res!17529 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!693))))

(declare-fun b!29254 () Bool)

(declare-fun res!17527 () Bool)

(assert (=> b!29254 (=> (not res!17527) (not e!18881))))

(assert (=> b!29254 (= res!17527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29255 () Bool)

(declare-fun res!17525 () Bool)

(assert (=> b!29255 (=> (not res!17525) (not e!18879))))

(declare-fun arrayContainsKey!0 (array!1767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29255 (= res!17525 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1447 () Bool)

(assert (=> mapIsEmpty!1447 mapRes!1447))

(declare-fun b!29256 () Bool)

(assert (=> b!29256 (= e!18878 (and e!18880 mapRes!1447))))

(declare-fun condMapEmpty!1447 () Bool)

(declare-fun mapDefault!1447 () ValueCell!440)

(assert (=> b!29256 (= condMapEmpty!1447 (= (arr!836 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!440)) mapDefault!1447)))))

(assert (= (and start!4010 res!17528) b!29251))

(assert (= (and b!29251 res!17524) b!29254))

(assert (= (and b!29254 res!17527) b!29253))

(assert (= (and b!29253 res!17529) b!29247))

(assert (= (and b!29247 res!17526) b!29252))

(assert (= (and b!29252 res!17530) b!29255))

(assert (= (and b!29255 res!17525) b!29250))

(assert (= (and b!29256 condMapEmpty!1447) mapIsEmpty!1447))

(assert (= (and b!29256 (not condMapEmpty!1447)) mapNonEmpty!1447))

(assert (= (and mapNonEmpty!1447 ((_ is ValueCellFull!440) mapValue!1447)) b!29249))

(assert (= (and b!29256 ((_ is ValueCellFull!440) mapDefault!1447)) b!29248))

(assert (= start!4010 b!29256))

(declare-fun m!23427 () Bool)

(assert (=> mapNonEmpty!1447 m!23427))

(declare-fun m!23429 () Bool)

(assert (=> b!29250 m!23429))

(declare-fun m!23431 () Bool)

(assert (=> b!29250 m!23431))

(declare-fun m!23433 () Bool)

(assert (=> b!29250 m!23433))

(declare-fun m!23435 () Bool)

(assert (=> b!29250 m!23435))

(declare-fun m!23437 () Bool)

(assert (=> b!29250 m!23437))

(assert (=> b!29250 m!23429))

(declare-fun m!23439 () Bool)

(assert (=> b!29250 m!23439))

(declare-fun m!23441 () Bool)

(assert (=> b!29250 m!23441))

(declare-fun m!23443 () Bool)

(assert (=> b!29250 m!23443))

(declare-fun m!23445 () Bool)

(assert (=> b!29253 m!23445))

(declare-fun m!23447 () Bool)

(assert (=> b!29252 m!23447))

(declare-fun m!23449 () Bool)

(assert (=> b!29252 m!23449))

(declare-fun m!23451 () Bool)

(assert (=> b!29247 m!23451))

(declare-fun m!23453 () Bool)

(assert (=> b!29254 m!23453))

(declare-fun m!23455 () Bool)

(assert (=> start!4010 m!23455))

(declare-fun m!23457 () Bool)

(assert (=> start!4010 m!23457))

(declare-fun m!23459 () Bool)

(assert (=> start!4010 m!23459))

(declare-fun m!23461 () Bool)

(assert (=> b!29255 m!23461))

(check-sat (not b!29247) (not b!29250) (not b_next!925) (not start!4010) tp_is_empty!1279 (not mapNonEmpty!1447) (not b!29254) (not b!29253) (not b!29255) b_and!1729 (not b!29252))
(check-sat b_and!1729 (not b_next!925))
