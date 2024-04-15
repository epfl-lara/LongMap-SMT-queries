; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101418 () Bool)

(assert start!101418)

(declare-fun b_free!26269 () Bool)

(declare-fun b_next!26269 () Bool)

(assert (=> start!101418 (= b_free!26269 (not b_next!26269))))

(declare-fun tp!91837 () Bool)

(declare-fun b_and!43691 () Bool)

(assert (=> start!101418 (= tp!91837 b_and!43691)))

(declare-fun mapIsEmpty!48343 () Bool)

(declare-fun mapRes!48343 () Bool)

(assert (=> mapIsEmpty!48343 mapRes!48343))

(declare-fun b!1218877 () Bool)

(declare-fun res!809560 () Bool)

(declare-fun e!692045 () Bool)

(assert (=> b!1218877 (=> (not res!809560) (not e!692045))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218877 (= res!809560 (validMask!0 mask!1564))))

(declare-fun b!1218878 () Bool)

(declare-fun res!809562 () Bool)

(assert (=> b!1218878 (=> (not res!809562) (not e!692045))))

(declare-datatypes ((array!78642 0))(
  ( (array!78643 (arr!37953 (Array (_ BitVec 32) (_ BitVec 64))) (size!38491 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78642)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78642 (_ BitVec 32)) Bool)

(assert (=> b!1218878 (= res!809562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218879 () Bool)

(declare-fun res!809557 () Bool)

(assert (=> b!1218879 (=> (not res!809557) (not e!692045))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218879 (= res!809557 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38491 _keys!1208))))))

(declare-fun e!692044 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1218880 () Bool)

(declare-fun arrayContainsKey!0 (array!78642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218880 (= e!692044 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218881 () Bool)

(declare-fun res!809551 () Bool)

(assert (=> b!1218881 (=> (not res!809551) (not e!692045))))

(assert (=> b!1218881 (= res!809551 (= (select (arr!37953 _keys!1208) i!673) k0!934))))

(declare-fun b!1218882 () Bool)

(declare-fun e!692040 () Bool)

(declare-fun tp_is_empty!30973 () Bool)

(assert (=> b!1218882 (= e!692040 tp_is_empty!30973)))

(declare-fun b!1218883 () Bool)

(declare-fun e!692043 () Bool)

(assert (=> b!1218883 (= e!692043 tp_is_empty!30973)))

(declare-fun b!1218884 () Bool)

(declare-fun e!692041 () Bool)

(declare-fun e!692036 () Bool)

(assert (=> b!1218884 (= e!692041 e!692036)))

(declare-fun res!809563 () Bool)

(assert (=> b!1218884 (=> res!809563 e!692036)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218884 (= res!809563 (not (= (select (arr!37953 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692038 () Bool)

(assert (=> b!1218884 e!692038))

(declare-fun res!809549 () Bool)

(assert (=> b!1218884 (=> (not res!809549) (not e!692038))))

(declare-datatypes ((V!46425 0))(
  ( (V!46426 (val!15543 Int)) )
))
(declare-datatypes ((tuple2!20080 0))(
  ( (tuple2!20081 (_1!10051 (_ BitVec 64)) (_2!10051 V!46425)) )
))
(declare-datatypes ((List!26860 0))(
  ( (Nil!26857) (Cons!26856 (h!28065 tuple2!20080) (t!40100 List!26860)) )
))
(declare-datatypes ((ListLongMap!18049 0))(
  ( (ListLongMap!18050 (toList!9040 List!26860)) )
))
(declare-fun lt!554009 () ListLongMap!18049)

(declare-fun lt!554000 () V!46425)

(declare-datatypes ((ValueCell!14777 0))(
  ( (ValueCellFull!14777 (v!18198 V!46425)) (EmptyCell!14777) )
))
(declare-datatypes ((array!78644 0))(
  ( (array!78645 (arr!37954 (Array (_ BitVec 32) ValueCell!14777)) (size!38492 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78644)

(declare-fun lt!554007 () ListLongMap!18049)

(declare-fun +!4108 (ListLongMap!18049 tuple2!20080) ListLongMap!18049)

(declare-fun get!19363 (ValueCell!14777 V!46425) V!46425)

(assert (=> b!1218884 (= res!809549 (= lt!554007 (+!4108 lt!554009 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000)))))))

(declare-fun b!1218885 () Bool)

(declare-fun res!809553 () Bool)

(assert (=> b!1218885 (=> (not res!809553) (not e!692045))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1218885 (= res!809553 (and (= (size!38492 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38491 _keys!1208) (size!38492 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218887 () Bool)

(declare-fun e!692034 () Bool)

(assert (=> b!1218887 (= e!692045 e!692034)))

(declare-fun res!809556 () Bool)

(assert (=> b!1218887 (=> (not res!809556) (not e!692034))))

(declare-fun lt!554003 () array!78642)

(assert (=> b!1218887 (= res!809556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554003 mask!1564))))

(assert (=> b!1218887 (= lt!554003 (array!78643 (store (arr!37953 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38491 _keys!1208)))))

(declare-fun b!1218888 () Bool)

(declare-fun e!692042 () Bool)

(assert (=> b!1218888 (= e!692042 e!692041)))

(declare-fun res!809559 () Bool)

(assert (=> b!1218888 (=> res!809559 e!692041)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218888 (= res!809559 (not (validKeyInArray!0 (select (arr!37953 _keys!1208) from!1455))))))

(declare-fun lt!554004 () ListLongMap!18049)

(assert (=> b!1218888 (= lt!554004 lt!554009)))

(declare-fun lt!554002 () ListLongMap!18049)

(declare-fun -!1872 (ListLongMap!18049 (_ BitVec 64)) ListLongMap!18049)

(assert (=> b!1218888 (= lt!554009 (-!1872 lt!554002 k0!934))))

(declare-fun zeroValue!944 () V!46425)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554001 () array!78644)

(declare-fun minValue!944 () V!46425)

(declare-fun getCurrentListMapNoExtraKeys!5478 (array!78642 array!78644 (_ BitVec 32) (_ BitVec 32) V!46425 V!46425 (_ BitVec 32) Int) ListLongMap!18049)

(assert (=> b!1218888 (= lt!554004 (getCurrentListMapNoExtraKeys!5478 lt!554003 lt!554001 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218888 (= lt!554002 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40253 0))(
  ( (Unit!40254) )
))
(declare-fun lt!554006 () Unit!40253)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1107 (array!78642 array!78644 (_ BitVec 32) (_ BitVec 32) V!46425 V!46425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40253)

(assert (=> b!1218888 (= lt!554006 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1107 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218889 () Bool)

(declare-fun res!809561 () Bool)

(assert (=> b!1218889 (=> (not res!809561) (not e!692045))))

(assert (=> b!1218889 (= res!809561 (validKeyInArray!0 k0!934))))

(declare-fun b!1218890 () Bool)

(declare-fun e!692037 () Bool)

(assert (=> b!1218890 (= e!692037 e!692042)))

(declare-fun res!809555 () Bool)

(assert (=> b!1218890 (=> res!809555 e!692042)))

(assert (=> b!1218890 (= res!809555 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1218890 (= lt!554007 (getCurrentListMapNoExtraKeys!5478 lt!554003 lt!554001 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1218890 (= lt!554001 (array!78645 (store (arr!37954 _values!996) i!673 (ValueCellFull!14777 lt!554000)) (size!38492 _values!996)))))

(declare-fun dynLambda!3329 (Int (_ BitVec 64)) V!46425)

(assert (=> b!1218890 (= lt!554000 (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554008 () ListLongMap!18049)

(assert (=> b!1218890 (= lt!554008 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48343 () Bool)

(declare-fun tp!91838 () Bool)

(assert (=> mapNonEmpty!48343 (= mapRes!48343 (and tp!91838 e!692040))))

(declare-fun mapValue!48343 () ValueCell!14777)

(declare-fun mapKey!48343 () (_ BitVec 32))

(declare-fun mapRest!48343 () (Array (_ BitVec 32) ValueCell!14777))

(assert (=> mapNonEmpty!48343 (= (arr!37954 _values!996) (store mapRest!48343 mapKey!48343 mapValue!48343))))

(declare-fun b!1218891 () Bool)

(assert (=> b!1218891 (= e!692034 (not e!692037))))

(declare-fun res!809558 () Bool)

(assert (=> b!1218891 (=> res!809558 e!692037)))

(assert (=> b!1218891 (= res!809558 (bvsgt from!1455 i!673))))

(assert (=> b!1218891 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554005 () Unit!40253)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78642 (_ BitVec 64) (_ BitVec 32)) Unit!40253)

(assert (=> b!1218891 (= lt!554005 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218892 () Bool)

(declare-fun res!809564 () Bool)

(assert (=> b!1218892 (=> (not res!809564) (not e!692045))))

(declare-datatypes ((List!26861 0))(
  ( (Nil!26858) (Cons!26857 (h!28066 (_ BitVec 64)) (t!40101 List!26861)) )
))
(declare-fun arrayNoDuplicates!0 (array!78642 (_ BitVec 32) List!26861) Bool)

(assert (=> b!1218892 (= res!809564 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26858))))

(declare-fun res!809550 () Bool)

(assert (=> start!101418 (=> (not res!809550) (not e!692045))))

(assert (=> start!101418 (= res!809550 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38491 _keys!1208))))))

(assert (=> start!101418 e!692045))

(assert (=> start!101418 tp_is_empty!30973))

(declare-fun array_inv!29006 (array!78642) Bool)

(assert (=> start!101418 (array_inv!29006 _keys!1208)))

(assert (=> start!101418 true))

(assert (=> start!101418 tp!91837))

(declare-fun e!692035 () Bool)

(declare-fun array_inv!29007 (array!78644) Bool)

(assert (=> start!101418 (and (array_inv!29007 _values!996) e!692035)))

(declare-fun b!1218886 () Bool)

(assert (=> b!1218886 (= e!692035 (and e!692043 mapRes!48343))))

(declare-fun condMapEmpty!48343 () Bool)

(declare-fun mapDefault!48343 () ValueCell!14777)

(assert (=> b!1218886 (= condMapEmpty!48343 (= (arr!37954 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14777)) mapDefault!48343)))))

(declare-fun b!1218893 () Bool)

(assert (=> b!1218893 (= e!692036 (bvslt (size!38491 _keys!1208) #b01111111111111111111111111111111))))

(assert (=> b!1218893 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!553999 () Unit!40253)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78642 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40253)

(assert (=> b!1218893 (= lt!553999 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1218894 () Bool)

(declare-fun res!809552 () Bool)

(assert (=> b!1218894 (=> (not res!809552) (not e!692034))))

(assert (=> b!1218894 (= res!809552 (arrayNoDuplicates!0 lt!554003 #b00000000000000000000000000000000 Nil!26858))))

(declare-fun b!1218895 () Bool)

(assert (=> b!1218895 (= e!692038 e!692044)))

(declare-fun res!809554 () Bool)

(assert (=> b!1218895 (=> res!809554 e!692044)))

(assert (=> b!1218895 (= res!809554 (not (= (select (arr!37953 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!101418 res!809550) b!1218877))

(assert (= (and b!1218877 res!809560) b!1218885))

(assert (= (and b!1218885 res!809553) b!1218878))

(assert (= (and b!1218878 res!809562) b!1218892))

(assert (= (and b!1218892 res!809564) b!1218879))

(assert (= (and b!1218879 res!809557) b!1218889))

(assert (= (and b!1218889 res!809561) b!1218881))

(assert (= (and b!1218881 res!809551) b!1218887))

(assert (= (and b!1218887 res!809556) b!1218894))

(assert (= (and b!1218894 res!809552) b!1218891))

(assert (= (and b!1218891 (not res!809558)) b!1218890))

(assert (= (and b!1218890 (not res!809555)) b!1218888))

(assert (= (and b!1218888 (not res!809559)) b!1218884))

(assert (= (and b!1218884 res!809549) b!1218895))

(assert (= (and b!1218895 (not res!809554)) b!1218880))

(assert (= (and b!1218884 (not res!809563)) b!1218893))

(assert (= (and b!1218886 condMapEmpty!48343) mapIsEmpty!48343))

(assert (= (and b!1218886 (not condMapEmpty!48343)) mapNonEmpty!48343))

(get-info :version)

(assert (= (and mapNonEmpty!48343 ((_ is ValueCellFull!14777) mapValue!48343)) b!1218882))

(assert (= (and b!1218886 ((_ is ValueCellFull!14777) mapDefault!48343)) b!1218883))

(assert (= start!101418 b!1218886))

(declare-fun b_lambda!22049 () Bool)

(assert (=> (not b_lambda!22049) (not b!1218890)))

(declare-fun t!40099 () Bool)

(declare-fun tb!11061 () Bool)

(assert (=> (and start!101418 (= defaultEntry!1004 defaultEntry!1004) t!40099) tb!11061))

(declare-fun result!22733 () Bool)

(assert (=> tb!11061 (= result!22733 tp_is_empty!30973)))

(assert (=> b!1218890 t!40099))

(declare-fun b_and!43693 () Bool)

(assert (= b_and!43691 (and (=> t!40099 result!22733) b_and!43693)))

(declare-fun m!1123177 () Bool)

(assert (=> b!1218889 m!1123177))

(declare-fun m!1123179 () Bool)

(assert (=> start!101418 m!1123179))

(declare-fun m!1123181 () Bool)

(assert (=> start!101418 m!1123181))

(declare-fun m!1123183 () Bool)

(assert (=> b!1218895 m!1123183))

(declare-fun m!1123185 () Bool)

(assert (=> b!1218877 m!1123185))

(declare-fun m!1123187 () Bool)

(assert (=> b!1218888 m!1123187))

(declare-fun m!1123189 () Bool)

(assert (=> b!1218888 m!1123189))

(declare-fun m!1123191 () Bool)

(assert (=> b!1218888 m!1123191))

(assert (=> b!1218888 m!1123183))

(declare-fun m!1123193 () Bool)

(assert (=> b!1218888 m!1123193))

(declare-fun m!1123195 () Bool)

(assert (=> b!1218888 m!1123195))

(assert (=> b!1218888 m!1123183))

(declare-fun m!1123197 () Bool)

(assert (=> b!1218890 m!1123197))

(declare-fun m!1123199 () Bool)

(assert (=> b!1218890 m!1123199))

(declare-fun m!1123201 () Bool)

(assert (=> b!1218890 m!1123201))

(declare-fun m!1123203 () Bool)

(assert (=> b!1218890 m!1123203))

(declare-fun m!1123205 () Bool)

(assert (=> mapNonEmpty!48343 m!1123205))

(declare-fun m!1123207 () Bool)

(assert (=> b!1218892 m!1123207))

(declare-fun m!1123209 () Bool)

(assert (=> b!1218891 m!1123209))

(declare-fun m!1123211 () Bool)

(assert (=> b!1218891 m!1123211))

(declare-fun m!1123213 () Bool)

(assert (=> b!1218893 m!1123213))

(declare-fun m!1123215 () Bool)

(assert (=> b!1218893 m!1123215))

(assert (=> b!1218884 m!1123183))

(declare-fun m!1123217 () Bool)

(assert (=> b!1218884 m!1123217))

(assert (=> b!1218884 m!1123217))

(declare-fun m!1123219 () Bool)

(assert (=> b!1218884 m!1123219))

(declare-fun m!1123221 () Bool)

(assert (=> b!1218884 m!1123221))

(declare-fun m!1123223 () Bool)

(assert (=> b!1218880 m!1123223))

(declare-fun m!1123225 () Bool)

(assert (=> b!1218894 m!1123225))

(declare-fun m!1123227 () Bool)

(assert (=> b!1218887 m!1123227))

(declare-fun m!1123229 () Bool)

(assert (=> b!1218887 m!1123229))

(declare-fun m!1123231 () Bool)

(assert (=> b!1218878 m!1123231))

(declare-fun m!1123233 () Bool)

(assert (=> b!1218881 m!1123233))

(check-sat (not b!1218877) b_and!43693 (not b!1218889) (not b!1218892) (not b!1218893) (not b!1218890) (not b!1218894) (not b!1218891) (not b_lambda!22049) (not b!1218888) (not b!1218887) (not mapNonEmpty!48343) (not start!101418) (not b_next!26269) tp_is_empty!30973 (not b!1218880) (not b!1218878) (not b!1218884))
(check-sat b_and!43693 (not b_next!26269))
(get-model)

(declare-fun b_lambda!22055 () Bool)

(assert (= b_lambda!22049 (or (and start!101418 b_free!26269) b_lambda!22055)))

(check-sat (not b!1218877) b_and!43693 (not b!1218889) (not b!1218892) (not b!1218893) (not b!1218890) (not b!1218894) (not b!1218891) (not b_lambda!22055) (not b!1218888) (not b!1218887) (not mapNonEmpty!48343) (not start!101418) (not b_next!26269) tp_is_empty!30973 (not b!1218880) (not b!1218878) (not b!1218884))
(check-sat b_and!43693 (not b_next!26269))
(get-model)

(declare-fun d!133537 () Bool)

(declare-fun res!809665 () Bool)

(declare-fun e!692122 () Bool)

(assert (=> d!133537 (=> res!809665 e!692122)))

(assert (=> d!133537 (= res!809665 (= (select (arr!37953 _keys!1208) i!673) k0!934))))

(assert (=> d!133537 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!692122)))

(declare-fun b!1219020 () Bool)

(declare-fun e!692123 () Bool)

(assert (=> b!1219020 (= e!692122 e!692123)))

(declare-fun res!809666 () Bool)

(assert (=> b!1219020 (=> (not res!809666) (not e!692123))))

(assert (=> b!1219020 (= res!809666 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38491 _keys!1208)))))

(declare-fun b!1219021 () Bool)

(assert (=> b!1219021 (= e!692123 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133537 (not res!809665)) b!1219020))

(assert (= (and b!1219020 res!809666) b!1219021))

(assert (=> d!133537 m!1123233))

(declare-fun m!1123351 () Bool)

(assert (=> b!1219021 m!1123351))

(assert (=> b!1218880 d!133537))

(declare-fun b!1219046 () Bool)

(declare-fun e!692142 () ListLongMap!18049)

(declare-fun e!692143 () ListLongMap!18049)

(assert (=> b!1219046 (= e!692142 e!692143)))

(declare-fun c!120153 () Bool)

(assert (=> b!1219046 (= c!120153 (validKeyInArray!0 (select (arr!37953 lt!554003) from!1455)))))

(declare-fun b!1219047 () Bool)

(declare-fun e!692138 () Bool)

(assert (=> b!1219047 (= e!692138 (validKeyInArray!0 (select (arr!37953 lt!554003) from!1455)))))

(assert (=> b!1219047 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun call!60647 () ListLongMap!18049)

(declare-fun bm!60644 () Bool)

(assert (=> bm!60644 (= call!60647 (getCurrentListMapNoExtraKeys!5478 lt!554003 lt!554001 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133539 () Bool)

(declare-fun e!692140 () Bool)

(assert (=> d!133539 e!692140))

(declare-fun res!809678 () Bool)

(assert (=> d!133539 (=> (not res!809678) (not e!692140))))

(declare-fun lt!554096 () ListLongMap!18049)

(declare-fun contains!6989 (ListLongMap!18049 (_ BitVec 64)) Bool)

(assert (=> d!133539 (= res!809678 (not (contains!6989 lt!554096 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133539 (= lt!554096 e!692142)))

(declare-fun c!120150 () Bool)

(assert (=> d!133539 (= c!120150 (bvsge from!1455 (size!38491 lt!554003)))))

(assert (=> d!133539 (validMask!0 mask!1564)))

(assert (=> d!133539 (= (getCurrentListMapNoExtraKeys!5478 lt!554003 lt!554001 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554096)))

(declare-fun b!1219048 () Bool)

(declare-fun res!809676 () Bool)

(assert (=> b!1219048 (=> (not res!809676) (not e!692140))))

(assert (=> b!1219048 (= res!809676 (not (contains!6989 lt!554096 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219049 () Bool)

(declare-fun e!692139 () Bool)

(assert (=> b!1219049 (= e!692139 (= lt!554096 (getCurrentListMapNoExtraKeys!5478 lt!554003 lt!554001 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1219050 () Bool)

(declare-fun e!692141 () Bool)

(assert (=> b!1219050 (= e!692140 e!692141)))

(declare-fun c!120151 () Bool)

(assert (=> b!1219050 (= c!120151 e!692138)))

(declare-fun res!809675 () Bool)

(assert (=> b!1219050 (=> (not res!809675) (not e!692138))))

(assert (=> b!1219050 (= res!809675 (bvslt from!1455 (size!38491 lt!554003)))))

(declare-fun b!1219051 () Bool)

(declare-fun isEmpty!1002 (ListLongMap!18049) Bool)

(assert (=> b!1219051 (= e!692139 (isEmpty!1002 lt!554096))))

(declare-fun b!1219052 () Bool)

(assert (=> b!1219052 (= e!692143 call!60647)))

(declare-fun b!1219053 () Bool)

(assert (=> b!1219053 (= e!692141 e!692139)))

(declare-fun c!120152 () Bool)

(assert (=> b!1219053 (= c!120152 (bvslt from!1455 (size!38491 lt!554003)))))

(declare-fun b!1219054 () Bool)

(declare-fun lt!554095 () Unit!40253)

(declare-fun lt!554093 () Unit!40253)

(assert (=> b!1219054 (= lt!554095 lt!554093)))

(declare-fun lt!554094 () (_ BitVec 64))

(declare-fun lt!554092 () (_ BitVec 64))

(declare-fun lt!554091 () ListLongMap!18049)

(declare-fun lt!554090 () V!46425)

(assert (=> b!1219054 (not (contains!6989 (+!4108 lt!554091 (tuple2!20081 lt!554092 lt!554090)) lt!554094))))

(declare-fun addStillNotContains!302 (ListLongMap!18049 (_ BitVec 64) V!46425 (_ BitVec 64)) Unit!40253)

(assert (=> b!1219054 (= lt!554093 (addStillNotContains!302 lt!554091 lt!554092 lt!554090 lt!554094))))

(assert (=> b!1219054 (= lt!554094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219054 (= lt!554090 (get!19363 (select (arr!37954 lt!554001) from!1455) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219054 (= lt!554092 (select (arr!37953 lt!554003) from!1455))))

(assert (=> b!1219054 (= lt!554091 call!60647)))

(assert (=> b!1219054 (= e!692143 (+!4108 call!60647 (tuple2!20081 (select (arr!37953 lt!554003) from!1455) (get!19363 (select (arr!37954 lt!554001) from!1455) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1219055 () Bool)

(assert (=> b!1219055 (= e!692142 (ListLongMap!18050 Nil!26857))))

(declare-fun b!1219056 () Bool)

(declare-fun e!692144 () Bool)

(assert (=> b!1219056 (= e!692141 e!692144)))

(assert (=> b!1219056 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38491 lt!554003)))))

(declare-fun res!809677 () Bool)

(assert (=> b!1219056 (= res!809677 (contains!6989 lt!554096 (select (arr!37953 lt!554003) from!1455)))))

(assert (=> b!1219056 (=> (not res!809677) (not e!692144))))

(declare-fun b!1219057 () Bool)

(assert (=> b!1219057 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38491 lt!554003)))))

(assert (=> b!1219057 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38492 lt!554001)))))

(declare-fun apply!966 (ListLongMap!18049 (_ BitVec 64)) V!46425)

(assert (=> b!1219057 (= e!692144 (= (apply!966 lt!554096 (select (arr!37953 lt!554003) from!1455)) (get!19363 (select (arr!37954 lt!554001) from!1455) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133539 c!120150) b!1219055))

(assert (= (and d!133539 (not c!120150)) b!1219046))

(assert (= (and b!1219046 c!120153) b!1219054))

(assert (= (and b!1219046 (not c!120153)) b!1219052))

(assert (= (or b!1219054 b!1219052) bm!60644))

(assert (= (and d!133539 res!809678) b!1219048))

(assert (= (and b!1219048 res!809676) b!1219050))

(assert (= (and b!1219050 res!809675) b!1219047))

(assert (= (and b!1219050 c!120151) b!1219056))

(assert (= (and b!1219050 (not c!120151)) b!1219053))

(assert (= (and b!1219056 res!809677) b!1219057))

(assert (= (and b!1219053 c!120152) b!1219049))

(assert (= (and b!1219053 (not c!120152)) b!1219051))

(declare-fun b_lambda!22057 () Bool)

(assert (=> (not b_lambda!22057) (not b!1219054)))

(assert (=> b!1219054 t!40099))

(declare-fun b_and!43703 () Bool)

(assert (= b_and!43693 (and (=> t!40099 result!22733) b_and!43703)))

(declare-fun b_lambda!22059 () Bool)

(assert (=> (not b_lambda!22059) (not b!1219057)))

(assert (=> b!1219057 t!40099))

(declare-fun b_and!43705 () Bool)

(assert (= b_and!43703 (and (=> t!40099 result!22733) b_and!43705)))

(declare-fun m!1123353 () Bool)

(assert (=> b!1219056 m!1123353))

(assert (=> b!1219056 m!1123353))

(declare-fun m!1123355 () Bool)

(assert (=> b!1219056 m!1123355))

(assert (=> b!1219057 m!1123353))

(declare-fun m!1123357 () Bool)

(assert (=> b!1219057 m!1123357))

(assert (=> b!1219057 m!1123201))

(declare-fun m!1123359 () Bool)

(assert (=> b!1219057 m!1123359))

(assert (=> b!1219057 m!1123201))

(declare-fun m!1123361 () Bool)

(assert (=> b!1219057 m!1123361))

(assert (=> b!1219057 m!1123359))

(assert (=> b!1219057 m!1123353))

(declare-fun m!1123363 () Bool)

(assert (=> bm!60644 m!1123363))

(assert (=> b!1219047 m!1123353))

(assert (=> b!1219047 m!1123353))

(declare-fun m!1123365 () Bool)

(assert (=> b!1219047 m!1123365))

(declare-fun m!1123367 () Bool)

(assert (=> b!1219048 m!1123367))

(assert (=> b!1219046 m!1123353))

(assert (=> b!1219046 m!1123353))

(assert (=> b!1219046 m!1123365))

(declare-fun m!1123369 () Bool)

(assert (=> b!1219054 m!1123369))

(assert (=> b!1219054 m!1123201))

(declare-fun m!1123371 () Bool)

(assert (=> b!1219054 m!1123371))

(declare-fun m!1123373 () Bool)

(assert (=> b!1219054 m!1123373))

(assert (=> b!1219054 m!1123359))

(assert (=> b!1219054 m!1123201))

(assert (=> b!1219054 m!1123361))

(declare-fun m!1123375 () Bool)

(assert (=> b!1219054 m!1123375))

(assert (=> b!1219054 m!1123371))

(assert (=> b!1219054 m!1123359))

(assert (=> b!1219054 m!1123353))

(declare-fun m!1123377 () Bool)

(assert (=> b!1219051 m!1123377))

(declare-fun m!1123379 () Bool)

(assert (=> d!133539 m!1123379))

(assert (=> d!133539 m!1123185))

(assert (=> b!1219049 m!1123363))

(assert (=> b!1218890 d!133539))

(declare-fun b!1219058 () Bool)

(declare-fun e!692149 () ListLongMap!18049)

(declare-fun e!692150 () ListLongMap!18049)

(assert (=> b!1219058 (= e!692149 e!692150)))

(declare-fun c!120157 () Bool)

(assert (=> b!1219058 (= c!120157 (validKeyInArray!0 (select (arr!37953 _keys!1208) from!1455)))))

(declare-fun b!1219059 () Bool)

(declare-fun e!692145 () Bool)

(assert (=> b!1219059 (= e!692145 (validKeyInArray!0 (select (arr!37953 _keys!1208) from!1455)))))

(assert (=> b!1219059 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!60645 () Bool)

(declare-fun call!60648 () ListLongMap!18049)

(assert (=> bm!60645 (= call!60648 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133541 () Bool)

(declare-fun e!692147 () Bool)

(assert (=> d!133541 e!692147))

(declare-fun res!809682 () Bool)

(assert (=> d!133541 (=> (not res!809682) (not e!692147))))

(declare-fun lt!554103 () ListLongMap!18049)

(assert (=> d!133541 (= res!809682 (not (contains!6989 lt!554103 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133541 (= lt!554103 e!692149)))

(declare-fun c!120154 () Bool)

(assert (=> d!133541 (= c!120154 (bvsge from!1455 (size!38491 _keys!1208)))))

(assert (=> d!133541 (validMask!0 mask!1564)))

(assert (=> d!133541 (= (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554103)))

(declare-fun b!1219060 () Bool)

(declare-fun res!809680 () Bool)

(assert (=> b!1219060 (=> (not res!809680) (not e!692147))))

(assert (=> b!1219060 (= res!809680 (not (contains!6989 lt!554103 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!692146 () Bool)

(declare-fun b!1219061 () Bool)

(assert (=> b!1219061 (= e!692146 (= lt!554103 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1219062 () Bool)

(declare-fun e!692148 () Bool)

(assert (=> b!1219062 (= e!692147 e!692148)))

(declare-fun c!120155 () Bool)

(assert (=> b!1219062 (= c!120155 e!692145)))

(declare-fun res!809679 () Bool)

(assert (=> b!1219062 (=> (not res!809679) (not e!692145))))

(assert (=> b!1219062 (= res!809679 (bvslt from!1455 (size!38491 _keys!1208)))))

(declare-fun b!1219063 () Bool)

(assert (=> b!1219063 (= e!692146 (isEmpty!1002 lt!554103))))

(declare-fun b!1219064 () Bool)

(assert (=> b!1219064 (= e!692150 call!60648)))

(declare-fun b!1219065 () Bool)

(assert (=> b!1219065 (= e!692148 e!692146)))

(declare-fun c!120156 () Bool)

(assert (=> b!1219065 (= c!120156 (bvslt from!1455 (size!38491 _keys!1208)))))

(declare-fun b!1219066 () Bool)

(declare-fun lt!554102 () Unit!40253)

(declare-fun lt!554100 () Unit!40253)

(assert (=> b!1219066 (= lt!554102 lt!554100)))

(declare-fun lt!554101 () (_ BitVec 64))

(declare-fun lt!554099 () (_ BitVec 64))

(declare-fun lt!554097 () V!46425)

(declare-fun lt!554098 () ListLongMap!18049)

(assert (=> b!1219066 (not (contains!6989 (+!4108 lt!554098 (tuple2!20081 lt!554099 lt!554097)) lt!554101))))

(assert (=> b!1219066 (= lt!554100 (addStillNotContains!302 lt!554098 lt!554099 lt!554097 lt!554101))))

(assert (=> b!1219066 (= lt!554101 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219066 (= lt!554097 (get!19363 (select (arr!37954 _values!996) from!1455) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219066 (= lt!554099 (select (arr!37953 _keys!1208) from!1455))))

(assert (=> b!1219066 (= lt!554098 call!60648)))

(assert (=> b!1219066 (= e!692150 (+!4108 call!60648 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1219067 () Bool)

(assert (=> b!1219067 (= e!692149 (ListLongMap!18050 Nil!26857))))

(declare-fun b!1219068 () Bool)

(declare-fun e!692151 () Bool)

(assert (=> b!1219068 (= e!692148 e!692151)))

(assert (=> b!1219068 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38491 _keys!1208)))))

(declare-fun res!809681 () Bool)

(assert (=> b!1219068 (= res!809681 (contains!6989 lt!554103 (select (arr!37953 _keys!1208) from!1455)))))

(assert (=> b!1219068 (=> (not res!809681) (not e!692151))))

(declare-fun b!1219069 () Bool)

(assert (=> b!1219069 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38491 _keys!1208)))))

(assert (=> b!1219069 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38492 _values!996)))))

(assert (=> b!1219069 (= e!692151 (= (apply!966 lt!554103 (select (arr!37953 _keys!1208) from!1455)) (get!19363 (select (arr!37954 _values!996) from!1455) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133541 c!120154) b!1219067))

(assert (= (and d!133541 (not c!120154)) b!1219058))

(assert (= (and b!1219058 c!120157) b!1219066))

(assert (= (and b!1219058 (not c!120157)) b!1219064))

(assert (= (or b!1219066 b!1219064) bm!60645))

(assert (= (and d!133541 res!809682) b!1219060))

(assert (= (and b!1219060 res!809680) b!1219062))

(assert (= (and b!1219062 res!809679) b!1219059))

(assert (= (and b!1219062 c!120155) b!1219068))

(assert (= (and b!1219062 (not c!120155)) b!1219065))

(assert (= (and b!1219068 res!809681) b!1219069))

(assert (= (and b!1219065 c!120156) b!1219061))

(assert (= (and b!1219065 (not c!120156)) b!1219063))

(declare-fun b_lambda!22061 () Bool)

(assert (=> (not b_lambda!22061) (not b!1219066)))

(assert (=> b!1219066 t!40099))

(declare-fun b_and!43707 () Bool)

(assert (= b_and!43705 (and (=> t!40099 result!22733) b_and!43707)))

(declare-fun b_lambda!22063 () Bool)

(assert (=> (not b_lambda!22063) (not b!1219069)))

(assert (=> b!1219069 t!40099))

(declare-fun b_and!43709 () Bool)

(assert (= b_and!43707 (and (=> t!40099 result!22733) b_and!43709)))

(assert (=> b!1219068 m!1123183))

(assert (=> b!1219068 m!1123183))

(declare-fun m!1123381 () Bool)

(assert (=> b!1219068 m!1123381))

(assert (=> b!1219069 m!1123183))

(declare-fun m!1123383 () Bool)

(assert (=> b!1219069 m!1123383))

(assert (=> b!1219069 m!1123201))

(assert (=> b!1219069 m!1123217))

(assert (=> b!1219069 m!1123201))

(declare-fun m!1123385 () Bool)

(assert (=> b!1219069 m!1123385))

(assert (=> b!1219069 m!1123217))

(assert (=> b!1219069 m!1123183))

(declare-fun m!1123387 () Bool)

(assert (=> bm!60645 m!1123387))

(assert (=> b!1219059 m!1123183))

(assert (=> b!1219059 m!1123183))

(assert (=> b!1219059 m!1123193))

(declare-fun m!1123389 () Bool)

(assert (=> b!1219060 m!1123389))

(assert (=> b!1219058 m!1123183))

(assert (=> b!1219058 m!1123183))

(assert (=> b!1219058 m!1123193))

(declare-fun m!1123391 () Bool)

(assert (=> b!1219066 m!1123391))

(assert (=> b!1219066 m!1123201))

(declare-fun m!1123393 () Bool)

(assert (=> b!1219066 m!1123393))

(declare-fun m!1123395 () Bool)

(assert (=> b!1219066 m!1123395))

(assert (=> b!1219066 m!1123217))

(assert (=> b!1219066 m!1123201))

(assert (=> b!1219066 m!1123385))

(declare-fun m!1123397 () Bool)

(assert (=> b!1219066 m!1123397))

(assert (=> b!1219066 m!1123393))

(assert (=> b!1219066 m!1123217))

(assert (=> b!1219066 m!1123183))

(declare-fun m!1123399 () Bool)

(assert (=> b!1219063 m!1123399))

(declare-fun m!1123401 () Bool)

(assert (=> d!133541 m!1123401))

(assert (=> d!133541 m!1123185))

(assert (=> b!1219061 m!1123387))

(assert (=> b!1218890 d!133541))

(declare-fun d!133543 () Bool)

(assert (=> d!133543 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1218889 d!133543))

(declare-fun d!133545 () Bool)

(declare-fun res!809687 () Bool)

(declare-fun e!692158 () Bool)

(assert (=> d!133545 (=> res!809687 e!692158)))

(assert (=> d!133545 (= res!809687 (bvsge #b00000000000000000000000000000000 (size!38491 _keys!1208)))))

(assert (=> d!133545 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!692158)))

(declare-fun b!1219078 () Bool)

(declare-fun e!692159 () Bool)

(assert (=> b!1219078 (= e!692158 e!692159)))

(declare-fun c!120160 () Bool)

(assert (=> b!1219078 (= c!120160 (validKeyInArray!0 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1219079 () Bool)

(declare-fun e!692160 () Bool)

(assert (=> b!1219079 (= e!692159 e!692160)))

(declare-fun lt!554110 () (_ BitVec 64))

(assert (=> b!1219079 (= lt!554110 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!554112 () Unit!40253)

(assert (=> b!1219079 (= lt!554112 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!554110 #b00000000000000000000000000000000))))

(assert (=> b!1219079 (arrayContainsKey!0 _keys!1208 lt!554110 #b00000000000000000000000000000000)))

(declare-fun lt!554111 () Unit!40253)

(assert (=> b!1219079 (= lt!554111 lt!554112)))

(declare-fun res!809688 () Bool)

(declare-datatypes ((SeekEntryResult!9945 0))(
  ( (MissingZero!9945 (index!42151 (_ BitVec 32))) (Found!9945 (index!42152 (_ BitVec 32))) (Intermediate!9945 (undefined!10757 Bool) (index!42153 (_ BitVec 32)) (x!107390 (_ BitVec 32))) (Undefined!9945) (MissingVacant!9945 (index!42154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78642 (_ BitVec 32)) SeekEntryResult!9945)

(assert (=> b!1219079 (= res!809688 (= (seekEntryOrOpen!0 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9945 #b00000000000000000000000000000000)))))

(assert (=> b!1219079 (=> (not res!809688) (not e!692160))))

(declare-fun b!1219080 () Bool)

(declare-fun call!60651 () Bool)

(assert (=> b!1219080 (= e!692160 call!60651)))

(declare-fun b!1219081 () Bool)

(assert (=> b!1219081 (= e!692159 call!60651)))

(declare-fun bm!60648 () Bool)

(assert (=> bm!60648 (= call!60651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!133545 (not res!809687)) b!1219078))

(assert (= (and b!1219078 c!120160) b!1219079))

(assert (= (and b!1219078 (not c!120160)) b!1219081))

(assert (= (and b!1219079 res!809688) b!1219080))

(assert (= (or b!1219080 b!1219081) bm!60648))

(declare-fun m!1123403 () Bool)

(assert (=> b!1219078 m!1123403))

(assert (=> b!1219078 m!1123403))

(declare-fun m!1123405 () Bool)

(assert (=> b!1219078 m!1123405))

(assert (=> b!1219079 m!1123403))

(declare-fun m!1123407 () Bool)

(assert (=> b!1219079 m!1123407))

(declare-fun m!1123409 () Bool)

(assert (=> b!1219079 m!1123409))

(assert (=> b!1219079 m!1123403))

(declare-fun m!1123411 () Bool)

(assert (=> b!1219079 m!1123411))

(declare-fun m!1123413 () Bool)

(assert (=> bm!60648 m!1123413))

(assert (=> b!1218878 d!133545))

(declare-fun d!133547 () Bool)

(assert (=> d!133547 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1218877 d!133547))

(declare-fun d!133549 () Bool)

(assert (=> d!133549 (= (validKeyInArray!0 (select (arr!37953 _keys!1208) from!1455)) (and (not (= (select (arr!37953 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37953 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1218888 d!133549))

(declare-fun call!60656 () ListLongMap!18049)

(declare-fun e!692165 () Bool)

(declare-fun b!1219088 () Bool)

(declare-fun call!60657 () ListLongMap!18049)

(assert (=> b!1219088 (= e!692165 (= call!60657 (-!1872 call!60656 k0!934)))))

(assert (=> b!1219088 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38492 _values!996)))))

(declare-fun b!1219089 () Bool)

(assert (=> b!1219089 (= e!692165 (= call!60657 call!60656))))

(assert (=> b!1219089 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38492 _values!996)))))

(declare-fun bm!60653 () Bool)

(assert (=> bm!60653 (= call!60657 (getCurrentListMapNoExtraKeys!5478 (array!78643 (store (arr!37953 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38491 _keys!1208)) (array!78645 (store (arr!37954 _values!996) i!673 (ValueCellFull!14777 (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38492 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219090 () Bool)

(declare-fun e!692166 () Bool)

(assert (=> b!1219090 (= e!692166 e!692165)))

(declare-fun c!120163 () Bool)

(assert (=> b!1219090 (= c!120163 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!133551 () Bool)

(assert (=> d!133551 e!692166))

(declare-fun res!809691 () Bool)

(assert (=> d!133551 (=> (not res!809691) (not e!692166))))

(assert (=> d!133551 (= res!809691 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38491 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38491 _keys!1208))))))))

(declare-fun lt!554115 () Unit!40253)

(declare-fun choose!1832 (array!78642 array!78644 (_ BitVec 32) (_ BitVec 32) V!46425 V!46425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40253)

(assert (=> d!133551 (= lt!554115 (choose!1832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133551 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(assert (=> d!133551 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1107 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554115)))

(declare-fun bm!60654 () Bool)

(assert (=> bm!60654 (= call!60656 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133551 res!809691) b!1219090))

(assert (= (and b!1219090 c!120163) b!1219088))

(assert (= (and b!1219090 (not c!120163)) b!1219089))

(assert (= (or b!1219088 b!1219089) bm!60654))

(assert (= (or b!1219088 b!1219089) bm!60653))

(declare-fun b_lambda!22065 () Bool)

(assert (=> (not b_lambda!22065) (not bm!60653)))

(assert (=> bm!60653 t!40099))

(declare-fun b_and!43711 () Bool)

(assert (= b_and!43709 (and (=> t!40099 result!22733) b_and!43711)))

(declare-fun m!1123415 () Bool)

(assert (=> b!1219088 m!1123415))

(assert (=> bm!60653 m!1123229))

(assert (=> bm!60653 m!1123201))

(declare-fun m!1123417 () Bool)

(assert (=> bm!60653 m!1123417))

(declare-fun m!1123419 () Bool)

(assert (=> bm!60653 m!1123419))

(declare-fun m!1123421 () Bool)

(assert (=> d!133551 m!1123421))

(assert (=> bm!60654 m!1123187))

(assert (=> b!1218888 d!133551))

(declare-fun d!133553 () Bool)

(declare-fun lt!554118 () ListLongMap!18049)

(assert (=> d!133553 (not (contains!6989 lt!554118 k0!934))))

(declare-fun removeStrictlySorted!106 (List!26860 (_ BitVec 64)) List!26860)

(assert (=> d!133553 (= lt!554118 (ListLongMap!18050 (removeStrictlySorted!106 (toList!9040 lt!554002) k0!934)))))

(assert (=> d!133553 (= (-!1872 lt!554002 k0!934) lt!554118)))

(declare-fun bs!34310 () Bool)

(assert (= bs!34310 d!133553))

(declare-fun m!1123423 () Bool)

(assert (=> bs!34310 m!1123423))

(declare-fun m!1123425 () Bool)

(assert (=> bs!34310 m!1123425))

(assert (=> b!1218888 d!133553))

(declare-fun b!1219091 () Bool)

(declare-fun e!692171 () ListLongMap!18049)

(declare-fun e!692172 () ListLongMap!18049)

(assert (=> b!1219091 (= e!692171 e!692172)))

(declare-fun c!120167 () Bool)

(assert (=> b!1219091 (= c!120167 (validKeyInArray!0 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1219092 () Bool)

(declare-fun e!692167 () Bool)

(assert (=> b!1219092 (= e!692167 (validKeyInArray!0 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219092 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60655 () Bool)

(declare-fun call!60658 () ListLongMap!18049)

(assert (=> bm!60655 (= call!60658 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133555 () Bool)

(declare-fun e!692169 () Bool)

(assert (=> d!133555 e!692169))

(declare-fun res!809695 () Bool)

(assert (=> d!133555 (=> (not res!809695) (not e!692169))))

(declare-fun lt!554125 () ListLongMap!18049)

(assert (=> d!133555 (= res!809695 (not (contains!6989 lt!554125 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133555 (= lt!554125 e!692171)))

(declare-fun c!120164 () Bool)

(assert (=> d!133555 (= c!120164 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(assert (=> d!133555 (validMask!0 mask!1564)))

(assert (=> d!133555 (= (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554125)))

(declare-fun b!1219093 () Bool)

(declare-fun res!809693 () Bool)

(assert (=> b!1219093 (=> (not res!809693) (not e!692169))))

(assert (=> b!1219093 (= res!809693 (not (contains!6989 lt!554125 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!692168 () Bool)

(declare-fun b!1219094 () Bool)

(assert (=> b!1219094 (= e!692168 (= lt!554125 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1219095 () Bool)

(declare-fun e!692170 () Bool)

(assert (=> b!1219095 (= e!692169 e!692170)))

(declare-fun c!120165 () Bool)

(assert (=> b!1219095 (= c!120165 e!692167)))

(declare-fun res!809692 () Bool)

(assert (=> b!1219095 (=> (not res!809692) (not e!692167))))

(assert (=> b!1219095 (= res!809692 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(declare-fun b!1219096 () Bool)

(assert (=> b!1219096 (= e!692168 (isEmpty!1002 lt!554125))))

(declare-fun b!1219097 () Bool)

(assert (=> b!1219097 (= e!692172 call!60658)))

(declare-fun b!1219098 () Bool)

(assert (=> b!1219098 (= e!692170 e!692168)))

(declare-fun c!120166 () Bool)

(assert (=> b!1219098 (= c!120166 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(declare-fun b!1219099 () Bool)

(declare-fun lt!554124 () Unit!40253)

(declare-fun lt!554122 () Unit!40253)

(assert (=> b!1219099 (= lt!554124 lt!554122)))

(declare-fun lt!554119 () V!46425)

(declare-fun lt!554123 () (_ BitVec 64))

(declare-fun lt!554121 () (_ BitVec 64))

(declare-fun lt!554120 () ListLongMap!18049)

(assert (=> b!1219099 (not (contains!6989 (+!4108 lt!554120 (tuple2!20081 lt!554121 lt!554119)) lt!554123))))

(assert (=> b!1219099 (= lt!554122 (addStillNotContains!302 lt!554120 lt!554121 lt!554119 lt!554123))))

(assert (=> b!1219099 (= lt!554123 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219099 (= lt!554119 (get!19363 (select (arr!37954 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219099 (= lt!554121 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1219099 (= lt!554120 call!60658)))

(assert (=> b!1219099 (= e!692172 (+!4108 call!60658 (tuple2!20081 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19363 (select (arr!37954 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1219100 () Bool)

(assert (=> b!1219100 (= e!692171 (ListLongMap!18050 Nil!26857))))

(declare-fun b!1219101 () Bool)

(declare-fun e!692173 () Bool)

(assert (=> b!1219101 (= e!692170 e!692173)))

(assert (=> b!1219101 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(declare-fun res!809694 () Bool)

(assert (=> b!1219101 (= res!809694 (contains!6989 lt!554125 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219101 (=> (not res!809694) (not e!692173))))

(declare-fun b!1219102 () Bool)

(assert (=> b!1219102 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(assert (=> b!1219102 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38492 _values!996)))))

(assert (=> b!1219102 (= e!692173 (= (apply!966 lt!554125 (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19363 (select (arr!37954 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133555 c!120164) b!1219100))

(assert (= (and d!133555 (not c!120164)) b!1219091))

(assert (= (and b!1219091 c!120167) b!1219099))

(assert (= (and b!1219091 (not c!120167)) b!1219097))

(assert (= (or b!1219099 b!1219097) bm!60655))

(assert (= (and d!133555 res!809695) b!1219093))

(assert (= (and b!1219093 res!809693) b!1219095))

(assert (= (and b!1219095 res!809692) b!1219092))

(assert (= (and b!1219095 c!120165) b!1219101))

(assert (= (and b!1219095 (not c!120165)) b!1219098))

(assert (= (and b!1219101 res!809694) b!1219102))

(assert (= (and b!1219098 c!120166) b!1219094))

(assert (= (and b!1219098 (not c!120166)) b!1219096))

(declare-fun b_lambda!22067 () Bool)

(assert (=> (not b_lambda!22067) (not b!1219099)))

(assert (=> b!1219099 t!40099))

(declare-fun b_and!43713 () Bool)

(assert (= b_and!43711 (and (=> t!40099 result!22733) b_and!43713)))

(declare-fun b_lambda!22069 () Bool)

(assert (=> (not b_lambda!22069) (not b!1219102)))

(assert (=> b!1219102 t!40099))

(declare-fun b_and!43715 () Bool)

(assert (= b_and!43713 (and (=> t!40099 result!22733) b_and!43715)))

(declare-fun m!1123427 () Bool)

(assert (=> b!1219101 m!1123427))

(assert (=> b!1219101 m!1123427))

(declare-fun m!1123429 () Bool)

(assert (=> b!1219101 m!1123429))

(assert (=> b!1219102 m!1123427))

(declare-fun m!1123431 () Bool)

(assert (=> b!1219102 m!1123431))

(assert (=> b!1219102 m!1123201))

(declare-fun m!1123433 () Bool)

(assert (=> b!1219102 m!1123433))

(assert (=> b!1219102 m!1123201))

(declare-fun m!1123435 () Bool)

(assert (=> b!1219102 m!1123435))

(assert (=> b!1219102 m!1123433))

(assert (=> b!1219102 m!1123427))

(declare-fun m!1123437 () Bool)

(assert (=> bm!60655 m!1123437))

(assert (=> b!1219092 m!1123427))

(assert (=> b!1219092 m!1123427))

(declare-fun m!1123439 () Bool)

(assert (=> b!1219092 m!1123439))

(declare-fun m!1123441 () Bool)

(assert (=> b!1219093 m!1123441))

(assert (=> b!1219091 m!1123427))

(assert (=> b!1219091 m!1123427))

(assert (=> b!1219091 m!1123439))

(declare-fun m!1123443 () Bool)

(assert (=> b!1219099 m!1123443))

(assert (=> b!1219099 m!1123201))

(declare-fun m!1123445 () Bool)

(assert (=> b!1219099 m!1123445))

(declare-fun m!1123447 () Bool)

(assert (=> b!1219099 m!1123447))

(assert (=> b!1219099 m!1123433))

(assert (=> b!1219099 m!1123201))

(assert (=> b!1219099 m!1123435))

(declare-fun m!1123449 () Bool)

(assert (=> b!1219099 m!1123449))

(assert (=> b!1219099 m!1123445))

(assert (=> b!1219099 m!1123433))

(assert (=> b!1219099 m!1123427))

(declare-fun m!1123451 () Bool)

(assert (=> b!1219096 m!1123451))

(declare-fun m!1123453 () Bool)

(assert (=> d!133555 m!1123453))

(assert (=> d!133555 m!1123185))

(assert (=> b!1219094 m!1123437))

(assert (=> b!1218888 d!133555))

(declare-fun b!1219103 () Bool)

(declare-fun e!692178 () ListLongMap!18049)

(declare-fun e!692179 () ListLongMap!18049)

(assert (=> b!1219103 (= e!692178 e!692179)))

(declare-fun c!120171 () Bool)

(assert (=> b!1219103 (= c!120171 (validKeyInArray!0 (select (arr!37953 lt!554003) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1219104 () Bool)

(declare-fun e!692174 () Bool)

(assert (=> b!1219104 (= e!692174 (validKeyInArray!0 (select (arr!37953 lt!554003) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219104 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60656 () Bool)

(declare-fun call!60659 () ListLongMap!18049)

(assert (=> bm!60656 (= call!60659 (getCurrentListMapNoExtraKeys!5478 lt!554003 lt!554001 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133557 () Bool)

(declare-fun e!692176 () Bool)

(assert (=> d!133557 e!692176))

(declare-fun res!809699 () Bool)

(assert (=> d!133557 (=> (not res!809699) (not e!692176))))

(declare-fun lt!554132 () ListLongMap!18049)

(assert (=> d!133557 (= res!809699 (not (contains!6989 lt!554132 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133557 (= lt!554132 e!692178)))

(declare-fun c!120168 () Bool)

(assert (=> d!133557 (= c!120168 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 lt!554003)))))

(assert (=> d!133557 (validMask!0 mask!1564)))

(assert (=> d!133557 (= (getCurrentListMapNoExtraKeys!5478 lt!554003 lt!554001 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554132)))

(declare-fun b!1219105 () Bool)

(declare-fun res!809697 () Bool)

(assert (=> b!1219105 (=> (not res!809697) (not e!692176))))

(assert (=> b!1219105 (= res!809697 (not (contains!6989 lt!554132 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219106 () Bool)

(declare-fun e!692175 () Bool)

(assert (=> b!1219106 (= e!692175 (= lt!554132 (getCurrentListMapNoExtraKeys!5478 lt!554003 lt!554001 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1219107 () Bool)

(declare-fun e!692177 () Bool)

(assert (=> b!1219107 (= e!692176 e!692177)))

(declare-fun c!120169 () Bool)

(assert (=> b!1219107 (= c!120169 e!692174)))

(declare-fun res!809696 () Bool)

(assert (=> b!1219107 (=> (not res!809696) (not e!692174))))

(assert (=> b!1219107 (= res!809696 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 lt!554003)))))

(declare-fun b!1219108 () Bool)

(assert (=> b!1219108 (= e!692175 (isEmpty!1002 lt!554132))))

(declare-fun b!1219109 () Bool)

(assert (=> b!1219109 (= e!692179 call!60659)))

(declare-fun b!1219110 () Bool)

(assert (=> b!1219110 (= e!692177 e!692175)))

(declare-fun c!120170 () Bool)

(assert (=> b!1219110 (= c!120170 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 lt!554003)))))

(declare-fun b!1219111 () Bool)

(declare-fun lt!554131 () Unit!40253)

(declare-fun lt!554129 () Unit!40253)

(assert (=> b!1219111 (= lt!554131 lt!554129)))

(declare-fun lt!554126 () V!46425)

(declare-fun lt!554128 () (_ BitVec 64))

(declare-fun lt!554130 () (_ BitVec 64))

(declare-fun lt!554127 () ListLongMap!18049)

(assert (=> b!1219111 (not (contains!6989 (+!4108 lt!554127 (tuple2!20081 lt!554128 lt!554126)) lt!554130))))

(assert (=> b!1219111 (= lt!554129 (addStillNotContains!302 lt!554127 lt!554128 lt!554126 lt!554130))))

(assert (=> b!1219111 (= lt!554130 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219111 (= lt!554126 (get!19363 (select (arr!37954 lt!554001) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219111 (= lt!554128 (select (arr!37953 lt!554003) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1219111 (= lt!554127 call!60659)))

(assert (=> b!1219111 (= e!692179 (+!4108 call!60659 (tuple2!20081 (select (arr!37953 lt!554003) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19363 (select (arr!37954 lt!554001) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1219112 () Bool)

(assert (=> b!1219112 (= e!692178 (ListLongMap!18050 Nil!26857))))

(declare-fun b!1219113 () Bool)

(declare-fun e!692180 () Bool)

(assert (=> b!1219113 (= e!692177 e!692180)))

(assert (=> b!1219113 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 lt!554003)))))

(declare-fun res!809698 () Bool)

(assert (=> b!1219113 (= res!809698 (contains!6989 lt!554132 (select (arr!37953 lt!554003) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219113 (=> (not res!809698) (not e!692180))))

(declare-fun b!1219114 () Bool)

(assert (=> b!1219114 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 lt!554003)))))

(assert (=> b!1219114 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38492 lt!554001)))))

(assert (=> b!1219114 (= e!692180 (= (apply!966 lt!554132 (select (arr!37953 lt!554003) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19363 (select (arr!37954 lt!554001) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133557 c!120168) b!1219112))

(assert (= (and d!133557 (not c!120168)) b!1219103))

(assert (= (and b!1219103 c!120171) b!1219111))

(assert (= (and b!1219103 (not c!120171)) b!1219109))

(assert (= (or b!1219111 b!1219109) bm!60656))

(assert (= (and d!133557 res!809699) b!1219105))

(assert (= (and b!1219105 res!809697) b!1219107))

(assert (= (and b!1219107 res!809696) b!1219104))

(assert (= (and b!1219107 c!120169) b!1219113))

(assert (= (and b!1219107 (not c!120169)) b!1219110))

(assert (= (and b!1219113 res!809698) b!1219114))

(assert (= (and b!1219110 c!120170) b!1219106))

(assert (= (and b!1219110 (not c!120170)) b!1219108))

(declare-fun b_lambda!22071 () Bool)

(assert (=> (not b_lambda!22071) (not b!1219111)))

(assert (=> b!1219111 t!40099))

(declare-fun b_and!43717 () Bool)

(assert (= b_and!43715 (and (=> t!40099 result!22733) b_and!43717)))

(declare-fun b_lambda!22073 () Bool)

(assert (=> (not b_lambda!22073) (not b!1219114)))

(assert (=> b!1219114 t!40099))

(declare-fun b_and!43719 () Bool)

(assert (= b_and!43717 (and (=> t!40099 result!22733) b_and!43719)))

(declare-fun m!1123455 () Bool)

(assert (=> b!1219113 m!1123455))

(assert (=> b!1219113 m!1123455))

(declare-fun m!1123457 () Bool)

(assert (=> b!1219113 m!1123457))

(assert (=> b!1219114 m!1123455))

(declare-fun m!1123459 () Bool)

(assert (=> b!1219114 m!1123459))

(assert (=> b!1219114 m!1123201))

(declare-fun m!1123461 () Bool)

(assert (=> b!1219114 m!1123461))

(assert (=> b!1219114 m!1123201))

(declare-fun m!1123463 () Bool)

(assert (=> b!1219114 m!1123463))

(assert (=> b!1219114 m!1123461))

(assert (=> b!1219114 m!1123455))

(declare-fun m!1123465 () Bool)

(assert (=> bm!60656 m!1123465))

(assert (=> b!1219104 m!1123455))

(assert (=> b!1219104 m!1123455))

(declare-fun m!1123467 () Bool)

(assert (=> b!1219104 m!1123467))

(declare-fun m!1123469 () Bool)

(assert (=> b!1219105 m!1123469))

(assert (=> b!1219103 m!1123455))

(assert (=> b!1219103 m!1123455))

(assert (=> b!1219103 m!1123467))

(declare-fun m!1123471 () Bool)

(assert (=> b!1219111 m!1123471))

(assert (=> b!1219111 m!1123201))

(declare-fun m!1123473 () Bool)

(assert (=> b!1219111 m!1123473))

(declare-fun m!1123475 () Bool)

(assert (=> b!1219111 m!1123475))

(assert (=> b!1219111 m!1123461))

(assert (=> b!1219111 m!1123201))

(assert (=> b!1219111 m!1123463))

(declare-fun m!1123477 () Bool)

(assert (=> b!1219111 m!1123477))

(assert (=> b!1219111 m!1123473))

(assert (=> b!1219111 m!1123461))

(assert (=> b!1219111 m!1123455))

(declare-fun m!1123479 () Bool)

(assert (=> b!1219108 m!1123479))

(declare-fun m!1123481 () Bool)

(assert (=> d!133557 m!1123481))

(assert (=> d!133557 m!1123185))

(assert (=> b!1219106 m!1123465))

(assert (=> b!1218888 d!133557))

(declare-fun d!133559 () Bool)

(declare-fun res!809700 () Bool)

(declare-fun e!692181 () Bool)

(assert (=> d!133559 (=> res!809700 e!692181)))

(assert (=> d!133559 (= res!809700 (bvsge #b00000000000000000000000000000000 (size!38491 lt!554003)))))

(assert (=> d!133559 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554003 mask!1564) e!692181)))

(declare-fun b!1219115 () Bool)

(declare-fun e!692182 () Bool)

(assert (=> b!1219115 (= e!692181 e!692182)))

(declare-fun c!120172 () Bool)

(assert (=> b!1219115 (= c!120172 (validKeyInArray!0 (select (arr!37953 lt!554003) #b00000000000000000000000000000000)))))

(declare-fun b!1219116 () Bool)

(declare-fun e!692183 () Bool)

(assert (=> b!1219116 (= e!692182 e!692183)))

(declare-fun lt!554133 () (_ BitVec 64))

(assert (=> b!1219116 (= lt!554133 (select (arr!37953 lt!554003) #b00000000000000000000000000000000))))

(declare-fun lt!554135 () Unit!40253)

(assert (=> b!1219116 (= lt!554135 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!554003 lt!554133 #b00000000000000000000000000000000))))

(assert (=> b!1219116 (arrayContainsKey!0 lt!554003 lt!554133 #b00000000000000000000000000000000)))

(declare-fun lt!554134 () Unit!40253)

(assert (=> b!1219116 (= lt!554134 lt!554135)))

(declare-fun res!809701 () Bool)

(assert (=> b!1219116 (= res!809701 (= (seekEntryOrOpen!0 (select (arr!37953 lt!554003) #b00000000000000000000000000000000) lt!554003 mask!1564) (Found!9945 #b00000000000000000000000000000000)))))

(assert (=> b!1219116 (=> (not res!809701) (not e!692183))))

(declare-fun b!1219117 () Bool)

(declare-fun call!60660 () Bool)

(assert (=> b!1219117 (= e!692183 call!60660)))

(declare-fun b!1219118 () Bool)

(assert (=> b!1219118 (= e!692182 call!60660)))

(declare-fun bm!60657 () Bool)

(assert (=> bm!60657 (= call!60660 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!554003 mask!1564))))

(assert (= (and d!133559 (not res!809700)) b!1219115))

(assert (= (and b!1219115 c!120172) b!1219116))

(assert (= (and b!1219115 (not c!120172)) b!1219118))

(assert (= (and b!1219116 res!809701) b!1219117))

(assert (= (or b!1219117 b!1219118) bm!60657))

(declare-fun m!1123483 () Bool)

(assert (=> b!1219115 m!1123483))

(assert (=> b!1219115 m!1123483))

(declare-fun m!1123485 () Bool)

(assert (=> b!1219115 m!1123485))

(assert (=> b!1219116 m!1123483))

(declare-fun m!1123487 () Bool)

(assert (=> b!1219116 m!1123487))

(declare-fun m!1123489 () Bool)

(assert (=> b!1219116 m!1123489))

(assert (=> b!1219116 m!1123483))

(declare-fun m!1123491 () Bool)

(assert (=> b!1219116 m!1123491))

(declare-fun m!1123493 () Bool)

(assert (=> bm!60657 m!1123493))

(assert (=> b!1218887 d!133559))

(declare-fun bm!60660 () Bool)

(declare-fun call!60663 () Bool)

(declare-fun c!120175 () Bool)

(assert (=> bm!60660 (= call!60663 (arrayNoDuplicates!0 lt!554003 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120175 (Cons!26857 (select (arr!37953 lt!554003) #b00000000000000000000000000000000) Nil!26858) Nil!26858)))))

(declare-fun b!1219129 () Bool)

(declare-fun e!692192 () Bool)

(assert (=> b!1219129 (= e!692192 call!60663)))

(declare-fun b!1219130 () Bool)

(declare-fun e!692194 () Bool)

(assert (=> b!1219130 (= e!692194 e!692192)))

(assert (=> b!1219130 (= c!120175 (validKeyInArray!0 (select (arr!37953 lt!554003) #b00000000000000000000000000000000)))))

(declare-fun b!1219131 () Bool)

(declare-fun e!692195 () Bool)

(declare-fun contains!6990 (List!26861 (_ BitVec 64)) Bool)

(assert (=> b!1219131 (= e!692195 (contains!6990 Nil!26858 (select (arr!37953 lt!554003) #b00000000000000000000000000000000)))))

(declare-fun b!1219132 () Bool)

(assert (=> b!1219132 (= e!692192 call!60663)))

(declare-fun d!133561 () Bool)

(declare-fun res!809710 () Bool)

(declare-fun e!692193 () Bool)

(assert (=> d!133561 (=> res!809710 e!692193)))

(assert (=> d!133561 (= res!809710 (bvsge #b00000000000000000000000000000000 (size!38491 lt!554003)))))

(assert (=> d!133561 (= (arrayNoDuplicates!0 lt!554003 #b00000000000000000000000000000000 Nil!26858) e!692193)))

(declare-fun b!1219133 () Bool)

(assert (=> b!1219133 (= e!692193 e!692194)))

(declare-fun res!809709 () Bool)

(assert (=> b!1219133 (=> (not res!809709) (not e!692194))))

(assert (=> b!1219133 (= res!809709 (not e!692195))))

(declare-fun res!809708 () Bool)

(assert (=> b!1219133 (=> (not res!809708) (not e!692195))))

(assert (=> b!1219133 (= res!809708 (validKeyInArray!0 (select (arr!37953 lt!554003) #b00000000000000000000000000000000)))))

(assert (= (and d!133561 (not res!809710)) b!1219133))

(assert (= (and b!1219133 res!809708) b!1219131))

(assert (= (and b!1219133 res!809709) b!1219130))

(assert (= (and b!1219130 c!120175) b!1219129))

(assert (= (and b!1219130 (not c!120175)) b!1219132))

(assert (= (or b!1219129 b!1219132) bm!60660))

(assert (=> bm!60660 m!1123483))

(declare-fun m!1123495 () Bool)

(assert (=> bm!60660 m!1123495))

(assert (=> b!1219130 m!1123483))

(assert (=> b!1219130 m!1123483))

(assert (=> b!1219130 m!1123485))

(assert (=> b!1219131 m!1123483))

(assert (=> b!1219131 m!1123483))

(declare-fun m!1123497 () Bool)

(assert (=> b!1219131 m!1123497))

(assert (=> b!1219133 m!1123483))

(assert (=> b!1219133 m!1123483))

(assert (=> b!1219133 m!1123485))

(assert (=> b!1218894 d!133561))

(declare-fun d!133563 () Bool)

(declare-fun e!692198 () Bool)

(assert (=> d!133563 e!692198))

(declare-fun res!809716 () Bool)

(assert (=> d!133563 (=> (not res!809716) (not e!692198))))

(declare-fun lt!554146 () ListLongMap!18049)

(assert (=> d!133563 (= res!809716 (contains!6989 lt!554146 (_1!10051 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000)))))))

(declare-fun lt!554144 () List!26860)

(assert (=> d!133563 (= lt!554146 (ListLongMap!18050 lt!554144))))

(declare-fun lt!554145 () Unit!40253)

(declare-fun lt!554147 () Unit!40253)

(assert (=> d!133563 (= lt!554145 lt!554147)))

(declare-datatypes ((Option!697 0))(
  ( (Some!696 (v!18201 V!46425)) (None!695) )
))
(declare-fun getValueByKey!646 (List!26860 (_ BitVec 64)) Option!697)

(assert (=> d!133563 (= (getValueByKey!646 lt!554144 (_1!10051 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000)))) (Some!696 (_2!10051 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!322 (List!26860 (_ BitVec 64) V!46425) Unit!40253)

(assert (=> d!133563 (= lt!554147 (lemmaContainsTupThenGetReturnValue!322 lt!554144 (_1!10051 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000))) (_2!10051 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000)))))))

(declare-fun insertStrictlySorted!415 (List!26860 (_ BitVec 64) V!46425) List!26860)

(assert (=> d!133563 (= lt!554144 (insertStrictlySorted!415 (toList!9040 lt!554009) (_1!10051 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000))) (_2!10051 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000)))))))

(assert (=> d!133563 (= (+!4108 lt!554009 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000))) lt!554146)))

(declare-fun b!1219138 () Bool)

(declare-fun res!809715 () Bool)

(assert (=> b!1219138 (=> (not res!809715) (not e!692198))))

(assert (=> b!1219138 (= res!809715 (= (getValueByKey!646 (toList!9040 lt!554146) (_1!10051 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000)))) (Some!696 (_2!10051 (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000))))))))

(declare-fun b!1219139 () Bool)

(declare-fun contains!6991 (List!26860 tuple2!20080) Bool)

(assert (=> b!1219139 (= e!692198 (contains!6991 (toList!9040 lt!554146) (tuple2!20081 (select (arr!37953 _keys!1208) from!1455) (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000))))))

(assert (= (and d!133563 res!809716) b!1219138))

(assert (= (and b!1219138 res!809715) b!1219139))

(declare-fun m!1123499 () Bool)

(assert (=> d!133563 m!1123499))

(declare-fun m!1123501 () Bool)

(assert (=> d!133563 m!1123501))

(declare-fun m!1123503 () Bool)

(assert (=> d!133563 m!1123503))

(declare-fun m!1123505 () Bool)

(assert (=> d!133563 m!1123505))

(declare-fun m!1123507 () Bool)

(assert (=> b!1219138 m!1123507))

(declare-fun m!1123509 () Bool)

(assert (=> b!1219139 m!1123509))

(assert (=> b!1218884 d!133563))

(declare-fun d!133565 () Bool)

(declare-fun c!120178 () Bool)

(assert (=> d!133565 (= c!120178 ((_ is ValueCellFull!14777) (select (arr!37954 _values!996) from!1455)))))

(declare-fun e!692201 () V!46425)

(assert (=> d!133565 (= (get!19363 (select (arr!37954 _values!996) from!1455) lt!554000) e!692201)))

(declare-fun b!1219144 () Bool)

(declare-fun get!19365 (ValueCell!14777 V!46425) V!46425)

(assert (=> b!1219144 (= e!692201 (get!19365 (select (arr!37954 _values!996) from!1455) lt!554000))))

(declare-fun b!1219145 () Bool)

(declare-fun get!19366 (ValueCell!14777 V!46425) V!46425)

(assert (=> b!1219145 (= e!692201 (get!19366 (select (arr!37954 _values!996) from!1455) lt!554000))))

(assert (= (and d!133565 c!120178) b!1219144))

(assert (= (and d!133565 (not c!120178)) b!1219145))

(assert (=> b!1219144 m!1123217))

(declare-fun m!1123511 () Bool)

(assert (=> b!1219144 m!1123511))

(assert (=> b!1219145 m!1123217))

(declare-fun m!1123513 () Bool)

(assert (=> b!1219145 m!1123513))

(assert (=> b!1218884 d!133565))

(declare-fun d!133567 () Bool)

(declare-fun res!809717 () Bool)

(declare-fun e!692202 () Bool)

(assert (=> d!133567 (=> res!809717 e!692202)))

(assert (=> d!133567 (= res!809717 (= (select (arr!37953 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133567 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!692202)))

(declare-fun b!1219146 () Bool)

(declare-fun e!692203 () Bool)

(assert (=> b!1219146 (= e!692202 e!692203)))

(declare-fun res!809718 () Bool)

(assert (=> b!1219146 (=> (not res!809718) (not e!692203))))

(assert (=> b!1219146 (= res!809718 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38491 _keys!1208)))))

(declare-fun b!1219147 () Bool)

(assert (=> b!1219147 (= e!692203 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133567 (not res!809717)) b!1219146))

(assert (= (and b!1219146 res!809718) b!1219147))

(assert (=> d!133567 m!1123427))

(declare-fun m!1123515 () Bool)

(assert (=> b!1219147 m!1123515))

(assert (=> b!1218893 d!133567))

(declare-fun d!133569 () Bool)

(assert (=> d!133569 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554150 () Unit!40253)

(declare-fun choose!114 (array!78642 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40253)

(assert (=> d!133569 (= lt!554150 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!133569 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133569 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!554150)))

(declare-fun bs!34311 () Bool)

(assert (= bs!34311 d!133569))

(assert (=> bs!34311 m!1123213))

(declare-fun m!1123517 () Bool)

(assert (=> bs!34311 m!1123517))

(assert (=> b!1218893 d!133569))

(declare-fun bm!60661 () Bool)

(declare-fun call!60664 () Bool)

(declare-fun c!120179 () Bool)

(assert (=> bm!60661 (= call!60664 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120179 (Cons!26857 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000) Nil!26858) Nil!26858)))))

(declare-fun b!1219148 () Bool)

(declare-fun e!692204 () Bool)

(assert (=> b!1219148 (= e!692204 call!60664)))

(declare-fun b!1219149 () Bool)

(declare-fun e!692206 () Bool)

(assert (=> b!1219149 (= e!692206 e!692204)))

(assert (=> b!1219149 (= c!120179 (validKeyInArray!0 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1219150 () Bool)

(declare-fun e!692207 () Bool)

(assert (=> b!1219150 (= e!692207 (contains!6990 Nil!26858 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1219151 () Bool)

(assert (=> b!1219151 (= e!692204 call!60664)))

(declare-fun d!133571 () Bool)

(declare-fun res!809721 () Bool)

(declare-fun e!692205 () Bool)

(assert (=> d!133571 (=> res!809721 e!692205)))

(assert (=> d!133571 (= res!809721 (bvsge #b00000000000000000000000000000000 (size!38491 _keys!1208)))))

(assert (=> d!133571 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26858) e!692205)))

(declare-fun b!1219152 () Bool)

(assert (=> b!1219152 (= e!692205 e!692206)))

(declare-fun res!809720 () Bool)

(assert (=> b!1219152 (=> (not res!809720) (not e!692206))))

(assert (=> b!1219152 (= res!809720 (not e!692207))))

(declare-fun res!809719 () Bool)

(assert (=> b!1219152 (=> (not res!809719) (not e!692207))))

(assert (=> b!1219152 (= res!809719 (validKeyInArray!0 (select (arr!37953 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133571 (not res!809721)) b!1219152))

(assert (= (and b!1219152 res!809719) b!1219150))

(assert (= (and b!1219152 res!809720) b!1219149))

(assert (= (and b!1219149 c!120179) b!1219148))

(assert (= (and b!1219149 (not c!120179)) b!1219151))

(assert (= (or b!1219148 b!1219151) bm!60661))

(assert (=> bm!60661 m!1123403))

(declare-fun m!1123519 () Bool)

(assert (=> bm!60661 m!1123519))

(assert (=> b!1219149 m!1123403))

(assert (=> b!1219149 m!1123403))

(assert (=> b!1219149 m!1123405))

(assert (=> b!1219150 m!1123403))

(assert (=> b!1219150 m!1123403))

(declare-fun m!1123521 () Bool)

(assert (=> b!1219150 m!1123521))

(assert (=> b!1219152 m!1123403))

(assert (=> b!1219152 m!1123403))

(assert (=> b!1219152 m!1123405))

(assert (=> b!1218892 d!133571))

(declare-fun d!133573 () Bool)

(assert (=> d!133573 (= (array_inv!29006 _keys!1208) (bvsge (size!38491 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101418 d!133573))

(declare-fun d!133575 () Bool)

(assert (=> d!133575 (= (array_inv!29007 _values!996) (bvsge (size!38492 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101418 d!133575))

(declare-fun d!133577 () Bool)

(declare-fun res!809722 () Bool)

(declare-fun e!692208 () Bool)

(assert (=> d!133577 (=> res!809722 e!692208)))

(assert (=> d!133577 (= res!809722 (= (select (arr!37953 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133577 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!692208)))

(declare-fun b!1219153 () Bool)

(declare-fun e!692209 () Bool)

(assert (=> b!1219153 (= e!692208 e!692209)))

(declare-fun res!809723 () Bool)

(assert (=> b!1219153 (=> (not res!809723) (not e!692209))))

(assert (=> b!1219153 (= res!809723 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38491 _keys!1208)))))

(declare-fun b!1219154 () Bool)

(assert (=> b!1219154 (= e!692209 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133577 (not res!809722)) b!1219153))

(assert (= (and b!1219153 res!809723) b!1219154))

(assert (=> d!133577 m!1123403))

(declare-fun m!1123523 () Bool)

(assert (=> b!1219154 m!1123523))

(assert (=> b!1218891 d!133577))

(declare-fun d!133579 () Bool)

(assert (=> d!133579 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554153 () Unit!40253)

(declare-fun choose!13 (array!78642 (_ BitVec 64) (_ BitVec 32)) Unit!40253)

(assert (=> d!133579 (= lt!554153 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133579 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133579 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!554153)))

(declare-fun bs!34312 () Bool)

(assert (= bs!34312 d!133579))

(assert (=> bs!34312 m!1123209))

(declare-fun m!1123525 () Bool)

(assert (=> bs!34312 m!1123525))

(assert (=> b!1218891 d!133579))

(declare-fun condMapEmpty!48352 () Bool)

(declare-fun mapDefault!48352 () ValueCell!14777)

(assert (=> mapNonEmpty!48343 (= condMapEmpty!48352 (= mapRest!48343 ((as const (Array (_ BitVec 32) ValueCell!14777)) mapDefault!48352)))))

(declare-fun e!692214 () Bool)

(declare-fun mapRes!48352 () Bool)

(assert (=> mapNonEmpty!48343 (= tp!91838 (and e!692214 mapRes!48352))))

(declare-fun b!1219161 () Bool)

(declare-fun e!692215 () Bool)

(assert (=> b!1219161 (= e!692215 tp_is_empty!30973)))

(declare-fun b!1219162 () Bool)

(assert (=> b!1219162 (= e!692214 tp_is_empty!30973)))

(declare-fun mapIsEmpty!48352 () Bool)

(assert (=> mapIsEmpty!48352 mapRes!48352))

(declare-fun mapNonEmpty!48352 () Bool)

(declare-fun tp!91853 () Bool)

(assert (=> mapNonEmpty!48352 (= mapRes!48352 (and tp!91853 e!692215))))

(declare-fun mapValue!48352 () ValueCell!14777)

(declare-fun mapKey!48352 () (_ BitVec 32))

(declare-fun mapRest!48352 () (Array (_ BitVec 32) ValueCell!14777))

(assert (=> mapNonEmpty!48352 (= mapRest!48343 (store mapRest!48352 mapKey!48352 mapValue!48352))))

(assert (= (and mapNonEmpty!48343 condMapEmpty!48352) mapIsEmpty!48352))

(assert (= (and mapNonEmpty!48343 (not condMapEmpty!48352)) mapNonEmpty!48352))

(assert (= (and mapNonEmpty!48352 ((_ is ValueCellFull!14777) mapValue!48352)) b!1219161))

(assert (= (and mapNonEmpty!48343 ((_ is ValueCellFull!14777) mapDefault!48352)) b!1219162))

(declare-fun m!1123527 () Bool)

(assert (=> mapNonEmpty!48352 m!1123527))

(declare-fun b_lambda!22075 () Bool)

(assert (= b_lambda!22061 (or (and start!101418 b_free!26269) b_lambda!22075)))

(declare-fun b_lambda!22077 () Bool)

(assert (= b_lambda!22059 (or (and start!101418 b_free!26269) b_lambda!22077)))

(declare-fun b_lambda!22079 () Bool)

(assert (= b_lambda!22069 (or (and start!101418 b_free!26269) b_lambda!22079)))

(declare-fun b_lambda!22081 () Bool)

(assert (= b_lambda!22073 (or (and start!101418 b_free!26269) b_lambda!22081)))

(declare-fun b_lambda!22083 () Bool)

(assert (= b_lambda!22067 (or (and start!101418 b_free!26269) b_lambda!22083)))

(declare-fun b_lambda!22085 () Bool)

(assert (= b_lambda!22071 (or (and start!101418 b_free!26269) b_lambda!22085)))

(declare-fun b_lambda!22087 () Bool)

(assert (= b_lambda!22057 (or (and start!101418 b_free!26269) b_lambda!22087)))

(declare-fun b_lambda!22089 () Bool)

(assert (= b_lambda!22065 (or (and start!101418 b_free!26269) b_lambda!22089)))

(declare-fun b_lambda!22091 () Bool)

(assert (= b_lambda!22063 (or (and start!101418 b_free!26269) b_lambda!22091)))

(check-sat (not d!133541) (not b!1219069) (not b!1219145) (not b!1219047) (not b!1219091) (not b!1219111) (not b_lambda!22079) (not b_lambda!22083) (not d!133539) (not b!1219105) (not b_lambda!22087) (not b!1219099) (not d!133563) (not b!1219116) (not b!1219149) (not b!1219051) (not b!1219093) (not bm!60645) (not bm!60661) (not b!1219102) (not b!1219078) (not b_lambda!22077) (not b_lambda!22091) (not bm!60648) (not b_lambda!22081) (not b_next!26269) (not b!1219114) b_and!43719 tp_is_empty!30973 (not b!1219088) (not b_lambda!22089) (not b!1219079) (not b!1219147) (not b_lambda!22075) (not b!1219049) (not b!1219138) (not b!1219130) (not b!1219068) (not bm!60653) (not b!1219061) (not bm!60656) (not bm!60655) (not d!133579) (not b!1219108) (not d!133551) (not d!133553) (not b!1219058) (not b!1219139) (not b!1219104) (not b!1219144) (not b!1219154) (not b!1219152) (not b!1219150) (not b!1219054) (not b!1219106) (not b!1219046) (not b!1219057) (not b!1219101) (not d!133557) (not b!1219056) (not b_lambda!22055) (not bm!60644) (not mapNonEmpty!48352) (not b!1219066) (not b!1219059) (not b_lambda!22085) (not b!1219131) (not b!1219096) (not b!1219103) (not b!1219021) (not b!1219094) (not b!1219063) (not bm!60657) (not b!1219060) (not b!1219113) (not d!133555) (not b!1219048) (not d!133569) (not b!1219092) (not b!1219133) (not bm!60660) (not bm!60654) (not b!1219115))
(check-sat b_and!43719 (not b_next!26269))
