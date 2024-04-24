; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79604 () Bool)

(assert start!79604)

(declare-fun b_free!17623 () Bool)

(declare-fun b_next!17623 () Bool)

(assert (=> start!79604 (= b_free!17623 (not b_next!17623))))

(declare-fun tp!61313 () Bool)

(declare-fun b_and!28815 () Bool)

(assert (=> start!79604 (= tp!61313 b_and!28815)))

(declare-fun b!934664 () Bool)

(declare-fun res!629296 () Bool)

(declare-fun e!524891 () Bool)

(assert (=> b!934664 (=> (not res!629296) (not e!524891))))

(declare-datatypes ((array!56253 0))(
  ( (array!56254 (arr!27066 (Array (_ BitVec 32) (_ BitVec 64))) (size!27526 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56253)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56253 (_ BitVec 32)) Bool)

(assert (=> b!934664 (= res!629296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934665 () Bool)

(declare-fun res!629292 () Bool)

(assert (=> b!934665 (=> (not res!629292) (not e!524891))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934665 (= res!629292 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27526 _keys!1487))))))

(declare-fun mapIsEmpty!31956 () Bool)

(declare-fun mapRes!31956 () Bool)

(assert (=> mapIsEmpty!31956 mapRes!31956))

(declare-fun b!934666 () Bool)

(declare-fun res!629297 () Bool)

(declare-fun e!524889 () Bool)

(assert (=> b!934666 (=> (not res!629297) (not e!524889))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31807 0))(
  ( (V!31808 (val!10116 Int)) )
))
(declare-datatypes ((tuple2!13254 0))(
  ( (tuple2!13255 (_1!6638 (_ BitVec 64)) (_2!6638 V!31807)) )
))
(declare-datatypes ((List!19037 0))(
  ( (Nil!19034) (Cons!19033 (h!20185 tuple2!13254) (t!27196 List!19037)) )
))
(declare-datatypes ((ListLongMap!11953 0))(
  ( (ListLongMap!11954 (toList!5992 List!19037)) )
))
(declare-fun lt!420931 () ListLongMap!11953)

(declare-fun v!791 () V!31807)

(declare-fun apply!816 (ListLongMap!11953 (_ BitVec 64)) V!31807)

(assert (=> b!934666 (= res!629297 (= (apply!816 lt!420931 k0!1099) v!791))))

(declare-fun b!934667 () Bool)

(declare-fun e!524892 () Bool)

(assert (=> b!934667 (= e!524889 e!524892)))

(declare-fun res!629295 () Bool)

(assert (=> b!934667 (=> (not res!629295) (not e!524892))))

(declare-fun lt!420932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934667 (= res!629295 (validKeyInArray!0 lt!420932))))

