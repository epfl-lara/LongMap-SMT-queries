; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98464 () Bool)

(assert start!98464)

(declare-fun b_free!23929 () Bool)

(declare-fun b_next!23929 () Bool)

(assert (=> start!98464 (= b_free!23929 (not b_next!23929))))

(declare-fun tp!84490 () Bool)

(declare-fun b_and!38651 () Bool)

(assert (=> start!98464 (= tp!84490 b_and!38651)))

(declare-fun b!1132685 () Bool)

(declare-fun res!756339 () Bool)

(declare-fun e!644718 () Bool)

(assert (=> b!1132685 (=> (not res!756339) (not e!644718))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1132685 (= res!756339 (validKeyInArray!0 k0!934))))

(declare-fun b!1132686 () Bool)

(declare-fun e!644714 () Bool)

(declare-fun e!644719 () Bool)

(assert (=> b!1132686 (= e!644714 e!644719)))

(declare-fun res!756341 () Bool)

(assert (=> b!1132686 (=> res!756341 e!644719)))

(declare-datatypes ((array!73819 0))(
  ( (array!73820 (arr!35556 (Array (_ BitVec 32) (_ BitVec 64))) (size!36093 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73819)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1132686 (= res!756341 (not (= (select (arr!35556 _keys!1208) from!1455) k0!934)))))

(declare-fun e!644723 () Bool)

(assert (=> b!1132686 e!644723))

(declare-fun c!110573 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1132686 (= c!110573 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43073 0))(
  ( (V!43074 (val!14286 Int)) )
))
(declare-fun zeroValue!944 () V!43073)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13520 0))(
  ( (ValueCellFull!13520 (v!16915 V!43073)) (EmptyCell!13520) )
))
(declare-datatypes ((array!73821 0))(
  ( (array!73822 (arr!35557 (Array (_ BitVec 32) ValueCell!13520)) (size!36094 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73821)

(declare-datatypes ((Unit!37038 0))(
  ( (Unit!37039) )
))
(declare-fun lt!503020 () Unit!37038)

(declare-fun minValue!944 () V!43073)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!430 (array!73819 array!73821 (_ BitVec 32) (_ BitVec 32) V!43073 V!43073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37038)

(assert (=> b!1132686 (= lt!503020 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132687 () Bool)

(declare-fun e!644720 () Bool)

(declare-fun e!644716 () Bool)

(assert (=> b!1132687 (= e!644720 (not e!644716))))

(declare-fun res!756345 () Bool)

(assert (=> b!1132687 (=> res!756345 e!644716)))

(assert (=> b!1132687 (= res!756345 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132687 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503022 () Unit!37038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73819 (_ BitVec 64) (_ BitVec 32)) Unit!37038)

(assert (=> b!1132687 (= lt!503022 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1132688 () Bool)

(assert (=> b!1132688 (= e!644718 e!644720)))

(declare-fun res!756343 () Bool)

(assert (=> b!1132688 (=> (not res!756343) (not e!644720))))

(declare-fun lt!503030 () array!73819)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73819 (_ BitVec 32)) Bool)

(assert (=> b!1132688 (= res!756343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503030 mask!1564))))

(assert (=> b!1132688 (= lt!503030 (array!73820 (store (arr!35556 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36093 _keys!1208)))))

(declare-datatypes ((tuple2!18016 0))(
  ( (tuple2!18017 (_1!9019 (_ BitVec 64)) (_2!9019 V!43073)) )
))
(declare-datatypes ((List!24793 0))(
  ( (Nil!24790) (Cons!24789 (h!26007 tuple2!18016) (t!35706 List!24793)) )
))
(declare-datatypes ((ListLongMap!15993 0))(
  ( (ListLongMap!15994 (toList!8012 List!24793)) )
))
(declare-fun lt!503019 () ListLongMap!15993)

(declare-fun c!110576 () Bool)

(declare-fun call!48693 () Bool)

(declare-fun bm!48685 () Bool)

(declare-fun call!48692 () ListLongMap!15993)

(declare-fun contains!6546 (ListLongMap!15993 (_ BitVec 64)) Bool)

(assert (=> bm!48685 (= call!48693 (contains!6546 (ite c!110576 lt!503019 call!48692) k0!934))))

(declare-fun lt!503032 () Bool)

(declare-fun e!644726 () Bool)

(declare-fun b!1132689 () Bool)

(assert (=> b!1132689 (= e!644726 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503032) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!756347 () Bool)

(assert (=> start!98464 (=> (not res!756347) (not e!644718))))

(assert (=> start!98464 (= res!756347 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36093 _keys!1208))))))

(assert (=> start!98464 e!644718))

(declare-fun tp_is_empty!28459 () Bool)

(assert (=> start!98464 tp_is_empty!28459))

(declare-fun array_inv!27330 (array!73819) Bool)

(assert (=> start!98464 (array_inv!27330 _keys!1208)))

(assert (=> start!98464 true))

(assert (=> start!98464 tp!84490))

(declare-fun e!644717 () Bool)

(declare-fun array_inv!27331 (array!73821) Bool)

(assert (=> start!98464 (and (array_inv!27331 _values!996) e!644717)))

(declare-fun call!48690 () Unit!37038)

(declare-fun bm!48686 () Bool)

(declare-fun c!110574 () Bool)

(declare-fun lt!503027 () ListLongMap!15993)

(declare-fun addStillContains!703 (ListLongMap!15993 (_ BitVec 64) V!43073 (_ BitVec 64)) Unit!37038)

(assert (=> bm!48686 (= call!48690 (addStillContains!703 lt!503027 (ite (or c!110576 c!110574) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110576 c!110574) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1132690 () Bool)

(declare-fun c!110575 () Bool)

(assert (=> b!1132690 (= c!110575 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503032))))

(declare-fun e!644713 () Unit!37038)

(declare-fun e!644721 () Unit!37038)

(assert (=> b!1132690 (= e!644713 e!644721)))

(declare-fun b!1132691 () Bool)

(declare-fun lt!503026 () Unit!37038)

(assert (=> b!1132691 (= e!644721 lt!503026)))

(declare-fun call!48691 () Unit!37038)

(assert (=> b!1132691 (= lt!503026 call!48691)))

(declare-fun call!48694 () Bool)

(assert (=> b!1132691 call!48694))

(declare-fun b!1132692 () Bool)

(declare-fun e!644722 () Unit!37038)

(assert (=> b!1132692 (= e!644722 e!644713)))

(assert (=> b!1132692 (= c!110574 (and (not lt!503032) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1132693 () Bool)

(assert (=> b!1132693 (= e!644726 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!48687 () Bool)

(assert (=> bm!48687 (= call!48694 call!48693)))

(declare-fun b!1132694 () Bool)

(declare-fun res!756351 () Bool)

(assert (=> b!1132694 (=> (not res!756351) (not e!644720))))

(declare-datatypes ((List!24794 0))(
  ( (Nil!24791) (Cons!24790 (h!26008 (_ BitVec 64)) (t!35707 List!24794)) )
))
(declare-fun arrayNoDuplicates!0 (array!73819 (_ BitVec 32) List!24794) Bool)

(assert (=> b!1132694 (= res!756351 (arrayNoDuplicates!0 lt!503030 #b00000000000000000000000000000000 Nil!24791))))

(declare-fun b!1132695 () Bool)

(declare-fun e!644725 () Bool)

(assert (=> b!1132695 (= e!644725 tp_is_empty!28459)))

(declare-fun b!1132696 () Bool)

(declare-fun res!756344 () Bool)

(assert (=> b!1132696 (=> (not res!756344) (not e!644718))))

(assert (=> b!1132696 (= res!756344 (and (= (size!36094 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36093 _keys!1208) (size!36094 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1132697 () Bool)

(declare-fun Unit!37040 () Unit!37038)

(assert (=> b!1132697 (= e!644721 Unit!37040)))

(declare-fun b!1132698 () Bool)

(declare-fun lt!503029 () Unit!37038)

(assert (=> b!1132698 (= e!644722 lt!503029)))

(declare-fun lt!503025 () Unit!37038)

(assert (=> b!1132698 (= lt!503025 call!48690)))

(declare-fun +!3477 (ListLongMap!15993 tuple2!18016) ListLongMap!15993)

(assert (=> b!1132698 (= lt!503019 (+!3477 lt!503027 (tuple2!18017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1132698 call!48693))

(assert (=> b!1132698 (= lt!503029 (addStillContains!703 lt!503019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!48695 () ListLongMap!15993)

(assert (=> b!1132698 (contains!6546 call!48695 k0!934)))

(declare-fun b!1132699 () Bool)

(declare-fun e!644715 () Bool)

(assert (=> b!1132699 (= e!644719 e!644715)))

(declare-fun res!756346 () Bool)

(assert (=> b!1132699 (=> res!756346 e!644715)))

(assert (=> b!1132699 (= res!756346 (not (contains!6546 lt!503027 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4530 (array!73819 array!73821 (_ BitVec 32) (_ BitVec 32) V!43073 V!43073 (_ BitVec 32) Int) ListLongMap!15993)

(assert (=> b!1132699 (= lt!503027 (getCurrentListMapNoExtraKeys!4530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48688 () Bool)

(assert (=> bm!48688 (= call!48692 call!48695)))

(declare-fun b!1132700 () Bool)

(declare-fun res!756349 () Bool)

(assert (=> b!1132700 (=> (not res!756349) (not e!644718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1132700 (= res!756349 (validMask!0 mask!1564))))

(declare-fun bm!48689 () Bool)

(assert (=> bm!48689 (= call!48691 call!48690)))

(declare-fun b!1132701 () Bool)

(declare-fun res!756340 () Bool)

(assert (=> b!1132701 (=> (not res!756340) (not e!644718))))

(assert (=> b!1132701 (= res!756340 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24791))))

(declare-fun b!1132702 () Bool)

(declare-fun call!48688 () ListLongMap!15993)

(declare-fun call!48689 () ListLongMap!15993)

(assert (=> b!1132702 (= e!644723 (= call!48688 call!48689))))

(declare-fun b!1132703 () Bool)

(assert (=> b!1132703 (= e!644716 e!644714)))

(declare-fun res!756350 () Bool)

(assert (=> b!1132703 (=> res!756350 e!644714)))

(assert (=> b!1132703 (= res!756350 (not (= from!1455 i!673)))))

(declare-fun lt!503028 () ListLongMap!15993)

(declare-fun lt!503021 () array!73821)

(assert (=> b!1132703 (= lt!503028 (getCurrentListMapNoExtraKeys!4530 lt!503030 lt!503021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2591 (Int (_ BitVec 64)) V!43073)

(assert (=> b!1132703 (= lt!503021 (array!73822 (store (arr!35557 _values!996) i!673 (ValueCellFull!13520 (dynLambda!2591 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36094 _values!996)))))

(declare-fun lt!503018 () ListLongMap!15993)

(assert (=> b!1132703 (= lt!503018 (getCurrentListMapNoExtraKeys!4530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!48690 () Bool)

(assert (=> bm!48690 (= call!48695 (+!3477 (ite c!110576 lt!503019 lt!503027) (ite c!110576 (tuple2!18017 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110574 (tuple2!18017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18017 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapIsEmpty!44506 () Bool)

(declare-fun mapRes!44506 () Bool)

(assert (=> mapIsEmpty!44506 mapRes!44506))

(declare-fun b!1132704 () Bool)

(declare-fun -!1170 (ListLongMap!15993 (_ BitVec 64)) ListLongMap!15993)

(assert (=> b!1132704 (= e!644723 (= call!48688 (-!1170 call!48689 k0!934)))))

(declare-fun bm!48691 () Bool)

(assert (=> bm!48691 (= call!48688 (getCurrentListMapNoExtraKeys!4530 lt!503030 lt!503021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132705 () Bool)

(declare-fun res!756348 () Bool)

(assert (=> b!1132705 (=> (not res!756348) (not e!644718))))

(assert (=> b!1132705 (= res!756348 (= (select (arr!35556 _keys!1208) i!673) k0!934))))

(declare-fun bm!48692 () Bool)

(assert (=> bm!48692 (= call!48689 (getCurrentListMapNoExtraKeys!4530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132706 () Bool)

(declare-fun res!756352 () Bool)

(assert (=> b!1132706 (=> (not res!756352) (not e!644718))))

(assert (=> b!1132706 (= res!756352 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36093 _keys!1208))))))

(declare-fun b!1132707 () Bool)

(assert (=> b!1132707 call!48694))

(declare-fun lt!503024 () Unit!37038)

(assert (=> b!1132707 (= lt!503024 call!48691)))

(assert (=> b!1132707 (= e!644713 lt!503024)))

(declare-fun b!1132708 () Bool)

(declare-fun res!756342 () Bool)

(assert (=> b!1132708 (=> (not res!756342) (not e!644718))))

(assert (=> b!1132708 (= res!756342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!44506 () Bool)

(declare-fun tp!84491 () Bool)

(declare-fun e!644727 () Bool)

(assert (=> mapNonEmpty!44506 (= mapRes!44506 (and tp!84491 e!644727))))

(declare-fun mapKey!44506 () (_ BitVec 32))

(declare-fun mapRest!44506 () (Array (_ BitVec 32) ValueCell!13520))

(declare-fun mapValue!44506 () ValueCell!13520)

(assert (=> mapNonEmpty!44506 (= (arr!35557 _values!996) (store mapRest!44506 mapKey!44506 mapValue!44506))))

(declare-fun b!1132709 () Bool)

(assert (=> b!1132709 (= e!644727 tp_is_empty!28459)))

(declare-fun b!1132710 () Bool)

(assert (=> b!1132710 (= e!644715 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000))))

(assert (=> b!1132710 e!644726))

(declare-fun c!110572 () Bool)

(assert (=> b!1132710 (= c!110572 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503031 () Unit!37038)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!315 (array!73819 array!73821 (_ BitVec 32) (_ BitVec 32) V!43073 V!43073 (_ BitVec 64) (_ BitVec 32) Int) Unit!37038)

(assert (=> b!1132710 (= lt!503031 (lemmaListMapContainsThenArrayContainsFrom!315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503023 () Unit!37038)

(assert (=> b!1132710 (= lt!503023 e!644722)))

(assert (=> b!1132710 (= c!110576 (and (not lt!503032) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1132710 (= lt!503032 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1132711 () Bool)

(assert (=> b!1132711 (= e!644717 (and e!644725 mapRes!44506))))

(declare-fun condMapEmpty!44506 () Bool)

(declare-fun mapDefault!44506 () ValueCell!13520)

(assert (=> b!1132711 (= condMapEmpty!44506 (= (arr!35557 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13520)) mapDefault!44506)))))

(assert (= (and start!98464 res!756347) b!1132700))

(assert (= (and b!1132700 res!756349) b!1132696))

(assert (= (and b!1132696 res!756344) b!1132708))

(assert (= (and b!1132708 res!756342) b!1132701))

(assert (= (and b!1132701 res!756340) b!1132706))

(assert (= (and b!1132706 res!756352) b!1132685))

(assert (= (and b!1132685 res!756339) b!1132705))

(assert (= (and b!1132705 res!756348) b!1132688))

(assert (= (and b!1132688 res!756343) b!1132694))

(assert (= (and b!1132694 res!756351) b!1132687))

(assert (= (and b!1132687 (not res!756345)) b!1132703))

(assert (= (and b!1132703 (not res!756350)) b!1132686))

(assert (= (and b!1132686 c!110573) b!1132704))

(assert (= (and b!1132686 (not c!110573)) b!1132702))

(assert (= (or b!1132704 b!1132702) bm!48691))

(assert (= (or b!1132704 b!1132702) bm!48692))

(assert (= (and b!1132686 (not res!756341)) b!1132699))

(assert (= (and b!1132699 (not res!756346)) b!1132710))

(assert (= (and b!1132710 c!110576) b!1132698))

(assert (= (and b!1132710 (not c!110576)) b!1132692))

(assert (= (and b!1132692 c!110574) b!1132707))

(assert (= (and b!1132692 (not c!110574)) b!1132690))

(assert (= (and b!1132690 c!110575) b!1132691))

(assert (= (and b!1132690 (not c!110575)) b!1132697))

(assert (= (or b!1132707 b!1132691) bm!48689))

(assert (= (or b!1132707 b!1132691) bm!48688))

(assert (= (or b!1132707 b!1132691) bm!48687))

(assert (= (or b!1132698 bm!48687) bm!48685))

(assert (= (or b!1132698 bm!48689) bm!48686))

(assert (= (or b!1132698 bm!48688) bm!48690))

(assert (= (and b!1132710 c!110572) b!1132693))

(assert (= (and b!1132710 (not c!110572)) b!1132689))

(assert (= (and b!1132711 condMapEmpty!44506) mapIsEmpty!44506))

(assert (= (and b!1132711 (not condMapEmpty!44506)) mapNonEmpty!44506))

(get-info :version)

(assert (= (and mapNonEmpty!44506 ((_ is ValueCellFull!13520) mapValue!44506)) b!1132709))

(assert (= (and b!1132711 ((_ is ValueCellFull!13520) mapDefault!44506)) b!1132695))

(assert (= start!98464 b!1132711))

(declare-fun b_lambda!18909 () Bool)

(assert (=> (not b_lambda!18909) (not b!1132703)))

(declare-fun t!35705 () Bool)

(declare-fun tb!8733 () Bool)

(assert (=> (and start!98464 (= defaultEntry!1004 defaultEntry!1004) t!35705) tb!8733))

(declare-fun result!18035 () Bool)

(assert (=> tb!8733 (= result!18035 tp_is_empty!28459)))

(assert (=> b!1132703 t!35705))

(declare-fun b_and!38653 () Bool)

(assert (= b_and!38651 (and (=> t!35705 result!18035) b_and!38653)))

(declare-fun m!1045983 () Bool)

(assert (=> b!1132687 m!1045983))

(declare-fun m!1045985 () Bool)

(assert (=> b!1132687 m!1045985))

(declare-fun m!1045987 () Bool)

(assert (=> b!1132688 m!1045987))

(declare-fun m!1045989 () Bool)

(assert (=> b!1132688 m!1045989))

(declare-fun m!1045991 () Bool)

(assert (=> b!1132699 m!1045991))

(declare-fun m!1045993 () Bool)

(assert (=> b!1132699 m!1045993))

(declare-fun m!1045995 () Bool)

(assert (=> b!1132700 m!1045995))

(declare-fun m!1045997 () Bool)

(assert (=> b!1132693 m!1045997))

(declare-fun m!1045999 () Bool)

(assert (=> bm!48691 m!1045999))

(declare-fun m!1046001 () Bool)

(assert (=> b!1132701 m!1046001))

(declare-fun m!1046003 () Bool)

(assert (=> b!1132694 m!1046003))

(declare-fun m!1046005 () Bool)

(assert (=> b!1132704 m!1046005))

(declare-fun m!1046007 () Bool)

(assert (=> b!1132686 m!1046007))

(declare-fun m!1046009 () Bool)

(assert (=> b!1132686 m!1046009))

(declare-fun m!1046011 () Bool)

(assert (=> start!98464 m!1046011))

(declare-fun m!1046013 () Bool)

(assert (=> start!98464 m!1046013))

(declare-fun m!1046015 () Bool)

(assert (=> bm!48685 m!1046015))

(declare-fun m!1046017 () Bool)

(assert (=> b!1132705 m!1046017))

(declare-fun m!1046019 () Bool)

(assert (=> b!1132698 m!1046019))

(declare-fun m!1046021 () Bool)

(assert (=> b!1132698 m!1046021))

(declare-fun m!1046023 () Bool)

(assert (=> b!1132698 m!1046023))

(declare-fun m!1046025 () Bool)

(assert (=> bm!48686 m!1046025))

(declare-fun m!1046027 () Bool)

(assert (=> b!1132710 m!1046027))

(assert (=> bm!48692 m!1045993))

(declare-fun m!1046029 () Bool)

(assert (=> b!1132685 m!1046029))

(declare-fun m!1046031 () Bool)

(assert (=> b!1132708 m!1046031))

(declare-fun m!1046033 () Bool)

(assert (=> b!1132703 m!1046033))

(declare-fun m!1046035 () Bool)

(assert (=> b!1132703 m!1046035))

(declare-fun m!1046037 () Bool)

(assert (=> b!1132703 m!1046037))

(declare-fun m!1046039 () Bool)

(assert (=> b!1132703 m!1046039))

(declare-fun m!1046041 () Bool)

(assert (=> bm!48690 m!1046041))

(declare-fun m!1046043 () Bool)

(assert (=> mapNonEmpty!44506 m!1046043))

(check-sat (not b!1132685) (not b!1132710) (not bm!48692) (not b!1132688) (not b!1132699) (not b!1132698) (not b!1132687) tp_is_empty!28459 (not b!1132703) (not b!1132686) (not b!1132708) b_and!38653 (not b!1132700) (not b_next!23929) (not bm!48685) (not bm!48691) (not b!1132694) (not mapNonEmpty!44506) (not b!1132701) (not b!1132693) (not bm!48690) (not b!1132704) (not b_lambda!18909) (not bm!48686) (not start!98464))
(check-sat b_and!38653 (not b_next!23929))
