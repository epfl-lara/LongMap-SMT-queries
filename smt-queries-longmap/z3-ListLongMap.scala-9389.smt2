; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111772 () Bool)

(assert start!111772)

(declare-fun b_free!30429 () Bool)

(declare-fun b_next!30429 () Bool)

(assert (=> start!111772 (= b_free!30429 (not b_next!30429))))

(declare-fun tp!106762 () Bool)

(declare-fun b_and!48967 () Bool)

(assert (=> start!111772 (= tp!106762 b_and!48967)))

(declare-fun b!1324459 () Bool)

(declare-fun e!755056 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1324459 (= e!755056 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000))))

(declare-fun b!1324460 () Bool)

(declare-fun e!755055 () Bool)

(declare-fun e!755057 () Bool)

(declare-fun mapRes!56021 () Bool)

(assert (=> b!1324460 (= e!755055 (and e!755057 mapRes!56021))))

(declare-fun condMapEmpty!56021 () Bool)

(declare-datatypes ((V!53435 0))(
  ( (V!53436 (val!18199 Int)) )
))
(declare-datatypes ((ValueCell!17226 0))(
  ( (ValueCellFull!17226 (v!20829 V!53435)) (EmptyCell!17226) )
))
(declare-datatypes ((array!89412 0))(
  ( (array!89413 (arr!43180 (Array (_ BitVec 32) ValueCell!17226)) (size!43730 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89412)

(declare-fun mapDefault!56021 () ValueCell!17226)

(assert (=> b!1324460 (= condMapEmpty!56021 (= (arr!43180 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17226)) mapDefault!56021)))))

(declare-fun res!879109 () Bool)

(assert (=> start!111772 (=> (not res!879109) (not e!755056))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111772 (= res!879109 (validMask!0 mask!2019))))

(assert (=> start!111772 e!755056))

(declare-datatypes ((array!89414 0))(
  ( (array!89415 (arr!43181 (Array (_ BitVec 32) (_ BitVec 64))) (size!43731 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89414)

(declare-fun array_inv!32595 (array!89414) Bool)

(assert (=> start!111772 (array_inv!32595 _keys!1609)))

(assert (=> start!111772 true))

(declare-fun tp_is_empty!36249 () Bool)

(assert (=> start!111772 tp_is_empty!36249))

(declare-fun array_inv!32596 (array!89412) Bool)

(assert (=> start!111772 (and (array_inv!32596 _values!1337) e!755055)))

(assert (=> start!111772 tp!106762))

(declare-fun b!1324461 () Bool)

(assert (=> b!1324461 (= e!755057 tp_is_empty!36249)))

(declare-fun b!1324462 () Bool)

(declare-fun res!879115 () Bool)

(assert (=> b!1324462 (=> (not res!879115) (not e!755056))))

(declare-datatypes ((List!30608 0))(
  ( (Nil!30605) (Cons!30604 (h!31813 (_ BitVec 64)) (t!44534 List!30608)) )
))
(declare-fun arrayNoDuplicates!0 (array!89414 (_ BitVec 32) List!30608) Bool)

(assert (=> b!1324462 (= res!879115 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30605))))

(declare-fun b!1324463 () Bool)

(declare-fun res!879114 () Bool)

(assert (=> b!1324463 (=> (not res!879114) (not e!755056))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324463 (= res!879114 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43731 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324464 () Bool)

(declare-fun res!879111 () Bool)

(assert (=> b!1324464 (=> (not res!879111) (not e!755056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324464 (= res!879111 (not (validKeyInArray!0 (select (arr!43181 _keys!1609) from!2000))))))

(declare-fun mapNonEmpty!56021 () Bool)

(declare-fun tp!106763 () Bool)

(declare-fun e!755059 () Bool)

(assert (=> mapNonEmpty!56021 (= mapRes!56021 (and tp!106763 e!755059))))

(declare-fun mapKey!56021 () (_ BitVec 32))

(declare-fun mapValue!56021 () ValueCell!17226)

(declare-fun mapRest!56021 () (Array (_ BitVec 32) ValueCell!17226))

(assert (=> mapNonEmpty!56021 (= (arr!43180 _values!1337) (store mapRest!56021 mapKey!56021 mapValue!56021))))

(declare-fun mapIsEmpty!56021 () Bool)

(assert (=> mapIsEmpty!56021 mapRes!56021))

(declare-fun b!1324465 () Bool)

(assert (=> b!1324465 (= e!755059 tp_is_empty!36249)))

(declare-fun b!1324466 () Bool)

(declare-fun res!879112 () Bool)

(assert (=> b!1324466 (=> (not res!879112) (not e!755056))))

(assert (=> b!1324466 (= res!879112 (not (= (select (arr!43181 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324467 () Bool)

(declare-fun res!879110 () Bool)

(assert (=> b!1324467 (=> (not res!879110) (not e!755056))))

(declare-fun zeroValue!1279 () V!53435)

(declare-fun minValue!1279 () V!53435)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23466 0))(
  ( (tuple2!23467 (_1!11744 (_ BitVec 64)) (_2!11744 V!53435)) )
))
(declare-datatypes ((List!30609 0))(
  ( (Nil!30606) (Cons!30605 (h!31814 tuple2!23466) (t!44535 List!30609)) )
))
(declare-datatypes ((ListLongMap!21123 0))(
  ( (ListLongMap!21124 (toList!10577 List!30609)) )
))
(declare-fun contains!8732 (ListLongMap!21123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5573 (array!89414 array!89412 (_ BitVec 32) (_ BitVec 32) V!53435 V!53435 (_ BitVec 32) Int) ListLongMap!21123)

(assert (=> b!1324467 (= res!879110 (contains!8732 (getCurrentListMap!5573 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324468 () Bool)

(declare-fun res!879116 () Bool)

(assert (=> b!1324468 (=> (not res!879116) (not e!755056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89414 (_ BitVec 32)) Bool)

(assert (=> b!1324468 (= res!879116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324469 () Bool)

(declare-fun res!879113 () Bool)

(assert (=> b!1324469 (=> (not res!879113) (not e!755056))))

(assert (=> b!1324469 (= res!879113 (and (= (size!43730 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43731 _keys!1609) (size!43730 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111772 res!879109) b!1324469))

(assert (= (and b!1324469 res!879113) b!1324468))

(assert (= (and b!1324468 res!879116) b!1324462))

(assert (= (and b!1324462 res!879115) b!1324463))

(assert (= (and b!1324463 res!879114) b!1324467))

(assert (= (and b!1324467 res!879110) b!1324466))

(assert (= (and b!1324466 res!879112) b!1324464))

(assert (= (and b!1324464 res!879111) b!1324459))

(assert (= (and b!1324460 condMapEmpty!56021) mapIsEmpty!56021))

(assert (= (and b!1324460 (not condMapEmpty!56021)) mapNonEmpty!56021))

(get-info :version)

(assert (= (and mapNonEmpty!56021 ((_ is ValueCellFull!17226) mapValue!56021)) b!1324465))

(assert (= (and b!1324460 ((_ is ValueCellFull!17226) mapDefault!56021)) b!1324461))

(assert (= start!111772 b!1324460))

(declare-fun m!1213307 () Bool)

(assert (=> b!1324466 m!1213307))

(declare-fun m!1213309 () Bool)

(assert (=> start!111772 m!1213309))

(declare-fun m!1213311 () Bool)

(assert (=> start!111772 m!1213311))

(declare-fun m!1213313 () Bool)

(assert (=> start!111772 m!1213313))

(declare-fun m!1213315 () Bool)

(assert (=> b!1324467 m!1213315))

(assert (=> b!1324467 m!1213315))

(declare-fun m!1213317 () Bool)

(assert (=> b!1324467 m!1213317))

(declare-fun m!1213319 () Bool)

(assert (=> b!1324462 m!1213319))

(declare-fun m!1213321 () Bool)

(assert (=> b!1324468 m!1213321))

(declare-fun m!1213323 () Bool)

(assert (=> mapNonEmpty!56021 m!1213323))

(assert (=> b!1324464 m!1213307))

(assert (=> b!1324464 m!1213307))

(declare-fun m!1213325 () Bool)

(assert (=> b!1324464 m!1213325))

(check-sat (not b!1324464) (not b!1324467) (not b!1324462) (not b!1324468) (not mapNonEmpty!56021) (not b_next!30429) (not start!111772) tp_is_empty!36249 b_and!48967)
(check-sat b_and!48967 (not b_next!30429))
