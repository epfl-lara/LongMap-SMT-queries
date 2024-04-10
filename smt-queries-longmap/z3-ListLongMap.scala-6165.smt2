; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79100 () Bool)

(assert start!79100)

(declare-fun b_free!17313 () Bool)

(declare-fun b_next!17313 () Bool)

(assert (=> start!79100 (= b_free!17313 (not b_next!17313))))

(declare-fun tp!60380 () Bool)

(declare-fun b_and!28363 () Bool)

(assert (=> start!79100 (= tp!60380 b_and!28363)))

(declare-fun b!928119 () Bool)

(declare-fun res!625053 () Bool)

(declare-fun e!521096 () Bool)

(assert (=> b!928119 (=> (not res!625053) (not e!521096))))

(declare-datatypes ((array!55602 0))(
  ( (array!55603 (arr!26746 (Array (_ BitVec 32) (_ BitVec 64))) (size!27205 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55602)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31393 0))(
  ( (V!31394 (val!9961 Int)) )
))
(declare-datatypes ((ValueCell!9429 0))(
  ( (ValueCellFull!9429 (v!12479 V!31393)) (EmptyCell!9429) )
))
(declare-datatypes ((array!55604 0))(
  ( (array!55605 (arr!26747 (Array (_ BitVec 32) ValueCell!9429)) (size!27206 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55604)

(assert (=> b!928119 (= res!625053 (and (= (size!27206 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27205 _keys!1487) (size!27206 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928120 () Bool)

(declare-fun e!521092 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!928120 (= e!521092 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928121 () Bool)

(declare-fun e!521097 () Bool)

(assert (=> b!928121 (= e!521096 e!521097)))

(declare-fun res!625057 () Bool)

(assert (=> b!928121 (=> (not res!625057) (not e!521097))))

(declare-datatypes ((tuple2!13010 0))(
  ( (tuple2!13011 (_1!6516 (_ BitVec 64)) (_2!6516 V!31393)) )
))
(declare-datatypes ((List!18809 0))(
  ( (Nil!18806) (Cons!18805 (h!19951 tuple2!13010) (t!26852 List!18809)) )
))
(declare-datatypes ((ListLongMap!11707 0))(
  ( (ListLongMap!11708 (toList!5869 List!18809)) )
))
(declare-fun lt!418548 () ListLongMap!11707)

(declare-fun contains!4926 (ListLongMap!11707 (_ BitVec 64)) Bool)

(assert (=> b!928121 (= res!625057 (contains!4926 lt!418548 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31393)

(declare-fun minValue!1173 () V!31393)

(declare-fun getCurrentListMap!3117 (array!55602 array!55604 (_ BitVec 32) (_ BitVec 32) V!31393 V!31393 (_ BitVec 32) Int) ListLongMap!11707)

(assert (=> b!928121 (= lt!418548 (getCurrentListMap!3117 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928122 () Bool)

(declare-fun e!521095 () Bool)

(assert (=> b!928122 (= e!521095 (not true))))

(declare-fun e!521090 () Bool)

(assert (=> b!928122 e!521090))

(declare-fun res!625060 () Bool)

(assert (=> b!928122 (=> (not res!625060) (not e!521090))))

(declare-fun lt!418547 () ListLongMap!11707)

(assert (=> b!928122 (= res!625060 (contains!4926 lt!418547 k0!1099))))

(assert (=> b!928122 (= lt!418547 (getCurrentListMap!3117 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31393)

(declare-datatypes ((Unit!31404 0))(
  ( (Unit!31405) )
))
(declare-fun lt!418543 () Unit!31404)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!97 (array!55602 array!55604 (_ BitVec 32) (_ BitVec 32) V!31393 V!31393 (_ BitVec 64) V!31393 (_ BitVec 32) Int) Unit!31404)

(assert (=> b!928122 (= lt!418543 (lemmaListMapApplyFromThenApplyFromZero!97 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31488 () Bool)

(declare-fun mapRes!31488 () Bool)

(assert (=> mapIsEmpty!31488 mapRes!31488))

(declare-fun b!928123 () Bool)

(declare-fun e!521086 () Unit!31404)

(declare-fun Unit!31406 () Unit!31404)

(assert (=> b!928123 (= e!521086 Unit!31406)))

(declare-fun b!928124 () Bool)

(declare-fun res!625061 () Bool)

(assert (=> b!928124 (=> (not res!625061) (not e!521096))))

(assert (=> b!928124 (= res!625061 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27205 _keys!1487))))))

(declare-fun res!625062 () Bool)

(assert (=> start!79100 (=> (not res!625062) (not e!521096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79100 (= res!625062 (validMask!0 mask!1881))))

(assert (=> start!79100 e!521096))

(assert (=> start!79100 true))

(declare-fun tp_is_empty!19821 () Bool)

(assert (=> start!79100 tp_is_empty!19821))

(declare-fun e!521088 () Bool)

(declare-fun array_inv!20826 (array!55604) Bool)

(assert (=> start!79100 (and (array_inv!20826 _values!1231) e!521088)))

(assert (=> start!79100 tp!60380))

(declare-fun array_inv!20827 (array!55602) Bool)

(assert (=> start!79100 (array_inv!20827 _keys!1487)))

(declare-fun b!928125 () Bool)

(declare-fun e!521093 () Bool)

(assert (=> b!928125 (= e!521093 tp_is_empty!19821)))

(declare-fun b!928126 () Bool)

(declare-fun res!625054 () Bool)

(assert (=> b!928126 (=> (not res!625054) (not e!521096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55602 (_ BitVec 32)) Bool)

(assert (=> b!928126 (= res!625054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928127 () Bool)

(declare-fun e!521087 () Unit!31404)

(assert (=> b!928127 (= e!521087 e!521086)))

(declare-fun lt!418540 () (_ BitVec 64))

(assert (=> b!928127 (= lt!418540 (select (arr!26746 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96968 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928127 (= c!96968 (validKeyInArray!0 lt!418540))))

(declare-fun b!928128 () Bool)

(declare-fun apply!699 (ListLongMap!11707 (_ BitVec 64)) V!31393)

(assert (=> b!928128 (= e!521090 (= (apply!699 lt!418547 k0!1099) v!791))))

(declare-fun b!928129 () Bool)

(declare-fun e!521094 () Bool)

(declare-fun e!521098 () Bool)

(assert (=> b!928129 (= e!521094 e!521098)))

(declare-fun res!625059 () Bool)

(assert (=> b!928129 (=> (not res!625059) (not e!521098))))

(assert (=> b!928129 (= res!625059 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27205 _keys!1487)))))

(declare-fun lt!418541 () Unit!31404)

(assert (=> b!928129 (= lt!418541 e!521087)))

(declare-fun c!96969 () Bool)

(assert (=> b!928129 (= c!96969 (validKeyInArray!0 k0!1099))))

(declare-fun b!928130 () Bool)

(declare-fun e!521091 () Bool)

(assert (=> b!928130 (= e!521091 tp_is_empty!19821)))

(declare-fun b!928131 () Bool)

(assert (=> b!928131 (= e!521097 e!521094)))

(declare-fun res!625055 () Bool)

(assert (=> b!928131 (=> (not res!625055) (not e!521094))))

(declare-fun lt!418539 () V!31393)

(assert (=> b!928131 (= res!625055 (and (= lt!418539 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!928131 (= lt!418539 (apply!699 lt!418548 k0!1099))))

(declare-fun b!928132 () Bool)

(assert (=> b!928132 (= e!521098 e!521095)))

(declare-fun res!625058 () Bool)

(assert (=> b!928132 (=> (not res!625058) (not e!521095))))

(declare-fun lt!418537 () ListLongMap!11707)

(assert (=> b!928132 (= res!625058 (contains!4926 lt!418537 k0!1099))))

(assert (=> b!928132 (= lt!418537 (getCurrentListMap!3117 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928133 () Bool)

(declare-fun Unit!31407 () Unit!31404)

(assert (=> b!928133 (= e!521087 Unit!31407)))

(declare-fun b!928134 () Bool)

(declare-fun res!625056 () Bool)

(assert (=> b!928134 (=> (not res!625056) (not e!521095))))

(assert (=> b!928134 (= res!625056 (= (apply!699 lt!418537 k0!1099) v!791))))

(declare-fun b!928135 () Bool)

(declare-fun res!625063 () Bool)

(assert (=> b!928135 (=> (not res!625063) (not e!521096))))

(declare-datatypes ((List!18810 0))(
  ( (Nil!18807) (Cons!18806 (h!19952 (_ BitVec 64)) (t!26853 List!18810)) )
))
(declare-fun arrayNoDuplicates!0 (array!55602 (_ BitVec 32) List!18810) Bool)

(assert (=> b!928135 (= res!625063 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18807))))

(declare-fun b!928136 () Bool)

(declare-fun lt!418542 () ListLongMap!11707)

(assert (=> b!928136 (= (apply!699 lt!418542 k0!1099) lt!418539)))

(declare-fun lt!418552 () Unit!31404)

(declare-fun lt!418549 () V!31393)

(declare-fun addApplyDifferent!412 (ListLongMap!11707 (_ BitVec 64) V!31393 (_ BitVec 64)) Unit!31404)

(assert (=> b!928136 (= lt!418552 (addApplyDifferent!412 lt!418548 lt!418540 lt!418549 k0!1099))))

(assert (=> b!928136 (not (= lt!418540 k0!1099))))

(declare-fun lt!418546 () Unit!31404)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55602 (_ BitVec 64) (_ BitVec 32) List!18810) Unit!31404)

(assert (=> b!928136 (= lt!418546 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18807))))

(assert (=> b!928136 e!521092))

(declare-fun c!96967 () Bool)

(assert (=> b!928136 (= c!96967 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418544 () Unit!31404)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!263 (array!55602 array!55604 (_ BitVec 32) (_ BitVec 32) V!31393 V!31393 (_ BitVec 64) (_ BitVec 32) Int) Unit!31404)

(assert (=> b!928136 (= lt!418544 (lemmaListMapContainsThenArrayContainsFrom!263 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!928136 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18807)))

(declare-fun lt!418545 () Unit!31404)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55602 (_ BitVec 32) (_ BitVec 32)) Unit!31404)

(assert (=> b!928136 (= lt!418545 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928136 (contains!4926 lt!418542 k0!1099)))

(declare-fun lt!418551 () tuple2!13010)

(declare-fun +!2756 (ListLongMap!11707 tuple2!13010) ListLongMap!11707)

(assert (=> b!928136 (= lt!418542 (+!2756 lt!418548 lt!418551))))

(declare-fun lt!418550 () Unit!31404)

(declare-fun addStillContains!480 (ListLongMap!11707 (_ BitVec 64) V!31393 (_ BitVec 64)) Unit!31404)

(assert (=> b!928136 (= lt!418550 (addStillContains!480 lt!418548 lt!418540 lt!418549 k0!1099))))

(assert (=> b!928136 (= (getCurrentListMap!3117 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2756 (getCurrentListMap!3117 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418551))))

(assert (=> b!928136 (= lt!418551 (tuple2!13011 lt!418540 lt!418549))))

(declare-fun get!14083 (ValueCell!9429 V!31393) V!31393)

(declare-fun dynLambda!1545 (Int (_ BitVec 64)) V!31393)

(assert (=> b!928136 (= lt!418549 (get!14083 (select (arr!26747 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1545 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418538 () Unit!31404)

(declare-fun lemmaListMapRecursiveValidKeyArray!146 (array!55602 array!55604 (_ BitVec 32) (_ BitVec 32) V!31393 V!31393 (_ BitVec 32) Int) Unit!31404)

(assert (=> b!928136 (= lt!418538 (lemmaListMapRecursiveValidKeyArray!146 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!928136 (= e!521086 lt!418552)))

(declare-fun b!928137 () Bool)

(declare-fun arrayContainsKey!0 (array!55602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928137 (= e!521092 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!928138 () Bool)

(assert (=> b!928138 (= e!521088 (and e!521093 mapRes!31488))))

(declare-fun condMapEmpty!31488 () Bool)

(declare-fun mapDefault!31488 () ValueCell!9429)

(assert (=> b!928138 (= condMapEmpty!31488 (= (arr!26747 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9429)) mapDefault!31488)))))

(declare-fun mapNonEmpty!31488 () Bool)

(declare-fun tp!60379 () Bool)

(assert (=> mapNonEmpty!31488 (= mapRes!31488 (and tp!60379 e!521091))))

(declare-fun mapValue!31488 () ValueCell!9429)

(declare-fun mapRest!31488 () (Array (_ BitVec 32) ValueCell!9429))

(declare-fun mapKey!31488 () (_ BitVec 32))

(assert (=> mapNonEmpty!31488 (= (arr!26747 _values!1231) (store mapRest!31488 mapKey!31488 mapValue!31488))))

(assert (= (and start!79100 res!625062) b!928119))

(assert (= (and b!928119 res!625053) b!928126))

(assert (= (and b!928126 res!625054) b!928135))

(assert (= (and b!928135 res!625063) b!928124))

(assert (= (and b!928124 res!625061) b!928121))

(assert (= (and b!928121 res!625057) b!928131))

(assert (= (and b!928131 res!625055) b!928129))

(assert (= (and b!928129 c!96969) b!928127))

(assert (= (and b!928129 (not c!96969)) b!928133))

(assert (= (and b!928127 c!96968) b!928136))

(assert (= (and b!928127 (not c!96968)) b!928123))

(assert (= (and b!928136 c!96967) b!928137))

(assert (= (and b!928136 (not c!96967)) b!928120))

(assert (= (and b!928129 res!625059) b!928132))

(assert (= (and b!928132 res!625058) b!928134))

(assert (= (and b!928134 res!625056) b!928122))

(assert (= (and b!928122 res!625060) b!928128))

(assert (= (and b!928138 condMapEmpty!31488) mapIsEmpty!31488))

(assert (= (and b!928138 (not condMapEmpty!31488)) mapNonEmpty!31488))

(get-info :version)

(assert (= (and mapNonEmpty!31488 ((_ is ValueCellFull!9429) mapValue!31488)) b!928130))

(assert (= (and b!928138 ((_ is ValueCellFull!9429) mapDefault!31488)) b!928125))

(assert (= start!79100 b!928138))

(declare-fun b_lambda!13815 () Bool)

(assert (=> (not b_lambda!13815) (not b!928136)))

(declare-fun t!26851 () Bool)

(declare-fun tb!5893 () Bool)

(assert (=> (and start!79100 (= defaultEntry!1235 defaultEntry!1235) t!26851) tb!5893))

(declare-fun result!11609 () Bool)

(assert (=> tb!5893 (= result!11609 tp_is_empty!19821)))

(assert (=> b!928136 t!26851))

(declare-fun b_and!28365 () Bool)

(assert (= b_and!28363 (and (=> t!26851 result!11609) b_and!28365)))

(declare-fun m!862885 () Bool)

(assert (=> mapNonEmpty!31488 m!862885))

(declare-fun m!862887 () Bool)

(assert (=> b!928134 m!862887))

(declare-fun m!862889 () Bool)

(assert (=> b!928121 m!862889))

(declare-fun m!862891 () Bool)

(assert (=> b!928121 m!862891))

(declare-fun m!862893 () Bool)

(assert (=> b!928129 m!862893))

(declare-fun m!862895 () Bool)

(assert (=> start!79100 m!862895))

(declare-fun m!862897 () Bool)

(assert (=> start!79100 m!862897))

(declare-fun m!862899 () Bool)

(assert (=> start!79100 m!862899))

(declare-fun m!862901 () Bool)

(assert (=> b!928135 m!862901))

(declare-fun m!862903 () Bool)

(assert (=> b!928131 m!862903))

(declare-fun m!862905 () Bool)

(assert (=> b!928128 m!862905))

(declare-fun m!862907 () Bool)

(assert (=> b!928127 m!862907))

(declare-fun m!862909 () Bool)

(assert (=> b!928127 m!862909))

(declare-fun m!862911 () Bool)

(assert (=> b!928136 m!862911))

(declare-fun m!862913 () Bool)

(assert (=> b!928136 m!862913))

(declare-fun m!862915 () Bool)

(assert (=> b!928136 m!862915))

(declare-fun m!862917 () Bool)

(assert (=> b!928136 m!862917))

(declare-fun m!862919 () Bool)

(assert (=> b!928136 m!862919))

(assert (=> b!928136 m!862913))

(assert (=> b!928136 m!862915))

(declare-fun m!862921 () Bool)

(assert (=> b!928136 m!862921))

(declare-fun m!862923 () Bool)

(assert (=> b!928136 m!862923))

(declare-fun m!862925 () Bool)

(assert (=> b!928136 m!862925))

(declare-fun m!862927 () Bool)

(assert (=> b!928136 m!862927))

(declare-fun m!862929 () Bool)

(assert (=> b!928136 m!862929))

(declare-fun m!862931 () Bool)

(assert (=> b!928136 m!862931))

(declare-fun m!862933 () Bool)

(assert (=> b!928136 m!862933))

(assert (=> b!928136 m!862929))

(declare-fun m!862935 () Bool)

(assert (=> b!928136 m!862935))

(declare-fun m!862937 () Bool)

(assert (=> b!928136 m!862937))

(declare-fun m!862939 () Bool)

(assert (=> b!928136 m!862939))

(declare-fun m!862941 () Bool)

(assert (=> b!928136 m!862941))

(declare-fun m!862943 () Bool)

(assert (=> b!928126 m!862943))

(declare-fun m!862945 () Bool)

(assert (=> b!928132 m!862945))

(assert (=> b!928132 m!862923))

(declare-fun m!862947 () Bool)

(assert (=> b!928122 m!862947))

(declare-fun m!862949 () Bool)

(assert (=> b!928122 m!862949))

(declare-fun m!862951 () Bool)

(assert (=> b!928122 m!862951))

(declare-fun m!862953 () Bool)

(assert (=> b!928137 m!862953))

(check-sat (not b!928137) (not b!928129) (not b!928135) (not b!928122) tp_is_empty!19821 (not b!928121) (not b!928134) (not b!928127) (not b_next!17313) (not b!928131) (not start!79100) b_and!28365 (not mapNonEmpty!31488) (not b!928132) (not b!928128) (not b!928126) (not b_lambda!13815) (not b!928136))
(check-sat b_and!28365 (not b_next!17313))
