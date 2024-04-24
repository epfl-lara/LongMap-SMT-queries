; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113350 () Bool)

(assert start!113350)

(declare-fun b_free!31177 () Bool)

(declare-fun b_next!31177 () Bool)

(assert (=> start!113350 (= b_free!31177 (not b_next!31177))))

(declare-fun tp!109335 () Bool)

(declare-fun b_and!50263 () Bool)

(assert (=> start!113350 (= tp!109335 b_and!50263)))

(declare-fun b!1342556 () Bool)

(declare-fun res!890310 () Bool)

(declare-fun e!764647 () Bool)

(assert (=> b!1342556 (=> (not res!890310) (not e!764647))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342556 (= res!890310 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342557 () Bool)

(declare-fun res!890309 () Bool)

(assert (=> b!1342557 (=> (not res!890309) (not e!764647))))

(declare-datatypes ((V!54673 0))(
  ( (V!54674 (val!18663 Int)) )
))
(declare-fun minValue!1245 () V!54673)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91327 0))(
  ( (array!91328 (arr!44115 (Array (_ BitVec 32) (_ BitVec 64))) (size!44666 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91327)

(declare-fun zeroValue!1245 () V!54673)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17690 0))(
  ( (ValueCellFull!17690 (v!21306 V!54673)) (EmptyCell!17690) )
))
(declare-datatypes ((array!91329 0))(
  ( (array!91330 (arr!44116 (Array (_ BitVec 32) ValueCell!17690)) (size!44667 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91329)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24084 0))(
  ( (tuple2!24085 (_1!12053 (_ BitVec 64)) (_2!12053 V!54673)) )
))
(declare-datatypes ((List!31239 0))(
  ( (Nil!31236) (Cons!31235 (h!32453 tuple2!24084) (t!45619 List!31239)) )
))
(declare-datatypes ((ListLongMap!21749 0))(
  ( (ListLongMap!21750 (toList!10890 List!31239)) )
))
(declare-fun contains!9078 (ListLongMap!21749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5840 (array!91327 array!91329 (_ BitVec 32) (_ BitVec 32) V!54673 V!54673 (_ BitVec 32) Int) ListLongMap!21749)

(assert (=> b!1342557 (= res!890309 (contains!9078 (getCurrentListMap!5840 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342558 () Bool)

(declare-fun res!890305 () Bool)

(assert (=> b!1342558 (=> (not res!890305) (not e!764647))))

(assert (=> b!1342558 (= res!890305 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44666 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57472 () Bool)

(declare-fun mapRes!57472 () Bool)

(declare-fun tp!109336 () Bool)

(declare-fun e!764648 () Bool)

(assert (=> mapNonEmpty!57472 (= mapRes!57472 (and tp!109336 e!764648))))

(declare-fun mapRest!57472 () (Array (_ BitVec 32) ValueCell!17690))

(declare-fun mapValue!57472 () ValueCell!17690)

(declare-fun mapKey!57472 () (_ BitVec 32))

(assert (=> mapNonEmpty!57472 (= (arr!44116 _values!1303) (store mapRest!57472 mapKey!57472 mapValue!57472))))

(declare-fun b!1342559 () Bool)

(declare-fun res!890311 () Bool)

(assert (=> b!1342559 (=> (not res!890311) (not e!764647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342559 (= res!890311 (validKeyInArray!0 (select (arr!44115 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57472 () Bool)

(assert (=> mapIsEmpty!57472 mapRes!57472))

(declare-fun b!1342560 () Bool)

(declare-fun e!764649 () Bool)

(declare-fun tp_is_empty!37177 () Bool)

(assert (=> b!1342560 (= e!764649 tp_is_empty!37177)))

(declare-fun b!1342561 () Bool)

(declare-fun res!890306 () Bool)

(assert (=> b!1342561 (=> (not res!890306) (not e!764647))))

(declare-datatypes ((List!31240 0))(
  ( (Nil!31237) (Cons!31236 (h!32454 (_ BitVec 64)) (t!45620 List!31240)) )
))
(declare-fun arrayNoDuplicates!0 (array!91327 (_ BitVec 32) List!31240) Bool)

(assert (=> b!1342561 (= res!890306 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31237))))

(declare-fun b!1342562 () Bool)

(declare-fun res!890308 () Bool)

(assert (=> b!1342562 (=> (not res!890308) (not e!764647))))

(assert (=> b!1342562 (= res!890308 (not (= (select (arr!44115 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342564 () Bool)

(declare-fun e!764650 () Bool)

(assert (=> b!1342564 (= e!764650 (and e!764649 mapRes!57472))))

(declare-fun condMapEmpty!57472 () Bool)

(declare-fun mapDefault!57472 () ValueCell!17690)

(assert (=> b!1342564 (= condMapEmpty!57472 (= (arr!44116 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17690)) mapDefault!57472)))))

(declare-fun b!1342565 () Bool)

(assert (=> b!1342565 (= e!764648 tp_is_empty!37177)))

(declare-fun b!1342566 () Bool)

(assert (=> b!1342566 (= e!764647 (not true))))

(declare-fun lt!594592 () ListLongMap!21749)

(assert (=> b!1342566 (contains!9078 lt!594592 k0!1142)))

(declare-datatypes ((Unit!43956 0))(
  ( (Unit!43957) )
))
(declare-fun lt!594593 () Unit!43956)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!334 ((_ BitVec 64) (_ BitVec 64) V!54673 ListLongMap!21749) Unit!43956)

(assert (=> b!1342566 (= lt!594593 (lemmaInListMapAfterAddingDiffThenInBefore!334 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594592))))

(declare-fun +!4808 (ListLongMap!21749 tuple2!24084) ListLongMap!21749)

(declare-fun getCurrentListMapNoExtraKeys!6457 (array!91327 array!91329 (_ BitVec 32) (_ BitVec 32) V!54673 V!54673 (_ BitVec 32) Int) ListLongMap!21749)

(declare-fun get!22276 (ValueCell!17690 V!54673) V!54673)

(declare-fun dynLambda!3762 (Int (_ BitVec 64)) V!54673)

(assert (=> b!1342566 (= lt!594592 (+!4808 (getCurrentListMapNoExtraKeys!6457 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24085 (select (arr!44115 _keys!1571) from!1960) (get!22276 (select (arr!44116 _values!1303) from!1960) (dynLambda!3762 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1342567 () Bool)

(declare-fun res!890312 () Bool)

(assert (=> b!1342567 (=> (not res!890312) (not e!764647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91327 (_ BitVec 32)) Bool)

(assert (=> b!1342567 (= res!890312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!890307 () Bool)

(assert (=> start!113350 (=> (not res!890307) (not e!764647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113350 (= res!890307 (validMask!0 mask!1977))))

(assert (=> start!113350 e!764647))

(assert (=> start!113350 tp_is_empty!37177))

(assert (=> start!113350 true))

(declare-fun array_inv!33525 (array!91327) Bool)

(assert (=> start!113350 (array_inv!33525 _keys!1571)))

(declare-fun array_inv!33526 (array!91329) Bool)

(assert (=> start!113350 (and (array_inv!33526 _values!1303) e!764650)))

(assert (=> start!113350 tp!109335))

(declare-fun b!1342563 () Bool)

(declare-fun res!890304 () Bool)

(assert (=> b!1342563 (=> (not res!890304) (not e!764647))))

(assert (=> b!1342563 (= res!890304 (and (= (size!44667 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44666 _keys!1571) (size!44667 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113350 res!890307) b!1342563))

(assert (= (and b!1342563 res!890304) b!1342567))

(assert (= (and b!1342567 res!890312) b!1342561))

(assert (= (and b!1342561 res!890306) b!1342558))

(assert (= (and b!1342558 res!890305) b!1342557))

(assert (= (and b!1342557 res!890309) b!1342562))

(assert (= (and b!1342562 res!890308) b!1342559))

(assert (= (and b!1342559 res!890311) b!1342556))

(assert (= (and b!1342556 res!890310) b!1342566))

(assert (= (and b!1342564 condMapEmpty!57472) mapIsEmpty!57472))

(assert (= (and b!1342564 (not condMapEmpty!57472)) mapNonEmpty!57472))

(get-info :version)

(assert (= (and mapNonEmpty!57472 ((_ is ValueCellFull!17690) mapValue!57472)) b!1342565))

(assert (= (and b!1342564 ((_ is ValueCellFull!17690) mapDefault!57472)) b!1342560))

(assert (= start!113350 b!1342564))

(declare-fun b_lambda!24347 () Bool)

(assert (=> (not b_lambda!24347) (not b!1342566)))

(declare-fun t!45618 () Bool)

(declare-fun tb!12183 () Bool)

(assert (=> (and start!113350 (= defaultEntry!1306 defaultEntry!1306) t!45618) tb!12183))

(declare-fun result!25465 () Bool)

(assert (=> tb!12183 (= result!25465 tp_is_empty!37177)))

(assert (=> b!1342566 t!45618))

(declare-fun b_and!50265 () Bool)

(assert (= b_and!50263 (and (=> t!45618 result!25465) b_and!50265)))

(declare-fun m!1230525 () Bool)

(assert (=> b!1342566 m!1230525))

(assert (=> b!1342566 m!1230525))

(declare-fun m!1230527 () Bool)

(assert (=> b!1342566 m!1230527))

(declare-fun m!1230529 () Bool)

(assert (=> b!1342566 m!1230529))

(declare-fun m!1230531 () Bool)

(assert (=> b!1342566 m!1230531))

(declare-fun m!1230533 () Bool)

(assert (=> b!1342566 m!1230533))

(declare-fun m!1230535 () Bool)

(assert (=> b!1342566 m!1230535))

(declare-fun m!1230537 () Bool)

(assert (=> b!1342566 m!1230537))

(assert (=> b!1342566 m!1230529))

(assert (=> b!1342566 m!1230533))

(declare-fun m!1230539 () Bool)

(assert (=> b!1342566 m!1230539))

(declare-fun m!1230541 () Bool)

(assert (=> b!1342557 m!1230541))

(assert (=> b!1342557 m!1230541))

(declare-fun m!1230543 () Bool)

(assert (=> b!1342557 m!1230543))

(assert (=> b!1342562 m!1230535))

(declare-fun m!1230545 () Bool)

(assert (=> start!113350 m!1230545))

(declare-fun m!1230547 () Bool)

(assert (=> start!113350 m!1230547))

(declare-fun m!1230549 () Bool)

(assert (=> start!113350 m!1230549))

(assert (=> b!1342559 m!1230535))

(assert (=> b!1342559 m!1230535))

(declare-fun m!1230551 () Bool)

(assert (=> b!1342559 m!1230551))

(declare-fun m!1230553 () Bool)

(assert (=> b!1342561 m!1230553))

(declare-fun m!1230555 () Bool)

(assert (=> b!1342567 m!1230555))

(declare-fun m!1230557 () Bool)

(assert (=> mapNonEmpty!57472 m!1230557))

(check-sat (not b_next!31177) (not start!113350) (not b_lambda!24347) (not b!1342559) (not b!1342557) (not b!1342567) (not mapNonEmpty!57472) (not b!1342561) (not b!1342566) b_and!50265 tp_is_empty!37177)
(check-sat b_and!50265 (not b_next!31177))
