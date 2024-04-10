; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79076 () Bool)

(assert start!79076)

(declare-fun b_free!17289 () Bool)

(declare-fun b_next!17289 () Bool)

(assert (=> start!79076 (= b_free!17289 (not b_next!17289))))

(declare-fun tp!60307 () Bool)

(declare-fun b_and!28315 () Bool)

(assert (=> start!79076 (= tp!60307 b_and!28315)))

(declare-fun b!927375 () Bool)

(declare-fun e!520630 () Bool)

(declare-fun e!520628 () Bool)

(assert (=> b!927375 (= e!520630 e!520628)))

(declare-fun res!624664 () Bool)

(assert (=> b!927375 (=> (not res!624664) (not e!520628))))

(declare-datatypes ((V!31361 0))(
  ( (V!31362 (val!9949 Int)) )
))
(declare-datatypes ((tuple2!12988 0))(
  ( (tuple2!12989 (_1!6505 (_ BitVec 64)) (_2!6505 V!31361)) )
))
(declare-datatypes ((List!18789 0))(
  ( (Nil!18786) (Cons!18785 (h!19931 tuple2!12988) (t!26808 List!18789)) )
))
(declare-datatypes ((ListLongMap!11685 0))(
  ( (ListLongMap!11686 (toList!5858 List!18789)) )
))
(declare-fun lt!417967 () ListLongMap!11685)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4916 (ListLongMap!11685 (_ BitVec 64)) Bool)

(assert (=> b!927375 (= res!624664 (contains!4916 lt!417967 k0!1099))))

