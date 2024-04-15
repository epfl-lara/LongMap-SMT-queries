; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97138 () Bool)

(assert start!97138)

(declare-fun b!1104931 () Bool)

(declare-fun e!630639 () Bool)

(declare-fun e!630640 () Bool)

(declare-fun mapRes!42901 () Bool)

(assert (=> b!1104931 (= e!630639 (and e!630640 mapRes!42901))))

(declare-fun condMapEmpty!42901 () Bool)

(declare-datatypes ((V!41649 0))(
  ( (V!41650 (val!13752 Int)) )
))
(declare-datatypes ((ValueCell!12986 0))(
  ( (ValueCellFull!12986 (v!16384 V!41649)) (EmptyCell!12986) )
))
(declare-datatypes ((array!71614 0))(
  ( (array!71615 (arr!34461 (Array (_ BitVec 32) ValueCell!12986)) (size!34999 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71614)

(declare-fun mapDefault!42901 () ValueCell!12986)

(assert (=> b!1104931 (= condMapEmpty!42901 (= (arr!34461 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12986)) mapDefault!42901)))))

(declare-fun mapIsEmpty!42901 () Bool)

(assert (=> mapIsEmpty!42901 mapRes!42901))

(declare-fun b!1104932 () Bool)

(declare-fun e!630641 () Bool)

(declare-datatypes ((array!71616 0))(
  ( (array!71617 (arr!34462 (Array (_ BitVec 32) (_ BitVec 64))) (size!35000 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71616)

(assert (=> b!1104932 (= e!630641 (not (or (bvsge #b00000000000000000000000000000000 (size!35000 _keys!1208)) (bvslt (size!35000 _keys!1208) #b01111111111111111111111111111111))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104932 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36079 0))(
  ( (Unit!36080) )
))
(declare-fun lt!495045 () Unit!36079)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71616 (_ BitVec 64) (_ BitVec 32)) Unit!36079)

(assert (=> b!1104932 (= lt!495045 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1104933 () Bool)

(declare-fun res!737265 () Bool)

(declare-fun e!630642 () Bool)

(assert (=> b!1104933 (=> (not res!737265) (not e!630642))))

(assert (=> b!1104933 (= res!737265 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35000 _keys!1208))))))

(declare-fun b!1104934 () Bool)

(declare-fun res!737264 () Bool)

(assert (=> b!1104934 (=> (not res!737264) (not e!630642))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1104934 (= res!737264 (and (= (size!34999 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35000 _keys!1208) (size!34999 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104935 () Bool)

(declare-fun tp_is_empty!27391 () Bool)

(assert (=> b!1104935 (= e!630640 tp_is_empty!27391)))

(declare-fun b!1104936 () Bool)

(declare-fun res!737272 () Bool)

(assert (=> b!1104936 (=> (not res!737272) (not e!630642))))

(assert (=> b!1104936 (= res!737272 (= (select (arr!34462 _keys!1208) i!673) k0!934))))

(declare-fun b!1104937 () Bool)

(declare-fun res!737270 () Bool)

(assert (=> b!1104937 (=> (not res!737270) (not e!630641))))

(declare-fun lt!495044 () array!71616)

(declare-datatypes ((List!24102 0))(
  ( (Nil!24099) (Cons!24098 (h!25307 (_ BitVec 64)) (t!34358 List!24102)) )
))
(declare-fun arrayNoDuplicates!0 (array!71616 (_ BitVec 32) List!24102) Bool)

(assert (=> b!1104937 (= res!737270 (arrayNoDuplicates!0 lt!495044 #b00000000000000000000000000000000 Nil!24099))))

(declare-fun b!1104938 () Bool)

(declare-fun e!630643 () Bool)

(assert (=> b!1104938 (= e!630643 tp_is_empty!27391)))

(declare-fun res!737268 () Bool)

(assert (=> start!97138 (=> (not res!737268) (not e!630642))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97138 (= res!737268 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35000 _keys!1208))))))

(assert (=> start!97138 e!630642))

(declare-fun array_inv!26574 (array!71616) Bool)

(assert (=> start!97138 (array_inv!26574 _keys!1208)))

(assert (=> start!97138 true))

(declare-fun array_inv!26575 (array!71614) Bool)

(assert (=> start!97138 (and (array_inv!26575 _values!996) e!630639)))

(declare-fun b!1104939 () Bool)

(declare-fun res!737273 () Bool)

(assert (=> b!1104939 (=> (not res!737273) (not e!630642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104939 (= res!737273 (validMask!0 mask!1564))))

(declare-fun b!1104940 () Bool)

(declare-fun res!737271 () Bool)

(assert (=> b!1104940 (=> (not res!737271) (not e!630642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71616 (_ BitVec 32)) Bool)

(assert (=> b!1104940 (= res!737271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!42901 () Bool)

(declare-fun tp!81821 () Bool)

(assert (=> mapNonEmpty!42901 (= mapRes!42901 (and tp!81821 e!630643))))

(declare-fun mapKey!42901 () (_ BitVec 32))

(declare-fun mapRest!42901 () (Array (_ BitVec 32) ValueCell!12986))

(declare-fun mapValue!42901 () ValueCell!12986)

(assert (=> mapNonEmpty!42901 (= (arr!34461 _values!996) (store mapRest!42901 mapKey!42901 mapValue!42901))))

(declare-fun b!1104941 () Bool)

(assert (=> b!1104941 (= e!630642 e!630641)))

(declare-fun res!737266 () Bool)

(assert (=> b!1104941 (=> (not res!737266) (not e!630641))))

(assert (=> b!1104941 (= res!737266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495044 mask!1564))))

(assert (=> b!1104941 (= lt!495044 (array!71617 (store (arr!34462 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35000 _keys!1208)))))

(declare-fun b!1104942 () Bool)

(declare-fun res!737267 () Bool)

(assert (=> b!1104942 (=> (not res!737267) (not e!630642))))

(assert (=> b!1104942 (= res!737267 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24099))))

(declare-fun b!1104943 () Bool)

(declare-fun res!737269 () Bool)

(assert (=> b!1104943 (=> (not res!737269) (not e!630642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104943 (= res!737269 (validKeyInArray!0 k0!934))))

(assert (= (and start!97138 res!737268) b!1104939))

(assert (= (and b!1104939 res!737273) b!1104934))

(assert (= (and b!1104934 res!737264) b!1104940))

(assert (= (and b!1104940 res!737271) b!1104942))

(assert (= (and b!1104942 res!737267) b!1104933))

(assert (= (and b!1104933 res!737265) b!1104943))

(assert (= (and b!1104943 res!737269) b!1104936))

(assert (= (and b!1104936 res!737272) b!1104941))

(assert (= (and b!1104941 res!737266) b!1104937))

(assert (= (and b!1104937 res!737270) b!1104932))

(assert (= (and b!1104931 condMapEmpty!42901) mapIsEmpty!42901))

(assert (= (and b!1104931 (not condMapEmpty!42901)) mapNonEmpty!42901))

(get-info :version)

(assert (= (and mapNonEmpty!42901 ((_ is ValueCellFull!12986) mapValue!42901)) b!1104938))

(assert (= (and b!1104931 ((_ is ValueCellFull!12986) mapDefault!42901)) b!1104935))

(assert (= start!97138 b!1104931))

(declare-fun m!1023967 () Bool)

(assert (=> start!97138 m!1023967))

(declare-fun m!1023969 () Bool)

(assert (=> start!97138 m!1023969))

(declare-fun m!1023971 () Bool)

(assert (=> b!1104942 m!1023971))

(declare-fun m!1023973 () Bool)

(assert (=> b!1104941 m!1023973))

(declare-fun m!1023975 () Bool)

(assert (=> b!1104941 m!1023975))

(declare-fun m!1023977 () Bool)

(assert (=> b!1104932 m!1023977))

(declare-fun m!1023979 () Bool)

(assert (=> b!1104932 m!1023979))

(declare-fun m!1023981 () Bool)

(assert (=> b!1104936 m!1023981))

(declare-fun m!1023983 () Bool)

(assert (=> b!1104939 m!1023983))

(declare-fun m!1023985 () Bool)

(assert (=> b!1104937 m!1023985))

(declare-fun m!1023987 () Bool)

(assert (=> b!1104940 m!1023987))

(declare-fun m!1023989 () Bool)

(assert (=> mapNonEmpty!42901 m!1023989))

(declare-fun m!1023991 () Bool)

(assert (=> b!1104943 m!1023991))

(check-sat (not b!1104940) (not b!1104939) (not start!97138) (not b!1104941) tp_is_empty!27391 (not mapNonEmpty!42901) (not b!1104943) (not b!1104942) (not b!1104937) (not b!1104932))
(check-sat)
(get-model)

(declare-fun d!130763 () Bool)

(assert (=> d!130763 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1104943 d!130763))

(declare-fun d!130765 () Bool)

(assert (=> d!130765 (= (array_inv!26574 _keys!1208) (bvsge (size!35000 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97138 d!130765))

(declare-fun d!130767 () Bool)

(assert (=> d!130767 (= (array_inv!26575 _values!996) (bvsge (size!34999 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97138 d!130767))

(declare-fun b!1105032 () Bool)

(declare-fun e!630689 () Bool)

(declare-fun contains!6387 (List!24102 (_ BitVec 64)) Bool)

(assert (=> b!1105032 (= e!630689 (contains!6387 Nil!24099 (select (arr!34462 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!130769 () Bool)

(declare-fun res!737342 () Bool)

(declare-fun e!630690 () Bool)

(assert (=> d!130769 (=> res!737342 e!630690)))

(assert (=> d!130769 (= res!737342 (bvsge #b00000000000000000000000000000000 (size!35000 _keys!1208)))))

(assert (=> d!130769 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24099) e!630690)))

(declare-fun b!1105033 () Bool)

(declare-fun e!630691 () Bool)

(assert (=> b!1105033 (= e!630690 e!630691)))

(declare-fun res!737341 () Bool)

(assert (=> b!1105033 (=> (not res!737341) (not e!630691))))

(assert (=> b!1105033 (= res!737341 (not e!630689))))

(declare-fun res!737340 () Bool)

(assert (=> b!1105033 (=> (not res!737340) (not e!630689))))

(assert (=> b!1105033 (= res!737340 (validKeyInArray!0 (select (arr!34462 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105034 () Bool)

(declare-fun e!630692 () Bool)

(declare-fun call!46326 () Bool)

(assert (=> b!1105034 (= e!630692 call!46326)))

(declare-fun b!1105035 () Bool)

(assert (=> b!1105035 (= e!630691 e!630692)))

(declare-fun c!108964 () Bool)

(assert (=> b!1105035 (= c!108964 (validKeyInArray!0 (select (arr!34462 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105036 () Bool)

(assert (=> b!1105036 (= e!630692 call!46326)))

(declare-fun bm!46323 () Bool)

(assert (=> bm!46323 (= call!46326 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108964 (Cons!24098 (select (arr!34462 _keys!1208) #b00000000000000000000000000000000) Nil!24099) Nil!24099)))))

(assert (= (and d!130769 (not res!737342)) b!1105033))

(assert (= (and b!1105033 res!737340) b!1105032))

(assert (= (and b!1105033 res!737341) b!1105035))

(assert (= (and b!1105035 c!108964) b!1105034))

(assert (= (and b!1105035 (not c!108964)) b!1105036))

(assert (= (or b!1105034 b!1105036) bm!46323))

(declare-fun m!1024045 () Bool)

(assert (=> b!1105032 m!1024045))

(assert (=> b!1105032 m!1024045))

(declare-fun m!1024047 () Bool)

(assert (=> b!1105032 m!1024047))

(assert (=> b!1105033 m!1024045))

(assert (=> b!1105033 m!1024045))

(declare-fun m!1024049 () Bool)

(assert (=> b!1105033 m!1024049))

(assert (=> b!1105035 m!1024045))

(assert (=> b!1105035 m!1024045))

(assert (=> b!1105035 m!1024049))

(assert (=> bm!46323 m!1024045))

(declare-fun m!1024051 () Bool)

(assert (=> bm!46323 m!1024051))

(assert (=> b!1104942 d!130769))

(declare-fun d!130771 () Bool)

(declare-fun res!737348 () Bool)

(declare-fun e!630699 () Bool)

(assert (=> d!130771 (=> res!737348 e!630699)))

(assert (=> d!130771 (= res!737348 (bvsge #b00000000000000000000000000000000 (size!35000 _keys!1208)))))

(assert (=> d!130771 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630699)))

(declare-fun b!1105045 () Bool)

(declare-fun e!630701 () Bool)

(declare-fun e!630700 () Bool)

(assert (=> b!1105045 (= e!630701 e!630700)))

(declare-fun lt!495066 () (_ BitVec 64))

(assert (=> b!1105045 (= lt!495066 (select (arr!34462 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!495065 () Unit!36079)

(assert (=> b!1105045 (= lt!495065 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495066 #b00000000000000000000000000000000))))

(assert (=> b!1105045 (arrayContainsKey!0 _keys!1208 lt!495066 #b00000000000000000000000000000000)))

(declare-fun lt!495064 () Unit!36079)

(assert (=> b!1105045 (= lt!495064 lt!495065)))

(declare-fun res!737347 () Bool)

(declare-datatypes ((SeekEntryResult!9923 0))(
  ( (MissingZero!9923 (index!42063 (_ BitVec 32))) (Found!9923 (index!42064 (_ BitVec 32))) (Intermediate!9923 (undefined!10735 Bool) (index!42065 (_ BitVec 32)) (x!99377 (_ BitVec 32))) (Undefined!9923) (MissingVacant!9923 (index!42066 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71616 (_ BitVec 32)) SeekEntryResult!9923)

(assert (=> b!1105045 (= res!737347 (= (seekEntryOrOpen!0 (select (arr!34462 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9923 #b00000000000000000000000000000000)))))

(assert (=> b!1105045 (=> (not res!737347) (not e!630700))))

(declare-fun b!1105046 () Bool)

(declare-fun call!46329 () Bool)

(assert (=> b!1105046 (= e!630701 call!46329)))

(declare-fun bm!46326 () Bool)

(assert (=> bm!46326 (= call!46329 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1105047 () Bool)

(assert (=> b!1105047 (= e!630700 call!46329)))

(declare-fun b!1105048 () Bool)

(assert (=> b!1105048 (= e!630699 e!630701)))

(declare-fun c!108967 () Bool)

(assert (=> b!1105048 (= c!108967 (validKeyInArray!0 (select (arr!34462 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!130771 (not res!737348)) b!1105048))

(assert (= (and b!1105048 c!108967) b!1105045))

(assert (= (and b!1105048 (not c!108967)) b!1105046))

(assert (= (and b!1105045 res!737347) b!1105047))

(assert (= (or b!1105047 b!1105046) bm!46326))

(assert (=> b!1105045 m!1024045))

(declare-fun m!1024053 () Bool)

(assert (=> b!1105045 m!1024053))

(declare-fun m!1024055 () Bool)

(assert (=> b!1105045 m!1024055))

(assert (=> b!1105045 m!1024045))

(declare-fun m!1024057 () Bool)

(assert (=> b!1105045 m!1024057))

(declare-fun m!1024059 () Bool)

(assert (=> bm!46326 m!1024059))

(assert (=> b!1105048 m!1024045))

(assert (=> b!1105048 m!1024045))

(assert (=> b!1105048 m!1024049))

(assert (=> b!1104940 d!130771))

(declare-fun d!130773 () Bool)

(assert (=> d!130773 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1104939 d!130773))

(declare-fun d!130775 () Bool)

(declare-fun res!737353 () Bool)

(declare-fun e!630706 () Bool)

(assert (=> d!130775 (=> res!737353 e!630706)))

(assert (=> d!130775 (= res!737353 (= (select (arr!34462 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!130775 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!630706)))

(declare-fun b!1105053 () Bool)

(declare-fun e!630707 () Bool)

(assert (=> b!1105053 (= e!630706 e!630707)))

(declare-fun res!737354 () Bool)

(assert (=> b!1105053 (=> (not res!737354) (not e!630707))))

(assert (=> b!1105053 (= res!737354 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!35000 _keys!1208)))))

(declare-fun b!1105054 () Bool)

(assert (=> b!1105054 (= e!630707 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130775 (not res!737353)) b!1105053))

(assert (= (and b!1105053 res!737354) b!1105054))

(assert (=> d!130775 m!1024045))

(declare-fun m!1024061 () Bool)

(assert (=> b!1105054 m!1024061))

(assert (=> b!1104932 d!130775))

(declare-fun d!130777 () Bool)

(assert (=> d!130777 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495069 () Unit!36079)

(declare-fun choose!13 (array!71616 (_ BitVec 64) (_ BitVec 32)) Unit!36079)

(assert (=> d!130777 (= lt!495069 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!130777 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!130777 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!495069)))

(declare-fun bs!32390 () Bool)

(assert (= bs!32390 d!130777))

(assert (=> bs!32390 m!1023977))

(declare-fun m!1024063 () Bool)

(assert (=> bs!32390 m!1024063))

(assert (=> b!1104932 d!130777))

(declare-fun b!1105055 () Bool)

(declare-fun e!630708 () Bool)

(assert (=> b!1105055 (= e!630708 (contains!6387 Nil!24099 (select (arr!34462 lt!495044) #b00000000000000000000000000000000)))))

(declare-fun d!130779 () Bool)

(declare-fun res!737357 () Bool)

(declare-fun e!630709 () Bool)

(assert (=> d!130779 (=> res!737357 e!630709)))

(assert (=> d!130779 (= res!737357 (bvsge #b00000000000000000000000000000000 (size!35000 lt!495044)))))

(assert (=> d!130779 (= (arrayNoDuplicates!0 lt!495044 #b00000000000000000000000000000000 Nil!24099) e!630709)))

(declare-fun b!1105056 () Bool)

(declare-fun e!630710 () Bool)

(assert (=> b!1105056 (= e!630709 e!630710)))

(declare-fun res!737356 () Bool)

(assert (=> b!1105056 (=> (not res!737356) (not e!630710))))

(assert (=> b!1105056 (= res!737356 (not e!630708))))

(declare-fun res!737355 () Bool)

(assert (=> b!1105056 (=> (not res!737355) (not e!630708))))

(assert (=> b!1105056 (= res!737355 (validKeyInArray!0 (select (arr!34462 lt!495044) #b00000000000000000000000000000000)))))

(declare-fun b!1105057 () Bool)

(declare-fun e!630711 () Bool)

(declare-fun call!46330 () Bool)

(assert (=> b!1105057 (= e!630711 call!46330)))

(declare-fun b!1105058 () Bool)

(assert (=> b!1105058 (= e!630710 e!630711)))

(declare-fun c!108968 () Bool)

(assert (=> b!1105058 (= c!108968 (validKeyInArray!0 (select (arr!34462 lt!495044) #b00000000000000000000000000000000)))))

(declare-fun b!1105059 () Bool)

(assert (=> b!1105059 (= e!630711 call!46330)))

(declare-fun bm!46327 () Bool)

(assert (=> bm!46327 (= call!46330 (arrayNoDuplicates!0 lt!495044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108968 (Cons!24098 (select (arr!34462 lt!495044) #b00000000000000000000000000000000) Nil!24099) Nil!24099)))))

(assert (= (and d!130779 (not res!737357)) b!1105056))

(assert (= (and b!1105056 res!737355) b!1105055))

(assert (= (and b!1105056 res!737356) b!1105058))

(assert (= (and b!1105058 c!108968) b!1105057))

(assert (= (and b!1105058 (not c!108968)) b!1105059))

(assert (= (or b!1105057 b!1105059) bm!46327))

(declare-fun m!1024065 () Bool)

(assert (=> b!1105055 m!1024065))

(assert (=> b!1105055 m!1024065))

(declare-fun m!1024067 () Bool)

(assert (=> b!1105055 m!1024067))

(assert (=> b!1105056 m!1024065))

(assert (=> b!1105056 m!1024065))

(declare-fun m!1024069 () Bool)

(assert (=> b!1105056 m!1024069))

(assert (=> b!1105058 m!1024065))

(assert (=> b!1105058 m!1024065))

(assert (=> b!1105058 m!1024069))

(assert (=> bm!46327 m!1024065))

(declare-fun m!1024071 () Bool)

(assert (=> bm!46327 m!1024071))

(assert (=> b!1104937 d!130779))

(declare-fun d!130781 () Bool)

(declare-fun res!737359 () Bool)

(declare-fun e!630712 () Bool)

(assert (=> d!130781 (=> res!737359 e!630712)))

(assert (=> d!130781 (= res!737359 (bvsge #b00000000000000000000000000000000 (size!35000 lt!495044)))))

(assert (=> d!130781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495044 mask!1564) e!630712)))

(declare-fun b!1105060 () Bool)

(declare-fun e!630714 () Bool)

(declare-fun e!630713 () Bool)

(assert (=> b!1105060 (= e!630714 e!630713)))

(declare-fun lt!495072 () (_ BitVec 64))

(assert (=> b!1105060 (= lt!495072 (select (arr!34462 lt!495044) #b00000000000000000000000000000000))))

(declare-fun lt!495071 () Unit!36079)

(assert (=> b!1105060 (= lt!495071 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!495044 lt!495072 #b00000000000000000000000000000000))))

(assert (=> b!1105060 (arrayContainsKey!0 lt!495044 lt!495072 #b00000000000000000000000000000000)))

(declare-fun lt!495070 () Unit!36079)

(assert (=> b!1105060 (= lt!495070 lt!495071)))

(declare-fun res!737358 () Bool)

(assert (=> b!1105060 (= res!737358 (= (seekEntryOrOpen!0 (select (arr!34462 lt!495044) #b00000000000000000000000000000000) lt!495044 mask!1564) (Found!9923 #b00000000000000000000000000000000)))))

(assert (=> b!1105060 (=> (not res!737358) (not e!630713))))

(declare-fun b!1105061 () Bool)

(declare-fun call!46331 () Bool)

(assert (=> b!1105061 (= e!630714 call!46331)))

(declare-fun bm!46328 () Bool)

(assert (=> bm!46328 (= call!46331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!495044 mask!1564))))

(declare-fun b!1105062 () Bool)

(assert (=> b!1105062 (= e!630713 call!46331)))

(declare-fun b!1105063 () Bool)

(assert (=> b!1105063 (= e!630712 e!630714)))

(declare-fun c!108969 () Bool)

(assert (=> b!1105063 (= c!108969 (validKeyInArray!0 (select (arr!34462 lt!495044) #b00000000000000000000000000000000)))))

(assert (= (and d!130781 (not res!737359)) b!1105063))

(assert (= (and b!1105063 c!108969) b!1105060))

(assert (= (and b!1105063 (not c!108969)) b!1105061))

(assert (= (and b!1105060 res!737358) b!1105062))

(assert (= (or b!1105062 b!1105061) bm!46328))

(assert (=> b!1105060 m!1024065))

(declare-fun m!1024073 () Bool)

(assert (=> b!1105060 m!1024073))

(declare-fun m!1024075 () Bool)

(assert (=> b!1105060 m!1024075))

(assert (=> b!1105060 m!1024065))

(declare-fun m!1024077 () Bool)

(assert (=> b!1105060 m!1024077))

(declare-fun m!1024079 () Bool)

(assert (=> bm!46328 m!1024079))

(assert (=> b!1105063 m!1024065))

(assert (=> b!1105063 m!1024065))

(assert (=> b!1105063 m!1024069))

(assert (=> b!1104941 d!130781))

(declare-fun b!1105070 () Bool)

(declare-fun e!630719 () Bool)

(assert (=> b!1105070 (= e!630719 tp_is_empty!27391)))

(declare-fun condMapEmpty!42910 () Bool)

(declare-fun mapDefault!42910 () ValueCell!12986)

(assert (=> mapNonEmpty!42901 (= condMapEmpty!42910 (= mapRest!42901 ((as const (Array (_ BitVec 32) ValueCell!12986)) mapDefault!42910)))))

(declare-fun e!630720 () Bool)

(declare-fun mapRes!42910 () Bool)

(assert (=> mapNonEmpty!42901 (= tp!81821 (and e!630720 mapRes!42910))))

(declare-fun b!1105071 () Bool)

(assert (=> b!1105071 (= e!630720 tp_is_empty!27391)))

(declare-fun mapIsEmpty!42910 () Bool)

(assert (=> mapIsEmpty!42910 mapRes!42910))

(declare-fun mapNonEmpty!42910 () Bool)

(declare-fun tp!81830 () Bool)

(assert (=> mapNonEmpty!42910 (= mapRes!42910 (and tp!81830 e!630719))))

(declare-fun mapValue!42910 () ValueCell!12986)

(declare-fun mapRest!42910 () (Array (_ BitVec 32) ValueCell!12986))

(declare-fun mapKey!42910 () (_ BitVec 32))

(assert (=> mapNonEmpty!42910 (= mapRest!42901 (store mapRest!42910 mapKey!42910 mapValue!42910))))

(assert (= (and mapNonEmpty!42901 condMapEmpty!42910) mapIsEmpty!42910))

(assert (= (and mapNonEmpty!42901 (not condMapEmpty!42910)) mapNonEmpty!42910))

(assert (= (and mapNonEmpty!42910 ((_ is ValueCellFull!12986) mapValue!42910)) b!1105070))

(assert (= (and mapNonEmpty!42901 ((_ is ValueCellFull!12986) mapDefault!42910)) b!1105071))

(declare-fun m!1024081 () Bool)

(assert (=> mapNonEmpty!42910 m!1024081))

(check-sat (not b!1105054) (not b!1105032) (not b!1105056) (not bm!46328) (not b!1105055) (not b!1105045) (not d!130777) (not bm!46327) (not b!1105035) (not bm!46326) (not b!1105058) (not b!1105060) tp_is_empty!27391 (not mapNonEmpty!42910) (not b!1105048) (not bm!46323) (not b!1105033) (not b!1105063))
(check-sat)
