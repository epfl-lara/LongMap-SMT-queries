; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99898 () Bool)

(assert start!99898)

(declare-fun b_free!25483 () Bool)

(declare-fun b_next!25483 () Bool)

(assert (=> start!99898 (= b_free!25483 (not b_next!25483))))

(declare-fun tp!89163 () Bool)

(declare-fun b_and!41811 () Bool)

(assert (=> start!99898 (= tp!89163 b_and!41811)))

(declare-fun b!1188900 () Bool)

(declare-fun e!675957 () Bool)

(declare-fun tp_is_empty!30013 () Bool)

(assert (=> b!1188900 (= e!675957 tp_is_empty!30013)))

(declare-fun res!790571 () Bool)

(declare-fun e!675961 () Bool)

(assert (=> start!99898 (=> (not res!790571) (not e!675961))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76756 0))(
  ( (array!76757 (arr!37028 (Array (_ BitVec 32) (_ BitVec 64))) (size!37566 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76756)

(assert (=> start!99898 (= res!790571 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37566 _keys!1208))))))

(assert (=> start!99898 e!675961))

(assert (=> start!99898 tp_is_empty!30013))

(declare-fun array_inv!28362 (array!76756) Bool)

(assert (=> start!99898 (array_inv!28362 _keys!1208)))

(assert (=> start!99898 true))

(assert (=> start!99898 tp!89163))