(declare-datatypes ((array!55556 0))(
  ( (array!55557 (arr!26723 (Array (_ BitVec 32) (_ BitVec 64))) (size!27182 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55556)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9417 0))(
  ( (ValueCellFull!9417 (v!12467 V!31361)) (EmptyCell!9417) )
))
(declare-datatypes ((array!55558 0))(
  ( (array!55559 (arr!26724 (Array (_ BitVec 32) ValueCell!9417)) (size!27183 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55558)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31361)

(declare-fun minValue!1173 () V!31361)

(declare-fun getCurrentListMap!3107 (array!55556 array!55558 (_ BitVec 32) (_ BitVec 32) V!31361 V!31361 (_ BitVec 32) Int) ListLongMap!11685)

(assert (=> b!927375 (= lt!417967 (getCurrentListMap!3107 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!417964 () ListLongMap!11685)

(declare-fun v!791 () V!31361)

(declare-fun e!520623 () Bool)

(declare-fun b!927376 () Bool)

(declare-fun apply!688 (ListLongMap!11685 (_ BitVec 64)) V!31361)

(assert (=> b!927376 (= e!520623 (= (apply!688 lt!417964 k0!1099) v!791))))

(declare-fun e!520618 () Bool)

(declare-fun b!927377 () Bool)

(declare-fun arrayContainsKey!0 (array!55556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927377 (= e!520618 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927378 () Bool)

(declare-datatypes ((Unit!31363 0))(
  ( (Unit!31364) )
))
(declare-fun e!520627 () Unit!31363)

(declare-fun Unit!31365 () Unit!31363)

(assert (=> b!927378 (= e!520627 Unit!31365)))

(declare-fun b!927379 () Bool)

(declare-fun e!520621 () Unit!31363)

(assert (=> b!927379 (= e!520621 e!520627)))

(declare-fun lt!417971 () (_ BitVec 64))

(assert (=> b!927379 (= lt!417971 (select (arr!26723 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96860 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927379 (= c!96860 (validKeyInArray!0 lt!417971))))

(declare-fun res!624666 () Bool)

(declare-fun e!520625 () Bool)

(assert (=> start!79076 (=> (not res!624666) (not e!520625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79076 (= res!624666 (validMask!0 mask!1881))))

(assert (=> start!79076 e!520625))

(assert (=> start!79076 true))

(declare-fun tp_is_empty!19797 () Bool)

(assert (=> start!79076 tp_is_empty!19797))

(declare-fun e!520626 () Bool)

(declare-fun array_inv!20810 (array!55558) Bool)

(assert (=> start!79076 (and (array_inv!20810 _values!1231) e!520626)))

(assert (=> start!79076 tp!60307))

(declare-fun array_inv!20811 (array!55556) Bool)

(assert (=> start!79076 (array_inv!20811 _keys!1487)))

(declare-fun b!927380 () Bool)

(assert (=> b!927380 (= e!520618 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927381 () Bool)

(declare-fun e!520629 () Bool)

(assert (=> b!927381 (= e!520629 tp_is_empty!19797)))

(declare-fun b!927382 () Bool)

(assert (=> b!927382 (= e!520628 (not true))))

(assert (=> b!927382 e!520623))

(declare-fun res!624662 () Bool)

(assert (=> b!927382 (=> (not res!624662) (not e!520623))))

(assert (=> b!927382 (= res!624662 (contains!4916 lt!417964 k0!1099))))

(assert (=> b!927382 (= lt!417964 (getCurrentListMap!3107 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417975 () Unit!31363)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!88 (array!55556 array!55558 (_ BitVec 32) (_ BitVec 32) V!31361 V!31361 (_ BitVec 64) V!31361 (_ BitVec 32) Int) Unit!31363)

(assert (=> b!927382 (= lt!417975 (lemmaListMapApplyFromThenApplyFromZero!88 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927383 () Bool)

(declare-fun res!624657 () Bool)

(assert (=> b!927383 (=> (not res!624657) (not e!520628))))

(assert (=> b!927383 (= res!624657 (= (apply!688 lt!417967 k0!1099) v!791))))

(declare-fun b!927384 () Bool)

(declare-fun e!520619 () Bool)

(assert (=> b!927384 (= e!520619 e!520630)))

(declare-fun res!624661 () Bool)

(assert (=> b!927384 (=> (not res!624661) (not e!520630))))

(assert (=> b!927384 (= res!624661 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27182 _keys!1487)))))

(declare-fun lt!417970 () Unit!31363)

(assert (=> b!927384 (= lt!417970 e!520621)))

(declare-fun c!96861 () Bool)

(assert (=> b!927384 (= c!96861 (validKeyInArray!0 k0!1099))))

(declare-fun b!927385 () Bool)

(declare-fun e!520622 () Bool)

(assert (=> b!927385 (= e!520622 tp_is_empty!19797)))

(declare-fun b!927386 () Bool)

(declare-fun lt!417973 () ListLongMap!11685)

(declare-fun lt!417972 () V!31361)

(assert (=> b!927386 (= (apply!688 lt!417973 k0!1099) lt!417972)))

(declare-fun lt!417968 () Unit!31363)

(declare-fun lt!417961 () V!31361)

(declare-fun lt!417969 () ListLongMap!11685)

(declare-fun addApplyDifferent!403 (ListLongMap!11685 (_ BitVec 64) V!31361 (_ BitVec 64)) Unit!31363)

(assert (=> b!927386 (= lt!417968 (addApplyDifferent!403 lt!417969 lt!417971 lt!417961 k0!1099))))

(assert (=> b!927386 (not (= lt!417971 k0!1099))))

(declare-fun lt!417965 () Unit!31363)

(declare-datatypes ((List!18790 0))(
  ( (Nil!18787) (Cons!18786 (h!19932 (_ BitVec 64)) (t!26809 List!18790)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55556 (_ BitVec 64) (_ BitVec 32) List!18790) Unit!31363)

(assert (=> b!927386 (= lt!417965 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18787))))

(assert (=> b!927386 e!520618))

(declare-fun c!96859 () Bool)

(assert (=> b!927386 (= c!96859 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417974 () Unit!31363)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!254 (array!55556 array!55558 (_ BitVec 32) (_ BitVec 32) V!31361 V!31361 (_ BitVec 64) (_ BitVec 32) Int) Unit!31363)

(assert (=> b!927386 (= lt!417974 (lemmaListMapContainsThenArrayContainsFrom!254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55556 (_ BitVec 32) List!18790) Bool)

(assert (=> b!927386 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18787)))

(declare-fun lt!417966 () Unit!31363)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55556 (_ BitVec 32) (_ BitVec 32)) Unit!31363)

(assert (=> b!927386 (= lt!417966 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927386 (contains!4916 lt!417973 k0!1099)))

(declare-fun lt!417962 () tuple2!12988)

(declare-fun +!2747 (ListLongMap!11685 tuple2!12988) ListLongMap!11685)

(assert (=> b!927386 (= lt!417973 (+!2747 lt!417969 lt!417962))))

(declare-fun lt!417963 () Unit!31363)

(declare-fun addStillContains!471 (ListLongMap!11685 (_ BitVec 64) V!31361 (_ BitVec 64)) Unit!31363)

(assert (=> b!927386 (= lt!417963 (addStillContains!471 lt!417969 lt!417971 lt!417961 k0!1099))))

(assert (=> b!927386 (= (getCurrentListMap!3107 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2747 (getCurrentListMap!3107 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417962))))

(assert (=> b!927386 (= lt!417962 (tuple2!12989 lt!417971 lt!417961))))

(declare-fun get!14066 (ValueCell!9417 V!31361) V!31361)

(declare-fun dynLambda!1536 (Int (_ BitVec 64)) V!31361)

(assert (=> b!927386 (= lt!417961 (get!14066 (select (arr!26724 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1536 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417976 () Unit!31363)

(declare-fun lemmaListMapRecursiveValidKeyArray!137 (array!55556 array!55558 (_ BitVec 32) (_ BitVec 32) V!31361 V!31361 (_ BitVec 32) Int) Unit!31363)

(assert (=> b!927386 (= lt!417976 (lemmaListMapRecursiveValidKeyArray!137 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927386 (= e!520627 lt!417968)))

(declare-fun b!927387 () Bool)

(declare-fun mapRes!31452 () Bool)

(assert (=> b!927387 (= e!520626 (and e!520622 mapRes!31452))))

(declare-fun condMapEmpty!31452 () Bool)

(declare-fun mapDefault!31452 () ValueCell!9417)

(assert (=> b!927387 (= condMapEmpty!31452 (= (arr!26724 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9417)) mapDefault!31452)))))

(declare-fun b!927388 () Bool)

(declare-fun res!624667 () Bool)

(assert (=> b!927388 (=> (not res!624667) (not e!520625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55556 (_ BitVec 32)) Bool)

(assert (=> b!927388 (= res!624667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927389 () Bool)

(declare-fun Unit!31366 () Unit!31363)

(assert (=> b!927389 (= e!520621 Unit!31366)))

(declare-fun b!927390 () Bool)

(declare-fun res!624660 () Bool)

(assert (=> b!927390 (=> (not res!624660) (not e!520625))))

(assert (=> b!927390 (= res!624660 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27182 _keys!1487))))))

(declare-fun b!927391 () Bool)

(declare-fun res!624663 () Bool)

(assert (=> b!927391 (=> (not res!624663) (not e!520625))))

(assert (=> b!927391 (= res!624663 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18787))))

(declare-fun b!927392 () Bool)

(declare-fun e!520620 () Bool)

(assert (=> b!927392 (= e!520620 e!520619)))

(declare-fun res!624658 () Bool)

(assert (=> b!927392 (=> (not res!624658) (not e!520619))))

(assert (=> b!927392 (= res!624658 (and (= lt!417972 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927392 (= lt!417972 (apply!688 lt!417969 k0!1099))))

(declare-fun mapNonEmpty!31452 () Bool)

(declare-fun tp!60308 () Bool)

(assert (=> mapNonEmpty!31452 (= mapRes!31452 (and tp!60308 e!520629))))

(declare-fun mapValue!31452 () ValueCell!9417)

(declare-fun mapRest!31452 () (Array (_ BitVec 32) ValueCell!9417))

(declare-fun mapKey!31452 () (_ BitVec 32))

(assert (=> mapNonEmpty!31452 (= (arr!26724 _values!1231) (store mapRest!31452 mapKey!31452 mapValue!31452))))

(declare-fun mapIsEmpty!31452 () Bool)

(assert (=> mapIsEmpty!31452 mapRes!31452))

(declare-fun b!927393 () Bool)

(assert (=> b!927393 (= e!520625 e!520620)))

(declare-fun res!624659 () Bool)

(assert (=> b!927393 (=> (not res!624659) (not e!520620))))

(assert (=> b!927393 (= res!624659 (contains!4916 lt!417969 k0!1099))))

(assert (=> b!927393 (= lt!417969 (getCurrentListMap!3107 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927394 () Bool)

(declare-fun res!624665 () Bool)

(assert (=> b!927394 (=> (not res!624665) (not e!520625))))

(assert (=> b!927394 (= res!624665 (and (= (size!27183 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27182 _keys!1487) (size!27183 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79076 res!624666) b!927394))

(assert (= (and b!927394 res!624665) b!927388))

(assert (= (and b!927388 res!624667) b!927391))

(assert (= (and b!927391 res!624663) b!927390))

(assert (= (and b!927390 res!624660) b!927393))

(assert (= (and b!927393 res!624659) b!927392))

(assert (= (and b!927392 res!624658) b!927384))

(assert (= (and b!927384 c!96861) b!927379))

(assert (= (and b!927384 (not c!96861)) b!927389))

(assert (= (and b!927379 c!96860) b!927386))

(assert (= (and b!927379 (not c!96860)) b!927378))

(assert (= (and b!927386 c!96859) b!927377))

(assert (= (and b!927386 (not c!96859)) b!927380))

(assert (= (and b!927384 res!624661) b!927375))

(assert (= (and b!927375 res!624664) b!927383))

(assert (= (and b!927383 res!624657) b!927382))

(assert (= (and b!927382 res!624662) b!927376))

(assert (= (and b!927387 condMapEmpty!31452) mapIsEmpty!31452))

(assert (= (and b!927387 (not condMapEmpty!31452)) mapNonEmpty!31452))

(get-info :version)

(assert (= (and mapNonEmpty!31452 ((_ is ValueCellFull!9417) mapValue!31452)) b!927381))

(assert (= (and b!927387 ((_ is ValueCellFull!9417) mapDefault!31452)) b!927385))

(assert (= start!79076 b!927387))

(declare-fun b_lambda!13791 () Bool)

(assert (=> (not b_lambda!13791) (not b!927386)))

(declare-fun t!26807 () Bool)

(declare-fun tb!5869 () Bool)

(assert (=> (and start!79076 (= defaultEntry!1235 defaultEntry!1235) t!26807) tb!5869))

(declare-fun result!11561 () Bool)

(assert (=> tb!5869 (= result!11561 tp_is_empty!19797)))

(assert (=> b!927386 t!26807))

(declare-fun b_and!28317 () Bool)

(assert (= b_and!28315 (and (=> t!26807 result!11561) b_and!28317)))

(declare-fun m!862045 () Bool)

(assert (=> b!927377 m!862045))

(declare-fun m!862047 () Bool)

(assert (=> b!927391 m!862047))

(declare-fun m!862049 () Bool)

(assert (=> b!927392 m!862049))

(declare-fun m!862051 () Bool)

(assert (=> b!927393 m!862051))

(declare-fun m!862053 () Bool)

(assert (=> b!927393 m!862053))

(declare-fun m!862055 () Bool)

(assert (=> b!927386 m!862055))

(declare-fun m!862057 () Bool)

(assert (=> b!927386 m!862057))

(declare-fun m!862059 () Bool)

(assert (=> b!927386 m!862059))

(declare-fun m!862061 () Bool)

(assert (=> b!927386 m!862061))

(declare-fun m!862063 () Bool)

(assert (=> b!927386 m!862063))

(declare-fun m!862065 () Bool)

(assert (=> b!927386 m!862065))

(declare-fun m!862067 () Bool)

(assert (=> b!927386 m!862067))

(assert (=> b!927386 m!862061))

(assert (=> b!927386 m!862063))

(declare-fun m!862069 () Bool)

(assert (=> b!927386 m!862069))

(declare-fun m!862071 () Bool)

(assert (=> b!927386 m!862071))

(declare-fun m!862073 () Bool)

(assert (=> b!927386 m!862073))

(declare-fun m!862075 () Bool)

(assert (=> b!927386 m!862075))

(declare-fun m!862077 () Bool)

(assert (=> b!927386 m!862077))

(declare-fun m!862079 () Bool)

(assert (=> b!927386 m!862079))

(declare-fun m!862081 () Bool)

(assert (=> b!927386 m!862081))

(declare-fun m!862083 () Bool)

(assert (=> b!927386 m!862083))

(assert (=> b!927386 m!862057))

(declare-fun m!862085 () Bool)

(assert (=> b!927386 m!862085))

(declare-fun m!862087 () Bool)

(assert (=> b!927376 m!862087))

(declare-fun m!862089 () Bool)

(assert (=> b!927383 m!862089))

(declare-fun m!862091 () Bool)

(assert (=> start!79076 m!862091))

(declare-fun m!862093 () Bool)

(assert (=> start!79076 m!862093))

(declare-fun m!862095 () Bool)

(assert (=> start!79076 m!862095))

(declare-fun m!862097 () Bool)

(assert (=> b!927382 m!862097))

(declare-fun m!862099 () Bool)

(assert (=> b!927382 m!862099))

(declare-fun m!862101 () Bool)

(assert (=> b!927382 m!862101))

(declare-fun m!862103 () Bool)

(assert (=> b!927388 m!862103))

(declare-fun m!862105 () Bool)

(assert (=> b!927379 m!862105))

(declare-fun m!862107 () Bool)

(assert (=> b!927379 m!862107))

(declare-fun m!862109 () Bool)

(assert (=> b!927375 m!862109))

(assert (=> b!927375 m!862071))

(declare-fun m!862111 () Bool)

(assert (=> mapNonEmpty!31452 m!862111))

(declare-fun m!862113 () Bool)

(assert (=> b!927384 m!862113))

(check-sat (not b_next!17289) (not b!927376) (not b!927379) (not b!927392) (not b!927383) (not mapNonEmpty!31452) (not b!927375) (not start!79076) (not b!927377) (not b!927391) (not b!927382) (not b!927386) (not b_lambda!13791) (not b!927393) tp_is_empty!19797 (not b!927388) (not b!927384) b_and!28317)
(check-sat b_and!28317 (not b_next!17289))
