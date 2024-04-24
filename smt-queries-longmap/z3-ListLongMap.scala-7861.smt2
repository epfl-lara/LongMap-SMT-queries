; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98146 () Bool)

(assert start!98146)

(declare-fun b_free!23611 () Bool)

(declare-fun b_next!23611 () Bool)

(assert (=> start!98146 (= b_free!23611 (not b_next!23611))))

(declare-fun tp!83537 () Bool)

(declare-fun b_and!38015 () Bool)

(assert (=> start!98146 (= tp!83537 b_and!38015)))

(declare-fun mapNonEmpty!44029 () Bool)

(declare-fun mapRes!44029 () Bool)

(declare-fun tp!83536 () Bool)

(declare-fun e!639426 () Bool)

(assert (=> mapNonEmpty!44029 (= mapRes!44029 (and tp!83536 e!639426))))

(declare-datatypes ((V!42649 0))(
  ( (V!42650 (val!14127 Int)) )
))
(declare-datatypes ((ValueCell!13361 0))(
  ( (ValueCellFull!13361 (v!16756 V!42649)) (EmptyCell!13361) )
))
(declare-fun mapRest!44029 () (Array (_ BitVec 32) ValueCell!13361))

(declare-fun mapKey!44029 () (_ BitVec 32))

(declare-datatypes ((array!73205 0))(
  ( (array!73206 (arr!35249 (Array (_ BitVec 32) ValueCell!13361)) (size!35786 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73205)

(declare-fun mapValue!44029 () ValueCell!13361)

(assert (=> mapNonEmpty!44029 (= (arr!35249 _values!996) (store mapRest!44029 mapKey!44029 mapValue!44029))))

(declare-fun zeroValue!944 () V!42649)

(declare-datatypes ((tuple2!17740 0))(
  ( (tuple2!17741 (_1!8881 (_ BitVec 64)) (_2!8881 V!42649)) )
))
(declare-datatypes ((List!24537 0))(
  ( (Nil!24534) (Cons!24533 (h!25751 tuple2!17740) (t!35132 List!24537)) )
))
(declare-datatypes ((ListLongMap!15717 0))(
  ( (ListLongMap!15718 (toList!7874 List!24537)) )
))
(declare-fun call!47183 () ListLongMap!15717)

(declare-datatypes ((array!73207 0))(
  ( (array!73208 (arr!35250 (Array (_ BitVec 32) (_ BitVec 64))) (size!35787 (_ BitVec 32))) )
))
(declare-fun lt!498908 () array!73207)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!498909 () array!73205)

(declare-fun bm!47179 () Bool)

(declare-fun minValue!944 () V!42649)

(declare-fun getCurrentListMapNoExtraKeys!4403 (array!73207 array!73205 (_ BitVec 32) (_ BitVec 32) V!42649 V!42649 (_ BitVec 32) Int) ListLongMap!15717)

(assert (=> bm!47179 (= call!47183 (getCurrentListMapNoExtraKeys!4403 lt!498908 lt!498909 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122861 () Bool)

(declare-fun res!749778 () Bool)

(declare-fun e!639419 () Bool)

(assert (=> b!1122861 (=> (not res!749778) (not e!639419))))

(declare-fun _keys!1208 () array!73207)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73207 (_ BitVec 32)) Bool)

(assert (=> b!1122861 (= res!749778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122862 () Bool)

(declare-fun e!639422 () Bool)

(declare-fun tp_is_empty!28141 () Bool)

(assert (=> b!1122862 (= e!639422 tp_is_empty!28141)))

(declare-fun b!1122863 () Bool)

(declare-fun res!749783 () Bool)

(assert (=> b!1122863 (=> (not res!749783) (not e!639419))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122863 (= res!749783 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44029 () Bool)

(assert (=> mapIsEmpty!44029 mapRes!44029))

(declare-fun b!1122865 () Bool)

(declare-fun e!639423 () Bool)

(declare-fun call!47182 () ListLongMap!15717)

(assert (=> b!1122865 (= e!639423 (= call!47183 call!47182))))

(declare-fun bm!47180 () Bool)

(assert (=> bm!47180 (= call!47182 (getCurrentListMapNoExtraKeys!4403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122866 () Bool)

(assert (=> b!1122866 (= e!639426 tp_is_empty!28141)))

(declare-fun b!1122867 () Bool)

(declare-fun e!639424 () Bool)

(assert (=> b!1122867 (= e!639424 (and e!639422 mapRes!44029))))

(declare-fun condMapEmpty!44029 () Bool)

(declare-fun mapDefault!44029 () ValueCell!13361)

(assert (=> b!1122867 (= condMapEmpty!44029 (= (arr!35249 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13361)) mapDefault!44029)))))

(declare-fun b!1122868 () Bool)

(declare-fun e!639420 () Bool)

(declare-fun e!639421 () Bool)

(assert (=> b!1122868 (= e!639420 (not e!639421))))

(declare-fun res!749784 () Bool)

(assert (=> b!1122868 (=> res!749784 e!639421)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122868 (= res!749784 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122868 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36777 0))(
  ( (Unit!36778) )
))
(declare-fun lt!498905 () Unit!36777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73207 (_ BitVec 64) (_ BitVec 32)) Unit!36777)

(assert (=> b!1122868 (= lt!498905 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122869 () Bool)

(declare-fun res!749785 () Bool)

(assert (=> b!1122869 (=> (not res!749785) (not e!639419))))

(declare-datatypes ((List!24538 0))(
  ( (Nil!24535) (Cons!24534 (h!25752 (_ BitVec 64)) (t!35133 List!24538)) )
))
(declare-fun arrayNoDuplicates!0 (array!73207 (_ BitVec 32) List!24538) Bool)

(assert (=> b!1122869 (= res!749785 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24535))))

(declare-fun b!1122870 () Bool)

(declare-fun res!749780 () Bool)

(assert (=> b!1122870 (=> (not res!749780) (not e!639419))))

(assert (=> b!1122870 (= res!749780 (= (select (arr!35250 _keys!1208) i!673) k0!934))))

(declare-fun b!1122871 () Bool)

(declare-fun res!749779 () Bool)

(assert (=> b!1122871 (=> (not res!749779) (not e!639420))))

(assert (=> b!1122871 (= res!749779 (arrayNoDuplicates!0 lt!498908 #b00000000000000000000000000000000 Nil!24535))))

(declare-fun b!1122872 () Bool)

(declare-fun res!749775 () Bool)

(assert (=> b!1122872 (=> (not res!749775) (not e!639419))))

(assert (=> b!1122872 (= res!749775 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35787 _keys!1208))))))

(declare-fun b!1122873 () Bool)

(declare-fun -!1073 (ListLongMap!15717 (_ BitVec 64)) ListLongMap!15717)

(assert (=> b!1122873 (= e!639423 (= call!47183 (-!1073 call!47182 k0!934)))))

(declare-fun b!1122874 () Bool)

(declare-fun res!749777 () Bool)

(assert (=> b!1122874 (=> (not res!749777) (not e!639419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122874 (= res!749777 (validMask!0 mask!1564))))

(declare-fun b!1122875 () Bool)

(declare-fun e!639425 () Bool)

(assert (=> b!1122875 (= e!639425 true)))

(assert (=> b!1122875 e!639423))

(declare-fun c!109817 () Bool)

(assert (=> b!1122875 (= c!109817 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498910 () Unit!36777)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!336 (array!73207 array!73205 (_ BitVec 32) (_ BitVec 32) V!42649 V!42649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36777)

(assert (=> b!1122875 (= lt!498910 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122876 () Bool)

(assert (=> b!1122876 (= e!639421 e!639425)))

(declare-fun res!749781 () Bool)

(assert (=> b!1122876 (=> res!749781 e!639425)))

(assert (=> b!1122876 (= res!749781 (not (= from!1455 i!673)))))

(declare-fun lt!498906 () ListLongMap!15717)

(assert (=> b!1122876 (= lt!498906 (getCurrentListMapNoExtraKeys!4403 lt!498908 lt!498909 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2490 (Int (_ BitVec 64)) V!42649)

(assert (=> b!1122876 (= lt!498909 (array!73206 (store (arr!35249 _values!996) i!673 (ValueCellFull!13361 (dynLambda!2490 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35786 _values!996)))))

(declare-fun lt!498907 () ListLongMap!15717)

(assert (=> b!1122876 (= lt!498907 (getCurrentListMapNoExtraKeys!4403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122877 () Bool)

(assert (=> b!1122877 (= e!639419 e!639420)))

(declare-fun res!749776 () Bool)

(assert (=> b!1122877 (=> (not res!749776) (not e!639420))))

(assert (=> b!1122877 (= res!749776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498908 mask!1564))))

(assert (=> b!1122877 (= lt!498908 (array!73208 (store (arr!35250 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35787 _keys!1208)))))

(declare-fun b!1122864 () Bool)

(declare-fun res!749782 () Bool)

(assert (=> b!1122864 (=> (not res!749782) (not e!639419))))

(assert (=> b!1122864 (= res!749782 (and (= (size!35786 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35787 _keys!1208) (size!35786 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!749774 () Bool)

(assert (=> start!98146 (=> (not res!749774) (not e!639419))))

(assert (=> start!98146 (= res!749774 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35787 _keys!1208))))))

(assert (=> start!98146 e!639419))

(assert (=> start!98146 tp_is_empty!28141))

(declare-fun array_inv!27136 (array!73207) Bool)

(assert (=> start!98146 (array_inv!27136 _keys!1208)))

(assert (=> start!98146 true))

(assert (=> start!98146 tp!83537))

(declare-fun array_inv!27137 (array!73205) Bool)

(assert (=> start!98146 (and (array_inv!27137 _values!996) e!639424)))

(assert (= (and start!98146 res!749774) b!1122874))

(assert (= (and b!1122874 res!749777) b!1122864))

(assert (= (and b!1122864 res!749782) b!1122861))

(assert (= (and b!1122861 res!749778) b!1122869))

(assert (= (and b!1122869 res!749785) b!1122872))

(assert (= (and b!1122872 res!749775) b!1122863))

(assert (= (and b!1122863 res!749783) b!1122870))

(assert (= (and b!1122870 res!749780) b!1122877))

(assert (= (and b!1122877 res!749776) b!1122871))

(assert (= (and b!1122871 res!749779) b!1122868))

(assert (= (and b!1122868 (not res!749784)) b!1122876))

(assert (= (and b!1122876 (not res!749781)) b!1122875))

(assert (= (and b!1122875 c!109817) b!1122873))

(assert (= (and b!1122875 (not c!109817)) b!1122865))

(assert (= (or b!1122873 b!1122865) bm!47179))

(assert (= (or b!1122873 b!1122865) bm!47180))

(assert (= (and b!1122867 condMapEmpty!44029) mapIsEmpty!44029))

(assert (= (and b!1122867 (not condMapEmpty!44029)) mapNonEmpty!44029))

(get-info :version)

(assert (= (and mapNonEmpty!44029 ((_ is ValueCellFull!13361) mapValue!44029)) b!1122866))

(assert (= (and b!1122867 ((_ is ValueCellFull!13361) mapDefault!44029)) b!1122862))

(assert (= start!98146 b!1122867))

(declare-fun b_lambda!18591 () Bool)

(assert (=> (not b_lambda!18591) (not b!1122876)))

(declare-fun t!35131 () Bool)

(declare-fun tb!8415 () Bool)

(assert (=> (and start!98146 (= defaultEntry!1004 defaultEntry!1004) t!35131) tb!8415))

(declare-fun result!17399 () Bool)

(assert (=> tb!8415 (= result!17399 tp_is_empty!28141)))

(assert (=> b!1122876 t!35131))

(declare-fun b_and!38017 () Bool)

(assert (= b_and!38015 (and (=> t!35131 result!17399) b_and!38017)))

(declare-fun m!1038027 () Bool)

(assert (=> b!1122875 m!1038027))

(declare-fun m!1038029 () Bool)

(assert (=> b!1122876 m!1038029))

(declare-fun m!1038031 () Bool)

(assert (=> b!1122876 m!1038031))

(declare-fun m!1038033 () Bool)

(assert (=> b!1122876 m!1038033))

(declare-fun m!1038035 () Bool)

(assert (=> b!1122876 m!1038035))

(declare-fun m!1038037 () Bool)

(assert (=> mapNonEmpty!44029 m!1038037))

(declare-fun m!1038039 () Bool)

(assert (=> b!1122874 m!1038039))

(declare-fun m!1038041 () Bool)

(assert (=> b!1122869 m!1038041))

(declare-fun m!1038043 () Bool)

(assert (=> b!1122871 m!1038043))

(declare-fun m!1038045 () Bool)

(assert (=> start!98146 m!1038045))

(declare-fun m!1038047 () Bool)

(assert (=> start!98146 m!1038047))

(declare-fun m!1038049 () Bool)

(assert (=> b!1122868 m!1038049))

(declare-fun m!1038051 () Bool)

(assert (=> b!1122868 m!1038051))

(declare-fun m!1038053 () Bool)

(assert (=> b!1122873 m!1038053))

(declare-fun m!1038055 () Bool)

(assert (=> b!1122861 m!1038055))

(declare-fun m!1038057 () Bool)

(assert (=> b!1122870 m!1038057))

(declare-fun m!1038059 () Bool)

(assert (=> b!1122877 m!1038059))

(declare-fun m!1038061 () Bool)

(assert (=> b!1122877 m!1038061))

(declare-fun m!1038063 () Bool)

(assert (=> bm!47180 m!1038063))

(declare-fun m!1038065 () Bool)

(assert (=> bm!47179 m!1038065))

(declare-fun m!1038067 () Bool)

(assert (=> b!1122863 m!1038067))

(check-sat (not b!1122871) (not bm!47179) (not b!1122877) b_and!38017 (not b!1122863) (not b!1122869) (not b_next!23611) (not b!1122873) (not mapNonEmpty!44029) (not b!1122875) (not start!98146) (not b!1122874) (not b!1122861) (not bm!47180) (not b!1122876) tp_is_empty!28141 (not b!1122868) (not b_lambda!18591))
(check-sat b_and!38017 (not b_next!23611))
