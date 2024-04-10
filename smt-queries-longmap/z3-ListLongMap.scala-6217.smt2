; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79438 () Bool)

(assert start!79438)

(declare-fun b_free!17625 () Bool)

(declare-fun b_next!17625 () Bool)

(assert (=> start!79438 (= b_free!17625 (not b_next!17625))))

(declare-fun tp!61318 () Bool)

(declare-fun b_and!28809 () Bool)

(assert (=> start!79438 (= tp!61318 b_and!28809)))

(declare-fun b!933808 () Bool)

(declare-fun res!628975 () Bool)

(declare-fun e!524336 () Bool)

(assert (=> b!933808 (=> (not res!628975) (not e!524336))))

(declare-datatypes ((array!56202 0))(
  ( (array!56203 (arr!27045 (Array (_ BitVec 32) (_ BitVec 64))) (size!27504 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56202)

(declare-datatypes ((List!19047 0))(
  ( (Nil!19044) (Cons!19043 (h!20189 (_ BitVec 64)) (t!27216 List!19047)) )
))
(declare-fun arrayNoDuplicates!0 (array!56202 (_ BitVec 32) List!19047) Bool)

(assert (=> b!933808 (= res!628975 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19044))))

(declare-fun b!933809 () Bool)

(declare-fun e!524337 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!933809 (= e!524337 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!933810 () Bool)

(declare-fun res!628982 () Bool)

(declare-fun e!524333 () Bool)

(assert (=> b!933810 (=> (not res!628982) (not e!524333))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933810 (= res!628982 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933811 () Bool)

(declare-fun res!628979 () Bool)

(assert (=> b!933811 (=> (not res!628979) (not e!524336))))

(assert (=> b!933811 (= res!628979 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27504 _keys!1487))))))

(declare-fun res!628980 () Bool)

(assert (=> start!79438 (=> (not res!628980) (not e!524336))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79438 (= res!628980 (validMask!0 mask!1881))))

(assert (=> start!79438 e!524336))

(assert (=> start!79438 true))

(declare-fun tp_is_empty!20133 () Bool)

(assert (=> start!79438 tp_is_empty!20133))

(declare-datatypes ((V!31809 0))(
  ( (V!31810 (val!10117 Int)) )
))
(declare-datatypes ((ValueCell!9585 0))(
  ( (ValueCellFull!9585 (v!12636 V!31809)) (EmptyCell!9585) )
))
(declare-datatypes ((array!56204 0))(
  ( (array!56205 (arr!27046 (Array (_ BitVec 32) ValueCell!9585)) (size!27505 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56204)

(declare-fun e!524330 () Bool)

(declare-fun array_inv!21050 (array!56204) Bool)

(assert (=> start!79438 (and (array_inv!21050 _values!1231) e!524330)))

(assert (=> start!79438 tp!61318))

(declare-fun array_inv!21051 (array!56202) Bool)

(assert (=> start!79438 (array_inv!21051 _keys!1487)))

(declare-fun mapNonEmpty!31959 () Bool)

(declare-fun mapRes!31959 () Bool)

(declare-fun tp!61319 () Bool)

(declare-fun e!524335 () Bool)

(assert (=> mapNonEmpty!31959 (= mapRes!31959 (and tp!61319 e!524335))))

(declare-fun mapRest!31959 () (Array (_ BitVec 32) ValueCell!9585))

(declare-fun mapValue!31959 () ValueCell!9585)

(declare-fun mapKey!31959 () (_ BitVec 32))

(assert (=> mapNonEmpty!31959 (= (arr!27046 _values!1231) (store mapRest!31959 mapKey!31959 mapValue!31959))))

(declare-fun b!933812 () Bool)

(declare-fun res!628978 () Bool)

(assert (=> b!933812 (=> (not res!628978) (not e!524336))))

(assert (=> b!933812 (= res!628978 (and (= (size!27505 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27504 _keys!1487) (size!27505 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933813 () Bool)

(declare-fun e!524331 () Bool)

(assert (=> b!933813 (= e!524333 e!524331)))

(declare-fun res!628981 () Bool)

(assert (=> b!933813 (=> (not res!628981) (not e!524331))))

(declare-fun lt!420590 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933813 (= res!628981 (validKeyInArray!0 lt!420590))))

(assert (=> b!933813 (= lt!420590 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933814 () Bool)

(declare-fun e!524332 () Bool)

(assert (=> b!933814 (= e!524332 tp_is_empty!20133)))

(declare-fun b!933815 () Bool)

(declare-fun res!628977 () Bool)

(assert (=> b!933815 (=> (not res!628977) (not e!524333))))

(declare-fun v!791 () V!31809)

(declare-datatypes ((tuple2!13264 0))(
  ( (tuple2!13265 (_1!6643 (_ BitVec 64)) (_2!6643 V!31809)) )
))
(declare-datatypes ((List!19048 0))(
  ( (Nil!19045) (Cons!19044 (h!20190 tuple2!13264) (t!27217 List!19048)) )
))
(declare-datatypes ((ListLongMap!11961 0))(
  ( (ListLongMap!11962 (toList!5996 List!19048)) )
))
(declare-fun lt!420593 () ListLongMap!11961)

(declare-fun apply!805 (ListLongMap!11961 (_ BitVec 64)) V!31809)

(assert (=> b!933815 (= res!628977 (= (apply!805 lt!420593 k0!1099) v!791))))

(declare-fun b!933816 () Bool)

(declare-fun res!628984 () Bool)

(assert (=> b!933816 (=> (not res!628984) (not e!524333))))

(assert (=> b!933816 (= res!628984 (validKeyInArray!0 k0!1099))))

(declare-fun b!933817 () Bool)

(declare-fun arrayContainsKey!0 (array!56202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!933817 (= e!524337 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!933818 () Bool)

(assert (=> b!933818 (= e!524331 (not (bvslt (size!27504 _keys!1487) #b01111111111111111111111111111111)))))

(assert (=> b!933818 e!524337))

(declare-fun c!97081 () Bool)

(assert (=> b!933818 (= c!97081 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31509 0))(
  ( (Unit!31510) )
))
(declare-fun lt!420594 () Unit!31509)

(declare-fun zeroValue!1173 () V!31809)

(declare-fun minValue!1173 () V!31809)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!269 (array!56202 array!56204 (_ BitVec 32) (_ BitVec 32) V!31809 V!31809 (_ BitVec 64) (_ BitVec 32) Int) Unit!31509)

(assert (=> b!933818 (= lt!420594 (lemmaListMapContainsThenArrayContainsFrom!269 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!933818 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19044)))

(declare-fun lt!420589 () Unit!31509)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56202 (_ BitVec 32) (_ BitVec 32)) Unit!31509)

(assert (=> b!933818 (= lt!420589 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420596 () tuple2!13264)

(declare-fun contains!5045 (ListLongMap!11961 (_ BitVec 64)) Bool)

(declare-fun +!2797 (ListLongMap!11961 tuple2!13264) ListLongMap!11961)

(assert (=> b!933818 (contains!5045 (+!2797 lt!420593 lt!420596) k0!1099)))

(declare-fun lt!420591 () Unit!31509)

(declare-fun lt!420592 () V!31809)

(declare-fun addStillContains!516 (ListLongMap!11961 (_ BitVec 64) V!31809 (_ BitVec 64)) Unit!31509)

(assert (=> b!933818 (= lt!420591 (addStillContains!516 lt!420593 lt!420590 lt!420592 k0!1099))))

(declare-fun getCurrentListMap!3234 (array!56202 array!56204 (_ BitVec 32) (_ BitVec 32) V!31809 V!31809 (_ BitVec 32) Int) ListLongMap!11961)

(assert (=> b!933818 (= (getCurrentListMap!3234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2797 (getCurrentListMap!3234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420596))))

(assert (=> b!933818 (= lt!420596 (tuple2!13265 lt!420590 lt!420592))))

(declare-fun get!14231 (ValueCell!9585 V!31809) V!31809)

(declare-fun dynLambda!1586 (Int (_ BitVec 64)) V!31809)

(assert (=> b!933818 (= lt!420592 (get!14231 (select (arr!27046 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1586 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420595 () Unit!31509)

(declare-fun lemmaListMapRecursiveValidKeyArray!187 (array!56202 array!56204 (_ BitVec 32) (_ BitVec 32) V!31809 V!31809 (_ BitVec 32) Int) Unit!31509)

(assert (=> b!933818 (= lt!420595 (lemmaListMapRecursiveValidKeyArray!187 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933819 () Bool)

(declare-fun res!628983 () Bool)

(assert (=> b!933819 (=> (not res!628983) (not e!524336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56202 (_ BitVec 32)) Bool)

(assert (=> b!933819 (= res!628983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933820 () Bool)

(assert (=> b!933820 (= e!524336 e!524333)))

(declare-fun res!628976 () Bool)

(assert (=> b!933820 (=> (not res!628976) (not e!524333))))

(assert (=> b!933820 (= res!628976 (contains!5045 lt!420593 k0!1099))))

(assert (=> b!933820 (= lt!420593 (getCurrentListMap!3234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933821 () Bool)

(assert (=> b!933821 (= e!524335 tp_is_empty!20133)))

(declare-fun mapIsEmpty!31959 () Bool)

(assert (=> mapIsEmpty!31959 mapRes!31959))

(declare-fun b!933822 () Bool)

(assert (=> b!933822 (= e!524330 (and e!524332 mapRes!31959))))

(declare-fun condMapEmpty!31959 () Bool)

(declare-fun mapDefault!31959 () ValueCell!9585)

(assert (=> b!933822 (= condMapEmpty!31959 (= (arr!27046 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9585)) mapDefault!31959)))))

(assert (= (and start!79438 res!628980) b!933812))

(assert (= (and b!933812 res!628978) b!933819))

(assert (= (and b!933819 res!628983) b!933808))

(assert (= (and b!933808 res!628975) b!933811))

(assert (= (and b!933811 res!628979) b!933820))

(assert (= (and b!933820 res!628976) b!933815))

(assert (= (and b!933815 res!628977) b!933810))

(assert (= (and b!933810 res!628982) b!933816))

(assert (= (and b!933816 res!628984) b!933813))

(assert (= (and b!933813 res!628981) b!933818))

(assert (= (and b!933818 c!97081) b!933817))

(assert (= (and b!933818 (not c!97081)) b!933809))

(assert (= (and b!933822 condMapEmpty!31959) mapIsEmpty!31959))

(assert (= (and b!933822 (not condMapEmpty!31959)) mapNonEmpty!31959))

(get-info :version)

(assert (= (and mapNonEmpty!31959 ((_ is ValueCellFull!9585) mapValue!31959)) b!933821))

(assert (= (and b!933822 ((_ is ValueCellFull!9585) mapDefault!31959)) b!933814))

(assert (= start!79438 b!933822))

(declare-fun b_lambda!13959 () Bool)

(assert (=> (not b_lambda!13959) (not b!933818)))

(declare-fun t!27215 () Bool)

(declare-fun tb!6019 () Bool)

(assert (=> (and start!79438 (= defaultEntry!1235 defaultEntry!1235) t!27215) tb!6019))

(declare-fun result!11863 () Bool)

(assert (=> tb!6019 (= result!11863 tp_is_empty!20133)))

(assert (=> b!933818 t!27215))

(declare-fun b_and!28811 () Bool)

(assert (= b_and!28809 (and (=> t!27215 result!11863) b_and!28811)))

(declare-fun m!867995 () Bool)

(assert (=> b!933813 m!867995))

(declare-fun m!867997 () Bool)

(assert (=> b!933813 m!867997))

(declare-fun m!867999 () Bool)

(assert (=> b!933816 m!867999))

(declare-fun m!868001 () Bool)

(assert (=> b!933819 m!868001))

(declare-fun m!868003 () Bool)

(assert (=> b!933808 m!868003))

(declare-fun m!868005 () Bool)

(assert (=> mapNonEmpty!31959 m!868005))

(declare-fun m!868007 () Bool)

(assert (=> b!933815 m!868007))

(declare-fun m!868009 () Bool)

(assert (=> b!933818 m!868009))

(declare-fun m!868011 () Bool)

(assert (=> b!933818 m!868011))

(declare-fun m!868013 () Bool)

(assert (=> b!933818 m!868013))

(declare-fun m!868015 () Bool)

(assert (=> b!933818 m!868015))

(declare-fun m!868017 () Bool)

(assert (=> b!933818 m!868017))

(declare-fun m!868019 () Bool)

(assert (=> b!933818 m!868019))

(declare-fun m!868021 () Bool)

(assert (=> b!933818 m!868021))

(assert (=> b!933818 m!868009))

(declare-fun m!868023 () Bool)

(assert (=> b!933818 m!868023))

(assert (=> b!933818 m!868015))

(assert (=> b!933818 m!868021))

(declare-fun m!868025 () Bool)

(assert (=> b!933818 m!868025))

(declare-fun m!868027 () Bool)

(assert (=> b!933818 m!868027))

(declare-fun m!868029 () Bool)

(assert (=> b!933818 m!868029))

(declare-fun m!868031 () Bool)

(assert (=> b!933818 m!868031))

(assert (=> b!933818 m!868017))

(declare-fun m!868033 () Bool)

(assert (=> b!933818 m!868033))

(declare-fun m!868035 () Bool)

(assert (=> b!933820 m!868035))

(declare-fun m!868037 () Bool)

(assert (=> b!933820 m!868037))

(declare-fun m!868039 () Bool)

(assert (=> start!79438 m!868039))

(declare-fun m!868041 () Bool)

(assert (=> start!79438 m!868041))

(declare-fun m!868043 () Bool)

(assert (=> start!79438 m!868043))

(declare-fun m!868045 () Bool)

(assert (=> b!933817 m!868045))

(check-sat (not b!933815) b_and!28811 (not b!933808) (not b!933817) (not b!933816) (not b_lambda!13959) (not b_next!17625) (not b!933818) (not start!79438) (not mapNonEmpty!31959) tp_is_empty!20133 (not b!933813) (not b!933820) (not b!933819))
(check-sat b_and!28811 (not b_next!17625))
(get-model)

(declare-fun b_lambda!13963 () Bool)

(assert (= b_lambda!13959 (or (and start!79438 b_free!17625) b_lambda!13963)))

(check-sat (not b!933815) b_and!28811 (not b!933808) (not b!933817) (not b_lambda!13963) (not b!933816) (not b_next!17625) (not b!933818) (not start!79438) (not mapNonEmpty!31959) tp_is_empty!20133 (not b!933813) (not b!933820) (not b!933819))
(check-sat b_and!28811 (not b_next!17625))
(get-model)

(declare-fun d!113093 () Bool)

(declare-fun res!629019 () Bool)

(declare-fun e!524366 () Bool)

(assert (=> d!113093 (=> res!629019 e!524366)))

(assert (=> d!113093 (= res!629019 (= (select (arr!27045 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113093 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!524366)))

(declare-fun b!933876 () Bool)

(declare-fun e!524367 () Bool)

(assert (=> b!933876 (= e!524366 e!524367)))

(declare-fun res!629020 () Bool)

(assert (=> b!933876 (=> (not res!629020) (not e!524367))))

(assert (=> b!933876 (= res!629020 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27504 _keys!1487)))))

(declare-fun b!933877 () Bool)

(assert (=> b!933877 (= e!524367 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113093 (not res!629019)) b!933876))

(assert (= (and b!933876 res!629020) b!933877))

(declare-fun m!868099 () Bool)

(assert (=> d!113093 m!868099))

(declare-fun m!868101 () Bool)

(assert (=> b!933877 m!868101))

(assert (=> b!933817 d!113093))

(declare-fun d!113095 () Bool)

(assert (=> d!113095 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!933816 d!113095))

(declare-fun d!113097 () Bool)

(declare-fun e!524370 () Bool)

(assert (=> d!113097 e!524370))

(declare-fun res!629025 () Bool)

(assert (=> d!113097 (=> (not res!629025) (not e!524370))))

(declare-fun lt!420630 () ListLongMap!11961)

(assert (=> d!113097 (= res!629025 (contains!5045 lt!420630 (_1!6643 lt!420596)))))

(declare-fun lt!420632 () List!19048)

(assert (=> d!113097 (= lt!420630 (ListLongMap!11962 lt!420632))))

(declare-fun lt!420631 () Unit!31509)

(declare-fun lt!420629 () Unit!31509)

(assert (=> d!113097 (= lt!420631 lt!420629)))

(declare-datatypes ((Option!485 0))(
  ( (Some!484 (v!12638 V!31809)) (None!483) )
))
(declare-fun getValueByKey!479 (List!19048 (_ BitVec 64)) Option!485)

(assert (=> d!113097 (= (getValueByKey!479 lt!420632 (_1!6643 lt!420596)) (Some!484 (_2!6643 lt!420596)))))

(declare-fun lemmaContainsTupThenGetReturnValue!255 (List!19048 (_ BitVec 64) V!31809) Unit!31509)

(assert (=> d!113097 (= lt!420629 (lemmaContainsTupThenGetReturnValue!255 lt!420632 (_1!6643 lt!420596) (_2!6643 lt!420596)))))

(declare-fun insertStrictlySorted!312 (List!19048 (_ BitVec 64) V!31809) List!19048)

(assert (=> d!113097 (= lt!420632 (insertStrictlySorted!312 (toList!5996 lt!420593) (_1!6643 lt!420596) (_2!6643 lt!420596)))))

(assert (=> d!113097 (= (+!2797 lt!420593 lt!420596) lt!420630)))

(declare-fun b!933882 () Bool)

(declare-fun res!629026 () Bool)

(assert (=> b!933882 (=> (not res!629026) (not e!524370))))

(assert (=> b!933882 (= res!629026 (= (getValueByKey!479 (toList!5996 lt!420630) (_1!6643 lt!420596)) (Some!484 (_2!6643 lt!420596))))))

(declare-fun b!933883 () Bool)

(declare-fun contains!5047 (List!19048 tuple2!13264) Bool)

(assert (=> b!933883 (= e!524370 (contains!5047 (toList!5996 lt!420630) lt!420596))))

(assert (= (and d!113097 res!629025) b!933882))

(assert (= (and b!933882 res!629026) b!933883))

(declare-fun m!868103 () Bool)

(assert (=> d!113097 m!868103))

(declare-fun m!868105 () Bool)

(assert (=> d!113097 m!868105))

(declare-fun m!868107 () Bool)

(assert (=> d!113097 m!868107))

(declare-fun m!868109 () Bool)

(assert (=> d!113097 m!868109))

(declare-fun m!868111 () Bool)

(assert (=> b!933882 m!868111))

(declare-fun m!868113 () Bool)

(assert (=> b!933883 m!868113))

(assert (=> b!933818 d!113097))

(declare-fun bm!40602 () Bool)

(declare-fun call!40607 () ListLongMap!11961)

(declare-fun call!40611 () ListLongMap!11961)

(assert (=> bm!40602 (= call!40607 call!40611)))

(declare-fun b!933926 () Bool)

(declare-fun e!524406 () Bool)

(assert (=> b!933926 (= e!524406 (validKeyInArray!0 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!933927 () Bool)

(declare-fun e!524398 () Bool)

(declare-fun call!40608 () Bool)

(assert (=> b!933927 (= e!524398 (not call!40608))))

(declare-fun b!933928 () Bool)

(declare-fun e!524407 () Bool)

(declare-fun lt!420677 () ListLongMap!11961)

(assert (=> b!933928 (= e!524407 (= (apply!805 lt!420677 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!933929 () Bool)

(declare-fun e!524399 () Bool)

(declare-fun e!524400 () Bool)

(assert (=> b!933929 (= e!524399 e!524400)))

(declare-fun c!97097 () Bool)

(assert (=> b!933929 (= c!97097 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40603 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3299 (array!56202 array!56204 (_ BitVec 32) (_ BitVec 32) V!31809 V!31809 (_ BitVec 32) Int) ListLongMap!11961)

(assert (=> bm!40603 (= call!40611 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933930 () Bool)

(declare-fun c!97100 () Bool)

(assert (=> b!933930 (= c!97100 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!524408 () ListLongMap!11961)

(declare-fun e!524405 () ListLongMap!11961)

(assert (=> b!933930 (= e!524408 e!524405)))

(declare-fun b!933931 () Bool)

(declare-fun e!524409 () ListLongMap!11961)

(assert (=> b!933931 (= e!524409 e!524408)))

(declare-fun c!97099 () Bool)

(assert (=> b!933931 (= c!97099 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!933932 () Bool)

(declare-fun e!524403 () Unit!31509)

(declare-fun Unit!31511 () Unit!31509)

(assert (=> b!933932 (= e!524403 Unit!31511)))

(declare-fun b!933933 () Bool)

(assert (=> b!933933 (= e!524398 e!524407)))

(declare-fun res!629046 () Bool)

(assert (=> b!933933 (= res!629046 call!40608)))

(assert (=> b!933933 (=> (not res!629046) (not e!524407))))

(declare-fun b!933934 () Bool)

(declare-fun e!524404 () Bool)

(assert (=> b!933934 (= e!524404 (validKeyInArray!0 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!933935 () Bool)

(declare-fun e!524402 () Bool)

(assert (=> b!933935 (= e!524400 e!524402)))

(declare-fun res!629045 () Bool)

(declare-fun call!40609 () Bool)

(assert (=> b!933935 (= res!629045 call!40609)))

(assert (=> b!933935 (=> (not res!629045) (not e!524402))))

(declare-fun b!933936 () Bool)

(declare-fun res!629048 () Bool)

(assert (=> b!933936 (=> (not res!629048) (not e!524399))))

(declare-fun e!524397 () Bool)

(assert (=> b!933936 (= res!629048 e!524397)))

(declare-fun res!629053 () Bool)

(assert (=> b!933936 (=> res!629053 e!524397)))

(assert (=> b!933936 (= res!629053 (not e!524404))))

(declare-fun res!629050 () Bool)

(assert (=> b!933936 (=> (not res!629050) (not e!524404))))

(assert (=> b!933936 (= res!629050 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27504 _keys!1487)))))

(declare-fun b!933937 () Bool)

(declare-fun call!40606 () ListLongMap!11961)

(assert (=> b!933937 (= e!524408 call!40606)))

(declare-fun b!933938 () Bool)

(declare-fun res!629052 () Bool)

(assert (=> b!933938 (=> (not res!629052) (not e!524399))))

(assert (=> b!933938 (= res!629052 e!524398)))

(declare-fun c!97098 () Bool)

(assert (=> b!933938 (= c!97098 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40604 () Bool)

(declare-fun call!40610 () ListLongMap!11961)

(assert (=> bm!40604 (= call!40606 call!40610)))

(declare-fun bm!40605 () Bool)

(assert (=> bm!40605 (= call!40609 (contains!5045 lt!420677 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113099 () Bool)

(assert (=> d!113099 e!524399))

(declare-fun res!629049 () Bool)

(assert (=> d!113099 (=> (not res!629049) (not e!524399))))

(assert (=> d!113099 (= res!629049 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27504 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27504 _keys!1487)))))))

(declare-fun lt!420678 () ListLongMap!11961)

(assert (=> d!113099 (= lt!420677 lt!420678)))

(declare-fun lt!420695 () Unit!31509)

(assert (=> d!113099 (= lt!420695 e!524403)))

(declare-fun c!97102 () Bool)

(assert (=> d!113099 (= c!97102 e!524406)))

(declare-fun res!629051 () Bool)

(assert (=> d!113099 (=> (not res!629051) (not e!524406))))

(assert (=> d!113099 (= res!629051 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27504 _keys!1487)))))

(assert (=> d!113099 (= lt!420678 e!524409)))

(declare-fun c!97101 () Bool)

(assert (=> d!113099 (= c!97101 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113099 (validMask!0 mask!1881)))

(assert (=> d!113099 (= (getCurrentListMap!3234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!420677)))

(declare-fun b!933939 () Bool)

(declare-fun lt!420688 () Unit!31509)

(assert (=> b!933939 (= e!524403 lt!420688)))

(declare-fun lt!420692 () ListLongMap!11961)

(assert (=> b!933939 (= lt!420692 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420680 () (_ BitVec 64))

(assert (=> b!933939 (= lt!420680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420693 () (_ BitVec 64))

(assert (=> b!933939 (= lt!420693 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420697 () Unit!31509)

(assert (=> b!933939 (= lt!420697 (addStillContains!516 lt!420692 lt!420680 zeroValue!1173 lt!420693))))

(assert (=> b!933939 (contains!5045 (+!2797 lt!420692 (tuple2!13265 lt!420680 zeroValue!1173)) lt!420693)))

(declare-fun lt!420691 () Unit!31509)

(assert (=> b!933939 (= lt!420691 lt!420697)))

(declare-fun lt!420696 () ListLongMap!11961)

(assert (=> b!933939 (= lt!420696 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420679 () (_ BitVec 64))

(assert (=> b!933939 (= lt!420679 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420686 () (_ BitVec 64))

(assert (=> b!933939 (= lt!420686 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420684 () Unit!31509)

(declare-fun addApplyDifferent!418 (ListLongMap!11961 (_ BitVec 64) V!31809 (_ BitVec 64)) Unit!31509)

(assert (=> b!933939 (= lt!420684 (addApplyDifferent!418 lt!420696 lt!420679 minValue!1173 lt!420686))))

(assert (=> b!933939 (= (apply!805 (+!2797 lt!420696 (tuple2!13265 lt!420679 minValue!1173)) lt!420686) (apply!805 lt!420696 lt!420686))))

(declare-fun lt!420694 () Unit!31509)

(assert (=> b!933939 (= lt!420694 lt!420684)))

(declare-fun lt!420689 () ListLongMap!11961)

(assert (=> b!933939 (= lt!420689 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420698 () (_ BitVec 64))

(assert (=> b!933939 (= lt!420698 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420681 () (_ BitVec 64))

(assert (=> b!933939 (= lt!420681 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420687 () Unit!31509)

(assert (=> b!933939 (= lt!420687 (addApplyDifferent!418 lt!420689 lt!420698 zeroValue!1173 lt!420681))))

(assert (=> b!933939 (= (apply!805 (+!2797 lt!420689 (tuple2!13265 lt!420698 zeroValue!1173)) lt!420681) (apply!805 lt!420689 lt!420681))))

(declare-fun lt!420682 () Unit!31509)

(assert (=> b!933939 (= lt!420682 lt!420687)))

(declare-fun lt!420690 () ListLongMap!11961)

(assert (=> b!933939 (= lt!420690 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420683 () (_ BitVec 64))

(assert (=> b!933939 (= lt!420683 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420685 () (_ BitVec 64))

(assert (=> b!933939 (= lt!420685 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!933939 (= lt!420688 (addApplyDifferent!418 lt!420690 lt!420683 minValue!1173 lt!420685))))

(assert (=> b!933939 (= (apply!805 (+!2797 lt!420690 (tuple2!13265 lt!420683 minValue!1173)) lt!420685) (apply!805 lt!420690 lt!420685))))

(declare-fun b!933940 () Bool)

(declare-fun call!40605 () ListLongMap!11961)

(assert (=> b!933940 (= e!524405 call!40605)))

(declare-fun bm!40606 () Bool)

(assert (=> bm!40606 (= call!40608 (contains!5045 lt!420677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!933941 () Bool)

(assert (=> b!933941 (= e!524400 (not call!40609))))

(declare-fun bm!40607 () Bool)

(assert (=> bm!40607 (= call!40605 call!40607)))

(declare-fun b!933942 () Bool)

(assert (=> b!933942 (= e!524409 (+!2797 call!40610 (tuple2!13265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!933943 () Bool)

(declare-fun e!524401 () Bool)

(assert (=> b!933943 (= e!524401 (= (apply!805 lt!420677 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14231 (select (arr!27046 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1586 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!933943 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27505 _values!1231)))))

(assert (=> b!933943 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27504 _keys!1487)))))

(declare-fun b!933944 () Bool)

(assert (=> b!933944 (= e!524397 e!524401)))

(declare-fun res!629047 () Bool)

(assert (=> b!933944 (=> (not res!629047) (not e!524401))))

(assert (=> b!933944 (= res!629047 (contains!5045 lt!420677 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!933944 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27504 _keys!1487)))))

(declare-fun b!933945 () Bool)

(assert (=> b!933945 (= e!524405 call!40606)))

(declare-fun bm!40608 () Bool)

(assert (=> bm!40608 (= call!40610 (+!2797 (ite c!97101 call!40611 (ite c!97099 call!40607 call!40605)) (ite (or c!97101 c!97099) (tuple2!13265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!933946 () Bool)

(assert (=> b!933946 (= e!524402 (= (apply!805 lt!420677 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(assert (= (and d!113099 c!97101) b!933942))

(assert (= (and d!113099 (not c!97101)) b!933931))

(assert (= (and b!933931 c!97099) b!933937))

(assert (= (and b!933931 (not c!97099)) b!933930))

(assert (= (and b!933930 c!97100) b!933945))

(assert (= (and b!933930 (not c!97100)) b!933940))

(assert (= (or b!933945 b!933940) bm!40607))

(assert (= (or b!933937 bm!40607) bm!40602))

(assert (= (or b!933937 b!933945) bm!40604))

(assert (= (or b!933942 bm!40602) bm!40603))

(assert (= (or b!933942 bm!40604) bm!40608))

(assert (= (and d!113099 res!629051) b!933926))

(assert (= (and d!113099 c!97102) b!933939))

(assert (= (and d!113099 (not c!97102)) b!933932))

(assert (= (and d!113099 res!629049) b!933936))

(assert (= (and b!933936 res!629050) b!933934))

(assert (= (and b!933936 (not res!629053)) b!933944))

(assert (= (and b!933944 res!629047) b!933943))

(assert (= (and b!933936 res!629048) b!933938))

(assert (= (and b!933938 c!97098) b!933933))

(assert (= (and b!933938 (not c!97098)) b!933927))

(assert (= (and b!933933 res!629046) b!933928))

(assert (= (or b!933933 b!933927) bm!40606))

(assert (= (and b!933938 res!629052) b!933929))

(assert (= (and b!933929 c!97097) b!933935))

(assert (= (and b!933929 (not c!97097)) b!933941))

(assert (= (and b!933935 res!629045) b!933946))

(assert (= (or b!933935 b!933941) bm!40605))

(declare-fun b_lambda!13965 () Bool)

(assert (=> (not b_lambda!13965) (not b!933943)))

(assert (=> b!933943 t!27215))

(declare-fun b_and!28817 () Bool)

(assert (= b_and!28811 (and (=> t!27215 result!11863) b_and!28817)))

(declare-fun m!868115 () Bool)

(assert (=> bm!40606 m!868115))

(assert (=> b!933926 m!867997))

(assert (=> b!933926 m!867997))

(declare-fun m!868117 () Bool)

(assert (=> b!933926 m!868117))

(assert (=> b!933944 m!867997))

(assert (=> b!933944 m!867997))

(declare-fun m!868119 () Bool)

(assert (=> b!933944 m!868119))

(assert (=> b!933943 m!867997))

(assert (=> b!933943 m!868015))

(assert (=> b!933943 m!868021))

(assert (=> b!933943 m!868025))

(assert (=> b!933943 m!868015))

(assert (=> b!933943 m!867997))

(declare-fun m!868121 () Bool)

(assert (=> b!933943 m!868121))

(assert (=> b!933943 m!868021))

(assert (=> b!933934 m!867997))

(assert (=> b!933934 m!867997))

(assert (=> b!933934 m!868117))

(declare-fun m!868123 () Bool)

(assert (=> bm!40608 m!868123))

(declare-fun m!868125 () Bool)

(assert (=> b!933942 m!868125))

(assert (=> b!933939 m!867997))

(declare-fun m!868127 () Bool)

(assert (=> b!933939 m!868127))

(declare-fun m!868129 () Bool)

(assert (=> b!933939 m!868129))

(declare-fun m!868131 () Bool)

(assert (=> b!933939 m!868131))

(declare-fun m!868133 () Bool)

(assert (=> b!933939 m!868133))

(declare-fun m!868135 () Bool)

(assert (=> b!933939 m!868135))

(declare-fun m!868137 () Bool)

(assert (=> b!933939 m!868137))

(declare-fun m!868139 () Bool)

(assert (=> b!933939 m!868139))

(declare-fun m!868141 () Bool)

(assert (=> b!933939 m!868141))

(assert (=> b!933939 m!868141))

(declare-fun m!868143 () Bool)

(assert (=> b!933939 m!868143))

(declare-fun m!868145 () Bool)

(assert (=> b!933939 m!868145))

(declare-fun m!868147 () Bool)

(assert (=> b!933939 m!868147))

(declare-fun m!868149 () Bool)

(assert (=> b!933939 m!868149))

(declare-fun m!868151 () Bool)

(assert (=> b!933939 m!868151))

(assert (=> b!933939 m!868137))

(declare-fun m!868153 () Bool)

(assert (=> b!933939 m!868153))

(declare-fun m!868155 () Bool)

(assert (=> b!933939 m!868155))

(assert (=> b!933939 m!868145))

(assert (=> b!933939 m!868149))

(declare-fun m!868157 () Bool)

(assert (=> b!933939 m!868157))

(declare-fun m!868159 () Bool)

(assert (=> bm!40605 m!868159))

(assert (=> d!113099 m!868039))

(declare-fun m!868161 () Bool)

(assert (=> b!933946 m!868161))

(assert (=> bm!40603 m!868139))

(declare-fun m!868163 () Bool)

(assert (=> b!933928 m!868163))

(assert (=> b!933818 d!113099))

(declare-fun bm!40609 () Bool)

(declare-fun call!40614 () ListLongMap!11961)

(declare-fun call!40618 () ListLongMap!11961)

(assert (=> bm!40609 (= call!40614 call!40618)))

(declare-fun b!933947 () Bool)

(declare-fun e!524419 () Bool)

(assert (=> b!933947 (= e!524419 (validKeyInArray!0 (select (arr!27045 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!933948 () Bool)

(declare-fun e!524411 () Bool)

(declare-fun call!40615 () Bool)

(assert (=> b!933948 (= e!524411 (not call!40615))))

(declare-fun b!933949 () Bool)

(declare-fun e!524420 () Bool)

(declare-fun lt!420699 () ListLongMap!11961)

(assert (=> b!933949 (= e!524420 (= (apply!805 lt!420699 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!933950 () Bool)

(declare-fun e!524412 () Bool)

(declare-fun e!524413 () Bool)

(assert (=> b!933950 (= e!524412 e!524413)))

(declare-fun c!97103 () Bool)

(assert (=> b!933950 (= c!97103 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40610 () Bool)

(assert (=> bm!40610 (= call!40618 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!933951 () Bool)

(declare-fun c!97106 () Bool)

(assert (=> b!933951 (= c!97106 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!524421 () ListLongMap!11961)

(declare-fun e!524418 () ListLongMap!11961)

(assert (=> b!933951 (= e!524421 e!524418)))

(declare-fun b!933952 () Bool)

(declare-fun e!524422 () ListLongMap!11961)

(assert (=> b!933952 (= e!524422 e!524421)))

(declare-fun c!97105 () Bool)

(assert (=> b!933952 (= c!97105 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!933953 () Bool)

(declare-fun e!524416 () Unit!31509)

(declare-fun Unit!31512 () Unit!31509)

(assert (=> b!933953 (= e!524416 Unit!31512)))

(declare-fun b!933954 () Bool)

(assert (=> b!933954 (= e!524411 e!524420)))

(declare-fun res!629055 () Bool)

(assert (=> b!933954 (= res!629055 call!40615)))

(assert (=> b!933954 (=> (not res!629055) (not e!524420))))

(declare-fun b!933955 () Bool)

(declare-fun e!524417 () Bool)

(assert (=> b!933955 (= e!524417 (validKeyInArray!0 (select (arr!27045 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!933956 () Bool)

(declare-fun e!524415 () Bool)

(assert (=> b!933956 (= e!524413 e!524415)))

(declare-fun res!629054 () Bool)

(declare-fun call!40616 () Bool)

(assert (=> b!933956 (= res!629054 call!40616)))

(assert (=> b!933956 (=> (not res!629054) (not e!524415))))

(declare-fun b!933957 () Bool)

(declare-fun res!629057 () Bool)

(assert (=> b!933957 (=> (not res!629057) (not e!524412))))

(declare-fun e!524410 () Bool)

(assert (=> b!933957 (= res!629057 e!524410)))

(declare-fun res!629062 () Bool)

(assert (=> b!933957 (=> res!629062 e!524410)))

(assert (=> b!933957 (= res!629062 (not e!524417))))

(declare-fun res!629059 () Bool)

(assert (=> b!933957 (=> (not res!629059) (not e!524417))))

(assert (=> b!933957 (= res!629059 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27504 _keys!1487)))))

(declare-fun b!933958 () Bool)

(declare-fun call!40613 () ListLongMap!11961)

(assert (=> b!933958 (= e!524421 call!40613)))

(declare-fun b!933959 () Bool)

(declare-fun res!629061 () Bool)

(assert (=> b!933959 (=> (not res!629061) (not e!524412))))

(assert (=> b!933959 (= res!629061 e!524411)))

(declare-fun c!97104 () Bool)

(assert (=> b!933959 (= c!97104 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40611 () Bool)

(declare-fun call!40617 () ListLongMap!11961)

(assert (=> bm!40611 (= call!40613 call!40617)))

(declare-fun bm!40612 () Bool)

(assert (=> bm!40612 (= call!40616 (contains!5045 lt!420699 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113101 () Bool)

(assert (=> d!113101 e!524412))

(declare-fun res!629058 () Bool)

(assert (=> d!113101 (=> (not res!629058) (not e!524412))))

(assert (=> d!113101 (= res!629058 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27504 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27504 _keys!1487)))))))

(declare-fun lt!420700 () ListLongMap!11961)

(assert (=> d!113101 (= lt!420699 lt!420700)))

(declare-fun lt!420717 () Unit!31509)

(assert (=> d!113101 (= lt!420717 e!524416)))

(declare-fun c!97108 () Bool)

(assert (=> d!113101 (= c!97108 e!524419)))

(declare-fun res!629060 () Bool)

(assert (=> d!113101 (=> (not res!629060) (not e!524419))))

(assert (=> d!113101 (= res!629060 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27504 _keys!1487)))))

(assert (=> d!113101 (= lt!420700 e!524422)))

(declare-fun c!97107 () Bool)

(assert (=> d!113101 (= c!97107 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113101 (validMask!0 mask!1881)))

(assert (=> d!113101 (= (getCurrentListMap!3234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420699)))

(declare-fun b!933960 () Bool)

(declare-fun lt!420710 () Unit!31509)

(assert (=> b!933960 (= e!524416 lt!420710)))

(declare-fun lt!420714 () ListLongMap!11961)

(assert (=> b!933960 (= lt!420714 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420702 () (_ BitVec 64))

(assert (=> b!933960 (= lt!420702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420715 () (_ BitVec 64))

(assert (=> b!933960 (= lt!420715 (select (arr!27045 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420719 () Unit!31509)

(assert (=> b!933960 (= lt!420719 (addStillContains!516 lt!420714 lt!420702 zeroValue!1173 lt!420715))))

(assert (=> b!933960 (contains!5045 (+!2797 lt!420714 (tuple2!13265 lt!420702 zeroValue!1173)) lt!420715)))

(declare-fun lt!420713 () Unit!31509)

(assert (=> b!933960 (= lt!420713 lt!420719)))

(declare-fun lt!420718 () ListLongMap!11961)

(assert (=> b!933960 (= lt!420718 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420701 () (_ BitVec 64))

(assert (=> b!933960 (= lt!420701 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420708 () (_ BitVec 64))

(assert (=> b!933960 (= lt!420708 (select (arr!27045 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420706 () Unit!31509)

(assert (=> b!933960 (= lt!420706 (addApplyDifferent!418 lt!420718 lt!420701 minValue!1173 lt!420708))))

(assert (=> b!933960 (= (apply!805 (+!2797 lt!420718 (tuple2!13265 lt!420701 minValue!1173)) lt!420708) (apply!805 lt!420718 lt!420708))))

(declare-fun lt!420716 () Unit!31509)

(assert (=> b!933960 (= lt!420716 lt!420706)))

(declare-fun lt!420711 () ListLongMap!11961)

(assert (=> b!933960 (= lt!420711 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420720 () (_ BitVec 64))

(assert (=> b!933960 (= lt!420720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420703 () (_ BitVec 64))

(assert (=> b!933960 (= lt!420703 (select (arr!27045 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420709 () Unit!31509)

(assert (=> b!933960 (= lt!420709 (addApplyDifferent!418 lt!420711 lt!420720 zeroValue!1173 lt!420703))))

(assert (=> b!933960 (= (apply!805 (+!2797 lt!420711 (tuple2!13265 lt!420720 zeroValue!1173)) lt!420703) (apply!805 lt!420711 lt!420703))))

(declare-fun lt!420704 () Unit!31509)

(assert (=> b!933960 (= lt!420704 lt!420709)))

(declare-fun lt!420712 () ListLongMap!11961)

(assert (=> b!933960 (= lt!420712 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420705 () (_ BitVec 64))

(assert (=> b!933960 (= lt!420705 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420707 () (_ BitVec 64))

(assert (=> b!933960 (= lt!420707 (select (arr!27045 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!933960 (= lt!420710 (addApplyDifferent!418 lt!420712 lt!420705 minValue!1173 lt!420707))))

(assert (=> b!933960 (= (apply!805 (+!2797 lt!420712 (tuple2!13265 lt!420705 minValue!1173)) lt!420707) (apply!805 lt!420712 lt!420707))))

(declare-fun b!933961 () Bool)

(declare-fun call!40612 () ListLongMap!11961)

(assert (=> b!933961 (= e!524418 call!40612)))

(declare-fun bm!40613 () Bool)

(assert (=> bm!40613 (= call!40615 (contains!5045 lt!420699 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!933962 () Bool)

(assert (=> b!933962 (= e!524413 (not call!40616))))

(declare-fun bm!40614 () Bool)

(assert (=> bm!40614 (= call!40612 call!40614)))

(declare-fun b!933963 () Bool)

(assert (=> b!933963 (= e!524422 (+!2797 call!40617 (tuple2!13265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!933964 () Bool)

(declare-fun e!524414 () Bool)

(assert (=> b!933964 (= e!524414 (= (apply!805 lt!420699 (select (arr!27045 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14231 (select (arr!27046 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1586 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!933964 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27505 _values!1231)))))

(assert (=> b!933964 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27504 _keys!1487)))))

(declare-fun b!933965 () Bool)

(assert (=> b!933965 (= e!524410 e!524414)))

(declare-fun res!629056 () Bool)

(assert (=> b!933965 (=> (not res!629056) (not e!524414))))

(assert (=> b!933965 (= res!629056 (contains!5045 lt!420699 (select (arr!27045 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!933965 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27504 _keys!1487)))))

(declare-fun b!933966 () Bool)

(assert (=> b!933966 (= e!524418 call!40613)))

(declare-fun bm!40615 () Bool)

(assert (=> bm!40615 (= call!40617 (+!2797 (ite c!97107 call!40618 (ite c!97105 call!40614 call!40612)) (ite (or c!97107 c!97105) (tuple2!13265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!933967 () Bool)

(assert (=> b!933967 (= e!524415 (= (apply!805 lt!420699 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(assert (= (and d!113101 c!97107) b!933963))

(assert (= (and d!113101 (not c!97107)) b!933952))

(assert (= (and b!933952 c!97105) b!933958))

(assert (= (and b!933952 (not c!97105)) b!933951))

(assert (= (and b!933951 c!97106) b!933966))

(assert (= (and b!933951 (not c!97106)) b!933961))

(assert (= (or b!933966 b!933961) bm!40614))

(assert (= (or b!933958 bm!40614) bm!40609))

(assert (= (or b!933958 b!933966) bm!40611))

(assert (= (or b!933963 bm!40609) bm!40610))

(assert (= (or b!933963 bm!40611) bm!40615))

(assert (= (and d!113101 res!629060) b!933947))

(assert (= (and d!113101 c!97108) b!933960))

(assert (= (and d!113101 (not c!97108)) b!933953))

(assert (= (and d!113101 res!629058) b!933957))

(assert (= (and b!933957 res!629059) b!933955))

(assert (= (and b!933957 (not res!629062)) b!933965))

(assert (= (and b!933965 res!629056) b!933964))

(assert (= (and b!933957 res!629057) b!933959))

(assert (= (and b!933959 c!97104) b!933954))

(assert (= (and b!933959 (not c!97104)) b!933948))

(assert (= (and b!933954 res!629055) b!933949))

(assert (= (or b!933954 b!933948) bm!40613))

(assert (= (and b!933959 res!629061) b!933950))

(assert (= (and b!933950 c!97103) b!933956))

(assert (= (and b!933950 (not c!97103)) b!933962))

(assert (= (and b!933956 res!629054) b!933967))

(assert (= (or b!933956 b!933962) bm!40612))

(declare-fun b_lambda!13967 () Bool)

(assert (=> (not b_lambda!13967) (not b!933964)))

(assert (=> b!933964 t!27215))

(declare-fun b_and!28819 () Bool)

(assert (= b_and!28817 (and (=> t!27215 result!11863) b_and!28819)))

(declare-fun m!868165 () Bool)

(assert (=> bm!40613 m!868165))

(declare-fun m!868167 () Bool)

(assert (=> b!933947 m!868167))

(assert (=> b!933947 m!868167))

(declare-fun m!868169 () Bool)

(assert (=> b!933947 m!868169))

(assert (=> b!933965 m!868167))

(assert (=> b!933965 m!868167))

(declare-fun m!868171 () Bool)

(assert (=> b!933965 m!868171))

(assert (=> b!933964 m!868167))

(declare-fun m!868173 () Bool)

(assert (=> b!933964 m!868173))

(assert (=> b!933964 m!868021))

(declare-fun m!868175 () Bool)

(assert (=> b!933964 m!868175))

(assert (=> b!933964 m!868173))

(assert (=> b!933964 m!868167))

(declare-fun m!868177 () Bool)

(assert (=> b!933964 m!868177))

(assert (=> b!933964 m!868021))

(assert (=> b!933955 m!868167))

(assert (=> b!933955 m!868167))

(assert (=> b!933955 m!868169))

(declare-fun m!868179 () Bool)

(assert (=> bm!40615 m!868179))

(declare-fun m!868181 () Bool)

(assert (=> b!933963 m!868181))

(assert (=> b!933960 m!868167))

(declare-fun m!868183 () Bool)

(assert (=> b!933960 m!868183))

(declare-fun m!868185 () Bool)

(assert (=> b!933960 m!868185))

(declare-fun m!868187 () Bool)

(assert (=> b!933960 m!868187))

(declare-fun m!868189 () Bool)

(assert (=> b!933960 m!868189))

(declare-fun m!868191 () Bool)

(assert (=> b!933960 m!868191))

(declare-fun m!868193 () Bool)

(assert (=> b!933960 m!868193))

(declare-fun m!868195 () Bool)

(assert (=> b!933960 m!868195))

(declare-fun m!868197 () Bool)

(assert (=> b!933960 m!868197))

(assert (=> b!933960 m!868197))

(declare-fun m!868199 () Bool)

(assert (=> b!933960 m!868199))

(declare-fun m!868201 () Bool)

(assert (=> b!933960 m!868201))

(declare-fun m!868203 () Bool)

(assert (=> b!933960 m!868203))

(declare-fun m!868205 () Bool)

(assert (=> b!933960 m!868205))

(declare-fun m!868207 () Bool)

(assert (=> b!933960 m!868207))

(assert (=> b!933960 m!868193))

(declare-fun m!868209 () Bool)

(assert (=> b!933960 m!868209))

(declare-fun m!868211 () Bool)

(assert (=> b!933960 m!868211))

(assert (=> b!933960 m!868201))

(assert (=> b!933960 m!868205))

(declare-fun m!868213 () Bool)

(assert (=> b!933960 m!868213))

(declare-fun m!868215 () Bool)

(assert (=> bm!40612 m!868215))

(assert (=> d!113101 m!868039))

(declare-fun m!868217 () Bool)

(assert (=> b!933967 m!868217))

(assert (=> bm!40610 m!868195))

(declare-fun m!868219 () Bool)

(assert (=> b!933949 m!868219))

(assert (=> b!933818 d!113101))

(declare-fun d!113103 () Bool)

(assert (=> d!113103 (contains!5045 (+!2797 lt!420593 (tuple2!13265 lt!420590 lt!420592)) k0!1099)))

(declare-fun lt!420723 () Unit!31509)

(declare-fun choose!1541 (ListLongMap!11961 (_ BitVec 64) V!31809 (_ BitVec 64)) Unit!31509)

(assert (=> d!113103 (= lt!420723 (choose!1541 lt!420593 lt!420590 lt!420592 k0!1099))))

(assert (=> d!113103 (contains!5045 lt!420593 k0!1099)))

(assert (=> d!113103 (= (addStillContains!516 lt!420593 lt!420590 lt!420592 k0!1099) lt!420723)))

(declare-fun bs!26227 () Bool)

(assert (= bs!26227 d!113103))

(declare-fun m!868221 () Bool)

(assert (=> bs!26227 m!868221))

(assert (=> bs!26227 m!868221))

(declare-fun m!868223 () Bool)

(assert (=> bs!26227 m!868223))

(declare-fun m!868225 () Bool)

(assert (=> bs!26227 m!868225))

(assert (=> bs!26227 m!868035))

(assert (=> b!933818 d!113103))

(declare-fun d!113105 () Bool)

(declare-fun e!524423 () Bool)

(assert (=> d!113105 e!524423))

(declare-fun res!629063 () Bool)

(assert (=> d!113105 (=> (not res!629063) (not e!524423))))

(declare-fun lt!420725 () ListLongMap!11961)

(assert (=> d!113105 (= res!629063 (contains!5045 lt!420725 (_1!6643 lt!420596)))))

(declare-fun lt!420727 () List!19048)

(assert (=> d!113105 (= lt!420725 (ListLongMap!11962 lt!420727))))

(declare-fun lt!420726 () Unit!31509)

(declare-fun lt!420724 () Unit!31509)

(assert (=> d!113105 (= lt!420726 lt!420724)))

(assert (=> d!113105 (= (getValueByKey!479 lt!420727 (_1!6643 lt!420596)) (Some!484 (_2!6643 lt!420596)))))

(assert (=> d!113105 (= lt!420724 (lemmaContainsTupThenGetReturnValue!255 lt!420727 (_1!6643 lt!420596) (_2!6643 lt!420596)))))

(assert (=> d!113105 (= lt!420727 (insertStrictlySorted!312 (toList!5996 (getCurrentListMap!3234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6643 lt!420596) (_2!6643 lt!420596)))))

(assert (=> d!113105 (= (+!2797 (getCurrentListMap!3234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420596) lt!420725)))

(declare-fun b!933969 () Bool)

(declare-fun res!629064 () Bool)

(assert (=> b!933969 (=> (not res!629064) (not e!524423))))

(assert (=> b!933969 (= res!629064 (= (getValueByKey!479 (toList!5996 lt!420725) (_1!6643 lt!420596)) (Some!484 (_2!6643 lt!420596))))))

(declare-fun b!933970 () Bool)

(assert (=> b!933970 (= e!524423 (contains!5047 (toList!5996 lt!420725) lt!420596))))

(assert (= (and d!113105 res!629063) b!933969))

(assert (= (and b!933969 res!629064) b!933970))

(declare-fun m!868227 () Bool)

(assert (=> d!113105 m!868227))

(declare-fun m!868229 () Bool)

(assert (=> d!113105 m!868229))

(declare-fun m!868231 () Bool)

(assert (=> d!113105 m!868231))

(declare-fun m!868233 () Bool)

(assert (=> d!113105 m!868233))

(declare-fun m!868235 () Bool)

(assert (=> b!933969 m!868235))

(declare-fun m!868237 () Bool)

(assert (=> b!933970 m!868237))

(assert (=> b!933818 d!113105))

(declare-fun d!113107 () Bool)

(declare-fun e!524426 () Bool)

(assert (=> d!113107 e!524426))

(declare-fun res!629067 () Bool)

(assert (=> d!113107 (=> (not res!629067) (not e!524426))))

(assert (=> d!113107 (= res!629067 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27504 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27505 _values!1231))))))

(declare-fun lt!420730 () Unit!31509)

(declare-fun choose!1542 (array!56202 array!56204 (_ BitVec 32) (_ BitVec 32) V!31809 V!31809 (_ BitVec 32) Int) Unit!31509)

(assert (=> d!113107 (= lt!420730 (choose!1542 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113107 (validMask!0 mask!1881)))

(assert (=> d!113107 (= (lemmaListMapRecursiveValidKeyArray!187 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!420730)))

(declare-fun b!933973 () Bool)

(assert (=> b!933973 (= e!524426 (= (getCurrentListMap!3234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2797 (getCurrentListMap!3234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13265 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14231 (select (arr!27046 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1586 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113107 res!629067) b!933973))

(declare-fun b_lambda!13969 () Bool)

(assert (=> (not b_lambda!13969) (not b!933973)))

(assert (=> b!933973 t!27215))

(declare-fun b_and!28821 () Bool)

(assert (= b_and!28819 (and (=> t!27215 result!11863) b_and!28821)))

(declare-fun m!868239 () Bool)

(assert (=> d!113107 m!868239))

(assert (=> d!113107 m!868039))

(declare-fun m!868241 () Bool)

(assert (=> b!933973 m!868241))

(declare-fun m!868243 () Bool)

(assert (=> b!933973 m!868243))

(assert (=> b!933973 m!868241))

(assert (=> b!933973 m!868021))

(assert (=> b!933973 m!868027))

(assert (=> b!933973 m!867997))

(assert (=> b!933973 m!868015))

(assert (=> b!933973 m!868021))

(assert (=> b!933973 m!868025))

(assert (=> b!933973 m!868015))

(assert (=> b!933818 d!113107))

(declare-fun bm!40618 () Bool)

(declare-fun c!97111 () Bool)

(declare-fun call!40621 () Bool)

(assert (=> bm!40618 (= call!40621 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97111 (Cons!19043 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19044) Nil!19044)))))

(declare-fun b!933984 () Bool)

(declare-fun e!524438 () Bool)

(assert (=> b!933984 (= e!524438 call!40621)))

(declare-fun b!933985 () Bool)

(assert (=> b!933985 (= e!524438 call!40621)))

(declare-fun b!933986 () Bool)

(declare-fun e!524436 () Bool)

(declare-fun e!524435 () Bool)

(assert (=> b!933986 (= e!524436 e!524435)))

(declare-fun res!629076 () Bool)

(assert (=> b!933986 (=> (not res!629076) (not e!524435))))

(declare-fun e!524437 () Bool)

(assert (=> b!933986 (= res!629076 (not e!524437))))

(declare-fun res!629074 () Bool)

(assert (=> b!933986 (=> (not res!629074) (not e!524437))))

(assert (=> b!933986 (= res!629074 (validKeyInArray!0 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun d!113109 () Bool)

(declare-fun res!629075 () Bool)

(assert (=> d!113109 (=> res!629075 e!524436)))

(assert (=> d!113109 (= res!629075 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27504 _keys!1487)))))

(assert (=> d!113109 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19044) e!524436)))

(declare-fun b!933987 () Bool)

(declare-fun contains!5048 (List!19047 (_ BitVec 64)) Bool)

(assert (=> b!933987 (= e!524437 (contains!5048 Nil!19044 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!933988 () Bool)

(assert (=> b!933988 (= e!524435 e!524438)))

(assert (=> b!933988 (= c!97111 (validKeyInArray!0 (select (arr!27045 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113109 (not res!629075)) b!933986))

(assert (= (and b!933986 res!629074) b!933987))

(assert (= (and b!933986 res!629076) b!933988))

(assert (= (and b!933988 c!97111) b!933985))

(assert (= (and b!933988 (not c!97111)) b!933984))

(assert (= (or b!933985 b!933984) bm!40618))

(assert (=> bm!40618 m!867997))

(declare-fun m!868245 () Bool)

(assert (=> bm!40618 m!868245))

(assert (=> b!933986 m!867997))

(assert (=> b!933986 m!867997))

(assert (=> b!933986 m!868117))

(assert (=> b!933987 m!867997))

(assert (=> b!933987 m!867997))

(declare-fun m!868247 () Bool)

(assert (=> b!933987 m!868247))

(assert (=> b!933988 m!867997))

(assert (=> b!933988 m!867997))

(assert (=> b!933988 m!868117))

(assert (=> b!933818 d!113109))

(declare-fun d!113111 () Bool)

(declare-fun e!524441 () Bool)

(assert (=> d!113111 e!524441))

(declare-fun c!97114 () Bool)

(assert (=> d!113111 (= c!97114 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!420733 () Unit!31509)

(declare-fun choose!1543 (array!56202 array!56204 (_ BitVec 32) (_ BitVec 32) V!31809 V!31809 (_ BitVec 64) (_ BitVec 32) Int) Unit!31509)

(assert (=> d!113111 (= lt!420733 (choose!1543 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113111 (validMask!0 mask!1881)))

(assert (=> d!113111 (= (lemmaListMapContainsThenArrayContainsFrom!269 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!420733)))

(declare-fun b!933993 () Bool)

(assert (=> b!933993 (= e!524441 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!933994 () Bool)

(assert (=> b!933994 (= e!524441 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113111 c!97114) b!933993))

(assert (= (and d!113111 (not c!97114)) b!933994))

(declare-fun m!868249 () Bool)

(assert (=> d!113111 m!868249))

(assert (=> d!113111 m!868039))

(assert (=> b!933993 m!868045))

(assert (=> b!933818 d!113111))

(declare-fun d!113113 () Bool)

(declare-fun c!97117 () Bool)

(assert (=> d!113113 (= c!97117 ((_ is ValueCellFull!9585) (select (arr!27046 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!524444 () V!31809)

(assert (=> d!113113 (= (get!14231 (select (arr!27046 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1586 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!524444)))

(declare-fun b!933999 () Bool)

(declare-fun get!14232 (ValueCell!9585 V!31809) V!31809)

(assert (=> b!933999 (= e!524444 (get!14232 (select (arr!27046 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1586 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!934000 () Bool)

(declare-fun get!14233 (ValueCell!9585 V!31809) V!31809)

(assert (=> b!934000 (= e!524444 (get!14233 (select (arr!27046 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1586 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113113 c!97117) b!933999))

(assert (= (and d!113113 (not c!97117)) b!934000))

(assert (=> b!933999 m!868015))

(assert (=> b!933999 m!868021))

(declare-fun m!868251 () Bool)

(assert (=> b!933999 m!868251))

(assert (=> b!934000 m!868015))

(assert (=> b!934000 m!868021))

(declare-fun m!868253 () Bool)

(assert (=> b!934000 m!868253))

(assert (=> b!933818 d!113113))

(declare-fun d!113115 () Bool)

(declare-fun e!524450 () Bool)

(assert (=> d!113115 e!524450))

(declare-fun res!629079 () Bool)

(assert (=> d!113115 (=> res!629079 e!524450)))

(declare-fun lt!420744 () Bool)

(assert (=> d!113115 (= res!629079 (not lt!420744))))

(declare-fun lt!420743 () Bool)

(assert (=> d!113115 (= lt!420744 lt!420743)))

(declare-fun lt!420745 () Unit!31509)

(declare-fun e!524449 () Unit!31509)

(assert (=> d!113115 (= lt!420745 e!524449)))

(declare-fun c!97120 () Bool)

(assert (=> d!113115 (= c!97120 lt!420743)))

(declare-fun containsKey!446 (List!19048 (_ BitVec 64)) Bool)

(assert (=> d!113115 (= lt!420743 (containsKey!446 (toList!5996 (+!2797 lt!420593 lt!420596)) k0!1099))))

(assert (=> d!113115 (= (contains!5045 (+!2797 lt!420593 lt!420596) k0!1099) lt!420744)))

(declare-fun b!934007 () Bool)

(declare-fun lt!420742 () Unit!31509)

(assert (=> b!934007 (= e!524449 lt!420742)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!342 (List!19048 (_ BitVec 64)) Unit!31509)

(assert (=> b!934007 (= lt!420742 (lemmaContainsKeyImpliesGetValueByKeyDefined!342 (toList!5996 (+!2797 lt!420593 lt!420596)) k0!1099))))

(declare-fun isDefined!351 (Option!485) Bool)

(assert (=> b!934007 (isDefined!351 (getValueByKey!479 (toList!5996 (+!2797 lt!420593 lt!420596)) k0!1099))))

(declare-fun b!934008 () Bool)

(declare-fun Unit!31513 () Unit!31509)

(assert (=> b!934008 (= e!524449 Unit!31513)))

(declare-fun b!934009 () Bool)

(assert (=> b!934009 (= e!524450 (isDefined!351 (getValueByKey!479 (toList!5996 (+!2797 lt!420593 lt!420596)) k0!1099)))))

(assert (= (and d!113115 c!97120) b!934007))

(assert (= (and d!113115 (not c!97120)) b!934008))

(assert (= (and d!113115 (not res!629079)) b!934009))

(declare-fun m!868255 () Bool)

(assert (=> d!113115 m!868255))

(declare-fun m!868257 () Bool)

(assert (=> b!934007 m!868257))

(declare-fun m!868259 () Bool)

(assert (=> b!934007 m!868259))

(assert (=> b!934007 m!868259))

(declare-fun m!868261 () Bool)

(assert (=> b!934007 m!868261))

(assert (=> b!934009 m!868259))

(assert (=> b!934009 m!868259))

(assert (=> b!934009 m!868261))

(assert (=> b!933818 d!113115))

(declare-fun d!113117 () Bool)

(assert (=> d!113117 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19044)))

(declare-fun lt!420748 () Unit!31509)

(declare-fun choose!39 (array!56202 (_ BitVec 32) (_ BitVec 32)) Unit!31509)

(assert (=> d!113117 (= lt!420748 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113117 (bvslt (size!27504 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113117 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!420748)))

(declare-fun bs!26228 () Bool)

(assert (= bs!26228 d!113117))

(assert (=> bs!26228 m!868029))

(declare-fun m!868263 () Bool)

(assert (=> bs!26228 m!868263))

(assert (=> b!933818 d!113117))

(declare-fun d!113119 () Bool)

(assert (=> d!113119 (= (validKeyInArray!0 lt!420590) (and (not (= lt!420590 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!420590 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!933813 d!113119))

(declare-fun bm!40619 () Bool)

(declare-fun call!40622 () Bool)

(declare-fun c!97121 () Bool)

(assert (=> bm!40619 (= call!40622 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97121 (Cons!19043 (select (arr!27045 _keys!1487) #b00000000000000000000000000000000) Nil!19044) Nil!19044)))))

(declare-fun b!934010 () Bool)

(declare-fun e!524454 () Bool)

(assert (=> b!934010 (= e!524454 call!40622)))

(declare-fun b!934011 () Bool)

(assert (=> b!934011 (= e!524454 call!40622)))

(declare-fun b!934012 () Bool)

(declare-fun e!524452 () Bool)

(declare-fun e!524451 () Bool)

(assert (=> b!934012 (= e!524452 e!524451)))

(declare-fun res!629082 () Bool)

(assert (=> b!934012 (=> (not res!629082) (not e!524451))))

(declare-fun e!524453 () Bool)

(assert (=> b!934012 (= res!629082 (not e!524453))))

(declare-fun res!629080 () Bool)

(assert (=> b!934012 (=> (not res!629080) (not e!524453))))

(assert (=> b!934012 (= res!629080 (validKeyInArray!0 (select (arr!27045 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113121 () Bool)

(declare-fun res!629081 () Bool)

(assert (=> d!113121 (=> res!629081 e!524452)))

(assert (=> d!113121 (= res!629081 (bvsge #b00000000000000000000000000000000 (size!27504 _keys!1487)))))

(assert (=> d!113121 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19044) e!524452)))

(declare-fun b!934013 () Bool)

(assert (=> b!934013 (= e!524453 (contains!5048 Nil!19044 (select (arr!27045 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!934014 () Bool)

(assert (=> b!934014 (= e!524451 e!524454)))

(assert (=> b!934014 (= c!97121 (validKeyInArray!0 (select (arr!27045 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113121 (not res!629081)) b!934012))

(assert (= (and b!934012 res!629080) b!934013))

(assert (= (and b!934012 res!629082) b!934014))

(assert (= (and b!934014 c!97121) b!934011))

(assert (= (and b!934014 (not c!97121)) b!934010))

(assert (= (or b!934011 b!934010) bm!40619))

(declare-fun m!868265 () Bool)

(assert (=> bm!40619 m!868265))

(declare-fun m!868267 () Bool)

(assert (=> bm!40619 m!868267))

(assert (=> b!934012 m!868265))

(assert (=> b!934012 m!868265))

(declare-fun m!868269 () Bool)

(assert (=> b!934012 m!868269))

(assert (=> b!934013 m!868265))

(assert (=> b!934013 m!868265))

(declare-fun m!868271 () Bool)

(assert (=> b!934013 m!868271))

(assert (=> b!934014 m!868265))

(assert (=> b!934014 m!868265))

(assert (=> b!934014 m!868269))

(assert (=> b!933808 d!113121))

(declare-fun d!113123 () Bool)

(assert (=> d!113123 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79438 d!113123))

(declare-fun d!113125 () Bool)

(assert (=> d!113125 (= (array_inv!21050 _values!1231) (bvsge (size!27505 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79438 d!113125))

(declare-fun d!113127 () Bool)

(assert (=> d!113127 (= (array_inv!21051 _keys!1487) (bvsge (size!27504 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79438 d!113127))

(declare-fun b!934023 () Bool)

(declare-fun e!524461 () Bool)

(declare-fun call!40625 () Bool)

(assert (=> b!934023 (= e!524461 call!40625)))

(declare-fun d!113129 () Bool)

(declare-fun res!629087 () Bool)

(declare-fun e!524462 () Bool)

(assert (=> d!113129 (=> res!629087 e!524462)))

(assert (=> d!113129 (= res!629087 (bvsge #b00000000000000000000000000000000 (size!27504 _keys!1487)))))

(assert (=> d!113129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!524462)))

(declare-fun b!934024 () Bool)

(declare-fun e!524463 () Bool)

(assert (=> b!934024 (= e!524462 e!524463)))

(declare-fun c!97124 () Bool)

(assert (=> b!934024 (= c!97124 (validKeyInArray!0 (select (arr!27045 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40622 () Bool)

(assert (=> bm!40622 (= call!40625 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!934025 () Bool)

(assert (=> b!934025 (= e!524463 call!40625)))

(declare-fun b!934026 () Bool)

(assert (=> b!934026 (= e!524463 e!524461)))

(declare-fun lt!420756 () (_ BitVec 64))

(assert (=> b!934026 (= lt!420756 (select (arr!27045 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!420755 () Unit!31509)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56202 (_ BitVec 64) (_ BitVec 32)) Unit!31509)

(assert (=> b!934026 (= lt!420755 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!420756 #b00000000000000000000000000000000))))

(assert (=> b!934026 (arrayContainsKey!0 _keys!1487 lt!420756 #b00000000000000000000000000000000)))

(declare-fun lt!420757 () Unit!31509)

(assert (=> b!934026 (= lt!420757 lt!420755)))

(declare-fun res!629088 () Bool)

(declare-datatypes ((SeekEntryResult!8977 0))(
  ( (MissingZero!8977 (index!38279 (_ BitVec 32))) (Found!8977 (index!38280 (_ BitVec 32))) (Intermediate!8977 (undefined!9789 Bool) (index!38281 (_ BitVec 32)) (x!80094 (_ BitVec 32))) (Undefined!8977) (MissingVacant!8977 (index!38282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56202 (_ BitVec 32)) SeekEntryResult!8977)

(assert (=> b!934026 (= res!629088 (= (seekEntryOrOpen!0 (select (arr!27045 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8977 #b00000000000000000000000000000000)))))

(assert (=> b!934026 (=> (not res!629088) (not e!524461))))

(assert (= (and d!113129 (not res!629087)) b!934024))

(assert (= (and b!934024 c!97124) b!934026))

(assert (= (and b!934024 (not c!97124)) b!934025))

(assert (= (and b!934026 res!629088) b!934023))

(assert (= (or b!934023 b!934025) bm!40622))

(assert (=> b!934024 m!868265))

(assert (=> b!934024 m!868265))

(assert (=> b!934024 m!868269))

(declare-fun m!868273 () Bool)

(assert (=> bm!40622 m!868273))

(assert (=> b!934026 m!868265))

(declare-fun m!868275 () Bool)

(assert (=> b!934026 m!868275))

(declare-fun m!868277 () Bool)

(assert (=> b!934026 m!868277))

(assert (=> b!934026 m!868265))

(declare-fun m!868279 () Bool)

(assert (=> b!934026 m!868279))

(assert (=> b!933819 d!113129))

(declare-fun d!113131 () Bool)

(declare-fun e!524465 () Bool)

(assert (=> d!113131 e!524465))

(declare-fun res!629089 () Bool)

(assert (=> d!113131 (=> res!629089 e!524465)))

(declare-fun lt!420760 () Bool)

(assert (=> d!113131 (= res!629089 (not lt!420760))))

(declare-fun lt!420759 () Bool)

(assert (=> d!113131 (= lt!420760 lt!420759)))

(declare-fun lt!420761 () Unit!31509)

(declare-fun e!524464 () Unit!31509)

(assert (=> d!113131 (= lt!420761 e!524464)))

(declare-fun c!97125 () Bool)

(assert (=> d!113131 (= c!97125 lt!420759)))

(assert (=> d!113131 (= lt!420759 (containsKey!446 (toList!5996 lt!420593) k0!1099))))

(assert (=> d!113131 (= (contains!5045 lt!420593 k0!1099) lt!420760)))

(declare-fun b!934027 () Bool)

(declare-fun lt!420758 () Unit!31509)

(assert (=> b!934027 (= e!524464 lt!420758)))

(assert (=> b!934027 (= lt!420758 (lemmaContainsKeyImpliesGetValueByKeyDefined!342 (toList!5996 lt!420593) k0!1099))))

(assert (=> b!934027 (isDefined!351 (getValueByKey!479 (toList!5996 lt!420593) k0!1099))))

(declare-fun b!934028 () Bool)

(declare-fun Unit!31514 () Unit!31509)

(assert (=> b!934028 (= e!524464 Unit!31514)))

(declare-fun b!934029 () Bool)

(assert (=> b!934029 (= e!524465 (isDefined!351 (getValueByKey!479 (toList!5996 lt!420593) k0!1099)))))

(assert (= (and d!113131 c!97125) b!934027))

(assert (= (and d!113131 (not c!97125)) b!934028))

(assert (= (and d!113131 (not res!629089)) b!934029))

(declare-fun m!868281 () Bool)

(assert (=> d!113131 m!868281))

(declare-fun m!868283 () Bool)

(assert (=> b!934027 m!868283))

(declare-fun m!868285 () Bool)

(assert (=> b!934027 m!868285))

(assert (=> b!934027 m!868285))

(declare-fun m!868287 () Bool)

(assert (=> b!934027 m!868287))

(assert (=> b!934029 m!868285))

(assert (=> b!934029 m!868285))

(assert (=> b!934029 m!868287))

(assert (=> b!933820 d!113131))

(declare-fun bm!40623 () Bool)

(declare-fun call!40628 () ListLongMap!11961)

(declare-fun call!40632 () ListLongMap!11961)

(assert (=> bm!40623 (= call!40628 call!40632)))

(declare-fun b!934030 () Bool)

(declare-fun e!524475 () Bool)

(assert (=> b!934030 (= e!524475 (validKeyInArray!0 (select (arr!27045 _keys!1487) from!1844)))))

(declare-fun b!934031 () Bool)

(declare-fun e!524467 () Bool)

(declare-fun call!40629 () Bool)

(assert (=> b!934031 (= e!524467 (not call!40629))))

(declare-fun b!934032 () Bool)

(declare-fun e!524476 () Bool)

(declare-fun lt!420762 () ListLongMap!11961)

(assert (=> b!934032 (= e!524476 (= (apply!805 lt!420762 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!934033 () Bool)

(declare-fun e!524468 () Bool)

(declare-fun e!524469 () Bool)

(assert (=> b!934033 (= e!524468 e!524469)))

(declare-fun c!97126 () Bool)

(assert (=> b!934033 (= c!97126 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40624 () Bool)

(assert (=> bm!40624 (= call!40632 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934034 () Bool)

(declare-fun c!97129 () Bool)

(assert (=> b!934034 (= c!97129 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!524477 () ListLongMap!11961)

(declare-fun e!524474 () ListLongMap!11961)

(assert (=> b!934034 (= e!524477 e!524474)))

(declare-fun b!934035 () Bool)

(declare-fun e!524478 () ListLongMap!11961)

(assert (=> b!934035 (= e!524478 e!524477)))

(declare-fun c!97128 () Bool)

(assert (=> b!934035 (= c!97128 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934036 () Bool)

(declare-fun e!524472 () Unit!31509)

(declare-fun Unit!31515 () Unit!31509)

(assert (=> b!934036 (= e!524472 Unit!31515)))

(declare-fun b!934037 () Bool)

(assert (=> b!934037 (= e!524467 e!524476)))

(declare-fun res!629091 () Bool)

(assert (=> b!934037 (= res!629091 call!40629)))

(assert (=> b!934037 (=> (not res!629091) (not e!524476))))

(declare-fun b!934038 () Bool)

(declare-fun e!524473 () Bool)

(assert (=> b!934038 (= e!524473 (validKeyInArray!0 (select (arr!27045 _keys!1487) from!1844)))))

(declare-fun b!934039 () Bool)

(declare-fun e!524471 () Bool)

(assert (=> b!934039 (= e!524469 e!524471)))

(declare-fun res!629090 () Bool)

(declare-fun call!40630 () Bool)

(assert (=> b!934039 (= res!629090 call!40630)))

(assert (=> b!934039 (=> (not res!629090) (not e!524471))))

(declare-fun b!934040 () Bool)

(declare-fun res!629093 () Bool)

(assert (=> b!934040 (=> (not res!629093) (not e!524468))))

(declare-fun e!524466 () Bool)

(assert (=> b!934040 (= res!629093 e!524466)))

(declare-fun res!629098 () Bool)

(assert (=> b!934040 (=> res!629098 e!524466)))

(assert (=> b!934040 (= res!629098 (not e!524473))))

(declare-fun res!629095 () Bool)

(assert (=> b!934040 (=> (not res!629095) (not e!524473))))

(assert (=> b!934040 (= res!629095 (bvslt from!1844 (size!27504 _keys!1487)))))

(declare-fun b!934041 () Bool)

(declare-fun call!40627 () ListLongMap!11961)

(assert (=> b!934041 (= e!524477 call!40627)))

(declare-fun b!934042 () Bool)

(declare-fun res!629097 () Bool)

(assert (=> b!934042 (=> (not res!629097) (not e!524468))))

(assert (=> b!934042 (= res!629097 e!524467)))

(declare-fun c!97127 () Bool)

(assert (=> b!934042 (= c!97127 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40625 () Bool)

(declare-fun call!40631 () ListLongMap!11961)

(assert (=> bm!40625 (= call!40627 call!40631)))

(declare-fun bm!40626 () Bool)

(assert (=> bm!40626 (= call!40630 (contains!5045 lt!420762 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113133 () Bool)

(assert (=> d!113133 e!524468))

(declare-fun res!629094 () Bool)

(assert (=> d!113133 (=> (not res!629094) (not e!524468))))

(assert (=> d!113133 (= res!629094 (or (bvsge from!1844 (size!27504 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27504 _keys!1487)))))))

(declare-fun lt!420763 () ListLongMap!11961)

(assert (=> d!113133 (= lt!420762 lt!420763)))

(declare-fun lt!420780 () Unit!31509)

(assert (=> d!113133 (= lt!420780 e!524472)))

(declare-fun c!97131 () Bool)

(assert (=> d!113133 (= c!97131 e!524475)))

(declare-fun res!629096 () Bool)

(assert (=> d!113133 (=> (not res!629096) (not e!524475))))

(assert (=> d!113133 (= res!629096 (bvslt from!1844 (size!27504 _keys!1487)))))

(assert (=> d!113133 (= lt!420763 e!524478)))

(declare-fun c!97130 () Bool)

(assert (=> d!113133 (= c!97130 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113133 (validMask!0 mask!1881)))

(assert (=> d!113133 (= (getCurrentListMap!3234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!420762)))

(declare-fun b!934043 () Bool)

(declare-fun lt!420773 () Unit!31509)

(assert (=> b!934043 (= e!524472 lt!420773)))

(declare-fun lt!420777 () ListLongMap!11961)

(assert (=> b!934043 (= lt!420777 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!420765 () (_ BitVec 64))

(assert (=> b!934043 (= lt!420765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420778 () (_ BitVec 64))

(assert (=> b!934043 (= lt!420778 (select (arr!27045 _keys!1487) from!1844))))

(declare-fun lt!420782 () Unit!31509)

(assert (=> b!934043 (= lt!420782 (addStillContains!516 lt!420777 lt!420765 zeroValue!1173 lt!420778))))

(assert (=> b!934043 (contains!5045 (+!2797 lt!420777 (tuple2!13265 lt!420765 zeroValue!1173)) lt!420778)))

(declare-fun lt!420776 () Unit!31509)

(assert (=> b!934043 (= lt!420776 lt!420782)))

(declare-fun lt!420781 () ListLongMap!11961)

(assert (=> b!934043 (= lt!420781 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!420764 () (_ BitVec 64))

(assert (=> b!934043 (= lt!420764 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420771 () (_ BitVec 64))

(assert (=> b!934043 (= lt!420771 (select (arr!27045 _keys!1487) from!1844))))

(declare-fun lt!420769 () Unit!31509)

(assert (=> b!934043 (= lt!420769 (addApplyDifferent!418 lt!420781 lt!420764 minValue!1173 lt!420771))))

(assert (=> b!934043 (= (apply!805 (+!2797 lt!420781 (tuple2!13265 lt!420764 minValue!1173)) lt!420771) (apply!805 lt!420781 lt!420771))))

(declare-fun lt!420779 () Unit!31509)

(assert (=> b!934043 (= lt!420779 lt!420769)))

(declare-fun lt!420774 () ListLongMap!11961)

(assert (=> b!934043 (= lt!420774 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!420783 () (_ BitVec 64))

(assert (=> b!934043 (= lt!420783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420766 () (_ BitVec 64))

(assert (=> b!934043 (= lt!420766 (select (arr!27045 _keys!1487) from!1844))))

(declare-fun lt!420772 () Unit!31509)

(assert (=> b!934043 (= lt!420772 (addApplyDifferent!418 lt!420774 lt!420783 zeroValue!1173 lt!420766))))

(assert (=> b!934043 (= (apply!805 (+!2797 lt!420774 (tuple2!13265 lt!420783 zeroValue!1173)) lt!420766) (apply!805 lt!420774 lt!420766))))

(declare-fun lt!420767 () Unit!31509)

(assert (=> b!934043 (= lt!420767 lt!420772)))

(declare-fun lt!420775 () ListLongMap!11961)

(assert (=> b!934043 (= lt!420775 (getCurrentListMapNoExtraKeys!3299 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!420768 () (_ BitVec 64))

(assert (=> b!934043 (= lt!420768 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420770 () (_ BitVec 64))

(assert (=> b!934043 (= lt!420770 (select (arr!27045 _keys!1487) from!1844))))

(assert (=> b!934043 (= lt!420773 (addApplyDifferent!418 lt!420775 lt!420768 minValue!1173 lt!420770))))

(assert (=> b!934043 (= (apply!805 (+!2797 lt!420775 (tuple2!13265 lt!420768 minValue!1173)) lt!420770) (apply!805 lt!420775 lt!420770))))

(declare-fun b!934044 () Bool)

(declare-fun call!40626 () ListLongMap!11961)

(assert (=> b!934044 (= e!524474 call!40626)))

(declare-fun bm!40627 () Bool)

(assert (=> bm!40627 (= call!40629 (contains!5045 lt!420762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934045 () Bool)

(assert (=> b!934045 (= e!524469 (not call!40630))))

(declare-fun bm!40628 () Bool)

(assert (=> bm!40628 (= call!40626 call!40628)))

(declare-fun b!934046 () Bool)

(assert (=> b!934046 (= e!524478 (+!2797 call!40631 (tuple2!13265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!934047 () Bool)

(declare-fun e!524470 () Bool)

(assert (=> b!934047 (= e!524470 (= (apply!805 lt!420762 (select (arr!27045 _keys!1487) from!1844)) (get!14231 (select (arr!27046 _values!1231) from!1844) (dynLambda!1586 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934047 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27505 _values!1231)))))

(assert (=> b!934047 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27504 _keys!1487)))))

(declare-fun b!934048 () Bool)

(assert (=> b!934048 (= e!524466 e!524470)))

(declare-fun res!629092 () Bool)

(assert (=> b!934048 (=> (not res!629092) (not e!524470))))

(assert (=> b!934048 (= res!629092 (contains!5045 lt!420762 (select (arr!27045 _keys!1487) from!1844)))))

(assert (=> b!934048 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27504 _keys!1487)))))

(declare-fun b!934049 () Bool)

(assert (=> b!934049 (= e!524474 call!40627)))

(declare-fun bm!40629 () Bool)

(assert (=> bm!40629 (= call!40631 (+!2797 (ite c!97130 call!40632 (ite c!97128 call!40628 call!40626)) (ite (or c!97130 c!97128) (tuple2!13265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!934050 () Bool)

(assert (=> b!934050 (= e!524471 (= (apply!805 lt!420762 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(assert (= (and d!113133 c!97130) b!934046))

(assert (= (and d!113133 (not c!97130)) b!934035))

(assert (= (and b!934035 c!97128) b!934041))

(assert (= (and b!934035 (not c!97128)) b!934034))

(assert (= (and b!934034 c!97129) b!934049))

(assert (= (and b!934034 (not c!97129)) b!934044))

(assert (= (or b!934049 b!934044) bm!40628))

(assert (= (or b!934041 bm!40628) bm!40623))

(assert (= (or b!934041 b!934049) bm!40625))

(assert (= (or b!934046 bm!40623) bm!40624))

(assert (= (or b!934046 bm!40625) bm!40629))

(assert (= (and d!113133 res!629096) b!934030))

(assert (= (and d!113133 c!97131) b!934043))

(assert (= (and d!113133 (not c!97131)) b!934036))

(assert (= (and d!113133 res!629094) b!934040))

(assert (= (and b!934040 res!629095) b!934038))

(assert (= (and b!934040 (not res!629098)) b!934048))

(assert (= (and b!934048 res!629092) b!934047))

(assert (= (and b!934040 res!629093) b!934042))

(assert (= (and b!934042 c!97127) b!934037))

(assert (= (and b!934042 (not c!97127)) b!934031))

(assert (= (and b!934037 res!629091) b!934032))

(assert (= (or b!934037 b!934031) bm!40627))

(assert (= (and b!934042 res!629097) b!934033))

(assert (= (and b!934033 c!97126) b!934039))

(assert (= (and b!934033 (not c!97126)) b!934045))

(assert (= (and b!934039 res!629090) b!934050))

(assert (= (or b!934039 b!934045) bm!40626))

(declare-fun b_lambda!13971 () Bool)

(assert (=> (not b_lambda!13971) (not b!934047)))

(assert (=> b!934047 t!27215))

(declare-fun b_and!28823 () Bool)

(assert (= b_and!28821 (and (=> t!27215 result!11863) b_and!28823)))

(declare-fun m!868289 () Bool)

(assert (=> bm!40627 m!868289))

(assert (=> b!934030 m!868099))

(assert (=> b!934030 m!868099))

(declare-fun m!868291 () Bool)

(assert (=> b!934030 m!868291))

(assert (=> b!934048 m!868099))

(assert (=> b!934048 m!868099))

(declare-fun m!868293 () Bool)

(assert (=> b!934048 m!868293))

(assert (=> b!934047 m!868099))

(declare-fun m!868295 () Bool)

(assert (=> b!934047 m!868295))

(assert (=> b!934047 m!868021))

(declare-fun m!868297 () Bool)

(assert (=> b!934047 m!868297))

(assert (=> b!934047 m!868295))

(assert (=> b!934047 m!868099))

(declare-fun m!868299 () Bool)

(assert (=> b!934047 m!868299))

(assert (=> b!934047 m!868021))

(assert (=> b!934038 m!868099))

(assert (=> b!934038 m!868099))

(assert (=> b!934038 m!868291))

(declare-fun m!868301 () Bool)

(assert (=> bm!40629 m!868301))

(declare-fun m!868303 () Bool)

(assert (=> b!934046 m!868303))

(assert (=> b!934043 m!868099))

(declare-fun m!868305 () Bool)

(assert (=> b!934043 m!868305))

(declare-fun m!868307 () Bool)

(assert (=> b!934043 m!868307))

(declare-fun m!868309 () Bool)

(assert (=> b!934043 m!868309))

(declare-fun m!868311 () Bool)

(assert (=> b!934043 m!868311))

(declare-fun m!868313 () Bool)

(assert (=> b!934043 m!868313))

(declare-fun m!868315 () Bool)

(assert (=> b!934043 m!868315))

(declare-fun m!868317 () Bool)

(assert (=> b!934043 m!868317))

(declare-fun m!868319 () Bool)

(assert (=> b!934043 m!868319))

(assert (=> b!934043 m!868319))

(declare-fun m!868321 () Bool)

(assert (=> b!934043 m!868321))

(declare-fun m!868323 () Bool)

(assert (=> b!934043 m!868323))

(declare-fun m!868325 () Bool)

(assert (=> b!934043 m!868325))

(declare-fun m!868327 () Bool)

(assert (=> b!934043 m!868327))

(declare-fun m!868329 () Bool)

(assert (=> b!934043 m!868329))

(assert (=> b!934043 m!868315))

(declare-fun m!868331 () Bool)

(assert (=> b!934043 m!868331))

(declare-fun m!868333 () Bool)

(assert (=> b!934043 m!868333))

(assert (=> b!934043 m!868323))

(assert (=> b!934043 m!868327))

(declare-fun m!868335 () Bool)

(assert (=> b!934043 m!868335))

(declare-fun m!868337 () Bool)

(assert (=> bm!40626 m!868337))

(assert (=> d!113133 m!868039))

(declare-fun m!868339 () Bool)

(assert (=> b!934050 m!868339))

(assert (=> bm!40624 m!868317))

(declare-fun m!868341 () Bool)

(assert (=> b!934032 m!868341))

(assert (=> b!933820 d!113133))

(declare-fun d!113135 () Bool)

(declare-fun get!14234 (Option!485) V!31809)

(assert (=> d!113135 (= (apply!805 lt!420593 k0!1099) (get!14234 (getValueByKey!479 (toList!5996 lt!420593) k0!1099)))))

(declare-fun bs!26229 () Bool)

(assert (= bs!26229 d!113135))

(assert (=> bs!26229 m!868285))

(assert (=> bs!26229 m!868285))

(declare-fun m!868343 () Bool)

(assert (=> bs!26229 m!868343))

(assert (=> b!933815 d!113135))

(declare-fun mapIsEmpty!31965 () Bool)

(declare-fun mapRes!31965 () Bool)

(assert (=> mapIsEmpty!31965 mapRes!31965))

(declare-fun b!934057 () Bool)

(declare-fun e!524483 () Bool)

(assert (=> b!934057 (= e!524483 tp_is_empty!20133)))

(declare-fun mapNonEmpty!31965 () Bool)

(declare-fun tp!61328 () Bool)

(assert (=> mapNonEmpty!31965 (= mapRes!31965 (and tp!61328 e!524483))))

(declare-fun mapRest!31965 () (Array (_ BitVec 32) ValueCell!9585))

(declare-fun mapValue!31965 () ValueCell!9585)

(declare-fun mapKey!31965 () (_ BitVec 32))

(assert (=> mapNonEmpty!31965 (= mapRest!31959 (store mapRest!31965 mapKey!31965 mapValue!31965))))

(declare-fun b!934058 () Bool)

(declare-fun e!524484 () Bool)

(assert (=> b!934058 (= e!524484 tp_is_empty!20133)))

(declare-fun condMapEmpty!31965 () Bool)

(declare-fun mapDefault!31965 () ValueCell!9585)

(assert (=> mapNonEmpty!31959 (= condMapEmpty!31965 (= mapRest!31959 ((as const (Array (_ BitVec 32) ValueCell!9585)) mapDefault!31965)))))

(assert (=> mapNonEmpty!31959 (= tp!61319 (and e!524484 mapRes!31965))))

(assert (= (and mapNonEmpty!31959 condMapEmpty!31965) mapIsEmpty!31965))

(assert (= (and mapNonEmpty!31959 (not condMapEmpty!31965)) mapNonEmpty!31965))

(assert (= (and mapNonEmpty!31965 ((_ is ValueCellFull!9585) mapValue!31965)) b!934057))

(assert (= (and mapNonEmpty!31959 ((_ is ValueCellFull!9585) mapDefault!31965)) b!934058))

(declare-fun m!868345 () Bool)

(assert (=> mapNonEmpty!31965 m!868345))

(declare-fun b_lambda!13973 () Bool)

(assert (= b_lambda!13971 (or (and start!79438 b_free!17625) b_lambda!13973)))

(declare-fun b_lambda!13975 () Bool)

(assert (= b_lambda!13969 (or (and start!79438 b_free!17625) b_lambda!13975)))

(declare-fun b_lambda!13977 () Bool)

(assert (= b_lambda!13967 (or (and start!79438 b_free!17625) b_lambda!13977)))

(declare-fun b_lambda!13979 () Bool)

(assert (= b_lambda!13965 (or (and start!79438 b_free!17625) b_lambda!13979)))

(check-sat (not d!113107) (not b!933964) (not b!933973) (not d!113115) (not b!933942) tp_is_empty!20133 (not b!933943) (not b!933955) (not b!934026) (not b_lambda!13975) (not bm!40626) b_and!28823 (not b!933882) (not b!934048) (not b!934032) (not b!934014) (not b!933960) (not b!933934) (not b!933963) (not d!113131) (not b!933946) (not bm!40627) (not b!934047) (not d!113135) (not b!934000) (not b!933988) (not b!933993) (not d!113099) (not b_lambda!13963) (not b_lambda!13977) (not bm!40619) (not b!933949) (not bm!40608) (not d!113105) (not bm!40624) (not bm!40615) (not b!933944) (not bm!40612) (not d!113103) (not b!934038) (not d!113111) (not b!933969) (not b!934012) (not b!934009) (not b!934043) (not b!933877) (not b!934013) (not b_lambda!13979) (not b!934024) (not b_next!17625) (not bm!40610) (not b!934050) (not b!934007) (not b!933987) (not b_lambda!13973) (not bm!40629) (not b!933999) (not d!113133) (not bm!40606) (not b!934029) (not b!933883) (not b!934027) (not bm!40605) (not b!933928) (not b!933965) (not bm!40603) (not mapNonEmpty!31965) (not bm!40622) (not bm!40618) (not b!933970) (not d!113117) (not b!934046) (not b!933947) (not d!113097) (not b!933967) (not b!933926) (not b!933939) (not b!933986) (not d!113101) (not b!934030) (not bm!40613))
(check-sat b_and!28823 (not b_next!17625))
