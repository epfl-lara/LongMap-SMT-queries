; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99520 () Bool)

(assert start!99520)

(declare-fun b_free!25105 () Bool)

(declare-fun b_next!25105 () Bool)

(assert (=> start!99520 (= b_free!25105 (not b_next!25105))))

(declare-fun tp!88029 () Bool)

(declare-fun b_and!41055 () Bool)

(assert (=> start!99520 (= tp!88029 b_and!41055)))

(declare-fun res!781913 () Bool)

(declare-fun e!669156 () Bool)

(assert (=> start!99520 (=> (not res!781913) (not e!669156))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76008 0))(
  ( (array!76009 (arr!36654 (Array (_ BitVec 32) (_ BitVec 64))) (size!37192 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76008)

(assert (=> start!99520 (= res!781913 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37192 _keys!1208))))))

(assert (=> start!99520 e!669156))

(declare-fun tp_is_empty!29635 () Bool)

(assert (=> start!99520 tp_is_empty!29635))

(declare-fun array_inv!28100 (array!76008) Bool)

(assert (=> start!99520 (array_inv!28100 _keys!1208)))

(assert (=> start!99520 true))

(assert (=> start!99520 tp!88029))

(declare-datatypes ((V!44641 0))(
  ( (V!44642 (val!14874 Int)) )
))
(declare-datatypes ((ValueCell!14108 0))(
  ( (ValueCellFull!14108 (v!17511 V!44641)) (EmptyCell!14108) )
))
(declare-datatypes ((array!76010 0))(
  ( (array!76011 (arr!36655 (Array (_ BitVec 32) ValueCell!14108)) (size!37193 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76010)

(declare-fun e!669149 () Bool)

(declare-fun array_inv!28101 (array!76010) Bool)

(assert (=> start!99520 (and (array_inv!28101 _values!996) e!669149)))

(declare-fun b!1177131 () Bool)

(declare-datatypes ((Unit!38709 0))(
  ( (Unit!38710) )
))
(declare-fun e!669153 () Unit!38709)

(declare-fun Unit!38711 () Unit!38709)

(assert (=> b!1177131 (= e!669153 Unit!38711)))

(declare-fun b!1177132 () Bool)

(declare-fun e!669150 () Bool)

(assert (=> b!1177132 (= e!669150 true)))

(declare-fun e!669151 () Bool)

(assert (=> b!1177132 e!669151))

(declare-fun res!781916 () Bool)

(assert (=> b!1177132 (=> (not res!781916) (not e!669151))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1177132 (= res!781916 (not (= (select (arr!36654 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531345 () Unit!38709)

(assert (=> b!1177132 (= lt!531345 e!669153)))

(declare-fun c!116755 () Bool)

(assert (=> b!1177132 (= c!116755 (= (select (arr!36654 _keys!1208) from!1455) k0!934))))

(declare-fun e!669145 () Bool)

(assert (=> b!1177132 e!669145))

(declare-fun res!781917 () Bool)

(assert (=> b!1177132 (=> (not res!781917) (not e!669145))))

(declare-datatypes ((tuple2!19132 0))(
  ( (tuple2!19133 (_1!9577 (_ BitVec 64)) (_2!9577 V!44641)) )
))
(declare-datatypes ((List!25841 0))(
  ( (Nil!25838) (Cons!25837 (h!27046 tuple2!19132) (t!37929 List!25841)) )
))
(declare-datatypes ((ListLongMap!17101 0))(
  ( (ListLongMap!17102 (toList!8566 List!25841)) )
))
(declare-fun lt!531342 () ListLongMap!17101)

(declare-fun lt!531343 () ListLongMap!17101)

(declare-fun lt!531350 () tuple2!19132)

(declare-fun +!3869 (ListLongMap!17101 tuple2!19132) ListLongMap!17101)

(assert (=> b!1177132 (= res!781917 (= lt!531343 (+!3869 lt!531342 lt!531350)))))

(declare-fun lt!531339 () V!44641)

(declare-fun get!18734 (ValueCell!14108 V!44641) V!44641)

(assert (=> b!1177132 (= lt!531350 (tuple2!19133 (select (arr!36654 _keys!1208) from!1455) (get!18734 (select (arr!36655 _values!996) from!1455) lt!531339)))))

(declare-fun b!1177133 () Bool)

(declare-fun res!781924 () Bool)

(assert (=> b!1177133 (=> (not res!781924) (not e!669156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177133 (= res!781924 (validKeyInArray!0 k0!934))))

(declare-fun b!1177134 () Bool)

(declare-fun res!781919 () Bool)

(assert (=> b!1177134 (=> (not res!781919) (not e!669156))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1177134 (= res!781919 (and (= (size!37193 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37192 _keys!1208) (size!37193 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177135 () Bool)

(declare-fun e!669152 () Bool)

(declare-fun e!669155 () Bool)

(assert (=> b!1177135 (= e!669152 e!669155)))

(declare-fun res!781918 () Bool)

(assert (=> b!1177135 (=> res!781918 e!669155)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177135 (= res!781918 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44641)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44641)

(declare-fun lt!531346 () array!76008)

(declare-fun lt!531341 () array!76010)

(declare-fun getCurrentListMapNoExtraKeys!5033 (array!76008 array!76010 (_ BitVec 32) (_ BitVec 32) V!44641 V!44641 (_ BitVec 32) Int) ListLongMap!17101)

(assert (=> b!1177135 (= lt!531343 (getCurrentListMapNoExtraKeys!5033 lt!531346 lt!531341 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177135 (= lt!531341 (array!76011 (store (arr!36655 _values!996) i!673 (ValueCellFull!14108 lt!531339)) (size!37193 _values!996)))))

(declare-fun dynLambda!2950 (Int (_ BitVec 64)) V!44641)

(assert (=> b!1177135 (= lt!531339 (dynLambda!2950 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531349 () ListLongMap!17101)

(assert (=> b!1177135 (= lt!531349 (getCurrentListMapNoExtraKeys!5033 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177136 () Bool)

(declare-fun res!781927 () Bool)

(assert (=> b!1177136 (=> (not res!781927) (not e!669156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76008 (_ BitVec 32)) Bool)

(assert (=> b!1177136 (= res!781927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46280 () Bool)

(declare-fun mapRes!46280 () Bool)

(assert (=> mapIsEmpty!46280 mapRes!46280))

(declare-fun b!1177137 () Bool)

(declare-fun res!781920 () Bool)

(assert (=> b!1177137 (=> (not res!781920) (not e!669156))))

(declare-datatypes ((List!25842 0))(
  ( (Nil!25839) (Cons!25838 (h!27047 (_ BitVec 64)) (t!37930 List!25842)) )
))
(declare-fun arrayNoDuplicates!0 (array!76008 (_ BitVec 32) List!25842) Bool)

(assert (=> b!1177137 (= res!781920 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25839))))

(declare-fun b!1177138 () Bool)

(declare-fun res!781921 () Bool)

(declare-fun e!669157 () Bool)

(assert (=> b!1177138 (=> (not res!781921) (not e!669157))))

(assert (=> b!1177138 (= res!781921 (arrayNoDuplicates!0 lt!531346 #b00000000000000000000000000000000 Nil!25839))))

(declare-fun b!1177139 () Bool)

(declare-fun e!669146 () Bool)

(declare-fun arrayContainsKey!0 (array!76008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177139 (= e!669146 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177140 () Bool)

(assert (=> b!1177140 (= e!669156 e!669157)))

(declare-fun res!781922 () Bool)

(assert (=> b!1177140 (=> (not res!781922) (not e!669157))))

(assert (=> b!1177140 (= res!781922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531346 mask!1564))))

(assert (=> b!1177140 (= lt!531346 (array!76009 (store (arr!36654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37192 _keys!1208)))))

(declare-fun b!1177141 () Bool)

(declare-fun Unit!38712 () Unit!38709)

(assert (=> b!1177141 (= e!669153 Unit!38712)))

(declare-fun lt!531347 () Unit!38709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76008 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38709)

(assert (=> b!1177141 (= lt!531347 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177141 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531351 () Unit!38709)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76008 (_ BitVec 32) (_ BitVec 32)) Unit!38709)

(assert (=> b!1177141 (= lt!531351 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177141 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25839)))

(declare-fun lt!531338 () Unit!38709)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76008 (_ BitVec 64) (_ BitVec 32) List!25842) Unit!38709)

(assert (=> b!1177141 (= lt!531338 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25839))))

(assert (=> b!1177141 false))

(declare-fun b!1177142 () Bool)

(declare-fun res!781915 () Bool)

(assert (=> b!1177142 (=> (not res!781915) (not e!669156))))

(assert (=> b!1177142 (= res!781915 (= (select (arr!36654 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46280 () Bool)

(declare-fun tp!88028 () Bool)

(declare-fun e!669148 () Bool)

(assert (=> mapNonEmpty!46280 (= mapRes!46280 (and tp!88028 e!669148))))

(declare-fun mapKey!46280 () (_ BitVec 32))

(declare-fun mapValue!46280 () ValueCell!14108)

(declare-fun mapRest!46280 () (Array (_ BitVec 32) ValueCell!14108))

(assert (=> mapNonEmpty!46280 (= (arr!36655 _values!996) (store mapRest!46280 mapKey!46280 mapValue!46280))))

(declare-fun b!1177143 () Bool)

(declare-fun e!669154 () Bool)

(assert (=> b!1177143 (= e!669149 (and e!669154 mapRes!46280))))

(declare-fun condMapEmpty!46280 () Bool)

(declare-fun mapDefault!46280 () ValueCell!14108)

(assert (=> b!1177143 (= condMapEmpty!46280 (= (arr!36655 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14108)) mapDefault!46280)))))

(declare-fun b!1177144 () Bool)

(assert (=> b!1177144 (= e!669157 (not e!669152))))

(declare-fun res!781923 () Bool)

(assert (=> b!1177144 (=> res!781923 e!669152)))

(assert (=> b!1177144 (= res!781923 (bvsgt from!1455 i!673))))

(assert (=> b!1177144 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531348 () Unit!38709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76008 (_ BitVec 64) (_ BitVec 32)) Unit!38709)

(assert (=> b!1177144 (= lt!531348 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177145 () Bool)

(assert (=> b!1177145 (= e!669155 e!669150)))

(declare-fun res!781925 () Bool)

(assert (=> b!1177145 (=> res!781925 e!669150)))

(assert (=> b!1177145 (= res!781925 (not (validKeyInArray!0 (select (arr!36654 _keys!1208) from!1455))))))

(declare-fun lt!531337 () ListLongMap!17101)

(assert (=> b!1177145 (= lt!531337 lt!531342)))

(declare-fun lt!531340 () ListLongMap!17101)

(declare-fun -!1540 (ListLongMap!17101 (_ BitVec 64)) ListLongMap!17101)

(assert (=> b!1177145 (= lt!531342 (-!1540 lt!531340 k0!934))))

(assert (=> b!1177145 (= lt!531337 (getCurrentListMapNoExtraKeys!5033 lt!531346 lt!531341 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177145 (= lt!531340 (getCurrentListMapNoExtraKeys!5033 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531344 () Unit!38709)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!804 (array!76008 array!76010 (_ BitVec 32) (_ BitVec 32) V!44641 V!44641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38709)

(assert (=> b!1177145 (= lt!531344 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!804 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177146 () Bool)

(declare-fun res!781914 () Bool)

(assert (=> b!1177146 (=> (not res!781914) (not e!669156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177146 (= res!781914 (validMask!0 mask!1564))))

(declare-fun b!1177147 () Bool)

(declare-fun res!781912 () Bool)

(assert (=> b!1177147 (=> (not res!781912) (not e!669156))))

(assert (=> b!1177147 (= res!781912 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37192 _keys!1208))))))

(declare-fun b!1177148 () Bool)

(assert (=> b!1177148 (= e!669145 e!669146)))

(declare-fun res!781926 () Bool)

(assert (=> b!1177148 (=> res!781926 e!669146)))

(assert (=> b!1177148 (= res!781926 (not (= (select (arr!36654 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177149 () Bool)

(assert (=> b!1177149 (= e!669154 tp_is_empty!29635)))

(declare-fun b!1177150 () Bool)

(assert (=> b!1177150 (= e!669151 (= lt!531349 (+!3869 lt!531340 lt!531350)))))

(declare-fun b!1177151 () Bool)

(assert (=> b!1177151 (= e!669148 tp_is_empty!29635)))

(assert (= (and start!99520 res!781913) b!1177146))

(assert (= (and b!1177146 res!781914) b!1177134))

(assert (= (and b!1177134 res!781919) b!1177136))

(assert (= (and b!1177136 res!781927) b!1177137))

(assert (= (and b!1177137 res!781920) b!1177147))

(assert (= (and b!1177147 res!781912) b!1177133))

(assert (= (and b!1177133 res!781924) b!1177142))

(assert (= (and b!1177142 res!781915) b!1177140))

(assert (= (and b!1177140 res!781922) b!1177138))

(assert (= (and b!1177138 res!781921) b!1177144))

(assert (= (and b!1177144 (not res!781923)) b!1177135))

(assert (= (and b!1177135 (not res!781918)) b!1177145))

(assert (= (and b!1177145 (not res!781925)) b!1177132))

(assert (= (and b!1177132 res!781917) b!1177148))

(assert (= (and b!1177148 (not res!781926)) b!1177139))

(assert (= (and b!1177132 c!116755) b!1177141))

(assert (= (and b!1177132 (not c!116755)) b!1177131))

(assert (= (and b!1177132 res!781916) b!1177150))

(assert (= (and b!1177143 condMapEmpty!46280) mapIsEmpty!46280))

(assert (= (and b!1177143 (not condMapEmpty!46280)) mapNonEmpty!46280))

(get-info :version)

(assert (= (and mapNonEmpty!46280 ((_ is ValueCellFull!14108) mapValue!46280)) b!1177151))

(assert (= (and b!1177143 ((_ is ValueCellFull!14108) mapDefault!46280)) b!1177149))

(assert (= start!99520 b!1177143))

(declare-fun b_lambda!20231 () Bool)

(assert (=> (not b_lambda!20231) (not b!1177135)))

(declare-fun t!37928 () Bool)

(declare-fun tb!9909 () Bool)

(assert (=> (and start!99520 (= defaultEntry!1004 defaultEntry!1004) t!37928) tb!9909))

(declare-fun result!20393 () Bool)

(assert (=> tb!9909 (= result!20393 tp_is_empty!29635)))

(assert (=> b!1177135 t!37928))

(declare-fun b_and!41057 () Bool)

(assert (= b_and!41055 (and (=> t!37928 result!20393) b_and!41057)))

(declare-fun m!1084589 () Bool)

(assert (=> b!1177150 m!1084589))

(declare-fun m!1084591 () Bool)

(assert (=> b!1177138 m!1084591))

(declare-fun m!1084593 () Bool)

(assert (=> start!99520 m!1084593))

(declare-fun m!1084595 () Bool)

(assert (=> start!99520 m!1084595))

(declare-fun m!1084597 () Bool)

(assert (=> b!1177139 m!1084597))

(declare-fun m!1084599 () Bool)

(assert (=> b!1177146 m!1084599))

(declare-fun m!1084601 () Bool)

(assert (=> b!1177141 m!1084601))

(declare-fun m!1084603 () Bool)

(assert (=> b!1177141 m!1084603))

(declare-fun m!1084605 () Bool)

(assert (=> b!1177141 m!1084605))

(declare-fun m!1084607 () Bool)

(assert (=> b!1177141 m!1084607))

(declare-fun m!1084609 () Bool)

(assert (=> b!1177141 m!1084609))

(declare-fun m!1084611 () Bool)

(assert (=> b!1177137 m!1084611))

(declare-fun m!1084613 () Bool)

(assert (=> b!1177144 m!1084613))

(declare-fun m!1084615 () Bool)

(assert (=> b!1177144 m!1084615))

(declare-fun m!1084617 () Bool)

(assert (=> b!1177136 m!1084617))

(declare-fun m!1084619 () Bool)

(assert (=> b!1177140 m!1084619))

(declare-fun m!1084621 () Bool)

(assert (=> b!1177140 m!1084621))

(declare-fun m!1084623 () Bool)

(assert (=> b!1177142 m!1084623))

(declare-fun m!1084625 () Bool)

(assert (=> b!1177133 m!1084625))

(declare-fun m!1084627 () Bool)

(assert (=> b!1177132 m!1084627))

(declare-fun m!1084629 () Bool)

(assert (=> b!1177132 m!1084629))

(declare-fun m!1084631 () Bool)

(assert (=> b!1177132 m!1084631))

(assert (=> b!1177132 m!1084631))

(declare-fun m!1084633 () Bool)

(assert (=> b!1177132 m!1084633))

(declare-fun m!1084635 () Bool)

(assert (=> b!1177145 m!1084635))

(declare-fun m!1084637 () Bool)

(assert (=> b!1177145 m!1084637))

(assert (=> b!1177145 m!1084627))

(declare-fun m!1084639 () Bool)

(assert (=> b!1177145 m!1084639))

(declare-fun m!1084641 () Bool)

(assert (=> b!1177145 m!1084641))

(assert (=> b!1177145 m!1084627))

(declare-fun m!1084643 () Bool)

(assert (=> b!1177145 m!1084643))

(assert (=> b!1177148 m!1084627))

(declare-fun m!1084645 () Bool)

(assert (=> b!1177135 m!1084645))

(declare-fun m!1084647 () Bool)

(assert (=> b!1177135 m!1084647))

(declare-fun m!1084649 () Bool)

(assert (=> b!1177135 m!1084649))

(declare-fun m!1084651 () Bool)

(assert (=> b!1177135 m!1084651))

(declare-fun m!1084653 () Bool)

(assert (=> mapNonEmpty!46280 m!1084653))

(check-sat (not b_next!25105) (not mapNonEmpty!46280) (not b!1177140) (not b!1177133) (not b!1177135) (not b!1177141) (not b!1177145) (not b!1177132) (not b!1177150) (not b!1177137) (not b!1177138) (not b!1177146) (not b_lambda!20231) (not b!1177144) b_and!41057 (not b!1177136) tp_is_empty!29635 (not b!1177139) (not start!99520))
(check-sat b_and!41057 (not b_next!25105))
