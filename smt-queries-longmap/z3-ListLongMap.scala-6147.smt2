; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78972 () Bool)

(assert start!78972)

(declare-fun b_free!17203 () Bool)

(declare-fun b_next!17203 () Bool)

(assert (=> start!78972 (= b_free!17203 (not b_next!17203))))

(declare-fun tp!60051 () Bool)

(declare-fun b_and!28117 () Bool)

(assert (=> start!78972 (= tp!60051 b_and!28117)))

(declare-fun mapNonEmpty!31323 () Bool)

(declare-fun mapRes!31323 () Bool)

(declare-fun tp!60050 () Bool)

(declare-fun e!518816 () Bool)

(assert (=> mapNonEmpty!31323 (= mapRes!31323 (and tp!60050 e!518816))))

(declare-datatypes ((V!31247 0))(
  ( (V!31248 (val!9906 Int)) )
))
(declare-datatypes ((ValueCell!9374 0))(
  ( (ValueCellFull!9374 (v!12423 V!31247)) (EmptyCell!9374) )
))
(declare-fun mapRest!31323 () (Array (_ BitVec 32) ValueCell!9374))

(declare-fun mapValue!31323 () ValueCell!9374)

(declare-datatypes ((array!55367 0))(
  ( (array!55368 (arr!26629 (Array (_ BitVec 32) ValueCell!9374)) (size!27090 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55367)

(declare-fun mapKey!31323 () (_ BitVec 32))

(assert (=> mapNonEmpty!31323 (= (arr!26629 _values!1231) (store mapRest!31323 mapKey!31323 mapValue!31323))))

(declare-fun b!924502 () Bool)

(declare-fun res!623165 () Bool)

(declare-fun e!518819 () Bool)

(assert (=> b!924502 (=> (not res!623165) (not e!518819))))

(declare-datatypes ((array!55369 0))(
  ( (array!55370 (arr!26630 (Array (_ BitVec 32) (_ BitVec 64))) (size!27091 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55369)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(assert (=> b!924502 (= res!623165 (and (= (size!27090 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27091 _keys!1487) (size!27090 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924503 () Bool)

(declare-fun e!518817 () Bool)

(declare-fun e!518809 () Bool)

(assert (=> b!924503 (= e!518817 e!518809)))

(declare-fun res!623162 () Bool)

(assert (=> b!924503 (=> (not res!623162) (not e!518809))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!924503 (= res!623162 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27091 _keys!1487)))))

(declare-datatypes ((Unit!31144 0))(
  ( (Unit!31145) )
))
(declare-fun lt!415678 () Unit!31144)

(declare-fun e!518818 () Unit!31144)

(assert (=> b!924503 (= lt!415678 e!518818)))

(declare-fun c!96407 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924503 (= c!96407 (validKeyInArray!0 k0!1099))))

(declare-fun e!518811 () Bool)

(declare-fun b!924504 () Bool)

(declare-fun arrayContainsKey!0 (array!55369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924504 (= e!518811 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!31323 () Bool)

(assert (=> mapIsEmpty!31323 mapRes!31323))

(declare-fun b!924505 () Bool)

(declare-fun e!518813 () Bool)

(assert (=> b!924505 (= e!518813 e!518817)))

(declare-fun res!623160 () Bool)

(assert (=> b!924505 (=> (not res!623160) (not e!518817))))

(declare-fun v!791 () V!31247)

(declare-fun lt!415681 () V!31247)

(assert (=> b!924505 (= res!623160 (and (= lt!415681 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12972 0))(
  ( (tuple2!12973 (_1!6497 (_ BitVec 64)) (_2!6497 V!31247)) )
))
(declare-datatypes ((List!18748 0))(
  ( (Nil!18745) (Cons!18744 (h!19890 tuple2!12972) (t!26672 List!18748)) )
))
(declare-datatypes ((ListLongMap!11659 0))(
  ( (ListLongMap!11660 (toList!5845 List!18748)) )
))
(declare-fun lt!415687 () ListLongMap!11659)

(declare-fun apply!656 (ListLongMap!11659 (_ BitVec 64)) V!31247)

(assert (=> b!924505 (= lt!415681 (apply!656 lt!415687 k0!1099))))

(declare-fun b!924506 () Bool)

(declare-fun res!623164 () Bool)

(assert (=> b!924506 (=> (not res!623164) (not e!518819))))

(assert (=> b!924506 (= res!623164 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27091 _keys!1487))))))

(declare-fun b!924507 () Bool)

(declare-fun e!518810 () Bool)

(assert (=> b!924507 (= e!518810 false)))

(declare-fun lt!415682 () V!31247)

(declare-fun lt!415684 () ListLongMap!11659)

(assert (=> b!924507 (= lt!415682 (apply!656 lt!415684 k0!1099))))

(declare-fun b!924508 () Bool)

(declare-fun e!518812 () Bool)

(declare-fun tp_is_empty!19711 () Bool)

(assert (=> b!924508 (= e!518812 tp_is_empty!19711)))

(declare-fun b!924509 () Bool)

(assert (=> b!924509 (= e!518809 e!518810)))

(declare-fun res!623168 () Bool)

(assert (=> b!924509 (=> (not res!623168) (not e!518810))))

(declare-fun contains!4857 (ListLongMap!11659 (_ BitVec 64)) Bool)

(assert (=> b!924509 (= res!623168 (contains!4857 lt!415684 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31247)

(declare-fun minValue!1173 () V!31247)

(declare-fun getCurrentListMap!3031 (array!55369 array!55367 (_ BitVec 32) (_ BitVec 32) V!31247 V!31247 (_ BitVec 32) Int) ListLongMap!11659)

(assert (=> b!924509 (= lt!415684 (getCurrentListMap!3031 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924510 () Bool)

(assert (=> b!924510 (= e!518811 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924511 () Bool)

(declare-fun res!623167 () Bool)

(assert (=> b!924511 (=> (not res!623167) (not e!518819))))

(declare-datatypes ((List!18749 0))(
  ( (Nil!18746) (Cons!18745 (h!19891 (_ BitVec 64)) (t!26673 List!18749)) )
))
(declare-fun arrayNoDuplicates!0 (array!55369 (_ BitVec 32) List!18749) Bool)

(assert (=> b!924511 (= res!623167 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18746))))

(declare-fun b!924512 () Bool)

(declare-fun Unit!31146 () Unit!31144)

(assert (=> b!924512 (= e!518818 Unit!31146)))

(declare-fun b!924513 () Bool)

(assert (=> b!924513 (= e!518816 tp_is_empty!19711)))

(declare-fun b!924514 () Bool)

(declare-fun lt!415689 () ListLongMap!11659)

(assert (=> b!924514 (= (apply!656 lt!415689 k0!1099) lt!415681)))

(declare-fun lt!415688 () (_ BitVec 64))

(declare-fun lt!415691 () V!31247)

(declare-fun lt!415685 () Unit!31144)

(declare-fun addApplyDifferent!370 (ListLongMap!11659 (_ BitVec 64) V!31247 (_ BitVec 64)) Unit!31144)

(assert (=> b!924514 (= lt!415685 (addApplyDifferent!370 lt!415687 lt!415688 lt!415691 k0!1099))))

(assert (=> b!924514 (not (= lt!415688 k0!1099))))

(declare-fun lt!415686 () Unit!31144)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55369 (_ BitVec 64) (_ BitVec 32) List!18749) Unit!31144)

(assert (=> b!924514 (= lt!415686 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18746))))

(assert (=> b!924514 e!518811))

(declare-fun c!96408 () Bool)

(assert (=> b!924514 (= c!96408 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415679 () Unit!31144)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!230 (array!55369 array!55367 (_ BitVec 32) (_ BitVec 32) V!31247 V!31247 (_ BitVec 64) (_ BitVec 32) Int) Unit!31144)

(assert (=> b!924514 (= lt!415679 (lemmaListMapContainsThenArrayContainsFrom!230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!924514 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18746)))

(declare-fun lt!415690 () Unit!31144)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55369 (_ BitVec 32) (_ BitVec 32)) Unit!31144)

(assert (=> b!924514 (= lt!415690 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924514 (contains!4857 lt!415689 k0!1099)))

(declare-fun lt!415677 () tuple2!12972)

(declare-fun +!2742 (ListLongMap!11659 tuple2!12972) ListLongMap!11659)

(assert (=> b!924514 (= lt!415689 (+!2742 lt!415687 lt!415677))))

(declare-fun lt!415680 () Unit!31144)

(declare-fun addStillContains!439 (ListLongMap!11659 (_ BitVec 64) V!31247 (_ BitVec 64)) Unit!31144)

(assert (=> b!924514 (= lt!415680 (addStillContains!439 lt!415687 lt!415688 lt!415691 k0!1099))))

(assert (=> b!924514 (= (getCurrentListMap!3031 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2742 (getCurrentListMap!3031 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415677))))

(assert (=> b!924514 (= lt!415677 (tuple2!12973 lt!415688 lt!415691))))

(declare-fun get!14005 (ValueCell!9374 V!31247) V!31247)

(declare-fun dynLambda!1498 (Int (_ BitVec 64)) V!31247)

(assert (=> b!924514 (= lt!415691 (get!14005 (select (arr!26629 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1498 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415683 () Unit!31144)

(declare-fun lemmaListMapRecursiveValidKeyArray!106 (array!55369 array!55367 (_ BitVec 32) (_ BitVec 32) V!31247 V!31247 (_ BitVec 32) Int) Unit!31144)

(assert (=> b!924514 (= lt!415683 (lemmaListMapRecursiveValidKeyArray!106 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!518814 () Unit!31144)

(assert (=> b!924514 (= e!518814 lt!415685)))

(declare-fun b!924515 () Bool)

(declare-fun res!623163 () Bool)

(assert (=> b!924515 (=> (not res!623163) (not e!518819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55369 (_ BitVec 32)) Bool)

(assert (=> b!924515 (= res!623163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!623166 () Bool)

(assert (=> start!78972 (=> (not res!623166) (not e!518819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78972 (= res!623166 (validMask!0 mask!1881))))

(assert (=> start!78972 e!518819))

(assert (=> start!78972 true))

(assert (=> start!78972 tp_is_empty!19711))

(declare-fun e!518815 () Bool)

(declare-fun array_inv!20822 (array!55367) Bool)

(assert (=> start!78972 (and (array_inv!20822 _values!1231) e!518815)))

(assert (=> start!78972 tp!60051))

(declare-fun array_inv!20823 (array!55369) Bool)

(assert (=> start!78972 (array_inv!20823 _keys!1487)))

(declare-fun b!924516 () Bool)

(assert (=> b!924516 (= e!518818 e!518814)))

(assert (=> b!924516 (= lt!415688 (select (arr!26630 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96409 () Bool)

(assert (=> b!924516 (= c!96409 (validKeyInArray!0 lt!415688))))

(declare-fun b!924517 () Bool)

(declare-fun Unit!31147 () Unit!31144)

(assert (=> b!924517 (= e!518814 Unit!31147)))

(declare-fun b!924518 () Bool)

(assert (=> b!924518 (= e!518815 (and e!518812 mapRes!31323))))

(declare-fun condMapEmpty!31323 () Bool)

(declare-fun mapDefault!31323 () ValueCell!9374)

(assert (=> b!924518 (= condMapEmpty!31323 (= (arr!26629 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9374)) mapDefault!31323)))))

(declare-fun b!924519 () Bool)

(assert (=> b!924519 (= e!518819 e!518813)))

(declare-fun res!623161 () Bool)

(assert (=> b!924519 (=> (not res!623161) (not e!518813))))

(assert (=> b!924519 (= res!623161 (contains!4857 lt!415687 k0!1099))))

(assert (=> b!924519 (= lt!415687 (getCurrentListMap!3031 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78972 res!623166) b!924502))

(assert (= (and b!924502 res!623165) b!924515))

(assert (= (and b!924515 res!623163) b!924511))

(assert (= (and b!924511 res!623167) b!924506))

(assert (= (and b!924506 res!623164) b!924519))

(assert (= (and b!924519 res!623161) b!924505))

(assert (= (and b!924505 res!623160) b!924503))

(assert (= (and b!924503 c!96407) b!924516))

(assert (= (and b!924503 (not c!96407)) b!924512))

(assert (= (and b!924516 c!96409) b!924514))

(assert (= (and b!924516 (not c!96409)) b!924517))

(assert (= (and b!924514 c!96408) b!924504))

(assert (= (and b!924514 (not c!96408)) b!924510))

(assert (= (and b!924503 res!623162) b!924509))

(assert (= (and b!924509 res!623168) b!924507))

(assert (= (and b!924518 condMapEmpty!31323) mapIsEmpty!31323))

(assert (= (and b!924518 (not condMapEmpty!31323)) mapNonEmpty!31323))

(get-info :version)

(assert (= (and mapNonEmpty!31323 ((_ is ValueCellFull!9374) mapValue!31323)) b!924513))

(assert (= (and b!924518 ((_ is ValueCellFull!9374) mapDefault!31323)) b!924508))

(assert (= start!78972 b!924518))

(declare-fun b_lambda!13687 () Bool)

(assert (=> (not b_lambda!13687) (not b!924514)))

(declare-fun t!26671 () Bool)

(declare-fun tb!5775 () Bool)

(assert (=> (and start!78972 (= defaultEntry!1235 defaultEntry!1235) t!26671) tb!5775))

(declare-fun result!11381 () Bool)

(assert (=> tb!5775 (= result!11381 tp_is_empty!19711)))

(assert (=> b!924514 t!26671))

(declare-fun b_and!28119 () Bool)

(assert (= b_and!28117 (and (=> t!26671 result!11381) b_and!28119)))

(declare-fun m!858325 () Bool)

(assert (=> start!78972 m!858325))

(declare-fun m!858327 () Bool)

(assert (=> start!78972 m!858327))

(declare-fun m!858329 () Bool)

(assert (=> start!78972 m!858329))

(declare-fun m!858331 () Bool)

(assert (=> b!924504 m!858331))

(declare-fun m!858333 () Bool)

(assert (=> b!924519 m!858333))

(declare-fun m!858335 () Bool)

(assert (=> b!924519 m!858335))

(declare-fun m!858337 () Bool)

(assert (=> b!924515 m!858337))

(declare-fun m!858339 () Bool)

(assert (=> b!924509 m!858339))

(declare-fun m!858341 () Bool)

(assert (=> b!924509 m!858341))

(declare-fun m!858343 () Bool)

(assert (=> b!924516 m!858343))

(declare-fun m!858345 () Bool)

(assert (=> b!924516 m!858345))

(declare-fun m!858347 () Bool)

(assert (=> b!924514 m!858347))

(declare-fun m!858349 () Bool)

(assert (=> b!924514 m!858349))

(declare-fun m!858351 () Bool)

(assert (=> b!924514 m!858351))

(assert (=> b!924514 m!858349))

(assert (=> b!924514 m!858351))

(declare-fun m!858353 () Bool)

(assert (=> b!924514 m!858353))

(assert (=> b!924514 m!858341))

(declare-fun m!858355 () Bool)

(assert (=> b!924514 m!858355))

(declare-fun m!858357 () Bool)

(assert (=> b!924514 m!858357))

(declare-fun m!858359 () Bool)

(assert (=> b!924514 m!858359))

(declare-fun m!858361 () Bool)

(assert (=> b!924514 m!858361))

(declare-fun m!858363 () Bool)

(assert (=> b!924514 m!858363))

(declare-fun m!858365 () Bool)

(assert (=> b!924514 m!858365))

(declare-fun m!858367 () Bool)

(assert (=> b!924514 m!858367))

(declare-fun m!858369 () Bool)

(assert (=> b!924514 m!858369))

(declare-fun m!858371 () Bool)

(assert (=> b!924514 m!858371))

(declare-fun m!858373 () Bool)

(assert (=> b!924514 m!858373))

(assert (=> b!924514 m!858365))

(declare-fun m!858375 () Bool)

(assert (=> b!924514 m!858375))

(declare-fun m!858377 () Bool)

(assert (=> b!924505 m!858377))

(declare-fun m!858379 () Bool)

(assert (=> b!924511 m!858379))

(declare-fun m!858381 () Bool)

(assert (=> mapNonEmpty!31323 m!858381))

(declare-fun m!858383 () Bool)

(assert (=> b!924507 m!858383))

(declare-fun m!858385 () Bool)

(assert (=> b!924503 m!858385))

(check-sat (not mapNonEmpty!31323) (not b!924511) (not b!924503) b_and!28119 (not b!924509) (not b!924519) tp_is_empty!19711 (not b!924515) (not b!924504) (not b!924507) (not start!78972) (not b!924514) (not b_lambda!13687) (not b!924505) (not b_next!17203) (not b!924516))
(check-sat b_and!28119 (not b_next!17203))
