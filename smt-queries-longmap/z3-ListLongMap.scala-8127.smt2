; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99864 () Bool)

(assert start!99864)

(declare-fun b_free!25207 () Bool)

(declare-fun b_next!25207 () Bool)

(assert (=> start!99864 (= b_free!25207 (not b_next!25207))))

(declare-fun tp!88335 () Bool)

(declare-fun b_and!41283 () Bool)

(assert (=> start!99864 (= tp!88335 b_and!41283)))

(declare-fun b!1181906 () Bool)

(declare-datatypes ((Unit!39033 0))(
  ( (Unit!39034) )
))
(declare-fun e!672053 () Unit!39033)

(declare-fun Unit!39035 () Unit!39033)

(assert (=> b!1181906 (= e!672053 Unit!39035)))

(declare-datatypes ((array!76327 0))(
  ( (array!76328 (arr!36807 (Array (_ BitVec 32) (_ BitVec 64))) (size!37344 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76327)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!534316 () Unit!39033)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76327 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39033)

(assert (=> b!1181906 (= lt!534316 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181906 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534320 () Unit!39033)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76327 (_ BitVec 32) (_ BitVec 32)) Unit!39033)

(assert (=> b!1181906 (= lt!534320 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25894 0))(
  ( (Nil!25891) (Cons!25890 (h!27108 (_ BitVec 64)) (t!38085 List!25894)) )
))
(declare-fun arrayNoDuplicates!0 (array!76327 (_ BitVec 32) List!25894) Bool)

(assert (=> b!1181906 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25891)))

(declare-fun lt!534309 () Unit!39033)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76327 (_ BitVec 64) (_ BitVec 32) List!25894) Unit!39033)

(assert (=> b!1181906 (= lt!534309 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25891))))

(assert (=> b!1181906 false))

(declare-fun b!1181907 () Bool)

(declare-fun res!784986 () Bool)

(declare-fun e!672044 () Bool)

