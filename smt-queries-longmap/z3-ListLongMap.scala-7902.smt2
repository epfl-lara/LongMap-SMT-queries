; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98392 () Bool)

(assert start!98392)

(declare-fun b_free!23857 () Bool)

(declare-fun b_next!23857 () Bool)

(assert (=> start!98392 (= b_free!23857 (not b_next!23857))))

(declare-fun tp!84275 () Bool)

(declare-fun b_and!38507 () Bool)

(assert (=> start!98392 (= tp!84275 b_and!38507)))

(declare-fun b!1129924 () Bool)

(declare-fun e!643180 () Bool)

(declare-fun e!643175 () Bool)

(assert (=> b!1129924 (= e!643180 e!643175)))

(declare-fun res!754748 () Bool)

(assert (=> b!1129924 (=> (not res!754748) (not e!643175))))

(declare-datatypes ((array!73677 0))(
  ( (array!73678 (arr!35485 (Array (_ BitVec 32) (_ BitVec 64))) (size!36022 (_ BitVec 32))) )
))
(declare-fun lt!501533 () array!73677)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73677 (_ BitVec 32)) Bool)

(assert (=> b!1129924 (= res!754748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501533 mask!1564))))

(declare-fun _keys!1208 () array!73677)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129924 (= lt!501533 (array!73678 (store (arr!35485 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36022 _keys!1208)))))

(declare-fun b!1129925 () Bool)

(declare-fun e!643173 () Bool)

(declare-fun e!643177 () Bool)

(assert (=> b!1129925 (= e!643173 e!643177)))

(declare-fun res!754746 () Bool)

(assert (=> b!1129925 (=> res!754746 e!643177)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1129925 (= res!754746 (not (= (select (arr!35485 _keys!1208) from!1455) k0!934)))))

(declare-fun e!643179 () Bool)

(assert (=> b!1129925 e!643179))

(declare-fun c!110186 () Bool)

