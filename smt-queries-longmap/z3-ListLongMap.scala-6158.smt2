; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79058 () Bool)

(assert start!79058)

(declare-fun b_free!17271 () Bool)

(declare-fun b_next!17271 () Bool)

(assert (=> start!79058 (= b_free!17271 (not b_next!17271))))

(declare-fun tp!60254 () Bool)

(declare-fun b_and!28279 () Bool)

(assert (=> start!79058 (= tp!60254 b_and!28279)))

(declare-fun b!926817 () Bool)

(declare-fun e!520270 () Bool)

(declare-fun e!520273 () Bool)

(assert (=> b!926817 (= e!520270 e!520273)))

(declare-fun res!624361 () Bool)

(assert (=> b!926817 (=> (not res!624361) (not e!520273))))

(declare-datatypes ((V!31337 0))(
  ( (V!31338 (val!9940 Int)) )
))
(declare-datatypes ((tuple2!12970 0))(
  ( (tuple2!12971 (_1!6496 (_ BitVec 64)) (_2!6496 V!31337)) )
))
(declare-datatypes ((List!18771 0))(
  ( (Nil!18768) (Cons!18767 (h!19913 tuple2!12970) (t!26772 List!18771)) )
))
(declare-datatypes ((ListLongMap!11667 0))(
  ( (ListLongMap!11668 (toList!5849 List!18771)) )
))
(declare-fun lt!417531 () ListLongMap!11667)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4908 (ListLongMap!11667 (_ BitVec 64)) Bool)

(assert (=> b!926817 (= res!624361 (contains!4908 lt!417531 k0!1099))))

