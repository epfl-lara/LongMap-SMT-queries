; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79236 () Bool)

(assert start!79236)

(declare-fun b_free!17281 () Bool)

(declare-fun b_next!17281 () Bool)

(assert (=> start!79236 (= b_free!17281 (not b_next!17281))))

(declare-fun tp!60284 () Bool)

(declare-fun b_and!28309 () Bool)

(assert (=> start!79236 (= tp!60284 b_and!28309)))

(declare-fun b!928031 () Bool)

(declare-datatypes ((Unit!31347 0))(
  ( (Unit!31348) )
))
(declare-fun e!521053 () Unit!31347)

(declare-fun Unit!31349 () Unit!31347)

(assert (=> b!928031 (= e!521053 Unit!31349)))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31351 0))(
  ( (V!31352 (val!9945 Int)) )
))
(declare-fun v!791 () V!31351)

(declare-fun b!928032 () Bool)

(declare-datatypes ((tuple2!12968 0))(
  ( (tuple2!12969 (_1!6495 (_ BitVec 64)) (_2!6495 V!31351)) )
))
(declare-datatypes ((List!18777 0))(
  ( (Nil!18774) (Cons!18773 (h!19925 tuple2!12968) (t!26780 List!18777)) )
))
(declare-datatypes ((ListLongMap!11667 0))(
  ( (ListLongMap!11668 (toList!5849 List!18777)) )
))
(declare-fun lt!418143 () ListLongMap!11667)

(declare-fun e!521046 () Bool)

(declare-fun apply!700 (ListLongMap!11667 (_ BitVec 64)) V!31351)

(assert (=> b!928032 (= e!521046 (= (apply!700 lt!418143 k0!1099) v!791))))

(declare-fun b!928033 () Bool)

