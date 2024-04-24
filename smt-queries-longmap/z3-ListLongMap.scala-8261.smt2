; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100750 () Bool)

(assert start!100750)

(declare-fun b_free!25837 () Bool)

(declare-fun b_next!25837 () Bool)

(assert (=> start!100750 (= b_free!25837 (not b_next!25837))))

(declare-fun tp!90500 () Bool)

(declare-fun b_and!42563 () Bool)

(assert (=> start!100750 (= tp!90500 b_and!42563)))

(declare-datatypes ((V!45849 0))(
  ( (V!45850 (val!15327 Int)) )
))
(declare-fun zeroValue!944 () V!45849)

(declare-datatypes ((array!77893 0))(
  ( (array!77894 (arr!37585 (Array (_ BitVec 32) (_ BitVec 64))) (size!38122 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77893)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19644 0))(
  ( (tuple2!19645 (_1!9833 (_ BitVec 64)) (_2!9833 V!45849)) )
))
(declare-datatypes ((List!26459 0))(
  ( (Nil!26456) (Cons!26455 (h!27673 tuple2!19644) (t!39268 List!26459)) )
))
(declare-datatypes ((ListLongMap!17621 0))(
  ( (ListLongMap!17622 (toList!8826 List!26459)) )
))
(declare-fun call!57405 () ListLongMap!17621)

(declare-fun bm!57402 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14561 0))(
  ( (ValueCellFull!14561 (v!17961 V!45849)) (EmptyCell!14561) )
))
(declare-datatypes ((array!77895 0))(
  ( (array!77896 (arr!37586 (Array (_ BitVec 32) ValueCell!14561)) (size!38123 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77895)

(declare-fun minValue!944 () V!45849)

(declare-fun getCurrentListMapNoExtraKeys!5293 (array!77893 array!77895 (_ BitVec 32) (_ BitVec 32) V!45849 V!45849 (_ BitVec 32) Int) ListLongMap!17621)

(assert (=> bm!57402 (= call!57405 (getCurrentListMapNoExtraKeys!5293 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!799967 () Bool)

(declare-fun e!682824 () Bool)

(assert (=> start!100750 (=> (not res!799967) (not e!682824))))

(assert (=> start!100750 (= res!799967 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38122 _keys!1208))))))

(assert (=> start!100750 e!682824))

(declare-fun tp_is_empty!30541 () Bool)

(assert (=> start!100750 tp_is_empty!30541))

(declare-fun array_inv!28708 (array!77893) Bool)

(assert (=> start!100750 (array_inv!28708 _keys!1208)))

(assert (=> start!100750 true))

(assert (=> start!100750 tp!90500))

(declare-fun e!682823 () Bool)

(declare-fun array_inv!28709 (array!77895) Bool)

(assert (=> start!100750 (and (array_inv!28709 _values!996) e!682823)))

(declare-fun b!1202230 () Bool)

(declare-fun res!799966 () Bool)

(assert (=> b!1202230 (=> (not res!799966) (not e!682824))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202230 (= res!799966 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38122 _keys!1208))))))

(declare-fun b!1202231 () Bool)

(declare-fun e!682820 () Bool)

(declare-fun e!682825 () Bool)

(assert (=> b!1202231 (= e!682820 e!682825)))

(declare-fun res!799971 () Bool)

(assert (=> b!1202231 (=> res!799971 e!682825)))

(assert (=> b!1202231 (= res!799971 (not (= from!1455 i!673)))))

(declare-fun lt!544717 () ListLongMap!17621)

(declare-fun lt!544715 () array!77893)

(declare-fun lt!544721 () array!77895)

(assert (=> b!1202231 (= lt!544717 (getCurrentListMapNoExtraKeys!5293 lt!544715 lt!544721 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3234 (Int (_ BitVec 64)) V!45849)

(assert (=> b!1202231 (= lt!544721 (array!77896 (store (arr!37586 _values!996) i!673 (ValueCellFull!14561 (dynLambda!3234 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38123 _values!996)))))

(declare-fun lt!544720 () ListLongMap!17621)

(assert (=> b!1202231 (= lt!544720 (getCurrentListMapNoExtraKeys!5293 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202232 () Bool)

(declare-fun e!682829 () Bool)

(declare-fun call!57406 () ListLongMap!17621)

(assert (=> b!1202232 (= e!682829 (= call!57406 call!57405))))

(declare-fun mapIsEmpty!47654 () Bool)

(declare-fun mapRes!47654 () Bool)

(assert (=> mapIsEmpty!47654 mapRes!47654))

(declare-fun b!1202233 () Bool)

(declare-fun res!799968 () Bool)

(assert (=> b!1202233 (=> (not res!799968) (not e!682824))))

(declare-datatypes ((List!26460 0))(
  ( (Nil!26457) (Cons!26456 (h!27674 (_ BitVec 64)) (t!39269 List!26460)) )
))
(declare-fun arrayNoDuplicates!0 (array!77893 (_ BitVec 32) List!26460) Bool)

(assert (=> b!1202233 (= res!799968 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26457))))

(declare-fun b!1202234 () Bool)

(declare-fun res!799972 () Bool)

(assert (=> b!1202234 (=> (not res!799972) (not e!682824))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202234 (= res!799972 (validKeyInArray!0 k0!934))))

(declare-fun b!1202235 () Bool)

(declare-fun res!799964 () Bool)

(assert (=> b!1202235 (=> (not res!799964) (not e!682824))))

(assert (=> b!1202235 (= res!799964 (and (= (size!38123 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38122 _keys!1208) (size!38123 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202236 () Bool)

(declare-fun res!799973 () Bool)

(assert (=> b!1202236 (=> (not res!799973) (not e!682824))))

(assert (=> b!1202236 (= res!799973 (= (select (arr!37585 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47654 () Bool)

(declare-fun tp!90501 () Bool)

(declare-fun e!682821 () Bool)

(assert (=> mapNonEmpty!47654 (= mapRes!47654 (and tp!90501 e!682821))))

(declare-fun mapValue!47654 () ValueCell!14561)

(declare-fun mapRest!47654 () (Array (_ BitVec 32) ValueCell!14561))

(declare-fun mapKey!47654 () (_ BitVec 32))

(assert (=> mapNonEmpty!47654 (= (arr!37586 _values!996) (store mapRest!47654 mapKey!47654 mapValue!47654))))

(declare-fun b!1202237 () Bool)

(declare-fun res!799969 () Bool)

(assert (=> b!1202237 (=> (not res!799969) (not e!682824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202237 (= res!799969 (validMask!0 mask!1564))))

(declare-fun b!1202238 () Bool)

(declare-fun res!799974 () Bool)

(assert (=> b!1202238 (=> (not res!799974) (not e!682824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77893 (_ BitVec 32)) Bool)

(assert (=> b!1202238 (= res!799974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202239 () Bool)

(declare-fun e!682826 () Bool)

(assert (=> b!1202239 (= e!682826 (not e!682820))))

(declare-fun res!799965 () Bool)

(assert (=> b!1202239 (=> res!799965 e!682820)))

(assert (=> b!1202239 (= res!799965 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202239 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39777 0))(
  ( (Unit!39778) )
))
(declare-fun lt!544718 () Unit!39777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77893 (_ BitVec 64) (_ BitVec 32)) Unit!39777)

(assert (=> b!1202239 (= lt!544718 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202240 () Bool)

(declare-fun -!1784 (ListLongMap!17621 (_ BitVec 64)) ListLongMap!17621)

(assert (=> b!1202240 (= e!682829 (= call!57406 (-!1784 call!57405 k0!934)))))

(declare-fun b!1202241 () Bool)

(declare-fun e!682828 () Bool)

(assert (=> b!1202241 (= e!682823 (and e!682828 mapRes!47654))))

(declare-fun condMapEmpty!47654 () Bool)

(declare-fun mapDefault!47654 () ValueCell!14561)

(assert (=> b!1202241 (= condMapEmpty!47654 (= (arr!37586 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14561)) mapDefault!47654)))))

(declare-fun b!1202242 () Bool)

(assert (=> b!1202242 (= e!682824 e!682826)))

(declare-fun res!799975 () Bool)

(assert (=> b!1202242 (=> (not res!799975) (not e!682826))))

(assert (=> b!1202242 (= res!799975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544715 mask!1564))))

(assert (=> b!1202242 (= lt!544715 (array!77894 (store (arr!37585 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38122 _keys!1208)))))

(declare-fun b!1202243 () Bool)

(declare-fun e!682827 () Bool)

(assert (=> b!1202243 (= e!682825 e!682827)))

(declare-fun res!799963 () Bool)

(assert (=> b!1202243 (=> res!799963 e!682827)))

(assert (=> b!1202243 (= res!799963 (not (= (select (arr!37585 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1202243 e!682829))

(declare-fun c!117865 () Bool)

(assert (=> b!1202243 (= c!117865 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544719 () Unit!39777)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1003 (array!77893 array!77895 (_ BitVec 32) (_ BitVec 32) V!45849 V!45849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39777)

(assert (=> b!1202243 (= lt!544719 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1003 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202244 () Bool)

(declare-fun res!799970 () Bool)

(assert (=> b!1202244 (=> (not res!799970) (not e!682826))))

(assert (=> b!1202244 (= res!799970 (arrayNoDuplicates!0 lt!544715 #b00000000000000000000000000000000 Nil!26457))))

(declare-fun b!1202245 () Bool)

(assert (=> b!1202245 (= e!682827 true)))

(declare-fun lt!544716 () Bool)

(declare-fun contains!6905 (ListLongMap!17621 (_ BitVec 64)) Bool)

(assert (=> b!1202245 (= lt!544716 (contains!6905 (getCurrentListMapNoExtraKeys!5293 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1202246 () Bool)

(assert (=> b!1202246 (= e!682821 tp_is_empty!30541)))

(declare-fun bm!57403 () Bool)

(assert (=> bm!57403 (= call!57406 (getCurrentListMapNoExtraKeys!5293 lt!544715 lt!544721 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202247 () Bool)

(assert (=> b!1202247 (= e!682828 tp_is_empty!30541)))

(assert (= (and start!100750 res!799967) b!1202237))

(assert (= (and b!1202237 res!799969) b!1202235))

(assert (= (and b!1202235 res!799964) b!1202238))

(assert (= (and b!1202238 res!799974) b!1202233))

(assert (= (and b!1202233 res!799968) b!1202230))

(assert (= (and b!1202230 res!799966) b!1202234))

(assert (= (and b!1202234 res!799972) b!1202236))

(assert (= (and b!1202236 res!799973) b!1202242))

(assert (= (and b!1202242 res!799975) b!1202244))

(assert (= (and b!1202244 res!799970) b!1202239))

(assert (= (and b!1202239 (not res!799965)) b!1202231))

(assert (= (and b!1202231 (not res!799971)) b!1202243))

(assert (= (and b!1202243 c!117865) b!1202240))

(assert (= (and b!1202243 (not c!117865)) b!1202232))

(assert (= (or b!1202240 b!1202232) bm!57402))

(assert (= (or b!1202240 b!1202232) bm!57403))

(assert (= (and b!1202243 (not res!799963)) b!1202245))

(assert (= (and b!1202241 condMapEmpty!47654) mapIsEmpty!47654))

(assert (= (and b!1202241 (not condMapEmpty!47654)) mapNonEmpty!47654))

(get-info :version)

(assert (= (and mapNonEmpty!47654 ((_ is ValueCellFull!14561) mapValue!47654)) b!1202246))

(assert (= (and b!1202241 ((_ is ValueCellFull!14561) mapDefault!47654)) b!1202247))

(assert (= start!100750 b!1202241))

(declare-fun b_lambda!21027 () Bool)

(assert (=> (not b_lambda!21027) (not b!1202231)))

(declare-fun t!39267 () Bool)

(declare-fun tb!10629 () Bool)

(assert (=> (and start!100750 (= defaultEntry!1004 defaultEntry!1004) t!39267) tb!10629))

(declare-fun result!21843 () Bool)

(assert (=> tb!10629 (= result!21843 tp_is_empty!30541)))

(assert (=> b!1202231 t!39267))

(declare-fun b_and!42565 () Bool)

(assert (= b_and!42563 (and (=> t!39267 result!21843) b_and!42565)))

(declare-fun m!1108727 () Bool)

(assert (=> b!1202238 m!1108727))

(declare-fun m!1108729 () Bool)

(assert (=> b!1202244 m!1108729))

(declare-fun m!1108731 () Bool)

(assert (=> mapNonEmpty!47654 m!1108731))

(declare-fun m!1108733 () Bool)

(assert (=> bm!57403 m!1108733))

(declare-fun m!1108735 () Bool)

(assert (=> b!1202234 m!1108735))

(declare-fun m!1108737 () Bool)

(assert (=> start!100750 m!1108737))

(declare-fun m!1108739 () Bool)

(assert (=> start!100750 m!1108739))

(declare-fun m!1108741 () Bool)

(assert (=> b!1202236 m!1108741))

(declare-fun m!1108743 () Bool)

(assert (=> b!1202233 m!1108743))

(declare-fun m!1108745 () Bool)

(assert (=> b!1202242 m!1108745))

(declare-fun m!1108747 () Bool)

(assert (=> b!1202242 m!1108747))

(declare-fun m!1108749 () Bool)

(assert (=> b!1202243 m!1108749))

(declare-fun m!1108751 () Bool)

(assert (=> b!1202243 m!1108751))

(declare-fun m!1108753 () Bool)

(assert (=> b!1202231 m!1108753))

(declare-fun m!1108755 () Bool)

(assert (=> b!1202231 m!1108755))

(declare-fun m!1108757 () Bool)

(assert (=> b!1202231 m!1108757))

(declare-fun m!1108759 () Bool)

(assert (=> b!1202231 m!1108759))

(declare-fun m!1108761 () Bool)

(assert (=> b!1202245 m!1108761))

(assert (=> b!1202245 m!1108761))

(declare-fun m!1108763 () Bool)

(assert (=> b!1202245 m!1108763))

(declare-fun m!1108765 () Bool)

(assert (=> b!1202239 m!1108765))

(declare-fun m!1108767 () Bool)

(assert (=> b!1202239 m!1108767))

(assert (=> bm!57402 m!1108761))

(declare-fun m!1108769 () Bool)

(assert (=> b!1202240 m!1108769))

(declare-fun m!1108771 () Bool)

(assert (=> b!1202237 m!1108771))

(check-sat b_and!42565 (not b!1202245) (not b_next!25837) (not b!1202244) (not mapNonEmpty!47654) (not b!1202231) (not b!1202239) (not start!100750) (not b!1202233) (not bm!57402) (not b!1202242) (not b!1202238) (not b!1202237) (not b!1202243) (not b!1202234) tp_is_empty!30541 (not bm!57403) (not b!1202240) (not b_lambda!21027))
(check-sat b_and!42565 (not b_next!25837))
