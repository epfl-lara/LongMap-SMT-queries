; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98534 () Bool)

(assert start!98534)

(declare-fun b_free!24145 () Bool)

(declare-fun b_next!24145 () Bool)

(assert (=> start!98534 (= b_free!24145 (not b_next!24145))))

(declare-fun tp!85145 () Bool)

(declare-fun b_and!39117 () Bool)

(assert (=> start!98534 (= tp!85145 b_and!39117)))

(declare-fun b!1141637 () Bool)

(declare-fun e!649491 () Bool)

(declare-fun e!649494 () Bool)

(declare-fun mapRes!44837 () Bool)

(assert (=> b!1141637 (= e!649491 (and e!649494 mapRes!44837))))

(declare-fun condMapEmpty!44837 () Bool)

(declare-datatypes ((V!43361 0))(
  ( (V!43362 (val!14394 Int)) )
))
(declare-datatypes ((ValueCell!13628 0))(
  ( (ValueCellFull!13628 (v!17030 V!43361)) (EmptyCell!13628) )
))
(declare-datatypes ((array!74132 0))(
  ( (array!74133 (arr!35717 (Array (_ BitVec 32) ValueCell!13628)) (size!36255 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74132)

(declare-fun mapDefault!44837 () ValueCell!13628)

(assert (=> b!1141637 (= condMapEmpty!44837 (= (arr!35717 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13628)) mapDefault!44837)))))

(declare-fun b!1141638 () Bool)

(declare-fun e!649482 () Bool)

(declare-fun e!649484 () Bool)

(assert (=> b!1141638 (= e!649482 (not e!649484))))

(declare-fun res!760948 () Bool)

(assert (=> b!1141638 (=> res!760948 e!649484)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141638 (= res!760948 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74134 0))(
  ( (array!74135 (arr!35718 (Array (_ BitVec 32) (_ BitVec 64))) (size!36256 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74134)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141638 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37311 0))(
  ( (Unit!37312) )
))
(declare-fun lt!508583 () Unit!37311)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74134 (_ BitVec 64) (_ BitVec 32)) Unit!37311)

(assert (=> b!1141638 (= lt!508583 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1141639 () Bool)

(declare-fun e!649490 () Bool)

(assert (=> b!1141639 (= e!649490 e!649482)))

(declare-fun res!760953 () Bool)

(assert (=> b!1141639 (=> (not res!760953) (not e!649482))))

(declare-fun lt!508572 () array!74134)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74134 (_ BitVec 32)) Bool)

(assert (=> b!1141639 (= res!760953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508572 mask!1564))))

(assert (=> b!1141639 (= lt!508572 (array!74135 (store (arr!35718 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36256 _keys!1208)))))

(declare-fun zeroValue!944 () V!43361)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18300 0))(
  ( (tuple2!18301 (_1!9161 (_ BitVec 64)) (_2!9161 V!43361)) )
))
(declare-datatypes ((List!25039 0))(
  ( (Nil!25036) (Cons!25035 (h!26244 tuple2!18300) (t!36167 List!25039)) )
))
(declare-datatypes ((ListLongMap!16269 0))(
  ( (ListLongMap!16270 (toList!8150 List!25039)) )
))
(declare-fun call!51260 () ListLongMap!16269)

(declare-fun bm!51256 () Bool)

(declare-fun minValue!944 () V!43361)

(declare-fun getCurrentListMapNoExtraKeys!4642 (array!74134 array!74132 (_ BitVec 32) (_ BitVec 32) V!43361 V!43361 (_ BitVec 32) Int) ListLongMap!16269)

