; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79158 () Bool)

(assert start!79158)

(declare-fun b_free!17203 () Bool)

(declare-fun b_next!17203 () Bool)

(assert (=> start!79158 (= b_free!17203 (not b_next!17203))))

(declare-fun tp!60050 () Bool)

(declare-fun b_and!28153 () Bool)

(assert (=> start!79158 (= tp!60050 b_and!28153)))

(declare-fun mapIsEmpty!31323 () Bool)

(declare-fun mapRes!31323 () Bool)

(assert (=> mapIsEmpty!31323 mapRes!31323))

(declare-fun b!925644 () Bool)

(declare-fun e!519541 () Bool)

(declare-fun e!519543 () Bool)

(assert (=> b!925644 (= e!519541 e!519543)))

(declare-fun res!623619 () Bool)

(assert (=> b!925644 (=> (not res!623619) (not e!519543))))

(declare-datatypes ((V!31247 0))(
  ( (V!31248 (val!9906 Int)) )
))
(declare-datatypes ((tuple2!12898 0))(
  ( (tuple2!12899 (_1!6460 (_ BitVec 64)) (_2!6460 V!31247)) )
))
(declare-datatypes ((List!18711 0))(
  ( (Nil!18708) (Cons!18707 (h!19859 tuple2!12898) (t!26636 List!18711)) )
))
(declare-datatypes ((ListLongMap!11597 0))(
  ( (ListLongMap!11598 (toList!5814 List!18711)) )
))
(declare-fun lt!416281 () ListLongMap!11597)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4886 (ListLongMap!11597 (_ BitVec 64)) Bool)

(assert (=> b!925644 (= res!623619 (contains!4886 lt!416281 k0!1099))))