(assert (=> b!934667 (= lt!420932 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934668 () Bool)

(declare-fun e!524890 () Bool)

(declare-fun tp_is_empty!20131 () Bool)

(assert (=> b!934668 (= e!524890 tp_is_empty!20131)))

(declare-fun b!934669 () Bool)

(assert (=> b!934669 (= e!524891 e!524889)))

(declare-fun res!629293 () Bool)

(assert (=> b!934669 (=> (not res!629293) (not e!524889))))

(declare-fun contains!5056 (ListLongMap!11953 (_ BitVec 64)) Bool)

(assert (=> b!934669 (= res!629293 (contains!5056 lt!420931 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9584 0))(
  ( (ValueCellFull!9584 (v!12632 V!31807)) (EmptyCell!9584) )
))
(declare-datatypes ((array!56255 0))(
  ( (array!56256 (arr!27067 (Array (_ BitVec 32) ValueCell!9584)) (size!27527 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56255)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31807)

(declare-fun minValue!1173 () V!31807)

(declare-fun getCurrentListMap!3233 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 32) Int) ListLongMap!11953)

(assert (=> b!934669 (= lt!420931 (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun e!524894 () Bool)

(declare-fun b!934670 () Bool)

(declare-fun arrayContainsKey!0 (array!56253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934670 (= e!524894 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!934671 () Bool)

(declare-fun e!524893 () Bool)

(assert (=> b!934671 (= e!524893 tp_is_empty!20131)))

(declare-fun b!934673 () Bool)

(declare-fun res!629289 () Bool)

(assert (=> b!934673 (=> (not res!629289) (not e!524891))))

(declare-datatypes ((List!19038 0))(
  ( (Nil!19035) (Cons!19034 (h!20186 (_ BitVec 64)) (t!27197 List!19038)) )
))
(declare-fun arrayNoDuplicates!0 (array!56253 (_ BitVec 32) List!19038) Bool)

(assert (=> b!934673 (= res!629289 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19035))))

(declare-fun b!934674 () Bool)

(declare-fun res!629291 () Bool)

(assert (=> b!934674 (=> (not res!629291) (not e!524889))))

(assert (=> b!934674 (= res!629291 (validKeyInArray!0 k0!1099))))

(declare-fun b!934675 () Bool)

(declare-fun res!629298 () Bool)

(assert (=> b!934675 (=> (not res!629298) (not e!524889))))

(assert (=> b!934675 (= res!629298 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934676 () Bool)

(assert (=> b!934676 (= e!524894 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!629290 () Bool)

(assert (=> start!79604 (=> (not res!629290) (not e!524891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79604 (= res!629290 (validMask!0 mask!1881))))

(assert (=> start!79604 e!524891))

(assert (=> start!79604 true))

(assert (=> start!79604 tp_is_empty!20131))

(declare-fun e!524895 () Bool)

(declare-fun array_inv!21150 (array!56255) Bool)

(assert (=> start!79604 (and (array_inv!21150 _values!1231) e!524895)))

(assert (=> start!79604 tp!61313))

(declare-fun array_inv!21151 (array!56253) Bool)

(assert (=> start!79604 (array_inv!21151 _keys!1487)))

(declare-fun b!934672 () Bool)

(assert (=> b!934672 (= e!524895 (and e!524890 mapRes!31956))))

(declare-fun condMapEmpty!31956 () Bool)

(declare-fun mapDefault!31956 () ValueCell!9584)

(assert (=> b!934672 (= condMapEmpty!31956 (= (arr!27067 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9584)) mapDefault!31956)))))

(declare-fun b!934677 () Bool)

(assert (=> b!934677 (= e!524892 (not (bvslt (size!27526 _keys!1487) #b01111111111111111111111111111111)))))

(assert (=> b!934677 e!524894))

(declare-fun c!97360 () Bool)

(assert (=> b!934677 (= c!97360 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31504 0))(
  ( (Unit!31505) )
))
(declare-fun lt!420930 () Unit!31504)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!271 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 64) (_ BitVec 32) Int) Unit!31504)

(assert (=> b!934677 (= lt!420930 (lemmaListMapContainsThenArrayContainsFrom!271 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!934677 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19035)))

(declare-fun lt!420927 () Unit!31504)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56253 (_ BitVec 32) (_ BitVec 32)) Unit!31504)

(assert (=> b!934677 (= lt!420927 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420926 () tuple2!13254)

(declare-fun +!2817 (ListLongMap!11953 tuple2!13254) ListLongMap!11953)

(assert (=> b!934677 (contains!5056 (+!2817 lt!420931 lt!420926) k0!1099)))

(declare-fun lt!420933 () V!31807)

(declare-fun lt!420928 () Unit!31504)

(declare-fun addStillContains!520 (ListLongMap!11953 (_ BitVec 64) V!31807 (_ BitVec 64)) Unit!31504)

(assert (=> b!934677 (= lt!420928 (addStillContains!520 lt!420931 lt!420932 lt!420933 k0!1099))))

(assert (=> b!934677 (= (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2817 (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420926))))

(assert (=> b!934677 (= lt!420926 (tuple2!13255 lt!420932 lt!420933))))

(declare-fun get!14263 (ValueCell!9584 V!31807) V!31807)

(declare-fun dynLambda!1614 (Int (_ BitVec 64)) V!31807)

(assert (=> b!934677 (= lt!420933 (get!14263 (select (arr!27067 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1614 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420929 () Unit!31504)

(declare-fun lemmaListMapRecursiveValidKeyArray!197 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 32) Int) Unit!31504)

(assert (=> b!934677 (= lt!420929 (lemmaListMapRecursiveValidKeyArray!197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31956 () Bool)

(declare-fun tp!61314 () Bool)

(assert (=> mapNonEmpty!31956 (= mapRes!31956 (and tp!61314 e!524893))))

(declare-fun mapKey!31956 () (_ BitVec 32))

(declare-fun mapValue!31956 () ValueCell!9584)

(declare-fun mapRest!31956 () (Array (_ BitVec 32) ValueCell!9584))

(assert (=> mapNonEmpty!31956 (= (arr!27067 _values!1231) (store mapRest!31956 mapKey!31956 mapValue!31956))))

(declare-fun b!934678 () Bool)

(declare-fun res!629294 () Bool)

(assert (=> b!934678 (=> (not res!629294) (not e!524891))))

(assert (=> b!934678 (= res!629294 (and (= (size!27527 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27526 _keys!1487) (size!27527 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79604 res!629290) b!934678))

(assert (= (and b!934678 res!629294) b!934664))

(assert (= (and b!934664 res!629296) b!934673))

(assert (= (and b!934673 res!629289) b!934665))

(assert (= (and b!934665 res!629292) b!934669))

(assert (= (and b!934669 res!629293) b!934666))

(assert (= (and b!934666 res!629297) b!934675))

(assert (= (and b!934675 res!629298) b!934674))

(assert (= (and b!934674 res!629291) b!934667))

(assert (= (and b!934667 res!629295) b!934677))

(assert (= (and b!934677 c!97360) b!934670))

(assert (= (and b!934677 (not c!97360)) b!934676))

(assert (= (and b!934672 condMapEmpty!31956) mapIsEmpty!31956))

(assert (= (and b!934672 (not condMapEmpty!31956)) mapNonEmpty!31956))

(get-info :version)

(assert (= (and mapNonEmpty!31956 ((_ is ValueCellFull!9584) mapValue!31956)) b!934671))

(assert (= (and b!934672 ((_ is ValueCellFull!9584) mapDefault!31956)) b!934668))

(assert (= start!79604 b!934672))

(declare-fun b_lambda!13971 () Bool)

(assert (=> (not b_lambda!13971) (not b!934677)))

(declare-fun t!27195 () Bool)

(declare-fun tb!6009 () Bool)

(assert (=> (and start!79604 (= defaultEntry!1235 defaultEntry!1235) t!27195) tb!6009))

(declare-fun result!11851 () Bool)

(assert (=> tb!6009 (= result!11851 tp_is_empty!20131)))

(assert (=> b!934677 t!27195))

(declare-fun b_and!28817 () Bool)

(assert (= b_and!28815 (and (=> t!27195 result!11851) b_and!28817)))

(declare-fun m!869237 () Bool)

(assert (=> b!934677 m!869237))

(declare-fun m!869239 () Bool)

(assert (=> b!934677 m!869239))

(declare-fun m!869241 () Bool)

(assert (=> b!934677 m!869241))

(declare-fun m!869243 () Bool)

(assert (=> b!934677 m!869243))

(declare-fun m!869245 () Bool)

(assert (=> b!934677 m!869245))

(declare-fun m!869247 () Bool)

(assert (=> b!934677 m!869247))

(declare-fun m!869249 () Bool)

(assert (=> b!934677 m!869249))

(assert (=> b!934677 m!869243))

(assert (=> b!934677 m!869245))

(declare-fun m!869251 () Bool)

(assert (=> b!934677 m!869251))

(declare-fun m!869253 () Bool)

(assert (=> b!934677 m!869253))

(declare-fun m!869255 () Bool)

(assert (=> b!934677 m!869255))

(assert (=> b!934677 m!869247))

(declare-fun m!869257 () Bool)

(assert (=> b!934677 m!869257))

(declare-fun m!869259 () Bool)

(assert (=> b!934677 m!869259))

(assert (=> b!934677 m!869241))

(declare-fun m!869261 () Bool)

(assert (=> b!934677 m!869261))

(declare-fun m!869263 () Bool)

(assert (=> b!934664 m!869263))

(declare-fun m!869265 () Bool)

(assert (=> start!79604 m!869265))

(declare-fun m!869267 () Bool)

(assert (=> start!79604 m!869267))

(declare-fun m!869269 () Bool)

(assert (=> start!79604 m!869269))

(declare-fun m!869271 () Bool)

(assert (=> b!934674 m!869271))

(declare-fun m!869273 () Bool)

(assert (=> b!934670 m!869273))

(declare-fun m!869275 () Bool)

(assert (=> b!934667 m!869275))

(declare-fun m!869277 () Bool)

(assert (=> b!934667 m!869277))

(declare-fun m!869279 () Bool)

(assert (=> b!934666 m!869279))

(declare-fun m!869281 () Bool)

(assert (=> b!934669 m!869281))

(declare-fun m!869283 () Bool)

(assert (=> b!934669 m!869283))

(declare-fun m!869285 () Bool)

(assert (=> mapNonEmpty!31956 m!869285))

(declare-fun m!869287 () Bool)

(assert (=> b!934673 m!869287))

(check-sat (not b!934666) (not b!934664) (not b!934673) (not mapNonEmpty!31956) (not b_next!17623) b_and!28817 (not b!934674) (not b!934669) (not b!934667) (not b!934670) (not b_lambda!13971) (not b!934677) (not start!79604) tp_is_empty!20131)
(check-sat b_and!28817 (not b_next!17623))
(get-model)

(declare-fun b_lambda!13977 () Bool)

(assert (= b_lambda!13971 (or (and start!79604 b_free!17623) b_lambda!13977)))

(check-sat (not b!934666) (not b!934664) (not b!934673) (not mapNonEmpty!31956) (not b_lambda!13977) (not b_next!17623) b_and!28817 (not b!934674) (not b!934669) (not b!934667) (not b!934670) (not b!934677) (not start!79604) tp_is_empty!20131)
(check-sat b_and!28817 (not b_next!17623))
(get-model)

(declare-fun b!934786 () Bool)

(declare-fun e!524953 () Bool)

(declare-fun call!40638 () Bool)

(assert (=> b!934786 (= e!524953 call!40638)))

(declare-fun b!934787 () Bool)

(declare-fun e!524954 () Bool)

(declare-fun e!524955 () Bool)

(assert (=> b!934787 (= e!524954 e!524955)))

(declare-fun res!629366 () Bool)

(assert (=> b!934787 (=> (not res!629366) (not e!524955))))

(declare-fun e!524952 () Bool)

(assert (=> b!934787 (= res!629366 (not e!524952))))

(declare-fun res!629367 () Bool)

(assert (=> b!934787 (=> (not res!629367) (not e!524952))))

(assert (=> b!934787 (= res!629367 (validKeyInArray!0 (select (arr!27066 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!934788 () Bool)

(assert (=> b!934788 (= e!524953 call!40638)))

(declare-fun b!934789 () Bool)

(assert (=> b!934789 (= e!524955 e!524953)))

(declare-fun c!97369 () Bool)

(assert (=> b!934789 (= c!97369 (validKeyInArray!0 (select (arr!27066 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40635 () Bool)

(assert (=> bm!40635 (= call!40638 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97369 (Cons!19034 (select (arr!27066 _keys!1487) #b00000000000000000000000000000000) Nil!19035) Nil!19035)))))

(declare-fun d!113415 () Bool)

(declare-fun res!629365 () Bool)

(assert (=> d!113415 (=> res!629365 e!524954)))

(assert (=> d!113415 (= res!629365 (bvsge #b00000000000000000000000000000000 (size!27526 _keys!1487)))))

(assert (=> d!113415 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19035) e!524954)))

(declare-fun b!934785 () Bool)

(declare-fun contains!5059 (List!19038 (_ BitVec 64)) Bool)

(assert (=> b!934785 (= e!524952 (contains!5059 Nil!19035 (select (arr!27066 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113415 (not res!629365)) b!934787))

(assert (= (and b!934787 res!629367) b!934785))

(assert (= (and b!934787 res!629366) b!934789))

(assert (= (and b!934789 c!97369) b!934788))

(assert (= (and b!934789 (not c!97369)) b!934786))

(assert (= (or b!934788 b!934786) bm!40635))

(declare-fun m!869393 () Bool)

(assert (=> b!934787 m!869393))

(assert (=> b!934787 m!869393))

(declare-fun m!869395 () Bool)

(assert (=> b!934787 m!869395))

(assert (=> b!934789 m!869393))

(assert (=> b!934789 m!869393))

(assert (=> b!934789 m!869395))

(assert (=> bm!40635 m!869393))

(declare-fun m!869397 () Bool)

(assert (=> bm!40635 m!869397))

(assert (=> b!934785 m!869393))

(assert (=> b!934785 m!869393))

(declare-fun m!869399 () Bool)

(assert (=> b!934785 m!869399))

(assert (=> b!934673 d!113415))

(declare-fun d!113417 () Bool)

(assert (=> d!113417 (= (validKeyInArray!0 lt!420932) (and (not (= lt!420932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!420932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934667 d!113417))

(declare-fun d!113419 () Bool)

(declare-fun e!524958 () Bool)

(assert (=> d!113419 e!524958))

(declare-fun res!629373 () Bool)

(assert (=> d!113419 (=> (not res!629373) (not e!524958))))

(declare-fun lt!420990 () ListLongMap!11953)

(assert (=> d!113419 (= res!629373 (contains!5056 lt!420990 (_1!6638 lt!420926)))))

(declare-fun lt!420991 () List!19037)

(assert (=> d!113419 (= lt!420990 (ListLongMap!11954 lt!420991))))

(declare-fun lt!420992 () Unit!31504)

(declare-fun lt!420993 () Unit!31504)

(assert (=> d!113419 (= lt!420992 lt!420993)))

(declare-datatypes ((Option!483 0))(
  ( (Some!482 (v!12635 V!31807)) (None!481) )
))
(declare-fun getValueByKey!477 (List!19037 (_ BitVec 64)) Option!483)

(assert (=> d!113419 (= (getValueByKey!477 lt!420991 (_1!6638 lt!420926)) (Some!482 (_2!6638 lt!420926)))))

(declare-fun lemmaContainsTupThenGetReturnValue!256 (List!19037 (_ BitVec 64) V!31807) Unit!31504)

(assert (=> d!113419 (= lt!420993 (lemmaContainsTupThenGetReturnValue!256 lt!420991 (_1!6638 lt!420926) (_2!6638 lt!420926)))))

(declare-fun insertStrictlySorted!313 (List!19037 (_ BitVec 64) V!31807) List!19037)

(assert (=> d!113419 (= lt!420991 (insertStrictlySorted!313 (toList!5992 (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6638 lt!420926) (_2!6638 lt!420926)))))

(assert (=> d!113419 (= (+!2817 (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420926) lt!420990)))

(declare-fun b!934794 () Bool)

(declare-fun res!629372 () Bool)

(assert (=> b!934794 (=> (not res!629372) (not e!524958))))

(assert (=> b!934794 (= res!629372 (= (getValueByKey!477 (toList!5992 lt!420990) (_1!6638 lt!420926)) (Some!482 (_2!6638 lt!420926))))))

(declare-fun b!934795 () Bool)

(declare-fun contains!5060 (List!19037 tuple2!13254) Bool)

(assert (=> b!934795 (= e!524958 (contains!5060 (toList!5992 lt!420990) lt!420926))))

(assert (= (and d!113419 res!629373) b!934794))

(assert (= (and b!934794 res!629372) b!934795))

(declare-fun m!869401 () Bool)

(assert (=> d!113419 m!869401))

(declare-fun m!869403 () Bool)

(assert (=> d!113419 m!869403))

(declare-fun m!869405 () Bool)

(assert (=> d!113419 m!869405))

(declare-fun m!869407 () Bool)

(assert (=> d!113419 m!869407))

(declare-fun m!869409 () Bool)

(assert (=> b!934794 m!869409))

(declare-fun m!869411 () Bool)

(assert (=> b!934795 m!869411))

(assert (=> b!934677 d!113419))

(declare-fun c!97386 () Bool)

(declare-fun call!40657 () ListLongMap!11953)

(declare-fun bm!40650 () Bool)

(declare-fun call!40655 () ListLongMap!11953)

(declare-fun call!40654 () ListLongMap!11953)

(declare-fun c!97383 () Bool)

(declare-fun call!40659 () ListLongMap!11953)

(assert (=> bm!40650 (= call!40655 (+!2817 (ite c!97383 call!40659 (ite c!97386 call!40654 call!40657)) (ite (or c!97383 c!97386) (tuple2!13255 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13255 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!934839 () Bool)

(declare-fun e!524997 () ListLongMap!11953)

(assert (=> b!934839 (= e!524997 call!40657)))

(declare-fun b!934840 () Bool)

(declare-fun e!524992 () Bool)

(declare-fun call!40653 () Bool)

(assert (=> b!934840 (= e!524992 (not call!40653))))

(declare-fun b!934841 () Bool)

(declare-fun e!524989 () Bool)

(declare-fun lt!421055 () ListLongMap!11953)

(assert (=> b!934841 (= e!524989 (= (apply!816 lt!421055 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14263 (select (arr!27067 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1614 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934841 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27527 _values!1231)))))

(assert (=> b!934841 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27526 _keys!1487)))))

(declare-fun bm!40651 () Bool)

(declare-fun call!40658 () Bool)

(assert (=> bm!40651 (= call!40658 (contains!5056 lt!421055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934842 () Bool)

(declare-fun e!524993 () Bool)

(assert (=> b!934842 (= e!524993 (= (apply!816 lt!421055 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!934843 () Bool)

(declare-fun e!524990 () Bool)

(declare-fun e!524995 () Bool)

(assert (=> b!934843 (= e!524990 e!524995)))

(declare-fun res!629399 () Bool)

(assert (=> b!934843 (= res!629399 call!40658)))

(assert (=> b!934843 (=> (not res!629399) (not e!524995))))

(declare-fun bm!40652 () Bool)

(assert (=> bm!40652 (= call!40657 call!40654)))

(declare-fun b!934844 () Bool)

(declare-fun e!524991 () ListLongMap!11953)

(declare-fun e!524987 () ListLongMap!11953)

(assert (=> b!934844 (= e!524991 e!524987)))

(assert (=> b!934844 (= c!97386 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934845 () Bool)

(assert (=> b!934845 (= e!524991 (+!2817 call!40655 (tuple2!13255 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!934846 () Bool)

(declare-fun e!524996 () Bool)

(assert (=> b!934846 (= e!524996 e!524989)))

(declare-fun res!629397 () Bool)

(assert (=> b!934846 (=> (not res!629397) (not e!524989))))

(assert (=> b!934846 (= res!629397 (contains!5056 lt!421055 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!934846 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27526 _keys!1487)))))

(declare-fun b!934847 () Bool)

(declare-fun res!629398 () Bool)

(declare-fun e!524986 () Bool)

(assert (=> b!934847 (=> (not res!629398) (not e!524986))))

(assert (=> b!934847 (= res!629398 e!524996)))

(declare-fun res!629394 () Bool)

(assert (=> b!934847 (=> res!629394 e!524996)))

(declare-fun e!524988 () Bool)

(assert (=> b!934847 (= res!629394 (not e!524988))))

(declare-fun res!629392 () Bool)

(assert (=> b!934847 (=> (not res!629392) (not e!524988))))

(assert (=> b!934847 (= res!629392 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27526 _keys!1487)))))

(declare-fun b!934848 () Bool)

(declare-fun e!524985 () Unit!31504)

(declare-fun lt!421040 () Unit!31504)

(assert (=> b!934848 (= e!524985 lt!421040)))

(declare-fun lt!421042 () ListLongMap!11953)

(declare-fun getCurrentListMapNoExtraKeys!3343 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 32) Int) ListLongMap!11953)

(assert (=> b!934848 (= lt!421042 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421043 () (_ BitVec 64))

(assert (=> b!934848 (= lt!421043 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421059 () (_ BitVec 64))

(assert (=> b!934848 (= lt!421059 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421056 () Unit!31504)

(assert (=> b!934848 (= lt!421056 (addStillContains!520 lt!421042 lt!421043 zeroValue!1173 lt!421059))))

(assert (=> b!934848 (contains!5056 (+!2817 lt!421042 (tuple2!13255 lt!421043 zeroValue!1173)) lt!421059)))

(declare-fun lt!421052 () Unit!31504)

(assert (=> b!934848 (= lt!421052 lt!421056)))

(declare-fun lt!421054 () ListLongMap!11953)

(assert (=> b!934848 (= lt!421054 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421041 () (_ BitVec 64))

(assert (=> b!934848 (= lt!421041 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421050 () (_ BitVec 64))

(assert (=> b!934848 (= lt!421050 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421053 () Unit!31504)

(declare-fun addApplyDifferent!417 (ListLongMap!11953 (_ BitVec 64) V!31807 (_ BitVec 64)) Unit!31504)

(assert (=> b!934848 (= lt!421053 (addApplyDifferent!417 lt!421054 lt!421041 minValue!1173 lt!421050))))

(assert (=> b!934848 (= (apply!816 (+!2817 lt!421054 (tuple2!13255 lt!421041 minValue!1173)) lt!421050) (apply!816 lt!421054 lt!421050))))

(declare-fun lt!421047 () Unit!31504)

(assert (=> b!934848 (= lt!421047 lt!421053)))

(declare-fun lt!421039 () ListLongMap!11953)

(assert (=> b!934848 (= lt!421039 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421044 () (_ BitVec 64))

(assert (=> b!934848 (= lt!421044 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421045 () (_ BitVec 64))

(assert (=> b!934848 (= lt!421045 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421051 () Unit!31504)

(assert (=> b!934848 (= lt!421051 (addApplyDifferent!417 lt!421039 lt!421044 zeroValue!1173 lt!421045))))

(assert (=> b!934848 (= (apply!816 (+!2817 lt!421039 (tuple2!13255 lt!421044 zeroValue!1173)) lt!421045) (apply!816 lt!421039 lt!421045))))

(declare-fun lt!421057 () Unit!31504)

(assert (=> b!934848 (= lt!421057 lt!421051)))

(declare-fun lt!421048 () ListLongMap!11953)

(assert (=> b!934848 (= lt!421048 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421038 () (_ BitVec 64))

(assert (=> b!934848 (= lt!421038 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421049 () (_ BitVec 64))

(assert (=> b!934848 (= lt!421049 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!934848 (= lt!421040 (addApplyDifferent!417 lt!421048 lt!421038 minValue!1173 lt!421049))))

(assert (=> b!934848 (= (apply!816 (+!2817 lt!421048 (tuple2!13255 lt!421038 minValue!1173)) lt!421049) (apply!816 lt!421048 lt!421049))))

(declare-fun b!934849 () Bool)

(assert (=> b!934849 (= e!524990 (not call!40658))))

(declare-fun d!113421 () Bool)

(assert (=> d!113421 e!524986))

(declare-fun res!629396 () Bool)

(assert (=> d!113421 (=> (not res!629396) (not e!524986))))

(assert (=> d!113421 (= res!629396 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27526 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27526 _keys!1487)))))))

(declare-fun lt!421046 () ListLongMap!11953)

(assert (=> d!113421 (= lt!421055 lt!421046)))

(declare-fun lt!421058 () Unit!31504)

(assert (=> d!113421 (= lt!421058 e!524985)))

(declare-fun c!97387 () Bool)

(declare-fun e!524994 () Bool)

(assert (=> d!113421 (= c!97387 e!524994)))

(declare-fun res!629393 () Bool)

(assert (=> d!113421 (=> (not res!629393) (not e!524994))))

(assert (=> d!113421 (= res!629393 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27526 _keys!1487)))))

(assert (=> d!113421 (= lt!421046 e!524991)))

(assert (=> d!113421 (= c!97383 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113421 (validMask!0 mask!1881)))

(assert (=> d!113421 (= (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421055)))

(declare-fun b!934838 () Bool)

(declare-fun Unit!31510 () Unit!31504)

(assert (=> b!934838 (= e!524985 Unit!31510)))

(declare-fun b!934850 () Bool)

(assert (=> b!934850 (= e!524995 (= (apply!816 lt!421055 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!934851 () Bool)

(assert (=> b!934851 (= e!524992 e!524993)))

(declare-fun res!629395 () Bool)

(assert (=> b!934851 (= res!629395 call!40653)))

(assert (=> b!934851 (=> (not res!629395) (not e!524993))))

(declare-fun b!934852 () Bool)

(assert (=> b!934852 (= e!524994 (validKeyInArray!0 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!934853 () Bool)

(assert (=> b!934853 (= e!524988 (validKeyInArray!0 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40653 () Bool)

(declare-fun call!40656 () ListLongMap!11953)

(assert (=> bm!40653 (= call!40656 call!40655)))

(declare-fun b!934854 () Bool)

(assert (=> b!934854 (= e!524986 e!524992)))

(declare-fun c!97382 () Bool)

(assert (=> b!934854 (= c!97382 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934855 () Bool)

(assert (=> b!934855 (= e!524997 call!40656)))

(declare-fun bm!40654 () Bool)

(assert (=> bm!40654 (= call!40654 call!40659)))

(declare-fun b!934856 () Bool)

(assert (=> b!934856 (= e!524987 call!40656)))

(declare-fun bm!40655 () Bool)

(assert (=> bm!40655 (= call!40659 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934857 () Bool)

(declare-fun res!629400 () Bool)

(assert (=> b!934857 (=> (not res!629400) (not e!524986))))

(assert (=> b!934857 (= res!629400 e!524990)))

(declare-fun c!97385 () Bool)

(assert (=> b!934857 (= c!97385 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!934858 () Bool)

(declare-fun c!97384 () Bool)

(assert (=> b!934858 (= c!97384 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!934858 (= e!524987 e!524997)))

(declare-fun bm!40656 () Bool)

(assert (=> bm!40656 (= call!40653 (contains!5056 lt!421055 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113421 c!97383) b!934845))

(assert (= (and d!113421 (not c!97383)) b!934844))

(assert (= (and b!934844 c!97386) b!934856))

(assert (= (and b!934844 (not c!97386)) b!934858))

(assert (= (and b!934858 c!97384) b!934855))

(assert (= (and b!934858 (not c!97384)) b!934839))

(assert (= (or b!934855 b!934839) bm!40652))

(assert (= (or b!934856 bm!40652) bm!40654))

(assert (= (or b!934856 b!934855) bm!40653))

(assert (= (or b!934845 bm!40654) bm!40655))

(assert (= (or b!934845 bm!40653) bm!40650))

(assert (= (and d!113421 res!629393) b!934852))

(assert (= (and d!113421 c!97387) b!934848))

(assert (= (and d!113421 (not c!97387)) b!934838))

(assert (= (and d!113421 res!629396) b!934847))

(assert (= (and b!934847 res!629392) b!934853))

(assert (= (and b!934847 (not res!629394)) b!934846))

(assert (= (and b!934846 res!629397) b!934841))

(assert (= (and b!934847 res!629398) b!934857))

(assert (= (and b!934857 c!97385) b!934843))

(assert (= (and b!934857 (not c!97385)) b!934849))

(assert (= (and b!934843 res!629399) b!934850))

(assert (= (or b!934843 b!934849) bm!40651))

(assert (= (and b!934857 res!629400) b!934854))

(assert (= (and b!934854 c!97382) b!934851))

(assert (= (and b!934854 (not c!97382)) b!934840))

(assert (= (and b!934851 res!629395) b!934842))

(assert (= (or b!934851 b!934840) bm!40656))

(declare-fun b_lambda!13979 () Bool)

(assert (=> (not b_lambda!13979) (not b!934841)))

(assert (=> b!934841 t!27195))

(declare-fun b_and!28827 () Bool)

(assert (= b_and!28817 (and (=> t!27195 result!11851) b_and!28827)))

(assert (=> d!113421 m!869265))

(declare-fun m!869413 () Bool)

(assert (=> b!934850 m!869413))

(declare-fun m!869415 () Bool)

(assert (=> b!934845 m!869415))

(declare-fun m!869417 () Bool)

(assert (=> b!934848 m!869417))

(declare-fun m!869419 () Bool)

(assert (=> b!934848 m!869419))

(declare-fun m!869421 () Bool)

(assert (=> b!934848 m!869421))

(declare-fun m!869423 () Bool)

(assert (=> b!934848 m!869423))

(declare-fun m!869425 () Bool)

(assert (=> b!934848 m!869425))

(declare-fun m!869427 () Bool)

(assert (=> b!934848 m!869427))

(declare-fun m!869429 () Bool)

(assert (=> b!934848 m!869429))

(assert (=> b!934848 m!869421))

(declare-fun m!869431 () Bool)

(assert (=> b!934848 m!869431))

(declare-fun m!869433 () Bool)

(assert (=> b!934848 m!869433))

(assert (=> b!934848 m!869277))

(assert (=> b!934848 m!869431))

(declare-fun m!869435 () Bool)

(assert (=> b!934848 m!869435))

(declare-fun m!869437 () Bool)

(assert (=> b!934848 m!869437))

(declare-fun m!869439 () Bool)

(assert (=> b!934848 m!869439))

(declare-fun m!869441 () Bool)

(assert (=> b!934848 m!869441))

(declare-fun m!869443 () Bool)

(assert (=> b!934848 m!869443))

(declare-fun m!869445 () Bool)

(assert (=> b!934848 m!869445))

(assert (=> b!934848 m!869439))

(declare-fun m!869447 () Bool)

(assert (=> b!934848 m!869447))

(assert (=> b!934848 m!869443))

(declare-fun m!869449 () Bool)

(assert (=> bm!40650 m!869449))

(assert (=> b!934846 m!869277))

(assert (=> b!934846 m!869277))

(declare-fun m!869451 () Bool)

(assert (=> b!934846 m!869451))

(assert (=> b!934853 m!869277))

(assert (=> b!934853 m!869277))

(declare-fun m!869453 () Bool)

(assert (=> b!934853 m!869453))

(declare-fun m!869455 () Bool)

(assert (=> b!934842 m!869455))

(assert (=> b!934841 m!869277))

(declare-fun m!869457 () Bool)

(assert (=> b!934841 m!869457))

(assert (=> b!934841 m!869243))

(assert (=> b!934841 m!869245))

(assert (=> b!934841 m!869251))

(assert (=> b!934841 m!869245))

(assert (=> b!934841 m!869277))

(assert (=> b!934841 m!869243))

(assert (=> bm!40655 m!869427))

(declare-fun m!869459 () Bool)

(assert (=> bm!40651 m!869459))

(declare-fun m!869461 () Bool)

(assert (=> bm!40656 m!869461))

(assert (=> b!934852 m!869277))

(assert (=> b!934852 m!869277))

(assert (=> b!934852 m!869453))

(assert (=> b!934677 d!113421))

(declare-fun call!40664 () ListLongMap!11953)

(declare-fun call!40666 () ListLongMap!11953)

(declare-fun call!40661 () ListLongMap!11953)

(declare-fun c!97389 () Bool)

(declare-fun call!40662 () ListLongMap!11953)

(declare-fun c!97392 () Bool)

(declare-fun bm!40657 () Bool)

(assert (=> bm!40657 (= call!40662 (+!2817 (ite c!97389 call!40666 (ite c!97392 call!40661 call!40664)) (ite (or c!97389 c!97392) (tuple2!13255 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13255 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!934860 () Bool)

(declare-fun e!525010 () ListLongMap!11953)

(assert (=> b!934860 (= e!525010 call!40664)))

(declare-fun b!934861 () Bool)

(declare-fun e!525005 () Bool)

(declare-fun call!40660 () Bool)

(assert (=> b!934861 (= e!525005 (not call!40660))))

(declare-fun e!525002 () Bool)

(declare-fun b!934862 () Bool)

(declare-fun lt!421077 () ListLongMap!11953)

(assert (=> b!934862 (= e!525002 (= (apply!816 lt!421077 (select (arr!27066 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14263 (select (arr!27067 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1614 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934862 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27527 _values!1231)))))

(assert (=> b!934862 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27526 _keys!1487)))))

(declare-fun bm!40658 () Bool)

(declare-fun call!40665 () Bool)

(assert (=> bm!40658 (= call!40665 (contains!5056 lt!421077 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934863 () Bool)

(declare-fun e!525006 () Bool)

(assert (=> b!934863 (= e!525006 (= (apply!816 lt!421077 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!934864 () Bool)

(declare-fun e!525003 () Bool)

(declare-fun e!525008 () Bool)

(assert (=> b!934864 (= e!525003 e!525008)))

(declare-fun res!629408 () Bool)

(assert (=> b!934864 (= res!629408 call!40665)))

(assert (=> b!934864 (=> (not res!629408) (not e!525008))))

(declare-fun bm!40659 () Bool)

(assert (=> bm!40659 (= call!40664 call!40661)))

(declare-fun b!934865 () Bool)

(declare-fun e!525004 () ListLongMap!11953)

(declare-fun e!525000 () ListLongMap!11953)

(assert (=> b!934865 (= e!525004 e!525000)))

(assert (=> b!934865 (= c!97392 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934866 () Bool)

(assert (=> b!934866 (= e!525004 (+!2817 call!40662 (tuple2!13255 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!934867 () Bool)

(declare-fun e!525009 () Bool)

(assert (=> b!934867 (= e!525009 e!525002)))

(declare-fun res!629406 () Bool)

(assert (=> b!934867 (=> (not res!629406) (not e!525002))))

(assert (=> b!934867 (= res!629406 (contains!5056 lt!421077 (select (arr!27066 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!934867 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27526 _keys!1487)))))

(declare-fun b!934868 () Bool)

(declare-fun res!629407 () Bool)

(declare-fun e!524999 () Bool)

(assert (=> b!934868 (=> (not res!629407) (not e!524999))))

(assert (=> b!934868 (= res!629407 e!525009)))

(declare-fun res!629403 () Bool)

(assert (=> b!934868 (=> res!629403 e!525009)))

(declare-fun e!525001 () Bool)

(assert (=> b!934868 (= res!629403 (not e!525001))))

(declare-fun res!629401 () Bool)

(assert (=> b!934868 (=> (not res!629401) (not e!525001))))

(assert (=> b!934868 (= res!629401 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27526 _keys!1487)))))

(declare-fun b!934869 () Bool)

(declare-fun e!524998 () Unit!31504)

(declare-fun lt!421062 () Unit!31504)

(assert (=> b!934869 (= e!524998 lt!421062)))

(declare-fun lt!421064 () ListLongMap!11953)

(assert (=> b!934869 (= lt!421064 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421065 () (_ BitVec 64))

(assert (=> b!934869 (= lt!421065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421081 () (_ BitVec 64))

(assert (=> b!934869 (= lt!421081 (select (arr!27066 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421078 () Unit!31504)

(assert (=> b!934869 (= lt!421078 (addStillContains!520 lt!421064 lt!421065 zeroValue!1173 lt!421081))))

(assert (=> b!934869 (contains!5056 (+!2817 lt!421064 (tuple2!13255 lt!421065 zeroValue!1173)) lt!421081)))

(declare-fun lt!421074 () Unit!31504)

(assert (=> b!934869 (= lt!421074 lt!421078)))

(declare-fun lt!421076 () ListLongMap!11953)

(assert (=> b!934869 (= lt!421076 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421063 () (_ BitVec 64))

(assert (=> b!934869 (= lt!421063 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421072 () (_ BitVec 64))

(assert (=> b!934869 (= lt!421072 (select (arr!27066 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421075 () Unit!31504)

(assert (=> b!934869 (= lt!421075 (addApplyDifferent!417 lt!421076 lt!421063 minValue!1173 lt!421072))))

(assert (=> b!934869 (= (apply!816 (+!2817 lt!421076 (tuple2!13255 lt!421063 minValue!1173)) lt!421072) (apply!816 lt!421076 lt!421072))))

(declare-fun lt!421069 () Unit!31504)

(assert (=> b!934869 (= lt!421069 lt!421075)))

(declare-fun lt!421061 () ListLongMap!11953)

(assert (=> b!934869 (= lt!421061 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421066 () (_ BitVec 64))

(assert (=> b!934869 (= lt!421066 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421067 () (_ BitVec 64))

(assert (=> b!934869 (= lt!421067 (select (arr!27066 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421073 () Unit!31504)

(assert (=> b!934869 (= lt!421073 (addApplyDifferent!417 lt!421061 lt!421066 zeroValue!1173 lt!421067))))

(assert (=> b!934869 (= (apply!816 (+!2817 lt!421061 (tuple2!13255 lt!421066 zeroValue!1173)) lt!421067) (apply!816 lt!421061 lt!421067))))

(declare-fun lt!421079 () Unit!31504)

(assert (=> b!934869 (= lt!421079 lt!421073)))

(declare-fun lt!421070 () ListLongMap!11953)

(assert (=> b!934869 (= lt!421070 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421060 () (_ BitVec 64))

(assert (=> b!934869 (= lt!421060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421071 () (_ BitVec 64))

(assert (=> b!934869 (= lt!421071 (select (arr!27066 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!934869 (= lt!421062 (addApplyDifferent!417 lt!421070 lt!421060 minValue!1173 lt!421071))))

(assert (=> b!934869 (= (apply!816 (+!2817 lt!421070 (tuple2!13255 lt!421060 minValue!1173)) lt!421071) (apply!816 lt!421070 lt!421071))))

(declare-fun b!934870 () Bool)

(assert (=> b!934870 (= e!525003 (not call!40665))))

(declare-fun d!113423 () Bool)

(assert (=> d!113423 e!524999))

(declare-fun res!629405 () Bool)

(assert (=> d!113423 (=> (not res!629405) (not e!524999))))

(assert (=> d!113423 (= res!629405 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27526 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27526 _keys!1487)))))))

(declare-fun lt!421068 () ListLongMap!11953)

(assert (=> d!113423 (= lt!421077 lt!421068)))

(declare-fun lt!421080 () Unit!31504)

(assert (=> d!113423 (= lt!421080 e!524998)))

(declare-fun c!97393 () Bool)

(declare-fun e!525007 () Bool)

(assert (=> d!113423 (= c!97393 e!525007)))

(declare-fun res!629402 () Bool)

(assert (=> d!113423 (=> (not res!629402) (not e!525007))))

(assert (=> d!113423 (= res!629402 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27526 _keys!1487)))))

(assert (=> d!113423 (= lt!421068 e!525004)))

(assert (=> d!113423 (= c!97389 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113423 (validMask!0 mask!1881)))

(assert (=> d!113423 (= (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421077)))

(declare-fun b!934859 () Bool)

(declare-fun Unit!31511 () Unit!31504)

(assert (=> b!934859 (= e!524998 Unit!31511)))

(declare-fun b!934871 () Bool)

(assert (=> b!934871 (= e!525008 (= (apply!816 lt!421077 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!934872 () Bool)

(assert (=> b!934872 (= e!525005 e!525006)))

(declare-fun res!629404 () Bool)

(assert (=> b!934872 (= res!629404 call!40660)))

(assert (=> b!934872 (=> (not res!629404) (not e!525006))))

(declare-fun b!934873 () Bool)

(assert (=> b!934873 (= e!525007 (validKeyInArray!0 (select (arr!27066 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!934874 () Bool)

(assert (=> b!934874 (= e!525001 (validKeyInArray!0 (select (arr!27066 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bm!40660 () Bool)

(declare-fun call!40663 () ListLongMap!11953)

(assert (=> bm!40660 (= call!40663 call!40662)))

(declare-fun b!934875 () Bool)

(assert (=> b!934875 (= e!524999 e!525005)))

(declare-fun c!97388 () Bool)

(assert (=> b!934875 (= c!97388 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934876 () Bool)

(assert (=> b!934876 (= e!525010 call!40663)))

(declare-fun bm!40661 () Bool)

(assert (=> bm!40661 (= call!40661 call!40666)))

(declare-fun b!934877 () Bool)

(assert (=> b!934877 (= e!525000 call!40663)))

(declare-fun bm!40662 () Bool)

(assert (=> bm!40662 (= call!40666 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!934878 () Bool)

(declare-fun res!629409 () Bool)

(assert (=> b!934878 (=> (not res!629409) (not e!524999))))

(assert (=> b!934878 (= res!629409 e!525003)))

(declare-fun c!97391 () Bool)

(assert (=> b!934878 (= c!97391 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!934879 () Bool)

(declare-fun c!97390 () Bool)

(assert (=> b!934879 (= c!97390 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!934879 (= e!525000 e!525010)))

(declare-fun bm!40663 () Bool)

(assert (=> bm!40663 (= call!40660 (contains!5056 lt!421077 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113423 c!97389) b!934866))

(assert (= (and d!113423 (not c!97389)) b!934865))

(assert (= (and b!934865 c!97392) b!934877))

(assert (= (and b!934865 (not c!97392)) b!934879))

(assert (= (and b!934879 c!97390) b!934876))

(assert (= (and b!934879 (not c!97390)) b!934860))

(assert (= (or b!934876 b!934860) bm!40659))

(assert (= (or b!934877 bm!40659) bm!40661))

(assert (= (or b!934877 b!934876) bm!40660))

(assert (= (or b!934866 bm!40661) bm!40662))

(assert (= (or b!934866 bm!40660) bm!40657))

(assert (= (and d!113423 res!629402) b!934873))

(assert (= (and d!113423 c!97393) b!934869))

(assert (= (and d!113423 (not c!97393)) b!934859))

(assert (= (and d!113423 res!629405) b!934868))

(assert (= (and b!934868 res!629401) b!934874))

(assert (= (and b!934868 (not res!629403)) b!934867))

(assert (= (and b!934867 res!629406) b!934862))

(assert (= (and b!934868 res!629407) b!934878))

(assert (= (and b!934878 c!97391) b!934864))

(assert (= (and b!934878 (not c!97391)) b!934870))

(assert (= (and b!934864 res!629408) b!934871))

(assert (= (or b!934864 b!934870) bm!40658))

(assert (= (and b!934878 res!629409) b!934875))

(assert (= (and b!934875 c!97388) b!934872))

(assert (= (and b!934875 (not c!97388)) b!934861))

(assert (= (and b!934872 res!629404) b!934863))

(assert (= (or b!934872 b!934861) bm!40663))

(declare-fun b_lambda!13981 () Bool)

(assert (=> (not b_lambda!13981) (not b!934862)))

(assert (=> b!934862 t!27195))

(declare-fun b_and!28829 () Bool)

(assert (= b_and!28827 (and (=> t!27195 result!11851) b_and!28829)))

(assert (=> d!113423 m!869265))

(declare-fun m!869463 () Bool)

(assert (=> b!934871 m!869463))

(declare-fun m!869465 () Bool)

(assert (=> b!934866 m!869465))

(declare-fun m!869467 () Bool)

(assert (=> b!934869 m!869467))

(declare-fun m!869469 () Bool)

(assert (=> b!934869 m!869469))

(declare-fun m!869471 () Bool)

(assert (=> b!934869 m!869471))

(declare-fun m!869473 () Bool)

(assert (=> b!934869 m!869473))

(declare-fun m!869475 () Bool)

(assert (=> b!934869 m!869475))

(declare-fun m!869477 () Bool)

(assert (=> b!934869 m!869477))

(declare-fun m!869479 () Bool)

(assert (=> b!934869 m!869479))

(assert (=> b!934869 m!869471))

(declare-fun m!869481 () Bool)

(assert (=> b!934869 m!869481))

(declare-fun m!869483 () Bool)

(assert (=> b!934869 m!869483))

(declare-fun m!869485 () Bool)

(assert (=> b!934869 m!869485))

(assert (=> b!934869 m!869481))

(declare-fun m!869487 () Bool)

(assert (=> b!934869 m!869487))

(declare-fun m!869489 () Bool)

(assert (=> b!934869 m!869489))

(declare-fun m!869491 () Bool)

(assert (=> b!934869 m!869491))

(declare-fun m!869493 () Bool)

(assert (=> b!934869 m!869493))

(declare-fun m!869495 () Bool)

(assert (=> b!934869 m!869495))

(declare-fun m!869497 () Bool)

(assert (=> b!934869 m!869497))

(assert (=> b!934869 m!869491))

(declare-fun m!869499 () Bool)

(assert (=> b!934869 m!869499))

(assert (=> b!934869 m!869495))

(declare-fun m!869501 () Bool)

(assert (=> bm!40657 m!869501))

(assert (=> b!934867 m!869485))

(assert (=> b!934867 m!869485))

(declare-fun m!869503 () Bool)

(assert (=> b!934867 m!869503))

(assert (=> b!934874 m!869485))

(assert (=> b!934874 m!869485))

(declare-fun m!869505 () Bool)

(assert (=> b!934874 m!869505))

(declare-fun m!869507 () Bool)

(assert (=> b!934863 m!869507))

(assert (=> b!934862 m!869485))

(declare-fun m!869509 () Bool)

(assert (=> b!934862 m!869509))

(declare-fun m!869511 () Bool)

(assert (=> b!934862 m!869511))

(assert (=> b!934862 m!869245))

(declare-fun m!869513 () Bool)

(assert (=> b!934862 m!869513))

(assert (=> b!934862 m!869245))

(assert (=> b!934862 m!869485))

(assert (=> b!934862 m!869511))

(assert (=> bm!40662 m!869477))

(declare-fun m!869515 () Bool)

(assert (=> bm!40658 m!869515))

(declare-fun m!869517 () Bool)

(assert (=> bm!40663 m!869517))

(assert (=> b!934873 m!869485))

(assert (=> b!934873 m!869485))

(assert (=> b!934873 m!869505))

(assert (=> b!934677 d!113423))

(declare-fun d!113425 () Bool)

(declare-fun e!525013 () Bool)

(assert (=> d!113425 e!525013))

(declare-fun res!629412 () Bool)

(assert (=> d!113425 (=> (not res!629412) (not e!525013))))

(assert (=> d!113425 (= res!629412 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27526 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27527 _values!1231))))))

(declare-fun lt!421084 () Unit!31504)

(declare-fun choose!1547 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 32) Int) Unit!31504)

(assert (=> d!113425 (= lt!421084 (choose!1547 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113425 (validMask!0 mask!1881)))

(assert (=> d!113425 (= (lemmaListMapRecursiveValidKeyArray!197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421084)))

(declare-fun b!934882 () Bool)

(assert (=> b!934882 (= e!525013 (= (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2817 (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13255 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14263 (select (arr!27067 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1614 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113425 res!629412) b!934882))

(declare-fun b_lambda!13983 () Bool)

(assert (=> (not b_lambda!13983) (not b!934882)))

(assert (=> b!934882 t!27195))

(declare-fun b_and!28831 () Bool)

(assert (= b_and!28829 (and (=> t!27195 result!11851) b_and!28831)))

(declare-fun m!869519 () Bool)

(assert (=> d!113425 m!869519))

(assert (=> d!113425 m!869265))

(declare-fun m!869521 () Bool)

(assert (=> b!934882 m!869521))

(declare-fun m!869523 () Bool)

(assert (=> b!934882 m!869523))

(assert (=> b!934882 m!869245))

(assert (=> b!934882 m!869277))

(assert (=> b!934882 m!869521))

(assert (=> b!934882 m!869243))

(assert (=> b!934882 m!869253))

(assert (=> b!934882 m!869243))

(assert (=> b!934882 m!869245))

(assert (=> b!934882 m!869251))

(assert (=> b!934677 d!113425))

(declare-fun b!934884 () Bool)

(declare-fun e!525015 () Bool)

(declare-fun call!40667 () Bool)

(assert (=> b!934884 (= e!525015 call!40667)))

(declare-fun b!934885 () Bool)

(declare-fun e!525016 () Bool)

(declare-fun e!525017 () Bool)

(assert (=> b!934885 (= e!525016 e!525017)))

(declare-fun res!629414 () Bool)

(assert (=> b!934885 (=> (not res!629414) (not e!525017))))

(declare-fun e!525014 () Bool)

(assert (=> b!934885 (= res!629414 (not e!525014))))

(declare-fun res!629415 () Bool)

(assert (=> b!934885 (=> (not res!629415) (not e!525014))))

(assert (=> b!934885 (= res!629415 (validKeyInArray!0 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!934886 () Bool)

(assert (=> b!934886 (= e!525015 call!40667)))

(declare-fun b!934887 () Bool)

(assert (=> b!934887 (= e!525017 e!525015)))

(declare-fun c!97394 () Bool)

(assert (=> b!934887 (= c!97394 (validKeyInArray!0 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40664 () Bool)

(assert (=> bm!40664 (= call!40667 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97394 (Cons!19034 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19035) Nil!19035)))))

(declare-fun d!113427 () Bool)

(declare-fun res!629413 () Bool)

(assert (=> d!113427 (=> res!629413 e!525016)))

(assert (=> d!113427 (= res!629413 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27526 _keys!1487)))))

(assert (=> d!113427 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19035) e!525016)))

(declare-fun b!934883 () Bool)

(assert (=> b!934883 (= e!525014 (contains!5059 Nil!19035 (select (arr!27066 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113427 (not res!629413)) b!934885))

(assert (= (and b!934885 res!629415) b!934883))

(assert (= (and b!934885 res!629414) b!934887))

(assert (= (and b!934887 c!97394) b!934886))

(assert (= (and b!934887 (not c!97394)) b!934884))

(assert (= (or b!934886 b!934884) bm!40664))

(assert (=> b!934885 m!869277))

(assert (=> b!934885 m!869277))

(assert (=> b!934885 m!869453))

(assert (=> b!934887 m!869277))

(assert (=> b!934887 m!869277))

(assert (=> b!934887 m!869453))

(assert (=> bm!40664 m!869277))

(declare-fun m!869525 () Bool)

(assert (=> bm!40664 m!869525))

(assert (=> b!934883 m!869277))

(assert (=> b!934883 m!869277))

(declare-fun m!869527 () Bool)

(assert (=> b!934883 m!869527))

(assert (=> b!934677 d!113427))

(declare-fun d!113429 () Bool)

(declare-fun e!525020 () Bool)

(assert (=> d!113429 e!525020))

(declare-fun c!97397 () Bool)

(assert (=> d!113429 (= c!97397 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421087 () Unit!31504)

(declare-fun choose!1548 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 64) (_ BitVec 32) Int) Unit!31504)

(assert (=> d!113429 (= lt!421087 (choose!1548 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113429 (validMask!0 mask!1881)))

(assert (=> d!113429 (= (lemmaListMapContainsThenArrayContainsFrom!271 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!421087)))

(declare-fun b!934892 () Bool)

(assert (=> b!934892 (= e!525020 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!934893 () Bool)

(assert (=> b!934893 (= e!525020 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113429 c!97397) b!934892))

(assert (= (and d!113429 (not c!97397)) b!934893))

(declare-fun m!869529 () Bool)

(assert (=> d!113429 m!869529))

(assert (=> d!113429 m!869265))

(assert (=> b!934892 m!869273))

(assert (=> b!934677 d!113429))

(declare-fun d!113431 () Bool)

(assert (=> d!113431 (contains!5056 (+!2817 lt!420931 (tuple2!13255 lt!420932 lt!420933)) k0!1099)))

(declare-fun lt!421090 () Unit!31504)

(declare-fun choose!1549 (ListLongMap!11953 (_ BitVec 64) V!31807 (_ BitVec 64)) Unit!31504)

(assert (=> d!113431 (= lt!421090 (choose!1549 lt!420931 lt!420932 lt!420933 k0!1099))))

(assert (=> d!113431 (contains!5056 lt!420931 k0!1099)))

(assert (=> d!113431 (= (addStillContains!520 lt!420931 lt!420932 lt!420933 k0!1099) lt!421090)))

(declare-fun bs!26240 () Bool)

(assert (= bs!26240 d!113431))

(declare-fun m!869531 () Bool)

(assert (=> bs!26240 m!869531))

(assert (=> bs!26240 m!869531))

(declare-fun m!869533 () Bool)

(assert (=> bs!26240 m!869533))

(declare-fun m!869535 () Bool)

(assert (=> bs!26240 m!869535))

(assert (=> bs!26240 m!869281))

(assert (=> b!934677 d!113431))

(declare-fun d!113433 () Bool)

(declare-fun e!525026 () Bool)

(assert (=> d!113433 e!525026))

(declare-fun res!629418 () Bool)

(assert (=> d!113433 (=> res!629418 e!525026)))

(declare-fun lt!421100 () Bool)

(assert (=> d!113433 (= res!629418 (not lt!421100))))

(declare-fun lt!421099 () Bool)

(assert (=> d!113433 (= lt!421100 lt!421099)))

(declare-fun lt!421102 () Unit!31504)

(declare-fun e!525025 () Unit!31504)

(assert (=> d!113433 (= lt!421102 e!525025)))

(declare-fun c!97400 () Bool)

(assert (=> d!113433 (= c!97400 lt!421099)))

(declare-fun containsKey!448 (List!19037 (_ BitVec 64)) Bool)

(assert (=> d!113433 (= lt!421099 (containsKey!448 (toList!5992 (+!2817 lt!420931 lt!420926)) k0!1099))))

(assert (=> d!113433 (= (contains!5056 (+!2817 lt!420931 lt!420926) k0!1099) lt!421100)))

(declare-fun b!934901 () Bool)

(declare-fun lt!421101 () Unit!31504)

(assert (=> b!934901 (= e!525025 lt!421101)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!342 (List!19037 (_ BitVec 64)) Unit!31504)

(assert (=> b!934901 (= lt!421101 (lemmaContainsKeyImpliesGetValueByKeyDefined!342 (toList!5992 (+!2817 lt!420931 lt!420926)) k0!1099))))

(declare-fun isDefined!350 (Option!483) Bool)

(assert (=> b!934901 (isDefined!350 (getValueByKey!477 (toList!5992 (+!2817 lt!420931 lt!420926)) k0!1099))))

(declare-fun b!934902 () Bool)

(declare-fun Unit!31512 () Unit!31504)

(assert (=> b!934902 (= e!525025 Unit!31512)))

(declare-fun b!934903 () Bool)

(assert (=> b!934903 (= e!525026 (isDefined!350 (getValueByKey!477 (toList!5992 (+!2817 lt!420931 lt!420926)) k0!1099)))))

(assert (= (and d!113433 c!97400) b!934901))

(assert (= (and d!113433 (not c!97400)) b!934902))

(assert (= (and d!113433 (not res!629418)) b!934903))

(declare-fun m!869537 () Bool)

(assert (=> d!113433 m!869537))

(declare-fun m!869539 () Bool)

(assert (=> b!934901 m!869539))

(declare-fun m!869541 () Bool)

(assert (=> b!934901 m!869541))

(assert (=> b!934901 m!869541))

(declare-fun m!869543 () Bool)

(assert (=> b!934901 m!869543))

(assert (=> b!934903 m!869541))

(assert (=> b!934903 m!869541))

(assert (=> b!934903 m!869543))

(assert (=> b!934677 d!113433))

(declare-fun d!113435 () Bool)

(declare-fun c!97403 () Bool)

(assert (=> d!113435 (= c!97403 ((_ is ValueCellFull!9584) (select (arr!27067 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!525029 () V!31807)

(assert (=> d!113435 (= (get!14263 (select (arr!27067 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1614 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!525029)))

(declare-fun b!934908 () Bool)

(declare-fun get!14266 (ValueCell!9584 V!31807) V!31807)

(assert (=> b!934908 (= e!525029 (get!14266 (select (arr!27067 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1614 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!934909 () Bool)

(declare-fun get!14267 (ValueCell!9584 V!31807) V!31807)

(assert (=> b!934909 (= e!525029 (get!14267 (select (arr!27067 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1614 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113435 c!97403) b!934908))

(assert (= (and d!113435 (not c!97403)) b!934909))

(assert (=> b!934908 m!869243))

(assert (=> b!934908 m!869245))

(declare-fun m!869545 () Bool)

(assert (=> b!934908 m!869545))

(assert (=> b!934909 m!869243))

(assert (=> b!934909 m!869245))

(declare-fun m!869547 () Bool)

(assert (=> b!934909 m!869547))

(assert (=> b!934677 d!113435))

(declare-fun d!113437 () Bool)

(declare-fun e!525030 () Bool)

(assert (=> d!113437 e!525030))

(declare-fun res!629420 () Bool)

(assert (=> d!113437 (=> (not res!629420) (not e!525030))))

(declare-fun lt!421103 () ListLongMap!11953)

(assert (=> d!113437 (= res!629420 (contains!5056 lt!421103 (_1!6638 lt!420926)))))

(declare-fun lt!421104 () List!19037)

(assert (=> d!113437 (= lt!421103 (ListLongMap!11954 lt!421104))))

(declare-fun lt!421105 () Unit!31504)

(declare-fun lt!421106 () Unit!31504)

(assert (=> d!113437 (= lt!421105 lt!421106)))

(assert (=> d!113437 (= (getValueByKey!477 lt!421104 (_1!6638 lt!420926)) (Some!482 (_2!6638 lt!420926)))))

(assert (=> d!113437 (= lt!421106 (lemmaContainsTupThenGetReturnValue!256 lt!421104 (_1!6638 lt!420926) (_2!6638 lt!420926)))))

(assert (=> d!113437 (= lt!421104 (insertStrictlySorted!313 (toList!5992 lt!420931) (_1!6638 lt!420926) (_2!6638 lt!420926)))))

(assert (=> d!113437 (= (+!2817 lt!420931 lt!420926) lt!421103)))

(declare-fun b!934910 () Bool)

(declare-fun res!629419 () Bool)

(assert (=> b!934910 (=> (not res!629419) (not e!525030))))

(assert (=> b!934910 (= res!629419 (= (getValueByKey!477 (toList!5992 lt!421103) (_1!6638 lt!420926)) (Some!482 (_2!6638 lt!420926))))))

(declare-fun b!934911 () Bool)

(assert (=> b!934911 (= e!525030 (contains!5060 (toList!5992 lt!421103) lt!420926))))

(assert (= (and d!113437 res!629420) b!934910))

(assert (= (and b!934910 res!629419) b!934911))

(declare-fun m!869549 () Bool)

(assert (=> d!113437 m!869549))

(declare-fun m!869551 () Bool)

(assert (=> d!113437 m!869551))

(declare-fun m!869553 () Bool)

(assert (=> d!113437 m!869553))

(declare-fun m!869555 () Bool)

(assert (=> d!113437 m!869555))

(declare-fun m!869557 () Bool)

(assert (=> b!934910 m!869557))

(declare-fun m!869559 () Bool)

(assert (=> b!934911 m!869559))

(assert (=> b!934677 d!113437))

(declare-fun d!113439 () Bool)

(assert (=> d!113439 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19035)))

(declare-fun lt!421109 () Unit!31504)

(declare-fun choose!39 (array!56253 (_ BitVec 32) (_ BitVec 32)) Unit!31504)

(assert (=> d!113439 (= lt!421109 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113439 (bvslt (size!27526 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113439 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!421109)))

(declare-fun bs!26241 () Bool)

(assert (= bs!26241 d!113439))

(assert (=> bs!26241 m!869255))

(declare-fun m!869561 () Bool)

(assert (=> bs!26241 m!869561))

(assert (=> b!934677 d!113439))

(declare-fun d!113441 () Bool)

(declare-fun get!14268 (Option!483) V!31807)

(assert (=> d!113441 (= (apply!816 lt!420931 k0!1099) (get!14268 (getValueByKey!477 (toList!5992 lt!420931) k0!1099)))))

(declare-fun bs!26242 () Bool)

(assert (= bs!26242 d!113441))

(declare-fun m!869563 () Bool)

(assert (=> bs!26242 m!869563))

(assert (=> bs!26242 m!869563))

(declare-fun m!869565 () Bool)

(assert (=> bs!26242 m!869565))

(assert (=> b!934666 d!113441))

(declare-fun d!113443 () Bool)

(assert (=> d!113443 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79604 d!113443))

(declare-fun d!113445 () Bool)

(assert (=> d!113445 (= (array_inv!21150 _values!1231) (bvsge (size!27527 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79604 d!113445))

(declare-fun d!113447 () Bool)

(assert (=> d!113447 (= (array_inv!21151 _keys!1487) (bvsge (size!27526 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79604 d!113447))

(declare-fun d!113449 () Bool)

(declare-fun res!629425 () Bool)

(declare-fun e!525035 () Bool)

(assert (=> d!113449 (=> res!629425 e!525035)))

(assert (=> d!113449 (= res!629425 (= (select (arr!27066 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113449 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!525035)))

(declare-fun b!934916 () Bool)

(declare-fun e!525036 () Bool)

(assert (=> b!934916 (= e!525035 e!525036)))

(declare-fun res!629426 () Bool)

(assert (=> b!934916 (=> (not res!629426) (not e!525036))))

(assert (=> b!934916 (= res!629426 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27526 _keys!1487)))))

(declare-fun b!934917 () Bool)

(assert (=> b!934917 (= e!525036 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113449 (not res!629425)) b!934916))

(assert (= (and b!934916 res!629426) b!934917))

(declare-fun m!869567 () Bool)

(assert (=> d!113449 m!869567))

(declare-fun m!869569 () Bool)

(assert (=> b!934917 m!869569))

(assert (=> b!934670 d!113449))

(declare-fun d!113451 () Bool)

(declare-fun e!525038 () Bool)

(assert (=> d!113451 e!525038))

(declare-fun res!629427 () Bool)

(assert (=> d!113451 (=> res!629427 e!525038)))

(declare-fun lt!421111 () Bool)

(assert (=> d!113451 (= res!629427 (not lt!421111))))

(declare-fun lt!421110 () Bool)

(assert (=> d!113451 (= lt!421111 lt!421110)))

(declare-fun lt!421113 () Unit!31504)

(declare-fun e!525037 () Unit!31504)

(assert (=> d!113451 (= lt!421113 e!525037)))

(declare-fun c!97404 () Bool)

(assert (=> d!113451 (= c!97404 lt!421110)))

(assert (=> d!113451 (= lt!421110 (containsKey!448 (toList!5992 lt!420931) k0!1099))))

(assert (=> d!113451 (= (contains!5056 lt!420931 k0!1099) lt!421111)))

(declare-fun b!934918 () Bool)

(declare-fun lt!421112 () Unit!31504)

(assert (=> b!934918 (= e!525037 lt!421112)))

(assert (=> b!934918 (= lt!421112 (lemmaContainsKeyImpliesGetValueByKeyDefined!342 (toList!5992 lt!420931) k0!1099))))

(assert (=> b!934918 (isDefined!350 (getValueByKey!477 (toList!5992 lt!420931) k0!1099))))

(declare-fun b!934919 () Bool)

(declare-fun Unit!31513 () Unit!31504)

(assert (=> b!934919 (= e!525037 Unit!31513)))

(declare-fun b!934920 () Bool)

(assert (=> b!934920 (= e!525038 (isDefined!350 (getValueByKey!477 (toList!5992 lt!420931) k0!1099)))))

(assert (= (and d!113451 c!97404) b!934918))

(assert (= (and d!113451 (not c!97404)) b!934919))

(assert (= (and d!113451 (not res!629427)) b!934920))

(declare-fun m!869571 () Bool)

(assert (=> d!113451 m!869571))

(declare-fun m!869573 () Bool)

(assert (=> b!934918 m!869573))

(assert (=> b!934918 m!869563))

(assert (=> b!934918 m!869563))

(declare-fun m!869575 () Bool)

(assert (=> b!934918 m!869575))

(assert (=> b!934920 m!869563))

(assert (=> b!934920 m!869563))

(assert (=> b!934920 m!869575))

(assert (=> b!934669 d!113451))

(declare-fun c!97406 () Bool)

(declare-fun call!40670 () ListLongMap!11953)

(declare-fun call!40669 () ListLongMap!11953)

(declare-fun c!97409 () Bool)

(declare-fun call!40674 () ListLongMap!11953)

(declare-fun call!40672 () ListLongMap!11953)

(declare-fun bm!40665 () Bool)

(assert (=> bm!40665 (= call!40670 (+!2817 (ite c!97406 call!40674 (ite c!97409 call!40669 call!40672)) (ite (or c!97406 c!97409) (tuple2!13255 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13255 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!934922 () Bool)

(declare-fun e!525051 () ListLongMap!11953)

(assert (=> b!934922 (= e!525051 call!40672)))

(declare-fun b!934923 () Bool)

(declare-fun e!525046 () Bool)

(declare-fun call!40668 () Bool)

(assert (=> b!934923 (= e!525046 (not call!40668))))

(declare-fun lt!421131 () ListLongMap!11953)

(declare-fun e!525043 () Bool)

(declare-fun b!934924 () Bool)

(assert (=> b!934924 (= e!525043 (= (apply!816 lt!421131 (select (arr!27066 _keys!1487) from!1844)) (get!14263 (select (arr!27067 _values!1231) from!1844) (dynLambda!1614 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934924 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27527 _values!1231)))))

(assert (=> b!934924 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27526 _keys!1487)))))

(declare-fun bm!40666 () Bool)

(declare-fun call!40673 () Bool)

(assert (=> bm!40666 (= call!40673 (contains!5056 lt!421131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934925 () Bool)

(declare-fun e!525047 () Bool)

(assert (=> b!934925 (= e!525047 (= (apply!816 lt!421131 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!934926 () Bool)

(declare-fun e!525044 () Bool)

(declare-fun e!525049 () Bool)

(assert (=> b!934926 (= e!525044 e!525049)))

(declare-fun res!629435 () Bool)

(assert (=> b!934926 (= res!629435 call!40673)))

(assert (=> b!934926 (=> (not res!629435) (not e!525049))))

(declare-fun bm!40667 () Bool)

(assert (=> bm!40667 (= call!40672 call!40669)))

(declare-fun b!934927 () Bool)

(declare-fun e!525045 () ListLongMap!11953)

(declare-fun e!525041 () ListLongMap!11953)

(assert (=> b!934927 (= e!525045 e!525041)))

(assert (=> b!934927 (= c!97409 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934928 () Bool)

(assert (=> b!934928 (= e!525045 (+!2817 call!40670 (tuple2!13255 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!934929 () Bool)

(declare-fun e!525050 () Bool)

(assert (=> b!934929 (= e!525050 e!525043)))

(declare-fun res!629433 () Bool)

(assert (=> b!934929 (=> (not res!629433) (not e!525043))))

(assert (=> b!934929 (= res!629433 (contains!5056 lt!421131 (select (arr!27066 _keys!1487) from!1844)))))

(assert (=> b!934929 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27526 _keys!1487)))))

(declare-fun b!934930 () Bool)

(declare-fun res!629434 () Bool)

(declare-fun e!525040 () Bool)

(assert (=> b!934930 (=> (not res!629434) (not e!525040))))

(assert (=> b!934930 (= res!629434 e!525050)))

(declare-fun res!629430 () Bool)

(assert (=> b!934930 (=> res!629430 e!525050)))

(declare-fun e!525042 () Bool)

(assert (=> b!934930 (= res!629430 (not e!525042))))

(declare-fun res!629428 () Bool)

(assert (=> b!934930 (=> (not res!629428) (not e!525042))))

(assert (=> b!934930 (= res!629428 (bvslt from!1844 (size!27526 _keys!1487)))))

(declare-fun b!934931 () Bool)

(declare-fun e!525039 () Unit!31504)

(declare-fun lt!421116 () Unit!31504)

(assert (=> b!934931 (= e!525039 lt!421116)))

(declare-fun lt!421118 () ListLongMap!11953)

(assert (=> b!934931 (= lt!421118 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421119 () (_ BitVec 64))

(assert (=> b!934931 (= lt!421119 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421135 () (_ BitVec 64))

(assert (=> b!934931 (= lt!421135 (select (arr!27066 _keys!1487) from!1844))))

(declare-fun lt!421132 () Unit!31504)

(assert (=> b!934931 (= lt!421132 (addStillContains!520 lt!421118 lt!421119 zeroValue!1173 lt!421135))))

(assert (=> b!934931 (contains!5056 (+!2817 lt!421118 (tuple2!13255 lt!421119 zeroValue!1173)) lt!421135)))

(declare-fun lt!421128 () Unit!31504)

(assert (=> b!934931 (= lt!421128 lt!421132)))

(declare-fun lt!421130 () ListLongMap!11953)

(assert (=> b!934931 (= lt!421130 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421117 () (_ BitVec 64))

(assert (=> b!934931 (= lt!421117 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421126 () (_ BitVec 64))

(assert (=> b!934931 (= lt!421126 (select (arr!27066 _keys!1487) from!1844))))

(declare-fun lt!421129 () Unit!31504)

(assert (=> b!934931 (= lt!421129 (addApplyDifferent!417 lt!421130 lt!421117 minValue!1173 lt!421126))))

(assert (=> b!934931 (= (apply!816 (+!2817 lt!421130 (tuple2!13255 lt!421117 minValue!1173)) lt!421126) (apply!816 lt!421130 lt!421126))))

(declare-fun lt!421123 () Unit!31504)

(assert (=> b!934931 (= lt!421123 lt!421129)))

(declare-fun lt!421115 () ListLongMap!11953)

(assert (=> b!934931 (= lt!421115 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421120 () (_ BitVec 64))

(assert (=> b!934931 (= lt!421120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421121 () (_ BitVec 64))

(assert (=> b!934931 (= lt!421121 (select (arr!27066 _keys!1487) from!1844))))

(declare-fun lt!421127 () Unit!31504)

(assert (=> b!934931 (= lt!421127 (addApplyDifferent!417 lt!421115 lt!421120 zeroValue!1173 lt!421121))))

(assert (=> b!934931 (= (apply!816 (+!2817 lt!421115 (tuple2!13255 lt!421120 zeroValue!1173)) lt!421121) (apply!816 lt!421115 lt!421121))))

(declare-fun lt!421133 () Unit!31504)

(assert (=> b!934931 (= lt!421133 lt!421127)))

(declare-fun lt!421124 () ListLongMap!11953)

(assert (=> b!934931 (= lt!421124 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421114 () (_ BitVec 64))

(assert (=> b!934931 (= lt!421114 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421125 () (_ BitVec 64))

(assert (=> b!934931 (= lt!421125 (select (arr!27066 _keys!1487) from!1844))))

(assert (=> b!934931 (= lt!421116 (addApplyDifferent!417 lt!421124 lt!421114 minValue!1173 lt!421125))))

(assert (=> b!934931 (= (apply!816 (+!2817 lt!421124 (tuple2!13255 lt!421114 minValue!1173)) lt!421125) (apply!816 lt!421124 lt!421125))))

(declare-fun b!934932 () Bool)

(assert (=> b!934932 (= e!525044 (not call!40673))))

(declare-fun d!113453 () Bool)

(assert (=> d!113453 e!525040))

(declare-fun res!629432 () Bool)

(assert (=> d!113453 (=> (not res!629432) (not e!525040))))

(assert (=> d!113453 (= res!629432 (or (bvsge from!1844 (size!27526 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27526 _keys!1487)))))))

(declare-fun lt!421122 () ListLongMap!11953)

(assert (=> d!113453 (= lt!421131 lt!421122)))

(declare-fun lt!421134 () Unit!31504)

(assert (=> d!113453 (= lt!421134 e!525039)))

(declare-fun c!97410 () Bool)

(declare-fun e!525048 () Bool)

(assert (=> d!113453 (= c!97410 e!525048)))

(declare-fun res!629429 () Bool)

(assert (=> d!113453 (=> (not res!629429) (not e!525048))))

(assert (=> d!113453 (= res!629429 (bvslt from!1844 (size!27526 _keys!1487)))))

(assert (=> d!113453 (= lt!421122 e!525045)))

(assert (=> d!113453 (= c!97406 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113453 (validMask!0 mask!1881)))

(assert (=> d!113453 (= (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!421131)))

(declare-fun b!934921 () Bool)

(declare-fun Unit!31514 () Unit!31504)

(assert (=> b!934921 (= e!525039 Unit!31514)))

(declare-fun b!934933 () Bool)

(assert (=> b!934933 (= e!525049 (= (apply!816 lt!421131 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!934934 () Bool)

(assert (=> b!934934 (= e!525046 e!525047)))

(declare-fun res!629431 () Bool)

(assert (=> b!934934 (= res!629431 call!40668)))

(assert (=> b!934934 (=> (not res!629431) (not e!525047))))

(declare-fun b!934935 () Bool)

(assert (=> b!934935 (= e!525048 (validKeyInArray!0 (select (arr!27066 _keys!1487) from!1844)))))

(declare-fun b!934936 () Bool)

(assert (=> b!934936 (= e!525042 (validKeyInArray!0 (select (arr!27066 _keys!1487) from!1844)))))

(declare-fun bm!40668 () Bool)

(declare-fun call!40671 () ListLongMap!11953)

(assert (=> bm!40668 (= call!40671 call!40670)))

(declare-fun b!934937 () Bool)

(assert (=> b!934937 (= e!525040 e!525046)))

(declare-fun c!97405 () Bool)

(assert (=> b!934937 (= c!97405 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934938 () Bool)

(assert (=> b!934938 (= e!525051 call!40671)))

(declare-fun bm!40669 () Bool)

(assert (=> bm!40669 (= call!40669 call!40674)))

(declare-fun b!934939 () Bool)

(assert (=> b!934939 (= e!525041 call!40671)))

(declare-fun bm!40670 () Bool)

(assert (=> bm!40670 (= call!40674 (getCurrentListMapNoExtraKeys!3343 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934940 () Bool)

(declare-fun res!629436 () Bool)

(assert (=> b!934940 (=> (not res!629436) (not e!525040))))

(assert (=> b!934940 (= res!629436 e!525044)))

(declare-fun c!97408 () Bool)

(assert (=> b!934940 (= c!97408 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!934941 () Bool)

(declare-fun c!97407 () Bool)

(assert (=> b!934941 (= c!97407 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!934941 (= e!525041 e!525051)))

(declare-fun bm!40671 () Bool)

(assert (=> bm!40671 (= call!40668 (contains!5056 lt!421131 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113453 c!97406) b!934928))

(assert (= (and d!113453 (not c!97406)) b!934927))

(assert (= (and b!934927 c!97409) b!934939))

(assert (= (and b!934927 (not c!97409)) b!934941))

(assert (= (and b!934941 c!97407) b!934938))

(assert (= (and b!934941 (not c!97407)) b!934922))

(assert (= (or b!934938 b!934922) bm!40667))

(assert (= (or b!934939 bm!40667) bm!40669))

(assert (= (or b!934939 b!934938) bm!40668))

(assert (= (or b!934928 bm!40669) bm!40670))

(assert (= (or b!934928 bm!40668) bm!40665))

(assert (= (and d!113453 res!629429) b!934935))

(assert (= (and d!113453 c!97410) b!934931))

(assert (= (and d!113453 (not c!97410)) b!934921))

(assert (= (and d!113453 res!629432) b!934930))

(assert (= (and b!934930 res!629428) b!934936))

(assert (= (and b!934930 (not res!629430)) b!934929))

(assert (= (and b!934929 res!629433) b!934924))

(assert (= (and b!934930 res!629434) b!934940))

(assert (= (and b!934940 c!97408) b!934926))

(assert (= (and b!934940 (not c!97408)) b!934932))

(assert (= (and b!934926 res!629435) b!934933))

(assert (= (or b!934926 b!934932) bm!40666))

(assert (= (and b!934940 res!629436) b!934937))

(assert (= (and b!934937 c!97405) b!934934))

(assert (= (and b!934937 (not c!97405)) b!934923))

(assert (= (and b!934934 res!629431) b!934925))

(assert (= (or b!934934 b!934923) bm!40671))

(declare-fun b_lambda!13985 () Bool)

(assert (=> (not b_lambda!13985) (not b!934924)))

(assert (=> b!934924 t!27195))

(declare-fun b_and!28833 () Bool)

(assert (= b_and!28831 (and (=> t!27195 result!11851) b_and!28833)))

(assert (=> d!113453 m!869265))

(declare-fun m!869577 () Bool)

(assert (=> b!934933 m!869577))

(declare-fun m!869579 () Bool)

(assert (=> b!934928 m!869579))

(declare-fun m!869581 () Bool)

(assert (=> b!934931 m!869581))

(declare-fun m!869583 () Bool)

(assert (=> b!934931 m!869583))

(declare-fun m!869585 () Bool)

(assert (=> b!934931 m!869585))

(declare-fun m!869587 () Bool)

(assert (=> b!934931 m!869587))

(declare-fun m!869589 () Bool)

(assert (=> b!934931 m!869589))

(declare-fun m!869591 () Bool)

(assert (=> b!934931 m!869591))

(declare-fun m!869593 () Bool)

(assert (=> b!934931 m!869593))

(assert (=> b!934931 m!869585))

(declare-fun m!869595 () Bool)

(assert (=> b!934931 m!869595))

(declare-fun m!869597 () Bool)

(assert (=> b!934931 m!869597))

(assert (=> b!934931 m!869567))

(assert (=> b!934931 m!869595))

(declare-fun m!869599 () Bool)

(assert (=> b!934931 m!869599))

(declare-fun m!869601 () Bool)

(assert (=> b!934931 m!869601))

(declare-fun m!869603 () Bool)

(assert (=> b!934931 m!869603))

(declare-fun m!869605 () Bool)

(assert (=> b!934931 m!869605))

(declare-fun m!869607 () Bool)

(assert (=> b!934931 m!869607))

(declare-fun m!869609 () Bool)

(assert (=> b!934931 m!869609))

(assert (=> b!934931 m!869603))

(declare-fun m!869611 () Bool)

(assert (=> b!934931 m!869611))

(assert (=> b!934931 m!869607))

(declare-fun m!869613 () Bool)

(assert (=> bm!40665 m!869613))

(assert (=> b!934929 m!869567))

(assert (=> b!934929 m!869567))

(declare-fun m!869615 () Bool)

(assert (=> b!934929 m!869615))

(assert (=> b!934936 m!869567))

(assert (=> b!934936 m!869567))

(declare-fun m!869617 () Bool)

(assert (=> b!934936 m!869617))

(declare-fun m!869619 () Bool)

(assert (=> b!934925 m!869619))

(assert (=> b!934924 m!869567))

(declare-fun m!869621 () Bool)

(assert (=> b!934924 m!869621))

(declare-fun m!869623 () Bool)

(assert (=> b!934924 m!869623))

(assert (=> b!934924 m!869245))

(declare-fun m!869625 () Bool)

(assert (=> b!934924 m!869625))

(assert (=> b!934924 m!869245))

(assert (=> b!934924 m!869567))

(assert (=> b!934924 m!869623))

(assert (=> bm!40670 m!869591))

(declare-fun m!869627 () Bool)

(assert (=> bm!40666 m!869627))

(declare-fun m!869629 () Bool)

(assert (=> bm!40671 m!869629))

(assert (=> b!934935 m!869567))

(assert (=> b!934935 m!869567))

(assert (=> b!934935 m!869617))

(assert (=> b!934669 d!113453))

(declare-fun b!934950 () Bool)

(declare-fun e!525060 () Bool)

(declare-fun e!525059 () Bool)

(assert (=> b!934950 (= e!525060 e!525059)))

(declare-fun lt!421143 () (_ BitVec 64))

(assert (=> b!934950 (= lt!421143 (select (arr!27066 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!421144 () Unit!31504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56253 (_ BitVec 64) (_ BitVec 32)) Unit!31504)

(assert (=> b!934950 (= lt!421144 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!421143 #b00000000000000000000000000000000))))

(assert (=> b!934950 (arrayContainsKey!0 _keys!1487 lt!421143 #b00000000000000000000000000000000)))

(declare-fun lt!421142 () Unit!31504)

(assert (=> b!934950 (= lt!421142 lt!421144)))

(declare-fun res!629442 () Bool)

(declare-datatypes ((SeekEntryResult!8931 0))(
  ( (MissingZero!8931 (index!38095 (_ BitVec 32))) (Found!8931 (index!38096 (_ BitVec 32))) (Intermediate!8931 (undefined!9743 Bool) (index!38097 (_ BitVec 32)) (x!80062 (_ BitVec 32))) (Undefined!8931) (MissingVacant!8931 (index!38098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56253 (_ BitVec 32)) SeekEntryResult!8931)

(assert (=> b!934950 (= res!629442 (= (seekEntryOrOpen!0 (select (arr!27066 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8931 #b00000000000000000000000000000000)))))

(assert (=> b!934950 (=> (not res!629442) (not e!525059))))

(declare-fun d!113455 () Bool)

(declare-fun res!629441 () Bool)

(declare-fun e!525058 () Bool)

(assert (=> d!113455 (=> res!629441 e!525058)))

(assert (=> d!113455 (= res!629441 (bvsge #b00000000000000000000000000000000 (size!27526 _keys!1487)))))

(assert (=> d!113455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!525058)))

(declare-fun b!934951 () Bool)

(declare-fun call!40677 () Bool)

(assert (=> b!934951 (= e!525059 call!40677)))

(declare-fun b!934952 () Bool)

(assert (=> b!934952 (= e!525058 e!525060)))

(declare-fun c!97413 () Bool)

(assert (=> b!934952 (= c!97413 (validKeyInArray!0 (select (arr!27066 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!934953 () Bool)

(assert (=> b!934953 (= e!525060 call!40677)))

(declare-fun bm!40674 () Bool)

(assert (=> bm!40674 (= call!40677 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!113455 (not res!629441)) b!934952))

(assert (= (and b!934952 c!97413) b!934950))

(assert (= (and b!934952 (not c!97413)) b!934953))

(assert (= (and b!934950 res!629442) b!934951))

(assert (= (or b!934951 b!934953) bm!40674))

(assert (=> b!934950 m!869393))

(declare-fun m!869631 () Bool)

(assert (=> b!934950 m!869631))

(declare-fun m!869633 () Bool)

(assert (=> b!934950 m!869633))

(assert (=> b!934950 m!869393))

(declare-fun m!869635 () Bool)

(assert (=> b!934950 m!869635))

(assert (=> b!934952 m!869393))

(assert (=> b!934952 m!869393))

(assert (=> b!934952 m!869395))

(declare-fun m!869637 () Bool)

(assert (=> bm!40674 m!869637))

(assert (=> b!934664 d!113455))

(declare-fun d!113457 () Bool)

(assert (=> d!113457 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934674 d!113457))

(declare-fun b!934960 () Bool)

(declare-fun e!525066 () Bool)

(assert (=> b!934960 (= e!525066 tp_is_empty!20131)))

(declare-fun b!934961 () Bool)

(declare-fun e!525065 () Bool)

(assert (=> b!934961 (= e!525065 tp_is_empty!20131)))

(declare-fun condMapEmpty!31965 () Bool)

(declare-fun mapDefault!31965 () ValueCell!9584)

(assert (=> mapNonEmpty!31956 (= condMapEmpty!31965 (= mapRest!31956 ((as const (Array (_ BitVec 32) ValueCell!9584)) mapDefault!31965)))))

(declare-fun mapRes!31965 () Bool)

(assert (=> mapNonEmpty!31956 (= tp!61314 (and e!525065 mapRes!31965))))

(declare-fun mapNonEmpty!31965 () Bool)

(declare-fun tp!61329 () Bool)

(assert (=> mapNonEmpty!31965 (= mapRes!31965 (and tp!61329 e!525066))))

(declare-fun mapValue!31965 () ValueCell!9584)

(declare-fun mapRest!31965 () (Array (_ BitVec 32) ValueCell!9584))

(declare-fun mapKey!31965 () (_ BitVec 32))

(assert (=> mapNonEmpty!31965 (= mapRest!31956 (store mapRest!31965 mapKey!31965 mapValue!31965))))

(declare-fun mapIsEmpty!31965 () Bool)

(assert (=> mapIsEmpty!31965 mapRes!31965))

(assert (= (and mapNonEmpty!31956 condMapEmpty!31965) mapIsEmpty!31965))

(assert (= (and mapNonEmpty!31956 (not condMapEmpty!31965)) mapNonEmpty!31965))

(assert (= (and mapNonEmpty!31965 ((_ is ValueCellFull!9584) mapValue!31965)) b!934960))

(assert (= (and mapNonEmpty!31956 ((_ is ValueCellFull!9584) mapDefault!31965)) b!934961))

(declare-fun m!869639 () Bool)

(assert (=> mapNonEmpty!31965 m!869639))

(declare-fun b_lambda!13987 () Bool)

(assert (= b_lambda!13985 (or (and start!79604 b_free!17623) b_lambda!13987)))

(declare-fun b_lambda!13989 () Bool)

(assert (= b_lambda!13983 (or (and start!79604 b_free!17623) b_lambda!13989)))

(declare-fun b_lambda!13991 () Bool)

(assert (= b_lambda!13981 (or (and start!79604 b_free!17623) b_lambda!13991)))

(declare-fun b_lambda!13993 () Bool)

(assert (= b_lambda!13979 (or (and start!79604 b_free!17623) b_lambda!13993)))

(check-sat (not bm!40670) (not b_lambda!13987) (not b!934869) (not b!934882) (not bm!40665) (not bm!40664) (not b!934918) (not b!934936) (not b!934925) (not b!934842) (not b!934852) (not bm!40666) (not d!113441) (not b!934874) (not bm!40671) (not b!934848) (not b!934866) (not b!934787) (not b!934794) (not bm!40657) (not b!934885) (not b!934952) (not bm!40663) (not bm!40658) (not bm!40674) (not b!934929) (not b!934935) (not b_lambda!13977) (not b!934785) (not b!934892) (not b!934908) (not b_lambda!13991) (not b_next!17623) (not b!934795) (not b!934917) (not b!934789) (not bm!40651) (not b!934933) (not d!113431) (not b!934909) (not d!113433) (not b!934871) (not b!934845) (not mapNonEmpty!31965) (not b_lambda!13989) (not b!934928) (not b!934903) (not d!113425) b_and!28833 (not d!113423) (not d!113421) (not b!934863) (not b!934862) (not b!934920) (not bm!40635) (not b!934911) (not b!934841) (not b!934867) (not b!934901) (not b!934846) (not b!934883) (not b!934910) (not b!934850) (not d!113437) (not b!934931) (not bm!40655) tp_is_empty!20131 (not d!113451) (not bm!40650) (not bm!40662) (not d!113429) (not d!113439) (not b!934924) (not b!934887) (not b!934950) (not b!934873) (not d!113419) (not bm!40656) (not b!934853) (not d!113453) (not b_lambda!13993))
(check-sat b_and!28833 (not b_next!17623))
