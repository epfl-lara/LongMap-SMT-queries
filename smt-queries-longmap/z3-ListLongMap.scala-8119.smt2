; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99816 () Bool)

(assert start!99816)

(declare-fun b_free!25159 () Bool)

(declare-fun b_next!25159 () Bool)

(assert (=> start!99816 (= b_free!25159 (not b_next!25159))))

(declare-fun tp!88190 () Bool)

(declare-fun b_and!41187 () Bool)

(assert (=> start!99816 (= tp!88190 b_and!41187)))

(declare-fun b!1180299 () Bool)

(declare-fun e!671118 () Bool)

(declare-fun e!671111 () Bool)

(assert (=> b!1180299 (= e!671118 e!671111)))

(declare-fun res!783784 () Bool)

(assert (=> b!1180299 (=> (not res!783784) (not e!671111))))

(declare-datatypes ((array!76231 0))(
  ( (array!76232 (arr!36759 (Array (_ BitVec 32) (_ BitVec 64))) (size!37296 (_ BitVec 32))) )
))
(declare-fun lt!533242 () array!76231)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76231 (_ BitVec 32)) Bool)

(assert (=> b!1180299 (= res!783784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533242 mask!1564))))

(declare-fun _keys!1208 () array!76231)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1180299 (= lt!533242 (array!76232 (store (arr!36759 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37296 _keys!1208)))))

(declare-fun b!1180301 () Bool)

(declare-fun res!783783 () Bool)

(assert (=> b!1180301 (=> (not res!783783) (not e!671118))))

(assert (=> b!1180301 (= res!783783 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37296 _keys!1208))))))

(declare-fun b!1180302 () Bool)

(declare-fun res!783786 () Bool)

(assert (=> b!1180302 (=> (not res!783786) (not e!671118))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180302 (= res!783786 (validKeyInArray!0 k0!934))))

(declare-fun b!1180303 () Bool)

(declare-datatypes ((Unit!38957 0))(
  ( (Unit!38958) )
))
(declare-fun e!671116 () Unit!38957)

(declare-fun Unit!38959 () Unit!38957)

(assert (=> b!1180303 (= e!671116 Unit!38959)))

(declare-fun b!1180304 () Bool)

(declare-fun res!783795 () Bool)

(assert (=> b!1180304 (=> (not res!783795) (not e!671118))))

(assert (=> b!1180304 (= res!783795 (= (select (arr!36759 _keys!1208) i!673) k0!934))))

(declare-fun b!1180305 () Bool)

(declare-fun e!671109 () Bool)

(declare-fun tp_is_empty!29689 () Bool)

(assert (=> b!1180305 (= e!671109 tp_is_empty!29689)))

(declare-fun e!671114 () Bool)

(declare-fun b!1180306 () Bool)

