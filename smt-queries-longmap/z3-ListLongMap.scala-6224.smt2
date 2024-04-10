; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79582 () Bool)

(assert start!79582)

(declare-fun b_free!17667 () Bool)

(declare-fun b_next!17667 () Bool)

(assert (=> start!79582 (= b_free!17667 (not b_next!17667))))

(declare-fun tp!61453 () Bool)

(declare-fun b_and!28917 () Bool)

(assert (=> start!79582 (= tp!61453 b_and!28917)))

(declare-fun b!935432 () Bool)

(declare-fun res!629938 () Bool)

(declare-fun e!525256 () Bool)

(assert (=> b!935432 (=> (not res!629938) (not e!525256))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!935432 (= res!629938 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935433 () Bool)

(declare-fun res!629945 () Bool)

(declare-fun e!525259 () Bool)

(assert (=> b!935433 (=> (not res!629945) (not e!525259))))

(declare-datatypes ((array!56292 0))(
  ( (array!56293 (arr!27087 (Array (_ BitVec 32) (_ BitVec 64))) (size!27546 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56292)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56292 (_ BitVec 32)) Bool)

(assert (=> b!935433 (= res!629945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935434 () Bool)

(declare-fun e!525258 () Bool)

(declare-fun e!525255 () Bool)

(assert (=> b!935434 (= e!525258 (not e!525255))))

(declare-fun res!629934 () Bool)

(assert (=> b!935434 (=> res!629934 e!525255)))

(assert (=> b!935434 (= res!629934 (or (bvsge (size!27546 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27546 _keys!1487))))))

(declare-fun e!525257 () Bool)

(assert (=> b!935434 e!525257))

(declare-fun c!97285 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!935434 (= c!97285 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((V!31865 0))(
  ( (V!31866 (val!10138 Int)) )
))
(declare-datatypes ((ValueCell!9606 0))(
  ( (ValueCellFull!9606 (v!12661 V!31865)) (EmptyCell!9606) )
))
(declare-datatypes ((array!56294 0))(
  ( (array!56295 (arr!27088 (Array (_ BitVec 32) ValueCell!9606)) (size!27547 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56294)

(declare-datatypes ((Unit!31554 0))(
  ( (Unit!31555) )
))
(declare-fun lt!421597 () Unit!31554)

(declare-fun zeroValue!1173 () V!31865)

(declare-fun minValue!1173 () V!31865)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!284 (array!56292 array!56294 (_ BitVec 32) (_ BitVec 32) V!31865 V!31865 (_ BitVec 64) (_ BitVec 32) Int) Unit!31554)

(assert (=> b!935434 (= lt!421597 (lemmaListMapContainsThenArrayContainsFrom!284 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19086 0))(
  ( (Nil!19083) (Cons!19082 (h!20228 (_ BitVec 64)) (t!27297 List!19086)) )
))
(declare-fun arrayNoDuplicates!0 (array!56292 (_ BitVec 32) List!19086) Bool)

(assert (=> b!935434 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19083)))

(declare-fun lt!421595 () Unit!31554)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56292 (_ BitVec 32) (_ BitVec 32)) Unit!31554)

(assert (=> b!935434 (= lt!421595 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13306 0))(
  ( (tuple2!13307 (_1!6664 (_ BitVec 64)) (_2!6664 V!31865)) )
))
(declare-datatypes ((List!19087 0))(
  ( (Nil!19084) (Cons!19083 (h!20229 tuple2!13306) (t!27298 List!19087)) )
))
(declare-datatypes ((ListLongMap!12003 0))(
  ( (ListLongMap!12004 (toList!6017 List!19087)) )
))
(declare-fun lt!421596 () ListLongMap!12003)

(declare-fun lt!421598 () tuple2!13306)

(declare-fun contains!5073 (ListLongMap!12003 (_ BitVec 64)) Bool)

(declare-fun +!2812 (ListLongMap!12003 tuple2!13306) ListLongMap!12003)

(assert (=> b!935434 (contains!5073 (+!2812 lt!421596 lt!421598) k0!1099)))

(declare-fun lt!421593 () (_ BitVec 64))

(declare-fun lt!421591 () V!31865)

(declare-fun lt!421592 () Unit!31554)

(declare-fun addStillContains!531 (ListLongMap!12003 (_ BitVec 64) V!31865 (_ BitVec 64)) Unit!31554)

(assert (=> b!935434 (= lt!421592 (addStillContains!531 lt!421596 lt!421593 lt!421591 k0!1099))))

(declare-fun lt!421599 () (_ BitVec 32))

(declare-fun getCurrentListMap!3254 (array!56292 array!56294 (_ BitVec 32) (_ BitVec 32) V!31865 V!31865 (_ BitVec 32) Int) ListLongMap!12003)

(assert (=> b!935434 (= (getCurrentListMap!3254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2812 (getCurrentListMap!3254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421599 defaultEntry!1235) lt!421598))))

(assert (=> b!935434 (= lt!421598 (tuple2!13307 lt!421593 lt!421591))))

(declare-fun get!14269 (ValueCell!9606 V!31865) V!31865)

(declare-fun dynLambda!1601 (Int (_ BitVec 64)) V!31865)

(assert (=> b!935434 (= lt!421591 (get!14269 (select (arr!27088 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1601 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!935434 (= lt!421599 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421594 () Unit!31554)

(declare-fun lemmaListMapRecursiveValidKeyArray!202 (array!56292 array!56294 (_ BitVec 32) (_ BitVec 32) V!31865 V!31865 (_ BitVec 32) Int) Unit!31554)

(assert (=> b!935434 (= lt!421594 (lemmaListMapRecursiveValidKeyArray!202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935435 () Bool)

(declare-fun arrayContainsKey!0 (array!56292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935435 (= e!525255 (arrayContainsKey!0 _keys!1487 k0!1099 lt!421599))))

(declare-fun res!629933 () Bool)

(assert (=> start!79582 (=> (not res!629933) (not e!525259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79582 (= res!629933 (validMask!0 mask!1881))))

(assert (=> start!79582 e!525259))

(assert (=> start!79582 true))

(declare-fun tp_is_empty!20175 () Bool)

(assert (=> start!79582 tp_is_empty!20175))

(declare-fun e!525262 () Bool)

(declare-fun array_inv!21080 (array!56294) Bool)

(assert (=> start!79582 (and (array_inv!21080 _values!1231) e!525262)))

(assert (=> start!79582 tp!61453))

(declare-fun array_inv!21081 (array!56292) Bool)

(assert (=> start!79582 (array_inv!21081 _keys!1487)))

(declare-fun b!935436 () Bool)

(declare-fun e!525260 () Bool)

(assert (=> b!935436 (= e!525260 tp_is_empty!20175)))

(declare-fun b!935437 () Bool)

(declare-fun res!629946 () Bool)

(assert (=> b!935437 (=> (not res!629946) (not e!525256))))

(declare-fun v!791 () V!31865)

(declare-fun apply!819 (ListLongMap!12003 (_ BitVec 64)) V!31865)

(assert (=> b!935437 (= res!629946 (= (apply!819 lt!421596 k0!1099) v!791))))

(declare-fun b!935438 () Bool)

(declare-fun res!629941 () Bool)

(assert (=> b!935438 (=> (not res!629941) (not e!525259))))

(assert (=> b!935438 (= res!629941 (and (= (size!27547 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27546 _keys!1487) (size!27547 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935439 () Bool)

(declare-fun res!629943 () Bool)

(assert (=> b!935439 (=> (not res!629943) (not e!525259))))

(assert (=> b!935439 (= res!629943 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19083))))

(declare-fun b!935440 () Bool)

(assert (=> b!935440 (= e!525256 e!525258)))

(declare-fun res!629937 () Bool)

(assert (=> b!935440 (=> (not res!629937) (not e!525258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935440 (= res!629937 (validKeyInArray!0 lt!421593))))

(assert (=> b!935440 (= lt!421593 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935441 () Bool)

(declare-fun res!629939 () Bool)

(assert (=> b!935441 (=> res!629939 e!525255)))

(declare-fun noDuplicate!1354 (List!19086) Bool)

(assert (=> b!935441 (= res!629939 (not (noDuplicate!1354 Nil!19083)))))

(declare-fun b!935442 () Bool)

(declare-fun res!629936 () Bool)

(assert (=> b!935442 (=> res!629936 e!525255)))

(declare-fun contains!5074 (List!19086 (_ BitVec 64)) Bool)

(assert (=> b!935442 (= res!629936 (contains!5074 Nil!19083 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935443 () Bool)

(declare-fun res!629944 () Bool)

(assert (=> b!935443 (=> (not res!629944) (not e!525259))))

(assert (=> b!935443 (= res!629944 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27546 _keys!1487))))))

(declare-fun b!935444 () Bool)

(assert (=> b!935444 (= e!525257 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935445 () Bool)

(declare-fun e!525261 () Bool)

(assert (=> b!935445 (= e!525261 tp_is_empty!20175)))

(declare-fun b!935446 () Bool)

(declare-fun res!629940 () Bool)

(assert (=> b!935446 (=> (not res!629940) (not e!525256))))

(assert (=> b!935446 (= res!629940 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!32031 () Bool)

(declare-fun mapRes!32031 () Bool)

(assert (=> mapIsEmpty!32031 mapRes!32031))

(declare-fun mapNonEmpty!32031 () Bool)

(declare-fun tp!61454 () Bool)

(assert (=> mapNonEmpty!32031 (= mapRes!32031 (and tp!61454 e!525261))))

(declare-fun mapValue!32031 () ValueCell!9606)

(declare-fun mapRest!32031 () (Array (_ BitVec 32) ValueCell!9606))

(declare-fun mapKey!32031 () (_ BitVec 32))

(assert (=> mapNonEmpty!32031 (= (arr!27088 _values!1231) (store mapRest!32031 mapKey!32031 mapValue!32031))))

(declare-fun b!935447 () Bool)

(declare-fun res!629942 () Bool)

(assert (=> b!935447 (=> res!629942 e!525255)))

(assert (=> b!935447 (= res!629942 (contains!5074 Nil!19083 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935448 () Bool)

(assert (=> b!935448 (= e!525259 e!525256)))

(declare-fun res!629935 () Bool)

(assert (=> b!935448 (=> (not res!629935) (not e!525256))))

(assert (=> b!935448 (= res!629935 (contains!5073 lt!421596 k0!1099))))

(assert (=> b!935448 (= lt!421596 (getCurrentListMap!3254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935449 () Bool)

(assert (=> b!935449 (= e!525262 (and e!525260 mapRes!32031))))

(declare-fun condMapEmpty!32031 () Bool)

(declare-fun mapDefault!32031 () ValueCell!9606)

(assert (=> b!935449 (= condMapEmpty!32031 (= (arr!27088 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9606)) mapDefault!32031)))))

(declare-fun b!935450 () Bool)

(assert (=> b!935450 (= e!525257 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!79582 res!629933) b!935438))

(assert (= (and b!935438 res!629941) b!935433))

(assert (= (and b!935433 res!629945) b!935439))

(assert (= (and b!935439 res!629943) b!935443))

(assert (= (and b!935443 res!629944) b!935448))

(assert (= (and b!935448 res!629935) b!935437))

(assert (= (and b!935437 res!629946) b!935432))

(assert (= (and b!935432 res!629938) b!935446))

(assert (= (and b!935446 res!629940) b!935440))

(assert (= (and b!935440 res!629937) b!935434))

(assert (= (and b!935434 c!97285) b!935450))

(assert (= (and b!935434 (not c!97285)) b!935444))

(assert (= (and b!935434 (not res!629934)) b!935441))

(assert (= (and b!935441 (not res!629939)) b!935442))

(assert (= (and b!935442 (not res!629936)) b!935447))

(assert (= (and b!935447 (not res!629942)) b!935435))

(assert (= (and b!935449 condMapEmpty!32031) mapIsEmpty!32031))

(assert (= (and b!935449 (not condMapEmpty!32031)) mapNonEmpty!32031))

(get-info :version)

(assert (= (and mapNonEmpty!32031 ((_ is ValueCellFull!9606) mapValue!32031)) b!935445))

(assert (= (and b!935449 ((_ is ValueCellFull!9606) mapDefault!32031)) b!935436))

(assert (= start!79582 b!935449))

(declare-fun b_lambda!14055 () Bool)

(assert (=> (not b_lambda!14055) (not b!935434)))

(declare-fun t!27296 () Bool)

(declare-fun tb!6061 () Bool)

(assert (=> (and start!79582 (= defaultEntry!1235 defaultEntry!1235) t!27296) tb!6061))

(declare-fun result!11953 () Bool)

(assert (=> tb!6061 (= result!11953 tp_is_empty!20175)))

(assert (=> b!935434 t!27296))

(declare-fun b_and!28919 () Bool)

(assert (= b_and!28917 (and (=> t!27296 result!11953) b_and!28919)))

(declare-fun m!869881 () Bool)

(assert (=> b!935448 m!869881))

(declare-fun m!869883 () Bool)

(assert (=> b!935448 m!869883))

(declare-fun m!869885 () Bool)

(assert (=> b!935433 m!869885))

(declare-fun m!869887 () Bool)

(assert (=> b!935446 m!869887))

(declare-fun m!869889 () Bool)

(assert (=> b!935434 m!869889))

(declare-fun m!869891 () Bool)

(assert (=> b!935434 m!869891))

(declare-fun m!869893 () Bool)

(assert (=> b!935434 m!869893))

(declare-fun m!869895 () Bool)

(assert (=> b!935434 m!869895))

(declare-fun m!869897 () Bool)

(assert (=> b!935434 m!869897))

(assert (=> b!935434 m!869893))

(assert (=> b!935434 m!869895))

(declare-fun m!869899 () Bool)

(assert (=> b!935434 m!869899))

(declare-fun m!869901 () Bool)

(assert (=> b!935434 m!869901))

(assert (=> b!935434 m!869889))

(declare-fun m!869903 () Bool)

(assert (=> b!935434 m!869903))

(declare-fun m!869905 () Bool)

(assert (=> b!935434 m!869905))

(declare-fun m!869907 () Bool)

(assert (=> b!935434 m!869907))

(declare-fun m!869909 () Bool)

(assert (=> b!935434 m!869909))

(assert (=> b!935434 m!869897))

(declare-fun m!869911 () Bool)

(assert (=> b!935434 m!869911))

(declare-fun m!869913 () Bool)

(assert (=> b!935434 m!869913))

(declare-fun m!869915 () Bool)

(assert (=> b!935441 m!869915))

(declare-fun m!869917 () Bool)

(assert (=> b!935447 m!869917))

(declare-fun m!869919 () Bool)

(assert (=> b!935435 m!869919))

(declare-fun m!869921 () Bool)

(assert (=> b!935442 m!869921))

(declare-fun m!869923 () Bool)

(assert (=> b!935440 m!869923))

(declare-fun m!869925 () Bool)

(assert (=> b!935440 m!869925))

(declare-fun m!869927 () Bool)

(assert (=> b!935450 m!869927))

(declare-fun m!869929 () Bool)

(assert (=> start!79582 m!869929))

(declare-fun m!869931 () Bool)

(assert (=> start!79582 m!869931))

(declare-fun m!869933 () Bool)

(assert (=> start!79582 m!869933))

(declare-fun m!869935 () Bool)

(assert (=> b!935439 m!869935))

(declare-fun m!869937 () Bool)

(assert (=> mapNonEmpty!32031 m!869937))

(declare-fun m!869939 () Bool)

(assert (=> b!935437 m!869939))

(check-sat (not b!935446) (not b!935433) (not b!935439) (not mapNonEmpty!32031) (not b!935441) (not b!935440) (not b!935435) (not b_lambda!14055) (not b!935448) (not b!935447) tp_is_empty!20175 (not b!935450) (not b_next!17667) (not b!935442) (not b!935434) b_and!28919 (not start!79582) (not b!935437))
(check-sat b_and!28919 (not b_next!17667))
(get-model)

(declare-fun b_lambda!14059 () Bool)

(assert (= b_lambda!14055 (or (and start!79582 b_free!17667) b_lambda!14059)))

(check-sat (not b!935446) (not b!935433) (not b!935439) (not mapNonEmpty!32031) (not b!935441) (not b!935440) (not b!935448) (not b!935447) tp_is_empty!20175 (not b!935450) (not b_next!17667) (not b!935442) (not b!935435) (not b_lambda!14059) (not b!935434) b_and!28919 (not start!79582) (not b!935437))
(check-sat b_and!28919 (not b_next!17667))
(get-model)

(declare-fun d!113247 () Bool)

(declare-fun lt!421629 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!407 (List!19086) (InoxSet (_ BitVec 64)))

(assert (=> d!113247 (= lt!421629 (select (content!407 Nil!19083) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!525296 () Bool)

(assert (=> d!113247 (= lt!421629 e!525296)))

(declare-fun res!629993 () Bool)

(assert (=> d!113247 (=> (not res!629993) (not e!525296))))

(assert (=> d!113247 (= res!629993 ((_ is Cons!19082) Nil!19083))))

(assert (=> d!113247 (= (contains!5074 Nil!19083 #b1000000000000000000000000000000000000000000000000000000000000000) lt!421629)))

(declare-fun b!935516 () Bool)

(declare-fun e!525295 () Bool)

(assert (=> b!935516 (= e!525296 e!525295)))

(declare-fun res!629994 () Bool)

(assert (=> b!935516 (=> res!629994 e!525295)))

(assert (=> b!935516 (= res!629994 (= (h!20228 Nil!19083) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935517 () Bool)

(assert (=> b!935517 (= e!525295 (contains!5074 (t!27297 Nil!19083) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113247 res!629993) b!935516))

(assert (= (and b!935516 (not res!629994)) b!935517))

(declare-fun m!870001 () Bool)

(assert (=> d!113247 m!870001))

(declare-fun m!870003 () Bool)

(assert (=> d!113247 m!870003))

(declare-fun m!870005 () Bool)

(assert (=> b!935517 m!870005))

(assert (=> b!935447 d!113247))

(declare-fun bm!40716 () Bool)

(declare-fun call!40719 () Bool)

(declare-fun c!97291 () Bool)

(assert (=> bm!40716 (= call!40719 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97291 (Cons!19082 (select (arr!27087 _keys!1487) #b00000000000000000000000000000000) Nil!19083) Nil!19083)))))

(declare-fun b!935528 () Bool)

(declare-fun e!525308 () Bool)

(assert (=> b!935528 (= e!525308 call!40719)))

(declare-fun b!935529 () Bool)

(assert (=> b!935529 (= e!525308 call!40719)))

(declare-fun b!935531 () Bool)

(declare-fun e!525305 () Bool)

(assert (=> b!935531 (= e!525305 (contains!5074 Nil!19083 (select (arr!27087 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!935532 () Bool)

(declare-fun e!525307 () Bool)

(declare-fun e!525306 () Bool)

(assert (=> b!935532 (= e!525307 e!525306)))

(declare-fun res!630002 () Bool)

(assert (=> b!935532 (=> (not res!630002) (not e!525306))))

(assert (=> b!935532 (= res!630002 (not e!525305))))

(declare-fun res!630001 () Bool)

(assert (=> b!935532 (=> (not res!630001) (not e!525305))))

(assert (=> b!935532 (= res!630001 (validKeyInArray!0 (select (arr!27087 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113249 () Bool)

(declare-fun res!630003 () Bool)

(assert (=> d!113249 (=> res!630003 e!525307)))

(assert (=> d!113249 (= res!630003 (bvsge #b00000000000000000000000000000000 (size!27546 _keys!1487)))))

(assert (=> d!113249 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19083) e!525307)))

(declare-fun b!935530 () Bool)

(assert (=> b!935530 (= e!525306 e!525308)))

(assert (=> b!935530 (= c!97291 (validKeyInArray!0 (select (arr!27087 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113249 (not res!630003)) b!935532))

(assert (= (and b!935532 res!630001) b!935531))

(assert (= (and b!935532 res!630002) b!935530))

(assert (= (and b!935530 c!97291) b!935528))

(assert (= (and b!935530 (not c!97291)) b!935529))

(assert (= (or b!935528 b!935529) bm!40716))

(declare-fun m!870007 () Bool)

(assert (=> bm!40716 m!870007))

(declare-fun m!870009 () Bool)

(assert (=> bm!40716 m!870009))

(assert (=> b!935531 m!870007))

(assert (=> b!935531 m!870007))

(declare-fun m!870011 () Bool)

(assert (=> b!935531 m!870011))

(assert (=> b!935532 m!870007))

(assert (=> b!935532 m!870007))

(declare-fun m!870013 () Bool)

(assert (=> b!935532 m!870013))

(assert (=> b!935530 m!870007))

(assert (=> b!935530 m!870007))

(assert (=> b!935530 m!870013))

(assert (=> b!935439 d!113249))

(declare-fun d!113251 () Bool)

(declare-fun e!525314 () Bool)

(assert (=> d!113251 e!525314))

(declare-fun res!630006 () Bool)

(assert (=> d!113251 (=> res!630006 e!525314)))

(declare-fun lt!421638 () Bool)

(assert (=> d!113251 (= res!630006 (not lt!421638))))

(declare-fun lt!421641 () Bool)

(assert (=> d!113251 (= lt!421638 lt!421641)))

(declare-fun lt!421639 () Unit!31554)

(declare-fun e!525313 () Unit!31554)

(assert (=> d!113251 (= lt!421639 e!525313)))

(declare-fun c!97294 () Bool)

(assert (=> d!113251 (= c!97294 lt!421641)))

(declare-fun containsKey!449 (List!19087 (_ BitVec 64)) Bool)

(assert (=> d!113251 (= lt!421641 (containsKey!449 (toList!6017 lt!421596) k0!1099))))

(assert (=> d!113251 (= (contains!5073 lt!421596 k0!1099) lt!421638)))

(declare-fun b!935539 () Bool)

(declare-fun lt!421640 () Unit!31554)

(assert (=> b!935539 (= e!525313 lt!421640)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!345 (List!19087 (_ BitVec 64)) Unit!31554)

(assert (=> b!935539 (= lt!421640 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6017 lt!421596) k0!1099))))

(declare-datatypes ((Option!488 0))(
  ( (Some!487 (v!12664 V!31865)) (None!486) )
))
(declare-fun isDefined!354 (Option!488) Bool)

(declare-fun getValueByKey!482 (List!19087 (_ BitVec 64)) Option!488)

(assert (=> b!935539 (isDefined!354 (getValueByKey!482 (toList!6017 lt!421596) k0!1099))))

(declare-fun b!935540 () Bool)

(declare-fun Unit!31558 () Unit!31554)

(assert (=> b!935540 (= e!525313 Unit!31558)))

(declare-fun b!935541 () Bool)

(assert (=> b!935541 (= e!525314 (isDefined!354 (getValueByKey!482 (toList!6017 lt!421596) k0!1099)))))

(assert (= (and d!113251 c!97294) b!935539))

(assert (= (and d!113251 (not c!97294)) b!935540))

(assert (= (and d!113251 (not res!630006)) b!935541))

(declare-fun m!870015 () Bool)

(assert (=> d!113251 m!870015))

(declare-fun m!870017 () Bool)

(assert (=> b!935539 m!870017))

(declare-fun m!870019 () Bool)

(assert (=> b!935539 m!870019))

(assert (=> b!935539 m!870019))

(declare-fun m!870021 () Bool)

(assert (=> b!935539 m!870021))

(assert (=> b!935541 m!870019))

(assert (=> b!935541 m!870019))

(assert (=> b!935541 m!870021))

(assert (=> b!935448 d!113251))

(declare-fun b!935584 () Bool)

(declare-fun e!525349 () Bool)

(declare-fun e!525343 () Bool)

(assert (=> b!935584 (= e!525349 e!525343)))

(declare-fun res!630031 () Bool)

(assert (=> b!935584 (=> (not res!630031) (not e!525343))))

(declare-fun lt!421697 () ListLongMap!12003)

(assert (=> b!935584 (= res!630031 (contains!5073 lt!421697 (select (arr!27087 _keys!1487) from!1844)))))

(assert (=> b!935584 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27546 _keys!1487)))))

(declare-fun b!935585 () Bool)

(declare-fun e!525346 () Bool)

(declare-fun call!40737 () Bool)

(assert (=> b!935585 (= e!525346 (not call!40737))))

(declare-fun b!935586 () Bool)

(declare-fun e!525348 () Unit!31554)

(declare-fun lt!421705 () Unit!31554)

(assert (=> b!935586 (= e!525348 lt!421705)))

(declare-fun lt!421699 () ListLongMap!12003)

(declare-fun getCurrentListMapNoExtraKeys!3302 (array!56292 array!56294 (_ BitVec 32) (_ BitVec 32) V!31865 V!31865 (_ BitVec 32) Int) ListLongMap!12003)

(assert (=> b!935586 (= lt!421699 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421691 () (_ BitVec 64))

(assert (=> b!935586 (= lt!421691 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421686 () (_ BitVec 64))

(assert (=> b!935586 (= lt!421686 (select (arr!27087 _keys!1487) from!1844))))

(declare-fun lt!421706 () Unit!31554)

(assert (=> b!935586 (= lt!421706 (addStillContains!531 lt!421699 lt!421691 zeroValue!1173 lt!421686))))

(assert (=> b!935586 (contains!5073 (+!2812 lt!421699 (tuple2!13307 lt!421691 zeroValue!1173)) lt!421686)))

(declare-fun lt!421696 () Unit!31554)

(assert (=> b!935586 (= lt!421696 lt!421706)))

(declare-fun lt!421703 () ListLongMap!12003)

(assert (=> b!935586 (= lt!421703 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421698 () (_ BitVec 64))

(assert (=> b!935586 (= lt!421698 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421695 () (_ BitVec 64))

(assert (=> b!935586 (= lt!421695 (select (arr!27087 _keys!1487) from!1844))))

(declare-fun lt!421707 () Unit!31554)

(declare-fun addApplyDifferent!421 (ListLongMap!12003 (_ BitVec 64) V!31865 (_ BitVec 64)) Unit!31554)

(assert (=> b!935586 (= lt!421707 (addApplyDifferent!421 lt!421703 lt!421698 minValue!1173 lt!421695))))

(assert (=> b!935586 (= (apply!819 (+!2812 lt!421703 (tuple2!13307 lt!421698 minValue!1173)) lt!421695) (apply!819 lt!421703 lt!421695))))

(declare-fun lt!421704 () Unit!31554)

(assert (=> b!935586 (= lt!421704 lt!421707)))

(declare-fun lt!421688 () ListLongMap!12003)

(assert (=> b!935586 (= lt!421688 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421701 () (_ BitVec 64))

(assert (=> b!935586 (= lt!421701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421687 () (_ BitVec 64))

(assert (=> b!935586 (= lt!421687 (select (arr!27087 _keys!1487) from!1844))))

(declare-fun lt!421702 () Unit!31554)

(assert (=> b!935586 (= lt!421702 (addApplyDifferent!421 lt!421688 lt!421701 zeroValue!1173 lt!421687))))

(assert (=> b!935586 (= (apply!819 (+!2812 lt!421688 (tuple2!13307 lt!421701 zeroValue!1173)) lt!421687) (apply!819 lt!421688 lt!421687))))

(declare-fun lt!421694 () Unit!31554)

(assert (=> b!935586 (= lt!421694 lt!421702)))

(declare-fun lt!421693 () ListLongMap!12003)

(assert (=> b!935586 (= lt!421693 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421692 () (_ BitVec 64))

(assert (=> b!935586 (= lt!421692 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421700 () (_ BitVec 64))

(assert (=> b!935586 (= lt!421700 (select (arr!27087 _keys!1487) from!1844))))

(assert (=> b!935586 (= lt!421705 (addApplyDifferent!421 lt!421693 lt!421692 minValue!1173 lt!421700))))

(assert (=> b!935586 (= (apply!819 (+!2812 lt!421693 (tuple2!13307 lt!421692 minValue!1173)) lt!421700) (apply!819 lt!421693 lt!421700))))

(declare-fun d!113253 () Bool)

(declare-fun e!525341 () Bool)

(assert (=> d!113253 e!525341))

(declare-fun res!630027 () Bool)

(assert (=> d!113253 (=> (not res!630027) (not e!525341))))

(assert (=> d!113253 (= res!630027 (or (bvsge from!1844 (size!27546 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27546 _keys!1487)))))))

(declare-fun lt!421689 () ListLongMap!12003)

(assert (=> d!113253 (= lt!421697 lt!421689)))

(declare-fun lt!421690 () Unit!31554)

(assert (=> d!113253 (= lt!421690 e!525348)))

(declare-fun c!97307 () Bool)

(declare-fun e!525350 () Bool)

(assert (=> d!113253 (= c!97307 e!525350)))

(declare-fun res!630033 () Bool)

(assert (=> d!113253 (=> (not res!630033) (not e!525350))))

(assert (=> d!113253 (= res!630033 (bvslt from!1844 (size!27546 _keys!1487)))))

(declare-fun e!525344 () ListLongMap!12003)

(assert (=> d!113253 (= lt!421689 e!525344)))

(declare-fun c!97312 () Bool)

(assert (=> d!113253 (= c!97312 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113253 (validMask!0 mask!1881)))

(assert (=> d!113253 (= (getCurrentListMap!3254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!421697)))

(declare-fun b!935587 () Bool)

(declare-fun res!630028 () Bool)

(assert (=> b!935587 (=> (not res!630028) (not e!525341))))

(assert (=> b!935587 (= res!630028 e!525346)))

(declare-fun c!97308 () Bool)

(assert (=> b!935587 (= c!97308 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!935588 () Bool)

(declare-fun e!525352 () ListLongMap!12003)

(declare-fun call!40738 () ListLongMap!12003)

(assert (=> b!935588 (= e!525352 call!40738)))

(declare-fun b!935589 () Bool)

(declare-fun e!525347 () Bool)

(assert (=> b!935589 (= e!525347 (validKeyInArray!0 (select (arr!27087 _keys!1487) from!1844)))))

(declare-fun b!935590 () Bool)

(declare-fun c!97311 () Bool)

(assert (=> b!935590 (= c!97311 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525342 () ListLongMap!12003)

(assert (=> b!935590 (= e!525342 e!525352)))

(declare-fun b!935591 () Bool)

(declare-fun call!40739 () ListLongMap!12003)

(assert (=> b!935591 (= e!525344 (+!2812 call!40739 (tuple2!13307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun call!40734 () ListLongMap!12003)

(declare-fun bm!40731 () Bool)

(assert (=> bm!40731 (= call!40734 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935592 () Bool)

(declare-fun call!40740 () ListLongMap!12003)

(assert (=> b!935592 (= e!525352 call!40740)))

(declare-fun b!935593 () Bool)

(declare-fun e!525351 () Bool)

(assert (=> b!935593 (= e!525351 (= (apply!819 lt!421697 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40732 () Bool)

(declare-fun call!40735 () Bool)

(assert (=> bm!40732 (= call!40735 (contains!5073 lt!421697 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40733 () Bool)

(declare-fun call!40736 () ListLongMap!12003)

(assert (=> bm!40733 (= call!40740 call!40736)))

(declare-fun bm!40734 () Bool)

(assert (=> bm!40734 (= call!40736 call!40734)))

(declare-fun c!97310 () Bool)

(declare-fun bm!40735 () Bool)

(assert (=> bm!40735 (= call!40739 (+!2812 (ite c!97312 call!40734 (ite c!97310 call!40736 call!40740)) (ite (or c!97312 c!97310) (tuple2!13307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935594 () Bool)

(assert (=> b!935594 (= e!525350 (validKeyInArray!0 (select (arr!27087 _keys!1487) from!1844)))))

(declare-fun b!935595 () Bool)

(assert (=> b!935595 (= e!525343 (= (apply!819 lt!421697 (select (arr!27087 _keys!1487) from!1844)) (get!14269 (select (arr!27088 _values!1231) from!1844) (dynLambda!1601 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935595 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27547 _values!1231)))))

(assert (=> b!935595 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27546 _keys!1487)))))

(declare-fun b!935596 () Bool)

(assert (=> b!935596 (= e!525344 e!525342)))

(assert (=> b!935596 (= c!97310 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935597 () Bool)

(declare-fun e!525345 () Bool)

(assert (=> b!935597 (= e!525341 e!525345)))

(declare-fun c!97309 () Bool)

(assert (=> b!935597 (= c!97309 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935598 () Bool)

(declare-fun e!525353 () Bool)

(assert (=> b!935598 (= e!525346 e!525353)))

(declare-fun res!630029 () Bool)

(assert (=> b!935598 (= res!630029 call!40737)))

(assert (=> b!935598 (=> (not res!630029) (not e!525353))))

(declare-fun b!935599 () Bool)

(assert (=> b!935599 (= e!525345 e!525351)))

(declare-fun res!630025 () Bool)

(assert (=> b!935599 (= res!630025 call!40735)))

(assert (=> b!935599 (=> (not res!630025) (not e!525351))))

(declare-fun bm!40736 () Bool)

(assert (=> bm!40736 (= call!40738 call!40739)))

(declare-fun b!935600 () Bool)

(declare-fun Unit!31559 () Unit!31554)

(assert (=> b!935600 (= e!525348 Unit!31559)))

(declare-fun bm!40737 () Bool)

(assert (=> bm!40737 (= call!40737 (contains!5073 lt!421697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935601 () Bool)

(assert (=> b!935601 (= e!525345 (not call!40735))))

(declare-fun b!935602 () Bool)

(assert (=> b!935602 (= e!525353 (= (apply!819 lt!421697 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935603 () Bool)

(assert (=> b!935603 (= e!525342 call!40738)))

(declare-fun b!935604 () Bool)

(declare-fun res!630030 () Bool)

(assert (=> b!935604 (=> (not res!630030) (not e!525341))))

(assert (=> b!935604 (= res!630030 e!525349)))

(declare-fun res!630026 () Bool)

(assert (=> b!935604 (=> res!630026 e!525349)))

(assert (=> b!935604 (= res!630026 (not e!525347))))

(declare-fun res!630032 () Bool)

(assert (=> b!935604 (=> (not res!630032) (not e!525347))))

(assert (=> b!935604 (= res!630032 (bvslt from!1844 (size!27546 _keys!1487)))))

(assert (= (and d!113253 c!97312) b!935591))

(assert (= (and d!113253 (not c!97312)) b!935596))

(assert (= (and b!935596 c!97310) b!935603))

(assert (= (and b!935596 (not c!97310)) b!935590))

(assert (= (and b!935590 c!97311) b!935588))

(assert (= (and b!935590 (not c!97311)) b!935592))

(assert (= (or b!935588 b!935592) bm!40733))

(assert (= (or b!935603 bm!40733) bm!40734))

(assert (= (or b!935603 b!935588) bm!40736))

(assert (= (or b!935591 bm!40734) bm!40731))

(assert (= (or b!935591 bm!40736) bm!40735))

(assert (= (and d!113253 res!630033) b!935594))

(assert (= (and d!113253 c!97307) b!935586))

(assert (= (and d!113253 (not c!97307)) b!935600))

(assert (= (and d!113253 res!630027) b!935604))

(assert (= (and b!935604 res!630032) b!935589))

(assert (= (and b!935604 (not res!630026)) b!935584))

(assert (= (and b!935584 res!630031) b!935595))

(assert (= (and b!935604 res!630030) b!935587))

(assert (= (and b!935587 c!97308) b!935598))

(assert (= (and b!935587 (not c!97308)) b!935585))

(assert (= (and b!935598 res!630029) b!935602))

(assert (= (or b!935598 b!935585) bm!40737))

(assert (= (and b!935587 res!630028) b!935597))

(assert (= (and b!935597 c!97309) b!935599))

(assert (= (and b!935597 (not c!97309)) b!935601))

(assert (= (and b!935599 res!630025) b!935593))

(assert (= (or b!935599 b!935601) bm!40732))

(declare-fun b_lambda!14061 () Bool)

(assert (=> (not b_lambda!14061) (not b!935595)))

(assert (=> b!935595 t!27296))

(declare-fun b_and!28925 () Bool)

(assert (= b_and!28919 (and (=> t!27296 result!11953) b_and!28925)))

(declare-fun m!870023 () Bool)

(assert (=> b!935594 m!870023))

(assert (=> b!935594 m!870023))

(declare-fun m!870025 () Bool)

(assert (=> b!935594 m!870025))

(assert (=> d!113253 m!869929))

(assert (=> b!935584 m!870023))

(assert (=> b!935584 m!870023))

(declare-fun m!870027 () Bool)

(assert (=> b!935584 m!870027))

(declare-fun m!870029 () Bool)

(assert (=> bm!40731 m!870029))

(declare-fun m!870031 () Bool)

(assert (=> b!935586 m!870031))

(declare-fun m!870033 () Bool)

(assert (=> b!935586 m!870033))

(declare-fun m!870035 () Bool)

(assert (=> b!935586 m!870035))

(declare-fun m!870037 () Bool)

(assert (=> b!935586 m!870037))

(declare-fun m!870039 () Bool)

(assert (=> b!935586 m!870039))

(declare-fun m!870041 () Bool)

(assert (=> b!935586 m!870041))

(declare-fun m!870043 () Bool)

(assert (=> b!935586 m!870043))

(declare-fun m!870045 () Bool)

(assert (=> b!935586 m!870045))

(assert (=> b!935586 m!870037))

(declare-fun m!870047 () Bool)

(assert (=> b!935586 m!870047))

(declare-fun m!870049 () Bool)

(assert (=> b!935586 m!870049))

(assert (=> b!935586 m!870043))

(assert (=> b!935586 m!870029))

(assert (=> b!935586 m!870039))

(declare-fun m!870051 () Bool)

(assert (=> b!935586 m!870051))

(declare-fun m!870053 () Bool)

(assert (=> b!935586 m!870053))

(declare-fun m!870055 () Bool)

(assert (=> b!935586 m!870055))

(declare-fun m!870057 () Bool)

(assert (=> b!935586 m!870057))

(declare-fun m!870059 () Bool)

(assert (=> b!935586 m!870059))

(assert (=> b!935586 m!870031))

(assert (=> b!935586 m!870023))

(declare-fun m!870061 () Bool)

(assert (=> b!935591 m!870061))

(declare-fun m!870063 () Bool)

(assert (=> bm!40737 m!870063))

(declare-fun m!870065 () Bool)

(assert (=> bm!40732 m!870065))

(assert (=> b!935595 m!870023))

(declare-fun m!870067 () Bool)

(assert (=> b!935595 m!870067))

(assert (=> b!935595 m!869895))

(declare-fun m!870069 () Bool)

(assert (=> b!935595 m!870069))

(assert (=> b!935595 m!869895))

(declare-fun m!870071 () Bool)

(assert (=> b!935595 m!870071))

(assert (=> b!935595 m!870069))

(assert (=> b!935595 m!870023))

(declare-fun m!870073 () Bool)

(assert (=> b!935593 m!870073))

(declare-fun m!870075 () Bool)

(assert (=> b!935602 m!870075))

(declare-fun m!870077 () Bool)

(assert (=> bm!40735 m!870077))

(assert (=> b!935589 m!870023))

(assert (=> b!935589 m!870023))

(assert (=> b!935589 m!870025))

(assert (=> b!935448 d!113253))

(declare-fun d!113255 () Bool)

(assert (=> d!113255 (= (validKeyInArray!0 lt!421593) (and (not (= lt!421593 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!421593 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935440 d!113255))

(declare-fun d!113257 () Bool)

(declare-fun res!630038 () Bool)

(declare-fun e!525358 () Bool)

(assert (=> d!113257 (=> res!630038 e!525358)))

(assert (=> d!113257 (= res!630038 ((_ is Nil!19083) Nil!19083))))

(assert (=> d!113257 (= (noDuplicate!1354 Nil!19083) e!525358)))

(declare-fun b!935609 () Bool)

(declare-fun e!525359 () Bool)

(assert (=> b!935609 (= e!525358 e!525359)))

(declare-fun res!630039 () Bool)

(assert (=> b!935609 (=> (not res!630039) (not e!525359))))

(assert (=> b!935609 (= res!630039 (not (contains!5074 (t!27297 Nil!19083) (h!20228 Nil!19083))))))

(declare-fun b!935610 () Bool)

(assert (=> b!935610 (= e!525359 (noDuplicate!1354 (t!27297 Nil!19083)))))

(assert (= (and d!113257 (not res!630038)) b!935609))

(assert (= (and b!935609 res!630039) b!935610))

(declare-fun m!870079 () Bool)

(assert (=> b!935609 m!870079))

(declare-fun m!870081 () Bool)

(assert (=> b!935610 m!870081))

(assert (=> b!935441 d!113257))

(declare-fun d!113259 () Bool)

(declare-fun res!630044 () Bool)

(declare-fun e!525364 () Bool)

(assert (=> d!113259 (=> res!630044 e!525364)))

(assert (=> d!113259 (= res!630044 (= (select (arr!27087 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113259 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!525364)))

(declare-fun b!935615 () Bool)

(declare-fun e!525365 () Bool)

(assert (=> b!935615 (= e!525364 e!525365)))

(declare-fun res!630045 () Bool)

(assert (=> b!935615 (=> (not res!630045) (not e!525365))))

(assert (=> b!935615 (= res!630045 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27546 _keys!1487)))))

(declare-fun b!935616 () Bool)

(assert (=> b!935616 (= e!525365 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113259 (not res!630044)) b!935615))

(assert (= (and b!935615 res!630045) b!935616))

(assert (=> d!113259 m!870023))

(declare-fun m!870083 () Bool)

(assert (=> b!935616 m!870083))

(assert (=> b!935450 d!113259))

(declare-fun d!113261 () Bool)

(declare-fun lt!421708 () Bool)

(assert (=> d!113261 (= lt!421708 (select (content!407 Nil!19083) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!525367 () Bool)

(assert (=> d!113261 (= lt!421708 e!525367)))

(declare-fun res!630046 () Bool)

(assert (=> d!113261 (=> (not res!630046) (not e!525367))))

(assert (=> d!113261 (= res!630046 ((_ is Cons!19082) Nil!19083))))

(assert (=> d!113261 (= (contains!5074 Nil!19083 #b0000000000000000000000000000000000000000000000000000000000000000) lt!421708)))

(declare-fun b!935617 () Bool)

(declare-fun e!525366 () Bool)

(assert (=> b!935617 (= e!525367 e!525366)))

(declare-fun res!630047 () Bool)

(assert (=> b!935617 (=> res!630047 e!525366)))

(assert (=> b!935617 (= res!630047 (= (h!20228 Nil!19083) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935618 () Bool)

(assert (=> b!935618 (= e!525366 (contains!5074 (t!27297 Nil!19083) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113261 res!630046) b!935617))

(assert (= (and b!935617 (not res!630047)) b!935618))

(assert (=> d!113261 m!870001))

(declare-fun m!870085 () Bool)

(assert (=> d!113261 m!870085))

(declare-fun m!870087 () Bool)

(assert (=> b!935618 m!870087))

(assert (=> b!935442 d!113261))

(declare-fun b!935628 () Bool)

(declare-fun e!525375 () Bool)

(declare-fun call!40743 () Bool)

(assert (=> b!935628 (= e!525375 call!40743)))

(declare-fun bm!40740 () Bool)

(assert (=> bm!40740 (= call!40743 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!935629 () Bool)

(declare-fun e!525374 () Bool)

(assert (=> b!935629 (= e!525374 e!525375)))

(declare-fun lt!421717 () (_ BitVec 64))

(assert (=> b!935629 (= lt!421717 (select (arr!27087 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!421715 () Unit!31554)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56292 (_ BitVec 64) (_ BitVec 32)) Unit!31554)

(assert (=> b!935629 (= lt!421715 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!421717 #b00000000000000000000000000000000))))

(assert (=> b!935629 (arrayContainsKey!0 _keys!1487 lt!421717 #b00000000000000000000000000000000)))

(declare-fun lt!421716 () Unit!31554)

(assert (=> b!935629 (= lt!421716 lt!421715)))

(declare-fun res!630053 () Bool)

(declare-datatypes ((SeekEntryResult!8980 0))(
  ( (MissingZero!8980 (index!38291 (_ BitVec 32))) (Found!8980 (index!38292 (_ BitVec 32))) (Intermediate!8980 (undefined!9792 Bool) (index!38293 (_ BitVec 32)) (x!80225 (_ BitVec 32))) (Undefined!8980) (MissingVacant!8980 (index!38294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56292 (_ BitVec 32)) SeekEntryResult!8980)

(assert (=> b!935629 (= res!630053 (= (seekEntryOrOpen!0 (select (arr!27087 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8980 #b00000000000000000000000000000000)))))

(assert (=> b!935629 (=> (not res!630053) (not e!525375))))

(declare-fun b!935630 () Bool)

(assert (=> b!935630 (= e!525374 call!40743)))

(declare-fun b!935627 () Bool)

(declare-fun e!525376 () Bool)

(assert (=> b!935627 (= e!525376 e!525374)))

(declare-fun c!97315 () Bool)

(assert (=> b!935627 (= c!97315 (validKeyInArray!0 (select (arr!27087 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113263 () Bool)

(declare-fun res!630052 () Bool)

(assert (=> d!113263 (=> res!630052 e!525376)))

(assert (=> d!113263 (= res!630052 (bvsge #b00000000000000000000000000000000 (size!27546 _keys!1487)))))

(assert (=> d!113263 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!525376)))

(assert (= (and d!113263 (not res!630052)) b!935627))

(assert (= (and b!935627 c!97315) b!935629))

(assert (= (and b!935627 (not c!97315)) b!935630))

(assert (= (and b!935629 res!630053) b!935628))

(assert (= (or b!935628 b!935630) bm!40740))

(declare-fun m!870089 () Bool)

(assert (=> bm!40740 m!870089))

(assert (=> b!935629 m!870007))

(declare-fun m!870091 () Bool)

(assert (=> b!935629 m!870091))

(declare-fun m!870093 () Bool)

(assert (=> b!935629 m!870093))

(assert (=> b!935629 m!870007))

(declare-fun m!870095 () Bool)

(assert (=> b!935629 m!870095))

(assert (=> b!935627 m!870007))

(assert (=> b!935627 m!870007))

(assert (=> b!935627 m!870013))

(assert (=> b!935433 d!113263))

(declare-fun d!113265 () Bool)

(declare-fun e!525379 () Bool)

(assert (=> d!113265 e!525379))

(declare-fun res!630059 () Bool)

(assert (=> d!113265 (=> (not res!630059) (not e!525379))))

(declare-fun lt!421729 () ListLongMap!12003)

(assert (=> d!113265 (= res!630059 (contains!5073 lt!421729 (_1!6664 lt!421598)))))

(declare-fun lt!421726 () List!19087)

(assert (=> d!113265 (= lt!421729 (ListLongMap!12004 lt!421726))))

(declare-fun lt!421728 () Unit!31554)

(declare-fun lt!421727 () Unit!31554)

(assert (=> d!113265 (= lt!421728 lt!421727)))

(assert (=> d!113265 (= (getValueByKey!482 lt!421726 (_1!6664 lt!421598)) (Some!487 (_2!6664 lt!421598)))))

(declare-fun lemmaContainsTupThenGetReturnValue!258 (List!19087 (_ BitVec 64) V!31865) Unit!31554)

(assert (=> d!113265 (= lt!421727 (lemmaContainsTupThenGetReturnValue!258 lt!421726 (_1!6664 lt!421598) (_2!6664 lt!421598)))))

(declare-fun insertStrictlySorted!315 (List!19087 (_ BitVec 64) V!31865) List!19087)

(assert (=> d!113265 (= lt!421726 (insertStrictlySorted!315 (toList!6017 (getCurrentListMap!3254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421599 defaultEntry!1235)) (_1!6664 lt!421598) (_2!6664 lt!421598)))))

(assert (=> d!113265 (= (+!2812 (getCurrentListMap!3254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421599 defaultEntry!1235) lt!421598) lt!421729)))

(declare-fun b!935635 () Bool)

(declare-fun res!630058 () Bool)

(assert (=> b!935635 (=> (not res!630058) (not e!525379))))

(assert (=> b!935635 (= res!630058 (= (getValueByKey!482 (toList!6017 lt!421729) (_1!6664 lt!421598)) (Some!487 (_2!6664 lt!421598))))))

(declare-fun b!935636 () Bool)

(declare-fun contains!5076 (List!19087 tuple2!13306) Bool)

(assert (=> b!935636 (= e!525379 (contains!5076 (toList!6017 lt!421729) lt!421598))))

(assert (= (and d!113265 res!630059) b!935635))

(assert (= (and b!935635 res!630058) b!935636))

(declare-fun m!870097 () Bool)

(assert (=> d!113265 m!870097))

(declare-fun m!870099 () Bool)

(assert (=> d!113265 m!870099))

(declare-fun m!870101 () Bool)

(assert (=> d!113265 m!870101))

(declare-fun m!870103 () Bool)

(assert (=> d!113265 m!870103))

(declare-fun m!870105 () Bool)

(assert (=> b!935635 m!870105))

(declare-fun m!870107 () Bool)

(assert (=> b!935636 m!870107))

(assert (=> b!935434 d!113265))

(declare-fun b!935637 () Bool)

(declare-fun e!525388 () Bool)

(declare-fun e!525382 () Bool)

(assert (=> b!935637 (= e!525388 e!525382)))

(declare-fun res!630066 () Bool)

(assert (=> b!935637 (=> (not res!630066) (not e!525382))))

(declare-fun lt!421741 () ListLongMap!12003)

(assert (=> b!935637 (= res!630066 (contains!5073 lt!421741 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!935637 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27546 _keys!1487)))))

(declare-fun b!935638 () Bool)

(declare-fun e!525385 () Bool)

(declare-fun call!40747 () Bool)

(assert (=> b!935638 (= e!525385 (not call!40747))))

(declare-fun b!935639 () Bool)

(declare-fun e!525387 () Unit!31554)

(declare-fun lt!421749 () Unit!31554)

(assert (=> b!935639 (= e!525387 lt!421749)))

(declare-fun lt!421743 () ListLongMap!12003)

(assert (=> b!935639 (= lt!421743 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421735 () (_ BitVec 64))

(assert (=> b!935639 (= lt!421735 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421730 () (_ BitVec 64))

(assert (=> b!935639 (= lt!421730 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421750 () Unit!31554)

(assert (=> b!935639 (= lt!421750 (addStillContains!531 lt!421743 lt!421735 zeroValue!1173 lt!421730))))

(assert (=> b!935639 (contains!5073 (+!2812 lt!421743 (tuple2!13307 lt!421735 zeroValue!1173)) lt!421730)))

(declare-fun lt!421740 () Unit!31554)

(assert (=> b!935639 (= lt!421740 lt!421750)))

(declare-fun lt!421747 () ListLongMap!12003)

(assert (=> b!935639 (= lt!421747 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421742 () (_ BitVec 64))

(assert (=> b!935639 (= lt!421742 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421739 () (_ BitVec 64))

(assert (=> b!935639 (= lt!421739 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421751 () Unit!31554)

(assert (=> b!935639 (= lt!421751 (addApplyDifferent!421 lt!421747 lt!421742 minValue!1173 lt!421739))))

(assert (=> b!935639 (= (apply!819 (+!2812 lt!421747 (tuple2!13307 lt!421742 minValue!1173)) lt!421739) (apply!819 lt!421747 lt!421739))))

(declare-fun lt!421748 () Unit!31554)

(assert (=> b!935639 (= lt!421748 lt!421751)))

(declare-fun lt!421732 () ListLongMap!12003)

(assert (=> b!935639 (= lt!421732 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421745 () (_ BitVec 64))

(assert (=> b!935639 (= lt!421745 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421731 () (_ BitVec 64))

(assert (=> b!935639 (= lt!421731 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421746 () Unit!31554)

(assert (=> b!935639 (= lt!421746 (addApplyDifferent!421 lt!421732 lt!421745 zeroValue!1173 lt!421731))))

(assert (=> b!935639 (= (apply!819 (+!2812 lt!421732 (tuple2!13307 lt!421745 zeroValue!1173)) lt!421731) (apply!819 lt!421732 lt!421731))))

(declare-fun lt!421738 () Unit!31554)

(assert (=> b!935639 (= lt!421738 lt!421746)))

(declare-fun lt!421737 () ListLongMap!12003)

(assert (=> b!935639 (= lt!421737 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421736 () (_ BitVec 64))

(assert (=> b!935639 (= lt!421736 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421744 () (_ BitVec 64))

(assert (=> b!935639 (= lt!421744 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!935639 (= lt!421749 (addApplyDifferent!421 lt!421737 lt!421736 minValue!1173 lt!421744))))

(assert (=> b!935639 (= (apply!819 (+!2812 lt!421737 (tuple2!13307 lt!421736 minValue!1173)) lt!421744) (apply!819 lt!421737 lt!421744))))

(declare-fun d!113267 () Bool)

(declare-fun e!525380 () Bool)

(assert (=> d!113267 e!525380))

(declare-fun res!630062 () Bool)

(assert (=> d!113267 (=> (not res!630062) (not e!525380))))

(assert (=> d!113267 (= res!630062 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27546 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27546 _keys!1487)))))))

(declare-fun lt!421733 () ListLongMap!12003)

(assert (=> d!113267 (= lt!421741 lt!421733)))

(declare-fun lt!421734 () Unit!31554)

(assert (=> d!113267 (= lt!421734 e!525387)))

(declare-fun c!97316 () Bool)

(declare-fun e!525389 () Bool)

(assert (=> d!113267 (= c!97316 e!525389)))

(declare-fun res!630068 () Bool)

(assert (=> d!113267 (=> (not res!630068) (not e!525389))))

(assert (=> d!113267 (= res!630068 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27546 _keys!1487)))))

(declare-fun e!525383 () ListLongMap!12003)

(assert (=> d!113267 (= lt!421733 e!525383)))

(declare-fun c!97321 () Bool)

(assert (=> d!113267 (= c!97321 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113267 (validMask!0 mask!1881)))

(assert (=> d!113267 (= (getCurrentListMap!3254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421741)))

(declare-fun b!935640 () Bool)

(declare-fun res!630063 () Bool)

(assert (=> b!935640 (=> (not res!630063) (not e!525380))))

(assert (=> b!935640 (= res!630063 e!525385)))

(declare-fun c!97317 () Bool)

(assert (=> b!935640 (= c!97317 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!935641 () Bool)

(declare-fun e!525391 () ListLongMap!12003)

(declare-fun call!40748 () ListLongMap!12003)

(assert (=> b!935641 (= e!525391 call!40748)))

(declare-fun b!935642 () Bool)

(declare-fun e!525386 () Bool)

(assert (=> b!935642 (= e!525386 (validKeyInArray!0 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935643 () Bool)

(declare-fun c!97320 () Bool)

(assert (=> b!935643 (= c!97320 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525381 () ListLongMap!12003)

(assert (=> b!935643 (= e!525381 e!525391)))

(declare-fun b!935644 () Bool)

(declare-fun call!40749 () ListLongMap!12003)

(assert (=> b!935644 (= e!525383 (+!2812 call!40749 (tuple2!13307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun call!40744 () ListLongMap!12003)

(declare-fun bm!40741 () Bool)

(assert (=> bm!40741 (= call!40744 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935645 () Bool)

(declare-fun call!40750 () ListLongMap!12003)

(assert (=> b!935645 (= e!525391 call!40750)))

(declare-fun b!935646 () Bool)

(declare-fun e!525390 () Bool)

(assert (=> b!935646 (= e!525390 (= (apply!819 lt!421741 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40742 () Bool)

(declare-fun call!40745 () Bool)

(assert (=> bm!40742 (= call!40745 (contains!5073 lt!421741 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40743 () Bool)

(declare-fun call!40746 () ListLongMap!12003)

(assert (=> bm!40743 (= call!40750 call!40746)))

(declare-fun bm!40744 () Bool)

(assert (=> bm!40744 (= call!40746 call!40744)))

(declare-fun bm!40745 () Bool)

(declare-fun c!97319 () Bool)

(assert (=> bm!40745 (= call!40749 (+!2812 (ite c!97321 call!40744 (ite c!97319 call!40746 call!40750)) (ite (or c!97321 c!97319) (tuple2!13307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935647 () Bool)

(assert (=> b!935647 (= e!525389 (validKeyInArray!0 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935648 () Bool)

(assert (=> b!935648 (= e!525382 (= (apply!819 lt!421741 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14269 (select (arr!27088 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1601 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935648 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27547 _values!1231)))))

(assert (=> b!935648 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27546 _keys!1487)))))

(declare-fun b!935649 () Bool)

(assert (=> b!935649 (= e!525383 e!525381)))

(assert (=> b!935649 (= c!97319 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935650 () Bool)

(declare-fun e!525384 () Bool)

(assert (=> b!935650 (= e!525380 e!525384)))

(declare-fun c!97318 () Bool)

(assert (=> b!935650 (= c!97318 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935651 () Bool)

(declare-fun e!525392 () Bool)

(assert (=> b!935651 (= e!525385 e!525392)))

(declare-fun res!630064 () Bool)

(assert (=> b!935651 (= res!630064 call!40747)))

(assert (=> b!935651 (=> (not res!630064) (not e!525392))))

(declare-fun b!935652 () Bool)

(assert (=> b!935652 (= e!525384 e!525390)))

(declare-fun res!630060 () Bool)

(assert (=> b!935652 (= res!630060 call!40745)))

(assert (=> b!935652 (=> (not res!630060) (not e!525390))))

(declare-fun bm!40746 () Bool)

(assert (=> bm!40746 (= call!40748 call!40749)))

(declare-fun b!935653 () Bool)

(declare-fun Unit!31560 () Unit!31554)

(assert (=> b!935653 (= e!525387 Unit!31560)))

(declare-fun bm!40747 () Bool)

(assert (=> bm!40747 (= call!40747 (contains!5073 lt!421741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935654 () Bool)

(assert (=> b!935654 (= e!525384 (not call!40745))))

(declare-fun b!935655 () Bool)

(assert (=> b!935655 (= e!525392 (= (apply!819 lt!421741 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935656 () Bool)

(assert (=> b!935656 (= e!525381 call!40748)))

(declare-fun b!935657 () Bool)

(declare-fun res!630065 () Bool)

(assert (=> b!935657 (=> (not res!630065) (not e!525380))))

(assert (=> b!935657 (= res!630065 e!525388)))

(declare-fun res!630061 () Bool)

(assert (=> b!935657 (=> res!630061 e!525388)))

(assert (=> b!935657 (= res!630061 (not e!525386))))

(declare-fun res!630067 () Bool)

(assert (=> b!935657 (=> (not res!630067) (not e!525386))))

(assert (=> b!935657 (= res!630067 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27546 _keys!1487)))))

(assert (= (and d!113267 c!97321) b!935644))

(assert (= (and d!113267 (not c!97321)) b!935649))

(assert (= (and b!935649 c!97319) b!935656))

(assert (= (and b!935649 (not c!97319)) b!935643))

(assert (= (and b!935643 c!97320) b!935641))

(assert (= (and b!935643 (not c!97320)) b!935645))

(assert (= (or b!935641 b!935645) bm!40743))

(assert (= (or b!935656 bm!40743) bm!40744))

(assert (= (or b!935656 b!935641) bm!40746))

(assert (= (or b!935644 bm!40744) bm!40741))

(assert (= (or b!935644 bm!40746) bm!40745))

(assert (= (and d!113267 res!630068) b!935647))

(assert (= (and d!113267 c!97316) b!935639))

(assert (= (and d!113267 (not c!97316)) b!935653))

(assert (= (and d!113267 res!630062) b!935657))

(assert (= (and b!935657 res!630067) b!935642))

(assert (= (and b!935657 (not res!630061)) b!935637))

(assert (= (and b!935637 res!630066) b!935648))

(assert (= (and b!935657 res!630065) b!935640))

(assert (= (and b!935640 c!97317) b!935651))

(assert (= (and b!935640 (not c!97317)) b!935638))

(assert (= (and b!935651 res!630064) b!935655))

(assert (= (or b!935651 b!935638) bm!40747))

(assert (= (and b!935640 res!630063) b!935650))

(assert (= (and b!935650 c!97318) b!935652))

(assert (= (and b!935650 (not c!97318)) b!935654))

(assert (= (and b!935652 res!630060) b!935646))

(assert (= (or b!935652 b!935654) bm!40742))

(declare-fun b_lambda!14063 () Bool)

(assert (=> (not b_lambda!14063) (not b!935648)))

(assert (=> b!935648 t!27296))

(declare-fun b_and!28927 () Bool)

(assert (= b_and!28925 (and (=> t!27296 result!11953) b_and!28927)))

(assert (=> b!935647 m!869925))

(assert (=> b!935647 m!869925))

(declare-fun m!870109 () Bool)

(assert (=> b!935647 m!870109))

(assert (=> d!113267 m!869929))

(assert (=> b!935637 m!869925))

(assert (=> b!935637 m!869925))

(declare-fun m!870111 () Bool)

(assert (=> b!935637 m!870111))

(declare-fun m!870113 () Bool)

(assert (=> bm!40741 m!870113))

(declare-fun m!870115 () Bool)

(assert (=> b!935639 m!870115))

(declare-fun m!870117 () Bool)

(assert (=> b!935639 m!870117))

(declare-fun m!870119 () Bool)

(assert (=> b!935639 m!870119))

(declare-fun m!870121 () Bool)

(assert (=> b!935639 m!870121))

(declare-fun m!870123 () Bool)

(assert (=> b!935639 m!870123))

(declare-fun m!870125 () Bool)

(assert (=> b!935639 m!870125))

(declare-fun m!870127 () Bool)

(assert (=> b!935639 m!870127))

(declare-fun m!870129 () Bool)

(assert (=> b!935639 m!870129))

(assert (=> b!935639 m!870121))

(declare-fun m!870131 () Bool)

(assert (=> b!935639 m!870131))

(declare-fun m!870133 () Bool)

(assert (=> b!935639 m!870133))

(assert (=> b!935639 m!870127))

(assert (=> b!935639 m!870113))

(assert (=> b!935639 m!870123))

(declare-fun m!870135 () Bool)

(assert (=> b!935639 m!870135))

(declare-fun m!870137 () Bool)

(assert (=> b!935639 m!870137))

(declare-fun m!870139 () Bool)

(assert (=> b!935639 m!870139))

(declare-fun m!870141 () Bool)

(assert (=> b!935639 m!870141))

(declare-fun m!870143 () Bool)

(assert (=> b!935639 m!870143))

(assert (=> b!935639 m!870115))

(assert (=> b!935639 m!869925))

(declare-fun m!870145 () Bool)

(assert (=> b!935644 m!870145))

(declare-fun m!870147 () Bool)

(assert (=> bm!40747 m!870147))

(declare-fun m!870149 () Bool)

(assert (=> bm!40742 m!870149))

(assert (=> b!935648 m!869925))

(declare-fun m!870151 () Bool)

(assert (=> b!935648 m!870151))

(assert (=> b!935648 m!869895))

(assert (=> b!935648 m!869893))

(assert (=> b!935648 m!869895))

(assert (=> b!935648 m!869899))

(assert (=> b!935648 m!869893))

(assert (=> b!935648 m!869925))

(declare-fun m!870153 () Bool)

(assert (=> b!935646 m!870153))

(declare-fun m!870155 () Bool)

(assert (=> b!935655 m!870155))

(declare-fun m!870157 () Bool)

(assert (=> bm!40745 m!870157))

(assert (=> b!935642 m!869925))

(assert (=> b!935642 m!869925))

(assert (=> b!935642 m!870109))

(assert (=> b!935434 d!113267))

(declare-fun d!113269 () Bool)

(declare-fun e!525395 () Bool)

(assert (=> d!113269 e!525395))

(declare-fun res!630071 () Bool)

(assert (=> d!113269 (=> (not res!630071) (not e!525395))))

(assert (=> d!113269 (= res!630071 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27546 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27547 _values!1231))))))

(declare-fun lt!421754 () Unit!31554)

(declare-fun choose!1550 (array!56292 array!56294 (_ BitVec 32) (_ BitVec 32) V!31865 V!31865 (_ BitVec 32) Int) Unit!31554)

(assert (=> d!113269 (= lt!421754 (choose!1550 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113269 (validMask!0 mask!1881)))

(assert (=> d!113269 (= (lemmaListMapRecursiveValidKeyArray!202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421754)))

(declare-fun b!935660 () Bool)

(assert (=> b!935660 (= e!525395 (= (getCurrentListMap!3254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2812 (getCurrentListMap!3254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13307 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14269 (select (arr!27088 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1601 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113269 res!630071) b!935660))

(declare-fun b_lambda!14065 () Bool)

(assert (=> (not b_lambda!14065) (not b!935660)))

(assert (=> b!935660 t!27296))

(declare-fun b_and!28929 () Bool)

(assert (= b_and!28927 (and (=> t!27296 result!11953) b_and!28929)))

(declare-fun m!870159 () Bool)

(assert (=> d!113269 m!870159))

(assert (=> d!113269 m!869929))

(assert (=> b!935660 m!869925))

(assert (=> b!935660 m!869901))

(assert (=> b!935660 m!869893))

(assert (=> b!935660 m!869895))

(assert (=> b!935660 m!869899))

(declare-fun m!870161 () Bool)

(assert (=> b!935660 m!870161))

(declare-fun m!870163 () Bool)

(assert (=> b!935660 m!870163))

(assert (=> b!935660 m!870161))

(assert (=> b!935660 m!869893))

(assert (=> b!935660 m!869895))

(assert (=> b!935434 d!113269))

(declare-fun bm!40748 () Bool)

(declare-fun c!97322 () Bool)

(declare-fun call!40751 () Bool)

(assert (=> bm!40748 (= call!40751 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97322 (Cons!19082 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19083) Nil!19083)))))

(declare-fun b!935661 () Bool)

(declare-fun e!525399 () Bool)

(assert (=> b!935661 (= e!525399 call!40751)))

(declare-fun b!935662 () Bool)

(assert (=> b!935662 (= e!525399 call!40751)))

(declare-fun b!935664 () Bool)

(declare-fun e!525396 () Bool)

(assert (=> b!935664 (= e!525396 (contains!5074 Nil!19083 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935665 () Bool)

(declare-fun e!525398 () Bool)

(declare-fun e!525397 () Bool)

(assert (=> b!935665 (= e!525398 e!525397)))

(declare-fun res!630073 () Bool)

(assert (=> b!935665 (=> (not res!630073) (not e!525397))))

(assert (=> b!935665 (= res!630073 (not e!525396))))

(declare-fun res!630072 () Bool)

(assert (=> b!935665 (=> (not res!630072) (not e!525396))))

(assert (=> b!935665 (= res!630072 (validKeyInArray!0 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun d!113271 () Bool)

(declare-fun res!630074 () Bool)

(assert (=> d!113271 (=> res!630074 e!525398)))

(assert (=> d!113271 (= res!630074 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27546 _keys!1487)))))

(assert (=> d!113271 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19083) e!525398)))

(declare-fun b!935663 () Bool)

(assert (=> b!935663 (= e!525397 e!525399)))

(assert (=> b!935663 (= c!97322 (validKeyInArray!0 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113271 (not res!630074)) b!935665))

(assert (= (and b!935665 res!630072) b!935664))

(assert (= (and b!935665 res!630073) b!935663))

(assert (= (and b!935663 c!97322) b!935661))

(assert (= (and b!935663 (not c!97322)) b!935662))

(assert (= (or b!935661 b!935662) bm!40748))

(assert (=> bm!40748 m!869925))

(declare-fun m!870165 () Bool)

(assert (=> bm!40748 m!870165))

(assert (=> b!935664 m!869925))

(assert (=> b!935664 m!869925))

(declare-fun m!870167 () Bool)

(assert (=> b!935664 m!870167))

(assert (=> b!935665 m!869925))

(assert (=> b!935665 m!869925))

(assert (=> b!935665 m!870109))

(assert (=> b!935663 m!869925))

(assert (=> b!935663 m!869925))

(assert (=> b!935663 m!870109))

(assert (=> b!935434 d!113271))

(declare-fun d!113273 () Bool)

(declare-fun e!525400 () Bool)

(assert (=> d!113273 e!525400))

(declare-fun res!630076 () Bool)

(assert (=> d!113273 (=> (not res!630076) (not e!525400))))

(declare-fun lt!421758 () ListLongMap!12003)

(assert (=> d!113273 (= res!630076 (contains!5073 lt!421758 (_1!6664 lt!421598)))))

(declare-fun lt!421755 () List!19087)

(assert (=> d!113273 (= lt!421758 (ListLongMap!12004 lt!421755))))

(declare-fun lt!421757 () Unit!31554)

(declare-fun lt!421756 () Unit!31554)

(assert (=> d!113273 (= lt!421757 lt!421756)))

(assert (=> d!113273 (= (getValueByKey!482 lt!421755 (_1!6664 lt!421598)) (Some!487 (_2!6664 lt!421598)))))

(assert (=> d!113273 (= lt!421756 (lemmaContainsTupThenGetReturnValue!258 lt!421755 (_1!6664 lt!421598) (_2!6664 lt!421598)))))

(assert (=> d!113273 (= lt!421755 (insertStrictlySorted!315 (toList!6017 lt!421596) (_1!6664 lt!421598) (_2!6664 lt!421598)))))

(assert (=> d!113273 (= (+!2812 lt!421596 lt!421598) lt!421758)))

(declare-fun b!935666 () Bool)

(declare-fun res!630075 () Bool)

(assert (=> b!935666 (=> (not res!630075) (not e!525400))))

(assert (=> b!935666 (= res!630075 (= (getValueByKey!482 (toList!6017 lt!421758) (_1!6664 lt!421598)) (Some!487 (_2!6664 lt!421598))))))

(declare-fun b!935667 () Bool)

(assert (=> b!935667 (= e!525400 (contains!5076 (toList!6017 lt!421758) lt!421598))))

(assert (= (and d!113273 res!630076) b!935666))

(assert (= (and b!935666 res!630075) b!935667))

(declare-fun m!870169 () Bool)

(assert (=> d!113273 m!870169))

(declare-fun m!870171 () Bool)

(assert (=> d!113273 m!870171))

(declare-fun m!870173 () Bool)

(assert (=> d!113273 m!870173))

(declare-fun m!870175 () Bool)

(assert (=> d!113273 m!870175))

(declare-fun m!870177 () Bool)

(assert (=> b!935666 m!870177))

(declare-fun m!870179 () Bool)

(assert (=> b!935667 m!870179))

(assert (=> b!935434 d!113273))

(declare-fun d!113275 () Bool)

(assert (=> d!113275 (contains!5073 (+!2812 lt!421596 (tuple2!13307 lt!421593 lt!421591)) k0!1099)))

(declare-fun lt!421761 () Unit!31554)

(declare-fun choose!1551 (ListLongMap!12003 (_ BitVec 64) V!31865 (_ BitVec 64)) Unit!31554)

(assert (=> d!113275 (= lt!421761 (choose!1551 lt!421596 lt!421593 lt!421591 k0!1099))))

(assert (=> d!113275 (contains!5073 lt!421596 k0!1099)))

(assert (=> d!113275 (= (addStillContains!531 lt!421596 lt!421593 lt!421591 k0!1099) lt!421761)))

(declare-fun bs!26257 () Bool)

(assert (= bs!26257 d!113275))

(declare-fun m!870181 () Bool)

(assert (=> bs!26257 m!870181))

(assert (=> bs!26257 m!870181))

(declare-fun m!870183 () Bool)

(assert (=> bs!26257 m!870183))

(declare-fun m!870185 () Bool)

(assert (=> bs!26257 m!870185))

(assert (=> bs!26257 m!869881))

(assert (=> b!935434 d!113275))

(declare-fun d!113277 () Bool)

(declare-fun e!525403 () Bool)

(assert (=> d!113277 e!525403))

(declare-fun c!97325 () Bool)

(assert (=> d!113277 (= c!97325 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421764 () Unit!31554)

(declare-fun choose!1552 (array!56292 array!56294 (_ BitVec 32) (_ BitVec 32) V!31865 V!31865 (_ BitVec 64) (_ BitVec 32) Int) Unit!31554)

(assert (=> d!113277 (= lt!421764 (choose!1552 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113277 (validMask!0 mask!1881)))

(assert (=> d!113277 (= (lemmaListMapContainsThenArrayContainsFrom!284 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!421764)))

(declare-fun b!935673 () Bool)

(assert (=> b!935673 (= e!525403 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935674 () Bool)

(assert (=> b!935674 (= e!525403 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113277 c!97325) b!935673))

(assert (= (and d!113277 (not c!97325)) b!935674))

(declare-fun m!870187 () Bool)

(assert (=> d!113277 m!870187))

(assert (=> d!113277 m!869929))

(assert (=> b!935673 m!869927))

(assert (=> b!935434 d!113277))

(declare-fun d!113279 () Bool)

(declare-fun e!525405 () Bool)

(assert (=> d!113279 e!525405))

(declare-fun res!630077 () Bool)

(assert (=> d!113279 (=> res!630077 e!525405)))

(declare-fun lt!421765 () Bool)

(assert (=> d!113279 (= res!630077 (not lt!421765))))

(declare-fun lt!421768 () Bool)

(assert (=> d!113279 (= lt!421765 lt!421768)))

(declare-fun lt!421766 () Unit!31554)

(declare-fun e!525404 () Unit!31554)

(assert (=> d!113279 (= lt!421766 e!525404)))

(declare-fun c!97326 () Bool)

(assert (=> d!113279 (= c!97326 lt!421768)))

(assert (=> d!113279 (= lt!421768 (containsKey!449 (toList!6017 (+!2812 lt!421596 lt!421598)) k0!1099))))

(assert (=> d!113279 (= (contains!5073 (+!2812 lt!421596 lt!421598) k0!1099) lt!421765)))

(declare-fun b!935675 () Bool)

(declare-fun lt!421767 () Unit!31554)

(assert (=> b!935675 (= e!525404 lt!421767)))

(assert (=> b!935675 (= lt!421767 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6017 (+!2812 lt!421596 lt!421598)) k0!1099))))

(assert (=> b!935675 (isDefined!354 (getValueByKey!482 (toList!6017 (+!2812 lt!421596 lt!421598)) k0!1099))))

(declare-fun b!935676 () Bool)

(declare-fun Unit!31561 () Unit!31554)

(assert (=> b!935676 (= e!525404 Unit!31561)))

(declare-fun b!935677 () Bool)

(assert (=> b!935677 (= e!525405 (isDefined!354 (getValueByKey!482 (toList!6017 (+!2812 lt!421596 lt!421598)) k0!1099)))))

(assert (= (and d!113279 c!97326) b!935675))

(assert (= (and d!113279 (not c!97326)) b!935676))

(assert (= (and d!113279 (not res!630077)) b!935677))

(declare-fun m!870189 () Bool)

(assert (=> d!113279 m!870189))

(declare-fun m!870191 () Bool)

(assert (=> b!935675 m!870191))

(declare-fun m!870193 () Bool)

(assert (=> b!935675 m!870193))

(assert (=> b!935675 m!870193))

(declare-fun m!870195 () Bool)

(assert (=> b!935675 m!870195))

(assert (=> b!935677 m!870193))

(assert (=> b!935677 m!870193))

(assert (=> b!935677 m!870195))

(assert (=> b!935434 d!113279))

(declare-fun b!935678 () Bool)

(declare-fun e!525414 () Bool)

(declare-fun e!525408 () Bool)

(assert (=> b!935678 (= e!525414 e!525408)))

(declare-fun res!630084 () Bool)

(assert (=> b!935678 (=> (not res!630084) (not e!525408))))

(declare-fun lt!421780 () ListLongMap!12003)

(assert (=> b!935678 (= res!630084 (contains!5073 lt!421780 (select (arr!27087 _keys!1487) lt!421599)))))

(assert (=> b!935678 (and (bvsge lt!421599 #b00000000000000000000000000000000) (bvslt lt!421599 (size!27546 _keys!1487)))))

(declare-fun b!935679 () Bool)

(declare-fun e!525411 () Bool)

(declare-fun call!40755 () Bool)

(assert (=> b!935679 (= e!525411 (not call!40755))))

(declare-fun b!935680 () Bool)

(declare-fun e!525413 () Unit!31554)

(declare-fun lt!421788 () Unit!31554)

(assert (=> b!935680 (= e!525413 lt!421788)))

(declare-fun lt!421782 () ListLongMap!12003)

(assert (=> b!935680 (= lt!421782 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421599 defaultEntry!1235))))

(declare-fun lt!421774 () (_ BitVec 64))

(assert (=> b!935680 (= lt!421774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421769 () (_ BitVec 64))

(assert (=> b!935680 (= lt!421769 (select (arr!27087 _keys!1487) lt!421599))))

(declare-fun lt!421789 () Unit!31554)

(assert (=> b!935680 (= lt!421789 (addStillContains!531 lt!421782 lt!421774 zeroValue!1173 lt!421769))))

(assert (=> b!935680 (contains!5073 (+!2812 lt!421782 (tuple2!13307 lt!421774 zeroValue!1173)) lt!421769)))

(declare-fun lt!421779 () Unit!31554)

(assert (=> b!935680 (= lt!421779 lt!421789)))

(declare-fun lt!421786 () ListLongMap!12003)

(assert (=> b!935680 (= lt!421786 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421599 defaultEntry!1235))))

(declare-fun lt!421781 () (_ BitVec 64))

(assert (=> b!935680 (= lt!421781 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421778 () (_ BitVec 64))

(assert (=> b!935680 (= lt!421778 (select (arr!27087 _keys!1487) lt!421599))))

(declare-fun lt!421790 () Unit!31554)

(assert (=> b!935680 (= lt!421790 (addApplyDifferent!421 lt!421786 lt!421781 minValue!1173 lt!421778))))

(assert (=> b!935680 (= (apply!819 (+!2812 lt!421786 (tuple2!13307 lt!421781 minValue!1173)) lt!421778) (apply!819 lt!421786 lt!421778))))

(declare-fun lt!421787 () Unit!31554)

(assert (=> b!935680 (= lt!421787 lt!421790)))

(declare-fun lt!421771 () ListLongMap!12003)

(assert (=> b!935680 (= lt!421771 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421599 defaultEntry!1235))))

(declare-fun lt!421784 () (_ BitVec 64))

(assert (=> b!935680 (= lt!421784 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421770 () (_ BitVec 64))

(assert (=> b!935680 (= lt!421770 (select (arr!27087 _keys!1487) lt!421599))))

(declare-fun lt!421785 () Unit!31554)

(assert (=> b!935680 (= lt!421785 (addApplyDifferent!421 lt!421771 lt!421784 zeroValue!1173 lt!421770))))

(assert (=> b!935680 (= (apply!819 (+!2812 lt!421771 (tuple2!13307 lt!421784 zeroValue!1173)) lt!421770) (apply!819 lt!421771 lt!421770))))

(declare-fun lt!421777 () Unit!31554)

(assert (=> b!935680 (= lt!421777 lt!421785)))

(declare-fun lt!421776 () ListLongMap!12003)

(assert (=> b!935680 (= lt!421776 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421599 defaultEntry!1235))))

(declare-fun lt!421775 () (_ BitVec 64))

(assert (=> b!935680 (= lt!421775 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421783 () (_ BitVec 64))

(assert (=> b!935680 (= lt!421783 (select (arr!27087 _keys!1487) lt!421599))))

(assert (=> b!935680 (= lt!421788 (addApplyDifferent!421 lt!421776 lt!421775 minValue!1173 lt!421783))))

(assert (=> b!935680 (= (apply!819 (+!2812 lt!421776 (tuple2!13307 lt!421775 minValue!1173)) lt!421783) (apply!819 lt!421776 lt!421783))))

(declare-fun d!113281 () Bool)

(declare-fun e!525406 () Bool)

(assert (=> d!113281 e!525406))

(declare-fun res!630080 () Bool)

(assert (=> d!113281 (=> (not res!630080) (not e!525406))))

(assert (=> d!113281 (= res!630080 (or (bvsge lt!421599 (size!27546 _keys!1487)) (and (bvsge lt!421599 #b00000000000000000000000000000000) (bvslt lt!421599 (size!27546 _keys!1487)))))))

(declare-fun lt!421772 () ListLongMap!12003)

(assert (=> d!113281 (= lt!421780 lt!421772)))

(declare-fun lt!421773 () Unit!31554)

(assert (=> d!113281 (= lt!421773 e!525413)))

(declare-fun c!97327 () Bool)

(declare-fun e!525415 () Bool)

(assert (=> d!113281 (= c!97327 e!525415)))

(declare-fun res!630086 () Bool)

(assert (=> d!113281 (=> (not res!630086) (not e!525415))))

(assert (=> d!113281 (= res!630086 (bvslt lt!421599 (size!27546 _keys!1487)))))

(declare-fun e!525409 () ListLongMap!12003)

(assert (=> d!113281 (= lt!421772 e!525409)))

(declare-fun c!97332 () Bool)

(assert (=> d!113281 (= c!97332 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113281 (validMask!0 mask!1881)))

(assert (=> d!113281 (= (getCurrentListMap!3254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421599 defaultEntry!1235) lt!421780)))

(declare-fun b!935681 () Bool)

(declare-fun res!630081 () Bool)

(assert (=> b!935681 (=> (not res!630081) (not e!525406))))

(assert (=> b!935681 (= res!630081 e!525411)))

(declare-fun c!97328 () Bool)

(assert (=> b!935681 (= c!97328 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!935682 () Bool)

(declare-fun e!525417 () ListLongMap!12003)

(declare-fun call!40756 () ListLongMap!12003)

(assert (=> b!935682 (= e!525417 call!40756)))

(declare-fun b!935683 () Bool)

(declare-fun e!525412 () Bool)

(assert (=> b!935683 (= e!525412 (validKeyInArray!0 (select (arr!27087 _keys!1487) lt!421599)))))

(declare-fun b!935684 () Bool)

(declare-fun c!97331 () Bool)

(assert (=> b!935684 (= c!97331 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525407 () ListLongMap!12003)

(assert (=> b!935684 (= e!525407 e!525417)))

(declare-fun b!935685 () Bool)

(declare-fun call!40757 () ListLongMap!12003)

(assert (=> b!935685 (= e!525409 (+!2812 call!40757 (tuple2!13307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun call!40752 () ListLongMap!12003)

(declare-fun bm!40749 () Bool)

(assert (=> bm!40749 (= call!40752 (getCurrentListMapNoExtraKeys!3302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421599 defaultEntry!1235))))

(declare-fun b!935686 () Bool)

(declare-fun call!40758 () ListLongMap!12003)

(assert (=> b!935686 (= e!525417 call!40758)))

(declare-fun b!935687 () Bool)

(declare-fun e!525416 () Bool)

(assert (=> b!935687 (= e!525416 (= (apply!819 lt!421780 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40750 () Bool)

(declare-fun call!40753 () Bool)

(assert (=> bm!40750 (= call!40753 (contains!5073 lt!421780 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40751 () Bool)

(declare-fun call!40754 () ListLongMap!12003)

(assert (=> bm!40751 (= call!40758 call!40754)))

(declare-fun bm!40752 () Bool)

(assert (=> bm!40752 (= call!40754 call!40752)))

(declare-fun bm!40753 () Bool)

(declare-fun c!97330 () Bool)

(assert (=> bm!40753 (= call!40757 (+!2812 (ite c!97332 call!40752 (ite c!97330 call!40754 call!40758)) (ite (or c!97332 c!97330) (tuple2!13307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935688 () Bool)

(assert (=> b!935688 (= e!525415 (validKeyInArray!0 (select (arr!27087 _keys!1487) lt!421599)))))

(declare-fun b!935689 () Bool)

(assert (=> b!935689 (= e!525408 (= (apply!819 lt!421780 (select (arr!27087 _keys!1487) lt!421599)) (get!14269 (select (arr!27088 _values!1231) lt!421599) (dynLambda!1601 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935689 (and (bvsge lt!421599 #b00000000000000000000000000000000) (bvslt lt!421599 (size!27547 _values!1231)))))

(assert (=> b!935689 (and (bvsge lt!421599 #b00000000000000000000000000000000) (bvslt lt!421599 (size!27546 _keys!1487)))))

(declare-fun b!935690 () Bool)

(assert (=> b!935690 (= e!525409 e!525407)))

(assert (=> b!935690 (= c!97330 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935691 () Bool)

(declare-fun e!525410 () Bool)

(assert (=> b!935691 (= e!525406 e!525410)))

(declare-fun c!97329 () Bool)

(assert (=> b!935691 (= c!97329 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935692 () Bool)

(declare-fun e!525418 () Bool)

(assert (=> b!935692 (= e!525411 e!525418)))

(declare-fun res!630082 () Bool)

(assert (=> b!935692 (= res!630082 call!40755)))

(assert (=> b!935692 (=> (not res!630082) (not e!525418))))

(declare-fun b!935693 () Bool)

(assert (=> b!935693 (= e!525410 e!525416)))

(declare-fun res!630078 () Bool)

(assert (=> b!935693 (= res!630078 call!40753)))

(assert (=> b!935693 (=> (not res!630078) (not e!525416))))

(declare-fun bm!40754 () Bool)

(assert (=> bm!40754 (= call!40756 call!40757)))

(declare-fun b!935694 () Bool)

(declare-fun Unit!31562 () Unit!31554)

(assert (=> b!935694 (= e!525413 Unit!31562)))

(declare-fun bm!40755 () Bool)

(assert (=> bm!40755 (= call!40755 (contains!5073 lt!421780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935695 () Bool)

(assert (=> b!935695 (= e!525410 (not call!40753))))

(declare-fun b!935696 () Bool)

(assert (=> b!935696 (= e!525418 (= (apply!819 lt!421780 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935697 () Bool)

(assert (=> b!935697 (= e!525407 call!40756)))

(declare-fun b!935698 () Bool)

(declare-fun res!630083 () Bool)

(assert (=> b!935698 (=> (not res!630083) (not e!525406))))

(assert (=> b!935698 (= res!630083 e!525414)))

(declare-fun res!630079 () Bool)

(assert (=> b!935698 (=> res!630079 e!525414)))

(assert (=> b!935698 (= res!630079 (not e!525412))))

(declare-fun res!630085 () Bool)

(assert (=> b!935698 (=> (not res!630085) (not e!525412))))

(assert (=> b!935698 (= res!630085 (bvslt lt!421599 (size!27546 _keys!1487)))))

(assert (= (and d!113281 c!97332) b!935685))

(assert (= (and d!113281 (not c!97332)) b!935690))

(assert (= (and b!935690 c!97330) b!935697))

(assert (= (and b!935690 (not c!97330)) b!935684))

(assert (= (and b!935684 c!97331) b!935682))

(assert (= (and b!935684 (not c!97331)) b!935686))

(assert (= (or b!935682 b!935686) bm!40751))

(assert (= (or b!935697 bm!40751) bm!40752))

(assert (= (or b!935697 b!935682) bm!40754))

(assert (= (or b!935685 bm!40752) bm!40749))

(assert (= (or b!935685 bm!40754) bm!40753))

(assert (= (and d!113281 res!630086) b!935688))

(assert (= (and d!113281 c!97327) b!935680))

(assert (= (and d!113281 (not c!97327)) b!935694))

(assert (= (and d!113281 res!630080) b!935698))

(assert (= (and b!935698 res!630085) b!935683))

(assert (= (and b!935698 (not res!630079)) b!935678))

(assert (= (and b!935678 res!630084) b!935689))

(assert (= (and b!935698 res!630083) b!935681))

(assert (= (and b!935681 c!97328) b!935692))

(assert (= (and b!935681 (not c!97328)) b!935679))

(assert (= (and b!935692 res!630082) b!935696))

(assert (= (or b!935692 b!935679) bm!40755))

(assert (= (and b!935681 res!630081) b!935691))

(assert (= (and b!935691 c!97329) b!935693))

(assert (= (and b!935691 (not c!97329)) b!935695))

(assert (= (and b!935693 res!630078) b!935687))

(assert (= (or b!935693 b!935695) bm!40750))

(declare-fun b_lambda!14067 () Bool)

(assert (=> (not b_lambda!14067) (not b!935689)))

(assert (=> b!935689 t!27296))

(declare-fun b_and!28931 () Bool)

(assert (= b_and!28929 (and (=> t!27296 result!11953) b_and!28931)))

(declare-fun m!870197 () Bool)

(assert (=> b!935688 m!870197))

(assert (=> b!935688 m!870197))

(declare-fun m!870199 () Bool)

(assert (=> b!935688 m!870199))

(assert (=> d!113281 m!869929))

(assert (=> b!935678 m!870197))

(assert (=> b!935678 m!870197))

(declare-fun m!870201 () Bool)

(assert (=> b!935678 m!870201))

(declare-fun m!870203 () Bool)

(assert (=> bm!40749 m!870203))

(declare-fun m!870205 () Bool)

(assert (=> b!935680 m!870205))

(declare-fun m!870207 () Bool)

(assert (=> b!935680 m!870207))

(declare-fun m!870209 () Bool)

(assert (=> b!935680 m!870209))

(declare-fun m!870211 () Bool)

(assert (=> b!935680 m!870211))

(declare-fun m!870213 () Bool)

(assert (=> b!935680 m!870213))

(declare-fun m!870215 () Bool)

(assert (=> b!935680 m!870215))

(declare-fun m!870217 () Bool)

(assert (=> b!935680 m!870217))

(declare-fun m!870219 () Bool)

(assert (=> b!935680 m!870219))

(assert (=> b!935680 m!870211))

(declare-fun m!870221 () Bool)

(assert (=> b!935680 m!870221))

(declare-fun m!870223 () Bool)

(assert (=> b!935680 m!870223))

(assert (=> b!935680 m!870217))

(assert (=> b!935680 m!870203))

(assert (=> b!935680 m!870213))

(declare-fun m!870225 () Bool)

(assert (=> b!935680 m!870225))

(declare-fun m!870227 () Bool)

(assert (=> b!935680 m!870227))

(declare-fun m!870229 () Bool)

(assert (=> b!935680 m!870229))

(declare-fun m!870231 () Bool)

(assert (=> b!935680 m!870231))

(declare-fun m!870233 () Bool)

(assert (=> b!935680 m!870233))

(assert (=> b!935680 m!870205))

(assert (=> b!935680 m!870197))

(declare-fun m!870235 () Bool)

(assert (=> b!935685 m!870235))

(declare-fun m!870237 () Bool)

(assert (=> bm!40755 m!870237))

(declare-fun m!870239 () Bool)

(assert (=> bm!40750 m!870239))

(assert (=> b!935689 m!870197))

(declare-fun m!870241 () Bool)

(assert (=> b!935689 m!870241))

(assert (=> b!935689 m!869895))

(declare-fun m!870243 () Bool)

(assert (=> b!935689 m!870243))

(assert (=> b!935689 m!869895))

(declare-fun m!870245 () Bool)

(assert (=> b!935689 m!870245))

(assert (=> b!935689 m!870243))

(assert (=> b!935689 m!870197))

(declare-fun m!870247 () Bool)

(assert (=> b!935687 m!870247))

(declare-fun m!870249 () Bool)

(assert (=> b!935696 m!870249))

(declare-fun m!870251 () Bool)

(assert (=> bm!40753 m!870251))

(assert (=> b!935683 m!870197))

(assert (=> b!935683 m!870197))

(assert (=> b!935683 m!870199))

(assert (=> b!935434 d!113281))

(declare-fun d!113283 () Bool)

(declare-fun c!97335 () Bool)

(assert (=> d!113283 (= c!97335 ((_ is ValueCellFull!9606) (select (arr!27088 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!525421 () V!31865)

(assert (=> d!113283 (= (get!14269 (select (arr!27088 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1601 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!525421)))

(declare-fun b!935703 () Bool)

(declare-fun get!14271 (ValueCell!9606 V!31865) V!31865)

(assert (=> b!935703 (= e!525421 (get!14271 (select (arr!27088 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1601 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935704 () Bool)

(declare-fun get!14272 (ValueCell!9606 V!31865) V!31865)

(assert (=> b!935704 (= e!525421 (get!14272 (select (arr!27088 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1601 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113283 c!97335) b!935703))

(assert (= (and d!113283 (not c!97335)) b!935704))

(assert (=> b!935703 m!869893))

(assert (=> b!935703 m!869895))

(declare-fun m!870253 () Bool)

(assert (=> b!935703 m!870253))

(assert (=> b!935704 m!869893))

(assert (=> b!935704 m!869895))

(declare-fun m!870255 () Bool)

(assert (=> b!935704 m!870255))

(assert (=> b!935434 d!113283))

(declare-fun d!113285 () Bool)

(assert (=> d!113285 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19083)))

(declare-fun lt!421793 () Unit!31554)

(declare-fun choose!39 (array!56292 (_ BitVec 32) (_ BitVec 32)) Unit!31554)

(assert (=> d!113285 (= lt!421793 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113285 (bvslt (size!27546 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113285 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!421793)))

(declare-fun bs!26258 () Bool)

(assert (= bs!26258 d!113285))

(assert (=> bs!26258 m!869907))

(declare-fun m!870257 () Bool)

(assert (=> bs!26258 m!870257))

(assert (=> b!935434 d!113285))

(declare-fun d!113287 () Bool)

(assert (=> d!113287 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79582 d!113287))

(declare-fun d!113289 () Bool)

(assert (=> d!113289 (= (array_inv!21080 _values!1231) (bvsge (size!27547 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79582 d!113289))

(declare-fun d!113291 () Bool)

(assert (=> d!113291 (= (array_inv!21081 _keys!1487) (bvsge (size!27546 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79582 d!113291))

(declare-fun d!113293 () Bool)

(declare-fun res!630087 () Bool)

(declare-fun e!525422 () Bool)

(assert (=> d!113293 (=> res!630087 e!525422)))

(assert (=> d!113293 (= res!630087 (= (select (arr!27087 _keys!1487) lt!421599) k0!1099))))

(assert (=> d!113293 (= (arrayContainsKey!0 _keys!1487 k0!1099 lt!421599) e!525422)))

(declare-fun b!935705 () Bool)

(declare-fun e!525423 () Bool)

(assert (=> b!935705 (= e!525422 e!525423)))

(declare-fun res!630088 () Bool)

(assert (=> b!935705 (=> (not res!630088) (not e!525423))))

(assert (=> b!935705 (= res!630088 (bvslt (bvadd lt!421599 #b00000000000000000000000000000001) (size!27546 _keys!1487)))))

(declare-fun b!935706 () Bool)

(assert (=> b!935706 (= e!525423 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd lt!421599 #b00000000000000000000000000000001)))))

(assert (= (and d!113293 (not res!630087)) b!935705))

(assert (= (and b!935705 res!630088) b!935706))

(assert (=> d!113293 m!870197))

(declare-fun m!870259 () Bool)

(assert (=> b!935706 m!870259))

(assert (=> b!935435 d!113293))

(declare-fun d!113295 () Bool)

(assert (=> d!113295 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935446 d!113295))

(declare-fun d!113297 () Bool)

(declare-fun get!14273 (Option!488) V!31865)

(assert (=> d!113297 (= (apply!819 lt!421596 k0!1099) (get!14273 (getValueByKey!482 (toList!6017 lt!421596) k0!1099)))))

(declare-fun bs!26259 () Bool)

(assert (= bs!26259 d!113297))

(assert (=> bs!26259 m!870019))

(assert (=> bs!26259 m!870019))

(declare-fun m!870261 () Bool)

(assert (=> bs!26259 m!870261))

(assert (=> b!935437 d!113297))

(declare-fun mapNonEmpty!32037 () Bool)

(declare-fun mapRes!32037 () Bool)

(declare-fun tp!61463 () Bool)

(declare-fun e!525429 () Bool)

(assert (=> mapNonEmpty!32037 (= mapRes!32037 (and tp!61463 e!525429))))

(declare-fun mapKey!32037 () (_ BitVec 32))

(declare-fun mapValue!32037 () ValueCell!9606)

(declare-fun mapRest!32037 () (Array (_ BitVec 32) ValueCell!9606))

(assert (=> mapNonEmpty!32037 (= mapRest!32031 (store mapRest!32037 mapKey!32037 mapValue!32037))))

(declare-fun b!935714 () Bool)

(declare-fun e!525428 () Bool)

(assert (=> b!935714 (= e!525428 tp_is_empty!20175)))

(declare-fun mapIsEmpty!32037 () Bool)

(assert (=> mapIsEmpty!32037 mapRes!32037))

(declare-fun b!935713 () Bool)

(assert (=> b!935713 (= e!525429 tp_is_empty!20175)))

(declare-fun condMapEmpty!32037 () Bool)

(declare-fun mapDefault!32037 () ValueCell!9606)

(assert (=> mapNonEmpty!32031 (= condMapEmpty!32037 (= mapRest!32031 ((as const (Array (_ BitVec 32) ValueCell!9606)) mapDefault!32037)))))

(assert (=> mapNonEmpty!32031 (= tp!61454 (and e!525428 mapRes!32037))))

(assert (= (and mapNonEmpty!32031 condMapEmpty!32037) mapIsEmpty!32037))

(assert (= (and mapNonEmpty!32031 (not condMapEmpty!32037)) mapNonEmpty!32037))

(assert (= (and mapNonEmpty!32037 ((_ is ValueCellFull!9606) mapValue!32037)) b!935713))

(assert (= (and mapNonEmpty!32031 ((_ is ValueCellFull!9606) mapDefault!32037)) b!935714))

(declare-fun m!870263 () Bool)

(assert (=> mapNonEmpty!32037 m!870263))

(declare-fun b_lambda!14069 () Bool)

(assert (= b_lambda!14065 (or (and start!79582 b_free!17667) b_lambda!14069)))

(declare-fun b_lambda!14071 () Bool)

(assert (= b_lambda!14063 (or (and start!79582 b_free!17667) b_lambda!14071)))

(declare-fun b_lambda!14073 () Bool)

(assert (= b_lambda!14067 (or (and start!79582 b_free!17667) b_lambda!14073)))

(declare-fun b_lambda!14075 () Bool)

(assert (= b_lambda!14061 (or (and start!79582 b_free!17667) b_lambda!14075)))

(check-sat (not bm!40745) (not b!935687) (not d!113281) (not bm!40750) (not b!935660) (not d!113273) (not b!935696) (not b!935591) (not bm!40741) (not d!113267) (not b!935602) (not bm!40747) (not d!113297) (not b!935667) (not b!935586) b_and!28931 (not b!935655) (not bm!40753) (not b!935637) (not bm!40749) (not b!935688) tp_is_empty!20175 (not b!935609) (not b!935539) (not bm!40732) (not b!935517) (not b!935664) (not b!935589) (not d!113261) (not bm!40731) (not b!935665) (not b!935704) (not bm!40740) (not b!935636) (not b!935673) (not b!935595) (not b!935685) (not bm!40735) (not b!935593) (not b!935648) (not b!935616) (not b!935644) (not b_lambda!14073) (not d!113253) (not b!935647) (not bm!40737) (not b!935618) (not b!935703) (not b!935629) (not b!935627) (not b!935642) (not b!935675) (not b!935689) (not b_next!17667) (not b!935610) (not b!935680) (not b!935594) (not b!935663) (not b!935639) (not d!113251) (not bm!40748) (not b!935666) (not b!935646) (not d!113265) (not b_lambda!14059) (not b!935683) (not b!935706) (not bm!40742) (not bm!40716) (not d!113247) (not b!935531) (not bm!40755) (not mapNonEmpty!32037) (not d!113275) (not b!935678) (not b!935584) (not d!113277) (not d!113269) (not b!935541) (not b!935635) (not b!935677) (not b_lambda!14071) (not d!113285) (not b_lambda!14075) (not d!113279) (not b!935530) (not b!935532) (not b_lambda!14069))
(check-sat b_and!28931 (not b_next!17667))
