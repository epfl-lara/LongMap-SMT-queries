; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79092 () Bool)

(assert start!79092)

(declare-fun b_free!17323 () Bool)

(declare-fun b_next!17323 () Bool)

(assert (=> start!79092 (= b_free!17323 (not b_next!17323))))

(declare-fun tp!60410 () Bool)

(declare-fun b_and!28357 () Bool)

(assert (=> start!79092 (= tp!60410 b_and!28357)))

(declare-fun b!928190 () Bool)

(declare-fun res!625115 () Bool)

(declare-fun e!521136 () Bool)

(assert (=> b!928190 (=> (not res!625115) (not e!521136))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31407 0))(
  ( (V!31408 (val!9966 Int)) )
))
(declare-datatypes ((tuple2!13074 0))(
  ( (tuple2!13075 (_1!6548 (_ BitVec 64)) (_2!6548 V!31407)) )
))
(declare-datatypes ((List!18843 0))(
  ( (Nil!18840) (Cons!18839 (h!19985 tuple2!13074) (t!26887 List!18843)) )
))
(declare-datatypes ((ListLongMap!11761 0))(
  ( (ListLongMap!11762 (toList!5896 List!18843)) )
))
(declare-fun lt!418553 () ListLongMap!11761)

(declare-fun v!791 () V!31407)

(declare-fun apply!705 (ListLongMap!11761 (_ BitVec 64)) V!31407)

(assert (=> b!928190 (= res!625115 (= (apply!705 lt!418553 k0!1099) v!791))))

(declare-fun b!928191 () Bool)

(declare-fun e!521145 () Bool)

(declare-fun e!521135 () Bool)

(declare-fun mapRes!31503 () Bool)

(assert (=> b!928191 (= e!521145 (and e!521135 mapRes!31503))))

(declare-fun condMapEmpty!31503 () Bool)

