; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113930 () Bool)

(assert start!113930)

(declare-fun b_free!31591 () Bool)

(declare-fun b_next!31591 () Bool)

(assert (=> start!113930 (= b_free!31591 (not b_next!31591))))

(declare-fun tp!110591 () Bool)

(declare-fun b_and!50991 () Bool)

(assert (=> start!113930 (= tp!110591 b_and!50991)))

(declare-fun b!1350871 () Bool)

(declare-fun e!768555 () Bool)

(declare-fun tp_is_empty!37591 () Bool)

(assert (=> b!1350871 (= e!768555 tp_is_empty!37591)))

(declare-fun mapIsEmpty!58107 () Bool)

(declare-fun mapRes!58107 () Bool)

(assert (=> mapIsEmpty!58107 mapRes!58107))

(declare-fun b!1350872 () Bool)

(declare-fun e!768553 () Bool)

(assert (=> b!1350872 (= e!768553 tp_is_empty!37591)))

(declare-fun mapNonEmpty!58107 () Bool)

(declare-fun tp!110592 () Bool)

(assert (=> mapNonEmpty!58107 (= mapRes!58107 (and tp!110592 e!768553))))

(declare-datatypes ((V!55225 0))(
  ( (V!55226 (val!18870 Int)) )
))
(declare-datatypes ((ValueCell!17897 0))(
  ( (ValueCellFull!17897 (v!21521 V!55225)) (EmptyCell!17897) )
))
(declare-fun mapRest!58107 () (Array (_ BitVec 32) ValueCell!17897))

(declare-fun mapValue!58107 () ValueCell!17897)

(declare-fun mapKey!58107 () (_ BitVec 32))

