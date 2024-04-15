; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78864 () Bool)

(assert start!78864)

(declare-fun b_free!17095 () Bool)

(declare-fun b_next!17095 () Bool)

(assert (=> start!78864 (= b_free!17095 (not b_next!17095))))

(declare-fun tp!59727 () Bool)

(declare-fun b_and!27901 () Bool)

(assert (=> start!78864 (= tp!59727 b_and!27901)))

(declare-fun b!921715 () Bool)

(declare-fun res!621625 () Bool)

(declare-fun e!517187 () Bool)

(assert (=> b!921715 (=> (not res!621625) (not e!517187))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921715 (= res!621625 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31161 () Bool)

(declare-fun mapRes!31161 () Bool)

(assert (=> mapIsEmpty!31161 mapRes!31161))

(declare-fun mapNonEmpty!31161 () Bool)

(declare-fun tp!59726 () Bool)

(declare-fun e!517181 () Bool)

(assert (=> mapNonEmpty!31161 (= mapRes!31161 (and tp!59726 e!517181))))

(declare-datatypes ((V!31103 0))(
  ( (V!31104 (val!9852 Int)) )
))
(declare-datatypes ((ValueCell!9320 0))(
  ( (ValueCellFull!9320 (v!12369 V!31103)) (EmptyCell!9320) )
))
(declare-fun mapValue!31161 () ValueCell!9320)

(declare-fun mapKey!31161 () (_ BitVec 32))

(declare-fun mapRest!31161 () (Array (_ BitVec 32) ValueCell!9320))

(declare-datatypes ((array!55157 0))(
  ( (array!55158 (arr!26524 (Array (_ BitVec 32) ValueCell!9320)) (size!26985 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55157)

(assert (=> mapNonEmpty!31161 (= (arr!26524 _values!1231) (store mapRest!31161 mapKey!31161 mapValue!31161))))

(declare-fun b!921716 () Bool)

(declare-fun res!621629 () Bool)

(assert (=> b!921716 (=> (not res!621629) (not e!517187))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31103)

(declare-datatypes ((tuple2!12876 0))(
  ( (tuple2!12877 (_1!6449 (_ BitVec 64)) (_2!6449 V!31103)) )
))
(declare-datatypes ((List!18659 0))(
  ( (Nil!18656) (Cons!18655 (h!19801 tuple2!12876) (t!26475 List!18659)) )
))
(declare-datatypes ((ListLongMap!11563 0))(
  ( (ListLongMap!11564 (toList!5797 List!18659)) )
))
(declare-fun lt!413727 () ListLongMap!11563)

(declare-fun apply!615 (ListLongMap!11563 (_ BitVec 64)) V!31103)

(assert (=> b!921716 (= res!621629 (= (apply!615 lt!413727 k0!1099) v!791))))

(declare-fun b!921717 () Bool)

(declare-fun e!517184 () Bool)

(assert (=> b!921717 (= e!517184 e!517187)))

(declare-fun res!621628 () Bool)

(assert (=> b!921717 (=> (not res!621628) (not e!517187))))

(declare-fun contains!4813 (ListLongMap!11563 (_ BitVec 64)) Bool)

(assert (=> b!921717 (= res!621628 (contains!4813 lt!413727 k0!1099))))

(declare-datatypes ((array!55159 0))(
  ( (array!55160 (arr!26525 (Array (_ BitVec 32) (_ BitVec 64))) (size!26986 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55159)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31103)

(declare-fun minValue!1173 () V!31103)

(declare-fun getCurrentListMap!2987 (array!55159 array!55157 (_ BitVec 32) (_ BitVec 32) V!31103 V!31103 (_ BitVec 32) Int) ListLongMap!11563)

(assert (=> b!921717 (= lt!413727 (getCurrentListMap!2987 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921718 () Bool)

(declare-fun e!517188 () Bool)

(declare-fun e!517186 () Bool)

(assert (=> b!921718 (= e!517188 (and e!517186 mapRes!31161))))

(declare-fun condMapEmpty!31161 () Bool)

(declare-fun mapDefault!31161 () ValueCell!9320)

(assert (=> b!921718 (= condMapEmpty!31161 (= (arr!26524 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9320)) mapDefault!31161)))))

(declare-fun b!921719 () Bool)

(declare-fun res!621631 () Bool)

(assert (=> b!921719 (=> (not res!621631) (not e!517187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921719 (= res!621631 (validKeyInArray!0 k0!1099))))

(declare-fun b!921720 () Bool)

(declare-fun res!621626 () Bool)

(assert (=> b!921720 (=> (not res!621626) (not e!517184))))

(declare-datatypes ((List!18660 0))(
  ( (Nil!18657) (Cons!18656 (h!19802 (_ BitVec 64)) (t!26476 List!18660)) )
))
(declare-fun arrayNoDuplicates!0 (array!55159 (_ BitVec 32) List!18660) Bool)

(assert (=> b!921720 (= res!621626 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18657))))

(declare-fun b!921721 () Bool)

(declare-fun e!517185 () Bool)

(declare-fun arrayContainsKey!0 (array!55159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921721 (= e!517185 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921722 () Bool)

(declare-fun res!621624 () Bool)

(assert (=> b!921722 (=> (not res!621624) (not e!517184))))

(assert (=> b!921722 (= res!621624 (and (= (size!26985 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26986 _keys!1487) (size!26985 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!621623 () Bool)

(assert (=> start!78864 (=> (not res!621623) (not e!517184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78864 (= res!621623 (validMask!0 mask!1881))))

(assert (=> start!78864 e!517184))

(assert (=> start!78864 true))

(declare-fun tp_is_empty!19603 () Bool)

(assert (=> start!78864 tp_is_empty!19603))

(declare-fun array_inv!20748 (array!55157) Bool)

(assert (=> start!78864 (and (array_inv!20748 _values!1231) e!517188)))

(assert (=> start!78864 tp!59727))

(declare-fun array_inv!20749 (array!55159) Bool)

(assert (=> start!78864 (array_inv!20749 _keys!1487)))

(declare-fun b!921723 () Bool)

(declare-fun e!517183 () Bool)

(assert (=> b!921723 (= e!517183 (not true))))

(declare-fun lt!413728 () (_ BitVec 64))

(assert (=> b!921723 (not (= lt!413728 k0!1099))))

(declare-datatypes ((Unit!31022 0))(
  ( (Unit!31023) )
))
(declare-fun lt!413725 () Unit!31022)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55159 (_ BitVec 64) (_ BitVec 32) List!18660) Unit!31022)

(assert (=> b!921723 (= lt!413725 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18657))))

(assert (=> b!921723 e!517185))

(declare-fun c!96079 () Bool)

(assert (=> b!921723 (= c!96079 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!413722 () Unit!31022)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!193 (array!55159 array!55157 (_ BitVec 32) (_ BitVec 32) V!31103 V!31103 (_ BitVec 64) (_ BitVec 32) Int) Unit!31022)

(assert (=> b!921723 (= lt!413722 (lemmaListMapContainsThenArrayContainsFrom!193 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!921723 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18657)))

(declare-fun lt!413724 () Unit!31022)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55159 (_ BitVec 32) (_ BitVec 32)) Unit!31022)

(assert (=> b!921723 (= lt!413724 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413726 () tuple2!12876)

(declare-fun +!2705 (ListLongMap!11563 tuple2!12876) ListLongMap!11563)

(assert (=> b!921723 (contains!4813 (+!2705 lt!413727 lt!413726) k0!1099)))

(declare-fun lt!413729 () Unit!31022)

(declare-fun lt!413723 () V!31103)

(declare-fun addStillContains!402 (ListLongMap!11563 (_ BitVec 64) V!31103 (_ BitVec 64)) Unit!31022)

(assert (=> b!921723 (= lt!413729 (addStillContains!402 lt!413727 lt!413728 lt!413723 k0!1099))))

(assert (=> b!921723 (= (getCurrentListMap!2987 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2705 (getCurrentListMap!2987 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413726))))

(assert (=> b!921723 (= lt!413726 (tuple2!12877 lt!413728 lt!413723))))

(declare-fun get!13932 (ValueCell!9320 V!31103) V!31103)

(declare-fun dynLambda!1461 (Int (_ BitVec 64)) V!31103)

(assert (=> b!921723 (= lt!413723 (get!13932 (select (arr!26524 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1461 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413721 () Unit!31022)

(declare-fun lemmaListMapRecursiveValidKeyArray!69 (array!55159 array!55157 (_ BitVec 32) (_ BitVec 32) V!31103 V!31103 (_ BitVec 32) Int) Unit!31022)

(assert (=> b!921723 (= lt!413721 (lemmaListMapRecursiveValidKeyArray!69 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921724 () Bool)

(declare-fun res!621630 () Bool)

(assert (=> b!921724 (=> (not res!621630) (not e!517184))))

(assert (=> b!921724 (= res!621630 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26986 _keys!1487))))))

(declare-fun b!921725 () Bool)

(assert (=> b!921725 (= e!517185 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921726 () Bool)

(assert (=> b!921726 (= e!517187 e!517183)))

(declare-fun res!621627 () Bool)

(assert (=> b!921726 (=> (not res!621627) (not e!517183))))

(assert (=> b!921726 (= res!621627 (validKeyInArray!0 lt!413728))))

(assert (=> b!921726 (= lt!413728 (select (arr!26525 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921727 () Bool)

(declare-fun res!621632 () Bool)

(assert (=> b!921727 (=> (not res!621632) (not e!517184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55159 (_ BitVec 32)) Bool)

(assert (=> b!921727 (= res!621632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921728 () Bool)

(assert (=> b!921728 (= e!517186 tp_is_empty!19603)))

(declare-fun b!921729 () Bool)

(assert (=> b!921729 (= e!517181 tp_is_empty!19603)))

(assert (= (and start!78864 res!621623) b!921722))

(assert (= (and b!921722 res!621624) b!921727))

(assert (= (and b!921727 res!621632) b!921720))

(assert (= (and b!921720 res!621626) b!921724))

(assert (= (and b!921724 res!621630) b!921717))

(assert (= (and b!921717 res!621628) b!921716))

(assert (= (and b!921716 res!621629) b!921715))

(assert (= (and b!921715 res!621625) b!921719))

(assert (= (and b!921719 res!621631) b!921726))

(assert (= (and b!921726 res!621627) b!921723))

(assert (= (and b!921723 c!96079) b!921721))

(assert (= (and b!921723 (not c!96079)) b!921725))

(assert (= (and b!921718 condMapEmpty!31161) mapIsEmpty!31161))

(assert (= (and b!921718 (not condMapEmpty!31161)) mapNonEmpty!31161))

(get-info :version)

(assert (= (and mapNonEmpty!31161 ((_ is ValueCellFull!9320) mapValue!31161)) b!921729))

(assert (= (and b!921718 ((_ is ValueCellFull!9320) mapDefault!31161)) b!921728))

(assert (= start!78864 b!921718))

(declare-fun b_lambda!13579 () Bool)

(assert (=> (not b_lambda!13579) (not b!921723)))

(declare-fun t!26474 () Bool)

(declare-fun tb!5667 () Bool)

(assert (=> (and start!78864 (= defaultEntry!1235 defaultEntry!1235) t!26474) tb!5667))

(declare-fun result!11165 () Bool)

(assert (=> tb!5667 (= result!11165 tp_is_empty!19603)))

(assert (=> b!921723 t!26474))

(declare-fun b_and!27903 () Bool)

(assert (= b_and!27901 (and (=> t!26474 result!11165) b_and!27903)))

(declare-fun m!855193 () Bool)

(assert (=> mapNonEmpty!31161 m!855193))

(declare-fun m!855195 () Bool)

(assert (=> b!921717 m!855195))

(declare-fun m!855197 () Bool)

(assert (=> b!921717 m!855197))

(declare-fun m!855199 () Bool)

(assert (=> b!921723 m!855199))

(declare-fun m!855201 () Bool)

(assert (=> b!921723 m!855201))

(declare-fun m!855203 () Bool)

(assert (=> b!921723 m!855203))

(declare-fun m!855205 () Bool)

(assert (=> b!921723 m!855205))

(declare-fun m!855207 () Bool)

(assert (=> b!921723 m!855207))

(assert (=> b!921723 m!855199))

(declare-fun m!855209 () Bool)

(assert (=> b!921723 m!855209))

(assert (=> b!921723 m!855205))

(assert (=> b!921723 m!855207))

(declare-fun m!855211 () Bool)

(assert (=> b!921723 m!855211))

(declare-fun m!855213 () Bool)

(assert (=> b!921723 m!855213))

(declare-fun m!855215 () Bool)

(assert (=> b!921723 m!855215))

(declare-fun m!855217 () Bool)

(assert (=> b!921723 m!855217))

(declare-fun m!855219 () Bool)

(assert (=> b!921723 m!855219))

(declare-fun m!855221 () Bool)

(assert (=> b!921723 m!855221))

(declare-fun m!855223 () Bool)

(assert (=> b!921723 m!855223))

(assert (=> b!921723 m!855219))

(declare-fun m!855225 () Bool)

(assert (=> b!921723 m!855225))

(declare-fun m!855227 () Bool)

(assert (=> b!921721 m!855227))

(declare-fun m!855229 () Bool)

(assert (=> b!921719 m!855229))

(declare-fun m!855231 () Bool)

(assert (=> b!921716 m!855231))

(declare-fun m!855233 () Bool)

(assert (=> b!921727 m!855233))

(declare-fun m!855235 () Bool)

(assert (=> b!921720 m!855235))

(declare-fun m!855237 () Bool)

(assert (=> b!921726 m!855237))

(declare-fun m!855239 () Bool)

(assert (=> b!921726 m!855239))

(declare-fun m!855241 () Bool)

(assert (=> start!78864 m!855241))

(declare-fun m!855243 () Bool)

(assert (=> start!78864 m!855243))

(declare-fun m!855245 () Bool)

(assert (=> start!78864 m!855245))

(check-sat (not mapNonEmpty!31161) (not b!921720) (not b!921716) (not b!921723) (not b_next!17095) (not b_lambda!13579) (not b!921719) (not b!921727) (not b!921721) (not start!78864) tp_is_empty!19603 (not b!921726) b_and!27903 (not b!921717))
(check-sat b_and!27903 (not b_next!17095))
