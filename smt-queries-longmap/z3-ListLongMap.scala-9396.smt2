; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111872 () Bool)

(assert start!111872)

(declare-fun b_free!30471 () Bool)

(declare-fun b_next!30471 () Bool)

(assert (=> start!111872 (= b_free!30471 (not b_next!30471))))

(declare-fun tp!106892 () Bool)

(declare-fun b_and!49037 () Bool)

(assert (=> start!111872 (= tp!106892 b_and!49037)))

(declare-fun b!1325523 () Bool)

(declare-fun res!879729 () Bool)

(declare-fun e!755630 () Bool)

(assert (=> b!1325523 (=> (not res!879729) (not e!755630))))

(declare-datatypes ((array!89490 0))(
  ( (array!89491 (arr!43218 (Array (_ BitVec 32) (_ BitVec 64))) (size!43768 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89490)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325523 (= res!879729 (validKeyInArray!0 (select (arr!43218 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!56088 () Bool)

(declare-fun mapRes!56088 () Bool)

(assert (=> mapIsEmpty!56088 mapRes!56088))

(declare-fun b!1325524 () Bool)

(assert (=> b!1325524 (= e!755630 (not true))))

(declare-datatypes ((V!53491 0))(
  ( (V!53492 (val!18220 Int)) )
))
(declare-datatypes ((tuple2!23498 0))(
  ( (tuple2!23499 (_1!11760 (_ BitVec 64)) (_2!11760 V!53491)) )
))
(declare-datatypes ((List!30638 0))(
  ( (Nil!30635) (Cons!30634 (h!31843 tuple2!23498) (t!44580 List!30638)) )
))
(declare-datatypes ((ListLongMap!21155 0))(
  ( (ListLongMap!21156 (toList!10593 List!30638)) )
))
(declare-fun lt!589796 () ListLongMap!21155)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8750 (ListLongMap!21155 (_ BitVec 64)) Bool)

(assert (=> b!1325524 (contains!8750 lt!589796 k0!1164)))

(declare-fun minValue!1279 () V!53491)

(declare-datatypes ((Unit!43660 0))(
  ( (Unit!43661) )
))
(declare-fun lt!589797 () Unit!43660)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!208 ((_ BitVec 64) (_ BitVec 64) V!53491 ListLongMap!21155) Unit!43660)

(assert (=> b!1325524 (= lt!589797 (lemmaInListMapAfterAddingDiffThenInBefore!208 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589796))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53491)

(declare-datatypes ((ValueCell!17247 0))(
  ( (ValueCellFull!17247 (v!20853 V!53491)) (EmptyCell!17247) )
))
(declare-datatypes ((array!89492 0))(
  ( (array!89493 (arr!43219 (Array (_ BitVec 32) ValueCell!17247)) (size!43769 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89492)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun +!4616 (ListLongMap!21155 tuple2!23498) ListLongMap!21155)

(declare-fun getCurrentListMapNoExtraKeys!6254 (array!89490 array!89492 (_ BitVec 32) (_ BitVec 32) V!53491 V!53491 (_ BitVec 32) Int) ListLongMap!21155)

(declare-fun get!21767 (ValueCell!17247 V!53491) V!53491)

(declare-fun dynLambda!3555 (Int (_ BitVec 64)) V!53491)

(assert (=> b!1325524 (= lt!589796 (+!4616 (+!4616 (getCurrentListMapNoExtraKeys!6254 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23499 (select (arr!43218 _keys!1609) from!2000) (get!21767 (select (arr!43219 _values!1337) from!2000) (dynLambda!3555 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1325525 () Bool)

(declare-fun res!879731 () Bool)

(assert (=> b!1325525 (=> (not res!879731) (not e!755630))))

(declare-datatypes ((List!30639 0))(
  ( (Nil!30636) (Cons!30635 (h!31844 (_ BitVec 64)) (t!44581 List!30639)) )
))
(declare-fun arrayNoDuplicates!0 (array!89490 (_ BitVec 32) List!30639) Bool)

(assert (=> b!1325525 (= res!879731 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30636))))

(declare-fun b!1325526 () Bool)

(declare-fun res!879733 () Bool)

(assert (=> b!1325526 (=> (not res!879733) (not e!755630))))

(assert (=> b!1325526 (= res!879733 (not (= (select (arr!43218 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325527 () Bool)

(declare-fun e!755632 () Bool)

(declare-fun tp_is_empty!36291 () Bool)

(assert (=> b!1325527 (= e!755632 tp_is_empty!36291)))

(declare-fun b!1325529 () Bool)

(declare-fun e!755629 () Bool)

(declare-fun e!755631 () Bool)

(assert (=> b!1325529 (= e!755629 (and e!755631 mapRes!56088))))

(declare-fun condMapEmpty!56088 () Bool)

(declare-fun mapDefault!56088 () ValueCell!17247)

(assert (=> b!1325529 (= condMapEmpty!56088 (= (arr!43219 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17247)) mapDefault!56088)))))

(declare-fun b!1325530 () Bool)

(declare-fun res!879735 () Bool)

(assert (=> b!1325530 (=> (not res!879735) (not e!755630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89490 (_ BitVec 32)) Bool)

(assert (=> b!1325530 (= res!879735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325531 () Bool)

(declare-fun res!879734 () Bool)

(assert (=> b!1325531 (=> (not res!879734) (not e!755630))))

(assert (=> b!1325531 (= res!879734 (and (= (size!43769 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43768 _keys!1609) (size!43769 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325532 () Bool)

(assert (=> b!1325532 (= e!755631 tp_is_empty!36291)))

(declare-fun b!1325533 () Bool)

(declare-fun res!879730 () Bool)

(assert (=> b!1325533 (=> (not res!879730) (not e!755630))))

(assert (=> b!1325533 (= res!879730 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43768 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56088 () Bool)

(declare-fun tp!106893 () Bool)

(assert (=> mapNonEmpty!56088 (= mapRes!56088 (and tp!106893 e!755632))))

(declare-fun mapKey!56088 () (_ BitVec 32))

(declare-fun mapValue!56088 () ValueCell!17247)

(declare-fun mapRest!56088 () (Array (_ BitVec 32) ValueCell!17247))

(assert (=> mapNonEmpty!56088 (= (arr!43219 _values!1337) (store mapRest!56088 mapKey!56088 mapValue!56088))))

(declare-fun res!879732 () Bool)

(assert (=> start!111872 (=> (not res!879732) (not e!755630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111872 (= res!879732 (validMask!0 mask!2019))))

(assert (=> start!111872 e!755630))

(declare-fun array_inv!32623 (array!89490) Bool)

(assert (=> start!111872 (array_inv!32623 _keys!1609)))

(assert (=> start!111872 true))

(assert (=> start!111872 tp_is_empty!36291))

(declare-fun array_inv!32624 (array!89492) Bool)

(assert (=> start!111872 (and (array_inv!32624 _values!1337) e!755629)))

(assert (=> start!111872 tp!106892))

(declare-fun b!1325528 () Bool)

(declare-fun res!879736 () Bool)

(assert (=> b!1325528 (=> (not res!879736) (not e!755630))))

(declare-fun getCurrentListMap!5589 (array!89490 array!89492 (_ BitVec 32) (_ BitVec 32) V!53491 V!53491 (_ BitVec 32) Int) ListLongMap!21155)

(assert (=> b!1325528 (= res!879736 (contains!8750 (getCurrentListMap!5589 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111872 res!879732) b!1325531))

(assert (= (and b!1325531 res!879734) b!1325530))

(assert (= (and b!1325530 res!879735) b!1325525))

(assert (= (and b!1325525 res!879731) b!1325533))

(assert (= (and b!1325533 res!879730) b!1325528))

(assert (= (and b!1325528 res!879736) b!1325526))

(assert (= (and b!1325526 res!879733) b!1325523))

(assert (= (and b!1325523 res!879729) b!1325524))

(assert (= (and b!1325529 condMapEmpty!56088) mapIsEmpty!56088))

(assert (= (and b!1325529 (not condMapEmpty!56088)) mapNonEmpty!56088))

(get-info :version)

(assert (= (and mapNonEmpty!56088 ((_ is ValueCellFull!17247) mapValue!56088)) b!1325527))

(assert (= (and b!1325529 ((_ is ValueCellFull!17247) mapDefault!56088)) b!1325532))

(assert (= start!111872 b!1325529))

(declare-fun b_lambda!23749 () Bool)

(assert (=> (not b_lambda!23749) (not b!1325524)))

(declare-fun t!44579 () Bool)

(declare-fun tb!11745 () Bool)

(assert (=> (and start!111872 (= defaultEntry!1340 defaultEntry!1340) t!44579) tb!11745))

(declare-fun result!24547 () Bool)

(assert (=> tb!11745 (= result!24547 tp_is_empty!36291)))

(assert (=> b!1325524 t!44579))

(declare-fun b_and!49039 () Bool)

(assert (= b_and!49037 (and (=> t!44579 result!24547) b_and!49039)))

(declare-fun m!1214413 () Bool)

(assert (=> b!1325526 m!1214413))

(declare-fun m!1214415 () Bool)

(assert (=> b!1325524 m!1214415))

(declare-fun m!1214417 () Bool)

(assert (=> b!1325524 m!1214417))

(declare-fun m!1214419 () Bool)

(assert (=> b!1325524 m!1214419))

(assert (=> b!1325524 m!1214417))

(declare-fun m!1214421 () Bool)

(assert (=> b!1325524 m!1214421))

(declare-fun m!1214423 () Bool)

(assert (=> b!1325524 m!1214423))

(declare-fun m!1214425 () Bool)

(assert (=> b!1325524 m!1214425))

(assert (=> b!1325524 m!1214421))

(declare-fun m!1214427 () Bool)

(assert (=> b!1325524 m!1214427))

(assert (=> b!1325524 m!1214425))

(assert (=> b!1325524 m!1214419))

(declare-fun m!1214429 () Bool)

(assert (=> b!1325524 m!1214429))

(assert (=> b!1325524 m!1214413))

(declare-fun m!1214431 () Bool)

(assert (=> b!1325525 m!1214431))

(declare-fun m!1214433 () Bool)

(assert (=> start!111872 m!1214433))

(declare-fun m!1214435 () Bool)

(assert (=> start!111872 m!1214435))

(declare-fun m!1214437 () Bool)

(assert (=> start!111872 m!1214437))

(declare-fun m!1214439 () Bool)

(assert (=> b!1325530 m!1214439))

(assert (=> b!1325523 m!1214413))

(assert (=> b!1325523 m!1214413))

(declare-fun m!1214441 () Bool)

(assert (=> b!1325523 m!1214441))

(declare-fun m!1214443 () Bool)

(assert (=> b!1325528 m!1214443))

(assert (=> b!1325528 m!1214443))

(declare-fun m!1214445 () Bool)

(assert (=> b!1325528 m!1214445))

(declare-fun m!1214447 () Bool)

(assert (=> mapNonEmpty!56088 m!1214447))

(check-sat (not b!1325523) (not b_lambda!23749) (not b!1325525) (not mapNonEmpty!56088) tp_is_empty!36291 (not start!111872) (not b!1325524) (not b_next!30471) (not b!1325528) (not b!1325530) b_and!49039)
(check-sat b_and!49039 (not b_next!30471))