(declare-datatypes ((array!55520 0))(
  ( (array!55521 (arr!26705 (Array (_ BitVec 32) (_ BitVec 64))) (size!27164 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55520)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9408 0))(
  ( (ValueCellFull!9408 (v!12458 V!31337)) (EmptyCell!9408) )
))
(declare-datatypes ((array!55522 0))(
  ( (array!55523 (arr!26706 (Array (_ BitVec 32) ValueCell!9408)) (size!27165 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55522)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31337)

(declare-fun minValue!1173 () V!31337)

(declare-fun getCurrentListMap!3099 (array!55520 array!55522 (_ BitVec 32) (_ BitVec 32) V!31337 V!31337 (_ BitVec 32) Int) ListLongMap!11667)

(assert (=> b!926817 (= lt!417531 (getCurrentListMap!3099 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun v!791 () V!31337)

(declare-fun e!520269 () Bool)

(declare-fun lt!417540 () ListLongMap!11667)

(declare-fun b!926818 () Bool)

(declare-fun apply!679 (ListLongMap!11667 (_ BitVec 64)) V!31337)

(assert (=> b!926818 (= e!520269 (= (apply!679 lt!417540 k0!1099) v!791))))

(declare-fun b!926819 () Bool)

(declare-fun e!520268 () Bool)

(declare-fun e!520271 () Bool)

(assert (=> b!926819 (= e!520268 e!520271)))

(declare-fun res!624367 () Bool)

(assert (=> b!926819 (=> (not res!624367) (not e!520271))))

(assert (=> b!926819 (= res!624367 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27164 _keys!1487)))))

(declare-datatypes ((Unit!31335 0))(
  ( (Unit!31336) )
))
(declare-fun lt!417533 () Unit!31335)

(declare-fun e!520276 () Unit!31335)

(assert (=> b!926819 (= lt!417533 e!520276)))

(declare-fun c!96780 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926819 (= c!96780 (validKeyInArray!0 k0!1099))))

(declare-fun res!624362 () Bool)

(assert (=> start!79058 (=> (not res!624362) (not e!520270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79058 (= res!624362 (validMask!0 mask!1881))))

(assert (=> start!79058 e!520270))

(assert (=> start!79058 true))

(declare-fun tp_is_empty!19779 () Bool)

(assert (=> start!79058 tp_is_empty!19779))

(declare-fun e!520267 () Bool)

(declare-fun array_inv!20796 (array!55522) Bool)

(assert (=> start!79058 (and (array_inv!20796 _values!1231) e!520267)))

(assert (=> start!79058 tp!60254))

(declare-fun array_inv!20797 (array!55520) Bool)

(assert (=> start!79058 (array_inv!20797 _keys!1487)))

(declare-fun mapNonEmpty!31425 () Bool)

(declare-fun mapRes!31425 () Bool)

(declare-fun tp!60253 () Bool)

(declare-fun e!520279 () Bool)

(assert (=> mapNonEmpty!31425 (= mapRes!31425 (and tp!60253 e!520279))))

(declare-fun mapRest!31425 () (Array (_ BitVec 32) ValueCell!9408))

(declare-fun mapKey!31425 () (_ BitVec 32))

(declare-fun mapValue!31425 () ValueCell!9408)

(assert (=> mapNonEmpty!31425 (= (arr!26706 _values!1231) (store mapRest!31425 mapKey!31425 mapValue!31425))))

(declare-fun b!926820 () Bool)

(declare-fun e!520277 () Unit!31335)

(assert (=> b!926820 (= e!520276 e!520277)))

(declare-fun lt!417541 () (_ BitVec 64))

(assert (=> b!926820 (= lt!417541 (select (arr!26705 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96779 () Bool)

(assert (=> b!926820 (= c!96779 (validKeyInArray!0 lt!417541))))

(declare-fun mapIsEmpty!31425 () Bool)

(assert (=> mapIsEmpty!31425 mapRes!31425))

(declare-fun b!926821 () Bool)

(declare-fun Unit!31337 () Unit!31335)

(assert (=> b!926821 (= e!520277 Unit!31337)))

(declare-fun b!926822 () Bool)

(declare-fun res!624368 () Bool)

(declare-fun e!520275 () Bool)

(assert (=> b!926822 (=> (not res!624368) (not e!520275))))

(declare-fun lt!417536 () ListLongMap!11667)

(assert (=> b!926822 (= res!624368 (= (apply!679 lt!417536 k0!1099) v!791))))

(declare-fun b!926823 () Bool)

(declare-fun res!624366 () Bool)

(assert (=> b!926823 (=> (not res!624366) (not e!520270))))

(assert (=> b!926823 (= res!624366 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27164 _keys!1487))))))

(declare-fun b!926824 () Bool)

(declare-fun e!520272 () Bool)

(assert (=> b!926824 (= e!520267 (and e!520272 mapRes!31425))))

(declare-fun condMapEmpty!31425 () Bool)

(declare-fun mapDefault!31425 () ValueCell!9408)

(assert (=> b!926824 (= condMapEmpty!31425 (= (arr!26706 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9408)) mapDefault!31425)))))

(declare-fun b!926825 () Bool)

(declare-fun Unit!31338 () Unit!31335)

(assert (=> b!926825 (= e!520276 Unit!31338)))

(declare-fun b!926826 () Bool)

(declare-fun res!624363 () Bool)

(assert (=> b!926826 (=> (not res!624363) (not e!520270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55520 (_ BitVec 32)) Bool)

(assert (=> b!926826 (= res!624363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926827 () Bool)

(assert (=> b!926827 (= e!520275 (not true))))

(assert (=> b!926827 e!520269))

(declare-fun res!624370 () Bool)

(assert (=> b!926827 (=> (not res!624370) (not e!520269))))

(assert (=> b!926827 (= res!624370 (contains!4908 lt!417540 k0!1099))))

(assert (=> b!926827 (= lt!417540 (getCurrentListMap!3099 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417542 () Unit!31335)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!82 (array!55520 array!55522 (_ BitVec 32) (_ BitVec 32) V!31337 V!31337 (_ BitVec 64) V!31337 (_ BitVec 32) Int) Unit!31335)

(assert (=> b!926827 (= lt!417542 (lemmaListMapApplyFromThenApplyFromZero!82 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926828 () Bool)

(assert (=> b!926828 (= e!520279 tp_is_empty!19779)))

(declare-fun b!926829 () Bool)

(declare-fun res!624369 () Bool)

(assert (=> b!926829 (=> (not res!624369) (not e!520270))))

(assert (=> b!926829 (= res!624369 (and (= (size!27165 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27164 _keys!1487) (size!27165 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926830 () Bool)

(assert (=> b!926830 (= e!520273 e!520268)))

(declare-fun res!624364 () Bool)

(assert (=> b!926830 (=> (not res!624364) (not e!520268))))

(declare-fun lt!417530 () V!31337)

(assert (=> b!926830 (= res!624364 (and (= lt!417530 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926830 (= lt!417530 (apply!679 lt!417531 k0!1099))))

(declare-fun b!926831 () Bool)

(assert (=> b!926831 (= e!520271 e!520275)))

(declare-fun res!624365 () Bool)

(assert (=> b!926831 (=> (not res!624365) (not e!520275))))

(assert (=> b!926831 (= res!624365 (contains!4908 lt!417536 k0!1099))))

(assert (=> b!926831 (= lt!417536 (getCurrentListMap!3099 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926832 () Bool)

(declare-fun lt!417543 () ListLongMap!11667)

(assert (=> b!926832 (= (apply!679 lt!417543 k0!1099) lt!417530)))

(declare-fun lt!417529 () Unit!31335)

(declare-fun lt!417538 () V!31337)

(declare-fun addApplyDifferent!397 (ListLongMap!11667 (_ BitVec 64) V!31337 (_ BitVec 64)) Unit!31335)

(assert (=> b!926832 (= lt!417529 (addApplyDifferent!397 lt!417531 lt!417541 lt!417538 k0!1099))))

(assert (=> b!926832 (not (= lt!417541 k0!1099))))

(declare-fun lt!417535 () Unit!31335)

(declare-datatypes ((List!18772 0))(
  ( (Nil!18769) (Cons!18768 (h!19914 (_ BitVec 64)) (t!26773 List!18772)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55520 (_ BitVec 64) (_ BitVec 32) List!18772) Unit!31335)

(assert (=> b!926832 (= lt!417535 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18769))))

(declare-fun e!520274 () Bool)

(assert (=> b!926832 e!520274))

(declare-fun c!96778 () Bool)

(assert (=> b!926832 (= c!96778 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417544 () Unit!31335)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!248 (array!55520 array!55522 (_ BitVec 32) (_ BitVec 32) V!31337 V!31337 (_ BitVec 64) (_ BitVec 32) Int) Unit!31335)

(assert (=> b!926832 (= lt!417544 (lemmaListMapContainsThenArrayContainsFrom!248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55520 (_ BitVec 32) List!18772) Bool)

(assert (=> b!926832 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18769)))

(declare-fun lt!417534 () Unit!31335)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55520 (_ BitVec 32) (_ BitVec 32)) Unit!31335)

(assert (=> b!926832 (= lt!417534 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926832 (contains!4908 lt!417543 k0!1099)))

(declare-fun lt!417539 () tuple2!12970)

(declare-fun +!2741 (ListLongMap!11667 tuple2!12970) ListLongMap!11667)

(assert (=> b!926832 (= lt!417543 (+!2741 lt!417531 lt!417539))))

(declare-fun lt!417532 () Unit!31335)

(declare-fun addStillContains!465 (ListLongMap!11667 (_ BitVec 64) V!31337 (_ BitVec 64)) Unit!31335)

(assert (=> b!926832 (= lt!417532 (addStillContains!465 lt!417531 lt!417541 lt!417538 k0!1099))))

(assert (=> b!926832 (= (getCurrentListMap!3099 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2741 (getCurrentListMap!3099 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417539))))

(assert (=> b!926832 (= lt!417539 (tuple2!12971 lt!417541 lt!417538))))

(declare-fun get!14054 (ValueCell!9408 V!31337) V!31337)

(declare-fun dynLambda!1530 (Int (_ BitVec 64)) V!31337)

(assert (=> b!926832 (= lt!417538 (get!14054 (select (arr!26706 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1530 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417537 () Unit!31335)

(declare-fun lemmaListMapRecursiveValidKeyArray!131 (array!55520 array!55522 (_ BitVec 32) (_ BitVec 32) V!31337 V!31337 (_ BitVec 32) Int) Unit!31335)

(assert (=> b!926832 (= lt!417537 (lemmaListMapRecursiveValidKeyArray!131 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926832 (= e!520277 lt!417529)))

(declare-fun b!926833 () Bool)

(assert (=> b!926833 (= e!520272 tp_is_empty!19779)))

(declare-fun b!926834 () Bool)

(declare-fun arrayContainsKey!0 (array!55520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926834 (= e!520274 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926835 () Bool)

(declare-fun res!624360 () Bool)

(assert (=> b!926835 (=> (not res!624360) (not e!520270))))

(assert (=> b!926835 (= res!624360 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18769))))

(declare-fun b!926836 () Bool)

(assert (=> b!926836 (= e!520274 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!79058 res!624362) b!926829))

(assert (= (and b!926829 res!624369) b!926826))

(assert (= (and b!926826 res!624363) b!926835))

(assert (= (and b!926835 res!624360) b!926823))

(assert (= (and b!926823 res!624366) b!926817))

(assert (= (and b!926817 res!624361) b!926830))

(assert (= (and b!926830 res!624364) b!926819))

(assert (= (and b!926819 c!96780) b!926820))

(assert (= (and b!926819 (not c!96780)) b!926825))

(assert (= (and b!926820 c!96779) b!926832))

(assert (= (and b!926820 (not c!96779)) b!926821))

(assert (= (and b!926832 c!96778) b!926834))

(assert (= (and b!926832 (not c!96778)) b!926836))

(assert (= (and b!926819 res!624367) b!926831))

(assert (= (and b!926831 res!624365) b!926822))

(assert (= (and b!926822 res!624368) b!926827))

(assert (= (and b!926827 res!624370) b!926818))

(assert (= (and b!926824 condMapEmpty!31425) mapIsEmpty!31425))

(assert (= (and b!926824 (not condMapEmpty!31425)) mapNonEmpty!31425))

(get-info :version)

(assert (= (and mapNonEmpty!31425 ((_ is ValueCellFull!9408) mapValue!31425)) b!926828))

(assert (= (and b!926824 ((_ is ValueCellFull!9408) mapDefault!31425)) b!926833))

(assert (= start!79058 b!926824))

(declare-fun b_lambda!13773 () Bool)

(assert (=> (not b_lambda!13773) (not b!926832)))

(declare-fun t!26771 () Bool)

(declare-fun tb!5851 () Bool)

(assert (=> (and start!79058 (= defaultEntry!1235 defaultEntry!1235) t!26771) tb!5851))

(declare-fun result!11525 () Bool)

(assert (=> tb!5851 (= result!11525 tp_is_empty!19779)))

(assert (=> b!926832 t!26771))

(declare-fun b_and!28281 () Bool)

(assert (= b_and!28279 (and (=> t!26771 result!11525) b_and!28281)))

(declare-fun m!861415 () Bool)

(assert (=> b!926826 m!861415))

(declare-fun m!861417 () Bool)

(assert (=> b!926834 m!861417))

(declare-fun m!861419 () Bool)

(assert (=> start!79058 m!861419))

(declare-fun m!861421 () Bool)

(assert (=> start!79058 m!861421))

(declare-fun m!861423 () Bool)

(assert (=> start!79058 m!861423))

(declare-fun m!861425 () Bool)

(assert (=> b!926819 m!861425))

(declare-fun m!861427 () Bool)

(assert (=> b!926832 m!861427))

(declare-fun m!861429 () Bool)

(assert (=> b!926832 m!861429))

(declare-fun m!861431 () Bool)

(assert (=> b!926832 m!861431))

(declare-fun m!861433 () Bool)

(assert (=> b!926832 m!861433))

(declare-fun m!861435 () Bool)

(assert (=> b!926832 m!861435))

(declare-fun m!861437 () Bool)

(assert (=> b!926832 m!861437))

(assert (=> b!926832 m!861431))

(assert (=> b!926832 m!861437))

(declare-fun m!861439 () Bool)

(assert (=> b!926832 m!861439))

(declare-fun m!861441 () Bool)

(assert (=> b!926832 m!861441))

(declare-fun m!861443 () Bool)

(assert (=> b!926832 m!861443))

(declare-fun m!861445 () Bool)

(assert (=> b!926832 m!861445))

(declare-fun m!861447 () Bool)

(assert (=> b!926832 m!861447))

(declare-fun m!861449 () Bool)

(assert (=> b!926832 m!861449))

(declare-fun m!861451 () Bool)

(assert (=> b!926832 m!861451))

(assert (=> b!926832 m!861433))

(declare-fun m!861453 () Bool)

(assert (=> b!926832 m!861453))

(declare-fun m!861455 () Bool)

(assert (=> b!926832 m!861455))

(declare-fun m!861457 () Bool)

(assert (=> b!926832 m!861457))

(declare-fun m!861459 () Bool)

(assert (=> mapNonEmpty!31425 m!861459))

(declare-fun m!861461 () Bool)

(assert (=> b!926835 m!861461))

(declare-fun m!861463 () Bool)

(assert (=> b!926818 m!861463))

(declare-fun m!861465 () Bool)

(assert (=> b!926830 m!861465))

(declare-fun m!861467 () Bool)

(assert (=> b!926820 m!861467))

(declare-fun m!861469 () Bool)

(assert (=> b!926820 m!861469))

(declare-fun m!861471 () Bool)

(assert (=> b!926831 m!861471))

(assert (=> b!926831 m!861445))

(declare-fun m!861473 () Bool)

(assert (=> b!926827 m!861473))

(declare-fun m!861475 () Bool)

(assert (=> b!926827 m!861475))

(declare-fun m!861477 () Bool)

(assert (=> b!926827 m!861477))

(declare-fun m!861479 () Bool)

(assert (=> b!926822 m!861479))

(declare-fun m!861481 () Bool)

(assert (=> b!926817 m!861481))

(declare-fun m!861483 () Bool)

(assert (=> b!926817 m!861483))

(check-sat (not b!926831) (not b_lambda!13773) (not b!926827) (not mapNonEmpty!31425) b_and!28281 (not b!926832) (not b!926830) (not b!926819) (not start!79058) (not b!926817) (not b!926826) (not b!926834) (not b_next!17271) (not b!926835) (not b!926820) tp_is_empty!19779 (not b!926822) (not b!926818))
(check-sat b_and!28281 (not b_next!17271))
