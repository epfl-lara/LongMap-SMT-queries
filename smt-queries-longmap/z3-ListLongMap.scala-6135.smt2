; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78900 () Bool)

(assert start!78900)

(declare-fun b_free!17131 () Bool)

(declare-fun b_next!17131 () Bool)

(assert (=> start!78900 (= b_free!17131 (not b_next!17131))))

(declare-fun tp!59835 () Bool)

(declare-fun b_and!27973 () Bool)

(assert (=> start!78900 (= tp!59835 b_and!27973)))

(declare-fun b!922561 () Bool)

(declare-fun res!622168 () Bool)

(declare-fun e!517617 () Bool)

(assert (=> b!922561 (=> (not res!622168) (not e!517617))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55229 0))(
  ( (array!55230 (arr!26560 (Array (_ BitVec 32) (_ BitVec 64))) (size!27021 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55229)

(assert (=> b!922561 (= res!622168 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27021 _keys!1487))))))

(declare-fun b!922562 () Bool)

(declare-fun e!517618 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922562 (= e!517618 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922563 () Bool)

(declare-fun e!517615 () Bool)

(declare-fun tp_is_empty!19639 () Bool)

(assert (=> b!922563 (= e!517615 tp_is_empty!19639)))

(declare-fun b!922564 () Bool)

(declare-fun res!622164 () Bool)

(assert (=> b!922564 (=> (not res!622164) (not e!517617))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31151 0))(
  ( (V!31152 (val!9870 Int)) )
))
(declare-datatypes ((ValueCell!9338 0))(
  ( (ValueCellFull!9338 (v!12387 V!31151)) (EmptyCell!9338) )
))
(declare-datatypes ((array!55231 0))(
  ( (array!55232 (arr!26561 (Array (_ BitVec 32) ValueCell!9338)) (size!27022 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55231)

(assert (=> b!922564 (= res!622164 (and (= (size!27022 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27021 _keys!1487) (size!27022 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922565 () Bool)

(declare-fun e!517613 () Bool)

(declare-fun e!517616 () Bool)

(assert (=> b!922565 (= e!517613 e!517616)))

(declare-fun res!622163 () Bool)

(assert (=> b!922565 (=> (not res!622163) (not e!517616))))

(declare-fun lt!414213 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922565 (= res!622163 (validKeyInArray!0 lt!414213))))

(assert (=> b!922565 (= lt!414213 (select (arr!26560 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922566 () Bool)

(declare-fun e!517620 () Bool)

(assert (=> b!922566 (= e!517620 tp_is_empty!19639)))

(declare-fun res!622171 () Bool)

(assert (=> start!78900 (=> (not res!622171) (not e!517617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78900 (= res!622171 (validMask!0 mask!1881))))

(assert (=> start!78900 e!517617))

(assert (=> start!78900 true))

(assert (=> start!78900 tp_is_empty!19639))

(declare-fun e!517614 () Bool)

(declare-fun array_inv!20774 (array!55231) Bool)

(assert (=> start!78900 (and (array_inv!20774 _values!1231) e!517614)))

(assert (=> start!78900 tp!59835))

(declare-fun array_inv!20775 (array!55229) Bool)

(assert (=> start!78900 (array_inv!20775 _keys!1487)))

(declare-fun mapIsEmpty!31215 () Bool)

(declare-fun mapRes!31215 () Bool)

(assert (=> mapIsEmpty!31215 mapRes!31215))

(declare-fun b!922567 () Bool)

(assert (=> b!922567 (= e!517617 e!517613)))

(declare-fun res!622166 () Bool)

(assert (=> b!922567 (=> (not res!622166) (not e!517613))))

(declare-datatypes ((tuple2!12908 0))(
  ( (tuple2!12909 (_1!6465 (_ BitVec 64)) (_2!6465 V!31151)) )
))
(declare-datatypes ((List!18691 0))(
  ( (Nil!18688) (Cons!18687 (h!19833 tuple2!12908) (t!26543 List!18691)) )
))
(declare-datatypes ((ListLongMap!11595 0))(
  ( (ListLongMap!11596 (toList!5813 List!18691)) )
))
(declare-fun lt!414208 () ListLongMap!11595)

(declare-fun contains!4828 (ListLongMap!11595 (_ BitVec 64)) Bool)

(assert (=> b!922567 (= res!622166 (contains!4828 lt!414208 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31151)

(declare-fun minValue!1173 () V!31151)

(declare-fun getCurrentListMap!3002 (array!55229 array!55231 (_ BitVec 32) (_ BitVec 32) V!31151 V!31151 (_ BitVec 32) Int) ListLongMap!11595)

(assert (=> b!922567 (= lt!414208 (getCurrentListMap!3002 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922568 () Bool)

(declare-fun res!622165 () Bool)

(assert (=> b!922568 (=> (not res!622165) (not e!517613))))

(assert (=> b!922568 (= res!622165 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922569 () Bool)

(declare-fun res!622172 () Bool)

(assert (=> b!922569 (=> (not res!622172) (not e!517617))))

(declare-datatypes ((List!18692 0))(
  ( (Nil!18689) (Cons!18688 (h!19834 (_ BitVec 64)) (t!26544 List!18692)) )
))
(declare-fun arrayNoDuplicates!0 (array!55229 (_ BitVec 32) List!18692) Bool)

(assert (=> b!922569 (= res!622172 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18689))))

(declare-fun b!922570 () Bool)

(assert (=> b!922570 (= e!517616 (not true))))

(assert (=> b!922570 (not (= lt!414213 k0!1099))))

(declare-datatypes ((Unit!31050 0))(
  ( (Unit!31051) )
))
(declare-fun lt!414215 () Unit!31050)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55229 (_ BitVec 64) (_ BitVec 32) List!18692) Unit!31050)

(assert (=> b!922570 (= lt!414215 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18689))))

(assert (=> b!922570 e!517618))

(declare-fun c!96133 () Bool)

(assert (=> b!922570 (= c!96133 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414211 () Unit!31050)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!207 (array!55229 array!55231 (_ BitVec 32) (_ BitVec 32) V!31151 V!31151 (_ BitVec 64) (_ BitVec 32) Int) Unit!31050)

(assert (=> b!922570 (= lt!414211 (lemmaListMapContainsThenArrayContainsFrom!207 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922570 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18689)))

(declare-fun lt!414209 () Unit!31050)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55229 (_ BitVec 32) (_ BitVec 32)) Unit!31050)

(assert (=> b!922570 (= lt!414209 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414210 () tuple2!12908)

(declare-fun +!2719 (ListLongMap!11595 tuple2!12908) ListLongMap!11595)

(assert (=> b!922570 (contains!4828 (+!2719 lt!414208 lt!414210) k0!1099)))

(declare-fun lt!414212 () V!31151)

(declare-fun lt!414214 () Unit!31050)

(declare-fun addStillContains!416 (ListLongMap!11595 (_ BitVec 64) V!31151 (_ BitVec 64)) Unit!31050)

(assert (=> b!922570 (= lt!414214 (addStillContains!416 lt!414208 lt!414213 lt!414212 k0!1099))))

(assert (=> b!922570 (= (getCurrentListMap!3002 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2719 (getCurrentListMap!3002 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414210))))

(assert (=> b!922570 (= lt!414210 (tuple2!12909 lt!414213 lt!414212))))

(declare-fun get!13958 (ValueCell!9338 V!31151) V!31151)

(declare-fun dynLambda!1475 (Int (_ BitVec 64)) V!31151)

(assert (=> b!922570 (= lt!414212 (get!13958 (select (arr!26561 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1475 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414207 () Unit!31050)

(declare-fun lemmaListMapRecursiveValidKeyArray!83 (array!55229 array!55231 (_ BitVec 32) (_ BitVec 32) V!31151 V!31151 (_ BitVec 32) Int) Unit!31050)

(assert (=> b!922570 (= lt!414207 (lemmaListMapRecursiveValidKeyArray!83 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31215 () Bool)

(declare-fun tp!59834 () Bool)

(assert (=> mapNonEmpty!31215 (= mapRes!31215 (and tp!59834 e!517620))))

(declare-fun mapRest!31215 () (Array (_ BitVec 32) ValueCell!9338))

(declare-fun mapKey!31215 () (_ BitVec 32))

(declare-fun mapValue!31215 () ValueCell!9338)

(assert (=> mapNonEmpty!31215 (= (arr!26561 _values!1231) (store mapRest!31215 mapKey!31215 mapValue!31215))))

(declare-fun b!922571 () Bool)

(declare-fun res!622167 () Bool)

(assert (=> b!922571 (=> (not res!622167) (not e!517617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55229 (_ BitVec 32)) Bool)

(assert (=> b!922571 (= res!622167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922572 () Bool)

(assert (=> b!922572 (= e!517614 (and e!517615 mapRes!31215))))

(declare-fun condMapEmpty!31215 () Bool)

(declare-fun mapDefault!31215 () ValueCell!9338)

(assert (=> b!922572 (= condMapEmpty!31215 (= (arr!26561 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9338)) mapDefault!31215)))))

(declare-fun b!922573 () Bool)

(declare-fun res!622169 () Bool)

(assert (=> b!922573 (=> (not res!622169) (not e!517613))))

(declare-fun v!791 () V!31151)

(declare-fun apply!628 (ListLongMap!11595 (_ BitVec 64)) V!31151)

(assert (=> b!922573 (= res!622169 (= (apply!628 lt!414208 k0!1099) v!791))))

(declare-fun b!922574 () Bool)

(declare-fun res!622170 () Bool)

(assert (=> b!922574 (=> (not res!622170) (not e!517613))))

(assert (=> b!922574 (= res!622170 (validKeyInArray!0 k0!1099))))

(declare-fun b!922575 () Bool)

(declare-fun arrayContainsKey!0 (array!55229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922575 (= e!517618 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!78900 res!622171) b!922564))

(assert (= (and b!922564 res!622164) b!922571))

(assert (= (and b!922571 res!622167) b!922569))

(assert (= (and b!922569 res!622172) b!922561))

(assert (= (and b!922561 res!622168) b!922567))

(assert (= (and b!922567 res!622166) b!922573))

(assert (= (and b!922573 res!622169) b!922568))

(assert (= (and b!922568 res!622165) b!922574))

(assert (= (and b!922574 res!622170) b!922565))

(assert (= (and b!922565 res!622163) b!922570))

(assert (= (and b!922570 c!96133) b!922575))

(assert (= (and b!922570 (not c!96133)) b!922562))

(assert (= (and b!922572 condMapEmpty!31215) mapIsEmpty!31215))

(assert (= (and b!922572 (not condMapEmpty!31215)) mapNonEmpty!31215))

(get-info :version)

(assert (= (and mapNonEmpty!31215 ((_ is ValueCellFull!9338) mapValue!31215)) b!922566))

(assert (= (and b!922572 ((_ is ValueCellFull!9338) mapDefault!31215)) b!922563))

(assert (= start!78900 b!922572))

(declare-fun b_lambda!13615 () Bool)

(assert (=> (not b_lambda!13615) (not b!922570)))

(declare-fun t!26542 () Bool)

(declare-fun tb!5703 () Bool)

(assert (=> (and start!78900 (= defaultEntry!1235 defaultEntry!1235) t!26542) tb!5703))

(declare-fun result!11237 () Bool)

(assert (=> tb!5703 (= result!11237 tp_is_empty!19639)))

(assert (=> b!922570 t!26542))

(declare-fun b_and!27975 () Bool)

(assert (= b_and!27973 (and (=> t!26542 result!11237) b_and!27975)))

(declare-fun m!856165 () Bool)

(assert (=> b!922573 m!856165))

(declare-fun m!856167 () Bool)

(assert (=> b!922571 m!856167))

(declare-fun m!856169 () Bool)

(assert (=> b!922575 m!856169))

(declare-fun m!856171 () Bool)

(assert (=> b!922574 m!856171))

(declare-fun m!856173 () Bool)

(assert (=> b!922567 m!856173))

(declare-fun m!856175 () Bool)

(assert (=> b!922567 m!856175))

(declare-fun m!856177 () Bool)

(assert (=> b!922565 m!856177))

(declare-fun m!856179 () Bool)

(assert (=> b!922565 m!856179))

(declare-fun m!856181 () Bool)

(assert (=> mapNonEmpty!31215 m!856181))

(declare-fun m!856183 () Bool)

(assert (=> start!78900 m!856183))

(declare-fun m!856185 () Bool)

(assert (=> start!78900 m!856185))

(declare-fun m!856187 () Bool)

(assert (=> start!78900 m!856187))

(declare-fun m!856189 () Bool)

(assert (=> b!922570 m!856189))

(declare-fun m!856191 () Bool)

(assert (=> b!922570 m!856191))

(declare-fun m!856193 () Bool)

(assert (=> b!922570 m!856193))

(declare-fun m!856195 () Bool)

(assert (=> b!922570 m!856195))

(declare-fun m!856197 () Bool)

(assert (=> b!922570 m!856197))

(assert (=> b!922570 m!856189))

(declare-fun m!856199 () Bool)

(assert (=> b!922570 m!856199))

(assert (=> b!922570 m!856193))

(assert (=> b!922570 m!856197))

(declare-fun m!856201 () Bool)

(assert (=> b!922570 m!856201))

(declare-fun m!856203 () Bool)

(assert (=> b!922570 m!856203))

(declare-fun m!856205 () Bool)

(assert (=> b!922570 m!856205))

(declare-fun m!856207 () Bool)

(assert (=> b!922570 m!856207))

(declare-fun m!856209 () Bool)

(assert (=> b!922570 m!856209))

(declare-fun m!856211 () Bool)

(assert (=> b!922570 m!856211))

(declare-fun m!856213 () Bool)

(assert (=> b!922570 m!856213))

(assert (=> b!922570 m!856211))

(declare-fun m!856215 () Bool)

(assert (=> b!922570 m!856215))

(declare-fun m!856217 () Bool)

(assert (=> b!922569 m!856217))

(check-sat (not b!922573) (not b!922567) (not b!922574) (not b!922571) (not b!922569) b_and!27975 (not mapNonEmpty!31215) (not b_next!17131) (not b!922565) (not start!78900) (not b_lambda!13615) (not b!922575) (not b!922570) tp_is_empty!19639)
(check-sat b_and!27975 (not b_next!17131))
