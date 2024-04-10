; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98380 () Bool)

(assert start!98380)

(declare-fun b_free!23985 () Bool)

(declare-fun b_next!23985 () Bool)

(assert (=> start!98380 (= b_free!23985 (not b_next!23985))))

(declare-fun tp!84665 () Bool)

(declare-fun b_and!38819 () Bool)

(assert (=> start!98380 (= tp!84665 b_and!38819)))

(declare-fun b!1134507 () Bool)

(declare-fun e!645662 () Bool)

(assert (=> b!1134507 (= e!645662 true)))

(declare-fun lt!504250 () Bool)

(declare-datatypes ((List!24816 0))(
  ( (Nil!24813) (Cons!24812 (h!26021 (_ BitVec 64)) (t!35793 List!24816)) )
))
(declare-fun contains!6554 (List!24816 (_ BitVec 64)) Bool)

(assert (=> b!1134507 (= lt!504250 (contains!6554 Nil!24813 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134508 () Bool)

(declare-fun res!757384 () Bool)

(assert (=> b!1134508 (=> res!757384 e!645662)))

(declare-fun noDuplicate!1592 (List!24816) Bool)

(assert (=> b!1134508 (= res!757384 (not (noDuplicate!1592 Nil!24813)))))

(declare-datatypes ((V!43147 0))(
  ( (V!43148 (val!14314 Int)) )
))
(declare-fun zeroValue!944 () V!43147)

(declare-fun bm!49359 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13548 0))(
  ( (ValueCellFull!13548 (v!16951 V!43147)) (EmptyCell!13548) )
))
(declare-datatypes ((array!73891 0))(
  ( (array!73892 (arr!35596 (Array (_ BitVec 32) ValueCell!13548)) (size!36132 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73891)

(declare-fun minValue!944 () V!43147)

(declare-datatypes ((tuple2!18058 0))(
  ( (tuple2!18059 (_1!9040 (_ BitVec 64)) (_2!9040 V!43147)) )
))
(declare-datatypes ((List!24817 0))(
  ( (Nil!24814) (Cons!24813 (h!26022 tuple2!18058) (t!35794 List!24817)) )
))
(declare-datatypes ((ListLongMap!16027 0))(
  ( (ListLongMap!16028 (toList!8029 List!24817)) )
))
(declare-fun call!49369 () ListLongMap!16027)

(declare-datatypes ((array!73893 0))(
  ( (array!73894 (arr!35597 (Array (_ BitVec 32) (_ BitVec 64))) (size!36133 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73893)

(declare-fun getCurrentListMapNoExtraKeys!4515 (array!73893 array!73891 (_ BitVec 32) (_ BitVec 32) V!43147 V!43147 (_ BitVec 32) Int) ListLongMap!16027)

(assert (=> bm!49359 (= call!49369 (getCurrentListMapNoExtraKeys!4515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134509 () Bool)

(declare-fun e!645658 () Bool)

(declare-fun tp_is_empty!28515 () Bool)

(assert (=> b!1134509 (= e!645658 tp_is_empty!28515)))

(declare-fun b!1134510 () Bool)

(declare-datatypes ((Unit!37171 0))(
  ( (Unit!37172) )
))
(declare-fun e!645664 () Unit!37171)

(declare-fun Unit!37173 () Unit!37171)

(assert (=> b!1134510 (= e!645664 Unit!37173)))

(declare-fun b!1134511 () Bool)

(declare-fun res!757388 () Bool)

(declare-fun e!645661 () Bool)

(assert (=> b!1134511 (=> (not res!757388) (not e!645661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73893 (_ BitVec 32)) Bool)

(assert (=> b!1134511 (= res!757388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134512 () Bool)

(declare-fun e!645669 () Bool)

(declare-fun e!645665 () Bool)

(assert (=> b!1134512 (= e!645669 e!645665)))

(declare-fun res!757395 () Bool)

(assert (=> b!1134512 (=> res!757395 e!645665)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1134512 (= res!757395 (not (= (select (arr!35597 _keys!1208) from!1455) k0!934)))))

(declare-fun e!645668 () Bool)

(assert (=> b!1134512 e!645668))

(declare-fun c!110792 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134512 (= c!110792 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504262 () Unit!37171)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!447 (array!73893 array!73891 (_ BitVec 32) (_ BitVec 32) V!43147 V!43147 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37171)

(assert (=> b!1134512 (= lt!504262 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504263 () Bool)

(declare-fun e!645656 () Bool)

(declare-fun b!1134513 () Bool)

(assert (=> b!1134513 (= e!645656 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504263) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun c!110793 () Bool)

(declare-fun lt!504257 () ListLongMap!16027)

(declare-fun call!49368 () ListLongMap!16027)

(declare-fun c!110794 () Bool)

(declare-fun bm!49360 () Bool)

(declare-fun +!3468 (ListLongMap!16027 tuple2!18058) ListLongMap!16027)

(assert (=> bm!49360 (= call!49368 (+!3468 lt!504257 (ite (or c!110794 c!110793) (tuple2!18059 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18059 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1134514 () Bool)

(declare-fun lt!504248 () Unit!37171)

(assert (=> b!1134514 (= e!645664 lt!504248)))

(declare-fun call!49366 () Unit!37171)

(assert (=> b!1134514 (= lt!504248 call!49366)))

(declare-fun call!49367 () Bool)

(assert (=> b!1134514 call!49367))

(declare-fun b!1134515 () Bool)

(declare-fun e!645653 () Bool)

(declare-fun e!645654 () Bool)

(assert (=> b!1134515 (= e!645653 (not e!645654))))

(declare-fun res!757387 () Bool)

(assert (=> b!1134515 (=> res!757387 e!645654)))

(assert (=> b!1134515 (= res!757387 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134515 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504258 () Unit!37171)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73893 (_ BitVec 64) (_ BitVec 32)) Unit!37171)

(assert (=> b!1134515 (= lt!504258 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!49361 () Bool)

(declare-fun call!49363 () Unit!37171)

(assert (=> bm!49361 (= call!49366 call!49363)))

(declare-fun b!1134516 () Bool)

(declare-fun call!49364 () ListLongMap!16027)

(declare-fun -!1193 (ListLongMap!16027 (_ BitVec 64)) ListLongMap!16027)

(assert (=> b!1134516 (= e!645668 (= call!49364 (-!1193 call!49369 k0!934)))))

(declare-fun b!1134517 () Bool)

(assert (=> b!1134517 (= e!645668 (= call!49364 call!49369))))

(declare-fun res!757380 () Bool)

(assert (=> start!98380 (=> (not res!757380) (not e!645661))))

(assert (=> start!98380 (= res!757380 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36133 _keys!1208))))))

(assert (=> start!98380 e!645661))

(assert (=> start!98380 tp_is_empty!28515))

(declare-fun array_inv!27300 (array!73893) Bool)

(assert (=> start!98380 (array_inv!27300 _keys!1208)))

(assert (=> start!98380 true))

(assert (=> start!98380 tp!84665))

(declare-fun e!645657 () Bool)

(declare-fun array_inv!27301 (array!73891) Bool)

(assert (=> start!98380 (and (array_inv!27301 _values!996) e!645657)))

(declare-fun bm!49362 () Bool)

(declare-fun call!49365 () Bool)

(assert (=> bm!49362 (= call!49367 call!49365)))

(declare-fun b!1134518 () Bool)

(declare-fun res!757382 () Bool)

(assert (=> b!1134518 (=> (not res!757382) (not e!645661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134518 (= res!757382 (validMask!0 mask!1564))))

(declare-fun bm!49363 () Bool)

(declare-fun addStillContains!730 (ListLongMap!16027 (_ BitVec 64) V!43147 (_ BitVec 64)) Unit!37171)

(assert (=> bm!49363 (= call!49363 (addStillContains!730 lt!504257 (ite (or c!110794 c!110793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110794 c!110793) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1134519 () Bool)

(declare-fun c!110791 () Bool)

(assert (=> b!1134519 (= c!110791 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504263))))

(declare-fun e!645655 () Unit!37171)

(assert (=> b!1134519 (= e!645655 e!645664)))

(declare-fun b!1134520 () Bool)

(declare-fun res!757397 () Bool)

(assert (=> b!1134520 (=> res!757397 e!645662)))

(assert (=> b!1134520 (= res!757397 (contains!6554 Nil!24813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134521 () Bool)

(assert (=> b!1134521 call!49367))

(declare-fun lt!504264 () Unit!37171)

(assert (=> b!1134521 (= lt!504264 call!49366)))

(assert (=> b!1134521 (= e!645655 lt!504264)))

(declare-fun b!1134522 () Bool)

(declare-fun e!645667 () Unit!37171)

(assert (=> b!1134522 (= e!645667 e!645655)))

(assert (=> b!1134522 (= c!110793 (and (not lt!504263) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1134523 () Bool)

(declare-fun e!645663 () Bool)

(assert (=> b!1134523 (= e!645665 e!645663)))

(declare-fun res!757393 () Bool)

(assert (=> b!1134523 (=> res!757393 e!645663)))

(declare-fun contains!6555 (ListLongMap!16027 (_ BitVec 64)) Bool)

(assert (=> b!1134523 (= res!757393 (not (contains!6555 lt!504257 k0!934)))))

(assert (=> b!1134523 (= lt!504257 (getCurrentListMapNoExtraKeys!4515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134524 () Bool)

(declare-fun res!757386 () Bool)

(assert (=> b!1134524 (=> (not res!757386) (not e!645661))))

(assert (=> b!1134524 (= res!757386 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36133 _keys!1208))))))

(declare-fun b!1134525 () Bool)

(declare-fun res!757390 () Bool)

(assert (=> b!1134525 (=> (not res!757390) (not e!645661))))

(assert (=> b!1134525 (= res!757390 (= (select (arr!35597 _keys!1208) i!673) k0!934))))

(declare-fun b!1134526 () Bool)

(declare-fun e!645666 () Bool)

(declare-fun mapRes!44597 () Bool)

(assert (=> b!1134526 (= e!645657 (and e!645666 mapRes!44597))))

(declare-fun condMapEmpty!44597 () Bool)

(declare-fun mapDefault!44597 () ValueCell!13548)

(assert (=> b!1134526 (= condMapEmpty!44597 (= (arr!35596 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13548)) mapDefault!44597)))))

(declare-fun lt!504253 () array!73891)

(declare-fun lt!504260 () array!73893)

(declare-fun bm!49364 () Bool)

(assert (=> bm!49364 (= call!49364 (getCurrentListMapNoExtraKeys!4515 lt!504260 lt!504253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134527 () Bool)

(assert (=> b!1134527 (= e!645654 e!645669)))

(declare-fun res!757391 () Bool)

(assert (=> b!1134527 (=> res!757391 e!645669)))

(assert (=> b!1134527 (= res!757391 (not (= from!1455 i!673)))))

(declare-fun lt!504259 () ListLongMap!16027)

(assert (=> b!1134527 (= lt!504259 (getCurrentListMapNoExtraKeys!4515 lt!504260 lt!504253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2580 (Int (_ BitVec 64)) V!43147)

(assert (=> b!1134527 (= lt!504253 (array!73892 (store (arr!35596 _values!996) i!673 (ValueCellFull!13548 (dynLambda!2580 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36132 _values!996)))))

(declare-fun lt!504249 () ListLongMap!16027)

(assert (=> b!1134527 (= lt!504249 (getCurrentListMapNoExtraKeys!4515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1134528 () Bool)

(assert (=> b!1134528 (= e!645666 tp_is_empty!28515)))

(declare-fun b!1134529 () Bool)

(declare-fun lt!504256 () Unit!37171)

(assert (=> b!1134529 (= e!645667 lt!504256)))

(declare-fun lt!504261 () Unit!37171)

(assert (=> b!1134529 (= lt!504261 call!49363)))

(declare-fun lt!504254 () ListLongMap!16027)

(assert (=> b!1134529 (= lt!504254 call!49368)))

(assert (=> b!1134529 call!49365))

(assert (=> b!1134529 (= lt!504256 (addStillContains!730 lt!504254 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1134529 (contains!6555 (+!3468 lt!504254 (tuple2!18059 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun mapNonEmpty!44597 () Bool)

(declare-fun tp!84666 () Bool)

(assert (=> mapNonEmpty!44597 (= mapRes!44597 (and tp!84666 e!645658))))

(declare-fun mapKey!44597 () (_ BitVec 32))

(declare-fun mapRest!44597 () (Array (_ BitVec 32) ValueCell!13548))

(declare-fun mapValue!44597 () ValueCell!13548)

(assert (=> mapNonEmpty!44597 (= (arr!35596 _values!996) (store mapRest!44597 mapKey!44597 mapValue!44597))))

(declare-fun bm!49365 () Bool)

(declare-fun call!49362 () ListLongMap!16027)

(assert (=> bm!49365 (= call!49365 (contains!6555 (ite c!110794 lt!504254 call!49362) k0!934))))

(declare-fun b!1134530 () Bool)

(declare-fun res!757381 () Bool)

(assert (=> b!1134530 (=> (not res!757381) (not e!645661))))

(assert (=> b!1134530 (= res!757381 (and (= (size!36132 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36133 _keys!1208) (size!36132 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1134531 () Bool)

(assert (=> b!1134531 (= e!645661 e!645653)))

(declare-fun res!757396 () Bool)

(assert (=> b!1134531 (=> (not res!757396) (not e!645653))))

(assert (=> b!1134531 (= res!757396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504260 mask!1564))))

(assert (=> b!1134531 (= lt!504260 (array!73894 (store (arr!35597 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36133 _keys!1208)))))

(declare-fun mapIsEmpty!44597 () Bool)

(assert (=> mapIsEmpty!44597 mapRes!44597))

(declare-fun b!1134532 () Bool)

(declare-fun res!757392 () Bool)

(assert (=> b!1134532 (=> (not res!757392) (not e!645661))))

(declare-fun arrayNoDuplicates!0 (array!73893 (_ BitVec 32) List!24816) Bool)

(assert (=> b!1134532 (= res!757392 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24813))))

(declare-fun b!1134533 () Bool)

(assert (=> b!1134533 (= e!645656 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134534 () Bool)

(declare-fun res!757389 () Bool)

(assert (=> b!1134534 (=> (not res!757389) (not e!645653))))

(assert (=> b!1134534 (= res!757389 (arrayNoDuplicates!0 lt!504260 #b00000000000000000000000000000000 Nil!24813))))

(declare-fun b!1134535 () Bool)

(declare-fun res!757394 () Bool)

(assert (=> b!1134535 (=> (not res!757394) (not e!645661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134535 (= res!757394 (validKeyInArray!0 k0!934))))

(declare-fun b!1134536 () Bool)

(declare-fun e!645659 () Bool)

(assert (=> b!1134536 (= e!645659 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49366 () Bool)

(assert (=> bm!49366 (= call!49362 call!49368)))

(declare-fun b!1134537 () Bool)

(assert (=> b!1134537 (= e!645663 e!645662)))

(declare-fun res!757383 () Bool)

(assert (=> b!1134537 (=> res!757383 e!645662)))

(assert (=> b!1134537 (= res!757383 (or (bvsge (size!36133 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36133 _keys!1208)) (bvsge from!1455 (size!36133 _keys!1208))))))

(assert (=> b!1134537 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24813)))

(declare-fun lt!504252 () Unit!37171)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73893 (_ BitVec 32) (_ BitVec 32)) Unit!37171)

(assert (=> b!1134537 (= lt!504252 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1134537 e!645659))

(declare-fun res!757385 () Bool)

(assert (=> b!1134537 (=> (not res!757385) (not e!645659))))

(assert (=> b!1134537 (= res!757385 e!645656)))

(declare-fun c!110790 () Bool)

(assert (=> b!1134537 (= c!110790 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504255 () Unit!37171)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!337 (array!73893 array!73891 (_ BitVec 32) (_ BitVec 32) V!43147 V!43147 (_ BitVec 64) (_ BitVec 32) Int) Unit!37171)

(assert (=> b!1134537 (= lt!504255 (lemmaListMapContainsThenArrayContainsFrom!337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504251 () Unit!37171)

(assert (=> b!1134537 (= lt!504251 e!645667)))

(assert (=> b!1134537 (= c!110794 (and (not lt!504263) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134537 (= lt!504263 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!98380 res!757380) b!1134518))

(assert (= (and b!1134518 res!757382) b!1134530))

(assert (= (and b!1134530 res!757381) b!1134511))

(assert (= (and b!1134511 res!757388) b!1134532))

(assert (= (and b!1134532 res!757392) b!1134524))

(assert (= (and b!1134524 res!757386) b!1134535))

(assert (= (and b!1134535 res!757394) b!1134525))

(assert (= (and b!1134525 res!757390) b!1134531))

(assert (= (and b!1134531 res!757396) b!1134534))

(assert (= (and b!1134534 res!757389) b!1134515))

(assert (= (and b!1134515 (not res!757387)) b!1134527))

(assert (= (and b!1134527 (not res!757391)) b!1134512))

(assert (= (and b!1134512 c!110792) b!1134516))

(assert (= (and b!1134512 (not c!110792)) b!1134517))

(assert (= (or b!1134516 b!1134517) bm!49364))

(assert (= (or b!1134516 b!1134517) bm!49359))

(assert (= (and b!1134512 (not res!757395)) b!1134523))

(assert (= (and b!1134523 (not res!757393)) b!1134537))

(assert (= (and b!1134537 c!110794) b!1134529))

(assert (= (and b!1134537 (not c!110794)) b!1134522))

(assert (= (and b!1134522 c!110793) b!1134521))

(assert (= (and b!1134522 (not c!110793)) b!1134519))

(assert (= (and b!1134519 c!110791) b!1134514))

(assert (= (and b!1134519 (not c!110791)) b!1134510))

(assert (= (or b!1134521 b!1134514) bm!49361))

(assert (= (or b!1134521 b!1134514) bm!49366))

(assert (= (or b!1134521 b!1134514) bm!49362))

(assert (= (or b!1134529 bm!49362) bm!49365))

(assert (= (or b!1134529 bm!49361) bm!49363))

(assert (= (or b!1134529 bm!49366) bm!49360))

(assert (= (and b!1134537 c!110790) b!1134533))

(assert (= (and b!1134537 (not c!110790)) b!1134513))

(assert (= (and b!1134537 res!757385) b!1134536))

(assert (= (and b!1134537 (not res!757383)) b!1134508))

(assert (= (and b!1134508 (not res!757384)) b!1134520))

(assert (= (and b!1134520 (not res!757397)) b!1134507))

(assert (= (and b!1134526 condMapEmpty!44597) mapIsEmpty!44597))

(assert (= (and b!1134526 (not condMapEmpty!44597)) mapNonEmpty!44597))

(get-info :version)

(assert (= (and mapNonEmpty!44597 ((_ is ValueCellFull!13548) mapValue!44597)) b!1134509))

(assert (= (and b!1134526 ((_ is ValueCellFull!13548) mapDefault!44597)) b!1134528))

(assert (= start!98380 b!1134526))

(declare-fun b_lambda!19091 () Bool)

(assert (=> (not b_lambda!19091) (not b!1134527)))

(declare-fun t!35792 () Bool)

(declare-fun tb!8797 () Bool)

(assert (=> (and start!98380 (= defaultEntry!1004 defaultEntry!1004) t!35792) tb!8797))

(declare-fun result!18159 () Bool)

(assert (=> tb!8797 (= result!18159 tp_is_empty!28515)))

(assert (=> b!1134527 t!35792))

(declare-fun b_and!38821 () Bool)

(assert (= b_and!38819 (and (=> t!35792 result!18159) b_and!38821)))

(declare-fun m!1047297 () Bool)

(assert (=> b!1134515 m!1047297))

(declare-fun m!1047299 () Bool)

(assert (=> b!1134515 m!1047299))

(declare-fun m!1047301 () Bool)

(assert (=> b!1134537 m!1047301))

(declare-fun m!1047303 () Bool)

(assert (=> b!1134537 m!1047303))

(declare-fun m!1047305 () Bool)

(assert (=> b!1134537 m!1047305))

(declare-fun m!1047307 () Bool)

(assert (=> b!1134518 m!1047307))

(declare-fun m!1047309 () Bool)

(assert (=> b!1134534 m!1047309))

(declare-fun m!1047311 () Bool)

(assert (=> b!1134529 m!1047311))

(declare-fun m!1047313 () Bool)

(assert (=> b!1134529 m!1047313))

(assert (=> b!1134529 m!1047313))

(declare-fun m!1047315 () Bool)

(assert (=> b!1134529 m!1047315))

(declare-fun m!1047317 () Bool)

(assert (=> bm!49363 m!1047317))

(declare-fun m!1047319 () Bool)

(assert (=> b!1134531 m!1047319))

(declare-fun m!1047321 () Bool)

(assert (=> b!1134531 m!1047321))

(declare-fun m!1047323 () Bool)

(assert (=> b!1134533 m!1047323))

(declare-fun m!1047325 () Bool)

(assert (=> b!1134516 m!1047325))

(declare-fun m!1047327 () Bool)

(assert (=> b!1134535 m!1047327))

(declare-fun m!1047329 () Bool)

(assert (=> b!1134511 m!1047329))

(declare-fun m!1047331 () Bool)

(assert (=> start!98380 m!1047331))

(declare-fun m!1047333 () Bool)

(assert (=> start!98380 m!1047333))

(declare-fun m!1047335 () Bool)

(assert (=> bm!49360 m!1047335))

(declare-fun m!1047337 () Bool)

(assert (=> b!1134520 m!1047337))

(assert (=> b!1134536 m!1047323))

(declare-fun m!1047339 () Bool)

(assert (=> bm!49364 m!1047339))

(declare-fun m!1047341 () Bool)

(assert (=> b!1134527 m!1047341))

(declare-fun m!1047343 () Bool)

(assert (=> b!1134527 m!1047343))

(declare-fun m!1047345 () Bool)

(assert (=> b!1134527 m!1047345))

(declare-fun m!1047347 () Bool)

(assert (=> b!1134527 m!1047347))

(declare-fun m!1047349 () Bool)

(assert (=> bm!49365 m!1047349))

(declare-fun m!1047351 () Bool)

(assert (=> bm!49359 m!1047351))

(declare-fun m!1047353 () Bool)

(assert (=> b!1134508 m!1047353))

(declare-fun m!1047355 () Bool)

(assert (=> b!1134532 m!1047355))

(declare-fun m!1047357 () Bool)

(assert (=> b!1134523 m!1047357))

(assert (=> b!1134523 m!1047351))

(declare-fun m!1047359 () Bool)

(assert (=> b!1134525 m!1047359))

(declare-fun m!1047361 () Bool)

(assert (=> b!1134507 m!1047361))

(declare-fun m!1047363 () Bool)

(assert (=> b!1134512 m!1047363))

(declare-fun m!1047365 () Bool)

(assert (=> b!1134512 m!1047365))

(declare-fun m!1047367 () Bool)

(assert (=> mapNonEmpty!44597 m!1047367))

(check-sat (not b!1134516) (not b!1134533) (not b!1134529) (not b!1134532) (not b!1134507) (not b!1134518) (not b!1134535) (not b!1134523) (not bm!49359) tp_is_empty!28515 (not b!1134515) (not bm!49360) (not bm!49363) (not b!1134520) (not b!1134508) (not start!98380) (not bm!49364) (not mapNonEmpty!44597) (not b!1134534) (not b!1134531) (not b_next!23985) (not bm!49365) (not b!1134512) (not b!1134537) (not b!1134536) b_and!38821 (not b!1134527) (not b_lambda!19091) (not b!1134511))
(check-sat b_and!38821 (not b_next!23985))
