; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79218 () Bool)

(assert start!79218)

(declare-fun b_free!17263 () Bool)

(declare-fun b_next!17263 () Bool)

(assert (=> start!79218 (= b_free!17263 (not b_next!17263))))

(declare-fun tp!60231 () Bool)

(declare-fun b_and!28273 () Bool)

(assert (=> start!79218 (= tp!60231 b_and!28273)))

(declare-fun b!927472 () Bool)

(declare-fun e!520705 () Bool)

(declare-datatypes ((array!55559 0))(
  ( (array!55560 (arr!26720 (Array (_ BitVec 32) (_ BitVec 64))) (size!27180 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55559)

(assert (=> b!927472 (= e!520705 (not (bvsle #b00000000000000000000000000000000 (size!27180 _keys!1487))))))

(declare-fun e!520702 () Bool)

(assert (=> b!927472 e!520702))

(declare-fun res!624573 () Bool)

(assert (=> b!927472 (=> (not res!624573) (not e!520702))))

(declare-datatypes ((V!31327 0))(
  ( (V!31328 (val!9936 Int)) )
))
(declare-datatypes ((tuple2!12952 0))(
  ( (tuple2!12953 (_1!6487 (_ BitVec 64)) (_2!6487 V!31327)) )
))
(declare-datatypes ((List!18762 0))(
  ( (Nil!18759) (Cons!18758 (h!19910 tuple2!12952) (t!26747 List!18762)) )
))
(declare-datatypes ((ListLongMap!11651 0))(
  ( (ListLongMap!11652 (toList!5841 List!18762)) )
))
(declare-fun lt!417703 () ListLongMap!11651)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4913 (ListLongMap!11651 (_ BitVec 64)) Bool)

(assert (=> b!927472 (= res!624573 (contains!4913 lt!417703 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9404 0))(
  ( (ValueCellFull!9404 (v!12451 V!31327)) (EmptyCell!9404) )
))
(declare-datatypes ((array!55561 0))(
  ( (array!55562 (arr!26721 (Array (_ BitVec 32) ValueCell!9404)) (size!27181 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55561)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31327)

(declare-fun minValue!1173 () V!31327)

(declare-fun getCurrentListMap!3091 (array!55559 array!55561 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 32) Int) ListLongMap!11651)

(assert (=> b!927472 (= lt!417703 (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31327)

(declare-datatypes ((Unit!31319 0))(
  ( (Unit!31320) )
))
(declare-fun lt!417707 () Unit!31319)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!84 (array!55559 array!55561 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 64) V!31327 (_ BitVec 32) Int) Unit!31319)

(assert (=> b!927472 (= lt!417707 (lemmaListMapApplyFromThenApplyFromZero!84 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927473 () Bool)

(declare-fun res!624579 () Bool)

(assert (=> b!927473 (=> (not res!624579) (not e!520705))))

(declare-fun lt!417704 () ListLongMap!11651)

(declare-fun apply!692 (ListLongMap!11651 (_ BitVec 64)) V!31327)

(assert (=> b!927473 (= res!624579 (= (apply!692 lt!417704 k0!1099) v!791))))

(declare-fun b!927474 () Bool)

(declare-fun e!520698 () Bool)

(assert (=> b!927474 (= e!520698 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927475 () Bool)

(declare-fun e!520693 () Unit!31319)

(declare-fun Unit!31321 () Unit!31319)

(assert (=> b!927475 (= e!520693 Unit!31321)))

(declare-fun mapNonEmpty!31413 () Bool)

(declare-fun mapRes!31413 () Bool)

(declare-fun tp!60230 () Bool)

(declare-fun e!520700 () Bool)

(assert (=> mapNonEmpty!31413 (= mapRes!31413 (and tp!60230 e!520700))))

(declare-fun mapValue!31413 () ValueCell!9404)

(declare-fun mapRest!31413 () (Array (_ BitVec 32) ValueCell!9404))

(declare-fun mapKey!31413 () (_ BitVec 32))

(assert (=> mapNonEmpty!31413 (= (arr!26721 _values!1231) (store mapRest!31413 mapKey!31413 mapValue!31413))))

(declare-fun b!927476 () Bool)

(declare-fun tp_is_empty!19771 () Bool)

(assert (=> b!927476 (= e!520700 tp_is_empty!19771)))

(declare-fun b!927478 () Bool)

(assert (=> b!927478 (= e!520702 (= (apply!692 lt!417703 k0!1099) v!791))))

(declare-fun mapIsEmpty!31413 () Bool)

(assert (=> mapIsEmpty!31413 mapRes!31413))

(declare-fun b!927479 () Bool)

(declare-fun res!624576 () Bool)

(declare-fun e!520694 () Bool)

(assert (=> b!927479 (=> (not res!624576) (not e!520694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55559 (_ BitVec 32)) Bool)

(assert (=> b!927479 (= res!624576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927480 () Bool)

(declare-fun e!520703 () Unit!31319)

(declare-fun Unit!31322 () Unit!31319)

(assert (=> b!927480 (= e!520703 Unit!31322)))

(declare-fun b!927481 () Bool)

(declare-fun arrayContainsKey!0 (array!55559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927481 (= e!520698 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927482 () Bool)

(declare-fun e!520697 () Bool)

(assert (=> b!927482 (= e!520694 e!520697)))

(declare-fun res!624578 () Bool)

(assert (=> b!927482 (=> (not res!624578) (not e!520697))))

(declare-fun lt!417711 () ListLongMap!11651)

(assert (=> b!927482 (= res!624578 (contains!4913 lt!417711 k0!1099))))

(assert (=> b!927482 (= lt!417711 (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927483 () Bool)

(declare-fun res!624580 () Bool)

(assert (=> b!927483 (=> (not res!624580) (not e!520694))))

(assert (=> b!927483 (= res!624580 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27180 _keys!1487))))))

(declare-fun b!927484 () Bool)

(assert (=> b!927484 (= e!520703 e!520693)))

(declare-fun lt!417699 () (_ BitVec 64))

(assert (=> b!927484 (= lt!417699 (select (arr!26720 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97025 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927484 (= c!97025 (validKeyInArray!0 lt!417699))))

(declare-fun res!624582 () Bool)

(assert (=> start!79218 (=> (not res!624582) (not e!520694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79218 (= res!624582 (validMask!0 mask!1881))))

(assert (=> start!79218 e!520694))

(assert (=> start!79218 true))

(assert (=> start!79218 tp_is_empty!19771))

(declare-fun e!520704 () Bool)

(declare-fun array_inv!20906 (array!55561) Bool)

(assert (=> start!79218 (and (array_inv!20906 _values!1231) e!520704)))

(assert (=> start!79218 tp!60231))

(declare-fun array_inv!20907 (array!55559) Bool)

(assert (=> start!79218 (array_inv!20907 _keys!1487)))

(declare-fun b!927477 () Bool)

(declare-fun lt!417702 () ListLongMap!11651)

(declare-fun lt!417713 () V!31327)

(assert (=> b!927477 (= (apply!692 lt!417702 k0!1099) lt!417713)))

(declare-fun lt!417698 () Unit!31319)

(declare-fun lt!417700 () V!31327)

(declare-fun addApplyDifferent!390 (ListLongMap!11651 (_ BitVec 64) V!31327 (_ BitVec 64)) Unit!31319)

(assert (=> b!927477 (= lt!417698 (addApplyDifferent!390 lt!417711 lt!417699 lt!417700 k0!1099))))

(assert (=> b!927477 (not (= lt!417699 k0!1099))))

(declare-fun lt!417709 () Unit!31319)

(declare-datatypes ((List!18763 0))(
  ( (Nil!18760) (Cons!18759 (h!19911 (_ BitVec 64)) (t!26748 List!18763)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55559 (_ BitVec 64) (_ BitVec 32) List!18763) Unit!31319)

(assert (=> b!927477 (= lt!417709 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18760))))

(assert (=> b!927477 e!520698))

(declare-fun c!97026 () Bool)

(assert (=> b!927477 (= c!97026 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417706 () Unit!31319)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!245 (array!55559 array!55561 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 64) (_ BitVec 32) Int) Unit!31319)

(assert (=> b!927477 (= lt!417706 (lemmaListMapContainsThenArrayContainsFrom!245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55559 (_ BitVec 32) List!18763) Bool)

(assert (=> b!927477 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18760)))

(declare-fun lt!417708 () Unit!31319)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55559 (_ BitVec 32) (_ BitVec 32)) Unit!31319)

(assert (=> b!927477 (= lt!417708 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927477 (contains!4913 lt!417702 k0!1099)))

(declare-fun lt!417701 () tuple2!12952)

(declare-fun +!2754 (ListLongMap!11651 tuple2!12952) ListLongMap!11651)

(assert (=> b!927477 (= lt!417702 (+!2754 lt!417711 lt!417701))))

(declare-fun lt!417712 () Unit!31319)

(declare-fun addStillContains!463 (ListLongMap!11651 (_ BitVec 64) V!31327 (_ BitVec 64)) Unit!31319)

(assert (=> b!927477 (= lt!417712 (addStillContains!463 lt!417711 lt!417699 lt!417700 k0!1099))))

(assert (=> b!927477 (= (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2754 (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417701))))

(assert (=> b!927477 (= lt!417701 (tuple2!12953 lt!417699 lt!417700))))

(declare-fun get!14077 (ValueCell!9404 V!31327) V!31327)

(declare-fun dynLambda!1551 (Int (_ BitVec 64)) V!31327)

(assert (=> b!927477 (= lt!417700 (get!14077 (select (arr!26721 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1551 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417705 () Unit!31319)

(declare-fun lemmaListMapRecursiveValidKeyArray!134 (array!55559 array!55561 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 32) Int) Unit!31319)

(assert (=> b!927477 (= lt!417705 (lemmaListMapRecursiveValidKeyArray!134 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927477 (= e!520693 lt!417698)))

(declare-fun b!927485 () Bool)

(declare-fun e!520699 () Bool)

(assert (=> b!927485 (= e!520699 e!520705)))

(declare-fun res!624574 () Bool)

(assert (=> b!927485 (=> (not res!624574) (not e!520705))))

(assert (=> b!927485 (= res!624574 (contains!4913 lt!417704 k0!1099))))

(assert (=> b!927485 (= lt!417704 (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927486 () Bool)

(declare-fun e!520695 () Bool)

(assert (=> b!927486 (= e!520695 e!520699)))

(declare-fun res!624575 () Bool)

(assert (=> b!927486 (=> (not res!624575) (not e!520699))))

(assert (=> b!927486 (= res!624575 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27180 _keys!1487)))))

(declare-fun lt!417710 () Unit!31319)

(assert (=> b!927486 (= lt!417710 e!520703)))

(declare-fun c!97024 () Bool)

(assert (=> b!927486 (= c!97024 (validKeyInArray!0 k0!1099))))

(declare-fun b!927487 () Bool)

(declare-fun e!520696 () Bool)

(assert (=> b!927487 (= e!520704 (and e!520696 mapRes!31413))))

(declare-fun condMapEmpty!31413 () Bool)

(declare-fun mapDefault!31413 () ValueCell!9404)

(assert (=> b!927487 (= condMapEmpty!31413 (= (arr!26721 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9404)) mapDefault!31413)))))

(declare-fun b!927488 () Bool)

(assert (=> b!927488 (= e!520696 tp_is_empty!19771)))

(declare-fun b!927489 () Bool)

(assert (=> b!927489 (= e!520697 e!520695)))

(declare-fun res!624577 () Bool)

(assert (=> b!927489 (=> (not res!624577) (not e!520695))))

(assert (=> b!927489 (= res!624577 (and (= lt!417713 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927489 (= lt!417713 (apply!692 lt!417711 k0!1099))))

(declare-fun b!927490 () Bool)

(declare-fun res!624581 () Bool)

(assert (=> b!927490 (=> (not res!624581) (not e!520694))))

(assert (=> b!927490 (= res!624581 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18760))))

(declare-fun b!927491 () Bool)

(declare-fun res!624572 () Bool)

(assert (=> b!927491 (=> (not res!624572) (not e!520694))))

(assert (=> b!927491 (= res!624572 (and (= (size!27181 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27180 _keys!1487) (size!27181 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79218 res!624582) b!927491))

(assert (= (and b!927491 res!624572) b!927479))

(assert (= (and b!927479 res!624576) b!927490))

(assert (= (and b!927490 res!624581) b!927483))

(assert (= (and b!927483 res!624580) b!927482))

(assert (= (and b!927482 res!624578) b!927489))

(assert (= (and b!927489 res!624577) b!927486))

(assert (= (and b!927486 c!97024) b!927484))

(assert (= (and b!927486 (not c!97024)) b!927480))

(assert (= (and b!927484 c!97025) b!927477))

(assert (= (and b!927484 (not c!97025)) b!927475))

(assert (= (and b!927477 c!97026) b!927481))

(assert (= (and b!927477 (not c!97026)) b!927474))

(assert (= (and b!927486 res!624575) b!927485))

(assert (= (and b!927485 res!624574) b!927473))

(assert (= (and b!927473 res!624579) b!927472))

(assert (= (and b!927472 res!624573) b!927478))

(assert (= (and b!927487 condMapEmpty!31413) mapIsEmpty!31413))

(assert (= (and b!927487 (not condMapEmpty!31413)) mapNonEmpty!31413))

(get-info :version)

(assert (= (and mapNonEmpty!31413 ((_ is ValueCellFull!9404) mapValue!31413)) b!927476))

(assert (= (and b!927487 ((_ is ValueCellFull!9404) mapDefault!31413)) b!927488))

(assert (= start!79218 b!927487))

(declare-fun b_lambda!13779 () Bool)

(assert (=> (not b_lambda!13779) (not b!927477)))

(declare-fun t!26746 () Bool)

(declare-fun tb!5835 () Bool)

(assert (=> (and start!79218 (= defaultEntry!1235 defaultEntry!1235) t!26746) tb!5835))

(declare-fun result!11501 () Bool)

(assert (=> tb!5835 (= result!11501 tp_is_empty!19771)))

(assert (=> b!927477 t!26746))

(declare-fun b_and!28275 () Bool)

(assert (= b_and!28273 (and (=> t!26746 result!11501) b_and!28275)))

(declare-fun m!862429 () Bool)

(assert (=> start!79218 m!862429))

(declare-fun m!862431 () Bool)

(assert (=> start!79218 m!862431))

(declare-fun m!862433 () Bool)

(assert (=> start!79218 m!862433))

(declare-fun m!862435 () Bool)

(assert (=> b!927472 m!862435))

(declare-fun m!862437 () Bool)

(assert (=> b!927472 m!862437))

(declare-fun m!862439 () Bool)

(assert (=> b!927472 m!862439))

(declare-fun m!862441 () Bool)

(assert (=> b!927479 m!862441))

(declare-fun m!862443 () Bool)

(assert (=> b!927478 m!862443))

(declare-fun m!862445 () Bool)

(assert (=> b!927484 m!862445))

(declare-fun m!862447 () Bool)

(assert (=> b!927484 m!862447))

(declare-fun m!862449 () Bool)

(assert (=> b!927473 m!862449))

(declare-fun m!862451 () Bool)

(assert (=> b!927477 m!862451))

(declare-fun m!862453 () Bool)

(assert (=> b!927477 m!862453))

(declare-fun m!862455 () Bool)

(assert (=> b!927477 m!862455))

(declare-fun m!862457 () Bool)

(assert (=> b!927477 m!862457))

(declare-fun m!862459 () Bool)

(assert (=> b!927477 m!862459))

(declare-fun m!862461 () Bool)

(assert (=> b!927477 m!862461))

(assert (=> b!927477 m!862457))

(declare-fun m!862463 () Bool)

(assert (=> b!927477 m!862463))

(declare-fun m!862465 () Bool)

(assert (=> b!927477 m!862465))

(declare-fun m!862467 () Bool)

(assert (=> b!927477 m!862467))

(declare-fun m!862469 () Bool)

(assert (=> b!927477 m!862469))

(declare-fun m!862471 () Bool)

(assert (=> b!927477 m!862471))

(declare-fun m!862473 () Bool)

(assert (=> b!927477 m!862473))

(assert (=> b!927477 m!862461))

(assert (=> b!927477 m!862451))

(declare-fun m!862475 () Bool)

(assert (=> b!927477 m!862475))

(declare-fun m!862477 () Bool)

(assert (=> b!927477 m!862477))

(declare-fun m!862479 () Bool)

(assert (=> b!927477 m!862479))

(declare-fun m!862481 () Bool)

(assert (=> b!927477 m!862481))

(declare-fun m!862483 () Bool)

(assert (=> b!927486 m!862483))

(declare-fun m!862485 () Bool)

(assert (=> b!927489 m!862485))

(declare-fun m!862487 () Bool)

(assert (=> b!927482 m!862487))

(declare-fun m!862489 () Bool)

(assert (=> b!927482 m!862489))

(declare-fun m!862491 () Bool)

(assert (=> mapNonEmpty!31413 m!862491))

(declare-fun m!862493 () Bool)

(assert (=> b!927485 m!862493))

(assert (=> b!927485 m!862465))

(declare-fun m!862495 () Bool)

(assert (=> b!927490 m!862495))

(declare-fun m!862497 () Bool)

(assert (=> b!927481 m!862497))

(check-sat (not b_next!17263) (not b!927478) (not b!927486) b_and!28275 tp_is_empty!19771 (not b!927482) (not b!927485) (not b!927477) (not b!927473) (not start!79218) (not b!927481) (not mapNonEmpty!31413) (not b_lambda!13779) (not b!927489) (not b!927479) (not b!927490) (not b!927472) (not b!927484))
(check-sat b_and!28275 (not b_next!17263))