(declare-fun e!521054 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!928033 (= e!521054 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928034 () Bool)

(declare-fun e!521048 () Bool)

(declare-fun e!521050 () Bool)

(assert (=> b!928034 (= e!521048 e!521050)))

(declare-fun res!624871 () Bool)

(assert (=> b!928034 (=> (not res!624871) (not e!521050))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!418134 () V!31351)

(assert (=> b!928034 (= res!624871 (and (= lt!418134 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!418131 () ListLongMap!11667)

(assert (=> b!928034 (= lt!418134 (apply!700 lt!418131 k0!1099))))

(declare-fun b!928035 () Bool)

(declare-fun lt!418139 () ListLongMap!11667)

(assert (=> b!928035 (= (apply!700 lt!418139 k0!1099) lt!418134)))

(declare-fun lt!418130 () V!31351)

(declare-fun lt!418138 () Unit!31347)

(declare-fun lt!418145 () (_ BitVec 64))

(declare-fun addApplyDifferent!397 (ListLongMap!11667 (_ BitVec 64) V!31351 (_ BitVec 64)) Unit!31347)

(assert (=> b!928035 (= lt!418138 (addApplyDifferent!397 lt!418131 lt!418145 lt!418130 k0!1099))))

(assert (=> b!928035 (not (= lt!418145 k0!1099))))

(declare-fun lt!418133 () Unit!31347)

(declare-datatypes ((array!55593 0))(
  ( (array!55594 (arr!26737 (Array (_ BitVec 32) (_ BitVec 64))) (size!27197 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55593)

(declare-datatypes ((List!18778 0))(
  ( (Nil!18775) (Cons!18774 (h!19926 (_ BitVec 64)) (t!26781 List!18778)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55593 (_ BitVec 64) (_ BitVec 32) List!18778) Unit!31347)

(assert (=> b!928035 (= lt!418133 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18775))))

(assert (=> b!928035 e!521054))

(declare-fun c!97105 () Bool)

(assert (=> b!928035 (= c!97105 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!418142 () Unit!31347)

(declare-datatypes ((ValueCell!9413 0))(
  ( (ValueCellFull!9413 (v!12460 V!31351)) (EmptyCell!9413) )
))
(declare-datatypes ((array!55595 0))(
  ( (array!55596 (arr!26738 (Array (_ BitVec 32) ValueCell!9413)) (size!27198 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55595)

(declare-fun zeroValue!1173 () V!31351)

(declare-fun minValue!1173 () V!31351)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!252 (array!55593 array!55595 (_ BitVec 32) (_ BitVec 32) V!31351 V!31351 (_ BitVec 64) (_ BitVec 32) Int) Unit!31347)

(assert (=> b!928035 (= lt!418142 (lemmaListMapContainsThenArrayContainsFrom!252 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55593 (_ BitVec 32) List!18778) Bool)

(assert (=> b!928035 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18775)))

(declare-fun lt!418137 () Unit!31347)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55593 (_ BitVec 32) (_ BitVec 32)) Unit!31347)

(assert (=> b!928035 (= lt!418137 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4921 (ListLongMap!11667 (_ BitVec 64)) Bool)

(assert (=> b!928035 (contains!4921 lt!418139 k0!1099)))

(declare-fun lt!418136 () tuple2!12968)

(declare-fun +!2761 (ListLongMap!11667 tuple2!12968) ListLongMap!11667)

(assert (=> b!928035 (= lt!418139 (+!2761 lt!418131 lt!418136))))

(declare-fun lt!418132 () Unit!31347)

(declare-fun addStillContains!470 (ListLongMap!11667 (_ BitVec 64) V!31351 (_ BitVec 64)) Unit!31347)

(assert (=> b!928035 (= lt!418132 (addStillContains!470 lt!418131 lt!418145 lt!418130 k0!1099))))

(declare-fun getCurrentListMap!3099 (array!55593 array!55595 (_ BitVec 32) (_ BitVec 32) V!31351 V!31351 (_ BitVec 32) Int) ListLongMap!11667)

(assert (=> b!928035 (= (getCurrentListMap!3099 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2761 (getCurrentListMap!3099 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418136))))

(assert (=> b!928035 (= lt!418136 (tuple2!12969 lt!418145 lt!418130))))

(declare-fun get!14090 (ValueCell!9413 V!31351) V!31351)

(declare-fun dynLambda!1558 (Int (_ BitVec 64)) V!31351)

(assert (=> b!928035 (= lt!418130 (get!14090 (select (arr!26738 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1558 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418141 () Unit!31347)

(declare-fun lemmaListMapRecursiveValidKeyArray!141 (array!55593 array!55595 (_ BitVec 32) (_ BitVec 32) V!31351 V!31351 (_ BitVec 32) Int) Unit!31347)

(assert (=> b!928035 (= lt!418141 (lemmaListMapRecursiveValidKeyArray!141 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!521055 () Unit!31347)

(assert (=> b!928035 (= e!521055 lt!418138)))

(declare-fun mapIsEmpty!31440 () Bool)

(declare-fun mapRes!31440 () Bool)

(assert (=> mapIsEmpty!31440 mapRes!31440))

(declare-fun b!928036 () Bool)

(declare-fun e!521045 () Bool)

(assert (=> b!928036 (= e!521045 e!521048)))

(declare-fun res!624876 () Bool)

(assert (=> b!928036 (=> (not res!624876) (not e!521048))))

(assert (=> b!928036 (= res!624876 (contains!4921 lt!418131 k0!1099))))

(assert (=> b!928036 (= lt!418131 (getCurrentListMap!3099 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928037 () Bool)

(declare-fun e!521047 () Bool)

(declare-fun e!521044 () Bool)

(assert (=> b!928037 (= e!521047 e!521044)))

(declare-fun res!624869 () Bool)

(assert (=> b!928037 (=> (not res!624869) (not e!521044))))

(declare-fun lt!418135 () ListLongMap!11667)

(assert (=> b!928037 (= res!624869 (contains!4921 lt!418135 k0!1099))))

(assert (=> b!928037 (= lt!418135 (getCurrentListMap!3099 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928038 () Bool)

(declare-fun res!624878 () Bool)

(assert (=> b!928038 (=> (not res!624878) (not e!521044))))

(assert (=> b!928038 (= res!624878 (= (apply!700 lt!418135 k0!1099) v!791))))

(declare-fun b!928039 () Bool)

(assert (=> b!928039 (= e!521053 e!521055)))

(assert (=> b!928039 (= lt!418145 (select (arr!26737 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97107 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928039 (= c!97107 (validKeyInArray!0 lt!418145))))

(declare-fun mapNonEmpty!31440 () Bool)

(declare-fun tp!60285 () Bool)

(declare-fun e!521049 () Bool)

(assert (=> mapNonEmpty!31440 (= mapRes!31440 (and tp!60285 e!521049))))

(declare-fun mapValue!31440 () ValueCell!9413)

(declare-fun mapRest!31440 () (Array (_ BitVec 32) ValueCell!9413))

(declare-fun mapKey!31440 () (_ BitVec 32))

(assert (=> mapNonEmpty!31440 (= (arr!26738 _values!1231) (store mapRest!31440 mapKey!31440 mapValue!31440))))

(declare-fun b!928040 () Bool)

(declare-fun Unit!31350 () Unit!31347)

(assert (=> b!928040 (= e!521055 Unit!31350)))

(declare-fun res!624873 () Bool)

(assert (=> start!79236 (=> (not res!624873) (not e!521045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79236 (= res!624873 (validMask!0 mask!1881))))

(assert (=> start!79236 e!521045))

(assert (=> start!79236 true))

(declare-fun tp_is_empty!19789 () Bool)

(assert (=> start!79236 tp_is_empty!19789))

(declare-fun e!521052 () Bool)

(declare-fun array_inv!20920 (array!55595) Bool)

(assert (=> start!79236 (and (array_inv!20920 _values!1231) e!521052)))

(assert (=> start!79236 tp!60284))

(declare-fun array_inv!20921 (array!55593) Bool)

(assert (=> start!79236 (array_inv!20921 _keys!1487)))

(declare-fun b!928030 () Bool)

(assert (=> b!928030 (= e!521049 tp_is_empty!19789)))

(declare-fun b!928041 () Bool)

(declare-fun res!624879 () Bool)

(assert (=> b!928041 (=> (not res!624879) (not e!521045))))

(assert (=> b!928041 (= res!624879 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18775))))

(declare-fun b!928042 () Bool)

(assert (=> b!928042 (= e!521044 (not true))))

(assert (=> b!928042 e!521046))

(declare-fun res!624870 () Bool)

(assert (=> b!928042 (=> (not res!624870) (not e!521046))))

(assert (=> b!928042 (= res!624870 (contains!4921 lt!418143 k0!1099))))

(assert (=> b!928042 (= lt!418143 (getCurrentListMap!3099 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418140 () Unit!31347)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!90 (array!55593 array!55595 (_ BitVec 32) (_ BitVec 32) V!31351 V!31351 (_ BitVec 64) V!31351 (_ BitVec 32) Int) Unit!31347)

(assert (=> b!928042 (= lt!418140 (lemmaListMapApplyFromThenApplyFromZero!90 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928043 () Bool)

(declare-fun res!624872 () Bool)

(assert (=> b!928043 (=> (not res!624872) (not e!521045))))

(assert (=> b!928043 (= res!624872 (and (= (size!27198 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27197 _keys!1487) (size!27198 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928044 () Bool)

(declare-fun e!521056 () Bool)

(assert (=> b!928044 (= e!521052 (and e!521056 mapRes!31440))))

(declare-fun condMapEmpty!31440 () Bool)

(declare-fun mapDefault!31440 () ValueCell!9413)

(assert (=> b!928044 (= condMapEmpty!31440 (= (arr!26738 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9413)) mapDefault!31440)))))

(declare-fun b!928045 () Bool)

(assert (=> b!928045 (= e!521050 e!521047)))

(declare-fun res!624875 () Bool)

(assert (=> b!928045 (=> (not res!624875) (not e!521047))))

(assert (=> b!928045 (= res!624875 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27197 _keys!1487)))))

(declare-fun lt!418144 () Unit!31347)

(assert (=> b!928045 (= lt!418144 e!521053)))

(declare-fun c!97106 () Bool)

(assert (=> b!928045 (= c!97106 (validKeyInArray!0 k0!1099))))

(declare-fun b!928046 () Bool)

(declare-fun res!624877 () Bool)

(assert (=> b!928046 (=> (not res!624877) (not e!521045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55593 (_ BitVec 32)) Bool)

(assert (=> b!928046 (= res!624877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928047 () Bool)

(declare-fun arrayContainsKey!0 (array!55593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928047 (= e!521054 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!928048 () Bool)

(assert (=> b!928048 (= e!521056 tp_is_empty!19789)))

(declare-fun b!928049 () Bool)

(declare-fun res!624874 () Bool)

(assert (=> b!928049 (=> (not res!624874) (not e!521045))))

(assert (=> b!928049 (= res!624874 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27197 _keys!1487))))))

(assert (= (and start!79236 res!624873) b!928043))

(assert (= (and b!928043 res!624872) b!928046))

(assert (= (and b!928046 res!624877) b!928041))

(assert (= (and b!928041 res!624879) b!928049))

(assert (= (and b!928049 res!624874) b!928036))

(assert (= (and b!928036 res!624876) b!928034))

(assert (= (and b!928034 res!624871) b!928045))

(assert (= (and b!928045 c!97106) b!928039))

(assert (= (and b!928045 (not c!97106)) b!928031))

(assert (= (and b!928039 c!97107) b!928035))

(assert (= (and b!928039 (not c!97107)) b!928040))

(assert (= (and b!928035 c!97105) b!928047))

(assert (= (and b!928035 (not c!97105)) b!928033))

(assert (= (and b!928045 res!624875) b!928037))

(assert (= (and b!928037 res!624869) b!928038))

(assert (= (and b!928038 res!624878) b!928042))

(assert (= (and b!928042 res!624870) b!928032))

(assert (= (and b!928044 condMapEmpty!31440) mapIsEmpty!31440))

(assert (= (and b!928044 (not condMapEmpty!31440)) mapNonEmpty!31440))

(get-info :version)

(assert (= (and mapNonEmpty!31440 ((_ is ValueCellFull!9413) mapValue!31440)) b!928030))

(assert (= (and b!928044 ((_ is ValueCellFull!9413) mapDefault!31440)) b!928048))

(assert (= start!79236 b!928044))

(declare-fun b_lambda!13797 () Bool)

(assert (=> (not b_lambda!13797) (not b!928035)))

(declare-fun t!26779 () Bool)

(declare-fun tb!5853 () Bool)

(assert (=> (and start!79236 (= defaultEntry!1235 defaultEntry!1235) t!26779) tb!5853))

(declare-fun result!11537 () Bool)

(assert (=> tb!5853 (= result!11537 tp_is_empty!19789)))

(assert (=> b!928035 t!26779))

(declare-fun b_and!28311 () Bool)

(assert (= b_and!28309 (and (=> t!26779 result!11537) b_and!28311)))

(declare-fun m!863059 () Bool)

(assert (=> b!928037 m!863059))

(declare-fun m!863061 () Bool)

(assert (=> b!928037 m!863061))

(declare-fun m!863063 () Bool)

(assert (=> b!928046 m!863063))

(declare-fun m!863065 () Bool)

(assert (=> b!928045 m!863065))

(declare-fun m!863067 () Bool)

(assert (=> b!928047 m!863067))

(declare-fun m!863069 () Bool)

(assert (=> b!928034 m!863069))

(declare-fun m!863071 () Bool)

(assert (=> b!928039 m!863071))

(declare-fun m!863073 () Bool)

(assert (=> b!928039 m!863073))

(declare-fun m!863075 () Bool)

(assert (=> mapNonEmpty!31440 m!863075))

(declare-fun m!863077 () Bool)

(assert (=> start!79236 m!863077))

(declare-fun m!863079 () Bool)

(assert (=> start!79236 m!863079))

(declare-fun m!863081 () Bool)

(assert (=> start!79236 m!863081))

(declare-fun m!863083 () Bool)

(assert (=> b!928036 m!863083))

(declare-fun m!863085 () Bool)

(assert (=> b!928036 m!863085))

(declare-fun m!863087 () Bool)

(assert (=> b!928032 m!863087))

(declare-fun m!863089 () Bool)

(assert (=> b!928041 m!863089))

(declare-fun m!863091 () Bool)

(assert (=> b!928035 m!863091))

(declare-fun m!863093 () Bool)

(assert (=> b!928035 m!863093))

(declare-fun m!863095 () Bool)

(assert (=> b!928035 m!863095))

(declare-fun m!863097 () Bool)

(assert (=> b!928035 m!863097))

(declare-fun m!863099 () Bool)

(assert (=> b!928035 m!863099))

(declare-fun m!863101 () Bool)

(assert (=> b!928035 m!863101))

(assert (=> b!928035 m!863099))

(assert (=> b!928035 m!863101))

(declare-fun m!863103 () Bool)

(assert (=> b!928035 m!863103))

(assert (=> b!928035 m!863061))

(declare-fun m!863105 () Bool)

(assert (=> b!928035 m!863105))

(declare-fun m!863107 () Bool)

(assert (=> b!928035 m!863107))

(declare-fun m!863109 () Bool)

(assert (=> b!928035 m!863109))

(declare-fun m!863111 () Bool)

(assert (=> b!928035 m!863111))

(declare-fun m!863113 () Bool)

(assert (=> b!928035 m!863113))

(assert (=> b!928035 m!863109))

(declare-fun m!863115 () Bool)

(assert (=> b!928035 m!863115))

(declare-fun m!863117 () Bool)

(assert (=> b!928035 m!863117))

(declare-fun m!863119 () Bool)

(assert (=> b!928035 m!863119))

(declare-fun m!863121 () Bool)

(assert (=> b!928042 m!863121))

(declare-fun m!863123 () Bool)

(assert (=> b!928042 m!863123))

(declare-fun m!863125 () Bool)

(assert (=> b!928042 m!863125))

(declare-fun m!863127 () Bool)

(assert (=> b!928038 m!863127))

(check-sat tp_is_empty!19789 b_and!28311 (not b!928046) (not start!79236) (not b!928037) (not b!928038) (not b!928047) (not b!928034) (not b_lambda!13797) (not b!928045) (not b!928042) (not mapNonEmpty!31440) (not b_next!17281) (not b!928041) (not b!928039) (not b!928035) (not b!928036) (not b!928032))
(check-sat b_and!28311 (not b_next!17281))
