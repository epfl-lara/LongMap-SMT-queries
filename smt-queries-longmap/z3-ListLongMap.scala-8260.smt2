; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100510 () Bool)

(assert start!100510)

(declare-fun b_free!25833 () Bool)

(declare-fun b_next!25833 () Bool)

(assert (=> start!100510 (= b_free!25833 (not b_next!25833))))

(declare-fun tp!90489 () Bool)

(declare-fun b_and!42553 () Bool)

(assert (=> start!100510 (= tp!90489 b_and!42553)))

(declare-fun b!1200821 () Bool)

(declare-fun e!681926 () Bool)

(declare-fun e!681924 () Bool)

(assert (=> b!1200821 (= e!681926 e!681924)))

(declare-fun res!799377 () Bool)

(assert (=> b!1200821 (=> res!799377 e!681924)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200821 (= res!799377 (not (= from!1455 i!673)))))

(declare-datatypes ((V!45843 0))(
  ( (V!45844 (val!15325 Int)) )
))
(declare-fun zeroValue!944 () V!45843)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14559 0))(
  ( (ValueCellFull!14559 (v!17963 V!45843)) (EmptyCell!14559) )
))
(declare-datatypes ((array!77847 0))(
  ( (array!77848 (arr!37568 (Array (_ BitVec 32) ValueCell!14559)) (size!38104 (_ BitVec 32))) )
))
(declare-fun lt!544186 () array!77847)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19622 0))(
  ( (tuple2!19623 (_1!9822 (_ BitVec 64)) (_2!9822 V!45843)) )
))
(declare-datatypes ((List!26440 0))(
  ( (Nil!26437) (Cons!26436 (h!27645 tuple2!19622) (t!39253 List!26440)) )
))
(declare-datatypes ((ListLongMap!17591 0))(
  ( (ListLongMap!17592 (toList!8811 List!26440)) )
))
(declare-fun lt!544189 () ListLongMap!17591)

(declare-datatypes ((array!77849 0))(
  ( (array!77850 (arr!37569 (Array (_ BitVec 32) (_ BitVec 64))) (size!38105 (_ BitVec 32))) )
))
(declare-fun lt!544187 () array!77849)

(declare-fun minValue!944 () V!45843)

(declare-fun getCurrentListMapNoExtraKeys!5250 (array!77849 array!77847 (_ BitVec 32) (_ BitVec 32) V!45843 V!45843 (_ BitVec 32) Int) ListLongMap!17591)

