; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100424 () Bool)

(assert start!100424)

(declare-fun b!1196091 () Bool)

(declare-fun res!795496 () Bool)

(declare-fun e!679831 () Bool)

(assert (=> b!1196091 (=> (not res!795496) (not e!679831))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77363 0))(
  ( (array!77364 (arr!37323 (Array (_ BitVec 32) (_ BitVec 64))) (size!37860 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77363)

(assert (=> b!1196091 (= res!795496 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37860 _keys!1208))))))

(declare-fun b!1196092 () Bool)

(declare-fun e!679827 () Bool)

(declare-fun tp_is_empty!30271 () Bool)

(assert (=> b!1196092 (= e!679827 tp_is_empty!30271)))

(declare-fun b!1196093 () Bool)

(declare-fun res!795491 () Bool)

(assert (=> b!1196093 (=> (not res!795491) (not e!679831))))

(declare-datatypes ((List!26299 0))(
  ( (Nil!26296) (Cons!26295 (h!27513 (_ BitVec 64)) (t!38962 List!26299)) )
))
(declare-fun arrayNoDuplicates!0 (array!77363 (_ BitVec 32) List!26299) Bool)

(assert (=> b!1196093 (= res!795491 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26296))))

(declare-fun mapNonEmpty!47240 () Bool)

(declare-fun mapRes!47240 () Bool)

(declare-fun tp!89850 () Bool)

(assert (=> mapNonEmpty!47240 (= mapRes!47240 (and tp!89850 e!679827))))

(declare-datatypes ((V!45489 0))(
  ( (V!45490 (val!15192 Int)) )
))
(declare-datatypes ((ValueCell!14426 0))(
  ( (ValueCellFull!14426 (v!17826 V!45489)) (EmptyCell!14426) )
))
(declare-fun mapValue!47240 () ValueCell!14426)

(declare-fun mapKey!47240 () (_ BitVec 32))

(declare-datatypes ((array!77365 0))(
  ( (array!77366 (arr!37324 (Array (_ BitVec 32) ValueCell!14426)) (size!37861 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77365)

(declare-fun mapRest!47240 () (Array (_ BitVec 32) ValueCell!14426))

(assert (=> mapNonEmpty!47240 (= (arr!37324 _values!996) (store mapRest!47240 mapKey!47240 mapValue!47240))))

(declare-fun b!1196094 () Bool)

(declare-fun e!679828 () Bool)

(declare-fun e!679826 () Bool)

(assert (=> b!1196094 (= e!679828 (and e!679826 mapRes!47240))))

(declare-fun condMapEmpty!47240 () Bool)

(declare-fun mapDefault!47240 () ValueCell!14426)

(assert (=> b!1196094 (= condMapEmpty!47240 (= (arr!37324 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14426)) mapDefault!47240)))))

(declare-fun mapIsEmpty!47240 () Bool)

(assert (=> mapIsEmpty!47240 mapRes!47240))

(declare-fun b!1196095 () Bool)

(declare-fun res!795498 () Bool)

(assert (=> b!1196095 (=> (not res!795498) (not e!679831))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1196095 (= res!795498 (= (select (arr!37323 _keys!1208) i!673) k0!934))))

(declare-fun e!679829 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1196096 () Bool)

(assert (=> b!1196096 (= e!679829 (not (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37860 _keys!1208)) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000))))))

(declare-fun arrayContainsKey!0 (array!77363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196096 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39585 0))(
  ( (Unit!39586) )
))
(declare-fun lt!543307 () Unit!39585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77363 (_ BitVec 64) (_ BitVec 32)) Unit!39585)