(declare-datatypes ((array!92129 0))(
  ( (array!92130 (arr!44512 (Array (_ BitVec 32) ValueCell!17897)) (size!45063 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92129)

(assert (=> mapNonEmpty!58107 (= (arr!44512 _values!1303) (store mapRest!58107 mapKey!58107 mapValue!58107))))

(declare-fun b!1350874 () Bool)

(declare-fun res!895838 () Bool)

(declare-fun e!768556 () Bool)

(assert (=> b!1350874 (=> (not res!895838) (not e!768556))))

(declare-datatypes ((array!92131 0))(
  ( (array!92132 (arr!44513 (Array (_ BitVec 32) (_ BitVec 64))) (size!45064 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92131)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92131 (_ BitVec 32)) Bool)

(assert (=> b!1350874 (= res!895838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1350875 () Bool)

(declare-fun res!895836 () Bool)

(assert (=> b!1350875 (=> (not res!895836) (not e!768556))))

(declare-fun minValue!1245 () V!55225)

(declare-fun zeroValue!1245 () V!55225)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24392 0))(
  ( (tuple2!24393 (_1!12207 (_ BitVec 64)) (_2!12207 V!55225)) )
))
(declare-datatypes ((List!31527 0))(
  ( (Nil!31524) (Cons!31523 (h!32741 tuple2!24392) (t!46175 List!31527)) )
))
(declare-datatypes ((ListLongMap!22057 0))(
  ( (ListLongMap!22058 (toList!11044 List!31527)) )
))
(declare-fun contains!9239 (ListLongMap!22057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5980 (array!92131 array!92129 (_ BitVec 32) (_ BitVec 32) V!55225 V!55225 (_ BitVec 32) Int) ListLongMap!22057)

(assert (=> b!1350875 (= res!895836 (contains!9239 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1350876 () Bool)

(declare-fun res!895841 () Bool)

(assert (=> b!1350876 (=> (not res!895841) (not e!768556))))

(assert (=> b!1350876 (= res!895841 (not (= (select (arr!44513 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1350877 () Bool)

(declare-fun res!895835 () Bool)

(assert (=> b!1350877 (=> (not res!895835) (not e!768556))))

(declare-datatypes ((List!31528 0))(
  ( (Nil!31525) (Cons!31524 (h!32742 (_ BitVec 64)) (t!46176 List!31528)) )
))
(declare-fun arrayNoDuplicates!0 (array!92131 (_ BitVec 32) List!31528) Bool)

(assert (=> b!1350877 (= res!895835 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31525))))

(declare-fun b!1350878 () Bool)

(declare-fun res!895842 () Bool)

(assert (=> b!1350878 (=> (not res!895842) (not e!768556))))

(assert (=> b!1350878 (= res!895842 (and (= (size!45063 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45064 _keys!1571) (size!45063 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1350879 () Bool)

(declare-fun res!895839 () Bool)

(assert (=> b!1350879 (=> (not res!895839) (not e!768556))))

(assert (=> b!1350879 (= res!895839 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45064 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1350880 () Bool)

(declare-fun res!895840 () Bool)

(assert (=> b!1350880 (=> (not res!895840) (not e!768556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350880 (= res!895840 (not (validKeyInArray!0 (select (arr!44513 _keys!1571) from!1960))))))

(declare-fun b!1350881 () Bool)

(declare-fun e!768554 () Bool)

(assert (=> b!1350881 (= e!768554 (and e!768555 mapRes!58107))))

(declare-fun condMapEmpty!58107 () Bool)

(declare-fun mapDefault!58107 () ValueCell!17897)

(assert (=> b!1350881 (= condMapEmpty!58107 (= (arr!44512 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17897)) mapDefault!58107)))))

(declare-fun b!1350873 () Bool)

(assert (=> b!1350873 (= e!768556 (not (contains!9239 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142)))))

(declare-fun res!895837 () Bool)

(assert (=> start!113930 (=> (not res!895837) (not e!768556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113930 (= res!895837 (validMask!0 mask!1977))))

(assert (=> start!113930 e!768556))

(assert (=> start!113930 tp_is_empty!37591))

(assert (=> start!113930 true))

(declare-fun array_inv!33793 (array!92131) Bool)

(assert (=> start!113930 (array_inv!33793 _keys!1571)))

(declare-fun array_inv!33794 (array!92129) Bool)

(assert (=> start!113930 (and (array_inv!33794 _values!1303) e!768554)))

(assert (=> start!113930 tp!110591))

(assert (= (and start!113930 res!895837) b!1350878))

(assert (= (and b!1350878 res!895842) b!1350874))

(assert (= (and b!1350874 res!895838) b!1350877))

(assert (= (and b!1350877 res!895835) b!1350879))

(assert (= (and b!1350879 res!895839) b!1350875))

(assert (= (and b!1350875 res!895836) b!1350876))

(assert (= (and b!1350876 res!895841) b!1350880))

(assert (= (and b!1350880 res!895840) b!1350873))

(assert (= (and b!1350881 condMapEmpty!58107) mapIsEmpty!58107))

(assert (= (and b!1350881 (not condMapEmpty!58107)) mapNonEmpty!58107))

(get-info :version)

(assert (= (and mapNonEmpty!58107 ((_ is ValueCellFull!17897) mapValue!58107)) b!1350872))

(assert (= (and b!1350881 ((_ is ValueCellFull!17897) mapDefault!58107)) b!1350871))

(assert (= start!113930 b!1350881))

(declare-fun m!1238269 () Bool)

(assert (=> b!1350873 m!1238269))

(assert (=> b!1350873 m!1238269))

(declare-fun m!1238271 () Bool)

(assert (=> b!1350873 m!1238271))

(declare-fun m!1238273 () Bool)

(assert (=> b!1350875 m!1238273))

(assert (=> b!1350875 m!1238273))

(declare-fun m!1238275 () Bool)

(assert (=> b!1350875 m!1238275))

(declare-fun m!1238277 () Bool)

(assert (=> b!1350877 m!1238277))

(declare-fun m!1238279 () Bool)

(assert (=> start!113930 m!1238279))

(declare-fun m!1238281 () Bool)

(assert (=> start!113930 m!1238281))

(declare-fun m!1238283 () Bool)

(assert (=> start!113930 m!1238283))

(declare-fun m!1238285 () Bool)

(assert (=> b!1350880 m!1238285))

(assert (=> b!1350880 m!1238285))

(declare-fun m!1238287 () Bool)

(assert (=> b!1350880 m!1238287))

(assert (=> b!1350876 m!1238285))

(declare-fun m!1238289 () Bool)

(assert (=> b!1350874 m!1238289))

(declare-fun m!1238291 () Bool)

(assert (=> mapNonEmpty!58107 m!1238291))

(check-sat (not b!1350880) b_and!50991 (not b!1350873) (not b!1350874) tp_is_empty!37591 (not start!113930) (not b_next!31591) (not b!1350875) (not b!1350877) (not mapNonEmpty!58107))
(check-sat b_and!50991 (not b_next!31591))
(get-model)

(declare-fun bm!65265 () Bool)

(declare-fun call!65268 () Bool)

(declare-fun c!127003 () Bool)

(assert (=> bm!65265 (= call!65268 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127003 (Cons!31524 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) Nil!31525) Nil!31525)))))

(declare-fun b!1350959 () Bool)

(declare-fun e!768596 () Bool)

(assert (=> b!1350959 (= e!768596 call!65268)))

(declare-fun b!1350960 () Bool)

(declare-fun e!768595 () Bool)

(declare-fun e!768597 () Bool)

(assert (=> b!1350960 (= e!768595 e!768597)))

(declare-fun res!895898 () Bool)

(assert (=> b!1350960 (=> (not res!895898) (not e!768597))))

(declare-fun e!768598 () Bool)

(assert (=> b!1350960 (= res!895898 (not e!768598))))

(declare-fun res!895897 () Bool)

(assert (=> b!1350960 (=> (not res!895897) (not e!768598))))

(assert (=> b!1350960 (= res!895897 (validKeyInArray!0 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1350961 () Bool)

(assert (=> b!1350961 (= e!768596 call!65268)))

(declare-fun b!1350962 () Bool)

(declare-fun contains!9241 (List!31528 (_ BitVec 64)) Bool)

(assert (=> b!1350962 (= e!768598 (contains!9241 Nil!31525 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1350958 () Bool)

(assert (=> b!1350958 (= e!768597 e!768596)))

(assert (=> b!1350958 (= c!127003 (validKeyInArray!0 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun d!145135 () Bool)

(declare-fun res!895899 () Bool)

(assert (=> d!145135 (=> res!895899 e!768595)))

(assert (=> d!145135 (= res!895899 (bvsge #b00000000000000000000000000000000 (size!45064 _keys!1571)))))

(assert (=> d!145135 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31525) e!768595)))

(assert (= (and d!145135 (not res!895899)) b!1350960))

(assert (= (and b!1350960 res!895897) b!1350962))

(assert (= (and b!1350960 res!895898) b!1350958))

(assert (= (and b!1350958 c!127003) b!1350959))

(assert (= (and b!1350958 (not c!127003)) b!1350961))

(assert (= (or b!1350959 b!1350961) bm!65265))

(declare-fun m!1238341 () Bool)

(assert (=> bm!65265 m!1238341))

(declare-fun m!1238343 () Bool)

(assert (=> bm!65265 m!1238343))

(assert (=> b!1350960 m!1238341))

(assert (=> b!1350960 m!1238341))

(declare-fun m!1238345 () Bool)

(assert (=> b!1350960 m!1238345))

(assert (=> b!1350962 m!1238341))

(assert (=> b!1350962 m!1238341))

(declare-fun m!1238347 () Bool)

(assert (=> b!1350962 m!1238347))

(assert (=> b!1350958 m!1238341))

(assert (=> b!1350958 m!1238341))

(assert (=> b!1350958 m!1238345))

(assert (=> b!1350877 d!145135))

(declare-fun d!145137 () Bool)

(declare-fun e!768603 () Bool)

(assert (=> d!145137 e!768603))

(declare-fun res!895902 () Bool)

(assert (=> d!145137 (=> res!895902 e!768603)))

(declare-fun lt!597094 () Bool)

(assert (=> d!145137 (= res!895902 (not lt!597094))))

(declare-fun lt!597096 () Bool)

(assert (=> d!145137 (= lt!597094 lt!597096)))

(declare-datatypes ((Unit!44142 0))(
  ( (Unit!44143) )
))
(declare-fun lt!597095 () Unit!44142)

(declare-fun e!768604 () Unit!44142)

(assert (=> d!145137 (= lt!597095 e!768604)))

(declare-fun c!127006 () Bool)

(assert (=> d!145137 (= c!127006 lt!597096)))

(declare-fun containsKey!746 (List!31527 (_ BitVec 64)) Bool)

(assert (=> d!145137 (= lt!597096 (containsKey!746 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!145137 (= (contains!9239 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!597094)))

(declare-fun b!1350969 () Bool)

(declare-fun lt!597097 () Unit!44142)

(assert (=> b!1350969 (= e!768604 lt!597097)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!492 (List!31527 (_ BitVec 64)) Unit!44142)

(assert (=> b!1350969 (= lt!597097 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-datatypes ((Option!771 0))(
  ( (Some!770 (v!21524 V!55225)) (None!769) )
))
(declare-fun isDefined!529 (Option!771) Bool)

(declare-fun getValueByKey!720 (List!31527 (_ BitVec 64)) Option!771)

(assert (=> b!1350969 (isDefined!529 (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1350970 () Bool)

(declare-fun Unit!44144 () Unit!44142)

(assert (=> b!1350970 (= e!768604 Unit!44144)))

(declare-fun b!1350971 () Bool)

(assert (=> b!1350971 (= e!768603 (isDefined!529 (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!145137 c!127006) b!1350969))

(assert (= (and d!145137 (not c!127006)) b!1350970))

(assert (= (and d!145137 (not res!895902)) b!1350971))

(declare-fun m!1238349 () Bool)

(assert (=> d!145137 m!1238349))

(declare-fun m!1238351 () Bool)

(assert (=> b!1350969 m!1238351))

(declare-fun m!1238353 () Bool)

(assert (=> b!1350969 m!1238353))

(assert (=> b!1350969 m!1238353))

(declare-fun m!1238355 () Bool)

(assert (=> b!1350969 m!1238355))

(assert (=> b!1350971 m!1238353))

(assert (=> b!1350971 m!1238353))

(assert (=> b!1350971 m!1238355))

(assert (=> b!1350875 d!145137))

(declare-fun b!1351014 () Bool)

(declare-fun res!895926 () Bool)

(declare-fun e!768639 () Bool)

(assert (=> b!1351014 (=> (not res!895926) (not e!768639))))

(declare-fun e!768642 () Bool)

(assert (=> b!1351014 (= res!895926 e!768642)))

(declare-fun res!895923 () Bool)

(assert (=> b!1351014 (=> res!895923 e!768642)))

(declare-fun e!768634 () Bool)

(assert (=> b!1351014 (= res!895923 (not e!768634))))

(declare-fun res!895922 () Bool)

(assert (=> b!1351014 (=> (not res!895922) (not e!768634))))

(assert (=> b!1351014 (= res!895922 (bvslt from!1960 (size!45064 _keys!1571)))))

(declare-fun b!1351015 () Bool)

(assert (=> b!1351015 (= e!768634 (validKeyInArray!0 (select (arr!44513 _keys!1571) from!1960)))))

(declare-fun b!1351016 () Bool)

(declare-fun e!768643 () Bool)

(declare-fun lt!597149 () ListLongMap!22057)

(declare-fun apply!1050 (ListLongMap!22057 (_ BitVec 64)) V!55225)

(declare-fun get!22512 (ValueCell!17897 V!55225) V!55225)

(declare-fun dynLambda!3850 (Int (_ BitVec 64)) V!55225)

(assert (=> b!1351016 (= e!768643 (= (apply!1050 lt!597149 (select (arr!44513 _keys!1571) from!1960)) (get!22512 (select (arr!44512 _values!1303) from!1960) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1351016 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45063 _values!1303)))))

(assert (=> b!1351016 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45064 _keys!1571)))))

(declare-fun bm!65280 () Bool)

(declare-fun call!65283 () ListLongMap!22057)

(declare-fun call!65285 () ListLongMap!22057)

(assert (=> bm!65280 (= call!65283 call!65285)))

(declare-fun c!127022 () Bool)

(declare-fun c!127020 () Bool)

(declare-fun call!65289 () ListLongMap!22057)

(declare-fun bm!65281 () Bool)

(declare-fun call!65288 () ListLongMap!22057)

(declare-fun +!4896 (ListLongMap!22057 tuple2!24392) ListLongMap!22057)

(assert (=> bm!65281 (= call!65288 (+!4896 (ite c!127022 call!65285 (ite c!127020 call!65283 call!65289)) (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1351017 () Bool)

(declare-fun e!768633 () Bool)

(assert (=> b!1351017 (= e!768633 (validKeyInArray!0 (select (arr!44513 _keys!1571) from!1960)))))

(declare-fun b!1351018 () Bool)

(declare-fun e!768638 () Bool)

(declare-fun call!65286 () Bool)

(assert (=> b!1351018 (= e!768638 (not call!65286))))

(declare-fun bm!65282 () Bool)

(assert (=> bm!65282 (= call!65286 (contains!9239 lt!597149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351019 () Bool)

(declare-fun e!768641 () ListLongMap!22057)

(assert (=> b!1351019 (= e!768641 (+!4896 call!65288 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1351020 () Bool)

(declare-fun e!768632 () Unit!44142)

(declare-fun lt!597163 () Unit!44142)

(assert (=> b!1351020 (= e!768632 lt!597163)))

(declare-fun lt!597154 () ListLongMap!22057)

(declare-fun getCurrentListMapNoExtraKeys!6549 (array!92131 array!92129 (_ BitVec 32) (_ BitVec 32) V!55225 V!55225 (_ BitVec 32) Int) ListLongMap!22057)

(assert (=> b!1351020 (= lt!597154 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!597157 () (_ BitVec 64))

(assert (=> b!1351020 (= lt!597157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597145 () (_ BitVec 64))

(assert (=> b!1351020 (= lt!597145 (select (arr!44513 _keys!1571) from!1960))))

(declare-fun lt!597142 () Unit!44142)

(declare-fun addStillContains!1218 (ListLongMap!22057 (_ BitVec 64) V!55225 (_ BitVec 64)) Unit!44142)

(assert (=> b!1351020 (= lt!597142 (addStillContains!1218 lt!597154 lt!597157 zeroValue!1245 lt!597145))))

(assert (=> b!1351020 (contains!9239 (+!4896 lt!597154 (tuple2!24393 lt!597157 zeroValue!1245)) lt!597145)))

(declare-fun lt!597144 () Unit!44142)

(assert (=> b!1351020 (= lt!597144 lt!597142)))

(declare-fun lt!597146 () ListLongMap!22057)

(assert (=> b!1351020 (= lt!597146 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!597155 () (_ BitVec 64))

(assert (=> b!1351020 (= lt!597155 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597159 () (_ BitVec 64))

(assert (=> b!1351020 (= lt!597159 (select (arr!44513 _keys!1571) from!1960))))

(declare-fun lt!597161 () Unit!44142)

(declare-fun addApplyDifferent!579 (ListLongMap!22057 (_ BitVec 64) V!55225 (_ BitVec 64)) Unit!44142)

(assert (=> b!1351020 (= lt!597161 (addApplyDifferent!579 lt!597146 lt!597155 minValue!1245 lt!597159))))

(assert (=> b!1351020 (= (apply!1050 (+!4896 lt!597146 (tuple2!24393 lt!597155 minValue!1245)) lt!597159) (apply!1050 lt!597146 lt!597159))))

(declare-fun lt!597160 () Unit!44142)

(assert (=> b!1351020 (= lt!597160 lt!597161)))

(declare-fun lt!597156 () ListLongMap!22057)

(assert (=> b!1351020 (= lt!597156 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!597148 () (_ BitVec 64))

(assert (=> b!1351020 (= lt!597148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597150 () (_ BitVec 64))

(assert (=> b!1351020 (= lt!597150 (select (arr!44513 _keys!1571) from!1960))))

(declare-fun lt!597152 () Unit!44142)

(assert (=> b!1351020 (= lt!597152 (addApplyDifferent!579 lt!597156 lt!597148 zeroValue!1245 lt!597150))))

(assert (=> b!1351020 (= (apply!1050 (+!4896 lt!597156 (tuple2!24393 lt!597148 zeroValue!1245)) lt!597150) (apply!1050 lt!597156 lt!597150))))

(declare-fun lt!597147 () Unit!44142)

(assert (=> b!1351020 (= lt!597147 lt!597152)))

(declare-fun lt!597158 () ListLongMap!22057)

(assert (=> b!1351020 (= lt!597158 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!597153 () (_ BitVec 64))

(assert (=> b!1351020 (= lt!597153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597162 () (_ BitVec 64))

(assert (=> b!1351020 (= lt!597162 (select (arr!44513 _keys!1571) from!1960))))

(assert (=> b!1351020 (= lt!597163 (addApplyDifferent!579 lt!597158 lt!597153 minValue!1245 lt!597162))))

(assert (=> b!1351020 (= (apply!1050 (+!4896 lt!597158 (tuple2!24393 lt!597153 minValue!1245)) lt!597162) (apply!1050 lt!597158 lt!597162))))

(declare-fun b!1351021 () Bool)

(declare-fun c!127021 () Bool)

(assert (=> b!1351021 (= c!127021 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!768636 () ListLongMap!22057)

(declare-fun e!768637 () ListLongMap!22057)

(assert (=> b!1351021 (= e!768636 e!768637)))

(declare-fun b!1351022 () Bool)

(declare-fun e!768631 () Bool)

(declare-fun call!65287 () Bool)

(assert (=> b!1351022 (= e!768631 (not call!65287))))

(declare-fun bm!65283 () Bool)

(assert (=> bm!65283 (= call!65285 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun bm!65284 () Bool)

(declare-fun call!65284 () ListLongMap!22057)

(assert (=> bm!65284 (= call!65284 call!65288)))

(declare-fun b!1351023 () Bool)

(declare-fun Unit!44145 () Unit!44142)

(assert (=> b!1351023 (= e!768632 Unit!44145)))

(declare-fun d!145139 () Bool)

(assert (=> d!145139 e!768639))

(declare-fun res!895924 () Bool)

(assert (=> d!145139 (=> (not res!895924) (not e!768639))))

(assert (=> d!145139 (= res!895924 (or (bvsge from!1960 (size!45064 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45064 _keys!1571)))))))

(declare-fun lt!597151 () ListLongMap!22057)

(assert (=> d!145139 (= lt!597149 lt!597151)))

(declare-fun lt!597143 () Unit!44142)

(assert (=> d!145139 (= lt!597143 e!768632)))

(declare-fun c!127024 () Bool)

(assert (=> d!145139 (= c!127024 e!768633)))

(declare-fun res!895925 () Bool)

(assert (=> d!145139 (=> (not res!895925) (not e!768633))))

(assert (=> d!145139 (= res!895925 (bvslt from!1960 (size!45064 _keys!1571)))))

(assert (=> d!145139 (= lt!597151 e!768641)))

(assert (=> d!145139 (= c!127022 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!145139 (validMask!0 mask!1977)))

(assert (=> d!145139 (= (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!597149)))

(declare-fun b!1351024 () Bool)

(declare-fun e!768635 () Bool)

(assert (=> b!1351024 (= e!768631 e!768635)))

(declare-fun res!895928 () Bool)

(assert (=> b!1351024 (= res!895928 call!65287)))

(assert (=> b!1351024 (=> (not res!895928) (not e!768635))))

(declare-fun b!1351025 () Bool)

(assert (=> b!1351025 (= e!768639 e!768631)))

(declare-fun c!127023 () Bool)

(assert (=> b!1351025 (= c!127023 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1351026 () Bool)

(declare-fun e!768640 () Bool)

(assert (=> b!1351026 (= e!768640 (= (apply!1050 lt!597149 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1351027 () Bool)

(declare-fun res!895921 () Bool)

(assert (=> b!1351027 (=> (not res!895921) (not e!768639))))

(assert (=> b!1351027 (= res!895921 e!768638)))

(declare-fun c!127019 () Bool)

(assert (=> b!1351027 (= c!127019 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65285 () Bool)

(assert (=> bm!65285 (= call!65287 (contains!9239 lt!597149 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351028 () Bool)

(assert (=> b!1351028 (= e!768638 e!768640)))

(declare-fun res!895929 () Bool)

(assert (=> b!1351028 (= res!895929 call!65286)))

(assert (=> b!1351028 (=> (not res!895929) (not e!768640))))

(declare-fun b!1351029 () Bool)

(assert (=> b!1351029 (= e!768642 e!768643)))

(declare-fun res!895927 () Bool)

(assert (=> b!1351029 (=> (not res!895927) (not e!768643))))

(assert (=> b!1351029 (= res!895927 (contains!9239 lt!597149 (select (arr!44513 _keys!1571) from!1960)))))

(assert (=> b!1351029 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45064 _keys!1571)))))

(declare-fun b!1351030 () Bool)

(assert (=> b!1351030 (= e!768641 e!768636)))

(assert (=> b!1351030 (= c!127020 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1351031 () Bool)

(assert (=> b!1351031 (= e!768636 call!65284)))

(declare-fun b!1351032 () Bool)

(assert (=> b!1351032 (= e!768637 call!65289)))

(declare-fun bm!65286 () Bool)

(assert (=> bm!65286 (= call!65289 call!65283)))

(declare-fun b!1351033 () Bool)

(assert (=> b!1351033 (= e!768635 (= (apply!1050 lt!597149 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1351034 () Bool)

(assert (=> b!1351034 (= e!768637 call!65284)))

(assert (= (and d!145139 c!127022) b!1351019))

(assert (= (and d!145139 (not c!127022)) b!1351030))

(assert (= (and b!1351030 c!127020) b!1351031))

(assert (= (and b!1351030 (not c!127020)) b!1351021))

(assert (= (and b!1351021 c!127021) b!1351034))

(assert (= (and b!1351021 (not c!127021)) b!1351032))

(assert (= (or b!1351034 b!1351032) bm!65286))

(assert (= (or b!1351031 bm!65286) bm!65280))

(assert (= (or b!1351031 b!1351034) bm!65284))

(assert (= (or b!1351019 bm!65280) bm!65283))

(assert (= (or b!1351019 bm!65284) bm!65281))

(assert (= (and d!145139 res!895925) b!1351017))

(assert (= (and d!145139 c!127024) b!1351020))

(assert (= (and d!145139 (not c!127024)) b!1351023))

(assert (= (and d!145139 res!895924) b!1351014))

(assert (= (and b!1351014 res!895922) b!1351015))

(assert (= (and b!1351014 (not res!895923)) b!1351029))

(assert (= (and b!1351029 res!895927) b!1351016))

(assert (= (and b!1351014 res!895926) b!1351027))

(assert (= (and b!1351027 c!127019) b!1351028))

(assert (= (and b!1351027 (not c!127019)) b!1351018))

(assert (= (and b!1351028 res!895929) b!1351026))

(assert (= (or b!1351028 b!1351018) bm!65282))

(assert (= (and b!1351027 res!895921) b!1351025))

(assert (= (and b!1351025 c!127023) b!1351024))

(assert (= (and b!1351025 (not c!127023)) b!1351022))

(assert (= (and b!1351024 res!895928) b!1351033))

(assert (= (or b!1351024 b!1351022) bm!65285))

(declare-fun b_lambda!24713 () Bool)

(assert (=> (not b_lambda!24713) (not b!1351016)))

(declare-fun t!46180 () Bool)

(declare-fun tb!12453 () Bool)

(assert (=> (and start!113930 (= defaultEntry!1306 defaultEntry!1306) t!46180) tb!12453))

(declare-fun result!26013 () Bool)

(assert (=> tb!12453 (= result!26013 tp_is_empty!37591)))

(assert (=> b!1351016 t!46180))

(declare-fun b_and!50997 () Bool)

(assert (= b_and!50991 (and (=> t!46180 result!26013) b_and!50997)))

(declare-fun m!1238357 () Bool)

(assert (=> b!1351016 m!1238357))

(declare-fun m!1238359 () Bool)

(assert (=> b!1351016 m!1238359))

(declare-fun m!1238361 () Bool)

(assert (=> b!1351016 m!1238361))

(assert (=> b!1351016 m!1238285))

(declare-fun m!1238363 () Bool)

(assert (=> b!1351016 m!1238363))

(assert (=> b!1351016 m!1238359))

(assert (=> b!1351016 m!1238357))

(assert (=> b!1351016 m!1238285))

(declare-fun m!1238365 () Bool)

(assert (=> bm!65282 m!1238365))

(declare-fun m!1238367 () Bool)

(assert (=> bm!65283 m!1238367))

(declare-fun m!1238369 () Bool)

(assert (=> bm!65281 m!1238369))

(assert (=> b!1351029 m!1238285))

(assert (=> b!1351029 m!1238285))

(declare-fun m!1238371 () Bool)

(assert (=> b!1351029 m!1238371))

(assert (=> b!1351015 m!1238285))

(assert (=> b!1351015 m!1238285))

(assert (=> b!1351015 m!1238287))

(declare-fun m!1238373 () Bool)

(assert (=> bm!65285 m!1238373))

(assert (=> b!1351017 m!1238285))

(assert (=> b!1351017 m!1238285))

(assert (=> b!1351017 m!1238287))

(declare-fun m!1238375 () Bool)

(assert (=> b!1351020 m!1238375))

(declare-fun m!1238377 () Bool)

(assert (=> b!1351020 m!1238377))

(declare-fun m!1238379 () Bool)

(assert (=> b!1351020 m!1238379))

(declare-fun m!1238381 () Bool)

(assert (=> b!1351020 m!1238381))

(declare-fun m!1238383 () Bool)

(assert (=> b!1351020 m!1238383))

(declare-fun m!1238385 () Bool)

(assert (=> b!1351020 m!1238385))

(declare-fun m!1238387 () Bool)

(assert (=> b!1351020 m!1238387))

(declare-fun m!1238389 () Bool)

(assert (=> b!1351020 m!1238389))

(declare-fun m!1238391 () Bool)

(assert (=> b!1351020 m!1238391))

(declare-fun m!1238393 () Bool)

(assert (=> b!1351020 m!1238393))

(assert (=> b!1351020 m!1238367))

(declare-fun m!1238395 () Bool)

(assert (=> b!1351020 m!1238395))

(assert (=> b!1351020 m!1238285))

(declare-fun m!1238397 () Bool)

(assert (=> b!1351020 m!1238397))

(assert (=> b!1351020 m!1238375))

(assert (=> b!1351020 m!1238381))

(declare-fun m!1238399 () Bool)

(assert (=> b!1351020 m!1238399))

(assert (=> b!1351020 m!1238387))

(declare-fun m!1238401 () Bool)

(assert (=> b!1351020 m!1238401))

(assert (=> b!1351020 m!1238397))

(declare-fun m!1238403 () Bool)

(assert (=> b!1351020 m!1238403))

(declare-fun m!1238405 () Bool)

(assert (=> b!1351033 m!1238405))

(declare-fun m!1238407 () Bool)

(assert (=> b!1351026 m!1238407))

(assert (=> d!145139 m!1238279))

(declare-fun m!1238409 () Bool)

(assert (=> b!1351019 m!1238409))

(assert (=> b!1350875 d!145139))

(declare-fun d!145141 () Bool)

(assert (=> d!145141 (= (validKeyInArray!0 (select (arr!44513 _keys!1571) from!1960)) (and (not (= (select (arr!44513 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44513 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1350880 d!145141))

(declare-fun b!1351045 () Bool)

(declare-fun e!768652 () Bool)

(declare-fun call!65292 () Bool)

(assert (=> b!1351045 (= e!768652 call!65292)))

(declare-fun b!1351046 () Bool)

(declare-fun e!768650 () Bool)

(assert (=> b!1351046 (= e!768650 e!768652)))

(declare-fun lt!597172 () (_ BitVec 64))

(assert (=> b!1351046 (= lt!597172 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!597171 () Unit!44142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!92131 (_ BitVec 64) (_ BitVec 32)) Unit!44142)

(assert (=> b!1351046 (= lt!597171 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!597172 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!92131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1351046 (arrayContainsKey!0 _keys!1571 lt!597172 #b00000000000000000000000000000000)))

(declare-fun lt!597170 () Unit!44142)

(assert (=> b!1351046 (= lt!597170 lt!597171)))

(declare-fun res!895935 () Bool)

(declare-datatypes ((SeekEntryResult!10016 0))(
  ( (MissingZero!10016 (index!42435 (_ BitVec 32))) (Found!10016 (index!42436 (_ BitVec 32))) (Intermediate!10016 (undefined!10828 Bool) (index!42437 (_ BitVec 32)) (x!120757 (_ BitVec 32))) (Undefined!10016) (MissingVacant!10016 (index!42438 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!92131 (_ BitVec 32)) SeekEntryResult!10016)

(assert (=> b!1351046 (= res!895935 (= (seekEntryOrOpen!0 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10016 #b00000000000000000000000000000000)))))

(assert (=> b!1351046 (=> (not res!895935) (not e!768652))))

(declare-fun b!1351047 () Bool)

(assert (=> b!1351047 (= e!768650 call!65292)))

(declare-fun b!1351048 () Bool)

(declare-fun e!768651 () Bool)

(assert (=> b!1351048 (= e!768651 e!768650)))

(declare-fun c!127027 () Bool)

(assert (=> b!1351048 (= c!127027 (validKeyInArray!0 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun d!145143 () Bool)

(declare-fun res!895934 () Bool)

(assert (=> d!145143 (=> res!895934 e!768651)))

(assert (=> d!145143 (= res!895934 (bvsge #b00000000000000000000000000000000 (size!45064 _keys!1571)))))

(assert (=> d!145143 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!768651)))

(declare-fun bm!65289 () Bool)

(assert (=> bm!65289 (= call!65292 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(assert (= (and d!145143 (not res!895934)) b!1351048))

(assert (= (and b!1351048 c!127027) b!1351046))

(assert (= (and b!1351048 (not c!127027)) b!1351047))

(assert (= (and b!1351046 res!895935) b!1351045))

(assert (= (or b!1351045 b!1351047) bm!65289))

(assert (=> b!1351046 m!1238341))

(declare-fun m!1238411 () Bool)

(assert (=> b!1351046 m!1238411))

(declare-fun m!1238413 () Bool)

(assert (=> b!1351046 m!1238413))

(assert (=> b!1351046 m!1238341))

(declare-fun m!1238415 () Bool)

(assert (=> b!1351046 m!1238415))

(assert (=> b!1351048 m!1238341))

(assert (=> b!1351048 m!1238341))

(assert (=> b!1351048 m!1238345))

(declare-fun m!1238417 () Bool)

(assert (=> bm!65289 m!1238417))

(assert (=> b!1350874 d!145143))

(declare-fun d!145145 () Bool)

(assert (=> d!145145 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113930 d!145145))

(declare-fun d!145147 () Bool)

(assert (=> d!145147 (= (array_inv!33793 _keys!1571) (bvsge (size!45064 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113930 d!145147))

(declare-fun d!145149 () Bool)

(assert (=> d!145149 (= (array_inv!33794 _values!1303) (bvsge (size!45063 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113930 d!145149))

(declare-fun d!145151 () Bool)

(declare-fun e!768653 () Bool)

(assert (=> d!145151 e!768653))

(declare-fun res!895936 () Bool)

(assert (=> d!145151 (=> res!895936 e!768653)))

(declare-fun lt!597173 () Bool)

(assert (=> d!145151 (= res!895936 (not lt!597173))))

(declare-fun lt!597175 () Bool)

(assert (=> d!145151 (= lt!597173 lt!597175)))

(declare-fun lt!597174 () Unit!44142)

(declare-fun e!768654 () Unit!44142)

(assert (=> d!145151 (= lt!597174 e!768654)))

(declare-fun c!127028 () Bool)

(assert (=> d!145151 (= c!127028 lt!597175)))

(assert (=> d!145151 (= lt!597175 (containsKey!746 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> d!145151 (= (contains!9239 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142) lt!597173)))

(declare-fun b!1351049 () Bool)

(declare-fun lt!597176 () Unit!44142)

(assert (=> b!1351049 (= e!768654 lt!597176)))

(assert (=> b!1351049 (= lt!597176 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> b!1351049 (isDefined!529 (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun b!1351050 () Bool)

(declare-fun Unit!44146 () Unit!44142)

(assert (=> b!1351050 (= e!768654 Unit!44146)))

(declare-fun b!1351051 () Bool)

(assert (=> b!1351051 (= e!768653 (isDefined!529 (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)))))

(assert (= (and d!145151 c!127028) b!1351049))

(assert (= (and d!145151 (not c!127028)) b!1351050))

(assert (= (and d!145151 (not res!895936)) b!1351051))

(declare-fun m!1238419 () Bool)

(assert (=> d!145151 m!1238419))

(declare-fun m!1238421 () Bool)

(assert (=> b!1351049 m!1238421))

(declare-fun m!1238423 () Bool)

(assert (=> b!1351049 m!1238423))

(assert (=> b!1351049 m!1238423))

(declare-fun m!1238425 () Bool)

(assert (=> b!1351049 m!1238425))

(assert (=> b!1351051 m!1238423))

(assert (=> b!1351051 m!1238423))

(assert (=> b!1351051 m!1238425))

(assert (=> b!1350873 d!145151))

(declare-fun b!1351052 () Bool)

(declare-fun res!895942 () Bool)

(declare-fun e!768663 () Bool)

(assert (=> b!1351052 (=> (not res!895942) (not e!768663))))

(declare-fun e!768666 () Bool)

(assert (=> b!1351052 (= res!895942 e!768666)))

(declare-fun res!895939 () Bool)

(assert (=> b!1351052 (=> res!895939 e!768666)))

(declare-fun e!768658 () Bool)

(assert (=> b!1351052 (= res!895939 (not e!768658))))

(declare-fun res!895938 () Bool)

(assert (=> b!1351052 (=> (not res!895938) (not e!768658))))

(assert (=> b!1351052 (= res!895938 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)))))

(declare-fun b!1351053 () Bool)

(assert (=> b!1351053 (= e!768658 (validKeyInArray!0 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun e!768667 () Bool)

(declare-fun b!1351054 () Bool)

(declare-fun lt!597184 () ListLongMap!22057)

(assert (=> b!1351054 (= e!768667 (= (apply!1050 lt!597184 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22512 (select (arr!44512 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1351054 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45063 _values!1303)))))

(assert (=> b!1351054 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)))))

(declare-fun bm!65290 () Bool)

(declare-fun call!65293 () ListLongMap!22057)

(declare-fun call!65295 () ListLongMap!22057)

(assert (=> bm!65290 (= call!65293 call!65295)))

(declare-fun c!127030 () Bool)

(declare-fun bm!65291 () Bool)

(declare-fun call!65298 () ListLongMap!22057)

(declare-fun c!127032 () Bool)

(declare-fun call!65299 () ListLongMap!22057)

(assert (=> bm!65291 (= call!65298 (+!4896 (ite c!127032 call!65295 (ite c!127030 call!65293 call!65299)) (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1351055 () Bool)

(declare-fun e!768657 () Bool)

(assert (=> b!1351055 (= e!768657 (validKeyInArray!0 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1351056 () Bool)

(declare-fun e!768662 () Bool)

(declare-fun call!65296 () Bool)

(assert (=> b!1351056 (= e!768662 (not call!65296))))

(declare-fun bm!65292 () Bool)

(assert (=> bm!65292 (= call!65296 (contains!9239 lt!597184 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351057 () Bool)

(declare-fun e!768665 () ListLongMap!22057)

(assert (=> b!1351057 (= e!768665 (+!4896 call!65298 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1351058 () Bool)

(declare-fun e!768656 () Unit!44142)

(declare-fun lt!597198 () Unit!44142)

(assert (=> b!1351058 (= e!768656 lt!597198)))

(declare-fun lt!597189 () ListLongMap!22057)

(assert (=> b!1351058 (= lt!597189 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!597192 () (_ BitVec 64))

(assert (=> b!1351058 (= lt!597192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597180 () (_ BitVec 64))

(assert (=> b!1351058 (= lt!597180 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!597177 () Unit!44142)

(assert (=> b!1351058 (= lt!597177 (addStillContains!1218 lt!597189 lt!597192 zeroValue!1245 lt!597180))))

(assert (=> b!1351058 (contains!9239 (+!4896 lt!597189 (tuple2!24393 lt!597192 zeroValue!1245)) lt!597180)))

(declare-fun lt!597179 () Unit!44142)

(assert (=> b!1351058 (= lt!597179 lt!597177)))

(declare-fun lt!597181 () ListLongMap!22057)

(assert (=> b!1351058 (= lt!597181 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!597190 () (_ BitVec 64))

(assert (=> b!1351058 (= lt!597190 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597194 () (_ BitVec 64))

(assert (=> b!1351058 (= lt!597194 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!597196 () Unit!44142)

(assert (=> b!1351058 (= lt!597196 (addApplyDifferent!579 lt!597181 lt!597190 minValue!1245 lt!597194))))

(assert (=> b!1351058 (= (apply!1050 (+!4896 lt!597181 (tuple2!24393 lt!597190 minValue!1245)) lt!597194) (apply!1050 lt!597181 lt!597194))))

(declare-fun lt!597195 () Unit!44142)

(assert (=> b!1351058 (= lt!597195 lt!597196)))

(declare-fun lt!597191 () ListLongMap!22057)

(assert (=> b!1351058 (= lt!597191 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!597183 () (_ BitVec 64))

(assert (=> b!1351058 (= lt!597183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597185 () (_ BitVec 64))

(assert (=> b!1351058 (= lt!597185 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!597187 () Unit!44142)

(assert (=> b!1351058 (= lt!597187 (addApplyDifferent!579 lt!597191 lt!597183 zeroValue!1245 lt!597185))))

(assert (=> b!1351058 (= (apply!1050 (+!4896 lt!597191 (tuple2!24393 lt!597183 zeroValue!1245)) lt!597185) (apply!1050 lt!597191 lt!597185))))

(declare-fun lt!597182 () Unit!44142)

(assert (=> b!1351058 (= lt!597182 lt!597187)))

(declare-fun lt!597193 () ListLongMap!22057)

(assert (=> b!1351058 (= lt!597193 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!597188 () (_ BitVec 64))

(assert (=> b!1351058 (= lt!597188 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!597197 () (_ BitVec 64))

(assert (=> b!1351058 (= lt!597197 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1351058 (= lt!597198 (addApplyDifferent!579 lt!597193 lt!597188 minValue!1245 lt!597197))))

(assert (=> b!1351058 (= (apply!1050 (+!4896 lt!597193 (tuple2!24393 lt!597188 minValue!1245)) lt!597197) (apply!1050 lt!597193 lt!597197))))

(declare-fun b!1351059 () Bool)

(declare-fun c!127031 () Bool)

(assert (=> b!1351059 (= c!127031 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!768660 () ListLongMap!22057)

(declare-fun e!768661 () ListLongMap!22057)

(assert (=> b!1351059 (= e!768660 e!768661)))

(declare-fun b!1351060 () Bool)

(declare-fun e!768655 () Bool)

(declare-fun call!65297 () Bool)

(assert (=> b!1351060 (= e!768655 (not call!65297))))

(declare-fun bm!65293 () Bool)

(assert (=> bm!65293 (= call!65295 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun bm!65294 () Bool)

(declare-fun call!65294 () ListLongMap!22057)

(assert (=> bm!65294 (= call!65294 call!65298)))

(declare-fun b!1351061 () Bool)

(declare-fun Unit!44147 () Unit!44142)

(assert (=> b!1351061 (= e!768656 Unit!44147)))

(declare-fun d!145153 () Bool)

(assert (=> d!145153 e!768663))

(declare-fun res!895940 () Bool)

(assert (=> d!145153 (=> (not res!895940) (not e!768663))))

(assert (=> d!145153 (= res!895940 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)))))))

(declare-fun lt!597186 () ListLongMap!22057)

(assert (=> d!145153 (= lt!597184 lt!597186)))

(declare-fun lt!597178 () Unit!44142)

(assert (=> d!145153 (= lt!597178 e!768656)))

(declare-fun c!127034 () Bool)

(assert (=> d!145153 (= c!127034 e!768657)))

(declare-fun res!895941 () Bool)

(assert (=> d!145153 (=> (not res!895941) (not e!768657))))

(assert (=> d!145153 (= res!895941 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)))))

(assert (=> d!145153 (= lt!597186 e!768665)))

(assert (=> d!145153 (= c!127032 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!145153 (validMask!0 mask!1977)))

(assert (=> d!145153 (= (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!597184)))

(declare-fun b!1351062 () Bool)

(declare-fun e!768659 () Bool)

(assert (=> b!1351062 (= e!768655 e!768659)))

(declare-fun res!895944 () Bool)

(assert (=> b!1351062 (= res!895944 call!65297)))

(assert (=> b!1351062 (=> (not res!895944) (not e!768659))))

(declare-fun b!1351063 () Bool)

(assert (=> b!1351063 (= e!768663 e!768655)))

(declare-fun c!127033 () Bool)

(assert (=> b!1351063 (= c!127033 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1351064 () Bool)

(declare-fun e!768664 () Bool)

(assert (=> b!1351064 (= e!768664 (= (apply!1050 lt!597184 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun b!1351065 () Bool)

(declare-fun res!895937 () Bool)

(assert (=> b!1351065 (=> (not res!895937) (not e!768663))))

(assert (=> b!1351065 (= res!895937 e!768662)))

(declare-fun c!127029 () Bool)

(assert (=> b!1351065 (= c!127029 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65295 () Bool)

(assert (=> bm!65295 (= call!65297 (contains!9239 lt!597184 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351066 () Bool)

(assert (=> b!1351066 (= e!768662 e!768664)))

(declare-fun res!895945 () Bool)

(assert (=> b!1351066 (= res!895945 call!65296)))

(assert (=> b!1351066 (=> (not res!895945) (not e!768664))))

(declare-fun b!1351067 () Bool)

(assert (=> b!1351067 (= e!768666 e!768667)))

(declare-fun res!895943 () Bool)

(assert (=> b!1351067 (=> (not res!895943) (not e!768667))))

(assert (=> b!1351067 (= res!895943 (contains!9239 lt!597184 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1351067 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)))))

(declare-fun b!1351068 () Bool)

(assert (=> b!1351068 (= e!768665 e!768660)))

(assert (=> b!1351068 (= c!127030 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1351069 () Bool)

(assert (=> b!1351069 (= e!768660 call!65294)))

(declare-fun b!1351070 () Bool)

(assert (=> b!1351070 (= e!768661 call!65299)))

(declare-fun bm!65296 () Bool)

(assert (=> bm!65296 (= call!65299 call!65293)))

(declare-fun b!1351071 () Bool)

(assert (=> b!1351071 (= e!768659 (= (apply!1050 lt!597184 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1351072 () Bool)

(assert (=> b!1351072 (= e!768661 call!65294)))

(assert (= (and d!145153 c!127032) b!1351057))

(assert (= (and d!145153 (not c!127032)) b!1351068))

(assert (= (and b!1351068 c!127030) b!1351069))

(assert (= (and b!1351068 (not c!127030)) b!1351059))

(assert (= (and b!1351059 c!127031) b!1351072))

(assert (= (and b!1351059 (not c!127031)) b!1351070))

(assert (= (or b!1351072 b!1351070) bm!65296))

(assert (= (or b!1351069 bm!65296) bm!65290))

(assert (= (or b!1351069 b!1351072) bm!65294))

(assert (= (or b!1351057 bm!65290) bm!65293))

(assert (= (or b!1351057 bm!65294) bm!65291))

(assert (= (and d!145153 res!895941) b!1351055))

(assert (= (and d!145153 c!127034) b!1351058))

(assert (= (and d!145153 (not c!127034)) b!1351061))

(assert (= (and d!145153 res!895940) b!1351052))

(assert (= (and b!1351052 res!895938) b!1351053))

(assert (= (and b!1351052 (not res!895939)) b!1351067))

(assert (= (and b!1351067 res!895943) b!1351054))

(assert (= (and b!1351052 res!895942) b!1351065))

(assert (= (and b!1351065 c!127029) b!1351066))

(assert (= (and b!1351065 (not c!127029)) b!1351056))

(assert (= (and b!1351066 res!895945) b!1351064))

(assert (= (or b!1351066 b!1351056) bm!65292))

(assert (= (and b!1351065 res!895937) b!1351063))

(assert (= (and b!1351063 c!127033) b!1351062))

(assert (= (and b!1351063 (not c!127033)) b!1351060))

(assert (= (and b!1351062 res!895944) b!1351071))

(assert (= (or b!1351062 b!1351060) bm!65295))

(declare-fun b_lambda!24715 () Bool)

(assert (=> (not b_lambda!24715) (not b!1351054)))

(assert (=> b!1351054 t!46180))

(declare-fun b_and!50999 () Bool)

(assert (= b_and!50997 (and (=> t!46180 result!26013) b_and!50999)))

(declare-fun m!1238427 () Bool)

(assert (=> b!1351054 m!1238427))

(assert (=> b!1351054 m!1238359))

(declare-fun m!1238429 () Bool)

(assert (=> b!1351054 m!1238429))

(declare-fun m!1238431 () Bool)

(assert (=> b!1351054 m!1238431))

(declare-fun m!1238433 () Bool)

(assert (=> b!1351054 m!1238433))

(assert (=> b!1351054 m!1238359))

(assert (=> b!1351054 m!1238427))

(assert (=> b!1351054 m!1238431))

(declare-fun m!1238435 () Bool)

(assert (=> bm!65292 m!1238435))

(declare-fun m!1238437 () Bool)

(assert (=> bm!65293 m!1238437))

(declare-fun m!1238439 () Bool)

(assert (=> bm!65291 m!1238439))

(assert (=> b!1351067 m!1238431))

(assert (=> b!1351067 m!1238431))

(declare-fun m!1238441 () Bool)

(assert (=> b!1351067 m!1238441))

(assert (=> b!1351053 m!1238431))

(assert (=> b!1351053 m!1238431))

(declare-fun m!1238443 () Bool)

(assert (=> b!1351053 m!1238443))

(declare-fun m!1238445 () Bool)

(assert (=> bm!65295 m!1238445))

(assert (=> b!1351055 m!1238431))

(assert (=> b!1351055 m!1238431))

(assert (=> b!1351055 m!1238443))

(declare-fun m!1238447 () Bool)

(assert (=> b!1351058 m!1238447))

(declare-fun m!1238449 () Bool)

(assert (=> b!1351058 m!1238449))

(declare-fun m!1238451 () Bool)

(assert (=> b!1351058 m!1238451))

(declare-fun m!1238453 () Bool)

(assert (=> b!1351058 m!1238453))

(declare-fun m!1238455 () Bool)

(assert (=> b!1351058 m!1238455))

(declare-fun m!1238457 () Bool)

(assert (=> b!1351058 m!1238457))

(declare-fun m!1238459 () Bool)

(assert (=> b!1351058 m!1238459))

(declare-fun m!1238461 () Bool)

(assert (=> b!1351058 m!1238461))

(declare-fun m!1238463 () Bool)

(assert (=> b!1351058 m!1238463))

(declare-fun m!1238465 () Bool)

(assert (=> b!1351058 m!1238465))

(assert (=> b!1351058 m!1238437))

(declare-fun m!1238467 () Bool)

(assert (=> b!1351058 m!1238467))

(assert (=> b!1351058 m!1238431))

(declare-fun m!1238469 () Bool)

(assert (=> b!1351058 m!1238469))

(assert (=> b!1351058 m!1238447))

(assert (=> b!1351058 m!1238453))

(declare-fun m!1238471 () Bool)

(assert (=> b!1351058 m!1238471))

(assert (=> b!1351058 m!1238459))

(declare-fun m!1238473 () Bool)

(assert (=> b!1351058 m!1238473))

(assert (=> b!1351058 m!1238469))

(declare-fun m!1238475 () Bool)

(assert (=> b!1351058 m!1238475))

(declare-fun m!1238477 () Bool)

(assert (=> b!1351071 m!1238477))

(declare-fun m!1238479 () Bool)

(assert (=> b!1351064 m!1238479))

(assert (=> d!145153 m!1238279))

(declare-fun m!1238481 () Bool)

(assert (=> b!1351057 m!1238481))

(assert (=> b!1350873 d!145153))

(declare-fun mapIsEmpty!58116 () Bool)

(declare-fun mapRes!58116 () Bool)

(assert (=> mapIsEmpty!58116 mapRes!58116))

(declare-fun b!1351079 () Bool)

(declare-fun e!768673 () Bool)

(assert (=> b!1351079 (= e!768673 tp_is_empty!37591)))

(declare-fun mapNonEmpty!58116 () Bool)

(declare-fun tp!110607 () Bool)

(assert (=> mapNonEmpty!58116 (= mapRes!58116 (and tp!110607 e!768673))))

(declare-fun mapRest!58116 () (Array (_ BitVec 32) ValueCell!17897))

(declare-fun mapValue!58116 () ValueCell!17897)

(declare-fun mapKey!58116 () (_ BitVec 32))

(assert (=> mapNonEmpty!58116 (= mapRest!58107 (store mapRest!58116 mapKey!58116 mapValue!58116))))

(declare-fun condMapEmpty!58116 () Bool)

(declare-fun mapDefault!58116 () ValueCell!17897)

(assert (=> mapNonEmpty!58107 (= condMapEmpty!58116 (= mapRest!58107 ((as const (Array (_ BitVec 32) ValueCell!17897)) mapDefault!58116)))))

(declare-fun e!768672 () Bool)

(assert (=> mapNonEmpty!58107 (= tp!110592 (and e!768672 mapRes!58116))))

(declare-fun b!1351080 () Bool)

(assert (=> b!1351080 (= e!768672 tp_is_empty!37591)))

(assert (= (and mapNonEmpty!58107 condMapEmpty!58116) mapIsEmpty!58116))

(assert (= (and mapNonEmpty!58107 (not condMapEmpty!58116)) mapNonEmpty!58116))

(assert (= (and mapNonEmpty!58116 ((_ is ValueCellFull!17897) mapValue!58116)) b!1351079))

(assert (= (and mapNonEmpty!58107 ((_ is ValueCellFull!17897) mapDefault!58116)) b!1351080))

(declare-fun m!1238483 () Bool)

(assert (=> mapNonEmpty!58116 m!1238483))

(declare-fun b_lambda!24717 () Bool)

(assert (= b_lambda!24713 (or (and start!113930 b_free!31591) b_lambda!24717)))

(declare-fun b_lambda!24719 () Bool)

(assert (= b_lambda!24715 (or (and start!113930 b_free!31591) b_lambda!24719)))

(check-sat (not bm!65295) (not b!1351020) (not b!1351026) (not bm!65283) (not b!1351055) (not b_next!31591) (not bm!65292) (not bm!65265) (not b!1350969) (not b!1351017) (not mapNonEmpty!58116) (not b!1351046) (not b!1351051) (not b!1351057) (not d!145139) (not b!1351071) (not b!1350960) (not b!1350971) (not d!145137) (not b!1351049) (not b!1351064) (not b!1351029) (not bm!65285) tp_is_empty!37591 (not bm!65293) (not b!1351067) (not d!145153) (not b!1351033) (not b!1351019) (not d!145151) b_and!50999 (not b!1351058) (not b_lambda!24719) (not bm!65281) (not b!1350958) (not bm!65282) (not bm!65289) (not b!1350962) (not bm!65291) (not b!1351048) (not b!1351053) (not b!1351054) (not b!1351016) (not b!1351015) (not b_lambda!24717))
(check-sat b_and!50999 (not b_next!31591))
(get-model)

(declare-fun d!145155 () Bool)

(declare-fun get!22513 (Option!771) V!55225)

(assert (=> d!145155 (= (apply!1050 lt!597184 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22513 (getValueByKey!720 (toList!11044 lt!597184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38702 () Bool)

(assert (= bs!38702 d!145155))

(declare-fun m!1238485 () Bool)

(assert (=> bs!38702 m!1238485))

(assert (=> bs!38702 m!1238485))

(declare-fun m!1238487 () Bool)

(assert (=> bs!38702 m!1238487))

(assert (=> b!1351071 d!145155))

(declare-fun d!145157 () Bool)

(declare-fun e!768674 () Bool)

(assert (=> d!145157 e!768674))

(declare-fun res!895946 () Bool)

(assert (=> d!145157 (=> res!895946 e!768674)))

(declare-fun lt!597199 () Bool)

(assert (=> d!145157 (= res!895946 (not lt!597199))))

(declare-fun lt!597201 () Bool)

(assert (=> d!145157 (= lt!597199 lt!597201)))

(declare-fun lt!597200 () Unit!44142)

(declare-fun e!768675 () Unit!44142)

(assert (=> d!145157 (= lt!597200 e!768675)))

(declare-fun c!127035 () Bool)

(assert (=> d!145157 (= c!127035 lt!597201)))

(assert (=> d!145157 (= lt!597201 (containsKey!746 (toList!11044 lt!597149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!145157 (= (contains!9239 lt!597149 #b0000000000000000000000000000000000000000000000000000000000000000) lt!597199)))

(declare-fun b!1351081 () Bool)

(declare-fun lt!597202 () Unit!44142)

(assert (=> b!1351081 (= e!768675 lt!597202)))

(assert (=> b!1351081 (= lt!597202 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 lt!597149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1351081 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351082 () Bool)

(declare-fun Unit!44148 () Unit!44142)

(assert (=> b!1351082 (= e!768675 Unit!44148)))

(declare-fun b!1351083 () Bool)

(assert (=> b!1351083 (= e!768674 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145157 c!127035) b!1351081))

(assert (= (and d!145157 (not c!127035)) b!1351082))

(assert (= (and d!145157 (not res!895946)) b!1351083))

(declare-fun m!1238489 () Bool)

(assert (=> d!145157 m!1238489))

(declare-fun m!1238491 () Bool)

(assert (=> b!1351081 m!1238491))

(declare-fun m!1238493 () Bool)

(assert (=> b!1351081 m!1238493))

(assert (=> b!1351081 m!1238493))

(declare-fun m!1238495 () Bool)

(assert (=> b!1351081 m!1238495))

(assert (=> b!1351083 m!1238493))

(assert (=> b!1351083 m!1238493))

(assert (=> b!1351083 m!1238495))

(assert (=> bm!65282 d!145157))

(declare-fun d!145159 () Bool)

(assert (=> d!145159 (= (validKeyInArray!0 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (and (not (= (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1351055 d!145159))

(declare-fun d!145161 () Bool)

(assert (=> d!145161 (isDefined!529 (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun lt!597205 () Unit!44142)

(declare-fun choose!1987 (List!31527 (_ BitVec 64)) Unit!44142)

(assert (=> d!145161 (= lt!597205 (choose!1987 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun e!768678 () Bool)

(assert (=> d!145161 e!768678))

(declare-fun res!895949 () Bool)

(assert (=> d!145161 (=> (not res!895949) (not e!768678))))

(declare-fun isStrictlySorted!872 (List!31527) Bool)

(assert (=> d!145161 (= res!895949 (isStrictlySorted!872 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))

(assert (=> d!145161 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) lt!597205)))

(declare-fun b!1351086 () Bool)

(assert (=> b!1351086 (= e!768678 (containsKey!746 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (= (and d!145161 res!895949) b!1351086))

(assert (=> d!145161 m!1238353))

(assert (=> d!145161 m!1238353))

(assert (=> d!145161 m!1238355))

(declare-fun m!1238497 () Bool)

(assert (=> d!145161 m!1238497))

(declare-fun m!1238499 () Bool)

(assert (=> d!145161 m!1238499))

(assert (=> b!1351086 m!1238349))

(assert (=> b!1350969 d!145161))

(declare-fun d!145163 () Bool)

(declare-fun isEmpty!1103 (Option!771) Bool)

(assert (=> d!145163 (= (isDefined!529 (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)) (not (isEmpty!1103 (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38703 () Bool)

(assert (= bs!38703 d!145163))

(assert (=> bs!38703 m!1238353))

(declare-fun m!1238501 () Bool)

(assert (=> bs!38703 m!1238501))

(assert (=> b!1350969 d!145163))

(declare-fun b!1351096 () Bool)

(declare-fun e!768683 () Option!771)

(declare-fun e!768684 () Option!771)

(assert (=> b!1351096 (= e!768683 e!768684)))

(declare-fun c!127041 () Bool)

(assert (=> b!1351096 (= c!127041 (and ((_ is Cons!31523) (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (not (= (_1!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142))))))

(declare-fun c!127040 () Bool)

(declare-fun d!145165 () Bool)

(assert (=> d!145165 (= c!127040 (and ((_ is Cons!31523) (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!145165 (= (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!768683)))

(declare-fun b!1351098 () Bool)

(assert (=> b!1351098 (= e!768684 None!769)))

(declare-fun b!1351095 () Bool)

(assert (=> b!1351095 (= e!768683 (Some!770 (_2!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))))

(declare-fun b!1351097 () Bool)

(assert (=> b!1351097 (= e!768684 (getValueByKey!720 (t!46175 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!145165 c!127040) b!1351095))

(assert (= (and d!145165 (not c!127040)) b!1351096))

(assert (= (and b!1351096 c!127041) b!1351097))

(assert (= (and b!1351096 (not c!127041)) b!1351098))

(declare-fun m!1238503 () Bool)

(assert (=> b!1351097 m!1238503))

(assert (=> b!1350969 d!145165))

(declare-fun d!145167 () Bool)

(declare-fun e!768687 () Bool)

(assert (=> d!145167 e!768687))

(declare-fun res!895954 () Bool)

(assert (=> d!145167 (=> (not res!895954) (not e!768687))))

(declare-fun lt!597215 () ListLongMap!22057)

(assert (=> d!145167 (= res!895954 (contains!9239 lt!597215 (_1!12207 (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!597216 () List!31527)

(assert (=> d!145167 (= lt!597215 (ListLongMap!22058 lt!597216))))

(declare-fun lt!597214 () Unit!44142)

(declare-fun lt!597217 () Unit!44142)

(assert (=> d!145167 (= lt!597214 lt!597217)))

(assert (=> d!145167 (= (getValueByKey!720 lt!597216 (_1!12207 (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!770 (_2!12207 (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!370 (List!31527 (_ BitVec 64) V!55225) Unit!44142)

(assert (=> d!145167 (= lt!597217 (lemmaContainsTupThenGetReturnValue!370 lt!597216 (_1!12207 (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12207 (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun insertStrictlySorted!499 (List!31527 (_ BitVec 64) V!55225) List!31527)

(assert (=> d!145167 (= lt!597216 (insertStrictlySorted!499 (toList!11044 (ite c!127032 call!65295 (ite c!127030 call!65293 call!65299))) (_1!12207 (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12207 (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!145167 (= (+!4896 (ite c!127032 call!65295 (ite c!127030 call!65293 call!65299)) (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!597215)))

(declare-fun b!1351103 () Bool)

(declare-fun res!895955 () Bool)

(assert (=> b!1351103 (=> (not res!895955) (not e!768687))))

(assert (=> b!1351103 (= res!895955 (= (getValueByKey!720 (toList!11044 lt!597215) (_1!12207 (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!770 (_2!12207 (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1351104 () Bool)

(declare-fun contains!9242 (List!31527 tuple2!24392) Bool)

(assert (=> b!1351104 (= e!768687 (contains!9242 (toList!11044 lt!597215) (ite (or c!127032 c!127030) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!145167 res!895954) b!1351103))

(assert (= (and b!1351103 res!895955) b!1351104))

(declare-fun m!1238505 () Bool)

(assert (=> d!145167 m!1238505))

(declare-fun m!1238507 () Bool)

(assert (=> d!145167 m!1238507))

(declare-fun m!1238509 () Bool)

(assert (=> d!145167 m!1238509))

(declare-fun m!1238511 () Bool)

(assert (=> d!145167 m!1238511))

(declare-fun m!1238513 () Bool)

(assert (=> b!1351103 m!1238513))

(declare-fun m!1238515 () Bool)

(assert (=> b!1351104 m!1238515))

(assert (=> bm!65291 d!145167))

(declare-fun d!145169 () Bool)

(declare-fun e!768688 () Bool)

(assert (=> d!145169 e!768688))

(declare-fun res!895956 () Bool)

(assert (=> d!145169 (=> (not res!895956) (not e!768688))))

(declare-fun lt!597219 () ListLongMap!22057)

(assert (=> d!145169 (= res!895956 (contains!9239 lt!597219 (_1!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!597220 () List!31527)

(assert (=> d!145169 (= lt!597219 (ListLongMap!22058 lt!597220))))

(declare-fun lt!597218 () Unit!44142)

(declare-fun lt!597221 () Unit!44142)

(assert (=> d!145169 (= lt!597218 lt!597221)))

(assert (=> d!145169 (= (getValueByKey!720 lt!597220 (_1!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!145169 (= lt!597221 (lemmaContainsTupThenGetReturnValue!370 lt!597220 (_1!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!145169 (= lt!597220 (insertStrictlySorted!499 (toList!11044 call!65298) (_1!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!145169 (= (+!4896 call!65298 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!597219)))

(declare-fun b!1351105 () Bool)

(declare-fun res!895957 () Bool)

(assert (=> b!1351105 (=> (not res!895957) (not e!768688))))

(assert (=> b!1351105 (= res!895957 (= (getValueByKey!720 (toList!11044 lt!597219) (_1!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1351106 () Bool)

(assert (=> b!1351106 (= e!768688 (contains!9242 (toList!11044 lt!597219) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!145169 res!895956) b!1351105))

(assert (= (and b!1351105 res!895957) b!1351106))

(declare-fun m!1238517 () Bool)

(assert (=> d!145169 m!1238517))

(declare-fun m!1238519 () Bool)

(assert (=> d!145169 m!1238519))

(declare-fun m!1238521 () Bool)

(assert (=> d!145169 m!1238521))

(declare-fun m!1238523 () Bool)

(assert (=> d!145169 m!1238523))

(declare-fun m!1238525 () Bool)

(assert (=> b!1351105 m!1238525))

(declare-fun m!1238527 () Bool)

(assert (=> b!1351106 m!1238527))

(assert (=> b!1351057 d!145169))

(declare-fun d!145171 () Bool)

(declare-fun e!768689 () Bool)

(assert (=> d!145171 e!768689))

(declare-fun res!895958 () Bool)

(assert (=> d!145171 (=> (not res!895958) (not e!768689))))

(declare-fun lt!597223 () ListLongMap!22057)

(assert (=> d!145171 (= res!895958 (contains!9239 lt!597223 (_1!12207 (tuple2!24393 lt!597153 minValue!1245))))))

(declare-fun lt!597224 () List!31527)

(assert (=> d!145171 (= lt!597223 (ListLongMap!22058 lt!597224))))

(declare-fun lt!597222 () Unit!44142)

(declare-fun lt!597225 () Unit!44142)

(assert (=> d!145171 (= lt!597222 lt!597225)))

(assert (=> d!145171 (= (getValueByKey!720 lt!597224 (_1!12207 (tuple2!24393 lt!597153 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597153 minValue!1245))))))

(assert (=> d!145171 (= lt!597225 (lemmaContainsTupThenGetReturnValue!370 lt!597224 (_1!12207 (tuple2!24393 lt!597153 minValue!1245)) (_2!12207 (tuple2!24393 lt!597153 minValue!1245))))))

(assert (=> d!145171 (= lt!597224 (insertStrictlySorted!499 (toList!11044 lt!597158) (_1!12207 (tuple2!24393 lt!597153 minValue!1245)) (_2!12207 (tuple2!24393 lt!597153 minValue!1245))))))

(assert (=> d!145171 (= (+!4896 lt!597158 (tuple2!24393 lt!597153 minValue!1245)) lt!597223)))

(declare-fun b!1351107 () Bool)

(declare-fun res!895959 () Bool)

(assert (=> b!1351107 (=> (not res!895959) (not e!768689))))

(assert (=> b!1351107 (= res!895959 (= (getValueByKey!720 (toList!11044 lt!597223) (_1!12207 (tuple2!24393 lt!597153 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597153 minValue!1245)))))))

(declare-fun b!1351108 () Bool)

(assert (=> b!1351108 (= e!768689 (contains!9242 (toList!11044 lt!597223) (tuple2!24393 lt!597153 minValue!1245)))))

(assert (= (and d!145171 res!895958) b!1351107))

(assert (= (and b!1351107 res!895959) b!1351108))

(declare-fun m!1238529 () Bool)

(assert (=> d!145171 m!1238529))

(declare-fun m!1238531 () Bool)

(assert (=> d!145171 m!1238531))

(declare-fun m!1238533 () Bool)

(assert (=> d!145171 m!1238533))

(declare-fun m!1238535 () Bool)

(assert (=> d!145171 m!1238535))

(declare-fun m!1238537 () Bool)

(assert (=> b!1351107 m!1238537))

(declare-fun m!1238539 () Bool)

(assert (=> b!1351108 m!1238539))

(assert (=> b!1351020 d!145171))

(declare-fun d!145173 () Bool)

(assert (=> d!145173 (= (apply!1050 (+!4896 lt!597158 (tuple2!24393 lt!597153 minValue!1245)) lt!597162) (get!22513 (getValueByKey!720 (toList!11044 (+!4896 lt!597158 (tuple2!24393 lt!597153 minValue!1245))) lt!597162)))))

(declare-fun bs!38704 () Bool)

(assert (= bs!38704 d!145173))

(declare-fun m!1238541 () Bool)

(assert (=> bs!38704 m!1238541))

(assert (=> bs!38704 m!1238541))

(declare-fun m!1238543 () Bool)

(assert (=> bs!38704 m!1238543))

(assert (=> b!1351020 d!145173))

(declare-fun d!145175 () Bool)

(assert (=> d!145175 (= (apply!1050 lt!597156 lt!597150) (get!22513 (getValueByKey!720 (toList!11044 lt!597156) lt!597150)))))

(declare-fun bs!38705 () Bool)

(assert (= bs!38705 d!145175))

(declare-fun m!1238545 () Bool)

(assert (=> bs!38705 m!1238545))

(assert (=> bs!38705 m!1238545))

(declare-fun m!1238547 () Bool)

(assert (=> bs!38705 m!1238547))

(assert (=> b!1351020 d!145175))

(declare-fun d!145177 () Bool)

(assert (=> d!145177 (= (apply!1050 (+!4896 lt!597146 (tuple2!24393 lt!597155 minValue!1245)) lt!597159) (get!22513 (getValueByKey!720 (toList!11044 (+!4896 lt!597146 (tuple2!24393 lt!597155 minValue!1245))) lt!597159)))))

(declare-fun bs!38706 () Bool)

(assert (= bs!38706 d!145177))

(declare-fun m!1238549 () Bool)

(assert (=> bs!38706 m!1238549))

(assert (=> bs!38706 m!1238549))

(declare-fun m!1238551 () Bool)

(assert (=> bs!38706 m!1238551))

(assert (=> b!1351020 d!145177))

(declare-fun d!145179 () Bool)

(assert (=> d!145179 (= (apply!1050 (+!4896 lt!597146 (tuple2!24393 lt!597155 minValue!1245)) lt!597159) (apply!1050 lt!597146 lt!597159))))

(declare-fun lt!597228 () Unit!44142)

(declare-fun choose!1988 (ListLongMap!22057 (_ BitVec 64) V!55225 (_ BitVec 64)) Unit!44142)

(assert (=> d!145179 (= lt!597228 (choose!1988 lt!597146 lt!597155 minValue!1245 lt!597159))))

(declare-fun e!768692 () Bool)

(assert (=> d!145179 e!768692))

(declare-fun res!895962 () Bool)

(assert (=> d!145179 (=> (not res!895962) (not e!768692))))

(assert (=> d!145179 (= res!895962 (contains!9239 lt!597146 lt!597159))))

(assert (=> d!145179 (= (addApplyDifferent!579 lt!597146 lt!597155 minValue!1245 lt!597159) lt!597228)))

(declare-fun b!1351112 () Bool)

(assert (=> b!1351112 (= e!768692 (not (= lt!597159 lt!597155)))))

(assert (= (and d!145179 res!895962) b!1351112))

(assert (=> d!145179 m!1238381))

(assert (=> d!145179 m!1238383))

(declare-fun m!1238553 () Bool)

(assert (=> d!145179 m!1238553))

(assert (=> d!145179 m!1238379))

(declare-fun m!1238555 () Bool)

(assert (=> d!145179 m!1238555))

(assert (=> d!145179 m!1238381))

(assert (=> b!1351020 d!145179))

(declare-fun d!145181 () Bool)

(assert (=> d!145181 (= (apply!1050 lt!597146 lt!597159) (get!22513 (getValueByKey!720 (toList!11044 lt!597146) lt!597159)))))

(declare-fun bs!38707 () Bool)

(assert (= bs!38707 d!145181))

(declare-fun m!1238557 () Bool)

(assert (=> bs!38707 m!1238557))

(assert (=> bs!38707 m!1238557))

(declare-fun m!1238559 () Bool)

(assert (=> bs!38707 m!1238559))

(assert (=> b!1351020 d!145181))

(declare-fun d!145183 () Bool)

(assert (=> d!145183 (= (apply!1050 lt!597158 lt!597162) (get!22513 (getValueByKey!720 (toList!11044 lt!597158) lt!597162)))))

(declare-fun bs!38708 () Bool)

(assert (= bs!38708 d!145183))

(declare-fun m!1238561 () Bool)

(assert (=> bs!38708 m!1238561))

(assert (=> bs!38708 m!1238561))

(declare-fun m!1238563 () Bool)

(assert (=> bs!38708 m!1238563))

(assert (=> b!1351020 d!145183))

(declare-fun d!145185 () Bool)

(assert (=> d!145185 (= (apply!1050 (+!4896 lt!597156 (tuple2!24393 lt!597148 zeroValue!1245)) lt!597150) (get!22513 (getValueByKey!720 (toList!11044 (+!4896 lt!597156 (tuple2!24393 lt!597148 zeroValue!1245))) lt!597150)))))

(declare-fun bs!38709 () Bool)

(assert (= bs!38709 d!145185))

(declare-fun m!1238565 () Bool)

(assert (=> bs!38709 m!1238565))

(assert (=> bs!38709 m!1238565))

(declare-fun m!1238567 () Bool)

(assert (=> bs!38709 m!1238567))

(assert (=> b!1351020 d!145185))

(declare-fun b!1351137 () Bool)

(declare-fun lt!597246 () ListLongMap!22057)

(declare-fun e!768713 () Bool)

(assert (=> b!1351137 (= e!768713 (= lt!597246 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1351138 () Bool)

(declare-fun e!768709 () ListLongMap!22057)

(assert (=> b!1351138 (= e!768709 (ListLongMap!22058 Nil!31524))))

(declare-fun b!1351139 () Bool)

(declare-fun e!768712 () ListLongMap!22057)

(declare-fun call!65302 () ListLongMap!22057)

(assert (=> b!1351139 (= e!768712 call!65302)))

(declare-fun b!1351140 () Bool)

(declare-fun e!768708 () Bool)

(assert (=> b!1351140 (= e!768708 e!768713)))

(declare-fun c!127050 () Bool)

(assert (=> b!1351140 (= c!127050 (bvslt from!1960 (size!45064 _keys!1571)))))

(declare-fun b!1351141 () Bool)

(declare-fun lt!597243 () Unit!44142)

(declare-fun lt!597245 () Unit!44142)

(assert (=> b!1351141 (= lt!597243 lt!597245)))

(declare-fun lt!597244 () ListLongMap!22057)

(declare-fun lt!597249 () (_ BitVec 64))

(declare-fun lt!597247 () V!55225)

(declare-fun lt!597248 () (_ BitVec 64))

(assert (=> b!1351141 (not (contains!9239 (+!4896 lt!597244 (tuple2!24393 lt!597248 lt!597247)) lt!597249))))

(declare-fun addStillNotContains!506 (ListLongMap!22057 (_ BitVec 64) V!55225 (_ BitVec 64)) Unit!44142)

(assert (=> b!1351141 (= lt!597245 (addStillNotContains!506 lt!597244 lt!597248 lt!597247 lt!597249))))

(assert (=> b!1351141 (= lt!597249 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1351141 (= lt!597247 (get!22512 (select (arr!44512 _values!1303) from!1960) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1351141 (= lt!597248 (select (arr!44513 _keys!1571) from!1960))))

(assert (=> b!1351141 (= lt!597244 call!65302)))

(assert (=> b!1351141 (= e!768712 (+!4896 call!65302 (tuple2!24393 (select (arr!44513 _keys!1571) from!1960) (get!22512 (select (arr!44512 _values!1303) from!1960) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1351142 () Bool)

(declare-fun isEmpty!1104 (ListLongMap!22057) Bool)

(assert (=> b!1351142 (= e!768713 (isEmpty!1104 lt!597246))))

(declare-fun d!145187 () Bool)

(declare-fun e!768711 () Bool)

(assert (=> d!145187 e!768711))

(declare-fun res!895971 () Bool)

(assert (=> d!145187 (=> (not res!895971) (not e!768711))))

(assert (=> d!145187 (= res!895971 (not (contains!9239 lt!597246 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!145187 (= lt!597246 e!768709)))

(declare-fun c!127051 () Bool)

(assert (=> d!145187 (= c!127051 (bvsge from!1960 (size!45064 _keys!1571)))))

(assert (=> d!145187 (validMask!0 mask!1977)))

(assert (=> d!145187 (= (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!597246)))

(declare-fun b!1351143 () Bool)

(declare-fun e!768710 () Bool)

(assert (=> b!1351143 (= e!768710 (validKeyInArray!0 (select (arr!44513 _keys!1571) from!1960)))))

(assert (=> b!1351143 (bvsge from!1960 #b00000000000000000000000000000000)))

(declare-fun b!1351144 () Bool)

(assert (=> b!1351144 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45064 _keys!1571)))))

(assert (=> b!1351144 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45063 _values!1303)))))

(declare-fun e!768707 () Bool)

(assert (=> b!1351144 (= e!768707 (= (apply!1050 lt!597246 (select (arr!44513 _keys!1571) from!1960)) (get!22512 (select (arr!44512 _values!1303) from!1960) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1351145 () Bool)

(assert (=> b!1351145 (= e!768709 e!768712)))

(declare-fun c!127053 () Bool)

(assert (=> b!1351145 (= c!127053 (validKeyInArray!0 (select (arr!44513 _keys!1571) from!1960)))))

(declare-fun b!1351146 () Bool)

(declare-fun res!895973 () Bool)

(assert (=> b!1351146 (=> (not res!895973) (not e!768711))))

(assert (=> b!1351146 (= res!895973 (not (contains!9239 lt!597246 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!65299 () Bool)

(assert (=> bm!65299 (= call!65302 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1351147 () Bool)

(assert (=> b!1351147 (= e!768711 e!768708)))

(declare-fun c!127052 () Bool)

(assert (=> b!1351147 (= c!127052 e!768710)))

(declare-fun res!895972 () Bool)

(assert (=> b!1351147 (=> (not res!895972) (not e!768710))))

(assert (=> b!1351147 (= res!895972 (bvslt from!1960 (size!45064 _keys!1571)))))

(declare-fun b!1351148 () Bool)

(assert (=> b!1351148 (= e!768708 e!768707)))

(assert (=> b!1351148 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45064 _keys!1571)))))

(declare-fun res!895974 () Bool)

(assert (=> b!1351148 (= res!895974 (contains!9239 lt!597246 (select (arr!44513 _keys!1571) from!1960)))))

(assert (=> b!1351148 (=> (not res!895974) (not e!768707))))

(assert (= (and d!145187 c!127051) b!1351138))

(assert (= (and d!145187 (not c!127051)) b!1351145))

(assert (= (and b!1351145 c!127053) b!1351141))

(assert (= (and b!1351145 (not c!127053)) b!1351139))

(assert (= (or b!1351141 b!1351139) bm!65299))

(assert (= (and d!145187 res!895971) b!1351146))

(assert (= (and b!1351146 res!895973) b!1351147))

(assert (= (and b!1351147 res!895972) b!1351143))

(assert (= (and b!1351147 c!127052) b!1351148))

(assert (= (and b!1351147 (not c!127052)) b!1351140))

(assert (= (and b!1351148 res!895974) b!1351144))

(assert (= (and b!1351140 c!127050) b!1351137))

(assert (= (and b!1351140 (not c!127050)) b!1351142))

(declare-fun b_lambda!24721 () Bool)

(assert (=> (not b_lambda!24721) (not b!1351141)))

(assert (=> b!1351141 t!46180))

(declare-fun b_and!51001 () Bool)

(assert (= b_and!50999 (and (=> t!46180 result!26013) b_and!51001)))

(declare-fun b_lambda!24723 () Bool)

(assert (=> (not b_lambda!24723) (not b!1351144)))

(assert (=> b!1351144 t!46180))

(declare-fun b_and!51003 () Bool)

(assert (= b_and!51001 (and (=> t!46180 result!26013) b_and!51003)))

(declare-fun m!1238569 () Bool)

(assert (=> b!1351142 m!1238569))

(assert (=> b!1351145 m!1238285))

(assert (=> b!1351145 m!1238285))

(assert (=> b!1351145 m!1238287))

(declare-fun m!1238571 () Bool)

(assert (=> d!145187 m!1238571))

(assert (=> d!145187 m!1238279))

(declare-fun m!1238573 () Bool)

(assert (=> b!1351137 m!1238573))

(declare-fun m!1238575 () Bool)

(assert (=> b!1351141 m!1238575))

(assert (=> b!1351141 m!1238357))

(assert (=> b!1351141 m!1238359))

(assert (=> b!1351141 m!1238361))

(assert (=> b!1351141 m!1238359))

(declare-fun m!1238577 () Bool)

(assert (=> b!1351141 m!1238577))

(assert (=> b!1351141 m!1238357))

(assert (=> b!1351141 m!1238285))

(declare-fun m!1238579 () Bool)

(assert (=> b!1351141 m!1238579))

(assert (=> b!1351141 m!1238575))

(declare-fun m!1238581 () Bool)

(assert (=> b!1351141 m!1238581))

(declare-fun m!1238583 () Bool)

(assert (=> b!1351146 m!1238583))

(assert (=> bm!65299 m!1238573))

(assert (=> b!1351144 m!1238357))

(assert (=> b!1351144 m!1238359))

(assert (=> b!1351144 m!1238361))

(assert (=> b!1351144 m!1238359))

(assert (=> b!1351144 m!1238285))

(assert (=> b!1351144 m!1238357))

(assert (=> b!1351144 m!1238285))

(declare-fun m!1238585 () Bool)

(assert (=> b!1351144 m!1238585))

(assert (=> b!1351143 m!1238285))

(assert (=> b!1351143 m!1238285))

(assert (=> b!1351143 m!1238287))

(assert (=> b!1351148 m!1238285))

(assert (=> b!1351148 m!1238285))

(declare-fun m!1238587 () Bool)

(assert (=> b!1351148 m!1238587))

(assert (=> b!1351020 d!145187))

(declare-fun d!145189 () Bool)

(declare-fun e!768714 () Bool)

(assert (=> d!145189 e!768714))

(declare-fun res!895975 () Bool)

(assert (=> d!145189 (=> (not res!895975) (not e!768714))))

(declare-fun lt!597251 () ListLongMap!22057)

(assert (=> d!145189 (= res!895975 (contains!9239 lt!597251 (_1!12207 (tuple2!24393 lt!597155 minValue!1245))))))

(declare-fun lt!597252 () List!31527)

(assert (=> d!145189 (= lt!597251 (ListLongMap!22058 lt!597252))))

(declare-fun lt!597250 () Unit!44142)

(declare-fun lt!597253 () Unit!44142)

(assert (=> d!145189 (= lt!597250 lt!597253)))

(assert (=> d!145189 (= (getValueByKey!720 lt!597252 (_1!12207 (tuple2!24393 lt!597155 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597155 minValue!1245))))))

(assert (=> d!145189 (= lt!597253 (lemmaContainsTupThenGetReturnValue!370 lt!597252 (_1!12207 (tuple2!24393 lt!597155 minValue!1245)) (_2!12207 (tuple2!24393 lt!597155 minValue!1245))))))

(assert (=> d!145189 (= lt!597252 (insertStrictlySorted!499 (toList!11044 lt!597146) (_1!12207 (tuple2!24393 lt!597155 minValue!1245)) (_2!12207 (tuple2!24393 lt!597155 minValue!1245))))))

(assert (=> d!145189 (= (+!4896 lt!597146 (tuple2!24393 lt!597155 minValue!1245)) lt!597251)))

(declare-fun b!1351149 () Bool)

(declare-fun res!895976 () Bool)

(assert (=> b!1351149 (=> (not res!895976) (not e!768714))))

(assert (=> b!1351149 (= res!895976 (= (getValueByKey!720 (toList!11044 lt!597251) (_1!12207 (tuple2!24393 lt!597155 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597155 minValue!1245)))))))

(declare-fun b!1351150 () Bool)

(assert (=> b!1351150 (= e!768714 (contains!9242 (toList!11044 lt!597251) (tuple2!24393 lt!597155 minValue!1245)))))

(assert (= (and d!145189 res!895975) b!1351149))

(assert (= (and b!1351149 res!895976) b!1351150))

(declare-fun m!1238589 () Bool)

(assert (=> d!145189 m!1238589))

(declare-fun m!1238591 () Bool)

(assert (=> d!145189 m!1238591))

(declare-fun m!1238593 () Bool)

(assert (=> d!145189 m!1238593))

(declare-fun m!1238595 () Bool)

(assert (=> d!145189 m!1238595))

(declare-fun m!1238597 () Bool)

(assert (=> b!1351149 m!1238597))

(declare-fun m!1238599 () Bool)

(assert (=> b!1351150 m!1238599))

(assert (=> b!1351020 d!145189))

(declare-fun d!145191 () Bool)

(assert (=> d!145191 (contains!9239 (+!4896 lt!597154 (tuple2!24393 lt!597157 zeroValue!1245)) lt!597145)))

(declare-fun lt!597256 () Unit!44142)

(declare-fun choose!1989 (ListLongMap!22057 (_ BitVec 64) V!55225 (_ BitVec 64)) Unit!44142)

(assert (=> d!145191 (= lt!597256 (choose!1989 lt!597154 lt!597157 zeroValue!1245 lt!597145))))

(assert (=> d!145191 (contains!9239 lt!597154 lt!597145)))

(assert (=> d!145191 (= (addStillContains!1218 lt!597154 lt!597157 zeroValue!1245 lt!597145) lt!597256)))

(declare-fun bs!38710 () Bool)

(assert (= bs!38710 d!145191))

(assert (=> bs!38710 m!1238387))

(assert (=> bs!38710 m!1238387))

(assert (=> bs!38710 m!1238401))

(declare-fun m!1238601 () Bool)

(assert (=> bs!38710 m!1238601))

(declare-fun m!1238603 () Bool)

(assert (=> bs!38710 m!1238603))

(assert (=> b!1351020 d!145191))

(declare-fun d!145193 () Bool)

(declare-fun e!768715 () Bool)

(assert (=> d!145193 e!768715))

(declare-fun res!895977 () Bool)

(assert (=> d!145193 (=> (not res!895977) (not e!768715))))

(declare-fun lt!597258 () ListLongMap!22057)

(assert (=> d!145193 (= res!895977 (contains!9239 lt!597258 (_1!12207 (tuple2!24393 lt!597157 zeroValue!1245))))))

(declare-fun lt!597259 () List!31527)

(assert (=> d!145193 (= lt!597258 (ListLongMap!22058 lt!597259))))

(declare-fun lt!597257 () Unit!44142)

(declare-fun lt!597260 () Unit!44142)

(assert (=> d!145193 (= lt!597257 lt!597260)))

(assert (=> d!145193 (= (getValueByKey!720 lt!597259 (_1!12207 (tuple2!24393 lt!597157 zeroValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597157 zeroValue!1245))))))

(assert (=> d!145193 (= lt!597260 (lemmaContainsTupThenGetReturnValue!370 lt!597259 (_1!12207 (tuple2!24393 lt!597157 zeroValue!1245)) (_2!12207 (tuple2!24393 lt!597157 zeroValue!1245))))))

(assert (=> d!145193 (= lt!597259 (insertStrictlySorted!499 (toList!11044 lt!597154) (_1!12207 (tuple2!24393 lt!597157 zeroValue!1245)) (_2!12207 (tuple2!24393 lt!597157 zeroValue!1245))))))

(assert (=> d!145193 (= (+!4896 lt!597154 (tuple2!24393 lt!597157 zeroValue!1245)) lt!597258)))

(declare-fun b!1351152 () Bool)

(declare-fun res!895978 () Bool)

(assert (=> b!1351152 (=> (not res!895978) (not e!768715))))

(assert (=> b!1351152 (= res!895978 (= (getValueByKey!720 (toList!11044 lt!597258) (_1!12207 (tuple2!24393 lt!597157 zeroValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597157 zeroValue!1245)))))))

(declare-fun b!1351153 () Bool)

(assert (=> b!1351153 (= e!768715 (contains!9242 (toList!11044 lt!597258) (tuple2!24393 lt!597157 zeroValue!1245)))))

(assert (= (and d!145193 res!895977) b!1351152))

(assert (= (and b!1351152 res!895978) b!1351153))

(declare-fun m!1238605 () Bool)

(assert (=> d!145193 m!1238605))

(declare-fun m!1238607 () Bool)

(assert (=> d!145193 m!1238607))

(declare-fun m!1238609 () Bool)

(assert (=> d!145193 m!1238609))

(declare-fun m!1238611 () Bool)

(assert (=> d!145193 m!1238611))

(declare-fun m!1238613 () Bool)

(assert (=> b!1351152 m!1238613))

(declare-fun m!1238615 () Bool)

(assert (=> b!1351153 m!1238615))

(assert (=> b!1351020 d!145193))

(declare-fun d!145195 () Bool)

(assert (=> d!145195 (= (apply!1050 (+!4896 lt!597156 (tuple2!24393 lt!597148 zeroValue!1245)) lt!597150) (apply!1050 lt!597156 lt!597150))))

(declare-fun lt!597261 () Unit!44142)

(assert (=> d!145195 (= lt!597261 (choose!1988 lt!597156 lt!597148 zeroValue!1245 lt!597150))))

(declare-fun e!768716 () Bool)

(assert (=> d!145195 e!768716))

(declare-fun res!895979 () Bool)

(assert (=> d!145195 (=> (not res!895979) (not e!768716))))

(assert (=> d!145195 (= res!895979 (contains!9239 lt!597156 lt!597150))))

(assert (=> d!145195 (= (addApplyDifferent!579 lt!597156 lt!597148 zeroValue!1245 lt!597150) lt!597261)))

(declare-fun b!1351154 () Bool)

(assert (=> b!1351154 (= e!768716 (not (= lt!597150 lt!597148)))))

(assert (= (and d!145195 res!895979) b!1351154))

(assert (=> d!145195 m!1238375))

(assert (=> d!145195 m!1238377))

(declare-fun m!1238617 () Bool)

(assert (=> d!145195 m!1238617))

(assert (=> d!145195 m!1238399))

(declare-fun m!1238619 () Bool)

(assert (=> d!145195 m!1238619))

(assert (=> d!145195 m!1238375))

(assert (=> b!1351020 d!145195))

(declare-fun d!145197 () Bool)

(declare-fun e!768717 () Bool)

(assert (=> d!145197 e!768717))

(declare-fun res!895980 () Bool)

(assert (=> d!145197 (=> (not res!895980) (not e!768717))))

(declare-fun lt!597263 () ListLongMap!22057)

(assert (=> d!145197 (= res!895980 (contains!9239 lt!597263 (_1!12207 (tuple2!24393 lt!597148 zeroValue!1245))))))

(declare-fun lt!597264 () List!31527)

(assert (=> d!145197 (= lt!597263 (ListLongMap!22058 lt!597264))))

(declare-fun lt!597262 () Unit!44142)

(declare-fun lt!597265 () Unit!44142)

(assert (=> d!145197 (= lt!597262 lt!597265)))

(assert (=> d!145197 (= (getValueByKey!720 lt!597264 (_1!12207 (tuple2!24393 lt!597148 zeroValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597148 zeroValue!1245))))))

(assert (=> d!145197 (= lt!597265 (lemmaContainsTupThenGetReturnValue!370 lt!597264 (_1!12207 (tuple2!24393 lt!597148 zeroValue!1245)) (_2!12207 (tuple2!24393 lt!597148 zeroValue!1245))))))

(assert (=> d!145197 (= lt!597264 (insertStrictlySorted!499 (toList!11044 lt!597156) (_1!12207 (tuple2!24393 lt!597148 zeroValue!1245)) (_2!12207 (tuple2!24393 lt!597148 zeroValue!1245))))))

(assert (=> d!145197 (= (+!4896 lt!597156 (tuple2!24393 lt!597148 zeroValue!1245)) lt!597263)))

(declare-fun b!1351155 () Bool)

(declare-fun res!895981 () Bool)

(assert (=> b!1351155 (=> (not res!895981) (not e!768717))))

(assert (=> b!1351155 (= res!895981 (= (getValueByKey!720 (toList!11044 lt!597263) (_1!12207 (tuple2!24393 lt!597148 zeroValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597148 zeroValue!1245)))))))

(declare-fun b!1351156 () Bool)

(assert (=> b!1351156 (= e!768717 (contains!9242 (toList!11044 lt!597263) (tuple2!24393 lt!597148 zeroValue!1245)))))

(assert (= (and d!145197 res!895980) b!1351155))

(assert (= (and b!1351155 res!895981) b!1351156))

(declare-fun m!1238621 () Bool)

(assert (=> d!145197 m!1238621))

(declare-fun m!1238623 () Bool)

(assert (=> d!145197 m!1238623))

(declare-fun m!1238625 () Bool)

(assert (=> d!145197 m!1238625))

(declare-fun m!1238627 () Bool)

(assert (=> d!145197 m!1238627))

(declare-fun m!1238629 () Bool)

(assert (=> b!1351155 m!1238629))

(declare-fun m!1238631 () Bool)

(assert (=> b!1351156 m!1238631))

(assert (=> b!1351020 d!145197))

(declare-fun d!145199 () Bool)

(declare-fun e!768718 () Bool)

(assert (=> d!145199 e!768718))

(declare-fun res!895982 () Bool)

(assert (=> d!145199 (=> res!895982 e!768718)))

(declare-fun lt!597266 () Bool)

(assert (=> d!145199 (= res!895982 (not lt!597266))))

(declare-fun lt!597268 () Bool)

(assert (=> d!145199 (= lt!597266 lt!597268)))

(declare-fun lt!597267 () Unit!44142)

(declare-fun e!768719 () Unit!44142)

(assert (=> d!145199 (= lt!597267 e!768719)))

(declare-fun c!127054 () Bool)

(assert (=> d!145199 (= c!127054 lt!597268)))

(assert (=> d!145199 (= lt!597268 (containsKey!746 (toList!11044 (+!4896 lt!597154 (tuple2!24393 lt!597157 zeroValue!1245))) lt!597145))))

(assert (=> d!145199 (= (contains!9239 (+!4896 lt!597154 (tuple2!24393 lt!597157 zeroValue!1245)) lt!597145) lt!597266)))

(declare-fun b!1351157 () Bool)

(declare-fun lt!597269 () Unit!44142)

(assert (=> b!1351157 (= e!768719 lt!597269)))

(assert (=> b!1351157 (= lt!597269 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 (+!4896 lt!597154 (tuple2!24393 lt!597157 zeroValue!1245))) lt!597145))))

(assert (=> b!1351157 (isDefined!529 (getValueByKey!720 (toList!11044 (+!4896 lt!597154 (tuple2!24393 lt!597157 zeroValue!1245))) lt!597145))))

(declare-fun b!1351158 () Bool)

(declare-fun Unit!44149 () Unit!44142)

(assert (=> b!1351158 (= e!768719 Unit!44149)))

(declare-fun b!1351159 () Bool)

(assert (=> b!1351159 (= e!768718 (isDefined!529 (getValueByKey!720 (toList!11044 (+!4896 lt!597154 (tuple2!24393 lt!597157 zeroValue!1245))) lt!597145)))))

(assert (= (and d!145199 c!127054) b!1351157))

(assert (= (and d!145199 (not c!127054)) b!1351158))

(assert (= (and d!145199 (not res!895982)) b!1351159))

(declare-fun m!1238633 () Bool)

(assert (=> d!145199 m!1238633))

(declare-fun m!1238635 () Bool)

(assert (=> b!1351157 m!1238635))

(declare-fun m!1238637 () Bool)

(assert (=> b!1351157 m!1238637))

(assert (=> b!1351157 m!1238637))

(declare-fun m!1238639 () Bool)

(assert (=> b!1351157 m!1238639))

(assert (=> b!1351159 m!1238637))

(assert (=> b!1351159 m!1238637))

(assert (=> b!1351159 m!1238639))

(assert (=> b!1351020 d!145199))

(declare-fun d!145201 () Bool)

(assert (=> d!145201 (= (apply!1050 (+!4896 lt!597158 (tuple2!24393 lt!597153 minValue!1245)) lt!597162) (apply!1050 lt!597158 lt!597162))))

(declare-fun lt!597270 () Unit!44142)

(assert (=> d!145201 (= lt!597270 (choose!1988 lt!597158 lt!597153 minValue!1245 lt!597162))))

(declare-fun e!768720 () Bool)

(assert (=> d!145201 e!768720))

(declare-fun res!895983 () Bool)

(assert (=> d!145201 (=> (not res!895983) (not e!768720))))

(assert (=> d!145201 (= res!895983 (contains!9239 lt!597158 lt!597162))))

(assert (=> d!145201 (= (addApplyDifferent!579 lt!597158 lt!597153 minValue!1245 lt!597162) lt!597270)))

(declare-fun b!1351160 () Bool)

(assert (=> b!1351160 (= e!768720 (not (= lt!597162 lt!597153)))))

(assert (= (and d!145201 res!895983) b!1351160))

(assert (=> d!145201 m!1238397))

(assert (=> d!145201 m!1238403))

(declare-fun m!1238641 () Bool)

(assert (=> d!145201 m!1238641))

(assert (=> d!145201 m!1238385))

(declare-fun m!1238643 () Bool)

(assert (=> d!145201 m!1238643))

(assert (=> d!145201 m!1238397))

(assert (=> b!1351020 d!145201))

(declare-fun d!145203 () Bool)

(declare-fun e!768721 () Bool)

(assert (=> d!145203 e!768721))

(declare-fun res!895984 () Bool)

(assert (=> d!145203 (=> res!895984 e!768721)))

(declare-fun lt!597271 () Bool)

(assert (=> d!145203 (= res!895984 (not lt!597271))))

(declare-fun lt!597273 () Bool)

(assert (=> d!145203 (= lt!597271 lt!597273)))

(declare-fun lt!597272 () Unit!44142)

(declare-fun e!768722 () Unit!44142)

(assert (=> d!145203 (= lt!597272 e!768722)))

(declare-fun c!127055 () Bool)

(assert (=> d!145203 (= c!127055 lt!597273)))

(assert (=> d!145203 (= lt!597273 (containsKey!746 (toList!11044 lt!597184) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!145203 (= (contains!9239 lt!597184 #b0000000000000000000000000000000000000000000000000000000000000000) lt!597271)))

(declare-fun b!1351161 () Bool)

(declare-fun lt!597274 () Unit!44142)

(assert (=> b!1351161 (= e!768722 lt!597274)))

(assert (=> b!1351161 (= lt!597274 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 lt!597184) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1351161 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597184) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351162 () Bool)

(declare-fun Unit!44150 () Unit!44142)

(assert (=> b!1351162 (= e!768722 Unit!44150)))

(declare-fun b!1351163 () Bool)

(assert (=> b!1351163 (= e!768721 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597184) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145203 c!127055) b!1351161))

(assert (= (and d!145203 (not c!127055)) b!1351162))

(assert (= (and d!145203 (not res!895984)) b!1351163))

(declare-fun m!1238645 () Bool)

(assert (=> d!145203 m!1238645))

(declare-fun m!1238647 () Bool)

(assert (=> b!1351161 m!1238647))

(declare-fun m!1238649 () Bool)

(assert (=> b!1351161 m!1238649))

(assert (=> b!1351161 m!1238649))

(declare-fun m!1238651 () Bool)

(assert (=> b!1351161 m!1238651))

(assert (=> b!1351163 m!1238649))

(assert (=> b!1351163 m!1238649))

(assert (=> b!1351163 m!1238651))

(assert (=> bm!65292 d!145203))

(assert (=> b!1350971 d!145163))

(assert (=> b!1350971 d!145165))

(declare-fun d!145205 () Bool)

(declare-fun e!768723 () Bool)

(assert (=> d!145205 e!768723))

(declare-fun res!895985 () Bool)

(assert (=> d!145205 (=> (not res!895985) (not e!768723))))

(declare-fun lt!597276 () ListLongMap!22057)

(assert (=> d!145205 (= res!895985 (contains!9239 lt!597276 (_1!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!597277 () List!31527)

(assert (=> d!145205 (= lt!597276 (ListLongMap!22058 lt!597277))))

(declare-fun lt!597275 () Unit!44142)

(declare-fun lt!597278 () Unit!44142)

(assert (=> d!145205 (= lt!597275 lt!597278)))

(assert (=> d!145205 (= (getValueByKey!720 lt!597277 (_1!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!145205 (= lt!597278 (lemmaContainsTupThenGetReturnValue!370 lt!597277 (_1!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!145205 (= lt!597277 (insertStrictlySorted!499 (toList!11044 call!65288) (_1!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!145205 (= (+!4896 call!65288 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!597276)))

(declare-fun b!1351164 () Bool)

(declare-fun res!895986 () Bool)

(assert (=> b!1351164 (=> (not res!895986) (not e!768723))))

(assert (=> b!1351164 (= res!895986 (= (getValueByKey!720 (toList!11044 lt!597276) (_1!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1351165 () Bool)

(assert (=> b!1351165 (= e!768723 (contains!9242 (toList!11044 lt!597276) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!145205 res!895985) b!1351164))

(assert (= (and b!1351164 res!895986) b!1351165))

(declare-fun m!1238653 () Bool)

(assert (=> d!145205 m!1238653))

(declare-fun m!1238655 () Bool)

(assert (=> d!145205 m!1238655))

(declare-fun m!1238657 () Bool)

(assert (=> d!145205 m!1238657))

(declare-fun m!1238659 () Bool)

(assert (=> d!145205 m!1238659))

(declare-fun m!1238661 () Bool)

(assert (=> b!1351164 m!1238661))

(declare-fun m!1238663 () Bool)

(assert (=> b!1351165 m!1238663))

(assert (=> b!1351019 d!145205))

(assert (=> d!145153 d!145145))

(declare-fun d!145207 () Bool)

(declare-fun res!895991 () Bool)

(declare-fun e!768728 () Bool)

(assert (=> d!145207 (=> res!895991 e!768728)))

(assert (=> d!145207 (= res!895991 (and ((_ is Cons!31523) (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)))))

(assert (=> d!145207 (= (containsKey!746 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142) e!768728)))

(declare-fun b!1351170 () Bool)

(declare-fun e!768729 () Bool)

(assert (=> b!1351170 (= e!768728 e!768729)))

(declare-fun res!895992 () Bool)

(assert (=> b!1351170 (=> (not res!895992) (not e!768729))))

(assert (=> b!1351170 (= res!895992 (and (or (not ((_ is Cons!31523) (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (bvsle (_1!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)) ((_ is Cons!31523) (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvslt (_1!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1351171 () Bool)

(assert (=> b!1351171 (= e!768729 (containsKey!746 (t!46175 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) k0!1142))))

(assert (= (and d!145207 (not res!895991)) b!1351170))

(assert (= (and b!1351170 res!895992) b!1351171))

(declare-fun m!1238665 () Bool)

(assert (=> b!1351171 m!1238665))

(assert (=> d!145151 d!145207))

(assert (=> bm!65283 d!145187))

(declare-fun d!145209 () Bool)

(assert (=> d!145209 (= (apply!1050 (+!4896 lt!597193 (tuple2!24393 lt!597188 minValue!1245)) lt!597197) (apply!1050 lt!597193 lt!597197))))

(declare-fun lt!597279 () Unit!44142)

(assert (=> d!145209 (= lt!597279 (choose!1988 lt!597193 lt!597188 minValue!1245 lt!597197))))

(declare-fun e!768730 () Bool)

(assert (=> d!145209 e!768730))

(declare-fun res!895993 () Bool)

(assert (=> d!145209 (=> (not res!895993) (not e!768730))))

(assert (=> d!145209 (= res!895993 (contains!9239 lt!597193 lt!597197))))

(assert (=> d!145209 (= (addApplyDifferent!579 lt!597193 lt!597188 minValue!1245 lt!597197) lt!597279)))

(declare-fun b!1351172 () Bool)

(assert (=> b!1351172 (= e!768730 (not (= lt!597197 lt!597188)))))

(assert (= (and d!145209 res!895993) b!1351172))

(assert (=> d!145209 m!1238469))

(assert (=> d!145209 m!1238475))

(declare-fun m!1238667 () Bool)

(assert (=> d!145209 m!1238667))

(assert (=> d!145209 m!1238457))

(declare-fun m!1238669 () Bool)

(assert (=> d!145209 m!1238669))

(assert (=> d!145209 m!1238469))

(assert (=> b!1351058 d!145209))

(declare-fun d!145211 () Bool)

(assert (=> d!145211 (= (apply!1050 (+!4896 lt!597193 (tuple2!24393 lt!597188 minValue!1245)) lt!597197) (get!22513 (getValueByKey!720 (toList!11044 (+!4896 lt!597193 (tuple2!24393 lt!597188 minValue!1245))) lt!597197)))))

(declare-fun bs!38711 () Bool)

(assert (= bs!38711 d!145211))

(declare-fun m!1238671 () Bool)

(assert (=> bs!38711 m!1238671))

(assert (=> bs!38711 m!1238671))

(declare-fun m!1238673 () Bool)

(assert (=> bs!38711 m!1238673))

(assert (=> b!1351058 d!145211))

(declare-fun d!145213 () Bool)

(assert (=> d!145213 (= (apply!1050 lt!597193 lt!597197) (get!22513 (getValueByKey!720 (toList!11044 lt!597193) lt!597197)))))

(declare-fun bs!38712 () Bool)

(assert (= bs!38712 d!145213))

(declare-fun m!1238675 () Bool)

(assert (=> bs!38712 m!1238675))

(assert (=> bs!38712 m!1238675))

(declare-fun m!1238677 () Bool)

(assert (=> bs!38712 m!1238677))

(assert (=> b!1351058 d!145213))

(declare-fun d!145215 () Bool)

(assert (=> d!145215 (= (apply!1050 (+!4896 lt!597181 (tuple2!24393 lt!597190 minValue!1245)) lt!597194) (apply!1050 lt!597181 lt!597194))))

(declare-fun lt!597280 () Unit!44142)

(assert (=> d!145215 (= lt!597280 (choose!1988 lt!597181 lt!597190 minValue!1245 lt!597194))))

(declare-fun e!768731 () Bool)

(assert (=> d!145215 e!768731))

(declare-fun res!895994 () Bool)

(assert (=> d!145215 (=> (not res!895994) (not e!768731))))

(assert (=> d!145215 (= res!895994 (contains!9239 lt!597181 lt!597194))))

(assert (=> d!145215 (= (addApplyDifferent!579 lt!597181 lt!597190 minValue!1245 lt!597194) lt!597280)))

(declare-fun b!1351173 () Bool)

(assert (=> b!1351173 (= e!768731 (not (= lt!597194 lt!597190)))))

(assert (= (and d!145215 res!895994) b!1351173))

(assert (=> d!145215 m!1238453))

(assert (=> d!145215 m!1238455))

(declare-fun m!1238679 () Bool)

(assert (=> d!145215 m!1238679))

(assert (=> d!145215 m!1238451))

(declare-fun m!1238681 () Bool)

(assert (=> d!145215 m!1238681))

(assert (=> d!145215 m!1238453))

(assert (=> b!1351058 d!145215))

(declare-fun d!145217 () Bool)

(assert (=> d!145217 (= (apply!1050 lt!597191 lt!597185) (get!22513 (getValueByKey!720 (toList!11044 lt!597191) lt!597185)))))

(declare-fun bs!38713 () Bool)

(assert (= bs!38713 d!145217))

(declare-fun m!1238683 () Bool)

(assert (=> bs!38713 m!1238683))

(assert (=> bs!38713 m!1238683))

(declare-fun m!1238685 () Bool)

(assert (=> bs!38713 m!1238685))

(assert (=> b!1351058 d!145217))

(declare-fun d!145219 () Bool)

(assert (=> d!145219 (= (apply!1050 lt!597181 lt!597194) (get!22513 (getValueByKey!720 (toList!11044 lt!597181) lt!597194)))))

(declare-fun bs!38714 () Bool)

(assert (= bs!38714 d!145219))

(declare-fun m!1238687 () Bool)

(assert (=> bs!38714 m!1238687))

(assert (=> bs!38714 m!1238687))

(declare-fun m!1238689 () Bool)

(assert (=> bs!38714 m!1238689))

(assert (=> b!1351058 d!145219))

(declare-fun d!145221 () Bool)

(assert (=> d!145221 (= (apply!1050 (+!4896 lt!597191 (tuple2!24393 lt!597183 zeroValue!1245)) lt!597185) (get!22513 (getValueByKey!720 (toList!11044 (+!4896 lt!597191 (tuple2!24393 lt!597183 zeroValue!1245))) lt!597185)))))

(declare-fun bs!38715 () Bool)

(assert (= bs!38715 d!145221))

(declare-fun m!1238691 () Bool)

(assert (=> bs!38715 m!1238691))

(assert (=> bs!38715 m!1238691))

(declare-fun m!1238693 () Bool)

(assert (=> bs!38715 m!1238693))

(assert (=> b!1351058 d!145221))

(declare-fun lt!597284 () ListLongMap!22057)

(declare-fun b!1351174 () Bool)

(declare-fun e!768738 () Bool)

(assert (=> b!1351174 (= e!768738 (= lt!597284 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1351175 () Bool)

(declare-fun e!768734 () ListLongMap!22057)

(assert (=> b!1351175 (= e!768734 (ListLongMap!22058 Nil!31524))))

(declare-fun b!1351176 () Bool)

(declare-fun e!768737 () ListLongMap!22057)

(declare-fun call!65303 () ListLongMap!22057)

(assert (=> b!1351176 (= e!768737 call!65303)))

(declare-fun b!1351177 () Bool)

(declare-fun e!768733 () Bool)

(assert (=> b!1351177 (= e!768733 e!768738)))

(declare-fun c!127056 () Bool)

(assert (=> b!1351177 (= c!127056 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)))))

(declare-fun b!1351178 () Bool)

(declare-fun lt!597281 () Unit!44142)

(declare-fun lt!597283 () Unit!44142)

(assert (=> b!1351178 (= lt!597281 lt!597283)))

(declare-fun lt!597286 () (_ BitVec 64))

(declare-fun lt!597287 () (_ BitVec 64))

(declare-fun lt!597282 () ListLongMap!22057)

(declare-fun lt!597285 () V!55225)

(assert (=> b!1351178 (not (contains!9239 (+!4896 lt!597282 (tuple2!24393 lt!597286 lt!597285)) lt!597287))))

(assert (=> b!1351178 (= lt!597283 (addStillNotContains!506 lt!597282 lt!597286 lt!597285 lt!597287))))

(assert (=> b!1351178 (= lt!597287 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1351178 (= lt!597285 (get!22512 (select (arr!44512 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1351178 (= lt!597286 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1351178 (= lt!597282 call!65303)))

(assert (=> b!1351178 (= e!768737 (+!4896 call!65303 (tuple2!24393 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22512 (select (arr!44512 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1351179 () Bool)

(assert (=> b!1351179 (= e!768738 (isEmpty!1104 lt!597284))))

(declare-fun d!145223 () Bool)

(declare-fun e!768736 () Bool)

(assert (=> d!145223 e!768736))

(declare-fun res!895995 () Bool)

(assert (=> d!145223 (=> (not res!895995) (not e!768736))))

(assert (=> d!145223 (= res!895995 (not (contains!9239 lt!597284 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!145223 (= lt!597284 e!768734)))

(declare-fun c!127057 () Bool)

(assert (=> d!145223 (= c!127057 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)))))

(assert (=> d!145223 (validMask!0 mask!1977)))

(assert (=> d!145223 (= (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!597284)))

(declare-fun b!1351180 () Bool)

(declare-fun e!768735 () Bool)

(assert (=> b!1351180 (= e!768735 (validKeyInArray!0 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1351180 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1351181 () Bool)

(assert (=> b!1351181 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)))))

(assert (=> b!1351181 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45063 _values!1303)))))

(declare-fun e!768732 () Bool)

(assert (=> b!1351181 (= e!768732 (= (apply!1050 lt!597284 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22512 (select (arr!44512 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1351182 () Bool)

(assert (=> b!1351182 (= e!768734 e!768737)))

(declare-fun c!127059 () Bool)

(assert (=> b!1351182 (= c!127059 (validKeyInArray!0 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1351183 () Bool)

(declare-fun res!895997 () Bool)

(assert (=> b!1351183 (=> (not res!895997) (not e!768736))))

(assert (=> b!1351183 (= res!895997 (not (contains!9239 lt!597284 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!65300 () Bool)

(assert (=> bm!65300 (= call!65303 (getCurrentListMapNoExtraKeys!6549 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1351184 () Bool)

(assert (=> b!1351184 (= e!768736 e!768733)))

(declare-fun c!127058 () Bool)

(assert (=> b!1351184 (= c!127058 e!768735)))

(declare-fun res!895996 () Bool)

(assert (=> b!1351184 (=> (not res!895996) (not e!768735))))

(assert (=> b!1351184 (= res!895996 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)))))

(declare-fun b!1351185 () Bool)

(assert (=> b!1351185 (= e!768733 e!768732)))

(assert (=> b!1351185 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45064 _keys!1571)))))

(declare-fun res!895998 () Bool)

(assert (=> b!1351185 (= res!895998 (contains!9239 lt!597284 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1351185 (=> (not res!895998) (not e!768732))))

(assert (= (and d!145223 c!127057) b!1351175))

(assert (= (and d!145223 (not c!127057)) b!1351182))

(assert (= (and b!1351182 c!127059) b!1351178))

(assert (= (and b!1351182 (not c!127059)) b!1351176))

(assert (= (or b!1351178 b!1351176) bm!65300))

(assert (= (and d!145223 res!895995) b!1351183))

(assert (= (and b!1351183 res!895997) b!1351184))

(assert (= (and b!1351184 res!895996) b!1351180))

(assert (= (and b!1351184 c!127058) b!1351185))

(assert (= (and b!1351184 (not c!127058)) b!1351177))

(assert (= (and b!1351185 res!895998) b!1351181))

(assert (= (and b!1351177 c!127056) b!1351174))

(assert (= (and b!1351177 (not c!127056)) b!1351179))

(declare-fun b_lambda!24725 () Bool)

(assert (=> (not b_lambda!24725) (not b!1351178)))

(assert (=> b!1351178 t!46180))

(declare-fun b_and!51005 () Bool)

(assert (= b_and!51003 (and (=> t!46180 result!26013) b_and!51005)))

(declare-fun b_lambda!24727 () Bool)

(assert (=> (not b_lambda!24727) (not b!1351181)))

(assert (=> b!1351181 t!46180))

(declare-fun b_and!51007 () Bool)

(assert (= b_and!51005 (and (=> t!46180 result!26013) b_and!51007)))

(declare-fun m!1238695 () Bool)

(assert (=> b!1351179 m!1238695))

(assert (=> b!1351182 m!1238431))

(assert (=> b!1351182 m!1238431))

(assert (=> b!1351182 m!1238443))

(declare-fun m!1238697 () Bool)

(assert (=> d!145223 m!1238697))

(assert (=> d!145223 m!1238279))

(declare-fun m!1238699 () Bool)

(assert (=> b!1351174 m!1238699))

(declare-fun m!1238701 () Bool)

(assert (=> b!1351178 m!1238701))

(assert (=> b!1351178 m!1238427))

(assert (=> b!1351178 m!1238359))

(assert (=> b!1351178 m!1238429))

(assert (=> b!1351178 m!1238359))

(declare-fun m!1238703 () Bool)

(assert (=> b!1351178 m!1238703))

(assert (=> b!1351178 m!1238427))

(assert (=> b!1351178 m!1238431))

(declare-fun m!1238705 () Bool)

(assert (=> b!1351178 m!1238705))

(assert (=> b!1351178 m!1238701))

(declare-fun m!1238707 () Bool)

(assert (=> b!1351178 m!1238707))

(declare-fun m!1238709 () Bool)

(assert (=> b!1351183 m!1238709))

(assert (=> bm!65300 m!1238699))

(assert (=> b!1351181 m!1238427))

(assert (=> b!1351181 m!1238359))

(assert (=> b!1351181 m!1238429))

(assert (=> b!1351181 m!1238359))

(assert (=> b!1351181 m!1238431))

(assert (=> b!1351181 m!1238427))

(assert (=> b!1351181 m!1238431))

(declare-fun m!1238711 () Bool)

(assert (=> b!1351181 m!1238711))

(assert (=> b!1351180 m!1238431))

(assert (=> b!1351180 m!1238431))

(assert (=> b!1351180 m!1238443))

(assert (=> b!1351185 m!1238431))

(assert (=> b!1351185 m!1238431))

(declare-fun m!1238713 () Bool)

(assert (=> b!1351185 m!1238713))

(assert (=> b!1351058 d!145223))

(declare-fun d!145225 () Bool)

(declare-fun e!768739 () Bool)

(assert (=> d!145225 e!768739))

(declare-fun res!895999 () Bool)

(assert (=> d!145225 (=> (not res!895999) (not e!768739))))

(declare-fun lt!597289 () ListLongMap!22057)

(assert (=> d!145225 (= res!895999 (contains!9239 lt!597289 (_1!12207 (tuple2!24393 lt!597192 zeroValue!1245))))))

(declare-fun lt!597290 () List!31527)

(assert (=> d!145225 (= lt!597289 (ListLongMap!22058 lt!597290))))

(declare-fun lt!597288 () Unit!44142)

(declare-fun lt!597291 () Unit!44142)

(assert (=> d!145225 (= lt!597288 lt!597291)))

(assert (=> d!145225 (= (getValueByKey!720 lt!597290 (_1!12207 (tuple2!24393 lt!597192 zeroValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597192 zeroValue!1245))))))

(assert (=> d!145225 (= lt!597291 (lemmaContainsTupThenGetReturnValue!370 lt!597290 (_1!12207 (tuple2!24393 lt!597192 zeroValue!1245)) (_2!12207 (tuple2!24393 lt!597192 zeroValue!1245))))))

(assert (=> d!145225 (= lt!597290 (insertStrictlySorted!499 (toList!11044 lt!597189) (_1!12207 (tuple2!24393 lt!597192 zeroValue!1245)) (_2!12207 (tuple2!24393 lt!597192 zeroValue!1245))))))

(assert (=> d!145225 (= (+!4896 lt!597189 (tuple2!24393 lt!597192 zeroValue!1245)) lt!597289)))

(declare-fun b!1351186 () Bool)

(declare-fun res!896000 () Bool)

(assert (=> b!1351186 (=> (not res!896000) (not e!768739))))

(assert (=> b!1351186 (= res!896000 (= (getValueByKey!720 (toList!11044 lt!597289) (_1!12207 (tuple2!24393 lt!597192 zeroValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597192 zeroValue!1245)))))))

(declare-fun b!1351187 () Bool)

(assert (=> b!1351187 (= e!768739 (contains!9242 (toList!11044 lt!597289) (tuple2!24393 lt!597192 zeroValue!1245)))))

(assert (= (and d!145225 res!895999) b!1351186))

(assert (= (and b!1351186 res!896000) b!1351187))

(declare-fun m!1238715 () Bool)

(assert (=> d!145225 m!1238715))

(declare-fun m!1238717 () Bool)

(assert (=> d!145225 m!1238717))

(declare-fun m!1238719 () Bool)

(assert (=> d!145225 m!1238719))

(declare-fun m!1238721 () Bool)

(assert (=> d!145225 m!1238721))

(declare-fun m!1238723 () Bool)

(assert (=> b!1351186 m!1238723))

(declare-fun m!1238725 () Bool)

(assert (=> b!1351187 m!1238725))

(assert (=> b!1351058 d!145225))

(declare-fun d!145227 () Bool)

(declare-fun e!768740 () Bool)

(assert (=> d!145227 e!768740))

(declare-fun res!896001 () Bool)

(assert (=> d!145227 (=> (not res!896001) (not e!768740))))

(declare-fun lt!597293 () ListLongMap!22057)

(assert (=> d!145227 (= res!896001 (contains!9239 lt!597293 (_1!12207 (tuple2!24393 lt!597183 zeroValue!1245))))))

(declare-fun lt!597294 () List!31527)

(assert (=> d!145227 (= lt!597293 (ListLongMap!22058 lt!597294))))

(declare-fun lt!597292 () Unit!44142)

(declare-fun lt!597295 () Unit!44142)

(assert (=> d!145227 (= lt!597292 lt!597295)))

(assert (=> d!145227 (= (getValueByKey!720 lt!597294 (_1!12207 (tuple2!24393 lt!597183 zeroValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597183 zeroValue!1245))))))

(assert (=> d!145227 (= lt!597295 (lemmaContainsTupThenGetReturnValue!370 lt!597294 (_1!12207 (tuple2!24393 lt!597183 zeroValue!1245)) (_2!12207 (tuple2!24393 lt!597183 zeroValue!1245))))))

(assert (=> d!145227 (= lt!597294 (insertStrictlySorted!499 (toList!11044 lt!597191) (_1!12207 (tuple2!24393 lt!597183 zeroValue!1245)) (_2!12207 (tuple2!24393 lt!597183 zeroValue!1245))))))

(assert (=> d!145227 (= (+!4896 lt!597191 (tuple2!24393 lt!597183 zeroValue!1245)) lt!597293)))

(declare-fun b!1351188 () Bool)

(declare-fun res!896002 () Bool)

(assert (=> b!1351188 (=> (not res!896002) (not e!768740))))

(assert (=> b!1351188 (= res!896002 (= (getValueByKey!720 (toList!11044 lt!597293) (_1!12207 (tuple2!24393 lt!597183 zeroValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597183 zeroValue!1245)))))))

(declare-fun b!1351189 () Bool)

(assert (=> b!1351189 (= e!768740 (contains!9242 (toList!11044 lt!597293) (tuple2!24393 lt!597183 zeroValue!1245)))))

(assert (= (and d!145227 res!896001) b!1351188))

(assert (= (and b!1351188 res!896002) b!1351189))

(declare-fun m!1238727 () Bool)

(assert (=> d!145227 m!1238727))

(declare-fun m!1238729 () Bool)

(assert (=> d!145227 m!1238729))

(declare-fun m!1238731 () Bool)

(assert (=> d!145227 m!1238731))

(declare-fun m!1238733 () Bool)

(assert (=> d!145227 m!1238733))

(declare-fun m!1238735 () Bool)

(assert (=> b!1351188 m!1238735))

(declare-fun m!1238737 () Bool)

(assert (=> b!1351189 m!1238737))

(assert (=> b!1351058 d!145227))

(declare-fun d!145229 () Bool)

(declare-fun e!768741 () Bool)

(assert (=> d!145229 e!768741))

(declare-fun res!896003 () Bool)

(assert (=> d!145229 (=> (not res!896003) (not e!768741))))

(declare-fun lt!597297 () ListLongMap!22057)

(assert (=> d!145229 (= res!896003 (contains!9239 lt!597297 (_1!12207 (tuple2!24393 lt!597188 minValue!1245))))))

(declare-fun lt!597298 () List!31527)

(assert (=> d!145229 (= lt!597297 (ListLongMap!22058 lt!597298))))

(declare-fun lt!597296 () Unit!44142)

(declare-fun lt!597299 () Unit!44142)

(assert (=> d!145229 (= lt!597296 lt!597299)))

(assert (=> d!145229 (= (getValueByKey!720 lt!597298 (_1!12207 (tuple2!24393 lt!597188 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597188 minValue!1245))))))

(assert (=> d!145229 (= lt!597299 (lemmaContainsTupThenGetReturnValue!370 lt!597298 (_1!12207 (tuple2!24393 lt!597188 minValue!1245)) (_2!12207 (tuple2!24393 lt!597188 minValue!1245))))))

(assert (=> d!145229 (= lt!597298 (insertStrictlySorted!499 (toList!11044 lt!597193) (_1!12207 (tuple2!24393 lt!597188 minValue!1245)) (_2!12207 (tuple2!24393 lt!597188 minValue!1245))))))

(assert (=> d!145229 (= (+!4896 lt!597193 (tuple2!24393 lt!597188 minValue!1245)) lt!597297)))

(declare-fun b!1351190 () Bool)

(declare-fun res!896004 () Bool)

(assert (=> b!1351190 (=> (not res!896004) (not e!768741))))

(assert (=> b!1351190 (= res!896004 (= (getValueByKey!720 (toList!11044 lt!597297) (_1!12207 (tuple2!24393 lt!597188 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597188 minValue!1245)))))))

(declare-fun b!1351191 () Bool)

(assert (=> b!1351191 (= e!768741 (contains!9242 (toList!11044 lt!597297) (tuple2!24393 lt!597188 minValue!1245)))))

(assert (= (and d!145229 res!896003) b!1351190))

(assert (= (and b!1351190 res!896004) b!1351191))

(declare-fun m!1238739 () Bool)

(assert (=> d!145229 m!1238739))

(declare-fun m!1238741 () Bool)

(assert (=> d!145229 m!1238741))

(declare-fun m!1238743 () Bool)

(assert (=> d!145229 m!1238743))

(declare-fun m!1238745 () Bool)

(assert (=> d!145229 m!1238745))

(declare-fun m!1238747 () Bool)

(assert (=> b!1351190 m!1238747))

(declare-fun m!1238749 () Bool)

(assert (=> b!1351191 m!1238749))

(assert (=> b!1351058 d!145229))

(declare-fun d!145231 () Bool)

(assert (=> d!145231 (contains!9239 (+!4896 lt!597189 (tuple2!24393 lt!597192 zeroValue!1245)) lt!597180)))

(declare-fun lt!597300 () Unit!44142)

(assert (=> d!145231 (= lt!597300 (choose!1989 lt!597189 lt!597192 zeroValue!1245 lt!597180))))

(assert (=> d!145231 (contains!9239 lt!597189 lt!597180)))

(assert (=> d!145231 (= (addStillContains!1218 lt!597189 lt!597192 zeroValue!1245 lt!597180) lt!597300)))

(declare-fun bs!38716 () Bool)

(assert (= bs!38716 d!145231))

(assert (=> bs!38716 m!1238459))

(assert (=> bs!38716 m!1238459))

(assert (=> bs!38716 m!1238473))

(declare-fun m!1238751 () Bool)

(assert (=> bs!38716 m!1238751))

(declare-fun m!1238753 () Bool)

(assert (=> bs!38716 m!1238753))

(assert (=> b!1351058 d!145231))

(declare-fun d!145233 () Bool)

(assert (=> d!145233 (= (apply!1050 (+!4896 lt!597181 (tuple2!24393 lt!597190 minValue!1245)) lt!597194) (get!22513 (getValueByKey!720 (toList!11044 (+!4896 lt!597181 (tuple2!24393 lt!597190 minValue!1245))) lt!597194)))))

(declare-fun bs!38717 () Bool)

(assert (= bs!38717 d!145233))

(declare-fun m!1238755 () Bool)

(assert (=> bs!38717 m!1238755))

(assert (=> bs!38717 m!1238755))

(declare-fun m!1238757 () Bool)

(assert (=> bs!38717 m!1238757))

(assert (=> b!1351058 d!145233))

(declare-fun d!145235 () Bool)

(declare-fun e!768742 () Bool)

(assert (=> d!145235 e!768742))

(declare-fun res!896005 () Bool)

(assert (=> d!145235 (=> res!896005 e!768742)))

(declare-fun lt!597301 () Bool)

(assert (=> d!145235 (= res!896005 (not lt!597301))))

(declare-fun lt!597303 () Bool)

(assert (=> d!145235 (= lt!597301 lt!597303)))

(declare-fun lt!597302 () Unit!44142)

(declare-fun e!768743 () Unit!44142)

(assert (=> d!145235 (= lt!597302 e!768743)))

(declare-fun c!127060 () Bool)

(assert (=> d!145235 (= c!127060 lt!597303)))

(assert (=> d!145235 (= lt!597303 (containsKey!746 (toList!11044 (+!4896 lt!597189 (tuple2!24393 lt!597192 zeroValue!1245))) lt!597180))))

(assert (=> d!145235 (= (contains!9239 (+!4896 lt!597189 (tuple2!24393 lt!597192 zeroValue!1245)) lt!597180) lt!597301)))

(declare-fun b!1351192 () Bool)

(declare-fun lt!597304 () Unit!44142)

(assert (=> b!1351192 (= e!768743 lt!597304)))

(assert (=> b!1351192 (= lt!597304 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 (+!4896 lt!597189 (tuple2!24393 lt!597192 zeroValue!1245))) lt!597180))))

(assert (=> b!1351192 (isDefined!529 (getValueByKey!720 (toList!11044 (+!4896 lt!597189 (tuple2!24393 lt!597192 zeroValue!1245))) lt!597180))))

(declare-fun b!1351193 () Bool)

(declare-fun Unit!44151 () Unit!44142)

(assert (=> b!1351193 (= e!768743 Unit!44151)))

(declare-fun b!1351194 () Bool)

(assert (=> b!1351194 (= e!768742 (isDefined!529 (getValueByKey!720 (toList!11044 (+!4896 lt!597189 (tuple2!24393 lt!597192 zeroValue!1245))) lt!597180)))))

(assert (= (and d!145235 c!127060) b!1351192))

(assert (= (and d!145235 (not c!127060)) b!1351193))

(assert (= (and d!145235 (not res!896005)) b!1351194))

(declare-fun m!1238759 () Bool)

(assert (=> d!145235 m!1238759))

(declare-fun m!1238761 () Bool)

(assert (=> b!1351192 m!1238761))

(declare-fun m!1238763 () Bool)

(assert (=> b!1351192 m!1238763))

(assert (=> b!1351192 m!1238763))

(declare-fun m!1238765 () Bool)

(assert (=> b!1351192 m!1238765))

(assert (=> b!1351194 m!1238763))

(assert (=> b!1351194 m!1238763))

(assert (=> b!1351194 m!1238765))

(assert (=> b!1351058 d!145235))

(declare-fun d!145237 () Bool)

(declare-fun e!768744 () Bool)

(assert (=> d!145237 e!768744))

(declare-fun res!896006 () Bool)

(assert (=> d!145237 (=> (not res!896006) (not e!768744))))

(declare-fun lt!597306 () ListLongMap!22057)

(assert (=> d!145237 (= res!896006 (contains!9239 lt!597306 (_1!12207 (tuple2!24393 lt!597190 minValue!1245))))))

(declare-fun lt!597307 () List!31527)

(assert (=> d!145237 (= lt!597306 (ListLongMap!22058 lt!597307))))

(declare-fun lt!597305 () Unit!44142)

(declare-fun lt!597308 () Unit!44142)

(assert (=> d!145237 (= lt!597305 lt!597308)))

(assert (=> d!145237 (= (getValueByKey!720 lt!597307 (_1!12207 (tuple2!24393 lt!597190 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597190 minValue!1245))))))

(assert (=> d!145237 (= lt!597308 (lemmaContainsTupThenGetReturnValue!370 lt!597307 (_1!12207 (tuple2!24393 lt!597190 minValue!1245)) (_2!12207 (tuple2!24393 lt!597190 minValue!1245))))))

(assert (=> d!145237 (= lt!597307 (insertStrictlySorted!499 (toList!11044 lt!597181) (_1!12207 (tuple2!24393 lt!597190 minValue!1245)) (_2!12207 (tuple2!24393 lt!597190 minValue!1245))))))

(assert (=> d!145237 (= (+!4896 lt!597181 (tuple2!24393 lt!597190 minValue!1245)) lt!597306)))

(declare-fun b!1351195 () Bool)

(declare-fun res!896007 () Bool)

(assert (=> b!1351195 (=> (not res!896007) (not e!768744))))

(assert (=> b!1351195 (= res!896007 (= (getValueByKey!720 (toList!11044 lt!597306) (_1!12207 (tuple2!24393 lt!597190 minValue!1245))) (Some!770 (_2!12207 (tuple2!24393 lt!597190 minValue!1245)))))))

(declare-fun b!1351196 () Bool)

(assert (=> b!1351196 (= e!768744 (contains!9242 (toList!11044 lt!597306) (tuple2!24393 lt!597190 minValue!1245)))))

(assert (= (and d!145237 res!896006) b!1351195))

(assert (= (and b!1351195 res!896007) b!1351196))

(declare-fun m!1238767 () Bool)

(assert (=> d!145237 m!1238767))

(declare-fun m!1238769 () Bool)

(assert (=> d!145237 m!1238769))

(declare-fun m!1238771 () Bool)

(assert (=> d!145237 m!1238771))

(declare-fun m!1238773 () Bool)

(assert (=> d!145237 m!1238773))

(declare-fun m!1238775 () Bool)

(assert (=> b!1351195 m!1238775))

(declare-fun m!1238777 () Bool)

(assert (=> b!1351196 m!1238777))

(assert (=> b!1351058 d!145237))

(declare-fun d!145239 () Bool)

(assert (=> d!145239 (= (apply!1050 (+!4896 lt!597191 (tuple2!24393 lt!597183 zeroValue!1245)) lt!597185) (apply!1050 lt!597191 lt!597185))))

(declare-fun lt!597309 () Unit!44142)

(assert (=> d!145239 (= lt!597309 (choose!1988 lt!597191 lt!597183 zeroValue!1245 lt!597185))))

(declare-fun e!768745 () Bool)

(assert (=> d!145239 e!768745))

(declare-fun res!896008 () Bool)

(assert (=> d!145239 (=> (not res!896008) (not e!768745))))

(assert (=> d!145239 (= res!896008 (contains!9239 lt!597191 lt!597185))))

(assert (=> d!145239 (= (addApplyDifferent!579 lt!597191 lt!597183 zeroValue!1245 lt!597185) lt!597309)))

(declare-fun b!1351197 () Bool)

(assert (=> b!1351197 (= e!768745 (not (= lt!597185 lt!597183)))))

(assert (= (and d!145239 res!896008) b!1351197))

(assert (=> d!145239 m!1238447))

(assert (=> d!145239 m!1238449))

(declare-fun m!1238779 () Bool)

(assert (=> d!145239 m!1238779))

(assert (=> d!145239 m!1238471))

(declare-fun m!1238781 () Bool)

(assert (=> d!145239 m!1238781))

(assert (=> d!145239 m!1238447))

(assert (=> b!1351058 d!145239))

(assert (=> bm!65293 d!145223))

(declare-fun d!145241 () Bool)

(declare-fun res!896009 () Bool)

(declare-fun e!768746 () Bool)

(assert (=> d!145241 (=> res!896009 e!768746)))

(assert (=> d!145241 (= res!896009 (and ((_ is Cons!31523) (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!145241 (= (containsKey!746 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!768746)))

(declare-fun b!1351198 () Bool)

(declare-fun e!768747 () Bool)

(assert (=> b!1351198 (= e!768746 e!768747)))

(declare-fun res!896010 () Bool)

(assert (=> b!1351198 (=> (not res!896010) (not e!768747))))

(assert (=> b!1351198 (= res!896010 (and (or (not ((_ is Cons!31523) (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) (bvsle (_1!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)) ((_ is Cons!31523) (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (bvslt (_1!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1351199 () Bool)

(assert (=> b!1351199 (= e!768747 (containsKey!746 (t!46175 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!145241 (not res!896009)) b!1351198))

(assert (= (and b!1351198 res!896010) b!1351199))

(declare-fun m!1238783 () Bool)

(assert (=> b!1351199 m!1238783))

(assert (=> d!145137 d!145241))

(assert (=> d!145139 d!145145))

(declare-fun d!145243 () Bool)

(assert (=> d!145243 (isDefined!529 (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun lt!597310 () Unit!44142)

(assert (=> d!145243 (= lt!597310 (choose!1987 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun e!768748 () Bool)

(assert (=> d!145243 e!768748))

(declare-fun res!896011 () Bool)

(assert (=> d!145243 (=> (not res!896011) (not e!768748))))

(assert (=> d!145243 (= res!896011 (isStrictlySorted!872 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))))

(assert (=> d!145243 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142) lt!597310)))

(declare-fun b!1351200 () Bool)

(assert (=> b!1351200 (= e!768748 (containsKey!746 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (= (and d!145243 res!896011) b!1351200))

(assert (=> d!145243 m!1238423))

(assert (=> d!145243 m!1238423))

(assert (=> d!145243 m!1238425))

(declare-fun m!1238785 () Bool)

(assert (=> d!145243 m!1238785))

(declare-fun m!1238787 () Bool)

(assert (=> d!145243 m!1238787))

(assert (=> b!1351200 m!1238419))

(assert (=> b!1351049 d!145243))

(declare-fun d!145245 () Bool)

(assert (=> d!145245 (= (isDefined!529 (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)) (not (isEmpty!1103 (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38718 () Bool)

(assert (= bs!38718 d!145245))

(assert (=> bs!38718 m!1238423))

(declare-fun m!1238789 () Bool)

(assert (=> bs!38718 m!1238789))

(assert (=> b!1351049 d!145245))

(declare-fun b!1351202 () Bool)

(declare-fun e!768749 () Option!771)

(declare-fun e!768750 () Option!771)

(assert (=> b!1351202 (= e!768749 e!768750)))

(declare-fun c!127062 () Bool)

(assert (=> b!1351202 (= c!127062 (and ((_ is Cons!31523) (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (not (= (_1!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142))))))

(declare-fun c!127061 () Bool)

(declare-fun d!145247 () Bool)

(assert (=> d!145247 (= c!127061 (and ((_ is Cons!31523) (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)))))

(assert (=> d!145247 (= (getValueByKey!720 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142) e!768749)))

(declare-fun b!1351204 () Bool)

(assert (=> b!1351204 (= e!768750 None!769)))

(declare-fun b!1351201 () Bool)

(assert (=> b!1351201 (= e!768749 (Some!770 (_2!12207 (h!32741 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))))))

(declare-fun b!1351203 () Bool)

(assert (=> b!1351203 (= e!768750 (getValueByKey!720 (t!46175 (toList!11044 (getCurrentListMap!5980 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) k0!1142))))

(assert (= (and d!145247 c!127061) b!1351201))

(assert (= (and d!145247 (not c!127061)) b!1351202))

(assert (= (and b!1351202 c!127062) b!1351203))

(assert (= (and b!1351202 (not c!127062)) b!1351204))

(declare-fun m!1238791 () Bool)

(assert (=> b!1351203 m!1238791))

(assert (=> b!1351049 d!145247))

(declare-fun d!145249 () Bool)

(assert (=> d!145249 (= (apply!1050 lt!597149 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22513 (getValueByKey!720 (toList!11044 lt!597149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38719 () Bool)

(assert (= bs!38719 d!145249))

(assert (=> bs!38719 m!1238493))

(assert (=> bs!38719 m!1238493))

(declare-fun m!1238793 () Bool)

(assert (=> bs!38719 m!1238793))

(assert (=> b!1351026 d!145249))

(declare-fun d!145251 () Bool)

(assert (=> d!145251 (= (validKeyInArray!0 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)) (and (not (= (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1350958 d!145251))

(declare-fun d!145253 () Bool)

(declare-fun e!768751 () Bool)

(assert (=> d!145253 e!768751))

(declare-fun res!896012 () Bool)

(assert (=> d!145253 (=> res!896012 e!768751)))

(declare-fun lt!597311 () Bool)

(assert (=> d!145253 (= res!896012 (not lt!597311))))

(declare-fun lt!597313 () Bool)

(assert (=> d!145253 (= lt!597311 lt!597313)))

(declare-fun lt!597312 () Unit!44142)

(declare-fun e!768752 () Unit!44142)

(assert (=> d!145253 (= lt!597312 e!768752)))

(declare-fun c!127063 () Bool)

(assert (=> d!145253 (= c!127063 lt!597313)))

(assert (=> d!145253 (= lt!597313 (containsKey!746 (toList!11044 lt!597149) (select (arr!44513 _keys!1571) from!1960)))))

(assert (=> d!145253 (= (contains!9239 lt!597149 (select (arr!44513 _keys!1571) from!1960)) lt!597311)))

(declare-fun b!1351205 () Bool)

(declare-fun lt!597314 () Unit!44142)

(assert (=> b!1351205 (= e!768752 lt!597314)))

(assert (=> b!1351205 (= lt!597314 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 lt!597149) (select (arr!44513 _keys!1571) from!1960)))))

(assert (=> b!1351205 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597149) (select (arr!44513 _keys!1571) from!1960)))))

(declare-fun b!1351206 () Bool)

(declare-fun Unit!44152 () Unit!44142)

(assert (=> b!1351206 (= e!768752 Unit!44152)))

(declare-fun b!1351207 () Bool)

(assert (=> b!1351207 (= e!768751 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597149) (select (arr!44513 _keys!1571) from!1960))))))

(assert (= (and d!145253 c!127063) b!1351205))

(assert (= (and d!145253 (not c!127063)) b!1351206))

(assert (= (and d!145253 (not res!896012)) b!1351207))

(assert (=> d!145253 m!1238285))

(declare-fun m!1238795 () Bool)

(assert (=> d!145253 m!1238795))

(assert (=> b!1351205 m!1238285))

(declare-fun m!1238797 () Bool)

(assert (=> b!1351205 m!1238797))

(assert (=> b!1351205 m!1238285))

(declare-fun m!1238799 () Bool)

(assert (=> b!1351205 m!1238799))

(assert (=> b!1351205 m!1238799))

(declare-fun m!1238801 () Bool)

(assert (=> b!1351205 m!1238801))

(assert (=> b!1351207 m!1238285))

(assert (=> b!1351207 m!1238799))

(assert (=> b!1351207 m!1238799))

(assert (=> b!1351207 m!1238801))

(assert (=> b!1351029 d!145253))

(declare-fun d!145255 () Bool)

(declare-fun e!768753 () Bool)

(assert (=> d!145255 e!768753))

(declare-fun res!896013 () Bool)

(assert (=> d!145255 (=> res!896013 e!768753)))

(declare-fun lt!597315 () Bool)

(assert (=> d!145255 (= res!896013 (not lt!597315))))

(declare-fun lt!597317 () Bool)

(assert (=> d!145255 (= lt!597315 lt!597317)))

(declare-fun lt!597316 () Unit!44142)

(declare-fun e!768754 () Unit!44142)

(assert (=> d!145255 (= lt!597316 e!768754)))

(declare-fun c!127064 () Bool)

(assert (=> d!145255 (= c!127064 lt!597317)))

(assert (=> d!145255 (= lt!597317 (containsKey!746 (toList!11044 lt!597184) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!145255 (= (contains!9239 lt!597184 #b1000000000000000000000000000000000000000000000000000000000000000) lt!597315)))

(declare-fun b!1351208 () Bool)

(declare-fun lt!597318 () Unit!44142)

(assert (=> b!1351208 (= e!768754 lt!597318)))

(assert (=> b!1351208 (= lt!597318 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 lt!597184) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1351208 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597184) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351209 () Bool)

(declare-fun Unit!44153 () Unit!44142)

(assert (=> b!1351209 (= e!768754 Unit!44153)))

(declare-fun b!1351210 () Bool)

(assert (=> b!1351210 (= e!768753 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145255 c!127064) b!1351208))

(assert (= (and d!145255 (not c!127064)) b!1351209))

(assert (= (and d!145255 (not res!896013)) b!1351210))

(declare-fun m!1238803 () Bool)

(assert (=> d!145255 m!1238803))

(declare-fun m!1238805 () Bool)

(assert (=> b!1351208 m!1238805))

(assert (=> b!1351208 m!1238485))

(assert (=> b!1351208 m!1238485))

(declare-fun m!1238807 () Bool)

(assert (=> b!1351208 m!1238807))

(assert (=> b!1351210 m!1238485))

(assert (=> b!1351210 m!1238485))

(assert (=> b!1351210 m!1238807))

(assert (=> bm!65295 d!145255))

(declare-fun bm!65301 () Bool)

(declare-fun c!127065 () Bool)

(declare-fun call!65304 () Bool)

(assert (=> bm!65301 (= call!65304 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!127065 (Cons!31524 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!127003 (Cons!31524 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) Nil!31525) Nil!31525)) (ite c!127003 (Cons!31524 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) Nil!31525) Nil!31525))))))

(declare-fun b!1351212 () Bool)

(declare-fun e!768756 () Bool)

(assert (=> b!1351212 (= e!768756 call!65304)))

(declare-fun b!1351213 () Bool)

(declare-fun e!768755 () Bool)

(declare-fun e!768757 () Bool)

(assert (=> b!1351213 (= e!768755 e!768757)))

(declare-fun res!896015 () Bool)

(assert (=> b!1351213 (=> (not res!896015) (not e!768757))))

(declare-fun e!768758 () Bool)

(assert (=> b!1351213 (= res!896015 (not e!768758))))

(declare-fun res!896014 () Bool)

(assert (=> b!1351213 (=> (not res!896014) (not e!768758))))

(assert (=> b!1351213 (= res!896014 (validKeyInArray!0 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1351214 () Bool)

(assert (=> b!1351214 (= e!768756 call!65304)))

(declare-fun b!1351215 () Bool)

(assert (=> b!1351215 (= e!768758 (contains!9241 (ite c!127003 (Cons!31524 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) Nil!31525) Nil!31525) (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1351211 () Bool)

(assert (=> b!1351211 (= e!768757 e!768756)))

(assert (=> b!1351211 (= c!127065 (validKeyInArray!0 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!145257 () Bool)

(declare-fun res!896016 () Bool)

(assert (=> d!145257 (=> res!896016 e!768755)))

(assert (=> d!145257 (= res!896016 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45064 _keys!1571)))))

(assert (=> d!145257 (= (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127003 (Cons!31524 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) Nil!31525) Nil!31525)) e!768755)))

(assert (= (and d!145257 (not res!896016)) b!1351213))

(assert (= (and b!1351213 res!896014) b!1351215))

(assert (= (and b!1351213 res!896015) b!1351211))

(assert (= (and b!1351211 c!127065) b!1351212))

(assert (= (and b!1351211 (not c!127065)) b!1351214))

(assert (= (or b!1351212 b!1351214) bm!65301))

(declare-fun m!1238809 () Bool)

(assert (=> bm!65301 m!1238809))

(declare-fun m!1238811 () Bool)

(assert (=> bm!65301 m!1238811))

(assert (=> b!1351213 m!1238809))

(assert (=> b!1351213 m!1238809))

(declare-fun m!1238813 () Bool)

(assert (=> b!1351213 m!1238813))

(assert (=> b!1351215 m!1238809))

(assert (=> b!1351215 m!1238809))

(declare-fun m!1238815 () Bool)

(assert (=> b!1351215 m!1238815))

(assert (=> b!1351211 m!1238809))

(assert (=> b!1351211 m!1238809))

(assert (=> b!1351211 m!1238813))

(assert (=> bm!65265 d!145257))

(assert (=> b!1351051 d!145245))

(assert (=> b!1351051 d!145247))

(declare-fun d!145259 () Bool)

(declare-fun e!768759 () Bool)

(assert (=> d!145259 e!768759))

(declare-fun res!896017 () Bool)

(assert (=> d!145259 (=> res!896017 e!768759)))

(declare-fun lt!597319 () Bool)

(assert (=> d!145259 (= res!896017 (not lt!597319))))

(declare-fun lt!597321 () Bool)

(assert (=> d!145259 (= lt!597319 lt!597321)))

(declare-fun lt!597320 () Unit!44142)

(declare-fun e!768760 () Unit!44142)

(assert (=> d!145259 (= lt!597320 e!768760)))

(declare-fun c!127066 () Bool)

(assert (=> d!145259 (= c!127066 lt!597321)))

(assert (=> d!145259 (= lt!597321 (containsKey!746 (toList!11044 lt!597149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!145259 (= (contains!9239 lt!597149 #b1000000000000000000000000000000000000000000000000000000000000000) lt!597319)))

(declare-fun b!1351216 () Bool)

(declare-fun lt!597322 () Unit!44142)

(assert (=> b!1351216 (= e!768760 lt!597322)))

(assert (=> b!1351216 (= lt!597322 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 lt!597149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1351216 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351217 () Bool)

(declare-fun Unit!44154 () Unit!44142)

(assert (=> b!1351217 (= e!768760 Unit!44154)))

(declare-fun b!1351218 () Bool)

(assert (=> b!1351218 (= e!768759 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145259 c!127066) b!1351216))

(assert (= (and d!145259 (not c!127066)) b!1351217))

(assert (= (and d!145259 (not res!896017)) b!1351218))

(declare-fun m!1238817 () Bool)

(assert (=> d!145259 m!1238817))

(declare-fun m!1238819 () Bool)

(assert (=> b!1351216 m!1238819))

(declare-fun m!1238821 () Bool)

(assert (=> b!1351216 m!1238821))

(assert (=> b!1351216 m!1238821))

(declare-fun m!1238823 () Bool)

(assert (=> b!1351216 m!1238823))

(assert (=> b!1351218 m!1238821))

(assert (=> b!1351218 m!1238821))

(assert (=> b!1351218 m!1238823))

(assert (=> bm!65285 d!145259))

(declare-fun d!145261 () Bool)

(assert (=> d!145261 (= (apply!1050 lt!597184 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22513 (getValueByKey!720 (toList!11044 lt!597184) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38720 () Bool)

(assert (= bs!38720 d!145261))

(assert (=> bs!38720 m!1238649))

(assert (=> bs!38720 m!1238649))

(declare-fun m!1238825 () Bool)

(assert (=> bs!38720 m!1238825))

(assert (=> b!1351064 d!145261))

(declare-fun d!145263 () Bool)

(assert (=> d!145263 (= (apply!1050 lt!597149 (select (arr!44513 _keys!1571) from!1960)) (get!22513 (getValueByKey!720 (toList!11044 lt!597149) (select (arr!44513 _keys!1571) from!1960))))))

(declare-fun bs!38721 () Bool)

(assert (= bs!38721 d!145263))

(assert (=> bs!38721 m!1238285))

(assert (=> bs!38721 m!1238799))

(assert (=> bs!38721 m!1238799))

(declare-fun m!1238827 () Bool)

(assert (=> bs!38721 m!1238827))

(assert (=> b!1351016 d!145263))

(declare-fun d!145265 () Bool)

(declare-fun c!127069 () Bool)

(assert (=> d!145265 (= c!127069 ((_ is ValueCellFull!17897) (select (arr!44512 _values!1303) from!1960)))))

(declare-fun e!768763 () V!55225)

(assert (=> d!145265 (= (get!22512 (select (arr!44512 _values!1303) from!1960) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!768763)))

(declare-fun b!1351223 () Bool)

(declare-fun get!22514 (ValueCell!17897 V!55225) V!55225)

(assert (=> b!1351223 (= e!768763 (get!22514 (select (arr!44512 _values!1303) from!1960) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351224 () Bool)

(declare-fun get!22515 (ValueCell!17897 V!55225) V!55225)

(assert (=> b!1351224 (= e!768763 (get!22515 (select (arr!44512 _values!1303) from!1960) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145265 c!127069) b!1351223))

(assert (= (and d!145265 (not c!127069)) b!1351224))

(assert (=> b!1351223 m!1238357))

(assert (=> b!1351223 m!1238359))

(declare-fun m!1238829 () Bool)

(assert (=> b!1351223 m!1238829))

(assert (=> b!1351224 m!1238357))

(assert (=> b!1351224 m!1238359))

(declare-fun m!1238831 () Bool)

(assert (=> b!1351224 m!1238831))

(assert (=> b!1351016 d!145265))

(assert (=> b!1350960 d!145251))

(declare-fun d!145267 () Bool)

(assert (=> d!145267 (arrayContainsKey!0 _keys!1571 lt!597172 #b00000000000000000000000000000000)))

(declare-fun lt!597325 () Unit!44142)

(declare-fun choose!13 (array!92131 (_ BitVec 64) (_ BitVec 32)) Unit!44142)

(assert (=> d!145267 (= lt!597325 (choose!13 _keys!1571 lt!597172 #b00000000000000000000000000000000))))

(assert (=> d!145267 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!145267 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!597172 #b00000000000000000000000000000000) lt!597325)))

(declare-fun bs!38722 () Bool)

(assert (= bs!38722 d!145267))

(assert (=> bs!38722 m!1238413))

(declare-fun m!1238833 () Bool)

(assert (=> bs!38722 m!1238833))

(assert (=> b!1351046 d!145267))

(declare-fun d!145269 () Bool)

(declare-fun res!896022 () Bool)

(declare-fun e!768768 () Bool)

(assert (=> d!145269 (=> res!896022 e!768768)))

(assert (=> d!145269 (= res!896022 (= (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) lt!597172))))

(assert (=> d!145269 (= (arrayContainsKey!0 _keys!1571 lt!597172 #b00000000000000000000000000000000) e!768768)))

(declare-fun b!1351229 () Bool)

(declare-fun e!768769 () Bool)

(assert (=> b!1351229 (= e!768768 e!768769)))

(declare-fun res!896023 () Bool)

(assert (=> b!1351229 (=> (not res!896023) (not e!768769))))

(assert (=> b!1351229 (= res!896023 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45064 _keys!1571)))))

(declare-fun b!1351230 () Bool)

(assert (=> b!1351230 (= e!768769 (arrayContainsKey!0 _keys!1571 lt!597172 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!145269 (not res!896022)) b!1351229))

(assert (= (and b!1351229 res!896023) b!1351230))

(assert (=> d!145269 m!1238341))

(declare-fun m!1238835 () Bool)

(assert (=> b!1351230 m!1238835))

(assert (=> b!1351046 d!145269))

(declare-fun b!1351243 () Bool)

(declare-fun c!127078 () Bool)

(declare-fun lt!597334 () (_ BitVec 64))

(assert (=> b!1351243 (= c!127078 (= lt!597334 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768777 () SeekEntryResult!10016)

(declare-fun e!768778 () SeekEntryResult!10016)

(assert (=> b!1351243 (= e!768777 e!768778)))

(declare-fun b!1351244 () Bool)

(declare-fun e!768776 () SeekEntryResult!10016)

(assert (=> b!1351244 (= e!768776 e!768777)))

(declare-fun lt!597333 () SeekEntryResult!10016)

(assert (=> b!1351244 (= lt!597334 (select (arr!44513 _keys!1571) (index!42437 lt!597333)))))

(declare-fun c!127077 () Bool)

(assert (=> b!1351244 (= c!127077 (= lt!597334 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun d!145271 () Bool)

(declare-fun lt!597332 () SeekEntryResult!10016)

(assert (=> d!145271 (and (or ((_ is Undefined!10016) lt!597332) (not ((_ is Found!10016) lt!597332)) (and (bvsge (index!42436 lt!597332) #b00000000000000000000000000000000) (bvslt (index!42436 lt!597332) (size!45064 _keys!1571)))) (or ((_ is Undefined!10016) lt!597332) ((_ is Found!10016) lt!597332) (not ((_ is MissingZero!10016) lt!597332)) (and (bvsge (index!42435 lt!597332) #b00000000000000000000000000000000) (bvslt (index!42435 lt!597332) (size!45064 _keys!1571)))) (or ((_ is Undefined!10016) lt!597332) ((_ is Found!10016) lt!597332) ((_ is MissingZero!10016) lt!597332) (not ((_ is MissingVacant!10016) lt!597332)) (and (bvsge (index!42438 lt!597332) #b00000000000000000000000000000000) (bvslt (index!42438 lt!597332) (size!45064 _keys!1571)))) (or ((_ is Undefined!10016) lt!597332) (ite ((_ is Found!10016) lt!597332) (= (select (arr!44513 _keys!1571) (index!42436 lt!597332)) (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10016) lt!597332) (= (select (arr!44513 _keys!1571) (index!42435 lt!597332)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10016) lt!597332) (= (select (arr!44513 _keys!1571) (index!42438 lt!597332)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!145271 (= lt!597332 e!768776)))

(declare-fun c!127076 () Bool)

(assert (=> d!145271 (= c!127076 (and ((_ is Intermediate!10016) lt!597333) (undefined!10828 lt!597333)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!92131 (_ BitVec 32)) SeekEntryResult!10016)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!145271 (= lt!597333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) mask!1977) (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (=> d!145271 (validMask!0 mask!1977)))

(assert (=> d!145271 (= (seekEntryOrOpen!0 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) lt!597332)))

(declare-fun b!1351245 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!92131 (_ BitVec 32)) SeekEntryResult!10016)

(assert (=> b!1351245 (= e!768778 (seekKeyOrZeroReturnVacant!0 (x!120757 lt!597333) (index!42437 lt!597333) (index!42437 lt!597333) (select (arr!44513 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(declare-fun b!1351246 () Bool)

(assert (=> b!1351246 (= e!768777 (Found!10016 (index!42437 lt!597333)))))

(declare-fun b!1351247 () Bool)

(assert (=> b!1351247 (= e!768778 (MissingZero!10016 (index!42437 lt!597333)))))

(declare-fun b!1351248 () Bool)

(assert (=> b!1351248 (= e!768776 Undefined!10016)))

(assert (= (and d!145271 c!127076) b!1351248))

(assert (= (and d!145271 (not c!127076)) b!1351244))

(assert (= (and b!1351244 c!127077) b!1351246))

(assert (= (and b!1351244 (not c!127077)) b!1351243))

(assert (= (and b!1351243 c!127078) b!1351247))

(assert (= (and b!1351243 (not c!127078)) b!1351245))

(declare-fun m!1238837 () Bool)

(assert (=> b!1351244 m!1238837))

(declare-fun m!1238839 () Bool)

(assert (=> d!145271 m!1238839))

(declare-fun m!1238841 () Bool)

(assert (=> d!145271 m!1238841))

(assert (=> d!145271 m!1238279))

(declare-fun m!1238843 () Bool)

(assert (=> d!145271 m!1238843))

(declare-fun m!1238845 () Bool)

(assert (=> d!145271 m!1238845))

(assert (=> d!145271 m!1238341))

(declare-fun m!1238847 () Bool)

(assert (=> d!145271 m!1238847))

(assert (=> d!145271 m!1238341))

(assert (=> d!145271 m!1238845))

(assert (=> b!1351245 m!1238341))

(declare-fun m!1238849 () Bool)

(assert (=> b!1351245 m!1238849))

(assert (=> b!1351046 d!145271))

(declare-fun d!145273 () Bool)

(declare-fun e!768779 () Bool)

(assert (=> d!145273 e!768779))

(declare-fun res!896024 () Bool)

(assert (=> d!145273 (=> res!896024 e!768779)))

(declare-fun lt!597335 () Bool)

(assert (=> d!145273 (= res!896024 (not lt!597335))))

(declare-fun lt!597337 () Bool)

(assert (=> d!145273 (= lt!597335 lt!597337)))

(declare-fun lt!597336 () Unit!44142)

(declare-fun e!768780 () Unit!44142)

(assert (=> d!145273 (= lt!597336 e!768780)))

(declare-fun c!127079 () Bool)

(assert (=> d!145273 (= c!127079 lt!597337)))

(assert (=> d!145273 (= lt!597337 (containsKey!746 (toList!11044 lt!597184) (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> d!145273 (= (contains!9239 lt!597184 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) lt!597335)))

(declare-fun b!1351249 () Bool)

(declare-fun lt!597338 () Unit!44142)

(assert (=> b!1351249 (= e!768780 lt!597338)))

(assert (=> b!1351249 (= lt!597338 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11044 lt!597184) (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1351249 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597184) (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1351250 () Bool)

(declare-fun Unit!44155 () Unit!44142)

(assert (=> b!1351250 (= e!768780 Unit!44155)))

(declare-fun b!1351251 () Bool)

(assert (=> b!1351251 (= e!768779 (isDefined!529 (getValueByKey!720 (toList!11044 lt!597184) (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(assert (= (and d!145273 c!127079) b!1351249))

(assert (= (and d!145273 (not c!127079)) b!1351250))

(assert (= (and d!145273 (not res!896024)) b!1351251))

(assert (=> d!145273 m!1238431))

(declare-fun m!1238851 () Bool)

(assert (=> d!145273 m!1238851))

(assert (=> b!1351249 m!1238431))

(declare-fun m!1238853 () Bool)

(assert (=> b!1351249 m!1238853))

(assert (=> b!1351249 m!1238431))

(declare-fun m!1238855 () Bool)

(assert (=> b!1351249 m!1238855))

(assert (=> b!1351249 m!1238855))

(declare-fun m!1238857 () Bool)

(assert (=> b!1351249 m!1238857))

(assert (=> b!1351251 m!1238431))

(assert (=> b!1351251 m!1238855))

(assert (=> b!1351251 m!1238855))

(assert (=> b!1351251 m!1238857))

(assert (=> b!1351067 d!145273))

(assert (=> b!1351015 d!145141))

(declare-fun d!145275 () Bool)

(assert (=> d!145275 (= (apply!1050 lt!597149 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22513 (getValueByKey!720 (toList!11044 lt!597149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38723 () Bool)

(assert (= bs!38723 d!145275))

(assert (=> bs!38723 m!1238821))

(assert (=> bs!38723 m!1238821))

(declare-fun m!1238859 () Bool)

(assert (=> bs!38723 m!1238859))

(assert (=> b!1351033 d!145275))

(declare-fun b!1351252 () Bool)

(declare-fun e!768783 () Bool)

(declare-fun call!65305 () Bool)

(assert (=> b!1351252 (= e!768783 call!65305)))

(declare-fun b!1351253 () Bool)

(declare-fun e!768781 () Bool)

(assert (=> b!1351253 (= e!768781 e!768783)))

(declare-fun lt!597341 () (_ BitVec 64))

(assert (=> b!1351253 (= lt!597341 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!597340 () Unit!44142)

(assert (=> b!1351253 (= lt!597340 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!597341 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1351253 (arrayContainsKey!0 _keys!1571 lt!597341 #b00000000000000000000000000000000)))

(declare-fun lt!597339 () Unit!44142)

(assert (=> b!1351253 (= lt!597339 lt!597340)))

(declare-fun res!896026 () Bool)

(assert (=> b!1351253 (= res!896026 (= (seekEntryOrOpen!0 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1571 mask!1977) (Found!10016 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1351253 (=> (not res!896026) (not e!768783))))

(declare-fun b!1351254 () Bool)

(assert (=> b!1351254 (= e!768781 call!65305)))

(declare-fun b!1351255 () Bool)

(declare-fun e!768782 () Bool)

(assert (=> b!1351255 (= e!768782 e!768781)))

(declare-fun c!127080 () Bool)

(assert (=> b!1351255 (= c!127080 (validKeyInArray!0 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!145277 () Bool)

(declare-fun res!896025 () Bool)

(assert (=> d!145277 (=> res!896025 e!768782)))

(assert (=> d!145277 (= res!896025 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45064 _keys!1571)))))

(assert (=> d!145277 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977) e!768782)))

(declare-fun bm!65302 () Bool)

(assert (=> bm!65302 (= call!65305 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(assert (= (and d!145277 (not res!896025)) b!1351255))

(assert (= (and b!1351255 c!127080) b!1351253))

(assert (= (and b!1351255 (not c!127080)) b!1351254))

(assert (= (and b!1351253 res!896026) b!1351252))

(assert (= (or b!1351252 b!1351254) bm!65302))

(assert (=> b!1351253 m!1238809))

(declare-fun m!1238861 () Bool)

(assert (=> b!1351253 m!1238861))

(declare-fun m!1238863 () Bool)

(assert (=> b!1351253 m!1238863))

(assert (=> b!1351253 m!1238809))

(declare-fun m!1238865 () Bool)

(assert (=> b!1351253 m!1238865))

(assert (=> b!1351255 m!1238809))

(assert (=> b!1351255 m!1238809))

(assert (=> b!1351255 m!1238813))

(declare-fun m!1238867 () Bool)

(assert (=> bm!65302 m!1238867))

(assert (=> bm!65289 d!145277))

(assert (=> b!1351017 d!145141))

(declare-fun d!145279 () Bool)

(declare-fun e!768784 () Bool)

(assert (=> d!145279 e!768784))

(declare-fun res!896027 () Bool)

(assert (=> d!145279 (=> (not res!896027) (not e!768784))))

(declare-fun lt!597343 () ListLongMap!22057)

(assert (=> d!145279 (= res!896027 (contains!9239 lt!597343 (_1!12207 (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!597344 () List!31527)

(assert (=> d!145279 (= lt!597343 (ListLongMap!22058 lt!597344))))

(declare-fun lt!597342 () Unit!44142)

(declare-fun lt!597345 () Unit!44142)

(assert (=> d!145279 (= lt!597342 lt!597345)))

(assert (=> d!145279 (= (getValueByKey!720 lt!597344 (_1!12207 (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!770 (_2!12207 (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!145279 (= lt!597345 (lemmaContainsTupThenGetReturnValue!370 lt!597344 (_1!12207 (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12207 (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!145279 (= lt!597344 (insertStrictlySorted!499 (toList!11044 (ite c!127022 call!65285 (ite c!127020 call!65283 call!65289))) (_1!12207 (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12207 (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!145279 (= (+!4896 (ite c!127022 call!65285 (ite c!127020 call!65283 call!65289)) (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!597343)))

(declare-fun b!1351256 () Bool)

(declare-fun res!896028 () Bool)

(assert (=> b!1351256 (=> (not res!896028) (not e!768784))))

(assert (=> b!1351256 (= res!896028 (= (getValueByKey!720 (toList!11044 lt!597343) (_1!12207 (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!770 (_2!12207 (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1351257 () Bool)

(assert (=> b!1351257 (= e!768784 (contains!9242 (toList!11044 lt!597343) (ite (or c!127022 c!127020) (tuple2!24393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!145279 res!896027) b!1351256))

(assert (= (and b!1351256 res!896028) b!1351257))

(declare-fun m!1238869 () Bool)

(assert (=> d!145279 m!1238869))

(declare-fun m!1238871 () Bool)

(assert (=> d!145279 m!1238871))

(declare-fun m!1238873 () Bool)

(assert (=> d!145279 m!1238873))

(declare-fun m!1238875 () Bool)

(assert (=> d!145279 m!1238875))

(declare-fun m!1238877 () Bool)

(assert (=> b!1351256 m!1238877))

(declare-fun m!1238879 () Bool)

(assert (=> b!1351257 m!1238879))

(assert (=> bm!65281 d!145279))

(declare-fun d!145281 () Bool)

(assert (=> d!145281 (= (apply!1050 lt!597184 (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22513 (getValueByKey!720 (toList!11044 lt!597184) (select (arr!44513 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(declare-fun bs!38724 () Bool)

(assert (= bs!38724 d!145281))

(assert (=> bs!38724 m!1238431))

(assert (=> bs!38724 m!1238855))

(assert (=> bs!38724 m!1238855))

(declare-fun m!1238881 () Bool)

(assert (=> bs!38724 m!1238881))

(assert (=> b!1351054 d!145281))

(declare-fun d!145283 () Bool)

(declare-fun c!127081 () Bool)

(assert (=> d!145283 (= c!127081 ((_ is ValueCellFull!17897) (select (arr!44512 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun e!768785 () V!55225)

(assert (=> d!145283 (= (get!22512 (select (arr!44512 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!768785)))

(declare-fun b!1351258 () Bool)

(assert (=> b!1351258 (= e!768785 (get!22514 (select (arr!44512 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351259 () Bool)

(assert (=> b!1351259 (= e!768785 (get!22515 (select (arr!44512 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3850 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!145283 c!127081) b!1351258))

(assert (= (and d!145283 (not c!127081)) b!1351259))

(assert (=> b!1351258 m!1238427))

(assert (=> b!1351258 m!1238359))

(declare-fun m!1238883 () Bool)

(assert (=> b!1351258 m!1238883))

(assert (=> b!1351259 m!1238427))

(assert (=> b!1351259 m!1238359))

(declare-fun m!1238885 () Bool)

(assert (=> b!1351259 m!1238885))

(assert (=> b!1351054 d!145283))

(declare-fun d!145285 () Bool)

(declare-fun lt!597348 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!666 (List!31528) (InoxSet (_ BitVec 64)))

(assert (=> d!145285 (= lt!597348 (select (content!666 Nil!31525) (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun e!768791 () Bool)

(assert (=> d!145285 (= lt!597348 e!768791)))

(declare-fun res!896034 () Bool)

(assert (=> d!145285 (=> (not res!896034) (not e!768791))))

(assert (=> d!145285 (= res!896034 ((_ is Cons!31524) Nil!31525))))

(assert (=> d!145285 (= (contains!9241 Nil!31525 (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)) lt!597348)))

(declare-fun b!1351264 () Bool)

(declare-fun e!768790 () Bool)

(assert (=> b!1351264 (= e!768791 e!768790)))

(declare-fun res!896033 () Bool)

(assert (=> b!1351264 (=> res!896033 e!768790)))

(assert (=> b!1351264 (= res!896033 (= (h!32742 Nil!31525) (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1351265 () Bool)

(assert (=> b!1351265 (= e!768790 (contains!9241 (t!46176 Nil!31525) (select (arr!44513 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!145285 res!896034) b!1351264))

(assert (= (and b!1351264 (not res!896033)) b!1351265))

(declare-fun m!1238887 () Bool)

(assert (=> d!145285 m!1238887))

(assert (=> d!145285 m!1238341))

(declare-fun m!1238889 () Bool)

(assert (=> d!145285 m!1238889))

(assert (=> b!1351265 m!1238341))

(declare-fun m!1238891 () Bool)

(assert (=> b!1351265 m!1238891))

(assert (=> b!1350962 d!145285))

(assert (=> b!1351048 d!145251))

(assert (=> b!1351053 d!145159))

(declare-fun mapIsEmpty!58117 () Bool)

(declare-fun mapRes!58117 () Bool)

(assert (=> mapIsEmpty!58117 mapRes!58117))

(declare-fun b!1351266 () Bool)

(declare-fun e!768793 () Bool)

(assert (=> b!1351266 (= e!768793 tp_is_empty!37591)))

(declare-fun mapNonEmpty!58117 () Bool)

(declare-fun tp!110608 () Bool)

(assert (=> mapNonEmpty!58117 (= mapRes!58117 (and tp!110608 e!768793))))

(declare-fun mapValue!58117 () ValueCell!17897)

(declare-fun mapRest!58117 () (Array (_ BitVec 32) ValueCell!17897))

(declare-fun mapKey!58117 () (_ BitVec 32))

(assert (=> mapNonEmpty!58117 (= mapRest!58116 (store mapRest!58117 mapKey!58117 mapValue!58117))))

(declare-fun condMapEmpty!58117 () Bool)

(declare-fun mapDefault!58117 () ValueCell!17897)

(assert (=> mapNonEmpty!58116 (= condMapEmpty!58117 (= mapRest!58116 ((as const (Array (_ BitVec 32) ValueCell!17897)) mapDefault!58117)))))

(declare-fun e!768792 () Bool)

(assert (=> mapNonEmpty!58116 (= tp!110607 (and e!768792 mapRes!58117))))

(declare-fun b!1351267 () Bool)

(assert (=> b!1351267 (= e!768792 tp_is_empty!37591)))

(assert (= (and mapNonEmpty!58116 condMapEmpty!58117) mapIsEmpty!58117))

(assert (= (and mapNonEmpty!58116 (not condMapEmpty!58117)) mapNonEmpty!58117))

(assert (= (and mapNonEmpty!58117 ((_ is ValueCellFull!17897) mapValue!58117)) b!1351266))

(assert (= (and mapNonEmpty!58116 ((_ is ValueCellFull!17897) mapDefault!58117)) b!1351267))

(declare-fun m!1238893 () Bool)

(assert (=> mapNonEmpty!58117 m!1238893))

(declare-fun b_lambda!24729 () Bool)

(assert (= b_lambda!24721 (or (and start!113930 b_free!31591) b_lambda!24729)))

(declare-fun b_lambda!24731 () Bool)

(assert (= b_lambda!24727 (or (and start!113930 b_free!31591) b_lambda!24731)))

(declare-fun b_lambda!24733 () Bool)

(assert (= b_lambda!24725 (or (and start!113930 b_free!31591) b_lambda!24733)))

(declare-fun b_lambda!24735 () Bool)

(assert (= b_lambda!24723 (or (and start!113930 b_free!31591) b_lambda!24735)))

(check-sat (not b!1351186) (not d!145173) (not d!145239) (not d!145225) (not d!145217) (not d!145253) (not d!145203) (not d!145271) (not b!1351181) (not b!1351159) (not b!1351150) (not d!145161) (not d!145181) (not b!1351164) (not b!1351208) (not b!1351211) (not b_lambda!24733) (not d!145223) (not b!1351215) (not b!1351178) (not b!1351105) (not b!1351103) (not b!1351195) (not b!1351142) (not b!1351187) (not b!1351165) (not b!1351190) (not d!145243) (not b!1351137) (not b_lambda!24735) (not d!145249) (not d!145205) (not b!1351194) (not b!1351200) (not b!1351205) (not d!145237) (not d!145157) (not b!1351249) (not b!1351191) (not b!1351218) (not d!145231) (not b!1351224) (not d!145183) (not d!145215) (not d!145273) (not b!1351207) (not b!1351258) (not d!145275) (not b!1351081) (not b!1351230) (not bm!65300) (not b!1351104) (not d!145187) (not b!1351210) (not b!1351183) (not d!145245) (not d!145279) (not b!1351180) (not b!1351199) (not b!1351196) (not b!1351143) (not d!145175) (not b!1351155) (not b!1351253) (not d!145227) tp_is_empty!37591 (not b!1351157) (not d!145197) (not b!1351153) (not b!1351145) (not d!145211) (not b!1351223) (not d!145189) (not d!145261) (not b!1351107) (not d!145263) (not b!1351097) (not b!1351163) (not b!1351083) (not b!1351255) (not b!1351106) (not b!1351108) (not b!1351257) (not b_lambda!24729) (not d!145195) (not b!1351185) (not d!145193) (not b!1351149) (not b!1351086) (not b!1351148) (not d!145235) (not b!1351256) (not b!1351251) (not b!1351192) (not b!1351161) (not b!1351141) (not d!145219) (not b_next!31591) (not d!145179) (not bm!65299) (not d!145281) (not b_lambda!24719) (not b!1351156) (not b!1351203) (not b!1351179) (not d!145255) (not b!1351174) (not d!145267) (not b!1351216) (not d!145209) (not d!145259) (not d!145229) (not d!145213) (not b!1351182) (not b!1351189) (not d!145285) (not d!145169) (not bm!65301) (not b!1351171) (not b!1351146) (not d!145191) (not d!145177) (not d!145221) (not b!1351213) (not d!145171) (not b!1351144) (not b_lambda!24731) (not mapNonEmpty!58117) (not d!145185) (not d!145167) (not b!1351265) (not d!145155) (not b!1351188) (not bm!65302) (not b_lambda!24717) (not d!145163) (not d!145201) (not b!1351152) b_and!51007 (not b!1351245) (not d!145233) (not b!1351259) (not d!145199))
(check-sat b_and!51007 (not b_next!31591))