(assert (=> b!1200821 (= lt!544189 (getCurrentListMapNoExtraKeys!5250 lt!544187 lt!544186 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77847)

(declare-fun dynLambda!3168 (Int (_ BitVec 64)) V!45843)

(assert (=> b!1200821 (= lt!544186 (array!77848 (store (arr!37568 _values!996) i!673 (ValueCellFull!14559 (dynLambda!3168 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38104 _values!996)))))

(declare-fun _keys!1208 () array!77849)

(declare-fun lt!544192 () ListLongMap!17591)

(assert (=> b!1200821 (= lt!544192 (getCurrentListMapNoExtraKeys!5250 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200822 () Bool)

(declare-fun res!799383 () Bool)

(declare-fun e!681933 () Bool)

(assert (=> b!1200822 (=> (not res!799383) (not e!681933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200822 (= res!799383 (validMask!0 mask!1564))))

(declare-fun b!1200823 () Bool)

(declare-fun e!681931 () Bool)

(declare-fun tp_is_empty!30537 () Bool)

(assert (=> b!1200823 (= e!681931 tp_is_empty!30537)))

(declare-fun b!1200824 () Bool)

(declare-fun e!681925 () Bool)

(declare-fun call!57328 () ListLongMap!17591)

(declare-fun call!57329 () ListLongMap!17591)

(assert (=> b!1200824 (= e!681925 (= call!57328 call!57329))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1200825 () Bool)

(declare-fun -!1785 (ListLongMap!17591 (_ BitVec 64)) ListLongMap!17591)

(assert (=> b!1200825 (= e!681925 (= call!57328 (-!1785 call!57329 k0!934)))))

(declare-fun b!1200826 () Bool)

(declare-fun e!681932 () Bool)

(assert (=> b!1200826 (= e!681932 true)))

(declare-fun lt!544191 () ListLongMap!17591)

(declare-fun contains!6870 (ListLongMap!17591 (_ BitVec 64)) Bool)

(declare-fun +!3949 (ListLongMap!17591 tuple2!19622) ListLongMap!17591)

(assert (=> b!1200826 (contains!6870 (+!3949 lt!544191 (tuple2!19623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-datatypes ((Unit!39810 0))(
  ( (Unit!39811) )
))
(declare-fun lt!544190 () Unit!39810)

(declare-fun addStillContains!976 (ListLongMap!17591 (_ BitVec 64) V!45843 (_ BitVec 64)) Unit!39810)

(assert (=> b!1200826 (= lt!544190 (addStillContains!976 lt!544191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun mapNonEmpty!47648 () Bool)

(declare-fun mapRes!47648 () Bool)

(declare-fun tp!90488 () Bool)

(declare-fun e!681928 () Bool)

(assert (=> mapNonEmpty!47648 (= mapRes!47648 (and tp!90488 e!681928))))

(declare-fun mapRest!47648 () (Array (_ BitVec 32) ValueCell!14559))

(declare-fun mapKey!47648 () (_ BitVec 32))

(declare-fun mapValue!47648 () ValueCell!14559)

(assert (=> mapNonEmpty!47648 (= (arr!37568 _values!996) (store mapRest!47648 mapKey!47648 mapValue!47648))))

(declare-fun b!1200827 () Bool)

(declare-fun res!799376 () Bool)

(assert (=> b!1200827 (=> (not res!799376) (not e!681933))))

(assert (=> b!1200827 (= res!799376 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38105 _keys!1208))))))

(declare-fun bm!57325 () Bool)

(assert (=> bm!57325 (= call!57328 (getCurrentListMapNoExtraKeys!5250 lt!544187 lt!544186 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200829 () Bool)

(assert (=> b!1200829 (= e!681928 tp_is_empty!30537)))

(declare-fun mapIsEmpty!47648 () Bool)

(assert (=> mapIsEmpty!47648 mapRes!47648))

(declare-fun b!1200830 () Bool)

(declare-fun e!681929 () Bool)

(assert (=> b!1200830 (= e!681924 e!681929)))

(declare-fun res!799381 () Bool)

(assert (=> b!1200830 (=> res!799381 e!681929)))

(assert (=> b!1200830 (= res!799381 (not (= (select (arr!37569 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1200830 e!681925))

(declare-fun c!117461 () Bool)

(assert (=> b!1200830 (= c!117461 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544185 () Unit!39810)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!992 (array!77849 array!77847 (_ BitVec 32) (_ BitVec 32) V!45843 V!45843 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39810)

(assert (=> b!1200830 (= lt!544185 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!992 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200831 () Bool)

(declare-fun res!799369 () Bool)

(assert (=> b!1200831 (=> (not res!799369) (not e!681933))))

(assert (=> b!1200831 (= res!799369 (= (select (arr!37569 _keys!1208) i!673) k0!934))))

(declare-fun b!1200832 () Bool)

(assert (=> b!1200832 (= e!681929 e!681932)))

(declare-fun res!799370 () Bool)

(assert (=> b!1200832 (=> res!799370 e!681932)))

(assert (=> b!1200832 (= res!799370 (not (contains!6870 lt!544191 k0!934)))))

(assert (=> b!1200832 (= lt!544191 (getCurrentListMapNoExtraKeys!5250 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200833 () Bool)

(declare-fun res!799371 () Bool)

(assert (=> b!1200833 (=> (not res!799371) (not e!681933))))

(declare-datatypes ((List!26441 0))(
  ( (Nil!26438) (Cons!26437 (h!27646 (_ BitVec 64)) (t!39254 List!26441)) )
))
(declare-fun arrayNoDuplicates!0 (array!77849 (_ BitVec 32) List!26441) Bool)

(assert (=> b!1200833 (= res!799371 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26438))))

(declare-fun b!1200834 () Bool)

(declare-fun res!799375 () Bool)

(assert (=> b!1200834 (=> res!799375 e!681932)))

(assert (=> b!1200834 (= res!799375 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!57326 () Bool)

(assert (=> bm!57326 (= call!57329 (getCurrentListMapNoExtraKeys!5250 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200835 () Bool)

(declare-fun e!681927 () Bool)

(assert (=> b!1200835 (= e!681933 e!681927)))

(declare-fun res!799372 () Bool)

(assert (=> b!1200835 (=> (not res!799372) (not e!681927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77849 (_ BitVec 32)) Bool)

(assert (=> b!1200835 (= res!799372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544187 mask!1564))))

(assert (=> b!1200835 (= lt!544187 (array!77850 (store (arr!37569 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38105 _keys!1208)))))

(declare-fun b!1200836 () Bool)

(declare-fun res!799382 () Bool)

(assert (=> b!1200836 (=> (not res!799382) (not e!681933))))

(assert (=> b!1200836 (= res!799382 (and (= (size!38104 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38105 _keys!1208) (size!38104 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200837 () Bool)

(assert (=> b!1200837 (= e!681927 (not e!681926))))

(declare-fun res!799379 () Bool)

(assert (=> b!1200837 (=> res!799379 e!681926)))

(assert (=> b!1200837 (= res!799379 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200837 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544188 () Unit!39810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77849 (_ BitVec 64) (_ BitVec 32)) Unit!39810)

(assert (=> b!1200837 (= lt!544188 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200828 () Bool)

(declare-fun e!681934 () Bool)

(assert (=> b!1200828 (= e!681934 (and e!681931 mapRes!47648))))

(declare-fun condMapEmpty!47648 () Bool)

(declare-fun mapDefault!47648 () ValueCell!14559)

(assert (=> b!1200828 (= condMapEmpty!47648 (= (arr!37568 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14559)) mapDefault!47648)))))

(declare-fun res!799378 () Bool)

(assert (=> start!100510 (=> (not res!799378) (not e!681933))))

(assert (=> start!100510 (= res!799378 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38105 _keys!1208))))))

(assert (=> start!100510 e!681933))

(assert (=> start!100510 tp_is_empty!30537))

(declare-fun array_inv!28630 (array!77849) Bool)

(assert (=> start!100510 (array_inv!28630 _keys!1208)))

(assert (=> start!100510 true))

(assert (=> start!100510 tp!90489))

(declare-fun array_inv!28631 (array!77847) Bool)

(assert (=> start!100510 (and (array_inv!28631 _values!996) e!681934)))

(declare-fun b!1200838 () Bool)

(declare-fun res!799380 () Bool)

(assert (=> b!1200838 (=> (not res!799380) (not e!681927))))

(assert (=> b!1200838 (= res!799380 (arrayNoDuplicates!0 lt!544187 #b00000000000000000000000000000000 Nil!26438))))

(declare-fun b!1200839 () Bool)

(declare-fun res!799374 () Bool)

(assert (=> b!1200839 (=> (not res!799374) (not e!681933))))

(assert (=> b!1200839 (= res!799374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200840 () Bool)

(declare-fun res!799373 () Bool)

(assert (=> b!1200840 (=> (not res!799373) (not e!681933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200840 (= res!799373 (validKeyInArray!0 k0!934))))

(assert (= (and start!100510 res!799378) b!1200822))

(assert (= (and b!1200822 res!799383) b!1200836))

(assert (= (and b!1200836 res!799382) b!1200839))

(assert (= (and b!1200839 res!799374) b!1200833))

(assert (= (and b!1200833 res!799371) b!1200827))

(assert (= (and b!1200827 res!799376) b!1200840))

(assert (= (and b!1200840 res!799373) b!1200831))

(assert (= (and b!1200831 res!799369) b!1200835))

(assert (= (and b!1200835 res!799372) b!1200838))

(assert (= (and b!1200838 res!799380) b!1200837))

(assert (= (and b!1200837 (not res!799379)) b!1200821))

(assert (= (and b!1200821 (not res!799377)) b!1200830))

(assert (= (and b!1200830 c!117461) b!1200825))

(assert (= (and b!1200830 (not c!117461)) b!1200824))

(assert (= (or b!1200825 b!1200824) bm!57325))

(assert (= (or b!1200825 b!1200824) bm!57326))

(assert (= (and b!1200830 (not res!799381)) b!1200832))

(assert (= (and b!1200832 (not res!799370)) b!1200834))

(assert (= (and b!1200834 (not res!799375)) b!1200826))

(assert (= (and b!1200828 condMapEmpty!47648) mapIsEmpty!47648))

(assert (= (and b!1200828 (not condMapEmpty!47648)) mapNonEmpty!47648))

(get-info :version)

(assert (= (and mapNonEmpty!47648 ((_ is ValueCellFull!14559) mapValue!47648)) b!1200829))

(assert (= (and b!1200828 ((_ is ValueCellFull!14559) mapDefault!47648)) b!1200823))

(assert (= start!100510 b!1200828))

(declare-fun b_lambda!21029 () Bool)

(assert (=> (not b_lambda!21029) (not b!1200821)))

(declare-fun t!39252 () Bool)

(declare-fun tb!10633 () Bool)

(assert (=> (and start!100510 (= defaultEntry!1004 defaultEntry!1004) t!39252) tb!10633))

(declare-fun result!21843 () Bool)

(assert (=> tb!10633 (= result!21843 tp_is_empty!30537)))

(assert (=> b!1200821 t!39252))

(declare-fun b_and!42555 () Bool)

(assert (= b_and!42553 (and (=> t!39252 result!21843) b_and!42555)))

(declare-fun m!1107051 () Bool)

(assert (=> b!1200830 m!1107051))

(declare-fun m!1107053 () Bool)

(assert (=> b!1200830 m!1107053))

(declare-fun m!1107055 () Bool)

(assert (=> bm!57326 m!1107055))

(declare-fun m!1107057 () Bool)

(assert (=> b!1200822 m!1107057))

(declare-fun m!1107059 () Bool)

(assert (=> b!1200826 m!1107059))

(assert (=> b!1200826 m!1107059))

(declare-fun m!1107061 () Bool)

(assert (=> b!1200826 m!1107061))

(declare-fun m!1107063 () Bool)

(assert (=> b!1200826 m!1107063))

(declare-fun m!1107065 () Bool)

(assert (=> b!1200831 m!1107065))

(declare-fun m!1107067 () Bool)

(assert (=> b!1200832 m!1107067))

(assert (=> b!1200832 m!1107055))

(declare-fun m!1107069 () Bool)

(assert (=> start!100510 m!1107069))

(declare-fun m!1107071 () Bool)

(assert (=> start!100510 m!1107071))

(declare-fun m!1107073 () Bool)

(assert (=> b!1200837 m!1107073))

(declare-fun m!1107075 () Bool)

(assert (=> b!1200837 m!1107075))

(declare-fun m!1107077 () Bool)

(assert (=> b!1200825 m!1107077))

(declare-fun m!1107079 () Bool)

(assert (=> b!1200838 m!1107079))

(declare-fun m!1107081 () Bool)

(assert (=> b!1200840 m!1107081))

(declare-fun m!1107083 () Bool)

(assert (=> mapNonEmpty!47648 m!1107083))

(declare-fun m!1107085 () Bool)

(assert (=> b!1200835 m!1107085))

(declare-fun m!1107087 () Bool)

(assert (=> b!1200835 m!1107087))

(declare-fun m!1107089 () Bool)

(assert (=> b!1200833 m!1107089))

(declare-fun m!1107091 () Bool)

(assert (=> b!1200821 m!1107091))

(declare-fun m!1107093 () Bool)

(assert (=> b!1200821 m!1107093))

(declare-fun m!1107095 () Bool)

(assert (=> b!1200821 m!1107095))

(declare-fun m!1107097 () Bool)

(assert (=> b!1200821 m!1107097))

(declare-fun m!1107099 () Bool)

(assert (=> bm!57325 m!1107099))

(declare-fun m!1107101 () Bool)

(assert (=> b!1200839 m!1107101))

(check-sat (not b!1200825) (not b!1200821) (not bm!57325) (not b!1200835) (not b!1200826) (not start!100510) (not b!1200838) (not mapNonEmpty!47648) (not b!1200830) (not b!1200822) b_and!42555 (not b!1200833) (not b!1200839) (not b!1200840) (not b_next!25833) (not b!1200837) (not b!1200832) tp_is_empty!30537 (not b_lambda!21029) (not bm!57326))
(check-sat b_and!42555 (not b_next!25833))
