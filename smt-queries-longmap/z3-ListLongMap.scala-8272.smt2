; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100636 () Bool)

(assert start!100636)

(declare-fun b_free!25903 () Bool)

(declare-fun b_next!25903 () Bool)

(assert (=> start!100636 (= b_free!25903 (not b_next!25903))))

(declare-fun tp!90702 () Bool)

(declare-fun b_and!42711 () Bool)

(assert (=> start!100636 (= tp!90702 b_and!42711)))

(declare-fun b!1203755 () Bool)

(declare-datatypes ((Unit!39765 0))(
  ( (Unit!39766) )
))
(declare-fun e!683557 () Unit!39765)

(declare-fun lt!545639 () Unit!39765)

(assert (=> b!1203755 (= e!683557 lt!545639)))

(declare-fun call!58062 () Unit!39765)

(assert (=> b!1203755 (= lt!545639 call!58062)))

(declare-fun call!58063 () Bool)

(assert (=> b!1203755 call!58063))

(declare-datatypes ((V!45937 0))(
  ( (V!45938 (val!15360 Int)) )
))
(declare-datatypes ((tuple2!19764 0))(
  ( (tuple2!19765 (_1!9893 (_ BitVec 64)) (_2!9893 V!45937)) )
))
(declare-datatypes ((List!26550 0))(
  ( (Nil!26547) (Cons!26546 (h!27755 tuple2!19764) (t!39424 List!26550)) )
))
(declare-datatypes ((ListLongMap!17733 0))(
  ( (ListLongMap!17734 (toList!8882 List!26550)) )
))
(declare-fun lt!545637 () ListLongMap!17733)

(declare-fun bm!58057 () Bool)

(declare-fun call!58060 () ListLongMap!17733)

(declare-fun call!58061 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!117937 () Bool)

(declare-fun contains!6878 (ListLongMap!17733 (_ BitVec 64)) Bool)

(assert (=> bm!58057 (= call!58061 (contains!6878 (ite c!117937 lt!545637 call!58060) k0!934))))

(declare-fun b!1203756 () Bool)

(declare-fun res!800965 () Bool)

(declare-fun e!683562 () Bool)

(assert (=> b!1203756 (=> (not res!800965) (not e!683562))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77904 0))(
  ( (array!77905 (arr!37596 (Array (_ BitVec 32) (_ BitVec 64))) (size!38134 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77904)

(assert (=> b!1203756 (= res!800965 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38134 _keys!1208))))))

(declare-fun b!1203757 () Bool)

(declare-fun e!683563 () Bool)

(assert (=> b!1203757 (= e!683562 e!683563)))

(declare-fun res!800971 () Bool)

(assert (=> b!1203757 (=> (not res!800971) (not e!683563))))

(declare-fun lt!545642 () array!77904)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77904 (_ BitVec 32)) Bool)

(assert (=> b!1203757 (= res!800971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545642 mask!1564))))

