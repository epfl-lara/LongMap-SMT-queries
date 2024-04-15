; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98804 () Bool)

(assert start!98804)

(declare-fun b_free!24415 () Bool)

(declare-fun b_next!24415 () Bool)

(assert (=> start!98804 (= b_free!24415 (not b_next!24415))))

(declare-fun tp!85955 () Bool)

(declare-fun b_and!39657 () Bool)

(assert (=> start!98804 (= tp!85955 b_and!39657)))

(declare-fun b!1153978 () Bool)

(declare-fun e!656300 () Bool)

(declare-fun tp_is_empty!28945 () Bool)

(assert (=> b!1153978 (= e!656300 tp_is_empty!28945)))

(declare-fun bm!54496 () Bool)

(declare-fun call!54505 () Bool)

(declare-fun call!54500 () Bool)

(assert (=> bm!54496 (= call!54505 call!54500)))

(declare-datatypes ((V!43721 0))(
  ( (V!43722 (val!14529 Int)) )
))
(declare-datatypes ((tuple2!18542 0))(
  ( (tuple2!18543 (_1!9282 (_ BitVec 64)) (_2!9282 V!43721)) )
))
(declare-datatypes ((List!25272 0))(
  ( (Nil!25269) (Cons!25268 (h!26477 tuple2!18542) (t!36670 List!25272)) )
))
(declare-datatypes ((ListLongMap!16511 0))(
  ( (ListLongMap!16512 (toList!8271 List!25272)) )
))
(declare-fun call!54504 () ListLongMap!16511)

(declare-fun lt!517253 () ListLongMap!16511)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!54497 () Bool)

(declare-fun c!114569 () Bool)

(declare-fun contains!6723 (ListLongMap!16511 (_ BitVec 64)) Bool)

(assert (=> bm!54497 (= call!54500 (contains!6723 (ite c!114569 lt!517253 call!54504) k0!934))))

(declare-fun mapIsEmpty!45242 () Bool)

(declare-fun mapRes!45242 () Bool)

(assert (=> mapIsEmpty!45242 mapRes!45242))

(declare-fun b!1153979 () Bool)

(declare-fun res!766950 () Bool)

(declare-fun e!656289 () Bool)

(assert (=> b!1153979 (=> (not res!766950) (not e!656289))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74654 0))(
  ( (array!74655 (arr!35978 (Array (_ BitVec 32) (_ BitVec 64))) (size!36516 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74654)

(assert (=> b!1153979 (= res!766950 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36516 _keys!1208))))))

(declare-fun b!1153980 () Bool)

(declare-fun e!656293 () Bool)

(assert (=> b!1153980 (= e!656293 true)))

(declare-fun e!656290 () Bool)

(assert (=> b!1153980 e!656290))

(declare-fun res!766949 () Bool)

(assert (=> b!1153980 (=> (not res!766949) (not e!656290))))

(declare-fun lt!517237 () ListLongMap!16511)

(declare-fun lt!517236 () ListLongMap!16511)

(assert (=> b!1153980 (= res!766949 (= lt!517237 lt!517236))))

(declare-fun lt!517239 () ListLongMap!16511)

(declare-fun -!1330 (ListLongMap!16511 (_ BitVec 64)) ListLongMap!16511)

(assert (=> b!1153980 (= lt!517237 (-!1330 lt!517239 k0!934))))

(declare-fun lt!517240 () V!43721)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!3682 (ListLongMap!16511 tuple2!18542) ListLongMap!16511)

(assert (=> b!1153980 (= (-!1330 (+!3682 lt!517236 (tuple2!18543 (select (arr!35978 _keys!1208) from!1455) lt!517240)) (select (arr!35978 _keys!1208) from!1455)) lt!517236)))

(declare-datatypes ((Unit!37820 0))(
  ( (Unit!37821) )
))
(declare-fun lt!517245 () Unit!37820)

(declare-fun addThenRemoveForNewKeyIsSame!183 (ListLongMap!16511 (_ BitVec 64) V!43721) Unit!37820)

(assert (=> b!1153980 (= lt!517245 (addThenRemoveForNewKeyIsSame!183 lt!517236 (select (arr!35978 _keys!1208) from!1455) lt!517240))))

(declare-fun lt!517254 () V!43721)

