; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99900 () Bool)

(assert start!99900)

(declare-fun b_free!25243 () Bool)

(declare-fun b_next!25243 () Bool)

(assert (=> start!99900 (= b_free!25243 (not b_next!25243))))

(declare-fun tp!88442 () Bool)

(declare-fun b_and!41355 () Bool)

(assert (=> start!99900 (= tp!88442 b_and!41355)))

(declare-fun b!1183108 () Bool)

(declare-fun e!672738 () Bool)

(assert (=> b!1183108 (= e!672738 true)))

(declare-datatypes ((V!44825 0))(
  ( (V!44826 (val!14943 Int)) )
))
(declare-datatypes ((tuple2!19190 0))(
  ( (tuple2!19191 (_1!9606 (_ BitVec 64)) (_2!9606 V!44825)) )
))
(declare-datatypes ((List!25920 0))(
  ( (Nil!25917) (Cons!25916 (h!27134 tuple2!19190) (t!38147 List!25920)) )
))
(declare-datatypes ((ListLongMap!17167 0))(
  ( (ListLongMap!17168 (toList!8599 List!25920)) )
))
(declare-fun lt!535178 () ListLongMap!17167)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!535168 () ListLongMap!17167)

(declare-fun -!1622 (ListLongMap!17167 (_ BitVec 64)) ListLongMap!17167)

(assert (=> b!1183108 (= (-!1622 lt!535178 k0!934) lt!535168)))

