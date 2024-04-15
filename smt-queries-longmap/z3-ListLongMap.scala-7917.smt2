; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98336 () Bool)

(assert start!98336)

(declare-fun b_free!23947 () Bool)

(declare-fun b_next!23947 () Bool)

(assert (=> start!98336 (= b_free!23947 (not b_next!23947))))

(declare-fun tp!84552 () Bool)

(declare-fun b_and!38721 () Bool)

(assert (=> start!98336 (= tp!84552 b_and!38721)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1132707 () Bool)

(declare-datatypes ((array!73738 0))(
  ( (array!73739 (arr!35520 (Array (_ BitVec 32) (_ BitVec 64))) (size!36058 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73738)

(declare-fun e!644650 () Bool)

(declare-fun arrayContainsKey!0 (array!73738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132707 (= e!644650 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1132708 () Bool)

(declare-fun e!644659 () Bool)

(declare-fun e!644663 () Bool)

(assert (=> b!1132708 (= e!644659 e!644663)))

(declare-fun res!756426 () Bool)

(assert (=> b!1132708 (=> res!756426 e!644663)))

(assert (=> b!1132708 (= res!756426 (not (= (select (arr!35520 _keys!1208) from!1455) k0!934)))))

(declare-fun e!644654 () Bool)

(assert (=> b!1132708 e!644654))

(declare-fun c!110483 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1132708 (= c!110483 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43097 0))(
  ( (V!43098 (val!14295 Int)) )
))
(declare-fun zeroValue!944 () V!43097)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!36960 0))(
  ( (Unit!36961) )
))
(declare-fun lt!503180 () Unit!36960)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13529 0))(
  ( (ValueCellFull!13529 (v!16931 V!43097)) (EmptyCell!13529) )
))
(declare-datatypes ((array!73740 0))(
  ( (array!73741 (arr!35521 (Array (_ BitVec 32) ValueCell!13529)) (size!36059 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73740)

(declare-fun minValue!944 () V!43097)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!443 (array!73738 array!73740 (_ BitVec 32) (_ BitVec 32) V!43097 V!43097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36960)

(assert (=> b!1132708 (= lt!503180 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!756421 () Bool)

(declare-fun e!644656 () Bool)

(assert (=> start!98336 (=> (not res!756421) (not e!644656))))

(assert (=> start!98336 (= res!756421 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36058 _keys!1208))))))

(assert (=> start!98336 e!644656))

(declare-fun tp_is_empty!28477 () Bool)

(assert (=> start!98336 tp_is_empty!28477))

(declare-fun array_inv!27318 (array!73738) Bool)

(assert (=> start!98336 (array_inv!27318 _keys!1208)))

(assert (=> start!98336 true))

(assert (=> start!98336 tp!84552))

(declare-fun e!644653 () Bool)

(declare-fun array_inv!27319 (array!73740) Bool)

(assert (=> start!98336 (and (array_inv!27319 _values!996) e!644653)))

(declare-fun bm!48880 () Bool)

(declare-datatypes ((tuple2!18108 0))(
  ( (tuple2!18109 (_1!9065 (_ BitVec 64)) (_2!9065 V!43097)) )
))
(declare-datatypes ((List!24856 0))(
  ( (Nil!24853) (Cons!24852 (h!26061 tuple2!18108) (t!35786 List!24856)) )
))
(declare-datatypes ((ListLongMap!16077 0))(
  ( (ListLongMap!16078 (toList!8054 List!24856)) )
))
(declare-fun call!48889 () ListLongMap!16077)

(declare-fun call!48886 () ListLongMap!16077)

(assert (=> bm!48880 (= call!48889 call!48886)))

(declare-fun b!1132709 () Bool)

(declare-fun e!644652 () Bool)

(assert (=> b!1132709 (= e!644652 tp_is_empty!28477)))

(declare-fun b!1132710 () Bool)

(declare-fun e!644664 () Unit!36960)

(declare-fun lt!503178 () Unit!36960)

(assert (=> b!1132710 (= e!644664 lt!503178)))

(declare-fun lt!503179 () Unit!36960)

(declare-fun call!48888 () Unit!36960)

(assert (=> b!1132710 (= lt!503179 call!48888)))

(declare-fun lt!503182 () ListLongMap!16077)

(assert (=> b!1132710 (= lt!503182 call!48886)))

(declare-fun call!48884 () Bool)

(assert (=> b!1132710 call!48884))

(declare-fun addStillContains!709 (ListLongMap!16077 (_ BitVec 64) V!43097 (_ BitVec 64)) Unit!36960)

(assert (=> b!1132710 (= lt!503178 (addStillContains!709 lt!503182 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6509 (ListLongMap!16077 (_ BitVec 64)) Bool)

(declare-fun +!3490 (ListLongMap!16077 tuple2!18108) ListLongMap!16077)

(assert (=> b!1132710 (contains!6509 (+!3490 lt!503182 (tuple2!18109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1132711 () Bool)

(declare-fun res!756425 () Bool)

(assert (=> b!1132711 (=> (not res!756425) (not e!644656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73738 (_ BitVec 32)) Bool)

(assert (=> b!1132711 (= res!756425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1132712 () Bool)

(declare-fun e!644661 () Bool)

(assert (=> b!1132712 (= e!644656 e!644661)))

(declare-fun res!756418 () Bool)

(assert (=> b!1132712 (=> (not res!756418) (not e!644661))))

(declare-fun lt!503184 () array!73738)

(assert (=> b!1132712 (= res!756418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503184 mask!1564))))

(assert (=> b!1132712 (= lt!503184 (array!73739 (store (arr!35520 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36058 _keys!1208)))))

(declare-fun b!1132713 () Bool)

(declare-fun res!756423 () Bool)

(assert (=> b!1132713 (=> (not res!756423) (not e!644656))))

(declare-datatypes ((List!24857 0))(
  ( (Nil!24854) (Cons!24853 (h!26062 (_ BitVec 64)) (t!35787 List!24857)) )
))
(declare-fun arrayNoDuplicates!0 (array!73738 (_ BitVec 32) List!24857) Bool)

(assert (=> b!1132713 (= res!756423 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24854))))

(declare-fun b!1132714 () Bool)

(declare-fun call!48887 () ListLongMap!16077)

(declare-fun call!48885 () ListLongMap!16077)

(assert (=> b!1132714 (= e!644654 (= call!48887 call!48885))))

(declare-fun bm!48881 () Bool)

(declare-fun c!110480 () Bool)

(declare-fun lt!503185 () ListLongMap!16077)

(declare-fun c!110482 () Bool)

(assert (=> bm!48881 (= call!48886 (+!3490 lt!503185 (ite (or c!110482 c!110480) (tuple2!18109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132715 () Bool)

(declare-fun res!756430 () Bool)

(assert (=> b!1132715 (=> (not res!756430) (not e!644656))))

(assert (=> b!1132715 (= res!756430 (and (= (size!36059 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36058 _keys!1208) (size!36059 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1132716 () Bool)

(declare-fun e!644657 () Bool)

(assert (=> b!1132716 (= e!644657 tp_is_empty!28477)))

(declare-fun mapNonEmpty!44540 () Bool)

(declare-fun mapRes!44540 () Bool)

(declare-fun tp!84551 () Bool)

(assert (=> mapNonEmpty!44540 (= mapRes!44540 (and tp!84551 e!644657))))

(declare-fun mapRest!44540 () (Array (_ BitVec 32) ValueCell!13529))

(declare-fun mapValue!44540 () ValueCell!13529)

(declare-fun mapKey!44540 () (_ BitVec 32))

(assert (=> mapNonEmpty!44540 (= (arr!35521 _values!996) (store mapRest!44540 mapKey!44540 mapValue!44540))))

(declare-fun lt!503187 () Bool)

(declare-fun b!1132717 () Bool)

(declare-fun e!644649 () Bool)

(assert (=> b!1132717 (= e!644649 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503187) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1132718 () Bool)

(declare-fun res!756417 () Bool)

(assert (=> b!1132718 (=> (not res!756417) (not e!644656))))

(assert (=> b!1132718 (= res!756417 (= (select (arr!35520 _keys!1208) i!673) k0!934))))

(declare-fun b!1132719 () Bool)

(declare-fun e!644662 () Unit!36960)

(declare-fun Unit!36962 () Unit!36960)

(assert (=> b!1132719 (= e!644662 Unit!36962)))

(declare-fun bm!48882 () Bool)

(declare-fun call!48883 () Bool)

(assert (=> bm!48882 (= call!48883 call!48884)))

(declare-fun bm!48883 () Bool)

(assert (=> bm!48883 (= call!48888 (addStillContains!709 lt!503185 (ite (or c!110482 c!110480) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110482 c!110480) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1132720 () Bool)

(declare-fun res!756419 () Bool)

(assert (=> b!1132720 (=> (not res!756419) (not e!644656))))

(assert (=> b!1132720 (= res!756419 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36058 _keys!1208))))))

(declare-fun b!1132721 () Bool)

(assert (=> b!1132721 (= e!644649 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!48884 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4553 (array!73738 array!73740 (_ BitVec 32) (_ BitVec 32) V!43097 V!43097 (_ BitVec 32) Int) ListLongMap!16077)

(assert (=> bm!48884 (= call!48885 (getCurrentListMapNoExtraKeys!4553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132722 () Bool)

(declare-fun -!1158 (ListLongMap!16077 (_ BitVec 64)) ListLongMap!16077)

(assert (=> b!1132722 (= e!644654 (= call!48887 (-!1158 call!48885 k0!934)))))

(declare-fun bm!48885 () Bool)

(declare-fun call!48890 () Unit!36960)

(assert (=> bm!48885 (= call!48890 call!48888)))

(declare-fun b!1132723 () Bool)

(declare-fun e!644655 () Bool)

(assert (=> b!1132723 (= e!644655 true)))

(assert (=> b!1132723 e!644650))

(declare-fun res!756431 () Bool)

(assert (=> b!1132723 (=> (not res!756431) (not e!644650))))

(assert (=> b!1132723 (= res!756431 e!644649)))

(declare-fun c!110481 () Bool)

(assert (=> b!1132723 (= c!110481 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503186 () Unit!36960)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!323 (array!73738 array!73740 (_ BitVec 32) (_ BitVec 32) V!43097 V!43097 (_ BitVec 64) (_ BitVec 32) Int) Unit!36960)

(assert (=> b!1132723 (= lt!503186 (lemmaListMapContainsThenArrayContainsFrom!323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503176 () Unit!36960)

(assert (=> b!1132723 (= lt!503176 e!644664)))

(assert (=> b!1132723 (= c!110482 (and (not lt!503187) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1132723 (= lt!503187 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1132724 () Bool)

(declare-fun e!644660 () Bool)

(assert (=> b!1132724 (= e!644661 (not e!644660))))

(declare-fun res!756427 () Bool)

(assert (=> b!1132724 (=> res!756427 e!644660)))

(assert (=> b!1132724 (= res!756427 (bvsgt from!1455 i!673))))

(assert (=> b!1132724 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503175 () Unit!36960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73738 (_ BitVec 64) (_ BitVec 32)) Unit!36960)

(assert (=> b!1132724 (= lt!503175 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1132725 () Bool)

(declare-fun res!756428 () Bool)

(assert (=> b!1132725 (=> (not res!756428) (not e!644656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1132725 (= res!756428 (validMask!0 mask!1564))))

(declare-fun b!1132726 () Bool)

(declare-fun c!110479 () Bool)

(assert (=> b!1132726 (= c!110479 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503187))))

(declare-fun e!644651 () Unit!36960)

(assert (=> b!1132726 (= e!644651 e!644662)))

(declare-fun b!1132727 () Bool)

(assert (=> b!1132727 (= e!644660 e!644659)))

(declare-fun res!756420 () Bool)

(assert (=> b!1132727 (=> res!756420 e!644659)))

(assert (=> b!1132727 (= res!756420 (not (= from!1455 i!673)))))

(declare-fun lt!503183 () ListLongMap!16077)

(declare-fun lt!503174 () array!73740)

(assert (=> b!1132727 (= lt!503183 (getCurrentListMapNoExtraKeys!4553 lt!503184 lt!503174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2552 (Int (_ BitVec 64)) V!43097)

(assert (=> b!1132727 (= lt!503174 (array!73741 (store (arr!35521 _values!996) i!673 (ValueCellFull!13529 (dynLambda!2552 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36059 _values!996)))))

(declare-fun lt!503173 () ListLongMap!16077)

(assert (=> b!1132727 (= lt!503173 (getCurrentListMapNoExtraKeys!4553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!48886 () Bool)

(assert (=> bm!48886 (= call!48887 (getCurrentListMapNoExtraKeys!4553 lt!503184 lt!503174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44540 () Bool)

(assert (=> mapIsEmpty!44540 mapRes!44540))

(declare-fun b!1132728 () Bool)

(declare-fun lt!503177 () Unit!36960)

(assert (=> b!1132728 (= e!644662 lt!503177)))

(assert (=> b!1132728 (= lt!503177 call!48890)))

(assert (=> b!1132728 call!48883))

(declare-fun bm!48887 () Bool)

(assert (=> bm!48887 (= call!48884 (contains!6509 (ite c!110482 lt!503182 call!48889) k0!934))))

(declare-fun b!1132729 () Bool)

(assert (=> b!1132729 (= e!644653 (and e!644652 mapRes!44540))))

(declare-fun condMapEmpty!44540 () Bool)

(declare-fun mapDefault!44540 () ValueCell!13529)

(assert (=> b!1132729 (= condMapEmpty!44540 (= (arr!35521 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13529)) mapDefault!44540)))))

(declare-fun b!1132730 () Bool)

(assert (=> b!1132730 call!48883))

(declare-fun lt!503181 () Unit!36960)

(assert (=> b!1132730 (= lt!503181 call!48890)))

(assert (=> b!1132730 (= e!644651 lt!503181)))

(declare-fun b!1132731 () Bool)

(declare-fun res!756429 () Bool)

(assert (=> b!1132731 (=> (not res!756429) (not e!644661))))

(assert (=> b!1132731 (= res!756429 (arrayNoDuplicates!0 lt!503184 #b00000000000000000000000000000000 Nil!24854))))

(declare-fun b!1132732 () Bool)

(assert (=> b!1132732 (= e!644664 e!644651)))

(assert (=> b!1132732 (= c!110480 (and (not lt!503187) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1132733 () Bool)

(declare-fun res!756422 () Bool)

(assert (=> b!1132733 (=> (not res!756422) (not e!644656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1132733 (= res!756422 (validKeyInArray!0 k0!934))))

(declare-fun b!1132734 () Bool)

(assert (=> b!1132734 (= e!644663 e!644655)))

(declare-fun res!756424 () Bool)

(assert (=> b!1132734 (=> res!756424 e!644655)))

(assert (=> b!1132734 (= res!756424 (not (contains!6509 lt!503185 k0!934)))))

(assert (=> b!1132734 (= lt!503185 (getCurrentListMapNoExtraKeys!4553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98336 res!756421) b!1132725))

(assert (= (and b!1132725 res!756428) b!1132715))

(assert (= (and b!1132715 res!756430) b!1132711))

(assert (= (and b!1132711 res!756425) b!1132713))

(assert (= (and b!1132713 res!756423) b!1132720))

(assert (= (and b!1132720 res!756419) b!1132733))

(assert (= (and b!1132733 res!756422) b!1132718))

(assert (= (and b!1132718 res!756417) b!1132712))

(assert (= (and b!1132712 res!756418) b!1132731))

(assert (= (and b!1132731 res!756429) b!1132724))

(assert (= (and b!1132724 (not res!756427)) b!1132727))

(assert (= (and b!1132727 (not res!756420)) b!1132708))

(assert (= (and b!1132708 c!110483) b!1132722))

(assert (= (and b!1132708 (not c!110483)) b!1132714))

(assert (= (or b!1132722 b!1132714) bm!48886))

(assert (= (or b!1132722 b!1132714) bm!48884))

(assert (= (and b!1132708 (not res!756426)) b!1132734))

(assert (= (and b!1132734 (not res!756424)) b!1132723))

(assert (= (and b!1132723 c!110482) b!1132710))

(assert (= (and b!1132723 (not c!110482)) b!1132732))

(assert (= (and b!1132732 c!110480) b!1132730))

(assert (= (and b!1132732 (not c!110480)) b!1132726))

(assert (= (and b!1132726 c!110479) b!1132728))

(assert (= (and b!1132726 (not c!110479)) b!1132719))

(assert (= (or b!1132730 b!1132728) bm!48885))

(assert (= (or b!1132730 b!1132728) bm!48880))

(assert (= (or b!1132730 b!1132728) bm!48882))

(assert (= (or b!1132710 bm!48882) bm!48887))

(assert (= (or b!1132710 bm!48885) bm!48883))

(assert (= (or b!1132710 bm!48880) bm!48881))

(assert (= (and b!1132723 c!110481) b!1132721))

(assert (= (and b!1132723 (not c!110481)) b!1132717))

(assert (= (and b!1132723 res!756431) b!1132707))

(assert (= (and b!1132729 condMapEmpty!44540) mapIsEmpty!44540))

(assert (= (and b!1132729 (not condMapEmpty!44540)) mapNonEmpty!44540))

(get-info :version)

(assert (= (and mapNonEmpty!44540 ((_ is ValueCellFull!13529) mapValue!44540)) b!1132716))

(assert (= (and b!1132729 ((_ is ValueCellFull!13529) mapDefault!44540)) b!1132709))

(assert (= start!98336 b!1132729))

(declare-fun b_lambda!19035 () Bool)

(assert (=> (not b_lambda!19035) (not b!1132727)))

(declare-fun t!35785 () Bool)

(declare-fun tb!8751 () Bool)

(assert (=> (and start!98336 (= defaultEntry!1004 defaultEntry!1004) t!35785) tb!8751))

(declare-fun result!18075 () Bool)

(assert (=> tb!8751 (= result!18075 tp_is_empty!28477)))

(assert (=> b!1132727 t!35785))

(declare-fun b_and!38723 () Bool)

(assert (= b_and!38721 (and (=> t!35785 result!18075) b_and!38723)))

(declare-fun m!1045477 () Bool)

(assert (=> b!1132710 m!1045477))

(declare-fun m!1045479 () Bool)

(assert (=> b!1132710 m!1045479))

(assert (=> b!1132710 m!1045479))

(declare-fun m!1045481 () Bool)

(assert (=> b!1132710 m!1045481))

(declare-fun m!1045483 () Bool)

(assert (=> b!1132707 m!1045483))

(declare-fun m!1045485 () Bool)

(assert (=> start!98336 m!1045485))

(declare-fun m!1045487 () Bool)

(assert (=> start!98336 m!1045487))

(declare-fun m!1045489 () Bool)

(assert (=> b!1132708 m!1045489))

(declare-fun m!1045491 () Bool)

(assert (=> b!1132708 m!1045491))

(assert (=> b!1132721 m!1045483))

(declare-fun m!1045493 () Bool)

(assert (=> b!1132723 m!1045493))

(declare-fun m!1045495 () Bool)

(assert (=> bm!48887 m!1045495))

(declare-fun m!1045497 () Bool)

(assert (=> b!1132718 m!1045497))

(declare-fun m!1045499 () Bool)

(assert (=> b!1132711 m!1045499))

(declare-fun m!1045501 () Bool)

(assert (=> b!1132733 m!1045501))

(declare-fun m!1045503 () Bool)

(assert (=> b!1132724 m!1045503))

(declare-fun m!1045505 () Bool)

(assert (=> b!1132724 m!1045505))

(declare-fun m!1045507 () Bool)

(assert (=> bm!48881 m!1045507))

(declare-fun m!1045509 () Bool)

(assert (=> bm!48884 m!1045509))

(declare-fun m!1045511 () Bool)

(assert (=> b!1132731 m!1045511))

(declare-fun m!1045513 () Bool)

(assert (=> bm!48883 m!1045513))

(declare-fun m!1045515 () Bool)

(assert (=> mapNonEmpty!44540 m!1045515))

(declare-fun m!1045517 () Bool)

(assert (=> b!1132734 m!1045517))

(assert (=> b!1132734 m!1045509))

(declare-fun m!1045519 () Bool)

(assert (=> b!1132722 m!1045519))

(declare-fun m!1045521 () Bool)

(assert (=> b!1132712 m!1045521))

(declare-fun m!1045523 () Bool)

(assert (=> b!1132712 m!1045523))

(declare-fun m!1045525 () Bool)

(assert (=> b!1132727 m!1045525))

(declare-fun m!1045527 () Bool)

(assert (=> b!1132727 m!1045527))

(declare-fun m!1045529 () Bool)

(assert (=> b!1132727 m!1045529))

(declare-fun m!1045531 () Bool)

(assert (=> b!1132727 m!1045531))

(declare-fun m!1045533 () Bool)

(assert (=> b!1132725 m!1045533))

(declare-fun m!1045535 () Bool)

(assert (=> bm!48886 m!1045535))

(declare-fun m!1045537 () Bool)

(assert (=> b!1132713 m!1045537))

(check-sat (not b!1132731) (not bm!48884) (not bm!48881) (not b!1132708) b_and!38723 (not b!1132724) (not b!1132721) (not b_lambda!19035) (not mapNonEmpty!44540) tp_is_empty!28477 (not b!1132710) (not b_next!23947) (not b!1132727) (not start!98336) (not b!1132733) (not b!1132712) (not bm!48883) (not b!1132723) (not b!1132713) (not bm!48887) (not b!1132722) (not bm!48886) (not b!1132734) (not b!1132725) (not b!1132707) (not b!1132711))
(check-sat b_and!38723 (not b_next!23947))
