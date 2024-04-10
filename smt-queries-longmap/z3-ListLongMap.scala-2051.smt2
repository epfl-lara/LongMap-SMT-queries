; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35476 () Bool)

(assert start!35476)

(declare-fun b_free!7863 () Bool)

(declare-fun b_next!7863 () Bool)

(assert (=> start!35476 (= b_free!7863 (not b_next!7863))))

(declare-fun tp!27374 () Bool)

(declare-fun b_and!15105 () Bool)

(assert (=> start!35476 (= tp!27374 b_and!15105)))

(declare-fun b!355532 () Bool)

(declare-fun res!197256 () Bool)

(declare-fun e!217762 () Bool)

(assert (=> b!355532 (=> (not res!197256) (not e!217762))))

(declare-datatypes ((array!19437 0))(
  ( (array!19438 (arr!9212 (Array (_ BitVec 32) (_ BitVec 64))) (size!9564 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19437)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355532 (= res!197256 (validKeyInArray!0 (select (arr!9212 _keys!1456) from!1805)))))

(declare-fun b!355533 () Bool)

(declare-fun res!197255 () Bool)

(assert (=> b!355533 (=> (not res!197255) (not e!217762))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19437 (_ BitVec 32)) Bool)

(assert (=> b!355533 (= res!197255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355535 () Bool)

(assert (=> b!355535 (= e!217762 (not (bvsle #b00000000000000000000000000000000 (size!9564 _keys!1456))))))

(declare-datatypes ((V!11549 0))(
  ( (V!11550 (val!4009 Int)) )
))
(declare-fun minValue!1150 () V!11549)

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((ValueCell!3621 0))(
  ( (ValueCellFull!3621 (v!6203 V!11549)) (EmptyCell!3621) )
))
(declare-datatypes ((array!19439 0))(
  ( (array!19440 (arr!9213 (Array (_ BitVec 32) ValueCell!3621)) (size!9565 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19439)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11549)

(declare-datatypes ((tuple2!5696 0))(
  ( (tuple2!5697 (_1!2859 (_ BitVec 64)) (_2!2859 V!11549)) )
))
(declare-datatypes ((List!5339 0))(
  ( (Nil!5336) (Cons!5335 (h!6191 tuple2!5696) (t!10489 List!5339)) )
))
(declare-datatypes ((ListLongMap!4609 0))(
  ( (ListLongMap!4610 (toList!2320 List!5339)) )
))
(declare-fun contains!2400 (ListLongMap!4609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1841 (array!19437 array!19439 (_ BitVec 32) (_ BitVec 32) V!11549 V!11549 (_ BitVec 32) Int) ListLongMap!4609)

(assert (=> b!355535 (contains!2400 (getCurrentListMap!1841 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9212 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10962 0))(
  ( (Unit!10963) )
))
(declare-fun lt!165809 () Unit!10962)

(declare-fun lemmaValidKeyInArrayIsInListMap!198 (array!19437 array!19439 (_ BitVec 32) (_ BitVec 32) V!11549 V!11549 (_ BitVec 32) Int) Unit!10962)

(assert (=> b!355535 (= lt!165809 (lemmaValidKeyInArrayIsInListMap!198 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355536 () Bool)

(declare-fun res!197258 () Bool)

(assert (=> b!355536 (=> (not res!197258) (not e!217762))))

(assert (=> b!355536 (= res!197258 (and (= (size!9565 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9564 _keys!1456) (size!9565 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355537 () Bool)

(declare-fun e!217766 () Bool)

(declare-fun tp_is_empty!7929 () Bool)

(assert (=> b!355537 (= e!217766 tp_is_empty!7929)))

(declare-fun mapNonEmpty!13401 () Bool)

(declare-fun mapRes!13401 () Bool)

(declare-fun tp!27375 () Bool)

(assert (=> mapNonEmpty!13401 (= mapRes!13401 (and tp!27375 e!217766))))

(declare-fun mapKey!13401 () (_ BitVec 32))

(declare-fun mapRest!13401 () (Array (_ BitVec 32) ValueCell!3621))

(declare-fun mapValue!13401 () ValueCell!3621)

(assert (=> mapNonEmpty!13401 (= (arr!9213 _values!1208) (store mapRest!13401 mapKey!13401 mapValue!13401))))

(declare-fun b!355538 () Bool)

(declare-fun res!197263 () Bool)

(assert (=> b!355538 (=> (not res!197263) (not e!217762))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!355538 (= res!197263 (= (select (arr!9212 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355539 () Bool)

(declare-fun e!217764 () Bool)

(declare-fun e!217763 () Bool)

(assert (=> b!355539 (= e!217764 (and e!217763 mapRes!13401))))

(declare-fun condMapEmpty!13401 () Bool)

(declare-fun mapDefault!13401 () ValueCell!3621)

(assert (=> b!355539 (= condMapEmpty!13401 (= (arr!9213 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3621)) mapDefault!13401)))))

(declare-fun b!355540 () Bool)

(declare-fun res!197260 () Bool)

(assert (=> b!355540 (=> (not res!197260) (not e!217762))))

(declare-fun arrayContainsKey!0 (array!19437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355540 (= res!197260 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355534 () Bool)

(declare-fun res!197259 () Bool)

(assert (=> b!355534 (=> (not res!197259) (not e!217762))))

(declare-datatypes ((List!5340 0))(
  ( (Nil!5337) (Cons!5336 (h!6192 (_ BitVec 64)) (t!10490 List!5340)) )
))
(declare-fun arrayNoDuplicates!0 (array!19437 (_ BitVec 32) List!5340) Bool)

(assert (=> b!355534 (= res!197259 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5337))))

(declare-fun res!197261 () Bool)

(assert (=> start!35476 (=> (not res!197261) (not e!217762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35476 (= res!197261 (validMask!0 mask!1842))))

(assert (=> start!35476 e!217762))

(assert (=> start!35476 tp_is_empty!7929))

(assert (=> start!35476 true))

(assert (=> start!35476 tp!27374))

(declare-fun array_inv!6768 (array!19437) Bool)

(assert (=> start!35476 (array_inv!6768 _keys!1456)))

(declare-fun array_inv!6769 (array!19439) Bool)

(assert (=> start!35476 (and (array_inv!6769 _values!1208) e!217764)))

(declare-fun b!355541 () Bool)

(declare-fun res!197262 () Bool)

(assert (=> b!355541 (=> (not res!197262) (not e!217762))))

(assert (=> b!355541 (= res!197262 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9564 _keys!1456))))))

(declare-fun b!355542 () Bool)

(assert (=> b!355542 (= e!217763 tp_is_empty!7929)))

(declare-fun b!355543 () Bool)

(declare-fun res!197257 () Bool)

(assert (=> b!355543 (=> (not res!197257) (not e!217762))))

(assert (=> b!355543 (= res!197257 (validKeyInArray!0 k0!1077))))

(declare-fun mapIsEmpty!13401 () Bool)

(assert (=> mapIsEmpty!13401 mapRes!13401))

(assert (= (and start!35476 res!197261) b!355536))

(assert (= (and b!355536 res!197258) b!355533))

(assert (= (and b!355533 res!197255) b!355534))

(assert (= (and b!355534 res!197259) b!355543))

(assert (= (and b!355543 res!197257) b!355541))

(assert (= (and b!355541 res!197262) b!355540))

(assert (= (and b!355540 res!197260) b!355538))

(assert (= (and b!355538 res!197263) b!355532))

(assert (= (and b!355532 res!197256) b!355535))

(assert (= (and b!355539 condMapEmpty!13401) mapIsEmpty!13401))

(assert (= (and b!355539 (not condMapEmpty!13401)) mapNonEmpty!13401))

(get-info :version)

(assert (= (and mapNonEmpty!13401 ((_ is ValueCellFull!3621) mapValue!13401)) b!355537))

(assert (= (and b!355539 ((_ is ValueCellFull!3621) mapDefault!13401)) b!355542))

(assert (= start!35476 b!355539))

(declare-fun m!354225 () Bool)

(assert (=> b!355543 m!354225))

(declare-fun m!354227 () Bool)

(assert (=> b!355535 m!354227))

(declare-fun m!354229 () Bool)

(assert (=> b!355535 m!354229))

(assert (=> b!355535 m!354227))

(assert (=> b!355535 m!354229))

(declare-fun m!354231 () Bool)

(assert (=> b!355535 m!354231))

(declare-fun m!354233 () Bool)

(assert (=> b!355535 m!354233))

(declare-fun m!354235 () Bool)

(assert (=> mapNonEmpty!13401 m!354235))

(declare-fun m!354237 () Bool)

(assert (=> b!355534 m!354237))

(declare-fun m!354239 () Bool)

(assert (=> b!355533 m!354239))

(assert (=> b!355532 m!354229))

(assert (=> b!355532 m!354229))

(declare-fun m!354241 () Bool)

(assert (=> b!355532 m!354241))

(declare-fun m!354243 () Bool)

(assert (=> b!355540 m!354243))

(assert (=> b!355538 m!354229))

(declare-fun m!354245 () Bool)

(assert (=> start!35476 m!354245))

(declare-fun m!354247 () Bool)

(assert (=> start!35476 m!354247))

(declare-fun m!354249 () Bool)

(assert (=> start!35476 m!354249))

(check-sat b_and!15105 (not b!355540) (not b!355535) (not b!355534) (not b_next!7863) (not b!355532) (not mapNonEmpty!13401) (not b!355533) (not b!355543) tp_is_empty!7929 (not start!35476))
(check-sat b_and!15105 (not b_next!7863))