(assert (=> bm!51256 (= call!51260 (getCurrentListMapNoExtraKeys!4642 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44837 () Bool)

(declare-fun tp!85146 () Bool)

(declare-fun e!649485 () Bool)

(assert (=> mapNonEmpty!44837 (= mapRes!44837 (and tp!85146 e!649485))))

(declare-fun mapRest!44837 () (Array (_ BitVec 32) ValueCell!13628))

(declare-fun mapKey!44837 () (_ BitVec 32))

(declare-fun mapValue!44837 () ValueCell!13628)

(assert (=> mapNonEmpty!44837 (= (arr!35717 _values!996) (store mapRest!44837 mapKey!44837 mapValue!44837))))

(declare-fun call!51263 () ListLongMap!16269)

(declare-fun b!1141640 () Bool)

(declare-fun e!649488 () Bool)

(declare-fun -!1234 (ListLongMap!16269 (_ BitVec 64)) ListLongMap!16269)

(assert (=> b!1141640 (= e!649488 (= call!51263 (-!1234 call!51260 k0!934)))))

(declare-fun res!760949 () Bool)

(assert (=> start!98534 (=> (not res!760949) (not e!649490))))

(assert (=> start!98534 (= res!760949 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36256 _keys!1208))))))

(assert (=> start!98534 e!649490))

(declare-fun tp_is_empty!28675 () Bool)

(assert (=> start!98534 tp_is_empty!28675))

(declare-fun array_inv!27450 (array!74134) Bool)

(assert (=> start!98534 (array_inv!27450 _keys!1208)))

(assert (=> start!98534 true))

(assert (=> start!98534 tp!85145))

(declare-fun array_inv!27451 (array!74132) Bool)

(assert (=> start!98534 (and (array_inv!27451 _values!996) e!649491)))

(declare-fun bm!51257 () Bool)

(declare-fun call!51265 () ListLongMap!16269)

(declare-fun call!51259 () ListLongMap!16269)

(assert (=> bm!51257 (= call!51265 call!51259)))

(declare-fun b!1141641 () Bool)

(declare-fun res!760954 () Bool)

(assert (=> b!1141641 (=> (not res!760954) (not e!649490))))