(assert (=> b!1203757 (= lt!545642 (array!77905 (store (arr!37596 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38134 _keys!1208)))))

(declare-fun b!1203758 () Bool)

(declare-fun e!683566 () Unit!39765)

(declare-fun e!683556 () Unit!39765)

(assert (=> b!1203758 (= e!683566 e!683556)))

(declare-fun c!117938 () Bool)

(declare-fun lt!545636 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1203758 (= c!117938 (and (not lt!545636) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1203759 () Bool)

(assert (=> b!1203759 call!58063))

(declare-fun lt!545635 () Unit!39765)

(assert (=> b!1203759 (= lt!545635 call!58062)))

(assert (=> b!1203759 (= e!683556 lt!545635)))

(declare-fun b!1203760 () Bool)

(declare-fun Unit!39767 () Unit!39765)

(assert (=> b!1203760 (= e!683557 Unit!39767)))

(declare-fun mapIsEmpty!47757 () Bool)

(declare-fun mapRes!47757 () Bool)

(assert (=> mapIsEmpty!47757 mapRes!47757))

(declare-fun e!683570 () Bool)

(declare-fun b!1203761 () Bool)

(declare-fun call!58067 () ListLongMap!17733)

(declare-fun call!58065 () ListLongMap!17733)

(declare-fun -!1776 (ListLongMap!17733 (_ BitVec 64)) ListLongMap!17733)

(assert (=> b!1203761 (= e!683570 (= call!58067 (-!1776 call!58065 k0!934)))))

(declare-fun bm!58058 () Bool)

(declare-fun call!58064 () Unit!39765)

(assert (=> bm!58058 (= call!58062 call!58064)))

(declare-fun b!1203762 () Bool)

(declare-fun res!800962 () Bool)

(assert (=> b!1203762 (=> (not res!800962) (not e!683562))))

(assert (=> b!1203762 (= res!800962 (= (select (arr!37596 _keys!1208) i!673) k0!934))))

(declare-fun b!1203763 () Bool)

(declare-fun e!683567 () Bool)

(declare-fun tp_is_empty!30607 () Bool)

(assert (=> b!1203763 (= e!683567 tp_is_empty!30607)))

(declare-fun zeroValue!944 () V!45937)

(declare-fun bm!58059 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14594 0))(
  ( (ValueCellFull!14594 (v!18000 V!45937)) (EmptyCell!14594) )
))
(declare-datatypes ((array!77906 0))(
  ( (array!77907 (arr!37597 (Array (_ BitVec 32) ValueCell!14594)) (size!38135 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77906)

(declare-fun minValue!944 () V!45937)

(declare-fun getCurrentListMapNoExtraKeys!5328 (array!77904 array!77906 (_ BitVec 32) (_ BitVec 32) V!45937 V!45937 (_ BitVec 32) Int) ListLongMap!17733)

(assert (=> bm!58059 (= call!58065 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203764 () Bool)

(declare-fun res!800967 () Bool)

(assert (=> b!1203764 (=> (not res!800967) (not e!683562))))

(assert (=> b!1203764 (= res!800967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1203765 () Bool)

(declare-fun e!683569 () Bool)

(declare-fun e!683564 () Bool)

(assert (=> b!1203765 (= e!683569 e!683564)))

(declare-fun res!800963 () Bool)

(assert (=> b!1203765 (=> res!800963 e!683564)))

(assert (=> b!1203765 (= res!800963 (not (= (select (arr!37596 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1203765 e!683570))

(declare-fun c!117936 () Bool)

(assert (=> b!1203765 (= c!117936 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545633 () Unit!39765)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1024 (array!77904 array!77906 (_ BitVec 32) (_ BitVec 32) V!45937 V!45937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39765)

(assert (=> b!1203765 (= lt!545633 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1024 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203766 () Bool)

(declare-fun res!800973 () Bool)

(assert (=> b!1203766 (=> (not res!800973) (not e!683562))))

(declare-datatypes ((List!26551 0))(
  ( (Nil!26548) (Cons!26547 (h!27756 (_ BitVec 64)) (t!39425 List!26551)) )
))
(declare-fun arrayNoDuplicates!0 (array!77904 (_ BitVec 32) List!26551) Bool)

(assert (=> b!1203766 (= res!800973 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26548))))

(declare-fun b!1203767 () Bool)

(declare-fun e!683565 () Bool)

(declare-fun e!683558 () Bool)

(assert (=> b!1203767 (= e!683565 e!683558)))

(declare-fun res!800968 () Bool)

(assert (=> b!1203767 (=> res!800968 e!683558)))

(assert (=> b!1203767 (= res!800968 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208))))))

(declare-fun lt!545632 () Unit!39765)

(assert (=> b!1203767 (= lt!545632 e!683566)))

(assert (=> b!1203767 (= c!117937 (and (not lt!545636) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203767 (= lt!545636 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1203768 () Bool)

(declare-fun res!800970 () Bool)

(assert (=> b!1203768 (=> (not res!800970) (not e!683562))))

(assert (=> b!1203768 (= res!800970 (and (= (size!38135 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38134 _keys!1208) (size!38135 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1203769 () Bool)

(declare-fun res!800964 () Bool)

(assert (=> b!1203769 (=> (not res!800964) (not e!683562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203769 (= res!800964 (validKeyInArray!0 k0!934))))

(declare-fun b!1203770 () Bool)

(declare-fun e!683560 () Bool)

(assert (=> b!1203770 (= e!683560 tp_is_empty!30607)))

(declare-fun res!800972 () Bool)

(assert (=> start!100636 (=> (not res!800972) (not e!683562))))

(assert (=> start!100636 (= res!800972 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38134 _keys!1208))))))

(assert (=> start!100636 e!683562))

(assert (=> start!100636 tp_is_empty!30607))

(declare-fun array_inv!28754 (array!77904) Bool)

(assert (=> start!100636 (array_inv!28754 _keys!1208)))

(assert (=> start!100636 true))

(assert (=> start!100636 tp!90702))

(declare-fun e!683559 () Bool)

(declare-fun array_inv!28755 (array!77906) Bool)

(assert (=> start!100636 (and (array_inv!28755 _values!996) e!683559)))

(declare-fun bm!58060 () Bool)

(declare-fun call!58066 () ListLongMap!17733)

(assert (=> bm!58060 (= call!58060 call!58066)))

(declare-fun b!1203771 () Bool)

(declare-fun getCurrentListMap!4371 (array!77904 array!77906 (_ BitVec 32) (_ BitVec 32) V!45937 V!45937 (_ BitVec 32) Int) ListLongMap!17733)

(assert (=> b!1203771 (= e!683558 (contains!6878 (getCurrentListMap!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1203772 () Bool)

(declare-fun e!683561 () Bool)

(assert (=> b!1203772 (= e!683563 (not e!683561))))

(declare-fun res!800974 () Bool)

(assert (=> b!1203772 (=> res!800974 e!683561)))

(assert (=> b!1203772 (= res!800974 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203772 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545640 () Unit!39765)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77904 (_ BitVec 64) (_ BitVec 32)) Unit!39765)

(assert (=> b!1203772 (= lt!545640 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!58061 () Bool)

(assert (=> bm!58061 (= call!58063 call!58061)))

(declare-fun lt!545641 () array!77906)

(declare-fun bm!58062 () Bool)

(assert (=> bm!58062 (= call!58067 (getCurrentListMapNoExtraKeys!5328 lt!545642 lt!545641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!545631 () ListLongMap!17733)

(declare-fun bm!58063 () Bool)

(declare-fun addStillContains!1000 (ListLongMap!17733 (_ BitVec 64) V!45937 (_ BitVec 64)) Unit!39765)

(assert (=> bm!58063 (= call!58064 (addStillContains!1000 lt!545631 (ite (or c!117937 c!117938) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117937 c!117938) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1203773 () Bool)

(declare-fun res!800966 () Bool)

(assert (=> b!1203773 (=> (not res!800966) (not e!683563))))

(assert (=> b!1203773 (= res!800966 (arrayNoDuplicates!0 lt!545642 #b00000000000000000000000000000000 Nil!26548))))

(declare-fun b!1203774 () Bool)

(assert (=> b!1203774 (= e!683564 e!683565)))

(declare-fun res!800961 () Bool)

(assert (=> b!1203774 (=> res!800961 e!683565)))

(assert (=> b!1203774 (= res!800961 (not (contains!6878 lt!545631 k0!934)))))

(assert (=> b!1203774 (= lt!545631 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203775 () Bool)

(assert (=> b!1203775 (= e!683561 e!683569)))

(declare-fun res!800975 () Bool)

(assert (=> b!1203775 (=> res!800975 e!683569)))

(assert (=> b!1203775 (= res!800975 (not (= from!1455 i!673)))))

(declare-fun lt!545630 () ListLongMap!17733)

(assert (=> b!1203775 (= lt!545630 (getCurrentListMapNoExtraKeys!5328 lt!545642 lt!545641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3201 (Int (_ BitVec 64)) V!45937)

(assert (=> b!1203775 (= lt!545641 (array!77907 (store (arr!37597 _values!996) i!673 (ValueCellFull!14594 (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38135 _values!996)))))

(declare-fun lt!545634 () ListLongMap!17733)

(assert (=> b!1203775 (= lt!545634 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1203776 () Bool)

(assert (=> b!1203776 (= e!683559 (and e!683560 mapRes!47757))))

(declare-fun condMapEmpty!47757 () Bool)

(declare-fun mapDefault!47757 () ValueCell!14594)

(assert (=> b!1203776 (= condMapEmpty!47757 (= (arr!37597 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14594)) mapDefault!47757)))))

(declare-fun bm!58064 () Bool)

(declare-fun +!4016 (ListLongMap!17733 tuple2!19764) ListLongMap!17733)

(assert (=> bm!58064 (= call!58066 (+!4016 lt!545631 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapNonEmpty!47757 () Bool)

(declare-fun tp!90703 () Bool)

(assert (=> mapNonEmpty!47757 (= mapRes!47757 (and tp!90703 e!683567))))

(declare-fun mapRest!47757 () (Array (_ BitVec 32) ValueCell!14594))

(declare-fun mapValue!47757 () ValueCell!14594)

(declare-fun mapKey!47757 () (_ BitVec 32))

(assert (=> mapNonEmpty!47757 (= (arr!37597 _values!996) (store mapRest!47757 mapKey!47757 mapValue!47757))))

(declare-fun b!1203777 () Bool)

(declare-fun lt!545638 () Unit!39765)

(assert (=> b!1203777 (= e!683566 lt!545638)))

(declare-fun lt!545643 () Unit!39765)

(assert (=> b!1203777 (= lt!545643 call!58064)))

(assert (=> b!1203777 (= lt!545637 call!58066)))

(assert (=> b!1203777 call!58061))

(assert (=> b!1203777 (= lt!545638 (addStillContains!1000 lt!545637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1203777 (contains!6878 (+!4016 lt!545637 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1203778 () Bool)

(declare-fun c!117939 () Bool)

(assert (=> b!1203778 (= c!117939 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545636))))

(assert (=> b!1203778 (= e!683556 e!683557)))

(declare-fun b!1203779 () Bool)

(declare-fun res!800969 () Bool)

(assert (=> b!1203779 (=> (not res!800969) (not e!683562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203779 (= res!800969 (validMask!0 mask!1564))))

(declare-fun b!1203780 () Bool)

(assert (=> b!1203780 (= e!683570 (= call!58067 call!58065))))

(assert (= (and start!100636 res!800972) b!1203779))

(assert (= (and b!1203779 res!800969) b!1203768))

(assert (= (and b!1203768 res!800970) b!1203764))

(assert (= (and b!1203764 res!800967) b!1203766))

(assert (= (and b!1203766 res!800973) b!1203756))

(assert (= (and b!1203756 res!800965) b!1203769))

(assert (= (and b!1203769 res!800964) b!1203762))

(assert (= (and b!1203762 res!800962) b!1203757))

(assert (= (and b!1203757 res!800971) b!1203773))

(assert (= (and b!1203773 res!800966) b!1203772))

(assert (= (and b!1203772 (not res!800974)) b!1203775))

(assert (= (and b!1203775 (not res!800975)) b!1203765))

(assert (= (and b!1203765 c!117936) b!1203761))

(assert (= (and b!1203765 (not c!117936)) b!1203780))

(assert (= (or b!1203761 b!1203780) bm!58062))

(assert (= (or b!1203761 b!1203780) bm!58059))

(assert (= (and b!1203765 (not res!800963)) b!1203774))

(assert (= (and b!1203774 (not res!800961)) b!1203767))

(assert (= (and b!1203767 c!117937) b!1203777))

(assert (= (and b!1203767 (not c!117937)) b!1203758))

(assert (= (and b!1203758 c!117938) b!1203759))

(assert (= (and b!1203758 (not c!117938)) b!1203778))

(assert (= (and b!1203778 c!117939) b!1203755))

(assert (= (and b!1203778 (not c!117939)) b!1203760))

(assert (= (or b!1203759 b!1203755) bm!58058))

(assert (= (or b!1203759 b!1203755) bm!58060))

(assert (= (or b!1203759 b!1203755) bm!58061))

(assert (= (or b!1203777 bm!58061) bm!58057))

(assert (= (or b!1203777 bm!58058) bm!58063))

(assert (= (or b!1203777 bm!58060) bm!58064))

(assert (= (and b!1203767 (not res!800968)) b!1203771))

(assert (= (and b!1203776 condMapEmpty!47757) mapIsEmpty!47757))

(assert (= (and b!1203776 (not condMapEmpty!47757)) mapNonEmpty!47757))

(get-info :version)

(assert (= (and mapNonEmpty!47757 ((_ is ValueCellFull!14594) mapValue!47757)) b!1203763))

(assert (= (and b!1203776 ((_ is ValueCellFull!14594) mapDefault!47757)) b!1203770))

(assert (= start!100636 b!1203776))

(declare-fun b_lambda!21163 () Bool)

(assert (=> (not b_lambda!21163) (not b!1203775)))

(declare-fun t!39423 () Bool)

(declare-fun tb!10695 () Bool)

(assert (=> (and start!100636 (= defaultEntry!1004 defaultEntry!1004) t!39423) tb!10695))

(declare-fun result!21977 () Bool)

(assert (=> tb!10695 (= result!21977 tp_is_empty!30607)))

(assert (=> b!1203775 t!39423))

(declare-fun b_and!42713 () Bool)

(assert (= b_and!42711 (and (=> t!39423 result!21977) b_and!42713)))

(declare-fun m!1109275 () Bool)

(assert (=> bm!58057 m!1109275))

(declare-fun m!1109277 () Bool)

(assert (=> b!1203779 m!1109277))

(declare-fun m!1109279 () Bool)

(assert (=> b!1203775 m!1109279))

(declare-fun m!1109281 () Bool)

(assert (=> b!1203775 m!1109281))

(declare-fun m!1109283 () Bool)

(assert (=> b!1203775 m!1109283))

(declare-fun m!1109285 () Bool)

(assert (=> b!1203775 m!1109285))

(declare-fun m!1109287 () Bool)

(assert (=> b!1203764 m!1109287))

(declare-fun m!1109289 () Bool)

(assert (=> b!1203765 m!1109289))

(declare-fun m!1109291 () Bool)

(assert (=> b!1203765 m!1109291))

(declare-fun m!1109293 () Bool)

(assert (=> bm!58059 m!1109293))

(declare-fun m!1109295 () Bool)

(assert (=> bm!58062 m!1109295))

(declare-fun m!1109297 () Bool)

(assert (=> b!1203761 m!1109297))

(declare-fun m!1109299 () Bool)

(assert (=> b!1203757 m!1109299))

(declare-fun m!1109301 () Bool)

(assert (=> b!1203757 m!1109301))

(declare-fun m!1109303 () Bool)

(assert (=> start!100636 m!1109303))

(declare-fun m!1109305 () Bool)

(assert (=> start!100636 m!1109305))

(declare-fun m!1109307 () Bool)

(assert (=> b!1203762 m!1109307))

(declare-fun m!1109309 () Bool)

(assert (=> b!1203773 m!1109309))

(declare-fun m!1109311 () Bool)

(assert (=> bm!58063 m!1109311))

(declare-fun m!1109313 () Bool)

(assert (=> bm!58064 m!1109313))

(declare-fun m!1109315 () Bool)

(assert (=> b!1203766 m!1109315))

(declare-fun m!1109317 () Bool)

(assert (=> b!1203777 m!1109317))

(declare-fun m!1109319 () Bool)

(assert (=> b!1203777 m!1109319))

(assert (=> b!1203777 m!1109319))

(declare-fun m!1109321 () Bool)

(assert (=> b!1203777 m!1109321))

(declare-fun m!1109323 () Bool)

(assert (=> b!1203769 m!1109323))

(declare-fun m!1109325 () Bool)

(assert (=> b!1203771 m!1109325))

(assert (=> b!1203771 m!1109325))

(declare-fun m!1109327 () Bool)

(assert (=> b!1203771 m!1109327))

(declare-fun m!1109329 () Bool)

(assert (=> b!1203772 m!1109329))

(declare-fun m!1109331 () Bool)

(assert (=> b!1203772 m!1109331))

(declare-fun m!1109333 () Bool)

(assert (=> mapNonEmpty!47757 m!1109333))

(declare-fun m!1109335 () Bool)

(assert (=> b!1203774 m!1109335))

(assert (=> b!1203774 m!1109293))

(check-sat (not mapNonEmpty!47757) (not b!1203775) (not b!1203772) (not b!1203761) (not bm!58064) (not start!100636) tp_is_empty!30607 (not b!1203757) (not b!1203769) (not bm!58057) (not bm!58063) (not bm!58062) (not b!1203777) (not bm!58059) b_and!42713 (not b!1203766) (not b!1203764) (not b!1203779) (not b!1203774) (not b_lambda!21163) (not b_next!25903) (not b!1203771) (not b!1203773) (not b!1203765))
(check-sat b_and!42713 (not b_next!25903))
(get-model)

(declare-fun b_lambda!21169 () Bool)

(assert (= b_lambda!21163 (or (and start!100636 b_free!25903) b_lambda!21169)))

(check-sat (not b_lambda!21169) (not mapNonEmpty!47757) (not b!1203774) (not b!1203775) (not b!1203772) (not b!1203761) (not bm!58064) (not start!100636) tp_is_empty!30607 (not b!1203757) (not b!1203769) (not bm!58057) (not bm!58063) (not bm!58062) (not b!1203777) (not bm!58059) b_and!42713 (not b!1203766) (not b!1203764) (not b!1203779) (not b_next!25903) (not b!1203771) (not b!1203773) (not b!1203765))
(check-sat b_and!42713 (not b_next!25903))
(get-model)

(declare-fun d!132579 () Bool)

(declare-fun res!801070 () Bool)

(declare-fun e!683665 () Bool)

(assert (=> d!132579 (=> res!801070 e!683665)))

(assert (=> d!132579 (= res!801070 (= (select (arr!37596 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132579 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!683665)))

(declare-fun b!1203947 () Bool)

(declare-fun e!683666 () Bool)

(assert (=> b!1203947 (= e!683665 e!683666)))

(declare-fun res!801071 () Bool)

(assert (=> b!1203947 (=> (not res!801071) (not e!683666))))

(assert (=> b!1203947 (= res!801071 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38134 _keys!1208)))))

(declare-fun b!1203948 () Bool)

(assert (=> b!1203948 (= e!683666 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132579 (not res!801070)) b!1203947))

(assert (= (and b!1203947 res!801071) b!1203948))

(declare-fun m!1109461 () Bool)

(assert (=> d!132579 m!1109461))

(declare-fun m!1109463 () Bool)

(assert (=> b!1203948 m!1109463))

(assert (=> b!1203772 d!132579))

(declare-fun d!132581 () Bool)

(assert (=> d!132581 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545730 () Unit!39765)

(declare-fun choose!13 (array!77904 (_ BitVec 64) (_ BitVec 32)) Unit!39765)

(assert (=> d!132581 (= lt!545730 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132581 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132581 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!545730)))

(declare-fun bs!34053 () Bool)

(assert (= bs!34053 d!132581))

(assert (=> bs!34053 m!1109329))

(declare-fun m!1109465 () Bool)

(assert (=> bs!34053 m!1109465))

(assert (=> b!1203772 d!132581))

(declare-fun d!132583 () Bool)

(assert (=> d!132583 (contains!6878 (+!4016 lt!545637 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!545733 () Unit!39765)

(declare-fun choose!1798 (ListLongMap!17733 (_ BitVec 64) V!45937 (_ BitVec 64)) Unit!39765)

(assert (=> d!132583 (= lt!545733 (choose!1798 lt!545637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!132583 (contains!6878 lt!545637 k0!934)))

(assert (=> d!132583 (= (addStillContains!1000 lt!545637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!545733)))

(declare-fun bs!34054 () Bool)

(assert (= bs!34054 d!132583))

(assert (=> bs!34054 m!1109319))

(assert (=> bs!34054 m!1109319))

(assert (=> bs!34054 m!1109321))

(declare-fun m!1109467 () Bool)

(assert (=> bs!34054 m!1109467))

(declare-fun m!1109469 () Bool)

(assert (=> bs!34054 m!1109469))

(assert (=> b!1203777 d!132583))

(declare-fun d!132585 () Bool)

(declare-fun e!683672 () Bool)

(assert (=> d!132585 e!683672))

(declare-fun res!801074 () Bool)

(assert (=> d!132585 (=> res!801074 e!683672)))

(declare-fun lt!545744 () Bool)

(assert (=> d!132585 (= res!801074 (not lt!545744))))

(declare-fun lt!545742 () Bool)

(assert (=> d!132585 (= lt!545744 lt!545742)))

(declare-fun lt!545743 () Unit!39765)

(declare-fun e!683671 () Unit!39765)

(assert (=> d!132585 (= lt!545743 e!683671)))

(declare-fun c!117966 () Bool)

(assert (=> d!132585 (= c!117966 lt!545742)))

(declare-fun containsKey!588 (List!26550 (_ BitVec 64)) Bool)

(assert (=> d!132585 (= lt!545742 (containsKey!588 (toList!8882 (+!4016 lt!545637 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!132585 (= (contains!6878 (+!4016 lt!545637 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!545744)))

(declare-fun b!1203956 () Bool)

(declare-fun lt!545745 () Unit!39765)

(assert (=> b!1203956 (= e!683671 lt!545745)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!417 (List!26550 (_ BitVec 64)) Unit!39765)

(assert (=> b!1203956 (= lt!545745 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8882 (+!4016 lt!545637 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-datatypes ((Option!685 0))(
  ( (Some!684 (v!18003 V!45937)) (None!683) )
))
(declare-fun isDefined!460 (Option!685) Bool)

(declare-fun getValueByKey!634 (List!26550 (_ BitVec 64)) Option!685)

(assert (=> b!1203956 (isDefined!460 (getValueByKey!634 (toList!8882 (+!4016 lt!545637 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1203957 () Bool)

(declare-fun Unit!39773 () Unit!39765)

(assert (=> b!1203957 (= e!683671 Unit!39773)))

(declare-fun b!1203958 () Bool)

(assert (=> b!1203958 (= e!683672 (isDefined!460 (getValueByKey!634 (toList!8882 (+!4016 lt!545637 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!132585 c!117966) b!1203956))

(assert (= (and d!132585 (not c!117966)) b!1203957))

(assert (= (and d!132585 (not res!801074)) b!1203958))

(declare-fun m!1109471 () Bool)

(assert (=> d!132585 m!1109471))

(declare-fun m!1109473 () Bool)

(assert (=> b!1203956 m!1109473))

(declare-fun m!1109475 () Bool)

(assert (=> b!1203956 m!1109475))

(assert (=> b!1203956 m!1109475))

(declare-fun m!1109477 () Bool)

(assert (=> b!1203956 m!1109477))

(assert (=> b!1203958 m!1109475))

(assert (=> b!1203958 m!1109475))

(assert (=> b!1203958 m!1109477))

(assert (=> b!1203777 d!132585))

(declare-fun d!132587 () Bool)

(declare-fun e!683675 () Bool)

(assert (=> d!132587 e!683675))

(declare-fun res!801079 () Bool)

(assert (=> d!132587 (=> (not res!801079) (not e!683675))))

(declare-fun lt!545756 () ListLongMap!17733)

(assert (=> d!132587 (= res!801079 (contains!6878 lt!545756 (_1!9893 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!545754 () List!26550)

(assert (=> d!132587 (= lt!545756 (ListLongMap!17734 lt!545754))))

(declare-fun lt!545757 () Unit!39765)

(declare-fun lt!545755 () Unit!39765)

(assert (=> d!132587 (= lt!545757 lt!545755)))

(assert (=> d!132587 (= (getValueByKey!634 lt!545754 (_1!9893 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!684 (_2!9893 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!310 (List!26550 (_ BitVec 64) V!45937) Unit!39765)

(assert (=> d!132587 (= lt!545755 (lemmaContainsTupThenGetReturnValue!310 lt!545754 (_1!9893 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9893 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!403 (List!26550 (_ BitVec 64) V!45937) List!26550)

(assert (=> d!132587 (= lt!545754 (insertStrictlySorted!403 (toList!8882 lt!545637) (_1!9893 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9893 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132587 (= (+!4016 lt!545637 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!545756)))

(declare-fun b!1203963 () Bool)

(declare-fun res!801080 () Bool)

(assert (=> b!1203963 (=> (not res!801080) (not e!683675))))

(assert (=> b!1203963 (= res!801080 (= (getValueByKey!634 (toList!8882 lt!545756) (_1!9893 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!684 (_2!9893 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1203964 () Bool)

(declare-fun contains!6881 (List!26550 tuple2!19764) Bool)

(assert (=> b!1203964 (= e!683675 (contains!6881 (toList!8882 lt!545756) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!132587 res!801079) b!1203963))

(assert (= (and b!1203963 res!801080) b!1203964))

(declare-fun m!1109479 () Bool)

(assert (=> d!132587 m!1109479))

(declare-fun m!1109481 () Bool)

(assert (=> d!132587 m!1109481))

(declare-fun m!1109483 () Bool)

(assert (=> d!132587 m!1109483))

(declare-fun m!1109485 () Bool)

(assert (=> d!132587 m!1109485))

(declare-fun m!1109487 () Bool)

(assert (=> b!1203963 m!1109487))

(declare-fun m!1109489 () Bool)

(assert (=> b!1203964 m!1109489))

(assert (=> b!1203777 d!132587))

(declare-fun d!132589 () Bool)

(assert (=> d!132589 (= (array_inv!28754 _keys!1208) (bvsge (size!38134 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100636 d!132589))

(declare-fun d!132591 () Bool)

(assert (=> d!132591 (= (array_inv!28755 _values!996) (bvsge (size!38135 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100636 d!132591))

(declare-fun d!132593 () Bool)

(declare-fun e!683677 () Bool)

(assert (=> d!132593 e!683677))

(declare-fun res!801081 () Bool)

(assert (=> d!132593 (=> res!801081 e!683677)))

(declare-fun lt!545760 () Bool)

(assert (=> d!132593 (= res!801081 (not lt!545760))))

(declare-fun lt!545758 () Bool)

(assert (=> d!132593 (= lt!545760 lt!545758)))

(declare-fun lt!545759 () Unit!39765)

(declare-fun e!683676 () Unit!39765)

(assert (=> d!132593 (= lt!545759 e!683676)))

(declare-fun c!117967 () Bool)

(assert (=> d!132593 (= c!117967 lt!545758)))

(assert (=> d!132593 (= lt!545758 (containsKey!588 (toList!8882 (getCurrentListMap!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934))))

(assert (=> d!132593 (= (contains!6878 (getCurrentListMap!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934) lt!545760)))

(declare-fun b!1203965 () Bool)

(declare-fun lt!545761 () Unit!39765)

(assert (=> b!1203965 (= e!683676 lt!545761)))

(assert (=> b!1203965 (= lt!545761 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8882 (getCurrentListMap!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934))))

(assert (=> b!1203965 (isDefined!460 (getValueByKey!634 (toList!8882 (getCurrentListMap!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934))))

(declare-fun b!1203966 () Bool)

(declare-fun Unit!39774 () Unit!39765)

(assert (=> b!1203966 (= e!683676 Unit!39774)))

(declare-fun b!1203967 () Bool)

(assert (=> b!1203967 (= e!683677 (isDefined!460 (getValueByKey!634 (toList!8882 (getCurrentListMap!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934)))))

(assert (= (and d!132593 c!117967) b!1203965))

(assert (= (and d!132593 (not c!117967)) b!1203966))

(assert (= (and d!132593 (not res!801081)) b!1203967))

(declare-fun m!1109491 () Bool)

(assert (=> d!132593 m!1109491))

(declare-fun m!1109493 () Bool)

(assert (=> b!1203965 m!1109493))

(declare-fun m!1109495 () Bool)

(assert (=> b!1203965 m!1109495))

(assert (=> b!1203965 m!1109495))

(declare-fun m!1109497 () Bool)

(assert (=> b!1203965 m!1109497))

(assert (=> b!1203967 m!1109495))

(assert (=> b!1203967 m!1109495))

(assert (=> b!1203967 m!1109497))

(assert (=> b!1203771 d!132593))

(declare-fun b!1204010 () Bool)

(declare-fun e!683709 () Bool)

(declare-fun call!58133 () Bool)

(assert (=> b!1204010 (= e!683709 (not call!58133))))

(declare-fun b!1204011 () Bool)

(declare-fun e!683715 () Bool)

(assert (=> b!1204011 (= e!683715 (validKeyInArray!0 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204012 () Bool)

(declare-fun e!683714 () Bool)

(declare-fun lt!545822 () ListLongMap!17733)

(declare-fun apply!954 (ListLongMap!17733 (_ BitVec 64)) V!45937)

(assert (=> b!1204012 (= e!683714 (= (apply!954 lt!545822 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!944))))

(declare-fun bm!58127 () Bool)

(declare-fun call!58136 () ListLongMap!17733)

(declare-fun call!58132 () ListLongMap!17733)

(assert (=> bm!58127 (= call!58136 call!58132)))

(declare-fun bm!58128 () Bool)

(assert (=> bm!58128 (= call!58133 (contains!6878 lt!545822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!58130 () ListLongMap!17733)

(declare-fun bm!58129 () Bool)

(declare-fun c!117983 () Bool)

(declare-fun c!117985 () Bool)

(declare-fun call!58131 () ListLongMap!17733)

(assert (=> bm!58129 (= call!58130 (+!4016 (ite c!117983 call!58131 (ite c!117985 call!58132 call!58136)) (ite (or c!117983 c!117985) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1204014 () Bool)

(declare-fun e!683706 () ListLongMap!17733)

(assert (=> b!1204014 (= e!683706 call!58136)))

(declare-fun bm!58130 () Bool)

(declare-fun call!58135 () Bool)

(assert (=> bm!58130 (= call!58135 (contains!6878 lt!545822 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!58131 () Bool)

(declare-fun call!58134 () ListLongMap!17733)

(assert (=> bm!58131 (= call!58134 call!58130)))

(declare-fun b!1204015 () Bool)

(assert (=> b!1204015 (= e!683706 call!58134)))

(declare-fun b!1204016 () Bool)

(declare-fun e!683704 () ListLongMap!17733)

(assert (=> b!1204016 (= e!683704 call!58134)))

(declare-fun b!1204017 () Bool)

(declare-fun res!801103 () Bool)

(declare-fun e!683713 () Bool)

(assert (=> b!1204017 (=> (not res!801103) (not e!683713))))

(assert (=> b!1204017 (= res!801103 e!683709)))

(declare-fun c!117982 () Bool)

(assert (=> b!1204017 (= c!117982 (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1204018 () Bool)

(declare-fun e!683707 () Unit!39765)

(declare-fun Unit!39775 () Unit!39765)

(assert (=> b!1204018 (= e!683707 Unit!39775)))

(declare-fun b!1204019 () Bool)

(declare-fun res!801102 () Bool)

(assert (=> b!1204019 (=> (not res!801102) (not e!683713))))

(declare-fun e!683711 () Bool)

(assert (=> b!1204019 (= res!801102 e!683711)))

(declare-fun res!801100 () Bool)

(assert (=> b!1204019 (=> res!801100 e!683711)))

(declare-fun e!683705 () Bool)

(assert (=> b!1204019 (= res!801100 (not e!683705))))

(declare-fun res!801104 () Bool)

(assert (=> b!1204019 (=> (not res!801104) (not e!683705))))

(assert (=> b!1204019 (= res!801104 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))

(declare-fun b!1204020 () Bool)

(declare-fun e!683716 () Bool)

(assert (=> b!1204020 (= e!683709 e!683716)))

(declare-fun res!801108 () Bool)

(assert (=> b!1204020 (= res!801108 call!58133)))

(assert (=> b!1204020 (=> (not res!801108) (not e!683716))))

(declare-fun b!1204021 () Bool)

(declare-fun e!683712 () Bool)

(assert (=> b!1204021 (= e!683711 e!683712)))

(declare-fun res!801105 () Bool)

(assert (=> b!1204021 (=> (not res!801105) (not e!683712))))

(assert (=> b!1204021 (= res!801105 (contains!6878 lt!545822 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204021 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))

(declare-fun b!1204022 () Bool)

(assert (=> b!1204022 (= e!683716 (= (apply!954 lt!545822 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!944))))

(declare-fun b!1204023 () Bool)

(assert (=> b!1204023 (= e!683705 (validKeyInArray!0 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun bm!58132 () Bool)

(assert (=> bm!58132 (= call!58131 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204024 () Bool)

(declare-fun c!117981 () Bool)

(assert (=> b!1204024 (= c!117981 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1204024 (= e!683704 e!683706)))

(declare-fun d!132595 () Bool)

(assert (=> d!132595 e!683713))

(declare-fun res!801106 () Bool)

(assert (=> d!132595 (=> (not res!801106) (not e!683713))))

(assert (=> d!132595 (= res!801106 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))))

(declare-fun lt!545817 () ListLongMap!17733)

(assert (=> d!132595 (= lt!545822 lt!545817)))

(declare-fun lt!545825 () Unit!39765)

(assert (=> d!132595 (= lt!545825 e!683707)))

(declare-fun c!117984 () Bool)

(assert (=> d!132595 (= c!117984 e!683715)))

(declare-fun res!801101 () Bool)

(assert (=> d!132595 (=> (not res!801101) (not e!683715))))

(assert (=> d!132595 (= res!801101 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))

(declare-fun e!683708 () ListLongMap!17733)

(assert (=> d!132595 (= lt!545817 e!683708)))

(assert (=> d!132595 (= c!117983 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!132595 (validMask!0 mask!1564)))

(assert (=> d!132595 (= (getCurrentListMap!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545822)))

(declare-fun b!1204013 () Bool)

(declare-fun e!683710 () Bool)

(assert (=> b!1204013 (= e!683713 e!683710)))

(declare-fun c!117980 () Bool)

(assert (=> b!1204013 (= c!117980 (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!58133 () Bool)

(assert (=> bm!58133 (= call!58132 call!58131)))

(declare-fun b!1204025 () Bool)

(assert (=> b!1204025 (= e!683710 (not call!58135))))

(declare-fun b!1204026 () Bool)

(assert (=> b!1204026 (= e!683708 e!683704)))

(assert (=> b!1204026 (= c!117985 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1204027 () Bool)

(declare-fun get!19183 (ValueCell!14594 V!45937) V!45937)

(assert (=> b!1204027 (= e!683712 (= (apply!954 lt!545822 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19183 (select (arr!37597 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204027 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38135 _values!996)))))

(assert (=> b!1204027 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))

(declare-fun b!1204028 () Bool)

(declare-fun lt!545807 () Unit!39765)

(assert (=> b!1204028 (= e!683707 lt!545807)))

(declare-fun lt!545808 () ListLongMap!17733)

(assert (=> b!1204028 (= lt!545808 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!545813 () (_ BitVec 64))

(assert (=> b!1204028 (= lt!545813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!545816 () (_ BitVec 64))

(assert (=> b!1204028 (= lt!545816 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!545809 () Unit!39765)

(assert (=> b!1204028 (= lt!545809 (addStillContains!1000 lt!545808 lt!545813 zeroValue!944 lt!545816))))

(assert (=> b!1204028 (contains!6878 (+!4016 lt!545808 (tuple2!19765 lt!545813 zeroValue!944)) lt!545816)))

(declare-fun lt!545826 () Unit!39765)

(assert (=> b!1204028 (= lt!545826 lt!545809)))

(declare-fun lt!545824 () ListLongMap!17733)

(assert (=> b!1204028 (= lt!545824 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!545811 () (_ BitVec 64))

(assert (=> b!1204028 (= lt!545811 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!545827 () (_ BitVec 64))

(assert (=> b!1204028 (= lt!545827 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!545812 () Unit!39765)

(declare-fun addApplyDifferent!517 (ListLongMap!17733 (_ BitVec 64) V!45937 (_ BitVec 64)) Unit!39765)

(assert (=> b!1204028 (= lt!545812 (addApplyDifferent!517 lt!545824 lt!545811 minValue!944 lt!545827))))

(assert (=> b!1204028 (= (apply!954 (+!4016 lt!545824 (tuple2!19765 lt!545811 minValue!944)) lt!545827) (apply!954 lt!545824 lt!545827))))

(declare-fun lt!545819 () Unit!39765)

(assert (=> b!1204028 (= lt!545819 lt!545812)))

(declare-fun lt!545823 () ListLongMap!17733)

(assert (=> b!1204028 (= lt!545823 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!545806 () (_ BitVec 64))

(assert (=> b!1204028 (= lt!545806 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!545820 () (_ BitVec 64))

(assert (=> b!1204028 (= lt!545820 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!545810 () Unit!39765)

(assert (=> b!1204028 (= lt!545810 (addApplyDifferent!517 lt!545823 lt!545806 zeroValue!944 lt!545820))))

(assert (=> b!1204028 (= (apply!954 (+!4016 lt!545823 (tuple2!19765 lt!545806 zeroValue!944)) lt!545820) (apply!954 lt!545823 lt!545820))))

(declare-fun lt!545821 () Unit!39765)

(assert (=> b!1204028 (= lt!545821 lt!545810)))

(declare-fun lt!545818 () ListLongMap!17733)

(assert (=> b!1204028 (= lt!545818 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!545814 () (_ BitVec 64))

(assert (=> b!1204028 (= lt!545814 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!545815 () (_ BitVec 64))

(assert (=> b!1204028 (= lt!545815 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1204028 (= lt!545807 (addApplyDifferent!517 lt!545818 lt!545814 minValue!944 lt!545815))))

(assert (=> b!1204028 (= (apply!954 (+!4016 lt!545818 (tuple2!19765 lt!545814 minValue!944)) lt!545815) (apply!954 lt!545818 lt!545815))))

(declare-fun b!1204029 () Bool)

(assert (=> b!1204029 (= e!683708 (+!4016 call!58130 (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun b!1204030 () Bool)

(assert (=> b!1204030 (= e!683710 e!683714)))

(declare-fun res!801107 () Bool)

(assert (=> b!1204030 (= res!801107 call!58135)))

(assert (=> b!1204030 (=> (not res!801107) (not e!683714))))

(assert (= (and d!132595 c!117983) b!1204029))

(assert (= (and d!132595 (not c!117983)) b!1204026))

(assert (= (and b!1204026 c!117985) b!1204016))

(assert (= (and b!1204026 (not c!117985)) b!1204024))

(assert (= (and b!1204024 c!117981) b!1204015))

(assert (= (and b!1204024 (not c!117981)) b!1204014))

(assert (= (or b!1204015 b!1204014) bm!58127))

(assert (= (or b!1204016 bm!58127) bm!58133))

(assert (= (or b!1204016 b!1204015) bm!58131))

(assert (= (or b!1204029 bm!58133) bm!58132))

(assert (= (or b!1204029 bm!58131) bm!58129))

(assert (= (and d!132595 res!801101) b!1204011))

(assert (= (and d!132595 c!117984) b!1204028))

(assert (= (and d!132595 (not c!117984)) b!1204018))

(assert (= (and d!132595 res!801106) b!1204019))

(assert (= (and b!1204019 res!801104) b!1204023))

(assert (= (and b!1204019 (not res!801100)) b!1204021))

(assert (= (and b!1204021 res!801105) b!1204027))

(assert (= (and b!1204019 res!801102) b!1204017))

(assert (= (and b!1204017 c!117982) b!1204020))

(assert (= (and b!1204017 (not c!117982)) b!1204010))

(assert (= (and b!1204020 res!801108) b!1204022))

(assert (= (or b!1204020 b!1204010) bm!58128))

(assert (= (and b!1204017 res!801103) b!1204013))

(assert (= (and b!1204013 c!117980) b!1204030))

(assert (= (and b!1204013 (not c!117980)) b!1204025))

(assert (= (and b!1204030 res!801107) b!1204012))

(assert (= (or b!1204030 b!1204025) bm!58130))

(declare-fun b_lambda!21171 () Bool)

(assert (=> (not b_lambda!21171) (not b!1204027)))

(assert (=> b!1204027 t!39423))

(declare-fun b_and!42723 () Bool)

(assert (= b_and!42713 (and (=> t!39423 result!21977) b_and!42723)))

(assert (=> d!132595 m!1109277))

(declare-fun m!1109499 () Bool)

(assert (=> b!1204028 m!1109499))

(declare-fun m!1109501 () Bool)

(assert (=> b!1204028 m!1109501))

(declare-fun m!1109503 () Bool)

(assert (=> b!1204028 m!1109503))

(declare-fun m!1109505 () Bool)

(assert (=> b!1204028 m!1109505))

(declare-fun m!1109507 () Bool)

(assert (=> b!1204028 m!1109507))

(declare-fun m!1109509 () Bool)

(assert (=> b!1204028 m!1109509))

(assert (=> b!1204028 m!1109293))

(assert (=> b!1204028 m!1109501))

(declare-fun m!1109511 () Bool)

(assert (=> b!1204028 m!1109511))

(assert (=> b!1204028 m!1109505))

(declare-fun m!1109513 () Bool)

(assert (=> b!1204028 m!1109513))

(declare-fun m!1109515 () Bool)

(assert (=> b!1204028 m!1109515))

(assert (=> b!1204028 m!1109507))

(declare-fun m!1109517 () Bool)

(assert (=> b!1204028 m!1109517))

(declare-fun m!1109519 () Bool)

(assert (=> b!1204028 m!1109519))

(declare-fun m!1109521 () Bool)

(assert (=> b!1204028 m!1109521))

(declare-fun m!1109523 () Bool)

(assert (=> b!1204028 m!1109523))

(declare-fun m!1109525 () Bool)

(assert (=> b!1204028 m!1109525))

(assert (=> b!1204028 m!1109523))

(declare-fun m!1109527 () Bool)

(assert (=> b!1204028 m!1109527))

(declare-fun m!1109529 () Bool)

(assert (=> b!1204028 m!1109529))

(declare-fun m!1109531 () Bool)

(assert (=> bm!58129 m!1109531))

(assert (=> b!1204011 m!1109499))

(assert (=> b!1204011 m!1109499))

(declare-fun m!1109533 () Bool)

(assert (=> b!1204011 m!1109533))

(declare-fun m!1109535 () Bool)

(assert (=> b!1204022 m!1109535))

(declare-fun m!1109537 () Bool)

(assert (=> bm!58128 m!1109537))

(assert (=> b!1204023 m!1109499))

(assert (=> b!1204023 m!1109499))

(assert (=> b!1204023 m!1109533))

(declare-fun m!1109539 () Bool)

(assert (=> bm!58130 m!1109539))

(assert (=> b!1204027 m!1109499))

(assert (=> b!1204027 m!1109281))

(declare-fun m!1109541 () Bool)

(assert (=> b!1204027 m!1109541))

(assert (=> b!1204027 m!1109281))

(declare-fun m!1109543 () Bool)

(assert (=> b!1204027 m!1109543))

(assert (=> b!1204027 m!1109541))

(assert (=> b!1204027 m!1109499))

(declare-fun m!1109545 () Bool)

(assert (=> b!1204027 m!1109545))

(declare-fun m!1109547 () Bool)

(assert (=> b!1204029 m!1109547))

(assert (=> b!1204021 m!1109499))

(assert (=> b!1204021 m!1109499))

(declare-fun m!1109549 () Bool)

(assert (=> b!1204021 m!1109549))

(declare-fun m!1109551 () Bool)

(assert (=> b!1204012 m!1109551))

(assert (=> bm!58132 m!1109293))

(assert (=> b!1203771 d!132595))

(declare-fun d!132597 () Bool)

(assert (=> d!132597 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1203779 d!132597))

(declare-fun b!1204055 () Bool)

(declare-fun e!683731 () Bool)

(assert (=> b!1204055 (= e!683731 (validKeyInArray!0 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204055 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204056 () Bool)

(declare-fun e!683736 () Bool)

(declare-fun lt!545847 () ListLongMap!17733)

(declare-fun isEmpty!988 (ListLongMap!17733) Bool)

(assert (=> b!1204056 (= e!683736 (isEmpty!988 lt!545847))))

(declare-fun b!1204057 () Bool)

(assert (=> b!1204057 (= e!683736 (= lt!545847 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204058 () Bool)

(assert (=> b!1204058 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))

(assert (=> b!1204058 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38135 _values!996)))))

(declare-fun e!683732 () Bool)

(assert (=> b!1204058 (= e!683732 (= (apply!954 lt!545847 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19183 (select (arr!37597 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204059 () Bool)

(declare-fun e!683733 () ListLongMap!17733)

(declare-fun e!683735 () ListLongMap!17733)

(assert (=> b!1204059 (= e!683733 e!683735)))

(declare-fun c!117994 () Bool)

(assert (=> b!1204059 (= c!117994 (validKeyInArray!0 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204060 () Bool)

(declare-fun e!683737 () Bool)

(assert (=> b!1204060 (= e!683737 e!683732)))

(assert (=> b!1204060 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))

(declare-fun res!801118 () Bool)

(assert (=> b!1204060 (= res!801118 (contains!6878 lt!545847 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204060 (=> (not res!801118) (not e!683732))))

(declare-fun b!1204061 () Bool)

(assert (=> b!1204061 (= e!683733 (ListLongMap!17734 Nil!26547))))

(declare-fun b!1204062 () Bool)

(declare-fun lt!545848 () Unit!39765)

(declare-fun lt!545844 () Unit!39765)

(assert (=> b!1204062 (= lt!545848 lt!545844)))

(declare-fun lt!545845 () V!45937)

(declare-fun lt!545842 () (_ BitVec 64))

(declare-fun lt!545846 () ListLongMap!17733)

(declare-fun lt!545843 () (_ BitVec 64))

(assert (=> b!1204062 (not (contains!6878 (+!4016 lt!545846 (tuple2!19765 lt!545842 lt!545845)) lt!545843))))

(declare-fun addStillNotContains!290 (ListLongMap!17733 (_ BitVec 64) V!45937 (_ BitVec 64)) Unit!39765)

(assert (=> b!1204062 (= lt!545844 (addStillNotContains!290 lt!545846 lt!545842 lt!545845 lt!545843))))

(assert (=> b!1204062 (= lt!545843 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204062 (= lt!545845 (get!19183 (select (arr!37597 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204062 (= lt!545842 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58139 () ListLongMap!17733)

(assert (=> b!1204062 (= lt!545846 call!58139)))

(assert (=> b!1204062 (= e!683735 (+!4016 call!58139 (tuple2!19765 (select (arr!37596 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19183 (select (arr!37597 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132599 () Bool)

(declare-fun e!683734 () Bool)

(assert (=> d!132599 e!683734))

(declare-fun res!801119 () Bool)

(assert (=> d!132599 (=> (not res!801119) (not e!683734))))

(assert (=> d!132599 (= res!801119 (not (contains!6878 lt!545847 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132599 (= lt!545847 e!683733)))

(declare-fun c!117997 () Bool)

(assert (=> d!132599 (= c!117997 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))

(assert (=> d!132599 (validMask!0 mask!1564)))

(assert (=> d!132599 (= (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545847)))

(declare-fun b!1204063 () Bool)

(assert (=> b!1204063 (= e!683734 e!683737)))

(declare-fun c!117996 () Bool)

(assert (=> b!1204063 (= c!117996 e!683731)))

(declare-fun res!801120 () Bool)

(assert (=> b!1204063 (=> (not res!801120) (not e!683731))))

(assert (=> b!1204063 (= res!801120 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))

(declare-fun b!1204064 () Bool)

(assert (=> b!1204064 (= e!683737 e!683736)))

(declare-fun c!117995 () Bool)

(assert (=> b!1204064 (= c!117995 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))

(declare-fun b!1204065 () Bool)

(declare-fun res!801117 () Bool)

(assert (=> b!1204065 (=> (not res!801117) (not e!683734))))

(assert (=> b!1204065 (= res!801117 (not (contains!6878 lt!545847 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204066 () Bool)

(assert (=> b!1204066 (= e!683735 call!58139)))

(declare-fun bm!58136 () Bool)

(assert (=> bm!58136 (= call!58139 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!132599 c!117997) b!1204061))

(assert (= (and d!132599 (not c!117997)) b!1204059))

(assert (= (and b!1204059 c!117994) b!1204062))

(assert (= (and b!1204059 (not c!117994)) b!1204066))

(assert (= (or b!1204062 b!1204066) bm!58136))

(assert (= (and d!132599 res!801119) b!1204065))

(assert (= (and b!1204065 res!801117) b!1204063))

(assert (= (and b!1204063 res!801120) b!1204055))

(assert (= (and b!1204063 c!117996) b!1204060))

(assert (= (and b!1204063 (not c!117996)) b!1204064))

(assert (= (and b!1204060 res!801118) b!1204058))

(assert (= (and b!1204064 c!117995) b!1204057))

(assert (= (and b!1204064 (not c!117995)) b!1204056))

(declare-fun b_lambda!21173 () Bool)

(assert (=> (not b_lambda!21173) (not b!1204058)))

(assert (=> b!1204058 t!39423))

(declare-fun b_and!42725 () Bool)

(assert (= b_and!42723 (and (=> t!39423 result!21977) b_and!42725)))

(declare-fun b_lambda!21175 () Bool)

(assert (=> (not b_lambda!21175) (not b!1204062)))

(assert (=> b!1204062 t!39423))

(declare-fun b_and!42727 () Bool)

(assert (= b_and!42725 (and (=> t!39423 result!21977) b_and!42727)))

(assert (=> b!1204060 m!1109499))

(assert (=> b!1204060 m!1109499))

(declare-fun m!1109553 () Bool)

(assert (=> b!1204060 m!1109553))

(declare-fun m!1109555 () Bool)

(assert (=> b!1204057 m!1109555))

(declare-fun m!1109557 () Bool)

(assert (=> b!1204065 m!1109557))

(declare-fun m!1109559 () Bool)

(assert (=> b!1204056 m!1109559))

(assert (=> b!1204059 m!1109499))

(assert (=> b!1204059 m!1109499))

(assert (=> b!1204059 m!1109533))

(declare-fun m!1109561 () Bool)

(assert (=> d!132599 m!1109561))

(assert (=> d!132599 m!1109277))

(assert (=> bm!58136 m!1109555))

(assert (=> b!1204062 m!1109281))

(assert (=> b!1204062 m!1109541))

(assert (=> b!1204062 m!1109281))

(assert (=> b!1204062 m!1109543))

(assert (=> b!1204062 m!1109499))

(declare-fun m!1109563 () Bool)

(assert (=> b!1204062 m!1109563))

(declare-fun m!1109565 () Bool)

(assert (=> b!1204062 m!1109565))

(declare-fun m!1109567 () Bool)

(assert (=> b!1204062 m!1109567))

(assert (=> b!1204062 m!1109541))

(declare-fun m!1109569 () Bool)

(assert (=> b!1204062 m!1109569))

(assert (=> b!1204062 m!1109565))

(assert (=> b!1204058 m!1109499))

(assert (=> b!1204058 m!1109541))

(assert (=> b!1204058 m!1109541))

(assert (=> b!1204058 m!1109281))

(assert (=> b!1204058 m!1109543))

(assert (=> b!1204058 m!1109281))

(assert (=> b!1204058 m!1109499))

(declare-fun m!1109571 () Bool)

(assert (=> b!1204058 m!1109571))

(assert (=> b!1204055 m!1109499))

(assert (=> b!1204055 m!1109499))

(assert (=> b!1204055 m!1109533))

(assert (=> bm!58059 d!132599))

(declare-fun d!132601 () Bool)

(declare-fun e!683739 () Bool)

(assert (=> d!132601 e!683739))

(declare-fun res!801121 () Bool)

(assert (=> d!132601 (=> res!801121 e!683739)))

(declare-fun lt!545851 () Bool)

(assert (=> d!132601 (= res!801121 (not lt!545851))))

(declare-fun lt!545849 () Bool)

(assert (=> d!132601 (= lt!545851 lt!545849)))

(declare-fun lt!545850 () Unit!39765)

(declare-fun e!683738 () Unit!39765)

(assert (=> d!132601 (= lt!545850 e!683738)))

(declare-fun c!117998 () Bool)

(assert (=> d!132601 (= c!117998 lt!545849)))

(assert (=> d!132601 (= lt!545849 (containsKey!588 (toList!8882 (ite c!117937 lt!545637 call!58060)) k0!934))))

(assert (=> d!132601 (= (contains!6878 (ite c!117937 lt!545637 call!58060) k0!934) lt!545851)))

(declare-fun b!1204067 () Bool)

(declare-fun lt!545852 () Unit!39765)

(assert (=> b!1204067 (= e!683738 lt!545852)))

(assert (=> b!1204067 (= lt!545852 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8882 (ite c!117937 lt!545637 call!58060)) k0!934))))

(assert (=> b!1204067 (isDefined!460 (getValueByKey!634 (toList!8882 (ite c!117937 lt!545637 call!58060)) k0!934))))

(declare-fun b!1204068 () Bool)

(declare-fun Unit!39776 () Unit!39765)

(assert (=> b!1204068 (= e!683738 Unit!39776)))

(declare-fun b!1204069 () Bool)

(assert (=> b!1204069 (= e!683739 (isDefined!460 (getValueByKey!634 (toList!8882 (ite c!117937 lt!545637 call!58060)) k0!934)))))

(assert (= (and d!132601 c!117998) b!1204067))

(assert (= (and d!132601 (not c!117998)) b!1204068))

(assert (= (and d!132601 (not res!801121)) b!1204069))

(declare-fun m!1109573 () Bool)

(assert (=> d!132601 m!1109573))

(declare-fun m!1109575 () Bool)

(assert (=> b!1204067 m!1109575))

(declare-fun m!1109577 () Bool)

(assert (=> b!1204067 m!1109577))

(assert (=> b!1204067 m!1109577))

(declare-fun m!1109579 () Bool)

(assert (=> b!1204067 m!1109579))

(assert (=> b!1204069 m!1109577))

(assert (=> b!1204069 m!1109577))

(assert (=> b!1204069 m!1109579))

(assert (=> bm!58057 d!132601))

(declare-fun b!1204076 () Bool)

(declare-fun e!683744 () Bool)

(declare-fun e!683745 () Bool)

(assert (=> b!1204076 (= e!683744 e!683745)))

(declare-fun c!118001 () Bool)

(assert (=> b!1204076 (= c!118001 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1204077 () Bool)

(declare-fun call!58144 () ListLongMap!17733)

(declare-fun call!58145 () ListLongMap!17733)

(assert (=> b!1204077 (= e!683745 (= call!58144 call!58145))))

(assert (=> b!1204077 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38135 _values!996)))))

(declare-fun bm!58141 () Bool)

(assert (=> bm!58141 (= call!58144 (getCurrentListMapNoExtraKeys!5328 (array!77905 (store (arr!37596 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38134 _keys!1208)) (array!77907 (store (arr!37597 _values!996) i!673 (ValueCellFull!14594 (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38135 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!132603 () Bool)

(assert (=> d!132603 e!683744))

(declare-fun res!801124 () Bool)

(assert (=> d!132603 (=> (not res!801124) (not e!683744))))

(assert (=> d!132603 (= res!801124 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38134 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38134 _keys!1208))))))))

(declare-fun lt!545855 () Unit!39765)

(declare-fun choose!1799 (array!77904 array!77906 (_ BitVec 32) (_ BitVec 32) V!45937 V!45937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39765)

(assert (=> d!132603 (= lt!545855 (choose!1799 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132603 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 _keys!1208)))))

(assert (=> d!132603 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1024 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545855)))

(declare-fun b!1204078 () Bool)

(assert (=> b!1204078 (= e!683745 (= call!58144 (-!1776 call!58145 k0!934)))))

(assert (=> b!1204078 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38135 _values!996)))))

(declare-fun bm!58142 () Bool)

(assert (=> bm!58142 (= call!58145 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!132603 res!801124) b!1204076))

(assert (= (and b!1204076 c!118001) b!1204078))

(assert (= (and b!1204076 (not c!118001)) b!1204077))

(assert (= (or b!1204078 b!1204077) bm!58142))

(assert (= (or b!1204078 b!1204077) bm!58141))

(declare-fun b_lambda!21177 () Bool)

(assert (=> (not b_lambda!21177) (not bm!58141)))

(assert (=> bm!58141 t!39423))

(declare-fun b_and!42729 () Bool)

(assert (= b_and!42727 (and (=> t!39423 result!21977) b_and!42729)))

(assert (=> bm!58141 m!1109301))

(assert (=> bm!58141 m!1109281))

(assert (=> bm!58141 m!1109283))

(declare-fun m!1109581 () Bool)

(assert (=> bm!58141 m!1109581))

(declare-fun m!1109583 () Bool)

(assert (=> d!132603 m!1109583))

(declare-fun m!1109585 () Bool)

(assert (=> b!1204078 m!1109585))

(assert (=> bm!58142 m!1109293))

(assert (=> b!1203765 d!132603))

(declare-fun bm!58145 () Bool)

(declare-fun call!58148 () Bool)

(assert (=> bm!58145 (= call!58148 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!545642 mask!1564))))

(declare-fun b!1204087 () Bool)

(declare-fun e!683754 () Bool)

(declare-fun e!683752 () Bool)

(assert (=> b!1204087 (= e!683754 e!683752)))

(declare-fun lt!545863 () (_ BitVec 64))

(assert (=> b!1204087 (= lt!545863 (select (arr!37596 lt!545642) #b00000000000000000000000000000000))))

(declare-fun lt!545862 () Unit!39765)

(assert (=> b!1204087 (= lt!545862 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545642 lt!545863 #b00000000000000000000000000000000))))

(assert (=> b!1204087 (arrayContainsKey!0 lt!545642 lt!545863 #b00000000000000000000000000000000)))

(declare-fun lt!545864 () Unit!39765)

(assert (=> b!1204087 (= lt!545864 lt!545862)))

(declare-fun res!801129 () Bool)

(declare-datatypes ((SeekEntryResult!9933 0))(
  ( (MissingZero!9933 (index!42103 (_ BitVec 32))) (Found!9933 (index!42104 (_ BitVec 32))) (Intermediate!9933 (undefined!10745 Bool) (index!42105 (_ BitVec 32)) (x!106388 (_ BitVec 32))) (Undefined!9933) (MissingVacant!9933 (index!42106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77904 (_ BitVec 32)) SeekEntryResult!9933)

(assert (=> b!1204087 (= res!801129 (= (seekEntryOrOpen!0 (select (arr!37596 lt!545642) #b00000000000000000000000000000000) lt!545642 mask!1564) (Found!9933 #b00000000000000000000000000000000)))))

(assert (=> b!1204087 (=> (not res!801129) (not e!683752))))

(declare-fun b!1204088 () Bool)

(assert (=> b!1204088 (= e!683754 call!58148)))

(declare-fun b!1204089 () Bool)

(assert (=> b!1204089 (= e!683752 call!58148)))

(declare-fun d!132605 () Bool)

(declare-fun res!801130 () Bool)

(declare-fun e!683753 () Bool)

(assert (=> d!132605 (=> res!801130 e!683753)))

(assert (=> d!132605 (= res!801130 (bvsge #b00000000000000000000000000000000 (size!38134 lt!545642)))))

(assert (=> d!132605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545642 mask!1564) e!683753)))

(declare-fun b!1204090 () Bool)

(assert (=> b!1204090 (= e!683753 e!683754)))

(declare-fun c!118004 () Bool)

(assert (=> b!1204090 (= c!118004 (validKeyInArray!0 (select (arr!37596 lt!545642) #b00000000000000000000000000000000)))))

(assert (= (and d!132605 (not res!801130)) b!1204090))

(assert (= (and b!1204090 c!118004) b!1204087))

(assert (= (and b!1204090 (not c!118004)) b!1204088))

(assert (= (and b!1204087 res!801129) b!1204089))

(assert (= (or b!1204089 b!1204088) bm!58145))

(declare-fun m!1109587 () Bool)

(assert (=> bm!58145 m!1109587))

(declare-fun m!1109589 () Bool)

(assert (=> b!1204087 m!1109589))

(declare-fun m!1109591 () Bool)

(assert (=> b!1204087 m!1109591))

(declare-fun m!1109593 () Bool)

(assert (=> b!1204087 m!1109593))

(assert (=> b!1204087 m!1109589))

(declare-fun m!1109595 () Bool)

(assert (=> b!1204087 m!1109595))

(assert (=> b!1204090 m!1109589))

(assert (=> b!1204090 m!1109589))

(declare-fun m!1109597 () Bool)

(assert (=> b!1204090 m!1109597))

(assert (=> b!1203757 d!132605))

(declare-fun b!1204091 () Bool)

(declare-fun e!683755 () Bool)

(assert (=> b!1204091 (= e!683755 (validKeyInArray!0 (select (arr!37596 lt!545642) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204091 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204092 () Bool)

(declare-fun e!683760 () Bool)

(declare-fun lt!545870 () ListLongMap!17733)

(assert (=> b!1204092 (= e!683760 (isEmpty!988 lt!545870))))

(declare-fun b!1204093 () Bool)

(assert (=> b!1204093 (= e!683760 (= lt!545870 (getCurrentListMapNoExtraKeys!5328 lt!545642 lt!545641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204094 () Bool)

(assert (=> b!1204094 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 lt!545642)))))

(assert (=> b!1204094 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38135 lt!545641)))))

(declare-fun e!683756 () Bool)

(assert (=> b!1204094 (= e!683756 (= (apply!954 lt!545870 (select (arr!37596 lt!545642) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19183 (select (arr!37597 lt!545641) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204095 () Bool)

(declare-fun e!683757 () ListLongMap!17733)

(declare-fun e!683759 () ListLongMap!17733)

(assert (=> b!1204095 (= e!683757 e!683759)))

(declare-fun c!118005 () Bool)

(assert (=> b!1204095 (= c!118005 (validKeyInArray!0 (select (arr!37596 lt!545642) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204096 () Bool)

(declare-fun e!683761 () Bool)

(assert (=> b!1204096 (= e!683761 e!683756)))

(assert (=> b!1204096 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 lt!545642)))))

(declare-fun res!801132 () Bool)

(assert (=> b!1204096 (= res!801132 (contains!6878 lt!545870 (select (arr!37596 lt!545642) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204096 (=> (not res!801132) (not e!683756))))

(declare-fun b!1204097 () Bool)

(assert (=> b!1204097 (= e!683757 (ListLongMap!17734 Nil!26547))))

(declare-fun b!1204098 () Bool)

(declare-fun lt!545871 () Unit!39765)

(declare-fun lt!545867 () Unit!39765)

(assert (=> b!1204098 (= lt!545871 lt!545867)))

(declare-fun lt!545866 () (_ BitVec 64))

(declare-fun lt!545865 () (_ BitVec 64))

(declare-fun lt!545868 () V!45937)

(declare-fun lt!545869 () ListLongMap!17733)

(assert (=> b!1204098 (not (contains!6878 (+!4016 lt!545869 (tuple2!19765 lt!545865 lt!545868)) lt!545866))))

(assert (=> b!1204098 (= lt!545867 (addStillNotContains!290 lt!545869 lt!545865 lt!545868 lt!545866))))

(assert (=> b!1204098 (= lt!545866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204098 (= lt!545868 (get!19183 (select (arr!37597 lt!545641) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204098 (= lt!545865 (select (arr!37596 lt!545642) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58149 () ListLongMap!17733)

(assert (=> b!1204098 (= lt!545869 call!58149)))

(assert (=> b!1204098 (= e!683759 (+!4016 call!58149 (tuple2!19765 (select (arr!37596 lt!545642) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19183 (select (arr!37597 lt!545641) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132607 () Bool)

(declare-fun e!683758 () Bool)

(assert (=> d!132607 e!683758))

(declare-fun res!801133 () Bool)

(assert (=> d!132607 (=> (not res!801133) (not e!683758))))

(assert (=> d!132607 (= res!801133 (not (contains!6878 lt!545870 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132607 (= lt!545870 e!683757)))

(declare-fun c!118008 () Bool)

(assert (=> d!132607 (= c!118008 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 lt!545642)))))

(assert (=> d!132607 (validMask!0 mask!1564)))

(assert (=> d!132607 (= (getCurrentListMapNoExtraKeys!5328 lt!545642 lt!545641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545870)))

(declare-fun b!1204099 () Bool)

(assert (=> b!1204099 (= e!683758 e!683761)))

(declare-fun c!118007 () Bool)

(assert (=> b!1204099 (= c!118007 e!683755)))

(declare-fun res!801134 () Bool)

(assert (=> b!1204099 (=> (not res!801134) (not e!683755))))

(assert (=> b!1204099 (= res!801134 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 lt!545642)))))

(declare-fun b!1204100 () Bool)

(assert (=> b!1204100 (= e!683761 e!683760)))

(declare-fun c!118006 () Bool)

(assert (=> b!1204100 (= c!118006 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38134 lt!545642)))))

(declare-fun b!1204101 () Bool)

(declare-fun res!801131 () Bool)

(assert (=> b!1204101 (=> (not res!801131) (not e!683758))))

(assert (=> b!1204101 (= res!801131 (not (contains!6878 lt!545870 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204102 () Bool)

(assert (=> b!1204102 (= e!683759 call!58149)))

(declare-fun bm!58146 () Bool)

(assert (=> bm!58146 (= call!58149 (getCurrentListMapNoExtraKeys!5328 lt!545642 lt!545641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!132607 c!118008) b!1204097))

(assert (= (and d!132607 (not c!118008)) b!1204095))

(assert (= (and b!1204095 c!118005) b!1204098))

(assert (= (and b!1204095 (not c!118005)) b!1204102))

(assert (= (or b!1204098 b!1204102) bm!58146))

(assert (= (and d!132607 res!801133) b!1204101))

(assert (= (and b!1204101 res!801131) b!1204099))

(assert (= (and b!1204099 res!801134) b!1204091))

(assert (= (and b!1204099 c!118007) b!1204096))

(assert (= (and b!1204099 (not c!118007)) b!1204100))

(assert (= (and b!1204096 res!801132) b!1204094))

(assert (= (and b!1204100 c!118006) b!1204093))

(assert (= (and b!1204100 (not c!118006)) b!1204092))

(declare-fun b_lambda!21179 () Bool)

(assert (=> (not b_lambda!21179) (not b!1204094)))

(assert (=> b!1204094 t!39423))

(declare-fun b_and!42731 () Bool)

(assert (= b_and!42729 (and (=> t!39423 result!21977) b_and!42731)))

(declare-fun b_lambda!21181 () Bool)

(assert (=> (not b_lambda!21181) (not b!1204098)))

(assert (=> b!1204098 t!39423))

(declare-fun b_and!42733 () Bool)

(assert (= b_and!42731 (and (=> t!39423 result!21977) b_and!42733)))

(declare-fun m!1109599 () Bool)

(assert (=> b!1204096 m!1109599))

(assert (=> b!1204096 m!1109599))

(declare-fun m!1109601 () Bool)

(assert (=> b!1204096 m!1109601))

(declare-fun m!1109603 () Bool)

(assert (=> b!1204093 m!1109603))

(declare-fun m!1109605 () Bool)

(assert (=> b!1204101 m!1109605))

(declare-fun m!1109607 () Bool)

(assert (=> b!1204092 m!1109607))

(assert (=> b!1204095 m!1109599))

(assert (=> b!1204095 m!1109599))

(declare-fun m!1109609 () Bool)

(assert (=> b!1204095 m!1109609))

(declare-fun m!1109611 () Bool)

(assert (=> d!132607 m!1109611))

(assert (=> d!132607 m!1109277))

(assert (=> bm!58146 m!1109603))

(assert (=> b!1204098 m!1109281))

(declare-fun m!1109613 () Bool)

(assert (=> b!1204098 m!1109613))

(assert (=> b!1204098 m!1109281))

(declare-fun m!1109615 () Bool)

(assert (=> b!1204098 m!1109615))

(assert (=> b!1204098 m!1109599))

(declare-fun m!1109617 () Bool)

(assert (=> b!1204098 m!1109617))

(declare-fun m!1109619 () Bool)

(assert (=> b!1204098 m!1109619))

(declare-fun m!1109621 () Bool)

(assert (=> b!1204098 m!1109621))

(assert (=> b!1204098 m!1109613))

(declare-fun m!1109623 () Bool)

(assert (=> b!1204098 m!1109623))

(assert (=> b!1204098 m!1109619))

(assert (=> b!1204094 m!1109599))

(assert (=> b!1204094 m!1109613))

(assert (=> b!1204094 m!1109613))

(assert (=> b!1204094 m!1109281))

(assert (=> b!1204094 m!1109615))

(assert (=> b!1204094 m!1109281))

(assert (=> b!1204094 m!1109599))

(declare-fun m!1109625 () Bool)

(assert (=> b!1204094 m!1109625))

(assert (=> b!1204091 m!1109599))

(assert (=> b!1204091 m!1109599))

(assert (=> b!1204091 m!1109609))

(assert (=> bm!58062 d!132607))

(declare-fun bm!58147 () Bool)

(declare-fun call!58150 () Bool)

(assert (=> bm!58147 (= call!58150 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1204103 () Bool)

(declare-fun e!683764 () Bool)

(declare-fun e!683762 () Bool)

(assert (=> b!1204103 (= e!683764 e!683762)))

(declare-fun lt!545873 () (_ BitVec 64))

(assert (=> b!1204103 (= lt!545873 (select (arr!37596 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!545872 () Unit!39765)

(assert (=> b!1204103 (= lt!545872 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!545873 #b00000000000000000000000000000000))))

(assert (=> b!1204103 (arrayContainsKey!0 _keys!1208 lt!545873 #b00000000000000000000000000000000)))

(declare-fun lt!545874 () Unit!39765)

(assert (=> b!1204103 (= lt!545874 lt!545872)))

(declare-fun res!801135 () Bool)

(assert (=> b!1204103 (= res!801135 (= (seekEntryOrOpen!0 (select (arr!37596 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9933 #b00000000000000000000000000000000)))))

(assert (=> b!1204103 (=> (not res!801135) (not e!683762))))

(declare-fun b!1204104 () Bool)

(assert (=> b!1204104 (= e!683764 call!58150)))

(declare-fun b!1204105 () Bool)

(assert (=> b!1204105 (= e!683762 call!58150)))

(declare-fun d!132609 () Bool)

(declare-fun res!801136 () Bool)

(declare-fun e!683763 () Bool)

(assert (=> d!132609 (=> res!801136 e!683763)))

(assert (=> d!132609 (= res!801136 (bvsge #b00000000000000000000000000000000 (size!38134 _keys!1208)))))

(assert (=> d!132609 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!683763)))

(declare-fun b!1204106 () Bool)

(assert (=> b!1204106 (= e!683763 e!683764)))

(declare-fun c!118009 () Bool)

(assert (=> b!1204106 (= c!118009 (validKeyInArray!0 (select (arr!37596 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132609 (not res!801136)) b!1204106))

(assert (= (and b!1204106 c!118009) b!1204103))

(assert (= (and b!1204106 (not c!118009)) b!1204104))

(assert (= (and b!1204103 res!801135) b!1204105))

(assert (= (or b!1204105 b!1204104) bm!58147))

(declare-fun m!1109627 () Bool)

(assert (=> bm!58147 m!1109627))

(assert (=> b!1204103 m!1109461))

(declare-fun m!1109629 () Bool)

(assert (=> b!1204103 m!1109629))

(declare-fun m!1109631 () Bool)

(assert (=> b!1204103 m!1109631))

(assert (=> b!1204103 m!1109461))

(declare-fun m!1109633 () Bool)

(assert (=> b!1204103 m!1109633))

(assert (=> b!1204106 m!1109461))

(assert (=> b!1204106 m!1109461))

(declare-fun m!1109635 () Bool)

(assert (=> b!1204106 m!1109635))

(assert (=> b!1203764 d!132609))

(declare-fun bm!58150 () Bool)

(declare-fun call!58153 () Bool)

(declare-fun c!118012 () Bool)

(assert (=> bm!58150 (= call!58153 (arrayNoDuplicates!0 lt!545642 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118012 (Cons!26547 (select (arr!37596 lt!545642) #b00000000000000000000000000000000) Nil!26548) Nil!26548)))))

(declare-fun b!1204118 () Bool)

(declare-fun e!683774 () Bool)

(declare-fun contains!6882 (List!26551 (_ BitVec 64)) Bool)

(assert (=> b!1204118 (= e!683774 (contains!6882 Nil!26548 (select (arr!37596 lt!545642) #b00000000000000000000000000000000)))))

(declare-fun b!1204119 () Bool)

(declare-fun e!683773 () Bool)

(declare-fun e!683776 () Bool)

(assert (=> b!1204119 (= e!683773 e!683776)))

(declare-fun res!801145 () Bool)

(assert (=> b!1204119 (=> (not res!801145) (not e!683776))))

(assert (=> b!1204119 (= res!801145 (not e!683774))))

(declare-fun res!801144 () Bool)

(assert (=> b!1204119 (=> (not res!801144) (not e!683774))))

(assert (=> b!1204119 (= res!801144 (validKeyInArray!0 (select (arr!37596 lt!545642) #b00000000000000000000000000000000)))))

(declare-fun b!1204120 () Bool)

(declare-fun e!683775 () Bool)

(assert (=> b!1204120 (= e!683775 call!58153)))

(declare-fun b!1204121 () Bool)

(assert (=> b!1204121 (= e!683776 e!683775)))

(assert (=> b!1204121 (= c!118012 (validKeyInArray!0 (select (arr!37596 lt!545642) #b00000000000000000000000000000000)))))

(declare-fun d!132611 () Bool)

(declare-fun res!801143 () Bool)

(assert (=> d!132611 (=> res!801143 e!683773)))

(assert (=> d!132611 (= res!801143 (bvsge #b00000000000000000000000000000000 (size!38134 lt!545642)))))

(assert (=> d!132611 (= (arrayNoDuplicates!0 lt!545642 #b00000000000000000000000000000000 Nil!26548) e!683773)))

(declare-fun b!1204117 () Bool)

(assert (=> b!1204117 (= e!683775 call!58153)))

(assert (= (and d!132611 (not res!801143)) b!1204119))

(assert (= (and b!1204119 res!801144) b!1204118))

(assert (= (and b!1204119 res!801145) b!1204121))

(assert (= (and b!1204121 c!118012) b!1204120))

(assert (= (and b!1204121 (not c!118012)) b!1204117))

(assert (= (or b!1204120 b!1204117) bm!58150))

(assert (=> bm!58150 m!1109589))

(declare-fun m!1109637 () Bool)

(assert (=> bm!58150 m!1109637))

(assert (=> b!1204118 m!1109589))

(assert (=> b!1204118 m!1109589))

(declare-fun m!1109639 () Bool)

(assert (=> b!1204118 m!1109639))

(assert (=> b!1204119 m!1109589))

(assert (=> b!1204119 m!1109589))

(assert (=> b!1204119 m!1109597))

(assert (=> b!1204121 m!1109589))

(assert (=> b!1204121 m!1109589))

(assert (=> b!1204121 m!1109597))

(assert (=> b!1203773 d!132611))

(declare-fun bm!58151 () Bool)

(declare-fun call!58154 () Bool)

(declare-fun c!118013 () Bool)

(assert (=> bm!58151 (= call!58154 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118013 (Cons!26547 (select (arr!37596 _keys!1208) #b00000000000000000000000000000000) Nil!26548) Nil!26548)))))

(declare-fun b!1204123 () Bool)

(declare-fun e!683778 () Bool)

(assert (=> b!1204123 (= e!683778 (contains!6882 Nil!26548 (select (arr!37596 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204124 () Bool)

(declare-fun e!683777 () Bool)

(declare-fun e!683780 () Bool)

(assert (=> b!1204124 (= e!683777 e!683780)))

(declare-fun res!801148 () Bool)

(assert (=> b!1204124 (=> (not res!801148) (not e!683780))))

(assert (=> b!1204124 (= res!801148 (not e!683778))))

(declare-fun res!801147 () Bool)

(assert (=> b!1204124 (=> (not res!801147) (not e!683778))))

(assert (=> b!1204124 (= res!801147 (validKeyInArray!0 (select (arr!37596 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204125 () Bool)

(declare-fun e!683779 () Bool)

(assert (=> b!1204125 (= e!683779 call!58154)))

(declare-fun b!1204126 () Bool)

(assert (=> b!1204126 (= e!683780 e!683779)))

(assert (=> b!1204126 (= c!118013 (validKeyInArray!0 (select (arr!37596 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132613 () Bool)

(declare-fun res!801146 () Bool)

(assert (=> d!132613 (=> res!801146 e!683777)))

(assert (=> d!132613 (= res!801146 (bvsge #b00000000000000000000000000000000 (size!38134 _keys!1208)))))

(assert (=> d!132613 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26548) e!683777)))

(declare-fun b!1204122 () Bool)

(assert (=> b!1204122 (= e!683779 call!58154)))

(assert (= (and d!132613 (not res!801146)) b!1204124))

(assert (= (and b!1204124 res!801147) b!1204123))

(assert (= (and b!1204124 res!801148) b!1204126))

(assert (= (and b!1204126 c!118013) b!1204125))

(assert (= (and b!1204126 (not c!118013)) b!1204122))

(assert (= (or b!1204125 b!1204122) bm!58151))

(assert (=> bm!58151 m!1109461))

(declare-fun m!1109641 () Bool)

(assert (=> bm!58151 m!1109641))

(assert (=> b!1204123 m!1109461))

(assert (=> b!1204123 m!1109461))

(declare-fun m!1109643 () Bool)

(assert (=> b!1204123 m!1109643))

(assert (=> b!1204124 m!1109461))

(assert (=> b!1204124 m!1109461))

(assert (=> b!1204124 m!1109635))

(assert (=> b!1204126 m!1109461))

(assert (=> b!1204126 m!1109461))

(assert (=> b!1204126 m!1109635))

(assert (=> b!1203766 d!132613))

(declare-fun d!132615 () Bool)

(assert (=> d!132615 (contains!6878 (+!4016 lt!545631 (tuple2!19765 (ite (or c!117937 c!117938) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117937 c!117938) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!545875 () Unit!39765)

(assert (=> d!132615 (= lt!545875 (choose!1798 lt!545631 (ite (or c!117937 c!117938) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117937 c!117938) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!132615 (contains!6878 lt!545631 k0!934)))

(assert (=> d!132615 (= (addStillContains!1000 lt!545631 (ite (or c!117937 c!117938) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117937 c!117938) zeroValue!944 minValue!944) k0!934) lt!545875)))

(declare-fun bs!34055 () Bool)

(assert (= bs!34055 d!132615))

(declare-fun m!1109645 () Bool)

(assert (=> bs!34055 m!1109645))

(assert (=> bs!34055 m!1109645))

(declare-fun m!1109647 () Bool)

(assert (=> bs!34055 m!1109647))

(declare-fun m!1109649 () Bool)

(assert (=> bs!34055 m!1109649))

(assert (=> bs!34055 m!1109335))

(assert (=> bm!58063 d!132615))

(declare-fun d!132617 () Bool)

(declare-fun e!683782 () Bool)

(assert (=> d!132617 e!683782))

(declare-fun res!801149 () Bool)

(assert (=> d!132617 (=> res!801149 e!683782)))

(declare-fun lt!545878 () Bool)

(assert (=> d!132617 (= res!801149 (not lt!545878))))

(declare-fun lt!545876 () Bool)

(assert (=> d!132617 (= lt!545878 lt!545876)))

(declare-fun lt!545877 () Unit!39765)

(declare-fun e!683781 () Unit!39765)

(assert (=> d!132617 (= lt!545877 e!683781)))

(declare-fun c!118014 () Bool)

(assert (=> d!132617 (= c!118014 lt!545876)))

(assert (=> d!132617 (= lt!545876 (containsKey!588 (toList!8882 lt!545631) k0!934))))

(assert (=> d!132617 (= (contains!6878 lt!545631 k0!934) lt!545878)))

(declare-fun b!1204127 () Bool)

(declare-fun lt!545879 () Unit!39765)

(assert (=> b!1204127 (= e!683781 lt!545879)))

(assert (=> b!1204127 (= lt!545879 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8882 lt!545631) k0!934))))

(assert (=> b!1204127 (isDefined!460 (getValueByKey!634 (toList!8882 lt!545631) k0!934))))

(declare-fun b!1204128 () Bool)

(declare-fun Unit!39777 () Unit!39765)

(assert (=> b!1204128 (= e!683781 Unit!39777)))

(declare-fun b!1204129 () Bool)

(assert (=> b!1204129 (= e!683782 (isDefined!460 (getValueByKey!634 (toList!8882 lt!545631) k0!934)))))

(assert (= (and d!132617 c!118014) b!1204127))

(assert (= (and d!132617 (not c!118014)) b!1204128))

(assert (= (and d!132617 (not res!801149)) b!1204129))

(declare-fun m!1109651 () Bool)

(assert (=> d!132617 m!1109651))

(declare-fun m!1109653 () Bool)

(assert (=> b!1204127 m!1109653))

(declare-fun m!1109655 () Bool)

(assert (=> b!1204127 m!1109655))

(assert (=> b!1204127 m!1109655))

(declare-fun m!1109657 () Bool)

(assert (=> b!1204127 m!1109657))

(assert (=> b!1204129 m!1109655))

(assert (=> b!1204129 m!1109655))

(assert (=> b!1204129 m!1109657))

(assert (=> b!1203774 d!132617))

(assert (=> b!1203774 d!132599))

(declare-fun d!132619 () Bool)

(assert (=> d!132619 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203769 d!132619))

(declare-fun b!1204130 () Bool)

(declare-fun e!683783 () Bool)

(assert (=> b!1204130 (= e!683783 (validKeyInArray!0 (select (arr!37596 lt!545642) from!1455)))))

(assert (=> b!1204130 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204131 () Bool)

(declare-fun e!683788 () Bool)

(declare-fun lt!545885 () ListLongMap!17733)

(assert (=> b!1204131 (= e!683788 (isEmpty!988 lt!545885))))

(declare-fun b!1204132 () Bool)

(assert (=> b!1204132 (= e!683788 (= lt!545885 (getCurrentListMapNoExtraKeys!5328 lt!545642 lt!545641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204133 () Bool)

(assert (=> b!1204133 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38134 lt!545642)))))

(assert (=> b!1204133 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38135 lt!545641)))))

(declare-fun e!683784 () Bool)

(assert (=> b!1204133 (= e!683784 (= (apply!954 lt!545885 (select (arr!37596 lt!545642) from!1455)) (get!19183 (select (arr!37597 lt!545641) from!1455) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204134 () Bool)

(declare-fun e!683785 () ListLongMap!17733)

(declare-fun e!683787 () ListLongMap!17733)

(assert (=> b!1204134 (= e!683785 e!683787)))

(declare-fun c!118015 () Bool)

(assert (=> b!1204134 (= c!118015 (validKeyInArray!0 (select (arr!37596 lt!545642) from!1455)))))

(declare-fun b!1204135 () Bool)

(declare-fun e!683789 () Bool)

(assert (=> b!1204135 (= e!683789 e!683784)))

(assert (=> b!1204135 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38134 lt!545642)))))

(declare-fun res!801151 () Bool)

(assert (=> b!1204135 (= res!801151 (contains!6878 lt!545885 (select (arr!37596 lt!545642) from!1455)))))

(assert (=> b!1204135 (=> (not res!801151) (not e!683784))))

(declare-fun b!1204136 () Bool)

(assert (=> b!1204136 (= e!683785 (ListLongMap!17734 Nil!26547))))

(declare-fun b!1204137 () Bool)

(declare-fun lt!545886 () Unit!39765)

(declare-fun lt!545882 () Unit!39765)

(assert (=> b!1204137 (= lt!545886 lt!545882)))

(declare-fun lt!545881 () (_ BitVec 64))

(declare-fun lt!545883 () V!45937)

(declare-fun lt!545880 () (_ BitVec 64))

(declare-fun lt!545884 () ListLongMap!17733)

(assert (=> b!1204137 (not (contains!6878 (+!4016 lt!545884 (tuple2!19765 lt!545880 lt!545883)) lt!545881))))

(assert (=> b!1204137 (= lt!545882 (addStillNotContains!290 lt!545884 lt!545880 lt!545883 lt!545881))))

(assert (=> b!1204137 (= lt!545881 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204137 (= lt!545883 (get!19183 (select (arr!37597 lt!545641) from!1455) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204137 (= lt!545880 (select (arr!37596 lt!545642) from!1455))))

(declare-fun call!58155 () ListLongMap!17733)

(assert (=> b!1204137 (= lt!545884 call!58155)))

(assert (=> b!1204137 (= e!683787 (+!4016 call!58155 (tuple2!19765 (select (arr!37596 lt!545642) from!1455) (get!19183 (select (arr!37597 lt!545641) from!1455) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132621 () Bool)

(declare-fun e!683786 () Bool)

(assert (=> d!132621 e!683786))

(declare-fun res!801152 () Bool)

(assert (=> d!132621 (=> (not res!801152) (not e!683786))))

(assert (=> d!132621 (= res!801152 (not (contains!6878 lt!545885 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132621 (= lt!545885 e!683785)))

(declare-fun c!118018 () Bool)

(assert (=> d!132621 (= c!118018 (bvsge from!1455 (size!38134 lt!545642)))))

(assert (=> d!132621 (validMask!0 mask!1564)))

(assert (=> d!132621 (= (getCurrentListMapNoExtraKeys!5328 lt!545642 lt!545641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!545885)))

(declare-fun b!1204138 () Bool)

(assert (=> b!1204138 (= e!683786 e!683789)))

(declare-fun c!118017 () Bool)

(assert (=> b!1204138 (= c!118017 e!683783)))

(declare-fun res!801153 () Bool)

(assert (=> b!1204138 (=> (not res!801153) (not e!683783))))

(assert (=> b!1204138 (= res!801153 (bvslt from!1455 (size!38134 lt!545642)))))

(declare-fun b!1204139 () Bool)

(assert (=> b!1204139 (= e!683789 e!683788)))

(declare-fun c!118016 () Bool)

(assert (=> b!1204139 (= c!118016 (bvslt from!1455 (size!38134 lt!545642)))))

(declare-fun b!1204140 () Bool)

(declare-fun res!801150 () Bool)

(assert (=> b!1204140 (=> (not res!801150) (not e!683786))))

(assert (=> b!1204140 (= res!801150 (not (contains!6878 lt!545885 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204141 () Bool)

(assert (=> b!1204141 (= e!683787 call!58155)))

(declare-fun bm!58152 () Bool)

(assert (=> bm!58152 (= call!58155 (getCurrentListMapNoExtraKeys!5328 lt!545642 lt!545641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!132621 c!118018) b!1204136))

(assert (= (and d!132621 (not c!118018)) b!1204134))

(assert (= (and b!1204134 c!118015) b!1204137))

(assert (= (and b!1204134 (not c!118015)) b!1204141))

(assert (= (or b!1204137 b!1204141) bm!58152))

(assert (= (and d!132621 res!801152) b!1204140))

(assert (= (and b!1204140 res!801150) b!1204138))

(assert (= (and b!1204138 res!801153) b!1204130))

(assert (= (and b!1204138 c!118017) b!1204135))

(assert (= (and b!1204138 (not c!118017)) b!1204139))

(assert (= (and b!1204135 res!801151) b!1204133))

(assert (= (and b!1204139 c!118016) b!1204132))

(assert (= (and b!1204139 (not c!118016)) b!1204131))

(declare-fun b_lambda!21183 () Bool)

(assert (=> (not b_lambda!21183) (not b!1204133)))

(assert (=> b!1204133 t!39423))

(declare-fun b_and!42735 () Bool)

(assert (= b_and!42733 (and (=> t!39423 result!21977) b_and!42735)))

(declare-fun b_lambda!21185 () Bool)

(assert (=> (not b_lambda!21185) (not b!1204137)))

(assert (=> b!1204137 t!39423))

(declare-fun b_and!42737 () Bool)

(assert (= b_and!42735 (and (=> t!39423 result!21977) b_and!42737)))

(declare-fun m!1109659 () Bool)

(assert (=> b!1204135 m!1109659))

(assert (=> b!1204135 m!1109659))

(declare-fun m!1109661 () Bool)

(assert (=> b!1204135 m!1109661))

(declare-fun m!1109663 () Bool)

(assert (=> b!1204132 m!1109663))

(declare-fun m!1109665 () Bool)

(assert (=> b!1204140 m!1109665))

(declare-fun m!1109667 () Bool)

(assert (=> b!1204131 m!1109667))

(assert (=> b!1204134 m!1109659))

(assert (=> b!1204134 m!1109659))

(declare-fun m!1109669 () Bool)

(assert (=> b!1204134 m!1109669))

(declare-fun m!1109671 () Bool)

(assert (=> d!132621 m!1109671))

(assert (=> d!132621 m!1109277))

(assert (=> bm!58152 m!1109663))

(assert (=> b!1204137 m!1109281))

(declare-fun m!1109673 () Bool)

(assert (=> b!1204137 m!1109673))

(assert (=> b!1204137 m!1109281))

(declare-fun m!1109675 () Bool)

(assert (=> b!1204137 m!1109675))

(assert (=> b!1204137 m!1109659))

(declare-fun m!1109677 () Bool)

(assert (=> b!1204137 m!1109677))

(declare-fun m!1109679 () Bool)

(assert (=> b!1204137 m!1109679))

(declare-fun m!1109681 () Bool)

(assert (=> b!1204137 m!1109681))

(assert (=> b!1204137 m!1109673))

(declare-fun m!1109683 () Bool)

(assert (=> b!1204137 m!1109683))

(assert (=> b!1204137 m!1109679))

(assert (=> b!1204133 m!1109659))

(assert (=> b!1204133 m!1109673))

(assert (=> b!1204133 m!1109673))

(assert (=> b!1204133 m!1109281))

(assert (=> b!1204133 m!1109675))

(assert (=> b!1204133 m!1109281))

(assert (=> b!1204133 m!1109659))

(declare-fun m!1109685 () Bool)

(assert (=> b!1204133 m!1109685))

(assert (=> b!1204130 m!1109659))

(assert (=> b!1204130 m!1109659))

(assert (=> b!1204130 m!1109669))

(assert (=> b!1203775 d!132621))

(declare-fun b!1204142 () Bool)

(declare-fun e!683790 () Bool)

(assert (=> b!1204142 (= e!683790 (validKeyInArray!0 (select (arr!37596 _keys!1208) from!1455)))))

(assert (=> b!1204142 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204143 () Bool)

(declare-fun e!683795 () Bool)

(declare-fun lt!545892 () ListLongMap!17733)

(assert (=> b!1204143 (= e!683795 (isEmpty!988 lt!545892))))

(declare-fun b!1204144 () Bool)

(assert (=> b!1204144 (= e!683795 (= lt!545892 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204145 () Bool)

(assert (=> b!1204145 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38134 _keys!1208)))))

(assert (=> b!1204145 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38135 _values!996)))))

(declare-fun e!683791 () Bool)

(assert (=> b!1204145 (= e!683791 (= (apply!954 lt!545892 (select (arr!37596 _keys!1208) from!1455)) (get!19183 (select (arr!37597 _values!996) from!1455) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204146 () Bool)

(declare-fun e!683792 () ListLongMap!17733)

(declare-fun e!683794 () ListLongMap!17733)

(assert (=> b!1204146 (= e!683792 e!683794)))

(declare-fun c!118019 () Bool)

(assert (=> b!1204146 (= c!118019 (validKeyInArray!0 (select (arr!37596 _keys!1208) from!1455)))))

(declare-fun b!1204147 () Bool)

(declare-fun e!683796 () Bool)

(assert (=> b!1204147 (= e!683796 e!683791)))

(assert (=> b!1204147 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38134 _keys!1208)))))

(declare-fun res!801155 () Bool)

(assert (=> b!1204147 (= res!801155 (contains!6878 lt!545892 (select (arr!37596 _keys!1208) from!1455)))))

(assert (=> b!1204147 (=> (not res!801155) (not e!683791))))

(declare-fun b!1204148 () Bool)

(assert (=> b!1204148 (= e!683792 (ListLongMap!17734 Nil!26547))))

(declare-fun b!1204149 () Bool)

(declare-fun lt!545893 () Unit!39765)

(declare-fun lt!545889 () Unit!39765)

(assert (=> b!1204149 (= lt!545893 lt!545889)))

(declare-fun lt!545888 () (_ BitVec 64))

(declare-fun lt!545890 () V!45937)

(declare-fun lt!545887 () (_ BitVec 64))

(declare-fun lt!545891 () ListLongMap!17733)

(assert (=> b!1204149 (not (contains!6878 (+!4016 lt!545891 (tuple2!19765 lt!545887 lt!545890)) lt!545888))))

(assert (=> b!1204149 (= lt!545889 (addStillNotContains!290 lt!545891 lt!545887 lt!545890 lt!545888))))

(assert (=> b!1204149 (= lt!545888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204149 (= lt!545890 (get!19183 (select (arr!37597 _values!996) from!1455) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204149 (= lt!545887 (select (arr!37596 _keys!1208) from!1455))))

(declare-fun call!58156 () ListLongMap!17733)

(assert (=> b!1204149 (= lt!545891 call!58156)))

(assert (=> b!1204149 (= e!683794 (+!4016 call!58156 (tuple2!19765 (select (arr!37596 _keys!1208) from!1455) (get!19183 (select (arr!37597 _values!996) from!1455) (dynLambda!3201 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132623 () Bool)

(declare-fun e!683793 () Bool)

(assert (=> d!132623 e!683793))

(declare-fun res!801156 () Bool)

(assert (=> d!132623 (=> (not res!801156) (not e!683793))))

(assert (=> d!132623 (= res!801156 (not (contains!6878 lt!545892 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132623 (= lt!545892 e!683792)))

(declare-fun c!118022 () Bool)

(assert (=> d!132623 (= c!118022 (bvsge from!1455 (size!38134 _keys!1208)))))

(assert (=> d!132623 (validMask!0 mask!1564)))

(assert (=> d!132623 (= (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!545892)))

(declare-fun b!1204150 () Bool)

(assert (=> b!1204150 (= e!683793 e!683796)))

(declare-fun c!118021 () Bool)

(assert (=> b!1204150 (= c!118021 e!683790)))

(declare-fun res!801157 () Bool)

(assert (=> b!1204150 (=> (not res!801157) (not e!683790))))

(assert (=> b!1204150 (= res!801157 (bvslt from!1455 (size!38134 _keys!1208)))))

(declare-fun b!1204151 () Bool)

(assert (=> b!1204151 (= e!683796 e!683795)))

(declare-fun c!118020 () Bool)

(assert (=> b!1204151 (= c!118020 (bvslt from!1455 (size!38134 _keys!1208)))))

(declare-fun b!1204152 () Bool)

(declare-fun res!801154 () Bool)

(assert (=> b!1204152 (=> (not res!801154) (not e!683793))))

(assert (=> b!1204152 (= res!801154 (not (contains!6878 lt!545892 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204153 () Bool)

(assert (=> b!1204153 (= e!683794 call!58156)))

(declare-fun bm!58153 () Bool)

(assert (=> bm!58153 (= call!58156 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(assert (= (and d!132623 c!118022) b!1204148))

(assert (= (and d!132623 (not c!118022)) b!1204146))

(assert (= (and b!1204146 c!118019) b!1204149))

(assert (= (and b!1204146 (not c!118019)) b!1204153))

(assert (= (or b!1204149 b!1204153) bm!58153))

(assert (= (and d!132623 res!801156) b!1204152))

(assert (= (and b!1204152 res!801154) b!1204150))

(assert (= (and b!1204150 res!801157) b!1204142))

(assert (= (and b!1204150 c!118021) b!1204147))

(assert (= (and b!1204150 (not c!118021)) b!1204151))

(assert (= (and b!1204147 res!801155) b!1204145))

(assert (= (and b!1204151 c!118020) b!1204144))

(assert (= (and b!1204151 (not c!118020)) b!1204143))

(declare-fun b_lambda!21187 () Bool)

(assert (=> (not b_lambda!21187) (not b!1204145)))

(assert (=> b!1204145 t!39423))

(declare-fun b_and!42739 () Bool)

(assert (= b_and!42737 (and (=> t!39423 result!21977) b_and!42739)))

(declare-fun b_lambda!21189 () Bool)

(assert (=> (not b_lambda!21189) (not b!1204149)))

(assert (=> b!1204149 t!39423))

(declare-fun b_and!42741 () Bool)

(assert (= b_and!42739 (and (=> t!39423 result!21977) b_and!42741)))

(assert (=> b!1204147 m!1109289))

(assert (=> b!1204147 m!1109289))

(declare-fun m!1109687 () Bool)

(assert (=> b!1204147 m!1109687))

(declare-fun m!1109689 () Bool)

(assert (=> b!1204144 m!1109689))

(declare-fun m!1109691 () Bool)

(assert (=> b!1204152 m!1109691))

(declare-fun m!1109693 () Bool)

(assert (=> b!1204143 m!1109693))

(assert (=> b!1204146 m!1109289))

(assert (=> b!1204146 m!1109289))

(declare-fun m!1109695 () Bool)

(assert (=> b!1204146 m!1109695))

(declare-fun m!1109697 () Bool)

(assert (=> d!132623 m!1109697))

(assert (=> d!132623 m!1109277))

(assert (=> bm!58153 m!1109689))

(assert (=> b!1204149 m!1109281))

(declare-fun m!1109699 () Bool)

(assert (=> b!1204149 m!1109699))

(assert (=> b!1204149 m!1109281))

(declare-fun m!1109701 () Bool)

(assert (=> b!1204149 m!1109701))

(assert (=> b!1204149 m!1109289))

(declare-fun m!1109703 () Bool)

(assert (=> b!1204149 m!1109703))

(declare-fun m!1109705 () Bool)

(assert (=> b!1204149 m!1109705))

(declare-fun m!1109707 () Bool)

(assert (=> b!1204149 m!1109707))

(assert (=> b!1204149 m!1109699))

(declare-fun m!1109709 () Bool)

(assert (=> b!1204149 m!1109709))

(assert (=> b!1204149 m!1109705))

(assert (=> b!1204145 m!1109289))

(assert (=> b!1204145 m!1109699))

(assert (=> b!1204145 m!1109699))

(assert (=> b!1204145 m!1109281))

(assert (=> b!1204145 m!1109701))

(assert (=> b!1204145 m!1109281))

(assert (=> b!1204145 m!1109289))

(declare-fun m!1109711 () Bool)

(assert (=> b!1204145 m!1109711))

(assert (=> b!1204142 m!1109289))

(assert (=> b!1204142 m!1109289))

(assert (=> b!1204142 m!1109695))

(assert (=> b!1203775 d!132623))

(declare-fun d!132625 () Bool)

(declare-fun e!683797 () Bool)

(assert (=> d!132625 e!683797))

(declare-fun res!801158 () Bool)

(assert (=> d!132625 (=> (not res!801158) (not e!683797))))

(declare-fun lt!545896 () ListLongMap!17733)

(assert (=> d!132625 (= res!801158 (contains!6878 lt!545896 (_1!9893 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!545894 () List!26550)

(assert (=> d!132625 (= lt!545896 (ListLongMap!17734 lt!545894))))

(declare-fun lt!545897 () Unit!39765)

(declare-fun lt!545895 () Unit!39765)

(assert (=> d!132625 (= lt!545897 lt!545895)))

(assert (=> d!132625 (= (getValueByKey!634 lt!545894 (_1!9893 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!684 (_2!9893 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132625 (= lt!545895 (lemmaContainsTupThenGetReturnValue!310 lt!545894 (_1!9893 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9893 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132625 (= lt!545894 (insertStrictlySorted!403 (toList!8882 lt!545631) (_1!9893 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9893 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132625 (= (+!4016 lt!545631 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!545896)))

(declare-fun b!1204154 () Bool)

(declare-fun res!801159 () Bool)

(assert (=> b!1204154 (=> (not res!801159) (not e!683797))))

(assert (=> b!1204154 (= res!801159 (= (getValueByKey!634 (toList!8882 lt!545896) (_1!9893 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!684 (_2!9893 (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1204155 () Bool)

(assert (=> b!1204155 (= e!683797 (contains!6881 (toList!8882 lt!545896) (ite (or c!117937 c!117938) (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!132625 res!801158) b!1204154))

(assert (= (and b!1204154 res!801159) b!1204155))

(declare-fun m!1109713 () Bool)

(assert (=> d!132625 m!1109713))

(declare-fun m!1109715 () Bool)

(assert (=> d!132625 m!1109715))

(declare-fun m!1109717 () Bool)

(assert (=> d!132625 m!1109717))

(declare-fun m!1109719 () Bool)

(assert (=> d!132625 m!1109719))

(declare-fun m!1109721 () Bool)

(assert (=> b!1204154 m!1109721))

(declare-fun m!1109723 () Bool)

(assert (=> b!1204155 m!1109723))

(assert (=> bm!58064 d!132625))

(declare-fun d!132627 () Bool)

(declare-fun lt!545900 () ListLongMap!17733)

(assert (=> d!132627 (not (contains!6878 lt!545900 k0!934))))

(declare-fun removeStrictlySorted!94 (List!26550 (_ BitVec 64)) List!26550)

(assert (=> d!132627 (= lt!545900 (ListLongMap!17734 (removeStrictlySorted!94 (toList!8882 call!58065) k0!934)))))

(assert (=> d!132627 (= (-!1776 call!58065 k0!934) lt!545900)))

(declare-fun bs!34056 () Bool)

(assert (= bs!34056 d!132627))

(declare-fun m!1109725 () Bool)

(assert (=> bs!34056 m!1109725))

(declare-fun m!1109727 () Bool)

(assert (=> bs!34056 m!1109727))

(assert (=> b!1203761 d!132627))

(declare-fun mapIsEmpty!47766 () Bool)

(declare-fun mapRes!47766 () Bool)

(assert (=> mapIsEmpty!47766 mapRes!47766))

(declare-fun b!1204162 () Bool)

(declare-fun e!683802 () Bool)

(assert (=> b!1204162 (= e!683802 tp_is_empty!30607)))

(declare-fun condMapEmpty!47766 () Bool)

(declare-fun mapDefault!47766 () ValueCell!14594)

(assert (=> mapNonEmpty!47757 (= condMapEmpty!47766 (= mapRest!47757 ((as const (Array (_ BitVec 32) ValueCell!14594)) mapDefault!47766)))))

(declare-fun e!683803 () Bool)

(assert (=> mapNonEmpty!47757 (= tp!90703 (and e!683803 mapRes!47766))))

(declare-fun mapNonEmpty!47766 () Bool)

(declare-fun tp!90718 () Bool)

(assert (=> mapNonEmpty!47766 (= mapRes!47766 (and tp!90718 e!683802))))

(declare-fun mapKey!47766 () (_ BitVec 32))

(declare-fun mapRest!47766 () (Array (_ BitVec 32) ValueCell!14594))

(declare-fun mapValue!47766 () ValueCell!14594)

(assert (=> mapNonEmpty!47766 (= mapRest!47757 (store mapRest!47766 mapKey!47766 mapValue!47766))))

(declare-fun b!1204163 () Bool)

(assert (=> b!1204163 (= e!683803 tp_is_empty!30607)))

(assert (= (and mapNonEmpty!47757 condMapEmpty!47766) mapIsEmpty!47766))

(assert (= (and mapNonEmpty!47757 (not condMapEmpty!47766)) mapNonEmpty!47766))

(assert (= (and mapNonEmpty!47766 ((_ is ValueCellFull!14594) mapValue!47766)) b!1204162))

(assert (= (and mapNonEmpty!47757 ((_ is ValueCellFull!14594) mapDefault!47766)) b!1204163))

(declare-fun m!1109729 () Bool)

(assert (=> mapNonEmpty!47766 m!1109729))

(declare-fun b_lambda!21191 () Bool)

(assert (= b_lambda!21187 (or (and start!100636 b_free!25903) b_lambda!21191)))

(declare-fun b_lambda!21193 () Bool)

(assert (= b_lambda!21181 (or (and start!100636 b_free!25903) b_lambda!21193)))

(declare-fun b_lambda!21195 () Bool)

(assert (= b_lambda!21173 (or (and start!100636 b_free!25903) b_lambda!21195)))

(declare-fun b_lambda!21197 () Bool)

(assert (= b_lambda!21175 (or (and start!100636 b_free!25903) b_lambda!21197)))

(declare-fun b_lambda!21199 () Bool)

(assert (= b_lambda!21185 (or (and start!100636 b_free!25903) b_lambda!21199)))

(declare-fun b_lambda!21201 () Bool)

(assert (= b_lambda!21189 (or (and start!100636 b_free!25903) b_lambda!21201)))

(declare-fun b_lambda!21203 () Bool)

(assert (= b_lambda!21183 (or (and start!100636 b_free!25903) b_lambda!21203)))

(declare-fun b_lambda!21205 () Bool)

(assert (= b_lambda!21179 (or (and start!100636 b_free!25903) b_lambda!21205)))

(declare-fun b_lambda!21207 () Bool)

(assert (= b_lambda!21171 (or (and start!100636 b_free!25903) b_lambda!21207)))

(declare-fun b_lambda!21209 () Bool)

(assert (= b_lambda!21177 (or (and start!100636 b_free!25903) b_lambda!21209)))

(check-sat (not d!132583) (not b!1204140) (not b_lambda!21209) (not d!132621) (not b!1203948) (not d!132607) (not b!1204098) (not bm!58128) (not b!1204118) (not bm!58129) (not b!1204137) (not b!1204143) (not b!1204062) (not d!132593) (not b_lambda!21169) (not b!1204129) (not d!132615) (not bm!58147) (not b!1204093) (not b!1204055) (not bm!58130) (not b!1204101) (not d!132601) (not b_lambda!21197) (not bm!58145) (not b!1204069) (not b!1204144) (not bm!58132) (not bm!58142) (not b_lambda!21199) (not bm!58150) (not bm!58152) (not b!1204056) (not bm!58136) (not b!1204145) (not b!1204124) (not d!132581) (not b_lambda!21201) (not b!1204147) b_and!42741 (not b!1204095) (not b!1204121) (not b!1204067) (not b!1204123) (not b!1204149) (not b!1204058) (not b!1204146) (not b!1204132) (not b_lambda!21203) (not mapNonEmpty!47766) (not b!1204027) (not d!132625) (not b!1204126) (not b!1204021) (not b!1204011) (not b_next!25903) (not b!1204060) (not d!132599) (not b!1204096) (not b!1204065) (not b!1204092) (not b!1204059) (not b!1203964) (not d!132587) (not b!1204094) (not b!1204023) (not d!132617) (not b!1204119) (not b!1204154) (not b!1204135) (not b!1204103) (not b!1203965) (not b_lambda!21191) (not b!1204131) (not b!1204142) (not d!132585) tp_is_empty!30607 (not bm!58146) (not d!132595) (not b!1204106) (not b!1203963) (not b_lambda!21195) (not b!1204155) (not b!1204057) (not b!1203956) (not b!1204029) (not b!1204087) (not b_lambda!21193) (not b!1204130) (not b!1204091) (not d!132627) (not bm!58141) (not bm!58153) (not d!132623) (not b!1204012) (not b!1204127) (not b!1203967) (not b!1204022) (not b!1204028) (not bm!58151) (not b_lambda!21207) (not d!132603) (not b_lambda!21205) (not b!1204152) (not b!1204078) (not b!1204133) (not b!1204134) (not b!1203958) (not b!1204090))
(check-sat b_and!42741 (not b_next!25903))
