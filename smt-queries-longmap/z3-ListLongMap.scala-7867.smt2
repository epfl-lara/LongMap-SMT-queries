; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98182 () Bool)

(assert start!98182)

(declare-fun b_free!23647 () Bool)

(declare-fun b_next!23647 () Bool)

(assert (=> start!98182 (= b_free!23647 (not b_next!23647))))

(declare-fun tp!83644 () Bool)

(declare-fun b_and!38087 () Bool)

(assert (=> start!98182 (= tp!83644 b_and!38087)))

(declare-fun b!1123844 () Bool)

(declare-fun e!639936 () Bool)

(declare-fun e!639942 () Bool)

(declare-fun mapRes!44083 () Bool)

(assert (=> b!1123844 (= e!639936 (and e!639942 mapRes!44083))))

(declare-fun condMapEmpty!44083 () Bool)

(declare-datatypes ((V!42697 0))(
  ( (V!42698 (val!14145 Int)) )
))
(declare-datatypes ((ValueCell!13379 0))(
  ( (ValueCellFull!13379 (v!16774 V!42697)) (EmptyCell!13379) )
))
(declare-datatypes ((array!73271 0))(
  ( (array!73272 (arr!35282 (Array (_ BitVec 32) ValueCell!13379)) (size!35819 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73271)

(declare-fun mapDefault!44083 () ValueCell!13379)

(assert (=> b!1123844 (= condMapEmpty!44083 (= (arr!35282 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13379)) mapDefault!44083)))))

(declare-fun b!1123845 () Bool)

(declare-fun res!750452 () Bool)

(declare-fun e!639933 () Bool)

(assert (=> b!1123845 (=> (not res!750452) (not e!639933))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123845 (= res!750452 (validKeyInArray!0 k0!934))))

(declare-fun b!1123847 () Bool)

(declare-fun res!750456 () Bool)

(assert (=> b!1123847 (=> (not res!750456) (not e!639933))))

(declare-datatypes ((array!73273 0))(
  ( (array!73274 (arr!35283 (Array (_ BitVec 32) (_ BitVec 64))) (size!35820 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73273)

(declare-datatypes ((List!24563 0))(
  ( (Nil!24560) (Cons!24559 (h!25777 (_ BitVec 64)) (t!35194 List!24563)) )
))
(declare-fun arrayNoDuplicates!0 (array!73273 (_ BitVec 32) List!24563) Bool)

(assert (=> b!1123847 (= res!750456 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24560))))

(declare-fun b!1123848 () Bool)

(declare-datatypes ((tuple2!17768 0))(
  ( (tuple2!17769 (_1!8895 (_ BitVec 64)) (_2!8895 V!42697)) )
))
(declare-datatypes ((List!24564 0))(
  ( (Nil!24561) (Cons!24560 (h!25778 tuple2!17768) (t!35195 List!24564)) )
))
(declare-datatypes ((ListLongMap!15745 0))(
  ( (ListLongMap!15746 (toList!7888 List!24564)) )
))
(declare-fun call!47290 () ListLongMap!15745)

(declare-fun call!47291 () ListLongMap!15745)

(declare-fun e!639935 () Bool)

(declare-fun -!1083 (ListLongMap!15745 (_ BitVec 64)) ListLongMap!15745)

(assert (=> b!1123848 (= e!639935 (= call!47290 (-!1083 call!47291 k0!934)))))

(declare-fun res!750463 () Bool)

(assert (=> start!98182 (=> (not res!750463) (not e!639933))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98182 (= res!750463 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35820 _keys!1208))))))

(assert (=> start!98182 e!639933))

(declare-fun tp_is_empty!28177 () Bool)

(assert (=> start!98182 tp_is_empty!28177))

(declare-fun array_inv!27158 (array!73273) Bool)

(assert (=> start!98182 (array_inv!27158 _keys!1208)))

(assert (=> start!98182 true))

(assert (=> start!98182 tp!83644))

(declare-fun array_inv!27159 (array!73271) Bool)

(assert (=> start!98182 (and (array_inv!27159 _values!996) e!639936)))

(declare-fun b!1123846 () Bool)

(declare-fun res!750461 () Bool)

(assert (=> b!1123846 (=> (not res!750461) (not e!639933))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73273 (_ BitVec 32)) Bool)

(assert (=> b!1123846 (= res!750461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123849 () Bool)

(declare-fun e!639937 () Bool)

(assert (=> b!1123849 (= e!639933 e!639937)))

(declare-fun res!750455 () Bool)

(assert (=> b!1123849 (=> (not res!750455) (not e!639937))))

(declare-fun lt!499259 () array!73273)

(assert (=> b!1123849 (= res!750455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499259 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123849 (= lt!499259 (array!73274 (store (arr!35283 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35820 _keys!1208)))))

(declare-fun b!1123850 () Bool)

(declare-fun e!639939 () Bool)

(declare-fun e!639940 () Bool)

(assert (=> b!1123850 (= e!639939 e!639940)))

(declare-fun res!750454 () Bool)

(assert (=> b!1123850 (=> res!750454 e!639940)))

(assert (=> b!1123850 (= res!750454 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42697)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!499264 () ListLongMap!15745)

(declare-fun minValue!944 () V!42697)

(declare-fun lt!499262 () array!73271)

(declare-fun getCurrentListMapNoExtraKeys!4416 (array!73273 array!73271 (_ BitVec 32) (_ BitVec 32) V!42697 V!42697 (_ BitVec 32) Int) ListLongMap!15745)

(assert (=> b!1123850 (= lt!499264 (getCurrentListMapNoExtraKeys!4416 lt!499259 lt!499262 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2501 (Int (_ BitVec 64)) V!42697)

(assert (=> b!1123850 (= lt!499262 (array!73272 (store (arr!35282 _values!996) i!673 (ValueCellFull!13379 (dynLambda!2501 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35819 _values!996)))))

(declare-fun lt!499263 () ListLongMap!15745)

(assert (=> b!1123850 (= lt!499263 (getCurrentListMapNoExtraKeys!4416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123851 () Bool)

(declare-fun e!639938 () Bool)

(assert (=> b!1123851 (= e!639938 tp_is_empty!28177)))

(declare-fun mapIsEmpty!44083 () Bool)

(assert (=> mapIsEmpty!44083 mapRes!44083))

(declare-fun mapNonEmpty!44083 () Bool)

(declare-fun tp!83645 () Bool)

(assert (=> mapNonEmpty!44083 (= mapRes!44083 (and tp!83645 e!639938))))

(declare-fun mapRest!44083 () (Array (_ BitVec 32) ValueCell!13379))

(declare-fun mapKey!44083 () (_ BitVec 32))

(declare-fun mapValue!44083 () ValueCell!13379)

(assert (=> mapNonEmpty!44083 (= (arr!35282 _values!996) (store mapRest!44083 mapKey!44083 mapValue!44083))))

(declare-fun b!1123852 () Bool)

(declare-fun res!750451 () Bool)

(assert (=> b!1123852 (=> (not res!750451) (not e!639933))))

(assert (=> b!1123852 (= res!750451 (= (select (arr!35283 _keys!1208) i!673) k0!934))))

(declare-fun b!1123853 () Bool)

(declare-fun res!750457 () Bool)

(assert (=> b!1123853 (=> (not res!750457) (not e!639933))))

(assert (=> b!1123853 (= res!750457 (and (= (size!35819 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35820 _keys!1208) (size!35819 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123854 () Bool)

(declare-fun res!750460 () Bool)

(assert (=> b!1123854 (=> (not res!750460) (not e!639937))))

(assert (=> b!1123854 (= res!750460 (arrayNoDuplicates!0 lt!499259 #b00000000000000000000000000000000 Nil!24560))))

(declare-fun b!1123855 () Bool)

(declare-fun res!750458 () Bool)

(assert (=> b!1123855 (=> (not res!750458) (not e!639933))))

(assert (=> b!1123855 (= res!750458 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35820 _keys!1208))))))

(declare-fun b!1123856 () Bool)

(assert (=> b!1123856 (= e!639942 tp_is_empty!28177)))

(declare-fun bm!47287 () Bool)

(assert (=> bm!47287 (= call!47291 (getCurrentListMapNoExtraKeys!4416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123857 () Bool)

(assert (=> b!1123857 (= e!639935 (= call!47290 call!47291))))

(declare-fun bm!47288 () Bool)

(assert (=> bm!47288 (= call!47290 (getCurrentListMapNoExtraKeys!4416 lt!499259 lt!499262 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123858 () Bool)

(declare-fun res!750462 () Bool)

(assert (=> b!1123858 (=> (not res!750462) (not e!639933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123858 (= res!750462 (validMask!0 mask!1564))))

(declare-fun b!1123859 () Bool)

(declare-fun e!639941 () Bool)

(assert (=> b!1123859 (= e!639940 e!639941)))

(declare-fun res!750459 () Bool)

(assert (=> b!1123859 (=> res!750459 e!639941)))

(assert (=> b!1123859 (= res!750459 (not (= (select (arr!35283 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123859 e!639935))

(declare-fun c!109871 () Bool)

(assert (=> b!1123859 (= c!109871 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36807 0))(
  ( (Unit!36808) )
))
(declare-fun lt!499260 () Unit!36807)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!345 (array!73273 array!73271 (_ BitVec 32) (_ BitVec 32) V!42697 V!42697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36807)

(assert (=> b!1123859 (= lt!499260 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123860 () Bool)

(assert (=> b!1123860 (= e!639941 true)))

(declare-fun lt!499258 () Bool)

(declare-fun contains!6449 (ListLongMap!15745 (_ BitVec 64)) Bool)

(assert (=> b!1123860 (= lt!499258 (contains!6449 (getCurrentListMapNoExtraKeys!4416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1123861 () Bool)

(assert (=> b!1123861 (= e!639937 (not e!639939))))

(declare-fun res!750453 () Bool)

(assert (=> b!1123861 (=> res!750453 e!639939)))

(assert (=> b!1123861 (= res!750453 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123861 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499261 () Unit!36807)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73273 (_ BitVec 64) (_ BitVec 32)) Unit!36807)

(assert (=> b!1123861 (= lt!499261 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98182 res!750463) b!1123858))

(assert (= (and b!1123858 res!750462) b!1123853))

(assert (= (and b!1123853 res!750457) b!1123846))

(assert (= (and b!1123846 res!750461) b!1123847))

(assert (= (and b!1123847 res!750456) b!1123855))

(assert (= (and b!1123855 res!750458) b!1123845))

(assert (= (and b!1123845 res!750452) b!1123852))

(assert (= (and b!1123852 res!750451) b!1123849))

(assert (= (and b!1123849 res!750455) b!1123854))

(assert (= (and b!1123854 res!750460) b!1123861))

(assert (= (and b!1123861 (not res!750453)) b!1123850))

(assert (= (and b!1123850 (not res!750454)) b!1123859))

(assert (= (and b!1123859 c!109871) b!1123848))

(assert (= (and b!1123859 (not c!109871)) b!1123857))

(assert (= (or b!1123848 b!1123857) bm!47288))

(assert (= (or b!1123848 b!1123857) bm!47287))

(assert (= (and b!1123859 (not res!750459)) b!1123860))

(assert (= (and b!1123844 condMapEmpty!44083) mapIsEmpty!44083))

(assert (= (and b!1123844 (not condMapEmpty!44083)) mapNonEmpty!44083))

(get-info :version)

(assert (= (and mapNonEmpty!44083 ((_ is ValueCellFull!13379) mapValue!44083)) b!1123851))

(assert (= (and b!1123844 ((_ is ValueCellFull!13379) mapDefault!44083)) b!1123856))

(assert (= start!98182 b!1123844))

(declare-fun b_lambda!18627 () Bool)

(assert (=> (not b_lambda!18627) (not b!1123850)))

(declare-fun t!35193 () Bool)

(declare-fun tb!8451 () Bool)

(assert (=> (and start!98182 (= defaultEntry!1004 defaultEntry!1004) t!35193) tb!8451))

(declare-fun result!17471 () Bool)

(assert (=> tb!8451 (= result!17471 tp_is_empty!28177)))

(assert (=> b!1123850 t!35193))

(declare-fun b_and!38089 () Bool)

(assert (= b_and!38087 (and (=> t!35193 result!17471) b_and!38089)))

(declare-fun m!1038827 () Bool)

(assert (=> b!1123848 m!1038827))

(declare-fun m!1038829 () Bool)

(assert (=> start!98182 m!1038829))

(declare-fun m!1038831 () Bool)

(assert (=> start!98182 m!1038831))

(declare-fun m!1038833 () Bool)

(assert (=> mapNonEmpty!44083 m!1038833))

(declare-fun m!1038835 () Bool)

(assert (=> b!1123854 m!1038835))

(declare-fun m!1038837 () Bool)

(assert (=> b!1123861 m!1038837))

(declare-fun m!1038839 () Bool)

(assert (=> b!1123861 m!1038839))

(declare-fun m!1038841 () Bool)

(assert (=> b!1123846 m!1038841))

(declare-fun m!1038843 () Bool)

(assert (=> b!1123849 m!1038843))

(declare-fun m!1038845 () Bool)

(assert (=> b!1123849 m!1038845))

(declare-fun m!1038847 () Bool)

(assert (=> b!1123860 m!1038847))

(assert (=> b!1123860 m!1038847))

(declare-fun m!1038849 () Bool)

(assert (=> b!1123860 m!1038849))

(declare-fun m!1038851 () Bool)

(assert (=> bm!47288 m!1038851))

(declare-fun m!1038853 () Bool)

(assert (=> b!1123852 m!1038853))

(declare-fun m!1038855 () Bool)

(assert (=> b!1123850 m!1038855))

(declare-fun m!1038857 () Bool)

(assert (=> b!1123850 m!1038857))

(declare-fun m!1038859 () Bool)

(assert (=> b!1123850 m!1038859))

(declare-fun m!1038861 () Bool)

(assert (=> b!1123850 m!1038861))

(declare-fun m!1038863 () Bool)

(assert (=> b!1123859 m!1038863))

(declare-fun m!1038865 () Bool)

(assert (=> b!1123859 m!1038865))

(declare-fun m!1038867 () Bool)

(assert (=> b!1123845 m!1038867))

(declare-fun m!1038869 () Bool)

(assert (=> b!1123858 m!1038869))

(declare-fun m!1038871 () Bool)

(assert (=> b!1123847 m!1038871))

(assert (=> bm!47287 m!1038847))

(check-sat (not b!1123847) (not bm!47287) b_and!38089 (not b_next!23647) (not b_lambda!18627) (not b!1123861) (not start!98182) (not b!1123860) (not b!1123846) tp_is_empty!28177 (not b!1123849) (not b!1123850) (not bm!47288) (not b!1123845) (not b!1123848) (not mapNonEmpty!44083) (not b!1123859) (not b!1123858) (not b!1123854))
(check-sat b_and!38089 (not b_next!23647))
