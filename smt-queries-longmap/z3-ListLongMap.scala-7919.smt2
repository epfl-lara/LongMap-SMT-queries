; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98356 () Bool)

(assert start!98356)

(declare-fun b_free!23961 () Bool)

(declare-fun b_next!23961 () Bool)

(assert (=> start!98356 (= b_free!23961 (not b_next!23961))))

(declare-fun tp!84594 () Bool)

(declare-fun b_and!38771 () Bool)

(assert (=> start!98356 (= tp!84594 b_and!38771)))

(declare-datatypes ((V!43115 0))(
  ( (V!43116 (val!14302 Int)) )
))
(declare-fun zeroValue!944 () V!43115)

(declare-fun c!110614 () Bool)

(declare-datatypes ((tuple2!18036 0))(
  ( (tuple2!18037 (_1!9029 (_ BitVec 64)) (_2!9029 V!43115)) )
))
(declare-datatypes ((List!24797 0))(
  ( (Nil!24794) (Cons!24793 (h!26002 tuple2!18036) (t!35750 List!24797)) )
))
(declare-datatypes ((ListLongMap!16005 0))(
  ( (ListLongMap!16006 (toList!8018 List!24797)) )
))
(declare-fun lt!503690 () ListLongMap!16005)

(declare-fun bm!49071 () Bool)

(declare-datatypes ((Unit!37139 0))(
  ( (Unit!37140) )
))
(declare-fun call!49076 () Unit!37139)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!110610 () Bool)

(declare-fun minValue!944 () V!43115)

(declare-fun addStillContains!723 (ListLongMap!16005 (_ BitVec 64) V!43115 (_ BitVec 64)) Unit!37139)

