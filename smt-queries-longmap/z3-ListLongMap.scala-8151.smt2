; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99774 () Bool)

(assert start!99774)

(declare-fun b_free!25353 () Bool)

(declare-fun b_next!25353 () Bool)

(assert (=> start!99774 (= b_free!25353 (not b_next!25353))))

(declare-fun tp!88773 () Bool)

(declare-fun b_and!41573 () Bool)

(assert (=> start!99774 (= tp!88773 b_and!41573)))

(declare-fun b!1185229 () Bool)

(declare-fun res!787854 () Bool)

(declare-fun e!673894 () Bool)

(assert (=> b!1185229 (=> (not res!787854) (not e!673894))))

(declare-datatypes ((array!76563 0))(
  ( (array!76564 (arr!36931 (Array (_ BitVec 32) (_ BitVec 64))) (size!37467 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76563)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76563 (_ BitVec 32)) Bool)

(assert (=> b!1185229 (= res!787854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185230 () Bool)

(declare-fun res!787844 () Bool)

(declare-fun e!673889 () Bool)

(assert (=> b!1185230 (=> (not res!787844) (not e!673889))))

(declare-fun lt!537830 () array!76563)

(declare-datatypes ((List!25976 0))(
  ( (Nil!25973) (Cons!25972 (h!27181 (_ BitVec 64)) (t!38321 List!25976)) )
))
(declare-fun arrayNoDuplicates!0 (array!76563 (_ BitVec 32) List!25976) Bool)

(assert (=> b!1185230 (= res!787844 (arrayNoDuplicates!0 lt!537830 #b00000000000000000000000000000000 Nil!25973))))

(declare-fun e!673893 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1185231 () Bool)

(declare-fun arrayContainsKey!0 (array!76563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185231 (= e!673893 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185232 () Bool)

(declare-fun res!787848 () Bool)

(assert (=> b!1185232 (=> (not res!787848) (not e!673894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185232 (= res!787848 (validKeyInArray!0 k0!934))))

(declare-fun b!1185233 () Bool)

(declare-fun res!787849 () Bool)

(assert (=> b!1185233 (=> (not res!787849) (not e!673894))))

(assert (=> b!1185233 (= res!787849 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25973))))

(declare-fun b!1185234 () Bool)

(declare-fun e!673884 () Bool)

(assert (=> b!1185234 (= e!673884 true)))

(declare-datatypes ((V!44971 0))(
  ( (V!44972 (val!14998 Int)) )
))
(declare-datatypes ((tuple2!19236 0))(
  ( (tuple2!19237 (_1!9629 (_ BitVec 64)) (_2!9629 V!44971)) )
))
(declare-datatypes ((List!25977 0))(
  ( (Nil!25974) (Cons!25973 (h!27182 tuple2!19236) (t!38322 List!25977)) )
))
(declare-datatypes ((ListLongMap!17205 0))(
  ( (ListLongMap!17206 (toList!8618 List!25977)) )
))
(declare-fun lt!537816 () ListLongMap!17205)

(declare-fun lt!537831 () ListLongMap!17205)

(declare-fun -!1653 (ListLongMap!17205 (_ BitVec 64)) ListLongMap!17205)

(assert (=> b!1185234 (= (-!1653 lt!537816 k0!934) lt!537831)))

(declare-fun lt!537825 () ListLongMap!17205)

(declare-datatypes ((Unit!39257 0))(
  ( (Unit!39258) )
))
(declare-fun lt!537813 () Unit!39257)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!537827 () V!44971)

(declare-fun addRemoveCommutativeForDiffKeys!178 (ListLongMap!17205 (_ BitVec 64) V!44971 (_ BitVec 64)) Unit!39257)

(assert (=> b!1185234 (= lt!537813 (addRemoveCommutativeForDiffKeys!178 lt!537825 (select (arr!36931 _keys!1208) from!1455) lt!537827 k0!934))))

(declare-fun lt!537824 () ListLongMap!17205)

(declare-fun lt!537828 () ListLongMap!17205)

(declare-fun lt!537815 () ListLongMap!17205)

(assert (=> b!1185234 (and (= lt!537828 lt!537816) (= lt!537824 lt!537815))))

(declare-fun lt!537823 () tuple2!19236)

(declare-fun +!3915 (ListLongMap!17205 tuple2!19236) ListLongMap!17205)

(assert (=> b!1185234 (= lt!537816 (+!3915 lt!537825 lt!537823))))

(assert (=> b!1185234 (not (= (select (arr!36931 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537826 () Unit!39257)

(declare-fun e!673892 () Unit!39257)

(assert (=> b!1185234 (= lt!537826 e!673892)))

(declare-fun c!117153 () Bool)

(assert (=> b!1185234 (= c!117153 (= (select (arr!36931 _keys!1208) from!1455) k0!934))))

(declare-fun e!673883 () Bool)

(assert (=> b!1185234 e!673883))

(declare-fun res!787852 () Bool)

(assert (=> b!1185234 (=> (not res!787852) (not e!673883))))

(declare-fun lt!537822 () ListLongMap!17205)

(assert (=> b!1185234 (= res!787852 (= lt!537822 lt!537831))))

(assert (=> b!1185234 (= lt!537831 (+!3915 lt!537824 lt!537823))))

(assert (=> b!1185234 (= lt!537823 (tuple2!19237 (select (arr!36931 _keys!1208) from!1455) lt!537827))))

(declare-fun lt!537829 () V!44971)

(declare-datatypes ((ValueCell!14232 0))(
  ( (ValueCellFull!14232 (v!17636 V!44971)) (EmptyCell!14232) )
))
(declare-datatypes ((array!76565 0))(
  ( (array!76566 (arr!36932 (Array (_ BitVec 32) ValueCell!14232)) (size!37468 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76565)

(declare-fun get!18906 (ValueCell!14232 V!44971) V!44971)

(assert (=> b!1185234 (= lt!537827 (get!18906 (select (arr!36932 _values!996) from!1455) lt!537829))))

(declare-fun b!1185235 () Bool)

(declare-fun e!673888 () Bool)

(declare-fun e!673887 () Bool)

(assert (=> b!1185235 (= e!673888 e!673887)))

(declare-fun res!787857 () Bool)

(assert (=> b!1185235 (=> res!787857 e!673887)))

(assert (=> b!1185235 (= res!787857 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44971)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44971)

(declare-fun lt!537818 () array!76565)

(declare-fun getCurrentListMapNoExtraKeys!5065 (array!76563 array!76565 (_ BitVec 32) (_ BitVec 32) V!44971 V!44971 (_ BitVec 32) Int) ListLongMap!17205)

(assert (=> b!1185235 (= lt!537822 (getCurrentListMapNoExtraKeys!5065 lt!537830 lt!537818 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185235 (= lt!537818 (array!76566 (store (arr!36932 _values!996) i!673 (ValueCellFull!14232 lt!537829)) (size!37468 _values!996)))))

(declare-fun dynLambda!3016 (Int (_ BitVec 64)) V!44971)

(assert (=> b!1185235 (= lt!537829 (dynLambda!3016 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185235 (= lt!537828 (getCurrentListMapNoExtraKeys!5065 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185236 () Bool)

(declare-fun e!673885 () Bool)

(declare-fun e!673886 () Bool)

(declare-fun mapRes!46652 () Bool)

(assert (=> b!1185236 (= e!673885 (and e!673886 mapRes!46652))))

(declare-fun condMapEmpty!46652 () Bool)

(declare-fun mapDefault!46652 () ValueCell!14232)

(assert (=> b!1185236 (= condMapEmpty!46652 (= (arr!36932 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14232)) mapDefault!46652)))))

(declare-fun b!1185237 () Bool)

(assert (=> b!1185237 (= e!673887 e!673884)))

(declare-fun res!787853 () Bool)

(assert (=> b!1185237 (=> res!787853 e!673884)))

(assert (=> b!1185237 (= res!787853 (not (validKeyInArray!0 (select (arr!36931 _keys!1208) from!1455))))))

(assert (=> b!1185237 (= lt!537815 lt!537824)))

(assert (=> b!1185237 (= lt!537824 (-!1653 lt!537825 k0!934))))

(assert (=> b!1185237 (= lt!537815 (getCurrentListMapNoExtraKeys!5065 lt!537830 lt!537818 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185237 (= lt!537825 (getCurrentListMapNoExtraKeys!5065 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537814 () Unit!39257)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!870 (array!76563 array!76565 (_ BitVec 32) (_ BitVec 32) V!44971 V!44971 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39257)

(assert (=> b!1185237 (= lt!537814 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!870 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46652 () Bool)

(declare-fun tp!88772 () Bool)

(declare-fun e!673891 () Bool)

(assert (=> mapNonEmpty!46652 (= mapRes!46652 (and tp!88772 e!673891))))

(declare-fun mapRest!46652 () (Array (_ BitVec 32) ValueCell!14232))

(declare-fun mapKey!46652 () (_ BitVec 32))

(declare-fun mapValue!46652 () ValueCell!14232)

(assert (=> mapNonEmpty!46652 (= (arr!36932 _values!996) (store mapRest!46652 mapKey!46652 mapValue!46652))))

(declare-fun b!1185238 () Bool)

(declare-fun res!787855 () Bool)

(assert (=> b!1185238 (=> (not res!787855) (not e!673894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185238 (= res!787855 (validMask!0 mask!1564))))

(declare-fun res!787846 () Bool)

(assert (=> start!99774 (=> (not res!787846) (not e!673894))))

(assert (=> start!99774 (= res!787846 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37467 _keys!1208))))))

(assert (=> start!99774 e!673894))

(declare-fun tp_is_empty!29883 () Bool)

(assert (=> start!99774 tp_is_empty!29883))

(declare-fun array_inv!28184 (array!76563) Bool)

(assert (=> start!99774 (array_inv!28184 _keys!1208)))

(assert (=> start!99774 true))

(assert (=> start!99774 tp!88773))

(declare-fun array_inv!28185 (array!76565) Bool)

(assert (=> start!99774 (and (array_inv!28185 _values!996) e!673885)))

(declare-fun b!1185239 () Bool)

(assert (=> b!1185239 (= e!673894 e!673889)))

(declare-fun res!787856 () Bool)

(assert (=> b!1185239 (=> (not res!787856) (not e!673889))))

(assert (=> b!1185239 (= res!787856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537830 mask!1564))))

(assert (=> b!1185239 (= lt!537830 (array!76564 (store (arr!36931 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37467 _keys!1208)))))

(declare-fun b!1185240 () Bool)

(declare-fun res!787858 () Bool)

(assert (=> b!1185240 (=> (not res!787858) (not e!673894))))

(assert (=> b!1185240 (= res!787858 (= (select (arr!36931 _keys!1208) i!673) k0!934))))

(declare-fun b!1185241 () Bool)

(assert (=> b!1185241 (= e!673891 tp_is_empty!29883)))

(declare-fun b!1185242 () Bool)

(assert (=> b!1185242 (= e!673883 e!673893)))

(declare-fun res!787850 () Bool)

(assert (=> b!1185242 (=> res!787850 e!673893)))

(assert (=> b!1185242 (= res!787850 (not (= (select (arr!36931 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!46652 () Bool)

(assert (=> mapIsEmpty!46652 mapRes!46652))

(declare-fun b!1185243 () Bool)

(assert (=> b!1185243 (= e!673889 (not e!673888))))

(declare-fun res!787851 () Bool)

(assert (=> b!1185243 (=> res!787851 e!673888)))

(assert (=> b!1185243 (= res!787851 (bvsgt from!1455 i!673))))

(assert (=> b!1185243 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537820 () Unit!39257)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76563 (_ BitVec 64) (_ BitVec 32)) Unit!39257)

(assert (=> b!1185243 (= lt!537820 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185244 () Bool)

(declare-fun res!787845 () Bool)

(assert (=> b!1185244 (=> (not res!787845) (not e!673894))))

(assert (=> b!1185244 (= res!787845 (and (= (size!37468 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37467 _keys!1208) (size!37468 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185245 () Bool)

(declare-fun Unit!39259 () Unit!39257)

(assert (=> b!1185245 (= e!673892 Unit!39259)))

(declare-fun lt!537821 () Unit!39257)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39257)

(assert (=> b!1185245 (= lt!537821 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185245 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537817 () Unit!39257)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76563 (_ BitVec 32) (_ BitVec 32)) Unit!39257)

(assert (=> b!1185245 (= lt!537817 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185245 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25973)))

(declare-fun lt!537819 () Unit!39257)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76563 (_ BitVec 64) (_ BitVec 32) List!25976) Unit!39257)

(assert (=> b!1185245 (= lt!537819 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25973))))

(assert (=> b!1185245 false))

(declare-fun b!1185246 () Bool)

(assert (=> b!1185246 (= e!673886 tp_is_empty!29883)))

(declare-fun b!1185247 () Bool)

(declare-fun res!787847 () Bool)

(assert (=> b!1185247 (=> (not res!787847) (not e!673894))))

(assert (=> b!1185247 (= res!787847 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37467 _keys!1208))))))

(declare-fun b!1185248 () Bool)

(declare-fun Unit!39260 () Unit!39257)

(assert (=> b!1185248 (= e!673892 Unit!39260)))

(assert (= (and start!99774 res!787846) b!1185238))

(assert (= (and b!1185238 res!787855) b!1185244))

(assert (= (and b!1185244 res!787845) b!1185229))

(assert (= (and b!1185229 res!787854) b!1185233))

(assert (= (and b!1185233 res!787849) b!1185247))

(assert (= (and b!1185247 res!787847) b!1185232))

(assert (= (and b!1185232 res!787848) b!1185240))

(assert (= (and b!1185240 res!787858) b!1185239))

(assert (= (and b!1185239 res!787856) b!1185230))

(assert (= (and b!1185230 res!787844) b!1185243))

(assert (= (and b!1185243 (not res!787851)) b!1185235))

(assert (= (and b!1185235 (not res!787857)) b!1185237))

(assert (= (and b!1185237 (not res!787853)) b!1185234))

(assert (= (and b!1185234 res!787852) b!1185242))

(assert (= (and b!1185242 (not res!787850)) b!1185231))

(assert (= (and b!1185234 c!117153) b!1185245))

(assert (= (and b!1185234 (not c!117153)) b!1185248))

(assert (= (and b!1185236 condMapEmpty!46652) mapIsEmpty!46652))

(assert (= (and b!1185236 (not condMapEmpty!46652)) mapNonEmpty!46652))

(get-info :version)

(assert (= (and mapNonEmpty!46652 ((_ is ValueCellFull!14232) mapValue!46652)) b!1185241))

(assert (= (and b!1185236 ((_ is ValueCellFull!14232) mapDefault!46652)) b!1185246))

(assert (= start!99774 b!1185236))

(declare-fun b_lambda!20497 () Bool)

(assert (=> (not b_lambda!20497) (not b!1185235)))

(declare-fun t!38320 () Bool)

(declare-fun tb!10165 () Bool)

(assert (=> (and start!99774 (= defaultEntry!1004 defaultEntry!1004) t!38320) tb!10165))

(declare-fun result!20897 () Bool)

(assert (=> tb!10165 (= result!20897 tp_is_empty!29883)))

(assert (=> b!1185235 t!38320))

(declare-fun b_and!41575 () Bool)

(assert (= b_and!41573 (and (=> t!38320 result!20897) b_and!41575)))

(declare-fun m!1093615 () Bool)

(assert (=> start!99774 m!1093615))

(declare-fun m!1093617 () Bool)

(assert (=> start!99774 m!1093617))

(declare-fun m!1093619 () Bool)

(assert (=> mapNonEmpty!46652 m!1093619))

(declare-fun m!1093621 () Bool)

(assert (=> b!1185237 m!1093621))

(declare-fun m!1093623 () Bool)

(assert (=> b!1185237 m!1093623))

(declare-fun m!1093625 () Bool)

(assert (=> b!1185237 m!1093625))

(declare-fun m!1093627 () Bool)

(assert (=> b!1185237 m!1093627))

(declare-fun m!1093629 () Bool)

(assert (=> b!1185237 m!1093629))

(declare-fun m!1093631 () Bool)

(assert (=> b!1185237 m!1093631))

(assert (=> b!1185237 m!1093629))

(declare-fun m!1093633 () Bool)

(assert (=> b!1185245 m!1093633))

(declare-fun m!1093635 () Bool)

(assert (=> b!1185245 m!1093635))

(declare-fun m!1093637 () Bool)

(assert (=> b!1185245 m!1093637))

(declare-fun m!1093639 () Bool)

(assert (=> b!1185245 m!1093639))

(declare-fun m!1093641 () Bool)

(assert (=> b!1185245 m!1093641))

(declare-fun m!1093643 () Bool)

(assert (=> b!1185240 m!1093643))

(declare-fun m!1093645 () Bool)

(assert (=> b!1185243 m!1093645))

(declare-fun m!1093647 () Bool)

(assert (=> b!1185243 m!1093647))

(declare-fun m!1093649 () Bool)

(assert (=> b!1185239 m!1093649))

(declare-fun m!1093651 () Bool)

(assert (=> b!1185239 m!1093651))

(declare-fun m!1093653 () Bool)

(assert (=> b!1185231 m!1093653))

(declare-fun m!1093655 () Bool)

(assert (=> b!1185229 m!1093655))

(declare-fun m!1093657 () Bool)

(assert (=> b!1185235 m!1093657))

(declare-fun m!1093659 () Bool)

(assert (=> b!1185235 m!1093659))

(declare-fun m!1093661 () Bool)

(assert (=> b!1185235 m!1093661))

(declare-fun m!1093663 () Bool)

(assert (=> b!1185235 m!1093663))

(declare-fun m!1093665 () Bool)

(assert (=> b!1185232 m!1093665))

(declare-fun m!1093667 () Bool)

(assert (=> b!1185238 m!1093667))

(assert (=> b!1185242 m!1093629))

(declare-fun m!1093669 () Bool)

(assert (=> b!1185233 m!1093669))

(declare-fun m!1093671 () Bool)

(assert (=> b!1185234 m!1093671))

(assert (=> b!1185234 m!1093671))

(declare-fun m!1093673 () Bool)

(assert (=> b!1185234 m!1093673))

(declare-fun m!1093675 () Bool)

(assert (=> b!1185234 m!1093675))

(assert (=> b!1185234 m!1093629))

(declare-fun m!1093677 () Bool)

(assert (=> b!1185234 m!1093677))

(declare-fun m!1093679 () Bool)

(assert (=> b!1185234 m!1093679))

(declare-fun m!1093681 () Bool)

(assert (=> b!1185234 m!1093681))

(assert (=> b!1185234 m!1093629))

(declare-fun m!1093683 () Bool)

(assert (=> b!1185230 m!1093683))

(check-sat (not mapNonEmpty!46652) b_and!41575 (not b_lambda!20497) (not b!1185235) (not b!1185239) tp_is_empty!29883 (not b!1185233) (not b!1185231) (not start!99774) (not b!1185243) (not b_next!25353) (not b!1185232) (not b!1185230) (not b!1185234) (not b!1185237) (not b!1185238) (not b!1185229) (not b!1185245))
(check-sat b_and!41575 (not b_next!25353))
