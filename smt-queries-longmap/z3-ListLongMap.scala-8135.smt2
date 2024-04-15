; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99670 () Bool)

(assert start!99670)

(declare-fun b_free!25255 () Bool)

(declare-fun b_next!25255 () Bool)

(assert (=> start!99670 (= b_free!25255 (not b_next!25255))))

(declare-fun tp!88479 () Bool)

(declare-fun b_and!41355 () Bool)

(assert (=> start!99670 (= tp!88479 b_and!41355)))

(declare-fun b!1182067 () Bool)

(declare-fun e!672045 () Bool)

(declare-fun e!672046 () Bool)

(declare-fun mapRes!46505 () Bool)

(assert (=> b!1182067 (= e!672045 (and e!672046 mapRes!46505))))

(declare-fun condMapEmpty!46505 () Bool)

(declare-datatypes ((V!44841 0))(
  ( (V!44842 (val!14949 Int)) )
))
(declare-datatypes ((ValueCell!14183 0))(
  ( (ValueCellFull!14183 (v!17586 V!44841)) (EmptyCell!14183) )
))
(declare-datatypes ((array!76304 0))(
  ( (array!76305 (arr!36802 (Array (_ BitVec 32) ValueCell!14183)) (size!37340 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76304)

(declare-fun mapDefault!46505 () ValueCell!14183)

(assert (=> b!1182067 (= condMapEmpty!46505 (= (arr!36802 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14183)) mapDefault!46505)))))

(declare-fun b!1182068 () Bool)

(declare-datatypes ((Unit!38951 0))(
  ( (Unit!38952) )
))
(declare-fun e!672050 () Unit!38951)

(declare-fun Unit!38953 () Unit!38951)

(assert (=> b!1182068 (= e!672050 Unit!38953)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!534837 () Unit!38951)

(declare-datatypes ((array!76306 0))(
  ( (array!76307 (arr!36803 (Array (_ BitVec 32) (_ BitVec 64))) (size!37341 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76306 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38951)

(assert (=> b!1182068 (= lt!534837 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182068 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534831 () Unit!38951)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76306 (_ BitVec 32) (_ BitVec 32)) Unit!38951)

(assert (=> b!1182068 (= lt!534831 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25970 0))(
  ( (Nil!25967) (Cons!25966 (h!27175 (_ BitVec 64)) (t!38208 List!25970)) )
))
(declare-fun arrayNoDuplicates!0 (array!76306 (_ BitVec 32) List!25970) Bool)

(assert (=> b!1182068 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25967)))

(declare-fun lt!534843 () Unit!38951)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76306 (_ BitVec 64) (_ BitVec 32) List!25970) Unit!38951)

(assert (=> b!1182068 (= lt!534843 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25967))))

(assert (=> b!1182068 false))

(declare-fun b!1182069 () Bool)

(declare-fun res!785578 () Bool)

(declare-fun e!672047 () Bool)

(assert (=> b!1182069 (=> (not res!785578) (not e!672047))))

(assert (=> b!1182069 (= res!785578 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25967))))

(declare-fun b!1182070 () Bool)

(declare-fun res!785584 () Bool)

(assert (=> b!1182070 (=> (not res!785584) (not e!672047))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182070 (= res!785584 (validMask!0 mask!1564))))

(declare-fun b!1182071 () Bool)

(declare-fun e!672052 () Bool)

(declare-fun e!672043 () Bool)

(assert (=> b!1182071 (= e!672052 e!672043)))

(declare-fun res!785580 () Bool)

(assert (=> b!1182071 (=> res!785580 e!672043)))

(assert (=> b!1182071 (= res!785580 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44841)

(declare-fun lt!534846 () array!76306)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19264 0))(
  ( (tuple2!19265 (_1!9643 (_ BitVec 64)) (_2!9643 V!44841)) )
))
(declare-datatypes ((List!25971 0))(
  ( (Nil!25968) (Cons!25967 (h!27176 tuple2!19264) (t!38209 List!25971)) )
))
(declare-datatypes ((ListLongMap!17233 0))(
  ( (ListLongMap!17234 (toList!8632 List!25971)) )
))
(declare-fun lt!534828 () ListLongMap!17233)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44841)