(declare-datatypes ((ValueCell!9434 0))(
  ( (ValueCellFull!9434 (v!12483 V!31407)) (EmptyCell!9434) )
))
(declare-datatypes ((array!55593 0))(
  ( (array!55594 (arr!26742 (Array (_ BitVec 32) ValueCell!9434)) (size!27203 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55593)

(declare-fun mapDefault!31503 () ValueCell!9434)

(assert (=> b!928191 (= condMapEmpty!31503 (= (arr!26742 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9434)) mapDefault!31503)))))

(declare-fun b!928192 () Bool)

(declare-fun res!625109 () Bool)

(declare-fun e!521138 () Bool)

(assert (=> b!928192 (=> (not res!625109) (not e!521138))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55595 0))(
  ( (array!55596 (arr!26743 (Array (_ BitVec 32) (_ BitVec 64))) (size!27204 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55595)

(assert (=> b!928192 (= res!625109 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27204 _keys!1487))))))

(declare-fun b!928193 () Bool)

(declare-fun e!521142 () Bool)

(declare-fun tp_is_empty!19831 () Bool)

(assert (=> b!928193 (= e!521142 tp_is_empty!19831)))

(declare-fun b!928194 () Bool)

(declare-fun e!521134 () Bool)

(declare-fun lt!418550 () ListLongMap!11761)

(assert (=> b!928194 (= e!521134 (= (apply!705 lt!418550 k0!1099) v!791))))

(declare-fun b!928195 () Bool)

(declare-datatypes ((Unit!31324 0))(
  ( (Unit!31325) )
))
(declare-fun e!521139 () Unit!31324)

(declare-fun e!521143 () Unit!31324)

(assert (=> b!928195 (= e!521139 e!521143)))

(declare-fun lt!418554 () (_ BitVec 64))

(assert (=> b!928195 (= lt!418554 (select (arr!26743 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96947 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928195 (= c!96947 (validKeyInArray!0 lt!418554))))

(declare-fun b!928196 () Bool)

(declare-fun res!625110 () Bool)

(assert (=> b!928196 (=> (not res!625110) (not e!521138))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!928196 (= res!625110 (and (= (size!27203 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27204 _keys!1487) (size!27203 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928197 () Bool)

(declare-fun res!625108 () Bool)

(assert (=> b!928197 (=> (not res!625108) (not e!521138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55595 (_ BitVec 32)) Bool)

(assert (=> b!928197 (= res!625108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928198 () Bool)

(assert (=> b!928198 (= e!521136 (not true))))

(assert (=> b!928198 e!521134))

(declare-fun res!625116 () Bool)

(assert (=> b!928198 (=> (not res!625116) (not e!521134))))

(declare-fun contains!4907 (ListLongMap!11761 (_ BitVec 64)) Bool)

(assert (=> b!928198 (= res!625116 (contains!4907 lt!418550 k0!1099))))

(declare-fun zeroValue!1173 () V!31407)

(declare-fun minValue!1173 () V!31407)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3081 (array!55595 array!55593 (_ BitVec 32) (_ BitVec 32) V!31407 V!31407 (_ BitVec 32) Int) ListLongMap!11761)

(assert (=> b!928198 (= lt!418550 (getCurrentListMap!3081 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418547 () Unit!31324)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!107 (array!55595 array!55593 (_ BitVec 32) (_ BitVec 32) V!31407 V!31407 (_ BitVec 64) V!31407 (_ BitVec 32) Int) Unit!31324)

(assert (=> b!928198 (= lt!418547 (lemmaListMapApplyFromThenApplyFromZero!107 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928199 () Bool)

(declare-fun lt!418543 () ListLongMap!11761)

(declare-fun lt!418548 () V!31407)

(assert (=> b!928199 (= (apply!705 lt!418543 k0!1099) lt!418548)))

(declare-fun lt!418542 () ListLongMap!11761)

(declare-fun lt!418556 () V!31407)

(declare-fun lt!418555 () Unit!31324)

(declare-fun addApplyDifferent!410 (ListLongMap!11761 (_ BitVec 64) V!31407 (_ BitVec 64)) Unit!31324)

(assert (=> b!928199 (= lt!418555 (addApplyDifferent!410 lt!418542 lt!418554 lt!418556 k0!1099))))

(assert (=> b!928199 (not (= lt!418554 k0!1099))))

(declare-fun lt!418545 () Unit!31324)

(declare-datatypes ((List!18844 0))(
  ( (Nil!18841) (Cons!18840 (h!19986 (_ BitVec 64)) (t!26888 List!18844)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55595 (_ BitVec 64) (_ BitVec 32) List!18844) Unit!31324)

(assert (=> b!928199 (= lt!418545 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18841))))

(declare-fun e!521140 () Bool)

(assert (=> b!928199 e!521140))

(declare-fun c!96948 () Bool)

(assert (=> b!928199 (= c!96948 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418546 () Unit!31324)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!270 (array!55595 array!55593 (_ BitVec 32) (_ BitVec 32) V!31407 V!31407 (_ BitVec 64) (_ BitVec 32) Int) Unit!31324)

(assert (=> b!928199 (= lt!418546 (lemmaListMapContainsThenArrayContainsFrom!270 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55595 (_ BitVec 32) List!18844) Bool)

(assert (=> b!928199 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18841)))

(declare-fun lt!418544 () Unit!31324)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55595 (_ BitVec 32) (_ BitVec 32)) Unit!31324)

(assert (=> b!928199 (= lt!418544 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928199 (contains!4907 lt!418543 k0!1099)))

(declare-fun lt!418552 () tuple2!13074)

(declare-fun +!2782 (ListLongMap!11761 tuple2!13074) ListLongMap!11761)

(assert (=> b!928199 (= lt!418543 (+!2782 lt!418542 lt!418552))))

(declare-fun lt!418551 () Unit!31324)

(declare-fun addStillContains!479 (ListLongMap!11761 (_ BitVec 64) V!31407 (_ BitVec 64)) Unit!31324)

(assert (=> b!928199 (= lt!418551 (addStillContains!479 lt!418542 lt!418554 lt!418556 k0!1099))))

(assert (=> b!928199 (= (getCurrentListMap!3081 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2782 (getCurrentListMap!3081 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418552))))

(assert (=> b!928199 (= lt!418552 (tuple2!13075 lt!418554 lt!418556))))

(declare-fun get!14085 (ValueCell!9434 V!31407) V!31407)

(declare-fun dynLambda!1538 (Int (_ BitVec 64)) V!31407)

(assert (=> b!928199 (= lt!418556 (get!14085 (select (arr!26742 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1538 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418549 () Unit!31324)

(declare-fun lemmaListMapRecursiveValidKeyArray!146 (array!55595 array!55593 (_ BitVec 32) (_ BitVec 32) V!31407 V!31407 (_ BitVec 32) Int) Unit!31324)

(assert (=> b!928199 (= lt!418549 (lemmaListMapRecursiveValidKeyArray!146 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!928199 (= e!521143 lt!418555)))

(declare-fun b!928201 () Bool)

(declare-fun e!521137 () Bool)

(declare-fun e!521144 () Bool)

(assert (=> b!928201 (= e!521137 e!521144)))

(declare-fun res!625117 () Bool)

(assert (=> b!928201 (=> (not res!625117) (not e!521144))))

(assert (=> b!928201 (= res!625117 (and (= lt!418548 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!928201 (= lt!418548 (apply!705 lt!418542 k0!1099))))

(declare-fun b!928202 () Bool)

(declare-fun Unit!31326 () Unit!31324)

(assert (=> b!928202 (= e!521143 Unit!31326)))

(declare-fun b!928203 () Bool)

(declare-fun e!521141 () Bool)

(assert (=> b!928203 (= e!521144 e!521141)))

(declare-fun res!625113 () Bool)

(assert (=> b!928203 (=> (not res!625113) (not e!521141))))

(assert (=> b!928203 (= res!625113 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27204 _keys!1487)))))

(declare-fun lt!418541 () Unit!31324)

(assert (=> b!928203 (= lt!418541 e!521139)))

(declare-fun c!96949 () Bool)

(assert (=> b!928203 (= c!96949 (validKeyInArray!0 k0!1099))))

(declare-fun b!928204 () Bool)

(assert (=> b!928204 (= e!521135 tp_is_empty!19831)))

(declare-fun mapNonEmpty!31503 () Bool)

(declare-fun tp!60411 () Bool)

(assert (=> mapNonEmpty!31503 (= mapRes!31503 (and tp!60411 e!521142))))

(declare-fun mapKey!31503 () (_ BitVec 32))

(declare-fun mapValue!31503 () ValueCell!9434)

(declare-fun mapRest!31503 () (Array (_ BitVec 32) ValueCell!9434))

(assert (=> mapNonEmpty!31503 (= (arr!26742 _values!1231) (store mapRest!31503 mapKey!31503 mapValue!31503))))

(declare-fun mapIsEmpty!31503 () Bool)

(assert (=> mapIsEmpty!31503 mapRes!31503))

(declare-fun b!928205 () Bool)

(declare-fun res!625111 () Bool)

(assert (=> b!928205 (=> (not res!625111) (not e!521138))))

(assert (=> b!928205 (= res!625111 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18841))))

(declare-fun b!928206 () Bool)

(assert (=> b!928206 (= e!521140 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928207 () Bool)

(assert (=> b!928207 (= e!521141 e!521136)))

(declare-fun res!625112 () Bool)

(assert (=> b!928207 (=> (not res!625112) (not e!521136))))

(assert (=> b!928207 (= res!625112 (contains!4907 lt!418553 k0!1099))))

(assert (=> b!928207 (= lt!418553 (getCurrentListMap!3081 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928208 () Bool)

(declare-fun arrayContainsKey!0 (array!55595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928208 (= e!521140 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!928209 () Bool)

(assert (=> b!928209 (= e!521138 e!521137)))

(declare-fun res!625114 () Bool)

(assert (=> b!928209 (=> (not res!625114) (not e!521137))))

(assert (=> b!928209 (= res!625114 (contains!4907 lt!418542 k0!1099))))

(assert (=> b!928209 (= lt!418542 (getCurrentListMap!3081 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!625118 () Bool)

(assert (=> start!79092 (=> (not res!625118) (not e!521138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79092 (= res!625118 (validMask!0 mask!1881))))

(assert (=> start!79092 e!521138))

(assert (=> start!79092 true))

(assert (=> start!79092 tp_is_empty!19831))

(declare-fun array_inv!20910 (array!55593) Bool)

(assert (=> start!79092 (and (array_inv!20910 _values!1231) e!521145)))

(assert (=> start!79092 tp!60410))

(declare-fun array_inv!20911 (array!55595) Bool)

(assert (=> start!79092 (array_inv!20911 _keys!1487)))

(declare-fun b!928200 () Bool)

(declare-fun Unit!31327 () Unit!31324)

(assert (=> b!928200 (= e!521139 Unit!31327)))

(assert (= (and start!79092 res!625118) b!928196))

(assert (= (and b!928196 res!625110) b!928197))

(assert (= (and b!928197 res!625108) b!928205))

(assert (= (and b!928205 res!625111) b!928192))

(assert (= (and b!928192 res!625109) b!928209))

(assert (= (and b!928209 res!625114) b!928201))

(assert (= (and b!928201 res!625117) b!928203))

(assert (= (and b!928203 c!96949) b!928195))

(assert (= (and b!928203 (not c!96949)) b!928200))

(assert (= (and b!928195 c!96947) b!928199))

(assert (= (and b!928195 (not c!96947)) b!928202))

(assert (= (and b!928199 c!96948) b!928208))

(assert (= (and b!928199 (not c!96948)) b!928206))

(assert (= (and b!928203 res!625113) b!928207))

(assert (= (and b!928207 res!625112) b!928190))

(assert (= (and b!928190 res!625115) b!928198))

(assert (= (and b!928198 res!625116) b!928194))

(assert (= (and b!928191 condMapEmpty!31503) mapIsEmpty!31503))

(assert (= (and b!928191 (not condMapEmpty!31503)) mapNonEmpty!31503))

(get-info :version)

(assert (= (and mapNonEmpty!31503 ((_ is ValueCellFull!9434) mapValue!31503)) b!928193))

(assert (= (and b!928191 ((_ is ValueCellFull!9434) mapDefault!31503)) b!928204))

(assert (= start!79092 b!928191))

(declare-fun b_lambda!13807 () Bool)

(assert (=> (not b_lambda!13807) (not b!928199)))

(declare-fun t!26886 () Bool)

(declare-fun tb!5895 () Bool)

(assert (=> (and start!79092 (= defaultEntry!1235 defaultEntry!1235) t!26886) tb!5895))

(declare-fun result!11621 () Bool)

(assert (=> tb!5895 (= result!11621 tp_is_empty!19831)))

(assert (=> b!928199 t!26886))

(declare-fun b_and!28359 () Bool)

(assert (= b_and!28357 (and (=> t!26886 result!11621) b_and!28359)))

(declare-fun m!862477 () Bool)

(assert (=> b!928203 m!862477))

(declare-fun m!862479 () Bool)

(assert (=> mapNonEmpty!31503 m!862479))

(declare-fun m!862481 () Bool)

(assert (=> b!928199 m!862481))

(declare-fun m!862483 () Bool)

(assert (=> b!928199 m!862483))

(declare-fun m!862485 () Bool)

(assert (=> b!928199 m!862485))

(declare-fun m!862487 () Bool)

(assert (=> b!928199 m!862487))

(declare-fun m!862489 () Bool)

(assert (=> b!928199 m!862489))

(declare-fun m!862491 () Bool)

(assert (=> b!928199 m!862491))

(assert (=> b!928199 m!862489))

(assert (=> b!928199 m!862491))

(declare-fun m!862493 () Bool)

(assert (=> b!928199 m!862493))

(declare-fun m!862495 () Bool)

(assert (=> b!928199 m!862495))

(declare-fun m!862497 () Bool)

(assert (=> b!928199 m!862497))

(declare-fun m!862499 () Bool)

(assert (=> b!928199 m!862499))

(declare-fun m!862501 () Bool)

(assert (=> b!928199 m!862501))

(declare-fun m!862503 () Bool)

(assert (=> b!928199 m!862503))

(assert (=> b!928199 m!862481))

(declare-fun m!862505 () Bool)

(assert (=> b!928199 m!862505))

(declare-fun m!862507 () Bool)

(assert (=> b!928199 m!862507))

(declare-fun m!862509 () Bool)

(assert (=> b!928199 m!862509))

(declare-fun m!862511 () Bool)

(assert (=> b!928199 m!862511))

(declare-fun m!862513 () Bool)

(assert (=> b!928190 m!862513))

(declare-fun m!862515 () Bool)

(assert (=> b!928194 m!862515))

(declare-fun m!862517 () Bool)

(assert (=> b!928209 m!862517))

(declare-fun m!862519 () Bool)

(assert (=> b!928209 m!862519))

(declare-fun m!862521 () Bool)

(assert (=> b!928207 m!862521))

(assert (=> b!928207 m!862495))

(declare-fun m!862523 () Bool)

(assert (=> b!928197 m!862523))

(declare-fun m!862525 () Bool)

(assert (=> b!928205 m!862525))

(declare-fun m!862527 () Bool)

(assert (=> b!928208 m!862527))

(declare-fun m!862529 () Bool)

(assert (=> b!928198 m!862529))

(declare-fun m!862531 () Bool)

(assert (=> b!928198 m!862531))

(declare-fun m!862533 () Bool)

(assert (=> b!928198 m!862533))

(declare-fun m!862535 () Bool)

(assert (=> b!928195 m!862535))

(declare-fun m!862537 () Bool)

(assert (=> b!928195 m!862537))

(declare-fun m!862539 () Bool)

(assert (=> start!79092 m!862539))

(declare-fun m!862541 () Bool)

(assert (=> start!79092 m!862541))

(declare-fun m!862543 () Bool)

(assert (=> start!79092 m!862543))

(declare-fun m!862545 () Bool)

(assert (=> b!928201 m!862545))

(check-sat (not b!928197) (not b_lambda!13807) (not mapNonEmpty!31503) (not b!928209) (not b!928207) (not b!928203) (not b!928194) (not b!928199) (not b_next!17323) (not b!928205) (not b!928201) (not b!928198) tp_is_empty!19831 (not b!928208) (not b!928195) b_and!28359 (not start!79092) (not b!928190))
(check-sat b_and!28359 (not b_next!17323))
