; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79628 () Bool)

(assert start!79628)

(declare-fun b_free!17695 () Bool)

(declare-fun b_next!17695 () Bool)

(assert (=> start!79628 (= b_free!17695 (not b_next!17695))))

(declare-fun tp!61542 () Bool)

(declare-fun b_and!28955 () Bool)

(assert (=> start!79628 (= tp!61542 b_and!28955)))

(declare-fun b!936099 () Bool)

(declare-fun e!525601 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!936099 (= e!525601 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936100 () Bool)

(declare-fun e!525605 () Bool)

(declare-fun tp_is_empty!20203 () Bool)

(assert (=> b!936100 (= e!525605 tp_is_empty!20203)))

(declare-fun b!936101 () Bool)

(declare-fun e!525606 () Bool)

(assert (=> b!936101 (= e!525606 false)))

(declare-datatypes ((Unit!31486 0))(
  ( (Unit!31487) )
))
(declare-fun lt!421912 () Unit!31486)

(declare-fun e!525602 () Unit!31486)

(assert (=> b!936101 (= lt!421912 e!525602)))

(declare-fun c!97314 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936101 (= c!97314 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!32076 () Bool)

(declare-fun mapRes!32076 () Bool)

(declare-fun tp!61541 () Bool)

(declare-fun e!525599 () Bool)

(assert (=> mapNonEmpty!32076 (= mapRes!32076 (and tp!61541 e!525599))))

(declare-fun mapKey!32076 () (_ BitVec 32))

(declare-datatypes ((V!31903 0))(
  ( (V!31904 (val!10152 Int)) )
))
(declare-datatypes ((ValueCell!9620 0))(
  ( (ValueCellFull!9620 (v!12676 V!31903)) (EmptyCell!9620) )
))
(declare-fun mapRest!32076 () (Array (_ BitVec 32) ValueCell!9620))

(declare-fun mapValue!32076 () ValueCell!9620)

(declare-datatypes ((array!56315 0))(
  ( (array!56316 (arr!27098 (Array (_ BitVec 32) ValueCell!9620)) (size!27559 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56315)

(assert (=> mapNonEmpty!32076 (= (arr!27098 _values!1231) (store mapRest!32076 mapKey!32076 mapValue!32076))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!936102 () Bool)

(declare-datatypes ((array!56317 0))(
  ( (array!56318 (arr!27099 (Array (_ BitVec 32) (_ BitVec 64))) (size!27560 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56317)

(declare-fun arrayContainsKey!0 (array!56317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936102 (= e!525601 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936103 () Bool)

(declare-fun e!525600 () Unit!31486)

(declare-fun Unit!31488 () Unit!31486)

(assert (=> b!936103 (= e!525600 Unit!31488)))

(declare-fun res!630382 () Bool)

(declare-fun e!525604 () Bool)

(assert (=> start!79628 (=> (not res!630382) (not e!525604))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79628 (= res!630382 (validMask!0 mask!1881))))

(assert (=> start!79628 e!525604))

(assert (=> start!79628 true))

(assert (=> start!79628 tp_is_empty!20203))

(declare-fun e!525603 () Bool)

(declare-fun array_inv!21148 (array!56315) Bool)

(assert (=> start!79628 (and (array_inv!21148 _values!1231) e!525603)))

(assert (=> start!79628 tp!61542))

(declare-fun array_inv!21149 (array!56317) Bool)

(assert (=> start!79628 (array_inv!21149 _keys!1487)))

(declare-fun b!936104 () Bool)

(declare-fun res!630386 () Bool)

(assert (=> b!936104 (=> (not res!630386) (not e!525604))))

(assert (=> b!936104 (= res!630386 (and (= (size!27559 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27560 _keys!1487) (size!27559 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936105 () Bool)

(declare-fun e!525608 () Bool)

(assert (=> b!936105 (= e!525604 e!525608)))

(declare-fun res!630381 () Bool)

(assert (=> b!936105 (=> (not res!630381) (not e!525608))))

(declare-datatypes ((tuple2!13386 0))(
  ( (tuple2!13387 (_1!6704 (_ BitVec 64)) (_2!6704 V!31903)) )
))
(declare-datatypes ((List!19134 0))(
  ( (Nil!19131) (Cons!19130 (h!20276 tuple2!13386) (t!27364 List!19134)) )
))
(declare-datatypes ((ListLongMap!12073 0))(
  ( (ListLongMap!12074 (toList!6052 List!19134)) )
))
(declare-fun lt!421914 () ListLongMap!12073)

(declare-fun contains!5056 (ListLongMap!12073 (_ BitVec 64)) Bool)

(assert (=> b!936105 (= res!630381 (contains!5056 lt!421914 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31903)

(declare-fun minValue!1173 () V!31903)

(declare-fun getCurrentListMap!3218 (array!56317 array!56315 (_ BitVec 32) (_ BitVec 32) V!31903 V!31903 (_ BitVec 32) Int) ListLongMap!12073)

(assert (=> b!936105 (= lt!421914 (getCurrentListMap!3218 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936106 () Bool)

(declare-fun res!630380 () Bool)

(assert (=> b!936106 (=> (not res!630380) (not e!525604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56317 (_ BitVec 32)) Bool)

(assert (=> b!936106 (= res!630380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936107 () Bool)

(assert (=> b!936107 (= e!525603 (and e!525605 mapRes!32076))))

(declare-fun condMapEmpty!32076 () Bool)

(declare-fun mapDefault!32076 () ValueCell!9620)

(assert (=> b!936107 (= condMapEmpty!32076 (= (arr!27098 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9620)) mapDefault!32076)))))

(declare-fun b!936108 () Bool)

(assert (=> b!936108 (= e!525599 tp_is_empty!20203)))

(declare-fun b!936109 () Bool)

(declare-fun Unit!31489 () Unit!31486)

(assert (=> b!936109 (= e!525602 Unit!31489)))

(declare-fun b!936110 () Bool)

(assert (=> b!936110 (= e!525602 e!525600)))

(declare-fun lt!421908 () (_ BitVec 64))

(assert (=> b!936110 (= lt!421908 (select (arr!27099 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97315 () Bool)

(assert (=> b!936110 (= c!97315 (validKeyInArray!0 lt!421908))))

(declare-fun b!936111 () Bool)

(declare-fun lt!421920 () ListLongMap!12073)

(declare-fun lt!421909 () V!31903)

(declare-fun apply!829 (ListLongMap!12073 (_ BitVec 64)) V!31903)

(assert (=> b!936111 (= (apply!829 lt!421920 k0!1099) lt!421909)))

(declare-fun lt!421915 () V!31903)

(declare-fun lt!421916 () Unit!31486)

(declare-fun addApplyDifferent!417 (ListLongMap!12073 (_ BitVec 64) V!31903 (_ BitVec 64)) Unit!31486)

(assert (=> b!936111 (= lt!421916 (addApplyDifferent!417 lt!421914 lt!421908 lt!421915 k0!1099))))

(assert (=> b!936111 (not (= lt!421908 k0!1099))))

(declare-fun lt!421918 () Unit!31486)

(declare-datatypes ((List!19135 0))(
  ( (Nil!19132) (Cons!19131 (h!20277 (_ BitVec 64)) (t!27365 List!19135)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56317 (_ BitVec 64) (_ BitVec 32) List!19135) Unit!31486)

(assert (=> b!936111 (= lt!421918 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19132))))

(assert (=> b!936111 e!525601))

(declare-fun c!97313 () Bool)

(assert (=> b!936111 (= c!97313 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421913 () Unit!31486)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!295 (array!56317 array!56315 (_ BitVec 32) (_ BitVec 32) V!31903 V!31903 (_ BitVec 64) (_ BitVec 32) Int) Unit!31486)

(assert (=> b!936111 (= lt!421913 (lemmaListMapContainsThenArrayContainsFrom!295 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56317 (_ BitVec 32) List!19135) Bool)

(assert (=> b!936111 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19132)))

(declare-fun lt!421910 () Unit!31486)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56317 (_ BitVec 32) (_ BitVec 32)) Unit!31486)

(assert (=> b!936111 (= lt!421910 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!936111 (contains!5056 lt!421920 k0!1099)))

(declare-fun lt!421911 () tuple2!13386)

(declare-fun +!2848 (ListLongMap!12073 tuple2!13386) ListLongMap!12073)

(assert (=> b!936111 (= lt!421920 (+!2848 lt!421914 lt!421911))))

(declare-fun lt!421917 () Unit!31486)

(declare-fun addStillContains!537 (ListLongMap!12073 (_ BitVec 64) V!31903 (_ BitVec 64)) Unit!31486)

(assert (=> b!936111 (= lt!421917 (addStillContains!537 lt!421914 lt!421908 lt!421915 k0!1099))))

(assert (=> b!936111 (= (getCurrentListMap!3218 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2848 (getCurrentListMap!3218 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421911))))

(assert (=> b!936111 (= lt!421911 (tuple2!13387 lt!421908 lt!421915))))

(declare-fun get!14290 (ValueCell!9620 V!31903) V!31903)

(declare-fun dynLambda!1604 (Int (_ BitVec 64)) V!31903)

(assert (=> b!936111 (= lt!421915 (get!14290 (select (arr!27098 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1604 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421919 () Unit!31486)

(declare-fun lemmaListMapRecursiveValidKeyArray!212 (array!56317 array!56315 (_ BitVec 32) (_ BitVec 32) V!31903 V!31903 (_ BitVec 32) Int) Unit!31486)

(assert (=> b!936111 (= lt!421919 (lemmaListMapRecursiveValidKeyArray!212 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!936111 (= e!525600 lt!421916)))

(declare-fun b!936112 () Bool)

(declare-fun res!630384 () Bool)

(assert (=> b!936112 (=> (not res!630384) (not e!525604))))

(assert (=> b!936112 (= res!630384 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27560 _keys!1487))))))

(declare-fun b!936113 () Bool)

(assert (=> b!936113 (= e!525608 e!525606)))

(declare-fun res!630383 () Bool)

(assert (=> b!936113 (=> (not res!630383) (not e!525606))))

(declare-fun v!791 () V!31903)

(assert (=> b!936113 (= res!630383 (and (= lt!421909 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!936113 (= lt!421909 (apply!829 lt!421914 k0!1099))))

(declare-fun b!936114 () Bool)

(declare-fun res!630385 () Bool)

(assert (=> b!936114 (=> (not res!630385) (not e!525604))))

(assert (=> b!936114 (= res!630385 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19132))))

(declare-fun mapIsEmpty!32076 () Bool)

(assert (=> mapIsEmpty!32076 mapRes!32076))

(assert (= (and start!79628 res!630382) b!936104))

(assert (= (and b!936104 res!630386) b!936106))

(assert (= (and b!936106 res!630380) b!936114))

(assert (= (and b!936114 res!630385) b!936112))

(assert (= (and b!936112 res!630384) b!936105))

(assert (= (and b!936105 res!630381) b!936113))

(assert (= (and b!936113 res!630383) b!936101))

(assert (= (and b!936101 c!97314) b!936110))

(assert (= (and b!936101 (not c!97314)) b!936109))

(assert (= (and b!936110 c!97315) b!936111))

(assert (= (and b!936110 (not c!97315)) b!936103))

(assert (= (and b!936111 c!97313) b!936102))

(assert (= (and b!936111 (not c!97313)) b!936099))

(assert (= (and b!936107 condMapEmpty!32076) mapIsEmpty!32076))

(assert (= (and b!936107 (not condMapEmpty!32076)) mapNonEmpty!32076))

(get-info :version)

(assert (= (and mapNonEmpty!32076 ((_ is ValueCellFull!9620) mapValue!32076)) b!936108))

(assert (= (and b!936107 ((_ is ValueCellFull!9620) mapDefault!32076)) b!936100))

(assert (= start!79628 b!936107))

(declare-fun b_lambda!14083 () Bool)

(assert (=> (not b_lambda!14083) (not b!936111)))

(declare-fun t!27363 () Bool)

(declare-fun tb!6081 () Bool)

(assert (=> (and start!79628 (= defaultEntry!1235 defaultEntry!1235) t!27363) tb!6081))

(declare-fun result!12003 () Bool)

(assert (=> tb!6081 (= result!12003 tp_is_empty!20203)))

(assert (=> b!936111 t!27363))

(declare-fun b_and!28957 () Bool)

(assert (= b_and!28955 (and (=> t!27363 result!12003) b_and!28957)))

(declare-fun m!870167 () Bool)

(assert (=> b!936101 m!870167))

(declare-fun m!870169 () Bool)

(assert (=> b!936102 m!870169))

(declare-fun m!870171 () Bool)

(assert (=> b!936110 m!870171))

(declare-fun m!870173 () Bool)

(assert (=> b!936110 m!870173))

(declare-fun m!870175 () Bool)

(assert (=> b!936105 m!870175))

(declare-fun m!870177 () Bool)

(assert (=> b!936105 m!870177))

(declare-fun m!870179 () Bool)

(assert (=> b!936114 m!870179))

(declare-fun m!870181 () Bool)

(assert (=> mapNonEmpty!32076 m!870181))

(declare-fun m!870183 () Bool)

(assert (=> b!936113 m!870183))

(declare-fun m!870185 () Bool)

(assert (=> b!936111 m!870185))

(declare-fun m!870187 () Bool)

(assert (=> b!936111 m!870187))

(declare-fun m!870189 () Bool)

(assert (=> b!936111 m!870189))

(assert (=> b!936111 m!870185))

(declare-fun m!870191 () Bool)

(assert (=> b!936111 m!870191))

(declare-fun m!870193 () Bool)

(assert (=> b!936111 m!870193))

(declare-fun m!870195 () Bool)

(assert (=> b!936111 m!870195))

(declare-fun m!870197 () Bool)

(assert (=> b!936111 m!870197))

(declare-fun m!870199 () Bool)

(assert (=> b!936111 m!870199))

(declare-fun m!870201 () Bool)

(assert (=> b!936111 m!870201))

(declare-fun m!870203 () Bool)

(assert (=> b!936111 m!870203))

(declare-fun m!870205 () Bool)

(assert (=> b!936111 m!870205))

(assert (=> b!936111 m!870191))

(declare-fun m!870207 () Bool)

(assert (=> b!936111 m!870207))

(declare-fun m!870209 () Bool)

(assert (=> b!936111 m!870209))

(declare-fun m!870211 () Bool)

(assert (=> b!936111 m!870211))

(declare-fun m!870213 () Bool)

(assert (=> b!936111 m!870213))

(assert (=> b!936111 m!870209))

(declare-fun m!870215 () Bool)

(assert (=> b!936111 m!870215))

(declare-fun m!870217 () Bool)

(assert (=> start!79628 m!870217))

(declare-fun m!870219 () Bool)

(assert (=> start!79628 m!870219))

(declare-fun m!870221 () Bool)

(assert (=> start!79628 m!870221))

(declare-fun m!870223 () Bool)

(assert (=> b!936106 m!870223))

(check-sat (not b!936111) (not b!936110) (not b!936105) (not b!936114) (not b!936102) b_and!28957 tp_is_empty!20203 (not b!936113) (not start!79628) (not b_lambda!14083) (not mapNonEmpty!32076) (not b_next!17695) (not b!936101) (not b!936106))
(check-sat b_and!28957 (not b_next!17695))
