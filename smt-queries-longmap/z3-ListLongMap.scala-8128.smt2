; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99636 () Bool)

(assert start!99636)

(declare-fun b_free!25215 () Bool)

(declare-fun b_next!25215 () Bool)

(assert (=> start!99636 (= b_free!25215 (not b_next!25215))))

(declare-fun tp!88358 () Bool)

(declare-fun b_and!41297 () Bool)

(assert (=> start!99636 (= tp!88358 b_and!41297)))

(declare-fun b!1180889 () Bool)

(declare-fun res!784686 () Bool)

(declare-fun e!671369 () Bool)

(assert (=> b!1180889 (=> (not res!784686) (not e!671369))))

(declare-datatypes ((array!76293 0))(
  ( (array!76294 (arr!36796 (Array (_ BitVec 32) (_ BitVec 64))) (size!37332 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76293)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1180889 (= res!784686 (= (select (arr!36796 _keys!1208) i!673) k0!934))))

(declare-fun e!671374 () Bool)

(declare-fun b!1180890 () Bool)

(declare-fun arrayContainsKey!0 (array!76293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180890 (= e!671374 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46445 () Bool)

(declare-fun mapRes!46445 () Bool)

(declare-fun tp!88359 () Bool)

(declare-fun e!671373 () Bool)

(assert (=> mapNonEmpty!46445 (= mapRes!46445 (and tp!88359 e!671373))))

(declare-datatypes ((V!44787 0))(
  ( (V!44788 (val!14929 Int)) )
))
(declare-datatypes ((ValueCell!14163 0))(
  ( (ValueCellFull!14163 (v!17567 V!44787)) (EmptyCell!14163) )
))
(declare-fun mapRest!46445 () (Array (_ BitVec 32) ValueCell!14163))

(declare-fun mapValue!46445 () ValueCell!14163)

(declare-fun mapKey!46445 () (_ BitVec 32))

(declare-datatypes ((array!76295 0))(
  ( (array!76296 (arr!36797 (Array (_ BitVec 32) ValueCell!14163)) (size!37333 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76295)

(assert (=> mapNonEmpty!46445 (= (arr!36797 _values!996) (store mapRest!46445 mapKey!46445 mapValue!46445))))

(declare-fun b!1180891 () Bool)

(declare-fun e!671376 () Bool)

(declare-fun e!671377 () Bool)

(assert (=> b!1180891 (= e!671376 (and e!671377 mapRes!46445))))

(declare-fun condMapEmpty!46445 () Bool)

(declare-fun mapDefault!46445 () ValueCell!14163)

(assert (=> b!1180891 (= condMapEmpty!46445 (= (arr!36797 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14163)) mapDefault!46445)))))

(declare-fun b!1180892 () Bool)

(declare-fun res!784685 () Bool)

(assert (=> b!1180892 (=> (not res!784685) (not e!671369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180892 (= res!784685 (validKeyInArray!0 k0!934))))

(declare-fun b!1180893 () Bool)

(declare-fun e!671380 () Bool)

(declare-fun e!671379 () Bool)

(assert (=> b!1180893 (= e!671380 e!671379)))

(declare-fun res!784680 () Bool)

(assert (=> b!1180893 (=> res!784680 e!671379)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1180893 (= res!784680 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44787)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!44787)

(declare-datatypes ((tuple2!19120 0))(
  ( (tuple2!19121 (_1!9571 (_ BitVec 64)) (_2!9571 V!44787)) )
))
(declare-datatypes ((List!25860 0))(
  ( (Nil!25857) (Cons!25856 (h!27065 tuple2!19120) (t!38067 List!25860)) )
))
(declare-datatypes ((ListLongMap!17089 0))(
  ( (ListLongMap!17090 (toList!8560 List!25860)) )
))
(declare-fun lt!534008 () ListLongMap!17089)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!534007 () array!76295)

(declare-fun lt!534011 () array!76293)

(declare-fun getCurrentListMapNoExtraKeys!5014 (array!76293 array!76295 (_ BitVec 32) (_ BitVec 32) V!44787 V!44787 (_ BitVec 32) Int) ListLongMap!17089)

(assert (=> b!1180893 (= lt!534008 (getCurrentListMapNoExtraKeys!5014 lt!534011 lt!534007 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534004 () V!44787)

(assert (=> b!1180893 (= lt!534007 (array!76296 (store (arr!36797 _values!996) i!673 (ValueCellFull!14163 lt!534004)) (size!37333 _values!996)))))

(declare-fun dynLambda!2971 (Int (_ BitVec 64)) V!44787)

(assert (=> b!1180893 (= lt!534004 (dynLambda!2971 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534012 () ListLongMap!17089)

(assert (=> b!1180893 (= lt!534012 (getCurrentListMapNoExtraKeys!5014 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180895 () Bool)

(declare-fun e!671378 () Bool)

(assert (=> b!1180895 (= e!671379 e!671378)))

(declare-fun res!784684 () Bool)

(assert (=> b!1180895 (=> res!784684 e!671378)))

(assert (=> b!1180895 (= res!784684 (not (validKeyInArray!0 (select (arr!36796 _keys!1208) from!1455))))))

(declare-fun lt!534018 () ListLongMap!17089)

(declare-fun lt!534009 () ListLongMap!17089)

(assert (=> b!1180895 (= lt!534018 lt!534009)))

(declare-fun lt!534013 () ListLongMap!17089)

(declare-fun -!1601 (ListLongMap!17089 (_ BitVec 64)) ListLongMap!17089)

(assert (=> b!1180895 (= lt!534009 (-!1601 lt!534013 k0!934))))

(assert (=> b!1180895 (= lt!534018 (getCurrentListMapNoExtraKeys!5014 lt!534011 lt!534007 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180895 (= lt!534013 (getCurrentListMapNoExtraKeys!5014 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39044 0))(
  ( (Unit!39045) )
))
(declare-fun lt!534014 () Unit!39044)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!828 (array!76293 array!76295 (_ BitVec 32) (_ BitVec 32) V!44787 V!44787 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39044)

(assert (=> b!1180895 (= lt!534014 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!828 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180896 () Bool)

(declare-fun res!784692 () Bool)

(assert (=> b!1180896 (=> (not res!784692) (not e!671369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76293 (_ BitVec 32)) Bool)

(assert (=> b!1180896 (= res!784692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180897 () Bool)

(declare-fun e!671371 () Unit!39044)

(declare-fun Unit!39046 () Unit!39044)

(assert (=> b!1180897 (= e!671371 Unit!39046)))

(declare-fun b!1180898 () Bool)

(declare-fun res!784683 () Bool)

(declare-fun e!671368 () Bool)

(assert (=> b!1180898 (=> (not res!784683) (not e!671368))))

(declare-datatypes ((List!25861 0))(
  ( (Nil!25858) (Cons!25857 (h!27066 (_ BitVec 64)) (t!38068 List!25861)) )
))
(declare-fun arrayNoDuplicates!0 (array!76293 (_ BitVec 32) List!25861) Bool)

(assert (=> b!1180898 (= res!784683 (arrayNoDuplicates!0 lt!534011 #b00000000000000000000000000000000 Nil!25858))))

(declare-fun b!1180899 () Bool)

(declare-fun res!784693 () Bool)

(assert (=> b!1180899 (=> (not res!784693) (not e!671369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180899 (= res!784693 (validMask!0 mask!1564))))

(declare-fun b!1180900 () Bool)

(declare-fun e!671375 () Bool)

(assert (=> b!1180900 (= e!671375 e!671374)))

(declare-fun res!784687 () Bool)

(assert (=> b!1180900 (=> res!784687 e!671374)))

(assert (=> b!1180900 (= res!784687 (not (= (select (arr!36796 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180901 () Bool)

(assert (=> b!1180901 (= e!671368 (not e!671380))))

(declare-fun res!784681 () Bool)

(assert (=> b!1180901 (=> res!784681 e!671380)))

(assert (=> b!1180901 (= res!784681 (bvsgt from!1455 i!673))))

(assert (=> b!1180901 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534010 () Unit!39044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76293 (_ BitVec 64) (_ BitVec 32)) Unit!39044)

(assert (=> b!1180901 (= lt!534010 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180894 () Bool)

(declare-fun res!784689 () Bool)

(assert (=> b!1180894 (=> (not res!784689) (not e!671369))))

(assert (=> b!1180894 (= res!784689 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37332 _keys!1208))))))

(declare-fun res!784677 () Bool)

(assert (=> start!99636 (=> (not res!784677) (not e!671369))))

(assert (=> start!99636 (= res!784677 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37332 _keys!1208))))))

(assert (=> start!99636 e!671369))

(declare-fun tp_is_empty!29745 () Bool)

(assert (=> start!99636 tp_is_empty!29745))

(declare-fun array_inv!28096 (array!76293) Bool)

(assert (=> start!99636 (array_inv!28096 _keys!1208)))

(assert (=> start!99636 true))

(assert (=> start!99636 tp!88358))

(declare-fun array_inv!28097 (array!76295) Bool)

(assert (=> start!99636 (and (array_inv!28097 _values!996) e!671376)))

(declare-fun b!1180902 () Bool)

(assert (=> b!1180902 (= e!671369 e!671368)))

(declare-fun res!784691 () Bool)

(assert (=> b!1180902 (=> (not res!784691) (not e!671368))))

(assert (=> b!1180902 (= res!784691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534011 mask!1564))))

(assert (=> b!1180902 (= lt!534011 (array!76294 (store (arr!36796 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37332 _keys!1208)))))

(declare-fun b!1180903 () Bool)

(declare-fun e!671370 () Bool)

(assert (=> b!1180903 (= e!671370 (= lt!534009 lt!534018))))

(declare-fun mapIsEmpty!46445 () Bool)

(assert (=> mapIsEmpty!46445 mapRes!46445))

(declare-fun b!1180904 () Bool)

(declare-fun Unit!39047 () Unit!39044)

(assert (=> b!1180904 (= e!671371 Unit!39047)))

(declare-fun lt!534015 () Unit!39044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39044)

(assert (=> b!1180904 (= lt!534015 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1180904 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534005 () Unit!39044)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76293 (_ BitVec 32) (_ BitVec 32)) Unit!39044)

(assert (=> b!1180904 (= lt!534005 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1180904 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25858)))

(declare-fun lt!534006 () Unit!39044)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76293 (_ BitVec 64) (_ BitVec 32) List!25861) Unit!39044)

(assert (=> b!1180904 (= lt!534006 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25858))))

(assert (=> b!1180904 false))

(declare-fun b!1180905 () Bool)

(declare-fun res!784679 () Bool)

(assert (=> b!1180905 (=> (not res!784679) (not e!671370))))

(declare-fun lt!534017 () tuple2!19120)

(declare-fun +!3869 (ListLongMap!17089 tuple2!19120) ListLongMap!17089)

(assert (=> b!1180905 (= res!784679 (= lt!534012 (+!3869 lt!534013 lt!534017)))))

(declare-fun b!1180906 () Bool)

(assert (=> b!1180906 (= e!671377 tp_is_empty!29745)))

(declare-fun b!1180907 () Bool)

(declare-fun res!784682 () Bool)

(assert (=> b!1180907 (=> (not res!784682) (not e!671369))))

(assert (=> b!1180907 (= res!784682 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25858))))

(declare-fun b!1180908 () Bool)

(declare-fun res!784688 () Bool)

(assert (=> b!1180908 (=> (not res!784688) (not e!671369))))

(assert (=> b!1180908 (= res!784688 (and (= (size!37333 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37332 _keys!1208) (size!37333 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180909 () Bool)

(assert (=> b!1180909 (= e!671378 true)))

(assert (=> b!1180909 e!671370))

(declare-fun res!784678 () Bool)

(assert (=> b!1180909 (=> (not res!784678) (not e!671370))))

(assert (=> b!1180909 (= res!784678 (not (= (select (arr!36796 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!534016 () Unit!39044)

(assert (=> b!1180909 (= lt!534016 e!671371)))

(declare-fun c!116946 () Bool)

(assert (=> b!1180909 (= c!116946 (= (select (arr!36796 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180909 e!671375))

(declare-fun res!784690 () Bool)

(assert (=> b!1180909 (=> (not res!784690) (not e!671375))))

(assert (=> b!1180909 (= res!784690 (= lt!534008 (+!3869 lt!534009 lt!534017)))))

(declare-fun get!18817 (ValueCell!14163 V!44787) V!44787)

(assert (=> b!1180909 (= lt!534017 (tuple2!19121 (select (arr!36796 _keys!1208) from!1455) (get!18817 (select (arr!36797 _values!996) from!1455) lt!534004)))))

(declare-fun b!1180910 () Bool)

(assert (=> b!1180910 (= e!671373 tp_is_empty!29745)))

(assert (= (and start!99636 res!784677) b!1180899))

(assert (= (and b!1180899 res!784693) b!1180908))

(assert (= (and b!1180908 res!784688) b!1180896))

(assert (= (and b!1180896 res!784692) b!1180907))

(assert (= (and b!1180907 res!784682) b!1180894))

(assert (= (and b!1180894 res!784689) b!1180892))

(assert (= (and b!1180892 res!784685) b!1180889))

(assert (= (and b!1180889 res!784686) b!1180902))

(assert (= (and b!1180902 res!784691) b!1180898))

(assert (= (and b!1180898 res!784683) b!1180901))

(assert (= (and b!1180901 (not res!784681)) b!1180893))

(assert (= (and b!1180893 (not res!784680)) b!1180895))

(assert (= (and b!1180895 (not res!784684)) b!1180909))

(assert (= (and b!1180909 res!784690) b!1180900))

(assert (= (and b!1180900 (not res!784687)) b!1180890))

(assert (= (and b!1180909 c!116946) b!1180904))

(assert (= (and b!1180909 (not c!116946)) b!1180897))

(assert (= (and b!1180909 res!784678) b!1180905))

(assert (= (and b!1180905 res!784679) b!1180903))

(assert (= (and b!1180891 condMapEmpty!46445) mapIsEmpty!46445))

(assert (= (and b!1180891 (not condMapEmpty!46445)) mapNonEmpty!46445))

(get-info :version)

(assert (= (and mapNonEmpty!46445 ((_ is ValueCellFull!14163) mapValue!46445)) b!1180910))

(assert (= (and b!1180891 ((_ is ValueCellFull!14163) mapDefault!46445)) b!1180906))

(assert (= start!99636 b!1180891))

(declare-fun b_lambda!20359 () Bool)

(assert (=> (not b_lambda!20359) (not b!1180893)))

(declare-fun t!38066 () Bool)

(declare-fun tb!10027 () Bool)

(assert (=> (and start!99636 (= defaultEntry!1004 defaultEntry!1004) t!38066) tb!10027))

(declare-fun result!20621 () Bool)

(assert (=> tb!10027 (= result!20621 tp_is_empty!29745)))

(assert (=> b!1180893 t!38066))

(declare-fun b_and!41299 () Bool)

(assert (= b_and!41297 (and (=> t!38066 result!20621) b_and!41299)))

(declare-fun m!1088829 () Bool)

(assert (=> b!1180898 m!1088829))

(declare-fun m!1088831 () Bool)

(assert (=> b!1180899 m!1088831))

(declare-fun m!1088833 () Bool)

(assert (=> b!1180901 m!1088833))

(declare-fun m!1088835 () Bool)

(assert (=> b!1180901 m!1088835))

(declare-fun m!1088837 () Bool)

(assert (=> b!1180893 m!1088837))

(declare-fun m!1088839 () Bool)

(assert (=> b!1180893 m!1088839))

(declare-fun m!1088841 () Bool)

(assert (=> b!1180893 m!1088841))

(declare-fun m!1088843 () Bool)

(assert (=> b!1180893 m!1088843))

(declare-fun m!1088845 () Bool)

(assert (=> b!1180896 m!1088845))

(declare-fun m!1088847 () Bool)

(assert (=> b!1180909 m!1088847))

(declare-fun m!1088849 () Bool)

(assert (=> b!1180909 m!1088849))

(declare-fun m!1088851 () Bool)

(assert (=> b!1180909 m!1088851))

(assert (=> b!1180909 m!1088851))

(declare-fun m!1088853 () Bool)

(assert (=> b!1180909 m!1088853))

(declare-fun m!1088855 () Bool)

(assert (=> b!1180892 m!1088855))

(declare-fun m!1088857 () Bool)

(assert (=> b!1180905 m!1088857))

(declare-fun m!1088859 () Bool)

(assert (=> b!1180902 m!1088859))

(declare-fun m!1088861 () Bool)

(assert (=> b!1180902 m!1088861))

(declare-fun m!1088863 () Bool)

(assert (=> start!99636 m!1088863))

(declare-fun m!1088865 () Bool)

(assert (=> start!99636 m!1088865))

(declare-fun m!1088867 () Bool)

(assert (=> b!1180907 m!1088867))

(declare-fun m!1088869 () Bool)

(assert (=> b!1180904 m!1088869))

(declare-fun m!1088871 () Bool)

(assert (=> b!1180904 m!1088871))

(declare-fun m!1088873 () Bool)

(assert (=> b!1180904 m!1088873))

(declare-fun m!1088875 () Bool)

(assert (=> b!1180904 m!1088875))

(declare-fun m!1088877 () Bool)

(assert (=> b!1180904 m!1088877))

(declare-fun m!1088879 () Bool)

(assert (=> b!1180895 m!1088879))

(declare-fun m!1088881 () Bool)

(assert (=> b!1180895 m!1088881))

(declare-fun m!1088883 () Bool)

(assert (=> b!1180895 m!1088883))

(declare-fun m!1088885 () Bool)

(assert (=> b!1180895 m!1088885))

(assert (=> b!1180895 m!1088847))

(declare-fun m!1088887 () Bool)

(assert (=> b!1180895 m!1088887))

(assert (=> b!1180895 m!1088847))

(declare-fun m!1088889 () Bool)

(assert (=> b!1180890 m!1088889))

(assert (=> b!1180900 m!1088847))

(declare-fun m!1088891 () Bool)

(assert (=> mapNonEmpty!46445 m!1088891))

(declare-fun m!1088893 () Bool)

(assert (=> b!1180889 m!1088893))

(check-sat (not b!1180896) (not b!1180901) (not b!1180902) (not b!1180899) (not b_lambda!20359) (not mapNonEmpty!46445) (not b!1180892) tp_is_empty!29745 (not b!1180907) (not b!1180909) (not b!1180893) (not start!99636) (not b_next!25215) (not b!1180898) (not b!1180905) b_and!41299 (not b!1180890) (not b!1180895) (not b!1180904))
(check-sat b_and!41299 (not b_next!25215))