(assert (=> b!1141641 (= res!760954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1141642 () Bool)

(declare-fun c!112137 () Bool)

(declare-fun lt!508575 () Bool)

(assert (=> b!1141642 (= c!112137 (and (not lt!508575) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649495 () Unit!37311)

(declare-fun e!649492 () Unit!37311)

(assert (=> b!1141642 (= e!649495 e!649492)))

(declare-fun b!1141643 () Bool)

(declare-fun res!760947 () Bool)

(assert (=> b!1141643 (=> (not res!760947) (not e!649490))))

(assert (=> b!1141643 (= res!760947 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36256 _keys!1208))))))

(declare-fun bm!51258 () Bool)

(declare-fun call!51261 () Bool)

(declare-fun c!112142 () Bool)

(declare-fun lt!508584 () ListLongMap!16269)

(declare-fun contains!6621 (ListLongMap!16269 (_ BitVec 64)) Bool)

(assert (=> bm!51258 (= call!51261 (contains!6621 (ite c!112142 lt!508584 call!51265) k0!934))))

(declare-fun e!649487 () Bool)

(declare-fun b!1141644 () Bool)

(assert (=> b!1141644 (= e!649487 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508575) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141645 () Bool)

(declare-fun res!760951 () Bool)

(assert (=> b!1141645 (=> (not res!760951) (not e!649490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141645 (= res!760951 (validMask!0 mask!1564))))

(declare-fun bm!51259 () Bool)

(declare-fun call!51266 () Bool)

(assert (=> bm!51259 (= call!51266 call!51261)))

(declare-fun e!649486 () Bool)

(declare-fun b!1141646 () Bool)

(assert (=> b!1141646 (= e!649486 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141647 () Bool)

(declare-fun lt!508585 () Unit!37311)

(assert (=> b!1141647 (= e!649492 lt!508585)))

(declare-fun call!51264 () Unit!37311)

(assert (=> b!1141647 (= lt!508585 call!51264)))

(assert (=> b!1141647 call!51266))

(declare-fun b!1141648 () Bool)

(declare-fun e!649497 () Bool)

(assert (=> b!1141648 (= e!649484 e!649497)))

(declare-fun res!760942 () Bool)

(assert (=> b!1141648 (=> res!760942 e!649497)))

(assert (=> b!1141648 (= res!760942 (not (= from!1455 i!673)))))

(declare-fun lt!508568 () array!74132)

(declare-fun lt!508574 () ListLongMap!16269)

(assert (=> b!1141648 (= lt!508574 (getCurrentListMapNoExtraKeys!4642 lt!508572 lt!508568 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!508587 () V!43361)

(assert (=> b!1141648 (= lt!508568 (array!74133 (store (arr!35717 _values!996) i!673 (ValueCellFull!13628 lt!508587)) (size!36255 _values!996)))))

(declare-fun dynLambda!2622 (Int (_ BitVec 64)) V!43361)

(assert (=> b!1141648 (= lt!508587 (dynLambda!2622 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508582 () ListLongMap!16269)

(assert (=> b!1141648 (= lt!508582 (getCurrentListMapNoExtraKeys!4642 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141649 () Bool)

(assert (=> b!1141649 (= e!649494 tp_is_empty!28675)))

(declare-fun b!1141650 () Bool)

(declare-fun e!649496 () Bool)

(assert (=> b!1141650 (= e!649496 true)))

(declare-fun lt!508567 () ListLongMap!16269)

(declare-fun lt!508576 () V!43361)

(declare-fun +!3576 (ListLongMap!16269 tuple2!18300) ListLongMap!16269)

(assert (=> b!1141650 (= (-!1234 (+!3576 lt!508567 (tuple2!18301 (select (arr!35718 _keys!1208) from!1455) lt!508576)) (select (arr!35718 _keys!1208) from!1455)) lt!508567)))

(declare-fun lt!508580 () Unit!37311)

(declare-fun addThenRemoveForNewKeyIsSame!100 (ListLongMap!16269 (_ BitVec 64) V!43361) Unit!37311)

(assert (=> b!1141650 (= lt!508580 (addThenRemoveForNewKeyIsSame!100 lt!508567 (select (arr!35718 _keys!1208) from!1455) lt!508576))))

(declare-fun get!18162 (ValueCell!13628 V!43361) V!43361)

(assert (=> b!1141650 (= lt!508576 (get!18162 (select (arr!35717 _values!996) from!1455) lt!508587))))

(declare-fun lt!508571 () Unit!37311)

(declare-fun e!649493 () Unit!37311)

(assert (=> b!1141650 (= lt!508571 e!649493)))

(declare-fun c!112141 () Bool)

(assert (=> b!1141650 (= c!112141 (contains!6621 lt!508567 k0!934))))

(assert (=> b!1141650 (= lt!508567 (getCurrentListMapNoExtraKeys!4642 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141651 () Bool)

(declare-fun res!760950 () Bool)

(assert (=> b!1141651 (=> (not res!760950) (not e!649490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141651 (= res!760950 (validKeyInArray!0 k0!934))))

(declare-fun b!1141652 () Bool)

(declare-fun Unit!37313 () Unit!37311)

(assert (=> b!1141652 (= e!649493 Unit!37313)))

(declare-fun bm!51260 () Bool)

(assert (=> bm!51260 (= call!51263 (getCurrentListMapNoExtraKeys!4642 lt!508572 lt!508568 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141653 () Bool)

(assert (=> b!1141653 (= e!649488 (= call!51263 call!51260))))

(declare-fun b!1141654 () Bool)

(declare-fun e!649483 () Unit!37311)

(declare-fun Unit!37314 () Unit!37311)

(assert (=> b!1141654 (= e!649483 Unit!37314)))

(declare-fun b!1141655 () Bool)

(declare-fun res!760955 () Bool)

(assert (=> b!1141655 (=> (not res!760955) (not e!649482))))

(declare-datatypes ((List!25040 0))(
  ( (Nil!25037) (Cons!25036 (h!26245 (_ BitVec 64)) (t!36168 List!25040)) )
))
(declare-fun arrayNoDuplicates!0 (array!74134 (_ BitVec 32) List!25040) Bool)

(assert (=> b!1141655 (= res!760955 (arrayNoDuplicates!0 lt!508572 #b00000000000000000000000000000000 Nil!25037))))

(declare-fun b!1141656 () Bool)

(declare-fun res!760944 () Bool)

(assert (=> b!1141656 (=> (not res!760944) (not e!649490))))

(assert (=> b!1141656 (= res!760944 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25037))))

(declare-fun bm!51261 () Bool)

(assert (=> bm!51261 (= call!51259 (+!3576 lt!508567 (ite (or c!112142 c!112137) (tuple2!18301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1141657 () Bool)

(declare-fun Unit!37315 () Unit!37311)

(assert (=> b!1141657 (= e!649493 Unit!37315)))

(assert (=> b!1141657 (= lt!508575 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1141657 (= c!112142 (and (not lt!508575) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508577 () Unit!37311)

(assert (=> b!1141657 (= lt!508577 e!649495)))

(declare-fun lt!508579 () Unit!37311)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!392 (array!74134 array!74132 (_ BitVec 32) (_ BitVec 32) V!43361 V!43361 (_ BitVec 64) (_ BitVec 32) Int) Unit!37311)

(assert (=> b!1141657 (= lt!508579 (lemmaListMapContainsThenArrayContainsFrom!392 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112139 () Bool)

(assert (=> b!1141657 (= c!112139 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760946 () Bool)

(assert (=> b!1141657 (= res!760946 e!649487)))

(assert (=> b!1141657 (=> (not res!760946) (not e!649486))))

(assert (=> b!1141657 e!649486))

(declare-fun lt!508569 () Unit!37311)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74134 (_ BitVec 32) (_ BitVec 32)) Unit!37311)

(assert (=> b!1141657 (= lt!508569 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1141657 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25037)))

(declare-fun lt!508586 () Unit!37311)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74134 (_ BitVec 64) (_ BitVec 32) List!25040) Unit!37311)

(assert (=> b!1141657 (= lt!508586 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25037))))

(assert (=> b!1141657 false))

(declare-fun b!1141658 () Bool)

(declare-fun res!760945 () Bool)

(assert (=> b!1141658 (=> (not res!760945) (not e!649490))))

(assert (=> b!1141658 (= res!760945 (and (= (size!36255 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36256 _keys!1208) (size!36255 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1141659 () Bool)

(assert (=> b!1141659 (contains!6621 (+!3576 lt!508584 (tuple2!18301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!508578 () Unit!37311)

(declare-fun call!51262 () Unit!37311)

(assert (=> b!1141659 (= lt!508578 call!51262)))

(assert (=> b!1141659 call!51261))

(assert (=> b!1141659 (= lt!508584 call!51259)))

(declare-fun lt!508573 () Unit!37311)

(declare-fun addStillContains!790 (ListLongMap!16269 (_ BitVec 64) V!43361 (_ BitVec 64)) Unit!37311)

(assert (=> b!1141659 (= lt!508573 (addStillContains!790 lt!508567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1141659 (= e!649495 lt!508578)))

(declare-fun b!1141660 () Bool)

(assert (=> b!1141660 (= e!649497 e!649496)))

(declare-fun res!760943 () Bool)

(assert (=> b!1141660 (=> res!760943 e!649496)))

(assert (=> b!1141660 (= res!760943 (not (= (select (arr!35718 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1141660 e!649488))

(declare-fun c!112140 () Bool)

(assert (=> b!1141660 (= c!112140 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508570 () Unit!37311)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!515 (array!74134 array!74132 (_ BitVec 32) (_ BitVec 32) V!43361 V!43361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37311)

(assert (=> b!1141660 (= lt!508570 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51262 () Bool)

(assert (=> bm!51262 (= call!51262 (addStillContains!790 (ite c!112142 lt!508584 lt!508567) (ite c!112142 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112137 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112142 minValue!944 (ite c!112137 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapIsEmpty!44837 () Bool)

(assert (=> mapIsEmpty!44837 mapRes!44837))

(declare-fun b!1141661 () Bool)

(assert (=> b!1141661 (= e!649492 e!649483)))

(declare-fun c!112138 () Bool)

(assert (=> b!1141661 (= c!112138 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508575))))

(declare-fun b!1141662 () Bool)

(assert (=> b!1141662 (= e!649485 tp_is_empty!28675)))

(declare-fun b!1141663 () Bool)

(assert (=> b!1141663 call!51266))

(declare-fun lt!508581 () Unit!37311)

(assert (=> b!1141663 (= lt!508581 call!51264)))

(assert (=> b!1141663 (= e!649483 lt!508581)))

(declare-fun b!1141664 () Bool)

(assert (=> b!1141664 (= e!649487 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141665 () Bool)

(declare-fun res!760952 () Bool)

(assert (=> b!1141665 (=> (not res!760952) (not e!649490))))

(assert (=> b!1141665 (= res!760952 (= (select (arr!35718 _keys!1208) i!673) k0!934))))

(declare-fun bm!51263 () Bool)

(assert (=> bm!51263 (= call!51264 call!51262)))

(assert (= (and start!98534 res!760949) b!1141645))

(assert (= (and b!1141645 res!760951) b!1141658))

(assert (= (and b!1141658 res!760945) b!1141641))

(assert (= (and b!1141641 res!760954) b!1141656))

(assert (= (and b!1141656 res!760944) b!1141643))

(assert (= (and b!1141643 res!760947) b!1141651))

(assert (= (and b!1141651 res!760950) b!1141665))

(assert (= (and b!1141665 res!760952) b!1141639))

(assert (= (and b!1141639 res!760953) b!1141655))

(assert (= (and b!1141655 res!760955) b!1141638))

(assert (= (and b!1141638 (not res!760948)) b!1141648))

(assert (= (and b!1141648 (not res!760942)) b!1141660))

(assert (= (and b!1141660 c!112140) b!1141640))

(assert (= (and b!1141660 (not c!112140)) b!1141653))

(assert (= (or b!1141640 b!1141653) bm!51260))

(assert (= (or b!1141640 b!1141653) bm!51256))

(assert (= (and b!1141660 (not res!760943)) b!1141650))

(assert (= (and b!1141650 c!112141) b!1141657))

(assert (= (and b!1141650 (not c!112141)) b!1141652))

(assert (= (and b!1141657 c!112142) b!1141659))

(assert (= (and b!1141657 (not c!112142)) b!1141642))

(assert (= (and b!1141642 c!112137) b!1141647))

(assert (= (and b!1141642 (not c!112137)) b!1141661))

(assert (= (and b!1141661 c!112138) b!1141663))

(assert (= (and b!1141661 (not c!112138)) b!1141654))

(assert (= (or b!1141647 b!1141663) bm!51263))

(assert (= (or b!1141647 b!1141663) bm!51257))

(assert (= (or b!1141647 b!1141663) bm!51259))

(assert (= (or b!1141659 bm!51259) bm!51258))

(assert (= (or b!1141659 bm!51263) bm!51262))

(assert (= (or b!1141659 bm!51257) bm!51261))

(assert (= (and b!1141657 c!112139) b!1141664))

(assert (= (and b!1141657 (not c!112139)) b!1141644))

(assert (= (and b!1141657 res!760946) b!1141646))

(assert (= (and b!1141637 condMapEmpty!44837) mapIsEmpty!44837))

(assert (= (and b!1141637 (not condMapEmpty!44837)) mapNonEmpty!44837))

(get-info :version)

(assert (= (and mapNonEmpty!44837 ((_ is ValueCellFull!13628) mapValue!44837)) b!1141662))

(assert (= (and b!1141637 ((_ is ValueCellFull!13628) mapDefault!44837)) b!1141649))

(assert (= start!98534 b!1141637))

(declare-fun b_lambda!19233 () Bool)

(assert (=> (not b_lambda!19233) (not b!1141648)))

(declare-fun t!36166 () Bool)

(declare-fun tb!8949 () Bool)

(assert (=> (and start!98534 (= defaultEntry!1004 defaultEntry!1004) t!36166) tb!8949))

(declare-fun result!18471 () Bool)

(assert (=> tb!8949 (= result!18471 tp_is_empty!28675)))

(assert (=> b!1141648 t!36166))

(declare-fun b_and!39119 () Bool)

(assert (= b_and!39117 (and (=> t!36166 result!18471) b_and!39119)))

(declare-fun m!1052509 () Bool)

(assert (=> b!1141659 m!1052509))

(assert (=> b!1141659 m!1052509))

(declare-fun m!1052511 () Bool)

(assert (=> b!1141659 m!1052511))

(declare-fun m!1052513 () Bool)

(assert (=> b!1141659 m!1052513))

(declare-fun m!1052515 () Bool)

(assert (=> b!1141641 m!1052515))

(declare-fun m!1052517 () Bool)

(assert (=> bm!51258 m!1052517))

(declare-fun m!1052519 () Bool)

(assert (=> bm!51262 m!1052519))

(declare-fun m!1052521 () Bool)

(assert (=> b!1141638 m!1052521))

(declare-fun m!1052523 () Bool)

(assert (=> b!1141638 m!1052523))

(declare-fun m!1052525 () Bool)

(assert (=> b!1141656 m!1052525))

(declare-fun m!1052527 () Bool)

(assert (=> b!1141665 m!1052527))

(declare-fun m!1052529 () Bool)

(assert (=> start!98534 m!1052529))

(declare-fun m!1052531 () Bool)

(assert (=> start!98534 m!1052531))

(declare-fun m!1052533 () Bool)

(assert (=> b!1141646 m!1052533))

(declare-fun m!1052535 () Bool)

(assert (=> b!1141640 m!1052535))

(declare-fun m!1052537 () Bool)

(assert (=> mapNonEmpty!44837 m!1052537))

(assert (=> b!1141664 m!1052533))

(declare-fun m!1052539 () Bool)

(assert (=> b!1141639 m!1052539))

(declare-fun m!1052541 () Bool)

(assert (=> b!1141639 m!1052541))

(declare-fun m!1052543 () Bool)

(assert (=> b!1141645 m!1052543))

(declare-fun m!1052545 () Bool)

(assert (=> b!1141657 m!1052545))

(declare-fun m!1052547 () Bool)

(assert (=> b!1141657 m!1052547))

(declare-fun m!1052549 () Bool)

(assert (=> b!1141657 m!1052549))

(declare-fun m!1052551 () Bool)

(assert (=> b!1141657 m!1052551))

(declare-fun m!1052553 () Bool)

(assert (=> bm!51256 m!1052553))

(assert (=> b!1141650 m!1052553))

(declare-fun m!1052555 () Bool)

(assert (=> b!1141650 m!1052555))

(declare-fun m!1052557 () Bool)

(assert (=> b!1141650 m!1052557))

(declare-fun m!1052559 () Bool)

(assert (=> b!1141650 m!1052559))

(declare-fun m!1052561 () Bool)

(assert (=> b!1141650 m!1052561))

(assert (=> b!1141650 m!1052555))

(declare-fun m!1052563 () Bool)

(assert (=> b!1141650 m!1052563))

(assert (=> b!1141650 m!1052557))

(declare-fun m!1052565 () Bool)

(assert (=> b!1141650 m!1052565))

(assert (=> b!1141650 m!1052561))

(declare-fun m!1052567 () Bool)

(assert (=> b!1141650 m!1052567))

(assert (=> b!1141650 m!1052557))

(declare-fun m!1052569 () Bool)

(assert (=> bm!51260 m!1052569))

(declare-fun m!1052571 () Bool)

(assert (=> b!1141648 m!1052571))

(declare-fun m!1052573 () Bool)

(assert (=> b!1141648 m!1052573))

(declare-fun m!1052575 () Bool)

(assert (=> b!1141648 m!1052575))

(declare-fun m!1052577 () Bool)

(assert (=> b!1141648 m!1052577))

(declare-fun m!1052579 () Bool)

(assert (=> b!1141651 m!1052579))

(assert (=> b!1141660 m!1052557))

(declare-fun m!1052581 () Bool)

(assert (=> b!1141660 m!1052581))

(declare-fun m!1052583 () Bool)

(assert (=> bm!51261 m!1052583))

(declare-fun m!1052585 () Bool)

(assert (=> b!1141655 m!1052585))

(check-sat b_and!39119 (not b!1141638) (not bm!51258) (not b!1141656) (not bm!51260) (not b_lambda!19233) (not bm!51262) (not b_next!24145) (not b!1141651) (not bm!51261) (not start!98534) (not b!1141650) (not b!1141655) (not b!1141646) (not b!1141645) (not b!1141639) (not b!1141664) (not b!1141648) (not b!1141659) tp_is_empty!28675 (not b!1141657) (not b!1141640) (not bm!51256) (not b!1141641) (not mapNonEmpty!44837) (not b!1141660))
(check-sat b_and!39119 (not b_next!24145))
