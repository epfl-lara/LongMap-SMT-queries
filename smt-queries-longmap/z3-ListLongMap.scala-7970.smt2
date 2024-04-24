; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98896 () Bool)

(assert start!98896)

(declare-fun b_free!24265 () Bool)

(declare-fun b_next!24265 () Bool)

(assert (=> start!98896 (= b_free!24265 (not b_next!24265))))

(declare-fun tp!85505 () Bool)

(declare-fun b_and!39381 () Bool)

(assert (=> start!98896 (= tp!85505 b_and!39381)))

(declare-fun b!1148491 () Bool)

(declare-fun res!764139 () Bool)

(declare-fun e!653386 () Bool)

(assert (=> b!1148491 (=> (not res!764139) (not e!653386))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148491 (= res!764139 (validKeyInArray!0 k0!934))))

(declare-fun b!1148492 () Bool)

(declare-fun e!653388 () Bool)

(assert (=> b!1148492 (= e!653388 true)))

(declare-fun e!653389 () Bool)

(assert (=> b!1148492 e!653389))

(declare-fun res!764146 () Bool)

(assert (=> b!1148492 (=> (not res!764146) (not e!653389))))

(declare-datatypes ((array!74485 0))(
  ( (array!74486 (arr!35887 (Array (_ BitVec 32) (_ BitVec 64))) (size!36424 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74485)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!43521 0))(
  ( (V!43522 (val!14454 Int)) )
))
(declare-fun lt!513028 () V!43521)

(declare-datatypes ((tuple2!18336 0))(
  ( (tuple2!18337 (_1!9179 (_ BitVec 64)) (_2!9179 V!43521)) )
))
(declare-datatypes ((List!25090 0))(
  ( (Nil!25087) (Cons!25086 (h!26304 tuple2!18336) (t!36339 List!25090)) )
))
(declare-datatypes ((ListLongMap!16313 0))(
  ( (ListLongMap!16314 (toList!8172 List!25090)) )
))
(declare-fun lt!513032 () ListLongMap!16313)

(declare-fun -!1297 (ListLongMap!16313 (_ BitVec 64)) ListLongMap!16313)

(declare-fun +!3612 (ListLongMap!16313 tuple2!18336) ListLongMap!16313)

(assert (=> b!1148492 (= res!764146 (= (-!1297 (+!3612 lt!513032 (tuple2!18337 (select (arr!35887 _keys!1208) from!1455) lt!513028)) (select (arr!35887 _keys!1208) from!1455)) lt!513032))))

(declare-datatypes ((Unit!37662 0))(
  ( (Unit!37663) )
))
(declare-fun lt!513033 () Unit!37662)

(declare-fun addThenRemoveForNewKeyIsSame!149 (ListLongMap!16313 (_ BitVec 64) V!43521) Unit!37662)

(assert (=> b!1148492 (= lt!513033 (addThenRemoveForNewKeyIsSame!149 lt!513032 (select (arr!35887 _keys!1208) from!1455) lt!513028))))

(declare-fun lt!513027 () V!43521)

(declare-datatypes ((ValueCell!13688 0))(
  ( (ValueCellFull!13688 (v!17087 V!43521)) (EmptyCell!13688) )
))
(declare-datatypes ((array!74487 0))(
  ( (array!74488 (arr!35888 (Array (_ BitVec 32) ValueCell!13688)) (size!36425 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74487)

(declare-fun get!18282 (ValueCell!13688 V!43521) V!43521)

(assert (=> b!1148492 (= lt!513028 (get!18282 (select (arr!35888 _values!996) from!1455) lt!513027))))

(declare-fun lt!513031 () Unit!37662)

(declare-fun e!653374 () Unit!37662)

(assert (=> b!1148492 (= lt!513031 e!653374)))

(declare-fun c!113645 () Bool)

(declare-fun contains!6710 (ListLongMap!16313 (_ BitVec 64)) Bool)

(assert (=> b!1148492 (= c!113645 (contains!6710 lt!513032 k0!934))))

(declare-fun zeroValue!944 () V!43521)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43521)

(declare-fun getCurrentListMapNoExtraKeys!4675 (array!74485 array!74487 (_ BitVec 32) (_ BitVec 32) V!43521 V!43521 (_ BitVec 32) Int) ListLongMap!16313)

(assert (=> b!1148492 (= lt!513032 (getCurrentListMapNoExtraKeys!4675 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148493 () Bool)

(declare-fun Unit!37664 () Unit!37662)

(assert (=> b!1148493 (= e!653374 Unit!37664)))

(declare-fun mapNonEmpty!45017 () Bool)

(declare-fun mapRes!45017 () Bool)

(declare-fun tp!85506 () Bool)

(declare-fun e!653383 () Bool)

(assert (=> mapNonEmpty!45017 (= mapRes!45017 (and tp!85506 e!653383))))

(declare-fun mapRest!45017 () (Array (_ BitVec 32) ValueCell!13688))

(declare-fun mapKey!45017 () (_ BitVec 32))

(declare-fun mapValue!45017 () ValueCell!13688)

(assert (=> mapNonEmpty!45017 (= (arr!35888 _values!996) (store mapRest!45017 mapKey!45017 mapValue!45017))))

(declare-fun b!1148494 () Bool)

(declare-fun res!764137 () Bool)

(assert (=> b!1148494 (=> (not res!764137) (not e!653386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74485 (_ BitVec 32)) Bool)

(assert (=> b!1148494 (= res!764137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1148496 () Bool)

(declare-fun call!52790 () Bool)

(assert (=> b!1148496 call!52790))

(declare-fun lt!513023 () Unit!37662)

(declare-fun call!52793 () Unit!37662)

(assert (=> b!1148496 (= lt!513023 call!52793)))

(declare-fun e!653377 () Unit!37662)

(assert (=> b!1148496 (= e!653377 lt!513023)))

(declare-fun b!1148497 () Bool)

(declare-fun res!764151 () Bool)

(assert (=> b!1148497 (=> (not res!764151) (not e!653386))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148497 (= res!764151 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36424 _keys!1208))))))

(declare-fun b!1148498 () Bool)

(declare-fun lt!513039 () ListLongMap!16313)

(assert (=> b!1148498 (contains!6710 (+!3612 lt!513039 (tuple2!18337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!513030 () Unit!37662)

(declare-fun addStillContains!838 (ListLongMap!16313 (_ BitVec 64) V!43521 (_ BitVec 64)) Unit!37662)

(assert (=> b!1148498 (= lt!513030 (addStillContains!838 lt!513039 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!52791 () Bool)

(assert (=> b!1148498 call!52791))

(declare-fun call!52794 () ListLongMap!16313)

(assert (=> b!1148498 (= lt!513039 call!52794)))

(declare-fun lt!513034 () Unit!37662)

(declare-fun call!52789 () Unit!37662)

(assert (=> b!1148498 (= lt!513034 call!52789)))

(declare-fun e!653378 () Unit!37662)

(assert (=> b!1148498 (= e!653378 lt!513030)))

(declare-fun b!1148499 () Bool)

(declare-fun c!113642 () Bool)

(declare-fun lt!513024 () Bool)

(assert (=> b!1148499 (= c!113642 (and (not lt!513024) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653382 () Unit!37662)

(assert (=> b!1148499 (= e!653378 e!653382)))

(declare-fun b!1148500 () Bool)

(assert (=> b!1148500 (= e!653382 e!653377)))

(declare-fun c!113644 () Bool)

(assert (=> b!1148500 (= c!113644 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513024))))

(declare-fun bm!52784 () Bool)

(declare-fun c!113641 () Bool)

(assert (=> bm!52784 (= call!52794 (+!3612 lt!513032 (ite (or c!113641 c!113642) (tuple2!18337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1148501 () Bool)

(declare-fun e!653381 () Bool)

(declare-fun e!653384 () Bool)

(assert (=> b!1148501 (= e!653381 (not e!653384))))

(declare-fun res!764141 () Bool)

(assert (=> b!1148501 (=> res!764141 e!653384)))

(assert (=> b!1148501 (= res!764141 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148501 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513026 () Unit!37662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74485 (_ BitVec 64) (_ BitVec 32)) Unit!37662)

(assert (=> b!1148501 (= lt!513026 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!653387 () Bool)

(declare-fun b!1148502 () Bool)

(assert (=> b!1148502 (= e!653387 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513024) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1148503 () Bool)

(declare-fun e!653373 () Bool)

(assert (=> b!1148503 (= e!653373 e!653388)))

(declare-fun res!764144 () Bool)

(assert (=> b!1148503 (=> res!764144 e!653388)))

(assert (=> b!1148503 (= res!764144 (not (= (select (arr!35887 _keys!1208) from!1455) k0!934)))))

(declare-fun e!653375 () Bool)

(assert (=> b!1148503 e!653375))

(declare-fun c!113643 () Bool)

(assert (=> b!1148503 (= c!113643 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513041 () Unit!37662)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!542 (array!74485 array!74487 (_ BitVec 32) (_ BitVec 32) V!43521 V!43521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37662)

(assert (=> b!1148503 (= lt!513041 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148504 () Bool)

(assert (=> b!1148504 (= e!653384 e!653373)))

(declare-fun res!764138 () Bool)

(assert (=> b!1148504 (=> res!764138 e!653373)))

(assert (=> b!1148504 (= res!764138 (not (= from!1455 i!673)))))

(declare-fun lt!513043 () array!74487)

(declare-fun lt!513037 () array!74485)

(declare-fun lt!513035 () ListLongMap!16313)

(assert (=> b!1148504 (= lt!513035 (getCurrentListMapNoExtraKeys!4675 lt!513037 lt!513043 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1148504 (= lt!513043 (array!74488 (store (arr!35888 _values!996) i!673 (ValueCellFull!13688 lt!513027)) (size!36425 _values!996)))))

(declare-fun dynLambda!2702 (Int (_ BitVec 64)) V!43521)

(assert (=> b!1148504 (= lt!513027 (dynLambda!2702 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!513025 () ListLongMap!16313)

(assert (=> b!1148504 (= lt!513025 (getCurrentListMapNoExtraKeys!4675 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1148505 () Bool)

(declare-fun Unit!37665 () Unit!37662)

(assert (=> b!1148505 (= e!653377 Unit!37665)))

(declare-fun b!1148506 () Bool)

(declare-fun res!764148 () Bool)

(assert (=> b!1148506 (=> (not res!764148) (not e!653386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148506 (= res!764148 (validMask!0 mask!1564))))

(declare-fun b!1148507 () Bool)

(assert (=> b!1148507 (= e!653389 (= (-!1297 lt!513025 k0!934) lt!513032))))

(declare-fun b!1148508 () Bool)

(declare-fun tp_is_empty!28795 () Bool)

(assert (=> b!1148508 (= e!653383 tp_is_empty!28795)))

(declare-fun b!1148509 () Bool)

(assert (=> b!1148509 (= e!653387 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52785 () Bool)

(declare-fun call!52788 () ListLongMap!16313)

(assert (=> bm!52785 (= call!52788 (getCurrentListMapNoExtraKeys!4675 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!52792 () ListLongMap!16313)

(declare-fun b!1148510 () Bool)

(assert (=> b!1148510 (= e!653375 (= call!52792 (-!1297 call!52788 k0!934)))))

(declare-fun call!52787 () ListLongMap!16313)

(declare-fun bm!52786 () Bool)

(assert (=> bm!52786 (= call!52791 (contains!6710 (ite c!113641 lt!513039 call!52787) k0!934))))

(declare-fun b!1148511 () Bool)

(declare-fun res!764149 () Bool)

(assert (=> b!1148511 (=> (not res!764149) (not e!653381))))

(declare-datatypes ((List!25091 0))(
  ( (Nil!25088) (Cons!25087 (h!26305 (_ BitVec 64)) (t!36340 List!25091)) )
))
(declare-fun arrayNoDuplicates!0 (array!74485 (_ BitVec 32) List!25091) Bool)

(assert (=> b!1148511 (= res!764149 (arrayNoDuplicates!0 lt!513037 #b00000000000000000000000000000000 Nil!25088))))

(declare-fun b!1148512 () Bool)

(declare-fun Unit!37666 () Unit!37662)

(assert (=> b!1148512 (= e!653374 Unit!37666)))

(assert (=> b!1148512 (= lt!513024 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148512 (= c!113641 (and (not lt!513024) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513038 () Unit!37662)

(assert (=> b!1148512 (= lt!513038 e!653378)))

(declare-fun lt!513042 () Unit!37662)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!434 (array!74485 array!74487 (_ BitVec 32) (_ BitVec 32) V!43521 V!43521 (_ BitVec 64) (_ BitVec 32) Int) Unit!37662)

(assert (=> b!1148512 (= lt!513042 (lemmaListMapContainsThenArrayContainsFrom!434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113646 () Bool)

(assert (=> b!1148512 (= c!113646 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764143 () Bool)

(assert (=> b!1148512 (= res!764143 e!653387)))

(declare-fun e!653380 () Bool)

(assert (=> b!1148512 (=> (not res!764143) (not e!653380))))

(assert (=> b!1148512 e!653380))

(declare-fun lt!513036 () Unit!37662)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74485 (_ BitVec 32) (_ BitVec 32)) Unit!37662)

(assert (=> b!1148512 (= lt!513036 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148512 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25088)))

(declare-fun lt!513029 () Unit!37662)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74485 (_ BitVec 64) (_ BitVec 32) List!25091) Unit!37662)

(assert (=> b!1148512 (= lt!513029 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25088))))

(assert (=> b!1148512 false))

(declare-fun b!1148513 () Bool)

(declare-fun e!653379 () Bool)

(assert (=> b!1148513 (= e!653379 tp_is_empty!28795)))

(declare-fun b!1148514 () Bool)

(declare-fun lt!513040 () Unit!37662)

(assert (=> b!1148514 (= e!653382 lt!513040)))

(assert (=> b!1148514 (= lt!513040 call!52793)))

(assert (=> b!1148514 call!52790))

(declare-fun mapIsEmpty!45017 () Bool)

(assert (=> mapIsEmpty!45017 mapRes!45017))

(declare-fun bm!52787 () Bool)

(assert (=> bm!52787 (= call!52792 (getCurrentListMapNoExtraKeys!4675 lt!513037 lt!513043 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148515 () Bool)

(declare-fun e!653385 () Bool)

(assert (=> b!1148515 (= e!653385 (and e!653379 mapRes!45017))))

(declare-fun condMapEmpty!45017 () Bool)

(declare-fun mapDefault!45017 () ValueCell!13688)

(assert (=> b!1148515 (= condMapEmpty!45017 (= (arr!35888 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13688)) mapDefault!45017)))))

(declare-fun b!1148495 () Bool)

(declare-fun res!764150 () Bool)

(assert (=> b!1148495 (=> (not res!764150) (not e!653386))))

(assert (=> b!1148495 (= res!764150 (and (= (size!36425 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36424 _keys!1208) (size!36425 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!764142 () Bool)

(assert (=> start!98896 (=> (not res!764142) (not e!653386))))

(assert (=> start!98896 (= res!764142 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36424 _keys!1208))))))

(assert (=> start!98896 e!653386))

(assert (=> start!98896 tp_is_empty!28795))

(declare-fun array_inv!27542 (array!74485) Bool)

(assert (=> start!98896 (array_inv!27542 _keys!1208)))

(assert (=> start!98896 true))

(assert (=> start!98896 tp!85505))

(declare-fun array_inv!27543 (array!74487) Bool)

(assert (=> start!98896 (and (array_inv!27543 _values!996) e!653385)))

(declare-fun b!1148516 () Bool)

(assert (=> b!1148516 (= e!653380 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52788 () Bool)

(assert (=> bm!52788 (= call!52787 call!52794)))

(declare-fun b!1148517 () Bool)

(declare-fun res!764145 () Bool)

(assert (=> b!1148517 (=> (not res!764145) (not e!653386))))

(assert (=> b!1148517 (= res!764145 (= (select (arr!35887 _keys!1208) i!673) k0!934))))

(declare-fun bm!52789 () Bool)

(assert (=> bm!52789 (= call!52789 (addStillContains!838 lt!513032 (ite (or c!113641 c!113642) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113641 c!113642) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1148518 () Bool)

(assert (=> b!1148518 (= e!653386 e!653381)))

(declare-fun res!764147 () Bool)

(assert (=> b!1148518 (=> (not res!764147) (not e!653381))))

(assert (=> b!1148518 (= res!764147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513037 mask!1564))))

(assert (=> b!1148518 (= lt!513037 (array!74486 (store (arr!35887 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36424 _keys!1208)))))

(declare-fun b!1148519 () Bool)

(declare-fun res!764140 () Bool)

(assert (=> b!1148519 (=> (not res!764140) (not e!653386))))

(assert (=> b!1148519 (= res!764140 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25088))))

(declare-fun b!1148520 () Bool)

(assert (=> b!1148520 (= e!653375 (= call!52792 call!52788))))

(declare-fun bm!52790 () Bool)

(assert (=> bm!52790 (= call!52793 call!52789)))

(declare-fun bm!52791 () Bool)

(assert (=> bm!52791 (= call!52790 call!52791)))

(assert (= (and start!98896 res!764142) b!1148506))

(assert (= (and b!1148506 res!764148) b!1148495))

(assert (= (and b!1148495 res!764150) b!1148494))

(assert (= (and b!1148494 res!764137) b!1148519))

(assert (= (and b!1148519 res!764140) b!1148497))

(assert (= (and b!1148497 res!764151) b!1148491))

(assert (= (and b!1148491 res!764139) b!1148517))

(assert (= (and b!1148517 res!764145) b!1148518))

(assert (= (and b!1148518 res!764147) b!1148511))

(assert (= (and b!1148511 res!764149) b!1148501))

(assert (= (and b!1148501 (not res!764141)) b!1148504))

(assert (= (and b!1148504 (not res!764138)) b!1148503))

(assert (= (and b!1148503 c!113643) b!1148510))

(assert (= (and b!1148503 (not c!113643)) b!1148520))

(assert (= (or b!1148510 b!1148520) bm!52787))

(assert (= (or b!1148510 b!1148520) bm!52785))

(assert (= (and b!1148503 (not res!764144)) b!1148492))

(assert (= (and b!1148492 c!113645) b!1148512))

(assert (= (and b!1148492 (not c!113645)) b!1148493))

(assert (= (and b!1148512 c!113641) b!1148498))

(assert (= (and b!1148512 (not c!113641)) b!1148499))

(assert (= (and b!1148499 c!113642) b!1148514))

(assert (= (and b!1148499 (not c!113642)) b!1148500))

(assert (= (and b!1148500 c!113644) b!1148496))

(assert (= (and b!1148500 (not c!113644)) b!1148505))

(assert (= (or b!1148514 b!1148496) bm!52790))

(assert (= (or b!1148514 b!1148496) bm!52788))

(assert (= (or b!1148514 b!1148496) bm!52791))

(assert (= (or b!1148498 bm!52791) bm!52786))

(assert (= (or b!1148498 bm!52790) bm!52789))

(assert (= (or b!1148498 bm!52788) bm!52784))

(assert (= (and b!1148512 c!113646) b!1148509))

(assert (= (and b!1148512 (not c!113646)) b!1148502))

(assert (= (and b!1148512 res!764143) b!1148516))

(assert (= (and b!1148492 res!764146) b!1148507))

(assert (= (and b!1148515 condMapEmpty!45017) mapIsEmpty!45017))

(assert (= (and b!1148515 (not condMapEmpty!45017)) mapNonEmpty!45017))

(get-info :version)

(assert (= (and mapNonEmpty!45017 ((_ is ValueCellFull!13688) mapValue!45017)) b!1148508))

(assert (= (and b!1148515 ((_ is ValueCellFull!13688) mapDefault!45017)) b!1148513))

(assert (= start!98896 b!1148515))

(declare-fun b_lambda!19365 () Bool)

(assert (=> (not b_lambda!19365) (not b!1148504)))

(declare-fun t!36338 () Bool)

(declare-fun tb!9069 () Bool)

(assert (=> (and start!98896 (= defaultEntry!1004 defaultEntry!1004) t!36338) tb!9069))

(declare-fun result!18711 () Bool)

(assert (=> tb!9069 (= result!18711 tp_is_empty!28795)))

(assert (=> b!1148504 t!36338))

(declare-fun b_and!39383 () Bool)

(assert (= b_and!39381 (and (=> t!36338 result!18711) b_and!39383)))

(declare-fun m!1059433 () Bool)

(assert (=> bm!52789 m!1059433))

(declare-fun m!1059435 () Bool)

(assert (=> b!1148516 m!1059435))

(declare-fun m!1059437 () Bool)

(assert (=> b!1148492 m!1059437))

(declare-fun m!1059439 () Bool)

(assert (=> b!1148492 m!1059439))

(declare-fun m!1059441 () Bool)

(assert (=> b!1148492 m!1059441))

(declare-fun m!1059443 () Bool)

(assert (=> b!1148492 m!1059443))

(declare-fun m!1059445 () Bool)

(assert (=> b!1148492 m!1059445))

(declare-fun m!1059447 () Bool)

(assert (=> b!1148492 m!1059447))

(assert (=> b!1148492 m!1059441))

(declare-fun m!1059449 () Bool)

(assert (=> b!1148492 m!1059449))

(assert (=> b!1148492 m!1059439))

(declare-fun m!1059451 () Bool)

(assert (=> b!1148492 m!1059451))

(assert (=> b!1148492 m!1059441))

(assert (=> b!1148492 m!1059447))

(declare-fun m!1059453 () Bool)

(assert (=> start!98896 m!1059453))

(declare-fun m!1059455 () Bool)

(assert (=> start!98896 m!1059455))

(declare-fun m!1059457 () Bool)

(assert (=> b!1148491 m!1059457))

(declare-fun m!1059459 () Bool)

(assert (=> mapNonEmpty!45017 m!1059459))

(declare-fun m!1059461 () Bool)

(assert (=> bm!52786 m!1059461))

(declare-fun m!1059463 () Bool)

(assert (=> bm!52787 m!1059463))

(assert (=> bm!52785 m!1059437))

(declare-fun m!1059465 () Bool)

(assert (=> b!1148506 m!1059465))

(declare-fun m!1059467 () Bool)

(assert (=> bm!52784 m!1059467))

(declare-fun m!1059469 () Bool)

(assert (=> b!1148504 m!1059469))

(declare-fun m!1059471 () Bool)

(assert (=> b!1148504 m!1059471))

(declare-fun m!1059473 () Bool)

(assert (=> b!1148504 m!1059473))

(declare-fun m!1059475 () Bool)

(assert (=> b!1148504 m!1059475))

(declare-fun m!1059477 () Bool)

(assert (=> b!1148512 m!1059477))

(declare-fun m!1059479 () Bool)

(assert (=> b!1148512 m!1059479))

(declare-fun m!1059481 () Bool)

(assert (=> b!1148512 m!1059481))

(declare-fun m!1059483 () Bool)

(assert (=> b!1148512 m!1059483))

(declare-fun m!1059485 () Bool)

(assert (=> b!1148507 m!1059485))

(declare-fun m!1059487 () Bool)

(assert (=> b!1148501 m!1059487))

(declare-fun m!1059489 () Bool)

(assert (=> b!1148501 m!1059489))

(declare-fun m!1059491 () Bool)

(assert (=> b!1148517 m!1059491))

(assert (=> b!1148509 m!1059435))

(declare-fun m!1059493 () Bool)

(assert (=> b!1148519 m!1059493))

(declare-fun m!1059495 () Bool)

(assert (=> b!1148511 m!1059495))

(declare-fun m!1059497 () Bool)

(assert (=> b!1148510 m!1059497))

(declare-fun m!1059499 () Bool)

(assert (=> b!1148494 m!1059499))

(declare-fun m!1059501 () Bool)

(assert (=> b!1148498 m!1059501))

(assert (=> b!1148498 m!1059501))

(declare-fun m!1059503 () Bool)

(assert (=> b!1148498 m!1059503))

(declare-fun m!1059505 () Bool)

(assert (=> b!1148498 m!1059505))

(declare-fun m!1059507 () Bool)

(assert (=> b!1148518 m!1059507))

(declare-fun m!1059509 () Bool)

(assert (=> b!1148518 m!1059509))

(assert (=> b!1148503 m!1059441))

(declare-fun m!1059511 () Bool)

(assert (=> b!1148503 m!1059511))

(check-sat (not bm!52785) (not b_next!24265) (not bm!52784) (not b!1148498) (not bm!52787) (not bm!52786) (not b!1148518) (not b!1148503) (not b!1148519) (not b!1148501) (not b!1148491) (not b!1148507) (not bm!52789) (not b!1148504) (not b!1148510) (not start!98896) (not b_lambda!19365) tp_is_empty!28795 (not b!1148512) (not b!1148511) (not b!1148492) (not b!1148506) (not b!1148516) b_and!39383 (not b!1148494) (not mapNonEmpty!45017) (not b!1148509))
(check-sat b_and!39383 (not b_next!24265))
