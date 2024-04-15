; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97922 () Bool)

(assert start!97922)

(declare-fun b_free!23629 () Bool)

(declare-fun b_next!23629 () Bool)

(assert (=> start!97922 (= b_free!23629 (not b_next!23629))))

(declare-fun tp!83591 () Bool)

(declare-fun b_and!38019 () Bool)

(assert (=> start!97922 (= tp!83591 b_and!38019)))

(declare-datatypes ((V!42673 0))(
  ( (V!42674 (val!14136 Int)) )
))
(declare-datatypes ((tuple2!17812 0))(
  ( (tuple2!17813 (_1!8917 (_ BitVec 64)) (_2!8917 V!42673)) )
))
(declare-datatypes ((List!24583 0))(
  ( (Nil!24580) (Cons!24579 (h!25788 tuple2!17812) (t!35195 List!24583)) )
))
(declare-datatypes ((ListLongMap!15781 0))(
  ( (ListLongMap!15782 (toList!7906 List!24583)) )
))
(declare-fun call!47146 () ListLongMap!15781)

(declare-fun call!47147 () ListLongMap!15781)

(declare-fun b!1121884 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!638729 () Bool)

(declare-fun -!1057 (ListLongMap!15781 (_ BitVec 64)) ListLongMap!15781)

(assert (=> b!1121884 (= e!638729 (= call!47147 (-!1057 call!47146 k0!934)))))

(declare-fun b!1121885 () Bool)

(declare-fun res!749512 () Bool)

(declare-fun e!638731 () Bool)

(assert (=> b!1121885 (=> (not res!749512) (not e!638731))))

(declare-datatypes ((array!73110 0))(
  ( (array!73111 (arr!35208 (Array (_ BitVec 32) (_ BitVec 64))) (size!35746 (_ BitVec 32))) )
))
(declare-fun lt!498357 () array!73110)

(declare-datatypes ((List!24584 0))(
  ( (Nil!24581) (Cons!24580 (h!25789 (_ BitVec 64)) (t!35196 List!24584)) )
))
(declare-fun arrayNoDuplicates!0 (array!73110 (_ BitVec 32) List!24584) Bool)