(assert (=> b!1196096 (= lt!543307 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196097 () Bool)

(declare-fun res!795489 () Bool)

(assert (=> b!1196097 (=> (not res!795489) (not e!679829))))

(declare-fun lt!543306 () array!77363)

(assert (=> b!1196097 (= res!795489 (arrayNoDuplicates!0 lt!543306 #b00000000000000000000000000000000 Nil!26296))))

(declare-fun b!1196098 () Bool)

(declare-fun res!795492 () Bool)

(assert (=> b!1196098 (=> (not res!795492) (not e!679831))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1196098 (= res!795492 (and (= (size!37861 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37860 _keys!1208) (size!37861 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196099 () Bool)

(declare-fun res!795490 () Bool)

(assert (=> b!1196099 (=> (not res!795490) (not e!679831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77363 (_ BitVec 32)) Bool)

(assert (=> b!1196099 (= res!795490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196100 () Bool)

(assert (=> b!1196100 (= e!679831 e!679829)))

(declare-fun res!795494 () Bool)

(assert (=> b!1196100 (=> (not res!795494) (not e!679829))))

(assert (=> b!1196100 (= res!795494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543306 mask!1564))))

(assert (=> b!1196100 (= lt!543306 (array!77364 (store (arr!37323 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37860 _keys!1208)))))

(declare-fun b!1196101 () Bool)

(assert (=> b!1196101 (= e!679826 tp_is_empty!30271)))

(declare-fun b!1196102 () Bool)

(declare-fun res!795495 () Bool)

(assert (=> b!1196102 (=> (not res!795495) (not e!679831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196102 (= res!795495 (validKeyInArray!0 k0!934))))

(declare-fun b!1196103 () Bool)

(declare-fun res!795493 () Bool)

(assert (=> b!1196103 (=> (not res!795493) (not e!679831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196103 (= res!795493 (validMask!0 mask!1564))))

(declare-fun res!795497 () Bool)

(assert (=> start!100424 (=> (not res!795497) (not e!679831))))

(assert (=> start!100424 (= res!795497 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37860 _keys!1208))))))

(assert (=> start!100424 e!679831))

(declare-fun array_inv!28522 (array!77363) Bool)

(assert (=> start!100424 (array_inv!28522 _keys!1208)))

(assert (=> start!100424 true))

(declare-fun array_inv!28523 (array!77365) Bool)

(assert (=> start!100424 (and (array_inv!28523 _values!996) e!679828)))

(assert (= (and start!100424 res!795497) b!1196103))

(assert (= (and b!1196103 res!795493) b!1196098))

(assert (= (and b!1196098 res!795492) b!1196099))

(assert (= (and b!1196099 res!795490) b!1196093))

(assert (= (and b!1196093 res!795491) b!1196091))

(assert (= (and b!1196091 res!795496) b!1196102))

(assert (= (and b!1196102 res!795495) b!1196095))

(assert (= (and b!1196095 res!795498) b!1196100))

(assert (= (and b!1196100 res!795494) b!1196097))

(assert (= (and b!1196097 res!795489) b!1196096))

(assert (= (and b!1196094 condMapEmpty!47240) mapIsEmpty!47240))

(assert (= (and b!1196094 (not condMapEmpty!47240)) mapNonEmpty!47240))

(get-info :version)

(assert (= (and mapNonEmpty!47240 ((_ is ValueCellFull!14426) mapValue!47240)) b!1196092))

(assert (= (and b!1196094 ((_ is ValueCellFull!14426) mapDefault!47240)) b!1196101))

(assert (= start!100424 b!1196094))

(declare-fun m!1104151 () Bool)

(assert (=> b!1196095 m!1104151))

(declare-fun m!1104153 () Bool)

(assert (=> b!1196100 m!1104153))

(declare-fun m!1104155 () Bool)

(assert (=> b!1196100 m!1104155))

(declare-fun m!1104157 () Bool)

(assert (=> b!1196097 m!1104157))

(declare-fun m!1104159 () Bool)

(assert (=> b!1196093 m!1104159))

(declare-fun m!1104161 () Bool)

(assert (=> b!1196099 m!1104161))

(declare-fun m!1104163 () Bool)

(assert (=> mapNonEmpty!47240 m!1104163))

(declare-fun m!1104165 () Bool)

(assert (=> b!1196102 m!1104165))

(declare-fun m!1104167 () Bool)

(assert (=> b!1196103 m!1104167))

(declare-fun m!1104169 () Bool)

(assert (=> b!1196096 m!1104169))

(declare-fun m!1104171 () Bool)

(assert (=> b!1196096 m!1104171))

(declare-fun m!1104173 () Bool)

(assert (=> start!100424 m!1104173))

(declare-fun m!1104175 () Bool)

(assert (=> start!100424 m!1104175))

(check-sat (not b!1196102) (not b!1196100) (not start!100424) (not b!1196097) (not b!1196099) (not b!1196103) tp_is_empty!30271 (not b!1196096) (not b!1196093) (not mapNonEmpty!47240))
(check-sat)
(get-model)

(declare-fun d!132739 () Bool)

(assert (=> d!132739 (= (array_inv!28522 _keys!1208) (bvsge (size!37860 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100424 d!132739))

(declare-fun d!132741 () Bool)

(assert (=> d!132741 (= (array_inv!28523 _values!996) (bvsge (size!37861 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100424 d!132741))

(declare-fun d!132743 () Bool)

(assert (=> d!132743 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1196103 d!132743))

(declare-fun b!1196192 () Bool)

(declare-fun e!679876 () Bool)

(declare-fun e!679879 () Bool)

(assert (=> b!1196192 (= e!679876 e!679879)))

(declare-fun c!117726 () Bool)

(assert (=> b!1196192 (= c!117726 (validKeyInArray!0 (select (arr!37323 lt!543306) #b00000000000000000000000000000000)))))

(declare-fun b!1196193 () Bool)

(declare-fun call!57219 () Bool)

(assert (=> b!1196193 (= e!679879 call!57219)))

(declare-fun b!1196194 () Bool)

(assert (=> b!1196194 (= e!679879 call!57219)))

(declare-fun d!132745 () Bool)

(declare-fun res!795566 () Bool)

(declare-fun e!679877 () Bool)

(assert (=> d!132745 (=> res!795566 e!679877)))

(assert (=> d!132745 (= res!795566 (bvsge #b00000000000000000000000000000000 (size!37860 lt!543306)))))

(assert (=> d!132745 (= (arrayNoDuplicates!0 lt!543306 #b00000000000000000000000000000000 Nil!26296) e!679877)))

(declare-fun bm!57216 () Bool)

(assert (=> bm!57216 (= call!57219 (arrayNoDuplicates!0 lt!543306 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117726 (Cons!26295 (select (arr!37323 lt!543306) #b00000000000000000000000000000000) Nil!26296) Nil!26296)))))

(declare-fun b!1196195 () Bool)

(assert (=> b!1196195 (= e!679877 e!679876)))

(declare-fun res!795565 () Bool)

(assert (=> b!1196195 (=> (not res!795565) (not e!679876))))

(declare-fun e!679878 () Bool)

(assert (=> b!1196195 (= res!795565 (not e!679878))))

(declare-fun res!795567 () Bool)

(assert (=> b!1196195 (=> (not res!795567) (not e!679878))))

(assert (=> b!1196195 (= res!795567 (validKeyInArray!0 (select (arr!37323 lt!543306) #b00000000000000000000000000000000)))))

(declare-fun b!1196196 () Bool)

(declare-fun contains!6895 (List!26299 (_ BitVec 64)) Bool)

(assert (=> b!1196196 (= e!679878 (contains!6895 Nil!26296 (select (arr!37323 lt!543306) #b00000000000000000000000000000000)))))

(assert (= (and d!132745 (not res!795566)) b!1196195))

(assert (= (and b!1196195 res!795567) b!1196196))

(assert (= (and b!1196195 res!795565) b!1196192))

(assert (= (and b!1196192 c!117726) b!1196194))

(assert (= (and b!1196192 (not c!117726)) b!1196193))

(assert (= (or b!1196194 b!1196193) bm!57216))

(declare-fun m!1104229 () Bool)

(assert (=> b!1196192 m!1104229))

(assert (=> b!1196192 m!1104229))

(declare-fun m!1104231 () Bool)

(assert (=> b!1196192 m!1104231))

(assert (=> bm!57216 m!1104229))

(declare-fun m!1104233 () Bool)

(assert (=> bm!57216 m!1104233))

(assert (=> b!1196195 m!1104229))

(assert (=> b!1196195 m!1104229))

(assert (=> b!1196195 m!1104231))

(assert (=> b!1196196 m!1104229))

(assert (=> b!1196196 m!1104229))

(declare-fun m!1104235 () Bool)

(assert (=> b!1196196 m!1104235))

(assert (=> b!1196097 d!132745))

(declare-fun d!132747 () Bool)

(assert (=> d!132747 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1196102 d!132747))

(declare-fun b!1196197 () Bool)

(declare-fun e!679880 () Bool)

(declare-fun e!679883 () Bool)

(assert (=> b!1196197 (= e!679880 e!679883)))

(declare-fun c!117727 () Bool)

(assert (=> b!1196197 (= c!117727 (validKeyInArray!0 (select (arr!37323 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1196198 () Bool)

(declare-fun call!57220 () Bool)

(assert (=> b!1196198 (= e!679883 call!57220)))

(declare-fun b!1196199 () Bool)

(assert (=> b!1196199 (= e!679883 call!57220)))

(declare-fun d!132749 () Bool)

(declare-fun res!795569 () Bool)

(declare-fun e!679881 () Bool)

(assert (=> d!132749 (=> res!795569 e!679881)))

(assert (=> d!132749 (= res!795569 (bvsge #b00000000000000000000000000000000 (size!37860 _keys!1208)))))

(assert (=> d!132749 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26296) e!679881)))

(declare-fun bm!57217 () Bool)

(assert (=> bm!57217 (= call!57220 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117727 (Cons!26295 (select (arr!37323 _keys!1208) #b00000000000000000000000000000000) Nil!26296) Nil!26296)))))

(declare-fun b!1196200 () Bool)

(assert (=> b!1196200 (= e!679881 e!679880)))

(declare-fun res!795568 () Bool)

(assert (=> b!1196200 (=> (not res!795568) (not e!679880))))

(declare-fun e!679882 () Bool)

(assert (=> b!1196200 (= res!795568 (not e!679882))))

(declare-fun res!795570 () Bool)

(assert (=> b!1196200 (=> (not res!795570) (not e!679882))))

(assert (=> b!1196200 (= res!795570 (validKeyInArray!0 (select (arr!37323 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1196201 () Bool)

(assert (=> b!1196201 (= e!679882 (contains!6895 Nil!26296 (select (arr!37323 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132749 (not res!795569)) b!1196200))

(assert (= (and b!1196200 res!795570) b!1196201))

(assert (= (and b!1196200 res!795568) b!1196197))

(assert (= (and b!1196197 c!117727) b!1196199))

(assert (= (and b!1196197 (not c!117727)) b!1196198))

(assert (= (or b!1196199 b!1196198) bm!57217))

(declare-fun m!1104237 () Bool)

(assert (=> b!1196197 m!1104237))

(assert (=> b!1196197 m!1104237))

(declare-fun m!1104239 () Bool)

(assert (=> b!1196197 m!1104239))

(assert (=> bm!57217 m!1104237))

(declare-fun m!1104241 () Bool)

(assert (=> bm!57217 m!1104241))

(assert (=> b!1196200 m!1104237))

(assert (=> b!1196200 m!1104237))

(assert (=> b!1196200 m!1104239))

(assert (=> b!1196201 m!1104237))

(assert (=> b!1196201 m!1104237))

(declare-fun m!1104243 () Bool)

(assert (=> b!1196201 m!1104243))

(assert (=> b!1196093 d!132749))

(declare-fun d!132751 () Bool)

(declare-fun res!795575 () Bool)

(declare-fun e!679888 () Bool)

(assert (=> d!132751 (=> res!795575 e!679888)))

(assert (=> d!132751 (= res!795575 (= (select (arr!37323 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132751 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!679888)))

(declare-fun b!1196206 () Bool)

(declare-fun e!679889 () Bool)

(assert (=> b!1196206 (= e!679888 e!679889)))

(declare-fun res!795576 () Bool)

(assert (=> b!1196206 (=> (not res!795576) (not e!679889))))

(assert (=> b!1196206 (= res!795576 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!37860 _keys!1208)))))

(declare-fun b!1196207 () Bool)

(assert (=> b!1196207 (= e!679889 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132751 (not res!795575)) b!1196206))

(assert (= (and b!1196206 res!795576) b!1196207))

(assert (=> d!132751 m!1104237))

(declare-fun m!1104245 () Bool)

(assert (=> b!1196207 m!1104245))

(assert (=> b!1196096 d!132751))

(declare-fun d!132753 () Bool)

(assert (=> d!132753 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543322 () Unit!39585)

(declare-fun choose!13 (array!77363 (_ BitVec 64) (_ BitVec 32)) Unit!39585)

(assert (=> d!132753 (= lt!543322 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132753 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132753 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!543322)))

(declare-fun bs!33907 () Bool)

(assert (= bs!33907 d!132753))

(assert (=> bs!33907 m!1104169))

(declare-fun m!1104247 () Bool)

(assert (=> bs!33907 m!1104247))

(assert (=> b!1196096 d!132753))

(declare-fun b!1196216 () Bool)

(declare-fun e!679898 () Bool)

(declare-fun call!57223 () Bool)

(assert (=> b!1196216 (= e!679898 call!57223)))

(declare-fun d!132755 () Bool)

(declare-fun res!795581 () Bool)

(declare-fun e!679896 () Bool)

(assert (=> d!132755 (=> res!795581 e!679896)))

(assert (=> d!132755 (= res!795581 (bvsge #b00000000000000000000000000000000 (size!37860 lt!543306)))))

(assert (=> d!132755 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543306 mask!1564) e!679896)))

(declare-fun bm!57220 () Bool)

(assert (=> bm!57220 (= call!57223 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!543306 mask!1564))))

(declare-fun b!1196217 () Bool)

(declare-fun e!679897 () Bool)

(assert (=> b!1196217 (= e!679897 call!57223)))

(declare-fun b!1196218 () Bool)

(assert (=> b!1196218 (= e!679898 e!679897)))

(declare-fun lt!543331 () (_ BitVec 64))

(assert (=> b!1196218 (= lt!543331 (select (arr!37323 lt!543306) #b00000000000000000000000000000000))))

(declare-fun lt!543330 () Unit!39585)

(assert (=> b!1196218 (= lt!543330 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!543306 lt!543331 #b00000000000000000000000000000000))))

(assert (=> b!1196218 (arrayContainsKey!0 lt!543306 lt!543331 #b00000000000000000000000000000000)))

(declare-fun lt!543329 () Unit!39585)

(assert (=> b!1196218 (= lt!543329 lt!543330)))

(declare-fun res!795582 () Bool)

(declare-datatypes ((SeekEntryResult!9886 0))(
  ( (MissingZero!9886 (index!41915 (_ BitVec 32))) (Found!9886 (index!41916 (_ BitVec 32))) (Intermediate!9886 (undefined!10698 Bool) (index!41917 (_ BitVec 32)) (x!105654 (_ BitVec 32))) (Undefined!9886) (MissingVacant!9886 (index!41918 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77363 (_ BitVec 32)) SeekEntryResult!9886)

(assert (=> b!1196218 (= res!795582 (= (seekEntryOrOpen!0 (select (arr!37323 lt!543306) #b00000000000000000000000000000000) lt!543306 mask!1564) (Found!9886 #b00000000000000000000000000000000)))))

(assert (=> b!1196218 (=> (not res!795582) (not e!679897))))

(declare-fun b!1196219 () Bool)

(assert (=> b!1196219 (= e!679896 e!679898)))

(declare-fun c!117730 () Bool)

(assert (=> b!1196219 (= c!117730 (validKeyInArray!0 (select (arr!37323 lt!543306) #b00000000000000000000000000000000)))))

(assert (= (and d!132755 (not res!795581)) b!1196219))

(assert (= (and b!1196219 c!117730) b!1196218))

(assert (= (and b!1196219 (not c!117730)) b!1196216))

(assert (= (and b!1196218 res!795582) b!1196217))

(assert (= (or b!1196217 b!1196216) bm!57220))

(declare-fun m!1104249 () Bool)

(assert (=> bm!57220 m!1104249))

(assert (=> b!1196218 m!1104229))

(declare-fun m!1104251 () Bool)

(assert (=> b!1196218 m!1104251))

(declare-fun m!1104253 () Bool)

(assert (=> b!1196218 m!1104253))

(assert (=> b!1196218 m!1104229))

(declare-fun m!1104255 () Bool)

(assert (=> b!1196218 m!1104255))

(assert (=> b!1196219 m!1104229))

(assert (=> b!1196219 m!1104229))

(assert (=> b!1196219 m!1104231))

(assert (=> b!1196100 d!132755))

(declare-fun b!1196220 () Bool)

(declare-fun e!679901 () Bool)

(declare-fun call!57224 () Bool)

(assert (=> b!1196220 (= e!679901 call!57224)))

(declare-fun d!132757 () Bool)

(declare-fun res!795583 () Bool)

(declare-fun e!679899 () Bool)

(assert (=> d!132757 (=> res!795583 e!679899)))

(assert (=> d!132757 (= res!795583 (bvsge #b00000000000000000000000000000000 (size!37860 _keys!1208)))))

(assert (=> d!132757 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!679899)))

(declare-fun bm!57221 () Bool)

(assert (=> bm!57221 (= call!57224 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1196221 () Bool)

(declare-fun e!679900 () Bool)

(assert (=> b!1196221 (= e!679900 call!57224)))

(declare-fun b!1196222 () Bool)

(assert (=> b!1196222 (= e!679901 e!679900)))

(declare-fun lt!543334 () (_ BitVec 64))

(assert (=> b!1196222 (= lt!543334 (select (arr!37323 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!543333 () Unit!39585)

(assert (=> b!1196222 (= lt!543333 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!543334 #b00000000000000000000000000000000))))

(assert (=> b!1196222 (arrayContainsKey!0 _keys!1208 lt!543334 #b00000000000000000000000000000000)))

(declare-fun lt!543332 () Unit!39585)

(assert (=> b!1196222 (= lt!543332 lt!543333)))

(declare-fun res!795584 () Bool)

(assert (=> b!1196222 (= res!795584 (= (seekEntryOrOpen!0 (select (arr!37323 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9886 #b00000000000000000000000000000000)))))

(assert (=> b!1196222 (=> (not res!795584) (not e!679900))))

(declare-fun b!1196223 () Bool)

(assert (=> b!1196223 (= e!679899 e!679901)))

(declare-fun c!117731 () Bool)

(assert (=> b!1196223 (= c!117731 (validKeyInArray!0 (select (arr!37323 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132757 (not res!795583)) b!1196223))

(assert (= (and b!1196223 c!117731) b!1196222))

(assert (= (and b!1196223 (not c!117731)) b!1196220))

(assert (= (and b!1196222 res!795584) b!1196221))

(assert (= (or b!1196221 b!1196220) bm!57221))

(declare-fun m!1104257 () Bool)

(assert (=> bm!57221 m!1104257))

(assert (=> b!1196222 m!1104237))

(declare-fun m!1104259 () Bool)

(assert (=> b!1196222 m!1104259))

(declare-fun m!1104261 () Bool)

(assert (=> b!1196222 m!1104261))

(assert (=> b!1196222 m!1104237))

(declare-fun m!1104263 () Bool)

(assert (=> b!1196222 m!1104263))

(assert (=> b!1196223 m!1104237))

(assert (=> b!1196223 m!1104237))

(assert (=> b!1196223 m!1104239))

(assert (=> b!1196099 d!132757))

(declare-fun b!1196230 () Bool)

(declare-fun e!679907 () Bool)

(assert (=> b!1196230 (= e!679907 tp_is_empty!30271)))

(declare-fun mapIsEmpty!47249 () Bool)

(declare-fun mapRes!47249 () Bool)

(assert (=> mapIsEmpty!47249 mapRes!47249))

(declare-fun mapNonEmpty!47249 () Bool)

(declare-fun tp!89859 () Bool)

(assert (=> mapNonEmpty!47249 (= mapRes!47249 (and tp!89859 e!679907))))

(declare-fun mapValue!47249 () ValueCell!14426)

(declare-fun mapRest!47249 () (Array (_ BitVec 32) ValueCell!14426))

(declare-fun mapKey!47249 () (_ BitVec 32))

(assert (=> mapNonEmpty!47249 (= mapRest!47240 (store mapRest!47249 mapKey!47249 mapValue!47249))))

(declare-fun b!1196231 () Bool)

(declare-fun e!679906 () Bool)

(assert (=> b!1196231 (= e!679906 tp_is_empty!30271)))

(declare-fun condMapEmpty!47249 () Bool)

(declare-fun mapDefault!47249 () ValueCell!14426)

(assert (=> mapNonEmpty!47240 (= condMapEmpty!47249 (= mapRest!47240 ((as const (Array (_ BitVec 32) ValueCell!14426)) mapDefault!47249)))))

(assert (=> mapNonEmpty!47240 (= tp!89850 (and e!679906 mapRes!47249))))

(assert (= (and mapNonEmpty!47240 condMapEmpty!47249) mapIsEmpty!47249))

(assert (= (and mapNonEmpty!47240 (not condMapEmpty!47249)) mapNonEmpty!47249))

(assert (= (and mapNonEmpty!47249 ((_ is ValueCellFull!14426) mapValue!47249)) b!1196230))

(assert (= (and mapNonEmpty!47240 ((_ is ValueCellFull!14426) mapDefault!47249)) b!1196231))

(declare-fun m!1104265 () Bool)

(assert (=> mapNonEmpty!47249 m!1104265))

(check-sat (not b!1196207) (not b!1196218) (not b!1196201) (not b!1196223) (not b!1196195) tp_is_empty!30271 (not b!1196222) (not b!1196192) (not b!1196200) (not bm!57220) (not mapNonEmpty!47249) (not bm!57217) (not b!1196196) (not d!132753) (not bm!57216) (not b!1196197) (not bm!57221) (not b!1196219))
(check-sat)
