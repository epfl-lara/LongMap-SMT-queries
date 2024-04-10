; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99576 () Bool)

(assert start!99576)

(declare-fun b_free!25155 () Bool)

(declare-fun b_next!25155 () Bool)

(assert (=> start!99576 (= b_free!25155 (not b_next!25155))))

(declare-fun tp!88179 () Bool)

(declare-fun b_and!41177 () Bool)

(assert (=> start!99576 (= tp!88179 b_and!41177)))

(declare-fun b!1178880 () Bool)

(declare-fun res!783192 () Bool)

(declare-fun e!670209 () Bool)

(assert (=> b!1178880 (=> (not res!783192) (not e!670209))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178880 (= res!783192 (validKeyInArray!0 k0!934))))

(declare-fun b!1178881 () Bool)

(declare-fun e!670207 () Bool)

(declare-fun tp_is_empty!29685 () Bool)

(assert (=> b!1178881 (= e!670207 tp_is_empty!29685)))

(declare-fun b!1178882 () Bool)

(declare-fun e!670210 () Bool)

(declare-fun e!670203 () Bool)

(assert (=> b!1178882 (= e!670210 e!670203)))

(declare-fun res!783187 () Bool)

(assert (=> b!1178882 (=> res!783187 e!670203)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1178882 (= res!783187 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44707 0))(
  ( (V!44708 (val!14899 Int)) )
))
(declare-fun zeroValue!944 () V!44707)

(declare-datatypes ((tuple2!19068 0))(
  ( (tuple2!19069 (_1!9545 (_ BitVec 64)) (_2!9545 V!44707)) )
))
(declare-datatypes ((List!25805 0))(
  ( (Nil!25802) (Cons!25801 (h!27010 tuple2!19068) (t!37952 List!25805)) )
))
(declare-datatypes ((ListLongMap!17037 0))(
  ( (ListLongMap!17038 (toList!8534 List!25805)) )
))
(declare-fun lt!532661 () ListLongMap!17037)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!76173 0))(
  ( (array!76174 (arr!36736 (Array (_ BitVec 32) (_ BitVec 64))) (size!37272 (_ BitVec 32))) )
))
(declare-fun lt!532658 () array!76173)

(declare-fun minValue!944 () V!44707)

(declare-datatypes ((ValueCell!14133 0))(
  ( (ValueCellFull!14133 (v!17537 V!44707)) (EmptyCell!14133) )
))
(declare-datatypes ((array!76175 0))(
  ( (array!76176 (arr!36737 (Array (_ BitVec 32) ValueCell!14133)) (size!37273 (_ BitVec 32))) )
))
(declare-fun lt!532668 () array!76175)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4989 (array!76173 array!76175 (_ BitVec 32) (_ BitVec 32) V!44707 V!44707 (_ BitVec 32) Int) ListLongMap!17037)

