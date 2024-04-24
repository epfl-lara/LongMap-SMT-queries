; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99582 () Bool)

(assert start!99582)

(declare-fun b_free!24925 () Bool)

(declare-fun b_next!24925 () Bool)

(assert (=> start!99582 (= b_free!24925 (not b_next!24925))))

(declare-fun tp!87488 () Bool)

(declare-fun b_and!40719 () Bool)

(assert (=> start!99582 (= tp!87488 b_and!40719)))

(declare-fun b!1172804 () Bool)

(declare-fun res!778183 () Bool)

(declare-fun e!666714 () Bool)

(assert (=> b!1172804 (=> (not res!778183) (not e!666714))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172804 (= res!778183 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46010 () Bool)

(declare-fun mapRes!46010 () Bool)

(assert (=> mapIsEmpty!46010 mapRes!46010))

(declare-fun b!1172805 () Bool)

(declare-fun res!778185 () Bool)

(assert (=> b!1172805 (=> (not res!778185) (not e!666714))))

(declare-datatypes ((array!75779 0))(
  ( (array!75780 (arr!36533 (Array (_ BitVec 32) (_ BitVec 64))) (size!37070 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75779)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1172805 (= res!778185 (= (select (arr!36533 _keys!1208) i!673) k0!934))))

(declare-fun b!1172806 () Bool)

(declare-fun e!666716 () Bool)

(declare-fun e!666719 () Bool)

(assert (=> b!1172806 (= e!666716 e!666719)))

(declare-fun res!778178 () Bool)

(assert (=> b!1172806 (=> res!778178 e!666719)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172806 (= res!778178 (not (= (select (arr!36533 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172807 () Bool)

(declare-fun e!666708 () Bool)

(declare-fun e!666712 () Bool)

(assert (=> b!1172807 (= e!666708 e!666712)))

(declare-fun res!778190 () Bool)

(assert (=> b!1172807 (=> res!778190 e!666712)))

(assert (=> b!1172807 (= res!778190 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44401 0))(
  ( (V!44402 (val!14784 Int)) )
))
(declare-fun zeroValue!944 () V!44401)

(declare-datatypes ((ValueCell!14018 0))(
  ( (ValueCellFull!14018 (v!17418 V!44401)) (EmptyCell!14018) )
))
(declare-datatypes ((array!75781 0))(
  ( (array!75782 (arr!36534 (Array (_ BitVec 32) ValueCell!14018)) (size!37071 (_ BitVec 32))) )
))
(declare-fun lt!528240 () array!75781)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18918 0))(
  ( (tuple2!18919 (_1!9470 (_ BitVec 64)) (_2!9470 V!44401)) )
))
(declare-datatypes ((List!25653 0))(
  ( (Nil!25650) (Cons!25649 (h!26867 tuple2!18918) (t!37562 List!25653)) )
))
(declare-datatypes ((ListLongMap!16895 0))(
  ( (ListLongMap!16896 (toList!8463 List!25653)) )
))
(declare-fun lt!528238 () ListLongMap!16895)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44401)

(declare-fun lt!528236 () array!75779)

(declare-fun getCurrentListMapNoExtraKeys!4950 (array!75779 array!75781 (_ BitVec 32) (_ BitVec 32) V!44401 V!44401 (_ BitVec 32) Int) ListLongMap!16895)

(assert (=> b!1172807 (= lt!528238 (getCurrentListMapNoExtraKeys!4950 lt!528236 lt!528240 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75781)

(declare-fun lt!528229 () V!44401)

(assert (=> b!1172807 (= lt!528240 (array!75782 (store (arr!36534 _values!996) i!673 (ValueCellFull!14018 lt!528229)) (size!37071 _values!996)))))

(declare-fun dynLambda!2929 (Int (_ BitVec 64)) V!44401)

(assert (=> b!1172807 (= lt!528229 (dynLambda!2929 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528239 () ListLongMap!16895)

(assert (=> b!1172807 (= lt!528239 (getCurrentListMapNoExtraKeys!4950 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172808 () Bool)

(declare-fun res!778182 () Bool)

(assert (=> b!1172808 (=> (not res!778182) (not e!666714))))

(assert (=> b!1172808 (= res!778182 (and (= (size!37071 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37070 _keys!1208) (size!37071 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172809 () Bool)

(declare-fun e!666711 () Bool)

(assert (=> b!1172809 (= e!666711 (not e!666708))))

(declare-fun res!778174 () Bool)

(assert (=> b!1172809 (=> res!778174 e!666708)))

(assert (=> b!1172809 (= res!778174 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172809 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38615 0))(
  ( (Unit!38616) )
))
(declare-fun lt!528230 () Unit!38615)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75779 (_ BitVec 64) (_ BitVec 32)) Unit!38615)

(assert (=> b!1172809 (= lt!528230 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172810 () Bool)

(declare-fun res!778180 () Bool)

(assert (=> b!1172810 (=> (not res!778180) (not e!666714))))

(assert (=> b!1172810 (= res!778180 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37070 _keys!1208))))))

(declare-fun b!1172812 () Bool)

(declare-fun e!666717 () Bool)

(assert (=> b!1172812 (= e!666717 true)))

(declare-fun lt!528232 () Bool)

(declare-datatypes ((List!25654 0))(
  ( (Nil!25651) (Cons!25650 (h!26868 (_ BitVec 64)) (t!37563 List!25654)) )
))
(declare-fun contains!6878 (List!25654 (_ BitVec 64)) Bool)

(assert (=> b!1172812 (= lt!528232 (contains!6878 Nil!25651 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172813 () Bool)

(declare-fun res!778176 () Bool)

(assert (=> b!1172813 (=> (not res!778176) (not e!666714))))

(declare-fun arrayNoDuplicates!0 (array!75779 (_ BitVec 32) List!25654) Bool)

(assert (=> b!1172813 (= res!778176 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25651))))

(declare-fun b!1172814 () Bool)

(declare-fun res!778186 () Bool)

(assert (=> b!1172814 (=> res!778186 e!666717)))

(declare-fun noDuplicate!1627 (List!25654) Bool)

(assert (=> b!1172814 (= res!778186 (not (noDuplicate!1627 Nil!25651)))))

(declare-fun b!1172815 () Bool)

(declare-fun res!778181 () Bool)

(assert (=> b!1172815 (=> res!778181 e!666717)))

(assert (=> b!1172815 (= res!778181 (contains!6878 Nil!25651 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172816 () Bool)

(declare-fun e!666713 () Bool)

(assert (=> b!1172816 (= e!666713 e!666717)))

(declare-fun res!778175 () Bool)

(assert (=> b!1172816 (=> res!778175 e!666717)))

(assert (=> b!1172816 (= res!778175 (or (bvsge (size!37070 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37070 _keys!1208)) (bvsge from!1455 (size!37070 _keys!1208))))))

(assert (=> b!1172816 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25651)))

(declare-fun lt!528231 () Unit!38615)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75779 (_ BitVec 32) (_ BitVec 32)) Unit!38615)

(assert (=> b!1172816 (= lt!528231 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1172816 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528233 () Unit!38615)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75779 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38615)

(assert (=> b!1172816 (= lt!528233 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172817 () Bool)

(declare-fun res!778173 () Bool)

(assert (=> b!1172817 (=> (not res!778173) (not e!666711))))

(assert (=> b!1172817 (= res!778173 (arrayNoDuplicates!0 lt!528236 #b00000000000000000000000000000000 Nil!25651))))

(declare-fun b!1172818 () Bool)

(declare-fun e!666715 () Bool)

(assert (=> b!1172818 (= e!666712 e!666715)))

(declare-fun res!778184 () Bool)

(assert (=> b!1172818 (=> res!778184 e!666715)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172818 (= res!778184 (not (validKeyInArray!0 (select (arr!36533 _keys!1208) from!1455))))))

(declare-fun lt!528237 () ListLongMap!16895)

(declare-fun lt!528241 () ListLongMap!16895)

(assert (=> b!1172818 (= lt!528237 lt!528241)))

(declare-fun lt!528234 () ListLongMap!16895)

(declare-fun -!1516 (ListLongMap!16895 (_ BitVec 64)) ListLongMap!16895)

(assert (=> b!1172818 (= lt!528241 (-!1516 lt!528234 k0!934))))

(assert (=> b!1172818 (= lt!528237 (getCurrentListMapNoExtraKeys!4950 lt!528236 lt!528240 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172818 (= lt!528234 (getCurrentListMapNoExtraKeys!4950 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528235 () Unit!38615)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!741 (array!75779 array!75781 (_ BitVec 32) (_ BitVec 32) V!44401 V!44401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38615)

(assert (=> b!1172818 (= lt!528235 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!741 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172819 () Bool)

(declare-fun res!778172 () Bool)

(assert (=> b!1172819 (=> (not res!778172) (not e!666714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75779 (_ BitVec 32)) Bool)

(assert (=> b!1172819 (= res!778172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46010 () Bool)

(declare-fun tp!87489 () Bool)

(declare-fun e!666718 () Bool)

(assert (=> mapNonEmpty!46010 (= mapRes!46010 (and tp!87489 e!666718))))

(declare-fun mapRest!46010 () (Array (_ BitVec 32) ValueCell!14018))

(declare-fun mapValue!46010 () ValueCell!14018)

(declare-fun mapKey!46010 () (_ BitVec 32))

(assert (=> mapNonEmpty!46010 (= (arr!36534 _values!996) (store mapRest!46010 mapKey!46010 mapValue!46010))))

(declare-fun b!1172811 () Bool)

(assert (=> b!1172811 (= e!666715 e!666713)))

(declare-fun res!778188 () Bool)

(assert (=> b!1172811 (=> res!778188 e!666713)))

(assert (=> b!1172811 (= res!778188 (not (= (select (arr!36533 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1172811 e!666716))

(declare-fun res!778177 () Bool)

(assert (=> b!1172811 (=> (not res!778177) (not e!666716))))

(declare-fun +!3801 (ListLongMap!16895 tuple2!18918) ListLongMap!16895)

(declare-fun get!18661 (ValueCell!14018 V!44401) V!44401)

(assert (=> b!1172811 (= res!778177 (= lt!528238 (+!3801 lt!528241 (tuple2!18919 (select (arr!36533 _keys!1208) from!1455) (get!18661 (select (arr!36534 _values!996) from!1455) lt!528229)))))))

(declare-fun res!778187 () Bool)

(assert (=> start!99582 (=> (not res!778187) (not e!666714))))

(assert (=> start!99582 (= res!778187 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37070 _keys!1208))))))

(assert (=> start!99582 e!666714))

(declare-fun tp_is_empty!29455 () Bool)

(assert (=> start!99582 tp_is_empty!29455))

(declare-fun array_inv!27992 (array!75779) Bool)

(assert (=> start!99582 (array_inv!27992 _keys!1208)))

(assert (=> start!99582 true))

(assert (=> start!99582 tp!87488))

(declare-fun e!666707 () Bool)

(declare-fun array_inv!27993 (array!75781) Bool)

(assert (=> start!99582 (and (array_inv!27993 _values!996) e!666707)))

(declare-fun b!1172820 () Bool)

(assert (=> b!1172820 (= e!666714 e!666711)))

(declare-fun res!778179 () Bool)

(assert (=> b!1172820 (=> (not res!778179) (not e!666711))))

(assert (=> b!1172820 (= res!778179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528236 mask!1564))))

(assert (=> b!1172820 (= lt!528236 (array!75780 (store (arr!36533 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37070 _keys!1208)))))

(declare-fun b!1172821 () Bool)

(declare-fun res!778189 () Bool)

(assert (=> b!1172821 (=> (not res!778189) (not e!666714))))

(assert (=> b!1172821 (= res!778189 (validKeyInArray!0 k0!934))))

(declare-fun b!1172822 () Bool)

(declare-fun e!666709 () Bool)

(assert (=> b!1172822 (= e!666709 tp_is_empty!29455)))

(declare-fun b!1172823 () Bool)

(assert (=> b!1172823 (= e!666707 (and e!666709 mapRes!46010))))

(declare-fun condMapEmpty!46010 () Bool)

(declare-fun mapDefault!46010 () ValueCell!14018)

(assert (=> b!1172823 (= condMapEmpty!46010 (= (arr!36534 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14018)) mapDefault!46010)))))

(declare-fun b!1172824 () Bool)

(assert (=> b!1172824 (= e!666719 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172825 () Bool)

(assert (=> b!1172825 (= e!666718 tp_is_empty!29455)))

(assert (= (and start!99582 res!778187) b!1172804))

(assert (= (and b!1172804 res!778183) b!1172808))

(assert (= (and b!1172808 res!778182) b!1172819))

(assert (= (and b!1172819 res!778172) b!1172813))

(assert (= (and b!1172813 res!778176) b!1172810))

(assert (= (and b!1172810 res!778180) b!1172821))

(assert (= (and b!1172821 res!778189) b!1172805))

(assert (= (and b!1172805 res!778185) b!1172820))

(assert (= (and b!1172820 res!778179) b!1172817))

(assert (= (and b!1172817 res!778173) b!1172809))

(assert (= (and b!1172809 (not res!778174)) b!1172807))

(assert (= (and b!1172807 (not res!778190)) b!1172818))

(assert (= (and b!1172818 (not res!778184)) b!1172811))

(assert (= (and b!1172811 res!778177) b!1172806))

(assert (= (and b!1172806 (not res!778178)) b!1172824))

(assert (= (and b!1172811 (not res!778188)) b!1172816))

(assert (= (and b!1172816 (not res!778175)) b!1172814))

(assert (= (and b!1172814 (not res!778186)) b!1172815))

(assert (= (and b!1172815 (not res!778181)) b!1172812))

(assert (= (and b!1172823 condMapEmpty!46010) mapIsEmpty!46010))

(assert (= (and b!1172823 (not condMapEmpty!46010)) mapNonEmpty!46010))

(get-info :version)

(assert (= (and mapNonEmpty!46010 ((_ is ValueCellFull!14018) mapValue!46010)) b!1172825))

(assert (= (and b!1172823 ((_ is ValueCellFull!14018) mapDefault!46010)) b!1172822))

(assert (= start!99582 b!1172823))

(declare-fun b_lambda!20063 () Bool)

(assert (=> (not b_lambda!20063) (not b!1172807)))

(declare-fun t!37561 () Bool)

(declare-fun tb!9729 () Bool)

(assert (=> (and start!99582 (= defaultEntry!1004 defaultEntry!1004) t!37561) tb!9729))

(declare-fun result!20033 () Bool)

(assert (=> tb!9729 (= result!20033 tp_is_empty!29455)))

(assert (=> b!1172807 t!37561))

(declare-fun b_and!40721 () Bool)

(assert (= b_and!40719 (and (=> t!37561 result!20033) b_and!40721)))

(declare-fun m!1080903 () Bool)

(assert (=> start!99582 m!1080903))

(declare-fun m!1080905 () Bool)

(assert (=> start!99582 m!1080905))

(declare-fun m!1080907 () Bool)

(assert (=> b!1172811 m!1080907))

(declare-fun m!1080909 () Bool)

(assert (=> b!1172811 m!1080909))

(assert (=> b!1172811 m!1080909))

(declare-fun m!1080911 () Bool)

(assert (=> b!1172811 m!1080911))

(declare-fun m!1080913 () Bool)

(assert (=> b!1172811 m!1080913))

(declare-fun m!1080915 () Bool)

(assert (=> b!1172818 m!1080915))

(declare-fun m!1080917 () Bool)

(assert (=> b!1172818 m!1080917))

(declare-fun m!1080919 () Bool)

(assert (=> b!1172818 m!1080919))

(assert (=> b!1172818 m!1080907))

(declare-fun m!1080921 () Bool)

(assert (=> b!1172818 m!1080921))

(assert (=> b!1172818 m!1080907))

(declare-fun m!1080923 () Bool)

(assert (=> b!1172818 m!1080923))

(declare-fun m!1080925 () Bool)

(assert (=> b!1172814 m!1080925))

(declare-fun m!1080927 () Bool)

(assert (=> b!1172815 m!1080927))

(declare-fun m!1080929 () Bool)

(assert (=> b!1172807 m!1080929))

(declare-fun m!1080931 () Bool)

(assert (=> b!1172807 m!1080931))

(declare-fun m!1080933 () Bool)

(assert (=> b!1172807 m!1080933))

(declare-fun m!1080935 () Bool)

(assert (=> b!1172807 m!1080935))

(declare-fun m!1080937 () Bool)

(assert (=> b!1172820 m!1080937))

(declare-fun m!1080939 () Bool)

(assert (=> b!1172820 m!1080939))

(declare-fun m!1080941 () Bool)

(assert (=> b!1172816 m!1080941))

(declare-fun m!1080943 () Bool)

(assert (=> b!1172816 m!1080943))

(declare-fun m!1080945 () Bool)

(assert (=> b!1172816 m!1080945))

(declare-fun m!1080947 () Bool)

(assert (=> b!1172816 m!1080947))

(assert (=> b!1172806 m!1080907))

(declare-fun m!1080949 () Bool)

(assert (=> b!1172819 m!1080949))

(declare-fun m!1080951 () Bool)

(assert (=> b!1172824 m!1080951))

(declare-fun m!1080953 () Bool)

(assert (=> b!1172809 m!1080953))

(declare-fun m!1080955 () Bool)

(assert (=> b!1172809 m!1080955))

(declare-fun m!1080957 () Bool)

(assert (=> b!1172817 m!1080957))

(declare-fun m!1080959 () Bool)

(assert (=> b!1172805 m!1080959))

(declare-fun m!1080961 () Bool)

(assert (=> b!1172804 m!1080961))

(declare-fun m!1080963 () Bool)

(assert (=> b!1172813 m!1080963))

(declare-fun m!1080965 () Bool)

(assert (=> b!1172821 m!1080965))

(declare-fun m!1080967 () Bool)

(assert (=> b!1172812 m!1080967))

(declare-fun m!1080969 () Bool)

(assert (=> mapNonEmpty!46010 m!1080969))

(check-sat tp_is_empty!29455 (not b!1172819) (not b!1172809) (not b!1172813) (not b!1172804) (not mapNonEmpty!46010) (not b!1172824) (not start!99582) (not b!1172817) (not b!1172821) (not b!1172814) (not b!1172818) (not b!1172816) (not b!1172807) (not b_lambda!20063) (not b!1172820) (not b!1172815) (not b!1172811) b_and!40721 (not b!1172812) (not b_next!24925))
(check-sat b_and!40721 (not b_next!24925))