(assert (=> b!1129925 (= c!110186 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42977 0))(
  ( (V!42978 (val!14250 Int)) )
))
(declare-fun zeroValue!944 () V!42977)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13484 0))(
  ( (ValueCellFull!13484 (v!16879 V!42977)) (EmptyCell!13484) )
))
(declare-datatypes ((array!73679 0))(
  ( (array!73680 (arr!35486 (Array (_ BitVec 32) ValueCell!13484)) (size!36023 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73679)

(declare-fun minValue!944 () V!42977)

(declare-datatypes ((Unit!36959 0))(
  ( (Unit!36960) )
))
(declare-fun lt!501535 () Unit!36959)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!408 (array!73677 array!73679 (_ BitVec 32) (_ BitVec 32) V!42977 V!42977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36959)

(assert (=> b!1129925 (= lt!501535 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129926 () Bool)

(declare-fun res!754753 () Bool)

(assert (=> b!1129926 (=> (not res!754753) (not e!643180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129926 (= res!754753 (validKeyInArray!0 k0!934))))

(declare-fun b!1129927 () Bool)

(declare-fun e!643176 () Bool)

(assert (=> b!1129927 (= e!643176 e!643173)))

(declare-fun res!754757 () Bool)

(assert (=> b!1129927 (=> res!754757 e!643173)))

(assert (=> b!1129927 (= res!754757 (not (= from!1455 i!673)))))

(declare-datatypes ((tuple2!17954 0))(
  ( (tuple2!17955 (_1!8988 (_ BitVec 64)) (_2!8988 V!42977)) )
))
(declare-datatypes ((List!24732 0))(
  ( (Nil!24729) (Cons!24728 (h!25946 tuple2!17954) (t!35573 List!24732)) )
))
(declare-datatypes ((ListLongMap!15931 0))(
  ( (ListLongMap!15932 (toList!7981 List!24732)) )
))
(declare-fun lt!501534 () ListLongMap!15931)

(declare-fun lt!501538 () array!73679)

(declare-fun getCurrentListMapNoExtraKeys!4501 (array!73677 array!73679 (_ BitVec 32) (_ BitVec 32) V!42977 V!42977 (_ BitVec 32) Int) ListLongMap!15931)

(assert (=> b!1129927 (= lt!501534 (getCurrentListMapNoExtraKeys!4501 lt!501533 lt!501538 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2566 (Int (_ BitVec 64)) V!42977)

(assert (=> b!1129927 (= lt!501538 (array!73680 (store (arr!35486 _values!996) i!673 (ValueCellFull!13484 (dynLambda!2566 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36023 _values!996)))))

(declare-fun lt!501536 () ListLongMap!15931)

(assert (=> b!1129927 (= lt!501536 (getCurrentListMapNoExtraKeys!4501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!47920 () ListLongMap!15931)

(declare-fun bm!47917 () Bool)

(assert (=> bm!47917 (= call!47920 (getCurrentListMapNoExtraKeys!4501 (ite c!110186 lt!501533 _keys!1208) (ite c!110186 lt!501538 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129928 () Bool)

(declare-fun e!643181 () Bool)

(declare-fun tp_is_empty!28387 () Bool)

(assert (=> b!1129928 (= e!643181 tp_is_empty!28387)))

(declare-fun b!1129929 () Bool)

(declare-fun res!754759 () Bool)

(assert (=> b!1129929 (=> res!754759 e!643177)))

(declare-fun contains!6519 (ListLongMap!15931 (_ BitVec 64)) Bool)

(assert (=> b!1129929 (= res!754759 (not (contains!6519 (getCurrentListMapNoExtraKeys!4501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934)))))

(declare-fun b!1129930 () Bool)

(declare-fun res!754758 () Bool)

(assert (=> b!1129930 (=> (not res!754758) (not e!643180))))

(declare-datatypes ((List!24733 0))(
  ( (Nil!24730) (Cons!24729 (h!25947 (_ BitVec 64)) (t!35574 List!24733)) )
))
(declare-fun arrayNoDuplicates!0 (array!73677 (_ BitVec 32) List!24733) Bool)

(assert (=> b!1129930 (= res!754758 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24730))))

(declare-fun b!1129931 () Bool)

(assert (=> b!1129931 (= e!643175 (not e!643176))))

(declare-fun res!754755 () Bool)

(assert (=> b!1129931 (=> res!754755 e!643176)))

(assert (=> b!1129931 (= res!754755 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129931 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501537 () Unit!36959)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73677 (_ BitVec 64) (_ BitVec 32)) Unit!36959)

(assert (=> b!1129931 (= lt!501537 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129932 () Bool)

(assert (=> b!1129932 (= e!643177 (or (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36022 _keys!1208)))))))

(declare-fun mapNonEmpty!44398 () Bool)

(declare-fun mapRes!44398 () Bool)

(declare-fun tp!84274 () Bool)

(assert (=> mapNonEmpty!44398 (= mapRes!44398 (and tp!84274 e!643181))))

(declare-fun mapKey!44398 () (_ BitVec 32))

(declare-fun mapValue!44398 () ValueCell!13484)

(declare-fun mapRest!44398 () (Array (_ BitVec 32) ValueCell!13484))

(assert (=> mapNonEmpty!44398 (= (arr!35486 _values!996) (store mapRest!44398 mapKey!44398 mapValue!44398))))

(declare-fun b!1129933 () Bool)

(declare-fun res!754752 () Bool)

(assert (=> b!1129933 (=> (not res!754752) (not e!643180))))

(assert (=> b!1129933 (= res!754752 (and (= (size!36023 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36022 _keys!1208) (size!36023 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1129934 () Bool)

(declare-fun e!643178 () Bool)

(declare-fun e!643182 () Bool)

(assert (=> b!1129934 (= e!643178 (and e!643182 mapRes!44398))))

(declare-fun condMapEmpty!44398 () Bool)

(declare-fun mapDefault!44398 () ValueCell!13484)

(assert (=> b!1129934 (= condMapEmpty!44398 (= (arr!35486 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13484)) mapDefault!44398)))))

(declare-fun b!1129935 () Bool)

(declare-fun res!754749 () Bool)

(assert (=> b!1129935 (=> (not res!754749) (not e!643180))))

(assert (=> b!1129935 (= res!754749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129936 () Bool)

(assert (=> b!1129936 (= e!643182 tp_is_empty!28387)))

(declare-fun b!1129937 () Bool)

(declare-fun res!754750 () Bool)

(assert (=> b!1129937 (=> (not res!754750) (not e!643175))))

(assert (=> b!1129937 (= res!754750 (arrayNoDuplicates!0 lt!501533 #b00000000000000000000000000000000 Nil!24730))))

(declare-fun b!1129938 () Bool)

(declare-fun res!754756 () Bool)

(assert (=> b!1129938 (=> (not res!754756) (not e!643180))))

(assert (=> b!1129938 (= res!754756 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36022 _keys!1208))))))

(declare-fun res!754751 () Bool)

(assert (=> start!98392 (=> (not res!754751) (not e!643180))))

(assert (=> start!98392 (= res!754751 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36022 _keys!1208))))))

(assert (=> start!98392 e!643180))

(assert (=> start!98392 tp_is_empty!28387))

(declare-fun array_inv!27284 (array!73677) Bool)

(assert (=> start!98392 (array_inv!27284 _keys!1208)))

(assert (=> start!98392 true))

(assert (=> start!98392 tp!84275))

(declare-fun array_inv!27285 (array!73679) Bool)

(assert (=> start!98392 (and (array_inv!27285 _values!996) e!643178)))

(declare-fun b!1129939 () Bool)

(declare-fun call!47921 () ListLongMap!15931)

(assert (=> b!1129939 (= e!643179 (= call!47921 call!47920))))

(declare-fun mapIsEmpty!44398 () Bool)

(assert (=> mapIsEmpty!44398 mapRes!44398))

(declare-fun bm!47918 () Bool)

(assert (=> bm!47918 (= call!47921 (getCurrentListMapNoExtraKeys!4501 (ite c!110186 _keys!1208 lt!501533) (ite c!110186 _values!996 lt!501538) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129940 () Bool)

(declare-fun res!754754 () Bool)

(assert (=> b!1129940 (=> (not res!754754) (not e!643180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129940 (= res!754754 (validMask!0 mask!1564))))

(declare-fun b!1129941 () Bool)

(declare-fun -!1148 (ListLongMap!15931 (_ BitVec 64)) ListLongMap!15931)

(assert (=> b!1129941 (= e!643179 (= call!47920 (-!1148 call!47921 k0!934)))))

(declare-fun b!1129942 () Bool)

(declare-fun res!754747 () Bool)

(assert (=> b!1129942 (=> (not res!754747) (not e!643180))))

(assert (=> b!1129942 (= res!754747 (= (select (arr!35485 _keys!1208) i!673) k0!934))))

(assert (= (and start!98392 res!754751) b!1129940))

(assert (= (and b!1129940 res!754754) b!1129933))

(assert (= (and b!1129933 res!754752) b!1129935))

(assert (= (and b!1129935 res!754749) b!1129930))

(assert (= (and b!1129930 res!754758) b!1129938))

(assert (= (and b!1129938 res!754756) b!1129926))

(assert (= (and b!1129926 res!754753) b!1129942))

(assert (= (and b!1129942 res!754747) b!1129924))

(assert (= (and b!1129924 res!754748) b!1129937))

(assert (= (and b!1129937 res!754750) b!1129931))

(assert (= (and b!1129931 (not res!754755)) b!1129927))

(assert (= (and b!1129927 (not res!754757)) b!1129925))

(assert (= (and b!1129925 c!110186) b!1129941))

(assert (= (and b!1129925 (not c!110186)) b!1129939))

(assert (= (or b!1129941 b!1129939) bm!47918))

(assert (= (or b!1129941 b!1129939) bm!47917))

(assert (= (and b!1129925 (not res!754746)) b!1129929))

(assert (= (and b!1129929 (not res!754759)) b!1129932))

(assert (= (and b!1129934 condMapEmpty!44398) mapIsEmpty!44398))

(assert (= (and b!1129934 (not condMapEmpty!44398)) mapNonEmpty!44398))

(get-info :version)

(assert (= (and mapNonEmpty!44398 ((_ is ValueCellFull!13484) mapValue!44398)) b!1129928))

(assert (= (and b!1129934 ((_ is ValueCellFull!13484) mapDefault!44398)) b!1129936))

(assert (= start!98392 b!1129934))

(declare-fun b_lambda!18837 () Bool)

(assert (=> (not b_lambda!18837) (not b!1129927)))

(declare-fun t!35572 () Bool)

(declare-fun tb!8661 () Bool)

(assert (=> (and start!98392 (= defaultEntry!1004 defaultEntry!1004) t!35572) tb!8661))

(declare-fun result!17891 () Bool)

(assert (=> tb!8661 (= result!17891 tp_is_empty!28387)))

(assert (=> b!1129927 t!35572))

(declare-fun b_and!38509 () Bool)

(assert (= b_and!38507 (and (=> t!35572 result!17891) b_and!38509)))

(declare-fun m!1043843 () Bool)

(assert (=> b!1129927 m!1043843))

(declare-fun m!1043845 () Bool)

(assert (=> b!1129927 m!1043845))

(declare-fun m!1043847 () Bool)

(assert (=> b!1129927 m!1043847))

(declare-fun m!1043849 () Bool)

(assert (=> b!1129927 m!1043849))

(declare-fun m!1043851 () Bool)

(assert (=> bm!47917 m!1043851))

(declare-fun m!1043853 () Bool)

(assert (=> b!1129926 m!1043853))

(declare-fun m!1043855 () Bool)

(assert (=> b!1129931 m!1043855))

(declare-fun m!1043857 () Bool)

(assert (=> b!1129931 m!1043857))

(declare-fun m!1043859 () Bool)

(assert (=> b!1129942 m!1043859))

(declare-fun m!1043861 () Bool)

(assert (=> mapNonEmpty!44398 m!1043861))

(declare-fun m!1043863 () Bool)

(assert (=> bm!47918 m!1043863))

(declare-fun m!1043865 () Bool)

(assert (=> b!1129941 m!1043865))

(declare-fun m!1043867 () Bool)

(assert (=> b!1129935 m!1043867))

(declare-fun m!1043869 () Bool)

(assert (=> b!1129925 m!1043869))

(declare-fun m!1043871 () Bool)

(assert (=> b!1129925 m!1043871))

(declare-fun m!1043873 () Bool)

(assert (=> b!1129930 m!1043873))

(declare-fun m!1043875 () Bool)

(assert (=> b!1129940 m!1043875))

(declare-fun m!1043877 () Bool)

(assert (=> b!1129924 m!1043877))

(declare-fun m!1043879 () Bool)

(assert (=> b!1129924 m!1043879))

(declare-fun m!1043881 () Bool)

(assert (=> b!1129937 m!1043881))

(declare-fun m!1043883 () Bool)

(assert (=> b!1129929 m!1043883))

(assert (=> b!1129929 m!1043883))

(declare-fun m!1043885 () Bool)

(assert (=> b!1129929 m!1043885))

(declare-fun m!1043887 () Bool)

(assert (=> start!98392 m!1043887))

(declare-fun m!1043889 () Bool)

(assert (=> start!98392 m!1043889))

(check-sat (not b_lambda!18837) (not b!1129926) (not bm!47918) (not mapNonEmpty!44398) (not b_next!23857) tp_is_empty!28387 (not b!1129940) (not b!1129927) (not b!1129929) (not b!1129925) (not b!1129941) (not bm!47917) (not b!1129930) (not b!1129924) (not b!1129935) (not b!1129937) (not start!98392) (not b!1129931) b_and!38509)
(check-sat b_and!38509 (not b_next!23857))
