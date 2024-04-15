; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98024 () Bool)

(assert start!98024)

(declare-fun b_free!23731 () Bool)

(declare-fun b_next!23731 () Bool)

(assert (=> start!98024 (= b_free!23731 (not b_next!23731))))

(declare-fun tp!83897 () Bool)

(declare-fun b_and!38223 () Bool)

(assert (=> start!98024 (= tp!83897 b_and!38223)))

(declare-fun mapIsEmpty!44209 () Bool)

(declare-fun mapRes!44209 () Bool)

(assert (=> mapIsEmpty!44209 mapRes!44209))

(declare-fun b!1124879 () Bool)

(declare-fun e!640326 () Bool)

(declare-fun e!640327 () Bool)

(assert (=> b!1124879 (= e!640326 e!640327)))

(declare-fun res!751639 () Bool)

(assert (=> b!1124879 (=> res!751639 e!640327)))

(declare-datatypes ((array!73312 0))(
  ( (array!73313 (arr!35309 (Array (_ BitVec 32) (_ BitVec 64))) (size!35847 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73312)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1124879 (= res!751639 (not (= (select (arr!35309 _keys!1208) from!1455) k0!934)))))

(declare-fun e!640331 () Bool)

(assert (=> b!1124879 e!640331))

(declare-fun c!109560 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124879 (= c!109560 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42809 0))(
  ( (V!42810 (val!14187 Int)) )
))
(declare-fun zeroValue!944 () V!42809)

(declare-datatypes ((Unit!36723 0))(
  ( (Unit!36724) )
))
(declare-fun lt!499484 () Unit!36723)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13421 0))(
  ( (ValueCellFull!13421 (v!16819 V!42809)) (EmptyCell!13421) )
))
(declare-datatypes ((array!73314 0))(
  ( (array!73315 (arr!35310 (Array (_ BitVec 32) ValueCell!13421)) (size!35848 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73314)

(declare-fun minValue!944 () V!42809)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!368 (array!73312 array!73314 (_ BitVec 32) (_ BitVec 32) V!42809 V!42809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36723)

(assert (=> b!1124879 (= lt!499484 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!499483 () array!73314)

(declare-fun lt!499488 () array!73312)

(declare-fun bm!47449 () Bool)

(declare-datatypes ((tuple2!17914 0))(
  ( (tuple2!17915 (_1!8968 (_ BitVec 64)) (_2!8968 V!42809)) )
))
(declare-datatypes ((List!24676 0))(
  ( (Nil!24673) (Cons!24672 (h!25881 tuple2!17914) (t!35390 List!24676)) )
))
(declare-datatypes ((ListLongMap!15883 0))(
  ( (ListLongMap!15884 (toList!7957 List!24676)) )
))
(declare-fun call!47452 () ListLongMap!15883)

(declare-fun getCurrentListMapNoExtraKeys!4462 (array!73312 array!73314 (_ BitVec 32) (_ BitVec 32) V!42809 V!42809 (_ BitVec 32) Int) ListLongMap!15883)

(assert (=> bm!47449 (= call!47452 (getCurrentListMapNoExtraKeys!4462 lt!499488 lt!499483 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124880 () Bool)

(declare-fun e!640322 () Bool)

(declare-fun e!640323 () Bool)

(assert (=> b!1124880 (= e!640322 e!640323)))

(declare-fun res!751649 () Bool)

(assert (=> b!1124880 (=> (not res!751649) (not e!640323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73312 (_ BitVec 32)) Bool)

(assert (=> b!1124880 (= res!751649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499488 mask!1564))))

(assert (=> b!1124880 (= lt!499488 (array!73313 (store (arr!35309 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35847 _keys!1208)))))

(declare-fun b!1124881 () Bool)

(declare-fun res!751643 () Bool)

(declare-fun e!640325 () Bool)

(assert (=> b!1124881 (=> res!751643 e!640325)))

(assert (=> b!1124881 (= res!751643 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!44209 () Bool)

(declare-fun tp!83896 () Bool)

(declare-fun e!640330 () Bool)

(assert (=> mapNonEmpty!44209 (= mapRes!44209 (and tp!83896 e!640330))))

(declare-fun mapValue!44209 () ValueCell!13421)

(declare-fun mapKey!44209 () (_ BitVec 32))

(declare-fun mapRest!44209 () (Array (_ BitVec 32) ValueCell!13421))

(assert (=> mapNonEmpty!44209 (= (arr!35310 _values!996) (store mapRest!44209 mapKey!44209 mapValue!44209))))

(declare-fun b!1124882 () Bool)

(declare-fun res!751645 () Bool)

(assert (=> b!1124882 (=> (not res!751645) (not e!640323))))

(declare-datatypes ((List!24677 0))(
  ( (Nil!24674) (Cons!24673 (h!25882 (_ BitVec 64)) (t!35391 List!24677)) )
))
(declare-fun arrayNoDuplicates!0 (array!73312 (_ BitVec 32) List!24677) Bool)

(assert (=> b!1124882 (= res!751645 (arrayNoDuplicates!0 lt!499488 #b00000000000000000000000000000000 Nil!24674))))

(declare-fun b!1124883 () Bool)

(assert (=> b!1124883 (= e!640327 e!640325)))

(declare-fun res!751637 () Bool)

(assert (=> b!1124883 (=> res!751637 e!640325)))

(declare-fun lt!499487 () ListLongMap!15883)

(declare-fun contains!6427 (ListLongMap!15883 (_ BitVec 64)) Bool)

(assert (=> b!1124883 (= res!751637 (not (contains!6427 lt!499487 k0!934)))))

(assert (=> b!1124883 (= lt!499487 (getCurrentListMapNoExtraKeys!4462 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124884 () Bool)

(declare-fun res!751651 () Bool)

(assert (=> b!1124884 (=> (not res!751651) (not e!640322))))

(assert (=> b!1124884 (= res!751651 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35847 _keys!1208))))))

(declare-fun b!1124885 () Bool)

(declare-fun e!640329 () Bool)

(assert (=> b!1124885 (= e!640329 e!640326)))

(declare-fun res!751641 () Bool)

(assert (=> b!1124885 (=> res!751641 e!640326)))

(assert (=> b!1124885 (= res!751641 (not (= from!1455 i!673)))))

(declare-fun lt!499482 () ListLongMap!15883)

(assert (=> b!1124885 (= lt!499482 (getCurrentListMapNoExtraKeys!4462 lt!499488 lt!499483 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2485 (Int (_ BitVec 64)) V!42809)

(assert (=> b!1124885 (= lt!499483 (array!73315 (store (arr!35310 _values!996) i!673 (ValueCellFull!13421 (dynLambda!2485 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35848 _values!996)))))

(declare-fun lt!499485 () ListLongMap!15883)

(assert (=> b!1124885 (= lt!499485 (getCurrentListMapNoExtraKeys!4462 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124887 () Bool)

(assert (=> b!1124887 (= e!640323 (not e!640329))))

(declare-fun res!751644 () Bool)

(assert (=> b!1124887 (=> res!751644 e!640329)))

(assert (=> b!1124887 (= res!751644 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124887 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499481 () Unit!36723)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73312 (_ BitVec 64) (_ BitVec 32)) Unit!36723)

(assert (=> b!1124887 (= lt!499481 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1124888 () Bool)

(declare-fun call!47453 () ListLongMap!15883)

(assert (=> b!1124888 (= e!640331 (= call!47452 call!47453))))

(declare-fun b!1124889 () Bool)

(declare-fun res!751642 () Bool)

(assert (=> b!1124889 (=> (not res!751642) (not e!640322))))

(assert (=> b!1124889 (= res!751642 (and (= (size!35848 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35847 _keys!1208) (size!35848 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124890 () Bool)

(declare-fun -!1091 (ListLongMap!15883 (_ BitVec 64)) ListLongMap!15883)

(assert (=> b!1124890 (= e!640331 (= call!47452 (-!1091 call!47453 k0!934)))))

(declare-fun b!1124891 () Bool)

(declare-fun tp_is_empty!28261 () Bool)

(assert (=> b!1124891 (= e!640330 tp_is_empty!28261)))

(declare-fun b!1124892 () Bool)

(assert (=> b!1124892 (= e!640325 true)))

(declare-fun +!3458 (ListLongMap!15883 tuple2!17914) ListLongMap!15883)

(assert (=> b!1124892 (contains!6427 (+!3458 lt!499487 (tuple2!17915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499486 () Unit!36723)

(declare-fun addStillContains!676 (ListLongMap!15883 (_ BitVec 64) V!42809 (_ BitVec 64)) Unit!36723)

(assert (=> b!1124892 (= lt!499486 (addStillContains!676 lt!499487 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1124893 () Bool)

(declare-fun res!751638 () Bool)

(assert (=> b!1124893 (=> (not res!751638) (not e!640322))))

(assert (=> b!1124893 (= res!751638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47450 () Bool)

(assert (=> bm!47450 (= call!47453 (getCurrentListMapNoExtraKeys!4462 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124894 () Bool)

(declare-fun res!751640 () Bool)

(assert (=> b!1124894 (=> (not res!751640) (not e!640322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124894 (= res!751640 (validKeyInArray!0 k0!934))))

(declare-fun b!1124895 () Bool)

(declare-fun res!751646 () Bool)

(assert (=> b!1124895 (=> (not res!751646) (not e!640322))))

(assert (=> b!1124895 (= res!751646 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24674))))

(declare-fun b!1124896 () Bool)

(declare-fun e!640324 () Bool)

(assert (=> b!1124896 (= e!640324 tp_is_empty!28261)))

(declare-fun b!1124886 () Bool)

(declare-fun e!640332 () Bool)

(assert (=> b!1124886 (= e!640332 (and e!640324 mapRes!44209))))

(declare-fun condMapEmpty!44209 () Bool)

(declare-fun mapDefault!44209 () ValueCell!13421)

(assert (=> b!1124886 (= condMapEmpty!44209 (= (arr!35310 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13421)) mapDefault!44209)))))

(declare-fun res!751650 () Bool)

(assert (=> start!98024 (=> (not res!751650) (not e!640322))))

(assert (=> start!98024 (= res!751650 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35847 _keys!1208))))))

(assert (=> start!98024 e!640322))

(assert (=> start!98024 tp_is_empty!28261))

(declare-fun array_inv!27176 (array!73312) Bool)

(assert (=> start!98024 (array_inv!27176 _keys!1208)))

(assert (=> start!98024 true))

(assert (=> start!98024 tp!83897))

(declare-fun array_inv!27177 (array!73314) Bool)

(assert (=> start!98024 (and (array_inv!27177 _values!996) e!640332)))

(declare-fun b!1124897 () Bool)

(declare-fun res!751648 () Bool)

(assert (=> b!1124897 (=> (not res!751648) (not e!640322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124897 (= res!751648 (validMask!0 mask!1564))))

(declare-fun b!1124898 () Bool)

(declare-fun res!751647 () Bool)

(assert (=> b!1124898 (=> (not res!751647) (not e!640322))))

(assert (=> b!1124898 (= res!751647 (= (select (arr!35309 _keys!1208) i!673) k0!934))))

(assert (= (and start!98024 res!751650) b!1124897))

(assert (= (and b!1124897 res!751648) b!1124889))

(assert (= (and b!1124889 res!751642) b!1124893))

(assert (= (and b!1124893 res!751638) b!1124895))

(assert (= (and b!1124895 res!751646) b!1124884))

(assert (= (and b!1124884 res!751651) b!1124894))

(assert (= (and b!1124894 res!751640) b!1124898))

(assert (= (and b!1124898 res!751647) b!1124880))

(assert (= (and b!1124880 res!751649) b!1124882))

(assert (= (and b!1124882 res!751645) b!1124887))

(assert (= (and b!1124887 (not res!751644)) b!1124885))

(assert (= (and b!1124885 (not res!751641)) b!1124879))

(assert (= (and b!1124879 c!109560) b!1124890))

(assert (= (and b!1124879 (not c!109560)) b!1124888))

(assert (= (or b!1124890 b!1124888) bm!47450))

(assert (= (or b!1124890 b!1124888) bm!47449))

(assert (= (and b!1124879 (not res!751639)) b!1124883))

(assert (= (and b!1124883 (not res!751637)) b!1124881))

(assert (= (and b!1124881 (not res!751643)) b!1124892))

(assert (= (and b!1124886 condMapEmpty!44209) mapIsEmpty!44209))

(assert (= (and b!1124886 (not condMapEmpty!44209)) mapNonEmpty!44209))

(get-info :version)

(assert (= (and mapNonEmpty!44209 ((_ is ValueCellFull!13421) mapValue!44209)) b!1124891))

(assert (= (and b!1124886 ((_ is ValueCellFull!13421) mapDefault!44209)) b!1124896))

(assert (= start!98024 b!1124886))

(declare-fun b_lambda!18683 () Bool)

(assert (=> (not b_lambda!18683) (not b!1124885)))

(declare-fun t!35389 () Bool)

(declare-fun tb!8535 () Bool)

(assert (=> (and start!98024 (= defaultEntry!1004 defaultEntry!1004) t!35389) tb!8535))

(declare-fun result!17639 () Bool)

(assert (=> tb!8535 (= result!17639 tp_is_empty!28261)))

(assert (=> b!1124885 t!35389))

(declare-fun b_and!38225 () Bool)

(assert (= b_and!38223 (and (=> t!35389 result!17639) b_and!38225)))

(declare-fun m!1038585 () Bool)

(assert (=> b!1124880 m!1038585))

(declare-fun m!1038587 () Bool)

(assert (=> b!1124880 m!1038587))

(declare-fun m!1038589 () Bool)

(assert (=> b!1124890 m!1038589))

(declare-fun m!1038591 () Bool)

(assert (=> b!1124898 m!1038591))

(declare-fun m!1038593 () Bool)

(assert (=> b!1124887 m!1038593))

(declare-fun m!1038595 () Bool)

(assert (=> b!1124887 m!1038595))

(declare-fun m!1038597 () Bool)

(assert (=> bm!47450 m!1038597))

(declare-fun m!1038599 () Bool)

(assert (=> mapNonEmpty!44209 m!1038599))

(declare-fun m!1038601 () Bool)

(assert (=> b!1124882 m!1038601))

(declare-fun m!1038603 () Bool)

(assert (=> start!98024 m!1038603))

(declare-fun m!1038605 () Bool)

(assert (=> start!98024 m!1038605))

(declare-fun m!1038607 () Bool)

(assert (=> b!1124894 m!1038607))

(declare-fun m!1038609 () Bool)

(assert (=> b!1124883 m!1038609))

(assert (=> b!1124883 m!1038597))

(declare-fun m!1038611 () Bool)

(assert (=> b!1124897 m!1038611))

(declare-fun m!1038613 () Bool)

(assert (=> b!1124892 m!1038613))

(assert (=> b!1124892 m!1038613))

(declare-fun m!1038615 () Bool)

(assert (=> b!1124892 m!1038615))

(declare-fun m!1038617 () Bool)

(assert (=> b!1124892 m!1038617))

(declare-fun m!1038619 () Bool)

(assert (=> b!1124879 m!1038619))

(declare-fun m!1038621 () Bool)

(assert (=> b!1124879 m!1038621))

(declare-fun m!1038623 () Bool)

(assert (=> b!1124895 m!1038623))

(declare-fun m!1038625 () Bool)

(assert (=> bm!47449 m!1038625))

(declare-fun m!1038627 () Bool)

(assert (=> b!1124893 m!1038627))

(declare-fun m!1038629 () Bool)

(assert (=> b!1124885 m!1038629))

(declare-fun m!1038631 () Bool)

(assert (=> b!1124885 m!1038631))

(declare-fun m!1038633 () Bool)

(assert (=> b!1124885 m!1038633))

(declare-fun m!1038635 () Bool)

(assert (=> b!1124885 m!1038635))

(check-sat (not b!1124883) tp_is_empty!28261 (not b!1124895) (not b!1124894) (not b!1124897) (not mapNonEmpty!44209) (not b!1124890) (not b!1124882) (not start!98024) (not b_lambda!18683) (not b!1124893) (not b!1124880) (not bm!47449) (not b!1124885) (not b!1124879) b_and!38225 (not b!1124892) (not bm!47450) (not b_next!23731) (not b!1124887))
(check-sat b_and!38225 (not b_next!23731))
