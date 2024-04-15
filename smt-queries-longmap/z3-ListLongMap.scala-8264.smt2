; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100526 () Bool)

(assert start!100526)

(declare-fun b_free!25855 () Bool)

(declare-fun b_next!25855 () Bool)

(assert (=> start!100526 (= b_free!25855 (not b_next!25855))))

(declare-fun tp!90555 () Bool)

(declare-fun b_and!42575 () Bool)

(assert (=> start!100526 (= tp!90555 b_and!42575)))

(declare-fun b!1201398 () Bool)

(declare-fun e!682225 () Bool)

(declare-fun e!682228 () Bool)

(assert (=> b!1201398 (= e!682225 e!682228)))

(declare-fun res!799753 () Bool)

(assert (=> b!1201398 (=> res!799753 e!682228)))

(declare-datatypes ((array!77816 0))(
  ( (array!77817 (arr!37553 (Array (_ BitVec 32) (_ BitVec 64))) (size!38091 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77816)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1201398 (= res!799753 (not (= (select (arr!37553 _keys!1208) from!1455) k0!934)))))

(declare-fun e!682237 () Bool)

(assert (=> b!1201398 e!682237))

(declare-fun c!117501 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201398 (= c!117501 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!45873 0))(
  ( (V!45874 (val!15336 Int)) )
))
(declare-fun zeroValue!944 () V!45873)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14570 0))(
  ( (ValueCellFull!14570 (v!17973 V!45873)) (EmptyCell!14570) )
))
(declare-datatypes ((array!77818 0))(
  ( (array!77819 (arr!37554 (Array (_ BitVec 32) ValueCell!14570)) (size!38092 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77818)

(declare-fun minValue!944 () V!45873)

(declare-datatypes ((Unit!39687 0))(
  ( (Unit!39688) )
))
(declare-fun lt!544314 () Unit!39687)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1011 (array!77816 array!77818 (_ BitVec 32) (_ BitVec 32) V!45873 V!45873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39687)

(assert (=> b!1201398 (= lt!544314 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1011 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201399 () Bool)

(declare-fun e!682229 () Unit!39687)

(declare-fun e!682227 () Unit!39687)

(assert (=> b!1201399 (= e!682229 e!682227)))

(declare-fun c!117503 () Bool)

(declare-fun lt!544312 () Bool)

(assert (=> b!1201399 (= c!117503 (and (not lt!544312) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1201400 () Bool)

(declare-fun res!799762 () Bool)

(declare-fun e!682224 () Bool)

(assert (=> b!1201400 (=> (not res!799762) (not e!682224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201400 (= res!799762 (validKeyInArray!0 k0!934))))

(declare-fun b!1201402 () Bool)

(declare-fun e!682233 () Bool)

(declare-fun tp_is_empty!30559 () Bool)

(assert (=> b!1201402 (= e!682233 tp_is_empty!30559)))

(declare-datatypes ((tuple2!19726 0))(
  ( (tuple2!19727 (_1!9874 (_ BitVec 64)) (_2!9874 V!45873)) )
))
(declare-datatypes ((List!26516 0))(
  ( (Nil!26513) (Cons!26512 (h!27721 tuple2!19726) (t!39342 List!26516)) )
))
(declare-datatypes ((ListLongMap!17695 0))(
  ( (ListLongMap!17696 (toList!8863 List!26516)) )
))
(declare-fun call!57439 () ListLongMap!17695)

(declare-fun bm!57434 () Bool)

(declare-fun lt!544307 () array!77818)

(declare-fun lt!544309 () array!77816)

(declare-fun getCurrentListMapNoExtraKeys!5311 (array!77816 array!77818 (_ BitVec 32) (_ BitVec 32) V!45873 V!45873 (_ BitVec 32) Int) ListLongMap!17695)

(assert (=> bm!57434 (= call!57439 (getCurrentListMapNoExtraKeys!5311 lt!544309 lt!544307 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201403 () Bool)

(declare-fun res!799761 () Bool)

(assert (=> b!1201403 (=> (not res!799761) (not e!682224))))

(assert (=> b!1201403 (= res!799761 (= (select (arr!37553 _keys!1208) i!673) k0!934))))

(declare-fun b!1201404 () Bool)

(declare-fun res!799763 () Bool)

(assert (=> b!1201404 (=> (not res!799763) (not e!682224))))

(assert (=> b!1201404 (= res!799763 (and (= (size!38092 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38091 _keys!1208) (size!38092 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201405 () Bool)

(declare-fun res!799760 () Bool)

(declare-fun e!682232 () Bool)

(assert (=> b!1201405 (=> (not res!799760) (not e!682232))))

(declare-datatypes ((List!26517 0))(
  ( (Nil!26514) (Cons!26513 (h!27722 (_ BitVec 64)) (t!39343 List!26517)) )
))
(declare-fun arrayNoDuplicates!0 (array!77816 (_ BitVec 32) List!26517) Bool)

(assert (=> b!1201405 (= res!799760 (arrayNoDuplicates!0 lt!544309 #b00000000000000000000000000000000 Nil!26514))))

(declare-fun b!1201406 () Bool)

(declare-fun call!57442 () ListLongMap!17695)

(assert (=> b!1201406 (= e!682237 (= call!57439 call!57442))))

(declare-fun bm!57435 () Bool)

(assert (=> bm!57435 (= call!57442 (getCurrentListMapNoExtraKeys!5311 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201407 () Bool)

(declare-fun e!682234 () Unit!39687)

(declare-fun Unit!39689 () Unit!39687)

(assert (=> b!1201407 (= e!682234 Unit!39689)))

(declare-fun b!1201408 () Bool)

(declare-fun -!1761 (ListLongMap!17695 (_ BitVec 64)) ListLongMap!17695)

(assert (=> b!1201408 (= e!682237 (= call!57439 (-!1761 call!57442 k0!934)))))

(declare-fun b!1201409 () Bool)

(declare-fun res!799754 () Bool)

(assert (=> b!1201409 (=> (not res!799754) (not e!682224))))

(assert (=> b!1201409 (= res!799754 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38091 _keys!1208))))))

(declare-fun b!1201410 () Bool)

(declare-fun res!799758 () Bool)

(assert (=> b!1201410 (=> (not res!799758) (not e!682224))))

(assert (=> b!1201410 (= res!799758 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26514))))

(declare-fun b!1201411 () Bool)

(declare-fun e!682226 () Bool)

(assert (=> b!1201411 (= e!682228 e!682226)))

(declare-fun res!799757 () Bool)

(assert (=> b!1201411 (=> res!799757 e!682226)))

(declare-fun lt!544316 () ListLongMap!17695)

(declare-fun contains!6858 (ListLongMap!17695 (_ BitVec 64)) Bool)

(assert (=> b!1201411 (= res!799757 (not (contains!6858 lt!544316 k0!934)))))

(assert (=> b!1201411 (= lt!544316 (getCurrentListMapNoExtraKeys!5311 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57436 () Bool)

(declare-fun call!57444 () Unit!39687)

(declare-fun call!57443 () Unit!39687)

(assert (=> bm!57436 (= call!57444 call!57443)))

(declare-fun b!1201412 () Bool)

(assert (=> b!1201412 (= e!682224 e!682232)))

(declare-fun res!799759 () Bool)

(assert (=> b!1201412 (=> (not res!799759) (not e!682232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77816 (_ BitVec 32)) Bool)

(assert (=> b!1201412 (= res!799759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544309 mask!1564))))

(assert (=> b!1201412 (= lt!544309 (array!77817 (store (arr!37553 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38091 _keys!1208)))))

(declare-fun b!1201413 () Bool)

(declare-fun c!117502 () Bool)

(assert (=> b!1201413 (= c!117502 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544312))))

(assert (=> b!1201413 (= e!682227 e!682234)))

(declare-fun b!1201414 () Bool)

(declare-fun e!682230 () Bool)

(assert (=> b!1201414 (= e!682230 tp_is_empty!30559)))

(declare-fun res!799751 () Bool)

(assert (=> start!100526 (=> (not res!799751) (not e!682224))))

(assert (=> start!100526 (= res!799751 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38091 _keys!1208))))))

(assert (=> start!100526 e!682224))

(assert (=> start!100526 tp_is_empty!30559))

(declare-fun array_inv!28726 (array!77816) Bool)

(assert (=> start!100526 (array_inv!28726 _keys!1208)))

(assert (=> start!100526 true))

(assert (=> start!100526 tp!90555))

(declare-fun e!682235 () Bool)

(declare-fun array_inv!28727 (array!77818) Bool)

(assert (=> start!100526 (and (array_inv!28727 _values!996) e!682235)))

(declare-fun b!1201401 () Bool)

(declare-fun lt!544315 () Unit!39687)

(assert (=> b!1201401 (= e!682234 lt!544315)))

(assert (=> b!1201401 (= lt!544315 call!57444)))

(declare-fun call!57438 () Bool)

(assert (=> b!1201401 call!57438))

(declare-fun b!1201415 () Bool)

(declare-fun res!799756 () Bool)

(assert (=> b!1201415 (=> (not res!799756) (not e!682224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201415 (= res!799756 (validMask!0 mask!1564))))

(declare-fun call!57437 () ListLongMap!17695)

(declare-fun c!117504 () Bool)

(declare-fun bm!57437 () Bool)

(declare-fun +!4001 (ListLongMap!17695 tuple2!19726) ListLongMap!17695)

(assert (=> bm!57437 (= call!57437 (+!4001 lt!544316 (ite (or c!117504 c!117503) (tuple2!19727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!57438 () Bool)

(declare-fun call!57441 () Bool)

(assert (=> bm!57438 (= call!57438 call!57441)))

(declare-fun bm!57439 () Bool)

(declare-fun addStillContains!985 (ListLongMap!17695 (_ BitVec 64) V!45873 (_ BitVec 64)) Unit!39687)

(assert (=> bm!57439 (= call!57443 (addStillContains!985 lt!544316 (ite (or c!117504 c!117503) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117504 c!117503) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1201416 () Bool)

(declare-fun e!682236 () Bool)

(assert (=> b!1201416 (= e!682236 e!682225)))

(declare-fun res!799752 () Bool)

(assert (=> b!1201416 (=> res!799752 e!682225)))

(assert (=> b!1201416 (= res!799752 (not (= from!1455 i!673)))))

(declare-fun lt!544317 () ListLongMap!17695)

(assert (=> b!1201416 (= lt!544317 (getCurrentListMapNoExtraKeys!5311 lt!544309 lt!544307 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3188 (Int (_ BitVec 64)) V!45873)

(assert (=> b!1201416 (= lt!544307 (array!77819 (store (arr!37554 _values!996) i!673 (ValueCellFull!14570 (dynLambda!3188 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38092 _values!996)))))

(declare-fun lt!544318 () ListLongMap!17695)

(assert (=> b!1201416 (= lt!544318 (getCurrentListMapNoExtraKeys!5311 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!57440 () Bool)

(declare-fun call!57440 () ListLongMap!17695)

(assert (=> bm!57440 (= call!57440 call!57437)))

(declare-fun b!1201417 () Bool)

(assert (=> b!1201417 (= e!682226 true)))

(declare-fun lt!544313 () Unit!39687)

(assert (=> b!1201417 (= lt!544313 e!682229)))

(assert (=> b!1201417 (= c!117504 (and (not lt!544312) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1201417 (= lt!544312 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1201418 () Bool)

(declare-fun res!799764 () Bool)

(assert (=> b!1201418 (=> (not res!799764) (not e!682224))))

(assert (=> b!1201418 (= res!799764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47681 () Bool)

(declare-fun mapRes!47681 () Bool)

(assert (=> mapIsEmpty!47681 mapRes!47681))

(declare-fun mapNonEmpty!47681 () Bool)

(declare-fun tp!90554 () Bool)

(assert (=> mapNonEmpty!47681 (= mapRes!47681 (and tp!90554 e!682233))))

(declare-fun mapRest!47681 () (Array (_ BitVec 32) ValueCell!14570))

(declare-fun mapValue!47681 () ValueCell!14570)

(declare-fun mapKey!47681 () (_ BitVec 32))

(assert (=> mapNonEmpty!47681 (= (arr!37554 _values!996) (store mapRest!47681 mapKey!47681 mapValue!47681))))

(declare-fun b!1201419 () Bool)

(assert (=> b!1201419 call!57438))

(declare-fun lt!544308 () Unit!39687)

(assert (=> b!1201419 (= lt!544308 call!57444)))

(assert (=> b!1201419 (= e!682227 lt!544308)))

(declare-fun bm!57441 () Bool)

(declare-fun lt!544305 () ListLongMap!17695)

(assert (=> bm!57441 (= call!57441 (contains!6858 (ite c!117504 lt!544305 call!57440) k0!934))))

(declare-fun b!1201420 () Bool)

(assert (=> b!1201420 (= e!682235 (and e!682230 mapRes!47681))))

(declare-fun condMapEmpty!47681 () Bool)

(declare-fun mapDefault!47681 () ValueCell!14570)

(assert (=> b!1201420 (= condMapEmpty!47681 (= (arr!37554 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14570)) mapDefault!47681)))))

(declare-fun b!1201421 () Bool)

(assert (=> b!1201421 (= e!682232 (not e!682236))))

(declare-fun res!799755 () Bool)

(assert (=> b!1201421 (=> res!799755 e!682236)))

(assert (=> b!1201421 (= res!799755 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201421 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544311 () Unit!39687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77816 (_ BitVec 64) (_ BitVec 32)) Unit!39687)

(assert (=> b!1201421 (= lt!544311 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201422 () Bool)

(declare-fun lt!544310 () Unit!39687)

(assert (=> b!1201422 (= e!682229 lt!544310)))

(declare-fun lt!544306 () Unit!39687)

(assert (=> b!1201422 (= lt!544306 call!57443)))

(assert (=> b!1201422 (= lt!544305 call!57437)))

(assert (=> b!1201422 call!57441))

(assert (=> b!1201422 (= lt!544310 (addStillContains!985 lt!544305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1201422 (contains!6858 (+!4001 lt!544305 (tuple2!19727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(assert (= (and start!100526 res!799751) b!1201415))

(assert (= (and b!1201415 res!799756) b!1201404))

(assert (= (and b!1201404 res!799763) b!1201418))

(assert (= (and b!1201418 res!799764) b!1201410))

(assert (= (and b!1201410 res!799758) b!1201409))

(assert (= (and b!1201409 res!799754) b!1201400))

(assert (= (and b!1201400 res!799762) b!1201403))

(assert (= (and b!1201403 res!799761) b!1201412))

(assert (= (and b!1201412 res!799759) b!1201405))

(assert (= (and b!1201405 res!799760) b!1201421))

(assert (= (and b!1201421 (not res!799755)) b!1201416))

(assert (= (and b!1201416 (not res!799752)) b!1201398))

(assert (= (and b!1201398 c!117501) b!1201408))

(assert (= (and b!1201398 (not c!117501)) b!1201406))

(assert (= (or b!1201408 b!1201406) bm!57434))

(assert (= (or b!1201408 b!1201406) bm!57435))

(assert (= (and b!1201398 (not res!799753)) b!1201411))

(assert (= (and b!1201411 (not res!799757)) b!1201417))

(assert (= (and b!1201417 c!117504) b!1201422))

(assert (= (and b!1201417 (not c!117504)) b!1201399))

(assert (= (and b!1201399 c!117503) b!1201419))

(assert (= (and b!1201399 (not c!117503)) b!1201413))

(assert (= (and b!1201413 c!117502) b!1201401))

(assert (= (and b!1201413 (not c!117502)) b!1201407))

(assert (= (or b!1201419 b!1201401) bm!57436))

(assert (= (or b!1201419 b!1201401) bm!57440))

(assert (= (or b!1201419 b!1201401) bm!57438))

(assert (= (or b!1201422 bm!57438) bm!57441))

(assert (= (or b!1201422 bm!57436) bm!57439))

(assert (= (or b!1201422 bm!57440) bm!57437))

(assert (= (and b!1201420 condMapEmpty!47681) mapIsEmpty!47681))

(assert (= (and b!1201420 (not condMapEmpty!47681)) mapNonEmpty!47681))

(get-info :version)

(assert (= (and mapNonEmpty!47681 ((_ is ValueCellFull!14570) mapValue!47681)) b!1201402))

(assert (= (and b!1201420 ((_ is ValueCellFull!14570) mapDefault!47681)) b!1201414))

(assert (= start!100526 b!1201420))

(declare-fun b_lambda!21033 () Bool)

(assert (=> (not b_lambda!21033) (not b!1201416)))

(declare-fun t!39341 () Bool)

(declare-fun tb!10647 () Bool)

(assert (=> (and start!100526 (= defaultEntry!1004 defaultEntry!1004) t!39341) tb!10647))

(declare-fun result!21879 () Bool)

(assert (=> tb!10647 (= result!21879 tp_is_empty!30559)))

(assert (=> b!1201416 t!39341))

(declare-fun b_and!42577 () Bool)

(assert (= b_and!42575 (and (=> t!39341 result!21879) b_and!42577)))

(declare-fun m!1106997 () Bool)

(assert (=> b!1201416 m!1106997))

(declare-fun m!1106999 () Bool)

(assert (=> b!1201416 m!1106999))

(declare-fun m!1107001 () Bool)

(assert (=> b!1201416 m!1107001))

(declare-fun m!1107003 () Bool)

(assert (=> b!1201416 m!1107003))

(declare-fun m!1107005 () Bool)

(assert (=> b!1201421 m!1107005))

(declare-fun m!1107007 () Bool)

(assert (=> b!1201421 m!1107007))

(declare-fun m!1107009 () Bool)

(assert (=> bm!57435 m!1107009))

(declare-fun m!1107011 () Bool)

(assert (=> bm!57439 m!1107011))

(declare-fun m!1107013 () Bool)

(assert (=> bm!57437 m!1107013))

(declare-fun m!1107015 () Bool)

(assert (=> b!1201398 m!1107015))

(declare-fun m!1107017 () Bool)

(assert (=> b!1201398 m!1107017))

(declare-fun m!1107019 () Bool)

(assert (=> b!1201400 m!1107019))

(declare-fun m!1107021 () Bool)

(assert (=> b!1201418 m!1107021))

(declare-fun m!1107023 () Bool)

(assert (=> b!1201410 m!1107023))

(declare-fun m!1107025 () Bool)

(assert (=> start!100526 m!1107025))

(declare-fun m!1107027 () Bool)

(assert (=> start!100526 m!1107027))

(declare-fun m!1107029 () Bool)

(assert (=> b!1201412 m!1107029))

(declare-fun m!1107031 () Bool)

(assert (=> b!1201412 m!1107031))

(declare-fun m!1107033 () Bool)

(assert (=> b!1201405 m!1107033))

(declare-fun m!1107035 () Bool)

(assert (=> b!1201415 m!1107035))

(declare-fun m!1107037 () Bool)

(assert (=> b!1201408 m!1107037))

(declare-fun m!1107039 () Bool)

(assert (=> bm!57434 m!1107039))

(declare-fun m!1107041 () Bool)

(assert (=> b!1201422 m!1107041))

(declare-fun m!1107043 () Bool)

(assert (=> b!1201422 m!1107043))

(assert (=> b!1201422 m!1107043))

(declare-fun m!1107045 () Bool)

(assert (=> b!1201422 m!1107045))

(declare-fun m!1107047 () Bool)

(assert (=> b!1201403 m!1107047))

(declare-fun m!1107049 () Bool)

(assert (=> b!1201411 m!1107049))

(assert (=> b!1201411 m!1107009))

(declare-fun m!1107051 () Bool)

(assert (=> mapNonEmpty!47681 m!1107051))

(declare-fun m!1107053 () Bool)

(assert (=> bm!57441 m!1107053))

(check-sat (not bm!57441) (not b!1201405) (not bm!57434) (not b!1201421) (not mapNonEmpty!47681) (not b!1201416) tp_is_empty!30559 (not bm!57435) (not b_lambda!21033) (not b!1201400) (not b!1201398) (not b_next!25855) (not bm!57439) (not b!1201408) (not bm!57437) (not b!1201415) (not b!1201422) (not b!1201412) (not b!1201418) (not b!1201411) b_and!42577 (not b!1201410) (not start!100526))
(check-sat b_and!42577 (not b_next!25855))
