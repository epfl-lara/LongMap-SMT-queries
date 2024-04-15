; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78828 () Bool)

(assert start!78828)

(declare-fun b_free!17059 () Bool)

(declare-fun b_next!17059 () Bool)

(assert (=> start!78828 (= b_free!17059 (not b_next!17059))))

(declare-fun tp!59619 () Bool)

(declare-fun b_and!27829 () Bool)

(assert (=> start!78828 (= tp!59619 b_and!27829)))

(declare-fun b!920740 () Bool)

(declare-fun e!516712 () Bool)

(declare-fun e!516710 () Bool)

(assert (=> b!920740 (= e!516712 e!516710)))

(declare-fun res!620963 () Bool)

(assert (=> b!920740 (=> (not res!620963) (not e!516710))))

(declare-fun lt!413242 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920740 (= res!620963 (validKeyInArray!0 lt!413242))))

(declare-datatypes ((array!55087 0))(
  ( (array!55088 (arr!26489 (Array (_ BitVec 32) (_ BitVec 64))) (size!26950 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55087)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920740 (= lt!413242 (select (arr!26489 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920741 () Bool)

(declare-fun res!620955 () Bool)

(declare-fun e!516709 () Bool)

(assert (=> b!920741 (=> (not res!620955) (not e!516709))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55087 (_ BitVec 32)) Bool)

(assert (=> b!920741 (= res!620955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920742 () Bool)

(declare-fun e!516707 () Bool)

(declare-fun tp_is_empty!19567 () Bool)

(assert (=> b!920742 (= e!516707 tp_is_empty!19567)))

(declare-fun b!920743 () Bool)

(declare-fun res!620961 () Bool)

(assert (=> b!920743 (=> (not res!620961) (not e!516712))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!920743 (= res!620961 (validKeyInArray!0 k0!1099))))

(declare-fun b!920744 () Bool)

(declare-fun res!620966 () Bool)

(assert (=> b!920744 (=> (not res!620966) (not e!516709))))

(assert (=> b!920744 (= res!620966 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26950 _keys!1487))))))

(declare-fun b!920745 () Bool)

(declare-fun res!620956 () Bool)

(assert (=> b!920745 (=> (not res!620956) (not e!516709))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31055 0))(
  ( (V!31056 (val!9834 Int)) )
))
(declare-datatypes ((ValueCell!9302 0))(
  ( (ValueCellFull!9302 (v!12351 V!31055)) (EmptyCell!9302) )
))
(declare-datatypes ((array!55089 0))(
  ( (array!55090 (arr!26490 (Array (_ BitVec 32) ValueCell!9302)) (size!26951 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55089)

(assert (=> b!920745 (= res!620956 (and (= (size!26951 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26950 _keys!1487) (size!26951 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920746 () Bool)

(declare-fun e!516708 () Bool)

(assert (=> b!920746 (= e!516708 true)))

(declare-fun lt!413241 () Bool)

(declare-datatypes ((List!18627 0))(
  ( (Nil!18624) (Cons!18623 (h!19769 (_ BitVec 64)) (t!26407 List!18627)) )
))
(declare-fun contains!4788 (List!18627 (_ BitVec 64)) Bool)

(assert (=> b!920746 (= lt!413241 (contains!4788 Nil!18624 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!31107 () Bool)

(declare-fun mapRes!31107 () Bool)

(assert (=> mapIsEmpty!31107 mapRes!31107))

(declare-fun b!920748 () Bool)

(declare-fun res!620959 () Bool)

(assert (=> b!920748 (=> (not res!620959) (not e!516709))))

(declare-fun arrayNoDuplicates!0 (array!55087 (_ BitVec 32) List!18627) Bool)

(assert (=> b!920748 (= res!620959 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18624))))

(declare-fun b!920749 () Bool)

(declare-fun e!516714 () Bool)

(assert (=> b!920749 (= e!516714 tp_is_empty!19567)))

(declare-fun b!920750 () Bool)

(assert (=> b!920750 (= e!516709 e!516712)))

(declare-fun res!620964 () Bool)

(assert (=> b!920750 (=> (not res!620964) (not e!516712))))

(declare-datatypes ((tuple2!12844 0))(
  ( (tuple2!12845 (_1!6433 (_ BitVec 64)) (_2!6433 V!31055)) )
))
(declare-datatypes ((List!18628 0))(
  ( (Nil!18625) (Cons!18624 (h!19770 tuple2!12844) (t!26408 List!18628)) )
))
(declare-datatypes ((ListLongMap!11531 0))(
  ( (ListLongMap!11532 (toList!5781 List!18628)) )
))
(declare-fun lt!413239 () ListLongMap!11531)

(declare-fun contains!4789 (ListLongMap!11531 (_ BitVec 64)) Bool)

(assert (=> b!920750 (= res!620964 (contains!4789 lt!413239 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31055)

(declare-fun minValue!1173 () V!31055)

(declare-fun getCurrentListMap!2972 (array!55087 array!55089 (_ BitVec 32) (_ BitVec 32) V!31055 V!31055 (_ BitVec 32) Int) ListLongMap!11531)

(assert (=> b!920750 (= lt!413239 (getCurrentListMap!2972 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920751 () Bool)

(declare-fun res!620958 () Bool)

(assert (=> b!920751 (=> res!620958 e!516708)))

(assert (=> b!920751 (= res!620958 (contains!4788 Nil!18624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920752 () Bool)

(assert (=> b!920752 (= e!516710 (not e!516708))))

(declare-fun res!620957 () Bool)

(assert (=> b!920752 (=> res!620957 e!516708)))

(assert (=> b!920752 (= res!620957 (or (bvsge (size!26950 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26950 _keys!1487))))))

(declare-fun e!516713 () Bool)

(assert (=> b!920752 e!516713))

(declare-fun c!96025 () Bool)

(assert (=> b!920752 (= c!96025 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!30998 0))(
  ( (Unit!30999) )
))
(declare-fun lt!413243 () Unit!30998)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!181 (array!55087 array!55089 (_ BitVec 32) (_ BitVec 32) V!31055 V!31055 (_ BitVec 64) (_ BitVec 32) Int) Unit!30998)

(assert (=> b!920752 (= lt!413243 (lemmaListMapContainsThenArrayContainsFrom!181 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!920752 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18624)))

(declare-fun lt!413240 () Unit!30998)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55087 (_ BitVec 32) (_ BitVec 32)) Unit!30998)

(assert (=> b!920752 (= lt!413240 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413235 () tuple2!12844)

(declare-fun +!2693 (ListLongMap!11531 tuple2!12844) ListLongMap!11531)

(assert (=> b!920752 (contains!4789 (+!2693 lt!413239 lt!413235) k0!1099)))

(declare-fun lt!413236 () Unit!30998)

(declare-fun lt!413238 () V!31055)

(declare-fun addStillContains!390 (ListLongMap!11531 (_ BitVec 64) V!31055 (_ BitVec 64)) Unit!30998)

(assert (=> b!920752 (= lt!413236 (addStillContains!390 lt!413239 lt!413242 lt!413238 k0!1099))))

(assert (=> b!920752 (= (getCurrentListMap!2972 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2693 (getCurrentListMap!2972 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413235))))

(assert (=> b!920752 (= lt!413235 (tuple2!12845 lt!413242 lt!413238))))

(declare-fun get!13908 (ValueCell!9302 V!31055) V!31055)

(declare-fun dynLambda!1449 (Int (_ BitVec 64)) V!31055)

(assert (=> b!920752 (= lt!413238 (get!13908 (select (arr!26490 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1449 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413237 () Unit!30998)

(declare-fun lemmaListMapRecursiveValidKeyArray!57 (array!55087 array!55089 (_ BitVec 32) (_ BitVec 32) V!31055 V!31055 (_ BitVec 32) Int) Unit!30998)

(assert (=> b!920752 (= lt!413237 (lemmaListMapRecursiveValidKeyArray!57 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920753 () Bool)

(declare-fun res!620954 () Bool)

(assert (=> b!920753 (=> res!620954 e!516708)))

(declare-fun noDuplicate!1346 (List!18627) Bool)

(assert (=> b!920753 (= res!620954 (not (noDuplicate!1346 Nil!18624)))))

(declare-fun res!620960 () Bool)

(assert (=> start!78828 (=> (not res!620960) (not e!516709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78828 (= res!620960 (validMask!0 mask!1881))))

(assert (=> start!78828 e!516709))

(assert (=> start!78828 true))

(assert (=> start!78828 tp_is_empty!19567))

(declare-fun e!516711 () Bool)

(declare-fun array_inv!20722 (array!55089) Bool)

(assert (=> start!78828 (and (array_inv!20722 _values!1231) e!516711)))

(assert (=> start!78828 tp!59619))

(declare-fun array_inv!20723 (array!55087) Bool)

(assert (=> start!78828 (array_inv!20723 _keys!1487)))

(declare-fun b!920747 () Bool)

(assert (=> b!920747 (= e!516711 (and e!516707 mapRes!31107))))

(declare-fun condMapEmpty!31107 () Bool)

(declare-fun mapDefault!31107 () ValueCell!9302)

(assert (=> b!920747 (= condMapEmpty!31107 (= (arr!26490 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9302)) mapDefault!31107)))))

(declare-fun b!920754 () Bool)

(declare-fun res!620962 () Bool)

(assert (=> b!920754 (=> (not res!620962) (not e!516712))))

(declare-fun v!791 () V!31055)

(declare-fun apply!601 (ListLongMap!11531 (_ BitVec 64)) V!31055)

(assert (=> b!920754 (= res!620962 (= (apply!601 lt!413239 k0!1099) v!791))))

(declare-fun b!920755 () Bool)

(assert (=> b!920755 (= e!516713 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!31107 () Bool)

(declare-fun tp!59618 () Bool)

(assert (=> mapNonEmpty!31107 (= mapRes!31107 (and tp!59618 e!516714))))

(declare-fun mapRest!31107 () (Array (_ BitVec 32) ValueCell!9302))

(declare-fun mapValue!31107 () ValueCell!9302)

(declare-fun mapKey!31107 () (_ BitVec 32))

(assert (=> mapNonEmpty!31107 (= (arr!26490 _values!1231) (store mapRest!31107 mapKey!31107 mapValue!31107))))

(declare-fun b!920756 () Bool)

(declare-fun arrayContainsKey!0 (array!55087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920756 (= e!516713 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!920757 () Bool)

(declare-fun res!620965 () Bool)

(assert (=> b!920757 (=> (not res!620965) (not e!516712))))

(assert (=> b!920757 (= res!620965 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!78828 res!620960) b!920745))

(assert (= (and b!920745 res!620956) b!920741))

(assert (= (and b!920741 res!620955) b!920748))

(assert (= (and b!920748 res!620959) b!920744))

(assert (= (and b!920744 res!620966) b!920750))

(assert (= (and b!920750 res!620964) b!920754))

(assert (= (and b!920754 res!620962) b!920757))

(assert (= (and b!920757 res!620965) b!920743))

(assert (= (and b!920743 res!620961) b!920740))

(assert (= (and b!920740 res!620963) b!920752))

(assert (= (and b!920752 c!96025) b!920756))

(assert (= (and b!920752 (not c!96025)) b!920755))

(assert (= (and b!920752 (not res!620957)) b!920753))

(assert (= (and b!920753 (not res!620954)) b!920751))

(assert (= (and b!920751 (not res!620958)) b!920746))

(assert (= (and b!920747 condMapEmpty!31107) mapIsEmpty!31107))

(assert (= (and b!920747 (not condMapEmpty!31107)) mapNonEmpty!31107))

(get-info :version)

(assert (= (and mapNonEmpty!31107 ((_ is ValueCellFull!9302) mapValue!31107)) b!920749))

(assert (= (and b!920747 ((_ is ValueCellFull!9302) mapDefault!31107)) b!920742))

(assert (= start!78828 b!920747))

(declare-fun b_lambda!13543 () Bool)

(assert (=> (not b_lambda!13543) (not b!920752)))

(declare-fun t!26406 () Bool)

(declare-fun tb!5631 () Bool)

(assert (=> (and start!78828 (= defaultEntry!1235 defaultEntry!1235) t!26406) tb!5631))

(declare-fun result!11093 () Bool)

(assert (=> tb!5631 (= result!11093 tp_is_empty!19567)))

(assert (=> b!920752 t!26406))

(declare-fun b_and!27831 () Bool)

(assert (= b_and!27829 (and (=> t!26406 result!11093) b_and!27831)))

(declare-fun m!854161 () Bool)

(assert (=> b!920748 m!854161))

(declare-fun m!854163 () Bool)

(assert (=> b!920752 m!854163))

(declare-fun m!854165 () Bool)

(assert (=> b!920752 m!854165))

(declare-fun m!854167 () Bool)

(assert (=> b!920752 m!854167))

(declare-fun m!854169 () Bool)

(assert (=> b!920752 m!854169))

(assert (=> b!920752 m!854167))

(declare-fun m!854171 () Bool)

(assert (=> b!920752 m!854171))

(declare-fun m!854173 () Bool)

(assert (=> b!920752 m!854173))

(declare-fun m!854175 () Bool)

(assert (=> b!920752 m!854175))

(declare-fun m!854177 () Bool)

(assert (=> b!920752 m!854177))

(assert (=> b!920752 m!854169))

(assert (=> b!920752 m!854175))

(declare-fun m!854179 () Bool)

(assert (=> b!920752 m!854179))

(declare-fun m!854181 () Bool)

(assert (=> b!920752 m!854181))

(declare-fun m!854183 () Bool)

(assert (=> b!920752 m!854183))

(declare-fun m!854185 () Bool)

(assert (=> b!920752 m!854185))

(assert (=> b!920752 m!854181))

(declare-fun m!854187 () Bool)

(assert (=> b!920752 m!854187))

(declare-fun m!854189 () Bool)

(assert (=> b!920756 m!854189))

(declare-fun m!854191 () Bool)

(assert (=> b!920753 m!854191))

(declare-fun m!854193 () Bool)

(assert (=> mapNonEmpty!31107 m!854193))

(declare-fun m!854195 () Bool)

(assert (=> b!920741 m!854195))

(declare-fun m!854197 () Bool)

(assert (=> start!78828 m!854197))

(declare-fun m!854199 () Bool)

(assert (=> start!78828 m!854199))

(declare-fun m!854201 () Bool)

(assert (=> start!78828 m!854201))

(declare-fun m!854203 () Bool)

(assert (=> b!920754 m!854203))

(declare-fun m!854205 () Bool)

(assert (=> b!920743 m!854205))

(declare-fun m!854207 () Bool)

(assert (=> b!920751 m!854207))

(declare-fun m!854209 () Bool)

(assert (=> b!920746 m!854209))

(declare-fun m!854211 () Bool)

(assert (=> b!920750 m!854211))

(declare-fun m!854213 () Bool)

(assert (=> b!920750 m!854213))

(declare-fun m!854215 () Bool)

(assert (=> b!920740 m!854215))

(declare-fun m!854217 () Bool)

(assert (=> b!920740 m!854217))

(check-sat (not b!920752) (not b_next!17059) (not mapNonEmpty!31107) (not b!920756) (not b!920741) (not start!78828) (not b!920748) (not b!920746) (not b!920740) (not b!920753) b_and!27831 (not b!920750) (not b!920743) (not b_lambda!13543) (not b!920754) (not b!920751) tp_is_empty!19567)
(check-sat b_and!27831 (not b_next!17059))
