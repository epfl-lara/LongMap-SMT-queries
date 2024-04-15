; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101706 () Bool)

(assert start!101706)

(declare-fun b_free!26401 () Bool)

(declare-fun b_next!26401 () Bool)

(assert (=> start!101706 (= b_free!26401 (not b_next!26401))))

(declare-fun tp!92249 () Bool)

(declare-fun b_and!44045 () Bool)

(assert (=> start!101706 (= tp!92249 b_and!44045)))

(declare-fun b!1223723 () Bool)

(declare-fun res!813123 () Bool)

(declare-fun e!695006 () Bool)

(assert (=> b!1223723 (=> (not res!813123) (not e!695006))))

(declare-datatypes ((array!78914 0))(
  ( (array!78915 (arr!38084 (Array (_ BitVec 32) (_ BitVec 64))) (size!38622 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78914)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1223723 (= res!813123 (= (select (arr!38084 _keys!1208) i!673) k0!934))))

(declare-fun b!1223724 () Bool)

(declare-fun e!695011 () Bool)

(declare-fun tp_is_empty!31105 () Bool)

(assert (=> b!1223724 (= e!695011 tp_is_empty!31105)))

(declare-fun b!1223725 () Bool)

(declare-fun e!695003 () Bool)

(declare-fun e!695008 () Bool)

(assert (=> b!1223725 (= e!695003 e!695008)))

(declare-fun res!813122 () Bool)

(assert (=> b!1223725 (=> res!813122 e!695008)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223725 (= res!813122 (not (validKeyInArray!0 (select (arr!38084 _keys!1208) from!1455))))))

(declare-datatypes ((V!46601 0))(
  ( (V!46602 (val!15609 Int)) )
))
(declare-datatypes ((tuple2!20192 0))(
  ( (tuple2!20193 (_1!10107 (_ BitVec 64)) (_2!10107 V!46601)) )
))
(declare-datatypes ((List!26973 0))(
  ( (Nil!26970) (Cons!26969 (h!28178 tuple2!20192) (t!40345 List!26973)) )
))
(declare-datatypes ((ListLongMap!18161 0))(
  ( (ListLongMap!18162 (toList!9096 List!26973)) )
))
(declare-fun lt!556941 () ListLongMap!18161)

(declare-fun lt!556940 () ListLongMap!18161)

(assert (=> b!1223725 (= lt!556941 lt!556940)))

(declare-fun lt!556939 () ListLongMap!18161)

(declare-fun -!1918 (ListLongMap!18161 (_ BitVec 64)) ListLongMap!18161)

(assert (=> b!1223725 (= lt!556940 (-!1918 lt!556939 k0!934))))

(declare-fun zeroValue!944 () V!46601)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556932 () array!78914)

(declare-fun minValue!944 () V!46601)

(declare-datatypes ((ValueCell!14843 0))(
  ( (ValueCellFull!14843 (v!18270 V!46601)) (EmptyCell!14843) )
))
(declare-datatypes ((array!78916 0))(
  ( (array!78917 (arr!38085 (Array (_ BitVec 32) ValueCell!14843)) (size!38623 (_ BitVec 32))) )
))
(declare-fun lt!556942 () array!78916)

(declare-fun getCurrentListMapNoExtraKeys!5528 (array!78914 array!78916 (_ BitVec 32) (_ BitVec 32) V!46601 V!46601 (_ BitVec 32) Int) ListLongMap!18161)

(assert (=> b!1223725 (= lt!556941 (getCurrentListMapNoExtraKeys!5528 lt!556932 lt!556942 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78916)

(assert (=> b!1223725 (= lt!556939 (getCurrentListMapNoExtraKeys!5528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40385 0))(
  ( (Unit!40386) )
))
(declare-fun lt!556943 () Unit!40385)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1153 (array!78914 array!78916 (_ BitVec 32) (_ BitVec 32) V!46601 V!46601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40385)

(assert (=> b!1223725 (= lt!556943 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1153 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!695007 () Bool)

(declare-fun b!1223726 () Bool)

(declare-fun arrayContainsKey!0 (array!78914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223726 (= e!695007 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223727 () Bool)

(declare-fun res!813126 () Bool)

(assert (=> b!1223727 (=> (not res!813126) (not e!695006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78914 (_ BitVec 32)) Bool)

(assert (=> b!1223727 (= res!813126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223728 () Bool)

(declare-fun res!813112 () Bool)

(declare-fun e!695005 () Bool)

(assert (=> b!1223728 (=> (not res!813112) (not e!695005))))

(declare-datatypes ((List!26974 0))(
  ( (Nil!26971) (Cons!26970 (h!28179 (_ BitVec 64)) (t!40346 List!26974)) )
))
(declare-fun arrayNoDuplicates!0 (array!78914 (_ BitVec 32) List!26974) Bool)

(assert (=> b!1223728 (= res!813112 (arrayNoDuplicates!0 lt!556932 #b00000000000000000000000000000000 Nil!26971))))

(declare-fun b!1223729 () Bool)

(declare-fun e!695013 () Bool)

(declare-fun mapRes!48556 () Bool)

(assert (=> b!1223729 (= e!695013 (and e!695011 mapRes!48556))))

(declare-fun condMapEmpty!48556 () Bool)

(declare-fun mapDefault!48556 () ValueCell!14843)

(assert (=> b!1223729 (= condMapEmpty!48556 (= (arr!38085 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14843)) mapDefault!48556)))))

(declare-fun mapNonEmpty!48556 () Bool)

(declare-fun tp!92248 () Bool)

(declare-fun e!695004 () Bool)

(assert (=> mapNonEmpty!48556 (= mapRes!48556 (and tp!92248 e!695004))))

(declare-fun mapRest!48556 () (Array (_ BitVec 32) ValueCell!14843))

(declare-fun mapValue!48556 () ValueCell!14843)

(declare-fun mapKey!48556 () (_ BitVec 32))

(assert (=> mapNonEmpty!48556 (= (arr!38085 _values!996) (store mapRest!48556 mapKey!48556 mapValue!48556))))

(declare-fun b!1223730 () Bool)

(assert (=> b!1223730 (= e!695004 tp_is_empty!31105)))

(declare-fun b!1223731 () Bool)

(assert (=> b!1223731 (= e!695008 (= lt!556940 lt!556941))))

(declare-fun e!695010 () Bool)

(assert (=> b!1223731 e!695010))

(declare-fun res!813120 () Bool)

(assert (=> b!1223731 (=> (not res!813120) (not e!695010))))

(assert (=> b!1223731 (= res!813120 (not (= (select (arr!38084 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!556944 () Unit!40385)

(declare-fun e!695014 () Unit!40385)

(assert (=> b!1223731 (= lt!556944 e!695014)))

(declare-fun c!120401 () Bool)

(assert (=> b!1223731 (= c!120401 (= (select (arr!38084 _keys!1208) from!1455) k0!934))))

(declare-fun e!695012 () Bool)

(assert (=> b!1223731 e!695012))

(declare-fun res!813124 () Bool)

(assert (=> b!1223731 (=> (not res!813124) (not e!695012))))

(declare-fun lt!556937 () ListLongMap!18161)

(declare-fun lt!556945 () tuple2!20192)

(declare-fun +!4158 (ListLongMap!18161 tuple2!20192) ListLongMap!18161)

(assert (=> b!1223731 (= res!813124 (= lt!556937 (+!4158 lt!556940 lt!556945)))))

(declare-fun lt!556934 () V!46601)

(declare-fun get!19466 (ValueCell!14843 V!46601) V!46601)

(assert (=> b!1223731 (= lt!556945 (tuple2!20193 (select (arr!38084 _keys!1208) from!1455) (get!19466 (select (arr!38085 _values!996) from!1455) lt!556934)))))

(declare-fun b!1223732 () Bool)

(declare-fun e!695009 () Bool)

(assert (=> b!1223732 (= e!695009 e!695003)))

(declare-fun res!813117 () Bool)

(assert (=> b!1223732 (=> res!813117 e!695003)))

(assert (=> b!1223732 (= res!813117 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1223732 (= lt!556937 (getCurrentListMapNoExtraKeys!5528 lt!556932 lt!556942 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1223732 (= lt!556942 (array!78917 (store (arr!38085 _values!996) i!673 (ValueCellFull!14843 lt!556934)) (size!38623 _values!996)))))

(declare-fun dynLambda!3375 (Int (_ BitVec 64)) V!46601)

(assert (=> b!1223732 (= lt!556934 (dynLambda!3375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556931 () ListLongMap!18161)

(assert (=> b!1223732 (= lt!556931 (getCurrentListMapNoExtraKeys!5528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223733 () Bool)

(declare-fun res!813116 () Bool)

(assert (=> b!1223733 (=> (not res!813116) (not e!695006))))

(assert (=> b!1223733 (= res!813116 (and (= (size!38623 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38622 _keys!1208) (size!38623 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223734 () Bool)

(declare-fun Unit!40387 () Unit!40385)

(assert (=> b!1223734 (= e!695014 Unit!40387)))

(declare-fun lt!556938 () Unit!40385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78914 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40385)

(assert (=> b!1223734 (= lt!556938 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223734 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556933 () Unit!40385)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78914 (_ BitVec 32) (_ BitVec 32)) Unit!40385)

(assert (=> b!1223734 (= lt!556933 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1223734 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26971)))

(declare-fun lt!556935 () Unit!40385)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78914 (_ BitVec 64) (_ BitVec 32) List!26974) Unit!40385)

(assert (=> b!1223734 (= lt!556935 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26971))))

(assert (=> b!1223734 false))

(declare-fun b!1223735 () Bool)

(assert (=> b!1223735 (= e!695005 (not e!695009))))

(declare-fun res!813121 () Bool)

(assert (=> b!1223735 (=> res!813121 e!695009)))

(assert (=> b!1223735 (= res!813121 (bvsgt from!1455 i!673))))

(assert (=> b!1223735 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556936 () Unit!40385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78914 (_ BitVec 64) (_ BitVec 32)) Unit!40385)

(assert (=> b!1223735 (= lt!556936 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223736 () Bool)

(assert (=> b!1223736 (= e!695006 e!695005)))

(declare-fun res!813111 () Bool)

(assert (=> b!1223736 (=> (not res!813111) (not e!695005))))

(assert (=> b!1223736 (= res!813111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556932 mask!1564))))

(assert (=> b!1223736 (= lt!556932 (array!78915 (store (arr!38084 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38622 _keys!1208)))))

(declare-fun b!1223737 () Bool)

(declare-fun res!813119 () Bool)

(assert (=> b!1223737 (=> (not res!813119) (not e!695006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223737 (= res!813119 (validMask!0 mask!1564))))

(declare-fun b!1223738 () Bool)

(assert (=> b!1223738 (= e!695010 (= lt!556931 (+!4158 lt!556939 lt!556945)))))

(declare-fun b!1223739 () Bool)

(declare-fun Unit!40388 () Unit!40385)

(assert (=> b!1223739 (= e!695014 Unit!40388)))

(declare-fun b!1223740 () Bool)

(assert (=> b!1223740 (= e!695012 e!695007)))

(declare-fun res!813125 () Bool)

(assert (=> b!1223740 (=> res!813125 e!695007)))

(assert (=> b!1223740 (= res!813125 (not (= (select (arr!38084 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223741 () Bool)

(declare-fun res!813113 () Bool)

(assert (=> b!1223741 (=> (not res!813113) (not e!695006))))

(assert (=> b!1223741 (= res!813113 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38622 _keys!1208))))))

(declare-fun mapIsEmpty!48556 () Bool)

(assert (=> mapIsEmpty!48556 mapRes!48556))

(declare-fun res!813114 () Bool)

(assert (=> start!101706 (=> (not res!813114) (not e!695006))))

(assert (=> start!101706 (= res!813114 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38622 _keys!1208))))))

(assert (=> start!101706 e!695006))

(assert (=> start!101706 tp_is_empty!31105))

(declare-fun array_inv!29098 (array!78914) Bool)

(assert (=> start!101706 (array_inv!29098 _keys!1208)))

(assert (=> start!101706 true))

(assert (=> start!101706 tp!92249))

(declare-fun array_inv!29099 (array!78916) Bool)

(assert (=> start!101706 (and (array_inv!29099 _values!996) e!695013)))

(declare-fun b!1223742 () Bool)

(declare-fun res!813118 () Bool)

(assert (=> b!1223742 (=> (not res!813118) (not e!695006))))

(assert (=> b!1223742 (= res!813118 (validKeyInArray!0 k0!934))))

(declare-fun b!1223743 () Bool)

(declare-fun res!813115 () Bool)

(assert (=> b!1223743 (=> (not res!813115) (not e!695006))))

(assert (=> b!1223743 (= res!813115 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26971))))

(assert (= (and start!101706 res!813114) b!1223737))

(assert (= (and b!1223737 res!813119) b!1223733))

(assert (= (and b!1223733 res!813116) b!1223727))

(assert (= (and b!1223727 res!813126) b!1223743))

(assert (= (and b!1223743 res!813115) b!1223741))

(assert (= (and b!1223741 res!813113) b!1223742))

(assert (= (and b!1223742 res!813118) b!1223723))

(assert (= (and b!1223723 res!813123) b!1223736))

(assert (= (and b!1223736 res!813111) b!1223728))

(assert (= (and b!1223728 res!813112) b!1223735))

(assert (= (and b!1223735 (not res!813121)) b!1223732))

(assert (= (and b!1223732 (not res!813117)) b!1223725))

(assert (= (and b!1223725 (not res!813122)) b!1223731))

(assert (= (and b!1223731 res!813124) b!1223740))

(assert (= (and b!1223740 (not res!813125)) b!1223726))

(assert (= (and b!1223731 c!120401) b!1223734))

(assert (= (and b!1223731 (not c!120401)) b!1223739))

(assert (= (and b!1223731 res!813120) b!1223738))

(assert (= (and b!1223729 condMapEmpty!48556) mapIsEmpty!48556))

(assert (= (and b!1223729 (not condMapEmpty!48556)) mapNonEmpty!48556))

(get-info :version)

(assert (= (and mapNonEmpty!48556 ((_ is ValueCellFull!14843) mapValue!48556)) b!1223730))

(assert (= (and b!1223729 ((_ is ValueCellFull!14843) mapDefault!48556)) b!1223724))

(assert (= start!101706 b!1223729))

(declare-fun b_lambda!22371 () Bool)

(assert (=> (not b_lambda!22371) (not b!1223732)))

(declare-fun t!40344 () Bool)

(declare-fun tb!11193 () Bool)

(assert (=> (and start!101706 (= defaultEntry!1004 defaultEntry!1004) t!40344) tb!11193))

(declare-fun result!23007 () Bool)

(assert (=> tb!11193 (= result!23007 tp_is_empty!31105)))

(assert (=> b!1223732 t!40344))

(declare-fun b_and!44047 () Bool)

(assert (= b_and!44045 (and (=> t!40344 result!23007) b_and!44047)))

(declare-fun m!1128281 () Bool)

(assert (=> b!1223735 m!1128281))

(declare-fun m!1128283 () Bool)

(assert (=> b!1223735 m!1128283))

(declare-fun m!1128285 () Bool)

(assert (=> b!1223737 m!1128285))

(declare-fun m!1128287 () Bool)

(assert (=> b!1223734 m!1128287))

(declare-fun m!1128289 () Bool)

(assert (=> b!1223734 m!1128289))

(declare-fun m!1128291 () Bool)

(assert (=> b!1223734 m!1128291))

(declare-fun m!1128293 () Bool)

(assert (=> b!1223734 m!1128293))

(declare-fun m!1128295 () Bool)

(assert (=> b!1223734 m!1128295))

(declare-fun m!1128297 () Bool)

(assert (=> b!1223732 m!1128297))

(declare-fun m!1128299 () Bool)

(assert (=> b!1223732 m!1128299))

(declare-fun m!1128301 () Bool)

(assert (=> b!1223732 m!1128301))

(declare-fun m!1128303 () Bool)

(assert (=> b!1223732 m!1128303))

(declare-fun m!1128305 () Bool)

(assert (=> b!1223742 m!1128305))

(declare-fun m!1128307 () Bool)

(assert (=> b!1223727 m!1128307))

(declare-fun m!1128309 () Bool)

(assert (=> b!1223728 m!1128309))

(declare-fun m!1128311 () Bool)

(assert (=> b!1223740 m!1128311))

(declare-fun m!1128313 () Bool)

(assert (=> mapNonEmpty!48556 m!1128313))

(declare-fun m!1128315 () Bool)

(assert (=> b!1223726 m!1128315))

(declare-fun m!1128317 () Bool)

(assert (=> b!1223736 m!1128317))

(declare-fun m!1128319 () Bool)

(assert (=> b!1223736 m!1128319))

(assert (=> b!1223731 m!1128311))

(declare-fun m!1128321 () Bool)

(assert (=> b!1223731 m!1128321))

(declare-fun m!1128323 () Bool)

(assert (=> b!1223731 m!1128323))

(assert (=> b!1223731 m!1128323))

(declare-fun m!1128325 () Bool)

(assert (=> b!1223731 m!1128325))

(declare-fun m!1128327 () Bool)

(assert (=> start!101706 m!1128327))

(declare-fun m!1128329 () Bool)

(assert (=> start!101706 m!1128329))

(declare-fun m!1128331 () Bool)

(assert (=> b!1223723 m!1128331))

(declare-fun m!1128333 () Bool)

(assert (=> b!1223738 m!1128333))

(declare-fun m!1128335 () Bool)

(assert (=> b!1223725 m!1128335))

(declare-fun m!1128337 () Bool)

(assert (=> b!1223725 m!1128337))

(declare-fun m!1128339 () Bool)

(assert (=> b!1223725 m!1128339))

(declare-fun m!1128341 () Bool)

(assert (=> b!1223725 m!1128341))

(assert (=> b!1223725 m!1128311))

(declare-fun m!1128343 () Bool)

(assert (=> b!1223725 m!1128343))

(assert (=> b!1223725 m!1128311))

(declare-fun m!1128345 () Bool)

(assert (=> b!1223743 m!1128345))

(check-sat (not start!101706) (not b!1223736) (not b!1223731) (not b!1223737) b_and!44047 (not b!1223728) (not b_next!26401) (not b_lambda!22371) (not b!1223734) (not b!1223738) tp_is_empty!31105 (not b!1223725) (not b!1223726) (not b!1223743) (not b!1223735) (not b!1223732) (not b!1223742) (not b!1223727) (not mapNonEmpty!48556))
(check-sat b_and!44047 (not b_next!26401))
