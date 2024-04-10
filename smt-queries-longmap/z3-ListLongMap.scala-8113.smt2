; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99546 () Bool)

(assert start!99546)

(declare-fun b_free!25125 () Bool)

(declare-fun b_next!25125 () Bool)

(assert (=> start!99546 (= b_free!25125 (not b_next!25125))))

(declare-fun tp!88089 () Bool)

(declare-fun b_and!41117 () Bool)

(assert (=> start!99546 (= tp!88089 b_and!41117)))

(declare-fun b!1177905 () Bool)

(declare-fun res!782473 () Bool)

(declare-fun e!669613 () Bool)

(assert (=> b!1177905 (=> (not res!782473) (not e!669613))))

(declare-datatypes ((array!76115 0))(
  ( (array!76116 (arr!36707 (Array (_ BitVec 32) (_ BitVec 64))) (size!37243 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76115)

(declare-datatypes ((List!25781 0))(
  ( (Nil!25778) (Cons!25777 (h!26986 (_ BitVec 64)) (t!37898 List!25781)) )
))
(declare-fun arrayNoDuplicates!0 (array!76115 (_ BitVec 32) List!25781) Bool)

(assert (=> b!1177905 (= res!782473 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25778))))

(declare-fun b!1177906 () Bool)

(declare-fun e!669624 () Bool)

(declare-fun tp_is_empty!29655 () Bool)

(assert (=> b!1177906 (= e!669624 tp_is_empty!29655)))

(declare-fun b!1177907 () Bool)

(declare-fun res!782460 () Bool)

(assert (=> b!1177907 (=> (not res!782460) (not e!669613))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44667 0))(
  ( (V!44668 (val!14884 Int)) )
))
(declare-datatypes ((ValueCell!14118 0))(
  ( (ValueCellFull!14118 (v!17522 V!44667)) (EmptyCell!14118) )
))
(declare-datatypes ((array!76117 0))(
  ( (array!76118 (arr!36708 (Array (_ BitVec 32) ValueCell!14118)) (size!37244 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76117)

(assert (=> b!1177907 (= res!782460 (and (= (size!37244 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37243 _keys!1208) (size!37244 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!19044 0))(
  ( (tuple2!19045 (_1!9533 (_ BitVec 64)) (_2!9533 V!44667)) )
))
(declare-fun lt!531980 () tuple2!19044)

(declare-fun e!669616 () Bool)

(declare-datatypes ((List!25782 0))(
  ( (Nil!25779) (Cons!25778 (h!26987 tuple2!19044) (t!37899 List!25782)) )
))
(declare-datatypes ((ListLongMap!17013 0))(
  ( (ListLongMap!17014 (toList!8522 List!25782)) )
))
(declare-fun lt!531986 () ListLongMap!17013)

(declare-fun lt!531988 () ListLongMap!17013)

(declare-fun b!1177908 () Bool)

(declare-fun +!3837 (ListLongMap!17013 tuple2!19044) ListLongMap!17013)

(assert (=> b!1177908 (= e!669616 (= lt!531988 (+!3837 lt!531986 lt!531980)))))

(declare-fun mapNonEmpty!46310 () Bool)

(declare-fun mapRes!46310 () Bool)

(declare-fun tp!88088 () Bool)

(assert (=> mapNonEmpty!46310 (= mapRes!46310 (and tp!88088 e!669624))))

(declare-fun mapValue!46310 () ValueCell!14118)

(declare-fun mapKey!46310 () (_ BitVec 32))

(declare-fun mapRest!46310 () (Array (_ BitVec 32) ValueCell!14118))

(assert (=> mapNonEmpty!46310 (= (arr!36708 _values!996) (store mapRest!46310 mapKey!46310 mapValue!46310))))

(declare-fun b!1177909 () Bool)

(declare-fun e!669619 () Bool)

(declare-fun e!669615 () Bool)

(assert (=> b!1177909 (= e!669619 e!669615)))

(declare-fun res!782461 () Bool)

(assert (=> b!1177909 (=> res!782461 e!669615)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177909 (= res!782461 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44667)

(declare-fun lt!531993 () ListLongMap!17013)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44667)

(declare-fun lt!531990 () array!76117)

(declare-fun lt!531985 () array!76115)

(declare-fun getCurrentListMapNoExtraKeys!4979 (array!76115 array!76117 (_ BitVec 32) (_ BitVec 32) V!44667 V!44667 (_ BitVec 32) Int) ListLongMap!17013)

(assert (=> b!1177909 (= lt!531993 (getCurrentListMapNoExtraKeys!4979 lt!531985 lt!531990 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531984 () V!44667)

(assert (=> b!1177909 (= lt!531990 (array!76118 (store (arr!36708 _values!996) i!673 (ValueCellFull!14118 lt!531984)) (size!37244 _values!996)))))

(declare-fun dynLambda!2941 (Int (_ BitVec 64)) V!44667)

(assert (=> b!1177909 (= lt!531984 (dynLambda!2941 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177909 (= lt!531988 (getCurrentListMapNoExtraKeys!4979 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177910 () Bool)

(declare-fun res!782458 () Bool)

(assert (=> b!1177910 (=> (not res!782458) (not e!669613))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1177910 (= res!782458 (= (select (arr!36707 _keys!1208) i!673) k0!934))))

(declare-fun b!1177911 () Bool)

(declare-datatypes ((Unit!38904 0))(
  ( (Unit!38905) )
))
(declare-fun e!669618 () Unit!38904)

(declare-fun Unit!38906 () Unit!38904)

(assert (=> b!1177911 (= e!669618 Unit!38906)))

(declare-fun lt!531992 () Unit!38904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76115 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38904)

(assert (=> b!1177911 (= lt!531992 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177911 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531979 () Unit!38904)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76115 (_ BitVec 32) (_ BitVec 32)) Unit!38904)

(assert (=> b!1177911 (= lt!531979 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177911 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25778)))

(declare-fun lt!531989 () Unit!38904)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76115 (_ BitVec 64) (_ BitVec 32) List!25781) Unit!38904)

(assert (=> b!1177911 (= lt!531989 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25778))))

(assert (=> b!1177911 false))

(declare-fun b!1177913 () Bool)

(declare-fun Unit!38907 () Unit!38904)

(assert (=> b!1177913 (= e!669618 Unit!38907)))

(declare-fun b!1177914 () Bool)

(declare-fun res!782462 () Bool)

(declare-fun e!669621 () Bool)

(assert (=> b!1177914 (=> (not res!782462) (not e!669621))))

(assert (=> b!1177914 (= res!782462 (arrayNoDuplicates!0 lt!531985 #b00000000000000000000000000000000 Nil!25778))))

(declare-fun b!1177915 () Bool)

(declare-fun e!669614 () Bool)

(assert (=> b!1177915 (= e!669614 true)))

(assert (=> b!1177915 e!669616))

(declare-fun res!782468 () Bool)

(assert (=> b!1177915 (=> (not res!782468) (not e!669616))))

(assert (=> b!1177915 (= res!782468 (not (= (select (arr!36707 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531987 () Unit!38904)

(assert (=> b!1177915 (= lt!531987 e!669618)))

(declare-fun c!116811 () Bool)

(assert (=> b!1177915 (= c!116811 (= (select (arr!36707 _keys!1208) from!1455) k0!934))))

(declare-fun e!669620 () Bool)

(assert (=> b!1177915 e!669620))

(declare-fun res!782471 () Bool)

(assert (=> b!1177915 (=> (not res!782471) (not e!669620))))

(declare-fun lt!531983 () ListLongMap!17013)

(assert (=> b!1177915 (= res!782471 (= lt!531993 (+!3837 lt!531983 lt!531980)))))

(declare-fun get!18759 (ValueCell!14118 V!44667) V!44667)

(assert (=> b!1177915 (= lt!531980 (tuple2!19045 (select (arr!36707 _keys!1208) from!1455) (get!18759 (select (arr!36708 _values!996) from!1455) lt!531984)))))

(declare-fun mapIsEmpty!46310 () Bool)

(assert (=> mapIsEmpty!46310 mapRes!46310))

(declare-fun b!1177916 () Bool)

(declare-fun res!782465 () Bool)

(assert (=> b!1177916 (=> (not res!782465) (not e!669613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177916 (= res!782465 (validKeyInArray!0 k0!934))))

(declare-fun e!669623 () Bool)

(declare-fun b!1177917 () Bool)

(assert (=> b!1177917 (= e!669623 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177918 () Bool)

(assert (=> b!1177918 (= e!669615 e!669614)))

(declare-fun res!782466 () Bool)

(assert (=> b!1177918 (=> res!782466 e!669614)))

(assert (=> b!1177918 (= res!782466 (not (validKeyInArray!0 (select (arr!36707 _keys!1208) from!1455))))))

(declare-fun lt!531981 () ListLongMap!17013)

(assert (=> b!1177918 (= lt!531981 lt!531983)))

(declare-fun -!1571 (ListLongMap!17013 (_ BitVec 64)) ListLongMap!17013)

(assert (=> b!1177918 (= lt!531983 (-!1571 lt!531986 k0!934))))

(assert (=> b!1177918 (= lt!531981 (getCurrentListMapNoExtraKeys!4979 lt!531985 lt!531990 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177918 (= lt!531986 (getCurrentListMapNoExtraKeys!4979 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531982 () Unit!38904)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!798 (array!76115 array!76117 (_ BitVec 32) (_ BitVec 32) V!44667 V!44667 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38904)

(assert (=> b!1177918 (= lt!531982 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!798 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177919 () Bool)

(declare-fun res!782469 () Bool)

(assert (=> b!1177919 (=> (not res!782469) (not e!669613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177919 (= res!782469 (validMask!0 mask!1564))))

(declare-fun b!1177920 () Bool)

(declare-fun e!669622 () Bool)

(declare-fun e!669617 () Bool)

(assert (=> b!1177920 (= e!669622 (and e!669617 mapRes!46310))))

(declare-fun condMapEmpty!46310 () Bool)

(declare-fun mapDefault!46310 () ValueCell!14118)

(assert (=> b!1177920 (= condMapEmpty!46310 (= (arr!36708 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14118)) mapDefault!46310)))))

(declare-fun b!1177921 () Bool)

(declare-fun res!782459 () Bool)

(assert (=> b!1177921 (=> (not res!782459) (not e!669613))))

(assert (=> b!1177921 (= res!782459 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37243 _keys!1208))))))

(declare-fun b!1177922 () Bool)

(assert (=> b!1177922 (= e!669613 e!669621)))

(declare-fun res!782470 () Bool)

(assert (=> b!1177922 (=> (not res!782470) (not e!669621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76115 (_ BitVec 32)) Bool)

(assert (=> b!1177922 (= res!782470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531985 mask!1564))))

(assert (=> b!1177922 (= lt!531985 (array!76116 (store (arr!36707 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37243 _keys!1208)))))

(declare-fun b!1177923 () Bool)

(assert (=> b!1177923 (= e!669617 tp_is_empty!29655)))

(declare-fun b!1177924 () Bool)

(declare-fun res!782467 () Bool)

(assert (=> b!1177924 (=> (not res!782467) (not e!669613))))

(assert (=> b!1177924 (= res!782467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177925 () Bool)

(assert (=> b!1177925 (= e!669621 (not e!669619))))

(declare-fun res!782463 () Bool)

(assert (=> b!1177925 (=> res!782463 e!669619)))

(assert (=> b!1177925 (= res!782463 (bvsgt from!1455 i!673))))

(assert (=> b!1177925 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531991 () Unit!38904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76115 (_ BitVec 64) (_ BitVec 32)) Unit!38904)

(assert (=> b!1177925 (= lt!531991 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177912 () Bool)

(assert (=> b!1177912 (= e!669620 e!669623)))

(declare-fun res!782472 () Bool)

(assert (=> b!1177912 (=> res!782472 e!669623)))

(assert (=> b!1177912 (= res!782472 (not (= (select (arr!36707 _keys!1208) from!1455) k0!934)))))

(declare-fun res!782464 () Bool)

(assert (=> start!99546 (=> (not res!782464) (not e!669613))))

(assert (=> start!99546 (= res!782464 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37243 _keys!1208))))))

(assert (=> start!99546 e!669613))

(assert (=> start!99546 tp_is_empty!29655))

(declare-fun array_inv!28032 (array!76115) Bool)

(assert (=> start!99546 (array_inv!28032 _keys!1208)))

(assert (=> start!99546 true))

(assert (=> start!99546 tp!88089))

(declare-fun array_inv!28033 (array!76117) Bool)

(assert (=> start!99546 (and (array_inv!28033 _values!996) e!669622)))

(assert (= (and start!99546 res!782464) b!1177919))

(assert (= (and b!1177919 res!782469) b!1177907))

(assert (= (and b!1177907 res!782460) b!1177924))

(assert (= (and b!1177924 res!782467) b!1177905))

(assert (= (and b!1177905 res!782473) b!1177921))

(assert (= (and b!1177921 res!782459) b!1177916))

(assert (= (and b!1177916 res!782465) b!1177910))

(assert (= (and b!1177910 res!782458) b!1177922))

(assert (= (and b!1177922 res!782470) b!1177914))

(assert (= (and b!1177914 res!782462) b!1177925))

(assert (= (and b!1177925 (not res!782463)) b!1177909))

(assert (= (and b!1177909 (not res!782461)) b!1177918))

(assert (= (and b!1177918 (not res!782466)) b!1177915))

(assert (= (and b!1177915 res!782471) b!1177912))

(assert (= (and b!1177912 (not res!782472)) b!1177917))

(assert (= (and b!1177915 c!116811) b!1177911))

(assert (= (and b!1177915 (not c!116811)) b!1177913))

(assert (= (and b!1177915 res!782468) b!1177908))

(assert (= (and b!1177920 condMapEmpty!46310) mapIsEmpty!46310))

(assert (= (and b!1177920 (not condMapEmpty!46310)) mapNonEmpty!46310))

(get-info :version)

(assert (= (and mapNonEmpty!46310 ((_ is ValueCellFull!14118) mapValue!46310)) b!1177906))

(assert (= (and b!1177920 ((_ is ValueCellFull!14118) mapDefault!46310)) b!1177923))

(assert (= start!99546 b!1177920))

(declare-fun b_lambda!20269 () Bool)

(assert (=> (not b_lambda!20269) (not b!1177909)))

(declare-fun t!37897 () Bool)

(declare-fun tb!9937 () Bool)

(assert (=> (and start!99546 (= defaultEntry!1004 defaultEntry!1004) t!37897) tb!9937))

(declare-fun result!20441 () Bool)

(assert (=> tb!9937 (= result!20441 tp_is_empty!29655)))

(assert (=> b!1177909 t!37897))

(declare-fun b_and!41119 () Bool)

(assert (= b_and!41117 (and (=> t!37897 result!20441) b_and!41119)))

(declare-fun m!1085859 () Bool)

(assert (=> b!1177911 m!1085859))

(declare-fun m!1085861 () Bool)

(assert (=> b!1177911 m!1085861))

(declare-fun m!1085863 () Bool)

(assert (=> b!1177911 m!1085863))

(declare-fun m!1085865 () Bool)

(assert (=> b!1177911 m!1085865))

(declare-fun m!1085867 () Bool)

(assert (=> b!1177911 m!1085867))

(declare-fun m!1085869 () Bool)

(assert (=> b!1177905 m!1085869))

(declare-fun m!1085871 () Bool)

(assert (=> b!1177915 m!1085871))

(declare-fun m!1085873 () Bool)

(assert (=> b!1177915 m!1085873))

(declare-fun m!1085875 () Bool)

(assert (=> b!1177915 m!1085875))

(assert (=> b!1177915 m!1085875))

(declare-fun m!1085877 () Bool)

(assert (=> b!1177915 m!1085877))

(declare-fun m!1085879 () Bool)

(assert (=> b!1177918 m!1085879))

(declare-fun m!1085881 () Bool)

(assert (=> b!1177918 m!1085881))

(declare-fun m!1085883 () Bool)

(assert (=> b!1177918 m!1085883))

(declare-fun m!1085885 () Bool)

(assert (=> b!1177918 m!1085885))

(assert (=> b!1177918 m!1085871))

(declare-fun m!1085887 () Bool)

(assert (=> b!1177918 m!1085887))

(assert (=> b!1177918 m!1085871))

(declare-fun m!1085889 () Bool)

(assert (=> b!1177924 m!1085889))

(declare-fun m!1085891 () Bool)

(assert (=> b!1177909 m!1085891))

(declare-fun m!1085893 () Bool)

(assert (=> b!1177909 m!1085893))

(declare-fun m!1085895 () Bool)

(assert (=> b!1177909 m!1085895))

(declare-fun m!1085897 () Bool)

(assert (=> b!1177909 m!1085897))

(declare-fun m!1085899 () Bool)

(assert (=> b!1177916 m!1085899))

(declare-fun m!1085901 () Bool)

(assert (=> b!1177925 m!1085901))

(declare-fun m!1085903 () Bool)

(assert (=> b!1177925 m!1085903))

(declare-fun m!1085905 () Bool)

(assert (=> b!1177922 m!1085905))

(declare-fun m!1085907 () Bool)

(assert (=> b!1177922 m!1085907))

(declare-fun m!1085909 () Bool)

(assert (=> mapNonEmpty!46310 m!1085909))

(declare-fun m!1085911 () Bool)

(assert (=> b!1177908 m!1085911))

(declare-fun m!1085913 () Bool)

(assert (=> b!1177910 m!1085913))

(assert (=> b!1177912 m!1085871))

(declare-fun m!1085915 () Bool)

(assert (=> b!1177917 m!1085915))

(declare-fun m!1085917 () Bool)

(assert (=> b!1177914 m!1085917))

(declare-fun m!1085919 () Bool)

(assert (=> start!99546 m!1085919))

(declare-fun m!1085921 () Bool)

(assert (=> start!99546 m!1085921))

(declare-fun m!1085923 () Bool)

(assert (=> b!1177919 m!1085923))

(check-sat (not b!1177915) (not b_next!25125) (not start!99546) (not b!1177911) (not b_lambda!20269) (not b!1177922) (not b!1177918) (not mapNonEmpty!46310) (not b!1177909) (not b!1177905) (not b!1177924) (not b!1177925) (not b!1177908) (not b!1177917) b_and!41119 tp_is_empty!29655 (not b!1177919) (not b!1177916) (not b!1177914))
(check-sat b_and!41119 (not b_next!25125))