(declare-datatypes ((array!55441 0))(
  ( (array!55442 (arr!26661 (Array (_ BitVec 32) (_ BitVec 64))) (size!27121 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55441)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9374 0))(
  ( (ValueCellFull!9374 (v!12421 V!31247)) (EmptyCell!9374) )
))
(declare-datatypes ((array!55443 0))(
  ( (array!55444 (arr!26662 (Array (_ BitVec 32) ValueCell!9374)) (size!27122 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55443)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31247)

(declare-fun minValue!1173 () V!31247)

(declare-fun getCurrentListMap!3064 (array!55441 array!55443 (_ BitVec 32) (_ BitVec 32) V!31247 V!31247 (_ BitVec 32) Int) ListLongMap!11597)

(assert (=> b!925644 (= lt!416281 (getCurrentListMap!3064 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925645 () Bool)

(declare-fun e!519539 () Bool)

(declare-fun tp_is_empty!19711 () Bool)

(assert (=> b!925645 (= e!519539 tp_is_empty!19711)))

(declare-fun b!925646 () Bool)

(declare-fun res!623618 () Bool)

(assert (=> b!925646 (=> (not res!623618) (not e!519541))))

(assert (=> b!925646 (= res!623618 (and (= (size!27122 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27121 _keys!1487) (size!27122 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925647 () Bool)

(declare-fun lt!416277 () ListLongMap!11597)

(declare-fun lt!416280 () V!31247)

(declare-fun apply!666 (ListLongMap!11597 (_ BitVec 64)) V!31247)

(assert (=> b!925647 (= (apply!666 lt!416277 k0!1099) lt!416280)))

(declare-fun lt!416282 () (_ BitVec 64))

(declare-datatypes ((Unit!31231 0))(
  ( (Unit!31232) )
))
(declare-fun lt!416275 () Unit!31231)

(declare-fun lt!416283 () V!31247)

(declare-fun addApplyDifferent!368 (ListLongMap!11597 (_ BitVec 64) V!31247 (_ BitVec 64)) Unit!31231)

(assert (=> b!925647 (= lt!416275 (addApplyDifferent!368 lt!416281 lt!416282 lt!416283 k0!1099))))

(assert (=> b!925647 (not (= lt!416282 k0!1099))))

(declare-fun lt!416279 () Unit!31231)

(declare-datatypes ((List!18712 0))(
  ( (Nil!18709) (Cons!18708 (h!19860 (_ BitVec 64)) (t!26637 List!18712)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55441 (_ BitVec 64) (_ BitVec 32) List!18712) Unit!31231)

(assert (=> b!925647 (= lt!416279 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18709))))

(declare-fun e!519549 () Bool)

(assert (=> b!925647 e!519549))

(declare-fun c!96754 () Bool)

(assert (=> b!925647 (= c!96754 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416276 () Unit!31231)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!223 (array!55441 array!55443 (_ BitVec 32) (_ BitVec 32) V!31247 V!31247 (_ BitVec 64) (_ BitVec 32) Int) Unit!31231)

(assert (=> b!925647 (= lt!416276 (lemmaListMapContainsThenArrayContainsFrom!223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55441 (_ BitVec 32) List!18712) Bool)

(assert (=> b!925647 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18709)))

(declare-fun lt!416287 () Unit!31231)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55441 (_ BitVec 32) (_ BitVec 32)) Unit!31231)

(assert (=> b!925647 (= lt!416287 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925647 (contains!4886 lt!416277 k0!1099)))

(declare-fun lt!416288 () tuple2!12898)

(declare-fun +!2732 (ListLongMap!11597 tuple2!12898) ListLongMap!11597)

(assert (=> b!925647 (= lt!416277 (+!2732 lt!416281 lt!416288))))

(declare-fun lt!416286 () Unit!31231)

(declare-fun addStillContains!441 (ListLongMap!11597 (_ BitVec 64) V!31247 (_ BitVec 64)) Unit!31231)

(assert (=> b!925647 (= lt!416286 (addStillContains!441 lt!416281 lt!416282 lt!416283 k0!1099))))

(assert (=> b!925647 (= (getCurrentListMap!3064 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2732 (getCurrentListMap!3064 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416288))))

(assert (=> b!925647 (= lt!416288 (tuple2!12899 lt!416282 lt!416283))))

(declare-fun get!14035 (ValueCell!9374 V!31247) V!31247)

(declare-fun dynLambda!1529 (Int (_ BitVec 64)) V!31247)

(assert (=> b!925647 (= lt!416283 (get!14035 (select (arr!26662 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1529 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416278 () Unit!31231)

(declare-fun lemmaListMapRecursiveValidKeyArray!112 (array!55441 array!55443 (_ BitVec 32) (_ BitVec 32) V!31247 V!31247 (_ BitVec 32) Int) Unit!31231)

(assert (=> b!925647 (= lt!416278 (lemmaListMapRecursiveValidKeyArray!112 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519544 () Unit!31231)

(assert (=> b!925647 (= e!519544 lt!416275)))

(declare-fun b!925648 () Bool)

(declare-fun e!519547 () Bool)

(declare-fun e!519546 () Bool)

(assert (=> b!925648 (= e!519547 (and e!519546 mapRes!31323))))

(declare-fun condMapEmpty!31323 () Bool)

(declare-fun mapDefault!31323 () ValueCell!9374)

(assert (=> b!925648 (= condMapEmpty!31323 (= (arr!26662 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9374)) mapDefault!31323)))))

(declare-fun res!623616 () Bool)

(assert (=> start!79158 (=> (not res!623616) (not e!519541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79158 (= res!623616 (validMask!0 mask!1881))))

(assert (=> start!79158 e!519541))

(assert (=> start!79158 true))

(assert (=> start!79158 tp_is_empty!19711))

(declare-fun array_inv!20864 (array!55443) Bool)

(assert (=> start!79158 (and (array_inv!20864 _values!1231) e!519547)))

(assert (=> start!79158 tp!60050))

(declare-fun array_inv!20865 (array!55441) Bool)

(assert (=> start!79158 (array_inv!20865 _keys!1487)))

(declare-fun b!925649 () Bool)

(declare-fun e!519540 () Bool)

(declare-fun e!519545 () Bool)

(assert (=> b!925649 (= e!519540 e!519545)))

(declare-fun res!623621 () Bool)

(assert (=> b!925649 (=> (not res!623621) (not e!519545))))

(declare-fun lt!416284 () ListLongMap!11597)

(assert (=> b!925649 (= res!623621 (contains!4886 lt!416284 k0!1099))))

(assert (=> b!925649 (= lt!416284 (getCurrentListMap!3064 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925650 () Bool)

(declare-fun e!519550 () Bool)

(assert (=> b!925650 (= e!519543 e!519550)))

(declare-fun res!623617 () Bool)

(assert (=> b!925650 (=> (not res!623617) (not e!519550))))

(declare-fun v!791 () V!31247)

(assert (=> b!925650 (= res!623617 (and (= lt!416280 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925650 (= lt!416280 (apply!666 lt!416281 k0!1099))))

(declare-fun b!925651 () Bool)

(assert (=> b!925651 (= e!519546 tp_is_empty!19711)))

(declare-fun b!925652 () Bool)

(assert (=> b!925652 (= e!519550 e!519540)))

(declare-fun res!623622 () Bool)

(assert (=> b!925652 (=> (not res!623622) (not e!519540))))

(assert (=> b!925652 (= res!623622 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27121 _keys!1487)))))

(declare-fun lt!416285 () Unit!31231)

(declare-fun e!519548 () Unit!31231)

(assert (=> b!925652 (= lt!416285 e!519548)))

(declare-fun c!96755 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925652 (= c!96755 (validKeyInArray!0 k0!1099))))

(declare-fun b!925653 () Bool)

(declare-fun res!623614 () Bool)

(assert (=> b!925653 (=> (not res!623614) (not e!519541))))

(assert (=> b!925653 (= res!623614 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27121 _keys!1487))))))

(declare-fun b!925654 () Bool)

(declare-fun res!623620 () Bool)

(assert (=> b!925654 (=> (not res!623620) (not e!519541))))

(assert (=> b!925654 (= res!623620 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18709))))

(declare-fun b!925655 () Bool)

(declare-fun Unit!31233 () Unit!31231)

(assert (=> b!925655 (= e!519548 Unit!31233)))

(declare-fun b!925656 () Bool)

(assert (=> b!925656 (= e!519545 false)))

(declare-fun lt!416274 () V!31247)

(assert (=> b!925656 (= lt!416274 (apply!666 lt!416284 k0!1099))))

(declare-fun b!925657 () Bool)

(declare-fun arrayContainsKey!0 (array!55441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925657 (= e!519549 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925658 () Bool)

(assert (=> b!925658 (= e!519549 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!31323 () Bool)

(declare-fun tp!60051 () Bool)

(assert (=> mapNonEmpty!31323 (= mapRes!31323 (and tp!60051 e!519539))))

(declare-fun mapKey!31323 () (_ BitVec 32))

(declare-fun mapValue!31323 () ValueCell!9374)

(declare-fun mapRest!31323 () (Array (_ BitVec 32) ValueCell!9374))

(assert (=> mapNonEmpty!31323 (= (arr!26662 _values!1231) (store mapRest!31323 mapKey!31323 mapValue!31323))))

(declare-fun b!925659 () Bool)

(declare-fun res!623615 () Bool)

(assert (=> b!925659 (=> (not res!623615) (not e!519541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55441 (_ BitVec 32)) Bool)

(assert (=> b!925659 (= res!623615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925660 () Bool)

(declare-fun Unit!31234 () Unit!31231)

(assert (=> b!925660 (= e!519544 Unit!31234)))

(declare-fun b!925661 () Bool)

(assert (=> b!925661 (= e!519548 e!519544)))

(assert (=> b!925661 (= lt!416282 (select (arr!26661 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96756 () Bool)

(assert (=> b!925661 (= c!96756 (validKeyInArray!0 lt!416282))))

(assert (= (and start!79158 res!623616) b!925646))

(assert (= (and b!925646 res!623618) b!925659))

(assert (= (and b!925659 res!623615) b!925654))

(assert (= (and b!925654 res!623620) b!925653))

(assert (= (and b!925653 res!623614) b!925644))

(assert (= (and b!925644 res!623619) b!925650))

(assert (= (and b!925650 res!623617) b!925652))

(assert (= (and b!925652 c!96755) b!925661))

(assert (= (and b!925652 (not c!96755)) b!925655))

(assert (= (and b!925661 c!96756) b!925647))

(assert (= (and b!925661 (not c!96756)) b!925660))

(assert (= (and b!925647 c!96754) b!925657))

(assert (= (and b!925647 (not c!96754)) b!925658))

(assert (= (and b!925652 res!623622) b!925649))

(assert (= (and b!925649 res!623621) b!925656))

(assert (= (and b!925648 condMapEmpty!31323) mapIsEmpty!31323))

(assert (= (and b!925648 (not condMapEmpty!31323)) mapNonEmpty!31323))

(get-info :version)

(assert (= (and mapNonEmpty!31323 ((_ is ValueCellFull!9374) mapValue!31323)) b!925645))

(assert (= (and b!925648 ((_ is ValueCellFull!9374) mapDefault!31323)) b!925651))

(assert (= start!79158 b!925648))

(declare-fun b_lambda!13719 () Bool)

(assert (=> (not b_lambda!13719) (not b!925647)))

(declare-fun t!26635 () Bool)

(declare-fun tb!5775 () Bool)

(assert (=> (and start!79158 (= defaultEntry!1235 defaultEntry!1235) t!26635) tb!5775))

(declare-fun result!11381 () Bool)

(assert (=> tb!5775 (= result!11381 tp_is_empty!19711)))

(assert (=> b!925647 t!26635))

(declare-fun b_and!28155 () Bool)

(assert (= b_and!28153 (and (=> t!26635 result!11381) b_and!28155)))

(declare-fun m!860377 () Bool)

(assert (=> b!925649 m!860377))

(declare-fun m!860379 () Bool)

(assert (=> b!925649 m!860379))

(declare-fun m!860381 () Bool)

(assert (=> b!925650 m!860381))

(declare-fun m!860383 () Bool)

(assert (=> mapNonEmpty!31323 m!860383))

(declare-fun m!860385 () Bool)

(assert (=> b!925659 m!860385))

(declare-fun m!860387 () Bool)

(assert (=> b!925661 m!860387))

(declare-fun m!860389 () Bool)

(assert (=> b!925661 m!860389))

(declare-fun m!860391 () Bool)

(assert (=> b!925657 m!860391))

(declare-fun m!860393 () Bool)

(assert (=> b!925654 m!860393))

(declare-fun m!860395 () Bool)

(assert (=> b!925647 m!860395))

(declare-fun m!860397 () Bool)

(assert (=> b!925647 m!860397))

(declare-fun m!860399 () Bool)

(assert (=> b!925647 m!860399))

(declare-fun m!860401 () Bool)

(assert (=> b!925647 m!860401))

(declare-fun m!860403 () Bool)

(assert (=> b!925647 m!860403))

(declare-fun m!860405 () Bool)

(assert (=> b!925647 m!860405))

(assert (=> b!925647 m!860379))

(declare-fun m!860407 () Bool)

(assert (=> b!925647 m!860407))

(declare-fun m!860409 () Bool)

(assert (=> b!925647 m!860409))

(declare-fun m!860411 () Bool)

(assert (=> b!925647 m!860411))

(declare-fun m!860413 () Bool)

(assert (=> b!925647 m!860413))

(declare-fun m!860415 () Bool)

(assert (=> b!925647 m!860415))

(assert (=> b!925647 m!860401))

(assert (=> b!925647 m!860403))

(declare-fun m!860417 () Bool)

(assert (=> b!925647 m!860417))

(assert (=> b!925647 m!860409))

(declare-fun m!860419 () Bool)

(assert (=> b!925647 m!860419))

(declare-fun m!860421 () Bool)

(assert (=> b!925647 m!860421))

(declare-fun m!860423 () Bool)

(assert (=> b!925647 m!860423))

(declare-fun m!860425 () Bool)

(assert (=> start!79158 m!860425))

(declare-fun m!860427 () Bool)

(assert (=> start!79158 m!860427))

(declare-fun m!860429 () Bool)

(assert (=> start!79158 m!860429))

(declare-fun m!860431 () Bool)

(assert (=> b!925656 m!860431))

(declare-fun m!860433 () Bool)

(assert (=> b!925652 m!860433))

(declare-fun m!860435 () Bool)

(assert (=> b!925644 m!860435))

(declare-fun m!860437 () Bool)

(assert (=> b!925644 m!860437))

(check-sat (not b_lambda!13719) (not mapNonEmpty!31323) (not b_next!17203) (not b!925661) (not b!925657) (not b!925649) (not b!925650) (not b!925654) (not b!925644) (not b!925652) (not b!925659) (not start!79158) (not b!925656) b_and!28155 tp_is_empty!19711 (not b!925647))
(check-sat b_and!28155 (not b_next!17203))