(declare-fun arrayContainsKey!0 (array!76231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180306 (= e!671114 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180307 () Bool)

(declare-fun res!783792 () Bool)

(assert (=> b!1180307 (=> (not res!783792) (not e!671118))))

(assert (=> b!1180307 (= res!783792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180308 () Bool)

(declare-fun res!783787 () Bool)

(assert (=> b!1180308 (=> (not res!783787) (not e!671111))))

(declare-datatypes ((List!25850 0))(
  ( (Nil!25847) (Cons!25846 (h!27064 (_ BitVec 64)) (t!37993 List!25850)) )
))
(declare-fun arrayNoDuplicates!0 (array!76231 (_ BitVec 32) List!25850) Bool)

(assert (=> b!1180308 (= res!783787 (arrayNoDuplicates!0 lt!533242 #b00000000000000000000000000000000 Nil!25847))))

(declare-fun b!1180300 () Bool)

(declare-fun e!671115 () Bool)

(declare-fun e!671119 () Bool)

(declare-fun mapRes!46361 () Bool)

(assert (=> b!1180300 (= e!671115 (and e!671119 mapRes!46361))))

(declare-fun condMapEmpty!46361 () Bool)

(declare-datatypes ((V!44713 0))(
  ( (V!44714 (val!14901 Int)) )
))
(declare-datatypes ((ValueCell!14135 0))(
  ( (ValueCellFull!14135 (v!17535 V!44713)) (EmptyCell!14135) )
))
(declare-datatypes ((array!76233 0))(
  ( (array!76234 (arr!36760 (Array (_ BitVec 32) ValueCell!14135)) (size!37297 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76233)

(declare-fun mapDefault!46361 () ValueCell!14135)

(assert (=> b!1180300 (= condMapEmpty!46361 (= (arr!36760 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14135)) mapDefault!46361)))))

(declare-fun res!783789 () Bool)

(assert (=> start!99816 (=> (not res!783789) (not e!671118))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99816 (= res!783789 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37296 _keys!1208))))))

(assert (=> start!99816 e!671118))

(assert (=> start!99816 tp_is_empty!29689))

(declare-fun array_inv!28144 (array!76231) Bool)

(assert (=> start!99816 (array_inv!28144 _keys!1208)))

(assert (=> start!99816 true))

(assert (=> start!99816 tp!88190))

(declare-fun array_inv!28145 (array!76233) Bool)

(assert (=> start!99816 (and (array_inv!28145 _values!996) e!671115)))

(declare-fun b!1180309 () Bool)

(assert (=> b!1180309 (= e!671119 tp_is_empty!29689)))

(declare-fun e!671108 () Bool)

(declare-datatypes ((tuple2!19120 0))(
  ( (tuple2!19121 (_1!9571 (_ BitVec 64)) (_2!9571 V!44713)) )
))
(declare-datatypes ((List!25851 0))(
  ( (Nil!25848) (Cons!25847 (h!27065 tuple2!19120) (t!37994 List!25851)) )
))
(declare-datatypes ((ListLongMap!17097 0))(
  ( (ListLongMap!17098 (toList!8564 List!25851)) )
))
(declare-fun lt!533234 () ListLongMap!17097)

(declare-fun lt!533236 () tuple2!19120)

(declare-fun lt!533230 () ListLongMap!17097)

(declare-fun b!1180310 () Bool)

(declare-fun +!3889 (ListLongMap!17097 tuple2!19120) ListLongMap!17097)

(assert (=> b!1180310 (= e!671108 (= lt!533234 (+!3889 lt!533230 lt!533236)))))

(declare-fun b!1180311 () Bool)

(declare-fun res!783797 () Bool)

(assert (=> b!1180311 (=> (not res!783797) (not e!671118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180311 (= res!783797 (validMask!0 mask!1564))))

(declare-fun b!1180312 () Bool)

(declare-fun res!783794 () Bool)

(assert (=> b!1180312 (=> (not res!783794) (not e!671118))))

(assert (=> b!1180312 (= res!783794 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25847))))

(declare-fun mapNonEmpty!46361 () Bool)

(declare-fun tp!88191 () Bool)

(assert (=> mapNonEmpty!46361 (= mapRes!46361 (and tp!88191 e!671109))))

(declare-fun mapKey!46361 () (_ BitVec 32))

(declare-fun mapRest!46361 () (Array (_ BitVec 32) ValueCell!14135))

(declare-fun mapValue!46361 () ValueCell!14135)

(assert (=> mapNonEmpty!46361 (= (arr!36760 _values!996) (store mapRest!46361 mapKey!46361 mapValue!46361))))

(declare-fun b!1180313 () Bool)

(declare-fun e!671110 () Bool)

(assert (=> b!1180313 (= e!671111 (not e!671110))))

(declare-fun res!783791 () Bool)

(assert (=> b!1180313 (=> res!783791 e!671110)))

(assert (=> b!1180313 (= res!783791 (bvsgt from!1455 i!673))))

(assert (=> b!1180313 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533228 () Unit!38957)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76231 (_ BitVec 64) (_ BitVec 32)) Unit!38957)

(assert (=> b!1180313 (= lt!533228 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180314 () Bool)

(declare-fun e!671120 () Bool)

(assert (=> b!1180314 (= e!671120 true)))

(assert (=> b!1180314 e!671108))

(declare-fun res!783796 () Bool)

(assert (=> b!1180314 (=> (not res!783796) (not e!671108))))

(assert (=> b!1180314 (= res!783796 (not (= (select (arr!36759 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533240 () Unit!38957)

(assert (=> b!1180314 (= lt!533240 e!671116)))

(declare-fun c!117260 () Bool)

(assert (=> b!1180314 (= c!117260 (= (select (arr!36759 _keys!1208) from!1455) k0!934))))

(declare-fun e!671112 () Bool)

(assert (=> b!1180314 e!671112))

(declare-fun res!783785 () Bool)

(assert (=> b!1180314 (=> (not res!783785) (not e!671112))))

(declare-fun lt!533241 () ListLongMap!17097)

(declare-fun lt!533239 () ListLongMap!17097)

(assert (=> b!1180314 (= res!783785 (= lt!533241 (+!3889 lt!533239 lt!533236)))))

(declare-fun lt!533238 () V!44713)

(declare-fun get!18824 (ValueCell!14135 V!44713) V!44713)

(assert (=> b!1180314 (= lt!533236 (tuple2!19121 (select (arr!36759 _keys!1208) from!1455) (get!18824 (select (arr!36760 _values!996) from!1455) lt!533238)))))

(declare-fun b!1180315 () Bool)

(declare-fun e!671113 () Bool)

(assert (=> b!1180315 (= e!671110 e!671113)))

(declare-fun res!783782 () Bool)

(assert (=> b!1180315 (=> res!783782 e!671113)))

(assert (=> b!1180315 (= res!783782 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44713)

(declare-fun lt!533229 () array!76233)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44713)

(declare-fun getCurrentListMapNoExtraKeys!5043 (array!76231 array!76233 (_ BitVec 32) (_ BitVec 32) V!44713 V!44713 (_ BitVec 32) Int) ListLongMap!17097)

(assert (=> b!1180315 (= lt!533241 (getCurrentListMapNoExtraKeys!5043 lt!533242 lt!533229 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1180315 (= lt!533229 (array!76234 (store (arr!36760 _values!996) i!673 (ValueCellFull!14135 lt!533238)) (size!37297 _values!996)))))

(declare-fun dynLambda!3013 (Int (_ BitVec 64)) V!44713)

(assert (=> b!1180315 (= lt!533238 (dynLambda!3013 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1180315 (= lt!533234 (getCurrentListMapNoExtraKeys!5043 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180316 () Bool)

(declare-fun res!783788 () Bool)

(assert (=> b!1180316 (=> (not res!783788) (not e!671118))))

(assert (=> b!1180316 (= res!783788 (and (= (size!37297 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37296 _keys!1208) (size!37297 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46361 () Bool)

(assert (=> mapIsEmpty!46361 mapRes!46361))

(declare-fun b!1180317 () Bool)

(declare-fun Unit!38960 () Unit!38957)

(assert (=> b!1180317 (= e!671116 Unit!38960)))

(declare-fun lt!533233 () Unit!38957)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76231 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38957)

(assert (=> b!1180317 (= lt!533233 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1180317 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533235 () Unit!38957)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76231 (_ BitVec 32) (_ BitVec 32)) Unit!38957)

(assert (=> b!1180317 (= lt!533235 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1180317 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25847)))

(declare-fun lt!533237 () Unit!38957)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76231 (_ BitVec 64) (_ BitVec 32) List!25850) Unit!38957)

(assert (=> b!1180317 (= lt!533237 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25847))))

(assert (=> b!1180317 false))

(declare-fun b!1180318 () Bool)

(assert (=> b!1180318 (= e!671112 e!671114)))

(declare-fun res!783793 () Bool)

(assert (=> b!1180318 (=> res!783793 e!671114)))

(assert (=> b!1180318 (= res!783793 (not (= (select (arr!36759 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180319 () Bool)

(assert (=> b!1180319 (= e!671113 e!671120)))

(declare-fun res!783790 () Bool)

(assert (=> b!1180319 (=> res!783790 e!671120)))

(assert (=> b!1180319 (= res!783790 (not (validKeyInArray!0 (select (arr!36759 _keys!1208) from!1455))))))

(declare-fun lt!533232 () ListLongMap!17097)

(assert (=> b!1180319 (= lt!533232 lt!533239)))

(declare-fun -!1595 (ListLongMap!17097 (_ BitVec 64)) ListLongMap!17097)

(assert (=> b!1180319 (= lt!533239 (-!1595 lt!533230 k0!934))))

(assert (=> b!1180319 (= lt!533232 (getCurrentListMapNoExtraKeys!5043 lt!533242 lt!533229 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180319 (= lt!533230 (getCurrentListMapNoExtraKeys!5043 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533231 () Unit!38957)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!820 (array!76231 array!76233 (_ BitVec 32) (_ BitVec 32) V!44713 V!44713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38957)

(assert (=> b!1180319 (= lt!533231 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!820 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99816 res!783789) b!1180311))

(assert (= (and b!1180311 res!783797) b!1180316))

(assert (= (and b!1180316 res!783788) b!1180307))

(assert (= (and b!1180307 res!783792) b!1180312))

(assert (= (and b!1180312 res!783794) b!1180301))

(assert (= (and b!1180301 res!783783) b!1180302))

(assert (= (and b!1180302 res!783786) b!1180304))

(assert (= (and b!1180304 res!783795) b!1180299))

(assert (= (and b!1180299 res!783784) b!1180308))

(assert (= (and b!1180308 res!783787) b!1180313))

(assert (= (and b!1180313 (not res!783791)) b!1180315))

(assert (= (and b!1180315 (not res!783782)) b!1180319))

(assert (= (and b!1180319 (not res!783790)) b!1180314))

(assert (= (and b!1180314 res!783785) b!1180318))

(assert (= (and b!1180318 (not res!783793)) b!1180306))

(assert (= (and b!1180314 c!117260) b!1180317))

(assert (= (and b!1180314 (not c!117260)) b!1180303))

(assert (= (and b!1180314 res!783796) b!1180310))

(assert (= (and b!1180300 condMapEmpty!46361) mapIsEmpty!46361))

(assert (= (and b!1180300 (not condMapEmpty!46361)) mapNonEmpty!46361))

(get-info :version)

(assert (= (and mapNonEmpty!46361 ((_ is ValueCellFull!14135) mapValue!46361)) b!1180305))

(assert (= (and b!1180300 ((_ is ValueCellFull!14135) mapDefault!46361)) b!1180309))

(assert (= start!99816 b!1180300))

(declare-fun b_lambda!20297 () Bool)

(assert (=> (not b_lambda!20297) (not b!1180315)))

(declare-fun t!37992 () Bool)

(declare-fun tb!9963 () Bool)

(assert (=> (and start!99816 (= defaultEntry!1004 defaultEntry!1004) t!37992) tb!9963))

(declare-fun result!20501 () Bool)

(assert (=> tb!9963 (= result!20501 tp_is_empty!29689)))

(assert (=> b!1180315 t!37992))

(declare-fun b_and!41189 () Bool)

(assert (= b_and!41187 (and (=> t!37992 result!20501) b_and!41189)))

(declare-fun m!1088553 () Bool)

(assert (=> start!99816 m!1088553))

(declare-fun m!1088555 () Bool)

(assert (=> start!99816 m!1088555))

(declare-fun m!1088557 () Bool)

(assert (=> b!1180308 m!1088557))

(declare-fun m!1088559 () Bool)

(assert (=> b!1180306 m!1088559))

(declare-fun m!1088561 () Bool)

(assert (=> b!1180311 m!1088561))

(declare-fun m!1088563 () Bool)

(assert (=> b!1180310 m!1088563))

(declare-fun m!1088565 () Bool)

(assert (=> b!1180318 m!1088565))

(declare-fun m!1088567 () Bool)

(assert (=> b!1180307 m!1088567))

(declare-fun m!1088569 () Bool)

(assert (=> b!1180315 m!1088569))

(declare-fun m!1088571 () Bool)

(assert (=> b!1180315 m!1088571))

(declare-fun m!1088573 () Bool)

(assert (=> b!1180315 m!1088573))

(declare-fun m!1088575 () Bool)

(assert (=> b!1180315 m!1088575))

(assert (=> b!1180314 m!1088565))

(declare-fun m!1088577 () Bool)

(assert (=> b!1180314 m!1088577))

(declare-fun m!1088579 () Bool)

(assert (=> b!1180314 m!1088579))

(assert (=> b!1180314 m!1088579))

(declare-fun m!1088581 () Bool)

(assert (=> b!1180314 m!1088581))

(declare-fun m!1088583 () Bool)

(assert (=> b!1180317 m!1088583))

(declare-fun m!1088585 () Bool)

(assert (=> b!1180317 m!1088585))

(declare-fun m!1088587 () Bool)

(assert (=> b!1180317 m!1088587))

(declare-fun m!1088589 () Bool)

(assert (=> b!1180317 m!1088589))

(declare-fun m!1088591 () Bool)

(assert (=> b!1180317 m!1088591))

(declare-fun m!1088593 () Bool)

(assert (=> b!1180312 m!1088593))

(declare-fun m!1088595 () Bool)

(assert (=> b!1180304 m!1088595))

(declare-fun m!1088597 () Bool)

(assert (=> b!1180319 m!1088597))

(declare-fun m!1088599 () Bool)

(assert (=> b!1180319 m!1088599))

(declare-fun m!1088601 () Bool)

(assert (=> b!1180319 m!1088601))

(declare-fun m!1088603 () Bool)

(assert (=> b!1180319 m!1088603))

(assert (=> b!1180319 m!1088565))

(declare-fun m!1088605 () Bool)

(assert (=> b!1180319 m!1088605))

(assert (=> b!1180319 m!1088565))

(declare-fun m!1088607 () Bool)

(assert (=> mapNonEmpty!46361 m!1088607))

(declare-fun m!1088609 () Bool)

(assert (=> b!1180299 m!1088609))

(declare-fun m!1088611 () Bool)

(assert (=> b!1180299 m!1088611))

(declare-fun m!1088613 () Bool)

(assert (=> b!1180302 m!1088613))

(declare-fun m!1088615 () Bool)

(assert (=> b!1180313 m!1088615))

(declare-fun m!1088617 () Bool)

(assert (=> b!1180313 m!1088617))

(check-sat (not b!1180299) (not b!1180315) (not b!1180319) (not b!1180312) (not b!1180317) (not b!1180308) (not mapNonEmpty!46361) (not b_next!25159) (not b!1180302) (not b!1180307) (not start!99816) (not b!1180306) tp_is_empty!29689 (not b_lambda!20297) (not b!1180313) (not b!1180310) (not b!1180314) b_and!41189 (not b!1180311))
(check-sat b_and!41189 (not b_next!25159))