(assert (=> b!1121885 (= res!749512 (arrayNoDuplicates!0 lt!498357 #b00000000000000000000000000000000 Nil!24581))))

(declare-fun res!749520 () Bool)

(declare-fun e!638734 () Bool)

(assert (=> start!97922 (=> (not res!749520) (not e!638734))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!73110)

(assert (=> start!97922 (= res!749520 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35746 _keys!1208))))))

(assert (=> start!97922 e!638734))

(declare-fun tp_is_empty!28159 () Bool)

(assert (=> start!97922 tp_is_empty!28159))

(declare-fun array_inv!27108 (array!73110) Bool)

(assert (=> start!97922 (array_inv!27108 _keys!1208)))

(assert (=> start!97922 true))

(assert (=> start!97922 tp!83591))

(declare-datatypes ((ValueCell!13370 0))(
  ( (ValueCellFull!13370 (v!16768 V!42673)) (EmptyCell!13370) )
))
(declare-datatypes ((array!73112 0))(
  ( (array!73113 (arr!35209 (Array (_ BitVec 32) ValueCell!13370)) (size!35747 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73112)

(declare-fun e!638732 () Bool)

(declare-fun array_inv!27109 (array!73112) Bool)

(assert (=> start!97922 (and (array_inv!27109 _values!996) e!638732)))

(declare-fun b!1121886 () Bool)

(declare-fun e!638735 () Bool)

(assert (=> b!1121886 (= e!638735 tp_is_empty!28159)))

(declare-fun b!1121887 () Bool)

(declare-fun e!638736 () Bool)

(declare-fun e!638728 () Bool)

(assert (=> b!1121887 (= e!638736 e!638728)))

(declare-fun res!749517 () Bool)

(assert (=> b!1121887 (=> res!749517 e!638728)))

(assert (=> b!1121887 (= res!749517 (not (= (select (arr!35208 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1121887 e!638729))

(declare-fun c!109407 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121887 (= c!109407 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42673)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42673)

(declare-datatypes ((Unit!36637 0))(
  ( (Unit!36638) )
))
(declare-fun lt!498360 () Unit!36637)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!334 (array!73110 array!73112 (_ BitVec 32) (_ BitVec 32) V!42673 V!42673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36637)

(assert (=> b!1121887 (= lt!498360 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121888 () Bool)

(declare-fun res!749518 () Bool)

(assert (=> b!1121888 (=> (not res!749518) (not e!638734))))

(assert (=> b!1121888 (= res!749518 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35746 _keys!1208))))))

(declare-fun b!1121889 () Bool)

(declare-fun e!638727 () Bool)

(assert (=> b!1121889 (= e!638727 e!638736)))

(declare-fun res!749516 () Bool)

(assert (=> b!1121889 (=> res!749516 e!638736)))

(assert (=> b!1121889 (= res!749516 (not (= from!1455 i!673)))))

(declare-fun lt!498358 () array!73112)

(declare-fun lt!498356 () ListLongMap!15781)

(declare-fun getCurrentListMapNoExtraKeys!4413 (array!73110 array!73112 (_ BitVec 32) (_ BitVec 32) V!42673 V!42673 (_ BitVec 32) Int) ListLongMap!15781)

(assert (=> b!1121889 (= lt!498356 (getCurrentListMapNoExtraKeys!4413 lt!498357 lt!498358 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2452 (Int (_ BitVec 64)) V!42673)

(assert (=> b!1121889 (= lt!498358 (array!73113 (store (arr!35209 _values!996) i!673 (ValueCellFull!13370 (dynLambda!2452 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35747 _values!996)))))

(declare-fun lt!498354 () ListLongMap!15781)

(assert (=> b!1121889 (= lt!498354 (getCurrentListMapNoExtraKeys!4413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47143 () Bool)

(assert (=> bm!47143 (= call!47147 (getCurrentListMapNoExtraKeys!4413 lt!498357 lt!498358 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121890 () Bool)

(assert (=> b!1121890 (= e!638731 (not e!638727))))

(declare-fun res!749519 () Bool)

(assert (=> b!1121890 (=> res!749519 e!638727)))

(assert (=> b!1121890 (= res!749519 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121890 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498359 () Unit!36637)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73110 (_ BitVec 64) (_ BitVec 32)) Unit!36637)

(assert (=> b!1121890 (= lt!498359 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121891 () Bool)

(declare-fun res!749521 () Bool)

(assert (=> b!1121891 (=> (not res!749521) (not e!638734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73110 (_ BitVec 32)) Bool)

(assert (=> b!1121891 (= res!749521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121892 () Bool)

(declare-fun res!749515 () Bool)

(assert (=> b!1121892 (=> (not res!749515) (not e!638734))))

(assert (=> b!1121892 (= res!749515 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24581))))

(declare-fun b!1121893 () Bool)

(declare-fun res!749514 () Bool)

(assert (=> b!1121893 (=> (not res!749514) (not e!638734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121893 (= res!749514 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44056 () Bool)

(declare-fun mapRes!44056 () Bool)

(declare-fun tp!83590 () Bool)

(assert (=> mapNonEmpty!44056 (= mapRes!44056 (and tp!83590 e!638735))))

(declare-fun mapKey!44056 () (_ BitVec 32))

(declare-fun mapRest!44056 () (Array (_ BitVec 32) ValueCell!13370))

(declare-fun mapValue!44056 () ValueCell!13370)

(assert (=> mapNonEmpty!44056 (= (arr!35209 _values!996) (store mapRest!44056 mapKey!44056 mapValue!44056))))

(declare-fun b!1121894 () Bool)

(assert (=> b!1121894 (= e!638728 true)))

(declare-fun lt!498355 () Bool)

(declare-fun contains!6388 (ListLongMap!15781 (_ BitVec 64)) Bool)

(assert (=> b!1121894 (= lt!498355 (contains!6388 (getCurrentListMapNoExtraKeys!4413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1121895 () Bool)

(assert (=> b!1121895 (= e!638734 e!638731)))

(declare-fun res!749509 () Bool)

(assert (=> b!1121895 (=> (not res!749509) (not e!638731))))

(assert (=> b!1121895 (= res!749509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498357 mask!1564))))

(assert (=> b!1121895 (= lt!498357 (array!73111 (store (arr!35208 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35746 _keys!1208)))))

(declare-fun b!1121896 () Bool)

(declare-fun res!749510 () Bool)

(assert (=> b!1121896 (=> (not res!749510) (not e!638734))))

(assert (=> b!1121896 (= res!749510 (= (select (arr!35208 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44056 () Bool)

(assert (=> mapIsEmpty!44056 mapRes!44056))

(declare-fun b!1121897 () Bool)

(assert (=> b!1121897 (= e!638729 (= call!47147 call!47146))))

(declare-fun b!1121898 () Bool)

(declare-fun res!749511 () Bool)

(assert (=> b!1121898 (=> (not res!749511) (not e!638734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121898 (= res!749511 (validMask!0 mask!1564))))

(declare-fun bm!47144 () Bool)

(assert (=> bm!47144 (= call!47146 (getCurrentListMapNoExtraKeys!4413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121899 () Bool)

(declare-fun res!749513 () Bool)

(assert (=> b!1121899 (=> (not res!749513) (not e!638734))))

(assert (=> b!1121899 (= res!749513 (and (= (size!35747 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35746 _keys!1208) (size!35747 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121900 () Bool)

(declare-fun e!638733 () Bool)

(assert (=> b!1121900 (= e!638732 (and e!638733 mapRes!44056))))

(declare-fun condMapEmpty!44056 () Bool)

(declare-fun mapDefault!44056 () ValueCell!13370)

(assert (=> b!1121900 (= condMapEmpty!44056 (= (arr!35209 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13370)) mapDefault!44056)))))

(declare-fun b!1121901 () Bool)

(assert (=> b!1121901 (= e!638733 tp_is_empty!28159)))

(assert (= (and start!97922 res!749520) b!1121898))

(assert (= (and b!1121898 res!749511) b!1121899))

(assert (= (and b!1121899 res!749513) b!1121891))

(assert (= (and b!1121891 res!749521) b!1121892))

(assert (= (and b!1121892 res!749515) b!1121888))

(assert (= (and b!1121888 res!749518) b!1121893))

(assert (= (and b!1121893 res!749514) b!1121896))

(assert (= (and b!1121896 res!749510) b!1121895))

(assert (= (and b!1121895 res!749509) b!1121885))

(assert (= (and b!1121885 res!749512) b!1121890))

(assert (= (and b!1121890 (not res!749519)) b!1121889))

(assert (= (and b!1121889 (not res!749516)) b!1121887))

(assert (= (and b!1121887 c!109407) b!1121884))

(assert (= (and b!1121887 (not c!109407)) b!1121897))

(assert (= (or b!1121884 b!1121897) bm!47143))

(assert (= (or b!1121884 b!1121897) bm!47144))

(assert (= (and b!1121887 (not res!749517)) b!1121894))

(assert (= (and b!1121900 condMapEmpty!44056) mapIsEmpty!44056))

(assert (= (and b!1121900 (not condMapEmpty!44056)) mapNonEmpty!44056))

(get-info :version)

(assert (= (and mapNonEmpty!44056 ((_ is ValueCellFull!13370) mapValue!44056)) b!1121886))

(assert (= (and b!1121900 ((_ is ValueCellFull!13370) mapDefault!44056)) b!1121901))

(assert (= start!97922 b!1121900))

(declare-fun b_lambda!18581 () Bool)

(assert (=> (not b_lambda!18581) (not b!1121889)))

(declare-fun t!35194 () Bool)

(declare-fun tb!8433 () Bool)

(assert (=> (and start!97922 (= defaultEntry!1004 defaultEntry!1004) t!35194) tb!8433))

(declare-fun result!17435 () Bool)

(assert (=> tb!8433 (= result!17435 tp_is_empty!28159)))

(assert (=> b!1121889 t!35194))

(declare-fun b_and!38021 () Bool)

(assert (= b_and!38019 (and (=> t!35194 result!17435) b_and!38021)))

(declare-fun m!1036113 () Bool)

(assert (=> b!1121896 m!1036113))

(declare-fun m!1036115 () Bool)

(assert (=> b!1121890 m!1036115))

(declare-fun m!1036117 () Bool)

(assert (=> b!1121890 m!1036117))

(declare-fun m!1036119 () Bool)

(assert (=> b!1121887 m!1036119))

(declare-fun m!1036121 () Bool)

(assert (=> b!1121887 m!1036121))

(declare-fun m!1036123 () Bool)

(assert (=> b!1121898 m!1036123))

(declare-fun m!1036125 () Bool)

(assert (=> bm!47144 m!1036125))

(declare-fun m!1036127 () Bool)

(assert (=> b!1121891 m!1036127))

(declare-fun m!1036129 () Bool)

(assert (=> mapNonEmpty!44056 m!1036129))

(declare-fun m!1036131 () Bool)

(assert (=> b!1121884 m!1036131))

(declare-fun m!1036133 () Bool)

(assert (=> b!1121893 m!1036133))

(declare-fun m!1036135 () Bool)

(assert (=> b!1121889 m!1036135))

(declare-fun m!1036137 () Bool)

(assert (=> b!1121889 m!1036137))

(declare-fun m!1036139 () Bool)

(assert (=> b!1121889 m!1036139))

(declare-fun m!1036141 () Bool)

(assert (=> b!1121889 m!1036141))

(declare-fun m!1036143 () Bool)

(assert (=> b!1121895 m!1036143))

(declare-fun m!1036145 () Bool)

(assert (=> b!1121895 m!1036145))

(declare-fun m!1036147 () Bool)

(assert (=> b!1121885 m!1036147))

(declare-fun m!1036149 () Bool)

(assert (=> start!97922 m!1036149))

(declare-fun m!1036151 () Bool)

(assert (=> start!97922 m!1036151))

(assert (=> b!1121894 m!1036125))

(assert (=> b!1121894 m!1036125))

(declare-fun m!1036153 () Bool)

(assert (=> b!1121894 m!1036153))

(declare-fun m!1036155 () Bool)

(assert (=> b!1121892 m!1036155))

(declare-fun m!1036157 () Bool)

(assert (=> bm!47143 m!1036157))

(check-sat (not b!1121887) (not bm!47143) (not b!1121889) (not b!1121885) b_and!38021 (not b_next!23629) (not b!1121892) (not b!1121894) (not b!1121891) (not b!1121893) (not mapNonEmpty!44056) (not b_lambda!18581) (not b!1121898) (not b!1121895) (not b!1121884) tp_is_empty!28159 (not b!1121890) (not start!97922) (not bm!47144))
(check-sat b_and!38021 (not b_next!23629))