(declare-datatypes ((V!45145 0))(
  ( (V!45146 (val!15063 Int)) )
))
(declare-datatypes ((ValueCell!14297 0))(
  ( (ValueCellFull!14297 (v!17700 V!45145)) (EmptyCell!14297) )
))
(declare-datatypes ((array!76758 0))(
  ( (array!76759 (arr!37029 (Array (_ BitVec 32) ValueCell!14297)) (size!37567 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76758)

(declare-fun e!675960 () Bool)

(declare-fun array_inv!28363 (array!76758) Bool)

(assert (=> start!99898 (and (array_inv!28363 _values!996) e!675960)))

(declare-fun b!1188901 () Bool)

(declare-fun res!790567 () Bool)

(assert (=> b!1188901 (=> (not res!790567) (not e!675961))))

(declare-datatypes ((List!26174 0))(
  ( (Nil!26171) (Cons!26170 (h!27379 (_ BitVec 64)) (t!38640 List!26174)) )
))
(declare-fun arrayNoDuplicates!0 (array!76756 (_ BitVec 32) List!26174) Bool)

(assert (=> b!1188901 (= res!790567 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26171))))

(declare-fun b!1188902 () Bool)

(declare-fun e!675962 () Bool)

(declare-fun e!675963 () Bool)

(assert (=> b!1188902 (= e!675962 e!675963)))

(declare-fun res!790563 () Bool)

(assert (=> b!1188902 (=> res!790563 e!675963)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188902 (= res!790563 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45145)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540719 () array!76756)

(declare-fun lt!540718 () array!76758)

(declare-fun minValue!944 () V!45145)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19462 0))(
  ( (tuple2!19463 (_1!9742 (_ BitVec 64)) (_2!9742 V!45145)) )
))
(declare-datatypes ((List!26175 0))(
  ( (Nil!26172) (Cons!26171 (h!27380 tuple2!19462) (t!38641 List!26175)) )
))
(declare-datatypes ((ListLongMap!17431 0))(
  ( (ListLongMap!17432 (toList!8731 List!26175)) )
))
(declare-fun lt!540717 () ListLongMap!17431)

(declare-fun getCurrentListMapNoExtraKeys!5181 (array!76756 array!76758 (_ BitVec 32) (_ BitVec 32) V!45145 V!45145 (_ BitVec 32) Int) ListLongMap!17431)

(assert (=> b!1188902 (= lt!540717 (getCurrentListMapNoExtraKeys!5181 lt!540719 lt!540718 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3076 (Int (_ BitVec 64)) V!45145)

(assert (=> b!1188902 (= lt!540718 (array!76759 (store (arr!37029 _values!996) i!673 (ValueCellFull!14297 (dynLambda!3076 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37567 _values!996)))))

(declare-fun lt!540716 () ListLongMap!17431)

(assert (=> b!1188902 (= lt!540716 (getCurrentListMapNoExtraKeys!5181 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188903 () Bool)

(declare-fun e!675964 () Bool)

(assert (=> b!1188903 (= e!675961 e!675964)))

(declare-fun res!790572 () Bool)

(assert (=> b!1188903 (=> (not res!790572) (not e!675964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76756 (_ BitVec 32)) Bool)

(assert (=> b!1188903 (= res!790572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540719 mask!1564))))

(assert (=> b!1188903 (= lt!540719 (array!76757 (store (arr!37028 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37566 _keys!1208)))))

(declare-fun b!1188904 () Bool)

(declare-fun res!790565 () Bool)

(assert (=> b!1188904 (=> (not res!790565) (not e!675961))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188904 (= res!790565 (validKeyInArray!0 k0!934))))

(declare-fun b!1188905 () Bool)

(declare-fun res!790566 () Bool)

(assert (=> b!1188905 (=> (not res!790566) (not e!675964))))

(assert (=> b!1188905 (= res!790566 (arrayNoDuplicates!0 lt!540719 #b00000000000000000000000000000000 Nil!26171))))

(declare-fun mapIsEmpty!46847 () Bool)

(declare-fun mapRes!46847 () Bool)

(assert (=> mapIsEmpty!46847 mapRes!46847))

(declare-fun b!1188906 () Bool)

(assert (=> b!1188906 (= e!675964 (not e!675962))))

(declare-fun res!790568 () Bool)

(assert (=> b!1188906 (=> res!790568 e!675962)))

(assert (=> b!1188906 (= res!790568 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188906 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39319 0))(
  ( (Unit!39320) )
))
(declare-fun lt!540715 () Unit!39319)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76756 (_ BitVec 64) (_ BitVec 32)) Unit!39319)

(assert (=> b!1188906 (= lt!540715 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188907 () Bool)

(declare-fun res!790573 () Bool)

(assert (=> b!1188907 (=> (not res!790573) (not e!675961))))

(assert (=> b!1188907 (= res!790573 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37566 _keys!1208))))))

(declare-fun b!1188908 () Bool)

(declare-fun res!790562 () Bool)

(assert (=> b!1188908 (=> (not res!790562) (not e!675961))))

(assert (=> b!1188908 (= res!790562 (and (= (size!37567 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37566 _keys!1208) (size!37567 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188909 () Bool)

(declare-fun e!675959 () Bool)

(assert (=> b!1188909 (= e!675960 (and e!675959 mapRes!46847))))

(declare-fun condMapEmpty!46847 () Bool)

(declare-fun mapDefault!46847 () ValueCell!14297)

(assert (=> b!1188909 (= condMapEmpty!46847 (= (arr!37029 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14297)) mapDefault!46847)))))

(declare-fun b!1188910 () Bool)

(declare-fun res!790569 () Bool)

(assert (=> b!1188910 (=> (not res!790569) (not e!675961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188910 (= res!790569 (validMask!0 mask!1564))))

(declare-fun b!1188911 () Bool)

(declare-fun res!790564 () Bool)

(assert (=> b!1188911 (=> (not res!790564) (not e!675961))))

(assert (=> b!1188911 (= res!790564 (= (select (arr!37028 _keys!1208) i!673) k0!934))))

(declare-fun b!1188912 () Bool)

(declare-fun res!790570 () Bool)

(assert (=> b!1188912 (=> (not res!790570) (not e!675961))))

(assert (=> b!1188912 (= res!790570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188913 () Bool)

(assert (=> b!1188913 (= e!675959 tp_is_empty!30013)))

(declare-fun b!1188914 () Bool)

(assert (=> b!1188914 (= e!675963 true)))

(declare-fun -!1678 (ListLongMap!17431 (_ BitVec 64)) ListLongMap!17431)

(assert (=> b!1188914 (= (getCurrentListMapNoExtraKeys!5181 lt!540719 lt!540718 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1678 (getCurrentListMapNoExtraKeys!5181 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540720 () Unit!39319)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!928 (array!76756 array!76758 (_ BitVec 32) (_ BitVec 32) V!45145 V!45145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39319)

(assert (=> b!1188914 (= lt!540720 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!928 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46847 () Bool)

(declare-fun tp!89162 () Bool)

(assert (=> mapNonEmpty!46847 (= mapRes!46847 (and tp!89162 e!675957))))

(declare-fun mapValue!46847 () ValueCell!14297)

(declare-fun mapRest!46847 () (Array (_ BitVec 32) ValueCell!14297))

(declare-fun mapKey!46847 () (_ BitVec 32))

(assert (=> mapNonEmpty!46847 (= (arr!37029 _values!996) (store mapRest!46847 mapKey!46847 mapValue!46847))))

(assert (= (and start!99898 res!790571) b!1188910))

(assert (= (and b!1188910 res!790569) b!1188908))

(assert (= (and b!1188908 res!790562) b!1188912))

(assert (= (and b!1188912 res!790570) b!1188901))

(assert (= (and b!1188901 res!790567) b!1188907))

(assert (= (and b!1188907 res!790573) b!1188904))

(assert (= (and b!1188904 res!790565) b!1188911))

(assert (= (and b!1188911 res!790564) b!1188903))

(assert (= (and b!1188903 res!790572) b!1188905))

(assert (= (and b!1188905 res!790566) b!1188906))

(assert (= (and b!1188906 (not res!790568)) b!1188902))

(assert (= (and b!1188902 (not res!790563)) b!1188914))

(assert (= (and b!1188909 condMapEmpty!46847) mapIsEmpty!46847))

(assert (= (and b!1188909 (not condMapEmpty!46847)) mapNonEmpty!46847))

(get-info :version)

(assert (= (and mapNonEmpty!46847 ((_ is ValueCellFull!14297) mapValue!46847)) b!1188900))

(assert (= (and b!1188909 ((_ is ValueCellFull!14297) mapDefault!46847)) b!1188913))

(assert (= start!99898 b!1188909))

(declare-fun b_lambda!20609 () Bool)

(assert (=> (not b_lambda!20609) (not b!1188902)))

(declare-fun t!38639 () Bool)

(declare-fun tb!10287 () Bool)

(assert (=> (and start!99898 (= defaultEntry!1004 defaultEntry!1004) t!38639) tb!10287))

(declare-fun result!21149 () Bool)

(assert (=> tb!10287 (= result!21149 tp_is_empty!30013)))

(assert (=> b!1188902 t!38639))

(declare-fun b_and!41813 () Bool)

(assert (= b_and!41811 (and (=> t!38639 result!21149) b_and!41813)))

(declare-fun m!1097135 () Bool)

(assert (=> b!1188910 m!1097135))

(declare-fun m!1097137 () Bool)

(assert (=> b!1188901 m!1097137))

(declare-fun m!1097139 () Bool)

(assert (=> b!1188914 m!1097139))

(declare-fun m!1097141 () Bool)

(assert (=> b!1188914 m!1097141))

(assert (=> b!1188914 m!1097141))

(declare-fun m!1097143 () Bool)

(assert (=> b!1188914 m!1097143))

(declare-fun m!1097145 () Bool)

(assert (=> b!1188914 m!1097145))

(declare-fun m!1097147 () Bool)

(assert (=> b!1188912 m!1097147))

(declare-fun m!1097149 () Bool)

(assert (=> b!1188911 m!1097149))

(declare-fun m!1097151 () Bool)

(assert (=> b!1188903 m!1097151))

(declare-fun m!1097153 () Bool)

(assert (=> b!1188903 m!1097153))

(declare-fun m!1097155 () Bool)

(assert (=> b!1188902 m!1097155))

(declare-fun m!1097157 () Bool)

(assert (=> b!1188902 m!1097157))

(declare-fun m!1097159 () Bool)

(assert (=> b!1188902 m!1097159))

(declare-fun m!1097161 () Bool)

(assert (=> b!1188902 m!1097161))

(declare-fun m!1097163 () Bool)

(assert (=> b!1188904 m!1097163))

(declare-fun m!1097165 () Bool)

(assert (=> start!99898 m!1097165))

(declare-fun m!1097167 () Bool)

(assert (=> start!99898 m!1097167))

(declare-fun m!1097169 () Bool)

(assert (=> b!1188906 m!1097169))

(declare-fun m!1097171 () Bool)

(assert (=> b!1188906 m!1097171))

(declare-fun m!1097173 () Bool)

(assert (=> mapNonEmpty!46847 m!1097173))

(declare-fun m!1097175 () Bool)

(assert (=> b!1188905 m!1097175))

(check-sat tp_is_empty!30013 (not b!1188910) (not b!1188912) (not b_lambda!20609) b_and!41813 (not mapNonEmpty!46847) (not b!1188901) (not b!1188905) (not b_next!25483) (not b!1188914) (not b!1188904) (not b!1188902) (not start!99898) (not b!1188906) (not b!1188903))
(check-sat b_and!41813 (not b_next!25483))
