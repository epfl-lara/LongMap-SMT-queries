; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97068 () Bool)

(assert start!97068)

(declare-fun b!1104107 () Bool)

(declare-fun e!630246 () Bool)

(declare-fun tp_is_empty!27345 () Bool)

(assert (=> b!1104107 (= e!630246 tp_is_empty!27345)))

(declare-fun b!1104108 () Bool)

(declare-fun res!736614 () Bool)

(declare-fun e!630243 () Bool)

(assert (=> b!1104108 (=> (not res!736614) (not e!630243))))

(declare-datatypes ((array!71611 0))(
  ( (array!71612 (arr!34461 (Array (_ BitVec 32) (_ BitVec 64))) (size!34997 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71611)

(assert (=> b!1104108 (= res!736614 (and (bvsle #b00000000000000000000000000000000 (size!34997 _keys!1208)) (bvslt (size!34997 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1104109 () Bool)

(declare-fun e!630244 () Bool)

(assert (=> b!1104109 (= e!630244 tp_is_empty!27345)))

(declare-fun b!1104110 () Bool)

(declare-fun e!630245 () Bool)

(declare-fun mapRes!42826 () Bool)

(assert (=> b!1104110 (= e!630245 (and e!630244 mapRes!42826))))

(declare-fun condMapEmpty!42826 () Bool)

(declare-datatypes ((V!41587 0))(
  ( (V!41588 (val!13729 Int)) )
))
(declare-datatypes ((ValueCell!12963 0))(
  ( (ValueCellFull!12963 (v!16361 V!41587)) (EmptyCell!12963) )
))
(declare-datatypes ((array!71613 0))(
  ( (array!71614 (arr!34462 (Array (_ BitVec 32) ValueCell!12963)) (size!34998 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71613)

(declare-fun mapDefault!42826 () ValueCell!12963)

(assert (=> b!1104110 (= condMapEmpty!42826 (= (arr!34462 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12963)) mapDefault!42826)))))

(declare-fun b!1104111 () Bool)

(declare-fun res!736609 () Bool)

(assert (=> b!1104111 (=> (not res!736609) (not e!630243))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104111 (= res!736609 (validMask!0 mask!1564))))

(declare-fun b!1104112 () Bool)

(declare-fun res!736607 () Bool)

(assert (=> b!1104112 (=> (not res!736607) (not e!630243))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104112 (= res!736607 (and (= (size!34998 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34997 _keys!1208) (size!34998 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104113 () Bool)

(declare-fun res!736608 () Bool)

(assert (=> b!1104113 (=> (not res!736608) (not e!630243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71611 (_ BitVec 32)) Bool)

(assert (=> b!1104113 (= res!736608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104114 () Bool)

(declare-datatypes ((List!24053 0))(
  ( (Nil!24050) (Cons!24049 (h!25258 (_ BitVec 64)) (t!34318 List!24053)) )
))
(declare-fun noDuplicate!1587 (List!24053) Bool)

(assert (=> b!1104114 (= e!630243 (not (noDuplicate!1587 Nil!24050)))))

(declare-fun mapIsEmpty!42826 () Bool)

(assert (=> mapIsEmpty!42826 mapRes!42826))

(declare-fun b!1104115 () Bool)

(declare-fun res!736615 () Bool)

(assert (=> b!1104115 (=> (not res!736615) (not e!630243))))

(declare-fun arrayNoDuplicates!0 (array!71611 (_ BitVec 32) List!24053) Bool)

(assert (=> b!1104115 (= res!736615 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24050))))

(declare-fun b!1104116 () Bool)

(declare-fun res!736610 () Bool)

(assert (=> b!1104116 (=> (not res!736610) (not e!630243))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104116 (= res!736610 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34997 _keys!1208))))))

(declare-fun mapNonEmpty!42826 () Bool)

(declare-fun tp!81746 () Bool)

(assert (=> mapNonEmpty!42826 (= mapRes!42826 (and tp!81746 e!630246))))

(declare-fun mapKey!42826 () (_ BitVec 32))

(declare-fun mapRest!42826 () (Array (_ BitVec 32) ValueCell!12963))

(declare-fun mapValue!42826 () ValueCell!12963)

(assert (=> mapNonEmpty!42826 (= (arr!34462 _values!996) (store mapRest!42826 mapKey!42826 mapValue!42826))))

(declare-fun b!1104117 () Bool)

(declare-fun res!736612 () Bool)

(assert (=> b!1104117 (=> (not res!736612) (not e!630243))))

(assert (=> b!1104117 (= res!736612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71612 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34997 _keys!1208)) mask!1564))))

(declare-fun b!1104118 () Bool)

(declare-fun res!736616 () Bool)

(assert (=> b!1104118 (=> (not res!736616) (not e!630243))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1104118 (= res!736616 (= (select (arr!34461 _keys!1208) i!673) k0!934))))

(declare-fun b!1104119 () Bool)

(declare-fun res!736613 () Bool)

(assert (=> b!1104119 (=> (not res!736613) (not e!630243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104119 (= res!736613 (validKeyInArray!0 k0!934))))

(declare-fun res!736611 () Bool)

(assert (=> start!97068 (=> (not res!736611) (not e!630243))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97068 (= res!736611 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34997 _keys!1208))))))

(assert (=> start!97068 e!630243))

(declare-fun array_inv!26532 (array!71611) Bool)

(assert (=> start!97068 (array_inv!26532 _keys!1208)))

(assert (=> start!97068 true))

(declare-fun array_inv!26533 (array!71613) Bool)

(assert (=> start!97068 (and (array_inv!26533 _values!996) e!630245)))

(assert (= (and start!97068 res!736611) b!1104111))

(assert (= (and b!1104111 res!736609) b!1104112))

(assert (= (and b!1104112 res!736607) b!1104113))

(assert (= (and b!1104113 res!736608) b!1104115))

(assert (= (and b!1104115 res!736615) b!1104116))

(assert (= (and b!1104116 res!736610) b!1104119))

(assert (= (and b!1104119 res!736613) b!1104118))

(assert (= (and b!1104118 res!736616) b!1104117))

(assert (= (and b!1104117 res!736612) b!1104108))

(assert (= (and b!1104108 res!736614) b!1104114))

(assert (= (and b!1104110 condMapEmpty!42826) mapIsEmpty!42826))

(assert (= (and b!1104110 (not condMapEmpty!42826)) mapNonEmpty!42826))

(get-info :version)

(assert (= (and mapNonEmpty!42826 ((_ is ValueCellFull!12963) mapValue!42826)) b!1104107))

(assert (= (and b!1104110 ((_ is ValueCellFull!12963) mapDefault!42826)) b!1104109))

(assert (= start!97068 b!1104110))

(declare-fun m!1023973 () Bool)

(assert (=> b!1104119 m!1023973))

(declare-fun m!1023975 () Bool)

(assert (=> mapNonEmpty!42826 m!1023975))

(declare-fun m!1023977 () Bool)

(assert (=> b!1104114 m!1023977))

(declare-fun m!1023979 () Bool)

(assert (=> b!1104117 m!1023979))

(declare-fun m!1023981 () Bool)

(assert (=> b!1104117 m!1023981))

(declare-fun m!1023983 () Bool)

(assert (=> b!1104113 m!1023983))

(declare-fun m!1023985 () Bool)

(assert (=> b!1104118 m!1023985))

(declare-fun m!1023987 () Bool)

(assert (=> start!97068 m!1023987))

(declare-fun m!1023989 () Bool)

(assert (=> start!97068 m!1023989))

(declare-fun m!1023991 () Bool)

(assert (=> b!1104115 m!1023991))

(declare-fun m!1023993 () Bool)

(assert (=> b!1104111 m!1023993))

(check-sat (not b!1104114) (not start!97068) (not b!1104117) (not b!1104115) (not mapNonEmpty!42826) (not b!1104113) (not b!1104119) (not b!1104111) tp_is_empty!27345)
(check-sat)
(get-model)

(declare-fun d!130867 () Bool)

(assert (=> d!130867 (= (array_inv!26532 _keys!1208) (bvsge (size!34997 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97068 d!130867))

(declare-fun d!130869 () Bool)

(assert (=> d!130869 (= (array_inv!26533 _values!996) (bvsge (size!34998 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97068 d!130869))

(declare-fun d!130871 () Bool)

(declare-fun res!736651 () Bool)

(declare-fun e!630266 () Bool)

(assert (=> d!130871 (=> res!736651 e!630266)))

(assert (=> d!130871 (= res!736651 ((_ is Nil!24050) Nil!24050))))

(assert (=> d!130871 (= (noDuplicate!1587 Nil!24050) e!630266)))

(declare-fun b!1104163 () Bool)

(declare-fun e!630267 () Bool)

(assert (=> b!1104163 (= e!630266 e!630267)))

(declare-fun res!736652 () Bool)

(assert (=> b!1104163 (=> (not res!736652) (not e!630267))))

(declare-fun contains!6415 (List!24053 (_ BitVec 64)) Bool)

(assert (=> b!1104163 (= res!736652 (not (contains!6415 (t!34318 Nil!24050) (h!25258 Nil!24050))))))

(declare-fun b!1104164 () Bool)

(assert (=> b!1104164 (= e!630267 (noDuplicate!1587 (t!34318 Nil!24050)))))

(assert (= (and d!130871 (not res!736651)) b!1104163))

(assert (= (and b!1104163 res!736652) b!1104164))

(declare-fun m!1024017 () Bool)

(assert (=> b!1104163 m!1024017))

(declare-fun m!1024019 () Bool)

(assert (=> b!1104164 m!1024019))

(assert (=> b!1104114 d!130871))

(declare-fun b!1104173 () Bool)

(declare-fun e!630274 () Bool)

(declare-fun call!46335 () Bool)

(assert (=> b!1104173 (= e!630274 call!46335)))

(declare-fun b!1104174 () Bool)

(declare-fun e!630276 () Bool)

(assert (=> b!1104174 (= e!630276 call!46335)))

(declare-fun b!1104175 () Bool)

(assert (=> b!1104175 (= e!630276 e!630274)))

(declare-fun lt!495111 () (_ BitVec 64))

(assert (=> b!1104175 (= lt!495111 (select (arr!34461 (array!71612 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34997 _keys!1208))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36248 0))(
  ( (Unit!36249) )
))
(declare-fun lt!495110 () Unit!36248)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71611 (_ BitVec 64) (_ BitVec 32)) Unit!36248)

(assert (=> b!1104175 (= lt!495110 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71612 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34997 _keys!1208)) lt!495111 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104175 (arrayContainsKey!0 (array!71612 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34997 _keys!1208)) lt!495111 #b00000000000000000000000000000000)))

(declare-fun lt!495112 () Unit!36248)

(assert (=> b!1104175 (= lt!495112 lt!495110)))

(declare-fun res!736657 () Bool)

(declare-datatypes ((SeekEntryResult!9922 0))(
  ( (MissingZero!9922 (index!42059 (_ BitVec 32))) (Found!9922 (index!42060 (_ BitVec 32))) (Intermediate!9922 (undefined!10734 Bool) (index!42061 (_ BitVec 32)) (x!99311 (_ BitVec 32))) (Undefined!9922) (MissingVacant!9922 (index!42062 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71611 (_ BitVec 32)) SeekEntryResult!9922)

(assert (=> b!1104175 (= res!736657 (= (seekEntryOrOpen!0 (select (arr!34461 (array!71612 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34997 _keys!1208))) #b00000000000000000000000000000000) (array!71612 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34997 _keys!1208)) mask!1564) (Found!9922 #b00000000000000000000000000000000)))))

(assert (=> b!1104175 (=> (not res!736657) (not e!630274))))

(declare-fun bm!46332 () Bool)

(assert (=> bm!46332 (= call!46335 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!71612 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34997 _keys!1208)) mask!1564))))

(declare-fun b!1104176 () Bool)

(declare-fun e!630275 () Bool)

(assert (=> b!1104176 (= e!630275 e!630276)))

(declare-fun c!108989 () Bool)

(assert (=> b!1104176 (= c!108989 (validKeyInArray!0 (select (arr!34461 (array!71612 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34997 _keys!1208))) #b00000000000000000000000000000000)))))

(declare-fun d!130873 () Bool)

(declare-fun res!736658 () Bool)

(assert (=> d!130873 (=> res!736658 e!630275)))

(assert (=> d!130873 (= res!736658 (bvsge #b00000000000000000000000000000000 (size!34997 (array!71612 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34997 _keys!1208)))))))

(assert (=> d!130873 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71612 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34997 _keys!1208)) mask!1564) e!630275)))

(assert (= (and d!130873 (not res!736658)) b!1104176))

(assert (= (and b!1104176 c!108989) b!1104175))

(assert (= (and b!1104176 (not c!108989)) b!1104174))

(assert (= (and b!1104175 res!736657) b!1104173))

(assert (= (or b!1104173 b!1104174) bm!46332))

(declare-fun m!1024021 () Bool)

(assert (=> b!1104175 m!1024021))

(declare-fun m!1024023 () Bool)

(assert (=> b!1104175 m!1024023))

(declare-fun m!1024025 () Bool)

(assert (=> b!1104175 m!1024025))

(assert (=> b!1104175 m!1024021))

(declare-fun m!1024027 () Bool)

(assert (=> b!1104175 m!1024027))

(declare-fun m!1024029 () Bool)

(assert (=> bm!46332 m!1024029))

(assert (=> b!1104176 m!1024021))

(assert (=> b!1104176 m!1024021))

(declare-fun m!1024031 () Bool)

(assert (=> b!1104176 m!1024031))

(assert (=> b!1104117 d!130873))

(declare-fun b!1104177 () Bool)

(declare-fun e!630277 () Bool)

(declare-fun call!46336 () Bool)

(assert (=> b!1104177 (= e!630277 call!46336)))

(declare-fun b!1104178 () Bool)

(declare-fun e!630279 () Bool)

(assert (=> b!1104178 (= e!630279 call!46336)))

(declare-fun b!1104179 () Bool)

(assert (=> b!1104179 (= e!630279 e!630277)))

(declare-fun lt!495114 () (_ BitVec 64))

(assert (=> b!1104179 (= lt!495114 (select (arr!34461 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!495113 () Unit!36248)

(assert (=> b!1104179 (= lt!495113 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495114 #b00000000000000000000000000000000))))

(assert (=> b!1104179 (arrayContainsKey!0 _keys!1208 lt!495114 #b00000000000000000000000000000000)))

(declare-fun lt!495115 () Unit!36248)

(assert (=> b!1104179 (= lt!495115 lt!495113)))

(declare-fun res!736659 () Bool)

(assert (=> b!1104179 (= res!736659 (= (seekEntryOrOpen!0 (select (arr!34461 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9922 #b00000000000000000000000000000000)))))

(assert (=> b!1104179 (=> (not res!736659) (not e!630277))))

(declare-fun bm!46333 () Bool)

(assert (=> bm!46333 (= call!46336 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1104180 () Bool)

(declare-fun e!630278 () Bool)

(assert (=> b!1104180 (= e!630278 e!630279)))

(declare-fun c!108990 () Bool)

(assert (=> b!1104180 (= c!108990 (validKeyInArray!0 (select (arr!34461 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!130875 () Bool)

(declare-fun res!736660 () Bool)

(assert (=> d!130875 (=> res!736660 e!630278)))

(assert (=> d!130875 (= res!736660 (bvsge #b00000000000000000000000000000000 (size!34997 _keys!1208)))))

(assert (=> d!130875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630278)))

(assert (= (and d!130875 (not res!736660)) b!1104180))

(assert (= (and b!1104180 c!108990) b!1104179))

(assert (= (and b!1104180 (not c!108990)) b!1104178))

(assert (= (and b!1104179 res!736659) b!1104177))

(assert (= (or b!1104177 b!1104178) bm!46333))

(declare-fun m!1024033 () Bool)

(assert (=> b!1104179 m!1024033))

(declare-fun m!1024035 () Bool)

(assert (=> b!1104179 m!1024035))

(declare-fun m!1024037 () Bool)

(assert (=> b!1104179 m!1024037))

(assert (=> b!1104179 m!1024033))

(declare-fun m!1024039 () Bool)

(assert (=> b!1104179 m!1024039))

(declare-fun m!1024041 () Bool)

(assert (=> bm!46333 m!1024041))

(assert (=> b!1104180 m!1024033))

(assert (=> b!1104180 m!1024033))

(declare-fun m!1024043 () Bool)

(assert (=> b!1104180 m!1024043))

(assert (=> b!1104113 d!130875))

(declare-fun d!130877 () Bool)

(assert (=> d!130877 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1104111 d!130877))

(declare-fun b!1104191 () Bool)

(declare-fun e!630290 () Bool)

(declare-fun call!46339 () Bool)

(assert (=> b!1104191 (= e!630290 call!46339)))

(declare-fun b!1104192 () Bool)

(declare-fun e!630291 () Bool)

(assert (=> b!1104192 (= e!630291 (contains!6415 Nil!24050 (select (arr!34461 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104193 () Bool)

(declare-fun e!630288 () Bool)

(assert (=> b!1104193 (= e!630288 e!630290)))

(declare-fun c!108993 () Bool)

(assert (=> b!1104193 (= c!108993 (validKeyInArray!0 (select (arr!34461 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!46336 () Bool)

(assert (=> bm!46336 (= call!46339 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108993 (Cons!24049 (select (arr!34461 _keys!1208) #b00000000000000000000000000000000) Nil!24050) Nil!24050)))))

(declare-fun b!1104194 () Bool)

(declare-fun e!630289 () Bool)

(assert (=> b!1104194 (= e!630289 e!630288)))

(declare-fun res!736667 () Bool)

(assert (=> b!1104194 (=> (not res!736667) (not e!630288))))

(assert (=> b!1104194 (= res!736667 (not e!630291))))

(declare-fun res!736668 () Bool)

(assert (=> b!1104194 (=> (not res!736668) (not e!630291))))

(assert (=> b!1104194 (= res!736668 (validKeyInArray!0 (select (arr!34461 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104195 () Bool)

(assert (=> b!1104195 (= e!630290 call!46339)))

(declare-fun d!130879 () Bool)

(declare-fun res!736669 () Bool)

(assert (=> d!130879 (=> res!736669 e!630289)))

(assert (=> d!130879 (= res!736669 (bvsge #b00000000000000000000000000000000 (size!34997 _keys!1208)))))

(assert (=> d!130879 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24050) e!630289)))

(assert (= (and d!130879 (not res!736669)) b!1104194))

(assert (= (and b!1104194 res!736668) b!1104192))

(assert (= (and b!1104194 res!736667) b!1104193))

(assert (= (and b!1104193 c!108993) b!1104191))

(assert (= (and b!1104193 (not c!108993)) b!1104195))

(assert (= (or b!1104191 b!1104195) bm!46336))

(assert (=> b!1104192 m!1024033))

(assert (=> b!1104192 m!1024033))

(declare-fun m!1024045 () Bool)

(assert (=> b!1104192 m!1024045))

(assert (=> b!1104193 m!1024033))

(assert (=> b!1104193 m!1024033))

(assert (=> b!1104193 m!1024043))

(assert (=> bm!46336 m!1024033))

(declare-fun m!1024047 () Bool)

(assert (=> bm!46336 m!1024047))

(assert (=> b!1104194 m!1024033))

(assert (=> b!1104194 m!1024033))

(assert (=> b!1104194 m!1024043))

(assert (=> b!1104115 d!130879))

(declare-fun d!130881 () Bool)

(assert (=> d!130881 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1104119 d!130881))

(declare-fun b!1104203 () Bool)

(declare-fun e!630296 () Bool)

(assert (=> b!1104203 (= e!630296 tp_is_empty!27345)))

(declare-fun condMapEmpty!42832 () Bool)

(declare-fun mapDefault!42832 () ValueCell!12963)

(assert (=> mapNonEmpty!42826 (= condMapEmpty!42832 (= mapRest!42826 ((as const (Array (_ BitVec 32) ValueCell!12963)) mapDefault!42832)))))

(declare-fun mapRes!42832 () Bool)

(assert (=> mapNonEmpty!42826 (= tp!81746 (and e!630296 mapRes!42832))))

(declare-fun b!1104202 () Bool)

(declare-fun e!630297 () Bool)

(assert (=> b!1104202 (= e!630297 tp_is_empty!27345)))

(declare-fun mapIsEmpty!42832 () Bool)

(assert (=> mapIsEmpty!42832 mapRes!42832))

(declare-fun mapNonEmpty!42832 () Bool)

(declare-fun tp!81752 () Bool)

(assert (=> mapNonEmpty!42832 (= mapRes!42832 (and tp!81752 e!630297))))

(declare-fun mapRest!42832 () (Array (_ BitVec 32) ValueCell!12963))

(declare-fun mapValue!42832 () ValueCell!12963)

(declare-fun mapKey!42832 () (_ BitVec 32))

(assert (=> mapNonEmpty!42832 (= mapRest!42826 (store mapRest!42832 mapKey!42832 mapValue!42832))))

(assert (= (and mapNonEmpty!42826 condMapEmpty!42832) mapIsEmpty!42832))

(assert (= (and mapNonEmpty!42826 (not condMapEmpty!42832)) mapNonEmpty!42832))

(assert (= (and mapNonEmpty!42832 ((_ is ValueCellFull!12963) mapValue!42832)) b!1104202))

(assert (= (and mapNonEmpty!42826 ((_ is ValueCellFull!12963) mapDefault!42832)) b!1104203))

(declare-fun m!1024049 () Bool)

(assert (=> mapNonEmpty!42832 m!1024049))

(check-sat (not b!1104163) (not bm!46332) (not bm!46333) (not b!1104175) (not b!1104176) (not b!1104193) (not b!1104194) (not b!1104192) (not bm!46336) (not b!1104164) (not b!1104179) tp_is_empty!27345 (not b!1104180) (not mapNonEmpty!42832))
(check-sat)
