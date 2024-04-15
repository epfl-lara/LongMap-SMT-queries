; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133586 () Bool)

(assert start!133586)

(declare-fun b_free!32053 () Bool)

(declare-fun b_next!32053 () Bool)

(assert (=> start!133586 (= b_free!32053 (not b_next!32053))))

(declare-fun tp!113283 () Bool)

(declare-fun b_and!51599 () Bool)

(assert (=> start!133586 (= tp!113283 b_and!51599)))

(declare-fun b!1562240 () Bool)

(declare-fun e!870535 () Bool)

(assert (=> b!1562240 (= e!870535 (not true))))

(declare-fun lt!671437 () Bool)

(declare-datatypes ((V!59833 0))(
  ( (V!59834 (val!19443 Int)) )
))
(declare-datatypes ((tuple2!25190 0))(
  ( (tuple2!25191 (_1!12606 (_ BitVec 64)) (_2!12606 V!59833)) )
))
(declare-datatypes ((List!36531 0))(
  ( (Nil!36528) (Cons!36527 (h!37974 tuple2!25190) (t!51366 List!36531)) )
))
(declare-datatypes ((ListLongMap!22625 0))(
  ( (ListLongMap!22626 (toList!11328 List!36531)) )
))
(declare-fun lt!671436 () ListLongMap!22625)

(declare-fun contains!10238 (ListLongMap!22625 (_ BitVec 64)) Bool)