(declare-fun lt!534841 () array!76304)

(declare-fun getCurrentListMapNoExtraKeys!5087 (array!76306 array!76304 (_ BitVec 32) (_ BitVec 32) V!44841 V!44841 (_ BitVec 32) Int) ListLongMap!17233)

(assert (=> b!1182071 (= lt!534828 (getCurrentListMapNoExtraKeys!5087 lt!534846 lt!534841 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534832 () V!44841)

(assert (=> b!1182071 (= lt!534841 (array!76305 (store (arr!36802 _values!996) i!673 (ValueCellFull!14183 lt!534832)) (size!37340 _values!996)))))

(declare-fun dynLambda!2994 (Int (_ BitVec 64)) V!44841)

(assert (=> b!1182071 (= lt!534832 (dynLambda!2994 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534844 () ListLongMap!17233)

(assert (=> b!1182071 (= lt!534844 (getCurrentListMapNoExtraKeys!5087 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182072 () Bool)

(declare-fun e!672041 () Bool)

(assert (=> b!1182072 (= e!672047 e!672041)))

(declare-fun res!785583 () Bool)

(assert (=> b!1182072 (=> (not res!785583) (not e!672041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76306 (_ BitVec 32)) Bool)

(assert (=> b!1182072 (= res!785583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534846 mask!1564))))

(assert (=> b!1182072 (= lt!534846 (array!76307 (store (arr!36803 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37341 _keys!1208)))))

(declare-fun res!785577 () Bool)

(assert (=> start!99670 (=> (not res!785577) (not e!672047))))

(assert (=> start!99670 (= res!785577 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37341 _keys!1208))))))

(assert (=> start!99670 e!672047))

(declare-fun tp_is_empty!29785 () Bool)

(assert (=> start!99670 tp_is_empty!29785))

(declare-fun array_inv!28204 (array!76306) Bool)

(assert (=> start!99670 (array_inv!28204 _keys!1208)))

(assert (=> start!99670 true))

(assert (=> start!99670 tp!88479))

(declare-fun array_inv!28205 (array!76304) Bool)

(assert (=> start!99670 (and (array_inv!28205 _values!996) e!672045)))

(declare-fun b!1182073 () Bool)

(declare-fun res!785582 () Bool)

(assert (=> b!1182073 (=> (not res!785582) (not e!672047))))

(assert (=> b!1182073 (= res!785582 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37341 _keys!1208))))))

(declare-fun mapIsEmpty!46505 () Bool)

(assert (=> mapIsEmpty!46505 mapRes!46505))

(declare-fun b!1182074 () Bool)

(declare-fun e!672049 () Bool)

(declare-fun e!672044 () Bool)

(assert (=> b!1182074 (= e!672049 e!672044)))

(declare-fun res!785579 () Bool)

(assert (=> b!1182074 (=> res!785579 e!672044)))

(assert (=> b!1182074 (= res!785579 (not (= (select (arr!36803 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182075 () Bool)

(declare-fun res!785587 () Bool)

(assert (=> b!1182075 (=> (not res!785587) (not e!672047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182075 (= res!785587 (validKeyInArray!0 k0!934))))

(declare-fun b!1182076 () Bool)

(declare-fun e!672042 () Bool)

(assert (=> b!1182076 (= e!672042 tp_is_empty!29785)))

(declare-fun b!1182077 () Bool)

(declare-fun res!785585 () Bool)

(assert (=> b!1182077 (=> (not res!785585) (not e!672047))))

(assert (=> b!1182077 (= res!785585 (= (select (arr!36803 _keys!1208) i!673) k0!934))))

(declare-fun b!1182078 () Bool)

(assert (=> b!1182078 (= e!672044 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182079 () Bool)

(declare-fun res!785573 () Bool)

(assert (=> b!1182079 (=> (not res!785573) (not e!672047))))

(assert (=> b!1182079 (= res!785573 (and (= (size!37340 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37341 _keys!1208) (size!37340 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182080 () Bool)

(declare-fun res!785581 () Bool)

(assert (=> b!1182080 (=> (not res!785581) (not e!672047))))

(assert (=> b!1182080 (= res!785581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182081 () Bool)

(declare-fun res!785586 () Bool)

(assert (=> b!1182081 (=> (not res!785586) (not e!672041))))

(assert (=> b!1182081 (= res!785586 (arrayNoDuplicates!0 lt!534846 #b00000000000000000000000000000000 Nil!25967))))

(declare-fun b!1182082 () Bool)

(assert (=> b!1182082 (= e!672041 (not e!672052))))

(declare-fun res!785574 () Bool)

(assert (=> b!1182082 (=> res!785574 e!672052)))

(assert (=> b!1182082 (= res!785574 (bvsgt from!1455 i!673))))

(assert (=> b!1182082 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534830 () Unit!38951)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76306 (_ BitVec 64) (_ BitVec 32)) Unit!38951)

(assert (=> b!1182082 (= lt!534830 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182083 () Bool)

(declare-fun e!672048 () Bool)

(assert (=> b!1182083 (= e!672043 e!672048)))

(declare-fun res!785576 () Bool)

(assert (=> b!1182083 (=> res!785576 e!672048)))

(assert (=> b!1182083 (= res!785576 (not (validKeyInArray!0 (select (arr!36803 _keys!1208) from!1455))))))

(declare-fun lt!534829 () ListLongMap!17233)

(declare-fun lt!534838 () ListLongMap!17233)

(assert (=> b!1182083 (= lt!534829 lt!534838)))

(declare-fun lt!534836 () ListLongMap!17233)

(declare-fun -!1591 (ListLongMap!17233 (_ BitVec 64)) ListLongMap!17233)

(assert (=> b!1182083 (= lt!534838 (-!1591 lt!534836 k0!934))))

(assert (=> b!1182083 (= lt!534829 (getCurrentListMapNoExtraKeys!5087 lt!534846 lt!534841 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182083 (= lt!534836 (getCurrentListMapNoExtraKeys!5087 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534834 () Unit!38951)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!854 (array!76306 array!76304 (_ BitVec 32) (_ BitVec 32) V!44841 V!44841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38951)

(assert (=> b!1182083 (= lt!534834 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!854 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182084 () Bool)

(assert (=> b!1182084 (= e!672046 tp_is_empty!29785)))

(declare-fun mapNonEmpty!46505 () Bool)

(declare-fun tp!88478 () Bool)

(assert (=> mapNonEmpty!46505 (= mapRes!46505 (and tp!88478 e!672042))))

(declare-fun mapRest!46505 () (Array (_ BitVec 32) ValueCell!14183))

(declare-fun mapKey!46505 () (_ BitVec 32))

(declare-fun mapValue!46505 () ValueCell!14183)

(assert (=> mapNonEmpty!46505 (= (arr!36802 _values!996) (store mapRest!46505 mapKey!46505 mapValue!46505))))

(declare-fun b!1182085 () Bool)

(assert (=> b!1182085 (= e!672048 true)))

(declare-fun lt!534835 () ListLongMap!17233)

(declare-fun lt!534833 () ListLongMap!17233)

(assert (=> b!1182085 (= (-!1591 lt!534835 k0!934) lt!534833)))

(declare-fun lt!534845 () Unit!38951)

(declare-fun lt!534842 () V!44841)

(declare-fun addRemoveCommutativeForDiffKeys!142 (ListLongMap!17233 (_ BitVec 64) V!44841 (_ BitVec 64)) Unit!38951)

(assert (=> b!1182085 (= lt!534845 (addRemoveCommutativeForDiffKeys!142 lt!534836 (select (arr!36803 _keys!1208) from!1455) lt!534842 k0!934))))

(assert (=> b!1182085 (and (= lt!534844 lt!534835) (= lt!534838 lt!534829))))

(declare-fun lt!534840 () tuple2!19264)

(declare-fun +!3928 (ListLongMap!17233 tuple2!19264) ListLongMap!17233)

(assert (=> b!1182085 (= lt!534835 (+!3928 lt!534836 lt!534840))))

(assert (=> b!1182085 (not (= (select (arr!36803 _keys!1208) from!1455) k0!934))))

(declare-fun lt!534839 () Unit!38951)

(assert (=> b!1182085 (= lt!534839 e!672050)))

(declare-fun c!116980 () Bool)

(assert (=> b!1182085 (= c!116980 (= (select (arr!36803 _keys!1208) from!1455) k0!934))))

(assert (=> b!1182085 e!672049))

(declare-fun res!785575 () Bool)

(assert (=> b!1182085 (=> (not res!785575) (not e!672049))))

(assert (=> b!1182085 (= res!785575 (= lt!534828 lt!534833))))

(assert (=> b!1182085 (= lt!534833 (+!3928 lt!534838 lt!534840))))

(assert (=> b!1182085 (= lt!534840 (tuple2!19265 (select (arr!36803 _keys!1208) from!1455) lt!534842))))

(declare-fun get!18835 (ValueCell!14183 V!44841) V!44841)

(assert (=> b!1182085 (= lt!534842 (get!18835 (select (arr!36802 _values!996) from!1455) lt!534832))))

(declare-fun b!1182086 () Bool)

(declare-fun Unit!38954 () Unit!38951)

(assert (=> b!1182086 (= e!672050 Unit!38954)))

(assert (= (and start!99670 res!785577) b!1182070))

(assert (= (and b!1182070 res!785584) b!1182079))

(assert (= (and b!1182079 res!785573) b!1182080))

(assert (= (and b!1182080 res!785581) b!1182069))

(assert (= (and b!1182069 res!785578) b!1182073))

(assert (= (and b!1182073 res!785582) b!1182075))

(assert (= (and b!1182075 res!785587) b!1182077))

(assert (= (and b!1182077 res!785585) b!1182072))

(assert (= (and b!1182072 res!785583) b!1182081))

(assert (= (and b!1182081 res!785586) b!1182082))

(assert (= (and b!1182082 (not res!785574)) b!1182071))

(assert (= (and b!1182071 (not res!785580)) b!1182083))

(assert (= (and b!1182083 (not res!785576)) b!1182085))

(assert (= (and b!1182085 res!785575) b!1182074))

(assert (= (and b!1182074 (not res!785579)) b!1182078))

(assert (= (and b!1182085 c!116980) b!1182068))

(assert (= (and b!1182085 (not c!116980)) b!1182086))

(assert (= (and b!1182067 condMapEmpty!46505) mapIsEmpty!46505))

(assert (= (and b!1182067 (not condMapEmpty!46505)) mapNonEmpty!46505))

(get-info :version)

(assert (= (and mapNonEmpty!46505 ((_ is ValueCellFull!14183) mapValue!46505)) b!1182076))

(assert (= (and b!1182067 ((_ is ValueCellFull!14183) mapDefault!46505)) b!1182084))

(assert (= start!99670 b!1182067))

(declare-fun b_lambda!20381 () Bool)

(assert (=> (not b_lambda!20381) (not b!1182071)))

(declare-fun t!38207 () Bool)

(declare-fun tb!10059 () Bool)

(assert (=> (and start!99670 (= defaultEntry!1004 defaultEntry!1004) t!38207) tb!10059))

(declare-fun result!20693 () Bool)

(assert (=> tb!10059 (= result!20693 tp_is_empty!29785)))

(assert (=> b!1182071 t!38207))

(declare-fun b_and!41357 () Bool)

(assert (= b_and!41355 (and (=> t!38207 result!20693) b_and!41357)))

(declare-fun m!1089575 () Bool)

(assert (=> b!1182083 m!1089575))

(declare-fun m!1089577 () Bool)

(assert (=> b!1182083 m!1089577))

(declare-fun m!1089579 () Bool)

(assert (=> b!1182083 m!1089579))

(declare-fun m!1089581 () Bool)

(assert (=> b!1182083 m!1089581))

(declare-fun m!1089583 () Bool)

(assert (=> b!1182083 m!1089583))

(declare-fun m!1089585 () Bool)

(assert (=> b!1182083 m!1089585))

(assert (=> b!1182083 m!1089583))

(declare-fun m!1089587 () Bool)

(assert (=> mapNonEmpty!46505 m!1089587))

(declare-fun m!1089589 () Bool)

(assert (=> b!1182080 m!1089589))

(declare-fun m!1089591 () Bool)

(assert (=> b!1182085 m!1089591))

(declare-fun m!1089593 () Bool)

(assert (=> b!1182085 m!1089593))

(assert (=> b!1182085 m!1089593))

(declare-fun m!1089595 () Bool)

(assert (=> b!1182085 m!1089595))

(assert (=> b!1182085 m!1089583))

(declare-fun m!1089597 () Bool)

(assert (=> b!1182085 m!1089597))

(declare-fun m!1089599 () Bool)

(assert (=> b!1182085 m!1089599))

(declare-fun m!1089601 () Bool)

(assert (=> b!1182085 m!1089601))

(assert (=> b!1182085 m!1089583))

(declare-fun m!1089603 () Bool)

(assert (=> b!1182082 m!1089603))

(declare-fun m!1089605 () Bool)

(assert (=> b!1182082 m!1089605))

(declare-fun m!1089607 () Bool)

(assert (=> b!1182071 m!1089607))

(declare-fun m!1089609 () Bool)

(assert (=> b!1182071 m!1089609))

(declare-fun m!1089611 () Bool)

(assert (=> b!1182071 m!1089611))

(declare-fun m!1089613 () Bool)

(assert (=> b!1182071 m!1089613))

(declare-fun m!1089615 () Bool)

(assert (=> b!1182078 m!1089615))

(declare-fun m!1089617 () Bool)

(assert (=> b!1182081 m!1089617))

(declare-fun m!1089619 () Bool)

(assert (=> b!1182075 m!1089619))

(declare-fun m!1089621 () Bool)

(assert (=> b!1182069 m!1089621))

(assert (=> b!1182074 m!1089583))

(declare-fun m!1089623 () Bool)

(assert (=> b!1182070 m!1089623))

(declare-fun m!1089625 () Bool)

(assert (=> start!99670 m!1089625))

(declare-fun m!1089627 () Bool)

(assert (=> start!99670 m!1089627))

(declare-fun m!1089629 () Bool)

(assert (=> b!1182077 m!1089629))

(declare-fun m!1089631 () Bool)

(assert (=> b!1182072 m!1089631))

(declare-fun m!1089633 () Bool)

(assert (=> b!1182072 m!1089633))

(declare-fun m!1089635 () Bool)

(assert (=> b!1182068 m!1089635))

(declare-fun m!1089637 () Bool)

(assert (=> b!1182068 m!1089637))

(declare-fun m!1089639 () Bool)

(assert (=> b!1182068 m!1089639))

(declare-fun m!1089641 () Bool)

(assert (=> b!1182068 m!1089641))

(declare-fun m!1089643 () Bool)

(assert (=> b!1182068 m!1089643))

(check-sat tp_is_empty!29785 (not b!1182081) (not mapNonEmpty!46505) b_and!41357 (not b!1182082) (not b!1182080) (not b_next!25255) (not b!1182085) (not start!99670) (not b!1182072) (not b!1182068) (not b!1182078) (not b!1182071) (not b!1182075) (not b_lambda!20381) (not b!1182069) (not b!1182070) (not b!1182083))
(check-sat b_and!41357 (not b_next!25255))
