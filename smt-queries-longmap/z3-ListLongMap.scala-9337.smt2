; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111682 () Bool)

(assert start!111682)

(declare-fun b_free!30115 () Bool)

(declare-fun b_next!30115 () Bool)

(assert (=> start!111682 (= b_free!30115 (not b_next!30115))))

(declare-fun tp!105820 () Bool)

(declare-fun b_and!48391 () Bool)

(assert (=> start!111682 (= tp!105820 b_and!48391)))

(declare-fun b!1320529 () Bool)

(declare-fun res!876077 () Bool)

(declare-fun e!753546 () Bool)

(assert (=> b!1320529 (=> (not res!876077) (not e!753546))))

(declare-datatypes ((array!88883 0))(
  ( (array!88884 (arr!42911 (Array (_ BitVec 32) (_ BitVec 64))) (size!43462 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88883)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320529 (= res!876077 (validKeyInArray!0 (select (arr!42911 _keys!1609) from!2000)))))

(declare-fun b!1320530 () Bool)

(declare-fun res!876082 () Bool)

(assert (=> b!1320530 (=> (not res!876082) (not e!753546))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88883 (_ BitVec 32)) Bool)

(assert (=> b!1320530 (= res!876082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320531 () Bool)

(declare-fun res!876078 () Bool)

(assert (=> b!1320531 (=> (not res!876078) (not e!753546))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53017 0))(
  ( (V!53018 (val!18042 Int)) )
))
(declare-fun zeroValue!1279 () V!53017)

(declare-datatypes ((ValueCell!17069 0))(
  ( (ValueCellFull!17069 (v!20667 V!53017)) (EmptyCell!17069) )
))
(declare-datatypes ((array!88885 0))(
  ( (array!88886 (arr!42912 (Array (_ BitVec 32) ValueCell!17069)) (size!43463 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88885)

(declare-fun minValue!1279 () V!53017)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23256 0))(
  ( (tuple2!23257 (_1!11639 (_ BitVec 64)) (_2!11639 V!53017)) )
))
(declare-datatypes ((List!30414 0))(
  ( (Nil!30411) (Cons!30410 (h!31628 tuple2!23256) (t!44070 List!30414)) )
))
(declare-datatypes ((ListLongMap!20921 0))(
  ( (ListLongMap!20922 (toList!10476 List!30414)) )
))
(declare-fun contains!8643 (ListLongMap!20921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5475 (array!88883 array!88885 (_ BitVec 32) (_ BitVec 32) V!53017 V!53017 (_ BitVec 32) Int) ListLongMap!20921)

(assert (=> b!1320531 (= res!876078 (contains!8643 (getCurrentListMap!5475 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320532 () Bool)

(declare-fun res!876081 () Bool)

(assert (=> b!1320532 (=> (not res!876081) (not e!753546))))

(assert (=> b!1320532 (= res!876081 (not (= (select (arr!42911 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320533 () Bool)

(declare-fun e!753547 () Bool)

(declare-fun tp_is_empty!35935 () Bool)

(assert (=> b!1320533 (= e!753547 tp_is_empty!35935)))

(declare-fun b!1320534 () Bool)

(declare-fun res!876075 () Bool)

(assert (=> b!1320534 (=> (not res!876075) (not e!753546))))

(declare-datatypes ((List!30415 0))(
  ( (Nil!30412) (Cons!30411 (h!31629 (_ BitVec 64)) (t!44071 List!30415)) )
))
(declare-fun arrayNoDuplicates!0 (array!88883 (_ BitVec 32) List!30415) Bool)

(assert (=> b!1320534 (= res!876075 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30412))))

(declare-fun mapIsEmpty!55550 () Bool)

(declare-fun mapRes!55550 () Bool)

(assert (=> mapIsEmpty!55550 mapRes!55550))

(declare-fun b!1320535 () Bool)

(declare-fun res!876076 () Bool)

(assert (=> b!1320535 (=> (not res!876076) (not e!753546))))

(assert (=> b!1320535 (= res!876076 (and (= (size!43463 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43462 _keys!1609) (size!43463 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320536 () Bool)

(declare-fun res!876080 () Bool)

(assert (=> b!1320536 (=> (not res!876080) (not e!753546))))

(assert (=> b!1320536 (= res!876080 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43462 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55550 () Bool)

(declare-fun tp!105821 () Bool)

(assert (=> mapNonEmpty!55550 (= mapRes!55550 (and tp!105821 e!753547))))

(declare-fun mapValue!55550 () ValueCell!17069)

(declare-fun mapRest!55550 () (Array (_ BitVec 32) ValueCell!17069))

(declare-fun mapKey!55550 () (_ BitVec 32))

(assert (=> mapNonEmpty!55550 (= (arr!42912 _values!1337) (store mapRest!55550 mapKey!55550 mapValue!55550))))

(declare-fun b!1320537 () Bool)

(declare-fun e!753545 () Bool)

(assert (=> b!1320537 (= e!753545 tp_is_empty!35935)))

(declare-fun b!1320538 () Bool)

(assert (=> b!1320538 (= e!753546 (not true))))

(declare-fun lt!587081 () ListLongMap!20921)

(assert (=> b!1320538 (contains!8643 lt!587081 k0!1164)))

(declare-datatypes ((Unit!43415 0))(
  ( (Unit!43416) )
))
(declare-fun lt!587080 () Unit!43415)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!119 ((_ BitVec 64) (_ BitVec 64) V!53017 ListLongMap!20921) Unit!43415)

(assert (=> b!1320538 (= lt!587080 (lemmaInListMapAfterAddingDiffThenInBefore!119 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587081))))

(declare-fun +!4564 (ListLongMap!20921 tuple2!23256) ListLongMap!20921)

(declare-fun getCurrentListMapNoExtraKeys!6203 (array!88883 array!88885 (_ BitVec 32) (_ BitVec 32) V!53017 V!53017 (_ BitVec 32) Int) ListLongMap!20921)

(declare-fun get!21597 (ValueCell!17069 V!53017) V!53017)

(declare-fun dynLambda!3518 (Int (_ BitVec 64)) V!53017)

(assert (=> b!1320538 (= lt!587081 (+!4564 (+!4564 (getCurrentListMapNoExtraKeys!6203 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23257 (select (arr!42911 _keys!1609) from!2000) (get!21597 (select (arr!42912 _values!1337) from!2000) (dynLambda!3518 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23257 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun res!876079 () Bool)

(assert (=> start!111682 (=> (not res!876079) (not e!753546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111682 (= res!876079 (validMask!0 mask!2019))))

(assert (=> start!111682 e!753546))

(declare-fun array_inv!32671 (array!88883) Bool)

(assert (=> start!111682 (array_inv!32671 _keys!1609)))

(assert (=> start!111682 true))

(assert (=> start!111682 tp_is_empty!35935))

(declare-fun e!753543 () Bool)

(declare-fun array_inv!32672 (array!88885) Bool)

(assert (=> start!111682 (and (array_inv!32672 _values!1337) e!753543)))

(assert (=> start!111682 tp!105820))

(declare-fun b!1320539 () Bool)

(assert (=> b!1320539 (= e!753543 (and e!753545 mapRes!55550))))

(declare-fun condMapEmpty!55550 () Bool)

(declare-fun mapDefault!55550 () ValueCell!17069)

(assert (=> b!1320539 (= condMapEmpty!55550 (= (arr!42912 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17069)) mapDefault!55550)))))

(assert (= (and start!111682 res!876079) b!1320535))

(assert (= (and b!1320535 res!876076) b!1320530))

(assert (= (and b!1320530 res!876082) b!1320534))

(assert (= (and b!1320534 res!876075) b!1320536))

(assert (= (and b!1320536 res!876080) b!1320531))

(assert (= (and b!1320531 res!876078) b!1320532))

(assert (= (and b!1320532 res!876081) b!1320529))

(assert (= (and b!1320529 res!876077) b!1320538))

(assert (= (and b!1320539 condMapEmpty!55550) mapIsEmpty!55550))

(assert (= (and b!1320539 (not condMapEmpty!55550)) mapNonEmpty!55550))

(get-info :version)

(assert (= (and mapNonEmpty!55550 ((_ is ValueCellFull!17069) mapValue!55550)) b!1320533))

(assert (= (and b!1320539 ((_ is ValueCellFull!17069) mapDefault!55550)) b!1320537))

(assert (= start!111682 b!1320539))

(declare-fun b_lambda!23435 () Bool)

(assert (=> (not b_lambda!23435) (not b!1320538)))

(declare-fun t!44069 () Bool)

(declare-fun tb!11459 () Bool)

(assert (=> (and start!111682 (= defaultEntry!1340 defaultEntry!1340) t!44069) tb!11459))

(declare-fun result!23981 () Bool)

(assert (=> tb!11459 (= result!23981 tp_is_empty!35935)))

(assert (=> b!1320538 t!44069))

(declare-fun b_and!48393 () Bool)

(assert (= b_and!48391 (and (=> t!44069 result!23981) b_and!48393)))

(declare-fun m!1208417 () Bool)

(assert (=> b!1320530 m!1208417))

(declare-fun m!1208419 () Bool)

(assert (=> b!1320538 m!1208419))

(declare-fun m!1208421 () Bool)

(assert (=> b!1320538 m!1208421))

(assert (=> b!1320538 m!1208419))

(declare-fun m!1208423 () Bool)

(assert (=> b!1320538 m!1208423))

(declare-fun m!1208425 () Bool)

(assert (=> b!1320538 m!1208425))

(assert (=> b!1320538 m!1208423))

(declare-fun m!1208427 () Bool)

(assert (=> b!1320538 m!1208427))

(declare-fun m!1208429 () Bool)

(assert (=> b!1320538 m!1208429))

(assert (=> b!1320538 m!1208421))

(declare-fun m!1208431 () Bool)

(assert (=> b!1320538 m!1208431))

(declare-fun m!1208433 () Bool)

(assert (=> b!1320538 m!1208433))

(assert (=> b!1320538 m!1208429))

(declare-fun m!1208435 () Bool)

(assert (=> b!1320538 m!1208435))

(assert (=> b!1320529 m!1208433))

(assert (=> b!1320529 m!1208433))

(declare-fun m!1208437 () Bool)

(assert (=> b!1320529 m!1208437))

(assert (=> b!1320532 m!1208433))

(declare-fun m!1208439 () Bool)

(assert (=> b!1320531 m!1208439))

(assert (=> b!1320531 m!1208439))

(declare-fun m!1208441 () Bool)

(assert (=> b!1320531 m!1208441))

(declare-fun m!1208443 () Bool)

(assert (=> start!111682 m!1208443))

(declare-fun m!1208445 () Bool)

(assert (=> start!111682 m!1208445))

(declare-fun m!1208447 () Bool)

(assert (=> start!111682 m!1208447))

(declare-fun m!1208449 () Bool)

(assert (=> b!1320534 m!1208449))

(declare-fun m!1208451 () Bool)

(assert (=> mapNonEmpty!55550 m!1208451))

(check-sat (not b_lambda!23435) (not b!1320530) (not b!1320529) (not b!1320534) (not start!111682) (not b!1320531) (not mapNonEmpty!55550) b_and!48393 tp_is_empty!35935 (not b_next!30115) (not b!1320538))
(check-sat b_and!48393 (not b_next!30115))