(declare-datatypes ((array!76397 0))(
  ( (array!76398 (arr!36842 (Array (_ BitVec 32) (_ BitVec 64))) (size!37379 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76397)

(declare-datatypes ((Unit!39082 0))(
  ( (Unit!39083) )
))
(declare-fun lt!535165 () Unit!39082)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!535163 () V!44825)

(declare-fun lt!535179 () ListLongMap!17167)

(declare-fun addRemoveCommutativeForDiffKeys!138 (ListLongMap!17167 (_ BitVec 64) V!44825 (_ BitVec 64)) Unit!39082)

(assert (=> b!1183108 (= lt!535165 (addRemoveCommutativeForDiffKeys!138 lt!535179 (select (arr!36842 _keys!1208) from!1455) lt!535163 k0!934))))

(declare-fun lt!535173 () ListLongMap!17167)

(declare-fun lt!535166 () ListLongMap!17167)

(declare-fun lt!535177 () ListLongMap!17167)

(assert (=> b!1183108 (and (= lt!535166 lt!535178) (= lt!535173 lt!535177))))

(declare-fun lt!535175 () tuple2!19190)

(declare-fun +!3922 (ListLongMap!17167 tuple2!19190) ListLongMap!17167)

(assert (=> b!1183108 (= lt!535178 (+!3922 lt!535179 lt!535175))))

(assert (=> b!1183108 (not (= (select (arr!36842 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535170 () Unit!39082)

(declare-fun e!672735 () Unit!39082)

(assert (=> b!1183108 (= lt!535170 e!672735)))

(declare-fun c!117386 () Bool)

(assert (=> b!1183108 (= c!117386 (= (select (arr!36842 _keys!1208) from!1455) k0!934))))

(declare-fun e!672741 () Bool)

(assert (=> b!1183108 e!672741))

(declare-fun res!785890 () Bool)

(assert (=> b!1183108 (=> (not res!785890) (not e!672741))))

(declare-fun lt!535180 () ListLongMap!17167)

(assert (=> b!1183108 (= res!785890 (= lt!535180 lt!535168))))

(assert (=> b!1183108 (= lt!535168 (+!3922 lt!535173 lt!535175))))

(assert (=> b!1183108 (= lt!535175 (tuple2!19191 (select (arr!36842 _keys!1208) from!1455) lt!535163))))

(declare-datatypes ((ValueCell!14177 0))(
  ( (ValueCellFull!14177 (v!17577 V!44825)) (EmptyCell!14177) )
))
(declare-datatypes ((array!76399 0))(
  ( (array!76400 (arr!36843 (Array (_ BitVec 32) ValueCell!14177)) (size!37380 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76399)

(declare-fun lt!535167 () V!44825)

(declare-fun get!18881 (ValueCell!14177 V!44825) V!44825)

(assert (=> b!1183108 (= lt!535163 (get!18881 (select (arr!36843 _values!996) from!1455) lt!535167))))

(declare-fun mapIsEmpty!46487 () Bool)

(declare-fun mapRes!46487 () Bool)

(assert (=> mapIsEmpty!46487 mapRes!46487))

(declare-fun b!1183109 () Bool)

(declare-fun res!785881 () Bool)

(declare-fun e!672739 () Bool)

(assert (=> b!1183109 (=> (not res!785881) (not e!672739))))

(declare-fun lt!535176 () array!76397)

(declare-datatypes ((List!25921 0))(
  ( (Nil!25918) (Cons!25917 (h!27135 (_ BitVec 64)) (t!38148 List!25921)) )
))
(declare-fun arrayNoDuplicates!0 (array!76397 (_ BitVec 32) List!25921) Bool)

(assert (=> b!1183109 (= res!785881 (arrayNoDuplicates!0 lt!535176 #b00000000000000000000000000000000 Nil!25918))))

(declare-fun b!1183110 () Bool)

(declare-fun res!785889 () Bool)

(declare-fun e!672745 () Bool)

(assert (=> b!1183110 (=> (not res!785889) (not e!672745))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183110 (= res!785889 (= (select (arr!36842 _keys!1208) i!673) k0!934))))

(declare-fun b!1183111 () Bool)

(declare-fun res!785888 () Bool)

(assert (=> b!1183111 (=> (not res!785888) (not e!672745))))

(assert (=> b!1183111 (= res!785888 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25918))))

(declare-fun b!1183112 () Bool)

(declare-fun res!785878 () Bool)

(assert (=> b!1183112 (=> (not res!785878) (not e!672745))))

(assert (=> b!1183112 (= res!785878 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37379 _keys!1208))))))

(declare-fun b!1183113 () Bool)

(declare-fun e!672743 () Bool)

(assert (=> b!1183113 (= e!672741 e!672743)))

(declare-fun res!785877 () Bool)

(assert (=> b!1183113 (=> res!785877 e!672743)))

(assert (=> b!1183113 (= res!785877 (not (= (select (arr!36842 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183114 () Bool)

(declare-fun Unit!39084 () Unit!39082)

(assert (=> b!1183114 (= e!672735 Unit!39084)))

(declare-fun mapNonEmpty!46487 () Bool)

(declare-fun tp!88443 () Bool)

(declare-fun e!672744 () Bool)

(assert (=> mapNonEmpty!46487 (= mapRes!46487 (and tp!88443 e!672744))))

(declare-fun mapRest!46487 () (Array (_ BitVec 32) ValueCell!14177))

(declare-fun mapKey!46487 () (_ BitVec 32))

(declare-fun mapValue!46487 () ValueCell!14177)

(assert (=> mapNonEmpty!46487 (= (arr!36843 _values!996) (store mapRest!46487 mapKey!46487 mapValue!46487))))

(declare-fun b!1183115 () Bool)

(declare-fun res!785879 () Bool)

(assert (=> b!1183115 (=> (not res!785879) (not e!672745))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1183115 (= res!785879 (and (= (size!37380 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37379 _keys!1208) (size!37380 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183116 () Bool)

(declare-fun Unit!39085 () Unit!39082)

(assert (=> b!1183116 (= e!672735 Unit!39085)))

(declare-fun lt!535171 () Unit!39082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76397 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39082)

(assert (=> b!1183116 (= lt!535171 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183116 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535162 () Unit!39082)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76397 (_ BitVec 32) (_ BitVec 32)) Unit!39082)

(assert (=> b!1183116 (= lt!535162 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183116 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25918)))

(declare-fun lt!535169 () Unit!39082)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76397 (_ BitVec 64) (_ BitVec 32) List!25921) Unit!39082)

(assert (=> b!1183116 (= lt!535169 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25918))))

(assert (=> b!1183116 false))

(declare-fun b!1183117 () Bool)

(declare-fun e!672740 () Bool)

(assert (=> b!1183117 (= e!672739 (not e!672740))))

(declare-fun res!785887 () Bool)

(assert (=> b!1183117 (=> res!785887 e!672740)))

(assert (=> b!1183117 (= res!785887 (bvsgt from!1455 i!673))))

(assert (=> b!1183117 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535164 () Unit!39082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76397 (_ BitVec 64) (_ BitVec 32)) Unit!39082)

(assert (=> b!1183117 (= lt!535164 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183118 () Bool)

(assert (=> b!1183118 (= e!672745 e!672739)))

(declare-fun res!785885 () Bool)

(assert (=> b!1183118 (=> (not res!785885) (not e!672739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76397 (_ BitVec 32)) Bool)

(assert (=> b!1183118 (= res!785885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535176 mask!1564))))

(assert (=> b!1183118 (= lt!535176 (array!76398 (store (arr!36842 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37379 _keys!1208)))))

(declare-fun res!785884 () Bool)

(assert (=> start!99900 (=> (not res!785884) (not e!672745))))

(assert (=> start!99900 (= res!785884 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37379 _keys!1208))))))

(assert (=> start!99900 e!672745))

(declare-fun tp_is_empty!29773 () Bool)

(assert (=> start!99900 tp_is_empty!29773))

(declare-fun array_inv!28200 (array!76397) Bool)

(assert (=> start!99900 (array_inv!28200 _keys!1208)))

(assert (=> start!99900 true))

(assert (=> start!99900 tp!88442))

(declare-fun e!672736 () Bool)

(declare-fun array_inv!28201 (array!76399) Bool)

(assert (=> start!99900 (and (array_inv!28201 _values!996) e!672736)))

(declare-fun b!1183119 () Bool)

(declare-fun e!672742 () Bool)

(assert (=> b!1183119 (= e!672742 e!672738)))

(declare-fun res!785886 () Bool)

(assert (=> b!1183119 (=> res!785886 e!672738)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183119 (= res!785886 (not (validKeyInArray!0 (select (arr!36842 _keys!1208) from!1455))))))

(assert (=> b!1183119 (= lt!535177 lt!535173)))

(assert (=> b!1183119 (= lt!535173 (-!1622 lt!535179 k0!934))))

(declare-fun zeroValue!944 () V!44825)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!535174 () array!76399)

(declare-fun minValue!944 () V!44825)

(declare-fun getCurrentListMapNoExtraKeys!5072 (array!76397 array!76399 (_ BitVec 32) (_ BitVec 32) V!44825 V!44825 (_ BitVec 32) Int) ListLongMap!17167)

(assert (=> b!1183119 (= lt!535177 (getCurrentListMapNoExtraKeys!5072 lt!535176 lt!535174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183119 (= lt!535179 (getCurrentListMapNoExtraKeys!5072 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535172 () Unit!39082)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!846 (array!76397 array!76399 (_ BitVec 32) (_ BitVec 32) V!44825 V!44825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39082)

(assert (=> b!1183119 (= lt!535172 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!846 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183120 () Bool)

(assert (=> b!1183120 (= e!672743 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183121 () Bool)

(assert (=> b!1183121 (= e!672740 e!672742)))

(declare-fun res!785880 () Bool)

(assert (=> b!1183121 (=> res!785880 e!672742)))

(assert (=> b!1183121 (= res!785880 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1183121 (= lt!535180 (getCurrentListMapNoExtraKeys!5072 lt!535176 lt!535174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183121 (= lt!535174 (array!76400 (store (arr!36843 _values!996) i!673 (ValueCellFull!14177 lt!535167)) (size!37380 _values!996)))))

(declare-fun dynLambda!3038 (Int (_ BitVec 64)) V!44825)

(assert (=> b!1183121 (= lt!535167 (dynLambda!3038 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183121 (= lt!535166 (getCurrentListMapNoExtraKeys!5072 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183122 () Bool)

(declare-fun res!785883 () Bool)

(assert (=> b!1183122 (=> (not res!785883) (not e!672745))))

(assert (=> b!1183122 (= res!785883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183123 () Bool)

(declare-fun e!672746 () Bool)

(assert (=> b!1183123 (= e!672746 tp_is_empty!29773)))

(declare-fun b!1183124 () Bool)

(declare-fun res!785891 () Bool)

(assert (=> b!1183124 (=> (not res!785891) (not e!672745))))

(assert (=> b!1183124 (= res!785891 (validKeyInArray!0 k0!934))))

(declare-fun b!1183125 () Bool)

(assert (=> b!1183125 (= e!672744 tp_is_empty!29773)))

(declare-fun b!1183126 () Bool)

(declare-fun res!785882 () Bool)

(assert (=> b!1183126 (=> (not res!785882) (not e!672745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183126 (= res!785882 (validMask!0 mask!1564))))

(declare-fun b!1183127 () Bool)

(assert (=> b!1183127 (= e!672736 (and e!672746 mapRes!46487))))

(declare-fun condMapEmpty!46487 () Bool)

(declare-fun mapDefault!46487 () ValueCell!14177)

(assert (=> b!1183127 (= condMapEmpty!46487 (= (arr!36843 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14177)) mapDefault!46487)))))

(assert (= (and start!99900 res!785884) b!1183126))

(assert (= (and b!1183126 res!785882) b!1183115))

(assert (= (and b!1183115 res!785879) b!1183122))

(assert (= (and b!1183122 res!785883) b!1183111))

(assert (= (and b!1183111 res!785888) b!1183112))

(assert (= (and b!1183112 res!785878) b!1183124))

(assert (= (and b!1183124 res!785891) b!1183110))

(assert (= (and b!1183110 res!785889) b!1183118))

(assert (= (and b!1183118 res!785885) b!1183109))

(assert (= (and b!1183109 res!785881) b!1183117))

(assert (= (and b!1183117 (not res!785887)) b!1183121))

(assert (= (and b!1183121 (not res!785880)) b!1183119))

(assert (= (and b!1183119 (not res!785886)) b!1183108))

(assert (= (and b!1183108 res!785890) b!1183113))

(assert (= (and b!1183113 (not res!785877)) b!1183120))

(assert (= (and b!1183108 c!117386) b!1183116))

(assert (= (and b!1183108 (not c!117386)) b!1183114))

(assert (= (and b!1183127 condMapEmpty!46487) mapIsEmpty!46487))

(assert (= (and b!1183127 (not condMapEmpty!46487)) mapNonEmpty!46487))

(get-info :version)

(assert (= (and mapNonEmpty!46487 ((_ is ValueCellFull!14177) mapValue!46487)) b!1183125))

(assert (= (and b!1183127 ((_ is ValueCellFull!14177) mapDefault!46487)) b!1183123))

(assert (= start!99900 b!1183127))

(declare-fun b_lambda!20381 () Bool)

(assert (=> (not b_lambda!20381) (not b!1183121)))

(declare-fun t!38146 () Bool)

(declare-fun tb!10047 () Bool)

(assert (=> (and start!99900 (= defaultEntry!1004 defaultEntry!1004) t!38146) tb!10047))

(declare-fun result!20669 () Bool)

(assert (=> tb!10047 (= result!20669 tp_is_empty!29773)))

(assert (=> b!1183121 t!38146))

(declare-fun b_and!41357 () Bool)

(assert (= b_and!41355 (and (=> t!38146 result!20669) b_and!41357)))

(declare-fun m!1091337 () Bool)

(assert (=> b!1183111 m!1091337))

(declare-fun m!1091339 () Bool)

(assert (=> b!1183109 m!1091339))

(declare-fun m!1091341 () Bool)

(assert (=> b!1183119 m!1091341))

(declare-fun m!1091343 () Bool)

(assert (=> b!1183119 m!1091343))

(declare-fun m!1091345 () Bool)

(assert (=> b!1183119 m!1091345))

(declare-fun m!1091347 () Bool)

(assert (=> b!1183119 m!1091347))

(assert (=> b!1183119 m!1091345))

(declare-fun m!1091349 () Bool)

(assert (=> b!1183119 m!1091349))

(declare-fun m!1091351 () Bool)

(assert (=> b!1183119 m!1091351))

(declare-fun m!1091353 () Bool)

(assert (=> b!1183116 m!1091353))

(declare-fun m!1091355 () Bool)

(assert (=> b!1183116 m!1091355))

(declare-fun m!1091357 () Bool)

(assert (=> b!1183116 m!1091357))

(declare-fun m!1091359 () Bool)

(assert (=> b!1183116 m!1091359))

(declare-fun m!1091361 () Bool)

(assert (=> b!1183116 m!1091361))

(declare-fun m!1091363 () Bool)

(assert (=> b!1183124 m!1091363))

(declare-fun m!1091365 () Bool)

(assert (=> b!1183122 m!1091365))

(declare-fun m!1091367 () Bool)

(assert (=> start!99900 m!1091367))

(declare-fun m!1091369 () Bool)

(assert (=> start!99900 m!1091369))

(assert (=> b!1183113 m!1091345))

(declare-fun m!1091371 () Bool)

(assert (=> mapNonEmpty!46487 m!1091371))

(declare-fun m!1091373 () Bool)

(assert (=> b!1183120 m!1091373))

(declare-fun m!1091375 () Bool)

(assert (=> b!1183121 m!1091375))

(declare-fun m!1091377 () Bool)

(assert (=> b!1183121 m!1091377))

(declare-fun m!1091379 () Bool)

(assert (=> b!1183121 m!1091379))

(declare-fun m!1091381 () Bool)

(assert (=> b!1183121 m!1091381))

(declare-fun m!1091383 () Bool)

(assert (=> b!1183126 m!1091383))

(declare-fun m!1091385 () Bool)

(assert (=> b!1183117 m!1091385))

(declare-fun m!1091387 () Bool)

(assert (=> b!1183117 m!1091387))

(declare-fun m!1091389 () Bool)

(assert (=> b!1183118 m!1091389))

(declare-fun m!1091391 () Bool)

(assert (=> b!1183118 m!1091391))

(declare-fun m!1091393 () Bool)

(assert (=> b!1183110 m!1091393))

(declare-fun m!1091395 () Bool)

(assert (=> b!1183108 m!1091395))

(assert (=> b!1183108 m!1091345))

(declare-fun m!1091397 () Bool)

(assert (=> b!1183108 m!1091397))

(declare-fun m!1091399 () Bool)

(assert (=> b!1183108 m!1091399))

(assert (=> b!1183108 m!1091345))

(declare-fun m!1091401 () Bool)

(assert (=> b!1183108 m!1091401))

(declare-fun m!1091403 () Bool)

(assert (=> b!1183108 m!1091403))

(assert (=> b!1183108 m!1091401))

(declare-fun m!1091405 () Bool)

(assert (=> b!1183108 m!1091405))

(check-sat (not mapNonEmpty!46487) (not b!1183124) (not b!1183121) (not b!1183109) (not b!1183120) (not b!1183126) (not b_next!25243) (not start!99900) (not b!1183122) (not b!1183118) tp_is_empty!29773 (not b!1183116) (not b!1183119) (not b!1183111) (not b!1183108) (not b_lambda!20381) (not b!1183117) b_and!41357)
(check-sat b_and!41357 (not b_next!25243))
