; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99322 () Bool)

(assert start!99322)

(declare-fun b_free!24907 () Bool)

(declare-fun b_next!24907 () Bool)

(assert (=> start!99322 (= b_free!24907 (not b_next!24907))))

(declare-fun tp!87435 () Bool)

(declare-fun b_and!40659 () Bool)

(assert (=> start!99322 (= tp!87435 b_and!40659)))

(declare-fun b!1170779 () Bool)

(declare-fun res!777099 () Bool)

(declare-fun e!665453 () Bool)

(assert (=> b!1170779 (=> res!777099 e!665453)))

(declare-datatypes ((List!25674 0))(
  ( (Nil!25671) (Cons!25670 (h!26879 (_ BitVec 64)) (t!37564 List!25674)) )
))
(declare-fun noDuplicate!1618 (List!25674) Bool)

(assert (=> b!1170779 (= res!777099 (not (noDuplicate!1618 Nil!25671)))))

(declare-fun mapIsEmpty!45983 () Bool)

(declare-fun mapRes!45983 () Bool)

(assert (=> mapIsEmpty!45983 mapRes!45983))

(declare-datatypes ((array!75620 0))(
  ( (array!75621 (arr!36460 (Array (_ BitVec 32) (_ BitVec 64))) (size!36998 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75620)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!665452 () Bool)

(declare-fun b!1170780 () Bool)

(declare-fun arrayContainsKey!0 (array!75620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170780 (= e!665452 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170781 () Bool)

(declare-fun e!665456 () Bool)

(assert (=> b!1170781 (= e!665456 e!665453)))

(declare-fun res!777100 () Bool)

(assert (=> b!1170781 (=> res!777100 e!665453)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170781 (= res!777100 (or (bvsge (size!36998 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36998 _keys!1208)) (bvsge from!1455 (size!36998 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!75620 (_ BitVec 32) List!25674) Bool)

(assert (=> b!1170781 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25671)))

(declare-datatypes ((Unit!38441 0))(
  ( (Unit!38442) )
))
(declare-fun lt!527213 () Unit!38441)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75620 (_ BitVec 32) (_ BitVec 32)) Unit!38441)

(assert (=> b!1170781 (= lt!527213 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1170781 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527204 () Unit!38441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75620 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38441)

(assert (=> b!1170781 (= lt!527204 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45983 () Bool)

(declare-fun tp!87434 () Bool)

(declare-fun e!665450 () Bool)

(assert (=> mapNonEmpty!45983 (= mapRes!45983 (and tp!87434 e!665450))))

(declare-datatypes ((V!44377 0))(
  ( (V!44378 (val!14775 Int)) )
))
(declare-datatypes ((ValueCell!14009 0))(
  ( (ValueCellFull!14009 (v!17412 V!44377)) (EmptyCell!14009) )
))
(declare-fun mapValue!45983 () ValueCell!14009)

(declare-fun mapKey!45983 () (_ BitVec 32))

(declare-datatypes ((array!75622 0))(
  ( (array!75623 (arr!36461 (Array (_ BitVec 32) ValueCell!14009)) (size!36999 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75622)

(declare-fun mapRest!45983 () (Array (_ BitVec 32) ValueCell!14009))

(assert (=> mapNonEmpty!45983 (= (arr!36461 _values!996) (store mapRest!45983 mapKey!45983 mapValue!45983))))

(declare-fun b!1170782 () Bool)

(declare-fun res!777085 () Bool)

(declare-fun e!665448 () Bool)

(assert (=> b!1170782 (=> (not res!777085) (not e!665448))))

(declare-fun lt!527208 () array!75620)

(assert (=> b!1170782 (= res!777085 (arrayNoDuplicates!0 lt!527208 #b00000000000000000000000000000000 Nil!25671))))

(declare-fun b!1170783 () Bool)

(declare-fun res!777096 () Bool)

(declare-fun e!665458 () Bool)

(assert (=> b!1170783 (=> (not res!777096) (not e!665458))))

(assert (=> b!1170783 (= res!777096 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36998 _keys!1208))))))

(declare-fun b!1170784 () Bool)

(declare-fun res!777091 () Bool)

(assert (=> b!1170784 (=> res!777091 e!665453)))

(declare-fun contains!6821 (List!25674 (_ BitVec 64)) Bool)

(assert (=> b!1170784 (= res!777091 (contains!6821 Nil!25671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1170785 () Bool)

(declare-fun e!665451 () Bool)

(declare-fun e!665446 () Bool)

(assert (=> b!1170785 (= e!665451 (and e!665446 mapRes!45983))))

(declare-fun condMapEmpty!45983 () Bool)

(declare-fun mapDefault!45983 () ValueCell!14009)

(assert (=> b!1170785 (= condMapEmpty!45983 (= (arr!36461 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14009)) mapDefault!45983)))))

(declare-fun b!1170786 () Bool)

(declare-fun e!665455 () Bool)

(declare-fun e!665457 () Bool)

(assert (=> b!1170786 (= e!665455 e!665457)))

(declare-fun res!777093 () Bool)

(assert (=> b!1170786 (=> res!777093 e!665457)))

(assert (=> b!1170786 (= res!777093 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44377)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!527202 () array!75622)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18962 0))(
  ( (tuple2!18963 (_1!9492 (_ BitVec 64)) (_2!9492 V!44377)) )
))
(declare-datatypes ((List!25675 0))(
  ( (Nil!25672) (Cons!25671 (h!26880 tuple2!18962) (t!37565 List!25675)) )
))
(declare-datatypes ((ListLongMap!16931 0))(
  ( (ListLongMap!16932 (toList!8481 List!25675)) )
))
(declare-fun lt!527209 () ListLongMap!16931)

(declare-fun minValue!944 () V!44377)

(declare-fun getCurrentListMapNoExtraKeys!4956 (array!75620 array!75622 (_ BitVec 32) (_ BitVec 32) V!44377 V!44377 (_ BitVec 32) Int) ListLongMap!16931)

(assert (=> b!1170786 (= lt!527209 (getCurrentListMapNoExtraKeys!4956 lt!527208 lt!527202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527207 () V!44377)

(assert (=> b!1170786 (= lt!527202 (array!75623 (store (arr!36461 _values!996) i!673 (ValueCellFull!14009 lt!527207)) (size!36999 _values!996)))))

(declare-fun dynLambda!2881 (Int (_ BitVec 64)) V!44377)

(assert (=> b!1170786 (= lt!527207 (dynLambda!2881 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527210 () ListLongMap!16931)

(assert (=> b!1170786 (= lt!527210 (getCurrentListMapNoExtraKeys!4956 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170787 () Bool)

(declare-fun tp_is_empty!29437 () Bool)

(assert (=> b!1170787 (= e!665450 tp_is_empty!29437)))

(declare-fun b!1170789 () Bool)

(declare-fun res!777094 () Bool)

(assert (=> b!1170789 (=> (not res!777094) (not e!665458))))

(assert (=> b!1170789 (= res!777094 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25671))))

(declare-fun b!1170790 () Bool)

(declare-fun res!777086 () Bool)

(assert (=> b!1170790 (=> (not res!777086) (not e!665458))))

(assert (=> b!1170790 (= res!777086 (= (select (arr!36460 _keys!1208) i!673) k0!934))))

(declare-fun b!1170791 () Bool)

(declare-fun res!777090 () Bool)

(assert (=> b!1170791 (=> (not res!777090) (not e!665458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75620 (_ BitVec 32)) Bool)

(assert (=> b!1170791 (= res!777090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170792 () Bool)

(declare-fun res!777092 () Bool)

(assert (=> b!1170792 (=> (not res!777092) (not e!665458))))

(assert (=> b!1170792 (= res!777092 (and (= (size!36999 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36998 _keys!1208) (size!36999 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170793 () Bool)

(declare-fun e!665454 () Bool)

(assert (=> b!1170793 (= e!665457 e!665454)))

(declare-fun res!777095 () Bool)

(assert (=> b!1170793 (=> res!777095 e!665454)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170793 (= res!777095 (not (validKeyInArray!0 (select (arr!36460 _keys!1208) from!1455))))))

(declare-fun lt!527212 () ListLongMap!16931)

(declare-fun lt!527214 () ListLongMap!16931)

(assert (=> b!1170793 (= lt!527212 lt!527214)))

(declare-fun lt!527205 () ListLongMap!16931)

(declare-fun -!1477 (ListLongMap!16931 (_ BitVec 64)) ListLongMap!16931)

(assert (=> b!1170793 (= lt!527214 (-!1477 lt!527205 k0!934))))

(assert (=> b!1170793 (= lt!527212 (getCurrentListMapNoExtraKeys!4956 lt!527208 lt!527202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170793 (= lt!527205 (getCurrentListMapNoExtraKeys!4956 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527206 () Unit!38441)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!741 (array!75620 array!75622 (_ BitVec 32) (_ BitVec 32) V!44377 V!44377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38441)

(assert (=> b!1170793 (= lt!527206 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!741 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170794 () Bool)

(assert (=> b!1170794 (= e!665454 e!665456)))

(declare-fun res!777097 () Bool)

(assert (=> b!1170794 (=> res!777097 e!665456)))

(assert (=> b!1170794 (= res!777097 (not (= (select (arr!36460 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665449 () Bool)

(assert (=> b!1170794 e!665449))

(declare-fun res!777102 () Bool)

(assert (=> b!1170794 (=> (not res!777102) (not e!665449))))

(declare-fun +!3800 (ListLongMap!16931 tuple2!18962) ListLongMap!16931)

(declare-fun get!18602 (ValueCell!14009 V!44377) V!44377)

(assert (=> b!1170794 (= res!777102 (= lt!527209 (+!3800 lt!527214 (tuple2!18963 (select (arr!36460 _keys!1208) from!1455) (get!18602 (select (arr!36461 _values!996) from!1455) lt!527207)))))))

(declare-fun b!1170795 () Bool)

(assert (=> b!1170795 (= e!665453 true)))

(declare-fun lt!527203 () Bool)

(assert (=> b!1170795 (= lt!527203 (contains!6821 Nil!25671 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1170796 () Bool)

(assert (=> b!1170796 (= e!665458 e!665448)))

(declare-fun res!777089 () Bool)

(assert (=> b!1170796 (=> (not res!777089) (not e!665448))))

(assert (=> b!1170796 (= res!777089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527208 mask!1564))))

(assert (=> b!1170796 (= lt!527208 (array!75621 (store (arr!36460 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36998 _keys!1208)))))

(declare-fun b!1170797 () Bool)

(assert (=> b!1170797 (= e!665449 e!665452)))

(declare-fun res!777098 () Bool)

(assert (=> b!1170797 (=> res!777098 e!665452)))

(assert (=> b!1170797 (= res!777098 (not (= (select (arr!36460 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170798 () Bool)

(assert (=> b!1170798 (= e!665448 (not e!665455))))

(declare-fun res!777088 () Bool)

(assert (=> b!1170798 (=> res!777088 e!665455)))

(assert (=> b!1170798 (= res!777088 (bvsgt from!1455 i!673))))

(assert (=> b!1170798 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527211 () Unit!38441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75620 (_ BitVec 64) (_ BitVec 32)) Unit!38441)

(assert (=> b!1170798 (= lt!527211 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170799 () Bool)

(assert (=> b!1170799 (= e!665446 tp_is_empty!29437)))

(declare-fun b!1170800 () Bool)

(declare-fun res!777103 () Bool)

(assert (=> b!1170800 (=> (not res!777103) (not e!665458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170800 (= res!777103 (validMask!0 mask!1564))))

(declare-fun b!1170788 () Bool)

(declare-fun res!777101 () Bool)

(assert (=> b!1170788 (=> (not res!777101) (not e!665458))))

(assert (=> b!1170788 (= res!777101 (validKeyInArray!0 k0!934))))

(declare-fun res!777087 () Bool)

(assert (=> start!99322 (=> (not res!777087) (not e!665458))))

(assert (=> start!99322 (= res!777087 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36998 _keys!1208))))))

(assert (=> start!99322 e!665458))

(assert (=> start!99322 tp_is_empty!29437))

(declare-fun array_inv!27966 (array!75620) Bool)

(assert (=> start!99322 (array_inv!27966 _keys!1208)))

(assert (=> start!99322 true))

(assert (=> start!99322 tp!87435))

(declare-fun array_inv!27967 (array!75622) Bool)

(assert (=> start!99322 (and (array_inv!27967 _values!996) e!665451)))

(assert (= (and start!99322 res!777087) b!1170800))

(assert (= (and b!1170800 res!777103) b!1170792))

(assert (= (and b!1170792 res!777092) b!1170791))

(assert (= (and b!1170791 res!777090) b!1170789))

(assert (= (and b!1170789 res!777094) b!1170783))

(assert (= (and b!1170783 res!777096) b!1170788))

(assert (= (and b!1170788 res!777101) b!1170790))

(assert (= (and b!1170790 res!777086) b!1170796))

(assert (= (and b!1170796 res!777089) b!1170782))

(assert (= (and b!1170782 res!777085) b!1170798))

(assert (= (and b!1170798 (not res!777088)) b!1170786))

(assert (= (and b!1170786 (not res!777093)) b!1170793))

(assert (= (and b!1170793 (not res!777095)) b!1170794))

(assert (= (and b!1170794 res!777102) b!1170797))

(assert (= (and b!1170797 (not res!777098)) b!1170780))

(assert (= (and b!1170794 (not res!777097)) b!1170781))

(assert (= (and b!1170781 (not res!777100)) b!1170779))

(assert (= (and b!1170779 (not res!777099)) b!1170784))

(assert (= (and b!1170784 (not res!777091)) b!1170795))

(assert (= (and b!1170785 condMapEmpty!45983) mapIsEmpty!45983))

(assert (= (and b!1170785 (not condMapEmpty!45983)) mapNonEmpty!45983))

(get-info :version)

(assert (= (and mapNonEmpty!45983 ((_ is ValueCellFull!14009) mapValue!45983)) b!1170787))

(assert (= (and b!1170785 ((_ is ValueCellFull!14009) mapDefault!45983)) b!1170799))

(assert (= start!99322 b!1170785))

(declare-fun b_lambda!20033 () Bool)

(assert (=> (not b_lambda!20033) (not b!1170786)))

(declare-fun t!37563 () Bool)

(declare-fun tb!9711 () Bool)

(assert (=> (and start!99322 (= defaultEntry!1004 defaultEntry!1004) t!37563) tb!9711))

(declare-fun result!19997 () Bool)

(assert (=> tb!9711 (= result!19997 tp_is_empty!29437)))

(assert (=> b!1170786 t!37563))

(declare-fun b_and!40661 () Bool)

(assert (= b_and!40659 (and (=> t!37563 result!19997) b_and!40661)))

(declare-fun m!1078109 () Bool)

(assert (=> b!1170782 m!1078109))

(declare-fun m!1078111 () Bool)

(assert (=> b!1170784 m!1078111))

(declare-fun m!1078113 () Bool)

(assert (=> b!1170798 m!1078113))

(declare-fun m!1078115 () Bool)

(assert (=> b!1170798 m!1078115))

(declare-fun m!1078117 () Bool)

(assert (=> b!1170797 m!1078117))

(declare-fun m!1078119 () Bool)

(assert (=> b!1170781 m!1078119))

(declare-fun m!1078121 () Bool)

(assert (=> b!1170781 m!1078121))

(declare-fun m!1078123 () Bool)

(assert (=> b!1170781 m!1078123))

(declare-fun m!1078125 () Bool)

(assert (=> b!1170781 m!1078125))

(declare-fun m!1078127 () Bool)

(assert (=> b!1170793 m!1078127))

(declare-fun m!1078129 () Bool)

(assert (=> b!1170793 m!1078129))

(assert (=> b!1170793 m!1078117))

(declare-fun m!1078131 () Bool)

(assert (=> b!1170793 m!1078131))

(assert (=> b!1170793 m!1078117))

(declare-fun m!1078133 () Bool)

(assert (=> b!1170793 m!1078133))

(declare-fun m!1078135 () Bool)

(assert (=> b!1170793 m!1078135))

(declare-fun m!1078137 () Bool)

(assert (=> b!1170788 m!1078137))

(declare-fun m!1078139 () Bool)

(assert (=> b!1170780 m!1078139))

(declare-fun m!1078141 () Bool)

(assert (=> b!1170789 m!1078141))

(declare-fun m!1078143 () Bool)

(assert (=> b!1170791 m!1078143))

(declare-fun m!1078145 () Bool)

(assert (=> b!1170795 m!1078145))

(declare-fun m!1078147 () Bool)

(assert (=> start!99322 m!1078147))

(declare-fun m!1078149 () Bool)

(assert (=> start!99322 m!1078149))

(declare-fun m!1078151 () Bool)

(assert (=> b!1170786 m!1078151))

(declare-fun m!1078153 () Bool)

(assert (=> b!1170786 m!1078153))

(declare-fun m!1078155 () Bool)

(assert (=> b!1170786 m!1078155))

(declare-fun m!1078157 () Bool)

(assert (=> b!1170786 m!1078157))

(declare-fun m!1078159 () Bool)

(assert (=> b!1170779 m!1078159))

(declare-fun m!1078161 () Bool)

(assert (=> b!1170800 m!1078161))

(declare-fun m!1078163 () Bool)

(assert (=> b!1170796 m!1078163))

(declare-fun m!1078165 () Bool)

(assert (=> b!1170796 m!1078165))

(declare-fun m!1078167 () Bool)

(assert (=> mapNonEmpty!45983 m!1078167))

(assert (=> b!1170794 m!1078117))

(declare-fun m!1078169 () Bool)

(assert (=> b!1170794 m!1078169))

(assert (=> b!1170794 m!1078169))

(declare-fun m!1078171 () Bool)

(assert (=> b!1170794 m!1078171))

(declare-fun m!1078173 () Bool)

(assert (=> b!1170794 m!1078173))

(declare-fun m!1078175 () Bool)

(assert (=> b!1170790 m!1078175))

(check-sat (not b!1170794) (not b!1170789) (not b!1170780) tp_is_empty!29437 (not b!1170782) (not mapNonEmpty!45983) (not b!1170798) (not b_lambda!20033) (not b!1170784) (not b!1170795) (not b!1170788) (not b!1170791) (not b!1170779) (not b!1170786) (not b!1170796) (not b_next!24907) (not b!1170800) (not b!1170793) (not start!99322) (not b!1170781) b_and!40661)
(check-sat b_and!40661 (not b_next!24907))
