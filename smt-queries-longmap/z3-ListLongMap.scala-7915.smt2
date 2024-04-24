; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98470 () Bool)

(assert start!98470)

(declare-fun b_free!23935 () Bool)

(declare-fun b_next!23935 () Bool)

(assert (=> start!98470 (= b_free!23935 (not b_next!23935))))

(declare-fun tp!84508 () Bool)

(declare-fun b_and!38663 () Bool)

(assert (=> start!98470 (= tp!84508 b_and!38663)))

(declare-fun b!1132934 () Bool)

(declare-fun e!644850 () Bool)

(declare-fun e!644848 () Bool)

(assert (=> b!1132934 (= e!644850 e!644848)))

(declare-fun res!756472 () Bool)

(assert (=> b!1132934 (=> res!756472 e!644848)))

(declare-datatypes ((array!73831 0))(
  ( (array!73832 (arr!35562 (Array (_ BitVec 32) (_ BitVec 64))) (size!36099 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73831)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1132934 (= res!756472 (not (= (select (arr!35562 _keys!1208) from!1455) k0!934)))))

(declare-fun e!644853 () Bool)

(assert (=> b!1132934 e!644853))

(declare-fun c!110618 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1132934 (= c!110618 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43081 0))(
  ( (V!43082 (val!14289 Int)) )
))
(declare-fun zeroValue!944 () V!43081)

(declare-datatypes ((Unit!37045 0))(
  ( (Unit!37046) )
))
(declare-fun lt!503158 () Unit!37045)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13523 0))(
  ( (ValueCellFull!13523 (v!16918 V!43081)) (EmptyCell!13523) )
))
(declare-datatypes ((array!73833 0))(
  ( (array!73834 (arr!35563 (Array (_ BitVec 32) ValueCell!13523)) (size!36100 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73833)

(declare-fun minValue!944 () V!43081)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!433 (array!73831 array!73833 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37045)

(assert (=> b!1132934 (= lt!503158 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48757 () Bool)

(declare-datatypes ((tuple2!18022 0))(
  ( (tuple2!18023 (_1!9022 (_ BitVec 64)) (_2!9022 V!43081)) )
))
(declare-datatypes ((List!24798 0))(
  ( (Nil!24795) (Cons!24794 (h!26012 tuple2!18022) (t!35717 List!24798)) )
))
(declare-datatypes ((ListLongMap!15999 0))(
  ( (ListLongMap!16000 (toList!8015 List!24798)) )
))
(declare-fun call!48762 () ListLongMap!15999)

(declare-fun getCurrentListMapNoExtraKeys!4532 (array!73831 array!73833 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 32) Int) ListLongMap!15999)

(assert (=> bm!48757 (= call!48762 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132935 () Bool)

(declare-fun e!644855 () Bool)

(declare-fun arrayContainsKey!0 (array!73831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132935 (= e!644855 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!48758 () Bool)

(declare-fun call!48766 () ListLongMap!15999)

(declare-fun call!48761 () ListLongMap!15999)

(assert (=> bm!48758 (= call!48766 call!48761)))

(declare-fun b!1132936 () Bool)

(declare-fun c!110620 () Bool)

(declare-fun lt!503160 () Bool)

(assert (=> b!1132936 (= c!110620 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503160))))

(declare-fun e!644856 () Unit!37045)

(declare-fun e!644857 () Unit!37045)

(assert (=> b!1132936 (= e!644856 e!644857)))

(declare-fun bm!48759 () Bool)

(declare-fun call!48760 () Bool)

(declare-fun call!48763 () Bool)

(assert (=> bm!48759 (= call!48760 call!48763)))

(declare-fun b!1132937 () Bool)

(declare-fun e!644859 () Bool)

(assert (=> b!1132937 (= e!644859 e!644850)))

(declare-fun res!756465 () Bool)

(assert (=> b!1132937 (=> res!756465 e!644850)))

(assert (=> b!1132937 (= res!756465 (not (= from!1455 i!673)))))

(declare-fun lt!503167 () array!73831)

(declare-fun lt!503165 () ListLongMap!15999)

(declare-fun lt!503154 () array!73833)

(assert (=> b!1132937 (= lt!503165 (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2592 (Int (_ BitVec 64)) V!43081)

(assert (=> b!1132937 (= lt!503154 (array!73834 (store (arr!35563 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36100 _values!996)))))

(declare-fun lt!503166 () ListLongMap!15999)

(assert (=> b!1132937 (= lt!503166 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1132938 () Bool)

(declare-fun res!756478 () Bool)

(declare-fun e!644854 () Bool)

(assert (=> b!1132938 (=> (not res!756478) (not e!644854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1132938 (= res!756478 (validKeyInArray!0 k0!934))))

(declare-fun b!1132939 () Bool)

(declare-fun lt!503161 () Unit!37045)

(assert (=> b!1132939 (= e!644857 lt!503161)))

(declare-fun call!48764 () Unit!37045)

(assert (=> b!1132939 (= lt!503161 call!48764)))

(assert (=> b!1132939 call!48760))

(declare-fun b!1132940 () Bool)

(declare-fun res!756476 () Bool)

(assert (=> b!1132940 (=> (not res!756476) (not e!644854))))

(assert (=> b!1132940 (= res!756476 (and (= (size!36100 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36099 _keys!1208) (size!36100 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1132941 () Bool)

(declare-fun e!644860 () Unit!37045)

(assert (=> b!1132941 (= e!644860 e!644856)))

(declare-fun c!110621 () Bool)

(assert (=> b!1132941 (= c!110621 (and (not lt!503160) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1132942 () Bool)

(declare-fun e!644858 () Bool)

(declare-fun tp_is_empty!28465 () Bool)

(assert (=> b!1132942 (= e!644858 tp_is_empty!28465)))

(declare-fun b!1132943 () Bool)

(declare-fun e!644862 () Bool)

(assert (=> b!1132943 (= e!644862 (not e!644859))))

(declare-fun res!756467 () Bool)

(assert (=> b!1132943 (=> res!756467 e!644859)))

(assert (=> b!1132943 (= res!756467 (bvsgt from!1455 i!673))))

(assert (=> b!1132943 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503164 () Unit!37045)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73831 (_ BitVec 64) (_ BitVec 32)) Unit!37045)

(assert (=> b!1132943 (= lt!503164 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!48760 () Bool)

(declare-fun call!48767 () Unit!37045)

(assert (=> bm!48760 (= call!48764 call!48767)))

(declare-fun b!1132944 () Bool)

(declare-fun e!644861 () Bool)

(assert (=> b!1132944 (= e!644848 e!644861)))

(declare-fun res!756475 () Bool)

(assert (=> b!1132944 (=> res!756475 e!644861)))

(declare-fun lt!503153 () ListLongMap!15999)

(declare-fun contains!6548 (ListLongMap!15999 (_ BitVec 64)) Bool)

(assert (=> b!1132944 (= res!756475 (not (contains!6548 lt!503153 k0!934)))))

(assert (=> b!1132944 (= lt!503153 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132945 () Bool)

(assert (=> b!1132945 (= e!644854 e!644862)))

(declare-fun res!756469 () Bool)

(assert (=> b!1132945 (=> (not res!756469) (not e!644862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73831 (_ BitVec 32)) Bool)

(assert (=> b!1132945 (= res!756469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503167 mask!1564))))

(assert (=> b!1132945 (= lt!503167 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)))))

(declare-fun bm!48761 () Bool)

(declare-fun c!110617 () Bool)

(declare-fun +!3479 (ListLongMap!15999 tuple2!18022) ListLongMap!15999)

(assert (=> bm!48761 (= call!48761 (+!3479 lt!503153 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132946 () Bool)

(declare-fun lt!503162 () Unit!37045)

(assert (=> b!1132946 (= e!644860 lt!503162)))

(declare-fun lt!503159 () Unit!37045)

(declare-fun addStillContains!705 (ListLongMap!15999 (_ BitVec 64) V!43081 (_ BitVec 64)) Unit!37045)

(assert (=> b!1132946 (= lt!503159 (addStillContains!705 lt!503153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!503163 () ListLongMap!15999)

(assert (=> b!1132946 (= lt!503163 call!48761)))

(assert (=> b!1132946 call!48763))

(assert (=> b!1132946 (= lt!503162 call!48767)))

(assert (=> b!1132946 (contains!6548 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1132947 () Bool)

(declare-fun res!756466 () Bool)

(assert (=> b!1132947 (=> (not res!756466) (not e!644854))))

(assert (=> b!1132947 (= res!756466 (= (select (arr!35562 _keys!1208) i!673) k0!934))))

(declare-fun b!1132948 () Bool)

(declare-fun e!644852 () Bool)

(assert (=> b!1132948 (= e!644852 tp_is_empty!28465)))

(declare-fun bm!48762 () Bool)

(assert (=> bm!48762 (= call!48767 (addStillContains!705 (ite c!110617 lt!503163 lt!503153) (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1132949 () Bool)

(declare-fun e!644849 () Bool)

(declare-fun mapRes!44515 () Bool)

(assert (=> b!1132949 (= e!644849 (and e!644858 mapRes!44515))))

(declare-fun condMapEmpty!44515 () Bool)

(declare-fun mapDefault!44515 () ValueCell!13523)

(assert (=> b!1132949 (= condMapEmpty!44515 (= (arr!35563 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13523)) mapDefault!44515)))))

(declare-fun b!1132950 () Bool)

(declare-fun res!756470 () Bool)

(assert (=> b!1132950 (=> (not res!756470) (not e!644854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1132950 (= res!756470 (validMask!0 mask!1564))))

(declare-fun b!1132951 () Bool)

(declare-fun res!756474 () Bool)

(assert (=> b!1132951 (=> (not res!756474) (not e!644854))))

(assert (=> b!1132951 (= res!756474 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36099 _keys!1208))))))

(declare-fun b!1132952 () Bool)

(assert (=> b!1132952 call!48760))

(declare-fun lt!503155 () Unit!37045)

(assert (=> b!1132952 (= lt!503155 call!48764)))

(assert (=> b!1132952 (= e!644856 lt!503155)))

(declare-fun b!1132953 () Bool)

(declare-fun res!756477 () Bool)

(assert (=> b!1132953 (=> (not res!756477) (not e!644854))))

(assert (=> b!1132953 (= res!756477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!48765 () ListLongMap!15999)

(declare-fun bm!48763 () Bool)

(assert (=> bm!48763 (= call!48765 (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132954 () Bool)

(assert (=> b!1132954 (= e!644853 (= call!48765 call!48762))))

(declare-fun b!1132955 () Bool)

(declare-fun res!756468 () Bool)

(assert (=> b!1132955 (=> (not res!756468) (not e!644854))))

(declare-datatypes ((List!24799 0))(
  ( (Nil!24796) (Cons!24795 (h!26013 (_ BitVec 64)) (t!35718 List!24799)) )
))
(declare-fun arrayNoDuplicates!0 (array!73831 (_ BitVec 32) List!24799) Bool)

(assert (=> b!1132955 (= res!756468 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24796))))

(declare-fun b!1132956 () Bool)

(declare-fun Unit!37047 () Unit!37045)

(assert (=> b!1132956 (= e!644857 Unit!37047)))

(declare-fun b!1132957 () Bool)

(assert (=> b!1132957 (= e!644855 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503160) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1132958 () Bool)

(declare-fun -!1172 (ListLongMap!15999 (_ BitVec 64)) ListLongMap!15999)

(assert (=> b!1132958 (= e!644853 (= call!48765 (-!1172 call!48762 k0!934)))))

(declare-fun b!1132959 () Bool)

(declare-fun res!756473 () Bool)

(assert (=> b!1132959 (=> (not res!756473) (not e!644862))))

(assert (=> b!1132959 (= res!756473 (arrayNoDuplicates!0 lt!503167 #b00000000000000000000000000000000 Nil!24796))))

(declare-fun mapIsEmpty!44515 () Bool)

(assert (=> mapIsEmpty!44515 mapRes!44515))

(declare-fun res!756471 () Bool)

(assert (=> start!98470 (=> (not res!756471) (not e!644854))))

(assert (=> start!98470 (= res!756471 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36099 _keys!1208))))))

(assert (=> start!98470 e!644854))

(assert (=> start!98470 tp_is_empty!28465))

(declare-fun array_inv!27334 (array!73831) Bool)

(assert (=> start!98470 (array_inv!27334 _keys!1208)))

(assert (=> start!98470 true))

(assert (=> start!98470 tp!84508))

(declare-fun array_inv!27335 (array!73833) Bool)

(assert (=> start!98470 (and (array_inv!27335 _values!996) e!644849)))

(declare-fun mapNonEmpty!44515 () Bool)

(declare-fun tp!84509 () Bool)

(assert (=> mapNonEmpty!44515 (= mapRes!44515 (and tp!84509 e!644852))))

(declare-fun mapKey!44515 () (_ BitVec 32))

(declare-fun mapRest!44515 () (Array (_ BitVec 32) ValueCell!13523))

(declare-fun mapValue!44515 () ValueCell!13523)

(assert (=> mapNonEmpty!44515 (= (arr!35563 _values!996) (store mapRest!44515 mapKey!44515 mapValue!44515))))

(declare-fun b!1132960 () Bool)

(assert (=> b!1132960 (= e!644861 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 _keys!1208))))))

(assert (=> b!1132960 e!644855))

(declare-fun c!110619 () Bool)

(assert (=> b!1132960 (= c!110619 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503157 () Unit!37045)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!317 (array!73831 array!73833 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 64) (_ BitVec 32) Int) Unit!37045)

(assert (=> b!1132960 (= lt!503157 (lemmaListMapContainsThenArrayContainsFrom!317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503156 () Unit!37045)

(assert (=> b!1132960 (= lt!503156 e!644860)))

(assert (=> b!1132960 (= c!110617 (and (not lt!503160) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1132960 (= lt!503160 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!48764 () Bool)

(assert (=> bm!48764 (= call!48763 (contains!6548 (ite c!110617 lt!503163 call!48766) k0!934))))

(assert (= (and start!98470 res!756471) b!1132950))

(assert (= (and b!1132950 res!756470) b!1132940))

(assert (= (and b!1132940 res!756476) b!1132953))

(assert (= (and b!1132953 res!756477) b!1132955))

(assert (= (and b!1132955 res!756468) b!1132951))

(assert (= (and b!1132951 res!756474) b!1132938))

(assert (= (and b!1132938 res!756478) b!1132947))

(assert (= (and b!1132947 res!756466) b!1132945))

(assert (= (and b!1132945 res!756469) b!1132959))

(assert (= (and b!1132959 res!756473) b!1132943))

(assert (= (and b!1132943 (not res!756467)) b!1132937))

(assert (= (and b!1132937 (not res!756465)) b!1132934))

(assert (= (and b!1132934 c!110618) b!1132958))

(assert (= (and b!1132934 (not c!110618)) b!1132954))

(assert (= (or b!1132958 b!1132954) bm!48757))

(assert (= (or b!1132958 b!1132954) bm!48763))

(assert (= (and b!1132934 (not res!756472)) b!1132944))

(assert (= (and b!1132944 (not res!756475)) b!1132960))

(assert (= (and b!1132960 c!110617) b!1132946))

(assert (= (and b!1132960 (not c!110617)) b!1132941))

(assert (= (and b!1132941 c!110621) b!1132952))

(assert (= (and b!1132941 (not c!110621)) b!1132936))

(assert (= (and b!1132936 c!110620) b!1132939))

(assert (= (and b!1132936 (not c!110620)) b!1132956))

(assert (= (or b!1132952 b!1132939) bm!48760))

(assert (= (or b!1132952 b!1132939) bm!48758))

(assert (= (or b!1132952 b!1132939) bm!48759))

(assert (= (or b!1132946 bm!48759) bm!48764))

(assert (= (or b!1132946 bm!48760) bm!48762))

(assert (= (or b!1132946 bm!48758) bm!48761))

(assert (= (and b!1132960 c!110619) b!1132935))

(assert (= (and b!1132960 (not c!110619)) b!1132957))

(assert (= (and b!1132949 condMapEmpty!44515) mapIsEmpty!44515))

(assert (= (and b!1132949 (not condMapEmpty!44515)) mapNonEmpty!44515))

(get-info :version)

(assert (= (and mapNonEmpty!44515 ((_ is ValueCellFull!13523) mapValue!44515)) b!1132948))

(assert (= (and b!1132949 ((_ is ValueCellFull!13523) mapDefault!44515)) b!1132942))

(assert (= start!98470 b!1132949))

(declare-fun b_lambda!18915 () Bool)

(assert (=> (not b_lambda!18915) (not b!1132937)))

(declare-fun t!35716 () Bool)

(declare-fun tb!8739 () Bool)

(assert (=> (and start!98470 (= defaultEntry!1004 defaultEntry!1004) t!35716) tb!8739))

(declare-fun result!18047 () Bool)

(assert (=> tb!8739 (= result!18047 tp_is_empty!28465)))

(assert (=> b!1132937 t!35716))

(declare-fun b_and!38665 () Bool)

(assert (= b_and!38663 (and (=> t!35716 result!18047) b_and!38665)))

(declare-fun m!1046169 () Bool)

(assert (=> b!1132937 m!1046169))

(declare-fun m!1046171 () Bool)

(assert (=> b!1132937 m!1046171))

(declare-fun m!1046173 () Bool)

(assert (=> b!1132937 m!1046173))

(declare-fun m!1046175 () Bool)

(assert (=> b!1132937 m!1046175))

(declare-fun m!1046177 () Bool)

(assert (=> b!1132938 m!1046177))

(declare-fun m!1046179 () Bool)

(assert (=> bm!48761 m!1046179))

(declare-fun m!1046181 () Bool)

(assert (=> b!1132955 m!1046181))

(declare-fun m!1046183 () Bool)

(assert (=> b!1132944 m!1046183))

(declare-fun m!1046185 () Bool)

(assert (=> b!1132944 m!1046185))

(declare-fun m!1046187 () Bool)

(assert (=> bm!48763 m!1046187))

(declare-fun m!1046189 () Bool)

(assert (=> bm!48764 m!1046189))

(assert (=> bm!48757 m!1046185))

(declare-fun m!1046191 () Bool)

(assert (=> b!1132953 m!1046191))

(declare-fun m!1046193 () Bool)

(assert (=> b!1132935 m!1046193))

(declare-fun m!1046195 () Bool)

(assert (=> b!1132950 m!1046195))

(declare-fun m!1046197 () Bool)

(assert (=> b!1132959 m!1046197))

(declare-fun m!1046199 () Bool)

(assert (=> b!1132958 m!1046199))

(declare-fun m!1046201 () Bool)

(assert (=> bm!48762 m!1046201))

(declare-fun m!1046203 () Bool)

(assert (=> b!1132945 m!1046203))

(declare-fun m!1046205 () Bool)

(assert (=> b!1132945 m!1046205))

(declare-fun m!1046207 () Bool)

(assert (=> b!1132946 m!1046207))

(declare-fun m!1046209 () Bool)

(assert (=> b!1132946 m!1046209))

(assert (=> b!1132946 m!1046209))

(declare-fun m!1046211 () Bool)

(assert (=> b!1132946 m!1046211))

(declare-fun m!1046213 () Bool)

(assert (=> start!98470 m!1046213))

(declare-fun m!1046215 () Bool)

(assert (=> start!98470 m!1046215))

(declare-fun m!1046217 () Bool)

(assert (=> b!1132960 m!1046217))

(declare-fun m!1046219 () Bool)

(assert (=> mapNonEmpty!44515 m!1046219))

(declare-fun m!1046221 () Bool)

(assert (=> b!1132934 m!1046221))

(declare-fun m!1046223 () Bool)

(assert (=> b!1132934 m!1046223))

(declare-fun m!1046225 () Bool)

(assert (=> b!1132947 m!1046225))

(declare-fun m!1046227 () Bool)

(assert (=> b!1132943 m!1046227))

(declare-fun m!1046229 () Bool)

(assert (=> b!1132943 m!1046229))

(check-sat (not b!1132938) (not b!1132934) (not b!1132959) (not b!1132950) (not bm!48761) (not mapNonEmpty!44515) tp_is_empty!28465 (not bm!48762) (not start!98470) (not b!1132958) (not bm!48763) (not b!1132953) (not b!1132943) b_and!38665 (not b!1132955) (not b_next!23935) (not b!1132945) (not bm!48757) (not b_lambda!18915) (not b!1132937) (not b!1132960) (not bm!48764) (not b!1132935) (not b!1132944) (not b!1132946))
(check-sat b_and!38665 (not b_next!23935))
(get-model)

(declare-fun b_lambda!18921 () Bool)

(assert (= b_lambda!18915 (or (and start!98470 b_free!23935) b_lambda!18921)))

(check-sat (not b!1132938) (not b!1132934) (not b!1132959) (not b!1132937) (not bm!48761) (not mapNonEmpty!44515) tp_is_empty!28465 (not bm!48762) (not start!98470) (not b!1132958) (not bm!48763) (not b!1132953) (not b!1132943) b_and!38665 (not b!1132955) (not b_next!23935) (not b!1132945) (not bm!48757) (not b!1132950) (not b_lambda!18921) (not b!1132960) (not bm!48764) (not b!1132935) (not b!1132944) (not b!1132946))
(check-sat b_and!38665 (not b_next!23935))
(get-model)

(declare-fun d!131761 () Bool)

(assert (=> d!131761 (= (array_inv!27334 _keys!1208) (bvsge (size!36099 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!98470 d!131761))

(declare-fun d!131763 () Bool)

(assert (=> d!131763 (= (array_inv!27335 _values!996) (bvsge (size!36100 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!98470 d!131763))

(declare-fun d!131765 () Bool)

(declare-fun res!756567 () Bool)

(declare-fun e!644961 () Bool)

(assert (=> d!131765 (=> res!756567 e!644961)))

(assert (=> d!131765 (= res!756567 (bvsge #b00000000000000000000000000000000 (size!36099 lt!503167)))))

(assert (=> d!131765 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503167 mask!1564) e!644961)))

(declare-fun b!1133137 () Bool)

(declare-fun e!644959 () Bool)

(assert (=> b!1133137 (= e!644961 e!644959)))

(declare-fun c!110654 () Bool)

(assert (=> b!1133137 (= c!110654 (validKeyInArray!0 (select (arr!35562 lt!503167) #b00000000000000000000000000000000)))))

(declare-fun b!1133138 () Bool)

(declare-fun e!644960 () Bool)

(assert (=> b!1133138 (= e!644959 e!644960)))

(declare-fun lt!503266 () (_ BitVec 64))

(assert (=> b!1133138 (= lt!503266 (select (arr!35562 lt!503167) #b00000000000000000000000000000000))))

(declare-fun lt!503265 () Unit!37045)

(assert (=> b!1133138 (= lt!503265 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!503167 lt!503266 #b00000000000000000000000000000000))))

(assert (=> b!1133138 (arrayContainsKey!0 lt!503167 lt!503266 #b00000000000000000000000000000000)))

(declare-fun lt!503264 () Unit!37045)

(assert (=> b!1133138 (= lt!503264 lt!503265)))

(declare-fun res!756568 () Bool)

(declare-datatypes ((SeekEntryResult!9881 0))(
  ( (MissingZero!9881 (index!41895 (_ BitVec 32))) (Found!9881 (index!41896 (_ BitVec 32))) (Intermediate!9881 (undefined!10693 Bool) (index!41897 (_ BitVec 32)) (x!101469 (_ BitVec 32))) (Undefined!9881) (MissingVacant!9881 (index!41898 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!73831 (_ BitVec 32)) SeekEntryResult!9881)

(assert (=> b!1133138 (= res!756568 (= (seekEntryOrOpen!0 (select (arr!35562 lt!503167) #b00000000000000000000000000000000) lt!503167 mask!1564) (Found!9881 #b00000000000000000000000000000000)))))

(assert (=> b!1133138 (=> (not res!756568) (not e!644960))))

(declare-fun bm!48815 () Bool)

(declare-fun call!48818 () Bool)

(assert (=> bm!48815 (= call!48818 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!503167 mask!1564))))

(declare-fun b!1133139 () Bool)

(assert (=> b!1133139 (= e!644959 call!48818)))

(declare-fun b!1133140 () Bool)

(assert (=> b!1133140 (= e!644960 call!48818)))

(assert (= (and d!131765 (not res!756567)) b!1133137))

(assert (= (and b!1133137 c!110654) b!1133138))

(assert (= (and b!1133137 (not c!110654)) b!1133139))

(assert (= (and b!1133138 res!756568) b!1133140))

(assert (= (or b!1133140 b!1133139) bm!48815))

(declare-fun m!1046355 () Bool)

(assert (=> b!1133137 m!1046355))

(assert (=> b!1133137 m!1046355))

(declare-fun m!1046357 () Bool)

(assert (=> b!1133137 m!1046357))

(assert (=> b!1133138 m!1046355))

(declare-fun m!1046359 () Bool)

(assert (=> b!1133138 m!1046359))

(declare-fun m!1046361 () Bool)

(assert (=> b!1133138 m!1046361))

(assert (=> b!1133138 m!1046355))

(declare-fun m!1046363 () Bool)

(assert (=> b!1133138 m!1046363))

(declare-fun m!1046365 () Bool)

(assert (=> bm!48815 m!1046365))

(assert (=> b!1132945 d!131765))

(declare-fun b!1133165 () Bool)

(declare-fun e!644979 () Bool)

(declare-fun e!644981 () Bool)

(assert (=> b!1133165 (= e!644979 e!644981)))

(declare-fun c!110664 () Bool)

(declare-fun e!644978 () Bool)

(assert (=> b!1133165 (= c!110664 e!644978)))

(declare-fun res!756577 () Bool)

(assert (=> b!1133165 (=> (not res!756577) (not e!644978))))

(assert (=> b!1133165 (= res!756577 (bvslt from!1455 (size!36099 lt!503167)))))

(declare-fun b!1133166 () Bool)

(declare-fun e!644976 () ListLongMap!15999)

(declare-fun call!48821 () ListLongMap!15999)

(assert (=> b!1133166 (= e!644976 call!48821)))

(declare-fun d!131767 () Bool)

(assert (=> d!131767 e!644979))

(declare-fun res!756579 () Bool)

(assert (=> d!131767 (=> (not res!756579) (not e!644979))))

(declare-fun lt!503285 () ListLongMap!15999)

(assert (=> d!131767 (= res!756579 (not (contains!6548 lt!503285 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644977 () ListLongMap!15999)

(assert (=> d!131767 (= lt!503285 e!644977)))

(declare-fun c!110665 () Bool)

(assert (=> d!131767 (= c!110665 (bvsge from!1455 (size!36099 lt!503167)))))

(assert (=> d!131767 (validMask!0 mask!1564)))

(assert (=> d!131767 (= (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!503285)))

(declare-fun b!1133167 () Bool)

(declare-fun e!644980 () Bool)

(assert (=> b!1133167 (= e!644981 e!644980)))

(declare-fun c!110663 () Bool)

(assert (=> b!1133167 (= c!110663 (bvslt from!1455 (size!36099 lt!503167)))))

(declare-fun b!1133168 () Bool)

(assert (=> b!1133168 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36099 lt!503167)))))

(assert (=> b!1133168 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36100 lt!503154)))))

(declare-fun e!644982 () Bool)

(declare-fun apply!964 (ListLongMap!15999 (_ BitVec 64)) V!43081)

(declare-fun get!18102 (ValueCell!13523 V!43081) V!43081)

(assert (=> b!1133168 (= e!644982 (= (apply!964 lt!503285 (select (arr!35562 lt!503167) from!1455)) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1133169 () Bool)

(assert (=> b!1133169 (= e!644977 e!644976)))

(declare-fun c!110666 () Bool)

(assert (=> b!1133169 (= c!110666 (validKeyInArray!0 (select (arr!35562 lt!503167) from!1455)))))

(declare-fun b!1133170 () Bool)

(declare-fun lt!503282 () Unit!37045)

(declare-fun lt!503283 () Unit!37045)

(assert (=> b!1133170 (= lt!503282 lt!503283)))

(declare-fun lt!503286 () V!43081)

(declare-fun lt!503284 () ListLongMap!15999)

(declare-fun lt!503287 () (_ BitVec 64))

(declare-fun lt!503281 () (_ BitVec 64))

(assert (=> b!1133170 (not (contains!6548 (+!3479 lt!503284 (tuple2!18023 lt!503287 lt!503286)) lt!503281))))

(declare-fun addStillNotContains!285 (ListLongMap!15999 (_ BitVec 64) V!43081 (_ BitVec 64)) Unit!37045)

(assert (=> b!1133170 (= lt!503283 (addStillNotContains!285 lt!503284 lt!503287 lt!503286 lt!503281))))

(assert (=> b!1133170 (= lt!503281 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133170 (= lt!503286 (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133170 (= lt!503287 (select (arr!35562 lt!503167) from!1455))))

(assert (=> b!1133170 (= lt!503284 call!48821)))

(assert (=> b!1133170 (= e!644976 (+!3479 call!48821 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133171 () Bool)

(assert (=> b!1133171 (= e!644978 (validKeyInArray!0 (select (arr!35562 lt!503167) from!1455)))))

(assert (=> b!1133171 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!48818 () Bool)

(assert (=> bm!48818 (= call!48821 (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133172 () Bool)

(assert (=> b!1133172 (= e!644977 (ListLongMap!16000 Nil!24795))))

(declare-fun b!1133173 () Bool)

(declare-fun res!756580 () Bool)

(assert (=> b!1133173 (=> (not res!756580) (not e!644979))))

(assert (=> b!1133173 (= res!756580 (not (contains!6548 lt!503285 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133174 () Bool)

(assert (=> b!1133174 (= e!644981 e!644982)))

(assert (=> b!1133174 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36099 lt!503167)))))

(declare-fun res!756578 () Bool)

(assert (=> b!1133174 (= res!756578 (contains!6548 lt!503285 (select (arr!35562 lt!503167) from!1455)))))

(assert (=> b!1133174 (=> (not res!756578) (not e!644982))))

(declare-fun b!1133175 () Bool)

(assert (=> b!1133175 (= e!644980 (= lt!503285 (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133176 () Bool)

(declare-fun isEmpty!977 (ListLongMap!15999) Bool)

(assert (=> b!1133176 (= e!644980 (isEmpty!977 lt!503285))))

(assert (= (and d!131767 c!110665) b!1133172))

(assert (= (and d!131767 (not c!110665)) b!1133169))

(assert (= (and b!1133169 c!110666) b!1133170))

(assert (= (and b!1133169 (not c!110666)) b!1133166))

(assert (= (or b!1133170 b!1133166) bm!48818))

(assert (= (and d!131767 res!756579) b!1133173))

(assert (= (and b!1133173 res!756580) b!1133165))

(assert (= (and b!1133165 res!756577) b!1133171))

(assert (= (and b!1133165 c!110664) b!1133174))

(assert (= (and b!1133165 (not c!110664)) b!1133167))

(assert (= (and b!1133174 res!756578) b!1133168))

(assert (= (and b!1133167 c!110663) b!1133175))

(assert (= (and b!1133167 (not c!110663)) b!1133176))

(declare-fun b_lambda!18923 () Bool)

(assert (=> (not b_lambda!18923) (not b!1133168)))

(assert (=> b!1133168 t!35716))

(declare-fun b_and!38675 () Bool)

(assert (= b_and!38665 (and (=> t!35716 result!18047) b_and!38675)))

(declare-fun b_lambda!18925 () Bool)

(assert (=> (not b_lambda!18925) (not b!1133170)))

(assert (=> b!1133170 t!35716))

(declare-fun b_and!38677 () Bool)

(assert (= b_and!38675 (and (=> t!35716 result!18047) b_and!38677)))

(declare-fun m!1046367 () Bool)

(assert (=> b!1133176 m!1046367))

(declare-fun m!1046369 () Bool)

(assert (=> b!1133171 m!1046369))

(assert (=> b!1133171 m!1046369))

(declare-fun m!1046371 () Bool)

(assert (=> b!1133171 m!1046371))

(declare-fun m!1046373 () Bool)

(assert (=> b!1133175 m!1046373))

(declare-fun m!1046375 () Bool)

(assert (=> b!1133170 m!1046375))

(assert (=> b!1133170 m!1046375))

(assert (=> b!1133170 m!1046171))

(declare-fun m!1046377 () Bool)

(assert (=> b!1133170 m!1046377))

(declare-fun m!1046379 () Bool)

(assert (=> b!1133170 m!1046379))

(declare-fun m!1046381 () Bool)

(assert (=> b!1133170 m!1046381))

(assert (=> b!1133170 m!1046171))

(declare-fun m!1046383 () Bool)

(assert (=> b!1133170 m!1046383))

(assert (=> b!1133170 m!1046369))

(assert (=> b!1133170 m!1046381))

(declare-fun m!1046385 () Bool)

(assert (=> b!1133170 m!1046385))

(assert (=> b!1133169 m!1046369))

(assert (=> b!1133169 m!1046369))

(assert (=> b!1133169 m!1046371))

(assert (=> b!1133168 m!1046375))

(assert (=> b!1133168 m!1046375))

(assert (=> b!1133168 m!1046171))

(assert (=> b!1133168 m!1046377))

(assert (=> b!1133168 m!1046369))

(assert (=> b!1133168 m!1046171))

(assert (=> b!1133168 m!1046369))

(declare-fun m!1046387 () Bool)

(assert (=> b!1133168 m!1046387))

(declare-fun m!1046389 () Bool)

(assert (=> d!131767 m!1046389))

(assert (=> d!131767 m!1046195))

(assert (=> bm!48818 m!1046373))

(declare-fun m!1046391 () Bool)

(assert (=> b!1133173 m!1046391))

(assert (=> b!1133174 m!1046369))

(assert (=> b!1133174 m!1046369))

(declare-fun m!1046393 () Bool)

(assert (=> b!1133174 m!1046393))

(assert (=> b!1132937 d!131767))

(declare-fun b!1133177 () Bool)

(declare-fun e!644986 () Bool)

(declare-fun e!644988 () Bool)

(assert (=> b!1133177 (= e!644986 e!644988)))

(declare-fun c!110668 () Bool)

(declare-fun e!644985 () Bool)

(assert (=> b!1133177 (= c!110668 e!644985)))

(declare-fun res!756581 () Bool)

(assert (=> b!1133177 (=> (not res!756581) (not e!644985))))

(assert (=> b!1133177 (= res!756581 (bvslt from!1455 (size!36099 _keys!1208)))))

(declare-fun b!1133178 () Bool)

(declare-fun e!644983 () ListLongMap!15999)

(declare-fun call!48822 () ListLongMap!15999)

(assert (=> b!1133178 (= e!644983 call!48822)))

(declare-fun d!131769 () Bool)

(assert (=> d!131769 e!644986))

(declare-fun res!756583 () Bool)

(assert (=> d!131769 (=> (not res!756583) (not e!644986))))

(declare-fun lt!503292 () ListLongMap!15999)

(assert (=> d!131769 (= res!756583 (not (contains!6548 lt!503292 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644984 () ListLongMap!15999)

(assert (=> d!131769 (= lt!503292 e!644984)))

(declare-fun c!110669 () Bool)

(assert (=> d!131769 (= c!110669 (bvsge from!1455 (size!36099 _keys!1208)))))

(assert (=> d!131769 (validMask!0 mask!1564)))

(assert (=> d!131769 (= (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!503292)))

(declare-fun b!1133179 () Bool)

(declare-fun e!644987 () Bool)

(assert (=> b!1133179 (= e!644988 e!644987)))

(declare-fun c!110667 () Bool)

(assert (=> b!1133179 (= c!110667 (bvslt from!1455 (size!36099 _keys!1208)))))

(declare-fun b!1133180 () Bool)

(assert (=> b!1133180 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36099 _keys!1208)))))

(assert (=> b!1133180 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36100 _values!996)))))

(declare-fun e!644989 () Bool)

(assert (=> b!1133180 (= e!644989 (= (apply!964 lt!503292 (select (arr!35562 _keys!1208) from!1455)) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1133181 () Bool)

(assert (=> b!1133181 (= e!644984 e!644983)))

(declare-fun c!110670 () Bool)

(assert (=> b!1133181 (= c!110670 (validKeyInArray!0 (select (arr!35562 _keys!1208) from!1455)))))

(declare-fun b!1133182 () Bool)

(declare-fun lt!503289 () Unit!37045)

(declare-fun lt!503290 () Unit!37045)

(assert (=> b!1133182 (= lt!503289 lt!503290)))

(declare-fun lt!503294 () (_ BitVec 64))

(declare-fun lt!503293 () V!43081)

(declare-fun lt!503291 () ListLongMap!15999)

(declare-fun lt!503288 () (_ BitVec 64))

(assert (=> b!1133182 (not (contains!6548 (+!3479 lt!503291 (tuple2!18023 lt!503294 lt!503293)) lt!503288))))

(assert (=> b!1133182 (= lt!503290 (addStillNotContains!285 lt!503291 lt!503294 lt!503293 lt!503288))))

(assert (=> b!1133182 (= lt!503288 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133182 (= lt!503293 (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133182 (= lt!503294 (select (arr!35562 _keys!1208) from!1455))))

(assert (=> b!1133182 (= lt!503291 call!48822)))

(assert (=> b!1133182 (= e!644983 (+!3479 call!48822 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133183 () Bool)

(assert (=> b!1133183 (= e!644985 (validKeyInArray!0 (select (arr!35562 _keys!1208) from!1455)))))

(assert (=> b!1133183 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!48819 () Bool)

(assert (=> bm!48819 (= call!48822 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133184 () Bool)

(assert (=> b!1133184 (= e!644984 (ListLongMap!16000 Nil!24795))))

(declare-fun b!1133185 () Bool)

(declare-fun res!756584 () Bool)

(assert (=> b!1133185 (=> (not res!756584) (not e!644986))))

(assert (=> b!1133185 (= res!756584 (not (contains!6548 lt!503292 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133186 () Bool)

(assert (=> b!1133186 (= e!644988 e!644989)))

(assert (=> b!1133186 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36099 _keys!1208)))))

(declare-fun res!756582 () Bool)

(assert (=> b!1133186 (= res!756582 (contains!6548 lt!503292 (select (arr!35562 _keys!1208) from!1455)))))

(assert (=> b!1133186 (=> (not res!756582) (not e!644989))))

(declare-fun b!1133187 () Bool)

(assert (=> b!1133187 (= e!644987 (= lt!503292 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133188 () Bool)

(assert (=> b!1133188 (= e!644987 (isEmpty!977 lt!503292))))

(assert (= (and d!131769 c!110669) b!1133184))

(assert (= (and d!131769 (not c!110669)) b!1133181))

(assert (= (and b!1133181 c!110670) b!1133182))

(assert (= (and b!1133181 (not c!110670)) b!1133178))

(assert (= (or b!1133182 b!1133178) bm!48819))

(assert (= (and d!131769 res!756583) b!1133185))

(assert (= (and b!1133185 res!756584) b!1133177))

(assert (= (and b!1133177 res!756581) b!1133183))

(assert (= (and b!1133177 c!110668) b!1133186))

(assert (= (and b!1133177 (not c!110668)) b!1133179))

(assert (= (and b!1133186 res!756582) b!1133180))

(assert (= (and b!1133179 c!110667) b!1133187))

(assert (= (and b!1133179 (not c!110667)) b!1133188))

(declare-fun b_lambda!18927 () Bool)

(assert (=> (not b_lambda!18927) (not b!1133180)))

(assert (=> b!1133180 t!35716))

(declare-fun b_and!38679 () Bool)

(assert (= b_and!38677 (and (=> t!35716 result!18047) b_and!38679)))

(declare-fun b_lambda!18929 () Bool)

(assert (=> (not b_lambda!18929) (not b!1133182)))

(assert (=> b!1133182 t!35716))

(declare-fun b_and!38681 () Bool)

(assert (= b_and!38679 (and (=> t!35716 result!18047) b_and!38681)))

(declare-fun m!1046395 () Bool)

(assert (=> b!1133188 m!1046395))

(assert (=> b!1133183 m!1046221))

(assert (=> b!1133183 m!1046221))

(declare-fun m!1046397 () Bool)

(assert (=> b!1133183 m!1046397))

(declare-fun m!1046399 () Bool)

(assert (=> b!1133187 m!1046399))

(declare-fun m!1046401 () Bool)

(assert (=> b!1133182 m!1046401))

(assert (=> b!1133182 m!1046401))

(assert (=> b!1133182 m!1046171))

(declare-fun m!1046403 () Bool)

(assert (=> b!1133182 m!1046403))

(declare-fun m!1046405 () Bool)

(assert (=> b!1133182 m!1046405))

(declare-fun m!1046407 () Bool)

(assert (=> b!1133182 m!1046407))

(assert (=> b!1133182 m!1046171))

(declare-fun m!1046409 () Bool)

(assert (=> b!1133182 m!1046409))

(assert (=> b!1133182 m!1046221))

(assert (=> b!1133182 m!1046407))

(declare-fun m!1046411 () Bool)

(assert (=> b!1133182 m!1046411))

(assert (=> b!1133181 m!1046221))

(assert (=> b!1133181 m!1046221))

(assert (=> b!1133181 m!1046397))

(assert (=> b!1133180 m!1046401))

(assert (=> b!1133180 m!1046401))

(assert (=> b!1133180 m!1046171))

(assert (=> b!1133180 m!1046403))

(assert (=> b!1133180 m!1046221))

(assert (=> b!1133180 m!1046171))

(assert (=> b!1133180 m!1046221))

(declare-fun m!1046413 () Bool)

(assert (=> b!1133180 m!1046413))

(declare-fun m!1046415 () Bool)

(assert (=> d!131769 m!1046415))

(assert (=> d!131769 m!1046195))

(assert (=> bm!48819 m!1046399))

(declare-fun m!1046417 () Bool)

(assert (=> b!1133185 m!1046417))

(assert (=> b!1133186 m!1046221))

(assert (=> b!1133186 m!1046221))

(declare-fun m!1046419 () Bool)

(assert (=> b!1133186 m!1046419))

(assert (=> b!1132937 d!131769))

(declare-fun b!1133189 () Bool)

(declare-fun e!644993 () Bool)

(declare-fun e!644995 () Bool)

(assert (=> b!1133189 (= e!644993 e!644995)))

(declare-fun c!110672 () Bool)

(declare-fun e!644992 () Bool)

(assert (=> b!1133189 (= c!110672 e!644992)))

(declare-fun res!756585 () Bool)

(assert (=> b!1133189 (=> (not res!756585) (not e!644992))))

(assert (=> b!1133189 (= res!756585 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 lt!503167)))))

(declare-fun b!1133190 () Bool)

(declare-fun e!644990 () ListLongMap!15999)

(declare-fun call!48823 () ListLongMap!15999)

(assert (=> b!1133190 (= e!644990 call!48823)))

(declare-fun d!131771 () Bool)

(assert (=> d!131771 e!644993))

(declare-fun res!756587 () Bool)

(assert (=> d!131771 (=> (not res!756587) (not e!644993))))

(declare-fun lt!503299 () ListLongMap!15999)

(assert (=> d!131771 (= res!756587 (not (contains!6548 lt!503299 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!644991 () ListLongMap!15999)

(assert (=> d!131771 (= lt!503299 e!644991)))

(declare-fun c!110673 () Bool)

(assert (=> d!131771 (= c!110673 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 lt!503167)))))

(assert (=> d!131771 (validMask!0 mask!1564)))

(assert (=> d!131771 (= (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503299)))

(declare-fun b!1133191 () Bool)

(declare-fun e!644994 () Bool)

(assert (=> b!1133191 (= e!644995 e!644994)))

(declare-fun c!110671 () Bool)

(assert (=> b!1133191 (= c!110671 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 lt!503167)))))

(declare-fun b!1133192 () Bool)

(assert (=> b!1133192 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 lt!503167)))))

(assert (=> b!1133192 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36100 lt!503154)))))

(declare-fun e!644996 () Bool)

(assert (=> b!1133192 (= e!644996 (= (apply!964 lt!503299 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1133193 () Bool)

(assert (=> b!1133193 (= e!644991 e!644990)))

(declare-fun c!110674 () Bool)

(assert (=> b!1133193 (= c!110674 (validKeyInArray!0 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1133194 () Bool)

(declare-fun lt!503296 () Unit!37045)

(declare-fun lt!503297 () Unit!37045)

(assert (=> b!1133194 (= lt!503296 lt!503297)))

(declare-fun lt!503300 () V!43081)

(declare-fun lt!503301 () (_ BitVec 64))

(declare-fun lt!503295 () (_ BitVec 64))

(declare-fun lt!503298 () ListLongMap!15999)

(assert (=> b!1133194 (not (contains!6548 (+!3479 lt!503298 (tuple2!18023 lt!503301 lt!503300)) lt!503295))))

(assert (=> b!1133194 (= lt!503297 (addStillNotContains!285 lt!503298 lt!503301 lt!503300 lt!503295))))

(assert (=> b!1133194 (= lt!503295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133194 (= lt!503300 (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133194 (= lt!503301 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1133194 (= lt!503298 call!48823)))

(assert (=> b!1133194 (= e!644990 (+!3479 call!48823 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133195 () Bool)

(assert (=> b!1133195 (= e!644992 (validKeyInArray!0 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133195 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!48820 () Bool)

(assert (=> bm!48820 (= call!48823 (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133196 () Bool)

(assert (=> b!1133196 (= e!644991 (ListLongMap!16000 Nil!24795))))

(declare-fun b!1133197 () Bool)

(declare-fun res!756588 () Bool)

(assert (=> b!1133197 (=> (not res!756588) (not e!644993))))

(assert (=> b!1133197 (= res!756588 (not (contains!6548 lt!503299 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133198 () Bool)

(assert (=> b!1133198 (= e!644995 e!644996)))

(assert (=> b!1133198 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 lt!503167)))))

(declare-fun res!756586 () Bool)

(assert (=> b!1133198 (= res!756586 (contains!6548 lt!503299 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133198 (=> (not res!756586) (not e!644996))))

(declare-fun b!1133199 () Bool)

(assert (=> b!1133199 (= e!644994 (= lt!503299 (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133200 () Bool)

(assert (=> b!1133200 (= e!644994 (isEmpty!977 lt!503299))))

(assert (= (and d!131771 c!110673) b!1133196))

(assert (= (and d!131771 (not c!110673)) b!1133193))

(assert (= (and b!1133193 c!110674) b!1133194))

(assert (= (and b!1133193 (not c!110674)) b!1133190))

(assert (= (or b!1133194 b!1133190) bm!48820))

(assert (= (and d!131771 res!756587) b!1133197))

(assert (= (and b!1133197 res!756588) b!1133189))

(assert (= (and b!1133189 res!756585) b!1133195))

(assert (= (and b!1133189 c!110672) b!1133198))

(assert (= (and b!1133189 (not c!110672)) b!1133191))

(assert (= (and b!1133198 res!756586) b!1133192))

(assert (= (and b!1133191 c!110671) b!1133199))

(assert (= (and b!1133191 (not c!110671)) b!1133200))

(declare-fun b_lambda!18931 () Bool)

(assert (=> (not b_lambda!18931) (not b!1133192)))

(assert (=> b!1133192 t!35716))

(declare-fun b_and!38683 () Bool)

(assert (= b_and!38681 (and (=> t!35716 result!18047) b_and!38683)))

(declare-fun b_lambda!18933 () Bool)

(assert (=> (not b_lambda!18933) (not b!1133194)))

(assert (=> b!1133194 t!35716))

(declare-fun b_and!38685 () Bool)

(assert (= b_and!38683 (and (=> t!35716 result!18047) b_and!38685)))

(declare-fun m!1046421 () Bool)

(assert (=> b!1133200 m!1046421))

(declare-fun m!1046423 () Bool)

(assert (=> b!1133195 m!1046423))

(assert (=> b!1133195 m!1046423))

(declare-fun m!1046425 () Bool)

(assert (=> b!1133195 m!1046425))

(declare-fun m!1046427 () Bool)

(assert (=> b!1133199 m!1046427))

(declare-fun m!1046429 () Bool)

(assert (=> b!1133194 m!1046429))

(assert (=> b!1133194 m!1046429))

(assert (=> b!1133194 m!1046171))

(declare-fun m!1046431 () Bool)

(assert (=> b!1133194 m!1046431))

(declare-fun m!1046433 () Bool)

(assert (=> b!1133194 m!1046433))

(declare-fun m!1046435 () Bool)

(assert (=> b!1133194 m!1046435))

(assert (=> b!1133194 m!1046171))

(declare-fun m!1046437 () Bool)

(assert (=> b!1133194 m!1046437))

(assert (=> b!1133194 m!1046423))

(assert (=> b!1133194 m!1046435))

(declare-fun m!1046439 () Bool)

(assert (=> b!1133194 m!1046439))

(assert (=> b!1133193 m!1046423))

(assert (=> b!1133193 m!1046423))

(assert (=> b!1133193 m!1046425))

(assert (=> b!1133192 m!1046429))

(assert (=> b!1133192 m!1046429))

(assert (=> b!1133192 m!1046171))

(assert (=> b!1133192 m!1046431))

(assert (=> b!1133192 m!1046423))

(assert (=> b!1133192 m!1046171))

(assert (=> b!1133192 m!1046423))

(declare-fun m!1046441 () Bool)

(assert (=> b!1133192 m!1046441))

(declare-fun m!1046443 () Bool)

(assert (=> d!131771 m!1046443))

(assert (=> d!131771 m!1046195))

(assert (=> bm!48820 m!1046427))

(declare-fun m!1046445 () Bool)

(assert (=> b!1133197 m!1046445))

(assert (=> b!1133198 m!1046423))

(assert (=> b!1133198 m!1046423))

(declare-fun m!1046447 () Bool)

(assert (=> b!1133198 m!1046447))

(assert (=> bm!48763 d!131771))

(declare-fun d!131773 () Bool)

(declare-fun e!644999 () Bool)

(assert (=> d!131773 e!644999))

(declare-fun res!756593 () Bool)

(assert (=> d!131773 (=> (not res!756593) (not e!644999))))

(declare-fun lt!503313 () ListLongMap!15999)

(assert (=> d!131773 (= res!756593 (contains!6548 lt!503313 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!503310 () List!24798)

(assert (=> d!131773 (= lt!503313 (ListLongMap!16000 lt!503310))))

(declare-fun lt!503311 () Unit!37045)

(declare-fun lt!503312 () Unit!37045)

(assert (=> d!131773 (= lt!503311 lt!503312)))

(declare-datatypes ((Option!675 0))(
  ( (Some!674 (v!16921 V!43081)) (None!673) )
))
(declare-fun getValueByKey!624 (List!24798 (_ BitVec 64)) Option!675)

(assert (=> d!131773 (= (getValueByKey!624 lt!503310 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!674 (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!306 (List!24798 (_ BitVec 64) V!43081) Unit!37045)

(assert (=> d!131773 (= lt!503312 (lemmaContainsTupThenGetReturnValue!306 lt!503310 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun insertStrictlySorted!399 (List!24798 (_ BitVec 64) V!43081) List!24798)

(assert (=> d!131773 (= lt!503310 (insertStrictlySorted!399 (toList!8015 lt!503153) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131773 (= (+!3479 lt!503153 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!503313)))

(declare-fun b!1133205 () Bool)

(declare-fun res!756594 () Bool)

(assert (=> b!1133205 (=> (not res!756594) (not e!644999))))

(assert (=> b!1133205 (= res!756594 (= (getValueByKey!624 (toList!8015 lt!503313) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!674 (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1133206 () Bool)

(declare-fun contains!6551 (List!24798 tuple2!18022) Bool)

(assert (=> b!1133206 (= e!644999 (contains!6551 (toList!8015 lt!503313) (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131773 res!756593) b!1133205))

(assert (= (and b!1133205 res!756594) b!1133206))

(declare-fun m!1046449 () Bool)

(assert (=> d!131773 m!1046449))

(declare-fun m!1046451 () Bool)

(assert (=> d!131773 m!1046451))

(declare-fun m!1046453 () Bool)

(assert (=> d!131773 m!1046453))

(declare-fun m!1046455 () Bool)

(assert (=> d!131773 m!1046455))

(declare-fun m!1046457 () Bool)

(assert (=> b!1133205 m!1046457))

(declare-fun m!1046459 () Bool)

(assert (=> b!1133206 m!1046459))

(assert (=> bm!48761 d!131773))

(declare-fun d!131775 () Bool)

(assert (=> d!131775 (contains!6548 (+!3479 lt!503153 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!503316 () Unit!37045)

(declare-fun choose!1779 (ListLongMap!15999 (_ BitVec 64) V!43081 (_ BitVec 64)) Unit!37045)

(assert (=> d!131775 (= lt!503316 (choose!1779 lt!503153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!131775 (contains!6548 lt!503153 k0!934)))

(assert (=> d!131775 (= (addStillContains!705 lt!503153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!503316)))

(declare-fun bs!32977 () Bool)

(assert (= bs!32977 d!131775))

(declare-fun m!1046461 () Bool)

(assert (=> bs!32977 m!1046461))

(assert (=> bs!32977 m!1046461))

(declare-fun m!1046463 () Bool)

(assert (=> bs!32977 m!1046463))

(declare-fun m!1046465 () Bool)

(assert (=> bs!32977 m!1046465))

(assert (=> bs!32977 m!1046183))

(assert (=> b!1132946 d!131775))

(declare-fun d!131777 () Bool)

(declare-fun e!645004 () Bool)

(assert (=> d!131777 e!645004))

(declare-fun res!756597 () Bool)

(assert (=> d!131777 (=> res!756597 e!645004)))

(declare-fun lt!503325 () Bool)

(assert (=> d!131777 (= res!756597 (not lt!503325))))

(declare-fun lt!503326 () Bool)

(assert (=> d!131777 (= lt!503325 lt!503326)))

(declare-fun lt!503327 () Unit!37045)

(declare-fun e!645005 () Unit!37045)

(assert (=> d!131777 (= lt!503327 e!645005)))

(declare-fun c!110677 () Bool)

(assert (=> d!131777 (= c!110677 lt!503326)))

(declare-fun containsKey!587 (List!24798 (_ BitVec 64)) Bool)

(assert (=> d!131777 (= lt!503326 (containsKey!587 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!131777 (= (contains!6548 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!503325)))

(declare-fun b!1133214 () Bool)

(declare-fun lt!503328 () Unit!37045)

(assert (=> b!1133214 (= e!645005 lt!503328)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!415 (List!24798 (_ BitVec 64)) Unit!37045)

(assert (=> b!1133214 (= lt!503328 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun isDefined!453 (Option!675) Bool)

(assert (=> b!1133214 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1133215 () Bool)

(declare-fun Unit!37053 () Unit!37045)

(assert (=> b!1133215 (= e!645005 Unit!37053)))

(declare-fun b!1133216 () Bool)

(assert (=> b!1133216 (= e!645004 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!131777 c!110677) b!1133214))

(assert (= (and d!131777 (not c!110677)) b!1133215))

(assert (= (and d!131777 (not res!756597)) b!1133216))

(declare-fun m!1046467 () Bool)

(assert (=> d!131777 m!1046467))

(declare-fun m!1046469 () Bool)

(assert (=> b!1133214 m!1046469))

(declare-fun m!1046471 () Bool)

(assert (=> b!1133214 m!1046471))

(assert (=> b!1133214 m!1046471))

(declare-fun m!1046473 () Bool)

(assert (=> b!1133214 m!1046473))

(assert (=> b!1133216 m!1046471))

(assert (=> b!1133216 m!1046471))

(assert (=> b!1133216 m!1046473))

(assert (=> b!1132946 d!131777))

(declare-fun d!131779 () Bool)

(declare-fun e!645006 () Bool)

(assert (=> d!131779 e!645006))

(declare-fun res!756598 () Bool)

(assert (=> d!131779 (=> (not res!756598) (not e!645006))))

(declare-fun lt!503332 () ListLongMap!15999)

(assert (=> d!131779 (= res!756598 (contains!6548 lt!503332 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!503329 () List!24798)

(assert (=> d!131779 (= lt!503332 (ListLongMap!16000 lt!503329))))

(declare-fun lt!503330 () Unit!37045)

(declare-fun lt!503331 () Unit!37045)

(assert (=> d!131779 (= lt!503330 lt!503331)))

(assert (=> d!131779 (= (getValueByKey!624 lt!503329 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!674 (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131779 (= lt!503331 (lemmaContainsTupThenGetReturnValue!306 lt!503329 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131779 (= lt!503329 (insertStrictlySorted!399 (toList!8015 lt!503163) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131779 (= (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!503332)))

(declare-fun b!1133217 () Bool)

(declare-fun res!756599 () Bool)

(assert (=> b!1133217 (=> (not res!756599) (not e!645006))))

(assert (=> b!1133217 (= res!756599 (= (getValueByKey!624 (toList!8015 lt!503332) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!674 (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133218 () Bool)

(assert (=> b!1133218 (= e!645006 (contains!6551 (toList!8015 lt!503332) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!131779 res!756598) b!1133217))

(assert (= (and b!1133217 res!756599) b!1133218))

(declare-fun m!1046475 () Bool)

(assert (=> d!131779 m!1046475))

(declare-fun m!1046477 () Bool)

(assert (=> d!131779 m!1046477))

(declare-fun m!1046479 () Bool)

(assert (=> d!131779 m!1046479))

(declare-fun m!1046481 () Bool)

(assert (=> d!131779 m!1046481))

(declare-fun m!1046483 () Bool)

(assert (=> b!1133217 m!1046483))

(declare-fun m!1046485 () Bool)

(assert (=> b!1133218 m!1046485))

(assert (=> b!1132946 d!131779))

(declare-fun d!131781 () Bool)

(assert (=> d!131781 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1132938 d!131781))

(declare-fun d!131783 () Bool)

(declare-fun res!756604 () Bool)

(declare-fun e!645011 () Bool)

(assert (=> d!131783 (=> res!756604 e!645011)))

(assert (=> d!131783 (= res!756604 (= (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!131783 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!645011)))

(declare-fun b!1133223 () Bool)

(declare-fun e!645012 () Bool)

(assert (=> b!1133223 (= e!645011 e!645012)))

(declare-fun res!756605 () Bool)

(assert (=> b!1133223 (=> (not res!756605) (not e!645012))))

(assert (=> b!1133223 (= res!756605 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun b!1133224 () Bool)

(assert (=> b!1133224 (= e!645012 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131783 (not res!756604)) b!1133223))

(assert (= (and b!1133223 res!756605) b!1133224))

(declare-fun m!1046487 () Bool)

(assert (=> d!131783 m!1046487))

(declare-fun m!1046489 () Bool)

(assert (=> b!1133224 m!1046489))

(assert (=> b!1132943 d!131783))

(declare-fun d!131785 () Bool)

(assert (=> d!131785 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503335 () Unit!37045)

(declare-fun choose!13 (array!73831 (_ BitVec 64) (_ BitVec 32)) Unit!37045)

(assert (=> d!131785 (= lt!503335 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!131785 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!131785 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!503335)))

(declare-fun bs!32978 () Bool)

(assert (= bs!32978 d!131785))

(assert (=> bs!32978 m!1046227))

(declare-fun m!1046491 () Bool)

(assert (=> bs!32978 m!1046491))

(assert (=> b!1132943 d!131785))

(declare-fun d!131787 () Bool)

(declare-fun e!645015 () Bool)

(assert (=> d!131787 e!645015))

(declare-fun c!110680 () Bool)

(assert (=> d!131787 (= c!110680 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503338 () Unit!37045)

(declare-fun choose!1780 (array!73831 array!73833 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 64) (_ BitVec 32) Int) Unit!37045)

(assert (=> d!131787 (= lt!503338 (choose!1780 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131787 (validMask!0 mask!1564)))

(assert (=> d!131787 (= (lemmaListMapContainsThenArrayContainsFrom!317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503338)))

(declare-fun b!1133229 () Bool)

(assert (=> b!1133229 (= e!645015 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133230 () Bool)

(assert (=> b!1133230 (= e!645015 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!131787 c!110680) b!1133229))

(assert (= (and d!131787 (not c!110680)) b!1133230))

(declare-fun m!1046493 () Bool)

(assert (=> d!131787 m!1046493))

(assert (=> d!131787 m!1046195))

(assert (=> b!1133229 m!1046193))

(assert (=> b!1132960 d!131787))

(declare-fun d!131789 () Bool)

(declare-fun e!645016 () Bool)

(assert (=> d!131789 e!645016))

(declare-fun res!756606 () Bool)

(assert (=> d!131789 (=> res!756606 e!645016)))

(declare-fun lt!503339 () Bool)

(assert (=> d!131789 (= res!756606 (not lt!503339))))

(declare-fun lt!503340 () Bool)

(assert (=> d!131789 (= lt!503339 lt!503340)))

(declare-fun lt!503341 () Unit!37045)

(declare-fun e!645017 () Unit!37045)

(assert (=> d!131789 (= lt!503341 e!645017)))

(declare-fun c!110681 () Bool)

(assert (=> d!131789 (= c!110681 lt!503340)))

(assert (=> d!131789 (= lt!503340 (containsKey!587 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934))))

(assert (=> d!131789 (= (contains!6548 (ite c!110617 lt!503163 call!48766) k0!934) lt!503339)))

(declare-fun b!1133231 () Bool)

(declare-fun lt!503342 () Unit!37045)

(assert (=> b!1133231 (= e!645017 lt!503342)))

(assert (=> b!1133231 (= lt!503342 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934))))

(assert (=> b!1133231 (isDefined!453 (getValueByKey!624 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934))))

(declare-fun b!1133232 () Bool)

(declare-fun Unit!37054 () Unit!37045)

(assert (=> b!1133232 (= e!645017 Unit!37054)))

(declare-fun b!1133233 () Bool)

(assert (=> b!1133233 (= e!645016 (isDefined!453 (getValueByKey!624 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934)))))

(assert (= (and d!131789 c!110681) b!1133231))

(assert (= (and d!131789 (not c!110681)) b!1133232))

(assert (= (and d!131789 (not res!756606)) b!1133233))

(declare-fun m!1046495 () Bool)

(assert (=> d!131789 m!1046495))

(declare-fun m!1046497 () Bool)

(assert (=> b!1133231 m!1046497))

(declare-fun m!1046499 () Bool)

(assert (=> b!1133231 m!1046499))

(assert (=> b!1133231 m!1046499))

(declare-fun m!1046501 () Bool)

(assert (=> b!1133231 m!1046501))

(assert (=> b!1133233 m!1046499))

(assert (=> b!1133233 m!1046499))

(assert (=> b!1133233 m!1046501))

(assert (=> bm!48764 d!131789))

(declare-fun d!131791 () Bool)

(declare-fun res!756607 () Bool)

(declare-fun e!645020 () Bool)

(assert (=> d!131791 (=> res!756607 e!645020)))

(assert (=> d!131791 (= res!756607 (bvsge #b00000000000000000000000000000000 (size!36099 _keys!1208)))))

(assert (=> d!131791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!645020)))

(declare-fun b!1133234 () Bool)

(declare-fun e!645018 () Bool)

(assert (=> b!1133234 (= e!645020 e!645018)))

(declare-fun c!110682 () Bool)

(assert (=> b!1133234 (= c!110682 (validKeyInArray!0 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1133235 () Bool)

(declare-fun e!645019 () Bool)

(assert (=> b!1133235 (= e!645018 e!645019)))

(declare-fun lt!503345 () (_ BitVec 64))

(assert (=> b!1133235 (= lt!503345 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!503344 () Unit!37045)

(assert (=> b!1133235 (= lt!503344 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!503345 #b00000000000000000000000000000000))))

(assert (=> b!1133235 (arrayContainsKey!0 _keys!1208 lt!503345 #b00000000000000000000000000000000)))

(declare-fun lt!503343 () Unit!37045)

(assert (=> b!1133235 (= lt!503343 lt!503344)))

(declare-fun res!756608 () Bool)

(assert (=> b!1133235 (= res!756608 (= (seekEntryOrOpen!0 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9881 #b00000000000000000000000000000000)))))

(assert (=> b!1133235 (=> (not res!756608) (not e!645019))))

(declare-fun bm!48821 () Bool)

(declare-fun call!48824 () Bool)

(assert (=> bm!48821 (= call!48824 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1133236 () Bool)

(assert (=> b!1133236 (= e!645018 call!48824)))

(declare-fun b!1133237 () Bool)

(assert (=> b!1133237 (= e!645019 call!48824)))

(assert (= (and d!131791 (not res!756607)) b!1133234))

(assert (= (and b!1133234 c!110682) b!1133235))

(assert (= (and b!1133234 (not c!110682)) b!1133236))

(assert (= (and b!1133235 res!756608) b!1133237))

(assert (= (or b!1133237 b!1133236) bm!48821))

(assert (=> b!1133234 m!1046487))

(assert (=> b!1133234 m!1046487))

(declare-fun m!1046503 () Bool)

(assert (=> b!1133234 m!1046503))

(assert (=> b!1133235 m!1046487))

(declare-fun m!1046505 () Bool)

(assert (=> b!1133235 m!1046505))

(declare-fun m!1046507 () Bool)

(assert (=> b!1133235 m!1046507))

(assert (=> b!1133235 m!1046487))

(declare-fun m!1046509 () Bool)

(assert (=> b!1133235 m!1046509))

(declare-fun m!1046511 () Bool)

(assert (=> bm!48821 m!1046511))

(assert (=> b!1132953 d!131791))

(declare-fun d!131793 () Bool)

(declare-fun e!645021 () Bool)

(assert (=> d!131793 e!645021))

(declare-fun res!756609 () Bool)

(assert (=> d!131793 (=> res!756609 e!645021)))

(declare-fun lt!503346 () Bool)

(assert (=> d!131793 (= res!756609 (not lt!503346))))

(declare-fun lt!503347 () Bool)

(assert (=> d!131793 (= lt!503346 lt!503347)))

(declare-fun lt!503348 () Unit!37045)

(declare-fun e!645022 () Unit!37045)

(assert (=> d!131793 (= lt!503348 e!645022)))

(declare-fun c!110683 () Bool)

(assert (=> d!131793 (= c!110683 lt!503347)))

(assert (=> d!131793 (= lt!503347 (containsKey!587 (toList!8015 lt!503153) k0!934))))

(assert (=> d!131793 (= (contains!6548 lt!503153 k0!934) lt!503346)))

(declare-fun b!1133238 () Bool)

(declare-fun lt!503349 () Unit!37045)

(assert (=> b!1133238 (= e!645022 lt!503349)))

(assert (=> b!1133238 (= lt!503349 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503153) k0!934))))

(assert (=> b!1133238 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503153) k0!934))))

(declare-fun b!1133239 () Bool)

(declare-fun Unit!37055 () Unit!37045)

(assert (=> b!1133239 (= e!645022 Unit!37055)))

(declare-fun b!1133240 () Bool)

(assert (=> b!1133240 (= e!645021 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503153) k0!934)))))

(assert (= (and d!131793 c!110683) b!1133238))

(assert (= (and d!131793 (not c!110683)) b!1133239))

(assert (= (and d!131793 (not res!756609)) b!1133240))

(declare-fun m!1046513 () Bool)

(assert (=> d!131793 m!1046513))

(declare-fun m!1046515 () Bool)

(assert (=> b!1133238 m!1046515))

(declare-fun m!1046517 () Bool)

(assert (=> b!1133238 m!1046517))

(assert (=> b!1133238 m!1046517))

(declare-fun m!1046519 () Bool)

(assert (=> b!1133238 m!1046519))

(assert (=> b!1133240 m!1046517))

(assert (=> b!1133240 m!1046517))

(assert (=> b!1133240 m!1046519))

(assert (=> b!1132944 d!131793))

(declare-fun b!1133241 () Bool)

(declare-fun e!645026 () Bool)

(declare-fun e!645028 () Bool)

(assert (=> b!1133241 (= e!645026 e!645028)))

(declare-fun c!110685 () Bool)

(declare-fun e!645025 () Bool)

(assert (=> b!1133241 (= c!110685 e!645025)))

(declare-fun res!756610 () Bool)

(assert (=> b!1133241 (=> (not res!756610) (not e!645025))))

(assert (=> b!1133241 (= res!756610 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 _keys!1208)))))

(declare-fun b!1133242 () Bool)

(declare-fun e!645023 () ListLongMap!15999)

(declare-fun call!48825 () ListLongMap!15999)

(assert (=> b!1133242 (= e!645023 call!48825)))

(declare-fun d!131795 () Bool)

(assert (=> d!131795 e!645026))

(declare-fun res!756612 () Bool)

(assert (=> d!131795 (=> (not res!756612) (not e!645026))))

(declare-fun lt!503354 () ListLongMap!15999)

(assert (=> d!131795 (= res!756612 (not (contains!6548 lt!503354 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!645024 () ListLongMap!15999)

(assert (=> d!131795 (= lt!503354 e!645024)))

(declare-fun c!110686 () Bool)

(assert (=> d!131795 (= c!110686 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 _keys!1208)))))

(assert (=> d!131795 (validMask!0 mask!1564)))

(assert (=> d!131795 (= (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503354)))

(declare-fun b!1133243 () Bool)

(declare-fun e!645027 () Bool)

(assert (=> b!1133243 (= e!645028 e!645027)))

(declare-fun c!110684 () Bool)

(assert (=> b!1133243 (= c!110684 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 _keys!1208)))))

(declare-fun b!1133244 () Bool)

(assert (=> b!1133244 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 _keys!1208)))))

(assert (=> b!1133244 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36100 _values!996)))))

(declare-fun e!645029 () Bool)

(assert (=> b!1133244 (= e!645029 (= (apply!964 lt!503354 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1133245 () Bool)

(assert (=> b!1133245 (= e!645024 e!645023)))

(declare-fun c!110687 () Bool)

(assert (=> b!1133245 (= c!110687 (validKeyInArray!0 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1133246 () Bool)

(declare-fun lt!503351 () Unit!37045)

(declare-fun lt!503352 () Unit!37045)

(assert (=> b!1133246 (= lt!503351 lt!503352)))

(declare-fun lt!503353 () ListLongMap!15999)

(declare-fun lt!503350 () (_ BitVec 64))

(declare-fun lt!503355 () V!43081)

(declare-fun lt!503356 () (_ BitVec 64))

(assert (=> b!1133246 (not (contains!6548 (+!3479 lt!503353 (tuple2!18023 lt!503356 lt!503355)) lt!503350))))

(assert (=> b!1133246 (= lt!503352 (addStillNotContains!285 lt!503353 lt!503356 lt!503355 lt!503350))))

(assert (=> b!1133246 (= lt!503350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133246 (= lt!503355 (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133246 (= lt!503356 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1133246 (= lt!503353 call!48825)))

(assert (=> b!1133246 (= e!645023 (+!3479 call!48825 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133247 () Bool)

(assert (=> b!1133247 (= e!645025 (validKeyInArray!0 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133247 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!48822 () Bool)

(assert (=> bm!48822 (= call!48825 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133248 () Bool)

(assert (=> b!1133248 (= e!645024 (ListLongMap!16000 Nil!24795))))

(declare-fun b!1133249 () Bool)

(declare-fun res!756613 () Bool)

(assert (=> b!1133249 (=> (not res!756613) (not e!645026))))

(assert (=> b!1133249 (= res!756613 (not (contains!6548 lt!503354 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133250 () Bool)

(assert (=> b!1133250 (= e!645028 e!645029)))

(assert (=> b!1133250 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 _keys!1208)))))

(declare-fun res!756611 () Bool)

(assert (=> b!1133250 (= res!756611 (contains!6548 lt!503354 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133250 (=> (not res!756611) (not e!645029))))

(declare-fun b!1133251 () Bool)

(assert (=> b!1133251 (= e!645027 (= lt!503354 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133252 () Bool)

(assert (=> b!1133252 (= e!645027 (isEmpty!977 lt!503354))))

(assert (= (and d!131795 c!110686) b!1133248))

(assert (= (and d!131795 (not c!110686)) b!1133245))

(assert (= (and b!1133245 c!110687) b!1133246))

(assert (= (and b!1133245 (not c!110687)) b!1133242))

(assert (= (or b!1133246 b!1133242) bm!48822))

(assert (= (and d!131795 res!756612) b!1133249))

(assert (= (and b!1133249 res!756613) b!1133241))

(assert (= (and b!1133241 res!756610) b!1133247))

(assert (= (and b!1133241 c!110685) b!1133250))

(assert (= (and b!1133241 (not c!110685)) b!1133243))

(assert (= (and b!1133250 res!756611) b!1133244))

(assert (= (and b!1133243 c!110684) b!1133251))

(assert (= (and b!1133243 (not c!110684)) b!1133252))

(declare-fun b_lambda!18935 () Bool)

(assert (=> (not b_lambda!18935) (not b!1133244)))

(assert (=> b!1133244 t!35716))

(declare-fun b_and!38687 () Bool)

(assert (= b_and!38685 (and (=> t!35716 result!18047) b_and!38687)))

(declare-fun b_lambda!18937 () Bool)

(assert (=> (not b_lambda!18937) (not b!1133246)))

(assert (=> b!1133246 t!35716))

(declare-fun b_and!38689 () Bool)

(assert (= b_and!38687 (and (=> t!35716 result!18047) b_and!38689)))

(declare-fun m!1046521 () Bool)

(assert (=> b!1133252 m!1046521))

(declare-fun m!1046523 () Bool)

(assert (=> b!1133247 m!1046523))

(assert (=> b!1133247 m!1046523))

(declare-fun m!1046525 () Bool)

(assert (=> b!1133247 m!1046525))

(declare-fun m!1046527 () Bool)

(assert (=> b!1133251 m!1046527))

(declare-fun m!1046529 () Bool)

(assert (=> b!1133246 m!1046529))

(assert (=> b!1133246 m!1046529))

(assert (=> b!1133246 m!1046171))

(declare-fun m!1046531 () Bool)

(assert (=> b!1133246 m!1046531))

(declare-fun m!1046533 () Bool)

(assert (=> b!1133246 m!1046533))

(declare-fun m!1046535 () Bool)

(assert (=> b!1133246 m!1046535))

(assert (=> b!1133246 m!1046171))

(declare-fun m!1046537 () Bool)

(assert (=> b!1133246 m!1046537))

(assert (=> b!1133246 m!1046523))

(assert (=> b!1133246 m!1046535))

(declare-fun m!1046539 () Bool)

(assert (=> b!1133246 m!1046539))

(assert (=> b!1133245 m!1046523))

(assert (=> b!1133245 m!1046523))

(assert (=> b!1133245 m!1046525))

(assert (=> b!1133244 m!1046529))

(assert (=> b!1133244 m!1046529))

(assert (=> b!1133244 m!1046171))

(assert (=> b!1133244 m!1046531))

(assert (=> b!1133244 m!1046523))

(assert (=> b!1133244 m!1046171))

(assert (=> b!1133244 m!1046523))

(declare-fun m!1046541 () Bool)

(assert (=> b!1133244 m!1046541))

(declare-fun m!1046543 () Bool)

(assert (=> d!131795 m!1046543))

(assert (=> d!131795 m!1046195))

(assert (=> bm!48822 m!1046527))

(declare-fun m!1046545 () Bool)

(assert (=> b!1133249 m!1046545))

(assert (=> b!1133250 m!1046523))

(assert (=> b!1133250 m!1046523))

(declare-fun m!1046547 () Bool)

(assert (=> b!1133250 m!1046547))

(assert (=> b!1132944 d!131795))

(declare-fun call!48830 () ListLongMap!15999)

(declare-fun bm!48827 () Bool)

(assert (=> bm!48827 (= call!48830 (getCurrentListMapNoExtraKeys!4532 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)) (array!73834 (store (arr!35563 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36100 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133259 () Bool)

(declare-fun e!645035 () Bool)

(declare-fun e!645034 () Bool)

(assert (=> b!1133259 (= e!645035 e!645034)))

(declare-fun c!110690 () Bool)

(assert (=> b!1133259 (= c!110690 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!131797 () Bool)

(assert (=> d!131797 e!645035))

(declare-fun res!756616 () Bool)

(assert (=> d!131797 (=> (not res!756616) (not e!645035))))

(assert (=> d!131797 (= res!756616 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36099 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36099 _keys!1208))))))))

(declare-fun lt!503359 () Unit!37045)

(declare-fun choose!1781 (array!73831 array!73833 (_ BitVec 32) (_ BitVec 32) V!43081 V!43081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37045)

(assert (=> d!131797 (= lt!503359 (choose!1781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131797 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 _keys!1208)))))

(assert (=> d!131797 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503359)))

(declare-fun call!48831 () ListLongMap!15999)

(declare-fun b!1133260 () Bool)

(assert (=> b!1133260 (= e!645034 (= call!48830 (-!1172 call!48831 k0!934)))))

(assert (=> b!1133260 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36100 _values!996)))))

(declare-fun bm!48828 () Bool)

(assert (=> bm!48828 (= call!48831 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133261 () Bool)

(assert (=> b!1133261 (= e!645034 (= call!48830 call!48831))))

(assert (=> b!1133261 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36100 _values!996)))))

(assert (= (and d!131797 res!756616) b!1133259))

(assert (= (and b!1133259 c!110690) b!1133260))

(assert (= (and b!1133259 (not c!110690)) b!1133261))

(assert (= (or b!1133260 b!1133261) bm!48828))

(assert (= (or b!1133260 b!1133261) bm!48827))

(declare-fun b_lambda!18939 () Bool)

(assert (=> (not b_lambda!18939) (not bm!48827)))

(assert (=> bm!48827 t!35716))

(declare-fun b_and!38691 () Bool)

(assert (= b_and!38689 (and (=> t!35716 result!18047) b_and!38691)))

(assert (=> bm!48827 m!1046205))

(assert (=> bm!48827 m!1046171))

(assert (=> bm!48827 m!1046173))

(declare-fun m!1046549 () Bool)

(assert (=> bm!48827 m!1046549))

(declare-fun m!1046551 () Bool)

(assert (=> d!131797 m!1046551))

(declare-fun m!1046553 () Bool)

(assert (=> b!1133260 m!1046553))

(assert (=> bm!48828 m!1046185))

(assert (=> b!1132934 d!131797))

(declare-fun d!131799 () Bool)

(declare-fun lt!503362 () ListLongMap!15999)

(assert (=> d!131799 (not (contains!6548 lt!503362 k0!934))))

(declare-fun removeStrictlySorted!88 (List!24798 (_ BitVec 64)) List!24798)

(assert (=> d!131799 (= lt!503362 (ListLongMap!16000 (removeStrictlySorted!88 (toList!8015 call!48762) k0!934)))))

(assert (=> d!131799 (= (-!1172 call!48762 k0!934) lt!503362)))

(declare-fun bs!32979 () Bool)

(assert (= bs!32979 d!131799))

(declare-fun m!1046555 () Bool)

(assert (=> bs!32979 m!1046555))

(declare-fun m!1046557 () Bool)

(assert (=> bs!32979 m!1046557))

(assert (=> b!1132958 d!131799))

(declare-fun d!131801 () Bool)

(assert (=> d!131801 (contains!6548 (+!3479 (ite c!110617 lt!503163 lt!503153) (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!503363 () Unit!37045)

(assert (=> d!131801 (= lt!503363 (choose!1779 (ite c!110617 lt!503163 lt!503153) (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!131801 (contains!6548 (ite c!110617 lt!503163 lt!503153) k0!934)))

(assert (=> d!131801 (= (addStillContains!705 (ite c!110617 lt!503163 lt!503153) (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)) k0!934) lt!503363)))

(declare-fun bs!32980 () Bool)

(assert (= bs!32980 d!131801))

(declare-fun m!1046559 () Bool)

(assert (=> bs!32980 m!1046559))

(assert (=> bs!32980 m!1046559))

(declare-fun m!1046561 () Bool)

(assert (=> bs!32980 m!1046561))

(declare-fun m!1046563 () Bool)

(assert (=> bs!32980 m!1046563))

(declare-fun m!1046565 () Bool)

(assert (=> bs!32980 m!1046565))

(assert (=> bm!48762 d!131801))

(assert (=> bm!48757 d!131795))

(declare-fun b!1133272 () Bool)

(declare-fun e!645047 () Bool)

(declare-fun contains!6552 (List!24799 (_ BitVec 64)) Bool)

(assert (=> b!1133272 (= e!645047 (contains!6552 Nil!24796 (select (arr!35562 lt!503167) #b00000000000000000000000000000000)))))

(declare-fun d!131803 () Bool)

(declare-fun res!756624 () Bool)

(declare-fun e!645045 () Bool)

(assert (=> d!131803 (=> res!756624 e!645045)))

(assert (=> d!131803 (= res!756624 (bvsge #b00000000000000000000000000000000 (size!36099 lt!503167)))))

(assert (=> d!131803 (= (arrayNoDuplicates!0 lt!503167 #b00000000000000000000000000000000 Nil!24796) e!645045)))

(declare-fun b!1133273 () Bool)

(declare-fun e!645046 () Bool)

(declare-fun call!48834 () Bool)

(assert (=> b!1133273 (= e!645046 call!48834)))

(declare-fun b!1133274 () Bool)

(declare-fun e!645044 () Bool)

(assert (=> b!1133274 (= e!645045 e!645044)))

(declare-fun res!756623 () Bool)

(assert (=> b!1133274 (=> (not res!756623) (not e!645044))))

(assert (=> b!1133274 (= res!756623 (not e!645047))))

(declare-fun res!756625 () Bool)

(assert (=> b!1133274 (=> (not res!756625) (not e!645047))))

(assert (=> b!1133274 (= res!756625 (validKeyInArray!0 (select (arr!35562 lt!503167) #b00000000000000000000000000000000)))))

(declare-fun b!1133275 () Bool)

(assert (=> b!1133275 (= e!645046 call!48834)))

(declare-fun b!1133276 () Bool)

(assert (=> b!1133276 (= e!645044 e!645046)))

(declare-fun c!110693 () Bool)

(assert (=> b!1133276 (= c!110693 (validKeyInArray!0 (select (arr!35562 lt!503167) #b00000000000000000000000000000000)))))

(declare-fun bm!48831 () Bool)

(assert (=> bm!48831 (= call!48834 (arrayNoDuplicates!0 lt!503167 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110693 (Cons!24795 (select (arr!35562 lt!503167) #b00000000000000000000000000000000) Nil!24796) Nil!24796)))))

(assert (= (and d!131803 (not res!756624)) b!1133274))

(assert (= (and b!1133274 res!756625) b!1133272))

(assert (= (and b!1133274 res!756623) b!1133276))

(assert (= (and b!1133276 c!110693) b!1133273))

(assert (= (and b!1133276 (not c!110693)) b!1133275))

(assert (= (or b!1133273 b!1133275) bm!48831))

(assert (=> b!1133272 m!1046355))

(assert (=> b!1133272 m!1046355))

(declare-fun m!1046567 () Bool)

(assert (=> b!1133272 m!1046567))

(assert (=> b!1133274 m!1046355))

(assert (=> b!1133274 m!1046355))

(assert (=> b!1133274 m!1046357))

(assert (=> b!1133276 m!1046355))

(assert (=> b!1133276 m!1046355))

(assert (=> b!1133276 m!1046357))

(assert (=> bm!48831 m!1046355))

(declare-fun m!1046569 () Bool)

(assert (=> bm!48831 m!1046569))

(assert (=> b!1132959 d!131803))

(declare-fun d!131805 () Bool)

(declare-fun res!756626 () Bool)

(declare-fun e!645048 () Bool)

(assert (=> d!131805 (=> res!756626 e!645048)))

(assert (=> d!131805 (= res!756626 (= (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!131805 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!645048)))

(declare-fun b!1133277 () Bool)

(declare-fun e!645049 () Bool)

(assert (=> b!1133277 (= e!645048 e!645049)))

(declare-fun res!756627 () Bool)

(assert (=> b!1133277 (=> (not res!756627) (not e!645049))))

(assert (=> b!1133277 (= res!756627 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun b!1133278 () Bool)

(assert (=> b!1133278 (= e!645049 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!131805 (not res!756626)) b!1133277))

(assert (= (and b!1133277 res!756627) b!1133278))

(assert (=> d!131805 m!1046523))

(declare-fun m!1046571 () Bool)

(assert (=> b!1133278 m!1046571))

(assert (=> b!1132935 d!131805))

(declare-fun d!131807 () Bool)

(assert (=> d!131807 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1132950 d!131807))

(declare-fun b!1133279 () Bool)

(declare-fun e!645053 () Bool)

(assert (=> b!1133279 (= e!645053 (contains!6552 Nil!24796 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!131809 () Bool)

(declare-fun res!756629 () Bool)

(declare-fun e!645051 () Bool)

(assert (=> d!131809 (=> res!756629 e!645051)))

(assert (=> d!131809 (= res!756629 (bvsge #b00000000000000000000000000000000 (size!36099 _keys!1208)))))

(assert (=> d!131809 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24796) e!645051)))

(declare-fun b!1133280 () Bool)

(declare-fun e!645052 () Bool)

(declare-fun call!48835 () Bool)

(assert (=> b!1133280 (= e!645052 call!48835)))

(declare-fun b!1133281 () Bool)

(declare-fun e!645050 () Bool)

(assert (=> b!1133281 (= e!645051 e!645050)))

(declare-fun res!756628 () Bool)

(assert (=> b!1133281 (=> (not res!756628) (not e!645050))))

(assert (=> b!1133281 (= res!756628 (not e!645053))))

(declare-fun res!756630 () Bool)

(assert (=> b!1133281 (=> (not res!756630) (not e!645053))))

(assert (=> b!1133281 (= res!756630 (validKeyInArray!0 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1133282 () Bool)

(assert (=> b!1133282 (= e!645052 call!48835)))

(declare-fun b!1133283 () Bool)

(assert (=> b!1133283 (= e!645050 e!645052)))

(declare-fun c!110694 () Bool)

(assert (=> b!1133283 (= c!110694 (validKeyInArray!0 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!48832 () Bool)

(assert (=> bm!48832 (= call!48835 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110694 (Cons!24795 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) Nil!24796) Nil!24796)))))

(assert (= (and d!131809 (not res!756629)) b!1133281))

(assert (= (and b!1133281 res!756630) b!1133279))

(assert (= (and b!1133281 res!756628) b!1133283))

(assert (= (and b!1133283 c!110694) b!1133280))

(assert (= (and b!1133283 (not c!110694)) b!1133282))

(assert (= (or b!1133280 b!1133282) bm!48832))

(assert (=> b!1133279 m!1046487))

(assert (=> b!1133279 m!1046487))

(declare-fun m!1046573 () Bool)

(assert (=> b!1133279 m!1046573))

(assert (=> b!1133281 m!1046487))

(assert (=> b!1133281 m!1046487))

(assert (=> b!1133281 m!1046503))

(assert (=> b!1133283 m!1046487))

(assert (=> b!1133283 m!1046487))

(assert (=> b!1133283 m!1046503))

(assert (=> bm!48832 m!1046487))

(declare-fun m!1046575 () Bool)

(assert (=> bm!48832 m!1046575))

(assert (=> b!1132955 d!131809))

(declare-fun mapIsEmpty!44524 () Bool)

(declare-fun mapRes!44524 () Bool)

(assert (=> mapIsEmpty!44524 mapRes!44524))

(declare-fun b!1133290 () Bool)

(declare-fun e!645059 () Bool)

(assert (=> b!1133290 (= e!645059 tp_is_empty!28465)))

(declare-fun b!1133291 () Bool)

(declare-fun e!645058 () Bool)

(assert (=> b!1133291 (= e!645058 tp_is_empty!28465)))

(declare-fun condMapEmpty!44524 () Bool)

(declare-fun mapDefault!44524 () ValueCell!13523)

(assert (=> mapNonEmpty!44515 (= condMapEmpty!44524 (= mapRest!44515 ((as const (Array (_ BitVec 32) ValueCell!13523)) mapDefault!44524)))))

(assert (=> mapNonEmpty!44515 (= tp!84509 (and e!645058 mapRes!44524))))

(declare-fun mapNonEmpty!44524 () Bool)

(declare-fun tp!84524 () Bool)

(assert (=> mapNonEmpty!44524 (= mapRes!44524 (and tp!84524 e!645059))))

(declare-fun mapRest!44524 () (Array (_ BitVec 32) ValueCell!13523))

(declare-fun mapKey!44524 () (_ BitVec 32))

(declare-fun mapValue!44524 () ValueCell!13523)

(assert (=> mapNonEmpty!44524 (= mapRest!44515 (store mapRest!44524 mapKey!44524 mapValue!44524))))

(assert (= (and mapNonEmpty!44515 condMapEmpty!44524) mapIsEmpty!44524))

(assert (= (and mapNonEmpty!44515 (not condMapEmpty!44524)) mapNonEmpty!44524))

(assert (= (and mapNonEmpty!44524 ((_ is ValueCellFull!13523) mapValue!44524)) b!1133290))

(assert (= (and mapNonEmpty!44515 ((_ is ValueCellFull!13523) mapDefault!44524)) b!1133291))

(declare-fun m!1046577 () Bool)

(assert (=> mapNonEmpty!44524 m!1046577))

(declare-fun b_lambda!18941 () Bool)

(assert (= b_lambda!18925 (or (and start!98470 b_free!23935) b_lambda!18941)))

(declare-fun b_lambda!18943 () Bool)

(assert (= b_lambda!18939 (or (and start!98470 b_free!23935) b_lambda!18943)))

(declare-fun b_lambda!18945 () Bool)

(assert (= b_lambda!18933 (or (and start!98470 b_free!23935) b_lambda!18945)))

(declare-fun b_lambda!18947 () Bool)

(assert (= b_lambda!18935 (or (and start!98470 b_free!23935) b_lambda!18947)))

(declare-fun b_lambda!18949 () Bool)

(assert (= b_lambda!18927 (or (and start!98470 b_free!23935) b_lambda!18949)))

(declare-fun b_lambda!18951 () Bool)

(assert (= b_lambda!18923 (or (and start!98470 b_free!23935) b_lambda!18951)))

(declare-fun b_lambda!18953 () Bool)

(assert (= b_lambda!18931 (or (and start!98470 b_free!23935) b_lambda!18953)))

(declare-fun b_lambda!18955 () Bool)

(assert (= b_lambda!18929 (or (and start!98470 b_free!23935) b_lambda!18955)))

(declare-fun b_lambda!18957 () Bool)

(assert (= b_lambda!18937 (or (and start!98470 b_free!23935) b_lambda!18957)))

(check-sat (not bm!48819) (not b!1133276) (not b!1133187) (not b!1133283) (not b_lambda!18953) (not b!1133188) (not bm!48828) (not b!1133251) (not b!1133217) (not bm!48820) (not d!131795) (not bm!48827) (not b_lambda!18945) (not b!1133234) (not d!131769) (not b!1133197) (not b!1133181) (not d!131777) (not b!1133183) (not b_next!23935) (not b!1133182) (not b!1133235) (not bm!48818) (not b!1133193) (not b!1133250) (not b!1133200) (not b!1133173) (not b!1133246) (not d!131789) (not b!1133260) (not d!131773) (not d!131801) (not b!1133238) (not mapNonEmpty!44524) (not b!1133278) (not d!131767) (not b!1133279) (not b_lambda!18941) (not b!1133205) (not bm!48821) (not bm!48831) (not d!131793) (not bm!48815) (not b!1133170) (not d!131771) (not b!1133249) (not b!1133229) (not b!1133138) (not b!1133175) (not b!1133137) (not b!1133186) (not bm!48822) (not b!1133185) (not bm!48832) (not d!131797) (not b_lambda!18943) (not b!1133192) (not b_lambda!18921) (not b!1133168) (not b!1133274) (not d!131775) (not d!131779) (not b!1133169) (not b_lambda!18955) (not b!1133194) b_and!38691 (not b!1133245) (not b!1133233) (not b!1133180) (not b!1133244) (not b!1133272) (not b!1133199) (not b!1133281) (not b!1133231) (not b!1133214) (not b!1133224) (not b_lambda!18957) (not b!1133218) (not b_lambda!18947) (not b!1133216) (not d!131785) (not b!1133198) (not d!131787) (not b!1133195) (not b!1133252) (not b!1133247) (not b!1133171) (not b_lambda!18949) (not b!1133174) (not b!1133176) (not b!1133206) tp_is_empty!28465 (not b_lambda!18951) (not b!1133240) (not d!131799))
(check-sat b_and!38691 (not b_next!23935))
(get-model)

(declare-fun d!131811 () Bool)

(assert (=> d!131811 (= (validKeyInArray!0 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1133195 d!131811))

(declare-fun d!131813 () Bool)

(assert (=> d!131813 (= (validKeyInArray!0 (select (arr!35562 lt!503167) #b00000000000000000000000000000000)) (and (not (= (select (arr!35562 lt!503167) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35562 lt!503167) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1133137 d!131813))

(declare-fun d!131815 () Bool)

(declare-fun get!18103 (Option!675) V!43081)

(assert (=> d!131815 (= (apply!964 lt!503285 (select (arr!35562 lt!503167) from!1455)) (get!18103 (getValueByKey!624 (toList!8015 lt!503285) (select (arr!35562 lt!503167) from!1455))))))

(declare-fun bs!32981 () Bool)

(assert (= bs!32981 d!131815))

(assert (=> bs!32981 m!1046369))

(declare-fun m!1046579 () Bool)

(assert (=> bs!32981 m!1046579))

(assert (=> bs!32981 m!1046579))

(declare-fun m!1046581 () Bool)

(assert (=> bs!32981 m!1046581))

(assert (=> b!1133168 d!131815))

(declare-fun d!131817 () Bool)

(declare-fun c!110697 () Bool)

(assert (=> d!131817 (= c!110697 ((_ is ValueCellFull!13523) (select (arr!35563 lt!503154) from!1455)))))

(declare-fun e!645062 () V!43081)

(assert (=> d!131817 (= (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!645062)))

(declare-fun b!1133296 () Bool)

(declare-fun get!18104 (ValueCell!13523 V!43081) V!43081)

(assert (=> b!1133296 (= e!645062 (get!18104 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133297 () Bool)

(declare-fun get!18105 (ValueCell!13523 V!43081) V!43081)

(assert (=> b!1133297 (= e!645062 (get!18105 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131817 c!110697) b!1133296))

(assert (= (and d!131817 (not c!110697)) b!1133297))

(assert (=> b!1133296 m!1046375))

(assert (=> b!1133296 m!1046171))

(declare-fun m!1046583 () Bool)

(assert (=> b!1133296 m!1046583))

(assert (=> b!1133297 m!1046375))

(assert (=> b!1133297 m!1046171))

(declare-fun m!1046585 () Bool)

(assert (=> b!1133297 m!1046585))

(assert (=> b!1133168 d!131817))

(declare-fun d!131819 () Bool)

(declare-fun res!756635 () Bool)

(declare-fun e!645067 () Bool)

(assert (=> d!131819 (=> res!756635 e!645067)))

(assert (=> d!131819 (= res!756635 (and ((_ is Cons!24794) (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9022 (h!26012 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!131819 (= (containsKey!587 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!645067)))

(declare-fun b!1133302 () Bool)

(declare-fun e!645068 () Bool)

(assert (=> b!1133302 (= e!645067 e!645068)))

(declare-fun res!756636 () Bool)

(assert (=> b!1133302 (=> (not res!756636) (not e!645068))))

(assert (=> b!1133302 (= res!756636 (and (or (not ((_ is Cons!24794) (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (bvsle (_1!9022 (h!26012 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)) ((_ is Cons!24794) (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (bvslt (_1!9022 (h!26012 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(declare-fun b!1133303 () Bool)

(assert (=> b!1133303 (= e!645068 (containsKey!587 (t!35717 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(assert (= (and d!131819 (not res!756635)) b!1133302))

(assert (= (and b!1133302 res!756636) b!1133303))

(declare-fun m!1046587 () Bool)

(assert (=> b!1133303 m!1046587))

(assert (=> d!131777 d!131819))

(declare-fun d!131821 () Bool)

(declare-fun lt!503364 () ListLongMap!15999)

(assert (=> d!131821 (not (contains!6548 lt!503364 k0!934))))

(assert (=> d!131821 (= lt!503364 (ListLongMap!16000 (removeStrictlySorted!88 (toList!8015 call!48831) k0!934)))))

(assert (=> d!131821 (= (-!1172 call!48831 k0!934) lt!503364)))

(declare-fun bs!32982 () Bool)

(assert (= bs!32982 d!131821))

(declare-fun m!1046589 () Bool)

(assert (=> bs!32982 m!1046589))

(declare-fun m!1046591 () Bool)

(assert (=> bs!32982 m!1046591))

(assert (=> b!1133260 d!131821))

(declare-fun d!131823 () Bool)

(declare-fun e!645069 () Bool)

(assert (=> d!131823 e!645069))

(declare-fun res!756637 () Bool)

(assert (=> d!131823 (=> res!756637 e!645069)))

(declare-fun lt!503365 () Bool)

(assert (=> d!131823 (= res!756637 (not lt!503365))))

(declare-fun lt!503366 () Bool)

(assert (=> d!131823 (= lt!503365 lt!503366)))

(declare-fun lt!503367 () Unit!37045)

(declare-fun e!645070 () Unit!37045)

(assert (=> d!131823 (= lt!503367 e!645070)))

(declare-fun c!110698 () Bool)

(assert (=> d!131823 (= c!110698 lt!503366)))

(assert (=> d!131823 (= lt!503366 (containsKey!587 (toList!8015 lt!503313) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131823 (= (contains!6548 lt!503313 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!503365)))

(declare-fun b!1133304 () Bool)

(declare-fun lt!503368 () Unit!37045)

(assert (=> b!1133304 (= e!645070 lt!503368)))

(assert (=> b!1133304 (= lt!503368 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503313) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> b!1133304 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503313) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133305 () Bool)

(declare-fun Unit!37056 () Unit!37045)

(assert (=> b!1133305 (= e!645070 Unit!37056)))

(declare-fun b!1133306 () Bool)

(assert (=> b!1133306 (= e!645069 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503313) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!131823 c!110698) b!1133304))

(assert (= (and d!131823 (not c!110698)) b!1133305))

(assert (= (and d!131823 (not res!756637)) b!1133306))

(declare-fun m!1046593 () Bool)

(assert (=> d!131823 m!1046593))

(declare-fun m!1046595 () Bool)

(assert (=> b!1133304 m!1046595))

(assert (=> b!1133304 m!1046457))

(assert (=> b!1133304 m!1046457))

(declare-fun m!1046597 () Bool)

(assert (=> b!1133304 m!1046597))

(assert (=> b!1133306 m!1046457))

(assert (=> b!1133306 m!1046457))

(assert (=> b!1133306 m!1046597))

(assert (=> d!131773 d!131823))

(declare-fun b!1133318 () Bool)

(declare-fun e!645076 () Option!675)

(assert (=> b!1133318 (= e!645076 None!673)))

(declare-fun b!1133316 () Bool)

(declare-fun e!645075 () Option!675)

(assert (=> b!1133316 (= e!645075 e!645076)))

(declare-fun c!110704 () Bool)

(assert (=> b!1133316 (= c!110704 (and ((_ is Cons!24794) lt!503310) (not (= (_1!9022 (h!26012 lt!503310)) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun d!131825 () Bool)

(declare-fun c!110703 () Bool)

(assert (=> d!131825 (= c!110703 (and ((_ is Cons!24794) lt!503310) (= (_1!9022 (h!26012 lt!503310)) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!131825 (= (getValueByKey!624 lt!503310 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!645075)))

(declare-fun b!1133317 () Bool)

(assert (=> b!1133317 (= e!645076 (getValueByKey!624 (t!35717 lt!503310) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133315 () Bool)

(assert (=> b!1133315 (= e!645075 (Some!674 (_2!9022 (h!26012 lt!503310))))))

(assert (= (and d!131825 c!110703) b!1133315))

(assert (= (and d!131825 (not c!110703)) b!1133316))

(assert (= (and b!1133316 c!110704) b!1133317))

(assert (= (and b!1133316 (not c!110704)) b!1133318))

(declare-fun m!1046599 () Bool)

(assert (=> b!1133317 m!1046599))

(assert (=> d!131773 d!131825))

(declare-fun d!131827 () Bool)

(assert (=> d!131827 (= (getValueByKey!624 lt!503310 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!674 (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!503371 () Unit!37045)

(declare-fun choose!1782 (List!24798 (_ BitVec 64) V!43081) Unit!37045)

(assert (=> d!131827 (= lt!503371 (choose!1782 lt!503310 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!645079 () Bool)

(assert (=> d!131827 e!645079))

(declare-fun res!756642 () Bool)

(assert (=> d!131827 (=> (not res!756642) (not e!645079))))

(declare-fun isStrictlySorted!715 (List!24798) Bool)

(assert (=> d!131827 (= res!756642 (isStrictlySorted!715 lt!503310))))

(assert (=> d!131827 (= (lemmaContainsTupThenGetReturnValue!306 lt!503310 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!503371)))

(declare-fun b!1133323 () Bool)

(declare-fun res!756643 () Bool)

(assert (=> b!1133323 (=> (not res!756643) (not e!645079))))

(assert (=> b!1133323 (= res!756643 (containsKey!587 lt!503310 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133324 () Bool)

(assert (=> b!1133324 (= e!645079 (contains!6551 lt!503310 (tuple2!18023 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!131827 res!756642) b!1133323))

(assert (= (and b!1133323 res!756643) b!1133324))

(assert (=> d!131827 m!1046451))

(declare-fun m!1046601 () Bool)

(assert (=> d!131827 m!1046601))

(declare-fun m!1046603 () Bool)

(assert (=> d!131827 m!1046603))

(declare-fun m!1046605 () Bool)

(assert (=> b!1133323 m!1046605))

(declare-fun m!1046607 () Bool)

(assert (=> b!1133324 m!1046607))

(assert (=> d!131773 d!131827))

(declare-fun b!1133345 () Bool)

(declare-fun c!110716 () Bool)

(assert (=> b!1133345 (= c!110716 (and ((_ is Cons!24794) (toList!8015 lt!503153)) (bvsgt (_1!9022 (h!26012 (toList!8015 lt!503153))) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun e!645093 () List!24798)

(declare-fun e!645094 () List!24798)

(assert (=> b!1133345 (= e!645093 e!645094)))

(declare-fun c!110715 () Bool)

(declare-fun b!1133346 () Bool)

(declare-fun e!645092 () List!24798)

(assert (=> b!1133346 (= e!645092 (ite c!110715 (t!35717 (toList!8015 lt!503153)) (ite c!110716 (Cons!24794 (h!26012 (toList!8015 lt!503153)) (t!35717 (toList!8015 lt!503153))) Nil!24795)))))

(declare-fun bm!48839 () Bool)

(declare-fun call!48843 () List!24798)

(declare-fun c!110714 () Bool)

(declare-fun $colon$colon!609 (List!24798 tuple2!18022) List!24798)

(assert (=> bm!48839 (= call!48843 ($colon$colon!609 e!645092 (ite c!110714 (h!26012 (toList!8015 lt!503153)) (tuple2!18023 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun c!110713 () Bool)

(assert (=> bm!48839 (= c!110713 c!110714)))

(declare-fun b!1133347 () Bool)

(declare-fun e!645091 () List!24798)

(assert (=> b!1133347 (= e!645091 e!645093)))

(assert (=> b!1133347 (= c!110715 (and ((_ is Cons!24794) (toList!8015 lt!503153)) (= (_1!9022 (h!26012 (toList!8015 lt!503153))) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun bm!48840 () Bool)

(declare-fun call!48842 () List!24798)

(assert (=> bm!48840 (= call!48842 call!48843)))

(declare-fun bm!48841 () Bool)

(declare-fun call!48844 () List!24798)

(assert (=> bm!48841 (= call!48844 call!48842)))

(declare-fun e!645090 () Bool)

(declare-fun b!1133349 () Bool)

(declare-fun lt!503374 () List!24798)

(assert (=> b!1133349 (= e!645090 (contains!6551 lt!503374 (tuple2!18023 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1133350 () Bool)

(assert (=> b!1133350 (= e!645094 call!48844)))

(declare-fun b!1133351 () Bool)

(assert (=> b!1133351 (= e!645091 call!48843)))

(declare-fun d!131829 () Bool)

(assert (=> d!131829 e!645090))

(declare-fun res!756649 () Bool)

(assert (=> d!131829 (=> (not res!756649) (not e!645090))))

(assert (=> d!131829 (= res!756649 (isStrictlySorted!715 lt!503374))))

(assert (=> d!131829 (= lt!503374 e!645091)))

(assert (=> d!131829 (= c!110714 (and ((_ is Cons!24794) (toList!8015 lt!503153)) (bvslt (_1!9022 (h!26012 (toList!8015 lt!503153))) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!131829 (isStrictlySorted!715 (toList!8015 lt!503153))))

(assert (=> d!131829 (= (insertStrictlySorted!399 (toList!8015 lt!503153) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!503374)))

(declare-fun b!1133348 () Bool)

(assert (=> b!1133348 (= e!645094 call!48844)))

(declare-fun b!1133352 () Bool)

(declare-fun res!756648 () Bool)

(assert (=> b!1133352 (=> (not res!756648) (not e!645090))))

(assert (=> b!1133352 (= res!756648 (containsKey!587 lt!503374 (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133353 () Bool)

(assert (=> b!1133353 (= e!645093 call!48842)))

(declare-fun b!1133354 () Bool)

(assert (=> b!1133354 (= e!645092 (insertStrictlySorted!399 (t!35717 (toList!8015 lt!503153)) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131829 c!110714) b!1133351))

(assert (= (and d!131829 (not c!110714)) b!1133347))

(assert (= (and b!1133347 c!110715) b!1133353))

(assert (= (and b!1133347 (not c!110715)) b!1133345))

(assert (= (and b!1133345 c!110716) b!1133350))

(assert (= (and b!1133345 (not c!110716)) b!1133348))

(assert (= (or b!1133350 b!1133348) bm!48841))

(assert (= (or b!1133353 bm!48841) bm!48840))

(assert (= (or b!1133351 bm!48840) bm!48839))

(assert (= (and bm!48839 c!110713) b!1133354))

(assert (= (and bm!48839 (not c!110713)) b!1133346))

(assert (= (and d!131829 res!756649) b!1133352))

(assert (= (and b!1133352 res!756648) b!1133349))

(declare-fun m!1046609 () Bool)

(assert (=> b!1133352 m!1046609))

(declare-fun m!1046611 () Bool)

(assert (=> b!1133349 m!1046611))

(declare-fun m!1046613 () Bool)

(assert (=> b!1133354 m!1046613))

(declare-fun m!1046615 () Bool)

(assert (=> d!131829 m!1046615))

(declare-fun m!1046617 () Bool)

(assert (=> d!131829 m!1046617))

(declare-fun m!1046619 () Bool)

(assert (=> bm!48839 m!1046619))

(assert (=> d!131773 d!131829))

(declare-fun d!131831 () Bool)

(declare-fun isEmpty!978 (List!24798) Bool)

(assert (=> d!131831 (= (isEmpty!977 lt!503354) (isEmpty!978 (toList!8015 lt!503354)))))

(declare-fun bs!32983 () Bool)

(assert (= bs!32983 d!131831))

(declare-fun m!1046621 () Bool)

(assert (=> bs!32983 m!1046621))

(assert (=> b!1133252 d!131831))

(declare-fun b!1133355 () Bool)

(declare-fun e!645098 () Bool)

(declare-fun e!645100 () Bool)

(assert (=> b!1133355 (= e!645098 e!645100)))

(declare-fun c!110718 () Bool)

(declare-fun e!645097 () Bool)

(assert (=> b!1133355 (= c!110718 e!645097)))

(declare-fun res!756650 () Bool)

(assert (=> b!1133355 (=> (not res!756650) (not e!645097))))

(assert (=> b!1133355 (= res!756650 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun b!1133356 () Bool)

(declare-fun e!645095 () ListLongMap!15999)

(declare-fun call!48845 () ListLongMap!15999)

(assert (=> b!1133356 (= e!645095 call!48845)))

(declare-fun d!131833 () Bool)

(assert (=> d!131833 e!645098))

(declare-fun res!756652 () Bool)

(assert (=> d!131833 (=> (not res!756652) (not e!645098))))

(declare-fun lt!503379 () ListLongMap!15999)

(assert (=> d!131833 (= res!756652 (not (contains!6548 lt!503379 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!645096 () ListLongMap!15999)

(assert (=> d!131833 (= lt!503379 e!645096)))

(declare-fun c!110719 () Bool)

(assert (=> d!131833 (= c!110719 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(assert (=> d!131833 (validMask!0 mask!1564)))

(assert (=> d!131833 (= (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!503379)))

(declare-fun b!1133357 () Bool)

(declare-fun e!645099 () Bool)

(assert (=> b!1133357 (= e!645100 e!645099)))

(declare-fun c!110717 () Bool)

(assert (=> b!1133357 (= c!110717 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun b!1133358 () Bool)

(assert (=> b!1133358 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(assert (=> b!1133358 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36100 _values!996)))))

(declare-fun e!645101 () Bool)

(assert (=> b!1133358 (= e!645101 (= (apply!964 lt!503379 (select (arr!35562 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))) (get!18102 (select (arr!35563 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1133359 () Bool)

(assert (=> b!1133359 (= e!645096 e!645095)))

(declare-fun c!110720 () Bool)

(assert (=> b!1133359 (= c!110720 (validKeyInArray!0 (select (arr!35562 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1133360 () Bool)

(declare-fun lt!503376 () Unit!37045)

(declare-fun lt!503377 () Unit!37045)

(assert (=> b!1133360 (= lt!503376 lt!503377)))

(declare-fun lt!503380 () V!43081)

(declare-fun lt!503378 () ListLongMap!15999)

(declare-fun lt!503375 () (_ BitVec 64))

(declare-fun lt!503381 () (_ BitVec 64))

(assert (=> b!1133360 (not (contains!6548 (+!3479 lt!503378 (tuple2!18023 lt!503381 lt!503380)) lt!503375))))

(assert (=> b!1133360 (= lt!503377 (addStillNotContains!285 lt!503378 lt!503381 lt!503380 lt!503375))))

(assert (=> b!1133360 (= lt!503375 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133360 (= lt!503380 (get!18102 (select (arr!35563 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133360 (= lt!503381 (select (arr!35562 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1133360 (= lt!503378 call!48845)))

(assert (=> b!1133360 (= e!645095 (+!3479 call!48845 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (get!18102 (select (arr!35563 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133361 () Bool)

(assert (=> b!1133361 (= e!645097 (validKeyInArray!0 (select (arr!35562 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1133361 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!48842 () Bool)

(assert (=> bm!48842 (= call!48845 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133362 () Bool)

(assert (=> b!1133362 (= e!645096 (ListLongMap!16000 Nil!24795))))

(declare-fun b!1133363 () Bool)

(declare-fun res!756653 () Bool)

(assert (=> b!1133363 (=> (not res!756653) (not e!645098))))

(assert (=> b!1133363 (= res!756653 (not (contains!6548 lt!503379 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133364 () Bool)

(assert (=> b!1133364 (= e!645100 e!645101)))

(assert (=> b!1133364 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun res!756651 () Bool)

(assert (=> b!1133364 (= res!756651 (contains!6548 lt!503379 (select (arr!35562 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1133364 (=> (not res!756651) (not e!645101))))

(declare-fun b!1133365 () Bool)

(assert (=> b!1133365 (= e!645099 (= lt!503379 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133366 () Bool)

(assert (=> b!1133366 (= e!645099 (isEmpty!977 lt!503379))))

(assert (= (and d!131833 c!110719) b!1133362))

(assert (= (and d!131833 (not c!110719)) b!1133359))

(assert (= (and b!1133359 c!110720) b!1133360))

(assert (= (and b!1133359 (not c!110720)) b!1133356))

(assert (= (or b!1133360 b!1133356) bm!48842))

(assert (= (and d!131833 res!756652) b!1133363))

(assert (= (and b!1133363 res!756653) b!1133355))

(assert (= (and b!1133355 res!756650) b!1133361))

(assert (= (and b!1133355 c!110718) b!1133364))

(assert (= (and b!1133355 (not c!110718)) b!1133357))

(assert (= (and b!1133364 res!756651) b!1133358))

(assert (= (and b!1133357 c!110717) b!1133365))

(assert (= (and b!1133357 (not c!110717)) b!1133366))

(declare-fun b_lambda!18959 () Bool)

(assert (=> (not b_lambda!18959) (not b!1133358)))

(assert (=> b!1133358 t!35716))

(declare-fun b_and!38693 () Bool)

(assert (= b_and!38691 (and (=> t!35716 result!18047) b_and!38693)))

(declare-fun b_lambda!18961 () Bool)

(assert (=> (not b_lambda!18961) (not b!1133360)))

(assert (=> b!1133360 t!35716))

(declare-fun b_and!38695 () Bool)

(assert (= b_and!38693 (and (=> t!35716 result!18047) b_and!38695)))

(declare-fun m!1046623 () Bool)

(assert (=> b!1133366 m!1046623))

(declare-fun m!1046625 () Bool)

(assert (=> b!1133361 m!1046625))

(assert (=> b!1133361 m!1046625))

(declare-fun m!1046627 () Bool)

(assert (=> b!1133361 m!1046627))

(declare-fun m!1046629 () Bool)

(assert (=> b!1133365 m!1046629))

(declare-fun m!1046631 () Bool)

(assert (=> b!1133360 m!1046631))

(assert (=> b!1133360 m!1046631))

(assert (=> b!1133360 m!1046171))

(declare-fun m!1046633 () Bool)

(assert (=> b!1133360 m!1046633))

(declare-fun m!1046635 () Bool)

(assert (=> b!1133360 m!1046635))

(declare-fun m!1046637 () Bool)

(assert (=> b!1133360 m!1046637))

(assert (=> b!1133360 m!1046171))

(declare-fun m!1046639 () Bool)

(assert (=> b!1133360 m!1046639))

(assert (=> b!1133360 m!1046625))

(assert (=> b!1133360 m!1046637))

(declare-fun m!1046641 () Bool)

(assert (=> b!1133360 m!1046641))

(assert (=> b!1133359 m!1046625))

(assert (=> b!1133359 m!1046625))

(assert (=> b!1133359 m!1046627))

(assert (=> b!1133358 m!1046631))

(assert (=> b!1133358 m!1046631))

(assert (=> b!1133358 m!1046171))

(assert (=> b!1133358 m!1046633))

(assert (=> b!1133358 m!1046625))

(assert (=> b!1133358 m!1046171))

(assert (=> b!1133358 m!1046625))

(declare-fun m!1046643 () Bool)

(assert (=> b!1133358 m!1046643))

(declare-fun m!1046645 () Bool)

(assert (=> d!131833 m!1046645))

(assert (=> d!131833 m!1046195))

(assert (=> bm!48842 m!1046629))

(declare-fun m!1046647 () Bool)

(assert (=> b!1133363 m!1046647))

(assert (=> b!1133364 m!1046625))

(assert (=> b!1133364 m!1046625))

(declare-fun m!1046649 () Bool)

(assert (=> b!1133364 m!1046649))

(assert (=> b!1133187 d!131833))

(assert (=> b!1133193 d!131811))

(declare-fun d!131835 () Bool)

(declare-fun res!756654 () Bool)

(declare-fun e!645102 () Bool)

(assert (=> d!131835 (=> res!756654 e!645102)))

(assert (=> d!131835 (= res!756654 (and ((_ is Cons!24794) (toList!8015 (ite c!110617 lt!503163 call!48766))) (= (_1!9022 (h!26012 (toList!8015 (ite c!110617 lt!503163 call!48766)))) k0!934)))))

(assert (=> d!131835 (= (containsKey!587 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934) e!645102)))

(declare-fun b!1133367 () Bool)

(declare-fun e!645103 () Bool)

(assert (=> b!1133367 (= e!645102 e!645103)))

(declare-fun res!756655 () Bool)

(assert (=> b!1133367 (=> (not res!756655) (not e!645103))))

(assert (=> b!1133367 (= res!756655 (and (or (not ((_ is Cons!24794) (toList!8015 (ite c!110617 lt!503163 call!48766)))) (bvsle (_1!9022 (h!26012 (toList!8015 (ite c!110617 lt!503163 call!48766)))) k0!934)) ((_ is Cons!24794) (toList!8015 (ite c!110617 lt!503163 call!48766))) (bvslt (_1!9022 (h!26012 (toList!8015 (ite c!110617 lt!503163 call!48766)))) k0!934)))))

(declare-fun b!1133368 () Bool)

(assert (=> b!1133368 (= e!645103 (containsKey!587 (t!35717 (toList!8015 (ite c!110617 lt!503163 call!48766))) k0!934))))

(assert (= (and d!131835 (not res!756654)) b!1133367))

(assert (= (and b!1133367 res!756655) b!1133368))

(declare-fun m!1046651 () Bool)

(assert (=> b!1133368 m!1046651))

(assert (=> d!131789 d!131835))

(declare-fun b!1133369 () Bool)

(declare-fun e!645107 () Bool)

(declare-fun e!645109 () Bool)

(assert (=> b!1133369 (= e!645107 e!645109)))

(declare-fun c!110722 () Bool)

(declare-fun e!645106 () Bool)

(assert (=> b!1133369 (= c!110722 e!645106)))

(declare-fun res!756656 () Bool)

(assert (=> b!1133369 (=> (not res!756656) (not e!645106))))

(assert (=> b!1133369 (= res!756656 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(declare-fun b!1133370 () Bool)

(declare-fun e!645104 () ListLongMap!15999)

(declare-fun call!48846 () ListLongMap!15999)

(assert (=> b!1133370 (= e!645104 call!48846)))

(declare-fun d!131837 () Bool)

(assert (=> d!131837 e!645107))

(declare-fun res!756658 () Bool)

(assert (=> d!131837 (=> (not res!756658) (not e!645107))))

(declare-fun lt!503386 () ListLongMap!15999)

(assert (=> d!131837 (= res!756658 (not (contains!6548 lt!503386 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!645105 () ListLongMap!15999)

(assert (=> d!131837 (= lt!503386 e!645105)))

(declare-fun c!110723 () Bool)

(assert (=> d!131837 (= c!110723 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(assert (=> d!131837 (validMask!0 mask!1564)))

(assert (=> d!131837 (= (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!503386)))

(declare-fun b!1133371 () Bool)

(declare-fun e!645108 () Bool)

(assert (=> b!1133371 (= e!645109 e!645108)))

(declare-fun c!110721 () Bool)

(assert (=> b!1133371 (= c!110721 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(declare-fun b!1133372 () Bool)

(assert (=> b!1133372 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(assert (=> b!1133372 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36100 lt!503154)))))

(declare-fun e!645110 () Bool)

(assert (=> b!1133372 (= e!645110 (= (apply!964 lt!503386 (select (arr!35562 lt!503167) (bvadd from!1455 #b00000000000000000000000000000001))) (get!18102 (select (arr!35563 lt!503154) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1133373 () Bool)

(assert (=> b!1133373 (= e!645105 e!645104)))

(declare-fun c!110724 () Bool)

(assert (=> b!1133373 (= c!110724 (validKeyInArray!0 (select (arr!35562 lt!503167) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1133374 () Bool)

(declare-fun lt!503383 () Unit!37045)

(declare-fun lt!503384 () Unit!37045)

(assert (=> b!1133374 (= lt!503383 lt!503384)))

(declare-fun lt!503382 () (_ BitVec 64))

(declare-fun lt!503385 () ListLongMap!15999)

(declare-fun lt!503387 () V!43081)

(declare-fun lt!503388 () (_ BitVec 64))

(assert (=> b!1133374 (not (contains!6548 (+!3479 lt!503385 (tuple2!18023 lt!503388 lt!503387)) lt!503382))))

(assert (=> b!1133374 (= lt!503384 (addStillNotContains!285 lt!503385 lt!503388 lt!503387 lt!503382))))

(assert (=> b!1133374 (= lt!503382 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133374 (= lt!503387 (get!18102 (select (arr!35563 lt!503154) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133374 (= lt!503388 (select (arr!35562 lt!503167) (bvadd from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1133374 (= lt!503385 call!48846)))

(assert (=> b!1133374 (= e!645104 (+!3479 call!48846 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd from!1455 #b00000000000000000000000000000001)) (get!18102 (select (arr!35563 lt!503154) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133375 () Bool)

(assert (=> b!1133375 (= e!645106 (validKeyInArray!0 (select (arr!35562 lt!503167) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1133375 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!48843 () Bool)

(assert (=> bm!48843 (= call!48846 (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133376 () Bool)

(assert (=> b!1133376 (= e!645105 (ListLongMap!16000 Nil!24795))))

(declare-fun b!1133377 () Bool)

(declare-fun res!756659 () Bool)

(assert (=> b!1133377 (=> (not res!756659) (not e!645107))))

(assert (=> b!1133377 (= res!756659 (not (contains!6548 lt!503386 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133378 () Bool)

(assert (=> b!1133378 (= e!645109 e!645110)))

(assert (=> b!1133378 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(declare-fun res!756657 () Bool)

(assert (=> b!1133378 (= res!756657 (contains!6548 lt!503386 (select (arr!35562 lt!503167) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1133378 (=> (not res!756657) (not e!645110))))

(declare-fun b!1133379 () Bool)

(assert (=> b!1133379 (= e!645108 (= lt!503386 (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133380 () Bool)

(assert (=> b!1133380 (= e!645108 (isEmpty!977 lt!503386))))

(assert (= (and d!131837 c!110723) b!1133376))

(assert (= (and d!131837 (not c!110723)) b!1133373))

(assert (= (and b!1133373 c!110724) b!1133374))

(assert (= (and b!1133373 (not c!110724)) b!1133370))

(assert (= (or b!1133374 b!1133370) bm!48843))

(assert (= (and d!131837 res!756658) b!1133377))

(assert (= (and b!1133377 res!756659) b!1133369))

(assert (= (and b!1133369 res!756656) b!1133375))

(assert (= (and b!1133369 c!110722) b!1133378))

(assert (= (and b!1133369 (not c!110722)) b!1133371))

(assert (= (and b!1133378 res!756657) b!1133372))

(assert (= (and b!1133371 c!110721) b!1133379))

(assert (= (and b!1133371 (not c!110721)) b!1133380))

(declare-fun b_lambda!18963 () Bool)

(assert (=> (not b_lambda!18963) (not b!1133372)))

(assert (=> b!1133372 t!35716))

(declare-fun b_and!38697 () Bool)

(assert (= b_and!38695 (and (=> t!35716 result!18047) b_and!38697)))

(declare-fun b_lambda!18965 () Bool)

(assert (=> (not b_lambda!18965) (not b!1133374)))

(assert (=> b!1133374 t!35716))

(declare-fun b_and!38699 () Bool)

(assert (= b_and!38697 (and (=> t!35716 result!18047) b_and!38699)))

(declare-fun m!1046653 () Bool)

(assert (=> b!1133380 m!1046653))

(declare-fun m!1046655 () Bool)

(assert (=> b!1133375 m!1046655))

(assert (=> b!1133375 m!1046655))

(declare-fun m!1046657 () Bool)

(assert (=> b!1133375 m!1046657))

(declare-fun m!1046659 () Bool)

(assert (=> b!1133379 m!1046659))

(declare-fun m!1046661 () Bool)

(assert (=> b!1133374 m!1046661))

(assert (=> b!1133374 m!1046661))

(assert (=> b!1133374 m!1046171))

(declare-fun m!1046663 () Bool)

(assert (=> b!1133374 m!1046663))

(declare-fun m!1046665 () Bool)

(assert (=> b!1133374 m!1046665))

(declare-fun m!1046667 () Bool)

(assert (=> b!1133374 m!1046667))

(assert (=> b!1133374 m!1046171))

(declare-fun m!1046669 () Bool)

(assert (=> b!1133374 m!1046669))

(assert (=> b!1133374 m!1046655))

(assert (=> b!1133374 m!1046667))

(declare-fun m!1046671 () Bool)

(assert (=> b!1133374 m!1046671))

(assert (=> b!1133373 m!1046655))

(assert (=> b!1133373 m!1046655))

(assert (=> b!1133373 m!1046657))

(assert (=> b!1133372 m!1046661))

(assert (=> b!1133372 m!1046661))

(assert (=> b!1133372 m!1046171))

(assert (=> b!1133372 m!1046663))

(assert (=> b!1133372 m!1046655))

(assert (=> b!1133372 m!1046171))

(assert (=> b!1133372 m!1046655))

(declare-fun m!1046673 () Bool)

(assert (=> b!1133372 m!1046673))

(declare-fun m!1046675 () Bool)

(assert (=> d!131837 m!1046675))

(assert (=> d!131837 m!1046195))

(assert (=> bm!48843 m!1046659))

(declare-fun m!1046677 () Bool)

(assert (=> b!1133377 m!1046677))

(assert (=> b!1133378 m!1046655))

(assert (=> b!1133378 m!1046655))

(declare-fun m!1046679 () Bool)

(assert (=> b!1133378 m!1046679))

(assert (=> bm!48818 d!131837))

(declare-fun d!131839 () Bool)

(assert (=> d!131839 (= (isEmpty!977 lt!503299) (isEmpty!978 (toList!8015 lt!503299)))))

(declare-fun bs!32984 () Bool)

(assert (= bs!32984 d!131839))

(declare-fun m!1046681 () Bool)

(assert (=> bs!32984 m!1046681))

(assert (=> b!1133200 d!131839))

(declare-fun d!131841 () Bool)

(declare-fun e!645111 () Bool)

(assert (=> d!131841 e!645111))

(declare-fun res!756660 () Bool)

(assert (=> d!131841 (=> res!756660 e!645111)))

(declare-fun lt!503389 () Bool)

(assert (=> d!131841 (= res!756660 (not lt!503389))))

(declare-fun lt!503390 () Bool)

(assert (=> d!131841 (= lt!503389 lt!503390)))

(declare-fun lt!503391 () Unit!37045)

(declare-fun e!645112 () Unit!37045)

(assert (=> d!131841 (= lt!503391 e!645112)))

(declare-fun c!110725 () Bool)

(assert (=> d!131841 (= c!110725 lt!503390)))

(assert (=> d!131841 (= lt!503390 (containsKey!587 (toList!8015 lt!503285) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131841 (= (contains!6548 lt!503285 #b1000000000000000000000000000000000000000000000000000000000000000) lt!503389)))

(declare-fun b!1133381 () Bool)

(declare-fun lt!503392 () Unit!37045)

(assert (=> b!1133381 (= e!645112 lt!503392)))

(assert (=> b!1133381 (= lt!503392 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503285) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1133381 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503285) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1133382 () Bool)

(declare-fun Unit!37057 () Unit!37045)

(assert (=> b!1133382 (= e!645112 Unit!37057)))

(declare-fun b!1133383 () Bool)

(assert (=> b!1133383 (= e!645111 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503285) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131841 c!110725) b!1133381))

(assert (= (and d!131841 (not c!110725)) b!1133382))

(assert (= (and d!131841 (not res!756660)) b!1133383))

(declare-fun m!1046683 () Bool)

(assert (=> d!131841 m!1046683))

(declare-fun m!1046685 () Bool)

(assert (=> b!1133381 m!1046685))

(declare-fun m!1046687 () Bool)

(assert (=> b!1133381 m!1046687))

(assert (=> b!1133381 m!1046687))

(declare-fun m!1046689 () Bool)

(assert (=> b!1133381 m!1046689))

(assert (=> b!1133383 m!1046687))

(assert (=> b!1133383 m!1046687))

(assert (=> b!1133383 m!1046689))

(assert (=> b!1133173 d!131841))

(declare-fun b!1133384 () Bool)

(declare-fun e!645116 () Bool)

(assert (=> b!1133384 (= e!645116 (contains!6552 (ite c!110693 (Cons!24795 (select (arr!35562 lt!503167) #b00000000000000000000000000000000) Nil!24796) Nil!24796) (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!131843 () Bool)

(declare-fun res!756662 () Bool)

(declare-fun e!645114 () Bool)

(assert (=> d!131843 (=> res!756662 e!645114)))

(assert (=> d!131843 (= res!756662 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(assert (=> d!131843 (= (arrayNoDuplicates!0 lt!503167 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110693 (Cons!24795 (select (arr!35562 lt!503167) #b00000000000000000000000000000000) Nil!24796) Nil!24796)) e!645114)))

(declare-fun b!1133385 () Bool)

(declare-fun e!645115 () Bool)

(declare-fun call!48847 () Bool)

(assert (=> b!1133385 (= e!645115 call!48847)))

(declare-fun b!1133386 () Bool)

(declare-fun e!645113 () Bool)

(assert (=> b!1133386 (= e!645114 e!645113)))

(declare-fun res!756661 () Bool)

(assert (=> b!1133386 (=> (not res!756661) (not e!645113))))

(assert (=> b!1133386 (= res!756661 (not e!645116))))

(declare-fun res!756663 () Bool)

(assert (=> b!1133386 (=> (not res!756663) (not e!645116))))

(assert (=> b!1133386 (= res!756663 (validKeyInArray!0 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1133387 () Bool)

(assert (=> b!1133387 (= e!645115 call!48847)))

(declare-fun b!1133388 () Bool)

(assert (=> b!1133388 (= e!645113 e!645115)))

(declare-fun c!110726 () Bool)

(assert (=> b!1133388 (= c!110726 (validKeyInArray!0 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!48844 () Bool)

(assert (=> bm!48844 (= call!48847 (arrayNoDuplicates!0 lt!503167 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!110726 (Cons!24795 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!110693 (Cons!24795 (select (arr!35562 lt!503167) #b00000000000000000000000000000000) Nil!24796) Nil!24796)) (ite c!110693 (Cons!24795 (select (arr!35562 lt!503167) #b00000000000000000000000000000000) Nil!24796) Nil!24796))))))

(assert (= (and d!131843 (not res!756662)) b!1133386))

(assert (= (and b!1133386 res!756663) b!1133384))

(assert (= (and b!1133386 res!756661) b!1133388))

(assert (= (and b!1133388 c!110726) b!1133385))

(assert (= (and b!1133388 (not c!110726)) b!1133387))

(assert (= (or b!1133385 b!1133387) bm!48844))

(declare-fun m!1046691 () Bool)

(assert (=> b!1133384 m!1046691))

(assert (=> b!1133384 m!1046691))

(declare-fun m!1046693 () Bool)

(assert (=> b!1133384 m!1046693))

(assert (=> b!1133386 m!1046691))

(assert (=> b!1133386 m!1046691))

(declare-fun m!1046695 () Bool)

(assert (=> b!1133386 m!1046695))

(assert (=> b!1133388 m!1046691))

(assert (=> b!1133388 m!1046691))

(assert (=> b!1133388 m!1046695))

(assert (=> bm!48844 m!1046691))

(declare-fun m!1046697 () Bool)

(assert (=> bm!48844 m!1046697))

(assert (=> bm!48831 d!131843))

(declare-fun d!131845 () Bool)

(declare-fun res!756664 () Bool)

(declare-fun e!645119 () Bool)

(assert (=> d!131845 (=> res!756664 e!645119)))

(assert (=> d!131845 (= res!756664 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(assert (=> d!131845 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!503167 mask!1564) e!645119)))

(declare-fun b!1133389 () Bool)

(declare-fun e!645117 () Bool)

(assert (=> b!1133389 (= e!645119 e!645117)))

(declare-fun c!110727 () Bool)

(assert (=> b!1133389 (= c!110727 (validKeyInArray!0 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1133390 () Bool)

(declare-fun e!645118 () Bool)

(assert (=> b!1133390 (= e!645117 e!645118)))

(declare-fun lt!503395 () (_ BitVec 64))

(assert (=> b!1133390 (= lt!503395 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!503394 () Unit!37045)

(assert (=> b!1133390 (= lt!503394 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!503167 lt!503395 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1133390 (arrayContainsKey!0 lt!503167 lt!503395 #b00000000000000000000000000000000)))

(declare-fun lt!503393 () Unit!37045)

(assert (=> b!1133390 (= lt!503393 lt!503394)))

(declare-fun res!756665 () Bool)

(assert (=> b!1133390 (= res!756665 (= (seekEntryOrOpen!0 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!503167 mask!1564) (Found!9881 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1133390 (=> (not res!756665) (not e!645118))))

(declare-fun bm!48845 () Bool)

(declare-fun call!48848 () Bool)

(assert (=> bm!48845 (= call!48848 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!503167 mask!1564))))

(declare-fun b!1133391 () Bool)

(assert (=> b!1133391 (= e!645117 call!48848)))

(declare-fun b!1133392 () Bool)

(assert (=> b!1133392 (= e!645118 call!48848)))

(assert (= (and d!131845 (not res!756664)) b!1133389))

(assert (= (and b!1133389 c!110727) b!1133390))

(assert (= (and b!1133389 (not c!110727)) b!1133391))

(assert (= (and b!1133390 res!756665) b!1133392))

(assert (= (or b!1133392 b!1133391) bm!48845))

(assert (=> b!1133389 m!1046691))

(assert (=> b!1133389 m!1046691))

(assert (=> b!1133389 m!1046695))

(assert (=> b!1133390 m!1046691))

(declare-fun m!1046699 () Bool)

(assert (=> b!1133390 m!1046699))

(declare-fun m!1046701 () Bool)

(assert (=> b!1133390 m!1046701))

(assert (=> b!1133390 m!1046691))

(declare-fun m!1046703 () Bool)

(assert (=> b!1133390 m!1046703))

(declare-fun m!1046705 () Bool)

(assert (=> bm!48845 m!1046705))

(assert (=> bm!48815 d!131845))

(declare-fun d!131847 () Bool)

(declare-fun e!645120 () Bool)

(assert (=> d!131847 e!645120))

(declare-fun res!756666 () Bool)

(assert (=> d!131847 (=> res!756666 e!645120)))

(declare-fun lt!503396 () Bool)

(assert (=> d!131847 (= res!756666 (not lt!503396))))

(declare-fun lt!503397 () Bool)

(assert (=> d!131847 (= lt!503396 lt!503397)))

(declare-fun lt!503398 () Unit!37045)

(declare-fun e!645121 () Unit!37045)

(assert (=> d!131847 (= lt!503398 e!645121)))

(declare-fun c!110728 () Bool)

(assert (=> d!131847 (= c!110728 lt!503397)))

(assert (=> d!131847 (= lt!503397 (containsKey!587 (toList!8015 (+!3479 lt!503284 (tuple2!18023 lt!503287 lt!503286))) lt!503281))))

(assert (=> d!131847 (= (contains!6548 (+!3479 lt!503284 (tuple2!18023 lt!503287 lt!503286)) lt!503281) lt!503396)))

(declare-fun b!1133393 () Bool)

(declare-fun lt!503399 () Unit!37045)

(assert (=> b!1133393 (= e!645121 lt!503399)))

(assert (=> b!1133393 (= lt!503399 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (+!3479 lt!503284 (tuple2!18023 lt!503287 lt!503286))) lt!503281))))

(assert (=> b!1133393 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503284 (tuple2!18023 lt!503287 lt!503286))) lt!503281))))

(declare-fun b!1133394 () Bool)

(declare-fun Unit!37058 () Unit!37045)

(assert (=> b!1133394 (= e!645121 Unit!37058)))

(declare-fun b!1133395 () Bool)

(assert (=> b!1133395 (= e!645120 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503284 (tuple2!18023 lt!503287 lt!503286))) lt!503281)))))

(assert (= (and d!131847 c!110728) b!1133393))

(assert (= (and d!131847 (not c!110728)) b!1133394))

(assert (= (and d!131847 (not res!756666)) b!1133395))

(declare-fun m!1046707 () Bool)

(assert (=> d!131847 m!1046707))

(declare-fun m!1046709 () Bool)

(assert (=> b!1133393 m!1046709))

(declare-fun m!1046711 () Bool)

(assert (=> b!1133393 m!1046711))

(assert (=> b!1133393 m!1046711))

(declare-fun m!1046713 () Bool)

(assert (=> b!1133393 m!1046713))

(assert (=> b!1133395 m!1046711))

(assert (=> b!1133395 m!1046711))

(assert (=> b!1133395 m!1046713))

(assert (=> b!1133170 d!131847))

(declare-fun d!131849 () Bool)

(declare-fun e!645122 () Bool)

(assert (=> d!131849 e!645122))

(declare-fun res!756667 () Bool)

(assert (=> d!131849 (=> (not res!756667) (not e!645122))))

(declare-fun lt!503403 () ListLongMap!15999)

(assert (=> d!131849 (= res!756667 (contains!6548 lt!503403 (_1!9022 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!503400 () List!24798)

(assert (=> d!131849 (= lt!503403 (ListLongMap!16000 lt!503400))))

(declare-fun lt!503401 () Unit!37045)

(declare-fun lt!503402 () Unit!37045)

(assert (=> d!131849 (= lt!503401 lt!503402)))

(assert (=> d!131849 (= (getValueByKey!624 lt!503400 (_1!9022 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!674 (_2!9022 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131849 (= lt!503402 (lemmaContainsTupThenGetReturnValue!306 lt!503400 (_1!9022 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9022 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131849 (= lt!503400 (insertStrictlySorted!399 (toList!8015 call!48821) (_1!9022 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9022 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131849 (= (+!3479 call!48821 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!503403)))

(declare-fun b!1133396 () Bool)

(declare-fun res!756668 () Bool)

(assert (=> b!1133396 (=> (not res!756668) (not e!645122))))

(assert (=> b!1133396 (= res!756668 (= (getValueByKey!624 (toList!8015 lt!503403) (_1!9022 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!674 (_2!9022 (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1133397 () Bool)

(assert (=> b!1133397 (= e!645122 (contains!6551 (toList!8015 lt!503403) (tuple2!18023 (select (arr!35562 lt!503167) from!1455) (get!18102 (select (arr!35563 lt!503154) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131849 res!756667) b!1133396))

(assert (= (and b!1133396 res!756668) b!1133397))

(declare-fun m!1046715 () Bool)

(assert (=> d!131849 m!1046715))

(declare-fun m!1046717 () Bool)

(assert (=> d!131849 m!1046717))

(declare-fun m!1046719 () Bool)

(assert (=> d!131849 m!1046719))

(declare-fun m!1046721 () Bool)

(assert (=> d!131849 m!1046721))

(declare-fun m!1046723 () Bool)

(assert (=> b!1133396 m!1046723))

(declare-fun m!1046725 () Bool)

(assert (=> b!1133397 m!1046725))

(assert (=> b!1133170 d!131849))

(assert (=> b!1133170 d!131817))

(declare-fun d!131851 () Bool)

(declare-fun e!645123 () Bool)

(assert (=> d!131851 e!645123))

(declare-fun res!756669 () Bool)

(assert (=> d!131851 (=> (not res!756669) (not e!645123))))

(declare-fun lt!503407 () ListLongMap!15999)

(assert (=> d!131851 (= res!756669 (contains!6548 lt!503407 (_1!9022 (tuple2!18023 lt!503287 lt!503286))))))

(declare-fun lt!503404 () List!24798)

(assert (=> d!131851 (= lt!503407 (ListLongMap!16000 lt!503404))))

(declare-fun lt!503405 () Unit!37045)

(declare-fun lt!503406 () Unit!37045)

(assert (=> d!131851 (= lt!503405 lt!503406)))

(assert (=> d!131851 (= (getValueByKey!624 lt!503404 (_1!9022 (tuple2!18023 lt!503287 lt!503286))) (Some!674 (_2!9022 (tuple2!18023 lt!503287 lt!503286))))))

(assert (=> d!131851 (= lt!503406 (lemmaContainsTupThenGetReturnValue!306 lt!503404 (_1!9022 (tuple2!18023 lt!503287 lt!503286)) (_2!9022 (tuple2!18023 lt!503287 lt!503286))))))

(assert (=> d!131851 (= lt!503404 (insertStrictlySorted!399 (toList!8015 lt!503284) (_1!9022 (tuple2!18023 lt!503287 lt!503286)) (_2!9022 (tuple2!18023 lt!503287 lt!503286))))))

(assert (=> d!131851 (= (+!3479 lt!503284 (tuple2!18023 lt!503287 lt!503286)) lt!503407)))

(declare-fun b!1133398 () Bool)

(declare-fun res!756670 () Bool)

(assert (=> b!1133398 (=> (not res!756670) (not e!645123))))

(assert (=> b!1133398 (= res!756670 (= (getValueByKey!624 (toList!8015 lt!503407) (_1!9022 (tuple2!18023 lt!503287 lt!503286))) (Some!674 (_2!9022 (tuple2!18023 lt!503287 lt!503286)))))))

(declare-fun b!1133399 () Bool)

(assert (=> b!1133399 (= e!645123 (contains!6551 (toList!8015 lt!503407) (tuple2!18023 lt!503287 lt!503286)))))

(assert (= (and d!131851 res!756669) b!1133398))

(assert (= (and b!1133398 res!756670) b!1133399))

(declare-fun m!1046727 () Bool)

(assert (=> d!131851 m!1046727))

(declare-fun m!1046729 () Bool)

(assert (=> d!131851 m!1046729))

(declare-fun m!1046731 () Bool)

(assert (=> d!131851 m!1046731))

(declare-fun m!1046733 () Bool)

(assert (=> d!131851 m!1046733))

(declare-fun m!1046735 () Bool)

(assert (=> b!1133398 m!1046735))

(declare-fun m!1046737 () Bool)

(assert (=> b!1133399 m!1046737))

(assert (=> b!1133170 d!131851))

(declare-fun d!131853 () Bool)

(assert (=> d!131853 (not (contains!6548 (+!3479 lt!503284 (tuple2!18023 lt!503287 lt!503286)) lt!503281))))

(declare-fun lt!503410 () Unit!37045)

(declare-fun choose!1783 (ListLongMap!15999 (_ BitVec 64) V!43081 (_ BitVec 64)) Unit!37045)

(assert (=> d!131853 (= lt!503410 (choose!1783 lt!503284 lt!503287 lt!503286 lt!503281))))

(declare-fun e!645126 () Bool)

(assert (=> d!131853 e!645126))

(declare-fun res!756673 () Bool)

(assert (=> d!131853 (=> (not res!756673) (not e!645126))))

(assert (=> d!131853 (= res!756673 (not (contains!6548 lt!503284 lt!503281)))))

(assert (=> d!131853 (= (addStillNotContains!285 lt!503284 lt!503287 lt!503286 lt!503281) lt!503410)))

(declare-fun b!1133403 () Bool)

(assert (=> b!1133403 (= e!645126 (not (= lt!503287 lt!503281)))))

(assert (= (and d!131853 res!756673) b!1133403))

(assert (=> d!131853 m!1046381))

(assert (=> d!131853 m!1046381))

(assert (=> d!131853 m!1046385))

(declare-fun m!1046739 () Bool)

(assert (=> d!131853 m!1046739))

(declare-fun m!1046741 () Bool)

(assert (=> d!131853 m!1046741))

(assert (=> b!1133170 d!131853))

(declare-fun d!131855 () Bool)

(declare-fun e!645127 () Bool)

(assert (=> d!131855 e!645127))

(declare-fun res!756674 () Bool)

(assert (=> d!131855 (=> res!756674 e!645127)))

(declare-fun lt!503411 () Bool)

(assert (=> d!131855 (= res!756674 (not lt!503411))))

(declare-fun lt!503412 () Bool)

(assert (=> d!131855 (= lt!503411 lt!503412)))

(declare-fun lt!503413 () Unit!37045)

(declare-fun e!645128 () Unit!37045)

(assert (=> d!131855 (= lt!503413 e!645128)))

(declare-fun c!110729 () Bool)

(assert (=> d!131855 (= c!110729 lt!503412)))

(assert (=> d!131855 (= lt!503412 (containsKey!587 (toList!8015 lt!503354) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131855 (= (contains!6548 lt!503354 #b0000000000000000000000000000000000000000000000000000000000000000) lt!503411)))

(declare-fun b!1133404 () Bool)

(declare-fun lt!503414 () Unit!37045)

(assert (=> b!1133404 (= e!645128 lt!503414)))

(assert (=> b!1133404 (= lt!503414 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503354) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1133404 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503354) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1133405 () Bool)

(declare-fun Unit!37059 () Unit!37045)

(assert (=> b!1133405 (= e!645128 Unit!37059)))

(declare-fun b!1133406 () Bool)

(assert (=> b!1133406 (= e!645127 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503354) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131855 c!110729) b!1133404))

(assert (= (and d!131855 (not c!110729)) b!1133405))

(assert (= (and d!131855 (not res!756674)) b!1133406))

(declare-fun m!1046743 () Bool)

(assert (=> d!131855 m!1046743))

(declare-fun m!1046745 () Bool)

(assert (=> b!1133404 m!1046745))

(declare-fun m!1046747 () Bool)

(assert (=> b!1133404 m!1046747))

(assert (=> b!1133404 m!1046747))

(declare-fun m!1046749 () Bool)

(assert (=> b!1133404 m!1046749))

(assert (=> b!1133406 m!1046747))

(assert (=> b!1133406 m!1046747))

(assert (=> b!1133406 m!1046749))

(assert (=> d!131795 d!131855))

(assert (=> d!131795 d!131807))

(declare-fun d!131857 () Bool)

(declare-fun res!756675 () Bool)

(declare-fun e!645129 () Bool)

(assert (=> d!131857 (=> res!756675 e!645129)))

(assert (=> d!131857 (= res!756675 (and ((_ is Cons!24794) (toList!8015 lt!503153)) (= (_1!9022 (h!26012 (toList!8015 lt!503153))) k0!934)))))

(assert (=> d!131857 (= (containsKey!587 (toList!8015 lt!503153) k0!934) e!645129)))

(declare-fun b!1133407 () Bool)

(declare-fun e!645130 () Bool)

(assert (=> b!1133407 (= e!645129 e!645130)))

(declare-fun res!756676 () Bool)

(assert (=> b!1133407 (=> (not res!756676) (not e!645130))))

(assert (=> b!1133407 (= res!756676 (and (or (not ((_ is Cons!24794) (toList!8015 lt!503153))) (bvsle (_1!9022 (h!26012 (toList!8015 lt!503153))) k0!934)) ((_ is Cons!24794) (toList!8015 lt!503153)) (bvslt (_1!9022 (h!26012 (toList!8015 lt!503153))) k0!934)))))

(declare-fun b!1133408 () Bool)

(assert (=> b!1133408 (= e!645130 (containsKey!587 (t!35717 (toList!8015 lt!503153)) k0!934))))

(assert (= (and d!131857 (not res!756675)) b!1133407))

(assert (= (and b!1133407 res!756676) b!1133408))

(declare-fun m!1046751 () Bool)

(assert (=> b!1133408 m!1046751))

(assert (=> d!131793 d!131857))

(declare-fun d!131859 () Bool)

(declare-fun e!645131 () Bool)

(assert (=> d!131859 e!645131))

(declare-fun res!756677 () Bool)

(assert (=> d!131859 (=> res!756677 e!645131)))

(declare-fun lt!503415 () Bool)

(assert (=> d!131859 (= res!756677 (not lt!503415))))

(declare-fun lt!503416 () Bool)

(assert (=> d!131859 (= lt!503415 lt!503416)))

(declare-fun lt!503417 () Unit!37045)

(declare-fun e!645132 () Unit!37045)

(assert (=> d!131859 (= lt!503417 e!645132)))

(declare-fun c!110730 () Bool)

(assert (=> d!131859 (= c!110730 lt!503416)))

(assert (=> d!131859 (= lt!503416 (containsKey!587 (toList!8015 lt!503299) (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!131859 (= (contains!6548 lt!503299 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455))) lt!503415)))

(declare-fun b!1133409 () Bool)

(declare-fun lt!503418 () Unit!37045)

(assert (=> b!1133409 (= e!645132 lt!503418)))

(assert (=> b!1133409 (= lt!503418 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503299) (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133409 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503299) (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1133410 () Bool)

(declare-fun Unit!37060 () Unit!37045)

(assert (=> b!1133410 (= e!645132 Unit!37060)))

(declare-fun b!1133411 () Bool)

(assert (=> b!1133411 (= e!645131 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503299) (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!131859 c!110730) b!1133409))

(assert (= (and d!131859 (not c!110730)) b!1133410))

(assert (= (and d!131859 (not res!756677)) b!1133411))

(assert (=> d!131859 m!1046423))

(declare-fun m!1046753 () Bool)

(assert (=> d!131859 m!1046753))

(assert (=> b!1133409 m!1046423))

(declare-fun m!1046755 () Bool)

(assert (=> b!1133409 m!1046755))

(assert (=> b!1133409 m!1046423))

(declare-fun m!1046757 () Bool)

(assert (=> b!1133409 m!1046757))

(assert (=> b!1133409 m!1046757))

(declare-fun m!1046759 () Bool)

(assert (=> b!1133409 m!1046759))

(assert (=> b!1133411 m!1046423))

(assert (=> b!1133411 m!1046757))

(assert (=> b!1133411 m!1046757))

(assert (=> b!1133411 m!1046759))

(assert (=> b!1133198 d!131859))

(declare-fun d!131861 () Bool)

(assert (=> d!131861 (arrayContainsKey!0 _keys!1208 lt!503345 #b00000000000000000000000000000000)))

(declare-fun lt!503419 () Unit!37045)

(assert (=> d!131861 (= lt!503419 (choose!13 _keys!1208 lt!503345 #b00000000000000000000000000000000))))

(assert (=> d!131861 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!131861 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!503345 #b00000000000000000000000000000000) lt!503419)))

(declare-fun bs!32985 () Bool)

(assert (= bs!32985 d!131861))

(assert (=> bs!32985 m!1046507))

(declare-fun m!1046761 () Bool)

(assert (=> bs!32985 m!1046761))

(assert (=> b!1133235 d!131861))

(declare-fun d!131863 () Bool)

(declare-fun res!756678 () Bool)

(declare-fun e!645133 () Bool)

(assert (=> d!131863 (=> res!756678 e!645133)))

(assert (=> d!131863 (= res!756678 (= (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) lt!503345))))

(assert (=> d!131863 (= (arrayContainsKey!0 _keys!1208 lt!503345 #b00000000000000000000000000000000) e!645133)))

(declare-fun b!1133412 () Bool)

(declare-fun e!645134 () Bool)

(assert (=> b!1133412 (= e!645133 e!645134)))

(declare-fun res!756679 () Bool)

(assert (=> b!1133412 (=> (not res!756679) (not e!645134))))

(assert (=> b!1133412 (= res!756679 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun b!1133413 () Bool)

(assert (=> b!1133413 (= e!645134 (arrayContainsKey!0 _keys!1208 lt!503345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131863 (not res!756678)) b!1133412))

(assert (= (and b!1133412 res!756679) b!1133413))

(assert (=> d!131863 m!1046487))

(declare-fun m!1046763 () Bool)

(assert (=> b!1133413 m!1046763))

(assert (=> b!1133235 d!131863))

(declare-fun b!1133426 () Bool)

(declare-fun e!645142 () SeekEntryResult!9881)

(declare-fun lt!503428 () SeekEntryResult!9881)

(assert (=> b!1133426 (= e!645142 (Found!9881 (index!41897 lt!503428)))))

(declare-fun b!1133427 () Bool)

(declare-fun e!645143 () SeekEntryResult!9881)

(assert (=> b!1133427 (= e!645143 Undefined!9881)))

(declare-fun d!131865 () Bool)

(declare-fun lt!503427 () SeekEntryResult!9881)

(assert (=> d!131865 (and (or ((_ is Undefined!9881) lt!503427) (not ((_ is Found!9881) lt!503427)) (and (bvsge (index!41896 lt!503427) #b00000000000000000000000000000000) (bvslt (index!41896 lt!503427) (size!36099 _keys!1208)))) (or ((_ is Undefined!9881) lt!503427) ((_ is Found!9881) lt!503427) (not ((_ is MissingZero!9881) lt!503427)) (and (bvsge (index!41895 lt!503427) #b00000000000000000000000000000000) (bvslt (index!41895 lt!503427) (size!36099 _keys!1208)))) (or ((_ is Undefined!9881) lt!503427) ((_ is Found!9881) lt!503427) ((_ is MissingZero!9881) lt!503427) (not ((_ is MissingVacant!9881) lt!503427)) (and (bvsge (index!41898 lt!503427) #b00000000000000000000000000000000) (bvslt (index!41898 lt!503427) (size!36099 _keys!1208)))) (or ((_ is Undefined!9881) lt!503427) (ite ((_ is Found!9881) lt!503427) (= (select (arr!35562 _keys!1208) (index!41896 lt!503427)) (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9881) lt!503427) (= (select (arr!35562 _keys!1208) (index!41895 lt!503427)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9881) lt!503427) (= (select (arr!35562 _keys!1208) (index!41898 lt!503427)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131865 (= lt!503427 e!645143)))

(declare-fun c!110737 () Bool)

(assert (=> d!131865 (= c!110737 (and ((_ is Intermediate!9881) lt!503428) (undefined!10693 lt!503428)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!73831 (_ BitVec 32)) SeekEntryResult!9881)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!131865 (= lt!503428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) mask!1564) (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (=> d!131865 (validMask!0 mask!1564)))

(assert (=> d!131865 (= (seekEntryOrOpen!0 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) lt!503427)))

(declare-fun b!1133428 () Bool)

(assert (=> b!1133428 (= e!645143 e!645142)))

(declare-fun lt!503426 () (_ BitVec 64))

(assert (=> b!1133428 (= lt!503426 (select (arr!35562 _keys!1208) (index!41897 lt!503428)))))

(declare-fun c!110738 () Bool)

(assert (=> b!1133428 (= c!110738 (= lt!503426 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1133429 () Bool)

(declare-fun c!110739 () Bool)

(assert (=> b!1133429 (= c!110739 (= lt!503426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!645141 () SeekEntryResult!9881)

(assert (=> b!1133429 (= e!645142 e!645141)))

(declare-fun b!1133430 () Bool)

(assert (=> b!1133430 (= e!645141 (MissingZero!9881 (index!41897 lt!503428)))))

(declare-fun b!1133431 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!73831 (_ BitVec 32)) SeekEntryResult!9881)

(assert (=> b!1133431 (= e!645141 (seekKeyOrZeroReturnVacant!0 (x!101469 lt!503428) (index!41897 lt!503428) (index!41897 lt!503428) (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (= (and d!131865 c!110737) b!1133427))

(assert (= (and d!131865 (not c!110737)) b!1133428))

(assert (= (and b!1133428 c!110738) b!1133426))

(assert (= (and b!1133428 (not c!110738)) b!1133429))

(assert (= (and b!1133429 c!110739) b!1133430))

(assert (= (and b!1133429 (not c!110739)) b!1133431))

(assert (=> d!131865 m!1046487))

(declare-fun m!1046765 () Bool)

(assert (=> d!131865 m!1046765))

(declare-fun m!1046767 () Bool)

(assert (=> d!131865 m!1046767))

(assert (=> d!131865 m!1046195))

(declare-fun m!1046769 () Bool)

(assert (=> d!131865 m!1046769))

(declare-fun m!1046771 () Bool)

(assert (=> d!131865 m!1046771))

(assert (=> d!131865 m!1046765))

(assert (=> d!131865 m!1046487))

(declare-fun m!1046773 () Bool)

(assert (=> d!131865 m!1046773))

(declare-fun m!1046775 () Bool)

(assert (=> b!1133428 m!1046775))

(assert (=> b!1133431 m!1046487))

(declare-fun m!1046777 () Bool)

(assert (=> b!1133431 m!1046777))

(assert (=> b!1133235 d!131865))

(declare-fun d!131867 () Bool)

(assert (=> d!131867 (= (apply!964 lt!503354 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18103 (getValueByKey!624 (toList!8015 lt!503354) (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!32986 () Bool)

(assert (= bs!32986 d!131867))

(assert (=> bs!32986 m!1046523))

(declare-fun m!1046779 () Bool)

(assert (=> bs!32986 m!1046779))

(assert (=> bs!32986 m!1046779))

(declare-fun m!1046781 () Bool)

(assert (=> bs!32986 m!1046781))

(assert (=> b!1133244 d!131867))

(declare-fun d!131869 () Bool)

(declare-fun c!110740 () Bool)

(assert (=> d!131869 (= c!110740 ((_ is ValueCellFull!13523) (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!645144 () V!43081)

(assert (=> d!131869 (= (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!645144)))

(declare-fun b!1133432 () Bool)

(assert (=> b!1133432 (= e!645144 (get!18104 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133433 () Bool)

(assert (=> b!1133433 (= e!645144 (get!18105 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131869 c!110740) b!1133432))

(assert (= (and d!131869 (not c!110740)) b!1133433))

(assert (=> b!1133432 m!1046529))

(assert (=> b!1133432 m!1046171))

(declare-fun m!1046783 () Bool)

(assert (=> b!1133432 m!1046783))

(assert (=> b!1133433 m!1046529))

(assert (=> b!1133433 m!1046171))

(declare-fun m!1046785 () Bool)

(assert (=> b!1133433 m!1046785))

(assert (=> b!1133244 d!131869))

(declare-fun d!131871 () Bool)

(declare-fun e!645147 () Bool)

(assert (=> d!131871 e!645147))

(declare-fun c!110743 () Bool)

(assert (=> d!131871 (= c!110743 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!131871 true))

(declare-fun _$29!186 () Unit!37045)

(assert (=> d!131871 (= (choose!1780 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$29!186)))

(declare-fun b!1133438 () Bool)

(assert (=> b!1133438 (= e!645147 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133439 () Bool)

(assert (=> b!1133439 (= e!645147 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!131871 c!110743) b!1133438))

(assert (= (and d!131871 (not c!110743)) b!1133439))

(assert (=> b!1133438 m!1046193))

(assert (=> d!131787 d!131871))

(assert (=> d!131787 d!131807))

(declare-fun d!131873 () Bool)

(declare-fun lt!503431 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!542 (List!24798) (InoxSet tuple2!18022))

(assert (=> d!131873 (= lt!503431 (select (content!542 (toList!8015 lt!503313)) (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!645153 () Bool)

(assert (=> d!131873 (= lt!503431 e!645153)))

(declare-fun res!756685 () Bool)

(assert (=> d!131873 (=> (not res!756685) (not e!645153))))

(assert (=> d!131873 (= res!756685 ((_ is Cons!24794) (toList!8015 lt!503313)))))

(assert (=> d!131873 (= (contains!6551 (toList!8015 lt!503313) (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!503431)))

(declare-fun b!1133444 () Bool)

(declare-fun e!645152 () Bool)

(assert (=> b!1133444 (= e!645153 e!645152)))

(declare-fun res!756684 () Bool)

(assert (=> b!1133444 (=> res!756684 e!645152)))

(assert (=> b!1133444 (= res!756684 (= (h!26012 (toList!8015 lt!503313)) (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133445 () Bool)

(assert (=> b!1133445 (= e!645152 (contains!6551 (t!35717 (toList!8015 lt!503313)) (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131873 res!756685) b!1133444))

(assert (= (and b!1133444 (not res!756684)) b!1133445))

(declare-fun m!1046787 () Bool)

(assert (=> d!131873 m!1046787))

(declare-fun m!1046789 () Bool)

(assert (=> d!131873 m!1046789))

(declare-fun m!1046791 () Bool)

(assert (=> b!1133445 m!1046791))

(assert (=> b!1133206 d!131873))

(declare-fun d!131875 () Bool)

(assert (=> d!131875 (= (validKeyInArray!0 (select (arr!35562 _keys!1208) from!1455)) (and (not (= (select (arr!35562 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35562 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1133181 d!131875))

(declare-fun d!131877 () Bool)

(declare-fun lt!503434 () Bool)

(declare-fun content!543 (List!24799) (InoxSet (_ BitVec 64)))

(assert (=> d!131877 (= lt!503434 (select (content!543 Nil!24796) (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun e!645159 () Bool)

(assert (=> d!131877 (= lt!503434 e!645159)))

(declare-fun res!756690 () Bool)

(assert (=> d!131877 (=> (not res!756690) (not e!645159))))

(assert (=> d!131877 (= res!756690 ((_ is Cons!24795) Nil!24796))))

(assert (=> d!131877 (= (contains!6552 Nil!24796 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)) lt!503434)))

(declare-fun b!1133450 () Bool)

(declare-fun e!645158 () Bool)

(assert (=> b!1133450 (= e!645159 e!645158)))

(declare-fun res!756691 () Bool)

(assert (=> b!1133450 (=> res!756691 e!645158)))

(assert (=> b!1133450 (= res!756691 (= (h!26013 Nil!24796) (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1133451 () Bool)

(assert (=> b!1133451 (= e!645158 (contains!6552 (t!35718 Nil!24796) (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!131877 res!756690) b!1133450))

(assert (= (and b!1133450 (not res!756691)) b!1133451))

(declare-fun m!1046793 () Bool)

(assert (=> d!131877 m!1046793))

(assert (=> d!131877 m!1046487))

(declare-fun m!1046795 () Bool)

(assert (=> d!131877 m!1046795))

(assert (=> b!1133451 m!1046487))

(declare-fun m!1046797 () Bool)

(assert (=> b!1133451 m!1046797))

(assert (=> b!1133279 d!131877))

(declare-fun d!131879 () Bool)

(declare-fun e!645160 () Bool)

(assert (=> d!131879 e!645160))

(declare-fun res!756692 () Bool)

(assert (=> d!131879 (=> res!756692 e!645160)))

(declare-fun lt!503435 () Bool)

(assert (=> d!131879 (= res!756692 (not lt!503435))))

(declare-fun lt!503436 () Bool)

(assert (=> d!131879 (= lt!503435 lt!503436)))

(declare-fun lt!503437 () Unit!37045)

(declare-fun e!645161 () Unit!37045)

(assert (=> d!131879 (= lt!503437 e!645161)))

(declare-fun c!110744 () Bool)

(assert (=> d!131879 (= c!110744 lt!503436)))

(assert (=> d!131879 (= lt!503436 (containsKey!587 (toList!8015 lt!503362) k0!934))))

(assert (=> d!131879 (= (contains!6548 lt!503362 k0!934) lt!503435)))

(declare-fun b!1133452 () Bool)

(declare-fun lt!503438 () Unit!37045)

(assert (=> b!1133452 (= e!645161 lt!503438)))

(assert (=> b!1133452 (= lt!503438 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503362) k0!934))))

(assert (=> b!1133452 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503362) k0!934))))

(declare-fun b!1133453 () Bool)

(declare-fun Unit!37061 () Unit!37045)

(assert (=> b!1133453 (= e!645161 Unit!37061)))

(declare-fun b!1133454 () Bool)

(assert (=> b!1133454 (= e!645160 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503362) k0!934)))))

(assert (= (and d!131879 c!110744) b!1133452))

(assert (= (and d!131879 (not c!110744)) b!1133453))

(assert (= (and d!131879 (not res!756692)) b!1133454))

(declare-fun m!1046799 () Bool)

(assert (=> d!131879 m!1046799))

(declare-fun m!1046801 () Bool)

(assert (=> b!1133452 m!1046801))

(declare-fun m!1046803 () Bool)

(assert (=> b!1133452 m!1046803))

(assert (=> b!1133452 m!1046803))

(declare-fun m!1046805 () Bool)

(assert (=> b!1133452 m!1046805))

(assert (=> b!1133454 m!1046803))

(assert (=> b!1133454 m!1046803))

(assert (=> b!1133454 m!1046805))

(assert (=> d!131799 d!131879))

(declare-fun b!1133466 () Bool)

(declare-fun e!645169 () List!24798)

(assert (=> b!1133466 (= e!645169 ($colon$colon!609 (removeStrictlySorted!88 (t!35717 (toList!8015 call!48762)) k0!934) (h!26012 (toList!8015 call!48762))))))

(declare-fun b!1133467 () Bool)

(declare-fun e!645170 () Bool)

(declare-fun lt!503441 () List!24798)

(assert (=> b!1133467 (= e!645170 (not (containsKey!587 lt!503441 k0!934)))))

(declare-fun b!1133468 () Bool)

(declare-fun e!645168 () List!24798)

(assert (=> b!1133468 (= e!645168 e!645169)))

(declare-fun c!110750 () Bool)

(assert (=> b!1133468 (= c!110750 (and ((_ is Cons!24794) (toList!8015 call!48762)) (not (= (_1!9022 (h!26012 (toList!8015 call!48762))) k0!934))))))

(declare-fun b!1133469 () Bool)

(assert (=> b!1133469 (= e!645169 Nil!24795)))

(declare-fun b!1133465 () Bool)

(assert (=> b!1133465 (= e!645168 (t!35717 (toList!8015 call!48762)))))

(declare-fun d!131881 () Bool)

(assert (=> d!131881 e!645170))

(declare-fun res!756695 () Bool)

(assert (=> d!131881 (=> (not res!756695) (not e!645170))))

(assert (=> d!131881 (= res!756695 (isStrictlySorted!715 lt!503441))))

(assert (=> d!131881 (= lt!503441 e!645168)))

(declare-fun c!110749 () Bool)

(assert (=> d!131881 (= c!110749 (and ((_ is Cons!24794) (toList!8015 call!48762)) (= (_1!9022 (h!26012 (toList!8015 call!48762))) k0!934)))))

(assert (=> d!131881 (isStrictlySorted!715 (toList!8015 call!48762))))

(assert (=> d!131881 (= (removeStrictlySorted!88 (toList!8015 call!48762) k0!934) lt!503441)))

(assert (= (and d!131881 c!110749) b!1133465))

(assert (= (and d!131881 (not c!110749)) b!1133468))

(assert (= (and b!1133468 c!110750) b!1133466))

(assert (= (and b!1133468 (not c!110750)) b!1133469))

(assert (= (and d!131881 res!756695) b!1133467))

(declare-fun m!1046807 () Bool)

(assert (=> b!1133466 m!1046807))

(assert (=> b!1133466 m!1046807))

(declare-fun m!1046809 () Bool)

(assert (=> b!1133466 m!1046809))

(declare-fun m!1046811 () Bool)

(assert (=> b!1133467 m!1046811))

(declare-fun m!1046813 () Bool)

(assert (=> d!131881 m!1046813))

(declare-fun m!1046815 () Bool)

(assert (=> d!131881 m!1046815))

(assert (=> d!131799 d!131881))

(assert (=> b!1133175 d!131837))

(assert (=> b!1133246 d!131869))

(declare-fun d!131883 () Bool)

(assert (=> d!131883 (not (contains!6548 (+!3479 lt!503353 (tuple2!18023 lt!503356 lt!503355)) lt!503350))))

(declare-fun lt!503442 () Unit!37045)

(assert (=> d!131883 (= lt!503442 (choose!1783 lt!503353 lt!503356 lt!503355 lt!503350))))

(declare-fun e!645171 () Bool)

(assert (=> d!131883 e!645171))

(declare-fun res!756696 () Bool)

(assert (=> d!131883 (=> (not res!756696) (not e!645171))))

(assert (=> d!131883 (= res!756696 (not (contains!6548 lt!503353 lt!503350)))))

(assert (=> d!131883 (= (addStillNotContains!285 lt!503353 lt!503356 lt!503355 lt!503350) lt!503442)))

(declare-fun b!1133470 () Bool)

(assert (=> b!1133470 (= e!645171 (not (= lt!503356 lt!503350)))))

(assert (= (and d!131883 res!756696) b!1133470))

(assert (=> d!131883 m!1046535))

(assert (=> d!131883 m!1046535))

(assert (=> d!131883 m!1046539))

(declare-fun m!1046817 () Bool)

(assert (=> d!131883 m!1046817))

(declare-fun m!1046819 () Bool)

(assert (=> d!131883 m!1046819))

(assert (=> b!1133246 d!131883))

(declare-fun d!131885 () Bool)

(declare-fun e!645172 () Bool)

(assert (=> d!131885 e!645172))

(declare-fun res!756697 () Bool)

(assert (=> d!131885 (=> res!756697 e!645172)))

(declare-fun lt!503443 () Bool)

(assert (=> d!131885 (= res!756697 (not lt!503443))))

(declare-fun lt!503444 () Bool)

(assert (=> d!131885 (= lt!503443 lt!503444)))

(declare-fun lt!503445 () Unit!37045)

(declare-fun e!645173 () Unit!37045)

(assert (=> d!131885 (= lt!503445 e!645173)))

(declare-fun c!110751 () Bool)

(assert (=> d!131885 (= c!110751 lt!503444)))

(assert (=> d!131885 (= lt!503444 (containsKey!587 (toList!8015 (+!3479 lt!503353 (tuple2!18023 lt!503356 lt!503355))) lt!503350))))

(assert (=> d!131885 (= (contains!6548 (+!3479 lt!503353 (tuple2!18023 lt!503356 lt!503355)) lt!503350) lt!503443)))

(declare-fun b!1133471 () Bool)

(declare-fun lt!503446 () Unit!37045)

(assert (=> b!1133471 (= e!645173 lt!503446)))

(assert (=> b!1133471 (= lt!503446 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (+!3479 lt!503353 (tuple2!18023 lt!503356 lt!503355))) lt!503350))))

(assert (=> b!1133471 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503353 (tuple2!18023 lt!503356 lt!503355))) lt!503350))))

(declare-fun b!1133472 () Bool)

(declare-fun Unit!37062 () Unit!37045)

(assert (=> b!1133472 (= e!645173 Unit!37062)))

(declare-fun b!1133473 () Bool)

(assert (=> b!1133473 (= e!645172 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503353 (tuple2!18023 lt!503356 lt!503355))) lt!503350)))))

(assert (= (and d!131885 c!110751) b!1133471))

(assert (= (and d!131885 (not c!110751)) b!1133472))

(assert (= (and d!131885 (not res!756697)) b!1133473))

(declare-fun m!1046821 () Bool)

(assert (=> d!131885 m!1046821))

(declare-fun m!1046823 () Bool)

(assert (=> b!1133471 m!1046823))

(declare-fun m!1046825 () Bool)

(assert (=> b!1133471 m!1046825))

(assert (=> b!1133471 m!1046825))

(declare-fun m!1046827 () Bool)

(assert (=> b!1133471 m!1046827))

(assert (=> b!1133473 m!1046825))

(assert (=> b!1133473 m!1046825))

(assert (=> b!1133473 m!1046827))

(assert (=> b!1133246 d!131885))

(declare-fun d!131887 () Bool)

(declare-fun e!645174 () Bool)

(assert (=> d!131887 e!645174))

(declare-fun res!756698 () Bool)

(assert (=> d!131887 (=> (not res!756698) (not e!645174))))

(declare-fun lt!503450 () ListLongMap!15999)

(assert (=> d!131887 (= res!756698 (contains!6548 lt!503450 (_1!9022 (tuple2!18023 lt!503356 lt!503355))))))

(declare-fun lt!503447 () List!24798)

(assert (=> d!131887 (= lt!503450 (ListLongMap!16000 lt!503447))))

(declare-fun lt!503448 () Unit!37045)

(declare-fun lt!503449 () Unit!37045)

(assert (=> d!131887 (= lt!503448 lt!503449)))

(assert (=> d!131887 (= (getValueByKey!624 lt!503447 (_1!9022 (tuple2!18023 lt!503356 lt!503355))) (Some!674 (_2!9022 (tuple2!18023 lt!503356 lt!503355))))))

(assert (=> d!131887 (= lt!503449 (lemmaContainsTupThenGetReturnValue!306 lt!503447 (_1!9022 (tuple2!18023 lt!503356 lt!503355)) (_2!9022 (tuple2!18023 lt!503356 lt!503355))))))

(assert (=> d!131887 (= lt!503447 (insertStrictlySorted!399 (toList!8015 lt!503353) (_1!9022 (tuple2!18023 lt!503356 lt!503355)) (_2!9022 (tuple2!18023 lt!503356 lt!503355))))))

(assert (=> d!131887 (= (+!3479 lt!503353 (tuple2!18023 lt!503356 lt!503355)) lt!503450)))

(declare-fun b!1133474 () Bool)

(declare-fun res!756699 () Bool)

(assert (=> b!1133474 (=> (not res!756699) (not e!645174))))

(assert (=> b!1133474 (= res!756699 (= (getValueByKey!624 (toList!8015 lt!503450) (_1!9022 (tuple2!18023 lt!503356 lt!503355))) (Some!674 (_2!9022 (tuple2!18023 lt!503356 lt!503355)))))))

(declare-fun b!1133475 () Bool)

(assert (=> b!1133475 (= e!645174 (contains!6551 (toList!8015 lt!503450) (tuple2!18023 lt!503356 lt!503355)))))

(assert (= (and d!131887 res!756698) b!1133474))

(assert (= (and b!1133474 res!756699) b!1133475))

(declare-fun m!1046829 () Bool)

(assert (=> d!131887 m!1046829))

(declare-fun m!1046831 () Bool)

(assert (=> d!131887 m!1046831))

(declare-fun m!1046833 () Bool)

(assert (=> d!131887 m!1046833))

(declare-fun m!1046835 () Bool)

(assert (=> d!131887 m!1046835))

(declare-fun m!1046837 () Bool)

(assert (=> b!1133474 m!1046837))

(declare-fun m!1046839 () Bool)

(assert (=> b!1133475 m!1046839))

(assert (=> b!1133246 d!131887))

(declare-fun d!131889 () Bool)

(declare-fun e!645175 () Bool)

(assert (=> d!131889 e!645175))

(declare-fun res!756700 () Bool)

(assert (=> d!131889 (=> (not res!756700) (not e!645175))))

(declare-fun lt!503454 () ListLongMap!15999)

(assert (=> d!131889 (= res!756700 (contains!6548 lt!503454 (_1!9022 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!503451 () List!24798)

(assert (=> d!131889 (= lt!503454 (ListLongMap!16000 lt!503451))))

(declare-fun lt!503452 () Unit!37045)

(declare-fun lt!503453 () Unit!37045)

(assert (=> d!131889 (= lt!503452 lt!503453)))

(assert (=> d!131889 (= (getValueByKey!624 lt!503451 (_1!9022 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!674 (_2!9022 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131889 (= lt!503453 (lemmaContainsTupThenGetReturnValue!306 lt!503451 (_1!9022 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9022 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131889 (= lt!503451 (insertStrictlySorted!399 (toList!8015 call!48825) (_1!9022 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9022 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131889 (= (+!3479 call!48825 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!503454)))

(declare-fun b!1133476 () Bool)

(declare-fun res!756701 () Bool)

(assert (=> b!1133476 (=> (not res!756701) (not e!645175))))

(assert (=> b!1133476 (= res!756701 (= (getValueByKey!624 (toList!8015 lt!503454) (_1!9022 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!674 (_2!9022 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1133477 () Bool)

(assert (=> b!1133477 (= e!645175 (contains!6551 (toList!8015 lt!503454) (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131889 res!756700) b!1133476))

(assert (= (and b!1133476 res!756701) b!1133477))

(declare-fun m!1046841 () Bool)

(assert (=> d!131889 m!1046841))

(declare-fun m!1046843 () Bool)

(assert (=> d!131889 m!1046843))

(declare-fun m!1046845 () Bool)

(assert (=> d!131889 m!1046845))

(declare-fun m!1046847 () Bool)

(assert (=> d!131889 m!1046847))

(declare-fun m!1046849 () Bool)

(assert (=> b!1133476 m!1046849))

(declare-fun m!1046851 () Bool)

(assert (=> b!1133477 m!1046851))

(assert (=> b!1133246 d!131889))

(declare-fun d!131891 () Bool)

(declare-fun e!645176 () Bool)

(assert (=> d!131891 e!645176))

(declare-fun res!756702 () Bool)

(assert (=> d!131891 (=> res!756702 e!645176)))

(declare-fun lt!503455 () Bool)

(assert (=> d!131891 (= res!756702 (not lt!503455))))

(declare-fun lt!503456 () Bool)

(assert (=> d!131891 (= lt!503455 lt!503456)))

(declare-fun lt!503457 () Unit!37045)

(declare-fun e!645177 () Unit!37045)

(assert (=> d!131891 (= lt!503457 e!645177)))

(declare-fun c!110752 () Bool)

(assert (=> d!131891 (= c!110752 lt!503456)))

(assert (=> d!131891 (= lt!503456 (containsKey!587 (toList!8015 lt!503354) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131891 (= (contains!6548 lt!503354 #b1000000000000000000000000000000000000000000000000000000000000000) lt!503455)))

(declare-fun b!1133478 () Bool)

(declare-fun lt!503458 () Unit!37045)

(assert (=> b!1133478 (= e!645177 lt!503458)))

(assert (=> b!1133478 (= lt!503458 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503354) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1133478 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503354) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1133479 () Bool)

(declare-fun Unit!37063 () Unit!37045)

(assert (=> b!1133479 (= e!645177 Unit!37063)))

(declare-fun b!1133480 () Bool)

(assert (=> b!1133480 (= e!645176 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131891 c!110752) b!1133478))

(assert (= (and d!131891 (not c!110752)) b!1133479))

(assert (= (and d!131891 (not res!756702)) b!1133480))

(declare-fun m!1046853 () Bool)

(assert (=> d!131891 m!1046853))

(declare-fun m!1046855 () Bool)

(assert (=> b!1133478 m!1046855))

(declare-fun m!1046857 () Bool)

(assert (=> b!1133478 m!1046857))

(assert (=> b!1133478 m!1046857))

(declare-fun m!1046859 () Bool)

(assert (=> b!1133478 m!1046859))

(assert (=> b!1133480 m!1046857))

(assert (=> b!1133480 m!1046857))

(assert (=> b!1133480 m!1046859))

(assert (=> b!1133249 d!131891))

(declare-fun d!131893 () Bool)

(declare-fun isEmpty!979 (Option!675) Bool)

(assert (=> d!131893 (= (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)) (not (isEmpty!979 (getValueByKey!624 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))))

(declare-fun bs!32987 () Bool)

(assert (= bs!32987 d!131893))

(assert (=> bs!32987 m!1046471))

(declare-fun m!1046861 () Bool)

(assert (=> bs!32987 m!1046861))

(assert (=> b!1133216 d!131893))

(declare-fun b!1133484 () Bool)

(declare-fun e!645179 () Option!675)

(assert (=> b!1133484 (= e!645179 None!673)))

(declare-fun b!1133482 () Bool)

(declare-fun e!645178 () Option!675)

(assert (=> b!1133482 (= e!645178 e!645179)))

(declare-fun c!110754 () Bool)

(assert (=> b!1133482 (= c!110754 (and ((_ is Cons!24794) (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (not (= (_1!9022 (h!26012 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934))))))

(declare-fun d!131895 () Bool)

(declare-fun c!110753 () Bool)

(assert (=> d!131895 (= c!110753 (and ((_ is Cons!24794) (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9022 (h!26012 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!131895 (= (getValueByKey!624 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!645178)))

(declare-fun b!1133483 () Bool)

(assert (=> b!1133483 (= e!645179 (getValueByKey!624 (t!35717 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(declare-fun b!1133481 () Bool)

(assert (=> b!1133481 (= e!645178 (Some!674 (_2!9022 (h!26012 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!131895 c!110753) b!1133481))

(assert (= (and d!131895 (not c!110753)) b!1133482))

(assert (= (and b!1133482 c!110754) b!1133483))

(assert (= (and b!1133482 (not c!110754)) b!1133484))

(declare-fun m!1046863 () Bool)

(assert (=> b!1133483 m!1046863))

(assert (=> b!1133216 d!131895))

(declare-fun d!131897 () Bool)

(declare-fun res!756703 () Bool)

(declare-fun e!645180 () Bool)

(assert (=> d!131897 (=> res!756703 e!645180)))

(assert (=> d!131897 (= res!756703 (= (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!131897 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) e!645180)))

(declare-fun b!1133485 () Bool)

(declare-fun e!645181 () Bool)

(assert (=> b!1133485 (= e!645180 e!645181)))

(declare-fun res!756704 () Bool)

(assert (=> b!1133485 (=> (not res!756704) (not e!645181))))

(assert (=> b!1133485 (= res!756704 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun b!1133486 () Bool)

(assert (=> b!1133486 (= e!645181 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!131897 (not res!756703)) b!1133485))

(assert (= (and b!1133485 res!756704) b!1133486))

(declare-fun m!1046865 () Bool)

(assert (=> d!131897 m!1046865))

(declare-fun m!1046867 () Bool)

(assert (=> b!1133486 m!1046867))

(assert (=> b!1133278 d!131897))

(declare-fun d!131899 () Bool)

(assert (=> d!131899 (= (validKeyInArray!0 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000)) (and (not (= (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1133281 d!131899))

(declare-fun b!1133487 () Bool)

(declare-fun e!645185 () Bool)

(declare-fun e!645187 () Bool)

(assert (=> b!1133487 (= e!645185 e!645187)))

(declare-fun c!110756 () Bool)

(declare-fun e!645184 () Bool)

(assert (=> b!1133487 (= c!110756 e!645184)))

(declare-fun res!756705 () Bool)

(assert (=> b!1133487 (=> (not res!756705) (not e!645184))))

(assert (=> b!1133487 (= res!756705 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun b!1133488 () Bool)

(declare-fun e!645182 () ListLongMap!15999)

(declare-fun call!48849 () ListLongMap!15999)

(assert (=> b!1133488 (= e!645182 call!48849)))

(declare-fun d!131901 () Bool)

(assert (=> d!131901 e!645185))

(declare-fun res!756707 () Bool)

(assert (=> d!131901 (=> (not res!756707) (not e!645185))))

(declare-fun lt!503463 () ListLongMap!15999)

(assert (=> d!131901 (= res!756707 (not (contains!6548 lt!503463 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!645183 () ListLongMap!15999)

(assert (=> d!131901 (= lt!503463 e!645183)))

(declare-fun c!110757 () Bool)

(assert (=> d!131901 (= c!110757 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(assert (=> d!131901 (validMask!0 mask!1564)))

(assert (=> d!131901 (= (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!503463)))

(declare-fun b!1133489 () Bool)

(declare-fun e!645186 () Bool)

(assert (=> b!1133489 (= e!645187 e!645186)))

(declare-fun c!110755 () Bool)

(assert (=> b!1133489 (= c!110755 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun b!1133490 () Bool)

(assert (=> b!1133490 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(assert (=> b!1133490 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36100 _values!996)))))

(declare-fun e!645188 () Bool)

(assert (=> b!1133490 (= e!645188 (= (apply!964 lt!503463 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1133491 () Bool)

(assert (=> b!1133491 (= e!645183 e!645182)))

(declare-fun c!110758 () Bool)

(assert (=> b!1133491 (= c!110758 (validKeyInArray!0 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1133492 () Bool)

(declare-fun lt!503460 () Unit!37045)

(declare-fun lt!503461 () Unit!37045)

(assert (=> b!1133492 (= lt!503460 lt!503461)))

(declare-fun lt!503464 () V!43081)

(declare-fun lt!503459 () (_ BitVec 64))

(declare-fun lt!503465 () (_ BitVec 64))

(declare-fun lt!503462 () ListLongMap!15999)

(assert (=> b!1133492 (not (contains!6548 (+!3479 lt!503462 (tuple2!18023 lt!503465 lt!503464)) lt!503459))))

(assert (=> b!1133492 (= lt!503461 (addStillNotContains!285 lt!503462 lt!503465 lt!503464 lt!503459))))

(assert (=> b!1133492 (= lt!503459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133492 (= lt!503464 (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133492 (= lt!503465 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1133492 (= lt!503462 call!48849)))

(assert (=> b!1133492 (= e!645182 (+!3479 call!48849 (tuple2!18023 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!18102 (select (arr!35563 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133493 () Bool)

(assert (=> b!1133493 (= e!645184 (validKeyInArray!0 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1133493 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!48846 () Bool)

(assert (=> bm!48846 (= call!48849 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133494 () Bool)

(assert (=> b!1133494 (= e!645183 (ListLongMap!16000 Nil!24795))))

(declare-fun b!1133495 () Bool)

(declare-fun res!756708 () Bool)

(assert (=> b!1133495 (=> (not res!756708) (not e!645185))))

(assert (=> b!1133495 (= res!756708 (not (contains!6548 lt!503463 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133496 () Bool)

(assert (=> b!1133496 (= e!645187 e!645188)))

(assert (=> b!1133496 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun res!756706 () Bool)

(assert (=> b!1133496 (= res!756706 (contains!6548 lt!503463 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1133496 (=> (not res!756706) (not e!645188))))

(declare-fun b!1133497 () Bool)

(assert (=> b!1133497 (= e!645186 (= lt!503463 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133498 () Bool)

(assert (=> b!1133498 (= e!645186 (isEmpty!977 lt!503463))))

(assert (= (and d!131901 c!110757) b!1133494))

(assert (= (and d!131901 (not c!110757)) b!1133491))

(assert (= (and b!1133491 c!110758) b!1133492))

(assert (= (and b!1133491 (not c!110758)) b!1133488))

(assert (= (or b!1133492 b!1133488) bm!48846))

(assert (= (and d!131901 res!756707) b!1133495))

(assert (= (and b!1133495 res!756708) b!1133487))

(assert (= (and b!1133487 res!756705) b!1133493))

(assert (= (and b!1133487 c!110756) b!1133496))

(assert (= (and b!1133487 (not c!110756)) b!1133489))

(assert (= (and b!1133496 res!756706) b!1133490))

(assert (= (and b!1133489 c!110755) b!1133497))

(assert (= (and b!1133489 (not c!110755)) b!1133498))

(declare-fun b_lambda!18967 () Bool)

(assert (=> (not b_lambda!18967) (not b!1133490)))

(assert (=> b!1133490 t!35716))

(declare-fun b_and!38701 () Bool)

(assert (= b_and!38699 (and (=> t!35716 result!18047) b_and!38701)))

(declare-fun b_lambda!18969 () Bool)

(assert (=> (not b_lambda!18969) (not b!1133492)))

(assert (=> b!1133492 t!35716))

(declare-fun b_and!38703 () Bool)

(assert (= b_and!38701 (and (=> t!35716 result!18047) b_and!38703)))

(declare-fun m!1046869 () Bool)

(assert (=> b!1133498 m!1046869))

(assert (=> b!1133493 m!1046865))

(assert (=> b!1133493 m!1046865))

(declare-fun m!1046871 () Bool)

(assert (=> b!1133493 m!1046871))

(declare-fun m!1046873 () Bool)

(assert (=> b!1133497 m!1046873))

(declare-fun m!1046875 () Bool)

(assert (=> b!1133492 m!1046875))

(assert (=> b!1133492 m!1046875))

(assert (=> b!1133492 m!1046171))

(declare-fun m!1046877 () Bool)

(assert (=> b!1133492 m!1046877))

(declare-fun m!1046879 () Bool)

(assert (=> b!1133492 m!1046879))

(declare-fun m!1046881 () Bool)

(assert (=> b!1133492 m!1046881))

(assert (=> b!1133492 m!1046171))

(declare-fun m!1046883 () Bool)

(assert (=> b!1133492 m!1046883))

(assert (=> b!1133492 m!1046865))

(assert (=> b!1133492 m!1046881))

(declare-fun m!1046885 () Bool)

(assert (=> b!1133492 m!1046885))

(assert (=> b!1133491 m!1046865))

(assert (=> b!1133491 m!1046865))

(assert (=> b!1133491 m!1046871))

(assert (=> b!1133490 m!1046875))

(assert (=> b!1133490 m!1046875))

(assert (=> b!1133490 m!1046171))

(assert (=> b!1133490 m!1046877))

(assert (=> b!1133490 m!1046865))

(assert (=> b!1133490 m!1046171))

(assert (=> b!1133490 m!1046865))

(declare-fun m!1046887 () Bool)

(assert (=> b!1133490 m!1046887))

(declare-fun m!1046889 () Bool)

(assert (=> d!131901 m!1046889))

(assert (=> d!131901 m!1046195))

(assert (=> bm!48846 m!1046873))

(declare-fun m!1046891 () Bool)

(assert (=> b!1133495 m!1046891))

(assert (=> b!1133496 m!1046865))

(assert (=> b!1133496 m!1046865))

(declare-fun m!1046893 () Bool)

(assert (=> b!1133496 m!1046893))

(assert (=> bm!48822 d!131901))

(declare-fun d!131903 () Bool)

(declare-fun e!645189 () Bool)

(assert (=> d!131903 e!645189))

(declare-fun res!756709 () Bool)

(assert (=> d!131903 (=> res!756709 e!645189)))

(declare-fun lt!503466 () Bool)

(assert (=> d!131903 (= res!756709 (not lt!503466))))

(declare-fun lt!503467 () Bool)

(assert (=> d!131903 (= lt!503466 lt!503467)))

(declare-fun lt!503468 () Unit!37045)

(declare-fun e!645190 () Unit!37045)

(assert (=> d!131903 (= lt!503468 e!645190)))

(declare-fun c!110759 () Bool)

(assert (=> d!131903 (= c!110759 lt!503467)))

(assert (=> d!131903 (= lt!503467 (containsKey!587 (toList!8015 lt!503292) (select (arr!35562 _keys!1208) from!1455)))))

(assert (=> d!131903 (= (contains!6548 lt!503292 (select (arr!35562 _keys!1208) from!1455)) lt!503466)))

(declare-fun b!1133499 () Bool)

(declare-fun lt!503469 () Unit!37045)

(assert (=> b!1133499 (= e!645190 lt!503469)))

(assert (=> b!1133499 (= lt!503469 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503292) (select (arr!35562 _keys!1208) from!1455)))))

(assert (=> b!1133499 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503292) (select (arr!35562 _keys!1208) from!1455)))))

(declare-fun b!1133500 () Bool)

(declare-fun Unit!37064 () Unit!37045)

(assert (=> b!1133500 (= e!645190 Unit!37064)))

(declare-fun b!1133501 () Bool)

(assert (=> b!1133501 (= e!645189 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503292) (select (arr!35562 _keys!1208) from!1455))))))

(assert (= (and d!131903 c!110759) b!1133499))

(assert (= (and d!131903 (not c!110759)) b!1133500))

(assert (= (and d!131903 (not res!756709)) b!1133501))

(assert (=> d!131903 m!1046221))

(declare-fun m!1046895 () Bool)

(assert (=> d!131903 m!1046895))

(assert (=> b!1133499 m!1046221))

(declare-fun m!1046897 () Bool)

(assert (=> b!1133499 m!1046897))

(assert (=> b!1133499 m!1046221))

(declare-fun m!1046899 () Bool)

(assert (=> b!1133499 m!1046899))

(assert (=> b!1133499 m!1046899))

(declare-fun m!1046901 () Bool)

(assert (=> b!1133499 m!1046901))

(assert (=> b!1133501 m!1046221))

(assert (=> b!1133501 m!1046899))

(assert (=> b!1133501 m!1046899))

(assert (=> b!1133501 m!1046901))

(assert (=> b!1133186 d!131903))

(declare-fun d!131905 () Bool)

(declare-fun e!645191 () Bool)

(assert (=> d!131905 e!645191))

(declare-fun res!756710 () Bool)

(assert (=> d!131905 (=> res!756710 e!645191)))

(declare-fun lt!503470 () Bool)

(assert (=> d!131905 (= res!756710 (not lt!503470))))

(declare-fun lt!503471 () Bool)

(assert (=> d!131905 (= lt!503470 lt!503471)))

(declare-fun lt!503472 () Unit!37045)

(declare-fun e!645192 () Unit!37045)

(assert (=> d!131905 (= lt!503472 e!645192)))

(declare-fun c!110760 () Bool)

(assert (=> d!131905 (= c!110760 lt!503471)))

(assert (=> d!131905 (= lt!503471 (containsKey!587 (toList!8015 lt!503299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131905 (= (contains!6548 lt!503299 #b0000000000000000000000000000000000000000000000000000000000000000) lt!503470)))

(declare-fun b!1133502 () Bool)

(declare-fun lt!503473 () Unit!37045)

(assert (=> b!1133502 (= e!645192 lt!503473)))

(assert (=> b!1133502 (= lt!503473 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1133502 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1133503 () Bool)

(declare-fun Unit!37065 () Unit!37045)

(assert (=> b!1133503 (= e!645192 Unit!37065)))

(declare-fun b!1133504 () Bool)

(assert (=> b!1133504 (= e!645191 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131905 c!110760) b!1133502))

(assert (= (and d!131905 (not c!110760)) b!1133503))

(assert (= (and d!131905 (not res!756710)) b!1133504))

(declare-fun m!1046903 () Bool)

(assert (=> d!131905 m!1046903))

(declare-fun m!1046905 () Bool)

(assert (=> b!1133502 m!1046905))

(declare-fun m!1046907 () Bool)

(assert (=> b!1133502 m!1046907))

(assert (=> b!1133502 m!1046907))

(declare-fun m!1046909 () Bool)

(assert (=> b!1133502 m!1046909))

(assert (=> b!1133504 m!1046907))

(assert (=> b!1133504 m!1046907))

(assert (=> b!1133504 m!1046909))

(assert (=> d!131771 d!131905))

(assert (=> d!131771 d!131807))

(declare-fun d!131907 () Bool)

(declare-fun res!756711 () Bool)

(declare-fun e!645193 () Bool)

(assert (=> d!131907 (=> res!756711 e!645193)))

(assert (=> d!131907 (= res!756711 (= (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!131907 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!645193)))

(declare-fun b!1133505 () Bool)

(declare-fun e!645194 () Bool)

(assert (=> b!1133505 (= e!645193 e!645194)))

(declare-fun res!756712 () Bool)

(assert (=> b!1133505 (=> (not res!756712) (not e!645194))))

(assert (=> b!1133505 (= res!756712 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(declare-fun b!1133506 () Bool)

(assert (=> b!1133506 (= e!645194 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!131907 (not res!756711)) b!1133505))

(assert (= (and b!1133505 res!756712) b!1133506))

(declare-fun m!1046911 () Bool)

(assert (=> d!131907 m!1046911))

(declare-fun m!1046913 () Bool)

(assert (=> b!1133506 m!1046913))

(assert (=> b!1133224 d!131907))

(assert (=> b!1133251 d!131901))

(assert (=> b!1133183 d!131875))

(declare-fun d!131909 () Bool)

(declare-fun lt!503474 () Bool)

(assert (=> d!131909 (= lt!503474 (select (content!542 (toList!8015 lt!503332)) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun e!645196 () Bool)

(assert (=> d!131909 (= lt!503474 e!645196)))

(declare-fun res!756714 () Bool)

(assert (=> d!131909 (=> (not res!756714) (not e!645196))))

(assert (=> d!131909 (= res!756714 ((_ is Cons!24794) (toList!8015 lt!503332)))))

(assert (=> d!131909 (= (contains!6551 (toList!8015 lt!503332) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!503474)))

(declare-fun b!1133507 () Bool)

(declare-fun e!645195 () Bool)

(assert (=> b!1133507 (= e!645196 e!645195)))

(declare-fun res!756713 () Bool)

(assert (=> b!1133507 (=> res!756713 e!645195)))

(assert (=> b!1133507 (= res!756713 (= (h!26012 (toList!8015 lt!503332)) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun b!1133508 () Bool)

(assert (=> b!1133508 (= e!645195 (contains!6551 (t!35717 (toList!8015 lt!503332)) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!131909 res!756714) b!1133507))

(assert (= (and b!1133507 (not res!756713)) b!1133508))

(declare-fun m!1046915 () Bool)

(assert (=> d!131909 m!1046915))

(declare-fun m!1046917 () Bool)

(assert (=> d!131909 m!1046917))

(declare-fun m!1046919 () Bool)

(assert (=> b!1133508 m!1046919))

(assert (=> b!1133218 d!131909))

(declare-fun d!131911 () Bool)

(assert (=> d!131911 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun lt!503477 () Unit!37045)

(declare-fun choose!1784 (List!24798 (_ BitVec 64)) Unit!37045)

(assert (=> d!131911 (= lt!503477 (choose!1784 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun e!645199 () Bool)

(assert (=> d!131911 e!645199))

(declare-fun res!756717 () Bool)

(assert (=> d!131911 (=> (not res!756717) (not e!645199))))

(assert (=> d!131911 (= res!756717 (isStrictlySorted!715 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131911 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) lt!503477)))

(declare-fun b!1133511 () Bool)

(assert (=> b!1133511 (= e!645199 (containsKey!587 (toList!8015 (+!3479 lt!503163 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (= (and d!131911 res!756717) b!1133511))

(assert (=> d!131911 m!1046471))

(assert (=> d!131911 m!1046471))

(assert (=> d!131911 m!1046473))

(declare-fun m!1046921 () Bool)

(assert (=> d!131911 m!1046921))

(declare-fun m!1046923 () Bool)

(assert (=> d!131911 m!1046923))

(assert (=> b!1133511 m!1046467))

(assert (=> b!1133214 d!131911))

(assert (=> b!1133214 d!131893))

(assert (=> b!1133214 d!131895))

(assert (=> b!1133229 d!131805))

(assert (=> b!1133283 d!131899))

(declare-fun d!131913 () Bool)

(declare-fun e!645200 () Bool)

(assert (=> d!131913 e!645200))

(declare-fun res!756718 () Bool)

(assert (=> d!131913 (=> res!756718 e!645200)))

(declare-fun lt!503478 () Bool)

(assert (=> d!131913 (= res!756718 (not lt!503478))))

(declare-fun lt!503479 () Bool)

(assert (=> d!131913 (= lt!503478 lt!503479)))

(declare-fun lt!503480 () Unit!37045)

(declare-fun e!645201 () Unit!37045)

(assert (=> d!131913 (= lt!503480 e!645201)))

(declare-fun c!110761 () Bool)

(assert (=> d!131913 (= c!110761 lt!503479)))

(assert (=> d!131913 (= lt!503479 (containsKey!587 (toList!8015 (+!3479 lt!503298 (tuple2!18023 lt!503301 lt!503300))) lt!503295))))

(assert (=> d!131913 (= (contains!6548 (+!3479 lt!503298 (tuple2!18023 lt!503301 lt!503300)) lt!503295) lt!503478)))

(declare-fun b!1133512 () Bool)

(declare-fun lt!503481 () Unit!37045)

(assert (=> b!1133512 (= e!645201 lt!503481)))

(assert (=> b!1133512 (= lt!503481 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (+!3479 lt!503298 (tuple2!18023 lt!503301 lt!503300))) lt!503295))))

(assert (=> b!1133512 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503298 (tuple2!18023 lt!503301 lt!503300))) lt!503295))))

(declare-fun b!1133513 () Bool)

(declare-fun Unit!37066 () Unit!37045)

(assert (=> b!1133513 (= e!645201 Unit!37066)))

(declare-fun b!1133514 () Bool)

(assert (=> b!1133514 (= e!645200 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503298 (tuple2!18023 lt!503301 lt!503300))) lt!503295)))))

(assert (= (and d!131913 c!110761) b!1133512))

(assert (= (and d!131913 (not c!110761)) b!1133513))

(assert (= (and d!131913 (not res!756718)) b!1133514))

(declare-fun m!1046925 () Bool)

(assert (=> d!131913 m!1046925))

(declare-fun m!1046927 () Bool)

(assert (=> b!1133512 m!1046927))

(declare-fun m!1046929 () Bool)

(assert (=> b!1133512 m!1046929))

(assert (=> b!1133512 m!1046929))

(declare-fun m!1046931 () Bool)

(assert (=> b!1133512 m!1046931))

(assert (=> b!1133514 m!1046929))

(assert (=> b!1133514 m!1046929))

(assert (=> b!1133514 m!1046931))

(assert (=> b!1133194 d!131913))

(declare-fun d!131915 () Bool)

(assert (=> d!131915 (not (contains!6548 (+!3479 lt!503298 (tuple2!18023 lt!503301 lt!503300)) lt!503295))))

(declare-fun lt!503482 () Unit!37045)

(assert (=> d!131915 (= lt!503482 (choose!1783 lt!503298 lt!503301 lt!503300 lt!503295))))

(declare-fun e!645202 () Bool)

(assert (=> d!131915 e!645202))

(declare-fun res!756719 () Bool)

(assert (=> d!131915 (=> (not res!756719) (not e!645202))))

(assert (=> d!131915 (= res!756719 (not (contains!6548 lt!503298 lt!503295)))))

(assert (=> d!131915 (= (addStillNotContains!285 lt!503298 lt!503301 lt!503300 lt!503295) lt!503482)))

(declare-fun b!1133515 () Bool)

(assert (=> b!1133515 (= e!645202 (not (= lt!503301 lt!503295)))))

(assert (= (and d!131915 res!756719) b!1133515))

(assert (=> d!131915 m!1046435))

(assert (=> d!131915 m!1046435))

(assert (=> d!131915 m!1046439))

(declare-fun m!1046933 () Bool)

(assert (=> d!131915 m!1046933))

(declare-fun m!1046935 () Bool)

(assert (=> d!131915 m!1046935))

(assert (=> b!1133194 d!131915))

(declare-fun d!131917 () Bool)

(declare-fun e!645203 () Bool)

(assert (=> d!131917 e!645203))

(declare-fun res!756720 () Bool)

(assert (=> d!131917 (=> (not res!756720) (not e!645203))))

(declare-fun lt!503486 () ListLongMap!15999)

(assert (=> d!131917 (= res!756720 (contains!6548 lt!503486 (_1!9022 (tuple2!18023 lt!503301 lt!503300))))))

(declare-fun lt!503483 () List!24798)

(assert (=> d!131917 (= lt!503486 (ListLongMap!16000 lt!503483))))

(declare-fun lt!503484 () Unit!37045)

(declare-fun lt!503485 () Unit!37045)

(assert (=> d!131917 (= lt!503484 lt!503485)))

(assert (=> d!131917 (= (getValueByKey!624 lt!503483 (_1!9022 (tuple2!18023 lt!503301 lt!503300))) (Some!674 (_2!9022 (tuple2!18023 lt!503301 lt!503300))))))

(assert (=> d!131917 (= lt!503485 (lemmaContainsTupThenGetReturnValue!306 lt!503483 (_1!9022 (tuple2!18023 lt!503301 lt!503300)) (_2!9022 (tuple2!18023 lt!503301 lt!503300))))))

(assert (=> d!131917 (= lt!503483 (insertStrictlySorted!399 (toList!8015 lt!503298) (_1!9022 (tuple2!18023 lt!503301 lt!503300)) (_2!9022 (tuple2!18023 lt!503301 lt!503300))))))

(assert (=> d!131917 (= (+!3479 lt!503298 (tuple2!18023 lt!503301 lt!503300)) lt!503486)))

(declare-fun b!1133516 () Bool)

(declare-fun res!756721 () Bool)

(assert (=> b!1133516 (=> (not res!756721) (not e!645203))))

(assert (=> b!1133516 (= res!756721 (= (getValueByKey!624 (toList!8015 lt!503486) (_1!9022 (tuple2!18023 lt!503301 lt!503300))) (Some!674 (_2!9022 (tuple2!18023 lt!503301 lt!503300)))))))

(declare-fun b!1133517 () Bool)

(assert (=> b!1133517 (= e!645203 (contains!6551 (toList!8015 lt!503486) (tuple2!18023 lt!503301 lt!503300)))))

(assert (= (and d!131917 res!756720) b!1133516))

(assert (= (and b!1133516 res!756721) b!1133517))

(declare-fun m!1046937 () Bool)

(assert (=> d!131917 m!1046937))

(declare-fun m!1046939 () Bool)

(assert (=> d!131917 m!1046939))

(declare-fun m!1046941 () Bool)

(assert (=> d!131917 m!1046941))

(declare-fun m!1046943 () Bool)

(assert (=> d!131917 m!1046943))

(declare-fun m!1046945 () Bool)

(assert (=> b!1133516 m!1046945))

(declare-fun m!1046947 () Bool)

(assert (=> b!1133517 m!1046947))

(assert (=> b!1133194 d!131917))

(declare-fun d!131919 () Bool)

(declare-fun c!110762 () Bool)

(assert (=> d!131919 (= c!110762 ((_ is ValueCellFull!13523) (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!645204 () V!43081)

(assert (=> d!131919 (= (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!645204)))

(declare-fun b!1133518 () Bool)

(assert (=> b!1133518 (= e!645204 (get!18104 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133519 () Bool)

(assert (=> b!1133519 (= e!645204 (get!18105 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131919 c!110762) b!1133518))

(assert (= (and d!131919 (not c!110762)) b!1133519))

(assert (=> b!1133518 m!1046429))

(assert (=> b!1133518 m!1046171))

(declare-fun m!1046949 () Bool)

(assert (=> b!1133518 m!1046949))

(assert (=> b!1133519 m!1046429))

(assert (=> b!1133519 m!1046171))

(declare-fun m!1046951 () Bool)

(assert (=> b!1133519 m!1046951))

(assert (=> b!1133194 d!131919))

(declare-fun d!131921 () Bool)

(declare-fun e!645205 () Bool)

(assert (=> d!131921 e!645205))

(declare-fun res!756722 () Bool)

(assert (=> d!131921 (=> (not res!756722) (not e!645205))))

(declare-fun lt!503490 () ListLongMap!15999)

(assert (=> d!131921 (= res!756722 (contains!6548 lt!503490 (_1!9022 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!503487 () List!24798)

(assert (=> d!131921 (= lt!503490 (ListLongMap!16000 lt!503487))))

(declare-fun lt!503488 () Unit!37045)

(declare-fun lt!503489 () Unit!37045)

(assert (=> d!131921 (= lt!503488 lt!503489)))

(assert (=> d!131921 (= (getValueByKey!624 lt!503487 (_1!9022 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!674 (_2!9022 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131921 (= lt!503489 (lemmaContainsTupThenGetReturnValue!306 lt!503487 (_1!9022 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9022 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131921 (= lt!503487 (insertStrictlySorted!399 (toList!8015 call!48823) (_1!9022 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9022 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131921 (= (+!3479 call!48823 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!503490)))

(declare-fun b!1133520 () Bool)

(declare-fun res!756723 () Bool)

(assert (=> b!1133520 (=> (not res!756723) (not e!645205))))

(assert (=> b!1133520 (= res!756723 (= (getValueByKey!624 (toList!8015 lt!503490) (_1!9022 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!674 (_2!9022 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1133521 () Bool)

(assert (=> b!1133521 (= e!645205 (contains!6551 (toList!8015 lt!503490) (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131921 res!756722) b!1133520))

(assert (= (and b!1133520 res!756723) b!1133521))

(declare-fun m!1046953 () Bool)

(assert (=> d!131921 m!1046953))

(declare-fun m!1046955 () Bool)

(assert (=> d!131921 m!1046955))

(declare-fun m!1046957 () Bool)

(assert (=> d!131921 m!1046957))

(declare-fun m!1046959 () Bool)

(assert (=> d!131921 m!1046959))

(declare-fun m!1046961 () Bool)

(assert (=> b!1133520 m!1046961))

(declare-fun m!1046963 () Bool)

(assert (=> b!1133521 m!1046963))

(assert (=> b!1133194 d!131921))

(assert (=> b!1133274 d!131813))

(assert (=> bm!48828 d!131795))

(declare-fun b!1133522 () Bool)

(declare-fun e!645209 () Bool)

(declare-fun e!645211 () Bool)

(assert (=> b!1133522 (= e!645209 e!645211)))

(declare-fun c!110764 () Bool)

(declare-fun e!645208 () Bool)

(assert (=> b!1133522 (= c!110764 e!645208)))

(declare-fun res!756724 () Bool)

(assert (=> b!1133522 (=> (not res!756724) (not e!645208))))

(assert (=> b!1133522 (= res!756724 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(declare-fun b!1133523 () Bool)

(declare-fun e!645206 () ListLongMap!15999)

(declare-fun call!48850 () ListLongMap!15999)

(assert (=> b!1133523 (= e!645206 call!48850)))

(declare-fun d!131923 () Bool)

(assert (=> d!131923 e!645209))

(declare-fun res!756726 () Bool)

(assert (=> d!131923 (=> (not res!756726) (not e!645209))))

(declare-fun lt!503495 () ListLongMap!15999)

(assert (=> d!131923 (= res!756726 (not (contains!6548 lt!503495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!645207 () ListLongMap!15999)

(assert (=> d!131923 (= lt!503495 e!645207)))

(declare-fun c!110765 () Bool)

(assert (=> d!131923 (= c!110765 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(assert (=> d!131923 (validMask!0 mask!1564)))

(assert (=> d!131923 (= (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!503495)))

(declare-fun b!1133524 () Bool)

(declare-fun e!645210 () Bool)

(assert (=> b!1133524 (= e!645211 e!645210)))

(declare-fun c!110763 () Bool)

(assert (=> b!1133524 (= c!110763 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(declare-fun b!1133525 () Bool)

(assert (=> b!1133525 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(assert (=> b!1133525 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36100 lt!503154)))))

(declare-fun e!645212 () Bool)

(assert (=> b!1133525 (= e!645212 (= (apply!964 lt!503495 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1133526 () Bool)

(assert (=> b!1133526 (= e!645207 e!645206)))

(declare-fun c!110766 () Bool)

(assert (=> b!1133526 (= c!110766 (validKeyInArray!0 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1133527 () Bool)

(declare-fun lt!503492 () Unit!37045)

(declare-fun lt!503493 () Unit!37045)

(assert (=> b!1133527 (= lt!503492 lt!503493)))

(declare-fun lt!503491 () (_ BitVec 64))

(declare-fun lt!503497 () (_ BitVec 64))

(declare-fun lt!503494 () ListLongMap!15999)

(declare-fun lt!503496 () V!43081)

(assert (=> b!1133527 (not (contains!6548 (+!3479 lt!503494 (tuple2!18023 lt!503497 lt!503496)) lt!503491))))

(assert (=> b!1133527 (= lt!503493 (addStillNotContains!285 lt!503494 lt!503497 lt!503496 lt!503491))))

(assert (=> b!1133527 (= lt!503491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133527 (= lt!503496 (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133527 (= lt!503497 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1133527 (= lt!503494 call!48850)))

(assert (=> b!1133527 (= e!645206 (+!3479 call!48850 (tuple2!18023 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!18102 (select (arr!35563 lt!503154) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133528 () Bool)

(assert (=> b!1133528 (= e!645208 (validKeyInArray!0 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1133528 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!48847 () Bool)

(assert (=> bm!48847 (= call!48850 (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133529 () Bool)

(assert (=> b!1133529 (= e!645207 (ListLongMap!16000 Nil!24795))))

(declare-fun b!1133530 () Bool)

(declare-fun res!756727 () Bool)

(assert (=> b!1133530 (=> (not res!756727) (not e!645209))))

(assert (=> b!1133530 (= res!756727 (not (contains!6548 lt!503495 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133531 () Bool)

(assert (=> b!1133531 (= e!645211 e!645212)))

(assert (=> b!1133531 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(declare-fun res!756725 () Bool)

(assert (=> b!1133531 (= res!756725 (contains!6548 lt!503495 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1133531 (=> (not res!756725) (not e!645212))))

(declare-fun b!1133532 () Bool)

(assert (=> b!1133532 (= e!645210 (= lt!503495 (getCurrentListMapNoExtraKeys!4532 lt!503167 lt!503154 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133533 () Bool)

(assert (=> b!1133533 (= e!645210 (isEmpty!977 lt!503495))))

(assert (= (and d!131923 c!110765) b!1133529))

(assert (= (and d!131923 (not c!110765)) b!1133526))

(assert (= (and b!1133526 c!110766) b!1133527))

(assert (= (and b!1133526 (not c!110766)) b!1133523))

(assert (= (or b!1133527 b!1133523) bm!48847))

(assert (= (and d!131923 res!756726) b!1133530))

(assert (= (and b!1133530 res!756727) b!1133522))

(assert (= (and b!1133522 res!756724) b!1133528))

(assert (= (and b!1133522 c!110764) b!1133531))

(assert (= (and b!1133522 (not c!110764)) b!1133524))

(assert (= (and b!1133531 res!756725) b!1133525))

(assert (= (and b!1133524 c!110763) b!1133532))

(assert (= (and b!1133524 (not c!110763)) b!1133533))

(declare-fun b_lambda!18971 () Bool)

(assert (=> (not b_lambda!18971) (not b!1133525)))

(assert (=> b!1133525 t!35716))

(declare-fun b_and!38705 () Bool)

(assert (= b_and!38703 (and (=> t!35716 result!18047) b_and!38705)))

(declare-fun b_lambda!18973 () Bool)

(assert (=> (not b_lambda!18973) (not b!1133527)))

(assert (=> b!1133527 t!35716))

(declare-fun b_and!38707 () Bool)

(assert (= b_and!38705 (and (=> t!35716 result!18047) b_and!38707)))

(declare-fun m!1046965 () Bool)

(assert (=> b!1133533 m!1046965))

(declare-fun m!1046967 () Bool)

(assert (=> b!1133528 m!1046967))

(assert (=> b!1133528 m!1046967))

(declare-fun m!1046969 () Bool)

(assert (=> b!1133528 m!1046969))

(declare-fun m!1046971 () Bool)

(assert (=> b!1133532 m!1046971))

(declare-fun m!1046973 () Bool)

(assert (=> b!1133527 m!1046973))

(assert (=> b!1133527 m!1046973))

(assert (=> b!1133527 m!1046171))

(declare-fun m!1046975 () Bool)

(assert (=> b!1133527 m!1046975))

(declare-fun m!1046977 () Bool)

(assert (=> b!1133527 m!1046977))

(declare-fun m!1046979 () Bool)

(assert (=> b!1133527 m!1046979))

(assert (=> b!1133527 m!1046171))

(declare-fun m!1046981 () Bool)

(assert (=> b!1133527 m!1046981))

(assert (=> b!1133527 m!1046967))

(assert (=> b!1133527 m!1046979))

(declare-fun m!1046983 () Bool)

(assert (=> b!1133527 m!1046983))

(assert (=> b!1133526 m!1046967))

(assert (=> b!1133526 m!1046967))

(assert (=> b!1133526 m!1046969))

(assert (=> b!1133525 m!1046973))

(assert (=> b!1133525 m!1046973))

(assert (=> b!1133525 m!1046171))

(assert (=> b!1133525 m!1046975))

(assert (=> b!1133525 m!1046967))

(assert (=> b!1133525 m!1046171))

(assert (=> b!1133525 m!1046967))

(declare-fun m!1046985 () Bool)

(assert (=> b!1133525 m!1046985))

(declare-fun m!1046987 () Bool)

(assert (=> d!131923 m!1046987))

(assert (=> d!131923 m!1046195))

(assert (=> bm!48847 m!1046971))

(declare-fun m!1046989 () Bool)

(assert (=> b!1133530 m!1046989))

(assert (=> b!1133531 m!1046967))

(assert (=> b!1133531 m!1046967))

(declare-fun m!1046991 () Bool)

(assert (=> b!1133531 m!1046991))

(assert (=> bm!48820 d!131923))

(declare-fun d!131925 () Bool)

(declare-fun lt!503498 () Bool)

(assert (=> d!131925 (= lt!503498 (select (content!543 Nil!24796) (select (arr!35562 lt!503167) #b00000000000000000000000000000000)))))

(declare-fun e!645214 () Bool)

(assert (=> d!131925 (= lt!503498 e!645214)))

(declare-fun res!756728 () Bool)

(assert (=> d!131925 (=> (not res!756728) (not e!645214))))

(assert (=> d!131925 (= res!756728 ((_ is Cons!24795) Nil!24796))))

(assert (=> d!131925 (= (contains!6552 Nil!24796 (select (arr!35562 lt!503167) #b00000000000000000000000000000000)) lt!503498)))

(declare-fun b!1133534 () Bool)

(declare-fun e!645213 () Bool)

(assert (=> b!1133534 (= e!645214 e!645213)))

(declare-fun res!756729 () Bool)

(assert (=> b!1133534 (=> res!756729 e!645213)))

(assert (=> b!1133534 (= res!756729 (= (h!26013 Nil!24796) (select (arr!35562 lt!503167) #b00000000000000000000000000000000)))))

(declare-fun b!1133535 () Bool)

(assert (=> b!1133535 (= e!645213 (contains!6552 (t!35718 Nil!24796) (select (arr!35562 lt!503167) #b00000000000000000000000000000000)))))

(assert (= (and d!131925 res!756728) b!1133534))

(assert (= (and b!1133534 (not res!756729)) b!1133535))

(assert (=> d!131925 m!1046793))

(assert (=> d!131925 m!1046355))

(declare-fun m!1046993 () Bool)

(assert (=> d!131925 m!1046993))

(assert (=> b!1133535 m!1046355))

(declare-fun m!1046995 () Bool)

(assert (=> b!1133535 m!1046995))

(assert (=> b!1133272 d!131925))

(declare-fun d!131927 () Bool)

(assert (=> d!131927 (arrayContainsKey!0 lt!503167 lt!503266 #b00000000000000000000000000000000)))

(declare-fun lt!503499 () Unit!37045)

(assert (=> d!131927 (= lt!503499 (choose!13 lt!503167 lt!503266 #b00000000000000000000000000000000))))

(assert (=> d!131927 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!131927 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!503167 lt!503266 #b00000000000000000000000000000000) lt!503499)))

(declare-fun bs!32988 () Bool)

(assert (= bs!32988 d!131927))

(assert (=> bs!32988 m!1046361))

(declare-fun m!1046997 () Bool)

(assert (=> bs!32988 m!1046997))

(assert (=> b!1133138 d!131927))

(declare-fun d!131929 () Bool)

(declare-fun res!756730 () Bool)

(declare-fun e!645215 () Bool)

(assert (=> d!131929 (=> res!756730 e!645215)))

(assert (=> d!131929 (= res!756730 (= (select (arr!35562 lt!503167) #b00000000000000000000000000000000) lt!503266))))

(assert (=> d!131929 (= (arrayContainsKey!0 lt!503167 lt!503266 #b00000000000000000000000000000000) e!645215)))

(declare-fun b!1133536 () Bool)

(declare-fun e!645216 () Bool)

(assert (=> b!1133536 (= e!645215 e!645216)))

(declare-fun res!756731 () Bool)

(assert (=> b!1133536 (=> (not res!756731) (not e!645216))))

(assert (=> b!1133536 (= res!756731 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36099 lt!503167)))))

(declare-fun b!1133537 () Bool)

(assert (=> b!1133537 (= e!645216 (arrayContainsKey!0 lt!503167 lt!503266 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131929 (not res!756730)) b!1133536))

(assert (= (and b!1133536 res!756731) b!1133537))

(assert (=> d!131929 m!1046355))

(declare-fun m!1046999 () Bool)

(assert (=> b!1133537 m!1046999))

(assert (=> b!1133138 d!131929))

(declare-fun b!1133538 () Bool)

(declare-fun e!645218 () SeekEntryResult!9881)

(declare-fun lt!503502 () SeekEntryResult!9881)

(assert (=> b!1133538 (= e!645218 (Found!9881 (index!41897 lt!503502)))))

(declare-fun b!1133539 () Bool)

(declare-fun e!645219 () SeekEntryResult!9881)

(assert (=> b!1133539 (= e!645219 Undefined!9881)))

(declare-fun d!131931 () Bool)

(declare-fun lt!503501 () SeekEntryResult!9881)

(assert (=> d!131931 (and (or ((_ is Undefined!9881) lt!503501) (not ((_ is Found!9881) lt!503501)) (and (bvsge (index!41896 lt!503501) #b00000000000000000000000000000000) (bvslt (index!41896 lt!503501) (size!36099 lt!503167)))) (or ((_ is Undefined!9881) lt!503501) ((_ is Found!9881) lt!503501) (not ((_ is MissingZero!9881) lt!503501)) (and (bvsge (index!41895 lt!503501) #b00000000000000000000000000000000) (bvslt (index!41895 lt!503501) (size!36099 lt!503167)))) (or ((_ is Undefined!9881) lt!503501) ((_ is Found!9881) lt!503501) ((_ is MissingZero!9881) lt!503501) (not ((_ is MissingVacant!9881) lt!503501)) (and (bvsge (index!41898 lt!503501) #b00000000000000000000000000000000) (bvslt (index!41898 lt!503501) (size!36099 lt!503167)))) (or ((_ is Undefined!9881) lt!503501) (ite ((_ is Found!9881) lt!503501) (= (select (arr!35562 lt!503167) (index!41896 lt!503501)) (select (arr!35562 lt!503167) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9881) lt!503501) (= (select (arr!35562 lt!503167) (index!41895 lt!503501)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9881) lt!503501) (= (select (arr!35562 lt!503167) (index!41898 lt!503501)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131931 (= lt!503501 e!645219)))

(declare-fun c!110767 () Bool)

(assert (=> d!131931 (= c!110767 (and ((_ is Intermediate!9881) lt!503502) (undefined!10693 lt!503502)))))

(assert (=> d!131931 (= lt!503502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!35562 lt!503167) #b00000000000000000000000000000000) mask!1564) (select (arr!35562 lt!503167) #b00000000000000000000000000000000) lt!503167 mask!1564))))

(assert (=> d!131931 (validMask!0 mask!1564)))

(assert (=> d!131931 (= (seekEntryOrOpen!0 (select (arr!35562 lt!503167) #b00000000000000000000000000000000) lt!503167 mask!1564) lt!503501)))

(declare-fun b!1133540 () Bool)

(assert (=> b!1133540 (= e!645219 e!645218)))

(declare-fun lt!503500 () (_ BitVec 64))

(assert (=> b!1133540 (= lt!503500 (select (arr!35562 lt!503167) (index!41897 lt!503502)))))

(declare-fun c!110768 () Bool)

(assert (=> b!1133540 (= c!110768 (= lt!503500 (select (arr!35562 lt!503167) #b00000000000000000000000000000000)))))

(declare-fun b!1133541 () Bool)

(declare-fun c!110769 () Bool)

(assert (=> b!1133541 (= c!110769 (= lt!503500 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!645217 () SeekEntryResult!9881)

(assert (=> b!1133541 (= e!645218 e!645217)))

(declare-fun b!1133542 () Bool)

(assert (=> b!1133542 (= e!645217 (MissingZero!9881 (index!41897 lt!503502)))))

(declare-fun b!1133543 () Bool)

(assert (=> b!1133543 (= e!645217 (seekKeyOrZeroReturnVacant!0 (x!101469 lt!503502) (index!41897 lt!503502) (index!41897 lt!503502) (select (arr!35562 lt!503167) #b00000000000000000000000000000000) lt!503167 mask!1564))))

(assert (= (and d!131931 c!110767) b!1133539))

(assert (= (and d!131931 (not c!110767)) b!1133540))

(assert (= (and b!1133540 c!110768) b!1133538))

(assert (= (and b!1133540 (not c!110768)) b!1133541))

(assert (= (and b!1133541 c!110769) b!1133542))

(assert (= (and b!1133541 (not c!110769)) b!1133543))

(assert (=> d!131931 m!1046355))

(declare-fun m!1047001 () Bool)

(assert (=> d!131931 m!1047001))

(declare-fun m!1047003 () Bool)

(assert (=> d!131931 m!1047003))

(assert (=> d!131931 m!1046195))

(declare-fun m!1047005 () Bool)

(assert (=> d!131931 m!1047005))

(declare-fun m!1047007 () Bool)

(assert (=> d!131931 m!1047007))

(assert (=> d!131931 m!1047001))

(assert (=> d!131931 m!1046355))

(declare-fun m!1047009 () Bool)

(assert (=> d!131931 m!1047009))

(declare-fun m!1047011 () Bool)

(assert (=> b!1133540 m!1047011))

(assert (=> b!1133543 m!1046355))

(declare-fun m!1047013 () Bool)

(assert (=> b!1133543 m!1047013))

(assert (=> b!1133138 d!131931))

(declare-fun d!131933 () Bool)

(assert (=> d!131933 (= (validKeyInArray!0 (select (arr!35562 lt!503167) from!1455)) (and (not (= (select (arr!35562 lt!503167) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35562 lt!503167) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1133169 d!131933))

(declare-fun d!131935 () Bool)

(declare-fun e!645220 () Bool)

(assert (=> d!131935 e!645220))

(declare-fun res!756732 () Bool)

(assert (=> d!131935 (=> res!756732 e!645220)))

(declare-fun lt!503503 () Bool)

(assert (=> d!131935 (= res!756732 (not lt!503503))))

(declare-fun lt!503504 () Bool)

(assert (=> d!131935 (= lt!503503 lt!503504)))

(declare-fun lt!503505 () Unit!37045)

(declare-fun e!645221 () Unit!37045)

(assert (=> d!131935 (= lt!503505 e!645221)))

(declare-fun c!110770 () Bool)

(assert (=> d!131935 (= c!110770 lt!503504)))

(assert (=> d!131935 (= lt!503504 (containsKey!587 (toList!8015 lt!503285) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131935 (= (contains!6548 lt!503285 #b0000000000000000000000000000000000000000000000000000000000000000) lt!503503)))

(declare-fun b!1133544 () Bool)

(declare-fun lt!503506 () Unit!37045)

(assert (=> b!1133544 (= e!645221 lt!503506)))

(assert (=> b!1133544 (= lt!503506 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503285) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1133544 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503285) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1133545 () Bool)

(declare-fun Unit!37067 () Unit!37045)

(assert (=> b!1133545 (= e!645221 Unit!37067)))

(declare-fun b!1133546 () Bool)

(assert (=> b!1133546 (= e!645220 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503285) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131935 c!110770) b!1133544))

(assert (= (and d!131935 (not c!110770)) b!1133545))

(assert (= (and d!131935 (not res!756732)) b!1133546))

(declare-fun m!1047015 () Bool)

(assert (=> d!131935 m!1047015))

(declare-fun m!1047017 () Bool)

(assert (=> b!1133544 m!1047017))

(declare-fun m!1047019 () Bool)

(assert (=> b!1133544 m!1047019))

(assert (=> b!1133544 m!1047019))

(declare-fun m!1047021 () Bool)

(assert (=> b!1133544 m!1047021))

(assert (=> b!1133546 m!1047019))

(assert (=> b!1133546 m!1047019))

(assert (=> b!1133546 m!1047021))

(assert (=> d!131767 d!131935))

(assert (=> d!131767 d!131807))

(declare-fun d!131937 () Bool)

(assert (=> d!131937 (= (apply!964 lt!503299 (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18103 (getValueByKey!624 (toList!8015 lt!503299) (select (arr!35562 lt!503167) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!32989 () Bool)

(assert (= bs!32989 d!131937))

(assert (=> bs!32989 m!1046423))

(assert (=> bs!32989 m!1046757))

(assert (=> bs!32989 m!1046757))

(declare-fun m!1047023 () Bool)

(assert (=> bs!32989 m!1047023))

(assert (=> b!1133192 d!131937))

(assert (=> b!1133192 d!131919))

(assert (=> b!1133276 d!131813))

(assert (=> d!131785 d!131783))

(declare-fun d!131939 () Bool)

(assert (=> d!131939 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(assert (=> d!131939 true))

(declare-fun _$60!445 () Unit!37045)

(assert (=> d!131939 (= (choose!13 _keys!1208 k0!934 i!673) _$60!445)))

(declare-fun bs!32990 () Bool)

(assert (= bs!32990 d!131939))

(assert (=> bs!32990 m!1046227))

(assert (=> d!131785 d!131939))

(declare-fun d!131941 () Bool)

(assert (=> d!131941 (= (isEmpty!977 lt!503292) (isEmpty!978 (toList!8015 lt!503292)))))

(declare-fun bs!32991 () Bool)

(assert (= bs!32991 d!131941))

(declare-fun m!1047025 () Bool)

(assert (=> bs!32991 m!1047025))

(assert (=> b!1133188 d!131941))

(declare-fun d!131943 () Bool)

(declare-fun e!645222 () Bool)

(assert (=> d!131943 e!645222))

(declare-fun res!756733 () Bool)

(assert (=> d!131943 (=> res!756733 e!645222)))

(declare-fun lt!503507 () Bool)

(assert (=> d!131943 (= res!756733 (not lt!503507))))

(declare-fun lt!503508 () Bool)

(assert (=> d!131943 (= lt!503507 lt!503508)))

(declare-fun lt!503509 () Unit!37045)

(declare-fun e!645223 () Unit!37045)

(assert (=> d!131943 (= lt!503509 e!645223)))

(declare-fun c!110771 () Bool)

(assert (=> d!131943 (= c!110771 lt!503508)))

(assert (=> d!131943 (= lt!503508 (containsKey!587 (toList!8015 lt!503292) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131943 (= (contains!6548 lt!503292 #b0000000000000000000000000000000000000000000000000000000000000000) lt!503507)))

(declare-fun b!1133547 () Bool)

(declare-fun lt!503510 () Unit!37045)

(assert (=> b!1133547 (= e!645223 lt!503510)))

(assert (=> b!1133547 (= lt!503510 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503292) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1133547 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503292) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1133548 () Bool)

(declare-fun Unit!37068 () Unit!37045)

(assert (=> b!1133548 (= e!645223 Unit!37068)))

(declare-fun b!1133549 () Bool)

(assert (=> b!1133549 (= e!645222 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503292) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131943 c!110771) b!1133547))

(assert (= (and d!131943 (not c!110771)) b!1133548))

(assert (= (and d!131943 (not res!756733)) b!1133549))

(declare-fun m!1047027 () Bool)

(assert (=> d!131943 m!1047027))

(declare-fun m!1047029 () Bool)

(assert (=> b!1133547 m!1047029))

(declare-fun m!1047031 () Bool)

(assert (=> b!1133547 m!1047031))

(assert (=> b!1133547 m!1047031))

(declare-fun m!1047033 () Bool)

(assert (=> b!1133547 m!1047033))

(assert (=> b!1133549 m!1047031))

(assert (=> b!1133549 m!1047031))

(assert (=> b!1133549 m!1047033))

(assert (=> d!131769 d!131943))

(assert (=> d!131769 d!131807))

(declare-fun d!131945 () Bool)

(declare-fun e!645224 () Bool)

(assert (=> d!131945 e!645224))

(declare-fun res!756734 () Bool)

(assert (=> d!131945 (=> res!756734 e!645224)))

(declare-fun lt!503511 () Bool)

(assert (=> d!131945 (= res!756734 (not lt!503511))))

(declare-fun lt!503512 () Bool)

(assert (=> d!131945 (= lt!503511 lt!503512)))

(declare-fun lt!503513 () Unit!37045)

(declare-fun e!645225 () Unit!37045)

(assert (=> d!131945 (= lt!503513 e!645225)))

(declare-fun c!110772 () Bool)

(assert (=> d!131945 (= c!110772 lt!503512)))

(assert (=> d!131945 (= lt!503512 (containsKey!587 (toList!8015 lt!503332) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131945 (= (contains!6548 lt!503332 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!503511)))

(declare-fun b!1133550 () Bool)

(declare-fun lt!503514 () Unit!37045)

(assert (=> b!1133550 (= e!645225 lt!503514)))

(assert (=> b!1133550 (= lt!503514 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503332) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> b!1133550 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503332) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133551 () Bool)

(declare-fun Unit!37069 () Unit!37045)

(assert (=> b!1133551 (= e!645225 Unit!37069)))

(declare-fun b!1133552 () Bool)

(assert (=> b!1133552 (= e!645224 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503332) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131945 c!110772) b!1133550))

(assert (= (and d!131945 (not c!110772)) b!1133551))

(assert (= (and d!131945 (not res!756734)) b!1133552))

(declare-fun m!1047035 () Bool)

(assert (=> d!131945 m!1047035))

(declare-fun m!1047037 () Bool)

(assert (=> b!1133550 m!1047037))

(assert (=> b!1133550 m!1046483))

(assert (=> b!1133550 m!1046483))

(declare-fun m!1047039 () Bool)

(assert (=> b!1133550 m!1047039))

(assert (=> b!1133552 m!1046483))

(assert (=> b!1133552 m!1046483))

(assert (=> b!1133552 m!1047039))

(assert (=> d!131779 d!131945))

(declare-fun b!1133556 () Bool)

(declare-fun e!645227 () Option!675)

(assert (=> b!1133556 (= e!645227 None!673)))

(declare-fun b!1133554 () Bool)

(declare-fun e!645226 () Option!675)

(assert (=> b!1133554 (= e!645226 e!645227)))

(declare-fun c!110774 () Bool)

(assert (=> b!1133554 (= c!110774 (and ((_ is Cons!24794) lt!503329) (not (= (_1!9022 (h!26012 lt!503329)) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun d!131947 () Bool)

(declare-fun c!110773 () Bool)

(assert (=> d!131947 (= c!110773 (and ((_ is Cons!24794) lt!503329) (= (_1!9022 (h!26012 lt!503329)) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131947 (= (getValueByKey!624 lt!503329 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!645226)))

(declare-fun b!1133555 () Bool)

(assert (=> b!1133555 (= e!645227 (getValueByKey!624 (t!35717 lt!503329) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133553 () Bool)

(assert (=> b!1133553 (= e!645226 (Some!674 (_2!9022 (h!26012 lt!503329))))))

(assert (= (and d!131947 c!110773) b!1133553))

(assert (= (and d!131947 (not c!110773)) b!1133554))

(assert (= (and b!1133554 c!110774) b!1133555))

(assert (= (and b!1133554 (not c!110774)) b!1133556))

(declare-fun m!1047041 () Bool)

(assert (=> b!1133555 m!1047041))

(assert (=> d!131779 d!131947))

(declare-fun d!131949 () Bool)

(assert (=> d!131949 (= (getValueByKey!624 lt!503329 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!674 (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!503515 () Unit!37045)

(assert (=> d!131949 (= lt!503515 (choose!1782 lt!503329 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!645228 () Bool)

(assert (=> d!131949 e!645228))

(declare-fun res!756735 () Bool)

(assert (=> d!131949 (=> (not res!756735) (not e!645228))))

(assert (=> d!131949 (= res!756735 (isStrictlySorted!715 lt!503329))))

(assert (=> d!131949 (= (lemmaContainsTupThenGetReturnValue!306 lt!503329 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!503515)))

(declare-fun b!1133557 () Bool)

(declare-fun res!756736 () Bool)

(assert (=> b!1133557 (=> (not res!756736) (not e!645228))))

(assert (=> b!1133557 (= res!756736 (containsKey!587 lt!503329 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133558 () Bool)

(assert (=> b!1133558 (= e!645228 (contains!6551 lt!503329 (tuple2!18023 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!131949 res!756735) b!1133557))

(assert (= (and b!1133557 res!756736) b!1133558))

(assert (=> d!131949 m!1046477))

(declare-fun m!1047043 () Bool)

(assert (=> d!131949 m!1047043))

(declare-fun m!1047045 () Bool)

(assert (=> d!131949 m!1047045))

(declare-fun m!1047047 () Bool)

(assert (=> b!1133557 m!1047047))

(declare-fun m!1047049 () Bool)

(assert (=> b!1133558 m!1047049))

(assert (=> d!131779 d!131949))

(declare-fun b!1133559 () Bool)

(declare-fun c!110778 () Bool)

(assert (=> b!1133559 (= c!110778 (and ((_ is Cons!24794) (toList!8015 lt!503163)) (bvsgt (_1!9022 (h!26012 (toList!8015 lt!503163))) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!645232 () List!24798)

(declare-fun e!645233 () List!24798)

(assert (=> b!1133559 (= e!645232 e!645233)))

(declare-fun c!110777 () Bool)

(declare-fun b!1133560 () Bool)

(declare-fun e!645231 () List!24798)

(assert (=> b!1133560 (= e!645231 (ite c!110777 (t!35717 (toList!8015 lt!503163)) (ite c!110778 (Cons!24794 (h!26012 (toList!8015 lt!503163)) (t!35717 (toList!8015 lt!503163))) Nil!24795)))))

(declare-fun bm!48848 () Bool)

(declare-fun c!110776 () Bool)

(declare-fun call!48852 () List!24798)

(assert (=> bm!48848 (= call!48852 ($colon$colon!609 e!645231 (ite c!110776 (h!26012 (toList!8015 lt!503163)) (tuple2!18023 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun c!110775 () Bool)

(assert (=> bm!48848 (= c!110775 c!110776)))

(declare-fun b!1133561 () Bool)

(declare-fun e!645230 () List!24798)

(assert (=> b!1133561 (= e!645230 e!645232)))

(assert (=> b!1133561 (= c!110777 (and ((_ is Cons!24794) (toList!8015 lt!503163)) (= (_1!9022 (h!26012 (toList!8015 lt!503163))) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!48849 () Bool)

(declare-fun call!48851 () List!24798)

(assert (=> bm!48849 (= call!48851 call!48852)))

(declare-fun bm!48850 () Bool)

(declare-fun call!48853 () List!24798)

(assert (=> bm!48850 (= call!48853 call!48851)))

(declare-fun b!1133563 () Bool)

(declare-fun e!645229 () Bool)

(declare-fun lt!503516 () List!24798)

(assert (=> b!1133563 (= e!645229 (contains!6551 lt!503516 (tuple2!18023 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133564 () Bool)

(assert (=> b!1133564 (= e!645233 call!48853)))

(declare-fun b!1133565 () Bool)

(assert (=> b!1133565 (= e!645230 call!48852)))

(declare-fun d!131951 () Bool)

(assert (=> d!131951 e!645229))

(declare-fun res!756738 () Bool)

(assert (=> d!131951 (=> (not res!756738) (not e!645229))))

(assert (=> d!131951 (= res!756738 (isStrictlySorted!715 lt!503516))))

(assert (=> d!131951 (= lt!503516 e!645230)))

(assert (=> d!131951 (= c!110776 (and ((_ is Cons!24794) (toList!8015 lt!503163)) (bvslt (_1!9022 (h!26012 (toList!8015 lt!503163))) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131951 (isStrictlySorted!715 (toList!8015 lt!503163))))

(assert (=> d!131951 (= (insertStrictlySorted!399 (toList!8015 lt!503163) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!503516)))

(declare-fun b!1133562 () Bool)

(assert (=> b!1133562 (= e!645233 call!48853)))

(declare-fun b!1133566 () Bool)

(declare-fun res!756737 () Bool)

(assert (=> b!1133566 (=> (not res!756737) (not e!645229))))

(assert (=> b!1133566 (= res!756737 (containsKey!587 lt!503516 (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133567 () Bool)

(assert (=> b!1133567 (= e!645232 call!48851)))

(declare-fun b!1133568 () Bool)

(assert (=> b!1133568 (= e!645231 (insertStrictlySorted!399 (t!35717 (toList!8015 lt!503163)) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131951 c!110776) b!1133565))

(assert (= (and d!131951 (not c!110776)) b!1133561))

(assert (= (and b!1133561 c!110777) b!1133567))

(assert (= (and b!1133561 (not c!110777)) b!1133559))

(assert (= (and b!1133559 c!110778) b!1133564))

(assert (= (and b!1133559 (not c!110778)) b!1133562))

(assert (= (or b!1133564 b!1133562) bm!48850))

(assert (= (or b!1133567 bm!48850) bm!48849))

(assert (= (or b!1133565 bm!48849) bm!48848))

(assert (= (and bm!48848 c!110775) b!1133568))

(assert (= (and bm!48848 (not c!110775)) b!1133560))

(assert (= (and d!131951 res!756738) b!1133566))

(assert (= (and b!1133566 res!756737) b!1133563))

(declare-fun m!1047051 () Bool)

(assert (=> b!1133566 m!1047051))

(declare-fun m!1047053 () Bool)

(assert (=> b!1133563 m!1047053))

(declare-fun m!1047055 () Bool)

(assert (=> b!1133568 m!1047055))

(declare-fun m!1047057 () Bool)

(assert (=> d!131951 m!1047057))

(declare-fun m!1047059 () Bool)

(assert (=> d!131951 m!1047059))

(declare-fun m!1047061 () Bool)

(assert (=> bm!48848 m!1047061))

(assert (=> d!131779 d!131951))

(declare-fun d!131953 () Bool)

(declare-fun e!645234 () Bool)

(assert (=> d!131953 e!645234))

(declare-fun res!756739 () Bool)

(assert (=> d!131953 (=> res!756739 e!645234)))

(declare-fun lt!503517 () Bool)

(assert (=> d!131953 (= res!756739 (not lt!503517))))

(declare-fun lt!503518 () Bool)

(assert (=> d!131953 (= lt!503517 lt!503518)))

(declare-fun lt!503519 () Unit!37045)

(declare-fun e!645235 () Unit!37045)

(assert (=> d!131953 (= lt!503519 e!645235)))

(declare-fun c!110779 () Bool)

(assert (=> d!131953 (= c!110779 lt!503518)))

(assert (=> d!131953 (= lt!503518 (containsKey!587 (toList!8015 (+!3479 (ite c!110617 lt!503163 lt!503153) (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944))))) k0!934))))

(assert (=> d!131953 (= (contains!6548 (+!3479 (ite c!110617 lt!503163 lt!503153) (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)))) k0!934) lt!503517)))

(declare-fun b!1133569 () Bool)

(declare-fun lt!503520 () Unit!37045)

(assert (=> b!1133569 (= e!645235 lt!503520)))

(assert (=> b!1133569 (= lt!503520 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (+!3479 (ite c!110617 lt!503163 lt!503153) (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944))))) k0!934))))

(assert (=> b!1133569 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 (ite c!110617 lt!503163 lt!503153) (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944))))) k0!934))))

(declare-fun b!1133570 () Bool)

(declare-fun Unit!37070 () Unit!37045)

(assert (=> b!1133570 (= e!645235 Unit!37070)))

(declare-fun b!1133571 () Bool)

(assert (=> b!1133571 (= e!645234 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 (ite c!110617 lt!503163 lt!503153) (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944))))) k0!934)))))

(assert (= (and d!131953 c!110779) b!1133569))

(assert (= (and d!131953 (not c!110779)) b!1133570))

(assert (= (and d!131953 (not res!756739)) b!1133571))

(declare-fun m!1047063 () Bool)

(assert (=> d!131953 m!1047063))

(declare-fun m!1047065 () Bool)

(assert (=> b!1133569 m!1047065))

(declare-fun m!1047067 () Bool)

(assert (=> b!1133569 m!1047067))

(assert (=> b!1133569 m!1047067))

(declare-fun m!1047069 () Bool)

(assert (=> b!1133569 m!1047069))

(assert (=> b!1133571 m!1047067))

(assert (=> b!1133571 m!1047067))

(assert (=> b!1133571 m!1047069))

(assert (=> d!131801 d!131953))

(declare-fun d!131955 () Bool)

(declare-fun e!645236 () Bool)

(assert (=> d!131955 e!645236))

(declare-fun res!756740 () Bool)

(assert (=> d!131955 (=> (not res!756740) (not e!645236))))

(declare-fun lt!503524 () ListLongMap!15999)

(assert (=> d!131955 (= res!756740 (contains!6548 lt!503524 (_1!9022 (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944))))))))

(declare-fun lt!503521 () List!24798)

(assert (=> d!131955 (= lt!503524 (ListLongMap!16000 lt!503521))))

(declare-fun lt!503522 () Unit!37045)

(declare-fun lt!503523 () Unit!37045)

(assert (=> d!131955 (= lt!503522 lt!503523)))

(assert (=> d!131955 (= (getValueByKey!624 lt!503521 (_1!9022 (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944))))) (Some!674 (_2!9022 (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944))))))))

(assert (=> d!131955 (= lt!503523 (lemmaContainsTupThenGetReturnValue!306 lt!503521 (_1!9022 (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)))) (_2!9022 (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944))))))))

(assert (=> d!131955 (= lt!503521 (insertStrictlySorted!399 (toList!8015 (ite c!110617 lt!503163 lt!503153)) (_1!9022 (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)))) (_2!9022 (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944))))))))

(assert (=> d!131955 (= (+!3479 (ite c!110617 lt!503163 lt!503153) (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)))) lt!503524)))

(declare-fun b!1133572 () Bool)

(declare-fun res!756741 () Bool)

(assert (=> b!1133572 (=> (not res!756741) (not e!645236))))

(assert (=> b!1133572 (= res!756741 (= (getValueByKey!624 (toList!8015 lt!503524) (_1!9022 (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944))))) (Some!674 (_2!9022 (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)))))))))

(declare-fun b!1133573 () Bool)

(assert (=> b!1133573 (= e!645236 (contains!6551 (toList!8015 lt!503524) (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)))))))

(assert (= (and d!131955 res!756740) b!1133572))

(assert (= (and b!1133572 res!756741) b!1133573))

(declare-fun m!1047071 () Bool)

(assert (=> d!131955 m!1047071))

(declare-fun m!1047073 () Bool)

(assert (=> d!131955 m!1047073))

(declare-fun m!1047075 () Bool)

(assert (=> d!131955 m!1047075))

(declare-fun m!1047077 () Bool)

(assert (=> d!131955 m!1047077))

(declare-fun m!1047079 () Bool)

(assert (=> b!1133572 m!1047079))

(declare-fun m!1047081 () Bool)

(assert (=> b!1133573 m!1047081))

(assert (=> d!131801 d!131955))

(declare-fun d!131957 () Bool)

(assert (=> d!131957 (contains!6548 (+!3479 (ite c!110617 lt!503163 lt!503153) (tuple2!18023 (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)))) k0!934)))

(assert (=> d!131957 true))

(declare-fun _$35!451 () Unit!37045)

(assert (=> d!131957 (= (choose!1779 (ite c!110617 lt!503163 lt!503153) (ite c!110617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110617 minValue!944 (ite c!110621 zeroValue!944 minValue!944)) k0!934) _$35!451)))

(declare-fun bs!32992 () Bool)

(assert (= bs!32992 d!131957))

(assert (=> bs!32992 m!1046559))

(assert (=> bs!32992 m!1046559))

(assert (=> bs!32992 m!1046561))

(assert (=> d!131801 d!131957))

(declare-fun d!131959 () Bool)

(declare-fun e!645237 () Bool)

(assert (=> d!131959 e!645237))

(declare-fun res!756742 () Bool)

(assert (=> d!131959 (=> res!756742 e!645237)))

(declare-fun lt!503525 () Bool)

(assert (=> d!131959 (= res!756742 (not lt!503525))))

(declare-fun lt!503526 () Bool)

(assert (=> d!131959 (= lt!503525 lt!503526)))

(declare-fun lt!503527 () Unit!37045)

(declare-fun e!645238 () Unit!37045)

(assert (=> d!131959 (= lt!503527 e!645238)))

(declare-fun c!110780 () Bool)

(assert (=> d!131959 (= c!110780 lt!503526)))

(assert (=> d!131959 (= lt!503526 (containsKey!587 (toList!8015 (ite c!110617 lt!503163 lt!503153)) k0!934))))

(assert (=> d!131959 (= (contains!6548 (ite c!110617 lt!503163 lt!503153) k0!934) lt!503525)))

(declare-fun b!1133575 () Bool)

(declare-fun lt!503528 () Unit!37045)

(assert (=> b!1133575 (= e!645238 lt!503528)))

(assert (=> b!1133575 (= lt!503528 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (ite c!110617 lt!503163 lt!503153)) k0!934))))

(assert (=> b!1133575 (isDefined!453 (getValueByKey!624 (toList!8015 (ite c!110617 lt!503163 lt!503153)) k0!934))))

(declare-fun b!1133576 () Bool)

(declare-fun Unit!37071 () Unit!37045)

(assert (=> b!1133576 (= e!645238 Unit!37071)))

(declare-fun b!1133577 () Bool)

(assert (=> b!1133577 (= e!645237 (isDefined!453 (getValueByKey!624 (toList!8015 (ite c!110617 lt!503163 lt!503153)) k0!934)))))

(assert (= (and d!131959 c!110780) b!1133575))

(assert (= (and d!131959 (not c!110780)) b!1133576))

(assert (= (and d!131959 (not res!756742)) b!1133577))

(declare-fun m!1047083 () Bool)

(assert (=> d!131959 m!1047083))

(declare-fun m!1047085 () Bool)

(assert (=> b!1133575 m!1047085))

(declare-fun m!1047087 () Bool)

(assert (=> b!1133575 m!1047087))

(assert (=> b!1133575 m!1047087))

(declare-fun m!1047089 () Bool)

(assert (=> b!1133575 m!1047089))

(assert (=> b!1133577 m!1047087))

(assert (=> b!1133577 m!1047087))

(assert (=> b!1133577 m!1047089))

(assert (=> d!131801 d!131959))

(assert (=> b!1133199 d!131923))

(declare-fun d!131961 () Bool)

(declare-fun e!645239 () Bool)

(assert (=> d!131961 e!645239))

(declare-fun res!756743 () Bool)

(assert (=> d!131961 (=> res!756743 e!645239)))

(declare-fun lt!503529 () Bool)

(assert (=> d!131961 (= res!756743 (not lt!503529))))

(declare-fun lt!503530 () Bool)

(assert (=> d!131961 (= lt!503529 lt!503530)))

(declare-fun lt!503531 () Unit!37045)

(declare-fun e!645240 () Unit!37045)

(assert (=> d!131961 (= lt!503531 e!645240)))

(declare-fun c!110781 () Bool)

(assert (=> d!131961 (= c!110781 lt!503530)))

(assert (=> d!131961 (= lt!503530 (containsKey!587 (toList!8015 lt!503299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131961 (= (contains!6548 lt!503299 #b1000000000000000000000000000000000000000000000000000000000000000) lt!503529)))

(declare-fun b!1133578 () Bool)

(declare-fun lt!503532 () Unit!37045)

(assert (=> b!1133578 (= e!645240 lt!503532)))

(assert (=> b!1133578 (= lt!503532 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1133578 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1133579 () Bool)

(declare-fun Unit!37072 () Unit!37045)

(assert (=> b!1133579 (= e!645240 Unit!37072)))

(declare-fun b!1133580 () Bool)

(assert (=> b!1133580 (= e!645239 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131961 c!110781) b!1133578))

(assert (= (and d!131961 (not c!110781)) b!1133579))

(assert (= (and d!131961 (not res!756743)) b!1133580))

(declare-fun m!1047091 () Bool)

(assert (=> d!131961 m!1047091))

(declare-fun m!1047093 () Bool)

(assert (=> b!1133578 m!1047093))

(declare-fun m!1047095 () Bool)

(assert (=> b!1133578 m!1047095))

(assert (=> b!1133578 m!1047095))

(declare-fun m!1047097 () Bool)

(assert (=> b!1133578 m!1047097))

(assert (=> b!1133580 m!1047095))

(assert (=> b!1133580 m!1047095))

(assert (=> b!1133580 m!1047097))

(assert (=> b!1133197 d!131961))

(assert (=> b!1133171 d!131933))

(declare-fun d!131963 () Bool)

(declare-fun e!645241 () Bool)

(assert (=> d!131963 e!645241))

(declare-fun res!756744 () Bool)

(assert (=> d!131963 (=> res!756744 e!645241)))

(declare-fun lt!503533 () Bool)

(assert (=> d!131963 (= res!756744 (not lt!503533))))

(declare-fun lt!503534 () Bool)

(assert (=> d!131963 (= lt!503533 lt!503534)))

(declare-fun lt!503535 () Unit!37045)

(declare-fun e!645242 () Unit!37045)

(assert (=> d!131963 (= lt!503535 e!645242)))

(declare-fun c!110782 () Bool)

(assert (=> d!131963 (= c!110782 lt!503534)))

(assert (=> d!131963 (= lt!503534 (containsKey!587 (toList!8015 (+!3479 lt!503153 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(assert (=> d!131963 (= (contains!6548 (+!3479 lt!503153 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934) lt!503533)))

(declare-fun b!1133581 () Bool)

(declare-fun lt!503536 () Unit!37045)

(assert (=> b!1133581 (= e!645242 lt!503536)))

(assert (=> b!1133581 (= lt!503536 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (+!3479 lt!503153 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(assert (=> b!1133581 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503153 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(declare-fun b!1133582 () Bool)

(declare-fun Unit!37073 () Unit!37045)

(assert (=> b!1133582 (= e!645242 Unit!37073)))

(declare-fun b!1133583 () Bool)

(assert (=> b!1133583 (= e!645241 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503153 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934)))))

(assert (= (and d!131963 c!110782) b!1133581))

(assert (= (and d!131963 (not c!110782)) b!1133582))

(assert (= (and d!131963 (not res!756744)) b!1133583))

(declare-fun m!1047099 () Bool)

(assert (=> d!131963 m!1047099))

(declare-fun m!1047101 () Bool)

(assert (=> b!1133581 m!1047101))

(declare-fun m!1047103 () Bool)

(assert (=> b!1133581 m!1047103))

(assert (=> b!1133581 m!1047103))

(declare-fun m!1047105 () Bool)

(assert (=> b!1133581 m!1047105))

(assert (=> b!1133583 m!1047103))

(assert (=> b!1133583 m!1047103))

(assert (=> b!1133583 m!1047105))

(assert (=> d!131775 d!131963))

(declare-fun d!131965 () Bool)

(declare-fun e!645243 () Bool)

(assert (=> d!131965 e!645243))

(declare-fun res!756745 () Bool)

(assert (=> d!131965 (=> (not res!756745) (not e!645243))))

(declare-fun lt!503540 () ListLongMap!15999)

(assert (=> d!131965 (= res!756745 (contains!6548 lt!503540 (_1!9022 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!503537 () List!24798)

(assert (=> d!131965 (= lt!503540 (ListLongMap!16000 lt!503537))))

(declare-fun lt!503538 () Unit!37045)

(declare-fun lt!503539 () Unit!37045)

(assert (=> d!131965 (= lt!503538 lt!503539)))

(assert (=> d!131965 (= (getValueByKey!624 lt!503537 (_1!9022 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!674 (_2!9022 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!131965 (= lt!503539 (lemmaContainsTupThenGetReturnValue!306 lt!503537 (_1!9022 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9022 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!131965 (= lt!503537 (insertStrictlySorted!399 (toList!8015 lt!503153) (_1!9022 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9022 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!131965 (= (+!3479 lt!503153 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!503540)))

(declare-fun b!1133584 () Bool)

(declare-fun res!756746 () Bool)

(assert (=> b!1133584 (=> (not res!756746) (not e!645243))))

(assert (=> b!1133584 (= res!756746 (= (getValueByKey!624 (toList!8015 lt!503540) (_1!9022 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!674 (_2!9022 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1133585 () Bool)

(assert (=> b!1133585 (= e!645243 (contains!6551 (toList!8015 lt!503540) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!131965 res!756745) b!1133584))

(assert (= (and b!1133584 res!756746) b!1133585))

(declare-fun m!1047107 () Bool)

(assert (=> d!131965 m!1047107))

(declare-fun m!1047109 () Bool)

(assert (=> d!131965 m!1047109))

(declare-fun m!1047111 () Bool)

(assert (=> d!131965 m!1047111))

(declare-fun m!1047113 () Bool)

(assert (=> d!131965 m!1047113))

(declare-fun m!1047115 () Bool)

(assert (=> b!1133584 m!1047115))

(declare-fun m!1047117 () Bool)

(assert (=> b!1133585 m!1047117))

(assert (=> d!131775 d!131965))

(declare-fun d!131967 () Bool)

(assert (=> d!131967 (contains!6548 (+!3479 lt!503153 (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(assert (=> d!131967 true))

(declare-fun _$35!452 () Unit!37045)

(assert (=> d!131967 (= (choose!1779 lt!503153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) _$35!452)))

(declare-fun bs!32993 () Bool)

(assert (= bs!32993 d!131967))

(assert (=> bs!32993 m!1046461))

(assert (=> bs!32993 m!1046461))

(assert (=> bs!32993 m!1046463))

(assert (=> d!131775 d!131967))

(assert (=> d!131775 d!131793))

(declare-fun b!1133589 () Bool)

(declare-fun e!645245 () Option!675)

(assert (=> b!1133589 (= e!645245 None!673)))

(declare-fun b!1133587 () Bool)

(declare-fun e!645244 () Option!675)

(assert (=> b!1133587 (= e!645244 e!645245)))

(declare-fun c!110784 () Bool)

(assert (=> b!1133587 (= c!110784 (and ((_ is Cons!24794) (toList!8015 lt!503313)) (not (= (_1!9022 (h!26012 (toList!8015 lt!503313))) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun c!110783 () Bool)

(declare-fun d!131969 () Bool)

(assert (=> d!131969 (= c!110783 (and ((_ is Cons!24794) (toList!8015 lt!503313)) (= (_1!9022 (h!26012 (toList!8015 lt!503313))) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!131969 (= (getValueByKey!624 (toList!8015 lt!503313) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!645244)))

(declare-fun b!1133588 () Bool)

(assert (=> b!1133588 (= e!645245 (getValueByKey!624 (t!35717 (toList!8015 lt!503313)) (_1!9022 (ite (or c!110617 c!110621) (tuple2!18023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133586 () Bool)

(assert (=> b!1133586 (= e!645244 (Some!674 (_2!9022 (h!26012 (toList!8015 lt!503313)))))))

(assert (= (and d!131969 c!110783) b!1133586))

(assert (= (and d!131969 (not c!110783)) b!1133587))

(assert (= (and b!1133587 c!110784) b!1133588))

(assert (= (and b!1133587 (not c!110784)) b!1133589))

(declare-fun m!1047119 () Bool)

(assert (=> b!1133588 m!1047119))

(assert (=> b!1133205 d!131969))

(declare-fun d!131971 () Bool)

(assert (=> d!131971 (= (apply!964 lt!503292 (select (arr!35562 _keys!1208) from!1455)) (get!18103 (getValueByKey!624 (toList!8015 lt!503292) (select (arr!35562 _keys!1208) from!1455))))))

(declare-fun bs!32994 () Bool)

(assert (= bs!32994 d!131971))

(assert (=> bs!32994 m!1046221))

(assert (=> bs!32994 m!1046899))

(assert (=> bs!32994 m!1046899))

(declare-fun m!1047121 () Bool)

(assert (=> bs!32994 m!1047121))

(assert (=> b!1133180 d!131971))

(declare-fun d!131973 () Bool)

(declare-fun c!110785 () Bool)

(assert (=> d!131973 (= c!110785 ((_ is ValueCellFull!13523) (select (arr!35563 _values!996) from!1455)))))

(declare-fun e!645246 () V!43081)

(assert (=> d!131973 (= (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!645246)))

(declare-fun b!1133590 () Bool)

(assert (=> b!1133590 (= e!645246 (get!18104 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133591 () Bool)

(assert (=> b!1133591 (= e!645246 (get!18105 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131973 c!110785) b!1133590))

(assert (= (and d!131973 (not c!110785)) b!1133591))

(assert (=> b!1133590 m!1046401))

(assert (=> b!1133590 m!1046171))

(declare-fun m!1047123 () Bool)

(assert (=> b!1133590 m!1047123))

(assert (=> b!1133591 m!1046401))

(assert (=> b!1133591 m!1046171))

(declare-fun m!1047125 () Bool)

(assert (=> b!1133591 m!1047125))

(assert (=> b!1133180 d!131973))

(declare-fun d!131975 () Bool)

(declare-fun res!756747 () Bool)

(declare-fun e!645249 () Bool)

(assert (=> d!131975 (=> res!756747 e!645249)))

(assert (=> d!131975 (= res!756747 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(assert (=> d!131975 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564) e!645249)))

(declare-fun b!1133592 () Bool)

(declare-fun e!645247 () Bool)

(assert (=> b!1133592 (= e!645249 e!645247)))

(declare-fun c!110786 () Bool)

(assert (=> b!1133592 (= c!110786 (validKeyInArray!0 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1133593 () Bool)

(declare-fun e!645248 () Bool)

(assert (=> b!1133593 (= e!645247 e!645248)))

(declare-fun lt!503543 () (_ BitVec 64))

(assert (=> b!1133593 (= lt!503543 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!503542 () Unit!37045)

(assert (=> b!1133593 (= lt!503542 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!503543 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1133593 (arrayContainsKey!0 _keys!1208 lt!503543 #b00000000000000000000000000000000)))

(declare-fun lt!503541 () Unit!37045)

(assert (=> b!1133593 (= lt!503541 lt!503542)))

(declare-fun res!756748 () Bool)

(assert (=> b!1133593 (= res!756748 (= (seekEntryOrOpen!0 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1208 mask!1564) (Found!9881 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1133593 (=> (not res!756748) (not e!645248))))

(declare-fun bm!48851 () Bool)

(declare-fun call!48854 () Bool)

(assert (=> bm!48851 (= call!48854 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1133594 () Bool)

(assert (=> b!1133594 (= e!645247 call!48854)))

(declare-fun b!1133595 () Bool)

(assert (=> b!1133595 (= e!645248 call!48854)))

(assert (= (and d!131975 (not res!756747)) b!1133592))

(assert (= (and b!1133592 c!110786) b!1133593))

(assert (= (and b!1133592 (not c!110786)) b!1133594))

(assert (= (and b!1133593 res!756748) b!1133595))

(assert (= (or b!1133595 b!1133594) bm!48851))

(assert (=> b!1133592 m!1046911))

(assert (=> b!1133592 m!1046911))

(declare-fun m!1047127 () Bool)

(assert (=> b!1133592 m!1047127))

(assert (=> b!1133593 m!1046911))

(declare-fun m!1047129 () Bool)

(assert (=> b!1133593 m!1047129))

(declare-fun m!1047131 () Bool)

(assert (=> b!1133593 m!1047131))

(assert (=> b!1133593 m!1046911))

(declare-fun m!1047133 () Bool)

(assert (=> b!1133593 m!1047133))

(declare-fun m!1047135 () Bool)

(assert (=> bm!48851 m!1047135))

(assert (=> bm!48821 d!131975))

(declare-fun d!131977 () Bool)

(assert (=> d!131977 (isDefined!453 (getValueByKey!624 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934))))

(declare-fun lt!503544 () Unit!37045)

(assert (=> d!131977 (= lt!503544 (choose!1784 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934))))

(declare-fun e!645250 () Bool)

(assert (=> d!131977 e!645250))

(declare-fun res!756749 () Bool)

(assert (=> d!131977 (=> (not res!756749) (not e!645250))))

(assert (=> d!131977 (= res!756749 (isStrictlySorted!715 (toList!8015 (ite c!110617 lt!503163 call!48766))))))

(assert (=> d!131977 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934) lt!503544)))

(declare-fun b!1133596 () Bool)

(assert (=> b!1133596 (= e!645250 (containsKey!587 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934))))

(assert (= (and d!131977 res!756749) b!1133596))

(assert (=> d!131977 m!1046499))

(assert (=> d!131977 m!1046499))

(assert (=> d!131977 m!1046501))

(declare-fun m!1047137 () Bool)

(assert (=> d!131977 m!1047137))

(declare-fun m!1047139 () Bool)

(assert (=> d!131977 m!1047139))

(assert (=> b!1133596 m!1046495))

(assert (=> b!1133231 d!131977))

(declare-fun d!131979 () Bool)

(assert (=> d!131979 (= (isDefined!453 (getValueByKey!624 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934)) (not (isEmpty!979 (getValueByKey!624 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934))))))

(declare-fun bs!32995 () Bool)

(assert (= bs!32995 d!131979))

(assert (=> bs!32995 m!1046499))

(declare-fun m!1047141 () Bool)

(assert (=> bs!32995 m!1047141))

(assert (=> b!1133231 d!131979))

(declare-fun b!1133600 () Bool)

(declare-fun e!645252 () Option!675)

(assert (=> b!1133600 (= e!645252 None!673)))

(declare-fun b!1133598 () Bool)

(declare-fun e!645251 () Option!675)

(assert (=> b!1133598 (= e!645251 e!645252)))

(declare-fun c!110788 () Bool)

(assert (=> b!1133598 (= c!110788 (and ((_ is Cons!24794) (toList!8015 (ite c!110617 lt!503163 call!48766))) (not (= (_1!9022 (h!26012 (toList!8015 (ite c!110617 lt!503163 call!48766)))) k0!934))))))

(declare-fun d!131981 () Bool)

(declare-fun c!110787 () Bool)

(assert (=> d!131981 (= c!110787 (and ((_ is Cons!24794) (toList!8015 (ite c!110617 lt!503163 call!48766))) (= (_1!9022 (h!26012 (toList!8015 (ite c!110617 lt!503163 call!48766)))) k0!934)))))

(assert (=> d!131981 (= (getValueByKey!624 (toList!8015 (ite c!110617 lt!503163 call!48766)) k0!934) e!645251)))

(declare-fun b!1133599 () Bool)

(assert (=> b!1133599 (= e!645252 (getValueByKey!624 (t!35717 (toList!8015 (ite c!110617 lt!503163 call!48766))) k0!934))))

(declare-fun b!1133597 () Bool)

(assert (=> b!1133597 (= e!645251 (Some!674 (_2!9022 (h!26012 (toList!8015 (ite c!110617 lt!503163 call!48766))))))))

(assert (= (and d!131981 c!110787) b!1133597))

(assert (= (and d!131981 (not c!110787)) b!1133598))

(assert (= (and b!1133598 c!110788) b!1133599))

(assert (= (and b!1133598 (not c!110788)) b!1133600))

(declare-fun m!1047143 () Bool)

(assert (=> b!1133599 m!1047143))

(assert (=> b!1133231 d!131981))

(declare-fun d!131983 () Bool)

(declare-fun e!645253 () Bool)

(assert (=> d!131983 e!645253))

(declare-fun res!756750 () Bool)

(assert (=> d!131983 (=> res!756750 e!645253)))

(declare-fun lt!503545 () Bool)

(assert (=> d!131983 (= res!756750 (not lt!503545))))

(declare-fun lt!503546 () Bool)

(assert (=> d!131983 (= lt!503545 lt!503546)))

(declare-fun lt!503547 () Unit!37045)

(declare-fun e!645254 () Unit!37045)

(assert (=> d!131983 (= lt!503547 e!645254)))

(declare-fun c!110789 () Bool)

(assert (=> d!131983 (= c!110789 lt!503546)))

(assert (=> d!131983 (= lt!503546 (containsKey!587 (toList!8015 lt!503285) (select (arr!35562 lt!503167) from!1455)))))

(assert (=> d!131983 (= (contains!6548 lt!503285 (select (arr!35562 lt!503167) from!1455)) lt!503545)))

(declare-fun b!1133601 () Bool)

(declare-fun lt!503548 () Unit!37045)

(assert (=> b!1133601 (= e!645254 lt!503548)))

(assert (=> b!1133601 (= lt!503548 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503285) (select (arr!35562 lt!503167) from!1455)))))

(assert (=> b!1133601 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503285) (select (arr!35562 lt!503167) from!1455)))))

(declare-fun b!1133602 () Bool)

(declare-fun Unit!37074 () Unit!37045)

(assert (=> b!1133602 (= e!645254 Unit!37074)))

(declare-fun b!1133603 () Bool)

(assert (=> b!1133603 (= e!645253 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503285) (select (arr!35562 lt!503167) from!1455))))))

(assert (= (and d!131983 c!110789) b!1133601))

(assert (= (and d!131983 (not c!110789)) b!1133602))

(assert (= (and d!131983 (not res!756750)) b!1133603))

(assert (=> d!131983 m!1046369))

(declare-fun m!1047145 () Bool)

(assert (=> d!131983 m!1047145))

(assert (=> b!1133601 m!1046369))

(declare-fun m!1047147 () Bool)

(assert (=> b!1133601 m!1047147))

(assert (=> b!1133601 m!1046369))

(assert (=> b!1133601 m!1046579))

(assert (=> b!1133601 m!1046579))

(declare-fun m!1047149 () Bool)

(assert (=> b!1133601 m!1047149))

(assert (=> b!1133603 m!1046369))

(assert (=> b!1133603 m!1046579))

(assert (=> b!1133603 m!1046579))

(assert (=> b!1133603 m!1047149))

(assert (=> b!1133174 d!131983))

(declare-fun d!131985 () Bool)

(assert (=> d!131985 (= (validKeyInArray!0 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1133247 d!131985))

(assert (=> b!1133234 d!131899))

(assert (=> b!1133233 d!131979))

(assert (=> b!1133233 d!131981))

(declare-fun d!131987 () Bool)

(assert (=> d!131987 (= (isEmpty!977 lt!503285) (isEmpty!978 (toList!8015 lt!503285)))))

(declare-fun bs!32996 () Bool)

(assert (= bs!32996 d!131987))

(declare-fun m!1047151 () Bool)

(assert (=> bs!32996 m!1047151))

(assert (=> b!1133176 d!131987))

(assert (=> b!1133245 d!131985))

(declare-fun d!131989 () Bool)

(declare-fun e!645255 () Bool)

(assert (=> d!131989 e!645255))

(declare-fun res!756751 () Bool)

(assert (=> d!131989 (=> res!756751 e!645255)))

(declare-fun lt!503549 () Bool)

(assert (=> d!131989 (= res!756751 (not lt!503549))))

(declare-fun lt!503550 () Bool)

(assert (=> d!131989 (= lt!503549 lt!503550)))

(declare-fun lt!503551 () Unit!37045)

(declare-fun e!645256 () Unit!37045)

(assert (=> d!131989 (= lt!503551 e!645256)))

(declare-fun c!110790 () Bool)

(assert (=> d!131989 (= c!110790 lt!503550)))

(assert (=> d!131989 (= lt!503550 (containsKey!587 (toList!8015 lt!503292) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!131989 (= (contains!6548 lt!503292 #b1000000000000000000000000000000000000000000000000000000000000000) lt!503549)))

(declare-fun b!1133604 () Bool)

(declare-fun lt!503552 () Unit!37045)

(assert (=> b!1133604 (= e!645256 lt!503552)))

(assert (=> b!1133604 (= lt!503552 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503292) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1133604 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503292) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1133605 () Bool)

(declare-fun Unit!37075 () Unit!37045)

(assert (=> b!1133605 (= e!645256 Unit!37075)))

(declare-fun b!1133606 () Bool)

(assert (=> b!1133606 (= e!645255 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!131989 c!110790) b!1133604))

(assert (= (and d!131989 (not c!110790)) b!1133605))

(assert (= (and d!131989 (not res!756751)) b!1133606))

(declare-fun m!1047153 () Bool)

(assert (=> d!131989 m!1047153))

(declare-fun m!1047155 () Bool)

(assert (=> b!1133604 m!1047155))

(declare-fun m!1047157 () Bool)

(assert (=> b!1133604 m!1047157))

(assert (=> b!1133604 m!1047157))

(declare-fun m!1047159 () Bool)

(assert (=> b!1133604 m!1047159))

(assert (=> b!1133606 m!1047157))

(assert (=> b!1133606 m!1047157))

(assert (=> b!1133606 m!1047159))

(assert (=> b!1133185 d!131989))

(declare-fun call!48860 () ListLongMap!15999)

(declare-fun bm!48857 () Bool)

(assert (=> bm!48857 (= call!48860 (getCurrentListMapNoExtraKeys!4532 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)) (array!73834 (store (arr!35563 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36100 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!48859 () ListLongMap!15999)

(declare-fun bm!48856 () Bool)

(assert (=> bm!48856 (= call!48859 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!131991 () Bool)

(declare-fun e!645259 () Bool)

(assert (=> d!131991 e!645259))

(declare-fun c!110793 () Bool)

(assert (=> d!131991 (= c!110793 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (=> d!131991 true))

(declare-fun _$12!462 () Unit!37045)

(assert (=> d!131991 (= (choose!1781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$12!462)))

(declare-fun b!1133611 () Bool)

(assert (=> b!1133611 (= e!645259 (= call!48860 (-!1172 call!48859 k0!934)))))

(declare-fun b!1133612 () Bool)

(assert (=> b!1133612 (= e!645259 (= call!48860 call!48859))))

(assert (= (and d!131991 c!110793) b!1133611))

(assert (= (and d!131991 (not c!110793)) b!1133612))

(assert (= (or b!1133611 b!1133612) bm!48856))

(assert (= (or b!1133611 b!1133612) bm!48857))

(declare-fun b_lambda!18975 () Bool)

(assert (=> (not b_lambda!18975) (not bm!48857)))

(assert (=> bm!48857 t!35716))

(declare-fun b_and!38709 () Bool)

(assert (= b_and!38707 (and (=> t!35716 result!18047) b_and!38709)))

(assert (=> bm!48857 m!1046205))

(assert (=> bm!48857 m!1046171))

(assert (=> bm!48857 m!1046173))

(assert (=> bm!48857 m!1046549))

(assert (=> bm!48856 m!1046185))

(declare-fun m!1047161 () Bool)

(assert (=> b!1133611 m!1047161))

(assert (=> d!131797 d!131991))

(declare-fun d!131993 () Bool)

(declare-fun e!645260 () Bool)

(assert (=> d!131993 e!645260))

(declare-fun res!756752 () Bool)

(assert (=> d!131993 (=> (not res!756752) (not e!645260))))

(declare-fun lt!503556 () ListLongMap!15999)

(assert (=> d!131993 (= res!756752 (contains!6548 lt!503556 (_1!9022 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!503553 () List!24798)

(assert (=> d!131993 (= lt!503556 (ListLongMap!16000 lt!503553))))

(declare-fun lt!503554 () Unit!37045)

(declare-fun lt!503555 () Unit!37045)

(assert (=> d!131993 (= lt!503554 lt!503555)))

(assert (=> d!131993 (= (getValueByKey!624 lt!503553 (_1!9022 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!674 (_2!9022 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131993 (= lt!503555 (lemmaContainsTupThenGetReturnValue!306 lt!503553 (_1!9022 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9022 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131993 (= lt!503553 (insertStrictlySorted!399 (toList!8015 call!48822) (_1!9022 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9022 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!131993 (= (+!3479 call!48822 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!503556)))

(declare-fun b!1133613 () Bool)

(declare-fun res!756753 () Bool)

(assert (=> b!1133613 (=> (not res!756753) (not e!645260))))

(assert (=> b!1133613 (= res!756753 (= (getValueByKey!624 (toList!8015 lt!503556) (_1!9022 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!674 (_2!9022 (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1133614 () Bool)

(assert (=> b!1133614 (= e!645260 (contains!6551 (toList!8015 lt!503556) (tuple2!18023 (select (arr!35562 _keys!1208) from!1455) (get!18102 (select (arr!35563 _values!996) from!1455) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!131993 res!756752) b!1133613))

(assert (= (and b!1133613 res!756753) b!1133614))

(declare-fun m!1047163 () Bool)

(assert (=> d!131993 m!1047163))

(declare-fun m!1047165 () Bool)

(assert (=> d!131993 m!1047165))

(declare-fun m!1047167 () Bool)

(assert (=> d!131993 m!1047167))

(declare-fun m!1047169 () Bool)

(assert (=> d!131993 m!1047169))

(declare-fun m!1047171 () Bool)

(assert (=> b!1133613 m!1047171))

(declare-fun m!1047173 () Bool)

(assert (=> b!1133614 m!1047173))

(assert (=> b!1133182 d!131993))

(declare-fun d!131995 () Bool)

(declare-fun e!645261 () Bool)

(assert (=> d!131995 e!645261))

(declare-fun res!756754 () Bool)

(assert (=> d!131995 (=> (not res!756754) (not e!645261))))

(declare-fun lt!503560 () ListLongMap!15999)

(assert (=> d!131995 (= res!756754 (contains!6548 lt!503560 (_1!9022 (tuple2!18023 lt!503294 lt!503293))))))

(declare-fun lt!503557 () List!24798)

(assert (=> d!131995 (= lt!503560 (ListLongMap!16000 lt!503557))))

(declare-fun lt!503558 () Unit!37045)

(declare-fun lt!503559 () Unit!37045)

(assert (=> d!131995 (= lt!503558 lt!503559)))

(assert (=> d!131995 (= (getValueByKey!624 lt!503557 (_1!9022 (tuple2!18023 lt!503294 lt!503293))) (Some!674 (_2!9022 (tuple2!18023 lt!503294 lt!503293))))))

(assert (=> d!131995 (= lt!503559 (lemmaContainsTupThenGetReturnValue!306 lt!503557 (_1!9022 (tuple2!18023 lt!503294 lt!503293)) (_2!9022 (tuple2!18023 lt!503294 lt!503293))))))

(assert (=> d!131995 (= lt!503557 (insertStrictlySorted!399 (toList!8015 lt!503291) (_1!9022 (tuple2!18023 lt!503294 lt!503293)) (_2!9022 (tuple2!18023 lt!503294 lt!503293))))))

(assert (=> d!131995 (= (+!3479 lt!503291 (tuple2!18023 lt!503294 lt!503293)) lt!503560)))

(declare-fun b!1133615 () Bool)

(declare-fun res!756755 () Bool)

(assert (=> b!1133615 (=> (not res!756755) (not e!645261))))

(assert (=> b!1133615 (= res!756755 (= (getValueByKey!624 (toList!8015 lt!503560) (_1!9022 (tuple2!18023 lt!503294 lt!503293))) (Some!674 (_2!9022 (tuple2!18023 lt!503294 lt!503293)))))))

(declare-fun b!1133616 () Bool)

(assert (=> b!1133616 (= e!645261 (contains!6551 (toList!8015 lt!503560) (tuple2!18023 lt!503294 lt!503293)))))

(assert (= (and d!131995 res!756754) b!1133615))

(assert (= (and b!1133615 res!756755) b!1133616))

(declare-fun m!1047175 () Bool)

(assert (=> d!131995 m!1047175))

(declare-fun m!1047177 () Bool)

(assert (=> d!131995 m!1047177))

(declare-fun m!1047179 () Bool)

(assert (=> d!131995 m!1047179))

(declare-fun m!1047181 () Bool)

(assert (=> d!131995 m!1047181))

(declare-fun m!1047183 () Bool)

(assert (=> b!1133615 m!1047183))

(declare-fun m!1047185 () Bool)

(assert (=> b!1133616 m!1047185))

(assert (=> b!1133182 d!131995))

(assert (=> b!1133182 d!131973))

(declare-fun d!131997 () Bool)

(assert (=> d!131997 (not (contains!6548 (+!3479 lt!503291 (tuple2!18023 lt!503294 lt!503293)) lt!503288))))

(declare-fun lt!503561 () Unit!37045)

(assert (=> d!131997 (= lt!503561 (choose!1783 lt!503291 lt!503294 lt!503293 lt!503288))))

(declare-fun e!645262 () Bool)

(assert (=> d!131997 e!645262))

(declare-fun res!756756 () Bool)

(assert (=> d!131997 (=> (not res!756756) (not e!645262))))

(assert (=> d!131997 (= res!756756 (not (contains!6548 lt!503291 lt!503288)))))

(assert (=> d!131997 (= (addStillNotContains!285 lt!503291 lt!503294 lt!503293 lt!503288) lt!503561)))

(declare-fun b!1133617 () Bool)

(assert (=> b!1133617 (= e!645262 (not (= lt!503294 lt!503288)))))

(assert (= (and d!131997 res!756756) b!1133617))

(assert (=> d!131997 m!1046407))

(assert (=> d!131997 m!1046407))

(assert (=> d!131997 m!1046411))

(declare-fun m!1047187 () Bool)

(assert (=> d!131997 m!1047187))

(declare-fun m!1047189 () Bool)

(assert (=> d!131997 m!1047189))

(assert (=> b!1133182 d!131997))

(declare-fun d!131999 () Bool)

(declare-fun e!645263 () Bool)

(assert (=> d!131999 e!645263))

(declare-fun res!756757 () Bool)

(assert (=> d!131999 (=> res!756757 e!645263)))

(declare-fun lt!503562 () Bool)

(assert (=> d!131999 (= res!756757 (not lt!503562))))

(declare-fun lt!503563 () Bool)

(assert (=> d!131999 (= lt!503562 lt!503563)))

(declare-fun lt!503564 () Unit!37045)

(declare-fun e!645264 () Unit!37045)

(assert (=> d!131999 (= lt!503564 e!645264)))

(declare-fun c!110794 () Bool)

(assert (=> d!131999 (= c!110794 lt!503563)))

(assert (=> d!131999 (= lt!503563 (containsKey!587 (toList!8015 (+!3479 lt!503291 (tuple2!18023 lt!503294 lt!503293))) lt!503288))))

(assert (=> d!131999 (= (contains!6548 (+!3479 lt!503291 (tuple2!18023 lt!503294 lt!503293)) lt!503288) lt!503562)))

(declare-fun b!1133618 () Bool)

(declare-fun lt!503565 () Unit!37045)

(assert (=> b!1133618 (= e!645264 lt!503565)))

(assert (=> b!1133618 (= lt!503565 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 (+!3479 lt!503291 (tuple2!18023 lt!503294 lt!503293))) lt!503288))))

(assert (=> b!1133618 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503291 (tuple2!18023 lt!503294 lt!503293))) lt!503288))))

(declare-fun b!1133619 () Bool)

(declare-fun Unit!37076 () Unit!37045)

(assert (=> b!1133619 (= e!645264 Unit!37076)))

(declare-fun b!1133620 () Bool)

(assert (=> b!1133620 (= e!645263 (isDefined!453 (getValueByKey!624 (toList!8015 (+!3479 lt!503291 (tuple2!18023 lt!503294 lt!503293))) lt!503288)))))

(assert (= (and d!131999 c!110794) b!1133618))

(assert (= (and d!131999 (not c!110794)) b!1133619))

(assert (= (and d!131999 (not res!756757)) b!1133620))

(declare-fun m!1047191 () Bool)

(assert (=> d!131999 m!1047191))

(declare-fun m!1047193 () Bool)

(assert (=> b!1133618 m!1047193))

(declare-fun m!1047195 () Bool)

(assert (=> b!1133618 m!1047195))

(assert (=> b!1133618 m!1047195))

(declare-fun m!1047197 () Bool)

(assert (=> b!1133618 m!1047197))

(assert (=> b!1133620 m!1047195))

(assert (=> b!1133620 m!1047195))

(assert (=> b!1133620 m!1047197))

(assert (=> b!1133182 d!131999))

(declare-fun d!132001 () Bool)

(assert (=> d!132001 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503153) k0!934))))

(declare-fun lt!503566 () Unit!37045)

(assert (=> d!132001 (= lt!503566 (choose!1784 (toList!8015 lt!503153) k0!934))))

(declare-fun e!645265 () Bool)

(assert (=> d!132001 e!645265))

(declare-fun res!756758 () Bool)

(assert (=> d!132001 (=> (not res!756758) (not e!645265))))

(assert (=> d!132001 (= res!756758 (isStrictlySorted!715 (toList!8015 lt!503153)))))

(assert (=> d!132001 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503153) k0!934) lt!503566)))

(declare-fun b!1133621 () Bool)

(assert (=> b!1133621 (= e!645265 (containsKey!587 (toList!8015 lt!503153) k0!934))))

(assert (= (and d!132001 res!756758) b!1133621))

(assert (=> d!132001 m!1046517))

(assert (=> d!132001 m!1046517))

(assert (=> d!132001 m!1046519))

(declare-fun m!1047199 () Bool)

(assert (=> d!132001 m!1047199))

(assert (=> d!132001 m!1046617))

(assert (=> b!1133621 m!1046513))

(assert (=> b!1133238 d!132001))

(declare-fun d!132003 () Bool)

(assert (=> d!132003 (= (isDefined!453 (getValueByKey!624 (toList!8015 lt!503153) k0!934)) (not (isEmpty!979 (getValueByKey!624 (toList!8015 lt!503153) k0!934))))))

(declare-fun bs!32997 () Bool)

(assert (= bs!32997 d!132003))

(assert (=> bs!32997 m!1046517))

(declare-fun m!1047201 () Bool)

(assert (=> bs!32997 m!1047201))

(assert (=> b!1133238 d!132003))

(declare-fun b!1133625 () Bool)

(declare-fun e!645267 () Option!675)

(assert (=> b!1133625 (= e!645267 None!673)))

(declare-fun b!1133623 () Bool)

(declare-fun e!645266 () Option!675)

(assert (=> b!1133623 (= e!645266 e!645267)))

(declare-fun c!110796 () Bool)

(assert (=> b!1133623 (= c!110796 (and ((_ is Cons!24794) (toList!8015 lt!503153)) (not (= (_1!9022 (h!26012 (toList!8015 lt!503153))) k0!934))))))

(declare-fun d!132005 () Bool)

(declare-fun c!110795 () Bool)

(assert (=> d!132005 (= c!110795 (and ((_ is Cons!24794) (toList!8015 lt!503153)) (= (_1!9022 (h!26012 (toList!8015 lt!503153))) k0!934)))))

(assert (=> d!132005 (= (getValueByKey!624 (toList!8015 lt!503153) k0!934) e!645266)))

(declare-fun b!1133624 () Bool)

(assert (=> b!1133624 (= e!645267 (getValueByKey!624 (t!35717 (toList!8015 lt!503153)) k0!934))))

(declare-fun b!1133622 () Bool)

(assert (=> b!1133622 (= e!645266 (Some!674 (_2!9022 (h!26012 (toList!8015 lt!503153)))))))

(assert (= (and d!132005 c!110795) b!1133622))

(assert (= (and d!132005 (not c!110795)) b!1133623))

(assert (= (and b!1133623 c!110796) b!1133624))

(assert (= (and b!1133623 (not c!110796)) b!1133625))

(declare-fun m!1047203 () Bool)

(assert (=> b!1133624 m!1047203))

(assert (=> b!1133238 d!132005))

(declare-fun b!1133629 () Bool)

(declare-fun e!645269 () Option!675)

(assert (=> b!1133629 (= e!645269 None!673)))

(declare-fun b!1133627 () Bool)

(declare-fun e!645268 () Option!675)

(assert (=> b!1133627 (= e!645268 e!645269)))

(declare-fun c!110798 () Bool)

(assert (=> b!1133627 (= c!110798 (and ((_ is Cons!24794) (toList!8015 lt!503332)) (not (= (_1!9022 (h!26012 (toList!8015 lt!503332))) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun d!132007 () Bool)

(declare-fun c!110797 () Bool)

(assert (=> d!132007 (= c!110797 (and ((_ is Cons!24794) (toList!8015 lt!503332)) (= (_1!9022 (h!26012 (toList!8015 lt!503332))) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132007 (= (getValueByKey!624 (toList!8015 lt!503332) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!645268)))

(declare-fun b!1133628 () Bool)

(assert (=> b!1133628 (= e!645269 (getValueByKey!624 (t!35717 (toList!8015 lt!503332)) (_1!9022 (tuple2!18023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133626 () Bool)

(assert (=> b!1133626 (= e!645268 (Some!674 (_2!9022 (h!26012 (toList!8015 lt!503332)))))))

(assert (= (and d!132007 c!110797) b!1133626))

(assert (= (and d!132007 (not c!110797)) b!1133627))

(assert (= (and b!1133627 c!110798) b!1133628))

(assert (= (and b!1133627 (not c!110798)) b!1133629))

(declare-fun m!1047205 () Bool)

(assert (=> b!1133628 m!1047205))

(assert (=> b!1133217 d!132007))

(declare-fun b!1133630 () Bool)

(declare-fun e!645273 () Bool)

(declare-fun e!645275 () Bool)

(assert (=> b!1133630 (= e!645273 e!645275)))

(declare-fun c!110800 () Bool)

(declare-fun e!645272 () Bool)

(assert (=> b!1133630 (= c!110800 e!645272)))

(declare-fun res!756759 () Bool)

(assert (=> b!1133630 (=> (not res!756759) (not e!645272))))

(assert (=> b!1133630 (= res!756759 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)))))))

(declare-fun b!1133631 () Bool)

(declare-fun e!645270 () ListLongMap!15999)

(declare-fun call!48861 () ListLongMap!15999)

(assert (=> b!1133631 (= e!645270 call!48861)))

(declare-fun d!132009 () Bool)

(assert (=> d!132009 e!645273))

(declare-fun res!756761 () Bool)

(assert (=> d!132009 (=> (not res!756761) (not e!645273))))

(declare-fun lt!503571 () ListLongMap!15999)

(assert (=> d!132009 (= res!756761 (not (contains!6548 lt!503571 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!645271 () ListLongMap!15999)

(assert (=> d!132009 (= lt!503571 e!645271)))

(declare-fun c!110801 () Bool)

(assert (=> d!132009 (= c!110801 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)))))))

(assert (=> d!132009 (validMask!0 mask!1564)))

(assert (=> d!132009 (= (getCurrentListMapNoExtraKeys!4532 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)) (array!73834 (store (arr!35563 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36100 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503571)))

(declare-fun b!1133632 () Bool)

(declare-fun e!645274 () Bool)

(assert (=> b!1133632 (= e!645275 e!645274)))

(declare-fun c!110799 () Bool)

(assert (=> b!1133632 (= c!110799 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)))))))

(declare-fun b!1133633 () Bool)

(assert (=> b!1133633 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)))))))

(assert (=> b!1133633 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36100 (array!73834 (store (arr!35563 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36100 _values!996)))))))

(declare-fun e!645276 () Bool)

(assert (=> b!1133633 (= e!645276 (= (apply!964 lt!503571 (select (arr!35562 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18102 (select (arr!35563 (array!73834 (store (arr!35563 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36100 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1133634 () Bool)

(assert (=> b!1133634 (= e!645271 e!645270)))

(declare-fun c!110802 () Bool)

(assert (=> b!1133634 (= c!110802 (validKeyInArray!0 (select (arr!35562 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1133635 () Bool)

(declare-fun lt!503568 () Unit!37045)

(declare-fun lt!503569 () Unit!37045)

(assert (=> b!1133635 (= lt!503568 lt!503569)))

(declare-fun lt!503567 () (_ BitVec 64))

(declare-fun lt!503570 () ListLongMap!15999)

(declare-fun lt!503572 () V!43081)

(declare-fun lt!503573 () (_ BitVec 64))

(assert (=> b!1133635 (not (contains!6548 (+!3479 lt!503570 (tuple2!18023 lt!503573 lt!503572)) lt!503567))))

(assert (=> b!1133635 (= lt!503569 (addStillNotContains!285 lt!503570 lt!503573 lt!503572 lt!503567))))

(assert (=> b!1133635 (= lt!503567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133635 (= lt!503572 (get!18102 (select (arr!35563 (array!73834 (store (arr!35563 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36100 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133635 (= lt!503573 (select (arr!35562 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1133635 (= lt!503570 call!48861)))

(assert (=> b!1133635 (= e!645270 (+!3479 call!48861 (tuple2!18023 (select (arr!35562 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18102 (select (arr!35563 (array!73834 (store (arr!35563 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36100 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133636 () Bool)

(assert (=> b!1133636 (= e!645272 (validKeyInArray!0 (select (arr!35562 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133636 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!48858 () Bool)

(assert (=> bm!48858 (= call!48861 (getCurrentListMapNoExtraKeys!4532 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)) (array!73834 (store (arr!35563 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36100 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133637 () Bool)

(assert (=> b!1133637 (= e!645271 (ListLongMap!16000 Nil!24795))))

(declare-fun b!1133638 () Bool)

(declare-fun res!756762 () Bool)

(assert (=> b!1133638 (=> (not res!756762) (not e!645273))))

(assert (=> b!1133638 (= res!756762 (not (contains!6548 lt!503571 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1133639 () Bool)

(assert (=> b!1133639 (= e!645275 e!645276)))

(assert (=> b!1133639 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36099 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)))))))

(declare-fun res!756760 () Bool)

(assert (=> b!1133639 (= res!756760 (contains!6548 lt!503571 (select (arr!35562 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133639 (=> (not res!756760) (not e!645276))))

(declare-fun b!1133640 () Bool)

(assert (=> b!1133640 (= e!645274 (= lt!503571 (getCurrentListMapNoExtraKeys!4532 (array!73832 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36099 _keys!1208)) (array!73834 (store (arr!35563 _values!996) i!673 (ValueCellFull!13523 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36100 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133641 () Bool)

(assert (=> b!1133641 (= e!645274 (isEmpty!977 lt!503571))))

(assert (= (and d!132009 c!110801) b!1133637))

(assert (= (and d!132009 (not c!110801)) b!1133634))

(assert (= (and b!1133634 c!110802) b!1133635))

(assert (= (and b!1133634 (not c!110802)) b!1133631))

(assert (= (or b!1133635 b!1133631) bm!48858))

(assert (= (and d!132009 res!756761) b!1133638))

(assert (= (and b!1133638 res!756762) b!1133630))

(assert (= (and b!1133630 res!756759) b!1133636))

(assert (= (and b!1133630 c!110800) b!1133639))

(assert (= (and b!1133630 (not c!110800)) b!1133632))

(assert (= (and b!1133639 res!756760) b!1133633))

(assert (= (and b!1133632 c!110799) b!1133640))

(assert (= (and b!1133632 (not c!110799)) b!1133641))

(declare-fun b_lambda!18977 () Bool)

(assert (=> (not b_lambda!18977) (not b!1133633)))

(assert (=> b!1133633 t!35716))

(declare-fun b_and!38711 () Bool)

(assert (= b_and!38709 (and (=> t!35716 result!18047) b_and!38711)))

(declare-fun b_lambda!18979 () Bool)

(assert (=> (not b_lambda!18979) (not b!1133635)))

(assert (=> b!1133635 t!35716))

(declare-fun b_and!38713 () Bool)

(assert (= b_and!38711 (and (=> t!35716 result!18047) b_and!38713)))

(declare-fun m!1047207 () Bool)

(assert (=> b!1133641 m!1047207))

(declare-fun m!1047209 () Bool)

(assert (=> b!1133636 m!1047209))

(assert (=> b!1133636 m!1047209))

(declare-fun m!1047211 () Bool)

(assert (=> b!1133636 m!1047211))

(declare-fun m!1047213 () Bool)

(assert (=> b!1133640 m!1047213))

(declare-fun m!1047215 () Bool)

(assert (=> b!1133635 m!1047215))

(assert (=> b!1133635 m!1047215))

(assert (=> b!1133635 m!1046171))

(declare-fun m!1047217 () Bool)

(assert (=> b!1133635 m!1047217))

(declare-fun m!1047219 () Bool)

(assert (=> b!1133635 m!1047219))

(declare-fun m!1047221 () Bool)

(assert (=> b!1133635 m!1047221))

(assert (=> b!1133635 m!1046171))

(declare-fun m!1047223 () Bool)

(assert (=> b!1133635 m!1047223))

(assert (=> b!1133635 m!1047209))

(assert (=> b!1133635 m!1047221))

(declare-fun m!1047225 () Bool)

(assert (=> b!1133635 m!1047225))

(assert (=> b!1133634 m!1047209))

(assert (=> b!1133634 m!1047209))

(assert (=> b!1133634 m!1047211))

(assert (=> b!1133633 m!1047215))

(assert (=> b!1133633 m!1047215))

(assert (=> b!1133633 m!1046171))

(assert (=> b!1133633 m!1047217))

(assert (=> b!1133633 m!1047209))

(assert (=> b!1133633 m!1046171))

(assert (=> b!1133633 m!1047209))

(declare-fun m!1047227 () Bool)

(assert (=> b!1133633 m!1047227))

(declare-fun m!1047229 () Bool)

(assert (=> d!132009 m!1047229))

(assert (=> d!132009 m!1046195))

(assert (=> bm!48858 m!1047213))

(declare-fun m!1047231 () Bool)

(assert (=> b!1133638 m!1047231))

(assert (=> b!1133639 m!1047209))

(assert (=> b!1133639 m!1047209))

(declare-fun m!1047233 () Bool)

(assert (=> b!1133639 m!1047233))

(assert (=> bm!48827 d!132009))

(declare-fun b!1133642 () Bool)

(declare-fun e!645280 () Bool)

(assert (=> b!1133642 (= e!645280 (contains!6552 (ite c!110694 (Cons!24795 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) Nil!24796) Nil!24796) (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!132011 () Bool)

(declare-fun res!756764 () Bool)

(declare-fun e!645278 () Bool)

(assert (=> d!132011 (=> res!756764 e!645278)))

(assert (=> d!132011 (= res!756764 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36099 _keys!1208)))))

(assert (=> d!132011 (= (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110694 (Cons!24795 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) Nil!24796) Nil!24796)) e!645278)))

(declare-fun b!1133643 () Bool)

(declare-fun e!645279 () Bool)

(declare-fun call!48862 () Bool)

(assert (=> b!1133643 (= e!645279 call!48862)))

(declare-fun b!1133644 () Bool)

(declare-fun e!645277 () Bool)

(assert (=> b!1133644 (= e!645278 e!645277)))

(declare-fun res!756763 () Bool)

(assert (=> b!1133644 (=> (not res!756763) (not e!645277))))

(assert (=> b!1133644 (= res!756763 (not e!645280))))

(declare-fun res!756765 () Bool)

(assert (=> b!1133644 (=> (not res!756765) (not e!645280))))

(assert (=> b!1133644 (= res!756765 (validKeyInArray!0 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1133645 () Bool)

(assert (=> b!1133645 (= e!645279 call!48862)))

(declare-fun b!1133646 () Bool)

(assert (=> b!1133646 (= e!645277 e!645279)))

(declare-fun c!110803 () Bool)

(assert (=> b!1133646 (= c!110803 (validKeyInArray!0 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!48859 () Bool)

(assert (=> bm!48859 (= call!48862 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!110803 (Cons!24795 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!110694 (Cons!24795 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) Nil!24796) Nil!24796)) (ite c!110694 (Cons!24795 (select (arr!35562 _keys!1208) #b00000000000000000000000000000000) Nil!24796) Nil!24796))))))

(assert (= (and d!132011 (not res!756764)) b!1133644))

(assert (= (and b!1133644 res!756765) b!1133642))

(assert (= (and b!1133644 res!756763) b!1133646))

(assert (= (and b!1133646 c!110803) b!1133643))

(assert (= (and b!1133646 (not c!110803)) b!1133645))

(assert (= (or b!1133643 b!1133645) bm!48859))

(assert (=> b!1133642 m!1046911))

(assert (=> b!1133642 m!1046911))

(declare-fun m!1047235 () Bool)

(assert (=> b!1133642 m!1047235))

(assert (=> b!1133644 m!1046911))

(assert (=> b!1133644 m!1046911))

(assert (=> b!1133644 m!1047127))

(assert (=> b!1133646 m!1046911))

(assert (=> b!1133646 m!1046911))

(assert (=> b!1133646 m!1047127))

(assert (=> bm!48859 m!1046911))

(declare-fun m!1047237 () Bool)

(assert (=> bm!48859 m!1047237))

(assert (=> bm!48832 d!132011))

(declare-fun d!132013 () Bool)

(declare-fun e!645281 () Bool)

(assert (=> d!132013 e!645281))

(declare-fun res!756766 () Bool)

(assert (=> d!132013 (=> res!756766 e!645281)))

(declare-fun lt!503574 () Bool)

(assert (=> d!132013 (= res!756766 (not lt!503574))))

(declare-fun lt!503575 () Bool)

(assert (=> d!132013 (= lt!503574 lt!503575)))

(declare-fun lt!503576 () Unit!37045)

(declare-fun e!645282 () Unit!37045)

(assert (=> d!132013 (= lt!503576 e!645282)))

(declare-fun c!110804 () Bool)

(assert (=> d!132013 (= c!110804 lt!503575)))

(assert (=> d!132013 (= lt!503575 (containsKey!587 (toList!8015 lt!503354) (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!132013 (= (contains!6548 lt!503354 (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) lt!503574)))

(declare-fun b!1133647 () Bool)

(declare-fun lt!503577 () Unit!37045)

(assert (=> b!1133647 (= e!645282 lt!503577)))

(assert (=> b!1133647 (= lt!503577 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8015 lt!503354) (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133647 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503354) (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1133648 () Bool)

(declare-fun Unit!37077 () Unit!37045)

(assert (=> b!1133648 (= e!645282 Unit!37077)))

(declare-fun b!1133649 () Bool)

(assert (=> b!1133649 (= e!645281 (isDefined!453 (getValueByKey!624 (toList!8015 lt!503354) (select (arr!35562 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!132013 c!110804) b!1133647))

(assert (= (and d!132013 (not c!110804)) b!1133648))

(assert (= (and d!132013 (not res!756766)) b!1133649))

(assert (=> d!132013 m!1046523))

(declare-fun m!1047239 () Bool)

(assert (=> d!132013 m!1047239))

(assert (=> b!1133647 m!1046523))

(declare-fun m!1047241 () Bool)

(assert (=> b!1133647 m!1047241))

(assert (=> b!1133647 m!1046523))

(assert (=> b!1133647 m!1046779))

(assert (=> b!1133647 m!1046779))

(declare-fun m!1047243 () Bool)

(assert (=> b!1133647 m!1047243))

(assert (=> b!1133649 m!1046523))

(assert (=> b!1133649 m!1046779))

(assert (=> b!1133649 m!1046779))

(assert (=> b!1133649 m!1047243))

(assert (=> b!1133250 d!132013))

(assert (=> bm!48819 d!131833))

(assert (=> b!1133240 d!132003))

(assert (=> b!1133240 d!132005))

(declare-fun mapIsEmpty!44525 () Bool)

(declare-fun mapRes!44525 () Bool)

(assert (=> mapIsEmpty!44525 mapRes!44525))

(declare-fun b!1133650 () Bool)

(declare-fun e!645284 () Bool)

(assert (=> b!1133650 (= e!645284 tp_is_empty!28465)))

(declare-fun b!1133651 () Bool)

(declare-fun e!645283 () Bool)

(assert (=> b!1133651 (= e!645283 tp_is_empty!28465)))

(declare-fun condMapEmpty!44525 () Bool)

(declare-fun mapDefault!44525 () ValueCell!13523)

(assert (=> mapNonEmpty!44524 (= condMapEmpty!44525 (= mapRest!44524 ((as const (Array (_ BitVec 32) ValueCell!13523)) mapDefault!44525)))))

(assert (=> mapNonEmpty!44524 (= tp!84524 (and e!645283 mapRes!44525))))

(declare-fun mapNonEmpty!44525 () Bool)

(declare-fun tp!84525 () Bool)

(assert (=> mapNonEmpty!44525 (= mapRes!44525 (and tp!84525 e!645284))))

(declare-fun mapRest!44525 () (Array (_ BitVec 32) ValueCell!13523))

(declare-fun mapKey!44525 () (_ BitVec 32))

(declare-fun mapValue!44525 () ValueCell!13523)

(assert (=> mapNonEmpty!44525 (= mapRest!44524 (store mapRest!44525 mapKey!44525 mapValue!44525))))

(assert (= (and mapNonEmpty!44524 condMapEmpty!44525) mapIsEmpty!44525))

(assert (= (and mapNonEmpty!44524 (not condMapEmpty!44525)) mapNonEmpty!44525))

(assert (= (and mapNonEmpty!44525 ((_ is ValueCellFull!13523) mapValue!44525)) b!1133650))

(assert (= (and mapNonEmpty!44524 ((_ is ValueCellFull!13523) mapDefault!44525)) b!1133651))

(declare-fun m!1047245 () Bool)

(assert (=> mapNonEmpty!44525 m!1047245))

(declare-fun b_lambda!18981 () Bool)

(assert (= b_lambda!18967 (or (and start!98470 b_free!23935) b_lambda!18981)))

(declare-fun b_lambda!18983 () Bool)

(assert (= b_lambda!18979 (or (and start!98470 b_free!23935) b_lambda!18983)))

(declare-fun b_lambda!18985 () Bool)

(assert (= b_lambda!18975 (or (and start!98470 b_free!23935) b_lambda!18985)))

(declare-fun b_lambda!18987 () Bool)

(assert (= b_lambda!18963 (or (and start!98470 b_free!23935) b_lambda!18987)))

(declare-fun b_lambda!18989 () Bool)

(assert (= b_lambda!18965 (or (and start!98470 b_free!23935) b_lambda!18989)))

(declare-fun b_lambda!18991 () Bool)

(assert (= b_lambda!18961 (or (and start!98470 b_free!23935) b_lambda!18991)))

(declare-fun b_lambda!18993 () Bool)

(assert (= b_lambda!18973 (or (and start!98470 b_free!23935) b_lambda!18993)))

(declare-fun b_lambda!18995 () Bool)

(assert (= b_lambda!18971 (or (and start!98470 b_free!23935) b_lambda!18995)))

(declare-fun b_lambda!18997 () Bool)

(assert (= b_lambda!18977 (or (and start!98470 b_free!23935) b_lambda!18997)))

(declare-fun b_lambda!18999 () Bool)

(assert (= b_lambda!18959 (or (and start!98470 b_free!23935) b_lambda!18999)))

(declare-fun b_lambda!19001 () Bool)

(assert (= b_lambda!18969 (or (and start!98470 b_free!23935) b_lambda!19001)))

(check-sat (not d!131957) (not b!1133618) (not b!1133501) (not b!1133530) (not b!1133616) (not b!1133368) (not d!131955) (not b!1133563) (not d!131913) (not b!1133649) (not b_lambda!18953) (not d!131911) (not b_lambda!18995) (not d!131949) (not d!131937) (not b!1133620) (not b!1133359) (not b!1133377) (not b!1133306) (not b!1133531) (not b!1133644) (not d!131887) (not b_lambda!18991) (not b!1133535) (not b!1133323) (not b!1133297) (not b!1133591) (not bm!48844) (not d!131861) (not d!131853) (not b!1133378) (not b!1133521) (not b!1133546) (not b_lambda!18945) (not b!1133614) (not b!1133517) (not b!1133304) (not b!1133409) (not b!1133527) (not b!1133592) (not d!131829) (not b!1133544) (not d!131891) (not b!1133480) (not b_lambda!18997) (not d!131865) (not d!131879) (not b!1133399) (not d!131925) (not b_next!23935) (not b!1133615) (not b!1133445) (not b!1133478) (not d!131815) (not b!1133646) (not d!131921) (not d!131851) (not b!1133621) (not b!1133406) (not b!1133533) (not d!131855) (not bm!48851) (not d!131839) (not d!131823) (not b!1133454) (not b!1133411) (not b!1133386) (not d!131877) (not d!131827) (not b!1133569) (not b!1133571) (not d!131993) (not d!131831) (not d!131889) (not d!131923) (not b!1133373) (not b!1133518) (not b!1133636) (not b!1133573) (not b!1133296) (not d!131953) (not d!131935) (not d!131939) (not b!1133396) (not d!131997) (not b!1133504) (not b!1133379) (not d!131927) (not b!1133606) (not b!1133624) (not b!1133475) (not b!1133547) (not b!1133499) (not b!1133613) (not b!1133593) (not b!1133557) (not b!1133498) (not d!131849) (not b_lambda!18941) (not b!1133635) (not b!1133495) (not d!132009) (not b!1133634) (not bm!48858) (not b!1133604) (not d!131967) (not b!1133511) (not b!1133581) (not d!131989) (not b!1133526) (not b!1133585) (not b!1133408) (not d!131837) (not b!1133580) (not b!1133550) (not b!1133628) (not b!1133596) (not b!1133583) (not b!1133491) (not d!132003) (not d!131977) (not b!1133497) (not d!131847) (not bm!48839) (not d!131867) (not b!1133572) (not b_lambda!18993) (not b_lambda!18999) (not d!131963) (not b!1133537) (not b!1133490) (not b_lambda!18943) (not d!131999) (not b_lambda!18989) (not b!1133317) (not b!1133380) (not bm!48857) (not b!1133568) (not b!1133558) (not b!1133641) (not b!1133525) (not b_lambda!18983) (not b!1133555) (not b!1133358) (not d!131901) (not b_lambda!18921) (not d!131965) (not bm!48859) (not b!1133633) (not d!131943) (not b!1133566) (not d!131931) (not b!1133508) (not d!131959) (not b!1133433) (not b!1133584) (not b!1133471) (not d!131995) (not b!1133452) (not b!1133514) (not d!131905) (not b!1133303) (not b!1133438) (not d!131987) (not d!131841) (not b!1133372) (not b!1133492) (not bm!48843) (not bm!48856) (not b_lambda!18955) (not b!1133477) (not d!131941) (not d!131885) (not b!1133577) (not b!1133506) (not b!1133352) (not b!1133590) (not d!131833) (not b!1133404) (not d!131961) (not d!131983) (not b!1133640) (not bm!48846) (not b!1133390) (not b!1133575) (not d!131859) (not b!1133466) (not d!132013) (not b!1133638) (not b!1133483) (not b!1133366) (not b!1133361) (not b!1133324) (not b!1133413) (not b!1133360) (not d!131945) (not d!131915) (not bm!48847) (not b!1133364) (not b!1133395) (not b!1133647) (not bm!48848) (not b_lambda!18957) (not b!1133588) (not b!1133476) (not b!1133389) (not b!1133473) (not b_lambda!18987) (not b!1133393) (not b!1133496) (not d!132001) (not b!1133349) (not d!131917) (not b!1133611) (not b_lambda!18985) (not d!131893) (not b_lambda!18947) (not b!1133528) (not b!1133365) (not b!1133384) (not b!1133601) (not b!1133549) (not b!1133493) (not b!1133432) (not b!1133397) (not b!1133543) (not bm!48845) (not b!1133486) (not b!1133532) (not b!1133431) (not d!131951) (not b!1133599) (not b!1133642) (not b!1133388) (not b_lambda!18949) (not b_lambda!19001) (not b!1133639) (not b!1133354) (not d!131873) (not d!131821) (not b!1133375) (not bm!48842) (not b!1133467) (not mapNonEmpty!44525) (not b!1133520) (not d!131883) (not b!1133398) tp_is_empty!28465 (not b!1133552) (not b!1133383) (not b!1133512) (not d!131903) (not b_lambda!18951) (not b!1133474) b_and!38713 (not d!131979) (not b_lambda!18981) (not b!1133363) (not b!1133519) (not d!131971) (not b!1133502) (not b!1133516) (not b!1133451) (not d!131909) (not d!131881) (not b!1133578) (not b!1133603) (not b!1133374) (not b!1133381))
(check-sat b_and!38713 (not b_next!23935))
