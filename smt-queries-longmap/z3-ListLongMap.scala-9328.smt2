; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111628 () Bool)

(assert start!111628)

(declare-fun b_free!30061 () Bool)

(declare-fun b_next!30061 () Bool)

(assert (=> start!111628 (= b_free!30061 (not b_next!30061))))

(declare-fun tp!105658 () Bool)

(declare-fun b_and!48283 () Bool)

(assert (=> start!111628 (= tp!105658 b_and!48283)))

(declare-fun b!1319584 () Bool)

(declare-fun res!875434 () Bool)

(declare-fun e!753140 () Bool)

(assert (=> b!1319584 (=> (not res!875434) (not e!753140))))

(declare-datatypes ((array!88779 0))(
  ( (array!88780 (arr!42859 (Array (_ BitVec 32) (_ BitVec 64))) (size!43410 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88779)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319584 (= res!875434 (validKeyInArray!0 (select (arr!42859 _keys!1609) from!2000)))))

(declare-fun b!1319585 () Bool)

(declare-fun e!753141 () Bool)

(declare-fun e!753142 () Bool)

(declare-fun mapRes!55469 () Bool)

(assert (=> b!1319585 (= e!753141 (and e!753142 mapRes!55469))))

(declare-fun condMapEmpty!55469 () Bool)

(declare-datatypes ((V!52945 0))(
  ( (V!52946 (val!18015 Int)) )
))
(declare-datatypes ((ValueCell!17042 0))(
  ( (ValueCellFull!17042 (v!20640 V!52945)) (EmptyCell!17042) )
))
(declare-datatypes ((array!88781 0))(
  ( (array!88782 (arr!42860 (Array (_ BitVec 32) ValueCell!17042)) (size!43411 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88781)

(declare-fun mapDefault!55469 () ValueCell!17042)

(assert (=> b!1319585 (= condMapEmpty!55469 (= (arr!42860 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17042)) mapDefault!55469)))))

(declare-fun b!1319586 () Bool)

(declare-fun res!875428 () Bool)

(assert (=> b!1319586 (=> (not res!875428) (not e!753140))))

(declare-datatypes ((List!30378 0))(
  ( (Nil!30375) (Cons!30374 (h!31592 (_ BitVec 64)) (t!43980 List!30378)) )
))
(declare-fun arrayNoDuplicates!0 (array!88779 (_ BitVec 32) List!30378) Bool)

(assert (=> b!1319586 (= res!875428 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30375))))

(declare-fun b!1319587 () Bool)

(declare-fun res!875430 () Bool)

(assert (=> b!1319587 (=> (not res!875430) (not e!753140))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88779 (_ BitVec 32)) Bool)

(assert (=> b!1319587 (= res!875430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319588 () Bool)

(declare-fun tp_is_empty!35881 () Bool)

(assert (=> b!1319588 (= e!753142 tp_is_empty!35881)))

(declare-fun b!1319589 () Bool)

(declare-fun res!875431 () Bool)

(assert (=> b!1319589 (=> (not res!875431) (not e!753140))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319589 (= res!875431 (not (= (select (arr!42859 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319590 () Bool)

(assert (=> b!1319590 (= e!753140 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52945)

(declare-fun minValue!1279 () V!52945)

(declare-fun lt!586934 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23214 0))(
  ( (tuple2!23215 (_1!11618 (_ BitVec 64)) (_2!11618 V!52945)) )
))
(declare-datatypes ((List!30379 0))(
  ( (Nil!30376) (Cons!30375 (h!31593 tuple2!23214) (t!43981 List!30379)) )
))
(declare-datatypes ((ListLongMap!20879 0))(
  ( (ListLongMap!20880 (toList!10455 List!30379)) )
))
(declare-fun contains!8622 (ListLongMap!20879 (_ BitVec 64)) Bool)

(declare-fun +!4545 (ListLongMap!20879 tuple2!23214) ListLongMap!20879)

(declare-fun getCurrentListMapNoExtraKeys!6184 (array!88779 array!88781 (_ BitVec 32) (_ BitVec 32) V!52945 V!52945 (_ BitVec 32) Int) ListLongMap!20879)

(declare-fun get!21560 (ValueCell!17042 V!52945) V!52945)

(declare-fun dynLambda!3499 (Int (_ BitVec 64)) V!52945)

(assert (=> b!1319590 (= lt!586934 (contains!8622 (+!4545 (+!4545 (+!4545 (getCurrentListMapNoExtraKeys!6184 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23215 (select (arr!42859 _keys!1609) from!2000) (get!21560 (select (arr!42860 _values!1337) from!2000) (dynLambda!3499 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23215 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23215 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164))))

(declare-fun b!1319591 () Bool)

(declare-fun res!875432 () Bool)

(assert (=> b!1319591 (=> (not res!875432) (not e!753140))))

(declare-fun getCurrentListMap!5459 (array!88779 array!88781 (_ BitVec 32) (_ BitVec 32) V!52945 V!52945 (_ BitVec 32) Int) ListLongMap!20879)

(assert (=> b!1319591 (= res!875432 (contains!8622 (getCurrentListMap!5459 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319592 () Bool)

(declare-fun res!875427 () Bool)

(assert (=> b!1319592 (=> (not res!875427) (not e!753140))))

(assert (=> b!1319592 (= res!875427 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43410 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319593 () Bool)

(declare-fun res!875433 () Bool)

(assert (=> b!1319593 (=> (not res!875433) (not e!753140))))

(assert (=> b!1319593 (= res!875433 (and (= (size!43411 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43410 _keys!1609) (size!43411 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55469 () Bool)

(assert (=> mapIsEmpty!55469 mapRes!55469))

(declare-fun mapNonEmpty!55469 () Bool)

(declare-fun tp!105659 () Bool)

(declare-fun e!753138 () Bool)

(assert (=> mapNonEmpty!55469 (= mapRes!55469 (and tp!105659 e!753138))))

(declare-fun mapRest!55469 () (Array (_ BitVec 32) ValueCell!17042))

(declare-fun mapKey!55469 () (_ BitVec 32))

(declare-fun mapValue!55469 () ValueCell!17042)

(assert (=> mapNonEmpty!55469 (= (arr!42860 _values!1337) (store mapRest!55469 mapKey!55469 mapValue!55469))))

(declare-fun res!875429 () Bool)

(assert (=> start!111628 (=> (not res!875429) (not e!753140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111628 (= res!875429 (validMask!0 mask!2019))))

(assert (=> start!111628 e!753140))

(declare-fun array_inv!32637 (array!88779) Bool)

(assert (=> start!111628 (array_inv!32637 _keys!1609)))

(assert (=> start!111628 true))

(assert (=> start!111628 tp_is_empty!35881))

(declare-fun array_inv!32638 (array!88781) Bool)

(assert (=> start!111628 (and (array_inv!32638 _values!1337) e!753141)))

(assert (=> start!111628 tp!105658))

(declare-fun b!1319594 () Bool)

(assert (=> b!1319594 (= e!753138 tp_is_empty!35881)))

(assert (= (and start!111628 res!875429) b!1319593))

(assert (= (and b!1319593 res!875433) b!1319587))

(assert (= (and b!1319587 res!875430) b!1319586))

(assert (= (and b!1319586 res!875428) b!1319592))

(assert (= (and b!1319592 res!875427) b!1319591))

(assert (= (and b!1319591 res!875432) b!1319589))

(assert (= (and b!1319589 res!875431) b!1319584))

(assert (= (and b!1319584 res!875434) b!1319590))

(assert (= (and b!1319585 condMapEmpty!55469) mapIsEmpty!55469))

(assert (= (and b!1319585 (not condMapEmpty!55469)) mapNonEmpty!55469))

(get-info :version)

(assert (= (and mapNonEmpty!55469 ((_ is ValueCellFull!17042) mapValue!55469)) b!1319594))

(assert (= (and b!1319585 ((_ is ValueCellFull!17042) mapDefault!55469)) b!1319588))

(assert (= start!111628 b!1319585))

(declare-fun b_lambda!23381 () Bool)

(assert (=> (not b_lambda!23381) (not b!1319590)))

(declare-fun t!43979 () Bool)

(declare-fun tb!11405 () Bool)

(assert (=> (and start!111628 (= defaultEntry!1340 defaultEntry!1340) t!43979) tb!11405))

(declare-fun result!23873 () Bool)

(assert (=> tb!11405 (= result!23873 tp_is_empty!35881)))

(assert (=> b!1319590 t!43979))

(declare-fun b_and!48285 () Bool)

(assert (= b_and!48283 (and (=> t!43979 result!23873) b_and!48285)))

(declare-fun m!1207445 () Bool)

(assert (=> start!111628 m!1207445))

(declare-fun m!1207447 () Bool)

(assert (=> start!111628 m!1207447))

(declare-fun m!1207449 () Bool)

(assert (=> start!111628 m!1207449))

(declare-fun m!1207451 () Bool)

(assert (=> b!1319590 m!1207451))

(declare-fun m!1207453 () Bool)

(assert (=> b!1319590 m!1207453))

(assert (=> b!1319590 m!1207451))

(declare-fun m!1207455 () Bool)

(assert (=> b!1319590 m!1207455))

(declare-fun m!1207457 () Bool)

(assert (=> b!1319590 m!1207457))

(declare-fun m!1207459 () Bool)

(assert (=> b!1319590 m!1207459))

(declare-fun m!1207461 () Bool)

(assert (=> b!1319590 m!1207461))

(assert (=> b!1319590 m!1207455))

(declare-fun m!1207463 () Bool)

(assert (=> b!1319590 m!1207463))

(declare-fun m!1207465 () Bool)

(assert (=> b!1319590 m!1207465))

(assert (=> b!1319590 m!1207463))

(assert (=> b!1319590 m!1207457))

(assert (=> b!1319590 m!1207461))

(assert (=> b!1319590 m!1207453))

(declare-fun m!1207467 () Bool)

(assert (=> b!1319590 m!1207467))

(declare-fun m!1207469 () Bool)

(assert (=> b!1319586 m!1207469))

(assert (=> b!1319589 m!1207465))

(declare-fun m!1207471 () Bool)

(assert (=> mapNonEmpty!55469 m!1207471))

(declare-fun m!1207473 () Bool)

(assert (=> b!1319587 m!1207473))

(assert (=> b!1319584 m!1207465))

(assert (=> b!1319584 m!1207465))

(declare-fun m!1207475 () Bool)

(assert (=> b!1319584 m!1207475))

(declare-fun m!1207477 () Bool)

(assert (=> b!1319591 m!1207477))

(assert (=> b!1319591 m!1207477))

(declare-fun m!1207479 () Bool)

(assert (=> b!1319591 m!1207479))

(check-sat (not b!1319586) (not b_next!30061) (not start!111628) b_and!48285 (not b!1319591) (not b_lambda!23381) (not b!1319590) (not b!1319587) tp_is_empty!35881 (not mapNonEmpty!55469) (not b!1319584))
(check-sat b_and!48285 (not b_next!30061))