(assert (=> b!1178882 (= lt!532661 (getCurrentListMapNoExtraKeys!4989 lt!532658 lt!532668 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532665 () V!44707)

(declare-fun _values!996 () array!76175)

(assert (=> b!1178882 (= lt!532668 (array!76176 (store (arr!36737 _values!996) i!673 (ValueCellFull!14133 lt!532665)) (size!37273 _values!996)))))

(declare-fun dynLambda!2950 (Int (_ BitVec 64)) V!44707)

(assert (=> b!1178882 (= lt!532665 (dynLambda!2950 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76173)

(declare-fun lt!532655 () ListLongMap!17037)

(assert (=> b!1178882 (= lt!532655 (getCurrentListMapNoExtraKeys!4989 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!670208 () Bool)

(declare-fun b!1178883 () Bool)

(declare-fun arrayContainsKey!0 (array!76173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178883 (= e!670208 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!783179 () Bool)

(assert (=> start!99576 (=> (not res!783179) (not e!670209))))

(assert (=> start!99576 (= res!783179 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37272 _keys!1208))))))

(assert (=> start!99576 e!670209))

(assert (=> start!99576 tp_is_empty!29685))

(declare-fun array_inv!28048 (array!76173) Bool)

(assert (=> start!99576 (array_inv!28048 _keys!1208)))

(assert (=> start!99576 true))

(assert (=> start!99576 tp!88179))

(declare-fun e!670199 () Bool)

(declare-fun array_inv!28049 (array!76175) Bool)

(assert (=> start!99576 (and (array_inv!28049 _values!996) e!670199)))

(declare-fun b!1178884 () Bool)

(declare-fun e!670201 () Bool)

(assert (=> b!1178884 (= e!670209 e!670201)))

(declare-fun res!783182 () Bool)

(assert (=> b!1178884 (=> (not res!783182) (not e!670201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76173 (_ BitVec 32)) Bool)

(assert (=> b!1178884 (= res!783182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532658 mask!1564))))

(assert (=> b!1178884 (= lt!532658 (array!76174 (store (arr!36736 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37272 _keys!1208)))))

(declare-fun b!1178885 () Bool)

(declare-fun res!783189 () Bool)

(assert (=> b!1178885 (=> (not res!783189) (not e!670209))))

(assert (=> b!1178885 (= res!783189 (= (select (arr!36736 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46355 () Bool)

(declare-fun mapRes!46355 () Bool)

(declare-fun tp!88178 () Bool)

(declare-fun e!670200 () Bool)

(assert (=> mapNonEmpty!46355 (= mapRes!46355 (and tp!88178 e!670200))))

(declare-fun mapValue!46355 () ValueCell!14133)

(declare-fun mapRest!46355 () (Array (_ BitVec 32) ValueCell!14133))

(declare-fun mapKey!46355 () (_ BitVec 32))

(assert (=> mapNonEmpty!46355 (= (arr!36737 _values!996) (store mapRest!46355 mapKey!46355 mapValue!46355))))

(declare-fun lt!532663 () tuple2!19068)

(declare-fun b!1178886 () Bool)

(declare-fun e!670198 () Bool)

(declare-fun lt!532662 () ListLongMap!17037)

(declare-fun +!3848 (ListLongMap!17037 tuple2!19068) ListLongMap!17037)

(assert (=> b!1178886 (= e!670198 (= lt!532655 (+!3848 lt!532662 lt!532663)))))

(declare-fun b!1178887 () Bool)

(declare-fun e!670202 () Bool)

(assert (=> b!1178887 (= e!670203 e!670202)))

(declare-fun res!783190 () Bool)

(assert (=> b!1178887 (=> res!783190 e!670202)))

(assert (=> b!1178887 (= res!783190 (not (validKeyInArray!0 (select (arr!36736 _keys!1208) from!1455))))))

(declare-fun lt!532657 () ListLongMap!17037)

(declare-fun lt!532664 () ListLongMap!17037)

(assert (=> b!1178887 (= lt!532657 lt!532664)))

(declare-fun -!1579 (ListLongMap!17037 (_ BitVec 64)) ListLongMap!17037)

(assert (=> b!1178887 (= lt!532664 (-!1579 lt!532662 k0!934))))

(assert (=> b!1178887 (= lt!532657 (getCurrentListMapNoExtraKeys!4989 lt!532658 lt!532668 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178887 (= lt!532662 (getCurrentListMapNoExtraKeys!4989 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38946 0))(
  ( (Unit!38947) )
))
(declare-fun lt!532659 () Unit!38946)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!806 (array!76173 array!76175 (_ BitVec 32) (_ BitVec 32) V!44707 V!44707 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38946)

(assert (=> b!1178887 (= lt!532659 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!806 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178888 () Bool)

(declare-fun e!670206 () Bool)

(assert (=> b!1178888 (= e!670206 e!670208)))

(declare-fun res!783188 () Bool)

(assert (=> b!1178888 (=> res!783188 e!670208)))

(assert (=> b!1178888 (= res!783188 (not (= (select (arr!36736 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178889 () Bool)

(declare-fun res!783183 () Bool)

(assert (=> b!1178889 (=> (not res!783183) (not e!670201))))

(declare-datatypes ((List!25806 0))(
  ( (Nil!25803) (Cons!25802 (h!27011 (_ BitVec 64)) (t!37953 List!25806)) )
))
(declare-fun arrayNoDuplicates!0 (array!76173 (_ BitVec 32) List!25806) Bool)

(assert (=> b!1178889 (= res!783183 (arrayNoDuplicates!0 lt!532658 #b00000000000000000000000000000000 Nil!25803))))

(declare-fun b!1178890 () Bool)

(declare-fun res!783181 () Bool)

(assert (=> b!1178890 (=> (not res!783181) (not e!670209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178890 (= res!783181 (validMask!0 mask!1564))))

(declare-fun b!1178891 () Bool)

(assert (=> b!1178891 (= e!670199 (and e!670207 mapRes!46355))))

(declare-fun condMapEmpty!46355 () Bool)

(declare-fun mapDefault!46355 () ValueCell!14133)

(assert (=> b!1178891 (= condMapEmpty!46355 (= (arr!36737 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14133)) mapDefault!46355)))))

(declare-fun b!1178892 () Bool)

(declare-fun res!783193 () Bool)

(assert (=> b!1178892 (=> (not res!783193) (not e!670209))))

(assert (=> b!1178892 (= res!783193 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37272 _keys!1208))))))

(declare-fun b!1178893 () Bool)

(declare-fun e!670205 () Unit!38946)

(declare-fun Unit!38948 () Unit!38946)

(assert (=> b!1178893 (= e!670205 Unit!38948)))

(declare-fun b!1178894 () Bool)

(assert (=> b!1178894 (= e!670200 tp_is_empty!29685)))

(declare-fun b!1178895 () Bool)

(declare-fun res!783191 () Bool)

(assert (=> b!1178895 (=> (not res!783191) (not e!670209))))

(assert (=> b!1178895 (= res!783191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178896 () Bool)

(declare-fun res!783180 () Bool)

(assert (=> b!1178896 (=> (not res!783180) (not e!670209))))

(assert (=> b!1178896 (= res!783180 (and (= (size!37273 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37272 _keys!1208) (size!37273 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178897 () Bool)

(declare-fun Unit!38949 () Unit!38946)

(assert (=> b!1178897 (= e!670205 Unit!38949)))

(declare-fun lt!532666 () Unit!38946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76173 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38946)

(assert (=> b!1178897 (= lt!532666 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178897 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532660 () Unit!38946)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76173 (_ BitVec 32) (_ BitVec 32)) Unit!38946)

(assert (=> b!1178897 (= lt!532660 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178897 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25803)))

(declare-fun lt!532654 () Unit!38946)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76173 (_ BitVec 64) (_ BitVec 32) List!25806) Unit!38946)

(assert (=> b!1178897 (= lt!532654 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25803))))

(assert (=> b!1178897 false))

(declare-fun b!1178898 () Bool)

(assert (=> b!1178898 (= e!670201 (not e!670210))))

(declare-fun res!783184 () Bool)

(assert (=> b!1178898 (=> res!783184 e!670210)))

(assert (=> b!1178898 (= res!783184 (bvsgt from!1455 i!673))))

(assert (=> b!1178898 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532656 () Unit!38946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76173 (_ BitVec 64) (_ BitVec 32)) Unit!38946)

(assert (=> b!1178898 (= lt!532656 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46355 () Bool)

(assert (=> mapIsEmpty!46355 mapRes!46355))

(declare-fun b!1178899 () Bool)

(declare-fun res!783185 () Bool)

(assert (=> b!1178899 (=> (not res!783185) (not e!670209))))

(assert (=> b!1178899 (= res!783185 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25803))))

(declare-fun b!1178900 () Bool)

(assert (=> b!1178900 (= e!670202 true)))

(assert (=> b!1178900 e!670198))

(declare-fun res!783186 () Bool)

(assert (=> b!1178900 (=> (not res!783186) (not e!670198))))

(assert (=> b!1178900 (= res!783186 (not (= (select (arr!36736 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532667 () Unit!38946)

(assert (=> b!1178900 (= lt!532667 e!670205)))

(declare-fun c!116856 () Bool)

(assert (=> b!1178900 (= c!116856 (= (select (arr!36736 _keys!1208) from!1455) k0!934))))

(assert (=> b!1178900 e!670206))

(declare-fun res!783178 () Bool)

(assert (=> b!1178900 (=> (not res!783178) (not e!670206))))

(assert (=> b!1178900 (= res!783178 (= lt!532661 (+!3848 lt!532664 lt!532663)))))

(declare-fun get!18778 (ValueCell!14133 V!44707) V!44707)

(assert (=> b!1178900 (= lt!532663 (tuple2!19069 (select (arr!36736 _keys!1208) from!1455) (get!18778 (select (arr!36737 _values!996) from!1455) lt!532665)))))

(assert (= (and start!99576 res!783179) b!1178890))

(assert (= (and b!1178890 res!783181) b!1178896))

(assert (= (and b!1178896 res!783180) b!1178895))

(assert (= (and b!1178895 res!783191) b!1178899))

(assert (= (and b!1178899 res!783185) b!1178892))

(assert (= (and b!1178892 res!783193) b!1178880))

(assert (= (and b!1178880 res!783192) b!1178885))

(assert (= (and b!1178885 res!783189) b!1178884))

(assert (= (and b!1178884 res!783182) b!1178889))

(assert (= (and b!1178889 res!783183) b!1178898))

(assert (= (and b!1178898 (not res!783184)) b!1178882))

(assert (= (and b!1178882 (not res!783187)) b!1178887))

(assert (= (and b!1178887 (not res!783190)) b!1178900))

(assert (= (and b!1178900 res!783178) b!1178888))

(assert (= (and b!1178888 (not res!783188)) b!1178883))

(assert (= (and b!1178900 c!116856) b!1178897))

(assert (= (and b!1178900 (not c!116856)) b!1178893))

(assert (= (and b!1178900 res!783186) b!1178886))

(assert (= (and b!1178891 condMapEmpty!46355) mapIsEmpty!46355))

(assert (= (and b!1178891 (not condMapEmpty!46355)) mapNonEmpty!46355))

(get-info :version)

(assert (= (and mapNonEmpty!46355 ((_ is ValueCellFull!14133) mapValue!46355)) b!1178894))

(assert (= (and b!1178891 ((_ is ValueCellFull!14133) mapDefault!46355)) b!1178881))

(assert (= start!99576 b!1178891))

(declare-fun b_lambda!20299 () Bool)

(assert (=> (not b_lambda!20299) (not b!1178882)))

(declare-fun t!37951 () Bool)

(declare-fun tb!9967 () Bool)

(assert (=> (and start!99576 (= defaultEntry!1004 defaultEntry!1004) t!37951) tb!9967))

(declare-fun result!20501 () Bool)

(assert (=> tb!9967 (= result!20501 tp_is_empty!29685)))

(assert (=> b!1178882 t!37951))

(declare-fun b_and!41179 () Bool)

(assert (= b_and!41177 (and (=> t!37951 result!20501) b_and!41179)))

(declare-fun m!1086849 () Bool)

(assert (=> b!1178897 m!1086849))

(declare-fun m!1086851 () Bool)

(assert (=> b!1178897 m!1086851))

(declare-fun m!1086853 () Bool)

(assert (=> b!1178897 m!1086853))

(declare-fun m!1086855 () Bool)

(assert (=> b!1178897 m!1086855))

(declare-fun m!1086857 () Bool)

(assert (=> b!1178897 m!1086857))

(declare-fun m!1086859 () Bool)

(assert (=> b!1178885 m!1086859))

(declare-fun m!1086861 () Bool)

(assert (=> b!1178898 m!1086861))

(declare-fun m!1086863 () Bool)

(assert (=> b!1178898 m!1086863))

(declare-fun m!1086865 () Bool)

(assert (=> b!1178880 m!1086865))

(declare-fun m!1086867 () Bool)

(assert (=> mapNonEmpty!46355 m!1086867))

(declare-fun m!1086869 () Bool)

(assert (=> b!1178887 m!1086869))

(declare-fun m!1086871 () Bool)

(assert (=> b!1178887 m!1086871))

(declare-fun m!1086873 () Bool)

(assert (=> b!1178887 m!1086873))

(declare-fun m!1086875 () Bool)

(assert (=> b!1178887 m!1086875))

(declare-fun m!1086877 () Bool)

(assert (=> b!1178887 m!1086877))

(declare-fun m!1086879 () Bool)

(assert (=> b!1178887 m!1086879))

(assert (=> b!1178887 m!1086877))

(declare-fun m!1086881 () Bool)

(assert (=> b!1178883 m!1086881))

(declare-fun m!1086883 () Bool)

(assert (=> b!1178890 m!1086883))

(assert (=> b!1178900 m!1086877))

(declare-fun m!1086885 () Bool)

(assert (=> b!1178900 m!1086885))

(declare-fun m!1086887 () Bool)

(assert (=> b!1178900 m!1086887))

(assert (=> b!1178900 m!1086887))

(declare-fun m!1086889 () Bool)

(assert (=> b!1178900 m!1086889))

(declare-fun m!1086891 () Bool)

(assert (=> b!1178889 m!1086891))

(declare-fun m!1086893 () Bool)

(assert (=> b!1178884 m!1086893))

(declare-fun m!1086895 () Bool)

(assert (=> b!1178884 m!1086895))

(declare-fun m!1086897 () Bool)

(assert (=> start!99576 m!1086897))

(declare-fun m!1086899 () Bool)

(assert (=> start!99576 m!1086899))

(assert (=> b!1178888 m!1086877))

(declare-fun m!1086901 () Bool)

(assert (=> b!1178886 m!1086901))

(declare-fun m!1086903 () Bool)

(assert (=> b!1178899 m!1086903))

(declare-fun m!1086905 () Bool)

(assert (=> b!1178895 m!1086905))

(declare-fun m!1086907 () Bool)

(assert (=> b!1178882 m!1086907))

(declare-fun m!1086909 () Bool)

(assert (=> b!1178882 m!1086909))

(declare-fun m!1086911 () Bool)

(assert (=> b!1178882 m!1086911))

(declare-fun m!1086913 () Bool)

(assert (=> b!1178882 m!1086913))

(check-sat (not b!1178882) (not b!1178895) (not mapNonEmpty!46355) (not b!1178884) (not b!1178900) tp_is_empty!29685 (not b_next!25155) (not b!1178880) (not b_lambda!20299) (not b!1178883) (not b!1178897) (not b!1178887) (not b!1178899) (not b!1178889) (not b!1178890) b_and!41179 (not start!99576) (not b!1178898) (not b!1178886))
(check-sat b_and!41179 (not b_next!25155))