(assert (=> b!1562240 (= lt!671437 (contains!10238 lt!671436 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562240 (not (contains!10238 lt!671436 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671435 () ListLongMap!22625)

(declare-datatypes ((array!104066 0))(
  ( (array!104067 (arr!50226 (Array (_ BitVec 32) (_ BitVec 64))) (size!50778 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104066)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!671434 () V!59833)

(declare-fun +!5093 (ListLongMap!22625 tuple2!25190) ListLongMap!22625)

(assert (=> b!1562240 (= lt!671436 (+!5093 lt!671435 (tuple2!25191 (select (arr!50226 _keys!637) from!782) lt!671434)))))

(declare-datatypes ((Unit!51794 0))(
  ( (Unit!51795) )
))
(declare-fun lt!671438 () Unit!51794)

(declare-fun addStillNotContains!540 (ListLongMap!22625 (_ BitVec 64) V!59833 (_ BitVec 64)) Unit!51794)

(assert (=> b!1562240 (= lt!671438 (addStillNotContains!540 lt!671435 (select (arr!50226 _keys!637) from!782) lt!671434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18329 0))(
  ( (ValueCellFull!18329 (v!22191 V!59833)) (EmptyCell!18329) )
))
(declare-datatypes ((array!104068 0))(
  ( (array!104069 (arr!50227 (Array (_ BitVec 32) ValueCell!18329)) (size!50779 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104068)

(declare-fun get!26256 (ValueCell!18329 V!59833) V!59833)

(declare-fun dynLambda!3869 (Int (_ BitVec 64)) V!59833)

(assert (=> b!1562240 (= lt!671434 (get!26256 (select (arr!50227 _values!487) from!782) (dynLambda!3869 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59833)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59833)

(declare-fun getCurrentListMapNoExtraKeys!6702 (array!104066 array!104068 (_ BitVec 32) (_ BitVec 32) V!59833 V!59833 (_ BitVec 32) Int) ListLongMap!22625)

(assert (=> b!1562240 (= lt!671435 (getCurrentListMapNoExtraKeys!6702 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59454 () Bool)

(declare-fun mapRes!59454 () Bool)

(assert (=> mapIsEmpty!59454 mapRes!59454))

(declare-fun res!1068194 () Bool)

(assert (=> start!133586 (=> (not res!1068194) (not e!870535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133586 (= res!1068194 (validMask!0 mask!947))))

(assert (=> start!133586 e!870535))

(assert (=> start!133586 tp!113283))

(declare-fun tp_is_empty!38719 () Bool)

(assert (=> start!133586 tp_is_empty!38719))

(assert (=> start!133586 true))

(declare-fun array_inv!39225 (array!104066) Bool)

(assert (=> start!133586 (array_inv!39225 _keys!637)))

(declare-fun e!870531 () Bool)

(declare-fun array_inv!39226 (array!104068) Bool)

(assert (=> start!133586 (and (array_inv!39226 _values!487) e!870531)))

(declare-fun b!1562241 () Bool)

(declare-fun res!1068191 () Bool)

(assert (=> b!1562241 (=> (not res!1068191) (not e!870535))))

(declare-datatypes ((List!36532 0))(
  ( (Nil!36529) (Cons!36528 (h!37975 (_ BitVec 64)) (t!51367 List!36532)) )
))
(declare-fun arrayNoDuplicates!0 (array!104066 (_ BitVec 32) List!36532) Bool)

(assert (=> b!1562241 (= res!1068191 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36529))))

(declare-fun b!1562242 () Bool)

(declare-fun res!1068192 () Bool)

(assert (=> b!1562242 (=> (not res!1068192) (not e!870535))))

(assert (=> b!1562242 (= res!1068192 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50778 _keys!637)) (bvslt from!782 (size!50778 _keys!637))))))

(declare-fun b!1562243 () Bool)

(declare-fun res!1068195 () Bool)

(assert (=> b!1562243 (=> (not res!1068195) (not e!870535))))

(assert (=> b!1562243 (= res!1068195 (and (= (size!50779 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50778 _keys!637) (size!50779 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562244 () Bool)

(declare-fun e!870532 () Bool)

(assert (=> b!1562244 (= e!870532 tp_is_empty!38719)))

(declare-fun b!1562245 () Bool)

(declare-fun e!870533 () Bool)

(assert (=> b!1562245 (= e!870533 tp_is_empty!38719)))

(declare-fun b!1562246 () Bool)

(assert (=> b!1562246 (= e!870531 (and e!870533 mapRes!59454))))

(declare-fun condMapEmpty!59454 () Bool)

(declare-fun mapDefault!59454 () ValueCell!18329)

(assert (=> b!1562246 (= condMapEmpty!59454 (= (arr!50227 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18329)) mapDefault!59454)))))

(declare-fun mapNonEmpty!59454 () Bool)

(declare-fun tp!113284 () Bool)

(assert (=> mapNonEmpty!59454 (= mapRes!59454 (and tp!113284 e!870532))))

(declare-fun mapValue!59454 () ValueCell!18329)

(declare-fun mapKey!59454 () (_ BitVec 32))

(declare-fun mapRest!59454 () (Array (_ BitVec 32) ValueCell!18329))

(assert (=> mapNonEmpty!59454 (= (arr!50227 _values!487) (store mapRest!59454 mapKey!59454 mapValue!59454))))

(declare-fun b!1562247 () Bool)

(declare-fun res!1068190 () Bool)

(assert (=> b!1562247 (=> (not res!1068190) (not e!870535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104066 (_ BitVec 32)) Bool)

(assert (=> b!1562247 (= res!1068190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562248 () Bool)

(declare-fun res!1068193 () Bool)

(assert (=> b!1562248 (=> (not res!1068193) (not e!870535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562248 (= res!1068193 (validKeyInArray!0 (select (arr!50226 _keys!637) from!782)))))

(assert (= (and start!133586 res!1068194) b!1562243))

(assert (= (and b!1562243 res!1068195) b!1562247))

(assert (= (and b!1562247 res!1068190) b!1562241))

(assert (= (and b!1562241 res!1068191) b!1562242))

(assert (= (and b!1562242 res!1068192) b!1562248))

(assert (= (and b!1562248 res!1068193) b!1562240))

(assert (= (and b!1562246 condMapEmpty!59454) mapIsEmpty!59454))

(assert (= (and b!1562246 (not condMapEmpty!59454)) mapNonEmpty!59454))

(get-info :version)

(assert (= (and mapNonEmpty!59454 ((_ is ValueCellFull!18329) mapValue!59454)) b!1562244))

(assert (= (and b!1562246 ((_ is ValueCellFull!18329) mapDefault!59454)) b!1562245))

(assert (= start!133586 b!1562246))

(declare-fun b_lambda!24917 () Bool)

(assert (=> (not b_lambda!24917) (not b!1562240)))

(declare-fun t!51365 () Bool)

(declare-fun tb!12589 () Bool)

(assert (=> (and start!133586 (= defaultEntry!495 defaultEntry!495) t!51365) tb!12589))

(declare-fun result!26467 () Bool)

(assert (=> tb!12589 (= result!26467 tp_is_empty!38719)))

(assert (=> b!1562240 t!51365))

(declare-fun b_and!51601 () Bool)

(assert (= b_and!51599 (and (=> t!51365 result!26467) b_and!51601)))

(declare-fun m!1437429 () Bool)

(assert (=> b!1562240 m!1437429))

(declare-fun m!1437431 () Bool)

(assert (=> b!1562240 m!1437431))

(declare-fun m!1437433 () Bool)

(assert (=> b!1562240 m!1437433))

(declare-fun m!1437435 () Bool)

(assert (=> b!1562240 m!1437435))

(declare-fun m!1437437 () Bool)

(assert (=> b!1562240 m!1437437))

(declare-fun m!1437439 () Bool)

(assert (=> b!1562240 m!1437439))

(assert (=> b!1562240 m!1437433))

(declare-fun m!1437441 () Bool)

(assert (=> b!1562240 m!1437441))

(declare-fun m!1437443 () Bool)

(assert (=> b!1562240 m!1437443))

(assert (=> b!1562240 m!1437431))

(assert (=> b!1562240 m!1437435))

(declare-fun m!1437445 () Bool)

(assert (=> b!1562240 m!1437445))

(assert (=> b!1562248 m!1437433))

(assert (=> b!1562248 m!1437433))

(declare-fun m!1437447 () Bool)

(assert (=> b!1562248 m!1437447))

(declare-fun m!1437449 () Bool)

(assert (=> start!133586 m!1437449))

(declare-fun m!1437451 () Bool)

(assert (=> start!133586 m!1437451))

(declare-fun m!1437453 () Bool)

(assert (=> start!133586 m!1437453))

(declare-fun m!1437455 () Bool)

(assert (=> b!1562241 m!1437455))

(declare-fun m!1437457 () Bool)

(assert (=> b!1562247 m!1437457))

(declare-fun m!1437459 () Bool)

(assert (=> mapNonEmpty!59454 m!1437459))

(check-sat (not b_lambda!24917) (not mapNonEmpty!59454) (not start!133586) (not b!1562240) (not b_next!32053) (not b!1562241) (not b!1562247) b_and!51601 (not b!1562248) tp_is_empty!38719)
(check-sat b_and!51601 (not b_next!32053))