(declare-datatypes ((ValueCell!13763 0))(
  ( (ValueCellFull!13763 (v!17165 V!43721)) (EmptyCell!13763) )
))
(declare-datatypes ((array!74656 0))(
  ( (array!74657 (arr!35979 (Array (_ BitVec 32) ValueCell!13763)) (size!36517 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74656)

(declare-fun get!18335 (ValueCell!13763 V!43721) V!43721)

(assert (=> b!1153980 (= lt!517240 (get!18335 (select (arr!35979 _values!996) from!1455) lt!517254))))

(declare-fun lt!517238 () Unit!37820)

(declare-fun e!656295 () Unit!37820)

(assert (=> b!1153980 (= lt!517238 e!656295)))

(declare-fun c!114567 () Bool)

(assert (=> b!1153980 (= c!114567 (contains!6723 lt!517236 k0!934))))

(declare-fun zeroValue!944 () V!43721)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43721)

(declare-fun getCurrentListMapNoExtraKeys!4752 (array!74654 array!74656 (_ BitVec 32) (_ BitVec 32) V!43721 V!43721 (_ BitVec 32) Int) ListLongMap!16511)

(assert (=> b!1153980 (= lt!517236 (getCurrentListMapNoExtraKeys!4752 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114570 () Bool)

(declare-fun bm!54498 () Bool)

(declare-fun call!54503 () ListLongMap!16511)

(assert (=> bm!54498 (= call!54503 (+!3682 (ite c!114569 lt!517253 lt!517236) (ite c!114569 (tuple2!18543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114570 (tuple2!18543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1153981 () Bool)

(declare-fun Unit!37822 () Unit!37820)

(assert (=> b!1153981 (= e!656295 Unit!37822)))

(declare-fun lt!517241 () Bool)

(assert (=> b!1153981 (= lt!517241 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1153981 (= c!114569 (and (not lt!517241) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517247 () Unit!37820)

(declare-fun e!656303 () Unit!37820)

(assert (=> b!1153981 (= lt!517247 e!656303)))

(declare-fun lt!517257 () Unit!37820)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!480 (array!74654 array!74656 (_ BitVec 32) (_ BitVec 32) V!43721 V!43721 (_ BitVec 64) (_ BitVec 32) Int) Unit!37820)

(assert (=> b!1153981 (= lt!517257 (lemmaListMapContainsThenArrayContainsFrom!480 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114571 () Bool)

(assert (=> b!1153981 (= c!114571 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766939 () Bool)

(declare-fun e!656297 () Bool)

(assert (=> b!1153981 (= res!766939 e!656297)))

(declare-fun e!656298 () Bool)

(assert (=> b!1153981 (=> (not res!766939) (not e!656298))))

(assert (=> b!1153981 e!656298))

(declare-fun lt!517251 () Unit!37820)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74654 (_ BitVec 32) (_ BitVec 32)) Unit!37820)

(assert (=> b!1153981 (= lt!517251 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25273 0))(
  ( (Nil!25270) (Cons!25269 (h!26478 (_ BitVec 64)) (t!36671 List!25273)) )
))
(declare-fun arrayNoDuplicates!0 (array!74654 (_ BitVec 32) List!25273) Bool)

(assert (=> b!1153981 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25270)))

(declare-fun lt!517244 () Unit!37820)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74654 (_ BitVec 64) (_ BitVec 32) List!25273) Unit!37820)

(assert (=> b!1153981 (= lt!517244 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25270))))

(assert (=> b!1153981 false))

(declare-fun b!1153982 () Bool)

(declare-fun res!766947 () Bool)

(assert (=> b!1153982 (=> (not res!766947) (not e!656289))))

(assert (=> b!1153982 (= res!766947 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25270))))

(declare-fun b!1153983 () Bool)

(declare-fun e!656304 () Bool)

(declare-fun e!656291 () Bool)

(assert (=> b!1153983 (= e!656304 (and e!656291 mapRes!45242))))

(declare-fun condMapEmpty!45242 () Bool)

(declare-fun mapDefault!45242 () ValueCell!13763)

(assert (=> b!1153983 (= condMapEmpty!45242 (= (arr!35979 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13763)) mapDefault!45242)))))

(declare-fun b!1153984 () Bool)

(declare-fun e!656288 () Bool)

(declare-fun e!656299 () Bool)

(assert (=> b!1153984 (= e!656288 e!656299)))

(declare-fun res!766944 () Bool)

(assert (=> b!1153984 (=> res!766944 e!656299)))

(assert (=> b!1153984 (= res!766944 (not (= from!1455 i!673)))))

(declare-fun lt!517248 () array!74654)

(declare-fun lt!517246 () array!74656)

(declare-fun lt!517255 () ListLongMap!16511)

(assert (=> b!1153984 (= lt!517255 (getCurrentListMapNoExtraKeys!4752 lt!517248 lt!517246 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1153984 (= lt!517246 (array!74657 (store (arr!35979 _values!996) i!673 (ValueCellFull!13763 lt!517254)) (size!36517 _values!996)))))

(declare-fun dynLambda!2712 (Int (_ BitVec 64)) V!43721)

(assert (=> b!1153984 (= lt!517254 (dynLambda!2712 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1153984 (= lt!517239 (getCurrentListMapNoExtraKeys!4752 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1153985 () Bool)

(declare-fun e!656294 () Unit!37820)

(declare-fun lt!517243 () Unit!37820)

(assert (=> b!1153985 (= e!656294 lt!517243)))

(declare-fun call!54499 () Unit!37820)

(assert (=> b!1153985 (= lt!517243 call!54499)))

(assert (=> b!1153985 call!54505))

(declare-fun b!1153986 () Bool)

(assert (=> b!1153986 (= e!656290 (= lt!517237 (getCurrentListMapNoExtraKeys!4752 lt!517248 lt!517246 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!54506 () Unit!37820)

(declare-fun bm!54499 () Bool)

(declare-fun addStillContains!894 (ListLongMap!16511 (_ BitVec 64) V!43721 (_ BitVec 64)) Unit!37820)

(assert (=> bm!54499 (= call!54506 (addStillContains!894 lt!517236 (ite (or c!114569 c!114570) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114569 c!114570) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1153987 () Bool)

(declare-fun e!656296 () Bool)

(assert (=> b!1153987 (= e!656289 e!656296)))

(declare-fun res!766945 () Bool)

(assert (=> b!1153987 (=> (not res!766945) (not e!656296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74654 (_ BitVec 32)) Bool)

(assert (=> b!1153987 (= res!766945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517248 mask!1564))))

(assert (=> b!1153987 (= lt!517248 (array!74655 (store (arr!35978 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36516 _keys!1208)))))

(declare-fun b!1153988 () Bool)

(assert (=> b!1153988 (= e!656296 (not e!656288))))

(declare-fun res!766938 () Bool)

(assert (=> b!1153988 (=> res!766938 e!656288)))

(assert (=> b!1153988 (= res!766938 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153988 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517252 () Unit!37820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74654 (_ BitVec 64) (_ BitVec 32)) Unit!37820)

(assert (=> b!1153988 (= lt!517252 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!54500 () Bool)

(assert (=> bm!54500 (= call!54499 call!54506)))

(declare-fun bm!54501 () Bool)

(assert (=> bm!54501 (= call!54504 call!54503)))

(declare-fun b!1153989 () Bool)

(declare-fun res!766940 () Bool)

(assert (=> b!1153989 (=> (not res!766940) (not e!656289))))

(assert (=> b!1153989 (= res!766940 (= (select (arr!35978 _keys!1208) i!673) k0!934))))

(declare-fun b!1153990 () Bool)

(declare-fun res!766948 () Bool)

(assert (=> b!1153990 (=> (not res!766948) (not e!656296))))

(assert (=> b!1153990 (= res!766948 (arrayNoDuplicates!0 lt!517248 #b00000000000000000000000000000000 Nil!25270))))

(declare-fun call!54501 () ListLongMap!16511)

(declare-fun call!54502 () ListLongMap!16511)

(declare-fun b!1153991 () Bool)

(declare-fun e!656292 () Bool)

(assert (=> b!1153991 (= e!656292 (= call!54501 (-!1330 call!54502 k0!934)))))

(declare-fun b!1153992 () Bool)

(assert (=> b!1153992 (= e!656291 tp_is_empty!28945)))

(declare-fun bm!54502 () Bool)

(assert (=> bm!54502 (= call!54501 (getCurrentListMapNoExtraKeys!4752 lt!517248 lt!517246 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54503 () Bool)

(assert (=> bm!54503 (= call!54502 (getCurrentListMapNoExtraKeys!4752 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153993 () Bool)

(declare-fun res!766951 () Bool)

(assert (=> b!1153993 (=> (not res!766951) (not e!656289))))

(assert (=> b!1153993 (= res!766951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1153994 () Bool)

(declare-fun res!766946 () Bool)

(assert (=> b!1153994 (=> (not res!766946) (not e!656289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153994 (= res!766946 (validMask!0 mask!1564))))

(declare-fun b!1153995 () Bool)

(assert (=> b!1153995 (contains!6723 call!54503 k0!934)))

(declare-fun lt!517249 () Unit!37820)

(assert (=> b!1153995 (= lt!517249 (addStillContains!894 lt!517253 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1153995 call!54500))

(assert (=> b!1153995 (= lt!517253 (+!3682 lt!517236 (tuple2!18543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517250 () Unit!37820)

(assert (=> b!1153995 (= lt!517250 call!54506)))

(assert (=> b!1153995 (= e!656303 lt!517249)))

(declare-fun b!1153996 () Bool)

(declare-fun res!766952 () Bool)

(assert (=> b!1153996 (=> (not res!766952) (not e!656289))))

(assert (=> b!1153996 (= res!766952 (and (= (size!36517 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36516 _keys!1208) (size!36517 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153997 () Bool)

(assert (=> b!1153997 (= e!656298 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153998 () Bool)

(assert (=> b!1153998 (= c!114570 (and (not lt!517241) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1153998 (= e!656303 e!656294)))

(declare-fun b!1153999 () Bool)

(declare-fun e!656302 () Unit!37820)

(declare-fun Unit!37823 () Unit!37820)

(assert (=> b!1153999 (= e!656302 Unit!37823)))

(declare-fun b!1154000 () Bool)

(declare-fun res!766942 () Bool)

(assert (=> b!1154000 (=> (not res!766942) (not e!656289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154000 (= res!766942 (validKeyInArray!0 k0!934))))

(declare-fun b!1154001 () Bool)

(declare-fun Unit!37824 () Unit!37820)

(assert (=> b!1154001 (= e!656295 Unit!37824)))

(declare-fun b!1154002 () Bool)

(assert (=> b!1154002 (= e!656294 e!656302)))

(declare-fun c!114572 () Bool)

(assert (=> b!1154002 (= c!114572 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517241))))

(declare-fun b!1154003 () Bool)

(assert (=> b!1154003 (= e!656299 e!656293)))

(declare-fun res!766941 () Bool)

(assert (=> b!1154003 (=> res!766941 e!656293)))

(assert (=> b!1154003 (= res!766941 (not (= (select (arr!35978 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1154003 e!656292))

(declare-fun c!114568 () Bool)

(assert (=> b!1154003 (= c!114568 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517242 () Unit!37820)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!602 (array!74654 array!74656 (_ BitVec 32) (_ BitVec 32) V!43721 V!43721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37820)

(assert (=> b!1154003 (= lt!517242 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!602 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154004 () Bool)

(assert (=> b!1154004 (= e!656297 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154005 () Bool)

(assert (=> b!1154005 (= e!656297 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517241) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!766943 () Bool)

(assert (=> start!98804 (=> (not res!766943) (not e!656289))))

(assert (=> start!98804 (= res!766943 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36516 _keys!1208))))))

(assert (=> start!98804 e!656289))

(assert (=> start!98804 tp_is_empty!28945))

(declare-fun array_inv!27644 (array!74654) Bool)

(assert (=> start!98804 (array_inv!27644 _keys!1208)))

(assert (=> start!98804 true))

(assert (=> start!98804 tp!85955))

(declare-fun array_inv!27645 (array!74656) Bool)

(assert (=> start!98804 (and (array_inv!27645 _values!996) e!656304)))

(declare-fun mapNonEmpty!45242 () Bool)

(declare-fun tp!85956 () Bool)

(assert (=> mapNonEmpty!45242 (= mapRes!45242 (and tp!85956 e!656300))))

(declare-fun mapValue!45242 () ValueCell!13763)

(declare-fun mapKey!45242 () (_ BitVec 32))

(declare-fun mapRest!45242 () (Array (_ BitVec 32) ValueCell!13763))

(assert (=> mapNonEmpty!45242 (= (arr!35979 _values!996) (store mapRest!45242 mapKey!45242 mapValue!45242))))

(declare-fun b!1154006 () Bool)

(assert (=> b!1154006 (= e!656292 (= call!54501 call!54502))))

(declare-fun b!1154007 () Bool)

(assert (=> b!1154007 call!54505))

(declare-fun lt!517256 () Unit!37820)

(assert (=> b!1154007 (= lt!517256 call!54499)))

(assert (=> b!1154007 (= e!656302 lt!517256)))

(assert (= (and start!98804 res!766943) b!1153994))

(assert (= (and b!1153994 res!766946) b!1153996))

(assert (= (and b!1153996 res!766952) b!1153993))

(assert (= (and b!1153993 res!766951) b!1153982))

(assert (= (and b!1153982 res!766947) b!1153979))

(assert (= (and b!1153979 res!766950) b!1154000))

(assert (= (and b!1154000 res!766942) b!1153989))

(assert (= (and b!1153989 res!766940) b!1153987))

(assert (= (and b!1153987 res!766945) b!1153990))

(assert (= (and b!1153990 res!766948) b!1153988))

(assert (= (and b!1153988 (not res!766938)) b!1153984))

(assert (= (and b!1153984 (not res!766944)) b!1154003))

(assert (= (and b!1154003 c!114568) b!1153991))

(assert (= (and b!1154003 (not c!114568)) b!1154006))

(assert (= (or b!1153991 b!1154006) bm!54502))

(assert (= (or b!1153991 b!1154006) bm!54503))

(assert (= (and b!1154003 (not res!766941)) b!1153980))

(assert (= (and b!1153980 c!114567) b!1153981))

(assert (= (and b!1153980 (not c!114567)) b!1154001))

(assert (= (and b!1153981 c!114569) b!1153995))

(assert (= (and b!1153981 (not c!114569)) b!1153998))

(assert (= (and b!1153998 c!114570) b!1153985))

(assert (= (and b!1153998 (not c!114570)) b!1154002))

(assert (= (and b!1154002 c!114572) b!1154007))

(assert (= (and b!1154002 (not c!114572)) b!1153999))

(assert (= (or b!1153985 b!1154007) bm!54500))

(assert (= (or b!1153985 b!1154007) bm!54501))

(assert (= (or b!1153985 b!1154007) bm!54496))

(assert (= (or b!1153995 bm!54496) bm!54497))

(assert (= (or b!1153995 bm!54500) bm!54499))

(assert (= (or b!1153995 bm!54501) bm!54498))

(assert (= (and b!1153981 c!114571) b!1154004))

(assert (= (and b!1153981 (not c!114571)) b!1154005))

(assert (= (and b!1153981 res!766939) b!1153997))

(assert (= (and b!1153980 res!766949) b!1153986))

(assert (= (and b!1153983 condMapEmpty!45242) mapIsEmpty!45242))

(assert (= (and b!1153983 (not condMapEmpty!45242)) mapNonEmpty!45242))

(get-info :version)

(assert (= (and mapNonEmpty!45242 ((_ is ValueCellFull!13763) mapValue!45242)) b!1153978))

(assert (= (and b!1153983 ((_ is ValueCellFull!13763) mapDefault!45242)) b!1153992))

(assert (= start!98804 b!1153983))

(declare-fun b_lambda!19503 () Bool)

(assert (=> (not b_lambda!19503) (not b!1153984)))

(declare-fun t!36669 () Bool)

(declare-fun tb!9219 () Bool)

(assert (=> (and start!98804 (= defaultEntry!1004 defaultEntry!1004) t!36669) tb!9219))

(declare-fun result!19011 () Bool)

(assert (=> tb!9219 (= result!19011 tp_is_empty!28945)))

(assert (=> b!1153984 t!36669))

(declare-fun b_and!39659 () Bool)

(assert (= b_and!39657 (and (=> t!36669 result!19011) b_and!39659)))

(declare-fun m!1063267 () Bool)

(assert (=> b!1153995 m!1063267))

(declare-fun m!1063269 () Bool)

(assert (=> b!1153995 m!1063269))

(declare-fun m!1063271 () Bool)

(assert (=> b!1153995 m!1063271))

(declare-fun m!1063273 () Bool)

(assert (=> bm!54502 m!1063273))

(declare-fun m!1063275 () Bool)

(assert (=> b!1153984 m!1063275))

(declare-fun m!1063277 () Bool)

(assert (=> b!1153984 m!1063277))

(declare-fun m!1063279 () Bool)

(assert (=> b!1153984 m!1063279))

(declare-fun m!1063281 () Bool)

(assert (=> b!1153984 m!1063281))

(declare-fun m!1063283 () Bool)

(assert (=> b!1153981 m!1063283))

(declare-fun m!1063285 () Bool)

(assert (=> b!1153981 m!1063285))

(declare-fun m!1063287 () Bool)

(assert (=> b!1153981 m!1063287))

(declare-fun m!1063289 () Bool)

(assert (=> b!1153981 m!1063289))

(declare-fun m!1063291 () Bool)

(assert (=> b!1153987 m!1063291))

(declare-fun m!1063293 () Bool)

(assert (=> b!1153987 m!1063293))

(declare-fun m!1063295 () Bool)

(assert (=> bm!54503 m!1063295))

(declare-fun m!1063297 () Bool)

(assert (=> b!1153989 m!1063297))

(declare-fun m!1063299 () Bool)

(assert (=> b!1153993 m!1063299))

(assert (=> b!1153980 m!1063295))

(declare-fun m!1063301 () Bool)

(assert (=> b!1153980 m!1063301))

(declare-fun m!1063303 () Bool)

(assert (=> b!1153980 m!1063303))

(declare-fun m!1063305 () Bool)

(assert (=> b!1153980 m!1063305))

(declare-fun m!1063307 () Bool)

(assert (=> b!1153980 m!1063307))

(declare-fun m!1063309 () Bool)

(assert (=> b!1153980 m!1063309))

(declare-fun m!1063311 () Bool)

(assert (=> b!1153980 m!1063311))

(declare-fun m!1063313 () Bool)

(assert (=> b!1153980 m!1063313))

(assert (=> b!1153980 m!1063309))

(assert (=> b!1153980 m!1063307))

(assert (=> b!1153980 m!1063301))

(declare-fun m!1063315 () Bool)

(assert (=> b!1153980 m!1063315))

(assert (=> b!1153980 m!1063301))

(declare-fun m!1063317 () Bool)

(assert (=> bm!54497 m!1063317))

(declare-fun m!1063319 () Bool)

(assert (=> b!1153988 m!1063319))

(declare-fun m!1063321 () Bool)

(assert (=> b!1153988 m!1063321))

(declare-fun m!1063323 () Bool)

(assert (=> start!98804 m!1063323))

(declare-fun m!1063325 () Bool)

(assert (=> start!98804 m!1063325))

(declare-fun m!1063327 () Bool)

(assert (=> mapNonEmpty!45242 m!1063327))

(assert (=> b!1153986 m!1063273))

(declare-fun m!1063329 () Bool)

(assert (=> bm!54498 m!1063329))

(declare-fun m!1063331 () Bool)

(assert (=> b!1153994 m!1063331))

(declare-fun m!1063333 () Bool)

(assert (=> b!1153997 m!1063333))

(assert (=> b!1154004 m!1063333))

(assert (=> b!1154003 m!1063301))

(declare-fun m!1063335 () Bool)

(assert (=> b!1154003 m!1063335))

(declare-fun m!1063337 () Bool)

(assert (=> b!1153991 m!1063337))

(declare-fun m!1063339 () Bool)

(assert (=> b!1153990 m!1063339))

(declare-fun m!1063341 () Bool)

(assert (=> bm!54499 m!1063341))

(declare-fun m!1063343 () Bool)

(assert (=> b!1153982 m!1063343))

(declare-fun m!1063345 () Bool)

(assert (=> b!1154000 m!1063345))

(check-sat (not b!1154000) (not b_next!24415) (not b_lambda!19503) (not b!1153980) (not b!1153988) (not b!1154004) (not b!1153991) (not bm!54503) (not start!98804) (not bm!54499) (not b!1153990) (not b!1153994) (not bm!54497) (not b!1153982) tp_is_empty!28945 (not mapNonEmpty!45242) (not b!1154003) b_and!39659 (not b!1153984) (not b!1153987) (not bm!54502) (not b!1153981) (not b!1153986) (not bm!54498) (not b!1153993) (not b!1153995) (not b!1153997))
(check-sat b_and!39659 (not b_next!24415))
