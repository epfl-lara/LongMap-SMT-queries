; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111622 () Bool)

(assert start!111622)

(declare-fun b_free!30055 () Bool)

(declare-fun b_next!30055 () Bool)

(assert (=> start!111622 (= b_free!30055 (not b_next!30055))))

(declare-fun tp!105641 () Bool)

(declare-fun b_and!48277 () Bool)

(assert (=> start!111622 (= tp!105641 b_and!48277)))

(declare-fun mapNonEmpty!55460 () Bool)

(declare-fun mapRes!55460 () Bool)

(declare-fun tp!105640 () Bool)

(declare-fun e!753097 () Bool)

(assert (=> mapNonEmpty!55460 (= mapRes!55460 (and tp!105640 e!753097))))

(declare-fun mapKey!55460 () (_ BitVec 32))

(declare-datatypes ((V!52937 0))(
  ( (V!52938 (val!18012 Int)) )
))
(declare-datatypes ((ValueCell!17039 0))(
  ( (ValueCellFull!17039 (v!20637 V!52937)) (EmptyCell!17039) )
))
(declare-fun mapRest!55460 () (Array (_ BitVec 32) ValueCell!17039))

(declare-datatypes ((array!88767 0))(
  ( (array!88768 (arr!42853 (Array (_ BitVec 32) ValueCell!17039)) (size!43404 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88767)

(declare-fun mapValue!55460 () ValueCell!17039)

(assert (=> mapNonEmpty!55460 (= (arr!42853 _values!1337) (store mapRest!55460 mapKey!55460 mapValue!55460))))

(declare-fun b!1319485 () Bool)

(declare-fun res!875360 () Bool)

(declare-fun e!753095 () Bool)

(assert (=> b!1319485 (=> (not res!875360) (not e!753095))))

(declare-datatypes ((array!88769 0))(
  ( (array!88770 (arr!42854 (Array (_ BitVec 32) (_ BitVec 64))) (size!43405 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88769)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319485 (= res!875360 (validKeyInArray!0 (select (arr!42854 _keys!1609) from!2000)))))

(declare-fun b!1319486 () Bool)

(declare-fun res!875356 () Bool)

(assert (=> b!1319486 (=> (not res!875356) (not e!753095))))

(declare-datatypes ((List!30373 0))(
  ( (Nil!30370) (Cons!30369 (h!31587 (_ BitVec 64)) (t!43973 List!30373)) )
))
(declare-fun arrayNoDuplicates!0 (array!88769 (_ BitVec 32) List!30373) Bool)

(assert (=> b!1319486 (= res!875356 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30370))))

(declare-fun res!875362 () Bool)

(assert (=> start!111622 (=> (not res!875362) (not e!753095))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111622 (= res!875362 (validMask!0 mask!2019))))

(assert (=> start!111622 e!753095))

(declare-fun array_inv!32631 (array!88769) Bool)

(assert (=> start!111622 (array_inv!32631 _keys!1609)))

(assert (=> start!111622 true))

(declare-fun tp_is_empty!35875 () Bool)

(assert (=> start!111622 tp_is_empty!35875))

(declare-fun e!753093 () Bool)

(declare-fun array_inv!32632 (array!88767) Bool)

(assert (=> start!111622 (and (array_inv!32632 _values!1337) e!753093)))

(assert (=> start!111622 tp!105641))

(declare-fun b!1319487 () Bool)

(assert (=> b!1319487 (= e!753095 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000))))

(declare-fun b!1319488 () Bool)

(declare-fun e!753096 () Bool)

(assert (=> b!1319488 (= e!753096 tp_is_empty!35875)))

(declare-fun b!1319489 () Bool)

(declare-fun res!875359 () Bool)

(assert (=> b!1319489 (=> (not res!875359) (not e!753095))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52937)

(declare-fun minValue!1279 () V!52937)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23208 0))(
  ( (tuple2!23209 (_1!11615 (_ BitVec 64)) (_2!11615 V!52937)) )
))
(declare-datatypes ((List!30374 0))(
  ( (Nil!30371) (Cons!30370 (h!31588 tuple2!23208) (t!43974 List!30374)) )
))
(declare-datatypes ((ListLongMap!20873 0))(
  ( (ListLongMap!20874 (toList!10452 List!30374)) )
))
(declare-fun contains!8619 (ListLongMap!20873 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5456 (array!88769 array!88767 (_ BitVec 32) (_ BitVec 32) V!52937 V!52937 (_ BitVec 32) Int) ListLongMap!20873)

(assert (=> b!1319489 (= res!875359 (contains!8619 (getCurrentListMap!5456 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319490 () Bool)

(declare-fun res!875357 () Bool)

(assert (=> b!1319490 (=> (not res!875357) (not e!753095))))

(assert (=> b!1319490 (= res!875357 (and (= (size!43404 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43405 _keys!1609) (size!43404 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319491 () Bool)

(assert (=> b!1319491 (= e!753097 tp_is_empty!35875)))

(declare-fun b!1319492 () Bool)

(declare-fun res!875358 () Bool)

(assert (=> b!1319492 (=> (not res!875358) (not e!753095))))

(assert (=> b!1319492 (= res!875358 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43405 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55460 () Bool)

(assert (=> mapIsEmpty!55460 mapRes!55460))

(declare-fun b!1319493 () Bool)

(declare-fun res!875361 () Bool)

(assert (=> b!1319493 (=> (not res!875361) (not e!753095))))

(assert (=> b!1319493 (= res!875361 (not (= (select (arr!42854 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319494 () Bool)

(declare-fun res!875355 () Bool)

(assert (=> b!1319494 (=> (not res!875355) (not e!753095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88769 (_ BitVec 32)) Bool)

(assert (=> b!1319494 (= res!875355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319495 () Bool)

(assert (=> b!1319495 (= e!753093 (and e!753096 mapRes!55460))))

(declare-fun condMapEmpty!55460 () Bool)

(declare-fun mapDefault!55460 () ValueCell!17039)

(assert (=> b!1319495 (= condMapEmpty!55460 (= (arr!42853 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17039)) mapDefault!55460)))))

(assert (= (and start!111622 res!875362) b!1319490))

(assert (= (and b!1319490 res!875357) b!1319494))

(assert (= (and b!1319494 res!875355) b!1319486))

(assert (= (and b!1319486 res!875356) b!1319492))

(assert (= (and b!1319492 res!875358) b!1319489))

(assert (= (and b!1319489 res!875359) b!1319493))

(assert (= (and b!1319493 res!875361) b!1319485))

(assert (= (and b!1319485 res!875360) b!1319487))

(assert (= (and b!1319495 condMapEmpty!55460) mapIsEmpty!55460))

(assert (= (and b!1319495 (not condMapEmpty!55460)) mapNonEmpty!55460))

(get-info :version)

(assert (= (and mapNonEmpty!55460 ((_ is ValueCellFull!17039) mapValue!55460)) b!1319491))

(assert (= (and b!1319495 ((_ is ValueCellFull!17039) mapDefault!55460)) b!1319488))

(assert (= start!111622 b!1319495))

(declare-fun m!1207385 () Bool)

(assert (=> b!1319493 m!1207385))

(assert (=> b!1319485 m!1207385))

(assert (=> b!1319485 m!1207385))

(declare-fun m!1207387 () Bool)

(assert (=> b!1319485 m!1207387))

(declare-fun m!1207389 () Bool)

(assert (=> b!1319486 m!1207389))

(declare-fun m!1207391 () Bool)

(assert (=> b!1319489 m!1207391))

(assert (=> b!1319489 m!1207391))

(declare-fun m!1207393 () Bool)

(assert (=> b!1319489 m!1207393))

(declare-fun m!1207395 () Bool)

(assert (=> mapNonEmpty!55460 m!1207395))

(declare-fun m!1207397 () Bool)

(assert (=> start!111622 m!1207397))

(declare-fun m!1207399 () Bool)

(assert (=> start!111622 m!1207399))

(declare-fun m!1207401 () Bool)

(assert (=> start!111622 m!1207401))

(declare-fun m!1207403 () Bool)

(assert (=> b!1319494 m!1207403))

(check-sat (not mapNonEmpty!55460) (not b!1319486) (not b_next!30055) (not start!111622) (not b!1319485) b_and!48277 (not b!1319489) (not b!1319494) tp_is_empty!35875)
(check-sat b_and!48277 (not b_next!30055))