(assert (=> bm!49071 (= call!49076 (addStillContains!723 lt!503690 (ite (or c!110614 c!110610) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110614 c!110610) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1133433 () Bool)

(declare-fun res!756801 () Bool)

(declare-fun e!645075 () Bool)

(assert (=> b!1133433 (=> (not res!756801) (not e!645075))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133433 (= res!756801 (validMask!0 mask!1564))))

(declare-datatypes ((array!73843 0))(
  ( (array!73844 (arr!35572 (Array (_ BitVec 32) (_ BitVec 64))) (size!36108 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73843)

(declare-fun b!1133434 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!645065 () Bool)

(declare-fun arrayContainsKey!0 (array!73843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133434 (= e!645065 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133435 () Bool)

(declare-fun e!645077 () Unit!37139)

(declare-fun lt!503683 () Unit!37139)

(assert (=> b!1133435 (= e!645077 lt!503683)))

(declare-fun call!49080 () Unit!37139)

(assert (=> b!1133435 (= lt!503683 call!49080)))

(declare-fun call!49077 () Bool)

(assert (=> b!1133435 call!49077))

(declare-fun bm!49072 () Bool)

(assert (=> bm!49072 (= call!49080 call!49076)))

(declare-fun b!1133436 () Bool)

(declare-fun res!756812 () Bool)

(declare-fun e!645071 () Bool)

(assert (=> b!1133436 (=> (not res!756812) (not e!645071))))

(declare-fun lt!503694 () array!73843)

(declare-datatypes ((List!24798 0))(
  ( (Nil!24795) (Cons!24794 (h!26003 (_ BitVec 64)) (t!35751 List!24798)) )
))
(declare-fun arrayNoDuplicates!0 (array!73843 (_ BitVec 32) List!24798) Bool)

(assert (=> b!1133436 (= res!756812 (arrayNoDuplicates!0 lt!503694 #b00000000000000000000000000000000 Nil!24795))))

(declare-fun b!1133437 () Bool)

(declare-fun res!756809 () Bool)

(assert (=> b!1133437 (=> (not res!756809) (not e!645075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73843 (_ BitVec 32)) Bool)

(assert (=> b!1133437 (= res!756809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1133438 () Bool)

(declare-fun e!645072 () Bool)

(declare-fun e!645064 () Bool)

(assert (=> b!1133438 (= e!645072 e!645064)))

(declare-fun res!756798 () Bool)

(assert (=> b!1133438 (=> res!756798 e!645064)))

(declare-fun contains!6543 (ListLongMap!16005 (_ BitVec 64)) Bool)

(assert (=> b!1133438 (= res!756798 (not (contains!6543 lt!503690 k0!934)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13536 0))(
  ( (ValueCellFull!13536 (v!16939 V!43115)) (EmptyCell!13536) )
))
(declare-datatypes ((array!73845 0))(
  ( (array!73846 (arr!35573 (Array (_ BitVec 32) ValueCell!13536)) (size!36109 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73845)

(declare-fun getCurrentListMapNoExtraKeys!4505 (array!73843 array!73845 (_ BitVec 32) (_ BitVec 32) V!43115 V!43115 (_ BitVec 32) Int) ListLongMap!16005)

(assert (=> b!1133438 (= lt!503690 (getCurrentListMapNoExtraKeys!4505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133439 () Bool)

(declare-fun e!645063 () Bool)

(declare-fun tp_is_empty!28491 () Bool)

(assert (=> b!1133439 (= e!645063 tp_is_empty!28491)))

(declare-fun b!1133440 () Bool)

(declare-fun res!756800 () Bool)

(assert (=> b!1133440 (=> (not res!756800) (not e!645075))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133440 (= res!756800 (= (select (arr!35572 _keys!1208) i!673) k0!934))))

(declare-fun b!1133441 () Bool)

(declare-fun res!756799 () Bool)

(assert (=> b!1133441 (=> (not res!756799) (not e!645075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133441 (= res!756799 (validKeyInArray!0 k0!934))))

(declare-fun bm!49073 () Bool)

(declare-fun call!49078 () ListLongMap!16005)

(assert (=> bm!49073 (= call!49078 (getCurrentListMapNoExtraKeys!4505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133442 () Bool)

(declare-fun e!645069 () Bool)

(assert (=> b!1133442 (= e!645071 (not e!645069))))

(declare-fun res!756805 () Bool)

(assert (=> b!1133442 (=> res!756805 e!645069)))

(assert (=> b!1133442 (= res!756805 (bvsgt from!1455 i!673))))

(assert (=> b!1133442 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503693 () Unit!37139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73843 (_ BitVec 64) (_ BitVec 32)) Unit!37139)

(assert (=> b!1133442 (= lt!503693 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1133443 () Bool)

(declare-fun Unit!37141 () Unit!37139)

(assert (=> b!1133443 (= e!645077 Unit!37141)))

(declare-fun b!1133444 () Bool)

(assert (=> b!1133444 (= e!645064 true)))

(declare-fun e!645076 () Bool)

(assert (=> b!1133444 e!645076))

(declare-fun res!756803 () Bool)

(assert (=> b!1133444 (=> (not res!756803) (not e!645076))))

(assert (=> b!1133444 (= res!756803 e!645065)))

(declare-fun c!110611 () Bool)

(assert (=> b!1133444 (= c!110611 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503682 () Unit!37139)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!330 (array!73843 array!73845 (_ BitVec 32) (_ BitVec 32) V!43115 V!43115 (_ BitVec 64) (_ BitVec 32) Int) Unit!37139)

(assert (=> b!1133444 (= lt!503682 (lemmaListMapContainsThenArrayContainsFrom!330 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503680 () Unit!37139)

(declare-fun e!645073 () Unit!37139)

(assert (=> b!1133444 (= lt!503680 e!645073)))

(declare-fun lt!503687 () Bool)

(assert (=> b!1133444 (= c!110614 (and (not lt!503687) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133444 (= lt!503687 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1133445 () Bool)

(declare-fun res!756806 () Bool)

(assert (=> b!1133445 (=> (not res!756806) (not e!645075))))

(assert (=> b!1133445 (= res!756806 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24795))))

(declare-fun b!1133446 () Bool)

(declare-fun e!645067 () Unit!37139)

(assert (=> b!1133446 (= e!645073 e!645067)))

(assert (=> b!1133446 (= c!110610 (and (not lt!503687) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1133447 () Bool)

(declare-fun e!645074 () Bool)

(assert (=> b!1133447 (= e!645074 e!645072)))

(declare-fun res!756811 () Bool)

(assert (=> b!1133447 (=> res!756811 e!645072)))

(assert (=> b!1133447 (= res!756811 (not (= (select (arr!35572 _keys!1208) from!1455) k0!934)))))

(declare-fun e!645066 () Bool)

(assert (=> b!1133447 e!645066))

(declare-fun c!110612 () Bool)

(assert (=> b!1133447 (= c!110612 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503686 () Unit!37139)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!440 (array!73843 array!73845 (_ BitVec 32) (_ BitVec 32) V!43115 V!43115 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37139)

(assert (=> b!1133447 (= lt!503686 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503688 () ListLongMap!16005)

(declare-fun bm!49074 () Bool)

(declare-fun call!49075 () ListLongMap!16005)

(declare-fun call!49079 () Bool)

(assert (=> bm!49074 (= call!49079 (contains!6543 (ite c!110614 lt!503688 call!49075) k0!934))))

(declare-fun b!1133448 () Bool)

(declare-fun call!49081 () ListLongMap!16005)

(assert (=> b!1133448 (= e!645066 (= call!49081 call!49078))))

(declare-fun b!1133449 () Bool)

(declare-fun c!110613 () Bool)

(assert (=> b!1133449 (= c!110613 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503687))))

(assert (=> b!1133449 (= e!645067 e!645077)))

(declare-fun res!756808 () Bool)

(assert (=> start!98356 (=> (not res!756808) (not e!645075))))

(assert (=> start!98356 (= res!756808 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36108 _keys!1208))))))

(assert (=> start!98356 e!645075))

(assert (=> start!98356 tp_is_empty!28491))

(declare-fun array_inv!27284 (array!73843) Bool)

(assert (=> start!98356 (array_inv!27284 _keys!1208)))

(assert (=> start!98356 true))

(assert (=> start!98356 tp!84594))

(declare-fun e!645070 () Bool)

(declare-fun array_inv!27285 (array!73845) Bool)

(assert (=> start!98356 (and (array_inv!27285 _values!996) e!645070)))

(declare-fun b!1133450 () Bool)

(declare-fun res!756804 () Bool)

(assert (=> b!1133450 (=> (not res!756804) (not e!645075))))

(assert (=> b!1133450 (= res!756804 (and (= (size!36109 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36108 _keys!1208) (size!36109 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!49075 () Bool)

(declare-fun call!49074 () ListLongMap!16005)

(assert (=> bm!49075 (= call!49075 call!49074)))

(declare-fun b!1133451 () Bool)

(assert (=> b!1133451 (= e!645065 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503687) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49076 () Bool)

(declare-fun lt!503681 () array!73845)

(assert (=> bm!49076 (= call!49081 (getCurrentListMapNoExtraKeys!4505 lt!503694 lt!503681 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133452 () Bool)

(assert (=> b!1133452 call!49077))

(declare-fun lt!503692 () Unit!37139)

(assert (=> b!1133452 (= lt!503692 call!49080)))

(assert (=> b!1133452 (= e!645067 lt!503692)))

(declare-fun b!1133453 () Bool)

(assert (=> b!1133453 (= e!645076 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133454 () Bool)

(declare-fun e!645068 () Bool)

(declare-fun mapRes!44561 () Bool)

(assert (=> b!1133454 (= e!645070 (and e!645068 mapRes!44561))))

(declare-fun condMapEmpty!44561 () Bool)

(declare-fun mapDefault!44561 () ValueCell!13536)

(assert (=> b!1133454 (= condMapEmpty!44561 (= (arr!35573 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13536)) mapDefault!44561)))))

(declare-fun b!1133455 () Bool)

(declare-fun -!1186 (ListLongMap!16005 (_ BitVec 64)) ListLongMap!16005)

(assert (=> b!1133455 (= e!645066 (= call!49081 (-!1186 call!49078 k0!934)))))

(declare-fun mapNonEmpty!44561 () Bool)

(declare-fun tp!84593 () Bool)

(assert (=> mapNonEmpty!44561 (= mapRes!44561 (and tp!84593 e!645063))))

(declare-fun mapRest!44561 () (Array (_ BitVec 32) ValueCell!13536))

(declare-fun mapValue!44561 () ValueCell!13536)

(declare-fun mapKey!44561 () (_ BitVec 32))

(assert (=> mapNonEmpty!44561 (= (arr!35573 _values!996) (store mapRest!44561 mapKey!44561 mapValue!44561))))

(declare-fun b!1133456 () Bool)

(assert (=> b!1133456 (= e!645068 tp_is_empty!28491)))

(declare-fun mapIsEmpty!44561 () Bool)

(assert (=> mapIsEmpty!44561 mapRes!44561))

(declare-fun b!1133457 () Bool)

(assert (=> b!1133457 (= e!645075 e!645071)))

(declare-fun res!756810 () Bool)

(assert (=> b!1133457 (=> (not res!756810) (not e!645071))))

(assert (=> b!1133457 (= res!756810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503694 mask!1564))))

(assert (=> b!1133457 (= lt!503694 (array!73844 (store (arr!35572 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36108 _keys!1208)))))

(declare-fun b!1133458 () Bool)

(declare-fun lt!503685 () Unit!37139)

(assert (=> b!1133458 (= e!645073 lt!503685)))

(declare-fun lt!503684 () Unit!37139)

(assert (=> b!1133458 (= lt!503684 call!49076)))

(assert (=> b!1133458 (= lt!503688 call!49074)))

(assert (=> b!1133458 call!49079))

(assert (=> b!1133458 (= lt!503685 (addStillContains!723 lt!503688 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!3460 (ListLongMap!16005 tuple2!18036) ListLongMap!16005)

(assert (=> b!1133458 (contains!6543 (+!3460 lt!503688 (tuple2!18037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1133459 () Bool)

(assert (=> b!1133459 (= e!645069 e!645074)))

(declare-fun res!756802 () Bool)

(assert (=> b!1133459 (=> res!756802 e!645074)))

(assert (=> b!1133459 (= res!756802 (not (= from!1455 i!673)))))

(declare-fun lt!503689 () ListLongMap!16005)

(assert (=> b!1133459 (= lt!503689 (getCurrentListMapNoExtraKeys!4505 lt!503694 lt!503681 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2573 (Int (_ BitVec 64)) V!43115)

(assert (=> b!1133459 (= lt!503681 (array!73846 (store (arr!35573 _values!996) i!673 (ValueCellFull!13536 (dynLambda!2573 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36109 _values!996)))))

(declare-fun lt!503691 () ListLongMap!16005)

(assert (=> b!1133459 (= lt!503691 (getCurrentListMapNoExtraKeys!4505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!49077 () Bool)

(assert (=> bm!49077 (= call!49077 call!49079)))

(declare-fun b!1133460 () Bool)

(declare-fun res!756807 () Bool)

(assert (=> b!1133460 (=> (not res!756807) (not e!645075))))

(assert (=> b!1133460 (= res!756807 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36108 _keys!1208))))))

(declare-fun bm!49078 () Bool)

(assert (=> bm!49078 (= call!49074 (+!3460 lt!503690 (ite (or c!110614 c!110610) (tuple2!18037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and start!98356 res!756808) b!1133433))

(assert (= (and b!1133433 res!756801) b!1133450))

(assert (= (and b!1133450 res!756804) b!1133437))

(assert (= (and b!1133437 res!756809) b!1133445))

(assert (= (and b!1133445 res!756806) b!1133460))

(assert (= (and b!1133460 res!756807) b!1133441))

(assert (= (and b!1133441 res!756799) b!1133440))

(assert (= (and b!1133440 res!756800) b!1133457))

(assert (= (and b!1133457 res!756810) b!1133436))

(assert (= (and b!1133436 res!756812) b!1133442))

(assert (= (and b!1133442 (not res!756805)) b!1133459))

(assert (= (and b!1133459 (not res!756802)) b!1133447))

(assert (= (and b!1133447 c!110612) b!1133455))

(assert (= (and b!1133447 (not c!110612)) b!1133448))

(assert (= (or b!1133455 b!1133448) bm!49076))

(assert (= (or b!1133455 b!1133448) bm!49073))

(assert (= (and b!1133447 (not res!756811)) b!1133438))

(assert (= (and b!1133438 (not res!756798)) b!1133444))

(assert (= (and b!1133444 c!110614) b!1133458))

(assert (= (and b!1133444 (not c!110614)) b!1133446))

(assert (= (and b!1133446 c!110610) b!1133452))

(assert (= (and b!1133446 (not c!110610)) b!1133449))

(assert (= (and b!1133449 c!110613) b!1133435))

(assert (= (and b!1133449 (not c!110613)) b!1133443))

(assert (= (or b!1133452 b!1133435) bm!49072))

(assert (= (or b!1133452 b!1133435) bm!49075))

(assert (= (or b!1133452 b!1133435) bm!49077))

(assert (= (or b!1133458 bm!49077) bm!49074))

(assert (= (or b!1133458 bm!49072) bm!49071))

(assert (= (or b!1133458 bm!49075) bm!49078))

(assert (= (and b!1133444 c!110611) b!1133434))

(assert (= (and b!1133444 (not c!110611)) b!1133451))

(assert (= (and b!1133444 res!756803) b!1133453))

(assert (= (and b!1133454 condMapEmpty!44561) mapIsEmpty!44561))

(assert (= (and b!1133454 (not condMapEmpty!44561)) mapNonEmpty!44561))

(get-info :version)

(assert (= (and mapNonEmpty!44561 ((_ is ValueCellFull!13536) mapValue!44561)) b!1133439))

(assert (= (and b!1133454 ((_ is ValueCellFull!13536) mapDefault!44561)) b!1133456))

(assert (= start!98356 b!1133454))

(declare-fun b_lambda!19067 () Bool)

(assert (=> (not b_lambda!19067) (not b!1133459)))

(declare-fun t!35749 () Bool)

(declare-fun tb!8773 () Bool)

(assert (=> (and start!98356 (= defaultEntry!1004 defaultEntry!1004) t!35749) tb!8773))

(declare-fun result!18111 () Bool)

(assert (=> tb!8773 (= result!18111 tp_is_empty!28491)))

(assert (=> b!1133459 t!35749))

(declare-fun b_and!38773 () Bool)

(assert (= b_and!38771 (and (=> t!35749 result!18111) b_and!38773)))

(declare-fun m!1046513 () Bool)

(assert (=> b!1133447 m!1046513))

(declare-fun m!1046515 () Bool)

(assert (=> b!1133447 m!1046515))

(declare-fun m!1046517 () Bool)

(assert (=> b!1133441 m!1046517))

(declare-fun m!1046519 () Bool)

(assert (=> bm!49074 m!1046519))

(declare-fun m!1046521 () Bool)

(assert (=> b!1133442 m!1046521))

(declare-fun m!1046523 () Bool)

(assert (=> b!1133442 m!1046523))

(declare-fun m!1046525 () Bool)

(assert (=> b!1133453 m!1046525))

(declare-fun m!1046527 () Bool)

(assert (=> b!1133455 m!1046527))

(declare-fun m!1046529 () Bool)

(assert (=> bm!49071 m!1046529))

(declare-fun m!1046531 () Bool)

(assert (=> b!1133437 m!1046531))

(declare-fun m!1046533 () Bool)

(assert (=> b!1133438 m!1046533))

(declare-fun m!1046535 () Bool)

(assert (=> b!1133438 m!1046535))

(assert (=> bm!49073 m!1046535))

(declare-fun m!1046537 () Bool)

(assert (=> b!1133458 m!1046537))

(declare-fun m!1046539 () Bool)

(assert (=> b!1133458 m!1046539))

(assert (=> b!1133458 m!1046539))

(declare-fun m!1046541 () Bool)

(assert (=> b!1133458 m!1046541))

(declare-fun m!1046543 () Bool)

(assert (=> b!1133457 m!1046543))

(declare-fun m!1046545 () Bool)

(assert (=> b!1133457 m!1046545))

(assert (=> b!1133434 m!1046525))

(declare-fun m!1046547 () Bool)

(assert (=> mapNonEmpty!44561 m!1046547))

(declare-fun m!1046549 () Bool)

(assert (=> b!1133459 m!1046549))

(declare-fun m!1046551 () Bool)

(assert (=> b!1133459 m!1046551))

(declare-fun m!1046553 () Bool)

(assert (=> b!1133459 m!1046553))

(declare-fun m!1046555 () Bool)

(assert (=> b!1133459 m!1046555))

(declare-fun m!1046557 () Bool)

(assert (=> b!1133444 m!1046557))

(declare-fun m!1046559 () Bool)

(assert (=> bm!49076 m!1046559))

(declare-fun m!1046561 () Bool)

(assert (=> bm!49078 m!1046561))

(declare-fun m!1046563 () Bool)

(assert (=> b!1133436 m!1046563))

(declare-fun m!1046565 () Bool)

(assert (=> b!1133445 m!1046565))

(declare-fun m!1046567 () Bool)

(assert (=> b!1133440 m!1046567))

(declare-fun m!1046569 () Bool)

(assert (=> start!98356 m!1046569))

(declare-fun m!1046571 () Bool)

(assert (=> start!98356 m!1046571))

(declare-fun m!1046573 () Bool)

(assert (=> b!1133433 m!1046573))

(check-sat (not b!1133434) (not b!1133445) (not b!1133444) b_and!38773 (not bm!49074) (not mapNonEmpty!44561) (not b!1133447) (not start!98356) (not b!1133458) (not b!1133442) (not b!1133438) (not bm!49078) (not b!1133437) (not bm!49076) tp_is_empty!28491 (not b_lambda!19067) (not b!1133459) (not b!1133433) (not b!1133436) (not bm!49071) (not bm!49073) (not b_next!23961) (not b!1133441) (not b!1133453) (not b!1133457) (not b!1133455))
(check-sat b_and!38773 (not b_next!23961))
