; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98416 () Bool)

(assert start!98416)

(declare-fun b_free!23881 () Bool)

(declare-fun b_next!23881 () Bool)

(assert (=> start!98416 (= b_free!23881 (not b_next!23881))))

(declare-fun tp!84346 () Bool)

(declare-fun b_and!38555 () Bool)

(assert (=> start!98416 (= tp!84346 b_and!38555)))

(declare-fun b!1130763 () Bool)

(declare-fun res!755270 () Bool)

(declare-fun e!643637 () Bool)

(assert (=> b!1130763 (=> (not res!755270) (not e!643637))))

(declare-datatypes ((array!73725 0))(
  ( (array!73726 (arr!35509 (Array (_ BitVec 32) (_ BitVec 64))) (size!36046 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73725)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73725 (_ BitVec 32)) Bool)

(assert (=> b!1130763 (= res!755270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!48109 () Bool)

(declare-datatypes ((Unit!36980 0))(
  ( (Unit!36981) )
))
(declare-fun call!48113 () Unit!36980)

(declare-fun call!48117 () Unit!36980)

(assert (=> bm!48109 (= call!48113 call!48117)))

(declare-fun b!1130764 () Bool)

(declare-fun e!643633 () Bool)

(declare-fun e!643643 () Bool)

(declare-fun mapRes!44434 () Bool)

(assert (=> b!1130764 (= e!643633 (and e!643643 mapRes!44434))))

(declare-fun condMapEmpty!44434 () Bool)

(declare-datatypes ((V!43009 0))(
  ( (V!43010 (val!14262 Int)) )
))
(declare-datatypes ((ValueCell!13496 0))(
  ( (ValueCellFull!13496 (v!16891 V!43009)) (EmptyCell!13496) )
))
(declare-datatypes ((array!73727 0))(
  ( (array!73728 (arr!35510 (Array (_ BitVec 32) ValueCell!13496)) (size!36047 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73727)

(declare-fun mapDefault!44434 () ValueCell!13496)

(assert (=> b!1130764 (= condMapEmpty!44434 (= (arr!35510 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13496)) mapDefault!44434)))))

(declare-fun zeroValue!944 () V!43009)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!501945 () array!73725)

(declare-fun lt!501944 () array!73727)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43009)

(declare-datatypes ((tuple2!17974 0))(
  ( (tuple2!17975 (_1!8998 (_ BitVec 64)) (_2!8998 V!43009)) )
))
(declare-datatypes ((List!24752 0))(
  ( (Nil!24749) (Cons!24748 (h!25966 tuple2!17974) (t!35617 List!24752)) )
))
(declare-datatypes ((ListLongMap!15951 0))(
  ( (ListLongMap!15952 (toList!7991 List!24752)) )
))
(declare-fun call!48119 () ListLongMap!15951)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!48110 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4511 (array!73725 array!73727 (_ BitVec 32) (_ BitVec 32) V!43009 V!43009 (_ BitVec 32) Int) ListLongMap!15951)

(assert (=> bm!48110 (= call!48119 (getCurrentListMapNoExtraKeys!4511 lt!501945 lt!501944 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48111 () Bool)

(declare-fun call!48118 () Bool)

(declare-fun call!48115 () Bool)

(assert (=> bm!48111 (= call!48118 call!48115)))

(declare-fun b!1130765 () Bool)

(declare-fun e!643641 () Bool)

(declare-fun call!48114 () ListLongMap!15951)

(assert (=> b!1130765 (= e!643641 (= call!48119 call!48114))))

(declare-fun b!1130766 () Bool)

(declare-fun c!110282 () Bool)

(declare-fun lt!501950 () Bool)

(assert (=> b!1130766 (= c!110282 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501950))))

(declare-fun e!643639 () Unit!36980)

(declare-fun e!643645 () Unit!36980)

(assert (=> b!1130766 (= e!643639 e!643645)))

(declare-fun bm!48112 () Bool)

(assert (=> bm!48112 (= call!48114 (getCurrentListMapNoExtraKeys!4511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130767 () Bool)

(declare-fun e!643644 () Bool)

(declare-fun e!643640 () Bool)

(assert (=> b!1130767 (= e!643644 e!643640)))

(declare-fun res!755263 () Bool)

(assert (=> b!1130767 (=> res!755263 e!643640)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1130767 (= res!755263 (not (= (select (arr!35509 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1130767 e!643641))

(declare-fun c!110284 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130767 (= c!110284 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501939 () Unit!36980)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!415 (array!73725 array!73727 (_ BitVec 32) (_ BitVec 32) V!43009 V!43009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36980)

(assert (=> b!1130767 (= lt!501939 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130768 () Bool)

(declare-fun res!755269 () Bool)

(assert (=> b!1130768 (=> (not res!755269) (not e!643637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130768 (= res!755269 (validMask!0 mask!1564))))

(declare-fun b!1130769 () Bool)

(declare-fun res!755272 () Bool)

(declare-fun e!643642 () Bool)

(assert (=> b!1130769 (=> (not res!755272) (not e!643642))))

(declare-datatypes ((List!24753 0))(
  ( (Nil!24750) (Cons!24749 (h!25967 (_ BitVec 64)) (t!35618 List!24753)) )
))
(declare-fun arrayNoDuplicates!0 (array!73725 (_ BitVec 32) List!24753) Bool)

(assert (=> b!1130769 (= res!755272 (arrayNoDuplicates!0 lt!501945 #b00000000000000000000000000000000 Nil!24750))))

(declare-fun b!1130770 () Bool)

(declare-fun res!755261 () Bool)

(assert (=> b!1130770 (=> (not res!755261) (not e!643637))))

(assert (=> b!1130770 (= res!755261 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36046 _keys!1208))))))

(declare-fun mapNonEmpty!44434 () Bool)

(declare-fun tp!84347 () Bool)

(declare-fun e!643635 () Bool)

(assert (=> mapNonEmpty!44434 (= mapRes!44434 (and tp!84347 e!643635))))

(declare-fun mapRest!44434 () (Array (_ BitVec 32) ValueCell!13496))

(declare-fun mapValue!44434 () ValueCell!13496)

(declare-fun mapKey!44434 () (_ BitVec 32))

(assert (=> mapNonEmpty!44434 (= (arr!35510 _values!996) (store mapRest!44434 mapKey!44434 mapValue!44434))))

(declare-fun b!1130771 () Bool)

(declare-fun e!643647 () Bool)

(assert (=> b!1130771 (= e!643640 e!643647)))

(declare-fun res!755267 () Bool)

(assert (=> b!1130771 (=> res!755267 e!643647)))

(declare-fun lt!501948 () ListLongMap!15951)

(declare-fun contains!6526 (ListLongMap!15951 (_ BitVec 64)) Bool)

(assert (=> b!1130771 (= res!755267 (not (contains!6526 lt!501948 k0!934)))))

(assert (=> b!1130771 (= lt!501948 (getCurrentListMapNoExtraKeys!4511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!755268 () Bool)

(assert (=> start!98416 (=> (not res!755268) (not e!643637))))

(assert (=> start!98416 (= res!755268 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36046 _keys!1208))))))

(assert (=> start!98416 e!643637))

(declare-fun tp_is_empty!28411 () Bool)

(assert (=> start!98416 tp_is_empty!28411))

(declare-fun array_inv!27302 (array!73725) Bool)

(assert (=> start!98416 (array_inv!27302 _keys!1208)))

(assert (=> start!98416 true))

(assert (=> start!98416 tp!84346))

(declare-fun array_inv!27303 (array!73727) Bool)

(assert (=> start!98416 (and (array_inv!27303 _values!996) e!643633)))

(declare-fun b!1130772 () Bool)

(assert (=> b!1130772 (= e!643637 e!643642)))

(declare-fun res!755273 () Bool)

(assert (=> b!1130772 (=> (not res!755273) (not e!643642))))

(assert (=> b!1130772 (= res!755273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501945 mask!1564))))

(assert (=> b!1130772 (= lt!501945 (array!73726 (store (arr!35509 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)))))

(declare-fun b!1130773 () Bool)

(assert (=> b!1130773 (= e!643635 tp_is_empty!28411)))

(declare-fun b!1130774 () Bool)

(declare-fun res!755274 () Bool)

(assert (=> b!1130774 (=> (not res!755274) (not e!643637))))

(assert (=> b!1130774 (= res!755274 (and (= (size!36047 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36046 _keys!1208) (size!36047 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130775 () Bool)

(declare-fun e!643636 () Unit!36980)

(declare-fun lt!501940 () Unit!36980)

(assert (=> b!1130775 (= e!643636 lt!501940)))

(declare-fun lt!501947 () Unit!36980)

(assert (=> b!1130775 (= lt!501947 call!48117)))

(declare-fun lt!501941 () ListLongMap!15951)

(declare-fun call!48112 () ListLongMap!15951)

(assert (=> b!1130775 (= lt!501941 call!48112)))

(assert (=> b!1130775 call!48115))

(declare-fun addStillContains!686 (ListLongMap!15951 (_ BitVec 64) V!43009 (_ BitVec 64)) Unit!36980)

(assert (=> b!1130775 (= lt!501940 (addStillContains!686 lt!501941 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!3460 (ListLongMap!15951 tuple2!17974) ListLongMap!15951)

(assert (=> b!1130775 (contains!6526 (+!3460 lt!501941 (tuple2!17975 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1130776 () Bool)

(assert (=> b!1130776 (= e!643636 e!643639)))

(declare-fun c!110285 () Bool)

(assert (=> b!1130776 (= c!110285 (and (not lt!501950) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!48113 () Bool)

(declare-fun call!48116 () ListLongMap!15951)

(assert (=> bm!48113 (= call!48116 call!48112)))

(declare-fun b!1130777 () Bool)

(declare-fun Unit!36982 () Unit!36980)

(assert (=> b!1130777 (= e!643645 Unit!36982)))

(declare-fun bm!48114 () Bool)

(declare-fun c!110283 () Bool)

(assert (=> bm!48114 (= call!48115 (contains!6526 (ite c!110283 lt!501941 call!48116) k0!934))))

(declare-fun b!1130778 () Bool)

(declare-fun res!755265 () Bool)

(assert (=> b!1130778 (=> (not res!755265) (not e!643637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130778 (= res!755265 (validKeyInArray!0 k0!934))))

(declare-fun b!1130779 () Bool)

(declare-fun e!643646 () Bool)

(assert (=> b!1130779 (= e!643647 e!643646)))

(declare-fun res!755262 () Bool)

(assert (=> b!1130779 (=> res!755262 e!643646)))

(assert (=> b!1130779 (= res!755262 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 _keys!1208))))))

(declare-fun lt!501952 () Unit!36980)

(assert (=> b!1130779 (= lt!501952 e!643636)))

(assert (=> b!1130779 (= c!110283 (and (not lt!501950) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130779 (= lt!501950 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130780 () Bool)

(declare-fun res!755264 () Bool)

(assert (=> b!1130780 (=> (not res!755264) (not e!643637))))

(assert (=> b!1130780 (= res!755264 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24750))))

(declare-fun b!1130781 () Bool)

(declare-fun lt!501951 () Unit!36980)

(assert (=> b!1130781 (= e!643645 lt!501951)))

(assert (=> b!1130781 (= lt!501951 call!48113)))

(assert (=> b!1130781 call!48118))

(declare-fun mapIsEmpty!44434 () Bool)

(assert (=> mapIsEmpty!44434 mapRes!44434))

(declare-fun b!1130782 () Bool)

(assert (=> b!1130782 (= e!643643 tp_is_empty!28411)))

(declare-fun b!1130783 () Bool)

(declare-fun res!755275 () Bool)

(assert (=> b!1130783 (=> (not res!755275) (not e!643637))))

(assert (=> b!1130783 (= res!755275 (= (select (arr!35509 _keys!1208) i!673) k0!934))))

(declare-fun b!1130784 () Bool)

(declare-fun -!1155 (ListLongMap!15951 (_ BitVec 64)) ListLongMap!15951)

(assert (=> b!1130784 (= e!643641 (= call!48119 (-!1155 call!48114 k0!934)))))

(declare-fun bm!48115 () Bool)

(assert (=> bm!48115 (= call!48117 (addStillContains!686 lt!501948 (ite (or c!110283 c!110285) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110283 c!110285) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1130785 () Bool)

(declare-fun e!643638 () Bool)

(assert (=> b!1130785 (= e!643638 e!643644)))

(declare-fun res!755271 () Bool)

(assert (=> b!1130785 (=> res!755271 e!643644)))

(assert (=> b!1130785 (= res!755271 (not (= from!1455 i!673)))))

(declare-fun lt!501949 () ListLongMap!15951)

(assert (=> b!1130785 (= lt!501949 (getCurrentListMapNoExtraKeys!4511 lt!501945 lt!501944 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2573 (Int (_ BitVec 64)) V!43009)

(assert (=> b!1130785 (= lt!501944 (array!73728 (store (arr!35510 _values!996) i!673 (ValueCellFull!13496 (dynLambda!2573 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996)))))

(declare-fun lt!501942 () ListLongMap!15951)

(assert (=> b!1130785 (= lt!501942 (getCurrentListMapNoExtraKeys!4511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130786 () Bool)

(assert (=> b!1130786 call!48118))

(declare-fun lt!501946 () Unit!36980)

(assert (=> b!1130786 (= lt!501946 call!48113)))

(assert (=> b!1130786 (= e!643639 lt!501946)))

(declare-fun b!1130787 () Bool)

(assert (=> b!1130787 (= e!643646 true)))

(declare-fun lt!501938 () Bool)

(declare-fun getCurrentListMap!4423 (array!73725 array!73727 (_ BitVec 32) (_ BitVec 32) V!43009 V!43009 (_ BitVec 32) Int) ListLongMap!15951)

(assert (=> b!1130787 (= lt!501938 (contains!6526 (getCurrentListMap!4423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1130788 () Bool)

(assert (=> b!1130788 (= e!643642 (not e!643638))))

(declare-fun res!755266 () Bool)

(assert (=> b!1130788 (=> res!755266 e!643638)))

(assert (=> b!1130788 (= res!755266 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130788 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501943 () Unit!36980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73725 (_ BitVec 64) (_ BitVec 32)) Unit!36980)

(assert (=> b!1130788 (= lt!501943 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!48116 () Bool)

(assert (=> bm!48116 (= call!48112 (+!3460 lt!501948 (ite (or c!110283 c!110285) (tuple2!17975 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17975 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and start!98416 res!755268) b!1130768))

(assert (= (and b!1130768 res!755269) b!1130774))

(assert (= (and b!1130774 res!755274) b!1130763))

(assert (= (and b!1130763 res!755270) b!1130780))

(assert (= (and b!1130780 res!755264) b!1130770))

(assert (= (and b!1130770 res!755261) b!1130778))

(assert (= (and b!1130778 res!755265) b!1130783))

(assert (= (and b!1130783 res!755275) b!1130772))

(assert (= (and b!1130772 res!755273) b!1130769))

(assert (= (and b!1130769 res!755272) b!1130788))

(assert (= (and b!1130788 (not res!755266)) b!1130785))

(assert (= (and b!1130785 (not res!755271)) b!1130767))

(assert (= (and b!1130767 c!110284) b!1130784))

(assert (= (and b!1130767 (not c!110284)) b!1130765))

(assert (= (or b!1130784 b!1130765) bm!48110))

(assert (= (or b!1130784 b!1130765) bm!48112))

(assert (= (and b!1130767 (not res!755263)) b!1130771))

(assert (= (and b!1130771 (not res!755267)) b!1130779))

(assert (= (and b!1130779 c!110283) b!1130775))

(assert (= (and b!1130779 (not c!110283)) b!1130776))

(assert (= (and b!1130776 c!110285) b!1130786))

(assert (= (and b!1130776 (not c!110285)) b!1130766))

(assert (= (and b!1130766 c!110282) b!1130781))

(assert (= (and b!1130766 (not c!110282)) b!1130777))

(assert (= (or b!1130786 b!1130781) bm!48109))

(assert (= (or b!1130786 b!1130781) bm!48113))

(assert (= (or b!1130786 b!1130781) bm!48111))

(assert (= (or b!1130775 bm!48111) bm!48114))

(assert (= (or b!1130775 bm!48109) bm!48115))

(assert (= (or b!1130775 bm!48113) bm!48116))

(assert (= (and b!1130779 (not res!755262)) b!1130787))

(assert (= (and b!1130764 condMapEmpty!44434) mapIsEmpty!44434))

(assert (= (and b!1130764 (not condMapEmpty!44434)) mapNonEmpty!44434))

(get-info :version)

(assert (= (and mapNonEmpty!44434 ((_ is ValueCellFull!13496) mapValue!44434)) b!1130773))

(assert (= (and b!1130764 ((_ is ValueCellFull!13496) mapDefault!44434)) b!1130782))

(assert (= start!98416 b!1130764))

(declare-fun b_lambda!18861 () Bool)

(assert (=> (not b_lambda!18861) (not b!1130785)))

(declare-fun t!35616 () Bool)

(declare-fun tb!8685 () Bool)

(assert (=> (and start!98416 (= defaultEntry!1004 defaultEntry!1004) t!35616) tb!8685))

(declare-fun result!17939 () Bool)

(assert (=> tb!8685 (= result!17939 tp_is_empty!28411)))

(assert (=> b!1130785 t!35616))

(declare-fun b_and!38557 () Bool)

(assert (= b_and!38555 (and (=> t!35616 result!17939) b_and!38557)))

(declare-fun m!1044495 () Bool)

(assert (=> b!1130771 m!1044495))

(declare-fun m!1044497 () Bool)

(assert (=> b!1130771 m!1044497))

(declare-fun m!1044499 () Bool)

(assert (=> b!1130767 m!1044499))

(declare-fun m!1044501 () Bool)

(assert (=> b!1130767 m!1044501))

(declare-fun m!1044503 () Bool)

(assert (=> b!1130778 m!1044503))

(declare-fun m!1044505 () Bool)

(assert (=> b!1130763 m!1044505))

(declare-fun m!1044507 () Bool)

(assert (=> start!98416 m!1044507))

(declare-fun m!1044509 () Bool)

(assert (=> start!98416 m!1044509))

(declare-fun m!1044511 () Bool)

(assert (=> bm!48114 m!1044511))

(declare-fun m!1044513 () Bool)

(assert (=> b!1130775 m!1044513))

(declare-fun m!1044515 () Bool)

(assert (=> b!1130775 m!1044515))

(assert (=> b!1130775 m!1044515))

(declare-fun m!1044517 () Bool)

(assert (=> b!1130775 m!1044517))

(declare-fun m!1044519 () Bool)

(assert (=> bm!48115 m!1044519))

(declare-fun m!1044521 () Bool)

(assert (=> b!1130783 m!1044521))

(declare-fun m!1044523 () Bool)

(assert (=> b!1130768 m!1044523))

(declare-fun m!1044525 () Bool)

(assert (=> bm!48110 m!1044525))

(declare-fun m!1044527 () Bool)

(assert (=> b!1130787 m!1044527))

(assert (=> b!1130787 m!1044527))

(declare-fun m!1044529 () Bool)

(assert (=> b!1130787 m!1044529))

(declare-fun m!1044531 () Bool)

(assert (=> mapNonEmpty!44434 m!1044531))

(declare-fun m!1044533 () Bool)

(assert (=> bm!48116 m!1044533))

(declare-fun m!1044535 () Bool)

(assert (=> b!1130788 m!1044535))

(declare-fun m!1044537 () Bool)

(assert (=> b!1130788 m!1044537))

(declare-fun m!1044539 () Bool)

(assert (=> b!1130785 m!1044539))

(declare-fun m!1044541 () Bool)

(assert (=> b!1130785 m!1044541))

(declare-fun m!1044543 () Bool)

(assert (=> b!1130785 m!1044543))

(declare-fun m!1044545 () Bool)

(assert (=> b!1130785 m!1044545))

(declare-fun m!1044547 () Bool)

(assert (=> b!1130772 m!1044547))

(declare-fun m!1044549 () Bool)

(assert (=> b!1130772 m!1044549))

(declare-fun m!1044551 () Bool)

(assert (=> b!1130769 m!1044551))

(assert (=> bm!48112 m!1044497))

(declare-fun m!1044553 () Bool)

(assert (=> b!1130784 m!1044553))

(declare-fun m!1044555 () Bool)

(assert (=> b!1130780 m!1044555))

(check-sat (not start!98416) (not bm!48115) (not b!1130772) tp_is_empty!28411 (not bm!48110) (not b!1130780) (not bm!48116) (not b!1130784) (not b!1130787) (not bm!48112) (not b!1130785) (not b!1130767) (not b_lambda!18861) (not b!1130771) (not b_next!23881) (not b!1130769) (not b!1130778) b_and!38557 (not b!1130775) (not b!1130768) (not b!1130788) (not b!1130763) (not mapNonEmpty!44434) (not bm!48114))
(check-sat b_and!38557 (not b_next!23881))
