; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79062 () Bool)

(assert start!79062)

(declare-fun b_free!17107 () Bool)

(declare-fun b_next!17107 () Bool)

(assert (=> start!79062 (= b_free!17107 (not b_next!17107))))

(declare-fun tp!59762 () Bool)

(declare-fun b_and!27961 () Bool)

(assert (=> start!79062 (= tp!59762 b_and!27961)))

(declare-fun b!923139 () Bool)

(declare-fun res!622266 () Bool)

(declare-fun e!518058 () Bool)

(assert (=> b!923139 (=> (not res!622266) (not e!518058))))

(declare-datatypes ((array!55253 0))(
  ( (array!55254 (arr!26567 (Array (_ BitVec 32) (_ BitVec 64))) (size!27027 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55253)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55253 (_ BitVec 32)) Bool)

(assert (=> b!923139 (= res!622266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923140 () Bool)

(declare-fun e!518060 () Bool)

(declare-fun e!518056 () Bool)

(declare-fun mapRes!31179 () Bool)

(assert (=> b!923140 (= e!518060 (and e!518056 mapRes!31179))))

(declare-fun condMapEmpty!31179 () Bool)

(declare-datatypes ((V!31119 0))(
  ( (V!31120 (val!9858 Int)) )
))
(declare-datatypes ((ValueCell!9326 0))(
  ( (ValueCellFull!9326 (v!12373 V!31119)) (EmptyCell!9326) )
))
(declare-datatypes ((array!55255 0))(
  ( (array!55256 (arr!26568 (Array (_ BitVec 32) ValueCell!9326)) (size!27028 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55255)

(declare-fun mapDefault!31179 () ValueCell!9326)

(assert (=> b!923140 (= condMapEmpty!31179 (= (arr!26568 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9326)) mapDefault!31179)))))

(declare-fun mapIsEmpty!31179 () Bool)

(assert (=> mapIsEmpty!31179 mapRes!31179))

(declare-fun res!622265 () Bool)

(assert (=> start!79062 (=> (not res!622265) (not e!518058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79062 (= res!622265 (validMask!0 mask!1881))))

(assert (=> start!79062 e!518058))

(assert (=> start!79062 true))

(declare-fun tp_is_empty!19615 () Bool)

(assert (=> start!79062 tp_is_empty!19615))

(declare-fun array_inv!20794 (array!55255) Bool)

(assert (=> start!79062 (and (array_inv!20794 _values!1231) e!518060)))

(assert (=> start!79062 tp!59762))

(declare-fun array_inv!20795 (array!55253) Bool)

(assert (=> start!79062 (array_inv!20795 _keys!1487)))

(declare-fun b!923141 () Bool)

(declare-fun res!622261 () Bool)

(assert (=> b!923141 (=> (not res!622261) (not e!518058))))

(declare-datatypes ((List!18630 0))(
  ( (Nil!18627) (Cons!18626 (h!19778 (_ BitVec 64)) (t!26459 List!18630)) )
))
(declare-fun arrayNoDuplicates!0 (array!55253 (_ BitVec 32) List!18630) Bool)

(assert (=> b!923141 (= res!622261 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18627))))

(declare-fun mapNonEmpty!31179 () Bool)

(declare-fun tp!59763 () Bool)

(declare-fun e!518055 () Bool)

(assert (=> mapNonEmpty!31179 (= mapRes!31179 (and tp!59763 e!518055))))

(declare-fun mapKey!31179 () (_ BitVec 32))

(declare-fun mapValue!31179 () ValueCell!9326)

(declare-fun mapRest!31179 () (Array (_ BitVec 32) ValueCell!9326))

(assert (=> mapNonEmpty!31179 (= (arr!26568 _values!1231) (store mapRest!31179 mapKey!31179 mapValue!31179))))

(declare-fun b!923142 () Bool)

(declare-fun e!518061 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!923142 (= e!518061 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923143 () Bool)

(declare-fun e!518059 () Bool)

(assert (=> b!923143 (= e!518059 (not true))))

(declare-fun lt!414482 () (_ BitVec 64))

(assert (=> b!923143 (not (= lt!414482 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((Unit!31110 0))(
  ( (Unit!31111) )
))
(declare-fun lt!414480 () Unit!31110)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55253 (_ BitVec 64) (_ BitVec 32) List!18630) Unit!31110)

(assert (=> b!923143 (= lt!414480 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18627))))

(assert (=> b!923143 e!518061))

(declare-fun c!96444 () Bool)

(assert (=> b!923143 (= c!96444 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31119)

(declare-fun minValue!1173 () V!31119)

(declare-fun lt!414481 () Unit!31110)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!190 (array!55253 array!55255 (_ BitVec 32) (_ BitVec 32) V!31119 V!31119 (_ BitVec 64) (_ BitVec 32) Int) Unit!31110)

(assert (=> b!923143 (= lt!414481 (lemmaListMapContainsThenArrayContainsFrom!190 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923143 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18627)))

(declare-fun lt!414485 () Unit!31110)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55253 (_ BitVec 32) (_ BitVec 32)) Unit!31110)

(assert (=> b!923143 (= lt!414485 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12812 0))(
  ( (tuple2!12813 (_1!6417 (_ BitVec 64)) (_2!6417 V!31119)) )
))
(declare-datatypes ((List!18631 0))(
  ( (Nil!18628) (Cons!18627 (h!19779 tuple2!12812) (t!26460 List!18631)) )
))
(declare-datatypes ((ListLongMap!11511 0))(
  ( (ListLongMap!11512 (toList!5771 List!18631)) )
))
(declare-fun lt!414487 () ListLongMap!11511)

(declare-fun lt!414484 () tuple2!12812)

(declare-fun contains!4845 (ListLongMap!11511 (_ BitVec 64)) Bool)

(declare-fun +!2699 (ListLongMap!11511 tuple2!12812) ListLongMap!11511)

(assert (=> b!923143 (contains!4845 (+!2699 lt!414487 lt!414484) k0!1099)))

(declare-fun lt!414488 () V!31119)

(declare-fun lt!414486 () Unit!31110)

(declare-fun addStillContains!408 (ListLongMap!11511 (_ BitVec 64) V!31119 (_ BitVec 64)) Unit!31110)

(assert (=> b!923143 (= lt!414486 (addStillContains!408 lt!414487 lt!414482 lt!414488 k0!1099))))

(declare-fun getCurrentListMap!3023 (array!55253 array!55255 (_ BitVec 32) (_ BitVec 32) V!31119 V!31119 (_ BitVec 32) Int) ListLongMap!11511)

(assert (=> b!923143 (= (getCurrentListMap!3023 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2699 (getCurrentListMap!3023 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414484))))

(assert (=> b!923143 (= lt!414484 (tuple2!12813 lt!414482 lt!414488))))

(declare-fun get!13970 (ValueCell!9326 V!31119) V!31119)

(declare-fun dynLambda!1496 (Int (_ BitVec 64)) V!31119)

(assert (=> b!923143 (= lt!414488 (get!13970 (select (arr!26568 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1496 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414483 () Unit!31110)

(declare-fun lemmaListMapRecursiveValidKeyArray!79 (array!55253 array!55255 (_ BitVec 32) (_ BitVec 32) V!31119 V!31119 (_ BitVec 32) Int) Unit!31110)

(assert (=> b!923143 (= lt!414483 (lemmaListMapRecursiveValidKeyArray!79 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923144 () Bool)

(declare-fun res!622258 () Bool)

(declare-fun e!518057 () Bool)

(assert (=> b!923144 (=> (not res!622258) (not e!518057))))

(declare-fun v!791 () V!31119)

(declare-fun apply!630 (ListLongMap!11511 (_ BitVec 64)) V!31119)

(assert (=> b!923144 (= res!622258 (= (apply!630 lt!414487 k0!1099) v!791))))

(declare-fun b!923145 () Bool)

(declare-fun res!622262 () Bool)

(assert (=> b!923145 (=> (not res!622262) (not e!518058))))

(assert (=> b!923145 (= res!622262 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27027 _keys!1487))))))

(declare-fun b!923146 () Bool)

(assert (=> b!923146 (= e!518056 tp_is_empty!19615)))

(declare-fun b!923147 () Bool)

(declare-fun arrayContainsKey!0 (array!55253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923147 (= e!518061 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923148 () Bool)

(declare-fun res!622259 () Bool)

(assert (=> b!923148 (=> (not res!622259) (not e!518058))))

(assert (=> b!923148 (= res!622259 (and (= (size!27028 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27027 _keys!1487) (size!27028 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923149 () Bool)

(declare-fun res!622260 () Bool)

(assert (=> b!923149 (=> (not res!622260) (not e!518057))))

(assert (=> b!923149 (= res!622260 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!923150 () Bool)

(assert (=> b!923150 (= e!518055 tp_is_empty!19615)))

(declare-fun b!923151 () Bool)

(assert (=> b!923151 (= e!518058 e!518057)))

(declare-fun res!622264 () Bool)

(assert (=> b!923151 (=> (not res!622264) (not e!518057))))

(assert (=> b!923151 (= res!622264 (contains!4845 lt!414487 k0!1099))))

(assert (=> b!923151 (= lt!414487 (getCurrentListMap!3023 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923152 () Bool)

(assert (=> b!923152 (= e!518057 e!518059)))

(declare-fun res!622257 () Bool)

(assert (=> b!923152 (=> (not res!622257) (not e!518059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923152 (= res!622257 (validKeyInArray!0 lt!414482))))

(assert (=> b!923152 (= lt!414482 (select (arr!26567 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!923153 () Bool)

(declare-fun res!622263 () Bool)

(assert (=> b!923153 (=> (not res!622263) (not e!518057))))

(assert (=> b!923153 (= res!622263 (validKeyInArray!0 k0!1099))))

(assert (= (and start!79062 res!622265) b!923148))

(assert (= (and b!923148 res!622259) b!923139))

(assert (= (and b!923139 res!622266) b!923141))

(assert (= (and b!923141 res!622261) b!923145))

(assert (= (and b!923145 res!622262) b!923151))

(assert (= (and b!923151 res!622264) b!923144))

(assert (= (and b!923144 res!622258) b!923149))

(assert (= (and b!923149 res!622260) b!923153))

(assert (= (and b!923153 res!622263) b!923152))

(assert (= (and b!923152 res!622257) b!923143))

(assert (= (and b!923143 c!96444) b!923147))

(assert (= (and b!923143 (not c!96444)) b!923142))

(assert (= (and b!923140 condMapEmpty!31179) mapIsEmpty!31179))

(assert (= (and b!923140 (not condMapEmpty!31179)) mapNonEmpty!31179))

(get-info :version)

(assert (= (and mapNonEmpty!31179 ((_ is ValueCellFull!9326) mapValue!31179)) b!923150))

(assert (= (and b!923140 ((_ is ValueCellFull!9326) mapDefault!31179)) b!923146))

(assert (= start!79062 b!923140))

(declare-fun b_lambda!13623 () Bool)

(assert (=> (not b_lambda!13623) (not b!923143)))

(declare-fun t!26458 () Bool)

(declare-fun tb!5679 () Bool)

(assert (=> (and start!79062 (= defaultEntry!1235 defaultEntry!1235) t!26458) tb!5679))

(declare-fun result!11189 () Bool)

(assert (=> tb!5679 (= result!11189 tp_is_empty!19615)))

(assert (=> b!923143 t!26458))

(declare-fun b_and!27963 () Bool)

(assert (= b_and!27961 (and (=> t!26458 result!11189) b_and!27963)))

(declare-fun m!857569 () Bool)

(assert (=> b!923139 m!857569))

(declare-fun m!857571 () Bool)

(assert (=> b!923144 m!857571))

(declare-fun m!857573 () Bool)

(assert (=> b!923153 m!857573))

(declare-fun m!857575 () Bool)

(assert (=> start!79062 m!857575))

(declare-fun m!857577 () Bool)

(assert (=> start!79062 m!857577))

(declare-fun m!857579 () Bool)

(assert (=> start!79062 m!857579))

(declare-fun m!857581 () Bool)

(assert (=> b!923141 m!857581))

(declare-fun m!857583 () Bool)

(assert (=> b!923147 m!857583))

(declare-fun m!857585 () Bool)

(assert (=> b!923152 m!857585))

(declare-fun m!857587 () Bool)

(assert (=> b!923152 m!857587))

(declare-fun m!857589 () Bool)

(assert (=> b!923143 m!857589))

(declare-fun m!857591 () Bool)

(assert (=> b!923143 m!857591))

(declare-fun m!857593 () Bool)

(assert (=> b!923143 m!857593))

(declare-fun m!857595 () Bool)

(assert (=> b!923143 m!857595))

(declare-fun m!857597 () Bool)

(assert (=> b!923143 m!857597))

(assert (=> b!923143 m!857595))

(assert (=> b!923143 m!857597))

(declare-fun m!857599 () Bool)

(assert (=> b!923143 m!857599))

(declare-fun m!857601 () Bool)

(assert (=> b!923143 m!857601))

(declare-fun m!857603 () Bool)

(assert (=> b!923143 m!857603))

(declare-fun m!857605 () Bool)

(assert (=> b!923143 m!857605))

(declare-fun m!857607 () Bool)

(assert (=> b!923143 m!857607))

(declare-fun m!857609 () Bool)

(assert (=> b!923143 m!857609))

(declare-fun m!857611 () Bool)

(assert (=> b!923143 m!857611))

(assert (=> b!923143 m!857589))

(declare-fun m!857613 () Bool)

(assert (=> b!923143 m!857613))

(declare-fun m!857615 () Bool)

(assert (=> b!923143 m!857615))

(assert (=> b!923143 m!857607))

(declare-fun m!857617 () Bool)

(assert (=> b!923151 m!857617))

(declare-fun m!857619 () Bool)

(assert (=> b!923151 m!857619))

(declare-fun m!857621 () Bool)

(assert (=> mapNonEmpty!31179 m!857621))

(check-sat (not mapNonEmpty!31179) (not b_lambda!13623) (not b!923151) (not b!923143) (not b!923147) (not b!923144) b_and!27963 tp_is_empty!19615 (not b_next!17107) (not b!923141) (not b!923153) (not start!79062) (not b!923139) (not b!923152))
(check-sat b_and!27963 (not b_next!17107))
