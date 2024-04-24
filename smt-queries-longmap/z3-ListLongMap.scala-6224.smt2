; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79748 () Bool)

(assert start!79748)

(declare-fun b_free!17665 () Bool)

(declare-fun b_next!17665 () Bool)

(assert (=> start!79748 (= b_free!17665 (not b_next!17665))))

(declare-fun tp!61449 () Bool)

(declare-fun b_and!28923 () Bool)

(assert (=> start!79748 (= tp!61449 b_and!28923)))

(declare-fun lt!421927 () (_ BitVec 32))

(declare-fun e!525811 () Bool)

(declare-fun b!936276 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!56339 0))(
  ( (array!56340 (arr!27106 (Array (_ BitVec 32) (_ BitVec 64))) (size!27566 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56339)

(declare-fun arrayContainsKey!0 (array!56339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936276 (= e!525811 (arrayContainsKey!0 _keys!1487 k0!1099 lt!421927))))

(declare-fun b!936277 () Bool)

(declare-fun res!630243 () Bool)

(assert (=> b!936277 (=> res!630243 e!525811)))

(declare-datatypes ((List!19069 0))(
  ( (Nil!19066) (Cons!19065 (h!20217 (_ BitVec 64)) (t!27270 List!19069)) )
))
(declare-fun contains!5077 (List!19069 (_ BitVec 64)) Bool)

(assert (=> b!936277 (= res!630243 (contains!5077 Nil!19066 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936278 () Bool)

(declare-fun e!525812 () Bool)

(declare-fun tp_is_empty!20173 () Bool)

(assert (=> b!936278 (= e!525812 tp_is_empty!20173)))

(declare-fun b!936279 () Bool)

(declare-fun e!525817 () Bool)

(assert (=> b!936279 (= e!525817 tp_is_empty!20173)))

(declare-fun b!936280 () Bool)

(declare-fun e!525813 () Bool)

(declare-fun e!525818 () Bool)

(assert (=> b!936280 (= e!525813 e!525818)))

(declare-fun res!630240 () Bool)

(assert (=> b!936280 (=> (not res!630240) (not e!525818))))

(declare-datatypes ((V!31863 0))(
  ( (V!31864 (val!10137 Int)) )
))
(declare-datatypes ((tuple2!13288 0))(
  ( (tuple2!13289 (_1!6655 (_ BitVec 64)) (_2!6655 V!31863)) )
))
(declare-datatypes ((List!19070 0))(
  ( (Nil!19067) (Cons!19066 (h!20218 tuple2!13288) (t!27271 List!19070)) )
))
(declare-datatypes ((ListLongMap!11987 0))(
  ( (ListLongMap!11988 (toList!6009 List!19070)) )
))
(declare-fun lt!421925 () ListLongMap!11987)

(declare-fun contains!5078 (ListLongMap!11987 (_ BitVec 64)) Bool)

(assert (=> b!936280 (= res!630240 (contains!5078 lt!421925 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9605 0))(
  ( (ValueCellFull!9605 (v!12657 V!31863)) (EmptyCell!9605) )
))
(declare-datatypes ((array!56341 0))(
  ( (array!56342 (arr!27107 (Array (_ BitVec 32) ValueCell!9605)) (size!27567 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56341)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31863)

(declare-fun minValue!1173 () V!31863)

(declare-fun getCurrentListMap!3247 (array!56339 array!56341 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 32) Int) ListLongMap!11987)

(assert (=> b!936280 (= lt!421925 (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!630235 () Bool)

(assert (=> start!79748 (=> (not res!630235) (not e!525813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79748 (= res!630235 (validMask!0 mask!1881))))

(assert (=> start!79748 e!525813))

(assert (=> start!79748 true))

(assert (=> start!79748 tp_is_empty!20173))

(declare-fun e!525810 () Bool)

(declare-fun array_inv!21172 (array!56341) Bool)

(assert (=> start!79748 (and (array_inv!21172 _values!1231) e!525810)))

(assert (=> start!79748 tp!61449))

(declare-fun array_inv!21173 (array!56339) Bool)

(assert (=> start!79748 (array_inv!21173 _keys!1487)))

(declare-fun b!936281 () Bool)

(declare-fun e!525816 () Bool)

(assert (=> b!936281 (= e!525816 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936282 () Bool)

(declare-fun res!630247 () Bool)

(assert (=> b!936282 (=> (not res!630247) (not e!525813))))

(assert (=> b!936282 (= res!630247 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27566 _keys!1487))))))

(declare-fun mapIsEmpty!32028 () Bool)

(declare-fun mapRes!32028 () Bool)

(assert (=> mapIsEmpty!32028 mapRes!32028))

(declare-fun b!936283 () Bool)

(assert (=> b!936283 (= e!525816 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936284 () Bool)

(declare-fun res!630238 () Bool)

(assert (=> b!936284 (=> (not res!630238) (not e!525818))))

(assert (=> b!936284 (= res!630238 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!936285 () Bool)

(declare-fun res!630248 () Bool)

(assert (=> b!936285 (=> (not res!630248) (not e!525813))))

(declare-fun arrayNoDuplicates!0 (array!56339 (_ BitVec 32) List!19069) Bool)

(assert (=> b!936285 (= res!630248 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19066))))

(declare-fun b!936286 () Bool)

(declare-fun res!630244 () Bool)

(assert (=> b!936286 (=> (not res!630244) (not e!525813))))

(assert (=> b!936286 (= res!630244 (and (= (size!27567 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27566 _keys!1487) (size!27567 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936287 () Bool)

(declare-fun res!630242 () Bool)

(assert (=> b!936287 (=> (not res!630242) (not e!525818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936287 (= res!630242 (validKeyInArray!0 k0!1099))))

(declare-fun b!936288 () Bool)

(declare-fun res!630241 () Bool)

(assert (=> b!936288 (=> (not res!630241) (not e!525813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56339 (_ BitVec 32)) Bool)

(assert (=> b!936288 (= res!630241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936289 () Bool)

(declare-fun e!525814 () Bool)

(assert (=> b!936289 (= e!525818 e!525814)))

(declare-fun res!630246 () Bool)

(assert (=> b!936289 (=> (not res!630246) (not e!525814))))

(declare-fun lt!421926 () (_ BitVec 64))

(assert (=> b!936289 (= res!630246 (validKeyInArray!0 lt!421926))))

(assert (=> b!936289 (= lt!421926 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!32028 () Bool)

(declare-fun tp!61448 () Bool)

(assert (=> mapNonEmpty!32028 (= mapRes!32028 (and tp!61448 e!525817))))

(declare-fun mapRest!32028 () (Array (_ BitVec 32) ValueCell!9605))

(declare-fun mapKey!32028 () (_ BitVec 32))

(declare-fun mapValue!32028 () ValueCell!9605)

(assert (=> mapNonEmpty!32028 (= (arr!27107 _values!1231) (store mapRest!32028 mapKey!32028 mapValue!32028))))

(declare-fun b!936290 () Bool)

(assert (=> b!936290 (= e!525810 (and e!525812 mapRes!32028))))

(declare-fun condMapEmpty!32028 () Bool)

(declare-fun mapDefault!32028 () ValueCell!9605)

(assert (=> b!936290 (= condMapEmpty!32028 (= (arr!27107 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9605)) mapDefault!32028)))))

(declare-fun b!936291 () Bool)

(assert (=> b!936291 (= e!525814 (not e!525811))))

(declare-fun res!630239 () Bool)

(assert (=> b!936291 (=> res!630239 e!525811)))

(assert (=> b!936291 (= res!630239 (or (bvsge (size!27566 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27566 _keys!1487))))))

(assert (=> b!936291 e!525816))

(declare-fun c!97564 () Bool)

(assert (=> b!936291 (= c!97564 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31543 0))(
  ( (Unit!31544) )
))
(declare-fun lt!421929 () Unit!31543)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!283 (array!56339 array!56341 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 64) (_ BitVec 32) Int) Unit!31543)

(assert (=> b!936291 (= lt!421929 (lemmaListMapContainsThenArrayContainsFrom!283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!936291 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19066)))

(declare-fun lt!421930 () Unit!31543)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56339 (_ BitVec 32) (_ BitVec 32)) Unit!31543)

(assert (=> b!936291 (= lt!421930 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421931 () tuple2!13288)

(declare-fun +!2829 (ListLongMap!11987 tuple2!13288) ListLongMap!11987)

(assert (=> b!936291 (contains!5078 (+!2829 lt!421925 lt!421931) k0!1099)))

(declare-fun lt!421933 () Unit!31543)

(declare-fun lt!421928 () V!31863)

(declare-fun addStillContains!532 (ListLongMap!11987 (_ BitVec 64) V!31863 (_ BitVec 64)) Unit!31543)

(assert (=> b!936291 (= lt!421933 (addStillContains!532 lt!421925 lt!421926 lt!421928 k0!1099))))

(assert (=> b!936291 (= (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2829 (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421927 defaultEntry!1235) lt!421931))))

(assert (=> b!936291 (= lt!421931 (tuple2!13289 lt!421926 lt!421928))))

(declare-fun get!14298 (ValueCell!9605 V!31863) V!31863)

(declare-fun dynLambda!1626 (Int (_ BitVec 64)) V!31863)

(assert (=> b!936291 (= lt!421928 (get!14298 (select (arr!27107 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1626 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!936291 (= lt!421927 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421932 () Unit!31543)

(declare-fun lemmaListMapRecursiveValidKeyArray!209 (array!56339 array!56341 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 32) Int) Unit!31543)

(assert (=> b!936291 (= lt!421932 (lemmaListMapRecursiveValidKeyArray!209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!936292 () Bool)

(declare-fun res!630236 () Bool)

(assert (=> b!936292 (=> (not res!630236) (not e!525818))))

(declare-fun v!791 () V!31863)

(declare-fun apply!830 (ListLongMap!11987 (_ BitVec 64)) V!31863)

(assert (=> b!936292 (= res!630236 (= (apply!830 lt!421925 k0!1099) v!791))))

(declare-fun b!936293 () Bool)

(declare-fun res!630237 () Bool)

(assert (=> b!936293 (=> res!630237 e!525811)))

(declare-fun noDuplicate!1362 (List!19069) Bool)

(assert (=> b!936293 (= res!630237 (not (noDuplicate!1362 Nil!19066)))))

(declare-fun b!936294 () Bool)

(declare-fun res!630245 () Bool)

(assert (=> b!936294 (=> res!630245 e!525811)))

(assert (=> b!936294 (= res!630245 (contains!5077 Nil!19066 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!79748 res!630235) b!936286))

(assert (= (and b!936286 res!630244) b!936288))

(assert (= (and b!936288 res!630241) b!936285))

(assert (= (and b!936285 res!630248) b!936282))

(assert (= (and b!936282 res!630247) b!936280))

(assert (= (and b!936280 res!630240) b!936292))

(assert (= (and b!936292 res!630236) b!936284))

(assert (= (and b!936284 res!630238) b!936287))

(assert (= (and b!936287 res!630242) b!936289))

(assert (= (and b!936289 res!630246) b!936291))

(assert (= (and b!936291 c!97564) b!936283))

(assert (= (and b!936291 (not c!97564)) b!936281))

(assert (= (and b!936291 (not res!630239)) b!936293))

(assert (= (and b!936293 (not res!630237)) b!936277))

(assert (= (and b!936277 (not res!630243)) b!936294))

(assert (= (and b!936294 (not res!630245)) b!936276))

(assert (= (and b!936290 condMapEmpty!32028) mapIsEmpty!32028))

(assert (= (and b!936290 (not condMapEmpty!32028)) mapNonEmpty!32028))

(get-info :version)

(assert (= (and mapNonEmpty!32028 ((_ is ValueCellFull!9605) mapValue!32028)) b!936279))

(assert (= (and b!936290 ((_ is ValueCellFull!9605) mapDefault!32028)) b!936278))

(assert (= start!79748 b!936290))

(declare-fun b_lambda!14067 () Bool)

(assert (=> (not b_lambda!14067) (not b!936291)))

(declare-fun t!27269 () Bool)

(declare-fun tb!6051 () Bool)

(assert (=> (and start!79748 (= defaultEntry!1235 defaultEntry!1235) t!27269) tb!6051))

(declare-fun result!11941 () Bool)

(assert (=> tb!6051 (= result!11941 tp_is_empty!20173)))

(assert (=> b!936291 t!27269))

(declare-fun b_and!28925 () Bool)

(assert (= b_and!28923 (and (=> t!27269 result!11941) b_and!28925)))

(declare-fun m!871115 () Bool)

(assert (=> b!936292 m!871115))

(declare-fun m!871117 () Bool)

(assert (=> b!936293 m!871117))

(declare-fun m!871119 () Bool)

(assert (=> b!936294 m!871119))

(declare-fun m!871121 () Bool)

(assert (=> b!936277 m!871121))

(declare-fun m!871123 () Bool)

(assert (=> b!936287 m!871123))

(declare-fun m!871125 () Bool)

(assert (=> mapNonEmpty!32028 m!871125))

(declare-fun m!871127 () Bool)

(assert (=> b!936291 m!871127))

(declare-fun m!871129 () Bool)

(assert (=> b!936291 m!871129))

(declare-fun m!871131 () Bool)

(assert (=> b!936291 m!871131))

(declare-fun m!871133 () Bool)

(assert (=> b!936291 m!871133))

(declare-fun m!871135 () Bool)

(assert (=> b!936291 m!871135))

(declare-fun m!871137 () Bool)

(assert (=> b!936291 m!871137))

(assert (=> b!936291 m!871129))

(declare-fun m!871139 () Bool)

(assert (=> b!936291 m!871139))

(assert (=> b!936291 m!871137))

(assert (=> b!936291 m!871139))

(declare-fun m!871141 () Bool)

(assert (=> b!936291 m!871141))

(declare-fun m!871143 () Bool)

(assert (=> b!936291 m!871143))

(assert (=> b!936291 m!871127))

(declare-fun m!871145 () Bool)

(assert (=> b!936291 m!871145))

(declare-fun m!871147 () Bool)

(assert (=> b!936291 m!871147))

(declare-fun m!871149 () Bool)

(assert (=> b!936291 m!871149))

(declare-fun m!871151 () Bool)

(assert (=> b!936291 m!871151))

(declare-fun m!871153 () Bool)

(assert (=> b!936285 m!871153))

(declare-fun m!871155 () Bool)

(assert (=> b!936276 m!871155))

(declare-fun m!871157 () Bool)

(assert (=> b!936280 m!871157))

(declare-fun m!871159 () Bool)

(assert (=> b!936280 m!871159))

(declare-fun m!871161 () Bool)

(assert (=> start!79748 m!871161))

(declare-fun m!871163 () Bool)

(assert (=> start!79748 m!871163))

(declare-fun m!871165 () Bool)

(assert (=> start!79748 m!871165))

(declare-fun m!871167 () Bool)

(assert (=> b!936289 m!871167))

(declare-fun m!871169 () Bool)

(assert (=> b!936289 m!871169))

(declare-fun m!871171 () Bool)

(assert (=> b!936283 m!871171))

(declare-fun m!871173 () Bool)

(assert (=> b!936288 m!871173))

(check-sat b_and!28925 (not b!936287) tp_is_empty!20173 (not b!936285) (not mapNonEmpty!32028) (not b_next!17665) (not start!79748) (not b!936293) (not b!936288) (not b!936292) (not b!936283) (not b!936276) (not b!936294) (not b!936277) (not b!936280) (not b!936289) (not b_lambda!14067) (not b!936291))
(check-sat b_and!28925 (not b_next!17665))
(get-model)

(declare-fun b_lambda!14073 () Bool)

(assert (= b_lambda!14067 (or (and start!79748 b_free!17665) b_lambda!14073)))

(check-sat b_and!28925 (not b!936287) tp_is_empty!20173 (not b!936285) (not mapNonEmpty!32028) (not b_next!17665) (not start!79748) (not b!936288) (not b!936292) (not b!936283) (not b!936291) (not b!936276) (not b!936294) (not b!936277) (not b!936280) (not b!936289) (not b_lambda!14073) (not b!936293))
(check-sat b_and!28925 (not b_next!17665))
(get-model)

(declare-fun b!936423 () Bool)

(declare-fun e!525880 () Bool)

(declare-fun call!40764 () Bool)

(assert (=> b!936423 (= e!525880 call!40764)))

(declare-fun b!936424 () Bool)

(declare-fun e!525881 () Bool)

(assert (=> b!936424 (= e!525881 e!525880)))

(declare-fun lt!421996 () (_ BitVec 64))

(assert (=> b!936424 (= lt!421996 (select (arr!27106 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!421994 () Unit!31543)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56339 (_ BitVec 64) (_ BitVec 32)) Unit!31543)

(assert (=> b!936424 (= lt!421994 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!421996 #b00000000000000000000000000000000))))

(assert (=> b!936424 (arrayContainsKey!0 _keys!1487 lt!421996 #b00000000000000000000000000000000)))

(declare-fun lt!421995 () Unit!31543)

(assert (=> b!936424 (= lt!421995 lt!421994)))

(declare-fun res!630338 () Bool)

(declare-datatypes ((SeekEntryResult!8934 0))(
  ( (MissingZero!8934 (index!38107 (_ BitVec 32))) (Found!8934 (index!38108 (_ BitVec 32))) (Intermediate!8934 (undefined!9746 Bool) (index!38109 (_ BitVec 32)) (x!80193 (_ BitVec 32))) (Undefined!8934) (MissingVacant!8934 (index!38110 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56339 (_ BitVec 32)) SeekEntryResult!8934)

(assert (=> b!936424 (= res!630338 (= (seekEntryOrOpen!0 (select (arr!27106 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8934 #b00000000000000000000000000000000)))))

(assert (=> b!936424 (=> (not res!630338) (not e!525880))))

(declare-fun b!936425 () Bool)

(assert (=> b!936425 (= e!525881 call!40764)))

(declare-fun b!936426 () Bool)

(declare-fun e!525879 () Bool)

(assert (=> b!936426 (= e!525879 e!525881)))

(declare-fun c!97573 () Bool)

(assert (=> b!936426 (= c!97573 (validKeyInArray!0 (select (arr!27106 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113569 () Bool)

(declare-fun res!630337 () Bool)

(assert (=> d!113569 (=> res!630337 e!525879)))

(assert (=> d!113569 (= res!630337 (bvsge #b00000000000000000000000000000000 (size!27566 _keys!1487)))))

(assert (=> d!113569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!525879)))

(declare-fun bm!40761 () Bool)

(assert (=> bm!40761 (= call!40764 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!113569 (not res!630337)) b!936426))

(assert (= (and b!936426 c!97573) b!936424))

(assert (= (and b!936426 (not c!97573)) b!936425))

(assert (= (and b!936424 res!630338) b!936423))

(assert (= (or b!936423 b!936425) bm!40761))

(declare-fun m!871295 () Bool)

(assert (=> b!936424 m!871295))

(declare-fun m!871297 () Bool)

(assert (=> b!936424 m!871297))

(declare-fun m!871299 () Bool)

(assert (=> b!936424 m!871299))

(assert (=> b!936424 m!871295))

(declare-fun m!871301 () Bool)

(assert (=> b!936424 m!871301))

(assert (=> b!936426 m!871295))

(assert (=> b!936426 m!871295))

(declare-fun m!871303 () Bool)

(assert (=> b!936426 m!871303))

(declare-fun m!871305 () Bool)

(assert (=> bm!40761 m!871305))

(assert (=> b!936288 d!113569))

(declare-fun d!113571 () Bool)

(assert (=> d!113571 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79748 d!113571))

(declare-fun d!113573 () Bool)

(assert (=> d!113573 (= (array_inv!21172 _values!1231) (bvsge (size!27567 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79748 d!113573))

(declare-fun d!113575 () Bool)

(assert (=> d!113575 (= (array_inv!21173 _keys!1487) (bvsge (size!27566 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79748 d!113575))

(declare-fun d!113577 () Bool)

(declare-fun lt!421999 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!407 (List!19069) (InoxSet (_ BitVec 64)))

(assert (=> d!113577 (= lt!421999 (select (content!407 Nil!19066) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!525887 () Bool)

(assert (=> d!113577 (= lt!421999 e!525887)))

(declare-fun res!630344 () Bool)

(assert (=> d!113577 (=> (not res!630344) (not e!525887))))

(assert (=> d!113577 (= res!630344 ((_ is Cons!19065) Nil!19066))))

(assert (=> d!113577 (= (contains!5077 Nil!19066 #b0000000000000000000000000000000000000000000000000000000000000000) lt!421999)))

(declare-fun b!936431 () Bool)

(declare-fun e!525886 () Bool)

(assert (=> b!936431 (= e!525887 e!525886)))

(declare-fun res!630343 () Bool)

(assert (=> b!936431 (=> res!630343 e!525886)))

(assert (=> b!936431 (= res!630343 (= (h!20217 Nil!19066) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936432 () Bool)

(assert (=> b!936432 (= e!525886 (contains!5077 (t!27270 Nil!19066) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113577 res!630344) b!936431))

(assert (= (and b!936431 (not res!630343)) b!936432))

(declare-fun m!871307 () Bool)

(assert (=> d!113577 m!871307))

(declare-fun m!871309 () Bool)

(assert (=> d!113577 m!871309))

(declare-fun m!871311 () Bool)

(assert (=> b!936432 m!871311))

(assert (=> b!936277 d!113577))

(declare-fun d!113579 () Bool)

(assert (=> d!113579 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!936287 d!113579))

(declare-fun b!936443 () Bool)

(declare-fun e!525897 () Bool)

(assert (=> b!936443 (= e!525897 (contains!5077 Nil!19066 (select (arr!27106 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!936444 () Bool)

(declare-fun e!525899 () Bool)

(declare-fun call!40767 () Bool)

(assert (=> b!936444 (= e!525899 call!40767)))

(declare-fun d!113581 () Bool)

(declare-fun res!630353 () Bool)

(declare-fun e!525896 () Bool)

(assert (=> d!113581 (=> res!630353 e!525896)))

(assert (=> d!113581 (= res!630353 (bvsge #b00000000000000000000000000000000 (size!27566 _keys!1487)))))

(assert (=> d!113581 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19066) e!525896)))

(declare-fun bm!40764 () Bool)

(declare-fun c!97576 () Bool)

(assert (=> bm!40764 (= call!40767 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97576 (Cons!19065 (select (arr!27106 _keys!1487) #b00000000000000000000000000000000) Nil!19066) Nil!19066)))))

(declare-fun b!936445 () Bool)

(declare-fun e!525898 () Bool)

(assert (=> b!936445 (= e!525898 e!525899)))

(assert (=> b!936445 (= c!97576 (validKeyInArray!0 (select (arr!27106 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!936446 () Bool)

(assert (=> b!936446 (= e!525899 call!40767)))

(declare-fun b!936447 () Bool)

(assert (=> b!936447 (= e!525896 e!525898)))

(declare-fun res!630351 () Bool)

(assert (=> b!936447 (=> (not res!630351) (not e!525898))))

(assert (=> b!936447 (= res!630351 (not e!525897))))

(declare-fun res!630352 () Bool)

(assert (=> b!936447 (=> (not res!630352) (not e!525897))))

(assert (=> b!936447 (= res!630352 (validKeyInArray!0 (select (arr!27106 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113581 (not res!630353)) b!936447))

(assert (= (and b!936447 res!630352) b!936443))

(assert (= (and b!936447 res!630351) b!936445))

(assert (= (and b!936445 c!97576) b!936444))

(assert (= (and b!936445 (not c!97576)) b!936446))

(assert (= (or b!936444 b!936446) bm!40764))

(assert (=> b!936443 m!871295))

(assert (=> b!936443 m!871295))

(declare-fun m!871313 () Bool)

(assert (=> b!936443 m!871313))

(assert (=> bm!40764 m!871295))

(declare-fun m!871315 () Bool)

(assert (=> bm!40764 m!871315))

(assert (=> b!936445 m!871295))

(assert (=> b!936445 m!871295))

(assert (=> b!936445 m!871303))

(assert (=> b!936447 m!871295))

(assert (=> b!936447 m!871295))

(assert (=> b!936447 m!871303))

(assert (=> b!936285 d!113581))

(declare-fun d!113583 () Bool)

(declare-fun res!630358 () Bool)

(declare-fun e!525904 () Bool)

(assert (=> d!113583 (=> res!630358 e!525904)))

(assert (=> d!113583 (= res!630358 (= (select (arr!27106 _keys!1487) lt!421927) k0!1099))))

(assert (=> d!113583 (= (arrayContainsKey!0 _keys!1487 k0!1099 lt!421927) e!525904)))

(declare-fun b!936452 () Bool)

(declare-fun e!525905 () Bool)

(assert (=> b!936452 (= e!525904 e!525905)))

(declare-fun res!630359 () Bool)

(assert (=> b!936452 (=> (not res!630359) (not e!525905))))

(assert (=> b!936452 (= res!630359 (bvslt (bvadd lt!421927 #b00000000000000000000000000000001) (size!27566 _keys!1487)))))

(declare-fun b!936453 () Bool)

(assert (=> b!936453 (= e!525905 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd lt!421927 #b00000000000000000000000000000001)))))

(assert (= (and d!113583 (not res!630358)) b!936452))

(assert (= (and b!936452 res!630359) b!936453))

(declare-fun m!871317 () Bool)

(assert (=> d!113583 m!871317))

(declare-fun m!871319 () Bool)

(assert (=> b!936453 m!871319))

(assert (=> b!936276 d!113583))

(declare-fun d!113585 () Bool)

(declare-fun lt!422000 () Bool)

(assert (=> d!113585 (= lt!422000 (select (content!407 Nil!19066) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!525907 () Bool)

(assert (=> d!113585 (= lt!422000 e!525907)))

(declare-fun res!630361 () Bool)

(assert (=> d!113585 (=> (not res!630361) (not e!525907))))

(assert (=> d!113585 (= res!630361 ((_ is Cons!19065) Nil!19066))))

(assert (=> d!113585 (= (contains!5077 Nil!19066 #b1000000000000000000000000000000000000000000000000000000000000000) lt!422000)))

(declare-fun b!936454 () Bool)

(declare-fun e!525906 () Bool)

(assert (=> b!936454 (= e!525907 e!525906)))

(declare-fun res!630360 () Bool)

(assert (=> b!936454 (=> res!630360 e!525906)))

(assert (=> b!936454 (= res!630360 (= (h!20217 Nil!19066) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936455 () Bool)

(assert (=> b!936455 (= e!525906 (contains!5077 (t!27270 Nil!19066) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113585 res!630361) b!936454))

(assert (= (and b!936454 (not res!630360)) b!936455))

(assert (=> d!113585 m!871307))

(declare-fun m!871321 () Bool)

(assert (=> d!113585 m!871321))

(declare-fun m!871323 () Bool)

(assert (=> b!936455 m!871323))

(assert (=> b!936294 d!113585))

(declare-fun d!113587 () Bool)

(declare-datatypes ((Option!486 0))(
  ( (Some!485 (v!12661 V!31863)) (None!484) )
))
(declare-fun get!14300 (Option!486) V!31863)

(declare-fun getValueByKey!480 (List!19070 (_ BitVec 64)) Option!486)

(assert (=> d!113587 (= (apply!830 lt!421925 k0!1099) (get!14300 (getValueByKey!480 (toList!6009 lt!421925) k0!1099)))))

(declare-fun bs!26270 () Bool)

(assert (= bs!26270 d!113587))

(declare-fun m!871325 () Bool)

(assert (=> bs!26270 m!871325))

(assert (=> bs!26270 m!871325))

(declare-fun m!871327 () Bool)

(assert (=> bs!26270 m!871327))

(assert (=> b!936292 d!113587))

(declare-fun d!113589 () Bool)

(declare-fun res!630362 () Bool)

(declare-fun e!525908 () Bool)

(assert (=> d!113589 (=> res!630362 e!525908)))

(assert (=> d!113589 (= res!630362 (= (select (arr!27106 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113589 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!525908)))

(declare-fun b!936456 () Bool)

(declare-fun e!525909 () Bool)

(assert (=> b!936456 (= e!525908 e!525909)))

(declare-fun res!630363 () Bool)

(assert (=> b!936456 (=> (not res!630363) (not e!525909))))

(assert (=> b!936456 (= res!630363 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27566 _keys!1487)))))

(declare-fun b!936457 () Bool)

(assert (=> b!936457 (= e!525909 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113589 (not res!630362)) b!936456))

(assert (= (and b!936456 res!630363) b!936457))

(declare-fun m!871329 () Bool)

(assert (=> d!113589 m!871329))

(declare-fun m!871331 () Bool)

(assert (=> b!936457 m!871331))

(assert (=> b!936283 d!113589))

(declare-fun d!113591 () Bool)

(declare-fun res!630368 () Bool)

(declare-fun e!525914 () Bool)

(assert (=> d!113591 (=> res!630368 e!525914)))

(assert (=> d!113591 (= res!630368 ((_ is Nil!19066) Nil!19066))))

(assert (=> d!113591 (= (noDuplicate!1362 Nil!19066) e!525914)))

(declare-fun b!936462 () Bool)

(declare-fun e!525915 () Bool)

(assert (=> b!936462 (= e!525914 e!525915)))

(declare-fun res!630369 () Bool)

(assert (=> b!936462 (=> (not res!630369) (not e!525915))))

(assert (=> b!936462 (= res!630369 (not (contains!5077 (t!27270 Nil!19066) (h!20217 Nil!19066))))))

(declare-fun b!936463 () Bool)

(assert (=> b!936463 (= e!525915 (noDuplicate!1362 (t!27270 Nil!19066)))))

(assert (= (and d!113591 (not res!630368)) b!936462))

(assert (= (and b!936462 res!630369) b!936463))

(declare-fun m!871333 () Bool)

(assert (=> b!936462 m!871333))

(declare-fun m!871335 () Bool)

(assert (=> b!936463 m!871335))

(assert (=> b!936293 d!113591))

(declare-fun b!936506 () Bool)

(declare-fun e!525948 () Bool)

(declare-fun e!525945 () Bool)

(assert (=> b!936506 (= e!525948 e!525945)))

(declare-fun res!630391 () Bool)

(assert (=> b!936506 (=> (not res!630391) (not e!525945))))

(declare-fun lt!422055 () ListLongMap!11987)

(assert (=> b!936506 (= res!630391 (contains!5078 lt!422055 (select (arr!27106 _keys!1487) lt!421927)))))

(assert (=> b!936506 (and (bvsge lt!421927 #b00000000000000000000000000000000) (bvslt lt!421927 (size!27566 _keys!1487)))))

(declare-fun b!936507 () Bool)

(declare-fun e!525946 () Bool)

(declare-fun e!525953 () Bool)

(assert (=> b!936507 (= e!525946 e!525953)))

(declare-fun res!630393 () Bool)

(declare-fun call!40782 () Bool)

(assert (=> b!936507 (= res!630393 call!40782)))

(assert (=> b!936507 (=> (not res!630393) (not e!525953))))

(declare-fun b!936508 () Bool)

(declare-fun e!525951 () ListLongMap!11987)

(declare-fun call!40784 () ListLongMap!11987)

(assert (=> b!936508 (= e!525951 call!40784)))

(declare-fun b!936509 () Bool)

(declare-fun call!40785 () ListLongMap!11987)

(assert (=> b!936509 (= e!525951 call!40785)))

(declare-fun bm!40779 () Bool)

(declare-fun call!40788 () Bool)

(assert (=> bm!40779 (= call!40788 (contains!5078 lt!422055 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936510 () Bool)

(assert (=> b!936510 (= e!525953 (= (apply!830 lt!422055 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!936511 () Bool)

(assert (=> b!936511 (= e!525945 (= (apply!830 lt!422055 (select (arr!27106 _keys!1487) lt!421927)) (get!14298 (select (arr!27107 _values!1231) lt!421927) (dynLambda!1626 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!936511 (and (bvsge lt!421927 #b00000000000000000000000000000000) (bvslt lt!421927 (size!27567 _values!1231)))))

(assert (=> b!936511 (and (bvsge lt!421927 #b00000000000000000000000000000000) (bvslt lt!421927 (size!27566 _keys!1487)))))

(declare-fun b!936512 () Bool)

(declare-fun res!630394 () Bool)

(declare-fun e!525943 () Bool)

(assert (=> b!936512 (=> (not res!630394) (not e!525943))))

(assert (=> b!936512 (= res!630394 e!525948)))

(declare-fun res!630396 () Bool)

(assert (=> b!936512 (=> res!630396 e!525948)))

(declare-fun e!525949 () Bool)

(assert (=> b!936512 (= res!630396 (not e!525949))))

(declare-fun res!630390 () Bool)

(assert (=> b!936512 (=> (not res!630390) (not e!525949))))

(assert (=> b!936512 (= res!630390 (bvslt lt!421927 (size!27566 _keys!1487)))))

(declare-fun bm!40780 () Bool)

(declare-fun call!40786 () ListLongMap!11987)

(assert (=> bm!40780 (= call!40784 call!40786)))

(declare-fun b!936513 () Bool)

(declare-fun e!525950 () Bool)

(assert (=> b!936513 (= e!525950 (not call!40788))))

(declare-fun bm!40781 () Bool)

(declare-fun call!40783 () ListLongMap!11987)

(declare-fun call!40787 () ListLongMap!11987)

(assert (=> bm!40781 (= call!40783 call!40787)))

(declare-fun b!936514 () Bool)

(declare-fun c!97590 () Bool)

(assert (=> b!936514 (= c!97590 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525954 () ListLongMap!11987)

(assert (=> b!936514 (= e!525954 e!525951)))

(declare-fun d!113593 () Bool)

(assert (=> d!113593 e!525943))

(declare-fun res!630392 () Bool)

(assert (=> d!113593 (=> (not res!630392) (not e!525943))))

(assert (=> d!113593 (= res!630392 (or (bvsge lt!421927 (size!27566 _keys!1487)) (and (bvsge lt!421927 #b00000000000000000000000000000000) (bvslt lt!421927 (size!27566 _keys!1487)))))))

(declare-fun lt!422062 () ListLongMap!11987)

(assert (=> d!113593 (= lt!422055 lt!422062)))

(declare-fun lt!422047 () Unit!31543)

(declare-fun e!525942 () Unit!31543)

(assert (=> d!113593 (= lt!422047 e!525942)))

(declare-fun c!97591 () Bool)

(declare-fun e!525947 () Bool)

(assert (=> d!113593 (= c!97591 e!525947)))

(declare-fun res!630389 () Bool)

(assert (=> d!113593 (=> (not res!630389) (not e!525947))))

(assert (=> d!113593 (= res!630389 (bvslt lt!421927 (size!27566 _keys!1487)))))

(declare-fun e!525952 () ListLongMap!11987)

(assert (=> d!113593 (= lt!422062 e!525952)))

(declare-fun c!97594 () Bool)

(assert (=> d!113593 (= c!97594 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113593 (validMask!0 mask!1881)))

(assert (=> d!113593 (= (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421927 defaultEntry!1235) lt!422055)))

(declare-fun b!936515 () Bool)

(declare-fun Unit!31547 () Unit!31543)

(assert (=> b!936515 (= e!525942 Unit!31547)))

(declare-fun b!936516 () Bool)

(assert (=> b!936516 (= e!525954 call!40784)))

(declare-fun bm!40782 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3346 (array!56339 array!56341 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 32) Int) ListLongMap!11987)

(assert (=> bm!40782 (= call!40787 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421927 defaultEntry!1235))))

(declare-fun b!936517 () Bool)

(declare-fun lt!422060 () Unit!31543)

(assert (=> b!936517 (= e!525942 lt!422060)))

(declare-fun lt!422059 () ListLongMap!11987)

(assert (=> b!936517 (= lt!422059 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421927 defaultEntry!1235))))

(declare-fun lt!422052 () (_ BitVec 64))

(assert (=> b!936517 (= lt!422052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422065 () (_ BitVec 64))

(assert (=> b!936517 (= lt!422065 (select (arr!27106 _keys!1487) lt!421927))))

(declare-fun lt!422057 () Unit!31543)

(assert (=> b!936517 (= lt!422057 (addStillContains!532 lt!422059 lt!422052 zeroValue!1173 lt!422065))))

(assert (=> b!936517 (contains!5078 (+!2829 lt!422059 (tuple2!13289 lt!422052 zeroValue!1173)) lt!422065)))

(declare-fun lt!422054 () Unit!31543)

(assert (=> b!936517 (= lt!422054 lt!422057)))

(declare-fun lt!422066 () ListLongMap!11987)

(assert (=> b!936517 (= lt!422066 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421927 defaultEntry!1235))))

(declare-fun lt!422045 () (_ BitVec 64))

(assert (=> b!936517 (= lt!422045 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422050 () (_ BitVec 64))

(assert (=> b!936517 (= lt!422050 (select (arr!27106 _keys!1487) lt!421927))))

(declare-fun lt!422053 () Unit!31543)

(declare-fun addApplyDifferent!420 (ListLongMap!11987 (_ BitVec 64) V!31863 (_ BitVec 64)) Unit!31543)

(assert (=> b!936517 (= lt!422053 (addApplyDifferent!420 lt!422066 lt!422045 minValue!1173 lt!422050))))

(assert (=> b!936517 (= (apply!830 (+!2829 lt!422066 (tuple2!13289 lt!422045 minValue!1173)) lt!422050) (apply!830 lt!422066 lt!422050))))

(declare-fun lt!422048 () Unit!31543)

(assert (=> b!936517 (= lt!422048 lt!422053)))

(declare-fun lt!422046 () ListLongMap!11987)

(assert (=> b!936517 (= lt!422046 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421927 defaultEntry!1235))))

(declare-fun lt!422064 () (_ BitVec 64))

(assert (=> b!936517 (= lt!422064 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422061 () (_ BitVec 64))

(assert (=> b!936517 (= lt!422061 (select (arr!27106 _keys!1487) lt!421927))))

(declare-fun lt!422058 () Unit!31543)

(assert (=> b!936517 (= lt!422058 (addApplyDifferent!420 lt!422046 lt!422064 zeroValue!1173 lt!422061))))

(assert (=> b!936517 (= (apply!830 (+!2829 lt!422046 (tuple2!13289 lt!422064 zeroValue!1173)) lt!422061) (apply!830 lt!422046 lt!422061))))

(declare-fun lt!422049 () Unit!31543)

(assert (=> b!936517 (= lt!422049 lt!422058)))

(declare-fun lt!422063 () ListLongMap!11987)

(assert (=> b!936517 (= lt!422063 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421927 defaultEntry!1235))))

(declare-fun lt!422051 () (_ BitVec 64))

(assert (=> b!936517 (= lt!422051 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422056 () (_ BitVec 64))

(assert (=> b!936517 (= lt!422056 (select (arr!27106 _keys!1487) lt!421927))))

(assert (=> b!936517 (= lt!422060 (addApplyDifferent!420 lt!422063 lt!422051 minValue!1173 lt!422056))))

(assert (=> b!936517 (= (apply!830 (+!2829 lt!422063 (tuple2!13289 lt!422051 minValue!1173)) lt!422056) (apply!830 lt!422063 lt!422056))))

(declare-fun b!936518 () Bool)

(assert (=> b!936518 (= e!525952 e!525954)))

(declare-fun c!97592 () Bool)

(assert (=> b!936518 (= c!97592 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!936519 () Bool)

(assert (=> b!936519 (= e!525946 (not call!40782))))

(declare-fun bm!40783 () Bool)

(assert (=> bm!40783 (= call!40782 (contains!5078 lt!422055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936520 () Bool)

(assert (=> b!936520 (= e!525952 (+!2829 call!40786 (tuple2!13289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40784 () Bool)

(assert (=> bm!40784 (= call!40786 (+!2829 (ite c!97594 call!40787 (ite c!97592 call!40783 call!40785)) (ite (or c!97594 c!97592) (tuple2!13289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!936521 () Bool)

(assert (=> b!936521 (= e!525943 e!525950)))

(declare-fun c!97589 () Bool)

(assert (=> b!936521 (= c!97589 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!936522 () Bool)

(assert (=> b!936522 (= e!525947 (validKeyInArray!0 (select (arr!27106 _keys!1487) lt!421927)))))

(declare-fun bm!40785 () Bool)

(assert (=> bm!40785 (= call!40785 call!40783)))

(declare-fun b!936523 () Bool)

(declare-fun res!630395 () Bool)

(assert (=> b!936523 (=> (not res!630395) (not e!525943))))

(assert (=> b!936523 (= res!630395 e!525946)))

(declare-fun c!97593 () Bool)

(assert (=> b!936523 (= c!97593 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!936524 () Bool)

(declare-fun e!525944 () Bool)

(assert (=> b!936524 (= e!525944 (= (apply!830 lt!422055 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!936525 () Bool)

(assert (=> b!936525 (= e!525949 (validKeyInArray!0 (select (arr!27106 _keys!1487) lt!421927)))))

(declare-fun b!936526 () Bool)

(assert (=> b!936526 (= e!525950 e!525944)))

(declare-fun res!630388 () Bool)

(assert (=> b!936526 (= res!630388 call!40788)))

(assert (=> b!936526 (=> (not res!630388) (not e!525944))))

(assert (= (and d!113593 c!97594) b!936520))

(assert (= (and d!113593 (not c!97594)) b!936518))

(assert (= (and b!936518 c!97592) b!936516))

(assert (= (and b!936518 (not c!97592)) b!936514))

(assert (= (and b!936514 c!97590) b!936508))

(assert (= (and b!936514 (not c!97590)) b!936509))

(assert (= (or b!936508 b!936509) bm!40785))

(assert (= (or b!936516 bm!40785) bm!40781))

(assert (= (or b!936516 b!936508) bm!40780))

(assert (= (or b!936520 bm!40781) bm!40782))

(assert (= (or b!936520 bm!40780) bm!40784))

(assert (= (and d!113593 res!630389) b!936522))

(assert (= (and d!113593 c!97591) b!936517))

(assert (= (and d!113593 (not c!97591)) b!936515))

(assert (= (and d!113593 res!630392) b!936512))

(assert (= (and b!936512 res!630390) b!936525))

(assert (= (and b!936512 (not res!630396)) b!936506))

(assert (= (and b!936506 res!630391) b!936511))

(assert (= (and b!936512 res!630394) b!936523))

(assert (= (and b!936523 c!97593) b!936507))

(assert (= (and b!936523 (not c!97593)) b!936519))

(assert (= (and b!936507 res!630393) b!936510))

(assert (= (or b!936507 b!936519) bm!40783))

(assert (= (and b!936523 res!630395) b!936521))

(assert (= (and b!936521 c!97589) b!936526))

(assert (= (and b!936521 (not c!97589)) b!936513))

(assert (= (and b!936526 res!630388) b!936524))

(assert (= (or b!936526 b!936513) bm!40779))

(declare-fun b_lambda!14075 () Bool)

(assert (=> (not b_lambda!14075) (not b!936511)))

(assert (=> b!936511 t!27269))

(declare-fun b_and!28935 () Bool)

(assert (= b_and!28925 (and (=> t!27269 result!11941) b_and!28935)))

(assert (=> b!936506 m!871317))

(assert (=> b!936506 m!871317))

(declare-fun m!871337 () Bool)

(assert (=> b!936506 m!871337))

(declare-fun m!871339 () Bool)

(assert (=> b!936510 m!871339))

(declare-fun m!871341 () Bool)

(assert (=> b!936524 m!871341))

(declare-fun m!871343 () Bool)

(assert (=> b!936511 m!871343))

(assert (=> b!936511 m!871139))

(declare-fun m!871345 () Bool)

(assert (=> b!936511 m!871345))

(assert (=> b!936511 m!871343))

(assert (=> b!936511 m!871317))

(assert (=> b!936511 m!871317))

(declare-fun m!871347 () Bool)

(assert (=> b!936511 m!871347))

(assert (=> b!936511 m!871139))

(declare-fun m!871349 () Bool)

(assert (=> bm!40784 m!871349))

(assert (=> d!113593 m!871161))

(assert (=> b!936525 m!871317))

(assert (=> b!936525 m!871317))

(declare-fun m!871351 () Bool)

(assert (=> b!936525 m!871351))

(declare-fun m!871353 () Bool)

(assert (=> bm!40782 m!871353))

(declare-fun m!871355 () Bool)

(assert (=> bm!40779 m!871355))

(declare-fun m!871357 () Bool)

(assert (=> bm!40783 m!871357))

(declare-fun m!871359 () Bool)

(assert (=> b!936517 m!871359))

(declare-fun m!871361 () Bool)

(assert (=> b!936517 m!871361))

(declare-fun m!871363 () Bool)

(assert (=> b!936517 m!871363))

(declare-fun m!871365 () Bool)

(assert (=> b!936517 m!871365))

(assert (=> b!936517 m!871361))

(declare-fun m!871367 () Bool)

(assert (=> b!936517 m!871367))

(declare-fun m!871369 () Bool)

(assert (=> b!936517 m!871369))

(declare-fun m!871371 () Bool)

(assert (=> b!936517 m!871371))

(declare-fun m!871373 () Bool)

(assert (=> b!936517 m!871373))

(declare-fun m!871375 () Bool)

(assert (=> b!936517 m!871375))

(declare-fun m!871377 () Bool)

(assert (=> b!936517 m!871377))

(assert (=> b!936517 m!871365))

(declare-fun m!871379 () Bool)

(assert (=> b!936517 m!871379))

(assert (=> b!936517 m!871353))

(declare-fun m!871381 () Bool)

(assert (=> b!936517 m!871381))

(declare-fun m!871383 () Bool)

(assert (=> b!936517 m!871383))

(declare-fun m!871385 () Bool)

(assert (=> b!936517 m!871385))

(assert (=> b!936517 m!871373))

(assert (=> b!936517 m!871383))

(assert (=> b!936517 m!871317))

(declare-fun m!871387 () Bool)

(assert (=> b!936517 m!871387))

(declare-fun m!871389 () Bool)

(assert (=> b!936520 m!871389))

(assert (=> b!936522 m!871317))

(assert (=> b!936522 m!871317))

(assert (=> b!936522 m!871351))

(assert (=> b!936291 d!113593))

(declare-fun b!936527 () Bool)

(declare-fun e!525961 () Bool)

(declare-fun e!525958 () Bool)

(assert (=> b!936527 (= e!525961 e!525958)))

(declare-fun res!630400 () Bool)

(assert (=> b!936527 (=> (not res!630400) (not e!525958))))

(declare-fun lt!422077 () ListLongMap!11987)

(assert (=> b!936527 (= res!630400 (contains!5078 lt!422077 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!936527 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27566 _keys!1487)))))

(declare-fun b!936528 () Bool)

(declare-fun e!525959 () Bool)

(declare-fun e!525966 () Bool)

(assert (=> b!936528 (= e!525959 e!525966)))

(declare-fun res!630402 () Bool)

(declare-fun call!40789 () Bool)

(assert (=> b!936528 (= res!630402 call!40789)))

(assert (=> b!936528 (=> (not res!630402) (not e!525966))))

(declare-fun b!936529 () Bool)

(declare-fun e!525964 () ListLongMap!11987)

(declare-fun call!40791 () ListLongMap!11987)

(assert (=> b!936529 (= e!525964 call!40791)))

(declare-fun b!936530 () Bool)

(declare-fun call!40792 () ListLongMap!11987)

(assert (=> b!936530 (= e!525964 call!40792)))

(declare-fun bm!40786 () Bool)

(declare-fun call!40795 () Bool)

(assert (=> bm!40786 (= call!40795 (contains!5078 lt!422077 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936531 () Bool)

(assert (=> b!936531 (= e!525966 (= (apply!830 lt!422077 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!936532 () Bool)

(assert (=> b!936532 (= e!525958 (= (apply!830 lt!422077 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14298 (select (arr!27107 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1626 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!936532 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27567 _values!1231)))))

(assert (=> b!936532 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27566 _keys!1487)))))

(declare-fun b!936533 () Bool)

(declare-fun res!630403 () Bool)

(declare-fun e!525956 () Bool)

(assert (=> b!936533 (=> (not res!630403) (not e!525956))))

(assert (=> b!936533 (= res!630403 e!525961)))

(declare-fun res!630405 () Bool)

(assert (=> b!936533 (=> res!630405 e!525961)))

(declare-fun e!525962 () Bool)

(assert (=> b!936533 (= res!630405 (not e!525962))))

(declare-fun res!630399 () Bool)

(assert (=> b!936533 (=> (not res!630399) (not e!525962))))

(assert (=> b!936533 (= res!630399 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27566 _keys!1487)))))

(declare-fun bm!40787 () Bool)

(declare-fun call!40793 () ListLongMap!11987)

(assert (=> bm!40787 (= call!40791 call!40793)))

(declare-fun b!936534 () Bool)

(declare-fun e!525963 () Bool)

(assert (=> b!936534 (= e!525963 (not call!40795))))

(declare-fun bm!40788 () Bool)

(declare-fun call!40790 () ListLongMap!11987)

(declare-fun call!40794 () ListLongMap!11987)

(assert (=> bm!40788 (= call!40790 call!40794)))

(declare-fun b!936535 () Bool)

(declare-fun c!97596 () Bool)

(assert (=> b!936535 (= c!97596 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525967 () ListLongMap!11987)

(assert (=> b!936535 (= e!525967 e!525964)))

(declare-fun d!113595 () Bool)

(assert (=> d!113595 e!525956))

(declare-fun res!630401 () Bool)

(assert (=> d!113595 (=> (not res!630401) (not e!525956))))

(assert (=> d!113595 (= res!630401 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27566 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27566 _keys!1487)))))))

(declare-fun lt!422084 () ListLongMap!11987)

(assert (=> d!113595 (= lt!422077 lt!422084)))

(declare-fun lt!422069 () Unit!31543)

(declare-fun e!525955 () Unit!31543)

(assert (=> d!113595 (= lt!422069 e!525955)))

(declare-fun c!97597 () Bool)

(declare-fun e!525960 () Bool)

(assert (=> d!113595 (= c!97597 e!525960)))

(declare-fun res!630398 () Bool)

(assert (=> d!113595 (=> (not res!630398) (not e!525960))))

(assert (=> d!113595 (= res!630398 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27566 _keys!1487)))))

(declare-fun e!525965 () ListLongMap!11987)

(assert (=> d!113595 (= lt!422084 e!525965)))

(declare-fun c!97600 () Bool)

(assert (=> d!113595 (= c!97600 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113595 (validMask!0 mask!1881)))

(assert (=> d!113595 (= (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!422077)))

(declare-fun b!936536 () Bool)

(declare-fun Unit!31548 () Unit!31543)

(assert (=> b!936536 (= e!525955 Unit!31548)))

(declare-fun b!936537 () Bool)

(assert (=> b!936537 (= e!525967 call!40791)))

(declare-fun bm!40789 () Bool)

(assert (=> bm!40789 (= call!40794 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!936538 () Bool)

(declare-fun lt!422082 () Unit!31543)

(assert (=> b!936538 (= e!525955 lt!422082)))

(declare-fun lt!422081 () ListLongMap!11987)

(assert (=> b!936538 (= lt!422081 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!422074 () (_ BitVec 64))

(assert (=> b!936538 (= lt!422074 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422087 () (_ BitVec 64))

(assert (=> b!936538 (= lt!422087 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!422079 () Unit!31543)

(assert (=> b!936538 (= lt!422079 (addStillContains!532 lt!422081 lt!422074 zeroValue!1173 lt!422087))))

(assert (=> b!936538 (contains!5078 (+!2829 lt!422081 (tuple2!13289 lt!422074 zeroValue!1173)) lt!422087)))

(declare-fun lt!422076 () Unit!31543)

(assert (=> b!936538 (= lt!422076 lt!422079)))

(declare-fun lt!422088 () ListLongMap!11987)

(assert (=> b!936538 (= lt!422088 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!422067 () (_ BitVec 64))

(assert (=> b!936538 (= lt!422067 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422072 () (_ BitVec 64))

(assert (=> b!936538 (= lt!422072 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!422075 () Unit!31543)

(assert (=> b!936538 (= lt!422075 (addApplyDifferent!420 lt!422088 lt!422067 minValue!1173 lt!422072))))

(assert (=> b!936538 (= (apply!830 (+!2829 lt!422088 (tuple2!13289 lt!422067 minValue!1173)) lt!422072) (apply!830 lt!422088 lt!422072))))

(declare-fun lt!422070 () Unit!31543)

(assert (=> b!936538 (= lt!422070 lt!422075)))

(declare-fun lt!422068 () ListLongMap!11987)

(assert (=> b!936538 (= lt!422068 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!422086 () (_ BitVec 64))

(assert (=> b!936538 (= lt!422086 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422083 () (_ BitVec 64))

(assert (=> b!936538 (= lt!422083 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!422080 () Unit!31543)

(assert (=> b!936538 (= lt!422080 (addApplyDifferent!420 lt!422068 lt!422086 zeroValue!1173 lt!422083))))

(assert (=> b!936538 (= (apply!830 (+!2829 lt!422068 (tuple2!13289 lt!422086 zeroValue!1173)) lt!422083) (apply!830 lt!422068 lt!422083))))

(declare-fun lt!422071 () Unit!31543)

(assert (=> b!936538 (= lt!422071 lt!422080)))

(declare-fun lt!422085 () ListLongMap!11987)

(assert (=> b!936538 (= lt!422085 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!422073 () (_ BitVec 64))

(assert (=> b!936538 (= lt!422073 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422078 () (_ BitVec 64))

(assert (=> b!936538 (= lt!422078 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!936538 (= lt!422082 (addApplyDifferent!420 lt!422085 lt!422073 minValue!1173 lt!422078))))

(assert (=> b!936538 (= (apply!830 (+!2829 lt!422085 (tuple2!13289 lt!422073 minValue!1173)) lt!422078) (apply!830 lt!422085 lt!422078))))

(declare-fun b!936539 () Bool)

(assert (=> b!936539 (= e!525965 e!525967)))

(declare-fun c!97598 () Bool)

(assert (=> b!936539 (= c!97598 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!936540 () Bool)

(assert (=> b!936540 (= e!525959 (not call!40789))))

(declare-fun bm!40790 () Bool)

(assert (=> bm!40790 (= call!40789 (contains!5078 lt!422077 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936541 () Bool)

(assert (=> b!936541 (= e!525965 (+!2829 call!40793 (tuple2!13289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40791 () Bool)

(assert (=> bm!40791 (= call!40793 (+!2829 (ite c!97600 call!40794 (ite c!97598 call!40790 call!40792)) (ite (or c!97600 c!97598) (tuple2!13289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!936542 () Bool)

(assert (=> b!936542 (= e!525956 e!525963)))

(declare-fun c!97595 () Bool)

(assert (=> b!936542 (= c!97595 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!936543 () Bool)

(assert (=> b!936543 (= e!525960 (validKeyInArray!0 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40792 () Bool)

(assert (=> bm!40792 (= call!40792 call!40790)))

(declare-fun b!936544 () Bool)

(declare-fun res!630404 () Bool)

(assert (=> b!936544 (=> (not res!630404) (not e!525956))))

(assert (=> b!936544 (= res!630404 e!525959)))

(declare-fun c!97599 () Bool)

(assert (=> b!936544 (= c!97599 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!936545 () Bool)

(declare-fun e!525957 () Bool)

(assert (=> b!936545 (= e!525957 (= (apply!830 lt!422077 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!936546 () Bool)

(assert (=> b!936546 (= e!525962 (validKeyInArray!0 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!936547 () Bool)

(assert (=> b!936547 (= e!525963 e!525957)))

(declare-fun res!630397 () Bool)

(assert (=> b!936547 (= res!630397 call!40795)))

(assert (=> b!936547 (=> (not res!630397) (not e!525957))))

(assert (= (and d!113595 c!97600) b!936541))

(assert (= (and d!113595 (not c!97600)) b!936539))

(assert (= (and b!936539 c!97598) b!936537))

(assert (= (and b!936539 (not c!97598)) b!936535))

(assert (= (and b!936535 c!97596) b!936529))

(assert (= (and b!936535 (not c!97596)) b!936530))

(assert (= (or b!936529 b!936530) bm!40792))

(assert (= (or b!936537 bm!40792) bm!40788))

(assert (= (or b!936537 b!936529) bm!40787))

(assert (= (or b!936541 bm!40788) bm!40789))

(assert (= (or b!936541 bm!40787) bm!40791))

(assert (= (and d!113595 res!630398) b!936543))

(assert (= (and d!113595 c!97597) b!936538))

(assert (= (and d!113595 (not c!97597)) b!936536))

(assert (= (and d!113595 res!630401) b!936533))

(assert (= (and b!936533 res!630399) b!936546))

(assert (= (and b!936533 (not res!630405)) b!936527))

(assert (= (and b!936527 res!630400) b!936532))

(assert (= (and b!936533 res!630403) b!936544))

(assert (= (and b!936544 c!97599) b!936528))

(assert (= (and b!936544 (not c!97599)) b!936540))

(assert (= (and b!936528 res!630402) b!936531))

(assert (= (or b!936528 b!936540) bm!40790))

(assert (= (and b!936544 res!630404) b!936542))

(assert (= (and b!936542 c!97595) b!936547))

(assert (= (and b!936542 (not c!97595)) b!936534))

(assert (= (and b!936547 res!630397) b!936545))

(assert (= (or b!936547 b!936534) bm!40786))

(declare-fun b_lambda!14077 () Bool)

(assert (=> (not b_lambda!14077) (not b!936532)))

(assert (=> b!936532 t!27269))

(declare-fun b_and!28937 () Bool)

(assert (= b_and!28935 (and (=> t!27269 result!11941) b_and!28937)))

(assert (=> b!936527 m!871169))

(assert (=> b!936527 m!871169))

(declare-fun m!871391 () Bool)

(assert (=> b!936527 m!871391))

(declare-fun m!871393 () Bool)

(assert (=> b!936531 m!871393))

(declare-fun m!871395 () Bool)

(assert (=> b!936545 m!871395))

(assert (=> b!936532 m!871137))

(assert (=> b!936532 m!871139))

(assert (=> b!936532 m!871141))

(assert (=> b!936532 m!871137))

(assert (=> b!936532 m!871169))

(assert (=> b!936532 m!871169))

(declare-fun m!871397 () Bool)

(assert (=> b!936532 m!871397))

(assert (=> b!936532 m!871139))

(declare-fun m!871399 () Bool)

(assert (=> bm!40791 m!871399))

(assert (=> d!113595 m!871161))

(assert (=> b!936546 m!871169))

(assert (=> b!936546 m!871169))

(declare-fun m!871401 () Bool)

(assert (=> b!936546 m!871401))

(declare-fun m!871403 () Bool)

(assert (=> bm!40789 m!871403))

(declare-fun m!871405 () Bool)

(assert (=> bm!40786 m!871405))

(declare-fun m!871407 () Bool)

(assert (=> bm!40790 m!871407))

(declare-fun m!871409 () Bool)

(assert (=> b!936538 m!871409))

(declare-fun m!871411 () Bool)

(assert (=> b!936538 m!871411))

(declare-fun m!871413 () Bool)

(assert (=> b!936538 m!871413))

(declare-fun m!871415 () Bool)

(assert (=> b!936538 m!871415))

(assert (=> b!936538 m!871411))

(declare-fun m!871417 () Bool)

(assert (=> b!936538 m!871417))

(declare-fun m!871419 () Bool)

(assert (=> b!936538 m!871419))

(declare-fun m!871421 () Bool)

(assert (=> b!936538 m!871421))

(declare-fun m!871423 () Bool)

(assert (=> b!936538 m!871423))

(declare-fun m!871425 () Bool)

(assert (=> b!936538 m!871425))

(declare-fun m!871427 () Bool)

(assert (=> b!936538 m!871427))

(assert (=> b!936538 m!871415))

(declare-fun m!871429 () Bool)

(assert (=> b!936538 m!871429))

(assert (=> b!936538 m!871403))

(declare-fun m!871431 () Bool)

(assert (=> b!936538 m!871431))

(declare-fun m!871433 () Bool)

(assert (=> b!936538 m!871433))

(declare-fun m!871435 () Bool)

(assert (=> b!936538 m!871435))

(assert (=> b!936538 m!871423))

(assert (=> b!936538 m!871433))

(assert (=> b!936538 m!871169))

(declare-fun m!871437 () Bool)

(assert (=> b!936538 m!871437))

(declare-fun m!871439 () Bool)

(assert (=> b!936541 m!871439))

(assert (=> b!936543 m!871169))

(assert (=> b!936543 m!871169))

(assert (=> b!936543 m!871401))

(assert (=> b!936291 d!113595))

(declare-fun d!113597 () Bool)

(declare-fun e!525970 () Bool)

(assert (=> d!113597 e!525970))

(declare-fun res!630411 () Bool)

(assert (=> d!113597 (=> (not res!630411) (not e!525970))))

(declare-fun lt!422100 () ListLongMap!11987)

(assert (=> d!113597 (= res!630411 (contains!5078 lt!422100 (_1!6655 lt!421931)))))

(declare-fun lt!422097 () List!19070)

(assert (=> d!113597 (= lt!422100 (ListLongMap!11988 lt!422097))))

(declare-fun lt!422098 () Unit!31543)

(declare-fun lt!422099 () Unit!31543)

(assert (=> d!113597 (= lt!422098 lt!422099)))

(assert (=> d!113597 (= (getValueByKey!480 lt!422097 (_1!6655 lt!421931)) (Some!485 (_2!6655 lt!421931)))))

(declare-fun lemmaContainsTupThenGetReturnValue!259 (List!19070 (_ BitVec 64) V!31863) Unit!31543)

(assert (=> d!113597 (= lt!422099 (lemmaContainsTupThenGetReturnValue!259 lt!422097 (_1!6655 lt!421931) (_2!6655 lt!421931)))))

(declare-fun insertStrictlySorted!316 (List!19070 (_ BitVec 64) V!31863) List!19070)

(assert (=> d!113597 (= lt!422097 (insertStrictlySorted!316 (toList!6009 lt!421925) (_1!6655 lt!421931) (_2!6655 lt!421931)))))

(assert (=> d!113597 (= (+!2829 lt!421925 lt!421931) lt!422100)))

(declare-fun b!936552 () Bool)

(declare-fun res!630410 () Bool)

(assert (=> b!936552 (=> (not res!630410) (not e!525970))))

(assert (=> b!936552 (= res!630410 (= (getValueByKey!480 (toList!6009 lt!422100) (_1!6655 lt!421931)) (Some!485 (_2!6655 lt!421931))))))

(declare-fun b!936553 () Bool)

(declare-fun contains!5081 (List!19070 tuple2!13288) Bool)

(assert (=> b!936553 (= e!525970 (contains!5081 (toList!6009 lt!422100) lt!421931))))

(assert (= (and d!113597 res!630411) b!936552))

(assert (= (and b!936552 res!630410) b!936553))

(declare-fun m!871441 () Bool)

(assert (=> d!113597 m!871441))

(declare-fun m!871443 () Bool)

(assert (=> d!113597 m!871443))

(declare-fun m!871445 () Bool)

(assert (=> d!113597 m!871445))

(declare-fun m!871447 () Bool)

(assert (=> d!113597 m!871447))

(declare-fun m!871449 () Bool)

(assert (=> b!936552 m!871449))

(declare-fun m!871451 () Bool)

(assert (=> b!936553 m!871451))

(assert (=> b!936291 d!113597))

(declare-fun d!113599 () Bool)

(declare-fun e!525973 () Bool)

(assert (=> d!113599 e!525973))

(declare-fun res!630414 () Bool)

(assert (=> d!113599 (=> (not res!630414) (not e!525973))))

(assert (=> d!113599 (= res!630414 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27566 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27567 _values!1231))))))

(declare-fun lt!422103 () Unit!31543)

(declare-fun choose!1556 (array!56339 array!56341 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 32) Int) Unit!31543)

(assert (=> d!113599 (= lt!422103 (choose!1556 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113599 (validMask!0 mask!1881)))

(assert (=> d!113599 (= (lemmaListMapRecursiveValidKeyArray!209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!422103)))

(declare-fun b!936556 () Bool)

(assert (=> b!936556 (= e!525973 (= (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2829 (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13289 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14298 (select (arr!27107 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1626 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113599 res!630414) b!936556))

(declare-fun b_lambda!14079 () Bool)

(assert (=> (not b_lambda!14079) (not b!936556)))

(assert (=> b!936556 t!27269))

(declare-fun b_and!28939 () Bool)

(assert (= b_and!28937 (and (=> t!27269 result!11941) b_and!28939)))

(declare-fun m!871453 () Bool)

(assert (=> d!113599 m!871453))

(assert (=> d!113599 m!871161))

(declare-fun m!871455 () Bool)

(assert (=> b!936556 m!871455))

(assert (=> b!936556 m!871137))

(assert (=> b!936556 m!871139))

(assert (=> b!936556 m!871141))

(assert (=> b!936556 m!871137))

(assert (=> b!936556 m!871169))

(assert (=> b!936556 m!871139))

(assert (=> b!936556 m!871143))

(assert (=> b!936556 m!871455))

(declare-fun m!871457 () Bool)

(assert (=> b!936556 m!871457))

(assert (=> b!936291 d!113599))

(declare-fun d!113601 () Bool)

(assert (=> d!113601 (contains!5078 (+!2829 lt!421925 (tuple2!13289 lt!421926 lt!421928)) k0!1099)))

(declare-fun lt!422106 () Unit!31543)

(declare-fun choose!1557 (ListLongMap!11987 (_ BitVec 64) V!31863 (_ BitVec 64)) Unit!31543)

(assert (=> d!113601 (= lt!422106 (choose!1557 lt!421925 lt!421926 lt!421928 k0!1099))))

(assert (=> d!113601 (contains!5078 lt!421925 k0!1099)))

(assert (=> d!113601 (= (addStillContains!532 lt!421925 lt!421926 lt!421928 k0!1099) lt!422106)))

(declare-fun bs!26271 () Bool)

(assert (= bs!26271 d!113601))

(declare-fun m!871459 () Bool)

(assert (=> bs!26271 m!871459))

(assert (=> bs!26271 m!871459))

(declare-fun m!871461 () Bool)

(assert (=> bs!26271 m!871461))

(declare-fun m!871463 () Bool)

(assert (=> bs!26271 m!871463))

(assert (=> bs!26271 m!871157))

(assert (=> b!936291 d!113601))

(declare-fun d!113603 () Bool)

(declare-fun e!525974 () Bool)

(assert (=> d!113603 e!525974))

(declare-fun res!630416 () Bool)

(assert (=> d!113603 (=> (not res!630416) (not e!525974))))

(declare-fun lt!422110 () ListLongMap!11987)

(assert (=> d!113603 (= res!630416 (contains!5078 lt!422110 (_1!6655 lt!421931)))))

(declare-fun lt!422107 () List!19070)

(assert (=> d!113603 (= lt!422110 (ListLongMap!11988 lt!422107))))

(declare-fun lt!422108 () Unit!31543)

(declare-fun lt!422109 () Unit!31543)

(assert (=> d!113603 (= lt!422108 lt!422109)))

(assert (=> d!113603 (= (getValueByKey!480 lt!422107 (_1!6655 lt!421931)) (Some!485 (_2!6655 lt!421931)))))

(assert (=> d!113603 (= lt!422109 (lemmaContainsTupThenGetReturnValue!259 lt!422107 (_1!6655 lt!421931) (_2!6655 lt!421931)))))

(assert (=> d!113603 (= lt!422107 (insertStrictlySorted!316 (toList!6009 (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421927 defaultEntry!1235)) (_1!6655 lt!421931) (_2!6655 lt!421931)))))

(assert (=> d!113603 (= (+!2829 (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421927 defaultEntry!1235) lt!421931) lt!422110)))

(declare-fun b!936558 () Bool)

(declare-fun res!630415 () Bool)

(assert (=> b!936558 (=> (not res!630415) (not e!525974))))

(assert (=> b!936558 (= res!630415 (= (getValueByKey!480 (toList!6009 lt!422110) (_1!6655 lt!421931)) (Some!485 (_2!6655 lt!421931))))))

(declare-fun b!936559 () Bool)

(assert (=> b!936559 (= e!525974 (contains!5081 (toList!6009 lt!422110) lt!421931))))

(assert (= (and d!113603 res!630416) b!936558))

(assert (= (and b!936558 res!630415) b!936559))

(declare-fun m!871465 () Bool)

(assert (=> d!113603 m!871465))

(declare-fun m!871467 () Bool)

(assert (=> d!113603 m!871467))

(declare-fun m!871469 () Bool)

(assert (=> d!113603 m!871469))

(declare-fun m!871471 () Bool)

(assert (=> d!113603 m!871471))

(declare-fun m!871473 () Bool)

(assert (=> b!936558 m!871473))

(declare-fun m!871475 () Bool)

(assert (=> b!936559 m!871475))

(assert (=> b!936291 d!113603))

(declare-fun d!113605 () Bool)

(declare-fun e!525977 () Bool)

(assert (=> d!113605 e!525977))

(declare-fun c!97603 () Bool)

(assert (=> d!113605 (= c!97603 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422113 () Unit!31543)

(declare-fun choose!1558 (array!56339 array!56341 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 64) (_ BitVec 32) Int) Unit!31543)

(assert (=> d!113605 (= lt!422113 (choose!1558 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113605 (validMask!0 mask!1881)))

(assert (=> d!113605 (= (lemmaListMapContainsThenArrayContainsFrom!283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!422113)))

(declare-fun b!936564 () Bool)

(assert (=> b!936564 (= e!525977 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936565 () Bool)

(assert (=> b!936565 (= e!525977 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113605 c!97603) b!936564))

(assert (= (and d!113605 (not c!97603)) b!936565))

(declare-fun m!871477 () Bool)

(assert (=> d!113605 m!871477))

(assert (=> d!113605 m!871161))

(assert (=> b!936564 m!871171))

(assert (=> b!936291 d!113605))

(declare-fun d!113607 () Bool)

(declare-fun e!525983 () Bool)

(assert (=> d!113607 e!525983))

(declare-fun res!630419 () Bool)

(assert (=> d!113607 (=> res!630419 e!525983)))

(declare-fun lt!422125 () Bool)

(assert (=> d!113607 (= res!630419 (not lt!422125))))

(declare-fun lt!422124 () Bool)

(assert (=> d!113607 (= lt!422125 lt!422124)))

(declare-fun lt!422122 () Unit!31543)

(declare-fun e!525982 () Unit!31543)

(assert (=> d!113607 (= lt!422122 e!525982)))

(declare-fun c!97606 () Bool)

(assert (=> d!113607 (= c!97606 lt!422124)))

(declare-fun containsKey!451 (List!19070 (_ BitVec 64)) Bool)

(assert (=> d!113607 (= lt!422124 (containsKey!451 (toList!6009 (+!2829 lt!421925 lt!421931)) k0!1099))))

(assert (=> d!113607 (= (contains!5078 (+!2829 lt!421925 lt!421931) k0!1099) lt!422125)))

(declare-fun b!936572 () Bool)

(declare-fun lt!422123 () Unit!31543)

(assert (=> b!936572 (= e!525982 lt!422123)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!345 (List!19070 (_ BitVec 64)) Unit!31543)

(assert (=> b!936572 (= lt!422123 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6009 (+!2829 lt!421925 lt!421931)) k0!1099))))

(declare-fun isDefined!353 (Option!486) Bool)

(assert (=> b!936572 (isDefined!353 (getValueByKey!480 (toList!6009 (+!2829 lt!421925 lt!421931)) k0!1099))))

(declare-fun b!936573 () Bool)

(declare-fun Unit!31549 () Unit!31543)

(assert (=> b!936573 (= e!525982 Unit!31549)))

(declare-fun b!936574 () Bool)

(assert (=> b!936574 (= e!525983 (isDefined!353 (getValueByKey!480 (toList!6009 (+!2829 lt!421925 lt!421931)) k0!1099)))))

(assert (= (and d!113607 c!97606) b!936572))

(assert (= (and d!113607 (not c!97606)) b!936573))

(assert (= (and d!113607 (not res!630419)) b!936574))

(declare-fun m!871479 () Bool)

(assert (=> d!113607 m!871479))

(declare-fun m!871481 () Bool)

(assert (=> b!936572 m!871481))

(declare-fun m!871483 () Bool)

(assert (=> b!936572 m!871483))

(assert (=> b!936572 m!871483))

(declare-fun m!871485 () Bool)

(assert (=> b!936572 m!871485))

(assert (=> b!936574 m!871483))

(assert (=> b!936574 m!871483))

(assert (=> b!936574 m!871485))

(assert (=> b!936291 d!113607))

(declare-fun b!936575 () Bool)

(declare-fun e!525985 () Bool)

(assert (=> b!936575 (= e!525985 (contains!5077 Nil!19066 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!936576 () Bool)

(declare-fun e!525987 () Bool)

(declare-fun call!40796 () Bool)

(assert (=> b!936576 (= e!525987 call!40796)))

(declare-fun d!113609 () Bool)

(declare-fun res!630422 () Bool)

(declare-fun e!525984 () Bool)

(assert (=> d!113609 (=> res!630422 e!525984)))

(assert (=> d!113609 (= res!630422 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27566 _keys!1487)))))

(assert (=> d!113609 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19066) e!525984)))

(declare-fun bm!40793 () Bool)

(declare-fun c!97607 () Bool)

(assert (=> bm!40793 (= call!40796 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97607 (Cons!19065 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19066) Nil!19066)))))

(declare-fun b!936577 () Bool)

(declare-fun e!525986 () Bool)

(assert (=> b!936577 (= e!525986 e!525987)))

(assert (=> b!936577 (= c!97607 (validKeyInArray!0 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!936578 () Bool)

(assert (=> b!936578 (= e!525987 call!40796)))

(declare-fun b!936579 () Bool)

(assert (=> b!936579 (= e!525984 e!525986)))

(declare-fun res!630420 () Bool)

(assert (=> b!936579 (=> (not res!630420) (not e!525986))))

(assert (=> b!936579 (= res!630420 (not e!525985))))

(declare-fun res!630421 () Bool)

(assert (=> b!936579 (=> (not res!630421) (not e!525985))))

(assert (=> b!936579 (= res!630421 (validKeyInArray!0 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113609 (not res!630422)) b!936579))

(assert (= (and b!936579 res!630421) b!936575))

(assert (= (and b!936579 res!630420) b!936577))

(assert (= (and b!936577 c!97607) b!936576))

(assert (= (and b!936577 (not c!97607)) b!936578))

(assert (= (or b!936576 b!936578) bm!40793))

(assert (=> b!936575 m!871169))

(assert (=> b!936575 m!871169))

(declare-fun m!871487 () Bool)

(assert (=> b!936575 m!871487))

(assert (=> bm!40793 m!871169))

(declare-fun m!871489 () Bool)

(assert (=> bm!40793 m!871489))

(assert (=> b!936577 m!871169))

(assert (=> b!936577 m!871169))

(assert (=> b!936577 m!871401))

(assert (=> b!936579 m!871169))

(assert (=> b!936579 m!871169))

(assert (=> b!936579 m!871401))

(assert (=> b!936291 d!113609))

(declare-fun d!113611 () Bool)

(declare-fun c!97610 () Bool)

(assert (=> d!113611 (= c!97610 ((_ is ValueCellFull!9605) (select (arr!27107 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!525990 () V!31863)

(assert (=> d!113611 (= (get!14298 (select (arr!27107 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1626 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!525990)))

(declare-fun b!936584 () Bool)

(declare-fun get!14301 (ValueCell!9605 V!31863) V!31863)

(assert (=> b!936584 (= e!525990 (get!14301 (select (arr!27107 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1626 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!936585 () Bool)

(declare-fun get!14302 (ValueCell!9605 V!31863) V!31863)

(assert (=> b!936585 (= e!525990 (get!14302 (select (arr!27107 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1626 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113611 c!97610) b!936584))

(assert (= (and d!113611 (not c!97610)) b!936585))

(assert (=> b!936584 m!871137))

(assert (=> b!936584 m!871139))

(declare-fun m!871491 () Bool)

(assert (=> b!936584 m!871491))

(assert (=> b!936585 m!871137))

(assert (=> b!936585 m!871139))

(declare-fun m!871493 () Bool)

(assert (=> b!936585 m!871493))

(assert (=> b!936291 d!113611))

(declare-fun d!113613 () Bool)

(assert (=> d!113613 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19066)))

(declare-fun lt!422128 () Unit!31543)

(declare-fun choose!39 (array!56339 (_ BitVec 32) (_ BitVec 32)) Unit!31543)

(assert (=> d!113613 (= lt!422128 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113613 (bvslt (size!27566 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113613 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!422128)))

(declare-fun bs!26272 () Bool)

(assert (= bs!26272 d!113613))

(assert (=> bs!26272 m!871149))

(declare-fun m!871495 () Bool)

(assert (=> bs!26272 m!871495))

(assert (=> b!936291 d!113613))

(declare-fun d!113615 () Bool)

(assert (=> d!113615 (= (validKeyInArray!0 lt!421926) (and (not (= lt!421926 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!421926 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!936289 d!113615))

(declare-fun d!113617 () Bool)

(declare-fun e!525992 () Bool)

(assert (=> d!113617 e!525992))

(declare-fun res!630423 () Bool)

(assert (=> d!113617 (=> res!630423 e!525992)))

(declare-fun lt!422132 () Bool)

(assert (=> d!113617 (= res!630423 (not lt!422132))))

(declare-fun lt!422131 () Bool)

(assert (=> d!113617 (= lt!422132 lt!422131)))

(declare-fun lt!422129 () Unit!31543)

(declare-fun e!525991 () Unit!31543)

(assert (=> d!113617 (= lt!422129 e!525991)))

(declare-fun c!97611 () Bool)

(assert (=> d!113617 (= c!97611 lt!422131)))

(assert (=> d!113617 (= lt!422131 (containsKey!451 (toList!6009 lt!421925) k0!1099))))

(assert (=> d!113617 (= (contains!5078 lt!421925 k0!1099) lt!422132)))

(declare-fun b!936586 () Bool)

(declare-fun lt!422130 () Unit!31543)

(assert (=> b!936586 (= e!525991 lt!422130)))

(assert (=> b!936586 (= lt!422130 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6009 lt!421925) k0!1099))))

(assert (=> b!936586 (isDefined!353 (getValueByKey!480 (toList!6009 lt!421925) k0!1099))))

(declare-fun b!936587 () Bool)

(declare-fun Unit!31550 () Unit!31543)

(assert (=> b!936587 (= e!525991 Unit!31550)))

(declare-fun b!936588 () Bool)

(assert (=> b!936588 (= e!525992 (isDefined!353 (getValueByKey!480 (toList!6009 lt!421925) k0!1099)))))

(assert (= (and d!113617 c!97611) b!936586))

(assert (= (and d!113617 (not c!97611)) b!936587))

(assert (= (and d!113617 (not res!630423)) b!936588))

(declare-fun m!871497 () Bool)

(assert (=> d!113617 m!871497))

(declare-fun m!871499 () Bool)

(assert (=> b!936586 m!871499))

(assert (=> b!936586 m!871325))

(assert (=> b!936586 m!871325))

(declare-fun m!871501 () Bool)

(assert (=> b!936586 m!871501))

(assert (=> b!936588 m!871325))

(assert (=> b!936588 m!871325))

(assert (=> b!936588 m!871501))

(assert (=> b!936280 d!113617))

(declare-fun b!936589 () Bool)

(declare-fun e!525999 () Bool)

(declare-fun e!525996 () Bool)

(assert (=> b!936589 (= e!525999 e!525996)))

(declare-fun res!630427 () Bool)

(assert (=> b!936589 (=> (not res!630427) (not e!525996))))

(declare-fun lt!422143 () ListLongMap!11987)

(assert (=> b!936589 (= res!630427 (contains!5078 lt!422143 (select (arr!27106 _keys!1487) from!1844)))))

(assert (=> b!936589 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27566 _keys!1487)))))

(declare-fun b!936590 () Bool)

(declare-fun e!525997 () Bool)

(declare-fun e!526004 () Bool)

(assert (=> b!936590 (= e!525997 e!526004)))

(declare-fun res!630429 () Bool)

(declare-fun call!40797 () Bool)

(assert (=> b!936590 (= res!630429 call!40797)))

(assert (=> b!936590 (=> (not res!630429) (not e!526004))))

(declare-fun b!936591 () Bool)

(declare-fun e!526002 () ListLongMap!11987)

(declare-fun call!40799 () ListLongMap!11987)

(assert (=> b!936591 (= e!526002 call!40799)))

(declare-fun b!936592 () Bool)

(declare-fun call!40800 () ListLongMap!11987)

(assert (=> b!936592 (= e!526002 call!40800)))

(declare-fun bm!40794 () Bool)

(declare-fun call!40803 () Bool)

(assert (=> bm!40794 (= call!40803 (contains!5078 lt!422143 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936593 () Bool)

(assert (=> b!936593 (= e!526004 (= (apply!830 lt!422143 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!936594 () Bool)

(assert (=> b!936594 (= e!525996 (= (apply!830 lt!422143 (select (arr!27106 _keys!1487) from!1844)) (get!14298 (select (arr!27107 _values!1231) from!1844) (dynLambda!1626 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!936594 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27567 _values!1231)))))

(assert (=> b!936594 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27566 _keys!1487)))))

(declare-fun b!936595 () Bool)

(declare-fun res!630430 () Bool)

(declare-fun e!525994 () Bool)

(assert (=> b!936595 (=> (not res!630430) (not e!525994))))

(assert (=> b!936595 (= res!630430 e!525999)))

(declare-fun res!630432 () Bool)

(assert (=> b!936595 (=> res!630432 e!525999)))

(declare-fun e!526000 () Bool)

(assert (=> b!936595 (= res!630432 (not e!526000))))

(declare-fun res!630426 () Bool)

(assert (=> b!936595 (=> (not res!630426) (not e!526000))))

(assert (=> b!936595 (= res!630426 (bvslt from!1844 (size!27566 _keys!1487)))))

(declare-fun bm!40795 () Bool)

(declare-fun call!40801 () ListLongMap!11987)

(assert (=> bm!40795 (= call!40799 call!40801)))

(declare-fun b!936596 () Bool)

(declare-fun e!526001 () Bool)

(assert (=> b!936596 (= e!526001 (not call!40803))))

(declare-fun bm!40796 () Bool)

(declare-fun call!40798 () ListLongMap!11987)

(declare-fun call!40802 () ListLongMap!11987)

(assert (=> bm!40796 (= call!40798 call!40802)))

(declare-fun b!936597 () Bool)

(declare-fun c!97613 () Bool)

(assert (=> b!936597 (= c!97613 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!526005 () ListLongMap!11987)

(assert (=> b!936597 (= e!526005 e!526002)))

(declare-fun d!113619 () Bool)

(assert (=> d!113619 e!525994))

(declare-fun res!630428 () Bool)

(assert (=> d!113619 (=> (not res!630428) (not e!525994))))

(assert (=> d!113619 (= res!630428 (or (bvsge from!1844 (size!27566 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27566 _keys!1487)))))))

(declare-fun lt!422150 () ListLongMap!11987)

(assert (=> d!113619 (= lt!422143 lt!422150)))

(declare-fun lt!422135 () Unit!31543)

(declare-fun e!525993 () Unit!31543)

(assert (=> d!113619 (= lt!422135 e!525993)))

(declare-fun c!97614 () Bool)

(declare-fun e!525998 () Bool)

(assert (=> d!113619 (= c!97614 e!525998)))

(declare-fun res!630425 () Bool)

(assert (=> d!113619 (=> (not res!630425) (not e!525998))))

(assert (=> d!113619 (= res!630425 (bvslt from!1844 (size!27566 _keys!1487)))))

(declare-fun e!526003 () ListLongMap!11987)

(assert (=> d!113619 (= lt!422150 e!526003)))

(declare-fun c!97617 () Bool)

(assert (=> d!113619 (= c!97617 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113619 (validMask!0 mask!1881)))

(assert (=> d!113619 (= (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!422143)))

(declare-fun b!936598 () Bool)

(declare-fun Unit!31551 () Unit!31543)

(assert (=> b!936598 (= e!525993 Unit!31551)))

(declare-fun b!936599 () Bool)

(assert (=> b!936599 (= e!526005 call!40799)))

(declare-fun bm!40797 () Bool)

(assert (=> bm!40797 (= call!40802 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936600 () Bool)

(declare-fun lt!422148 () Unit!31543)

(assert (=> b!936600 (= e!525993 lt!422148)))

(declare-fun lt!422147 () ListLongMap!11987)

(assert (=> b!936600 (= lt!422147 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!422140 () (_ BitVec 64))

(assert (=> b!936600 (= lt!422140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422153 () (_ BitVec 64))

(assert (=> b!936600 (= lt!422153 (select (arr!27106 _keys!1487) from!1844))))

(declare-fun lt!422145 () Unit!31543)

(assert (=> b!936600 (= lt!422145 (addStillContains!532 lt!422147 lt!422140 zeroValue!1173 lt!422153))))

(assert (=> b!936600 (contains!5078 (+!2829 lt!422147 (tuple2!13289 lt!422140 zeroValue!1173)) lt!422153)))

(declare-fun lt!422142 () Unit!31543)

(assert (=> b!936600 (= lt!422142 lt!422145)))

(declare-fun lt!422154 () ListLongMap!11987)

(assert (=> b!936600 (= lt!422154 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!422133 () (_ BitVec 64))

(assert (=> b!936600 (= lt!422133 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422138 () (_ BitVec 64))

(assert (=> b!936600 (= lt!422138 (select (arr!27106 _keys!1487) from!1844))))

(declare-fun lt!422141 () Unit!31543)

(assert (=> b!936600 (= lt!422141 (addApplyDifferent!420 lt!422154 lt!422133 minValue!1173 lt!422138))))

(assert (=> b!936600 (= (apply!830 (+!2829 lt!422154 (tuple2!13289 lt!422133 minValue!1173)) lt!422138) (apply!830 lt!422154 lt!422138))))

(declare-fun lt!422136 () Unit!31543)

(assert (=> b!936600 (= lt!422136 lt!422141)))

(declare-fun lt!422134 () ListLongMap!11987)

(assert (=> b!936600 (= lt!422134 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!422152 () (_ BitVec 64))

(assert (=> b!936600 (= lt!422152 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422149 () (_ BitVec 64))

(assert (=> b!936600 (= lt!422149 (select (arr!27106 _keys!1487) from!1844))))

(declare-fun lt!422146 () Unit!31543)

(assert (=> b!936600 (= lt!422146 (addApplyDifferent!420 lt!422134 lt!422152 zeroValue!1173 lt!422149))))

(assert (=> b!936600 (= (apply!830 (+!2829 lt!422134 (tuple2!13289 lt!422152 zeroValue!1173)) lt!422149) (apply!830 lt!422134 lt!422149))))

(declare-fun lt!422137 () Unit!31543)

(assert (=> b!936600 (= lt!422137 lt!422146)))

(declare-fun lt!422151 () ListLongMap!11987)

(assert (=> b!936600 (= lt!422151 (getCurrentListMapNoExtraKeys!3346 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!422139 () (_ BitVec 64))

(assert (=> b!936600 (= lt!422139 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422144 () (_ BitVec 64))

(assert (=> b!936600 (= lt!422144 (select (arr!27106 _keys!1487) from!1844))))

(assert (=> b!936600 (= lt!422148 (addApplyDifferent!420 lt!422151 lt!422139 minValue!1173 lt!422144))))

(assert (=> b!936600 (= (apply!830 (+!2829 lt!422151 (tuple2!13289 lt!422139 minValue!1173)) lt!422144) (apply!830 lt!422151 lt!422144))))

(declare-fun b!936601 () Bool)

(assert (=> b!936601 (= e!526003 e!526005)))

(declare-fun c!97615 () Bool)

(assert (=> b!936601 (= c!97615 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!936602 () Bool)

(assert (=> b!936602 (= e!525997 (not call!40797))))

(declare-fun bm!40798 () Bool)

(assert (=> bm!40798 (= call!40797 (contains!5078 lt!422143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936603 () Bool)

(assert (=> b!936603 (= e!526003 (+!2829 call!40801 (tuple2!13289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40799 () Bool)

(assert (=> bm!40799 (= call!40801 (+!2829 (ite c!97617 call!40802 (ite c!97615 call!40798 call!40800)) (ite (or c!97617 c!97615) (tuple2!13289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!936604 () Bool)

(assert (=> b!936604 (= e!525994 e!526001)))

(declare-fun c!97612 () Bool)

(assert (=> b!936604 (= c!97612 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!936605 () Bool)

(assert (=> b!936605 (= e!525998 (validKeyInArray!0 (select (arr!27106 _keys!1487) from!1844)))))

(declare-fun bm!40800 () Bool)

(assert (=> bm!40800 (= call!40800 call!40798)))

(declare-fun b!936606 () Bool)

(declare-fun res!630431 () Bool)

(assert (=> b!936606 (=> (not res!630431) (not e!525994))))

(assert (=> b!936606 (= res!630431 e!525997)))

(declare-fun c!97616 () Bool)

(assert (=> b!936606 (= c!97616 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!936607 () Bool)

(declare-fun e!525995 () Bool)

(assert (=> b!936607 (= e!525995 (= (apply!830 lt!422143 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!936608 () Bool)

(assert (=> b!936608 (= e!526000 (validKeyInArray!0 (select (arr!27106 _keys!1487) from!1844)))))

(declare-fun b!936609 () Bool)

(assert (=> b!936609 (= e!526001 e!525995)))

(declare-fun res!630424 () Bool)

(assert (=> b!936609 (= res!630424 call!40803)))

(assert (=> b!936609 (=> (not res!630424) (not e!525995))))

(assert (= (and d!113619 c!97617) b!936603))

(assert (= (and d!113619 (not c!97617)) b!936601))

(assert (= (and b!936601 c!97615) b!936599))

(assert (= (and b!936601 (not c!97615)) b!936597))

(assert (= (and b!936597 c!97613) b!936591))

(assert (= (and b!936597 (not c!97613)) b!936592))

(assert (= (or b!936591 b!936592) bm!40800))

(assert (= (or b!936599 bm!40800) bm!40796))

(assert (= (or b!936599 b!936591) bm!40795))

(assert (= (or b!936603 bm!40796) bm!40797))

(assert (= (or b!936603 bm!40795) bm!40799))

(assert (= (and d!113619 res!630425) b!936605))

(assert (= (and d!113619 c!97614) b!936600))

(assert (= (and d!113619 (not c!97614)) b!936598))

(assert (= (and d!113619 res!630428) b!936595))

(assert (= (and b!936595 res!630426) b!936608))

(assert (= (and b!936595 (not res!630432)) b!936589))

(assert (= (and b!936589 res!630427) b!936594))

(assert (= (and b!936595 res!630430) b!936606))

(assert (= (and b!936606 c!97616) b!936590))

(assert (= (and b!936606 (not c!97616)) b!936602))

(assert (= (and b!936590 res!630429) b!936593))

(assert (= (or b!936590 b!936602) bm!40798))

(assert (= (and b!936606 res!630431) b!936604))

(assert (= (and b!936604 c!97612) b!936609))

(assert (= (and b!936604 (not c!97612)) b!936596))

(assert (= (and b!936609 res!630424) b!936607))

(assert (= (or b!936609 b!936596) bm!40794))

(declare-fun b_lambda!14081 () Bool)

(assert (=> (not b_lambda!14081) (not b!936594)))

(assert (=> b!936594 t!27269))

(declare-fun b_and!28941 () Bool)

(assert (= b_and!28939 (and (=> t!27269 result!11941) b_and!28941)))

(assert (=> b!936589 m!871329))

(assert (=> b!936589 m!871329))

(declare-fun m!871503 () Bool)

(assert (=> b!936589 m!871503))

(declare-fun m!871505 () Bool)

(assert (=> b!936593 m!871505))

(declare-fun m!871507 () Bool)

(assert (=> b!936607 m!871507))

(declare-fun m!871509 () Bool)

(assert (=> b!936594 m!871509))

(assert (=> b!936594 m!871139))

(declare-fun m!871511 () Bool)

(assert (=> b!936594 m!871511))

(assert (=> b!936594 m!871509))

(assert (=> b!936594 m!871329))

(assert (=> b!936594 m!871329))

(declare-fun m!871513 () Bool)

(assert (=> b!936594 m!871513))

(assert (=> b!936594 m!871139))

(declare-fun m!871515 () Bool)

(assert (=> bm!40799 m!871515))

(assert (=> d!113619 m!871161))

(assert (=> b!936608 m!871329))

(assert (=> b!936608 m!871329))

(declare-fun m!871517 () Bool)

(assert (=> b!936608 m!871517))

(declare-fun m!871519 () Bool)

(assert (=> bm!40797 m!871519))

(declare-fun m!871521 () Bool)

(assert (=> bm!40794 m!871521))

(declare-fun m!871523 () Bool)

(assert (=> bm!40798 m!871523))

(declare-fun m!871525 () Bool)

(assert (=> b!936600 m!871525))

(declare-fun m!871527 () Bool)

(assert (=> b!936600 m!871527))

(declare-fun m!871529 () Bool)

(assert (=> b!936600 m!871529))

(declare-fun m!871531 () Bool)

(assert (=> b!936600 m!871531))

(assert (=> b!936600 m!871527))

(declare-fun m!871533 () Bool)

(assert (=> b!936600 m!871533))

(declare-fun m!871535 () Bool)

(assert (=> b!936600 m!871535))

(declare-fun m!871537 () Bool)

(assert (=> b!936600 m!871537))

(declare-fun m!871539 () Bool)

(assert (=> b!936600 m!871539))

(declare-fun m!871541 () Bool)

(assert (=> b!936600 m!871541))

(declare-fun m!871543 () Bool)

(assert (=> b!936600 m!871543))

(assert (=> b!936600 m!871531))

(declare-fun m!871545 () Bool)

(assert (=> b!936600 m!871545))

(assert (=> b!936600 m!871519))

(declare-fun m!871547 () Bool)

(assert (=> b!936600 m!871547))

(declare-fun m!871549 () Bool)

(assert (=> b!936600 m!871549))

(declare-fun m!871551 () Bool)

(assert (=> b!936600 m!871551))

(assert (=> b!936600 m!871539))

(assert (=> b!936600 m!871549))

(assert (=> b!936600 m!871329))

(declare-fun m!871553 () Bool)

(assert (=> b!936600 m!871553))

(declare-fun m!871555 () Bool)

(assert (=> b!936603 m!871555))

(assert (=> b!936605 m!871329))

(assert (=> b!936605 m!871329))

(assert (=> b!936605 m!871517))

(assert (=> b!936280 d!113619))

(declare-fun condMapEmpty!32037 () Bool)

(declare-fun mapDefault!32037 () ValueCell!9605)

(assert (=> mapNonEmpty!32028 (= condMapEmpty!32037 (= mapRest!32028 ((as const (Array (_ BitVec 32) ValueCell!9605)) mapDefault!32037)))))

(declare-fun e!526011 () Bool)

(declare-fun mapRes!32037 () Bool)

(assert (=> mapNonEmpty!32028 (= tp!61448 (and e!526011 mapRes!32037))))

(declare-fun mapIsEmpty!32037 () Bool)

(assert (=> mapIsEmpty!32037 mapRes!32037))

(declare-fun mapNonEmpty!32037 () Bool)

(declare-fun tp!61464 () Bool)

(declare-fun e!526010 () Bool)

(assert (=> mapNonEmpty!32037 (= mapRes!32037 (and tp!61464 e!526010))))

(declare-fun mapKey!32037 () (_ BitVec 32))

(declare-fun mapRest!32037 () (Array (_ BitVec 32) ValueCell!9605))

(declare-fun mapValue!32037 () ValueCell!9605)

(assert (=> mapNonEmpty!32037 (= mapRest!32028 (store mapRest!32037 mapKey!32037 mapValue!32037))))

(declare-fun b!936616 () Bool)

(assert (=> b!936616 (= e!526010 tp_is_empty!20173)))

(declare-fun b!936617 () Bool)

(assert (=> b!936617 (= e!526011 tp_is_empty!20173)))

(assert (= (and mapNonEmpty!32028 condMapEmpty!32037) mapIsEmpty!32037))

(assert (= (and mapNonEmpty!32028 (not condMapEmpty!32037)) mapNonEmpty!32037))

(assert (= (and mapNonEmpty!32037 ((_ is ValueCellFull!9605) mapValue!32037)) b!936616))

(assert (= (and mapNonEmpty!32028 ((_ is ValueCellFull!9605) mapDefault!32037)) b!936617))

(declare-fun m!871557 () Bool)

(assert (=> mapNonEmpty!32037 m!871557))

(declare-fun b_lambda!14083 () Bool)

(assert (= b_lambda!14081 (or (and start!79748 b_free!17665) b_lambda!14083)))

(declare-fun b_lambda!14085 () Bool)

(assert (= b_lambda!14079 (or (and start!79748 b_free!17665) b_lambda!14085)))

(declare-fun b_lambda!14087 () Bool)

(assert (= b_lambda!14077 (or (and start!79748 b_free!17665) b_lambda!14087)))

(declare-fun b_lambda!14089 () Bool)

(assert (= b_lambda!14075 (or (and start!79748 b_free!17665) b_lambda!14089)))

(check-sat (not b!936527) (not b!936558) (not b!936424) (not bm!40779) (not b!936577) (not b!936445) (not bm!40789) (not d!113599) (not bm!40786) (not b!936586) (not b!936594) (not b!936463) b_and!28941 (not b!936447) tp_is_empty!20173 (not bm!40784) (not bm!40797) (not b!936510) (not b!936541) (not b!936455) (not b!936532) (not bm!40798) (not b!936525) (not b!936524) (not b!936538) (not b!936605) (not b!936545) (not b!936426) (not b!936593) (not d!113607) (not b_lambda!14087) (not bm!40793) (not bm!40761) (not b!936584) (not d!113617) (not d!113595) (not b_next!17665) (not b!936506) (not b!936432) (not b!936517) (not bm!40799) (not bm!40790) (not d!113613) (not bm!40764) (not d!113585) (not bm!40791) (not bm!40794) (not b!936457) (not b_lambda!14073) (not b!936522) (not b!936520) (not b!936546) (not d!113593) (not d!113605) (not b_lambda!14089) (not d!113597) (not b!936552) (not b!936574) (not b!936559) (not b!936453) (not b_lambda!14083) (not b_lambda!14085) (not b!936608) (not b!936572) (not b!936575) (not b!936531) (not b!936607) (not b!936553) (not b!936564) (not b!936462) (not d!113601) (not b!936588) (not b!936511) (not bm!40782) (not b!936543) (not b!936443) (not d!113577) (not d!113603) (not bm!40783) (not b!936589) (not d!113619) (not d!113587) (not mapNonEmpty!32037) (not b!936585) (not b!936603) (not b!936600) (not b!936556) (not b!936579))
(check-sat b_and!28941 (not b_next!17665))