(assert (=> b!1181907 (=> (not res!784986) (not e!672044))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44777 0))(
  ( (V!44778 (val!14925 Int)) )
))
(declare-datatypes ((ValueCell!14159 0))(
  ( (ValueCellFull!14159 (v!17559 V!44777)) (EmptyCell!14159) )
))
(declare-datatypes ((array!76329 0))(
  ( (array!76330 (arr!36808 (Array (_ BitVec 32) ValueCell!14159)) (size!37345 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76329)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1181907 (= res!784986 (and (= (size!37345 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37344 _keys!1208) (size!37345 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181909 () Bool)

(declare-fun e!672049 () Bool)

(declare-fun tp_is_empty!29737 () Bool)

(assert (=> b!1181909 (= e!672049 tp_is_empty!29737)))

(declare-fun mapIsEmpty!46433 () Bool)

(declare-fun mapRes!46433 () Bool)

(assert (=> mapIsEmpty!46433 mapRes!46433))

(declare-fun mapNonEmpty!46433 () Bool)

(declare-fun tp!88334 () Bool)

(assert (=> mapNonEmpty!46433 (= mapRes!46433 (and tp!88334 e!672049))))

(declare-fun mapValue!46433 () ValueCell!14159)

(declare-fun mapRest!46433 () (Array (_ BitVec 32) ValueCell!14159))

(declare-fun mapKey!46433 () (_ BitVec 32))

(assert (=> mapNonEmpty!46433 (= (arr!36808 _values!996) (store mapRest!46433 mapKey!46433 mapValue!46433))))

(declare-fun b!1181910 () Bool)

(declare-fun res!784994 () Bool)

(assert (=> b!1181910 (=> (not res!784994) (not e!672044))))

(assert (=> b!1181910 (= res!784994 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25891))))

(declare-fun b!1181911 () Bool)

(declare-fun e!672054 () Bool)

(declare-fun e!672056 () Bool)

(assert (=> b!1181911 (= e!672054 e!672056)))

(declare-fun res!784984 () Bool)

(assert (=> b!1181911 (=> res!784984 e!672056)))

(assert (=> b!1181911 (= res!784984 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!534311 () array!76329)

(declare-datatypes ((tuple2!19164 0))(
  ( (tuple2!19165 (_1!9593 (_ BitVec 64)) (_2!9593 V!44777)) )
))
(declare-datatypes ((List!25895 0))(
  ( (Nil!25892) (Cons!25891 (h!27109 tuple2!19164) (t!38086 List!25895)) )
))
(declare-datatypes ((ListLongMap!17141 0))(
  ( (ListLongMap!17142 (toList!8586 List!25895)) )
))
(declare-fun lt!534312 () ListLongMap!17141)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!534310 () array!76327)

(declare-fun minValue!944 () V!44777)

(declare-fun zeroValue!944 () V!44777)

(declare-fun getCurrentListMapNoExtraKeys!5062 (array!76327 array!76329 (_ BitVec 32) (_ BitVec 32) V!44777 V!44777 (_ BitVec 32) Int) ListLongMap!17141)

(assert (=> b!1181911 (= lt!534312 (getCurrentListMapNoExtraKeys!5062 lt!534310 lt!534311 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534315 () V!44777)

(assert (=> b!1181911 (= lt!534311 (array!76330 (store (arr!36808 _values!996) i!673 (ValueCellFull!14159 lt!534315)) (size!37345 _values!996)))))

(declare-fun dynLambda!3028 (Int (_ BitVec 64)) V!44777)

(assert (=> b!1181911 (= lt!534315 (dynLambda!3028 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534318 () ListLongMap!17141)

(assert (=> b!1181911 (= lt!534318 (getCurrentListMapNoExtraKeys!5062 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181912 () Bool)

(declare-fun e!672052 () Bool)

(assert (=> b!1181912 (= e!672052 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181913 () Bool)

(declare-fun e!672051 () Bool)

(assert (=> b!1181913 (= e!672051 (not e!672054))))

(declare-fun res!784989 () Bool)

(assert (=> b!1181913 (=> res!784989 e!672054)))

(assert (=> b!1181913 (= res!784989 (bvsgt from!1455 i!673))))

(assert (=> b!1181913 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534308 () Unit!39033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76327 (_ BitVec 64) (_ BitVec 32)) Unit!39033)

(assert (=> b!1181913 (= lt!534308 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181914 () Bool)

(declare-fun e!672047 () Bool)

(declare-fun lt!534322 () ListLongMap!17141)

(declare-fun lt!534314 () ListLongMap!17141)

(assert (=> b!1181914 (= e!672047 (= lt!534322 lt!534314))))

(declare-fun b!1181915 () Bool)

(declare-fun e!672048 () Bool)

(declare-fun e!672055 () Bool)

(assert (=> b!1181915 (= e!672048 (and e!672055 mapRes!46433))))

(declare-fun condMapEmpty!46433 () Bool)

(declare-fun mapDefault!46433 () ValueCell!14159)

(assert (=> b!1181915 (= condMapEmpty!46433 (= (arr!36808 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14159)) mapDefault!46433)))))

(declare-fun b!1181916 () Bool)

(declare-fun e!672046 () Bool)

(assert (=> b!1181916 (= e!672056 e!672046)))

(declare-fun res!784991 () Bool)

(assert (=> b!1181916 (=> res!784991 e!672046)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181916 (= res!784991 (not (validKeyInArray!0 (select (arr!36807 _keys!1208) from!1455))))))

(assert (=> b!1181916 (= lt!534314 lt!534322)))

(declare-fun lt!534321 () ListLongMap!17141)

(declare-fun -!1613 (ListLongMap!17141 (_ BitVec 64)) ListLongMap!17141)

(assert (=> b!1181916 (= lt!534322 (-!1613 lt!534321 k0!934))))

(assert (=> b!1181916 (= lt!534314 (getCurrentListMapNoExtraKeys!5062 lt!534310 lt!534311 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181916 (= lt!534321 (getCurrentListMapNoExtraKeys!5062 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534317 () Unit!39033)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!838 (array!76327 array!76329 (_ BitVec 32) (_ BitVec 32) V!44777 V!44777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39033)

(assert (=> b!1181916 (= lt!534317 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!838 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!784990 () Bool)

(assert (=> start!99864 (=> (not res!784990) (not e!672044))))

(assert (=> start!99864 (= res!784990 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37344 _keys!1208))))))

(assert (=> start!99864 e!672044))

(assert (=> start!99864 tp_is_empty!29737))

(declare-fun array_inv!28182 (array!76327) Bool)

(assert (=> start!99864 (array_inv!28182 _keys!1208)))

(assert (=> start!99864 true))

(assert (=> start!99864 tp!88335))

(declare-fun array_inv!28183 (array!76329) Bool)

(assert (=> start!99864 (and (array_inv!28183 _values!996) e!672048)))

(declare-fun b!1181908 () Bool)

(declare-fun res!784985 () Bool)

(assert (=> b!1181908 (=> (not res!784985) (not e!672051))))

(assert (=> b!1181908 (= res!784985 (arrayNoDuplicates!0 lt!534310 #b00000000000000000000000000000000 Nil!25891))))

(declare-fun b!1181917 () Bool)

(assert (=> b!1181917 (= e!672046 true)))

(assert (=> b!1181917 e!672047))

(declare-fun res!784993 () Bool)

(assert (=> b!1181917 (=> (not res!784993) (not e!672047))))

(assert (=> b!1181917 (= res!784993 (not (= (select (arr!36807 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!534313 () Unit!39033)

(assert (=> b!1181917 (= lt!534313 e!672053)))

(declare-fun c!117332 () Bool)

(assert (=> b!1181917 (= c!117332 (= (select (arr!36807 _keys!1208) from!1455) k0!934))))

(declare-fun e!672045 () Bool)

(assert (=> b!1181917 e!672045))

(declare-fun res!784995 () Bool)

(assert (=> b!1181917 (=> (not res!784995) (not e!672045))))

(declare-fun lt!534319 () tuple2!19164)

(declare-fun +!3909 (ListLongMap!17141 tuple2!19164) ListLongMap!17141)

(assert (=> b!1181917 (= res!784995 (= lt!534312 (+!3909 lt!534322 lt!534319)))))

(declare-fun get!18857 (ValueCell!14159 V!44777) V!44777)

(assert (=> b!1181917 (= lt!534319 (tuple2!19165 (select (arr!36807 _keys!1208) from!1455) (get!18857 (select (arr!36808 _values!996) from!1455) lt!534315)))))

(declare-fun b!1181918 () Bool)

(assert (=> b!1181918 (= e!672055 tp_is_empty!29737)))

(declare-fun b!1181919 () Bool)

(declare-fun res!784988 () Bool)

(assert (=> b!1181919 (=> (not res!784988) (not e!672044))))

(assert (=> b!1181919 (= res!784988 (validKeyInArray!0 k0!934))))

(declare-fun b!1181920 () Bool)

(declare-fun res!784981 () Bool)

(assert (=> b!1181920 (=> (not res!784981) (not e!672044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181920 (= res!784981 (validMask!0 mask!1564))))

(declare-fun b!1181921 () Bool)

(declare-fun res!784987 () Bool)

(assert (=> b!1181921 (=> (not res!784987) (not e!672044))))

(assert (=> b!1181921 (= res!784987 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37344 _keys!1208))))))

(declare-fun b!1181922 () Bool)

(declare-fun res!784983 () Bool)

(assert (=> b!1181922 (=> (not res!784983) (not e!672044))))

(assert (=> b!1181922 (= res!784983 (= (select (arr!36807 _keys!1208) i!673) k0!934))))

(declare-fun b!1181923 () Bool)

(assert (=> b!1181923 (= e!672044 e!672051)))

(declare-fun res!784982 () Bool)

(assert (=> b!1181923 (=> (not res!784982) (not e!672051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76327 (_ BitVec 32)) Bool)

(assert (=> b!1181923 (= res!784982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534310 mask!1564))))

(assert (=> b!1181923 (= lt!534310 (array!76328 (store (arr!36807 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37344 _keys!1208)))))

(declare-fun b!1181924 () Bool)

(declare-fun res!784997 () Bool)

(assert (=> b!1181924 (=> (not res!784997) (not e!672047))))

(assert (=> b!1181924 (= res!784997 (= lt!534318 (+!3909 lt!534321 lt!534319)))))

(declare-fun b!1181925 () Bool)

(assert (=> b!1181925 (= e!672045 e!672052)))

(declare-fun res!784996 () Bool)

(assert (=> b!1181925 (=> res!784996 e!672052)))

(assert (=> b!1181925 (= res!784996 (not (= (select (arr!36807 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181926 () Bool)

(declare-fun res!784992 () Bool)

(assert (=> b!1181926 (=> (not res!784992) (not e!672044))))

(assert (=> b!1181926 (= res!784992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181927 () Bool)

(declare-fun Unit!39036 () Unit!39033)

(assert (=> b!1181927 (= e!672053 Unit!39036)))

(assert (= (and start!99864 res!784990) b!1181920))

(assert (= (and b!1181920 res!784981) b!1181907))

(assert (= (and b!1181907 res!784986) b!1181926))

(assert (= (and b!1181926 res!784992) b!1181910))

(assert (= (and b!1181910 res!784994) b!1181921))

(assert (= (and b!1181921 res!784987) b!1181919))

(assert (= (and b!1181919 res!784988) b!1181922))

(assert (= (and b!1181922 res!784983) b!1181923))

(assert (= (and b!1181923 res!784982) b!1181908))

(assert (= (and b!1181908 res!784985) b!1181913))

(assert (= (and b!1181913 (not res!784989)) b!1181911))

(assert (= (and b!1181911 (not res!784984)) b!1181916))

(assert (= (and b!1181916 (not res!784991)) b!1181917))

(assert (= (and b!1181917 res!784995) b!1181925))

(assert (= (and b!1181925 (not res!784996)) b!1181912))

(assert (= (and b!1181917 c!117332) b!1181906))

(assert (= (and b!1181917 (not c!117332)) b!1181927))

(assert (= (and b!1181917 res!784993) b!1181924))

(assert (= (and b!1181924 res!784997) b!1181914))

(assert (= (and b!1181915 condMapEmpty!46433) mapIsEmpty!46433))

(assert (= (and b!1181915 (not condMapEmpty!46433)) mapNonEmpty!46433))

(get-info :version)

(assert (= (and mapNonEmpty!46433 ((_ is ValueCellFull!14159) mapValue!46433)) b!1181909))

(assert (= (and b!1181915 ((_ is ValueCellFull!14159) mapDefault!46433)) b!1181918))

(assert (= start!99864 b!1181915))

(declare-fun b_lambda!20345 () Bool)

(assert (=> (not b_lambda!20345) (not b!1181911)))

(declare-fun t!38084 () Bool)

(declare-fun tb!10011 () Bool)

(assert (=> (and start!99864 (= defaultEntry!1004 defaultEntry!1004) t!38084) tb!10011))

(declare-fun result!20597 () Bool)

(assert (=> tb!10011 (= result!20597 tp_is_empty!29737)))

(assert (=> b!1181911 t!38084))

(declare-fun b_and!41285 () Bool)

(assert (= b_and!41283 (and (=> t!38084 result!20597) b_and!41285)))

(declare-fun m!1090137 () Bool)

(assert (=> start!99864 m!1090137))

(declare-fun m!1090139 () Bool)

(assert (=> start!99864 m!1090139))

(declare-fun m!1090141 () Bool)

(assert (=> b!1181917 m!1090141))

(declare-fun m!1090143 () Bool)

(assert (=> b!1181917 m!1090143))

(declare-fun m!1090145 () Bool)

(assert (=> b!1181917 m!1090145))

(assert (=> b!1181917 m!1090145))

(declare-fun m!1090147 () Bool)

(assert (=> b!1181917 m!1090147))

(declare-fun m!1090149 () Bool)

(assert (=> b!1181906 m!1090149))

(declare-fun m!1090151 () Bool)

(assert (=> b!1181906 m!1090151))

(declare-fun m!1090153 () Bool)

(assert (=> b!1181906 m!1090153))

(declare-fun m!1090155 () Bool)

(assert (=> b!1181906 m!1090155))

(declare-fun m!1090157 () Bool)

(assert (=> b!1181906 m!1090157))

(declare-fun m!1090159 () Bool)

(assert (=> b!1181912 m!1090159))

(declare-fun m!1090161 () Bool)

(assert (=> b!1181913 m!1090161))

(declare-fun m!1090163 () Bool)

(assert (=> b!1181913 m!1090163))

(declare-fun m!1090165 () Bool)

(assert (=> b!1181908 m!1090165))

(declare-fun m!1090167 () Bool)

(assert (=> b!1181922 m!1090167))

(declare-fun m!1090169 () Bool)

(assert (=> b!1181926 m!1090169))

(declare-fun m!1090171 () Bool)

(assert (=> b!1181924 m!1090171))

(declare-fun m!1090173 () Bool)

(assert (=> b!1181923 m!1090173))

(declare-fun m!1090175 () Bool)

(assert (=> b!1181923 m!1090175))

(declare-fun m!1090177 () Bool)

(assert (=> b!1181911 m!1090177))

(declare-fun m!1090179 () Bool)

(assert (=> b!1181911 m!1090179))

(declare-fun m!1090181 () Bool)

(assert (=> b!1181911 m!1090181))

(declare-fun m!1090183 () Bool)

(assert (=> b!1181911 m!1090183))

(declare-fun m!1090185 () Bool)

(assert (=> b!1181916 m!1090185))

(declare-fun m!1090187 () Bool)

(assert (=> b!1181916 m!1090187))

(declare-fun m!1090189 () Bool)

(assert (=> b!1181916 m!1090189))

(declare-fun m!1090191 () Bool)

(assert (=> b!1181916 m!1090191))

(assert (=> b!1181916 m!1090141))

(declare-fun m!1090193 () Bool)

(assert (=> b!1181916 m!1090193))

(assert (=> b!1181916 m!1090141))

(declare-fun m!1090195 () Bool)

(assert (=> b!1181910 m!1090195))

(assert (=> b!1181925 m!1090141))

(declare-fun m!1090197 () Bool)

(assert (=> mapNonEmpty!46433 m!1090197))

(declare-fun m!1090199 () Bool)

(assert (=> b!1181920 m!1090199))

(declare-fun m!1090201 () Bool)

(assert (=> b!1181919 m!1090201))

(check-sat (not b!1181920) (not b!1181911) (not b!1181926) (not b!1181919) (not start!99864) (not mapNonEmpty!46433) (not b!1181908) (not b!1181917) (not b!1181924) tp_is_empty!29737 (not b_next!25207) (not b!1181913) (not b!1181923) (not b!1181916) (not b!1181912) b_and!41285 (not b!1181910) (not b!1181906) (not b_lambda!20345))
(check-sat b_and!41285 (not b_next!25207))
