; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101060 () Bool)

(assert start!101060)

(declare-fun b_free!25963 () Bool)

(declare-fun b_next!25963 () Bool)

(assert (=> start!101060 (= b_free!25963 (not b_next!25963))))

(declare-fun tp!90894 () Bool)

(declare-fun b_and!42933 () Bool)

(assert (=> start!101060 (= tp!90894 b_and!42933)))

(declare-fun bm!58968 () Bool)

(declare-fun call!58972 () Bool)

(declare-fun call!58978 () Bool)

(assert (=> bm!58968 (= call!58972 call!58978)))

(declare-fun b!1208450 () Bool)

(declare-fun e!686370 () Bool)

(declare-fun e!686364 () Bool)

(assert (=> b!1208450 (= e!686370 (not e!686364))))

(declare-fun res!803180 () Bool)

(assert (=> b!1208450 (=> res!803180 e!686364)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208450 (= res!803180 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78149 0))(
  ( (array!78150 (arr!37708 (Array (_ BitVec 32) (_ BitVec 64))) (size!38245 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78149)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208450 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39973 0))(
  ( (Unit!39974) )
))
(declare-fun lt!548181 () Unit!39973)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78149 (_ BitVec 64) (_ BitVec 32)) Unit!39973)

(assert (=> b!1208450 (= lt!548181 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-datatypes ((V!46017 0))(
  ( (V!46018 (val!15390 Int)) )
))
(declare-fun zeroValue!944 () V!46017)

(declare-fun bm!58969 () Bool)

(declare-fun c!119000 () Bool)

(declare-fun c!118996 () Bool)

(declare-datatypes ((tuple2!19762 0))(
  ( (tuple2!19763 (_1!9892 (_ BitVec 64)) (_2!9892 V!46017)) )
))
(declare-datatypes ((List!26569 0))(
  ( (Nil!26566) (Cons!26565 (h!27783 tuple2!19762) (t!39504 List!26569)) )
))
(declare-datatypes ((ListLongMap!17739 0))(
  ( (ListLongMap!17740 (toList!8885 List!26569)) )
))
(declare-fun lt!548178 () ListLongMap!17739)

(declare-fun minValue!944 () V!46017)

(declare-fun call!58977 () ListLongMap!17739)

(declare-fun +!4047 (ListLongMap!17739 tuple2!19762) ListLongMap!17739)

(assert (=> bm!58969 (= call!58977 (+!4047 lt!548178 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!548177 () array!78149)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!58975 () ListLongMap!17739)

(declare-fun bm!58970 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14624 0))(
  ( (ValueCellFull!14624 (v!18031 V!46017)) (EmptyCell!14624) )
))
(declare-datatypes ((array!78151 0))(
  ( (array!78152 (arr!37709 (Array (_ BitVec 32) ValueCell!14624)) (size!38246 (_ BitVec 32))) )
))
(declare-fun lt!548180 () array!78151)

(declare-fun getCurrentListMapNoExtraKeys!5347 (array!78149 array!78151 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 32) Int) ListLongMap!17739)

(assert (=> bm!58970 (= call!58975 (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208452 () Bool)

(declare-fun e!686373 () Bool)

(declare-fun call!58976 () ListLongMap!17739)

(assert (=> b!1208452 (= e!686373 (= call!58975 call!58976))))

(declare-fun lt!548186 () ListLongMap!17739)

(declare-fun call!58974 () ListLongMap!17739)

(declare-fun bm!58971 () Bool)

(declare-fun contains!6966 (ListLongMap!17739 (_ BitVec 64)) Bool)

(assert (=> bm!58971 (= call!58978 (contains!6966 (ite c!119000 lt!548186 call!58974) k0!934))))

(declare-fun b!1208453 () Bool)

(declare-fun e!686378 () Unit!39973)

(declare-fun Unit!39975 () Unit!39973)

(assert (=> b!1208453 (= e!686378 Unit!39975)))

(declare-fun b!1208454 () Bool)

(declare-fun e!686367 () Bool)

(assert (=> b!1208454 (= e!686367 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208455 () Bool)

(declare-fun res!803190 () Bool)

(declare-fun e!686365 () Bool)

(assert (=> b!1208455 (=> (not res!803190) (not e!686365))))

(assert (=> b!1208455 (= res!803190 (= (select (arr!37708 _keys!1208) i!673) k0!934))))

(declare-fun b!1208456 () Bool)

(declare-fun res!803191 () Bool)

(assert (=> b!1208456 (=> (not res!803191) (not e!686365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1208456 (= res!803191 (validKeyInArray!0 k0!934))))

(declare-fun b!1208457 () Bool)

(declare-fun e!686366 () Bool)

(declare-fun e!686368 () Bool)

(declare-fun mapRes!47859 () Bool)

(assert (=> b!1208457 (= e!686366 (and e!686368 mapRes!47859))))

(declare-fun condMapEmpty!47859 () Bool)

(declare-fun _values!996 () array!78151)

(declare-fun mapDefault!47859 () ValueCell!14624)

(assert (=> b!1208457 (= condMapEmpty!47859 (= (arr!37709 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14624)) mapDefault!47859)))))

(declare-fun b!1208458 () Bool)

(declare-fun res!803189 () Bool)

(assert (=> b!1208458 (=> (not res!803189) (not e!686365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1208458 (= res!803189 (validMask!0 mask!1564))))

(declare-fun b!1208459 () Bool)

(declare-fun e!686374 () Bool)

(assert (=> b!1208459 (= e!686364 e!686374)))

(declare-fun res!803193 () Bool)

(assert (=> b!1208459 (=> res!803193 e!686374)))

(assert (=> b!1208459 (= res!803193 (not (= from!1455 i!673)))))

(declare-fun lt!548190 () ListLongMap!17739)

(assert (=> b!1208459 (= lt!548190 (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3267 (Int (_ BitVec 64)) V!46017)

(assert (=> b!1208459 (= lt!548180 (array!78152 (store (arr!37709 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38246 _values!996)))))

(declare-fun lt!548182 () ListLongMap!17739)

(assert (=> b!1208459 (= lt!548182 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1208460 () Bool)

(declare-fun res!803186 () Bool)

(assert (=> b!1208460 (=> (not res!803186) (not e!686365))))

(assert (=> b!1208460 (= res!803186 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38245 _keys!1208))))))

(declare-fun bm!58972 () Bool)

(assert (=> bm!58972 (= call!58974 call!58977)))

(declare-fun res!803179 () Bool)

(assert (=> start!101060 (=> (not res!803179) (not e!686365))))

(assert (=> start!101060 (= res!803179 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38245 _keys!1208))))))

(assert (=> start!101060 e!686365))

(declare-fun tp_is_empty!30667 () Bool)

(assert (=> start!101060 tp_is_empty!30667))

(declare-fun array_inv!28792 (array!78149) Bool)

(assert (=> start!101060 (array_inv!28792 _keys!1208)))

(assert (=> start!101060 true))

(assert (=> start!101060 tp!90894))

(declare-fun array_inv!28793 (array!78151) Bool)

(assert (=> start!101060 (and (array_inv!28793 _values!996) e!686366)))

(declare-fun b!1208451 () Bool)

(declare-fun e!686369 () Unit!39973)

(declare-fun lt!548188 () Unit!39973)

(assert (=> b!1208451 (= e!686369 lt!548188)))

(declare-fun lt!548185 () Unit!39973)

(declare-fun call!58971 () Unit!39973)

(assert (=> b!1208451 (= lt!548185 call!58971)))

(assert (=> b!1208451 (= lt!548186 call!58977)))

(assert (=> b!1208451 call!58978))

(declare-fun addStillContains!1032 (ListLongMap!17739 (_ BitVec 64) V!46017 (_ BitVec 64)) Unit!39973)

(assert (=> b!1208451 (= lt!548188 (addStillContains!1032 lt!548186 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1208451 (contains!6966 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1208461 () Bool)

(declare-fun -!1822 (ListLongMap!17739 (_ BitVec 64)) ListLongMap!17739)

(assert (=> b!1208461 (= e!686373 (= call!58975 (-!1822 call!58976 k0!934)))))

(declare-fun b!1208462 () Bool)

(declare-fun e!686376 () Bool)

(assert (=> b!1208462 (= e!686376 (or (bvsge (size!38245 _keys!1208) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 _keys!1208))))))

(declare-datatypes ((List!26570 0))(
  ( (Nil!26567) (Cons!26566 (h!27784 (_ BitVec 64)) (t!39505 List!26570)) )
))
(declare-fun arrayNoDuplicates!0 (array!78149 (_ BitVec 32) List!26570) Bool)

(assert (=> b!1208462 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26567)))

(declare-fun lt!548189 () Unit!39973)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78149 (_ BitVec 32) (_ BitVec 32)) Unit!39973)

(assert (=> b!1208462 (= lt!548189 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!686379 () Bool)

(assert (=> b!1208462 e!686379))

(declare-fun res!803182 () Bool)

(assert (=> b!1208462 (=> (not res!803182) (not e!686379))))

(assert (=> b!1208462 (= res!803182 e!686367)))

(declare-fun c!118998 () Bool)

(assert (=> b!1208462 (= c!118998 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548183 () Unit!39973)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!584 (array!78149 array!78151 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 64) (_ BitVec 32) Int) Unit!39973)

(assert (=> b!1208462 (= lt!548183 (lemmaListMapContainsThenArrayContainsFrom!584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548184 () Unit!39973)

(assert (=> b!1208462 (= lt!548184 e!686369)))

(declare-fun lt!548176 () Bool)

(assert (=> b!1208462 (= c!119000 (and (not lt!548176) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1208462 (= lt!548176 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!47859 () Bool)

(assert (=> mapIsEmpty!47859 mapRes!47859))

(declare-fun b!1208463 () Bool)

(declare-fun lt!548187 () Unit!39973)

(assert (=> b!1208463 (= e!686378 lt!548187)))

(declare-fun call!58973 () Unit!39973)

(assert (=> b!1208463 (= lt!548187 call!58973)))

(assert (=> b!1208463 call!58972))

(declare-fun b!1208464 () Bool)

(declare-fun e!686372 () Bool)

(assert (=> b!1208464 (= e!686372 e!686376)))

(declare-fun res!803183 () Bool)

(assert (=> b!1208464 (=> res!803183 e!686376)))

(assert (=> b!1208464 (= res!803183 (not (contains!6966 lt!548178 k0!934)))))

(assert (=> b!1208464 (= lt!548178 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208465 () Bool)

(declare-fun c!118999 () Bool)

(assert (=> b!1208465 (= c!118999 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548176))))

(declare-fun e!686375 () Unit!39973)

(assert (=> b!1208465 (= e!686375 e!686378)))

(declare-fun b!1208466 () Bool)

(declare-fun res!803184 () Bool)

(assert (=> b!1208466 (=> (not res!803184) (not e!686365))))

(assert (=> b!1208466 (= res!803184 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26567))))

(declare-fun bm!58973 () Bool)

(assert (=> bm!58973 (= call!58976 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208467 () Bool)

(assert (=> b!1208467 (= e!686379 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208468 () Bool)

(declare-fun res!803185 () Bool)

(assert (=> b!1208468 (=> (not res!803185) (not e!686365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78149 (_ BitVec 32)) Bool)

(assert (=> b!1208468 (= res!803185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1208469 () Bool)

(assert (=> b!1208469 (= e!686369 e!686375)))

(assert (=> b!1208469 (= c!118996 (and (not lt!548176) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1208470 () Bool)

(assert (=> b!1208470 (= e!686367 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548176) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!58974 () Bool)

(assert (=> bm!58974 (= call!58973 call!58971)))

(declare-fun b!1208471 () Bool)

(declare-fun e!686377 () Bool)

(assert (=> b!1208471 (= e!686377 tp_is_empty!30667)))

(declare-fun bm!58975 () Bool)

(assert (=> bm!58975 (= call!58971 (addStillContains!1032 lt!548178 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1208472 () Bool)

(assert (=> b!1208472 (= e!686365 e!686370)))

(declare-fun res!803188 () Bool)

(assert (=> b!1208472 (=> (not res!803188) (not e!686370))))

(assert (=> b!1208472 (= res!803188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548177 mask!1564))))

(assert (=> b!1208472 (= lt!548177 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)))))

(declare-fun b!1208473 () Bool)

(declare-fun res!803181 () Bool)

(assert (=> b!1208473 (=> (not res!803181) (not e!686370))))

(assert (=> b!1208473 (= res!803181 (arrayNoDuplicates!0 lt!548177 #b00000000000000000000000000000000 Nil!26567))))

(declare-fun b!1208474 () Bool)

(assert (=> b!1208474 (= e!686374 e!686372)))

(declare-fun res!803192 () Bool)

(assert (=> b!1208474 (=> res!803192 e!686372)))

(assert (=> b!1208474 (= res!803192 (not (= (select (arr!37708 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1208474 e!686373))

(declare-fun c!118997 () Bool)

(assert (=> b!1208474 (= c!118997 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548179 () Unit!39973)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1041 (array!78149 array!78151 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39973)

(assert (=> b!1208474 (= lt!548179 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1041 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47859 () Bool)

(declare-fun tp!90895 () Bool)

(assert (=> mapNonEmpty!47859 (= mapRes!47859 (and tp!90895 e!686377))))

(declare-fun mapValue!47859 () ValueCell!14624)

(declare-fun mapRest!47859 () (Array (_ BitVec 32) ValueCell!14624))

(declare-fun mapKey!47859 () (_ BitVec 32))

(assert (=> mapNonEmpty!47859 (= (arr!37709 _values!996) (store mapRest!47859 mapKey!47859 mapValue!47859))))

(declare-fun b!1208475 () Bool)

(assert (=> b!1208475 (= e!686368 tp_is_empty!30667)))

(declare-fun b!1208476 () Bool)

(declare-fun res!803187 () Bool)

(assert (=> b!1208476 (=> (not res!803187) (not e!686365))))

(assert (=> b!1208476 (= res!803187 (and (= (size!38246 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38245 _keys!1208) (size!38246 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1208477 () Bool)

(assert (=> b!1208477 call!58972))

(declare-fun lt!548175 () Unit!39973)

(assert (=> b!1208477 (= lt!548175 call!58973)))

(assert (=> b!1208477 (= e!686375 lt!548175)))

(assert (= (and start!101060 res!803179) b!1208458))

(assert (= (and b!1208458 res!803189) b!1208476))

(assert (= (and b!1208476 res!803187) b!1208468))

(assert (= (and b!1208468 res!803185) b!1208466))

(assert (= (and b!1208466 res!803184) b!1208460))

(assert (= (and b!1208460 res!803186) b!1208456))

(assert (= (and b!1208456 res!803191) b!1208455))

(assert (= (and b!1208455 res!803190) b!1208472))

(assert (= (and b!1208472 res!803188) b!1208473))

(assert (= (and b!1208473 res!803181) b!1208450))

(assert (= (and b!1208450 (not res!803180)) b!1208459))

(assert (= (and b!1208459 (not res!803193)) b!1208474))

(assert (= (and b!1208474 c!118997) b!1208461))

(assert (= (and b!1208474 (not c!118997)) b!1208452))

(assert (= (or b!1208461 b!1208452) bm!58970))

(assert (= (or b!1208461 b!1208452) bm!58973))

(assert (= (and b!1208474 (not res!803192)) b!1208464))

(assert (= (and b!1208464 (not res!803183)) b!1208462))

(assert (= (and b!1208462 c!119000) b!1208451))

(assert (= (and b!1208462 (not c!119000)) b!1208469))

(assert (= (and b!1208469 c!118996) b!1208477))

(assert (= (and b!1208469 (not c!118996)) b!1208465))

(assert (= (and b!1208465 c!118999) b!1208463))

(assert (= (and b!1208465 (not c!118999)) b!1208453))

(assert (= (or b!1208477 b!1208463) bm!58974))

(assert (= (or b!1208477 b!1208463) bm!58972))

(assert (= (or b!1208477 b!1208463) bm!58968))

(assert (= (or b!1208451 bm!58968) bm!58971))

(assert (= (or b!1208451 bm!58974) bm!58975))

(assert (= (or b!1208451 bm!58972) bm!58969))

(assert (= (and b!1208462 c!118998) b!1208454))

(assert (= (and b!1208462 (not c!118998)) b!1208470))

(assert (= (and b!1208462 res!803182) b!1208467))

(assert (= (and b!1208457 condMapEmpty!47859) mapIsEmpty!47859))

(assert (= (and b!1208457 (not condMapEmpty!47859)) mapNonEmpty!47859))

(get-info :version)

(assert (= (and mapNonEmpty!47859 ((_ is ValueCellFull!14624) mapValue!47859)) b!1208471))

(assert (= (and b!1208457 ((_ is ValueCellFull!14624) mapDefault!47859)) b!1208475))

(assert (= start!101060 b!1208457))

(declare-fun b_lambda!21399 () Bool)

(assert (=> (not b_lambda!21399) (not b!1208459)))

(declare-fun t!39503 () Bool)

(declare-fun tb!10755 () Bool)

(assert (=> (and start!101060 (= defaultEntry!1004 defaultEntry!1004) t!39503) tb!10755))

(declare-fun result!22105 () Bool)

(assert (=> tb!10755 (= result!22105 tp_is_empty!30667)))

(assert (=> b!1208459 t!39503))

(declare-fun b_and!42935 () Bool)

(assert (= b_and!42933 (and (=> t!39503 result!22105) b_and!42935)))

(declare-fun m!1114323 () Bool)

(assert (=> b!1208454 m!1114323))

(declare-fun m!1114325 () Bool)

(assert (=> start!101060 m!1114325))

(declare-fun m!1114327 () Bool)

(assert (=> start!101060 m!1114327))

(declare-fun m!1114329 () Bool)

(assert (=> b!1208464 m!1114329))

(declare-fun m!1114331 () Bool)

(assert (=> b!1208464 m!1114331))

(declare-fun m!1114333 () Bool)

(assert (=> bm!58970 m!1114333))

(declare-fun m!1114335 () Bool)

(assert (=> b!1208466 m!1114335))

(declare-fun m!1114337 () Bool)

(assert (=> bm!58971 m!1114337))

(declare-fun m!1114339 () Bool)

(assert (=> b!1208468 m!1114339))

(declare-fun m!1114341 () Bool)

(assert (=> mapNonEmpty!47859 m!1114341))

(declare-fun m!1114343 () Bool)

(assert (=> b!1208462 m!1114343))

(declare-fun m!1114345 () Bool)

(assert (=> b!1208462 m!1114345))

(declare-fun m!1114347 () Bool)

(assert (=> b!1208462 m!1114347))

(assert (=> bm!58973 m!1114331))

(declare-fun m!1114349 () Bool)

(assert (=> b!1208473 m!1114349))

(declare-fun m!1114351 () Bool)

(assert (=> b!1208474 m!1114351))

(declare-fun m!1114353 () Bool)

(assert (=> b!1208474 m!1114353))

(declare-fun m!1114355 () Bool)

(assert (=> b!1208461 m!1114355))

(declare-fun m!1114357 () Bool)

(assert (=> b!1208472 m!1114357))

(declare-fun m!1114359 () Bool)

(assert (=> b!1208472 m!1114359))

(declare-fun m!1114361 () Bool)

(assert (=> b!1208456 m!1114361))

(assert (=> b!1208467 m!1114323))

(declare-fun m!1114363 () Bool)

(assert (=> b!1208455 m!1114363))

(declare-fun m!1114365 () Bool)

(assert (=> bm!58969 m!1114365))

(declare-fun m!1114367 () Bool)

(assert (=> b!1208458 m!1114367))

(declare-fun m!1114369 () Bool)

(assert (=> bm!58975 m!1114369))

(declare-fun m!1114371 () Bool)

(assert (=> b!1208451 m!1114371))

(declare-fun m!1114373 () Bool)

(assert (=> b!1208451 m!1114373))

(assert (=> b!1208451 m!1114373))

(declare-fun m!1114375 () Bool)

(assert (=> b!1208451 m!1114375))

(declare-fun m!1114377 () Bool)

(assert (=> b!1208459 m!1114377))

(declare-fun m!1114379 () Bool)

(assert (=> b!1208459 m!1114379))

(declare-fun m!1114381 () Bool)

(assert (=> b!1208459 m!1114381))

(declare-fun m!1114383 () Bool)

(assert (=> b!1208459 m!1114383))

(declare-fun m!1114385 () Bool)

(assert (=> b!1208450 m!1114385))

(declare-fun m!1114387 () Bool)

(assert (=> b!1208450 m!1114387))

(check-sat (not mapNonEmpty!47859) (not b!1208451) tp_is_empty!30667 (not b!1208464) (not bm!58969) (not b_next!25963) (not b!1208467) (not b!1208462) (not bm!58975) (not b!1208468) (not b!1208458) (not b_lambda!21399) (not b!1208474) (not b!1208472) (not b!1208456) (not bm!58971) (not start!101060) (not b!1208454) (not b!1208461) (not bm!58973) (not b!1208466) (not b!1208450) (not bm!58970) (not b!1208473) b_and!42935 (not b!1208459))
(check-sat b_and!42935 (not b_next!25963))
(get-model)

(declare-fun b_lambda!21405 () Bool)

(assert (= b_lambda!21399 (or (and start!101060 b_free!25963) b_lambda!21405)))

(check-sat (not mapNonEmpty!47859) (not b!1208451) tp_is_empty!30667 (not b!1208464) (not bm!58969) (not b_next!25963) (not b!1208458) (not b!1208467) (not b_lambda!21405) (not b!1208462) (not bm!58975) (not b!1208468) (not b!1208474) (not b!1208472) (not b!1208456) (not bm!58971) (not start!101060) (not b!1208454) (not b!1208461) (not bm!58973) (not b!1208466) (not b!1208450) (not bm!58970) (not b!1208473) b_and!42935 (not b!1208459))
(check-sat b_and!42935 (not b_next!25963))
(get-model)

(declare-fun b!1208676 () Bool)

(declare-fun lt!548306 () Unit!39973)

(declare-fun lt!548304 () Unit!39973)

(assert (=> b!1208676 (= lt!548306 lt!548304)))

(declare-fun lt!548301 () ListLongMap!17739)

(declare-fun lt!548307 () (_ BitVec 64))

(declare-fun lt!548303 () (_ BitVec 64))

(declare-fun lt!548305 () V!46017)

(assert (=> b!1208676 (not (contains!6966 (+!4047 lt!548301 (tuple2!19763 lt!548307 lt!548305)) lt!548303))))

(declare-fun addStillNotContains!295 (ListLongMap!17739 (_ BitVec 64) V!46017 (_ BitVec 64)) Unit!39973)

(assert (=> b!1208676 (= lt!548304 (addStillNotContains!295 lt!548301 lt!548307 lt!548305 lt!548303))))

(assert (=> b!1208676 (= lt!548303 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19263 (ValueCell!14624 V!46017) V!46017)

(assert (=> b!1208676 (= lt!548305 (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208676 (= lt!548307 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!59029 () ListLongMap!17739)

(assert (=> b!1208676 (= lt!548301 call!59029)))

(declare-fun e!686491 () ListLongMap!17739)

(assert (=> b!1208676 (= e!686491 (+!4047 call!59029 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133397 () Bool)

(declare-fun e!686490 () Bool)

(assert (=> d!133397 e!686490))

(declare-fun res!803294 () Bool)

(assert (=> d!133397 (=> (not res!803294) (not e!686490))))

(declare-fun lt!548302 () ListLongMap!17739)

(assert (=> d!133397 (= res!803294 (not (contains!6966 lt!548302 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686494 () ListLongMap!17739)

(assert (=> d!133397 (= lt!548302 e!686494)))

(declare-fun c!119039 () Bool)

(assert (=> d!133397 (= c!119039 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 _keys!1208)))))

(assert (=> d!133397 (validMask!0 mask!1564)))

(assert (=> d!133397 (= (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548302)))

(declare-fun b!1208677 () Bool)

(declare-fun e!686492 () Bool)

(declare-fun isEmpty!991 (ListLongMap!17739) Bool)

(assert (=> b!1208677 (= e!686492 (isEmpty!991 lt!548302))))

(declare-fun bm!59026 () Bool)

(assert (=> bm!59026 (= call!59029 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208678 () Bool)

(assert (=> b!1208678 (= e!686494 e!686491)))

(declare-fun c!119041 () Bool)

(assert (=> b!1208678 (= c!119041 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1208679 () Bool)

(assert (=> b!1208679 (= e!686491 call!59029)))

(declare-fun b!1208680 () Bool)

(assert (=> b!1208680 (= e!686494 (ListLongMap!17740 Nil!26566))))

(declare-fun b!1208681 () Bool)

(declare-fun e!686493 () Bool)

(assert (=> b!1208681 (= e!686490 e!686493)))

(declare-fun c!119042 () Bool)

(declare-fun e!686495 () Bool)

(assert (=> b!1208681 (= c!119042 e!686495)))

(declare-fun res!803292 () Bool)

(assert (=> b!1208681 (=> (not res!803292) (not e!686495))))

(assert (=> b!1208681 (= res!803292 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 _keys!1208)))))

(declare-fun b!1208682 () Bool)

(assert (=> b!1208682 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 _keys!1208)))))

(assert (=> b!1208682 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 _values!996)))))

(declare-fun e!686496 () Bool)

(declare-fun apply!974 (ListLongMap!17739 (_ BitVec 64)) V!46017)

(assert (=> b!1208682 (= e!686496 (= (apply!974 lt!548302 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208683 () Bool)

(assert (=> b!1208683 (= e!686492 (= lt!548302 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208684 () Bool)

(declare-fun res!803293 () Bool)

(assert (=> b!1208684 (=> (not res!803293) (not e!686490))))

(assert (=> b!1208684 (= res!803293 (not (contains!6966 lt!548302 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208685 () Bool)

(assert (=> b!1208685 (= e!686495 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208685 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1208686 () Bool)

(assert (=> b!1208686 (= e!686493 e!686492)))

(declare-fun c!119040 () Bool)

(assert (=> b!1208686 (= c!119040 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 _keys!1208)))))

(declare-fun b!1208687 () Bool)

(assert (=> b!1208687 (= e!686493 e!686496)))

(assert (=> b!1208687 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 _keys!1208)))))

(declare-fun res!803295 () Bool)

(assert (=> b!1208687 (= res!803295 (contains!6966 lt!548302 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208687 (=> (not res!803295) (not e!686496))))

(assert (= (and d!133397 c!119039) b!1208680))

(assert (= (and d!133397 (not c!119039)) b!1208678))

(assert (= (and b!1208678 c!119041) b!1208676))

(assert (= (and b!1208678 (not c!119041)) b!1208679))

(assert (= (or b!1208676 b!1208679) bm!59026))

(assert (= (and d!133397 res!803294) b!1208684))

(assert (= (and b!1208684 res!803293) b!1208681))

(assert (= (and b!1208681 res!803292) b!1208685))

(assert (= (and b!1208681 c!119042) b!1208687))

(assert (= (and b!1208681 (not c!119042)) b!1208686))

(assert (= (and b!1208687 res!803295) b!1208682))

(assert (= (and b!1208686 c!119040) b!1208683))

(assert (= (and b!1208686 (not c!119040)) b!1208677))

(declare-fun b_lambda!21407 () Bool)

(assert (=> (not b_lambda!21407) (not b!1208676)))

(assert (=> b!1208676 t!39503))

(declare-fun b_and!42945 () Bool)

(assert (= b_and!42935 (and (=> t!39503 result!22105) b_and!42945)))

(declare-fun b_lambda!21409 () Bool)

(assert (=> (not b_lambda!21409) (not b!1208682)))

(assert (=> b!1208682 t!39503))

(declare-fun b_and!42947 () Bool)

(assert (= b_and!42945 (and (=> t!39503 result!22105) b_and!42947)))

(declare-fun m!1114521 () Bool)

(assert (=> bm!59026 m!1114521))

(declare-fun m!1114523 () Bool)

(assert (=> b!1208676 m!1114523))

(declare-fun m!1114525 () Bool)

(assert (=> b!1208676 m!1114525))

(declare-fun m!1114527 () Bool)

(assert (=> b!1208676 m!1114527))

(assert (=> b!1208676 m!1114523))

(declare-fun m!1114529 () Bool)

(assert (=> b!1208676 m!1114529))

(declare-fun m!1114531 () Bool)

(assert (=> b!1208676 m!1114531))

(assert (=> b!1208676 m!1114531))

(assert (=> b!1208676 m!1114379))

(declare-fun m!1114533 () Bool)

(assert (=> b!1208676 m!1114533))

(declare-fun m!1114535 () Bool)

(assert (=> b!1208676 m!1114535))

(assert (=> b!1208676 m!1114379))

(assert (=> b!1208678 m!1114525))

(assert (=> b!1208678 m!1114525))

(declare-fun m!1114537 () Bool)

(assert (=> b!1208678 m!1114537))

(assert (=> b!1208687 m!1114525))

(assert (=> b!1208687 m!1114525))

(declare-fun m!1114539 () Bool)

(assert (=> b!1208687 m!1114539))

(declare-fun m!1114541 () Bool)

(assert (=> b!1208677 m!1114541))

(declare-fun m!1114543 () Bool)

(assert (=> b!1208684 m!1114543))

(assert (=> b!1208685 m!1114525))

(assert (=> b!1208685 m!1114525))

(assert (=> b!1208685 m!1114537))

(assert (=> b!1208682 m!1114525))

(assert (=> b!1208682 m!1114525))

(declare-fun m!1114545 () Bool)

(assert (=> b!1208682 m!1114545))

(assert (=> b!1208682 m!1114531))

(assert (=> b!1208682 m!1114531))

(assert (=> b!1208682 m!1114379))

(assert (=> b!1208682 m!1114533))

(assert (=> b!1208682 m!1114379))

(declare-fun m!1114547 () Bool)

(assert (=> d!133397 m!1114547))

(assert (=> d!133397 m!1114367))

(assert (=> b!1208683 m!1114521))

(assert (=> bm!58973 d!133397))

(declare-fun d!133399 () Bool)

(assert (=> d!133399 (contains!6966 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!548310 () Unit!39973)

(declare-fun choose!1806 (ListLongMap!17739 (_ BitVec 64) V!46017 (_ BitVec 64)) Unit!39973)

(assert (=> d!133399 (= lt!548310 (choose!1806 lt!548186 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!133399 (contains!6966 lt!548186 k0!934)))

(assert (=> d!133399 (= (addStillContains!1032 lt!548186 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!548310)))

(declare-fun bs!34147 () Bool)

(assert (= bs!34147 d!133399))

(assert (=> bs!34147 m!1114373))

(assert (=> bs!34147 m!1114373))

(assert (=> bs!34147 m!1114375))

(declare-fun m!1114549 () Bool)

(assert (=> bs!34147 m!1114549))

(declare-fun m!1114551 () Bool)

(assert (=> bs!34147 m!1114551))

(assert (=> b!1208451 d!133399))

(declare-fun d!133401 () Bool)

(declare-fun e!686502 () Bool)

(assert (=> d!133401 e!686502))

(declare-fun res!803298 () Bool)

(assert (=> d!133401 (=> res!803298 e!686502)))

(declare-fun lt!548319 () Bool)

(assert (=> d!133401 (= res!803298 (not lt!548319))))

(declare-fun lt!548321 () Bool)

(assert (=> d!133401 (= lt!548319 lt!548321)))

(declare-fun lt!548322 () Unit!39973)

(declare-fun e!686501 () Unit!39973)

(assert (=> d!133401 (= lt!548322 e!686501)))

(declare-fun c!119045 () Bool)

(assert (=> d!133401 (= c!119045 lt!548321)))

(declare-fun containsKey!594 (List!26569 (_ BitVec 64)) Bool)

(assert (=> d!133401 (= lt!548321 (containsKey!594 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!133401 (= (contains!6966 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!548319)))

(declare-fun b!1208695 () Bool)

(declare-fun lt!548320 () Unit!39973)

(assert (=> b!1208695 (= e!686501 lt!548320)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!422 (List!26569 (_ BitVec 64)) Unit!39973)

(assert (=> b!1208695 (= lt!548320 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-datatypes ((Option!683 0))(
  ( (Some!682 (v!18034 V!46017)) (None!681) )
))
(declare-fun isDefined!460 (Option!683) Bool)

(declare-fun getValueByKey!632 (List!26569 (_ BitVec 64)) Option!683)

(assert (=> b!1208695 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1208696 () Bool)

(declare-fun Unit!39981 () Unit!39973)

(assert (=> b!1208696 (= e!686501 Unit!39981)))

(declare-fun b!1208697 () Bool)

(assert (=> b!1208697 (= e!686502 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!133401 c!119045) b!1208695))

(assert (= (and d!133401 (not c!119045)) b!1208696))

(assert (= (and d!133401 (not res!803298)) b!1208697))

(declare-fun m!1114553 () Bool)

(assert (=> d!133401 m!1114553))

(declare-fun m!1114555 () Bool)

(assert (=> b!1208695 m!1114555))

(declare-fun m!1114557 () Bool)

(assert (=> b!1208695 m!1114557))

(assert (=> b!1208695 m!1114557))

(declare-fun m!1114559 () Bool)

(assert (=> b!1208695 m!1114559))

(assert (=> b!1208697 m!1114557))

(assert (=> b!1208697 m!1114557))

(assert (=> b!1208697 m!1114559))

(assert (=> b!1208451 d!133401))

(declare-fun d!133403 () Bool)

(declare-fun e!686505 () Bool)

(assert (=> d!133403 e!686505))

(declare-fun res!803304 () Bool)

(assert (=> d!133403 (=> (not res!803304) (not e!686505))))

(declare-fun lt!548333 () ListLongMap!17739)

(assert (=> d!133403 (= res!803304 (contains!6966 lt!548333 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!548334 () List!26569)

(assert (=> d!133403 (= lt!548333 (ListLongMap!17740 lt!548334))))

(declare-fun lt!548331 () Unit!39973)

(declare-fun lt!548332 () Unit!39973)

(assert (=> d!133403 (= lt!548331 lt!548332)))

(assert (=> d!133403 (= (getValueByKey!632 lt!548334 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!682 (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!314 (List!26569 (_ BitVec 64) V!46017) Unit!39973)

(assert (=> d!133403 (= lt!548332 (lemmaContainsTupThenGetReturnValue!314 lt!548334 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!407 (List!26569 (_ BitVec 64) V!46017) List!26569)

(assert (=> d!133403 (= lt!548334 (insertStrictlySorted!407 (toList!8885 lt!548186) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133403 (= (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!548333)))

(declare-fun b!1208702 () Bool)

(declare-fun res!803303 () Bool)

(assert (=> b!1208702 (=> (not res!803303) (not e!686505))))

(assert (=> b!1208702 (= res!803303 (= (getValueByKey!632 (toList!8885 lt!548333) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!682 (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1208703 () Bool)

(declare-fun contains!6969 (List!26569 tuple2!19762) Bool)

(assert (=> b!1208703 (= e!686505 (contains!6969 (toList!8885 lt!548333) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!133403 res!803304) b!1208702))

(assert (= (and b!1208702 res!803303) b!1208703))

(declare-fun m!1114561 () Bool)

(assert (=> d!133403 m!1114561))

(declare-fun m!1114563 () Bool)

(assert (=> d!133403 m!1114563))

(declare-fun m!1114565 () Bool)

(assert (=> d!133403 m!1114565))

(declare-fun m!1114567 () Bool)

(assert (=> d!133403 m!1114567))

(declare-fun m!1114569 () Bool)

(assert (=> b!1208702 m!1114569))

(declare-fun m!1114571 () Bool)

(assert (=> b!1208703 m!1114571))

(assert (=> b!1208451 d!133403))

(declare-fun d!133405 () Bool)

(declare-fun res!803309 () Bool)

(declare-fun e!686510 () Bool)

(assert (=> d!133405 (=> res!803309 e!686510)))

(assert (=> d!133405 (= res!803309 (= (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133405 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!686510)))

(declare-fun b!1208708 () Bool)

(declare-fun e!686511 () Bool)

(assert (=> b!1208708 (= e!686510 e!686511)))

(declare-fun res!803310 () Bool)

(assert (=> b!1208708 (=> (not res!803310) (not e!686511))))

(assert (=> b!1208708 (= res!803310 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun b!1208709 () Bool)

(assert (=> b!1208709 (= e!686511 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133405 (not res!803309)) b!1208708))

(assert (= (and b!1208708 res!803310) b!1208709))

(declare-fun m!1114573 () Bool)

(assert (=> d!133405 m!1114573))

(declare-fun m!1114575 () Bool)

(assert (=> b!1208709 m!1114575))

(assert (=> b!1208450 d!133405))

(declare-fun d!133407 () Bool)

(assert (=> d!133407 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548337 () Unit!39973)

(declare-fun choose!13 (array!78149 (_ BitVec 64) (_ BitVec 32)) Unit!39973)

(assert (=> d!133407 (= lt!548337 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133407 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133407 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!548337)))

(declare-fun bs!34148 () Bool)

(assert (= bs!34148 d!133407))

(assert (=> bs!34148 m!1114385))

(declare-fun m!1114577 () Bool)

(assert (=> bs!34148 m!1114577))

(assert (=> b!1208450 d!133407))

(declare-fun call!59035 () ListLongMap!17739)

(declare-fun call!59034 () ListLongMap!17739)

(declare-fun b!1208716 () Bool)

(declare-fun e!686517 () Bool)

(assert (=> b!1208716 (= e!686517 (= call!59034 (-!1822 call!59035 k0!934)))))

(assert (=> b!1208716 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38246 _values!996)))))

(declare-fun b!1208717 () Bool)

(declare-fun e!686516 () Bool)

(assert (=> b!1208717 (= e!686516 e!686517)))

(declare-fun c!119048 () Bool)

(assert (=> b!1208717 (= c!119048 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!59031 () Bool)

(assert (=> bm!59031 (= call!59034 (getCurrentListMapNoExtraKeys!5347 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)) (array!78152 (store (arr!37709 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38246 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208718 () Bool)

(assert (=> b!1208718 (= e!686517 (= call!59034 call!59035))))

(assert (=> b!1208718 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38246 _values!996)))))

(declare-fun d!133409 () Bool)

(assert (=> d!133409 e!686516))

(declare-fun res!803313 () Bool)

(assert (=> d!133409 (=> (not res!803313) (not e!686516))))

(assert (=> d!133409 (= res!803313 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38245 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38245 _keys!1208))))))))

(declare-fun lt!548340 () Unit!39973)

(declare-fun choose!1807 (array!78149 array!78151 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39973)

(assert (=> d!133409 (= lt!548340 (choose!1807 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133409 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 _keys!1208)))))

(assert (=> d!133409 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1041 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548340)))

(declare-fun bm!59032 () Bool)

(assert (=> bm!59032 (= call!59035 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133409 res!803313) b!1208717))

(assert (= (and b!1208717 c!119048) b!1208716))

(assert (= (and b!1208717 (not c!119048)) b!1208718))

(assert (= (or b!1208716 b!1208718) bm!59032))

(assert (= (or b!1208716 b!1208718) bm!59031))

(declare-fun b_lambda!21411 () Bool)

(assert (=> (not b_lambda!21411) (not bm!59031)))

(assert (=> bm!59031 t!39503))

(declare-fun b_and!42949 () Bool)

(assert (= b_and!42947 (and (=> t!39503 result!22105) b_and!42949)))

(declare-fun m!1114579 () Bool)

(assert (=> b!1208716 m!1114579))

(assert (=> bm!59031 m!1114359))

(assert (=> bm!59031 m!1114379))

(assert (=> bm!59031 m!1114381))

(declare-fun m!1114581 () Bool)

(assert (=> bm!59031 m!1114581))

(declare-fun m!1114583 () Bool)

(assert (=> d!133409 m!1114583))

(assert (=> bm!59032 m!1114331))

(assert (=> b!1208474 d!133409))

(declare-fun d!133411 () Bool)

(assert (=> d!133411 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1208458 d!133411))

(declare-fun d!133413 () Bool)

(declare-fun e!686518 () Bool)

(assert (=> d!133413 e!686518))

(declare-fun res!803315 () Bool)

(assert (=> d!133413 (=> (not res!803315) (not e!686518))))

(declare-fun lt!548343 () ListLongMap!17739)

(assert (=> d!133413 (= res!803315 (contains!6966 lt!548343 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!548344 () List!26569)

(assert (=> d!133413 (= lt!548343 (ListLongMap!17740 lt!548344))))

(declare-fun lt!548341 () Unit!39973)

(declare-fun lt!548342 () Unit!39973)

(assert (=> d!133413 (= lt!548341 lt!548342)))

(assert (=> d!133413 (= (getValueByKey!632 lt!548344 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!682 (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133413 (= lt!548342 (lemmaContainsTupThenGetReturnValue!314 lt!548344 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133413 (= lt!548344 (insertStrictlySorted!407 (toList!8885 lt!548178) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133413 (= (+!4047 lt!548178 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548343)))

(declare-fun b!1208719 () Bool)

(declare-fun res!803314 () Bool)

(assert (=> b!1208719 (=> (not res!803314) (not e!686518))))

(assert (=> b!1208719 (= res!803314 (= (getValueByKey!632 (toList!8885 lt!548343) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!682 (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1208720 () Bool)

(assert (=> b!1208720 (= e!686518 (contains!6969 (toList!8885 lt!548343) (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!133413 res!803315) b!1208719))

(assert (= (and b!1208719 res!803314) b!1208720))

(declare-fun m!1114585 () Bool)

(assert (=> d!133413 m!1114585))

(declare-fun m!1114587 () Bool)

(assert (=> d!133413 m!1114587))

(declare-fun m!1114589 () Bool)

(assert (=> d!133413 m!1114589))

(declare-fun m!1114591 () Bool)

(assert (=> d!133413 m!1114591))

(declare-fun m!1114593 () Bool)

(assert (=> b!1208719 m!1114593))

(declare-fun m!1114595 () Bool)

(assert (=> b!1208720 m!1114595))

(assert (=> bm!58969 d!133413))

(declare-fun b!1208721 () Bool)

(declare-fun lt!548350 () Unit!39973)

(declare-fun lt!548348 () Unit!39973)

(assert (=> b!1208721 (= lt!548350 lt!548348)))

(declare-fun lt!548351 () (_ BitVec 64))

(declare-fun lt!548349 () V!46017)

(declare-fun lt!548345 () ListLongMap!17739)

(declare-fun lt!548347 () (_ BitVec 64))

(assert (=> b!1208721 (not (contains!6966 (+!4047 lt!548345 (tuple2!19763 lt!548351 lt!548349)) lt!548347))))

(assert (=> b!1208721 (= lt!548348 (addStillNotContains!295 lt!548345 lt!548351 lt!548349 lt!548347))))

(assert (=> b!1208721 (= lt!548347 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208721 (= lt!548349 (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208721 (= lt!548351 (select (arr!37708 lt!548177) from!1455))))

(declare-fun call!59036 () ListLongMap!17739)

(assert (=> b!1208721 (= lt!548345 call!59036)))

(declare-fun e!686520 () ListLongMap!17739)

(assert (=> b!1208721 (= e!686520 (+!4047 call!59036 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133415 () Bool)

(declare-fun e!686519 () Bool)

(assert (=> d!133415 e!686519))

(declare-fun res!803318 () Bool)

(assert (=> d!133415 (=> (not res!803318) (not e!686519))))

(declare-fun lt!548346 () ListLongMap!17739)

(assert (=> d!133415 (= res!803318 (not (contains!6966 lt!548346 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686523 () ListLongMap!17739)

(assert (=> d!133415 (= lt!548346 e!686523)))

(declare-fun c!119049 () Bool)

(assert (=> d!133415 (= c!119049 (bvsge from!1455 (size!38245 lt!548177)))))

(assert (=> d!133415 (validMask!0 mask!1564)))

(assert (=> d!133415 (= (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548346)))

(declare-fun b!1208722 () Bool)

(declare-fun e!686521 () Bool)

(assert (=> b!1208722 (= e!686521 (isEmpty!991 lt!548346))))

(declare-fun bm!59033 () Bool)

(assert (=> bm!59033 (= call!59036 (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208723 () Bool)

(assert (=> b!1208723 (= e!686523 e!686520)))

(declare-fun c!119051 () Bool)

(assert (=> b!1208723 (= c!119051 (validKeyInArray!0 (select (arr!37708 lt!548177) from!1455)))))

(declare-fun b!1208724 () Bool)

(assert (=> b!1208724 (= e!686520 call!59036)))

(declare-fun b!1208725 () Bool)

(assert (=> b!1208725 (= e!686523 (ListLongMap!17740 Nil!26566))))

(declare-fun b!1208726 () Bool)

(declare-fun e!686522 () Bool)

(assert (=> b!1208726 (= e!686519 e!686522)))

(declare-fun c!119052 () Bool)

(declare-fun e!686524 () Bool)

(assert (=> b!1208726 (= c!119052 e!686524)))

(declare-fun res!803316 () Bool)

(assert (=> b!1208726 (=> (not res!803316) (not e!686524))))

(assert (=> b!1208726 (= res!803316 (bvslt from!1455 (size!38245 lt!548177)))))

(declare-fun b!1208727 () Bool)

(assert (=> b!1208727 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38245 lt!548177)))))

(assert (=> b!1208727 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38246 lt!548180)))))

(declare-fun e!686525 () Bool)

(assert (=> b!1208727 (= e!686525 (= (apply!974 lt!548346 (select (arr!37708 lt!548177) from!1455)) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208728 () Bool)

(assert (=> b!1208728 (= e!686521 (= lt!548346 (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208729 () Bool)

(declare-fun res!803317 () Bool)

(assert (=> b!1208729 (=> (not res!803317) (not e!686519))))

(assert (=> b!1208729 (= res!803317 (not (contains!6966 lt!548346 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208730 () Bool)

(assert (=> b!1208730 (= e!686524 (validKeyInArray!0 (select (arr!37708 lt!548177) from!1455)))))

(assert (=> b!1208730 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1208731 () Bool)

(assert (=> b!1208731 (= e!686522 e!686521)))

(declare-fun c!119050 () Bool)

(assert (=> b!1208731 (= c!119050 (bvslt from!1455 (size!38245 lt!548177)))))

(declare-fun b!1208732 () Bool)

(assert (=> b!1208732 (= e!686522 e!686525)))

(assert (=> b!1208732 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38245 lt!548177)))))

(declare-fun res!803319 () Bool)

(assert (=> b!1208732 (= res!803319 (contains!6966 lt!548346 (select (arr!37708 lt!548177) from!1455)))))

(assert (=> b!1208732 (=> (not res!803319) (not e!686525))))

(assert (= (and d!133415 c!119049) b!1208725))

(assert (= (and d!133415 (not c!119049)) b!1208723))

(assert (= (and b!1208723 c!119051) b!1208721))

(assert (= (and b!1208723 (not c!119051)) b!1208724))

(assert (= (or b!1208721 b!1208724) bm!59033))

(assert (= (and d!133415 res!803318) b!1208729))

(assert (= (and b!1208729 res!803317) b!1208726))

(assert (= (and b!1208726 res!803316) b!1208730))

(assert (= (and b!1208726 c!119052) b!1208732))

(assert (= (and b!1208726 (not c!119052)) b!1208731))

(assert (= (and b!1208732 res!803319) b!1208727))

(assert (= (and b!1208731 c!119050) b!1208728))

(assert (= (and b!1208731 (not c!119050)) b!1208722))

(declare-fun b_lambda!21413 () Bool)

(assert (=> (not b_lambda!21413) (not b!1208721)))

(assert (=> b!1208721 t!39503))

(declare-fun b_and!42951 () Bool)

(assert (= b_and!42949 (and (=> t!39503 result!22105) b_and!42951)))

(declare-fun b_lambda!21415 () Bool)

(assert (=> (not b_lambda!21415) (not b!1208727)))

(assert (=> b!1208727 t!39503))

(declare-fun b_and!42953 () Bool)

(assert (= b_and!42951 (and (=> t!39503 result!22105) b_and!42953)))

(declare-fun m!1114597 () Bool)

(assert (=> bm!59033 m!1114597))

(declare-fun m!1114599 () Bool)

(assert (=> b!1208721 m!1114599))

(declare-fun m!1114601 () Bool)

(assert (=> b!1208721 m!1114601))

(declare-fun m!1114603 () Bool)

(assert (=> b!1208721 m!1114603))

(assert (=> b!1208721 m!1114599))

(declare-fun m!1114605 () Bool)

(assert (=> b!1208721 m!1114605))

(declare-fun m!1114607 () Bool)

(assert (=> b!1208721 m!1114607))

(assert (=> b!1208721 m!1114607))

(assert (=> b!1208721 m!1114379))

(declare-fun m!1114609 () Bool)

(assert (=> b!1208721 m!1114609))

(declare-fun m!1114611 () Bool)

(assert (=> b!1208721 m!1114611))

(assert (=> b!1208721 m!1114379))

(assert (=> b!1208723 m!1114601))

(assert (=> b!1208723 m!1114601))

(declare-fun m!1114613 () Bool)

(assert (=> b!1208723 m!1114613))

(assert (=> b!1208732 m!1114601))

(assert (=> b!1208732 m!1114601))

(declare-fun m!1114615 () Bool)

(assert (=> b!1208732 m!1114615))

(declare-fun m!1114617 () Bool)

(assert (=> b!1208722 m!1114617))

(declare-fun m!1114619 () Bool)

(assert (=> b!1208729 m!1114619))

(assert (=> b!1208730 m!1114601))

(assert (=> b!1208730 m!1114601))

(assert (=> b!1208730 m!1114613))

(assert (=> b!1208727 m!1114601))

(assert (=> b!1208727 m!1114601))

(declare-fun m!1114621 () Bool)

(assert (=> b!1208727 m!1114621))

(assert (=> b!1208727 m!1114607))

(assert (=> b!1208727 m!1114607))

(assert (=> b!1208727 m!1114379))

(assert (=> b!1208727 m!1114609))

(assert (=> b!1208727 m!1114379))

(declare-fun m!1114623 () Bool)

(assert (=> d!133415 m!1114623))

(assert (=> d!133415 m!1114367))

(assert (=> b!1208728 m!1114597))

(assert (=> b!1208459 d!133415))

(declare-fun b!1208733 () Bool)

(declare-fun lt!548357 () Unit!39973)

(declare-fun lt!548355 () Unit!39973)

(assert (=> b!1208733 (= lt!548357 lt!548355)))

(declare-fun lt!548354 () (_ BitVec 64))

(declare-fun lt!548358 () (_ BitVec 64))

(declare-fun lt!548352 () ListLongMap!17739)

(declare-fun lt!548356 () V!46017)

(assert (=> b!1208733 (not (contains!6966 (+!4047 lt!548352 (tuple2!19763 lt!548358 lt!548356)) lt!548354))))

(assert (=> b!1208733 (= lt!548355 (addStillNotContains!295 lt!548352 lt!548358 lt!548356 lt!548354))))

(assert (=> b!1208733 (= lt!548354 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208733 (= lt!548356 (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208733 (= lt!548358 (select (arr!37708 _keys!1208) from!1455))))

(declare-fun call!59037 () ListLongMap!17739)

(assert (=> b!1208733 (= lt!548352 call!59037)))

(declare-fun e!686527 () ListLongMap!17739)

(assert (=> b!1208733 (= e!686527 (+!4047 call!59037 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133417 () Bool)

(declare-fun e!686526 () Bool)

(assert (=> d!133417 e!686526))

(declare-fun res!803322 () Bool)

(assert (=> d!133417 (=> (not res!803322) (not e!686526))))

(declare-fun lt!548353 () ListLongMap!17739)

(assert (=> d!133417 (= res!803322 (not (contains!6966 lt!548353 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686530 () ListLongMap!17739)

(assert (=> d!133417 (= lt!548353 e!686530)))

(declare-fun c!119053 () Bool)

(assert (=> d!133417 (= c!119053 (bvsge from!1455 (size!38245 _keys!1208)))))

(assert (=> d!133417 (validMask!0 mask!1564)))

(assert (=> d!133417 (= (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548353)))

(declare-fun b!1208734 () Bool)

(declare-fun e!686528 () Bool)

(assert (=> b!1208734 (= e!686528 (isEmpty!991 lt!548353))))

(declare-fun bm!59034 () Bool)

(assert (=> bm!59034 (= call!59037 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208735 () Bool)

(assert (=> b!1208735 (= e!686530 e!686527)))

(declare-fun c!119055 () Bool)

(assert (=> b!1208735 (= c!119055 (validKeyInArray!0 (select (arr!37708 _keys!1208) from!1455)))))

(declare-fun b!1208736 () Bool)

(assert (=> b!1208736 (= e!686527 call!59037)))

(declare-fun b!1208737 () Bool)

(assert (=> b!1208737 (= e!686530 (ListLongMap!17740 Nil!26566))))

(declare-fun b!1208738 () Bool)

(declare-fun e!686529 () Bool)

(assert (=> b!1208738 (= e!686526 e!686529)))

(declare-fun c!119056 () Bool)

(declare-fun e!686531 () Bool)

(assert (=> b!1208738 (= c!119056 e!686531)))

(declare-fun res!803320 () Bool)

(assert (=> b!1208738 (=> (not res!803320) (not e!686531))))

(assert (=> b!1208738 (= res!803320 (bvslt from!1455 (size!38245 _keys!1208)))))

(declare-fun b!1208739 () Bool)

(assert (=> b!1208739 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38245 _keys!1208)))))

(assert (=> b!1208739 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38246 _values!996)))))

(declare-fun e!686532 () Bool)

(assert (=> b!1208739 (= e!686532 (= (apply!974 lt!548353 (select (arr!37708 _keys!1208) from!1455)) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208740 () Bool)

(assert (=> b!1208740 (= e!686528 (= lt!548353 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208741 () Bool)

(declare-fun res!803321 () Bool)

(assert (=> b!1208741 (=> (not res!803321) (not e!686526))))

(assert (=> b!1208741 (= res!803321 (not (contains!6966 lt!548353 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208742 () Bool)

(assert (=> b!1208742 (= e!686531 (validKeyInArray!0 (select (arr!37708 _keys!1208) from!1455)))))

(assert (=> b!1208742 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1208743 () Bool)

(assert (=> b!1208743 (= e!686529 e!686528)))

(declare-fun c!119054 () Bool)

(assert (=> b!1208743 (= c!119054 (bvslt from!1455 (size!38245 _keys!1208)))))

(declare-fun b!1208744 () Bool)

(assert (=> b!1208744 (= e!686529 e!686532)))

(assert (=> b!1208744 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38245 _keys!1208)))))

(declare-fun res!803323 () Bool)

(assert (=> b!1208744 (= res!803323 (contains!6966 lt!548353 (select (arr!37708 _keys!1208) from!1455)))))

(assert (=> b!1208744 (=> (not res!803323) (not e!686532))))

(assert (= (and d!133417 c!119053) b!1208737))

(assert (= (and d!133417 (not c!119053)) b!1208735))

(assert (= (and b!1208735 c!119055) b!1208733))

(assert (= (and b!1208735 (not c!119055)) b!1208736))

(assert (= (or b!1208733 b!1208736) bm!59034))

(assert (= (and d!133417 res!803322) b!1208741))

(assert (= (and b!1208741 res!803321) b!1208738))

(assert (= (and b!1208738 res!803320) b!1208742))

(assert (= (and b!1208738 c!119056) b!1208744))

(assert (= (and b!1208738 (not c!119056)) b!1208743))

(assert (= (and b!1208744 res!803323) b!1208739))

(assert (= (and b!1208743 c!119054) b!1208740))

(assert (= (and b!1208743 (not c!119054)) b!1208734))

(declare-fun b_lambda!21417 () Bool)

(assert (=> (not b_lambda!21417) (not b!1208733)))

(assert (=> b!1208733 t!39503))

(declare-fun b_and!42955 () Bool)

(assert (= b_and!42953 (and (=> t!39503 result!22105) b_and!42955)))

(declare-fun b_lambda!21419 () Bool)

(assert (=> (not b_lambda!21419) (not b!1208739)))

(assert (=> b!1208739 t!39503))

(declare-fun b_and!42957 () Bool)

(assert (= b_and!42955 (and (=> t!39503 result!22105) b_and!42957)))

(declare-fun m!1114625 () Bool)

(assert (=> bm!59034 m!1114625))

(declare-fun m!1114627 () Bool)

(assert (=> b!1208733 m!1114627))

(assert (=> b!1208733 m!1114351))

(declare-fun m!1114629 () Bool)

(assert (=> b!1208733 m!1114629))

(assert (=> b!1208733 m!1114627))

(declare-fun m!1114631 () Bool)

(assert (=> b!1208733 m!1114631))

(declare-fun m!1114633 () Bool)

(assert (=> b!1208733 m!1114633))

(assert (=> b!1208733 m!1114633))

(assert (=> b!1208733 m!1114379))

(declare-fun m!1114635 () Bool)

(assert (=> b!1208733 m!1114635))

(declare-fun m!1114637 () Bool)

(assert (=> b!1208733 m!1114637))

(assert (=> b!1208733 m!1114379))

(assert (=> b!1208735 m!1114351))

(assert (=> b!1208735 m!1114351))

(declare-fun m!1114639 () Bool)

(assert (=> b!1208735 m!1114639))

(assert (=> b!1208744 m!1114351))

(assert (=> b!1208744 m!1114351))

(declare-fun m!1114641 () Bool)

(assert (=> b!1208744 m!1114641))

(declare-fun m!1114643 () Bool)

(assert (=> b!1208734 m!1114643))

(declare-fun m!1114645 () Bool)

(assert (=> b!1208741 m!1114645))

(assert (=> b!1208742 m!1114351))

(assert (=> b!1208742 m!1114351))

(assert (=> b!1208742 m!1114639))

(assert (=> b!1208739 m!1114351))

(assert (=> b!1208739 m!1114351))

(declare-fun m!1114647 () Bool)

(assert (=> b!1208739 m!1114647))

(assert (=> b!1208739 m!1114633))

(assert (=> b!1208739 m!1114633))

(assert (=> b!1208739 m!1114379))

(assert (=> b!1208739 m!1114635))

(assert (=> b!1208739 m!1114379))

(declare-fun m!1114649 () Bool)

(assert (=> d!133417 m!1114649))

(assert (=> d!133417 m!1114367))

(assert (=> b!1208740 m!1114625))

(assert (=> b!1208459 d!133417))

(declare-fun d!133419 () Bool)

(declare-fun res!803324 () Bool)

(declare-fun e!686533 () Bool)

(assert (=> d!133419 (=> res!803324 e!686533)))

(assert (=> d!133419 (= res!803324 (= (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133419 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!686533)))

(declare-fun b!1208745 () Bool)

(declare-fun e!686534 () Bool)

(assert (=> b!1208745 (= e!686533 e!686534)))

(declare-fun res!803325 () Bool)

(assert (=> b!1208745 (=> (not res!803325) (not e!686534))))

(assert (=> b!1208745 (= res!803325 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun b!1208746 () Bool)

(assert (=> b!1208746 (= e!686534 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133419 (not res!803324)) b!1208745))

(assert (= (and b!1208745 res!803325) b!1208746))

(assert (=> d!133419 m!1114525))

(declare-fun m!1114651 () Bool)

(assert (=> b!1208746 m!1114651))

(assert (=> b!1208467 d!133419))

(declare-fun b!1208755 () Bool)

(declare-fun e!686543 () Bool)

(declare-fun call!59040 () Bool)

(assert (=> b!1208755 (= e!686543 call!59040)))

(declare-fun d!133421 () Bool)

(declare-fun res!803331 () Bool)

(declare-fun e!686541 () Bool)

(assert (=> d!133421 (=> res!803331 e!686541)))

(assert (=> d!133421 (= res!803331 (bvsge #b00000000000000000000000000000000 (size!38245 lt!548177)))))

(assert (=> d!133421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548177 mask!1564) e!686541)))

(declare-fun b!1208756 () Bool)

(declare-fun e!686542 () Bool)

(assert (=> b!1208756 (= e!686541 e!686542)))

(declare-fun c!119059 () Bool)

(assert (=> b!1208756 (= c!119059 (validKeyInArray!0 (select (arr!37708 lt!548177) #b00000000000000000000000000000000)))))

(declare-fun b!1208757 () Bool)

(assert (=> b!1208757 (= e!686542 call!59040)))

(declare-fun bm!59037 () Bool)

(assert (=> bm!59037 (= call!59040 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!548177 mask!1564))))

(declare-fun b!1208758 () Bool)

(assert (=> b!1208758 (= e!686542 e!686543)))

(declare-fun lt!548366 () (_ BitVec 64))

(assert (=> b!1208758 (= lt!548366 (select (arr!37708 lt!548177) #b00000000000000000000000000000000))))

(declare-fun lt!548367 () Unit!39973)

(assert (=> b!1208758 (= lt!548367 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!548177 lt!548366 #b00000000000000000000000000000000))))

(assert (=> b!1208758 (arrayContainsKey!0 lt!548177 lt!548366 #b00000000000000000000000000000000)))

(declare-fun lt!548365 () Unit!39973)

(assert (=> b!1208758 (= lt!548365 lt!548367)))

(declare-fun res!803330 () Bool)

(declare-datatypes ((SeekEntryResult!9894 0))(
  ( (MissingZero!9894 (index!41947 (_ BitVec 32))) (Found!9894 (index!41948 (_ BitVec 32))) (Intermediate!9894 (undefined!10706 Bool) (index!41949 (_ BitVec 32)) (x!106558 (_ BitVec 32))) (Undefined!9894) (MissingVacant!9894 (index!41950 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78149 (_ BitVec 32)) SeekEntryResult!9894)

(assert (=> b!1208758 (= res!803330 (= (seekEntryOrOpen!0 (select (arr!37708 lt!548177) #b00000000000000000000000000000000) lt!548177 mask!1564) (Found!9894 #b00000000000000000000000000000000)))))

(assert (=> b!1208758 (=> (not res!803330) (not e!686543))))

(assert (= (and d!133421 (not res!803331)) b!1208756))

(assert (= (and b!1208756 c!119059) b!1208758))

(assert (= (and b!1208756 (not c!119059)) b!1208757))

(assert (= (and b!1208758 res!803330) b!1208755))

(assert (= (or b!1208755 b!1208757) bm!59037))

(declare-fun m!1114653 () Bool)

(assert (=> b!1208756 m!1114653))

(assert (=> b!1208756 m!1114653))

(declare-fun m!1114655 () Bool)

(assert (=> b!1208756 m!1114655))

(declare-fun m!1114657 () Bool)

(assert (=> bm!59037 m!1114657))

(assert (=> b!1208758 m!1114653))

(declare-fun m!1114659 () Bool)

(assert (=> b!1208758 m!1114659))

(declare-fun m!1114661 () Bool)

(assert (=> b!1208758 m!1114661))

(assert (=> b!1208758 m!1114653))

(declare-fun m!1114663 () Bool)

(assert (=> b!1208758 m!1114663))

(assert (=> b!1208472 d!133421))

(declare-fun d!133423 () Bool)

(assert (=> d!133423 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208456 d!133423))

(declare-fun d!133425 () Bool)

(declare-fun e!686545 () Bool)

(assert (=> d!133425 e!686545))

(declare-fun res!803332 () Bool)

(assert (=> d!133425 (=> res!803332 e!686545)))

(declare-fun lt!548368 () Bool)

(assert (=> d!133425 (= res!803332 (not lt!548368))))

(declare-fun lt!548370 () Bool)

(assert (=> d!133425 (= lt!548368 lt!548370)))

(declare-fun lt!548371 () Unit!39973)

(declare-fun e!686544 () Unit!39973)

(assert (=> d!133425 (= lt!548371 e!686544)))

(declare-fun c!119060 () Bool)

(assert (=> d!133425 (= c!119060 lt!548370)))

(assert (=> d!133425 (= lt!548370 (containsKey!594 (toList!8885 lt!548178) k0!934))))

(assert (=> d!133425 (= (contains!6966 lt!548178 k0!934) lt!548368)))

(declare-fun b!1208759 () Bool)

(declare-fun lt!548369 () Unit!39973)

(assert (=> b!1208759 (= e!686544 lt!548369)))

(assert (=> b!1208759 (= lt!548369 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548178) k0!934))))

(assert (=> b!1208759 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548178) k0!934))))

(declare-fun b!1208760 () Bool)

(declare-fun Unit!39982 () Unit!39973)

(assert (=> b!1208760 (= e!686544 Unit!39982)))

(declare-fun b!1208761 () Bool)

(assert (=> b!1208761 (= e!686545 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548178) k0!934)))))

(assert (= (and d!133425 c!119060) b!1208759))

(assert (= (and d!133425 (not c!119060)) b!1208760))

(assert (= (and d!133425 (not res!803332)) b!1208761))

(declare-fun m!1114665 () Bool)

(assert (=> d!133425 m!1114665))

(declare-fun m!1114667 () Bool)

(assert (=> b!1208759 m!1114667))

(declare-fun m!1114669 () Bool)

(assert (=> b!1208759 m!1114669))

(assert (=> b!1208759 m!1114669))

(declare-fun m!1114671 () Bool)

(assert (=> b!1208759 m!1114671))

(assert (=> b!1208761 m!1114669))

(assert (=> b!1208761 m!1114669))

(assert (=> b!1208761 m!1114671))

(assert (=> b!1208464 d!133425))

(assert (=> b!1208464 d!133397))

(declare-fun b!1208772 () Bool)

(declare-fun e!686556 () Bool)

(declare-fun e!686557 () Bool)

(assert (=> b!1208772 (= e!686556 e!686557)))

(declare-fun res!803341 () Bool)

(assert (=> b!1208772 (=> (not res!803341) (not e!686557))))

(declare-fun e!686555 () Bool)

(assert (=> b!1208772 (= res!803341 (not e!686555))))

(declare-fun res!803339 () Bool)

(assert (=> b!1208772 (=> (not res!803339) (not e!686555))))

(assert (=> b!1208772 (= res!803339 (validKeyInArray!0 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208773 () Bool)

(declare-fun contains!6970 (List!26570 (_ BitVec 64)) Bool)

(assert (=> b!1208773 (= e!686555 (contains!6970 Nil!26567 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208774 () Bool)

(declare-fun e!686554 () Bool)

(assert (=> b!1208774 (= e!686557 e!686554)))

(declare-fun c!119063 () Bool)

(assert (=> b!1208774 (= c!119063 (validKeyInArray!0 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!59040 () Bool)

(declare-fun call!59043 () Bool)

(assert (=> bm!59040 (= call!59043 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119063 (Cons!26566 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) Nil!26567) Nil!26567)))))

(declare-fun b!1208775 () Bool)

(assert (=> b!1208775 (= e!686554 call!59043)))

(declare-fun b!1208776 () Bool)

(assert (=> b!1208776 (= e!686554 call!59043)))

(declare-fun d!133427 () Bool)

(declare-fun res!803340 () Bool)

(assert (=> d!133427 (=> res!803340 e!686556)))

(assert (=> d!133427 (= res!803340 (bvsge #b00000000000000000000000000000000 (size!38245 _keys!1208)))))

(assert (=> d!133427 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26567) e!686556)))

(assert (= (and d!133427 (not res!803340)) b!1208772))

(assert (= (and b!1208772 res!803339) b!1208773))

(assert (= (and b!1208772 res!803341) b!1208774))

(assert (= (and b!1208774 c!119063) b!1208776))

(assert (= (and b!1208774 (not c!119063)) b!1208775))

(assert (= (or b!1208776 b!1208775) bm!59040))

(assert (=> b!1208772 m!1114573))

(assert (=> b!1208772 m!1114573))

(declare-fun m!1114673 () Bool)

(assert (=> b!1208772 m!1114673))

(assert (=> b!1208773 m!1114573))

(assert (=> b!1208773 m!1114573))

(declare-fun m!1114675 () Bool)

(assert (=> b!1208773 m!1114675))

(assert (=> b!1208774 m!1114573))

(assert (=> b!1208774 m!1114573))

(assert (=> b!1208774 m!1114673))

(assert (=> bm!59040 m!1114573))

(declare-fun m!1114677 () Bool)

(assert (=> bm!59040 m!1114677))

(assert (=> b!1208466 d!133427))

(declare-fun b!1208777 () Bool)

(declare-fun e!686560 () Bool)

(declare-fun e!686561 () Bool)

(assert (=> b!1208777 (= e!686560 e!686561)))

(declare-fun res!803344 () Bool)

(assert (=> b!1208777 (=> (not res!803344) (not e!686561))))

(declare-fun e!686559 () Bool)

(assert (=> b!1208777 (= res!803344 (not e!686559))))

(declare-fun res!803342 () Bool)

(assert (=> b!1208777 (=> (not res!803342) (not e!686559))))

(assert (=> b!1208777 (= res!803342 (validKeyInArray!0 (select (arr!37708 lt!548177) #b00000000000000000000000000000000)))))

(declare-fun b!1208778 () Bool)

(assert (=> b!1208778 (= e!686559 (contains!6970 Nil!26567 (select (arr!37708 lt!548177) #b00000000000000000000000000000000)))))

(declare-fun b!1208779 () Bool)

(declare-fun e!686558 () Bool)

(assert (=> b!1208779 (= e!686561 e!686558)))

(declare-fun c!119064 () Bool)

(assert (=> b!1208779 (= c!119064 (validKeyInArray!0 (select (arr!37708 lt!548177) #b00000000000000000000000000000000)))))

(declare-fun bm!59041 () Bool)

(declare-fun call!59044 () Bool)

(assert (=> bm!59041 (= call!59044 (arrayNoDuplicates!0 lt!548177 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119064 (Cons!26566 (select (arr!37708 lt!548177) #b00000000000000000000000000000000) Nil!26567) Nil!26567)))))

(declare-fun b!1208780 () Bool)

(assert (=> b!1208780 (= e!686558 call!59044)))

(declare-fun b!1208781 () Bool)

(assert (=> b!1208781 (= e!686558 call!59044)))

(declare-fun d!133429 () Bool)

(declare-fun res!803343 () Bool)

(assert (=> d!133429 (=> res!803343 e!686560)))

(assert (=> d!133429 (= res!803343 (bvsge #b00000000000000000000000000000000 (size!38245 lt!548177)))))

(assert (=> d!133429 (= (arrayNoDuplicates!0 lt!548177 #b00000000000000000000000000000000 Nil!26567) e!686560)))

(assert (= (and d!133429 (not res!803343)) b!1208777))

(assert (= (and b!1208777 res!803342) b!1208778))

(assert (= (and b!1208777 res!803344) b!1208779))

(assert (= (and b!1208779 c!119064) b!1208781))

(assert (= (and b!1208779 (not c!119064)) b!1208780))

(assert (= (or b!1208781 b!1208780) bm!59041))

(assert (=> b!1208777 m!1114653))

(assert (=> b!1208777 m!1114653))

(assert (=> b!1208777 m!1114655))

(assert (=> b!1208778 m!1114653))

(assert (=> b!1208778 m!1114653))

(declare-fun m!1114679 () Bool)

(assert (=> b!1208778 m!1114679))

(assert (=> b!1208779 m!1114653))

(assert (=> b!1208779 m!1114653))

(assert (=> b!1208779 m!1114655))

(assert (=> bm!59041 m!1114653))

(declare-fun m!1114681 () Bool)

(assert (=> bm!59041 m!1114681))

(assert (=> b!1208473 d!133429))

(declare-fun b!1208782 () Bool)

(declare-fun e!686564 () Bool)

(declare-fun e!686565 () Bool)

(assert (=> b!1208782 (= e!686564 e!686565)))

(declare-fun res!803347 () Bool)

(assert (=> b!1208782 (=> (not res!803347) (not e!686565))))

(declare-fun e!686563 () Bool)

(assert (=> b!1208782 (= res!803347 (not e!686563))))

(declare-fun res!803345 () Bool)

(assert (=> b!1208782 (=> (not res!803345) (not e!686563))))

(assert (=> b!1208782 (= res!803345 (validKeyInArray!0 (select (arr!37708 _keys!1208) from!1455)))))

(declare-fun b!1208783 () Bool)

(assert (=> b!1208783 (= e!686563 (contains!6970 Nil!26567 (select (arr!37708 _keys!1208) from!1455)))))

(declare-fun b!1208784 () Bool)

(declare-fun e!686562 () Bool)

(assert (=> b!1208784 (= e!686565 e!686562)))

(declare-fun c!119065 () Bool)

(assert (=> b!1208784 (= c!119065 (validKeyInArray!0 (select (arr!37708 _keys!1208) from!1455)))))

(declare-fun call!59045 () Bool)

(declare-fun bm!59042 () Bool)

(assert (=> bm!59042 (= call!59045 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!119065 (Cons!26566 (select (arr!37708 _keys!1208) from!1455) Nil!26567) Nil!26567)))))

(declare-fun b!1208785 () Bool)

(assert (=> b!1208785 (= e!686562 call!59045)))

(declare-fun b!1208786 () Bool)

(assert (=> b!1208786 (= e!686562 call!59045)))

(declare-fun d!133431 () Bool)

(declare-fun res!803346 () Bool)

(assert (=> d!133431 (=> res!803346 e!686564)))

(assert (=> d!133431 (= res!803346 (bvsge from!1455 (size!38245 _keys!1208)))))

(assert (=> d!133431 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26567) e!686564)))

(assert (= (and d!133431 (not res!803346)) b!1208782))

(assert (= (and b!1208782 res!803345) b!1208783))

(assert (= (and b!1208782 res!803347) b!1208784))

(assert (= (and b!1208784 c!119065) b!1208786))

(assert (= (and b!1208784 (not c!119065)) b!1208785))

(assert (= (or b!1208786 b!1208785) bm!59042))

(assert (=> b!1208782 m!1114351))

(assert (=> b!1208782 m!1114351))

(assert (=> b!1208782 m!1114639))

(assert (=> b!1208783 m!1114351))

(assert (=> b!1208783 m!1114351))

(declare-fun m!1114683 () Bool)

(assert (=> b!1208783 m!1114683))

(assert (=> b!1208784 m!1114351))

(assert (=> b!1208784 m!1114351))

(assert (=> b!1208784 m!1114639))

(assert (=> bm!59042 m!1114351))

(declare-fun m!1114685 () Bool)

(assert (=> bm!59042 m!1114685))

(assert (=> b!1208462 d!133431))

(declare-fun d!133433 () Bool)

(assert (=> d!133433 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26567)))

(declare-fun lt!548374 () Unit!39973)

(declare-fun choose!39 (array!78149 (_ BitVec 32) (_ BitVec 32)) Unit!39973)

(assert (=> d!133433 (= lt!548374 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133433 (bvslt (size!38245 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133433 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!548374)))

(declare-fun bs!34149 () Bool)

(assert (= bs!34149 d!133433))

(assert (=> bs!34149 m!1114343))

(declare-fun m!1114687 () Bool)

(assert (=> bs!34149 m!1114687))

(assert (=> b!1208462 d!133433))

(declare-fun d!133435 () Bool)

(declare-fun e!686568 () Bool)

(assert (=> d!133435 e!686568))

(declare-fun c!119068 () Bool)

(assert (=> d!133435 (= c!119068 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548377 () Unit!39973)

(declare-fun choose!1808 (array!78149 array!78151 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 64) (_ BitVec 32) Int) Unit!39973)

(assert (=> d!133435 (= lt!548377 (choose!1808 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133435 (validMask!0 mask!1564)))

(assert (=> d!133435 (= (lemmaListMapContainsThenArrayContainsFrom!584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548377)))

(declare-fun b!1208791 () Bool)

(assert (=> b!1208791 (= e!686568 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208792 () Bool)

(assert (=> b!1208792 (= e!686568 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133435 c!119068) b!1208791))

(assert (= (and d!133435 (not c!119068)) b!1208792))

(declare-fun m!1114689 () Bool)

(assert (=> d!133435 m!1114689))

(assert (=> d!133435 m!1114367))

(assert (=> b!1208791 m!1114323))

(assert (=> b!1208462 d!133435))

(declare-fun d!133437 () Bool)

(assert (=> d!133437 (contains!6966 (+!4047 lt!548178 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!548378 () Unit!39973)

(assert (=> d!133437 (= lt!548378 (choose!1806 lt!548178 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!133437 (contains!6966 lt!548178 k0!934)))

(assert (=> d!133437 (= (addStillContains!1032 lt!548178 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944) k0!934) lt!548378)))

(declare-fun bs!34150 () Bool)

(assert (= bs!34150 d!133437))

(declare-fun m!1114691 () Bool)

(assert (=> bs!34150 m!1114691))

(assert (=> bs!34150 m!1114691))

(declare-fun m!1114693 () Bool)

(assert (=> bs!34150 m!1114693))

(declare-fun m!1114695 () Bool)

(assert (=> bs!34150 m!1114695))

(assert (=> bs!34150 m!1114329))

(assert (=> bm!58975 d!133437))

(assert (=> b!1208454 d!133419))

(declare-fun b!1208793 () Bool)

(declare-fun e!686571 () Bool)

(declare-fun call!59046 () Bool)

(assert (=> b!1208793 (= e!686571 call!59046)))

(declare-fun d!133439 () Bool)

(declare-fun res!803349 () Bool)

(declare-fun e!686569 () Bool)

(assert (=> d!133439 (=> res!803349 e!686569)))

(assert (=> d!133439 (= res!803349 (bvsge #b00000000000000000000000000000000 (size!38245 _keys!1208)))))

(assert (=> d!133439 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!686569)))

(declare-fun b!1208794 () Bool)

(declare-fun e!686570 () Bool)

(assert (=> b!1208794 (= e!686569 e!686570)))

(declare-fun c!119069 () Bool)

(assert (=> b!1208794 (= c!119069 (validKeyInArray!0 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208795 () Bool)

(assert (=> b!1208795 (= e!686570 call!59046)))

(declare-fun bm!59043 () Bool)

(assert (=> bm!59043 (= call!59046 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1208796 () Bool)

(assert (=> b!1208796 (= e!686570 e!686571)))

(declare-fun lt!548380 () (_ BitVec 64))

(assert (=> b!1208796 (= lt!548380 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!548381 () Unit!39973)

(assert (=> b!1208796 (= lt!548381 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!548380 #b00000000000000000000000000000000))))

(assert (=> b!1208796 (arrayContainsKey!0 _keys!1208 lt!548380 #b00000000000000000000000000000000)))

(declare-fun lt!548379 () Unit!39973)

(assert (=> b!1208796 (= lt!548379 lt!548381)))

(declare-fun res!803348 () Bool)

(assert (=> b!1208796 (= res!803348 (= (seekEntryOrOpen!0 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9894 #b00000000000000000000000000000000)))))

(assert (=> b!1208796 (=> (not res!803348) (not e!686571))))

(assert (= (and d!133439 (not res!803349)) b!1208794))

(assert (= (and b!1208794 c!119069) b!1208796))

(assert (= (and b!1208794 (not c!119069)) b!1208795))

(assert (= (and b!1208796 res!803348) b!1208793))

(assert (= (or b!1208793 b!1208795) bm!59043))

(assert (=> b!1208794 m!1114573))

(assert (=> b!1208794 m!1114573))

(assert (=> b!1208794 m!1114673))

(declare-fun m!1114697 () Bool)

(assert (=> bm!59043 m!1114697))

(assert (=> b!1208796 m!1114573))

(declare-fun m!1114699 () Bool)

(assert (=> b!1208796 m!1114699))

(declare-fun m!1114701 () Bool)

(assert (=> b!1208796 m!1114701))

(assert (=> b!1208796 m!1114573))

(declare-fun m!1114703 () Bool)

(assert (=> b!1208796 m!1114703))

(assert (=> b!1208468 d!133439))

(declare-fun b!1208797 () Bool)

(declare-fun lt!548387 () Unit!39973)

(declare-fun lt!548385 () Unit!39973)

(assert (=> b!1208797 (= lt!548387 lt!548385)))

(declare-fun lt!548388 () (_ BitVec 64))

(declare-fun lt!548382 () ListLongMap!17739)

(declare-fun lt!548386 () V!46017)

(declare-fun lt!548384 () (_ BitVec 64))

(assert (=> b!1208797 (not (contains!6966 (+!4047 lt!548382 (tuple2!19763 lt!548388 lt!548386)) lt!548384))))

(assert (=> b!1208797 (= lt!548385 (addStillNotContains!295 lt!548382 lt!548388 lt!548386 lt!548384))))

(assert (=> b!1208797 (= lt!548384 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208797 (= lt!548386 (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208797 (= lt!548388 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!59047 () ListLongMap!17739)

(assert (=> b!1208797 (= lt!548382 call!59047)))

(declare-fun e!686573 () ListLongMap!17739)

(assert (=> b!1208797 (= e!686573 (+!4047 call!59047 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133441 () Bool)

(declare-fun e!686572 () Bool)

(assert (=> d!133441 e!686572))

(declare-fun res!803352 () Bool)

(assert (=> d!133441 (=> (not res!803352) (not e!686572))))

(declare-fun lt!548383 () ListLongMap!17739)

(assert (=> d!133441 (= res!803352 (not (contains!6966 lt!548383 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686576 () ListLongMap!17739)

(assert (=> d!133441 (= lt!548383 e!686576)))

(declare-fun c!119070 () Bool)

(assert (=> d!133441 (= c!119070 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 lt!548177)))))

(assert (=> d!133441 (validMask!0 mask!1564)))

(assert (=> d!133441 (= (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548383)))

(declare-fun b!1208798 () Bool)

(declare-fun e!686574 () Bool)

(assert (=> b!1208798 (= e!686574 (isEmpty!991 lt!548383))))

(declare-fun bm!59044 () Bool)

(assert (=> bm!59044 (= call!59047 (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208799 () Bool)

(assert (=> b!1208799 (= e!686576 e!686573)))

(declare-fun c!119072 () Bool)

(assert (=> b!1208799 (= c!119072 (validKeyInArray!0 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1208800 () Bool)

(assert (=> b!1208800 (= e!686573 call!59047)))

(declare-fun b!1208801 () Bool)

(assert (=> b!1208801 (= e!686576 (ListLongMap!17740 Nil!26566))))

(declare-fun b!1208802 () Bool)

(declare-fun e!686575 () Bool)

(assert (=> b!1208802 (= e!686572 e!686575)))

(declare-fun c!119073 () Bool)

(declare-fun e!686577 () Bool)

(assert (=> b!1208802 (= c!119073 e!686577)))

(declare-fun res!803350 () Bool)

(assert (=> b!1208802 (=> (not res!803350) (not e!686577))))

(assert (=> b!1208802 (= res!803350 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 lt!548177)))))

(declare-fun b!1208803 () Bool)

(assert (=> b!1208803 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 lt!548177)))))

(assert (=> b!1208803 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 lt!548180)))))

(declare-fun e!686578 () Bool)

(assert (=> b!1208803 (= e!686578 (= (apply!974 lt!548383 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208804 () Bool)

(assert (=> b!1208804 (= e!686574 (= lt!548383 (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208805 () Bool)

(declare-fun res!803351 () Bool)

(assert (=> b!1208805 (=> (not res!803351) (not e!686572))))

(assert (=> b!1208805 (= res!803351 (not (contains!6966 lt!548383 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208806 () Bool)

(assert (=> b!1208806 (= e!686577 (validKeyInArray!0 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208806 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1208807 () Bool)

(assert (=> b!1208807 (= e!686575 e!686574)))

(declare-fun c!119071 () Bool)

(assert (=> b!1208807 (= c!119071 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 lt!548177)))))

(declare-fun b!1208808 () Bool)

(assert (=> b!1208808 (= e!686575 e!686578)))

(assert (=> b!1208808 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 lt!548177)))))

(declare-fun res!803353 () Bool)

(assert (=> b!1208808 (= res!803353 (contains!6966 lt!548383 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208808 (=> (not res!803353) (not e!686578))))

(assert (= (and d!133441 c!119070) b!1208801))

(assert (= (and d!133441 (not c!119070)) b!1208799))

(assert (= (and b!1208799 c!119072) b!1208797))

(assert (= (and b!1208799 (not c!119072)) b!1208800))

(assert (= (or b!1208797 b!1208800) bm!59044))

(assert (= (and d!133441 res!803352) b!1208805))

(assert (= (and b!1208805 res!803351) b!1208802))

(assert (= (and b!1208802 res!803350) b!1208806))

(assert (= (and b!1208802 c!119073) b!1208808))

(assert (= (and b!1208802 (not c!119073)) b!1208807))

(assert (= (and b!1208808 res!803353) b!1208803))

(assert (= (and b!1208807 c!119071) b!1208804))

(assert (= (and b!1208807 (not c!119071)) b!1208798))

(declare-fun b_lambda!21421 () Bool)

(assert (=> (not b_lambda!21421) (not b!1208797)))

(assert (=> b!1208797 t!39503))

(declare-fun b_and!42959 () Bool)

(assert (= b_and!42957 (and (=> t!39503 result!22105) b_and!42959)))

(declare-fun b_lambda!21423 () Bool)

(assert (=> (not b_lambda!21423) (not b!1208803)))

(assert (=> b!1208803 t!39503))

(declare-fun b_and!42961 () Bool)

(assert (= b_and!42959 (and (=> t!39503 result!22105) b_and!42961)))

(declare-fun m!1114705 () Bool)

(assert (=> bm!59044 m!1114705))

(declare-fun m!1114707 () Bool)

(assert (=> b!1208797 m!1114707))

(declare-fun m!1114709 () Bool)

(assert (=> b!1208797 m!1114709))

(declare-fun m!1114711 () Bool)

(assert (=> b!1208797 m!1114711))

(assert (=> b!1208797 m!1114707))

(declare-fun m!1114713 () Bool)

(assert (=> b!1208797 m!1114713))

(declare-fun m!1114715 () Bool)

(assert (=> b!1208797 m!1114715))

(assert (=> b!1208797 m!1114715))

(assert (=> b!1208797 m!1114379))

(declare-fun m!1114717 () Bool)

(assert (=> b!1208797 m!1114717))

(declare-fun m!1114719 () Bool)

(assert (=> b!1208797 m!1114719))

(assert (=> b!1208797 m!1114379))

(assert (=> b!1208799 m!1114709))

(assert (=> b!1208799 m!1114709))

(declare-fun m!1114721 () Bool)

(assert (=> b!1208799 m!1114721))

(assert (=> b!1208808 m!1114709))

(assert (=> b!1208808 m!1114709))

(declare-fun m!1114723 () Bool)

(assert (=> b!1208808 m!1114723))

(declare-fun m!1114725 () Bool)

(assert (=> b!1208798 m!1114725))

(declare-fun m!1114727 () Bool)

(assert (=> b!1208805 m!1114727))

(assert (=> b!1208806 m!1114709))

(assert (=> b!1208806 m!1114709))

(assert (=> b!1208806 m!1114721))

(assert (=> b!1208803 m!1114709))

(assert (=> b!1208803 m!1114709))

(declare-fun m!1114729 () Bool)

(assert (=> b!1208803 m!1114729))

(assert (=> b!1208803 m!1114715))

(assert (=> b!1208803 m!1114715))

(assert (=> b!1208803 m!1114379))

(assert (=> b!1208803 m!1114717))

(assert (=> b!1208803 m!1114379))

(declare-fun m!1114731 () Bool)

(assert (=> d!133441 m!1114731))

(assert (=> d!133441 m!1114367))

(assert (=> b!1208804 m!1114705))

(assert (=> bm!58970 d!133441))

(declare-fun d!133443 () Bool)

(declare-fun e!686580 () Bool)

(assert (=> d!133443 e!686580))

(declare-fun res!803354 () Bool)

(assert (=> d!133443 (=> res!803354 e!686580)))

(declare-fun lt!548389 () Bool)

(assert (=> d!133443 (= res!803354 (not lt!548389))))

(declare-fun lt!548391 () Bool)

(assert (=> d!133443 (= lt!548389 lt!548391)))

(declare-fun lt!548392 () Unit!39973)

(declare-fun e!686579 () Unit!39973)

(assert (=> d!133443 (= lt!548392 e!686579)))

(declare-fun c!119074 () Bool)

(assert (=> d!133443 (= c!119074 lt!548391)))

(assert (=> d!133443 (= lt!548391 (containsKey!594 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934))))

(assert (=> d!133443 (= (contains!6966 (ite c!119000 lt!548186 call!58974) k0!934) lt!548389)))

(declare-fun b!1208809 () Bool)

(declare-fun lt!548390 () Unit!39973)

(assert (=> b!1208809 (= e!686579 lt!548390)))

(assert (=> b!1208809 (= lt!548390 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934))))

(assert (=> b!1208809 (isDefined!460 (getValueByKey!632 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934))))

(declare-fun b!1208810 () Bool)

(declare-fun Unit!39983 () Unit!39973)

(assert (=> b!1208810 (= e!686579 Unit!39983)))

(declare-fun b!1208811 () Bool)

(assert (=> b!1208811 (= e!686580 (isDefined!460 (getValueByKey!632 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934)))))

(assert (= (and d!133443 c!119074) b!1208809))

(assert (= (and d!133443 (not c!119074)) b!1208810))

(assert (= (and d!133443 (not res!803354)) b!1208811))

(declare-fun m!1114733 () Bool)

(assert (=> d!133443 m!1114733))

(declare-fun m!1114735 () Bool)

(assert (=> b!1208809 m!1114735))

(declare-fun m!1114737 () Bool)

(assert (=> b!1208809 m!1114737))

(assert (=> b!1208809 m!1114737))

(declare-fun m!1114739 () Bool)

(assert (=> b!1208809 m!1114739))

(assert (=> b!1208811 m!1114737))

(assert (=> b!1208811 m!1114737))

(assert (=> b!1208811 m!1114739))

(assert (=> bm!58971 d!133443))

(declare-fun d!133445 () Bool)

(assert (=> d!133445 (= (array_inv!28792 _keys!1208) (bvsge (size!38245 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101060 d!133445))

(declare-fun d!133447 () Bool)

(assert (=> d!133447 (= (array_inv!28793 _values!996) (bvsge (size!38246 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101060 d!133447))

(declare-fun d!133449 () Bool)

(declare-fun lt!548395 () ListLongMap!17739)

(assert (=> d!133449 (not (contains!6966 lt!548395 k0!934))))

(declare-fun removeStrictlySorted!97 (List!26569 (_ BitVec 64)) List!26569)

(assert (=> d!133449 (= lt!548395 (ListLongMap!17740 (removeStrictlySorted!97 (toList!8885 call!58976) k0!934)))))

(assert (=> d!133449 (= (-!1822 call!58976 k0!934) lt!548395)))

(declare-fun bs!34151 () Bool)

(assert (= bs!34151 d!133449))

(declare-fun m!1114741 () Bool)

(assert (=> bs!34151 m!1114741))

(declare-fun m!1114743 () Bool)

(assert (=> bs!34151 m!1114743))

(assert (=> b!1208461 d!133449))

(declare-fun b!1208819 () Bool)

(declare-fun e!686586 () Bool)

(assert (=> b!1208819 (= e!686586 tp_is_empty!30667)))

(declare-fun b!1208818 () Bool)

(declare-fun e!686585 () Bool)

(assert (=> b!1208818 (= e!686585 tp_is_empty!30667)))

(declare-fun mapIsEmpty!47868 () Bool)

(declare-fun mapRes!47868 () Bool)

(assert (=> mapIsEmpty!47868 mapRes!47868))

(declare-fun condMapEmpty!47868 () Bool)

(declare-fun mapDefault!47868 () ValueCell!14624)

(assert (=> mapNonEmpty!47859 (= condMapEmpty!47868 (= mapRest!47859 ((as const (Array (_ BitVec 32) ValueCell!14624)) mapDefault!47868)))))

(assert (=> mapNonEmpty!47859 (= tp!90895 (and e!686586 mapRes!47868))))

(declare-fun mapNonEmpty!47868 () Bool)

(declare-fun tp!90910 () Bool)

(assert (=> mapNonEmpty!47868 (= mapRes!47868 (and tp!90910 e!686585))))

(declare-fun mapValue!47868 () ValueCell!14624)

(declare-fun mapKey!47868 () (_ BitVec 32))

(declare-fun mapRest!47868 () (Array (_ BitVec 32) ValueCell!14624))

(assert (=> mapNonEmpty!47868 (= mapRest!47859 (store mapRest!47868 mapKey!47868 mapValue!47868))))

(assert (= (and mapNonEmpty!47859 condMapEmpty!47868) mapIsEmpty!47868))

(assert (= (and mapNonEmpty!47859 (not condMapEmpty!47868)) mapNonEmpty!47868))

(assert (= (and mapNonEmpty!47868 ((_ is ValueCellFull!14624) mapValue!47868)) b!1208818))

(assert (= (and mapNonEmpty!47859 ((_ is ValueCellFull!14624) mapDefault!47868)) b!1208819))

(declare-fun m!1114745 () Bool)

(assert (=> mapNonEmpty!47868 m!1114745))

(declare-fun b_lambda!21425 () Bool)

(assert (= b_lambda!21421 (or (and start!101060 b_free!25963) b_lambda!21425)))

(declare-fun b_lambda!21427 () Bool)

(assert (= b_lambda!21407 (or (and start!101060 b_free!25963) b_lambda!21427)))

(declare-fun b_lambda!21429 () Bool)

(assert (= b_lambda!21409 (or (and start!101060 b_free!25963) b_lambda!21429)))

(declare-fun b_lambda!21431 () Bool)

(assert (= b_lambda!21411 (or (and start!101060 b_free!25963) b_lambda!21431)))

(declare-fun b_lambda!21433 () Bool)

(assert (= b_lambda!21423 (or (and start!101060 b_free!25963) b_lambda!21433)))

(declare-fun b_lambda!21435 () Bool)

(assert (= b_lambda!21413 (or (and start!101060 b_free!25963) b_lambda!21435)))

(declare-fun b_lambda!21437 () Bool)

(assert (= b_lambda!21415 (or (and start!101060 b_free!25963) b_lambda!21437)))

(declare-fun b_lambda!21439 () Bool)

(assert (= b_lambda!21417 (or (and start!101060 b_free!25963) b_lambda!21439)))

(declare-fun b_lambda!21441 () Bool)

(assert (= b_lambda!21419 (or (and start!101060 b_free!25963) b_lambda!21441)))

(check-sat (not b!1208797) (not b_lambda!21441) (not b!1208794) (not b!1208778) (not b!1208719) (not d!133399) (not b!1208685) (not b_lambda!21427) b_and!42961 (not b!1208784) (not b!1208734) (not b!1208808) (not b!1208677) (not b!1208809) (not b_lambda!21437) (not b!1208811) (not b!1208798) (not d!133425) (not b!1208758) (not b!1208803) (not b!1208728) (not b!1208709) (not bm!59041) (not b!1208746) (not b!1208799) (not b!1208741) (not d!133401) (not b!1208805) (not b!1208773) (not b!1208722) (not b_lambda!21435) (not b!1208772) (not b!1208739) (not b!1208796) (not b_lambda!21431) (not bm!59034) tp_is_empty!30667 (not b!1208782) (not b!1208735) (not b!1208727) (not b_next!25963) (not d!133413) (not b!1208676) (not d!133443) (not d!133415) (not d!133433) (not b!1208729) (not b!1208732) (not b!1208687) (not bm!59031) (not bm!59026) (not b_lambda!21429) (not b!1208761) (not d!133403) (not b!1208774) (not b!1208716) (not b!1208730) (not b!1208756) (not d!133409) (not d!133449) (not mapNonEmpty!47868) (not b_lambda!21439) (not d!133435) (not b!1208683) (not b!1208779) (not b!1208744) (not bm!59040) (not b!1208684) (not bm!59037) (not b!1208777) (not b!1208804) (not bm!59042) (not b!1208742) (not bm!59043) (not b!1208791) (not bm!59032) (not b!1208723) (not b!1208697) (not d!133437) (not d!133441) (not b!1208740) (not d!133407) (not b_lambda!21405) (not b!1208682) (not b!1208720) (not d!133417) (not b!1208733) (not bm!59044) (not b_lambda!21425) (not b!1208721) (not b!1208678) (not b_lambda!21433) (not b!1208695) (not b!1208759) (not bm!59033) (not b!1208806) (not d!133397) (not b!1208783) (not b!1208703) (not b!1208702))
(check-sat b_and!42961 (not b_next!25963))
(get-model)

(declare-fun d!133451 () Bool)

(declare-fun e!686588 () Bool)

(assert (=> d!133451 e!686588))

(declare-fun res!803355 () Bool)

(assert (=> d!133451 (=> res!803355 e!686588)))

(declare-fun lt!548396 () Bool)

(assert (=> d!133451 (= res!803355 (not lt!548396))))

(declare-fun lt!548398 () Bool)

(assert (=> d!133451 (= lt!548396 lt!548398)))

(declare-fun lt!548399 () Unit!39973)

(declare-fun e!686587 () Unit!39973)

(assert (=> d!133451 (= lt!548399 e!686587)))

(declare-fun c!119075 () Bool)

(assert (=> d!133451 (= c!119075 lt!548398)))

(assert (=> d!133451 (= lt!548398 (containsKey!594 (toList!8885 lt!548333) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133451 (= (contains!6966 lt!548333 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548396)))

(declare-fun b!1208820 () Bool)

(declare-fun lt!548397 () Unit!39973)

(assert (=> b!1208820 (= e!686587 lt!548397)))

(assert (=> b!1208820 (= lt!548397 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548333) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> b!1208820 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548333) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1208821 () Bool)

(declare-fun Unit!39984 () Unit!39973)

(assert (=> b!1208821 (= e!686587 Unit!39984)))

(declare-fun b!1208822 () Bool)

(assert (=> b!1208822 (= e!686588 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548333) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133451 c!119075) b!1208820))

(assert (= (and d!133451 (not c!119075)) b!1208821))

(assert (= (and d!133451 (not res!803355)) b!1208822))

(declare-fun m!1114747 () Bool)

(assert (=> d!133451 m!1114747))

(declare-fun m!1114749 () Bool)

(assert (=> b!1208820 m!1114749))

(assert (=> b!1208820 m!1114569))

(assert (=> b!1208820 m!1114569))

(declare-fun m!1114751 () Bool)

(assert (=> b!1208820 m!1114751))

(assert (=> b!1208822 m!1114569))

(assert (=> b!1208822 m!1114569))

(assert (=> b!1208822 m!1114751))

(assert (=> d!133403 d!133451))

(declare-fun b!1208833 () Bool)

(declare-fun e!686594 () Option!683)

(assert (=> b!1208833 (= e!686594 (getValueByKey!632 (t!39504 lt!548334) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1208834 () Bool)

(assert (=> b!1208834 (= e!686594 None!681)))

(declare-fun b!1208831 () Bool)

(declare-fun e!686593 () Option!683)

(assert (=> b!1208831 (= e!686593 (Some!682 (_2!9892 (h!27783 lt!548334))))))

(declare-fun d!133453 () Bool)

(declare-fun c!119080 () Bool)

(assert (=> d!133453 (= c!119080 (and ((_ is Cons!26565) lt!548334) (= (_1!9892 (h!27783 lt!548334)) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133453 (= (getValueByKey!632 lt!548334 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!686593)))

(declare-fun b!1208832 () Bool)

(assert (=> b!1208832 (= e!686593 e!686594)))

(declare-fun c!119081 () Bool)

(assert (=> b!1208832 (= c!119081 (and ((_ is Cons!26565) lt!548334) (not (= (_1!9892 (h!27783 lt!548334)) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!133453 c!119080) b!1208831))

(assert (= (and d!133453 (not c!119080)) b!1208832))

(assert (= (and b!1208832 c!119081) b!1208833))

(assert (= (and b!1208832 (not c!119081)) b!1208834))

(declare-fun m!1114753 () Bool)

(assert (=> b!1208833 m!1114753))

(assert (=> d!133403 d!133453))

(declare-fun d!133455 () Bool)

(assert (=> d!133455 (= (getValueByKey!632 lt!548334 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!682 (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!548402 () Unit!39973)

(declare-fun choose!1809 (List!26569 (_ BitVec 64) V!46017) Unit!39973)

(assert (=> d!133455 (= lt!548402 (choose!1809 lt!548334 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!686597 () Bool)

(assert (=> d!133455 e!686597))

(declare-fun res!803360 () Bool)

(assert (=> d!133455 (=> (not res!803360) (not e!686597))))

(declare-fun isStrictlySorted!717 (List!26569) Bool)

(assert (=> d!133455 (= res!803360 (isStrictlySorted!717 lt!548334))))

(assert (=> d!133455 (= (lemmaContainsTupThenGetReturnValue!314 lt!548334 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548402)))

(declare-fun b!1208839 () Bool)

(declare-fun res!803361 () Bool)

(assert (=> b!1208839 (=> (not res!803361) (not e!686597))))

(assert (=> b!1208839 (= res!803361 (containsKey!594 lt!548334 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1208840 () Bool)

(assert (=> b!1208840 (= e!686597 (contains!6969 lt!548334 (tuple2!19763 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133455 res!803360) b!1208839))

(assert (= (and b!1208839 res!803361) b!1208840))

(assert (=> d!133455 m!1114563))

(declare-fun m!1114755 () Bool)

(assert (=> d!133455 m!1114755))

(declare-fun m!1114757 () Bool)

(assert (=> d!133455 m!1114757))

(declare-fun m!1114759 () Bool)

(assert (=> b!1208839 m!1114759))

(declare-fun m!1114761 () Bool)

(assert (=> b!1208840 m!1114761))

(assert (=> d!133403 d!133455))

(declare-fun bm!59051 () Bool)

(declare-fun call!59056 () List!26569)

(declare-fun call!59055 () List!26569)

(assert (=> bm!59051 (= call!59056 call!59055)))

(declare-fun b!1208861 () Bool)

(declare-fun e!686612 () List!26569)

(declare-fun e!686608 () List!26569)

(assert (=> b!1208861 (= e!686612 e!686608)))

(declare-fun c!119092 () Bool)

(assert (=> b!1208861 (= c!119092 (and ((_ is Cons!26565) (toList!8885 lt!548186)) (= (_1!9892 (h!27783 (toList!8885 lt!548186))) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1208862 () Bool)

(declare-fun e!686609 () Bool)

(declare-fun lt!548405 () List!26569)

(assert (=> b!1208862 (= e!686609 (contains!6969 lt!548405 (tuple2!19763 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1208863 () Bool)

(declare-fun e!686610 () List!26569)

(assert (=> b!1208863 (= e!686610 call!59056)))

(declare-fun call!59054 () List!26569)

(declare-fun bm!59052 () Bool)

(declare-fun e!686611 () List!26569)

(declare-fun c!119093 () Bool)

(declare-fun $colon$colon!611 (List!26569 tuple2!19762) List!26569)

(assert (=> bm!59052 (= call!59054 ($colon$colon!611 e!686611 (ite c!119093 (h!27783 (toList!8885 lt!548186)) (tuple2!19763 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun c!119091 () Bool)

(assert (=> bm!59052 (= c!119091 c!119093)))

(declare-fun bm!59053 () Bool)

(assert (=> bm!59053 (= call!59055 call!59054)))

(declare-fun d!133457 () Bool)

(assert (=> d!133457 e!686609))

(declare-fun res!803367 () Bool)

(assert (=> d!133457 (=> (not res!803367) (not e!686609))))

(assert (=> d!133457 (= res!803367 (isStrictlySorted!717 lt!548405))))

(assert (=> d!133457 (= lt!548405 e!686612)))

(assert (=> d!133457 (= c!119093 (and ((_ is Cons!26565) (toList!8885 lt!548186)) (bvslt (_1!9892 (h!27783 (toList!8885 lt!548186))) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133457 (isStrictlySorted!717 (toList!8885 lt!548186))))

(assert (=> d!133457 (= (insertStrictlySorted!407 (toList!8885 lt!548186) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548405)))

(declare-fun b!1208864 () Bool)

(assert (=> b!1208864 (= e!686608 call!59055)))

(declare-fun c!119090 () Bool)

(declare-fun b!1208865 () Bool)

(assert (=> b!1208865 (= e!686611 (ite c!119092 (t!39504 (toList!8885 lt!548186)) (ite c!119090 (Cons!26565 (h!27783 (toList!8885 lt!548186)) (t!39504 (toList!8885 lt!548186))) Nil!26566)))))

(declare-fun b!1208866 () Bool)

(declare-fun res!803366 () Bool)

(assert (=> b!1208866 (=> (not res!803366) (not e!686609))))

(assert (=> b!1208866 (= res!803366 (containsKey!594 lt!548405 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1208867 () Bool)

(assert (=> b!1208867 (= e!686611 (insertStrictlySorted!407 (t!39504 (toList!8885 lt!548186)) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1208868 () Bool)

(assert (=> b!1208868 (= e!686610 call!59056)))

(declare-fun b!1208869 () Bool)

(assert (=> b!1208869 (= c!119090 (and ((_ is Cons!26565) (toList!8885 lt!548186)) (bvsgt (_1!9892 (h!27783 (toList!8885 lt!548186))) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> b!1208869 (= e!686608 e!686610)))

(declare-fun b!1208870 () Bool)

(assert (=> b!1208870 (= e!686612 call!59054)))

(assert (= (and d!133457 c!119093) b!1208870))

(assert (= (and d!133457 (not c!119093)) b!1208861))

(assert (= (and b!1208861 c!119092) b!1208864))

(assert (= (and b!1208861 (not c!119092)) b!1208869))

(assert (= (and b!1208869 c!119090) b!1208863))

(assert (= (and b!1208869 (not c!119090)) b!1208868))

(assert (= (or b!1208863 b!1208868) bm!59051))

(assert (= (or b!1208864 bm!59051) bm!59053))

(assert (= (or b!1208870 bm!59053) bm!59052))

(assert (= (and bm!59052 c!119091) b!1208867))

(assert (= (and bm!59052 (not c!119091)) b!1208865))

(assert (= (and d!133457 res!803367) b!1208866))

(assert (= (and b!1208866 res!803366) b!1208862))

(declare-fun m!1114763 () Bool)

(assert (=> d!133457 m!1114763))

(declare-fun m!1114765 () Bool)

(assert (=> d!133457 m!1114765))

(declare-fun m!1114767 () Bool)

(assert (=> bm!59052 m!1114767))

(declare-fun m!1114769 () Bool)

(assert (=> b!1208862 m!1114769))

(declare-fun m!1114771 () Bool)

(assert (=> b!1208867 m!1114771))

(declare-fun m!1114773 () Bool)

(assert (=> b!1208866 m!1114773))

(assert (=> d!133403 d!133457))

(declare-fun d!133459 () Bool)

(assert (=> d!133459 (= (validKeyInArray!0 (select (arr!37708 _keys!1208) from!1455)) (and (not (= (select (arr!37708 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37708 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208782 d!133459))

(declare-fun b!1208871 () Bool)

(declare-fun lt!548411 () Unit!39973)

(declare-fun lt!548409 () Unit!39973)

(assert (=> b!1208871 (= lt!548411 lt!548409)))

(declare-fun lt!548410 () V!46017)

(declare-fun lt!548412 () (_ BitVec 64))

(declare-fun lt!548408 () (_ BitVec 64))

(declare-fun lt!548406 () ListLongMap!17739)

(assert (=> b!1208871 (not (contains!6966 (+!4047 lt!548406 (tuple2!19763 lt!548412 lt!548410)) lt!548408))))

(assert (=> b!1208871 (= lt!548409 (addStillNotContains!295 lt!548406 lt!548412 lt!548410 lt!548408))))

(assert (=> b!1208871 (= lt!548408 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208871 (= lt!548410 (get!19263 (select (arr!37709 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208871 (= lt!548412 (select (arr!37708 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!59057 () ListLongMap!17739)

(assert (=> b!1208871 (= lt!548406 call!59057)))

(declare-fun e!686614 () ListLongMap!17739)

(assert (=> b!1208871 (= e!686614 (+!4047 call!59057 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19263 (select (arr!37709 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133461 () Bool)

(declare-fun e!686613 () Bool)

(assert (=> d!133461 e!686613))

(declare-fun res!803370 () Bool)

(assert (=> d!133461 (=> (not res!803370) (not e!686613))))

(declare-fun lt!548407 () ListLongMap!17739)

(assert (=> d!133461 (= res!803370 (not (contains!6966 lt!548407 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686617 () ListLongMap!17739)

(assert (=> d!133461 (= lt!548407 e!686617)))

(declare-fun c!119094 () Bool)

(assert (=> d!133461 (= c!119094 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(assert (=> d!133461 (validMask!0 mask!1564)))

(assert (=> d!133461 (= (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!548407)))

(declare-fun b!1208872 () Bool)

(declare-fun e!686615 () Bool)

(assert (=> b!1208872 (= e!686615 (isEmpty!991 lt!548407))))

(declare-fun bm!59054 () Bool)

(assert (=> bm!59054 (= call!59057 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208873 () Bool)

(assert (=> b!1208873 (= e!686617 e!686614)))

(declare-fun c!119096 () Bool)

(assert (=> b!1208873 (= c!119096 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1208874 () Bool)

(assert (=> b!1208874 (= e!686614 call!59057)))

(declare-fun b!1208875 () Bool)

(assert (=> b!1208875 (= e!686617 (ListLongMap!17740 Nil!26566))))

(declare-fun b!1208876 () Bool)

(declare-fun e!686616 () Bool)

(assert (=> b!1208876 (= e!686613 e!686616)))

(declare-fun c!119097 () Bool)

(declare-fun e!686618 () Bool)

(assert (=> b!1208876 (= c!119097 e!686618)))

(declare-fun res!803368 () Bool)

(assert (=> b!1208876 (=> (not res!803368) (not e!686618))))

(assert (=> b!1208876 (= res!803368 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun b!1208877 () Bool)

(assert (=> b!1208877 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(assert (=> b!1208877 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38246 _values!996)))))

(declare-fun e!686619 () Bool)

(assert (=> b!1208877 (= e!686619 (= (apply!974 lt!548407 (select (arr!37708 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19263 (select (arr!37709 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208878 () Bool)

(assert (=> b!1208878 (= e!686615 (= lt!548407 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208879 () Bool)

(declare-fun res!803369 () Bool)

(assert (=> b!1208879 (=> (not res!803369) (not e!686613))))

(assert (=> b!1208879 (= res!803369 (not (contains!6966 lt!548407 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208880 () Bool)

(assert (=> b!1208880 (= e!686618 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1208880 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1208881 () Bool)

(assert (=> b!1208881 (= e!686616 e!686615)))

(declare-fun c!119095 () Bool)

(assert (=> b!1208881 (= c!119095 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun b!1208882 () Bool)

(assert (=> b!1208882 (= e!686616 e!686619)))

(assert (=> b!1208882 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun res!803371 () Bool)

(assert (=> b!1208882 (= res!803371 (contains!6966 lt!548407 (select (arr!37708 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1208882 (=> (not res!803371) (not e!686619))))

(assert (= (and d!133461 c!119094) b!1208875))

(assert (= (and d!133461 (not c!119094)) b!1208873))

(assert (= (and b!1208873 c!119096) b!1208871))

(assert (= (and b!1208873 (not c!119096)) b!1208874))

(assert (= (or b!1208871 b!1208874) bm!59054))

(assert (= (and d!133461 res!803370) b!1208879))

(assert (= (and b!1208879 res!803369) b!1208876))

(assert (= (and b!1208876 res!803368) b!1208880))

(assert (= (and b!1208876 c!119097) b!1208882))

(assert (= (and b!1208876 (not c!119097)) b!1208881))

(assert (= (and b!1208882 res!803371) b!1208877))

(assert (= (and b!1208881 c!119095) b!1208878))

(assert (= (and b!1208881 (not c!119095)) b!1208872))

(declare-fun b_lambda!21443 () Bool)

(assert (=> (not b_lambda!21443) (not b!1208871)))

(assert (=> b!1208871 t!39503))

(declare-fun b_and!42963 () Bool)

(assert (= b_and!42961 (and (=> t!39503 result!22105) b_and!42963)))

(declare-fun b_lambda!21445 () Bool)

(assert (=> (not b_lambda!21445) (not b!1208877)))

(assert (=> b!1208877 t!39503))

(declare-fun b_and!42965 () Bool)

(assert (= b_and!42963 (and (=> t!39503 result!22105) b_and!42965)))

(declare-fun m!1114775 () Bool)

(assert (=> bm!59054 m!1114775))

(declare-fun m!1114777 () Bool)

(assert (=> b!1208871 m!1114777))

(declare-fun m!1114779 () Bool)

(assert (=> b!1208871 m!1114779))

(declare-fun m!1114781 () Bool)

(assert (=> b!1208871 m!1114781))

(assert (=> b!1208871 m!1114777))

(declare-fun m!1114783 () Bool)

(assert (=> b!1208871 m!1114783))

(declare-fun m!1114785 () Bool)

(assert (=> b!1208871 m!1114785))

(assert (=> b!1208871 m!1114785))

(assert (=> b!1208871 m!1114379))

(declare-fun m!1114787 () Bool)

(assert (=> b!1208871 m!1114787))

(declare-fun m!1114789 () Bool)

(assert (=> b!1208871 m!1114789))

(assert (=> b!1208871 m!1114379))

(assert (=> b!1208873 m!1114779))

(assert (=> b!1208873 m!1114779))

(declare-fun m!1114791 () Bool)

(assert (=> b!1208873 m!1114791))

(assert (=> b!1208882 m!1114779))

(assert (=> b!1208882 m!1114779))

(declare-fun m!1114793 () Bool)

(assert (=> b!1208882 m!1114793))

(declare-fun m!1114795 () Bool)

(assert (=> b!1208872 m!1114795))

(declare-fun m!1114797 () Bool)

(assert (=> b!1208879 m!1114797))

(assert (=> b!1208880 m!1114779))

(assert (=> b!1208880 m!1114779))

(assert (=> b!1208880 m!1114791))

(assert (=> b!1208877 m!1114779))

(assert (=> b!1208877 m!1114779))

(declare-fun m!1114799 () Bool)

(assert (=> b!1208877 m!1114799))

(assert (=> b!1208877 m!1114785))

(assert (=> b!1208877 m!1114785))

(assert (=> b!1208877 m!1114379))

(assert (=> b!1208877 m!1114787))

(assert (=> b!1208877 m!1114379))

(declare-fun m!1114801 () Bool)

(assert (=> d!133461 m!1114801))

(assert (=> d!133461 m!1114367))

(assert (=> b!1208878 m!1114775))

(assert (=> bm!59034 d!133461))

(declare-fun d!133463 () Bool)

(assert (=> d!133463 (= (validKeyInArray!0 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)) (and (not (= (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208774 d!133463))

(declare-fun d!133465 () Bool)

(assert (=> d!133465 (= (validKeyInArray!0 (select (arr!37708 lt!548177) #b00000000000000000000000000000000)) (and (not (= (select (arr!37708 lt!548177) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37708 lt!548177) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208777 d!133465))

(assert (=> d!133399 d!133401))

(assert (=> d!133399 d!133403))

(declare-fun d!133467 () Bool)

(assert (=> d!133467 (contains!6966 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(assert (=> d!133467 true))

(declare-fun _$35!459 () Unit!39973)

(assert (=> d!133467 (= (choose!1806 lt!548186 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) _$35!459)))

(declare-fun bs!34152 () Bool)

(assert (= bs!34152 d!133467))

(assert (=> bs!34152 m!1114373))

(assert (=> bs!34152 m!1114373))

(assert (=> bs!34152 m!1114375))

(assert (=> d!133399 d!133467))

(declare-fun d!133469 () Bool)

(declare-fun e!686621 () Bool)

(assert (=> d!133469 e!686621))

(declare-fun res!803372 () Bool)

(assert (=> d!133469 (=> res!803372 e!686621)))

(declare-fun lt!548413 () Bool)

(assert (=> d!133469 (= res!803372 (not lt!548413))))

(declare-fun lt!548415 () Bool)

(assert (=> d!133469 (= lt!548413 lt!548415)))

(declare-fun lt!548416 () Unit!39973)

(declare-fun e!686620 () Unit!39973)

(assert (=> d!133469 (= lt!548416 e!686620)))

(declare-fun c!119098 () Bool)

(assert (=> d!133469 (= c!119098 lt!548415)))

(assert (=> d!133469 (= lt!548415 (containsKey!594 (toList!8885 lt!548186) k0!934))))

(assert (=> d!133469 (= (contains!6966 lt!548186 k0!934) lt!548413)))

(declare-fun b!1208884 () Bool)

(declare-fun lt!548414 () Unit!39973)

(assert (=> b!1208884 (= e!686620 lt!548414)))

(assert (=> b!1208884 (= lt!548414 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548186) k0!934))))

(assert (=> b!1208884 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548186) k0!934))))

(declare-fun b!1208885 () Bool)

(declare-fun Unit!39985 () Unit!39973)

(assert (=> b!1208885 (= e!686620 Unit!39985)))

(declare-fun b!1208886 () Bool)

(assert (=> b!1208886 (= e!686621 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548186) k0!934)))))

(assert (= (and d!133469 c!119098) b!1208884))

(assert (= (and d!133469 (not c!119098)) b!1208885))

(assert (= (and d!133469 (not res!803372)) b!1208886))

(declare-fun m!1114803 () Bool)

(assert (=> d!133469 m!1114803))

(declare-fun m!1114805 () Bool)

(assert (=> b!1208884 m!1114805))

(declare-fun m!1114807 () Bool)

(assert (=> b!1208884 m!1114807))

(assert (=> b!1208884 m!1114807))

(declare-fun m!1114809 () Bool)

(assert (=> b!1208884 m!1114809))

(assert (=> b!1208886 m!1114807))

(assert (=> b!1208886 m!1114807))

(assert (=> b!1208886 m!1114809))

(assert (=> d!133399 d!133469))

(declare-fun d!133471 () Bool)

(assert (=> d!133471 (isDefined!460 (getValueByKey!632 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934))))

(declare-fun lt!548419 () Unit!39973)

(declare-fun choose!1810 (List!26569 (_ BitVec 64)) Unit!39973)

(assert (=> d!133471 (= lt!548419 (choose!1810 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934))))

(declare-fun e!686624 () Bool)

(assert (=> d!133471 e!686624))

(declare-fun res!803375 () Bool)

(assert (=> d!133471 (=> (not res!803375) (not e!686624))))

(assert (=> d!133471 (= res!803375 (isStrictlySorted!717 (toList!8885 (ite c!119000 lt!548186 call!58974))))))

(assert (=> d!133471 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934) lt!548419)))

(declare-fun b!1208889 () Bool)

(assert (=> b!1208889 (= e!686624 (containsKey!594 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934))))

(assert (= (and d!133471 res!803375) b!1208889))

(assert (=> d!133471 m!1114737))

(assert (=> d!133471 m!1114737))

(assert (=> d!133471 m!1114739))

(declare-fun m!1114811 () Bool)

(assert (=> d!133471 m!1114811))

(declare-fun m!1114813 () Bool)

(assert (=> d!133471 m!1114813))

(assert (=> b!1208889 m!1114733))

(assert (=> b!1208809 d!133471))

(declare-fun d!133473 () Bool)

(declare-fun isEmpty!992 (Option!683) Bool)

(assert (=> d!133473 (= (isDefined!460 (getValueByKey!632 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934)) (not (isEmpty!992 (getValueByKey!632 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934))))))

(declare-fun bs!34153 () Bool)

(assert (= bs!34153 d!133473))

(assert (=> bs!34153 m!1114737))

(declare-fun m!1114815 () Bool)

(assert (=> bs!34153 m!1114815))

(assert (=> b!1208809 d!133473))

(declare-fun b!1208892 () Bool)

(declare-fun e!686626 () Option!683)

(assert (=> b!1208892 (= e!686626 (getValueByKey!632 (t!39504 (toList!8885 (ite c!119000 lt!548186 call!58974))) k0!934))))

(declare-fun b!1208893 () Bool)

(assert (=> b!1208893 (= e!686626 None!681)))

(declare-fun b!1208890 () Bool)

(declare-fun e!686625 () Option!683)

(assert (=> b!1208890 (= e!686625 (Some!682 (_2!9892 (h!27783 (toList!8885 (ite c!119000 lt!548186 call!58974))))))))

(declare-fun d!133475 () Bool)

(declare-fun c!119099 () Bool)

(assert (=> d!133475 (= c!119099 (and ((_ is Cons!26565) (toList!8885 (ite c!119000 lt!548186 call!58974))) (= (_1!9892 (h!27783 (toList!8885 (ite c!119000 lt!548186 call!58974)))) k0!934)))))

(assert (=> d!133475 (= (getValueByKey!632 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934) e!686625)))

(declare-fun b!1208891 () Bool)

(assert (=> b!1208891 (= e!686625 e!686626)))

(declare-fun c!119100 () Bool)

(assert (=> b!1208891 (= c!119100 (and ((_ is Cons!26565) (toList!8885 (ite c!119000 lt!548186 call!58974))) (not (= (_1!9892 (h!27783 (toList!8885 (ite c!119000 lt!548186 call!58974)))) k0!934))))))

(assert (= (and d!133475 c!119099) b!1208890))

(assert (= (and d!133475 (not c!119099)) b!1208891))

(assert (= (and b!1208891 c!119100) b!1208892))

(assert (= (and b!1208891 (not c!119100)) b!1208893))

(declare-fun m!1114817 () Bool)

(assert (=> b!1208892 m!1114817))

(assert (=> b!1208809 d!133475))

(declare-fun d!133477 () Bool)

(declare-fun e!686628 () Bool)

(assert (=> d!133477 e!686628))

(declare-fun res!803376 () Bool)

(assert (=> d!133477 (=> res!803376 e!686628)))

(declare-fun lt!548420 () Bool)

(assert (=> d!133477 (= res!803376 (not lt!548420))))

(declare-fun lt!548422 () Bool)

(assert (=> d!133477 (= lt!548420 lt!548422)))

(declare-fun lt!548423 () Unit!39973)

(declare-fun e!686627 () Unit!39973)

(assert (=> d!133477 (= lt!548423 e!686627)))

(declare-fun c!119101 () Bool)

(assert (=> d!133477 (= c!119101 lt!548422)))

(assert (=> d!133477 (= lt!548422 (containsKey!594 (toList!8885 lt!548346) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133477 (= (contains!6966 lt!548346 #b1000000000000000000000000000000000000000000000000000000000000000) lt!548420)))

(declare-fun b!1208894 () Bool)

(declare-fun lt!548421 () Unit!39973)

(assert (=> b!1208894 (= e!686627 lt!548421)))

(assert (=> b!1208894 (= lt!548421 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548346) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1208894 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548346) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1208895 () Bool)

(declare-fun Unit!39986 () Unit!39973)

(assert (=> b!1208895 (= e!686627 Unit!39986)))

(declare-fun b!1208896 () Bool)

(assert (=> b!1208896 (= e!686628 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133477 c!119101) b!1208894))

(assert (= (and d!133477 (not c!119101)) b!1208895))

(assert (= (and d!133477 (not res!803376)) b!1208896))

(declare-fun m!1114819 () Bool)

(assert (=> d!133477 m!1114819))

(declare-fun m!1114821 () Bool)

(assert (=> b!1208894 m!1114821))

(declare-fun m!1114823 () Bool)

(assert (=> b!1208894 m!1114823))

(assert (=> b!1208894 m!1114823))

(declare-fun m!1114825 () Bool)

(assert (=> b!1208894 m!1114825))

(assert (=> b!1208896 m!1114823))

(assert (=> b!1208896 m!1114823))

(assert (=> b!1208896 m!1114825))

(assert (=> b!1208729 d!133477))

(declare-fun b!1208897 () Bool)

(declare-fun e!686631 () Bool)

(declare-fun call!59058 () Bool)

(assert (=> b!1208897 (= e!686631 call!59058)))

(declare-fun d!133479 () Bool)

(declare-fun res!803378 () Bool)

(declare-fun e!686629 () Bool)

(assert (=> d!133479 (=> res!803378 e!686629)))

(assert (=> d!133479 (= res!803378 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(assert (=> d!133479 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!548177 mask!1564) e!686629)))

(declare-fun b!1208898 () Bool)

(declare-fun e!686630 () Bool)

(assert (=> b!1208898 (= e!686629 e!686630)))

(declare-fun c!119102 () Bool)

(assert (=> b!1208898 (= c!119102 (validKeyInArray!0 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1208899 () Bool)

(assert (=> b!1208899 (= e!686630 call!59058)))

(declare-fun bm!59055 () Bool)

(assert (=> bm!59055 (= call!59058 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!548177 mask!1564))))

(declare-fun b!1208900 () Bool)

(assert (=> b!1208900 (= e!686630 e!686631)))

(declare-fun lt!548425 () (_ BitVec 64))

(assert (=> b!1208900 (= lt!548425 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!548426 () Unit!39973)

(assert (=> b!1208900 (= lt!548426 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!548177 lt!548425 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1208900 (arrayContainsKey!0 lt!548177 lt!548425 #b00000000000000000000000000000000)))

(declare-fun lt!548424 () Unit!39973)

(assert (=> b!1208900 (= lt!548424 lt!548426)))

(declare-fun res!803377 () Bool)

(assert (=> b!1208900 (= res!803377 (= (seekEntryOrOpen!0 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!548177 mask!1564) (Found!9894 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1208900 (=> (not res!803377) (not e!686631))))

(assert (= (and d!133479 (not res!803378)) b!1208898))

(assert (= (and b!1208898 c!119102) b!1208900))

(assert (= (and b!1208898 (not c!119102)) b!1208899))

(assert (= (and b!1208900 res!803377) b!1208897))

(assert (= (or b!1208897 b!1208899) bm!59055))

(declare-fun m!1114827 () Bool)

(assert (=> b!1208898 m!1114827))

(assert (=> b!1208898 m!1114827))

(declare-fun m!1114829 () Bool)

(assert (=> b!1208898 m!1114829))

(declare-fun m!1114831 () Bool)

(assert (=> bm!59055 m!1114831))

(assert (=> b!1208900 m!1114827))

(declare-fun m!1114833 () Bool)

(assert (=> b!1208900 m!1114833))

(declare-fun m!1114835 () Bool)

(assert (=> b!1208900 m!1114835))

(assert (=> b!1208900 m!1114827))

(declare-fun m!1114837 () Bool)

(assert (=> b!1208900 m!1114837))

(assert (=> bm!59037 d!133479))

(declare-fun d!133481 () Bool)

(assert (=> d!133481 (not (contains!6966 (+!4047 lt!548352 (tuple2!19763 lt!548358 lt!548356)) lt!548354))))

(declare-fun lt!548429 () Unit!39973)

(declare-fun choose!1811 (ListLongMap!17739 (_ BitVec 64) V!46017 (_ BitVec 64)) Unit!39973)

(assert (=> d!133481 (= lt!548429 (choose!1811 lt!548352 lt!548358 lt!548356 lt!548354))))

(declare-fun e!686634 () Bool)

(assert (=> d!133481 e!686634))

(declare-fun res!803381 () Bool)

(assert (=> d!133481 (=> (not res!803381) (not e!686634))))

(assert (=> d!133481 (= res!803381 (not (contains!6966 lt!548352 lt!548354)))))

(assert (=> d!133481 (= (addStillNotContains!295 lt!548352 lt!548358 lt!548356 lt!548354) lt!548429)))

(declare-fun b!1208904 () Bool)

(assert (=> b!1208904 (= e!686634 (not (= lt!548358 lt!548354)))))

(assert (= (and d!133481 res!803381) b!1208904))

(assert (=> d!133481 m!1114627))

(assert (=> d!133481 m!1114627))

(assert (=> d!133481 m!1114631))

(declare-fun m!1114839 () Bool)

(assert (=> d!133481 m!1114839))

(declare-fun m!1114841 () Bool)

(assert (=> d!133481 m!1114841))

(assert (=> b!1208733 d!133481))

(declare-fun d!133483 () Bool)

(declare-fun c!119105 () Bool)

(assert (=> d!133483 (= c!119105 ((_ is ValueCellFull!14624) (select (arr!37709 _values!996) from!1455)))))

(declare-fun e!686637 () V!46017)

(assert (=> d!133483 (= (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!686637)))

(declare-fun b!1208909 () Bool)

(declare-fun get!19264 (ValueCell!14624 V!46017) V!46017)

(assert (=> b!1208909 (= e!686637 (get!19264 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208910 () Bool)

(declare-fun get!19265 (ValueCell!14624 V!46017) V!46017)

(assert (=> b!1208910 (= e!686637 (get!19265 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133483 c!119105) b!1208909))

(assert (= (and d!133483 (not c!119105)) b!1208910))

(assert (=> b!1208909 m!1114633))

(assert (=> b!1208909 m!1114379))

(declare-fun m!1114843 () Bool)

(assert (=> b!1208909 m!1114843))

(assert (=> b!1208910 m!1114633))

(assert (=> b!1208910 m!1114379))

(declare-fun m!1114845 () Bool)

(assert (=> b!1208910 m!1114845))

(assert (=> b!1208733 d!133483))

(declare-fun d!133485 () Bool)

(declare-fun e!686638 () Bool)

(assert (=> d!133485 e!686638))

(declare-fun res!803383 () Bool)

(assert (=> d!133485 (=> (not res!803383) (not e!686638))))

(declare-fun lt!548432 () ListLongMap!17739)

(assert (=> d!133485 (= res!803383 (contains!6966 lt!548432 (_1!9892 (tuple2!19763 lt!548358 lt!548356))))))

(declare-fun lt!548433 () List!26569)

(assert (=> d!133485 (= lt!548432 (ListLongMap!17740 lt!548433))))

(declare-fun lt!548430 () Unit!39973)

(declare-fun lt!548431 () Unit!39973)

(assert (=> d!133485 (= lt!548430 lt!548431)))

(assert (=> d!133485 (= (getValueByKey!632 lt!548433 (_1!9892 (tuple2!19763 lt!548358 lt!548356))) (Some!682 (_2!9892 (tuple2!19763 lt!548358 lt!548356))))))

(assert (=> d!133485 (= lt!548431 (lemmaContainsTupThenGetReturnValue!314 lt!548433 (_1!9892 (tuple2!19763 lt!548358 lt!548356)) (_2!9892 (tuple2!19763 lt!548358 lt!548356))))))

(assert (=> d!133485 (= lt!548433 (insertStrictlySorted!407 (toList!8885 lt!548352) (_1!9892 (tuple2!19763 lt!548358 lt!548356)) (_2!9892 (tuple2!19763 lt!548358 lt!548356))))))

(assert (=> d!133485 (= (+!4047 lt!548352 (tuple2!19763 lt!548358 lt!548356)) lt!548432)))

(declare-fun b!1208911 () Bool)

(declare-fun res!803382 () Bool)

(assert (=> b!1208911 (=> (not res!803382) (not e!686638))))

(assert (=> b!1208911 (= res!803382 (= (getValueByKey!632 (toList!8885 lt!548432) (_1!9892 (tuple2!19763 lt!548358 lt!548356))) (Some!682 (_2!9892 (tuple2!19763 lt!548358 lt!548356)))))))

(declare-fun b!1208912 () Bool)

(assert (=> b!1208912 (= e!686638 (contains!6969 (toList!8885 lt!548432) (tuple2!19763 lt!548358 lt!548356)))))

(assert (= (and d!133485 res!803383) b!1208911))

(assert (= (and b!1208911 res!803382) b!1208912))

(declare-fun m!1114847 () Bool)

(assert (=> d!133485 m!1114847))

(declare-fun m!1114849 () Bool)

(assert (=> d!133485 m!1114849))

(declare-fun m!1114851 () Bool)

(assert (=> d!133485 m!1114851))

(declare-fun m!1114853 () Bool)

(assert (=> d!133485 m!1114853))

(declare-fun m!1114855 () Bool)

(assert (=> b!1208911 m!1114855))

(declare-fun m!1114857 () Bool)

(assert (=> b!1208912 m!1114857))

(assert (=> b!1208733 d!133485))

(declare-fun d!133487 () Bool)

(declare-fun e!686640 () Bool)

(assert (=> d!133487 e!686640))

(declare-fun res!803384 () Bool)

(assert (=> d!133487 (=> res!803384 e!686640)))

(declare-fun lt!548434 () Bool)

(assert (=> d!133487 (= res!803384 (not lt!548434))))

(declare-fun lt!548436 () Bool)

(assert (=> d!133487 (= lt!548434 lt!548436)))

(declare-fun lt!548437 () Unit!39973)

(declare-fun e!686639 () Unit!39973)

(assert (=> d!133487 (= lt!548437 e!686639)))

(declare-fun c!119106 () Bool)

(assert (=> d!133487 (= c!119106 lt!548436)))

(assert (=> d!133487 (= lt!548436 (containsKey!594 (toList!8885 (+!4047 lt!548352 (tuple2!19763 lt!548358 lt!548356))) lt!548354))))

(assert (=> d!133487 (= (contains!6966 (+!4047 lt!548352 (tuple2!19763 lt!548358 lt!548356)) lt!548354) lt!548434)))

(declare-fun b!1208913 () Bool)

(declare-fun lt!548435 () Unit!39973)

(assert (=> b!1208913 (= e!686639 lt!548435)))

(assert (=> b!1208913 (= lt!548435 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 (+!4047 lt!548352 (tuple2!19763 lt!548358 lt!548356))) lt!548354))))

(assert (=> b!1208913 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548352 (tuple2!19763 lt!548358 lt!548356))) lt!548354))))

(declare-fun b!1208914 () Bool)

(declare-fun Unit!39987 () Unit!39973)

(assert (=> b!1208914 (= e!686639 Unit!39987)))

(declare-fun b!1208915 () Bool)

(assert (=> b!1208915 (= e!686640 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548352 (tuple2!19763 lt!548358 lt!548356))) lt!548354)))))

(assert (= (and d!133487 c!119106) b!1208913))

(assert (= (and d!133487 (not c!119106)) b!1208914))

(assert (= (and d!133487 (not res!803384)) b!1208915))

(declare-fun m!1114859 () Bool)

(assert (=> d!133487 m!1114859))

(declare-fun m!1114861 () Bool)

(assert (=> b!1208913 m!1114861))

(declare-fun m!1114863 () Bool)

(assert (=> b!1208913 m!1114863))

(assert (=> b!1208913 m!1114863))

(declare-fun m!1114865 () Bool)

(assert (=> b!1208913 m!1114865))

(assert (=> b!1208915 m!1114863))

(assert (=> b!1208915 m!1114863))

(assert (=> b!1208915 m!1114865))

(assert (=> b!1208733 d!133487))

(declare-fun d!133489 () Bool)

(declare-fun e!686641 () Bool)

(assert (=> d!133489 e!686641))

(declare-fun res!803386 () Bool)

(assert (=> d!133489 (=> (not res!803386) (not e!686641))))

(declare-fun lt!548440 () ListLongMap!17739)

(assert (=> d!133489 (= res!803386 (contains!6966 lt!548440 (_1!9892 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!548441 () List!26569)

(assert (=> d!133489 (= lt!548440 (ListLongMap!17740 lt!548441))))

(declare-fun lt!548438 () Unit!39973)

(declare-fun lt!548439 () Unit!39973)

(assert (=> d!133489 (= lt!548438 lt!548439)))

(assert (=> d!133489 (= (getValueByKey!632 lt!548441 (_1!9892 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!682 (_2!9892 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133489 (= lt!548439 (lemmaContainsTupThenGetReturnValue!314 lt!548441 (_1!9892 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9892 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133489 (= lt!548441 (insertStrictlySorted!407 (toList!8885 call!59037) (_1!9892 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9892 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133489 (= (+!4047 call!59037 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!548440)))

(declare-fun b!1208916 () Bool)

(declare-fun res!803385 () Bool)

(assert (=> b!1208916 (=> (not res!803385) (not e!686641))))

(assert (=> b!1208916 (= res!803385 (= (getValueByKey!632 (toList!8885 lt!548440) (_1!9892 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!682 (_2!9892 (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1208917 () Bool)

(assert (=> b!1208917 (= e!686641 (contains!6969 (toList!8885 lt!548440) (tuple2!19763 (select (arr!37708 _keys!1208) from!1455) (get!19263 (select (arr!37709 _values!996) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133489 res!803386) b!1208916))

(assert (= (and b!1208916 res!803385) b!1208917))

(declare-fun m!1114867 () Bool)

(assert (=> d!133489 m!1114867))

(declare-fun m!1114869 () Bool)

(assert (=> d!133489 m!1114869))

(declare-fun m!1114871 () Bool)

(assert (=> d!133489 m!1114871))

(declare-fun m!1114873 () Bool)

(assert (=> d!133489 m!1114873))

(declare-fun m!1114875 () Bool)

(assert (=> b!1208916 m!1114875))

(declare-fun m!1114877 () Bool)

(assert (=> b!1208917 m!1114877))

(assert (=> b!1208733 d!133489))

(assert (=> b!1208772 d!133463))

(declare-fun d!133491 () Bool)

(declare-fun c!119107 () Bool)

(assert (=> d!133491 (= c!119107 ((_ is ValueCellFull!14624) (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!686642 () V!46017)

(assert (=> d!133491 (= (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!686642)))

(declare-fun b!1208918 () Bool)

(assert (=> b!1208918 (= e!686642 (get!19264 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208919 () Bool)

(assert (=> b!1208919 (= e!686642 (get!19265 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133491 c!119107) b!1208918))

(assert (= (and d!133491 (not c!119107)) b!1208919))

(assert (=> b!1208918 m!1114531))

(assert (=> b!1208918 m!1114379))

(declare-fun m!1114879 () Bool)

(assert (=> b!1208918 m!1114879))

(assert (=> b!1208919 m!1114531))

(assert (=> b!1208919 m!1114379))

(declare-fun m!1114881 () Bool)

(assert (=> b!1208919 m!1114881))

(assert (=> b!1208676 d!133491))

(declare-fun d!133493 () Bool)

(declare-fun e!686644 () Bool)

(assert (=> d!133493 e!686644))

(declare-fun res!803387 () Bool)

(assert (=> d!133493 (=> res!803387 e!686644)))

(declare-fun lt!548442 () Bool)

(assert (=> d!133493 (= res!803387 (not lt!548442))))

(declare-fun lt!548444 () Bool)

(assert (=> d!133493 (= lt!548442 lt!548444)))

(declare-fun lt!548445 () Unit!39973)

(declare-fun e!686643 () Unit!39973)

(assert (=> d!133493 (= lt!548445 e!686643)))

(declare-fun c!119108 () Bool)

(assert (=> d!133493 (= c!119108 lt!548444)))

(assert (=> d!133493 (= lt!548444 (containsKey!594 (toList!8885 (+!4047 lt!548301 (tuple2!19763 lt!548307 lt!548305))) lt!548303))))

(assert (=> d!133493 (= (contains!6966 (+!4047 lt!548301 (tuple2!19763 lt!548307 lt!548305)) lt!548303) lt!548442)))

(declare-fun b!1208920 () Bool)

(declare-fun lt!548443 () Unit!39973)

(assert (=> b!1208920 (= e!686643 lt!548443)))

(assert (=> b!1208920 (= lt!548443 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 (+!4047 lt!548301 (tuple2!19763 lt!548307 lt!548305))) lt!548303))))

(assert (=> b!1208920 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548301 (tuple2!19763 lt!548307 lt!548305))) lt!548303))))

(declare-fun b!1208921 () Bool)

(declare-fun Unit!39988 () Unit!39973)

(assert (=> b!1208921 (= e!686643 Unit!39988)))

(declare-fun b!1208922 () Bool)

(assert (=> b!1208922 (= e!686644 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548301 (tuple2!19763 lt!548307 lt!548305))) lt!548303)))))

(assert (= (and d!133493 c!119108) b!1208920))

(assert (= (and d!133493 (not c!119108)) b!1208921))

(assert (= (and d!133493 (not res!803387)) b!1208922))

(declare-fun m!1114883 () Bool)

(assert (=> d!133493 m!1114883))

(declare-fun m!1114885 () Bool)

(assert (=> b!1208920 m!1114885))

(declare-fun m!1114887 () Bool)

(assert (=> b!1208920 m!1114887))

(assert (=> b!1208920 m!1114887))

(declare-fun m!1114889 () Bool)

(assert (=> b!1208920 m!1114889))

(assert (=> b!1208922 m!1114887))

(assert (=> b!1208922 m!1114887))

(assert (=> b!1208922 m!1114889))

(assert (=> b!1208676 d!133493))

(declare-fun d!133495 () Bool)

(assert (=> d!133495 (not (contains!6966 (+!4047 lt!548301 (tuple2!19763 lt!548307 lt!548305)) lt!548303))))

(declare-fun lt!548446 () Unit!39973)

(assert (=> d!133495 (= lt!548446 (choose!1811 lt!548301 lt!548307 lt!548305 lt!548303))))

(declare-fun e!686645 () Bool)

(assert (=> d!133495 e!686645))

(declare-fun res!803388 () Bool)

(assert (=> d!133495 (=> (not res!803388) (not e!686645))))

(assert (=> d!133495 (= res!803388 (not (contains!6966 lt!548301 lt!548303)))))

(assert (=> d!133495 (= (addStillNotContains!295 lt!548301 lt!548307 lt!548305 lt!548303) lt!548446)))

(declare-fun b!1208923 () Bool)

(assert (=> b!1208923 (= e!686645 (not (= lt!548307 lt!548303)))))

(assert (= (and d!133495 res!803388) b!1208923))

(assert (=> d!133495 m!1114523))

(assert (=> d!133495 m!1114523))

(assert (=> d!133495 m!1114529))

(declare-fun m!1114891 () Bool)

(assert (=> d!133495 m!1114891))

(declare-fun m!1114893 () Bool)

(assert (=> d!133495 m!1114893))

(assert (=> b!1208676 d!133495))

(declare-fun d!133497 () Bool)

(declare-fun e!686646 () Bool)

(assert (=> d!133497 e!686646))

(declare-fun res!803390 () Bool)

(assert (=> d!133497 (=> (not res!803390) (not e!686646))))

(declare-fun lt!548449 () ListLongMap!17739)

(assert (=> d!133497 (= res!803390 (contains!6966 lt!548449 (_1!9892 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!548450 () List!26569)

(assert (=> d!133497 (= lt!548449 (ListLongMap!17740 lt!548450))))

(declare-fun lt!548447 () Unit!39973)

(declare-fun lt!548448 () Unit!39973)

(assert (=> d!133497 (= lt!548447 lt!548448)))

(assert (=> d!133497 (= (getValueByKey!632 lt!548450 (_1!9892 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!682 (_2!9892 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133497 (= lt!548448 (lemmaContainsTupThenGetReturnValue!314 lt!548450 (_1!9892 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9892 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133497 (= lt!548450 (insertStrictlySorted!407 (toList!8885 call!59029) (_1!9892 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9892 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133497 (= (+!4047 call!59029 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!548449)))

(declare-fun b!1208924 () Bool)

(declare-fun res!803389 () Bool)

(assert (=> b!1208924 (=> (not res!803389) (not e!686646))))

(assert (=> b!1208924 (= res!803389 (= (getValueByKey!632 (toList!8885 lt!548449) (_1!9892 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!682 (_2!9892 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1208925 () Bool)

(assert (=> b!1208925 (= e!686646 (contains!6969 (toList!8885 lt!548449) (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133497 res!803390) b!1208924))

(assert (= (and b!1208924 res!803389) b!1208925))

(declare-fun m!1114895 () Bool)

(assert (=> d!133497 m!1114895))

(declare-fun m!1114897 () Bool)

(assert (=> d!133497 m!1114897))

(declare-fun m!1114899 () Bool)

(assert (=> d!133497 m!1114899))

(declare-fun m!1114901 () Bool)

(assert (=> d!133497 m!1114901))

(declare-fun m!1114903 () Bool)

(assert (=> b!1208924 m!1114903))

(declare-fun m!1114905 () Bool)

(assert (=> b!1208925 m!1114905))

(assert (=> b!1208676 d!133497))

(declare-fun d!133499 () Bool)

(declare-fun e!686647 () Bool)

(assert (=> d!133499 e!686647))

(declare-fun res!803392 () Bool)

(assert (=> d!133499 (=> (not res!803392) (not e!686647))))

(declare-fun lt!548453 () ListLongMap!17739)

(assert (=> d!133499 (= res!803392 (contains!6966 lt!548453 (_1!9892 (tuple2!19763 lt!548307 lt!548305))))))

(declare-fun lt!548454 () List!26569)

(assert (=> d!133499 (= lt!548453 (ListLongMap!17740 lt!548454))))

(declare-fun lt!548451 () Unit!39973)

(declare-fun lt!548452 () Unit!39973)

(assert (=> d!133499 (= lt!548451 lt!548452)))

(assert (=> d!133499 (= (getValueByKey!632 lt!548454 (_1!9892 (tuple2!19763 lt!548307 lt!548305))) (Some!682 (_2!9892 (tuple2!19763 lt!548307 lt!548305))))))

(assert (=> d!133499 (= lt!548452 (lemmaContainsTupThenGetReturnValue!314 lt!548454 (_1!9892 (tuple2!19763 lt!548307 lt!548305)) (_2!9892 (tuple2!19763 lt!548307 lt!548305))))))

(assert (=> d!133499 (= lt!548454 (insertStrictlySorted!407 (toList!8885 lt!548301) (_1!9892 (tuple2!19763 lt!548307 lt!548305)) (_2!9892 (tuple2!19763 lt!548307 lt!548305))))))

(assert (=> d!133499 (= (+!4047 lt!548301 (tuple2!19763 lt!548307 lt!548305)) lt!548453)))

(declare-fun b!1208926 () Bool)

(declare-fun res!803391 () Bool)

(assert (=> b!1208926 (=> (not res!803391) (not e!686647))))

(assert (=> b!1208926 (= res!803391 (= (getValueByKey!632 (toList!8885 lt!548453) (_1!9892 (tuple2!19763 lt!548307 lt!548305))) (Some!682 (_2!9892 (tuple2!19763 lt!548307 lt!548305)))))))

(declare-fun b!1208927 () Bool)

(assert (=> b!1208927 (= e!686647 (contains!6969 (toList!8885 lt!548453) (tuple2!19763 lt!548307 lt!548305)))))

(assert (= (and d!133499 res!803392) b!1208926))

(assert (= (and b!1208926 res!803391) b!1208927))

(declare-fun m!1114907 () Bool)

(assert (=> d!133499 m!1114907))

(declare-fun m!1114909 () Bool)

(assert (=> d!133499 m!1114909))

(declare-fun m!1114911 () Bool)

(assert (=> d!133499 m!1114911))

(declare-fun m!1114913 () Bool)

(assert (=> d!133499 m!1114913))

(declare-fun m!1114915 () Bool)

(assert (=> b!1208926 m!1114915))

(declare-fun m!1114917 () Bool)

(assert (=> b!1208927 m!1114917))

(assert (=> b!1208676 d!133499))

(declare-fun d!133501 () Bool)

(declare-fun e!686649 () Bool)

(assert (=> d!133501 e!686649))

(declare-fun res!803393 () Bool)

(assert (=> d!133501 (=> res!803393 e!686649)))

(declare-fun lt!548455 () Bool)

(assert (=> d!133501 (= res!803393 (not lt!548455))))

(declare-fun lt!548457 () Bool)

(assert (=> d!133501 (= lt!548455 lt!548457)))

(declare-fun lt!548458 () Unit!39973)

(declare-fun e!686648 () Unit!39973)

(assert (=> d!133501 (= lt!548458 e!686648)))

(declare-fun c!119109 () Bool)

(assert (=> d!133501 (= c!119109 lt!548457)))

(assert (=> d!133501 (= lt!548457 (containsKey!594 (toList!8885 lt!548383) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133501 (= (contains!6966 lt!548383 #b1000000000000000000000000000000000000000000000000000000000000000) lt!548455)))

(declare-fun b!1208928 () Bool)

(declare-fun lt!548456 () Unit!39973)

(assert (=> b!1208928 (= e!686648 lt!548456)))

(assert (=> b!1208928 (= lt!548456 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548383) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1208928 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548383) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1208929 () Bool)

(declare-fun Unit!39989 () Unit!39973)

(assert (=> b!1208929 (= e!686648 Unit!39989)))

(declare-fun b!1208930 () Bool)

(assert (=> b!1208930 (= e!686649 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133501 c!119109) b!1208928))

(assert (= (and d!133501 (not c!119109)) b!1208929))

(assert (= (and d!133501 (not res!803393)) b!1208930))

(declare-fun m!1114919 () Bool)

(assert (=> d!133501 m!1114919))

(declare-fun m!1114921 () Bool)

(assert (=> b!1208928 m!1114921))

(declare-fun m!1114923 () Bool)

(assert (=> b!1208928 m!1114923))

(assert (=> b!1208928 m!1114923))

(declare-fun m!1114925 () Bool)

(assert (=> b!1208928 m!1114925))

(assert (=> b!1208930 m!1114923))

(assert (=> b!1208930 m!1114923))

(assert (=> b!1208930 m!1114925))

(assert (=> b!1208805 d!133501))

(declare-fun d!133503 () Bool)

(declare-fun get!19266 (Option!683) V!46017)

(assert (=> d!133503 (= (apply!974 lt!548346 (select (arr!37708 lt!548177) from!1455)) (get!19266 (getValueByKey!632 (toList!8885 lt!548346) (select (arr!37708 lt!548177) from!1455))))))

(declare-fun bs!34154 () Bool)

(assert (= bs!34154 d!133503))

(assert (=> bs!34154 m!1114601))

(declare-fun m!1114927 () Bool)

(assert (=> bs!34154 m!1114927))

(assert (=> bs!34154 m!1114927))

(declare-fun m!1114929 () Bool)

(assert (=> bs!34154 m!1114929))

(assert (=> b!1208727 d!133503))

(declare-fun d!133505 () Bool)

(declare-fun c!119110 () Bool)

(assert (=> d!133505 (= c!119110 ((_ is ValueCellFull!14624) (select (arr!37709 lt!548180) from!1455)))))

(declare-fun e!686650 () V!46017)

(assert (=> d!133505 (= (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!686650)))

(declare-fun b!1208931 () Bool)

(assert (=> b!1208931 (= e!686650 (get!19264 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208932 () Bool)

(assert (=> b!1208932 (= e!686650 (get!19265 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133505 c!119110) b!1208931))

(assert (= (and d!133505 (not c!119110)) b!1208932))

(assert (=> b!1208931 m!1114607))

(assert (=> b!1208931 m!1114379))

(declare-fun m!1114931 () Bool)

(assert (=> b!1208931 m!1114931))

(assert (=> b!1208932 m!1114607))

(assert (=> b!1208932 m!1114379))

(declare-fun m!1114933 () Bool)

(assert (=> b!1208932 m!1114933))

(assert (=> b!1208727 d!133505))

(assert (=> b!1208756 d!133465))

(declare-fun b!1208933 () Bool)

(declare-fun lt!548464 () Unit!39973)

(declare-fun lt!548462 () Unit!39973)

(assert (=> b!1208933 (= lt!548464 lt!548462)))

(declare-fun lt!548461 () (_ BitVec 64))

(declare-fun lt!548463 () V!46017)

(declare-fun lt!548465 () (_ BitVec 64))

(declare-fun lt!548459 () ListLongMap!17739)

(assert (=> b!1208933 (not (contains!6966 (+!4047 lt!548459 (tuple2!19763 lt!548465 lt!548463)) lt!548461))))

(assert (=> b!1208933 (= lt!548462 (addStillNotContains!295 lt!548459 lt!548465 lt!548463 lt!548461))))

(assert (=> b!1208933 (= lt!548461 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208933 (= lt!548463 (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208933 (= lt!548465 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!59059 () ListLongMap!17739)

(assert (=> b!1208933 (= lt!548459 call!59059)))

(declare-fun e!686652 () ListLongMap!17739)

(assert (=> b!1208933 (= e!686652 (+!4047 call!59059 (tuple2!19763 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133507 () Bool)

(declare-fun e!686651 () Bool)

(assert (=> d!133507 e!686651))

(declare-fun res!803396 () Bool)

(assert (=> d!133507 (=> (not res!803396) (not e!686651))))

(declare-fun lt!548460 () ListLongMap!17739)

(assert (=> d!133507 (= res!803396 (not (contains!6966 lt!548460 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686655 () ListLongMap!17739)

(assert (=> d!133507 (= lt!548460 e!686655)))

(declare-fun c!119111 () Bool)

(assert (=> d!133507 (= c!119111 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(assert (=> d!133507 (validMask!0 mask!1564)))

(assert (=> d!133507 (= (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!548460)))

(declare-fun b!1208934 () Bool)

(declare-fun e!686653 () Bool)

(assert (=> b!1208934 (= e!686653 (isEmpty!991 lt!548460))))

(declare-fun bm!59056 () Bool)

(assert (=> bm!59056 (= call!59059 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208935 () Bool)

(assert (=> b!1208935 (= e!686655 e!686652)))

(declare-fun c!119113 () Bool)

(assert (=> b!1208935 (= c!119113 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1208936 () Bool)

(assert (=> b!1208936 (= e!686652 call!59059)))

(declare-fun b!1208937 () Bool)

(assert (=> b!1208937 (= e!686655 (ListLongMap!17740 Nil!26566))))

(declare-fun b!1208938 () Bool)

(declare-fun e!686654 () Bool)

(assert (=> b!1208938 (= e!686651 e!686654)))

(declare-fun c!119114 () Bool)

(declare-fun e!686656 () Bool)

(assert (=> b!1208938 (= c!119114 e!686656)))

(declare-fun res!803394 () Bool)

(assert (=> b!1208938 (=> (not res!803394) (not e!686656))))

(assert (=> b!1208938 (= res!803394 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun b!1208939 () Bool)

(assert (=> b!1208939 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(assert (=> b!1208939 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38246 _values!996)))))

(declare-fun e!686657 () Bool)

(assert (=> b!1208939 (= e!686657 (= (apply!974 lt!548460 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19263 (select (arr!37709 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208940 () Bool)

(assert (=> b!1208940 (= e!686653 (= lt!548460 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208941 () Bool)

(declare-fun res!803395 () Bool)

(assert (=> b!1208941 (=> (not res!803395) (not e!686651))))

(assert (=> b!1208941 (= res!803395 (not (contains!6966 lt!548460 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208942 () Bool)

(assert (=> b!1208942 (= e!686656 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1208942 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1208943 () Bool)

(assert (=> b!1208943 (= e!686654 e!686653)))

(declare-fun c!119112 () Bool)

(assert (=> b!1208943 (= c!119112 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun b!1208944 () Bool)

(assert (=> b!1208944 (= e!686654 e!686657)))

(assert (=> b!1208944 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun res!803397 () Bool)

(assert (=> b!1208944 (= res!803397 (contains!6966 lt!548460 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1208944 (=> (not res!803397) (not e!686657))))

(assert (= (and d!133507 c!119111) b!1208937))

(assert (= (and d!133507 (not c!119111)) b!1208935))

(assert (= (and b!1208935 c!119113) b!1208933))

(assert (= (and b!1208935 (not c!119113)) b!1208936))

(assert (= (or b!1208933 b!1208936) bm!59056))

(assert (= (and d!133507 res!803396) b!1208941))

(assert (= (and b!1208941 res!803395) b!1208938))

(assert (= (and b!1208938 res!803394) b!1208942))

(assert (= (and b!1208938 c!119114) b!1208944))

(assert (= (and b!1208938 (not c!119114)) b!1208943))

(assert (= (and b!1208944 res!803397) b!1208939))

(assert (= (and b!1208943 c!119112) b!1208940))

(assert (= (and b!1208943 (not c!119112)) b!1208934))

(declare-fun b_lambda!21447 () Bool)

(assert (=> (not b_lambda!21447) (not b!1208933)))

(assert (=> b!1208933 t!39503))

(declare-fun b_and!42967 () Bool)

(assert (= b_and!42965 (and (=> t!39503 result!22105) b_and!42967)))

(declare-fun b_lambda!21449 () Bool)

(assert (=> (not b_lambda!21449) (not b!1208939)))

(assert (=> b!1208939 t!39503))

(declare-fun b_and!42969 () Bool)

(assert (= b_and!42967 (and (=> t!39503 result!22105) b_and!42969)))

(declare-fun m!1114935 () Bool)

(assert (=> bm!59056 m!1114935))

(declare-fun m!1114937 () Bool)

(assert (=> b!1208933 m!1114937))

(declare-fun m!1114939 () Bool)

(assert (=> b!1208933 m!1114939))

(declare-fun m!1114941 () Bool)

(assert (=> b!1208933 m!1114941))

(assert (=> b!1208933 m!1114937))

(declare-fun m!1114943 () Bool)

(assert (=> b!1208933 m!1114943))

(declare-fun m!1114945 () Bool)

(assert (=> b!1208933 m!1114945))

(assert (=> b!1208933 m!1114945))

(assert (=> b!1208933 m!1114379))

(declare-fun m!1114947 () Bool)

(assert (=> b!1208933 m!1114947))

(declare-fun m!1114949 () Bool)

(assert (=> b!1208933 m!1114949))

(assert (=> b!1208933 m!1114379))

(assert (=> b!1208935 m!1114939))

(assert (=> b!1208935 m!1114939))

(declare-fun m!1114951 () Bool)

(assert (=> b!1208935 m!1114951))

(assert (=> b!1208944 m!1114939))

(assert (=> b!1208944 m!1114939))

(declare-fun m!1114953 () Bool)

(assert (=> b!1208944 m!1114953))

(declare-fun m!1114955 () Bool)

(assert (=> b!1208934 m!1114955))

(declare-fun m!1114957 () Bool)

(assert (=> b!1208941 m!1114957))

(assert (=> b!1208942 m!1114939))

(assert (=> b!1208942 m!1114939))

(assert (=> b!1208942 m!1114951))

(assert (=> b!1208939 m!1114939))

(assert (=> b!1208939 m!1114939))

(declare-fun m!1114959 () Bool)

(assert (=> b!1208939 m!1114959))

(assert (=> b!1208939 m!1114945))

(assert (=> b!1208939 m!1114945))

(assert (=> b!1208939 m!1114379))

(assert (=> b!1208939 m!1114947))

(assert (=> b!1208939 m!1114379))

(declare-fun m!1114961 () Bool)

(assert (=> d!133507 m!1114961))

(assert (=> d!133507 m!1114367))

(assert (=> b!1208940 m!1114935))

(assert (=> bm!59026 d!133507))

(declare-fun b!1208947 () Bool)

(declare-fun e!686659 () Option!683)

(assert (=> b!1208947 (= e!686659 (getValueByKey!632 (t!39504 (toList!8885 lt!548343)) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1208948 () Bool)

(assert (=> b!1208948 (= e!686659 None!681)))

(declare-fun b!1208945 () Bool)

(declare-fun e!686658 () Option!683)

(assert (=> b!1208945 (= e!686658 (Some!682 (_2!9892 (h!27783 (toList!8885 lt!548343)))))))

(declare-fun d!133509 () Bool)

(declare-fun c!119115 () Bool)

(assert (=> d!133509 (= c!119115 (and ((_ is Cons!26565) (toList!8885 lt!548343)) (= (_1!9892 (h!27783 (toList!8885 lt!548343))) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133509 (= (getValueByKey!632 (toList!8885 lt!548343) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!686658)))

(declare-fun b!1208946 () Bool)

(assert (=> b!1208946 (= e!686658 e!686659)))

(declare-fun c!119116 () Bool)

(assert (=> b!1208946 (= c!119116 (and ((_ is Cons!26565) (toList!8885 lt!548343)) (not (= (_1!9892 (h!27783 (toList!8885 lt!548343))) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!133509 c!119115) b!1208945))

(assert (= (and d!133509 (not c!119115)) b!1208946))

(assert (= (and b!1208946 c!119116) b!1208947))

(assert (= (and b!1208946 (not c!119116)) b!1208948))

(declare-fun m!1114963 () Bool)

(assert (=> b!1208947 m!1114963))

(assert (=> b!1208719 d!133509))

(declare-fun d!133511 () Bool)

(assert (=> d!133511 (= (apply!974 lt!548383 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19266 (getValueByKey!632 (toList!8885 lt!548383) (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34155 () Bool)

(assert (= bs!34155 d!133511))

(assert (=> bs!34155 m!1114709))

(declare-fun m!1114965 () Bool)

(assert (=> bs!34155 m!1114965))

(assert (=> bs!34155 m!1114965))

(declare-fun m!1114967 () Bool)

(assert (=> bs!34155 m!1114967))

(assert (=> b!1208803 d!133511))

(declare-fun d!133513 () Bool)

(declare-fun c!119117 () Bool)

(assert (=> d!133513 (= c!119117 ((_ is ValueCellFull!14624) (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!686660 () V!46017)

(assert (=> d!133513 (= (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!686660)))

(declare-fun b!1208949 () Bool)

(assert (=> b!1208949 (= e!686660 (get!19264 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208950 () Bool)

(assert (=> b!1208950 (= e!686660 (get!19265 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133513 c!119117) b!1208949))

(assert (= (and d!133513 (not c!119117)) b!1208950))

(assert (=> b!1208949 m!1114715))

(assert (=> b!1208949 m!1114379))

(declare-fun m!1114969 () Bool)

(assert (=> b!1208949 m!1114969))

(assert (=> b!1208950 m!1114715))

(assert (=> b!1208950 m!1114379))

(declare-fun m!1114971 () Bool)

(assert (=> b!1208950 m!1114971))

(assert (=> b!1208803 d!133513))

(declare-fun b!1208951 () Bool)

(declare-fun e!686663 () Bool)

(declare-fun call!59060 () Bool)

(assert (=> b!1208951 (= e!686663 call!59060)))

(declare-fun d!133515 () Bool)

(declare-fun res!803399 () Bool)

(declare-fun e!686661 () Bool)

(assert (=> d!133515 (=> res!803399 e!686661)))

(assert (=> d!133515 (= res!803399 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(assert (=> d!133515 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564) e!686661)))

(declare-fun b!1208952 () Bool)

(declare-fun e!686662 () Bool)

(assert (=> b!1208952 (= e!686661 e!686662)))

(declare-fun c!119118 () Bool)

(assert (=> b!1208952 (= c!119118 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1208953 () Bool)

(assert (=> b!1208953 (= e!686662 call!59060)))

(declare-fun bm!59057 () Bool)

(assert (=> bm!59057 (= call!59060 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1208954 () Bool)

(assert (=> b!1208954 (= e!686662 e!686663)))

(declare-fun lt!548467 () (_ BitVec 64))

(assert (=> b!1208954 (= lt!548467 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!548468 () Unit!39973)

(assert (=> b!1208954 (= lt!548468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!548467 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1208954 (arrayContainsKey!0 _keys!1208 lt!548467 #b00000000000000000000000000000000)))

(declare-fun lt!548466 () Unit!39973)

(assert (=> b!1208954 (= lt!548466 lt!548468)))

(declare-fun res!803398 () Bool)

(assert (=> b!1208954 (= res!803398 (= (seekEntryOrOpen!0 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1208 mask!1564) (Found!9894 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1208954 (=> (not res!803398) (not e!686663))))

(assert (= (and d!133515 (not res!803399)) b!1208952))

(assert (= (and b!1208952 c!119118) b!1208954))

(assert (= (and b!1208952 (not c!119118)) b!1208953))

(assert (= (and b!1208954 res!803398) b!1208951))

(assert (= (or b!1208951 b!1208953) bm!59057))

(declare-fun m!1114973 () Bool)

(assert (=> b!1208952 m!1114973))

(assert (=> b!1208952 m!1114973))

(declare-fun m!1114975 () Bool)

(assert (=> b!1208952 m!1114975))

(declare-fun m!1114977 () Bool)

(assert (=> bm!59057 m!1114977))

(assert (=> b!1208954 m!1114973))

(declare-fun m!1114979 () Bool)

(assert (=> b!1208954 m!1114979))

(declare-fun m!1114981 () Bool)

(assert (=> b!1208954 m!1114981))

(assert (=> b!1208954 m!1114973))

(declare-fun m!1114983 () Bool)

(assert (=> b!1208954 m!1114983))

(assert (=> bm!59043 d!133515))

(declare-fun d!133517 () Bool)

(declare-fun e!686665 () Bool)

(assert (=> d!133517 e!686665))

(declare-fun res!803400 () Bool)

(assert (=> d!133517 (=> res!803400 e!686665)))

(declare-fun lt!548469 () Bool)

(assert (=> d!133517 (= res!803400 (not lt!548469))))

(declare-fun lt!548471 () Bool)

(assert (=> d!133517 (= lt!548469 lt!548471)))

(declare-fun lt!548472 () Unit!39973)

(declare-fun e!686664 () Unit!39973)

(assert (=> d!133517 (= lt!548472 e!686664)))

(declare-fun c!119119 () Bool)

(assert (=> d!133517 (= c!119119 lt!548471)))

(assert (=> d!133517 (= lt!548471 (containsKey!594 (toList!8885 lt!548302) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133517 (= (contains!6966 lt!548302 #b0000000000000000000000000000000000000000000000000000000000000000) lt!548469)))

(declare-fun b!1208955 () Bool)

(declare-fun lt!548470 () Unit!39973)

(assert (=> b!1208955 (= e!686664 lt!548470)))

(assert (=> b!1208955 (= lt!548470 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548302) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1208955 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548302) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1208956 () Bool)

(declare-fun Unit!39990 () Unit!39973)

(assert (=> b!1208956 (= e!686664 Unit!39990)))

(declare-fun b!1208957 () Bool)

(assert (=> b!1208957 (= e!686665 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548302) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133517 c!119119) b!1208955))

(assert (= (and d!133517 (not c!119119)) b!1208956))

(assert (= (and d!133517 (not res!803400)) b!1208957))

(declare-fun m!1114985 () Bool)

(assert (=> d!133517 m!1114985))

(declare-fun m!1114987 () Bool)

(assert (=> b!1208955 m!1114987))

(declare-fun m!1114989 () Bool)

(assert (=> b!1208955 m!1114989))

(assert (=> b!1208955 m!1114989))

(declare-fun m!1114991 () Bool)

(assert (=> b!1208955 m!1114991))

(assert (=> b!1208957 m!1114989))

(assert (=> b!1208957 m!1114989))

(assert (=> b!1208957 m!1114991))

(assert (=> d!133397 d!133517))

(assert (=> d!133397 d!133411))

(declare-fun d!133519 () Bool)

(declare-fun lt!548475 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!546 (List!26569) (InoxSet tuple2!19762))

(assert (=> d!133519 (= lt!548475 (select (content!546 (toList!8885 lt!548333)) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun e!686671 () Bool)

(assert (=> d!133519 (= lt!548475 e!686671)))

(declare-fun res!803406 () Bool)

(assert (=> d!133519 (=> (not res!803406) (not e!686671))))

(assert (=> d!133519 (= res!803406 ((_ is Cons!26565) (toList!8885 lt!548333)))))

(assert (=> d!133519 (= (contains!6969 (toList!8885 lt!548333) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!548475)))

(declare-fun b!1208962 () Bool)

(declare-fun e!686670 () Bool)

(assert (=> b!1208962 (= e!686671 e!686670)))

(declare-fun res!803405 () Bool)

(assert (=> b!1208962 (=> res!803405 e!686670)))

(assert (=> b!1208962 (= res!803405 (= (h!27783 (toList!8885 lt!548333)) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun b!1208963 () Bool)

(assert (=> b!1208963 (= e!686670 (contains!6969 (t!39504 (toList!8885 lt!548333)) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!133519 res!803406) b!1208962))

(assert (= (and b!1208962 (not res!803405)) b!1208963))

(declare-fun m!1114993 () Bool)

(assert (=> d!133519 m!1114993))

(declare-fun m!1114995 () Bool)

(assert (=> d!133519 m!1114995))

(declare-fun m!1114997 () Bool)

(assert (=> b!1208963 m!1114997))

(assert (=> b!1208703 d!133519))

(declare-fun d!133521 () Bool)

(declare-fun e!686673 () Bool)

(assert (=> d!133521 e!686673))

(declare-fun res!803407 () Bool)

(assert (=> d!133521 (=> res!803407 e!686673)))

(declare-fun lt!548476 () Bool)

(assert (=> d!133521 (= res!803407 (not lt!548476))))

(declare-fun lt!548478 () Bool)

(assert (=> d!133521 (= lt!548476 lt!548478)))

(declare-fun lt!548479 () Unit!39973)

(declare-fun e!686672 () Unit!39973)

(assert (=> d!133521 (= lt!548479 e!686672)))

(declare-fun c!119120 () Bool)

(assert (=> d!133521 (= c!119120 lt!548478)))

(assert (=> d!133521 (= lt!548478 (containsKey!594 (toList!8885 lt!548353) (select (arr!37708 _keys!1208) from!1455)))))

(assert (=> d!133521 (= (contains!6966 lt!548353 (select (arr!37708 _keys!1208) from!1455)) lt!548476)))

(declare-fun b!1208964 () Bool)

(declare-fun lt!548477 () Unit!39973)

(assert (=> b!1208964 (= e!686672 lt!548477)))

(assert (=> b!1208964 (= lt!548477 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548353) (select (arr!37708 _keys!1208) from!1455)))))

(assert (=> b!1208964 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548353) (select (arr!37708 _keys!1208) from!1455)))))

(declare-fun b!1208965 () Bool)

(declare-fun Unit!39991 () Unit!39973)

(assert (=> b!1208965 (= e!686672 Unit!39991)))

(declare-fun b!1208966 () Bool)

(assert (=> b!1208966 (= e!686673 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548353) (select (arr!37708 _keys!1208) from!1455))))))

(assert (= (and d!133521 c!119120) b!1208964))

(assert (= (and d!133521 (not c!119120)) b!1208965))

(assert (= (and d!133521 (not res!803407)) b!1208966))

(assert (=> d!133521 m!1114351))

(declare-fun m!1114999 () Bool)

(assert (=> d!133521 m!1114999))

(assert (=> b!1208964 m!1114351))

(declare-fun m!1115001 () Bool)

(assert (=> b!1208964 m!1115001))

(assert (=> b!1208964 m!1114351))

(declare-fun m!1115003 () Bool)

(assert (=> b!1208964 m!1115003))

(assert (=> b!1208964 m!1115003))

(declare-fun m!1115005 () Bool)

(assert (=> b!1208964 m!1115005))

(assert (=> b!1208966 m!1114351))

(assert (=> b!1208966 m!1115003))

(assert (=> b!1208966 m!1115003))

(assert (=> b!1208966 m!1115005))

(assert (=> b!1208744 d!133521))

(declare-fun b!1208967 () Bool)

(declare-fun lt!548485 () Unit!39973)

(declare-fun lt!548483 () Unit!39973)

(assert (=> b!1208967 (= lt!548485 lt!548483)))

(declare-fun lt!548482 () (_ BitVec 64))

(declare-fun lt!548484 () V!46017)

(declare-fun lt!548486 () (_ BitVec 64))

(declare-fun lt!548480 () ListLongMap!17739)

(assert (=> b!1208967 (not (contains!6966 (+!4047 lt!548480 (tuple2!19763 lt!548486 lt!548484)) lt!548482))))

(assert (=> b!1208967 (= lt!548483 (addStillNotContains!295 lt!548480 lt!548486 lt!548484 lt!548482))))

(assert (=> b!1208967 (= lt!548482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208967 (= lt!548484 (get!19263 (select (arr!37709 lt!548180) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208967 (= lt!548486 (select (arr!37708 lt!548177) (bvadd from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!59061 () ListLongMap!17739)

(assert (=> b!1208967 (= lt!548480 call!59061)))

(declare-fun e!686675 () ListLongMap!17739)

(assert (=> b!1208967 (= e!686675 (+!4047 call!59061 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19263 (select (arr!37709 lt!548180) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133523 () Bool)

(declare-fun e!686674 () Bool)

(assert (=> d!133523 e!686674))

(declare-fun res!803410 () Bool)

(assert (=> d!133523 (=> (not res!803410) (not e!686674))))

(declare-fun lt!548481 () ListLongMap!17739)

(assert (=> d!133523 (= res!803410 (not (contains!6966 lt!548481 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686678 () ListLongMap!17739)

(assert (=> d!133523 (= lt!548481 e!686678)))

(declare-fun c!119121 () Bool)

(assert (=> d!133523 (= c!119121 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(assert (=> d!133523 (validMask!0 mask!1564)))

(assert (=> d!133523 (= (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!548481)))

(declare-fun b!1208968 () Bool)

(declare-fun e!686676 () Bool)

(assert (=> b!1208968 (= e!686676 (isEmpty!991 lt!548481))))

(declare-fun bm!59058 () Bool)

(assert (=> bm!59058 (= call!59061 (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208969 () Bool)

(assert (=> b!1208969 (= e!686678 e!686675)))

(declare-fun c!119123 () Bool)

(assert (=> b!1208969 (= c!119123 (validKeyInArray!0 (select (arr!37708 lt!548177) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1208970 () Bool)

(assert (=> b!1208970 (= e!686675 call!59061)))

(declare-fun b!1208971 () Bool)

(assert (=> b!1208971 (= e!686678 (ListLongMap!17740 Nil!26566))))

(declare-fun b!1208972 () Bool)

(declare-fun e!686677 () Bool)

(assert (=> b!1208972 (= e!686674 e!686677)))

(declare-fun c!119124 () Bool)

(declare-fun e!686679 () Bool)

(assert (=> b!1208972 (= c!119124 e!686679)))

(declare-fun res!803408 () Bool)

(assert (=> b!1208972 (=> (not res!803408) (not e!686679))))

(assert (=> b!1208972 (= res!803408 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(declare-fun b!1208973 () Bool)

(assert (=> b!1208973 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(assert (=> b!1208973 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38246 lt!548180)))))

(declare-fun e!686680 () Bool)

(assert (=> b!1208973 (= e!686680 (= (apply!974 lt!548481 (select (arr!37708 lt!548177) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19263 (select (arr!37709 lt!548180) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208974 () Bool)

(assert (=> b!1208974 (= e!686676 (= lt!548481 (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208975 () Bool)

(declare-fun res!803409 () Bool)

(assert (=> b!1208975 (=> (not res!803409) (not e!686674))))

(assert (=> b!1208975 (= res!803409 (not (contains!6966 lt!548481 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208976 () Bool)

(assert (=> b!1208976 (= e!686679 (validKeyInArray!0 (select (arr!37708 lt!548177) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1208976 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1208977 () Bool)

(assert (=> b!1208977 (= e!686677 e!686676)))

(declare-fun c!119122 () Bool)

(assert (=> b!1208977 (= c!119122 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(declare-fun b!1208978 () Bool)

(assert (=> b!1208978 (= e!686677 e!686680)))

(assert (=> b!1208978 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(declare-fun res!803411 () Bool)

(assert (=> b!1208978 (= res!803411 (contains!6966 lt!548481 (select (arr!37708 lt!548177) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1208978 (=> (not res!803411) (not e!686680))))

(assert (= (and d!133523 c!119121) b!1208971))

(assert (= (and d!133523 (not c!119121)) b!1208969))

(assert (= (and b!1208969 c!119123) b!1208967))

(assert (= (and b!1208969 (not c!119123)) b!1208970))

(assert (= (or b!1208967 b!1208970) bm!59058))

(assert (= (and d!133523 res!803410) b!1208975))

(assert (= (and b!1208975 res!803409) b!1208972))

(assert (= (and b!1208972 res!803408) b!1208976))

(assert (= (and b!1208972 c!119124) b!1208978))

(assert (= (and b!1208972 (not c!119124)) b!1208977))

(assert (= (and b!1208978 res!803411) b!1208973))

(assert (= (and b!1208977 c!119122) b!1208974))

(assert (= (and b!1208977 (not c!119122)) b!1208968))

(declare-fun b_lambda!21451 () Bool)

(assert (=> (not b_lambda!21451) (not b!1208967)))

(assert (=> b!1208967 t!39503))

(declare-fun b_and!42971 () Bool)

(assert (= b_and!42969 (and (=> t!39503 result!22105) b_and!42971)))

(declare-fun b_lambda!21453 () Bool)

(assert (=> (not b_lambda!21453) (not b!1208973)))

(assert (=> b!1208973 t!39503))

(declare-fun b_and!42973 () Bool)

(assert (= b_and!42971 (and (=> t!39503 result!22105) b_and!42973)))

(declare-fun m!1115007 () Bool)

(assert (=> bm!59058 m!1115007))

(declare-fun m!1115009 () Bool)

(assert (=> b!1208967 m!1115009))

(declare-fun m!1115011 () Bool)

(assert (=> b!1208967 m!1115011))

(declare-fun m!1115013 () Bool)

(assert (=> b!1208967 m!1115013))

(assert (=> b!1208967 m!1115009))

(declare-fun m!1115015 () Bool)

(assert (=> b!1208967 m!1115015))

(declare-fun m!1115017 () Bool)

(assert (=> b!1208967 m!1115017))

(assert (=> b!1208967 m!1115017))

(assert (=> b!1208967 m!1114379))

(declare-fun m!1115019 () Bool)

(assert (=> b!1208967 m!1115019))

(declare-fun m!1115021 () Bool)

(assert (=> b!1208967 m!1115021))

(assert (=> b!1208967 m!1114379))

(assert (=> b!1208969 m!1115011))

(assert (=> b!1208969 m!1115011))

(declare-fun m!1115023 () Bool)

(assert (=> b!1208969 m!1115023))

(assert (=> b!1208978 m!1115011))

(assert (=> b!1208978 m!1115011))

(declare-fun m!1115025 () Bool)

(assert (=> b!1208978 m!1115025))

(declare-fun m!1115027 () Bool)

(assert (=> b!1208968 m!1115027))

(declare-fun m!1115029 () Bool)

(assert (=> b!1208975 m!1115029))

(assert (=> b!1208976 m!1115011))

(assert (=> b!1208976 m!1115011))

(assert (=> b!1208976 m!1115023))

(assert (=> b!1208973 m!1115011))

(assert (=> b!1208973 m!1115011))

(declare-fun m!1115031 () Bool)

(assert (=> b!1208973 m!1115031))

(assert (=> b!1208973 m!1115017))

(assert (=> b!1208973 m!1115017))

(assert (=> b!1208973 m!1114379))

(assert (=> b!1208973 m!1115019))

(assert (=> b!1208973 m!1114379))

(declare-fun m!1115033 () Bool)

(assert (=> d!133523 m!1115033))

(assert (=> d!133523 m!1114367))

(assert (=> b!1208974 m!1115007))

(assert (=> bm!59033 d!133523))

(declare-fun d!133525 () Bool)

(declare-fun e!686682 () Bool)

(assert (=> d!133525 e!686682))

(declare-fun res!803412 () Bool)

(assert (=> d!133525 (=> res!803412 e!686682)))

(declare-fun lt!548487 () Bool)

(assert (=> d!133525 (= res!803412 (not lt!548487))))

(declare-fun lt!548489 () Bool)

(assert (=> d!133525 (= lt!548487 lt!548489)))

(declare-fun lt!548490 () Unit!39973)

(declare-fun e!686681 () Unit!39973)

(assert (=> d!133525 (= lt!548490 e!686681)))

(declare-fun c!119125 () Bool)

(assert (=> d!133525 (= c!119125 lt!548489)))

(assert (=> d!133525 (= lt!548489 (containsKey!594 (toList!8885 (+!4047 lt!548178 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944)))) k0!934))))

(assert (=> d!133525 (= (contains!6966 (+!4047 lt!548178 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944))) k0!934) lt!548487)))

(declare-fun b!1208979 () Bool)

(declare-fun lt!548488 () Unit!39973)

(assert (=> b!1208979 (= e!686681 lt!548488)))

(assert (=> b!1208979 (= lt!548488 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 (+!4047 lt!548178 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944)))) k0!934))))

(assert (=> b!1208979 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548178 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944)))) k0!934))))

(declare-fun b!1208980 () Bool)

(declare-fun Unit!39992 () Unit!39973)

(assert (=> b!1208980 (= e!686681 Unit!39992)))

(declare-fun b!1208981 () Bool)

(assert (=> b!1208981 (= e!686682 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548178 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944)))) k0!934)))))

(assert (= (and d!133525 c!119125) b!1208979))

(assert (= (and d!133525 (not c!119125)) b!1208980))

(assert (= (and d!133525 (not res!803412)) b!1208981))

(declare-fun m!1115035 () Bool)

(assert (=> d!133525 m!1115035))

(declare-fun m!1115037 () Bool)

(assert (=> b!1208979 m!1115037))

(declare-fun m!1115039 () Bool)

(assert (=> b!1208979 m!1115039))

(assert (=> b!1208979 m!1115039))

(declare-fun m!1115041 () Bool)

(assert (=> b!1208979 m!1115041))

(assert (=> b!1208981 m!1115039))

(assert (=> b!1208981 m!1115039))

(assert (=> b!1208981 m!1115041))

(assert (=> d!133437 d!133525))

(declare-fun d!133527 () Bool)

(declare-fun e!686683 () Bool)

(assert (=> d!133527 e!686683))

(declare-fun res!803414 () Bool)

(assert (=> d!133527 (=> (not res!803414) (not e!686683))))

(declare-fun lt!548493 () ListLongMap!17739)

(assert (=> d!133527 (= res!803414 (contains!6966 lt!548493 (_1!9892 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944)))))))

(declare-fun lt!548494 () List!26569)

(assert (=> d!133527 (= lt!548493 (ListLongMap!17740 lt!548494))))

(declare-fun lt!548491 () Unit!39973)

(declare-fun lt!548492 () Unit!39973)

(assert (=> d!133527 (= lt!548491 lt!548492)))

(assert (=> d!133527 (= (getValueByKey!632 lt!548494 (_1!9892 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944)))) (Some!682 (_2!9892 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944)))))))

(assert (=> d!133527 (= lt!548492 (lemmaContainsTupThenGetReturnValue!314 lt!548494 (_1!9892 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944))) (_2!9892 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944)))))))

(assert (=> d!133527 (= lt!548494 (insertStrictlySorted!407 (toList!8885 lt!548178) (_1!9892 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944))) (_2!9892 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944)))))))

(assert (=> d!133527 (= (+!4047 lt!548178 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944))) lt!548493)))

(declare-fun b!1208982 () Bool)

(declare-fun res!803413 () Bool)

(assert (=> b!1208982 (=> (not res!803413) (not e!686683))))

(assert (=> b!1208982 (= res!803413 (= (getValueByKey!632 (toList!8885 lt!548493) (_1!9892 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944)))) (Some!682 (_2!9892 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944))))))))

(declare-fun b!1208983 () Bool)

(assert (=> b!1208983 (= e!686683 (contains!6969 (toList!8885 lt!548493) (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944))))))

(assert (= (and d!133527 res!803414) b!1208982))

(assert (= (and b!1208982 res!803413) b!1208983))

(declare-fun m!1115043 () Bool)

(assert (=> d!133527 m!1115043))

(declare-fun m!1115045 () Bool)

(assert (=> d!133527 m!1115045))

(declare-fun m!1115047 () Bool)

(assert (=> d!133527 m!1115047))

(declare-fun m!1115049 () Bool)

(assert (=> d!133527 m!1115049))

(declare-fun m!1115051 () Bool)

(assert (=> b!1208982 m!1115051))

(declare-fun m!1115053 () Bool)

(assert (=> b!1208983 m!1115053))

(assert (=> d!133437 d!133527))

(declare-fun d!133529 () Bool)

(assert (=> d!133529 (contains!6966 (+!4047 lt!548178 (tuple2!19763 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944))) k0!934)))

(assert (=> d!133529 true))

(declare-fun _$35!460 () Unit!39973)

(assert (=> d!133529 (= (choose!1806 lt!548178 (ite (or c!119000 c!118996) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119000 c!118996) zeroValue!944 minValue!944) k0!934) _$35!460)))

(declare-fun bs!34156 () Bool)

(assert (= bs!34156 d!133529))

(assert (=> bs!34156 m!1114691))

(assert (=> bs!34156 m!1114691))

(assert (=> bs!34156 m!1114693))

(assert (=> d!133437 d!133529))

(assert (=> d!133437 d!133425))

(assert (=> b!1208742 d!133459))

(declare-fun d!133531 () Bool)

(assert (=> d!133531 (= (isDefined!460 (getValueByKey!632 (toList!8885 lt!548178) k0!934)) (not (isEmpty!992 (getValueByKey!632 (toList!8885 lt!548178) k0!934))))))

(declare-fun bs!34157 () Bool)

(assert (= bs!34157 d!133531))

(assert (=> bs!34157 m!1114669))

(declare-fun m!1115055 () Bool)

(assert (=> bs!34157 m!1115055))

(assert (=> b!1208761 d!133531))

(declare-fun b!1208986 () Bool)

(declare-fun e!686685 () Option!683)

(assert (=> b!1208986 (= e!686685 (getValueByKey!632 (t!39504 (toList!8885 lt!548178)) k0!934))))

(declare-fun b!1208987 () Bool)

(assert (=> b!1208987 (= e!686685 None!681)))

(declare-fun b!1208984 () Bool)

(declare-fun e!686684 () Option!683)

(assert (=> b!1208984 (= e!686684 (Some!682 (_2!9892 (h!27783 (toList!8885 lt!548178)))))))

(declare-fun d!133533 () Bool)

(declare-fun c!119126 () Bool)

(assert (=> d!133533 (= c!119126 (and ((_ is Cons!26565) (toList!8885 lt!548178)) (= (_1!9892 (h!27783 (toList!8885 lt!548178))) k0!934)))))

(assert (=> d!133533 (= (getValueByKey!632 (toList!8885 lt!548178) k0!934) e!686684)))

(declare-fun b!1208985 () Bool)

(assert (=> b!1208985 (= e!686684 e!686685)))

(declare-fun c!119127 () Bool)

(assert (=> b!1208985 (= c!119127 (and ((_ is Cons!26565) (toList!8885 lt!548178)) (not (= (_1!9892 (h!27783 (toList!8885 lt!548178))) k0!934))))))

(assert (= (and d!133533 c!119126) b!1208984))

(assert (= (and d!133533 (not c!119126)) b!1208985))

(assert (= (and b!1208985 c!119127) b!1208986))

(assert (= (and b!1208985 (not c!119127)) b!1208987))

(declare-fun m!1115057 () Bool)

(assert (=> b!1208986 m!1115057))

(assert (=> b!1208761 d!133533))

(declare-fun b!1208988 () Bool)

(declare-fun lt!548500 () Unit!39973)

(declare-fun lt!548498 () Unit!39973)

(assert (=> b!1208988 (= lt!548500 lt!548498)))

(declare-fun lt!548501 () (_ BitVec 64))

(declare-fun lt!548499 () V!46017)

(declare-fun lt!548495 () ListLongMap!17739)

(declare-fun lt!548497 () (_ BitVec 64))

(assert (=> b!1208988 (not (contains!6966 (+!4047 lt!548495 (tuple2!19763 lt!548501 lt!548499)) lt!548497))))

(assert (=> b!1208988 (= lt!548498 (addStillNotContains!295 lt!548495 lt!548501 lt!548499 lt!548497))))

(assert (=> b!1208988 (= lt!548497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208988 (= lt!548499 (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208988 (= lt!548501 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!59062 () ListLongMap!17739)

(assert (=> b!1208988 (= lt!548495 call!59062)))

(declare-fun e!686687 () ListLongMap!17739)

(assert (=> b!1208988 (= e!686687 (+!4047 call!59062 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133535 () Bool)

(declare-fun e!686686 () Bool)

(assert (=> d!133535 e!686686))

(declare-fun res!803417 () Bool)

(assert (=> d!133535 (=> (not res!803417) (not e!686686))))

(declare-fun lt!548496 () ListLongMap!17739)

(assert (=> d!133535 (= res!803417 (not (contains!6966 lt!548496 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686690 () ListLongMap!17739)

(assert (=> d!133535 (= lt!548496 e!686690)))

(declare-fun c!119128 () Bool)

(assert (=> d!133535 (= c!119128 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(assert (=> d!133535 (validMask!0 mask!1564)))

(assert (=> d!133535 (= (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!548496)))

(declare-fun b!1208989 () Bool)

(declare-fun e!686688 () Bool)

(assert (=> b!1208989 (= e!686688 (isEmpty!991 lt!548496))))

(declare-fun bm!59059 () Bool)

(assert (=> bm!59059 (= call!59062 (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208990 () Bool)

(assert (=> b!1208990 (= e!686690 e!686687)))

(declare-fun c!119130 () Bool)

(assert (=> b!1208990 (= c!119130 (validKeyInArray!0 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1208991 () Bool)

(assert (=> b!1208991 (= e!686687 call!59062)))

(declare-fun b!1208992 () Bool)

(assert (=> b!1208992 (= e!686690 (ListLongMap!17740 Nil!26566))))

(declare-fun b!1208993 () Bool)

(declare-fun e!686689 () Bool)

(assert (=> b!1208993 (= e!686686 e!686689)))

(declare-fun c!119131 () Bool)

(declare-fun e!686691 () Bool)

(assert (=> b!1208993 (= c!119131 e!686691)))

(declare-fun res!803415 () Bool)

(assert (=> b!1208993 (=> (not res!803415) (not e!686691))))

(assert (=> b!1208993 (= res!803415 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(declare-fun b!1208994 () Bool)

(assert (=> b!1208994 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(assert (=> b!1208994 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38246 lt!548180)))))

(declare-fun e!686692 () Bool)

(assert (=> b!1208994 (= e!686692 (= (apply!974 lt!548496 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208995 () Bool)

(assert (=> b!1208995 (= e!686688 (= lt!548496 (getCurrentListMapNoExtraKeys!5347 lt!548177 lt!548180 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208996 () Bool)

(declare-fun res!803416 () Bool)

(assert (=> b!1208996 (=> (not res!803416) (not e!686686))))

(assert (=> b!1208996 (= res!803416 (not (contains!6966 lt!548496 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208997 () Bool)

(assert (=> b!1208997 (= e!686691 (validKeyInArray!0 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1208997 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1208998 () Bool)

(assert (=> b!1208998 (= e!686689 e!686688)))

(declare-fun c!119129 () Bool)

(assert (=> b!1208998 (= c!119129 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(declare-fun b!1208999 () Bool)

(assert (=> b!1208999 (= e!686689 e!686692)))

(assert (=> b!1208999 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(declare-fun res!803418 () Bool)

(assert (=> b!1208999 (= res!803418 (contains!6966 lt!548496 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1208999 (=> (not res!803418) (not e!686692))))

(assert (= (and d!133535 c!119128) b!1208992))

(assert (= (and d!133535 (not c!119128)) b!1208990))

(assert (= (and b!1208990 c!119130) b!1208988))

(assert (= (and b!1208990 (not c!119130)) b!1208991))

(assert (= (or b!1208988 b!1208991) bm!59059))

(assert (= (and d!133535 res!803417) b!1208996))

(assert (= (and b!1208996 res!803416) b!1208993))

(assert (= (and b!1208993 res!803415) b!1208997))

(assert (= (and b!1208993 c!119131) b!1208999))

(assert (= (and b!1208993 (not c!119131)) b!1208998))

(assert (= (and b!1208999 res!803418) b!1208994))

(assert (= (and b!1208998 c!119129) b!1208995))

(assert (= (and b!1208998 (not c!119129)) b!1208989))

(declare-fun b_lambda!21455 () Bool)

(assert (=> (not b_lambda!21455) (not b!1208988)))

(assert (=> b!1208988 t!39503))

(declare-fun b_and!42975 () Bool)

(assert (= b_and!42973 (and (=> t!39503 result!22105) b_and!42975)))

(declare-fun b_lambda!21457 () Bool)

(assert (=> (not b_lambda!21457) (not b!1208994)))

(assert (=> b!1208994 t!39503))

(declare-fun b_and!42977 () Bool)

(assert (= b_and!42975 (and (=> t!39503 result!22105) b_and!42977)))

(declare-fun m!1115059 () Bool)

(assert (=> bm!59059 m!1115059))

(declare-fun m!1115061 () Bool)

(assert (=> b!1208988 m!1115061))

(declare-fun m!1115063 () Bool)

(assert (=> b!1208988 m!1115063))

(declare-fun m!1115065 () Bool)

(assert (=> b!1208988 m!1115065))

(assert (=> b!1208988 m!1115061))

(declare-fun m!1115067 () Bool)

(assert (=> b!1208988 m!1115067))

(declare-fun m!1115069 () Bool)

(assert (=> b!1208988 m!1115069))

(assert (=> b!1208988 m!1115069))

(assert (=> b!1208988 m!1114379))

(declare-fun m!1115071 () Bool)

(assert (=> b!1208988 m!1115071))

(declare-fun m!1115073 () Bool)

(assert (=> b!1208988 m!1115073))

(assert (=> b!1208988 m!1114379))

(assert (=> b!1208990 m!1115063))

(assert (=> b!1208990 m!1115063))

(declare-fun m!1115075 () Bool)

(assert (=> b!1208990 m!1115075))

(assert (=> b!1208999 m!1115063))

(assert (=> b!1208999 m!1115063))

(declare-fun m!1115077 () Bool)

(assert (=> b!1208999 m!1115077))

(declare-fun m!1115079 () Bool)

(assert (=> b!1208989 m!1115079))

(declare-fun m!1115081 () Bool)

(assert (=> b!1208996 m!1115081))

(assert (=> b!1208997 m!1115063))

(assert (=> b!1208997 m!1115063))

(assert (=> b!1208997 m!1115075))

(assert (=> b!1208994 m!1115063))

(assert (=> b!1208994 m!1115063))

(declare-fun m!1115083 () Bool)

(assert (=> b!1208994 m!1115083))

(assert (=> b!1208994 m!1115069))

(assert (=> b!1208994 m!1115069))

(assert (=> b!1208994 m!1114379))

(assert (=> b!1208994 m!1115071))

(assert (=> b!1208994 m!1114379))

(declare-fun m!1115085 () Bool)

(assert (=> d!133535 m!1115085))

(assert (=> d!133535 m!1114367))

(assert (=> b!1208995 m!1115059))

(assert (=> bm!59044 d!133535))

(assert (=> b!1208721 d!133505))

(declare-fun d!133537 () Bool)

(declare-fun e!686693 () Bool)

(assert (=> d!133537 e!686693))

(declare-fun res!803420 () Bool)

(assert (=> d!133537 (=> (not res!803420) (not e!686693))))

(declare-fun lt!548504 () ListLongMap!17739)

(assert (=> d!133537 (= res!803420 (contains!6966 lt!548504 (_1!9892 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!548505 () List!26569)

(assert (=> d!133537 (= lt!548504 (ListLongMap!17740 lt!548505))))

(declare-fun lt!548502 () Unit!39973)

(declare-fun lt!548503 () Unit!39973)

(assert (=> d!133537 (= lt!548502 lt!548503)))

(assert (=> d!133537 (= (getValueByKey!632 lt!548505 (_1!9892 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!682 (_2!9892 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133537 (= lt!548503 (lemmaContainsTupThenGetReturnValue!314 lt!548505 (_1!9892 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9892 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133537 (= lt!548505 (insertStrictlySorted!407 (toList!8885 call!59036) (_1!9892 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9892 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133537 (= (+!4047 call!59036 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!548504)))

(declare-fun b!1209000 () Bool)

(declare-fun res!803419 () Bool)

(assert (=> b!1209000 (=> (not res!803419) (not e!686693))))

(assert (=> b!1209000 (= res!803419 (= (getValueByKey!632 (toList!8885 lt!548504) (_1!9892 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!682 (_2!9892 (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1209001 () Bool)

(assert (=> b!1209001 (= e!686693 (contains!6969 (toList!8885 lt!548504) (tuple2!19763 (select (arr!37708 lt!548177) from!1455) (get!19263 (select (arr!37709 lt!548180) from!1455) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133537 res!803420) b!1209000))

(assert (= (and b!1209000 res!803419) b!1209001))

(declare-fun m!1115087 () Bool)

(assert (=> d!133537 m!1115087))

(declare-fun m!1115089 () Bool)

(assert (=> d!133537 m!1115089))

(declare-fun m!1115091 () Bool)

(assert (=> d!133537 m!1115091))

(declare-fun m!1115093 () Bool)

(assert (=> d!133537 m!1115093))

(declare-fun m!1115095 () Bool)

(assert (=> b!1209000 m!1115095))

(declare-fun m!1115097 () Bool)

(assert (=> b!1209001 m!1115097))

(assert (=> b!1208721 d!133537))

(declare-fun d!133539 () Bool)

(declare-fun e!686695 () Bool)

(assert (=> d!133539 e!686695))

(declare-fun res!803421 () Bool)

(assert (=> d!133539 (=> res!803421 e!686695)))

(declare-fun lt!548506 () Bool)

(assert (=> d!133539 (= res!803421 (not lt!548506))))

(declare-fun lt!548508 () Bool)

(assert (=> d!133539 (= lt!548506 lt!548508)))

(declare-fun lt!548509 () Unit!39973)

(declare-fun e!686694 () Unit!39973)

(assert (=> d!133539 (= lt!548509 e!686694)))

(declare-fun c!119132 () Bool)

(assert (=> d!133539 (= c!119132 lt!548508)))

(assert (=> d!133539 (= lt!548508 (containsKey!594 (toList!8885 (+!4047 lt!548345 (tuple2!19763 lt!548351 lt!548349))) lt!548347))))

(assert (=> d!133539 (= (contains!6966 (+!4047 lt!548345 (tuple2!19763 lt!548351 lt!548349)) lt!548347) lt!548506)))

(declare-fun b!1209002 () Bool)

(declare-fun lt!548507 () Unit!39973)

(assert (=> b!1209002 (= e!686694 lt!548507)))

(assert (=> b!1209002 (= lt!548507 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 (+!4047 lt!548345 (tuple2!19763 lt!548351 lt!548349))) lt!548347))))

(assert (=> b!1209002 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548345 (tuple2!19763 lt!548351 lt!548349))) lt!548347))))

(declare-fun b!1209003 () Bool)

(declare-fun Unit!39993 () Unit!39973)

(assert (=> b!1209003 (= e!686694 Unit!39993)))

(declare-fun b!1209004 () Bool)

(assert (=> b!1209004 (= e!686695 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548345 (tuple2!19763 lt!548351 lt!548349))) lt!548347)))))

(assert (= (and d!133539 c!119132) b!1209002))

(assert (= (and d!133539 (not c!119132)) b!1209003))

(assert (= (and d!133539 (not res!803421)) b!1209004))

(declare-fun m!1115099 () Bool)

(assert (=> d!133539 m!1115099))

(declare-fun m!1115101 () Bool)

(assert (=> b!1209002 m!1115101))

(declare-fun m!1115103 () Bool)

(assert (=> b!1209002 m!1115103))

(assert (=> b!1209002 m!1115103))

(declare-fun m!1115105 () Bool)

(assert (=> b!1209002 m!1115105))

(assert (=> b!1209004 m!1115103))

(assert (=> b!1209004 m!1115103))

(assert (=> b!1209004 m!1115105))

(assert (=> b!1208721 d!133539))

(declare-fun d!133541 () Bool)

(assert (=> d!133541 (not (contains!6966 (+!4047 lt!548345 (tuple2!19763 lt!548351 lt!548349)) lt!548347))))

(declare-fun lt!548510 () Unit!39973)

(assert (=> d!133541 (= lt!548510 (choose!1811 lt!548345 lt!548351 lt!548349 lt!548347))))

(declare-fun e!686696 () Bool)

(assert (=> d!133541 e!686696))

(declare-fun res!803422 () Bool)

(assert (=> d!133541 (=> (not res!803422) (not e!686696))))

(assert (=> d!133541 (= res!803422 (not (contains!6966 lt!548345 lt!548347)))))

(assert (=> d!133541 (= (addStillNotContains!295 lt!548345 lt!548351 lt!548349 lt!548347) lt!548510)))

(declare-fun b!1209005 () Bool)

(assert (=> b!1209005 (= e!686696 (not (= lt!548351 lt!548347)))))

(assert (= (and d!133541 res!803422) b!1209005))

(assert (=> d!133541 m!1114599))

(assert (=> d!133541 m!1114599))

(assert (=> d!133541 m!1114605))

(declare-fun m!1115107 () Bool)

(assert (=> d!133541 m!1115107))

(declare-fun m!1115109 () Bool)

(assert (=> d!133541 m!1115109))

(assert (=> b!1208721 d!133541))

(declare-fun d!133543 () Bool)

(declare-fun e!686697 () Bool)

(assert (=> d!133543 e!686697))

(declare-fun res!803424 () Bool)

(assert (=> d!133543 (=> (not res!803424) (not e!686697))))

(declare-fun lt!548513 () ListLongMap!17739)

(assert (=> d!133543 (= res!803424 (contains!6966 lt!548513 (_1!9892 (tuple2!19763 lt!548351 lt!548349))))))

(declare-fun lt!548514 () List!26569)

(assert (=> d!133543 (= lt!548513 (ListLongMap!17740 lt!548514))))

(declare-fun lt!548511 () Unit!39973)

(declare-fun lt!548512 () Unit!39973)

(assert (=> d!133543 (= lt!548511 lt!548512)))

(assert (=> d!133543 (= (getValueByKey!632 lt!548514 (_1!9892 (tuple2!19763 lt!548351 lt!548349))) (Some!682 (_2!9892 (tuple2!19763 lt!548351 lt!548349))))))

(assert (=> d!133543 (= lt!548512 (lemmaContainsTupThenGetReturnValue!314 lt!548514 (_1!9892 (tuple2!19763 lt!548351 lt!548349)) (_2!9892 (tuple2!19763 lt!548351 lt!548349))))))

(assert (=> d!133543 (= lt!548514 (insertStrictlySorted!407 (toList!8885 lt!548345) (_1!9892 (tuple2!19763 lt!548351 lt!548349)) (_2!9892 (tuple2!19763 lt!548351 lt!548349))))))

(assert (=> d!133543 (= (+!4047 lt!548345 (tuple2!19763 lt!548351 lt!548349)) lt!548513)))

(declare-fun b!1209006 () Bool)

(declare-fun res!803423 () Bool)

(assert (=> b!1209006 (=> (not res!803423) (not e!686697))))

(assert (=> b!1209006 (= res!803423 (= (getValueByKey!632 (toList!8885 lt!548513) (_1!9892 (tuple2!19763 lt!548351 lt!548349))) (Some!682 (_2!9892 (tuple2!19763 lt!548351 lt!548349)))))))

(declare-fun b!1209007 () Bool)

(assert (=> b!1209007 (= e!686697 (contains!6969 (toList!8885 lt!548513) (tuple2!19763 lt!548351 lt!548349)))))

(assert (= (and d!133543 res!803424) b!1209006))

(assert (= (and b!1209006 res!803423) b!1209007))

(declare-fun m!1115111 () Bool)

(assert (=> d!133543 m!1115111))

(declare-fun m!1115113 () Bool)

(assert (=> d!133543 m!1115113))

(declare-fun m!1115115 () Bool)

(assert (=> d!133543 m!1115115))

(declare-fun m!1115117 () Bool)

(assert (=> d!133543 m!1115117))

(declare-fun m!1115119 () Bool)

(assert (=> b!1209006 m!1115119))

(declare-fun m!1115121 () Bool)

(assert (=> b!1209007 m!1115121))

(assert (=> b!1208721 d!133543))

(declare-fun d!133545 () Bool)

(declare-fun res!803425 () Bool)

(declare-fun e!686698 () Bool)

(assert (=> d!133545 (=> res!803425 e!686698)))

(assert (=> d!133545 (= res!803425 (= (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!133545 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) e!686698)))

(declare-fun b!1209008 () Bool)

(declare-fun e!686699 () Bool)

(assert (=> b!1209008 (= e!686698 e!686699)))

(declare-fun res!803426 () Bool)

(assert (=> b!1209008 (=> (not res!803426) (not e!686699))))

(assert (=> b!1209008 (= res!803426 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun b!1209009 () Bool)

(assert (=> b!1209009 (= e!686699 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!133545 (not res!803425)) b!1209008))

(assert (= (and b!1209008 res!803426) b!1209009))

(assert (=> d!133545 m!1114939))

(declare-fun m!1115123 () Bool)

(assert (=> b!1209009 m!1115123))

(assert (=> b!1208746 d!133545))

(declare-fun d!133547 () Bool)

(declare-fun e!686701 () Bool)

(assert (=> d!133547 e!686701))

(declare-fun res!803427 () Bool)

(assert (=> d!133547 (=> res!803427 e!686701)))

(declare-fun lt!548515 () Bool)

(assert (=> d!133547 (= res!803427 (not lt!548515))))

(declare-fun lt!548517 () Bool)

(assert (=> d!133547 (= lt!548515 lt!548517)))

(declare-fun lt!548518 () Unit!39973)

(declare-fun e!686700 () Unit!39973)

(assert (=> d!133547 (= lt!548518 e!686700)))

(declare-fun c!119133 () Bool)

(assert (=> d!133547 (= c!119133 lt!548517)))

(assert (=> d!133547 (= lt!548517 (containsKey!594 (toList!8885 lt!548302) (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!133547 (= (contains!6966 lt!548302 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) lt!548515)))

(declare-fun b!1209010 () Bool)

(declare-fun lt!548516 () Unit!39973)

(assert (=> b!1209010 (= e!686700 lt!548516)))

(assert (=> b!1209010 (= lt!548516 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548302) (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1209010 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548302) (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1209011 () Bool)

(declare-fun Unit!39994 () Unit!39973)

(assert (=> b!1209011 (= e!686700 Unit!39994)))

(declare-fun b!1209012 () Bool)

(assert (=> b!1209012 (= e!686701 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548302) (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!133547 c!119133) b!1209010))

(assert (= (and d!133547 (not c!119133)) b!1209011))

(assert (= (and d!133547 (not res!803427)) b!1209012))

(assert (=> d!133547 m!1114525))

(declare-fun m!1115125 () Bool)

(assert (=> d!133547 m!1115125))

(assert (=> b!1209010 m!1114525))

(declare-fun m!1115127 () Bool)

(assert (=> b!1209010 m!1115127))

(assert (=> b!1209010 m!1114525))

(declare-fun m!1115129 () Bool)

(assert (=> b!1209010 m!1115129))

(assert (=> b!1209010 m!1115129))

(declare-fun m!1115131 () Bool)

(assert (=> b!1209010 m!1115131))

(assert (=> b!1209012 m!1114525))

(assert (=> b!1209012 m!1115129))

(assert (=> b!1209012 m!1115129))

(assert (=> b!1209012 m!1115131))

(assert (=> b!1208687 d!133547))

(assert (=> b!1208740 d!133461))

(declare-fun d!133549 () Bool)

(assert (=> d!133549 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548178) k0!934))))

(declare-fun lt!548519 () Unit!39973)

(assert (=> d!133549 (= lt!548519 (choose!1810 (toList!8885 lt!548178) k0!934))))

(declare-fun e!686702 () Bool)

(assert (=> d!133549 e!686702))

(declare-fun res!803428 () Bool)

(assert (=> d!133549 (=> (not res!803428) (not e!686702))))

(assert (=> d!133549 (= res!803428 (isStrictlySorted!717 (toList!8885 lt!548178)))))

(assert (=> d!133549 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548178) k0!934) lt!548519)))

(declare-fun b!1209013 () Bool)

(assert (=> b!1209013 (= e!686702 (containsKey!594 (toList!8885 lt!548178) k0!934))))

(assert (= (and d!133549 res!803428) b!1209013))

(assert (=> d!133549 m!1114669))

(assert (=> d!133549 m!1114669))

(assert (=> d!133549 m!1114671))

(declare-fun m!1115133 () Bool)

(assert (=> d!133549 m!1115133))

(declare-fun m!1115135 () Bool)

(assert (=> d!133549 m!1115135))

(assert (=> b!1209013 m!1114665))

(assert (=> b!1208759 d!133549))

(assert (=> b!1208759 d!133531))

(assert (=> b!1208759 d!133533))

(declare-fun d!133551 () Bool)

(declare-fun e!686704 () Bool)

(assert (=> d!133551 e!686704))

(declare-fun res!803429 () Bool)

(assert (=> d!133551 (=> res!803429 e!686704)))

(declare-fun lt!548520 () Bool)

(assert (=> d!133551 (= res!803429 (not lt!548520))))

(declare-fun lt!548522 () Bool)

(assert (=> d!133551 (= lt!548520 lt!548522)))

(declare-fun lt!548523 () Unit!39973)

(declare-fun e!686703 () Unit!39973)

(assert (=> d!133551 (= lt!548523 e!686703)))

(declare-fun c!119134 () Bool)

(assert (=> d!133551 (= c!119134 lt!548522)))

(assert (=> d!133551 (= lt!548522 (containsKey!594 (toList!8885 (+!4047 lt!548382 (tuple2!19763 lt!548388 lt!548386))) lt!548384))))

(assert (=> d!133551 (= (contains!6966 (+!4047 lt!548382 (tuple2!19763 lt!548388 lt!548386)) lt!548384) lt!548520)))

(declare-fun b!1209014 () Bool)

(declare-fun lt!548521 () Unit!39973)

(assert (=> b!1209014 (= e!686703 lt!548521)))

(assert (=> b!1209014 (= lt!548521 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 (+!4047 lt!548382 (tuple2!19763 lt!548388 lt!548386))) lt!548384))))

(assert (=> b!1209014 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548382 (tuple2!19763 lt!548388 lt!548386))) lt!548384))))

(declare-fun b!1209015 () Bool)

(declare-fun Unit!39995 () Unit!39973)

(assert (=> b!1209015 (= e!686703 Unit!39995)))

(declare-fun b!1209016 () Bool)

(assert (=> b!1209016 (= e!686704 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548382 (tuple2!19763 lt!548388 lt!548386))) lt!548384)))))

(assert (= (and d!133551 c!119134) b!1209014))

(assert (= (and d!133551 (not c!119134)) b!1209015))

(assert (= (and d!133551 (not res!803429)) b!1209016))

(declare-fun m!1115137 () Bool)

(assert (=> d!133551 m!1115137))

(declare-fun m!1115139 () Bool)

(assert (=> b!1209014 m!1115139))

(declare-fun m!1115141 () Bool)

(assert (=> b!1209014 m!1115141))

(assert (=> b!1209014 m!1115141))

(declare-fun m!1115143 () Bool)

(assert (=> b!1209014 m!1115143))

(assert (=> b!1209016 m!1115141))

(assert (=> b!1209016 m!1115141))

(assert (=> b!1209016 m!1115143))

(assert (=> b!1208797 d!133551))

(declare-fun d!133553 () Bool)

(declare-fun e!686705 () Bool)

(assert (=> d!133553 e!686705))

(declare-fun res!803431 () Bool)

(assert (=> d!133553 (=> (not res!803431) (not e!686705))))

(declare-fun lt!548526 () ListLongMap!17739)

(assert (=> d!133553 (= res!803431 (contains!6966 lt!548526 (_1!9892 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!548527 () List!26569)

(assert (=> d!133553 (= lt!548526 (ListLongMap!17740 lt!548527))))

(declare-fun lt!548524 () Unit!39973)

(declare-fun lt!548525 () Unit!39973)

(assert (=> d!133553 (= lt!548524 lt!548525)))

(assert (=> d!133553 (= (getValueByKey!632 lt!548527 (_1!9892 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!682 (_2!9892 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133553 (= lt!548525 (lemmaContainsTupThenGetReturnValue!314 lt!548527 (_1!9892 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9892 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133553 (= lt!548527 (insertStrictlySorted!407 (toList!8885 call!59047) (_1!9892 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9892 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133553 (= (+!4047 call!59047 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!548526)))

(declare-fun b!1209017 () Bool)

(declare-fun res!803430 () Bool)

(assert (=> b!1209017 (=> (not res!803430) (not e!686705))))

(assert (=> b!1209017 (= res!803430 (= (getValueByKey!632 (toList!8885 lt!548526) (_1!9892 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!682 (_2!9892 (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1209018 () Bool)

(assert (=> b!1209018 (= e!686705 (contains!6969 (toList!8885 lt!548526) (tuple2!19763 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 lt!548180) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133553 res!803431) b!1209017))

(assert (= (and b!1209017 res!803430) b!1209018))

(declare-fun m!1115145 () Bool)

(assert (=> d!133553 m!1115145))

(declare-fun m!1115147 () Bool)

(assert (=> d!133553 m!1115147))

(declare-fun m!1115149 () Bool)

(assert (=> d!133553 m!1115149))

(declare-fun m!1115151 () Bool)

(assert (=> d!133553 m!1115151))

(declare-fun m!1115153 () Bool)

(assert (=> b!1209017 m!1115153))

(declare-fun m!1115155 () Bool)

(assert (=> b!1209018 m!1115155))

(assert (=> b!1208797 d!133553))

(declare-fun d!133555 () Bool)

(assert (=> d!133555 (not (contains!6966 (+!4047 lt!548382 (tuple2!19763 lt!548388 lt!548386)) lt!548384))))

(declare-fun lt!548528 () Unit!39973)

(assert (=> d!133555 (= lt!548528 (choose!1811 lt!548382 lt!548388 lt!548386 lt!548384))))

(declare-fun e!686706 () Bool)

(assert (=> d!133555 e!686706))

(declare-fun res!803432 () Bool)

(assert (=> d!133555 (=> (not res!803432) (not e!686706))))

(assert (=> d!133555 (= res!803432 (not (contains!6966 lt!548382 lt!548384)))))

(assert (=> d!133555 (= (addStillNotContains!295 lt!548382 lt!548388 lt!548386 lt!548384) lt!548528)))

(declare-fun b!1209019 () Bool)

(assert (=> b!1209019 (= e!686706 (not (= lt!548388 lt!548384)))))

(assert (= (and d!133555 res!803432) b!1209019))

(assert (=> d!133555 m!1114707))

(assert (=> d!133555 m!1114707))

(assert (=> d!133555 m!1114713))

(declare-fun m!1115157 () Bool)

(assert (=> d!133555 m!1115157))

(declare-fun m!1115159 () Bool)

(assert (=> d!133555 m!1115159))

(assert (=> b!1208797 d!133555))

(declare-fun d!133557 () Bool)

(declare-fun e!686707 () Bool)

(assert (=> d!133557 e!686707))

(declare-fun res!803434 () Bool)

(assert (=> d!133557 (=> (not res!803434) (not e!686707))))

(declare-fun lt!548531 () ListLongMap!17739)

(assert (=> d!133557 (= res!803434 (contains!6966 lt!548531 (_1!9892 (tuple2!19763 lt!548388 lt!548386))))))

(declare-fun lt!548532 () List!26569)

(assert (=> d!133557 (= lt!548531 (ListLongMap!17740 lt!548532))))

(declare-fun lt!548529 () Unit!39973)

(declare-fun lt!548530 () Unit!39973)

(assert (=> d!133557 (= lt!548529 lt!548530)))

(assert (=> d!133557 (= (getValueByKey!632 lt!548532 (_1!9892 (tuple2!19763 lt!548388 lt!548386))) (Some!682 (_2!9892 (tuple2!19763 lt!548388 lt!548386))))))

(assert (=> d!133557 (= lt!548530 (lemmaContainsTupThenGetReturnValue!314 lt!548532 (_1!9892 (tuple2!19763 lt!548388 lt!548386)) (_2!9892 (tuple2!19763 lt!548388 lt!548386))))))

(assert (=> d!133557 (= lt!548532 (insertStrictlySorted!407 (toList!8885 lt!548382) (_1!9892 (tuple2!19763 lt!548388 lt!548386)) (_2!9892 (tuple2!19763 lt!548388 lt!548386))))))

(assert (=> d!133557 (= (+!4047 lt!548382 (tuple2!19763 lt!548388 lt!548386)) lt!548531)))

(declare-fun b!1209020 () Bool)

(declare-fun res!803433 () Bool)

(assert (=> b!1209020 (=> (not res!803433) (not e!686707))))

(assert (=> b!1209020 (= res!803433 (= (getValueByKey!632 (toList!8885 lt!548531) (_1!9892 (tuple2!19763 lt!548388 lt!548386))) (Some!682 (_2!9892 (tuple2!19763 lt!548388 lt!548386)))))))

(declare-fun b!1209021 () Bool)

(assert (=> b!1209021 (= e!686707 (contains!6969 (toList!8885 lt!548531) (tuple2!19763 lt!548388 lt!548386)))))

(assert (= (and d!133557 res!803434) b!1209020))

(assert (= (and b!1209020 res!803433) b!1209021))

(declare-fun m!1115161 () Bool)

(assert (=> d!133557 m!1115161))

(declare-fun m!1115163 () Bool)

(assert (=> d!133557 m!1115163))

(declare-fun m!1115165 () Bool)

(assert (=> d!133557 m!1115165))

(declare-fun m!1115167 () Bool)

(assert (=> d!133557 m!1115167))

(declare-fun m!1115169 () Bool)

(assert (=> b!1209020 m!1115169))

(declare-fun m!1115171 () Bool)

(assert (=> b!1209021 m!1115171))

(assert (=> b!1208797 d!133557))

(assert (=> b!1208797 d!133513))

(assert (=> b!1208784 d!133459))

(assert (=> b!1208683 d!133507))

(assert (=> b!1208779 d!133465))

(assert (=> b!1208811 d!133473))

(assert (=> b!1208811 d!133475))

(declare-fun d!133559 () Bool)

(assert (=> d!133559 (= (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208685 d!133559))

(declare-fun d!133561 () Bool)

(assert (=> d!133561 (arrayContainsKey!0 lt!548177 lt!548366 #b00000000000000000000000000000000)))

(declare-fun lt!548533 () Unit!39973)

(assert (=> d!133561 (= lt!548533 (choose!13 lt!548177 lt!548366 #b00000000000000000000000000000000))))

(assert (=> d!133561 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!133561 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!548177 lt!548366 #b00000000000000000000000000000000) lt!548533)))

(declare-fun bs!34158 () Bool)

(assert (= bs!34158 d!133561))

(assert (=> bs!34158 m!1114661))

(declare-fun m!1115173 () Bool)

(assert (=> bs!34158 m!1115173))

(assert (=> b!1208758 d!133561))

(declare-fun d!133563 () Bool)

(declare-fun res!803435 () Bool)

(declare-fun e!686708 () Bool)

(assert (=> d!133563 (=> res!803435 e!686708)))

(assert (=> d!133563 (= res!803435 (= (select (arr!37708 lt!548177) #b00000000000000000000000000000000) lt!548366))))

(assert (=> d!133563 (= (arrayContainsKey!0 lt!548177 lt!548366 #b00000000000000000000000000000000) e!686708)))

(declare-fun b!1209022 () Bool)

(declare-fun e!686709 () Bool)

(assert (=> b!1209022 (= e!686708 e!686709)))

(declare-fun res!803436 () Bool)

(assert (=> b!1209022 (=> (not res!803436) (not e!686709))))

(assert (=> b!1209022 (= res!803436 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(declare-fun b!1209023 () Bool)

(assert (=> b!1209023 (= e!686709 (arrayContainsKey!0 lt!548177 lt!548366 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133563 (not res!803435)) b!1209022))

(assert (= (and b!1209022 res!803436) b!1209023))

(assert (=> d!133563 m!1114653))

(declare-fun m!1115175 () Bool)

(assert (=> b!1209023 m!1115175))

(assert (=> b!1208758 d!133563))

(declare-fun b!1209036 () Bool)

(declare-fun e!686717 () SeekEntryResult!9894)

(declare-fun lt!548540 () SeekEntryResult!9894)

(assert (=> b!1209036 (= e!686717 (MissingZero!9894 (index!41949 lt!548540)))))

(declare-fun b!1209037 () Bool)

(declare-fun e!686718 () SeekEntryResult!9894)

(declare-fun e!686716 () SeekEntryResult!9894)

(assert (=> b!1209037 (= e!686718 e!686716)))

(declare-fun lt!548541 () (_ BitVec 64))

(assert (=> b!1209037 (= lt!548541 (select (arr!37708 lt!548177) (index!41949 lt!548540)))))

(declare-fun c!119141 () Bool)

(assert (=> b!1209037 (= c!119141 (= lt!548541 (select (arr!37708 lt!548177) #b00000000000000000000000000000000)))))

(declare-fun d!133565 () Bool)

(declare-fun lt!548542 () SeekEntryResult!9894)

(assert (=> d!133565 (and (or ((_ is Undefined!9894) lt!548542) (not ((_ is Found!9894) lt!548542)) (and (bvsge (index!41948 lt!548542) #b00000000000000000000000000000000) (bvslt (index!41948 lt!548542) (size!38245 lt!548177)))) (or ((_ is Undefined!9894) lt!548542) ((_ is Found!9894) lt!548542) (not ((_ is MissingZero!9894) lt!548542)) (and (bvsge (index!41947 lt!548542) #b00000000000000000000000000000000) (bvslt (index!41947 lt!548542) (size!38245 lt!548177)))) (or ((_ is Undefined!9894) lt!548542) ((_ is Found!9894) lt!548542) ((_ is MissingZero!9894) lt!548542) (not ((_ is MissingVacant!9894) lt!548542)) (and (bvsge (index!41950 lt!548542) #b00000000000000000000000000000000) (bvslt (index!41950 lt!548542) (size!38245 lt!548177)))) (or ((_ is Undefined!9894) lt!548542) (ite ((_ is Found!9894) lt!548542) (= (select (arr!37708 lt!548177) (index!41948 lt!548542)) (select (arr!37708 lt!548177) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9894) lt!548542) (= (select (arr!37708 lt!548177) (index!41947 lt!548542)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9894) lt!548542) (= (select (arr!37708 lt!548177) (index!41950 lt!548542)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133565 (= lt!548542 e!686718)))

(declare-fun c!119142 () Bool)

(assert (=> d!133565 (= c!119142 (and ((_ is Intermediate!9894) lt!548540) (undefined!10706 lt!548540)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!78149 (_ BitVec 32)) SeekEntryResult!9894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!133565 (= lt!548540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37708 lt!548177) #b00000000000000000000000000000000) mask!1564) (select (arr!37708 lt!548177) #b00000000000000000000000000000000) lt!548177 mask!1564))))

(assert (=> d!133565 (validMask!0 mask!1564)))

(assert (=> d!133565 (= (seekEntryOrOpen!0 (select (arr!37708 lt!548177) #b00000000000000000000000000000000) lt!548177 mask!1564) lt!548542)))

(declare-fun b!1209038 () Bool)

(assert (=> b!1209038 (= e!686718 Undefined!9894)))

(declare-fun b!1209039 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!78149 (_ BitVec 32)) SeekEntryResult!9894)

(assert (=> b!1209039 (= e!686717 (seekKeyOrZeroReturnVacant!0 (x!106558 lt!548540) (index!41949 lt!548540) (index!41949 lt!548540) (select (arr!37708 lt!548177) #b00000000000000000000000000000000) lt!548177 mask!1564))))

(declare-fun b!1209040 () Bool)

(assert (=> b!1209040 (= e!686716 (Found!9894 (index!41949 lt!548540)))))

(declare-fun b!1209041 () Bool)

(declare-fun c!119143 () Bool)

(assert (=> b!1209041 (= c!119143 (= lt!548541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1209041 (= e!686716 e!686717)))

(assert (= (and d!133565 c!119142) b!1209038))

(assert (= (and d!133565 (not c!119142)) b!1209037))

(assert (= (and b!1209037 c!119141) b!1209040))

(assert (= (and b!1209037 (not c!119141)) b!1209041))

(assert (= (and b!1209041 c!119143) b!1209036))

(assert (= (and b!1209041 (not c!119143)) b!1209039))

(declare-fun m!1115177 () Bool)

(assert (=> b!1209037 m!1115177))

(declare-fun m!1115179 () Bool)

(assert (=> d!133565 m!1115179))

(assert (=> d!133565 m!1114367))

(assert (=> d!133565 m!1114653))

(declare-fun m!1115181 () Bool)

(assert (=> d!133565 m!1115181))

(declare-fun m!1115183 () Bool)

(assert (=> d!133565 m!1115183))

(assert (=> d!133565 m!1115181))

(assert (=> d!133565 m!1114653))

(declare-fun m!1115185 () Bool)

(assert (=> d!133565 m!1115185))

(declare-fun m!1115187 () Bool)

(assert (=> d!133565 m!1115187))

(assert (=> b!1209039 m!1114653))

(declare-fun m!1115189 () Bool)

(assert (=> b!1209039 m!1115189))

(assert (=> b!1208758 d!133565))

(declare-fun d!133567 () Bool)

(declare-fun e!686720 () Bool)

(assert (=> d!133567 e!686720))

(declare-fun res!803437 () Bool)

(assert (=> d!133567 (=> res!803437 e!686720)))

(declare-fun lt!548543 () Bool)

(assert (=> d!133567 (= res!803437 (not lt!548543))))

(declare-fun lt!548545 () Bool)

(assert (=> d!133567 (= lt!548543 lt!548545)))

(declare-fun lt!548546 () Unit!39973)

(declare-fun e!686719 () Unit!39973)

(assert (=> d!133567 (= lt!548546 e!686719)))

(declare-fun c!119144 () Bool)

(assert (=> d!133567 (= c!119144 lt!548545)))

(assert (=> d!133567 (= lt!548545 (containsKey!594 (toList!8885 lt!548346) (select (arr!37708 lt!548177) from!1455)))))

(assert (=> d!133567 (= (contains!6966 lt!548346 (select (arr!37708 lt!548177) from!1455)) lt!548543)))

(declare-fun b!1209042 () Bool)

(declare-fun lt!548544 () Unit!39973)

(assert (=> b!1209042 (= e!686719 lt!548544)))

(assert (=> b!1209042 (= lt!548544 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548346) (select (arr!37708 lt!548177) from!1455)))))

(assert (=> b!1209042 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548346) (select (arr!37708 lt!548177) from!1455)))))

(declare-fun b!1209043 () Bool)

(declare-fun Unit!39996 () Unit!39973)

(assert (=> b!1209043 (= e!686719 Unit!39996)))

(declare-fun b!1209044 () Bool)

(assert (=> b!1209044 (= e!686720 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548346) (select (arr!37708 lt!548177) from!1455))))))

(assert (= (and d!133567 c!119144) b!1209042))

(assert (= (and d!133567 (not c!119144)) b!1209043))

(assert (= (and d!133567 (not res!803437)) b!1209044))

(assert (=> d!133567 m!1114601))

(declare-fun m!1115191 () Bool)

(assert (=> d!133567 m!1115191))

(assert (=> b!1209042 m!1114601))

(declare-fun m!1115193 () Bool)

(assert (=> b!1209042 m!1115193))

(assert (=> b!1209042 m!1114601))

(assert (=> b!1209042 m!1114927))

(assert (=> b!1209042 m!1114927))

(declare-fun m!1115195 () Bool)

(assert (=> b!1209042 m!1115195))

(assert (=> b!1209044 m!1114601))

(assert (=> b!1209044 m!1114927))

(assert (=> b!1209044 m!1114927))

(assert (=> b!1209044 m!1115195))

(assert (=> b!1208732 d!133567))

(declare-fun d!133569 () Bool)

(declare-fun lt!548549 () Bool)

(declare-fun content!547 (List!26570) (InoxSet (_ BitVec 64)))

(assert (=> d!133569 (= lt!548549 (select (content!547 Nil!26567) (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun e!686725 () Bool)

(assert (=> d!133569 (= lt!548549 e!686725)))

(declare-fun res!803442 () Bool)

(assert (=> d!133569 (=> (not res!803442) (not e!686725))))

(assert (=> d!133569 (= res!803442 ((_ is Cons!26566) Nil!26567))))

(assert (=> d!133569 (= (contains!6970 Nil!26567 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)) lt!548549)))

(declare-fun b!1209049 () Bool)

(declare-fun e!686726 () Bool)

(assert (=> b!1209049 (= e!686725 e!686726)))

(declare-fun res!803443 () Bool)

(assert (=> b!1209049 (=> res!803443 e!686726)))

(assert (=> b!1209049 (= res!803443 (= (h!27784 Nil!26567) (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1209050 () Bool)

(assert (=> b!1209050 (= e!686726 (contains!6970 (t!39505 Nil!26567) (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133569 res!803442) b!1209049))

(assert (= (and b!1209049 (not res!803443)) b!1209050))

(declare-fun m!1115197 () Bool)

(assert (=> d!133569 m!1115197))

(assert (=> d!133569 m!1114573))

(declare-fun m!1115199 () Bool)

(assert (=> d!133569 m!1115199))

(assert (=> b!1209050 m!1114573))

(declare-fun m!1115201 () Bool)

(assert (=> b!1209050 m!1115201))

(assert (=> b!1208773 d!133569))

(declare-fun d!133571 () Bool)

(assert (=> d!133571 (= (apply!974 lt!548302 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19266 (getValueByKey!632 (toList!8885 lt!548302) (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34159 () Bool)

(assert (= bs!34159 d!133571))

(assert (=> bs!34159 m!1114525))

(assert (=> bs!34159 m!1115129))

(assert (=> bs!34159 m!1115129))

(declare-fun m!1115203 () Bool)

(assert (=> bs!34159 m!1115203))

(assert (=> b!1208682 d!133571))

(assert (=> b!1208682 d!133491))

(assert (=> b!1208735 d!133459))

(declare-fun d!133573 () Bool)

(declare-fun lt!548550 () Bool)

(assert (=> d!133573 (= lt!548550 (select (content!547 Nil!26567) (select (arr!37708 lt!548177) #b00000000000000000000000000000000)))))

(declare-fun e!686727 () Bool)

(assert (=> d!133573 (= lt!548550 e!686727)))

(declare-fun res!803444 () Bool)

(assert (=> d!133573 (=> (not res!803444) (not e!686727))))

(assert (=> d!133573 (= res!803444 ((_ is Cons!26566) Nil!26567))))

(assert (=> d!133573 (= (contains!6970 Nil!26567 (select (arr!37708 lt!548177) #b00000000000000000000000000000000)) lt!548550)))

(declare-fun b!1209051 () Bool)

(declare-fun e!686728 () Bool)

(assert (=> b!1209051 (= e!686727 e!686728)))

(declare-fun res!803445 () Bool)

(assert (=> b!1209051 (=> res!803445 e!686728)))

(assert (=> b!1209051 (= res!803445 (= (h!27784 Nil!26567) (select (arr!37708 lt!548177) #b00000000000000000000000000000000)))))

(declare-fun b!1209052 () Bool)

(assert (=> b!1209052 (= e!686728 (contains!6970 (t!39505 Nil!26567) (select (arr!37708 lt!548177) #b00000000000000000000000000000000)))))

(assert (= (and d!133573 res!803444) b!1209051))

(assert (= (and b!1209051 (not res!803445)) b!1209052))

(assert (=> d!133573 m!1115197))

(assert (=> d!133573 m!1114653))

(declare-fun m!1115205 () Bool)

(assert (=> d!133573 m!1115205))

(assert (=> b!1209052 m!1114653))

(declare-fun m!1115207 () Bool)

(assert (=> b!1209052 m!1115207))

(assert (=> b!1208778 d!133573))

(declare-fun d!133575 () Bool)

(declare-fun lt!548551 () Bool)

(assert (=> d!133575 (= lt!548551 (select (content!547 Nil!26567) (select (arr!37708 _keys!1208) from!1455)))))

(declare-fun e!686729 () Bool)

(assert (=> d!133575 (= lt!548551 e!686729)))

(declare-fun res!803446 () Bool)

(assert (=> d!133575 (=> (not res!803446) (not e!686729))))

(assert (=> d!133575 (= res!803446 ((_ is Cons!26566) Nil!26567))))

(assert (=> d!133575 (= (contains!6970 Nil!26567 (select (arr!37708 _keys!1208) from!1455)) lt!548551)))

(declare-fun b!1209053 () Bool)

(declare-fun e!686730 () Bool)

(assert (=> b!1209053 (= e!686729 e!686730)))

(declare-fun res!803447 () Bool)

(assert (=> b!1209053 (=> res!803447 e!686730)))

(assert (=> b!1209053 (= res!803447 (= (h!27784 Nil!26567) (select (arr!37708 _keys!1208) from!1455)))))

(declare-fun b!1209054 () Bool)

(assert (=> b!1209054 (= e!686730 (contains!6970 (t!39505 Nil!26567) (select (arr!37708 _keys!1208) from!1455)))))

(assert (= (and d!133575 res!803446) b!1209053))

(assert (= (and b!1209053 (not res!803447)) b!1209054))

(assert (=> d!133575 m!1115197))

(assert (=> d!133575 m!1114351))

(declare-fun m!1115209 () Bool)

(assert (=> d!133575 m!1115209))

(assert (=> b!1209054 m!1114351))

(declare-fun m!1115211 () Bool)

(assert (=> b!1209054 m!1115211))

(assert (=> b!1208783 d!133575))

(assert (=> b!1208678 d!133559))

(declare-fun d!133577 () Bool)

(declare-fun res!803452 () Bool)

(declare-fun e!686735 () Bool)

(assert (=> d!133577 (=> res!803452 e!686735)))

(assert (=> d!133577 (= res!803452 (and ((_ is Cons!26565) (toList!8885 lt!548178)) (= (_1!9892 (h!27783 (toList!8885 lt!548178))) k0!934)))))

(assert (=> d!133577 (= (containsKey!594 (toList!8885 lt!548178) k0!934) e!686735)))

(declare-fun b!1209059 () Bool)

(declare-fun e!686736 () Bool)

(assert (=> b!1209059 (= e!686735 e!686736)))

(declare-fun res!803453 () Bool)

(assert (=> b!1209059 (=> (not res!803453) (not e!686736))))

(assert (=> b!1209059 (= res!803453 (and (or (not ((_ is Cons!26565) (toList!8885 lt!548178))) (bvsle (_1!9892 (h!27783 (toList!8885 lt!548178))) k0!934)) ((_ is Cons!26565) (toList!8885 lt!548178)) (bvslt (_1!9892 (h!27783 (toList!8885 lt!548178))) k0!934)))))

(declare-fun b!1209060 () Bool)

(assert (=> b!1209060 (= e!686736 (containsKey!594 (t!39504 (toList!8885 lt!548178)) k0!934))))

(assert (= (and d!133577 (not res!803452)) b!1209059))

(assert (= (and b!1209059 res!803453) b!1209060))

(declare-fun m!1115213 () Bool)

(assert (=> b!1209060 m!1115213))

(assert (=> d!133425 d!133577))

(declare-fun d!133579 () Bool)

(declare-fun e!686738 () Bool)

(assert (=> d!133579 e!686738))

(declare-fun res!803454 () Bool)

(assert (=> d!133579 (=> res!803454 e!686738)))

(declare-fun lt!548552 () Bool)

(assert (=> d!133579 (= res!803454 (not lt!548552))))

(declare-fun lt!548554 () Bool)

(assert (=> d!133579 (= lt!548552 lt!548554)))

(declare-fun lt!548555 () Unit!39973)

(declare-fun e!686737 () Unit!39973)

(assert (=> d!133579 (= lt!548555 e!686737)))

(declare-fun c!119145 () Bool)

(assert (=> d!133579 (= c!119145 lt!548554)))

(assert (=> d!133579 (= lt!548554 (containsKey!594 (toList!8885 lt!548383) (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!133579 (= (contains!6966 lt!548383 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455))) lt!548552)))

(declare-fun b!1209061 () Bool)

(declare-fun lt!548553 () Unit!39973)

(assert (=> b!1209061 (= e!686737 lt!548553)))

(assert (=> b!1209061 (= lt!548553 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548383) (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1209061 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548383) (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1209062 () Bool)

(declare-fun Unit!39997 () Unit!39973)

(assert (=> b!1209062 (= e!686737 Unit!39997)))

(declare-fun b!1209063 () Bool)

(assert (=> b!1209063 (= e!686738 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548383) (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!133579 c!119145) b!1209061))

(assert (= (and d!133579 (not c!119145)) b!1209062))

(assert (= (and d!133579 (not res!803454)) b!1209063))

(assert (=> d!133579 m!1114709))

(declare-fun m!1115215 () Bool)

(assert (=> d!133579 m!1115215))

(assert (=> b!1209061 m!1114709))

(declare-fun m!1115217 () Bool)

(assert (=> b!1209061 m!1115217))

(assert (=> b!1209061 m!1114709))

(assert (=> b!1209061 m!1114965))

(assert (=> b!1209061 m!1114965))

(declare-fun m!1115219 () Bool)

(assert (=> b!1209061 m!1115219))

(assert (=> b!1209063 m!1114709))

(assert (=> b!1209063 m!1114965))

(assert (=> b!1209063 m!1114965))

(assert (=> b!1209063 m!1115219))

(assert (=> b!1208808 d!133579))

(declare-fun d!133581 () Bool)

(assert (=> d!133581 (= (validKeyInArray!0 (select (arr!37708 lt!548177) from!1455)) (and (not (= (select (arr!37708 lt!548177) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37708 lt!548177) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208730 d!133581))

(declare-fun d!133583 () Bool)

(declare-fun isEmpty!993 (List!26569) Bool)

(assert (=> d!133583 (= (isEmpty!991 lt!548353) (isEmpty!993 (toList!8885 lt!548353)))))

(declare-fun bs!34160 () Bool)

(assert (= bs!34160 d!133583))

(declare-fun m!1115221 () Bool)

(assert (=> bs!34160 m!1115221))

(assert (=> b!1208734 d!133583))

(declare-fun d!133585 () Bool)

(assert (=> d!133585 (arrayContainsKey!0 _keys!1208 lt!548380 #b00000000000000000000000000000000)))

(declare-fun lt!548556 () Unit!39973)

(assert (=> d!133585 (= lt!548556 (choose!13 _keys!1208 lt!548380 #b00000000000000000000000000000000))))

(assert (=> d!133585 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!133585 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!548380 #b00000000000000000000000000000000) lt!548556)))

(declare-fun bs!34161 () Bool)

(assert (= bs!34161 d!133585))

(assert (=> bs!34161 m!1114701))

(declare-fun m!1115223 () Bool)

(assert (=> bs!34161 m!1115223))

(assert (=> b!1208796 d!133585))

(declare-fun d!133587 () Bool)

(declare-fun res!803455 () Bool)

(declare-fun e!686739 () Bool)

(assert (=> d!133587 (=> res!803455 e!686739)))

(assert (=> d!133587 (= res!803455 (= (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) lt!548380))))

(assert (=> d!133587 (= (arrayContainsKey!0 _keys!1208 lt!548380 #b00000000000000000000000000000000) e!686739)))

(declare-fun b!1209064 () Bool)

(declare-fun e!686740 () Bool)

(assert (=> b!1209064 (= e!686739 e!686740)))

(declare-fun res!803456 () Bool)

(assert (=> b!1209064 (=> (not res!803456) (not e!686740))))

(assert (=> b!1209064 (= res!803456 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun b!1209065 () Bool)

(assert (=> b!1209065 (= e!686740 (arrayContainsKey!0 _keys!1208 lt!548380 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133587 (not res!803455)) b!1209064))

(assert (= (and b!1209064 res!803456) b!1209065))

(assert (=> d!133587 m!1114573))

(declare-fun m!1115225 () Bool)

(assert (=> b!1209065 m!1115225))

(assert (=> b!1208796 d!133587))

(declare-fun b!1209066 () Bool)

(declare-fun e!686742 () SeekEntryResult!9894)

(declare-fun lt!548557 () SeekEntryResult!9894)

(assert (=> b!1209066 (= e!686742 (MissingZero!9894 (index!41949 lt!548557)))))

(declare-fun b!1209067 () Bool)

(declare-fun e!686743 () SeekEntryResult!9894)

(declare-fun e!686741 () SeekEntryResult!9894)

(assert (=> b!1209067 (= e!686743 e!686741)))

(declare-fun lt!548558 () (_ BitVec 64))

(assert (=> b!1209067 (= lt!548558 (select (arr!37708 _keys!1208) (index!41949 lt!548557)))))

(declare-fun c!119146 () Bool)

(assert (=> b!1209067 (= c!119146 (= lt!548558 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133589 () Bool)

(declare-fun lt!548559 () SeekEntryResult!9894)

(assert (=> d!133589 (and (or ((_ is Undefined!9894) lt!548559) (not ((_ is Found!9894) lt!548559)) (and (bvsge (index!41948 lt!548559) #b00000000000000000000000000000000) (bvslt (index!41948 lt!548559) (size!38245 _keys!1208)))) (or ((_ is Undefined!9894) lt!548559) ((_ is Found!9894) lt!548559) (not ((_ is MissingZero!9894) lt!548559)) (and (bvsge (index!41947 lt!548559) #b00000000000000000000000000000000) (bvslt (index!41947 lt!548559) (size!38245 _keys!1208)))) (or ((_ is Undefined!9894) lt!548559) ((_ is Found!9894) lt!548559) ((_ is MissingZero!9894) lt!548559) (not ((_ is MissingVacant!9894) lt!548559)) (and (bvsge (index!41950 lt!548559) #b00000000000000000000000000000000) (bvslt (index!41950 lt!548559) (size!38245 _keys!1208)))) (or ((_ is Undefined!9894) lt!548559) (ite ((_ is Found!9894) lt!548559) (= (select (arr!37708 _keys!1208) (index!41948 lt!548559)) (select (arr!37708 _keys!1208) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9894) lt!548559) (= (select (arr!37708 _keys!1208) (index!41947 lt!548559)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9894) lt!548559) (= (select (arr!37708 _keys!1208) (index!41950 lt!548559)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133589 (= lt!548559 e!686743)))

(declare-fun c!119147 () Bool)

(assert (=> d!133589 (= c!119147 (and ((_ is Intermediate!9894) lt!548557) (undefined!10706 lt!548557)))))

(assert (=> d!133589 (= lt!548557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) mask!1564) (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (=> d!133589 (validMask!0 mask!1564)))

(assert (=> d!133589 (= (seekEntryOrOpen!0 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) lt!548559)))

(declare-fun b!1209068 () Bool)

(assert (=> b!1209068 (= e!686743 Undefined!9894)))

(declare-fun b!1209069 () Bool)

(assert (=> b!1209069 (= e!686742 (seekKeyOrZeroReturnVacant!0 (x!106558 lt!548557) (index!41949 lt!548557) (index!41949 lt!548557) (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(declare-fun b!1209070 () Bool)

(assert (=> b!1209070 (= e!686741 (Found!9894 (index!41949 lt!548557)))))

(declare-fun b!1209071 () Bool)

(declare-fun c!119148 () Bool)

(assert (=> b!1209071 (= c!119148 (= lt!548558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1209071 (= e!686741 e!686742)))

(assert (= (and d!133589 c!119147) b!1209068))

(assert (= (and d!133589 (not c!119147)) b!1209067))

(assert (= (and b!1209067 c!119146) b!1209070))

(assert (= (and b!1209067 (not c!119146)) b!1209071))

(assert (= (and b!1209071 c!119148) b!1209066))

(assert (= (and b!1209071 (not c!119148)) b!1209069))

(declare-fun m!1115227 () Bool)

(assert (=> b!1209067 m!1115227))

(declare-fun m!1115229 () Bool)

(assert (=> d!133589 m!1115229))

(assert (=> d!133589 m!1114367))

(assert (=> d!133589 m!1114573))

(declare-fun m!1115231 () Bool)

(assert (=> d!133589 m!1115231))

(declare-fun m!1115233 () Bool)

(assert (=> d!133589 m!1115233))

(assert (=> d!133589 m!1115231))

(assert (=> d!133589 m!1114573))

(declare-fun m!1115235 () Bool)

(assert (=> d!133589 m!1115235))

(declare-fun m!1115237 () Bool)

(assert (=> d!133589 m!1115237))

(assert (=> b!1209069 m!1114573))

(declare-fun m!1115239 () Bool)

(assert (=> b!1209069 m!1115239))

(assert (=> b!1208796 d!133589))

(declare-fun d!133591 () Bool)

(assert (=> d!133591 (= (isEmpty!991 lt!548302) (isEmpty!993 (toList!8885 lt!548302)))))

(declare-fun bs!34162 () Bool)

(assert (= bs!34162 d!133591))

(declare-fun m!1115241 () Bool)

(assert (=> bs!34162 m!1115241))

(assert (=> b!1208677 d!133591))

(declare-fun d!133593 () Bool)

(assert (=> d!133593 (= (validKeyInArray!0 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208806 d!133593))

(declare-fun d!133595 () Bool)

(declare-fun e!686745 () Bool)

(assert (=> d!133595 e!686745))

(declare-fun res!803457 () Bool)

(assert (=> d!133595 (=> res!803457 e!686745)))

(declare-fun lt!548560 () Bool)

(assert (=> d!133595 (= res!803457 (not lt!548560))))

(declare-fun lt!548562 () Bool)

(assert (=> d!133595 (= lt!548560 lt!548562)))

(declare-fun lt!548563 () Unit!39973)

(declare-fun e!686744 () Unit!39973)

(assert (=> d!133595 (= lt!548563 e!686744)))

(declare-fun c!119149 () Bool)

(assert (=> d!133595 (= c!119149 lt!548562)))

(assert (=> d!133595 (= lt!548562 (containsKey!594 (toList!8885 lt!548353) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133595 (= (contains!6966 lt!548353 #b0000000000000000000000000000000000000000000000000000000000000000) lt!548560)))

(declare-fun b!1209072 () Bool)

(declare-fun lt!548561 () Unit!39973)

(assert (=> b!1209072 (= e!686744 lt!548561)))

(assert (=> b!1209072 (= lt!548561 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548353) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1209072 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548353) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209073 () Bool)

(declare-fun Unit!39998 () Unit!39973)

(assert (=> b!1209073 (= e!686744 Unit!39998)))

(declare-fun b!1209074 () Bool)

(assert (=> b!1209074 (= e!686745 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548353) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133595 c!119149) b!1209072))

(assert (= (and d!133595 (not c!119149)) b!1209073))

(assert (= (and d!133595 (not res!803457)) b!1209074))

(declare-fun m!1115243 () Bool)

(assert (=> d!133595 m!1115243))

(declare-fun m!1115245 () Bool)

(assert (=> b!1209072 m!1115245))

(declare-fun m!1115247 () Bool)

(assert (=> b!1209072 m!1115247))

(assert (=> b!1209072 m!1115247))

(declare-fun m!1115249 () Bool)

(assert (=> b!1209072 m!1115249))

(assert (=> b!1209074 m!1115247))

(assert (=> b!1209074 m!1115247))

(assert (=> b!1209074 m!1115249))

(assert (=> d!133417 d!133595))

(assert (=> d!133417 d!133411))

(declare-fun d!133597 () Bool)

(declare-fun res!803458 () Bool)

(declare-fun e!686746 () Bool)

(assert (=> d!133597 (=> res!803458 e!686746)))

(assert (=> d!133597 (= res!803458 (and ((_ is Cons!26565) (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9892 (h!27783 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!133597 (= (containsKey!594 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!686746)))

(declare-fun b!1209075 () Bool)

(declare-fun e!686747 () Bool)

(assert (=> b!1209075 (= e!686746 e!686747)))

(declare-fun res!803459 () Bool)

(assert (=> b!1209075 (=> (not res!803459) (not e!686747))))

(assert (=> b!1209075 (= res!803459 (and (or (not ((_ is Cons!26565) (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (bvsle (_1!9892 (h!27783 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)) ((_ is Cons!26565) (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (bvslt (_1!9892 (h!27783 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(declare-fun b!1209076 () Bool)

(assert (=> b!1209076 (= e!686747 (containsKey!594 (t!39504 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(assert (= (and d!133597 (not res!803458)) b!1209075))

(assert (= (and b!1209075 res!803459) b!1209076))

(declare-fun m!1115251 () Bool)

(assert (=> b!1209076 m!1115251))

(assert (=> d!133401 d!133597))

(assert (=> b!1208728 d!133523))

(declare-fun d!133599 () Bool)

(declare-fun res!803460 () Bool)

(declare-fun e!686748 () Bool)

(assert (=> d!133599 (=> res!803460 e!686748)))

(assert (=> d!133599 (= res!803460 (and ((_ is Cons!26565) (toList!8885 (ite c!119000 lt!548186 call!58974))) (= (_1!9892 (h!27783 (toList!8885 (ite c!119000 lt!548186 call!58974)))) k0!934)))))

(assert (=> d!133599 (= (containsKey!594 (toList!8885 (ite c!119000 lt!548186 call!58974)) k0!934) e!686748)))

(declare-fun b!1209077 () Bool)

(declare-fun e!686749 () Bool)

(assert (=> b!1209077 (= e!686748 e!686749)))

(declare-fun res!803461 () Bool)

(assert (=> b!1209077 (=> (not res!803461) (not e!686749))))

(assert (=> b!1209077 (= res!803461 (and (or (not ((_ is Cons!26565) (toList!8885 (ite c!119000 lt!548186 call!58974)))) (bvsle (_1!9892 (h!27783 (toList!8885 (ite c!119000 lt!548186 call!58974)))) k0!934)) ((_ is Cons!26565) (toList!8885 (ite c!119000 lt!548186 call!58974))) (bvslt (_1!9892 (h!27783 (toList!8885 (ite c!119000 lt!548186 call!58974)))) k0!934)))))

(declare-fun b!1209078 () Bool)

(assert (=> b!1209078 (= e!686749 (containsKey!594 (t!39504 (toList!8885 (ite c!119000 lt!548186 call!58974))) k0!934))))

(assert (= (and d!133599 (not res!803460)) b!1209077))

(assert (= (and b!1209077 res!803461) b!1209078))

(declare-fun m!1115253 () Bool)

(assert (=> b!1209078 m!1115253))

(assert (=> d!133443 d!133599))

(declare-fun lt!548564 () Bool)

(declare-fun d!133601 () Bool)

(assert (=> d!133601 (= lt!548564 (select (content!546 (toList!8885 lt!548343)) (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!686751 () Bool)

(assert (=> d!133601 (= lt!548564 e!686751)))

(declare-fun res!803463 () Bool)

(assert (=> d!133601 (=> (not res!803463) (not e!686751))))

(assert (=> d!133601 (= res!803463 ((_ is Cons!26565) (toList!8885 lt!548343)))))

(assert (=> d!133601 (= (contains!6969 (toList!8885 lt!548343) (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548564)))

(declare-fun b!1209079 () Bool)

(declare-fun e!686750 () Bool)

(assert (=> b!1209079 (= e!686751 e!686750)))

(declare-fun res!803462 () Bool)

(assert (=> b!1209079 (=> res!803462 e!686750)))

(assert (=> b!1209079 (= res!803462 (= (h!27783 (toList!8885 lt!548343)) (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1209080 () Bool)

(assert (=> b!1209080 (= e!686750 (contains!6969 (t!39504 (toList!8885 lt!548343)) (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!133601 res!803463) b!1209079))

(assert (= (and b!1209079 (not res!803462)) b!1209080))

(declare-fun m!1115255 () Bool)

(assert (=> d!133601 m!1115255))

(declare-fun m!1115257 () Bool)

(assert (=> d!133601 m!1115257))

(declare-fun m!1115259 () Bool)

(assert (=> b!1209080 m!1115259))

(assert (=> b!1208720 d!133601))

(assert (=> b!1208804 d!133535))

(assert (=> d!133407 d!133405))

(declare-fun d!133603 () Bool)

(assert (=> d!133603 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(assert (=> d!133603 true))

(declare-fun _$60!451 () Unit!39973)

(assert (=> d!133603 (= (choose!13 _keys!1208 k0!934 i!673) _$60!451)))

(declare-fun bs!34163 () Bool)

(assert (= bs!34163 d!133603))

(assert (=> bs!34163 m!1114385))

(assert (=> d!133407 d!133603))

(declare-fun d!133605 () Bool)

(assert (=> d!133605 (= (isEmpty!991 lt!548346) (isEmpty!993 (toList!8885 lt!548346)))))

(declare-fun bs!34164 () Bool)

(assert (= bs!34164 d!133605))

(declare-fun m!1115261 () Bool)

(assert (=> bs!34164 m!1115261))

(assert (=> b!1208722 d!133605))

(declare-fun d!133607 () Bool)

(assert (=> d!133607 (= (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)) (not (isEmpty!992 (getValueByKey!632 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))))

(declare-fun bs!34165 () Bool)

(assert (= bs!34165 d!133607))

(assert (=> bs!34165 m!1114557))

(declare-fun m!1115263 () Bool)

(assert (=> bs!34165 m!1115263))

(assert (=> b!1208697 d!133607))

(declare-fun b!1209083 () Bool)

(declare-fun e!686753 () Option!683)

(assert (=> b!1209083 (= e!686753 (getValueByKey!632 (t!39504 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) k0!934))))

(declare-fun b!1209084 () Bool)

(assert (=> b!1209084 (= e!686753 None!681)))

(declare-fun b!1209081 () Bool)

(declare-fun e!686752 () Option!683)

(assert (=> b!1209081 (= e!686752 (Some!682 (_2!9892 (h!27783 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun d!133609 () Bool)

(declare-fun c!119150 () Bool)

(assert (=> d!133609 (= c!119150 (and ((_ is Cons!26565) (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (= (_1!9892 (h!27783 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934)))))

(assert (=> d!133609 (= (getValueByKey!632 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) e!686752)))

(declare-fun b!1209082 () Bool)

(assert (=> b!1209082 (= e!686752 e!686753)))

(declare-fun c!119151 () Bool)

(assert (=> b!1209082 (= c!119151 (and ((_ is Cons!26565) (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (not (= (_1!9892 (h!27783 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) k0!934))))))

(assert (= (and d!133609 c!119150) b!1209081))

(assert (= (and d!133609 (not c!119150)) b!1209082))

(assert (= (and b!1209082 c!119151) b!1209083))

(assert (= (and b!1209082 (not c!119151)) b!1209084))

(declare-fun m!1115265 () Bool)

(assert (=> b!1209083 m!1115265))

(assert (=> b!1208697 d!133609))

(assert (=> d!133433 d!133431))

(declare-fun d!133611 () Bool)

(assert (=> d!133611 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26567)))

(assert (=> d!133611 true))

(declare-fun _$71!186 () Unit!39973)

(assert (=> d!133611 (= (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455) _$71!186)))

(declare-fun bs!34166 () Bool)

(assert (= bs!34166 d!133611))

(assert (=> bs!34166 m!1114343))

(assert (=> d!133433 d!133611))

(assert (=> b!1208723 d!133581))

(assert (=> b!1208794 d!133463))

(declare-fun b!1209085 () Bool)

(declare-fun lt!548570 () Unit!39973)

(declare-fun lt!548568 () Unit!39973)

(assert (=> b!1209085 (= lt!548570 lt!548568)))

(declare-fun lt!548565 () ListLongMap!17739)

(declare-fun lt!548569 () V!46017)

(declare-fun lt!548571 () (_ BitVec 64))

(declare-fun lt!548567 () (_ BitVec 64))

(assert (=> b!1209085 (not (contains!6966 (+!4047 lt!548565 (tuple2!19763 lt!548571 lt!548569)) lt!548567))))

(assert (=> b!1209085 (= lt!548568 (addStillNotContains!295 lt!548565 lt!548571 lt!548569 lt!548567))))

(assert (=> b!1209085 (= lt!548567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1209085 (= lt!548569 (get!19263 (select (arr!37709 (array!78152 (store (arr!37709 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38246 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1209085 (= lt!548571 (select (arr!37708 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!59063 () ListLongMap!17739)

(assert (=> b!1209085 (= lt!548565 call!59063)))

(declare-fun e!686755 () ListLongMap!17739)

(assert (=> b!1209085 (= e!686755 (+!4047 call!59063 (tuple2!19763 (select (arr!37708 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19263 (select (arr!37709 (array!78152 (store (arr!37709 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38246 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!133613 () Bool)

(declare-fun e!686754 () Bool)

(assert (=> d!133613 e!686754))

(declare-fun res!803466 () Bool)

(assert (=> d!133613 (=> (not res!803466) (not e!686754))))

(declare-fun lt!548566 () ListLongMap!17739)

(assert (=> d!133613 (= res!803466 (not (contains!6966 lt!548566 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686758 () ListLongMap!17739)

(assert (=> d!133613 (= lt!548566 e!686758)))

(declare-fun c!119152 () Bool)

(assert (=> d!133613 (= c!119152 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)))))))

(assert (=> d!133613 (validMask!0 mask!1564)))

(assert (=> d!133613 (= (getCurrentListMapNoExtraKeys!5347 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)) (array!78152 (store (arr!37709 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38246 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548566)))

(declare-fun b!1209086 () Bool)

(declare-fun e!686756 () Bool)

(assert (=> b!1209086 (= e!686756 (isEmpty!991 lt!548566))))

(declare-fun bm!59060 () Bool)

(assert (=> bm!59060 (= call!59063 (getCurrentListMapNoExtraKeys!5347 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)) (array!78152 (store (arr!37709 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38246 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1209087 () Bool)

(assert (=> b!1209087 (= e!686758 e!686755)))

(declare-fun c!119154 () Bool)

(assert (=> b!1209087 (= c!119154 (validKeyInArray!0 (select (arr!37708 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1209088 () Bool)

(assert (=> b!1209088 (= e!686755 call!59063)))

(declare-fun b!1209089 () Bool)

(assert (=> b!1209089 (= e!686758 (ListLongMap!17740 Nil!26566))))

(declare-fun b!1209090 () Bool)

(declare-fun e!686757 () Bool)

(assert (=> b!1209090 (= e!686754 e!686757)))

(declare-fun c!119155 () Bool)

(declare-fun e!686759 () Bool)

(assert (=> b!1209090 (= c!119155 e!686759)))

(declare-fun res!803464 () Bool)

(assert (=> b!1209090 (=> (not res!803464) (not e!686759))))

(assert (=> b!1209090 (= res!803464 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)))))))

(declare-fun b!1209091 () Bool)

(assert (=> b!1209091 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)))))))

(assert (=> b!1209091 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (array!78152 (store (arr!37709 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38246 _values!996)))))))

(declare-fun e!686760 () Bool)

(assert (=> b!1209091 (= e!686760 (= (apply!974 lt!548566 (select (arr!37708 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19263 (select (arr!37709 (array!78152 (store (arr!37709 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38246 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1209092 () Bool)

(assert (=> b!1209092 (= e!686756 (= lt!548566 (getCurrentListMapNoExtraKeys!5347 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)) (array!78152 (store (arr!37709 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38246 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1209093 () Bool)

(declare-fun res!803465 () Bool)

(assert (=> b!1209093 (=> (not res!803465) (not e!686754))))

(assert (=> b!1209093 (= res!803465 (not (contains!6966 lt!548566 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1209094 () Bool)

(assert (=> b!1209094 (= e!686759 (validKeyInArray!0 (select (arr!37708 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1209094 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1209095 () Bool)

(assert (=> b!1209095 (= e!686757 e!686756)))

(declare-fun c!119153 () Bool)

(assert (=> b!1209095 (= c!119153 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)))))))

(declare-fun b!1209096 () Bool)

(assert (=> b!1209096 (= e!686757 e!686760)))

(assert (=> b!1209096 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38245 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)))))))

(declare-fun res!803467 () Bool)

(assert (=> b!1209096 (= res!803467 (contains!6966 lt!548566 (select (arr!37708 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1209096 (=> (not res!803467) (not e!686760))))

(assert (= (and d!133613 c!119152) b!1209089))

(assert (= (and d!133613 (not c!119152)) b!1209087))

(assert (= (and b!1209087 c!119154) b!1209085))

(assert (= (and b!1209087 (not c!119154)) b!1209088))

(assert (= (or b!1209085 b!1209088) bm!59060))

(assert (= (and d!133613 res!803466) b!1209093))

(assert (= (and b!1209093 res!803465) b!1209090))

(assert (= (and b!1209090 res!803464) b!1209094))

(assert (= (and b!1209090 c!119155) b!1209096))

(assert (= (and b!1209090 (not c!119155)) b!1209095))

(assert (= (and b!1209096 res!803467) b!1209091))

(assert (= (and b!1209095 c!119153) b!1209092))

(assert (= (and b!1209095 (not c!119153)) b!1209086))

(declare-fun b_lambda!21459 () Bool)

(assert (=> (not b_lambda!21459) (not b!1209085)))

(assert (=> b!1209085 t!39503))

(declare-fun b_and!42979 () Bool)

(assert (= b_and!42977 (and (=> t!39503 result!22105) b_and!42979)))

(declare-fun b_lambda!21461 () Bool)

(assert (=> (not b_lambda!21461) (not b!1209091)))

(assert (=> b!1209091 t!39503))

(declare-fun b_and!42981 () Bool)

(assert (= b_and!42979 (and (=> t!39503 result!22105) b_and!42981)))

(declare-fun m!1115267 () Bool)

(assert (=> bm!59060 m!1115267))

(declare-fun m!1115269 () Bool)

(assert (=> b!1209085 m!1115269))

(declare-fun m!1115271 () Bool)

(assert (=> b!1209085 m!1115271))

(declare-fun m!1115273 () Bool)

(assert (=> b!1209085 m!1115273))

(assert (=> b!1209085 m!1115269))

(declare-fun m!1115275 () Bool)

(assert (=> b!1209085 m!1115275))

(declare-fun m!1115277 () Bool)

(assert (=> b!1209085 m!1115277))

(assert (=> b!1209085 m!1115277))

(assert (=> b!1209085 m!1114379))

(declare-fun m!1115279 () Bool)

(assert (=> b!1209085 m!1115279))

(declare-fun m!1115281 () Bool)

(assert (=> b!1209085 m!1115281))

(assert (=> b!1209085 m!1114379))

(assert (=> b!1209087 m!1115271))

(assert (=> b!1209087 m!1115271))

(declare-fun m!1115283 () Bool)

(assert (=> b!1209087 m!1115283))

(assert (=> b!1209096 m!1115271))

(assert (=> b!1209096 m!1115271))

(declare-fun m!1115285 () Bool)

(assert (=> b!1209096 m!1115285))

(declare-fun m!1115287 () Bool)

(assert (=> b!1209086 m!1115287))

(declare-fun m!1115289 () Bool)

(assert (=> b!1209093 m!1115289))

(assert (=> b!1209094 m!1115271))

(assert (=> b!1209094 m!1115271))

(assert (=> b!1209094 m!1115283))

(assert (=> b!1209091 m!1115271))

(assert (=> b!1209091 m!1115271))

(declare-fun m!1115291 () Bool)

(assert (=> b!1209091 m!1115291))

(assert (=> b!1209091 m!1115277))

(assert (=> b!1209091 m!1115277))

(assert (=> b!1209091 m!1114379))

(assert (=> b!1209091 m!1115279))

(assert (=> b!1209091 m!1114379))

(declare-fun m!1115293 () Bool)

(assert (=> d!133613 m!1115293))

(assert (=> d!133613 m!1114367))

(assert (=> b!1209092 m!1115267))

(assert (=> bm!59031 d!133613))

(declare-fun d!133615 () Bool)

(assert (=> d!133615 (= (isEmpty!991 lt!548383) (isEmpty!993 (toList!8885 lt!548383)))))

(declare-fun bs!34167 () Bool)

(assert (= bs!34167 d!133615))

(declare-fun m!1115295 () Bool)

(assert (=> bs!34167 m!1115295))

(assert (=> b!1208798 d!133615))

(declare-fun b!1209099 () Bool)

(declare-fun e!686762 () Option!683)

(assert (=> b!1209099 (= e!686762 (getValueByKey!632 (t!39504 (toList!8885 lt!548333)) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1209100 () Bool)

(assert (=> b!1209100 (= e!686762 None!681)))

(declare-fun b!1209097 () Bool)

(declare-fun e!686761 () Option!683)

(assert (=> b!1209097 (= e!686761 (Some!682 (_2!9892 (h!27783 (toList!8885 lt!548333)))))))

(declare-fun d!133617 () Bool)

(declare-fun c!119156 () Bool)

(assert (=> d!133617 (= c!119156 (and ((_ is Cons!26565) (toList!8885 lt!548333)) (= (_1!9892 (h!27783 (toList!8885 lt!548333))) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133617 (= (getValueByKey!632 (toList!8885 lt!548333) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) e!686761)))

(declare-fun b!1209098 () Bool)

(assert (=> b!1209098 (= e!686761 e!686762)))

(declare-fun c!119157 () Bool)

(assert (=> b!1209098 (= c!119157 (and ((_ is Cons!26565) (toList!8885 lt!548333)) (not (= (_1!9892 (h!27783 (toList!8885 lt!548333))) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!133617 c!119156) b!1209097))

(assert (= (and d!133617 (not c!119156)) b!1209098))

(assert (= (and b!1209098 c!119157) b!1209099))

(assert (= (and b!1209098 (not c!119157)) b!1209100))

(declare-fun m!1115297 () Bool)

(assert (=> b!1209099 m!1115297))

(assert (=> b!1208702 d!133617))

(declare-fun d!133619 () Bool)

(assert (=> d!133619 (isDefined!460 (getValueByKey!632 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun lt!548572 () Unit!39973)

(assert (=> d!133619 (= lt!548572 (choose!1810 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun e!686763 () Bool)

(assert (=> d!133619 e!686763))

(declare-fun res!803468 () Bool)

(assert (=> d!133619 (=> (not res!803468) (not e!686763))))

(assert (=> d!133619 (= res!803468 (isStrictlySorted!717 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133619 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934) lt!548572)))

(declare-fun b!1209101 () Bool)

(assert (=> b!1209101 (= e!686763 (containsKey!594 (toList!8885 (+!4047 lt!548186 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (= (and d!133619 res!803468) b!1209101))

(assert (=> d!133619 m!1114557))

(assert (=> d!133619 m!1114557))

(assert (=> d!133619 m!1114559))

(declare-fun m!1115299 () Bool)

(assert (=> d!133619 m!1115299))

(declare-fun m!1115301 () Bool)

(assert (=> d!133619 m!1115301))

(assert (=> b!1209101 m!1114553))

(assert (=> b!1208695 d!133619))

(assert (=> b!1208695 d!133607))

(assert (=> b!1208695 d!133609))

(assert (=> bm!59032 d!133397))

(assert (=> b!1208799 d!133593))

(declare-fun d!133621 () Bool)

(declare-fun e!686765 () Bool)

(assert (=> d!133621 e!686765))

(declare-fun res!803469 () Bool)

(assert (=> d!133621 (=> res!803469 e!686765)))

(declare-fun lt!548573 () Bool)

(assert (=> d!133621 (= res!803469 (not lt!548573))))

(declare-fun lt!548575 () Bool)

(assert (=> d!133621 (= lt!548573 lt!548575)))

(declare-fun lt!548576 () Unit!39973)

(declare-fun e!686764 () Unit!39973)

(assert (=> d!133621 (= lt!548576 e!686764)))

(declare-fun c!119158 () Bool)

(assert (=> d!133621 (= c!119158 lt!548575)))

(assert (=> d!133621 (= lt!548575 (containsKey!594 (toList!8885 lt!548343) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133621 (= (contains!6966 lt!548343 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!548573)))

(declare-fun b!1209102 () Bool)

(declare-fun lt!548574 () Unit!39973)

(assert (=> b!1209102 (= e!686764 lt!548574)))

(assert (=> b!1209102 (= lt!548574 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548343) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> b!1209102 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548343) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209103 () Bool)

(declare-fun Unit!39999 () Unit!39973)

(assert (=> b!1209103 (= e!686764 Unit!39999)))

(declare-fun b!1209104 () Bool)

(assert (=> b!1209104 (= e!686765 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548343) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!133621 c!119158) b!1209102))

(assert (= (and d!133621 (not c!119158)) b!1209103))

(assert (= (and d!133621 (not res!803469)) b!1209104))

(declare-fun m!1115303 () Bool)

(assert (=> d!133621 m!1115303))

(declare-fun m!1115305 () Bool)

(assert (=> b!1209102 m!1115305))

(assert (=> b!1209102 m!1114593))

(assert (=> b!1209102 m!1114593))

(declare-fun m!1115307 () Bool)

(assert (=> b!1209102 m!1115307))

(assert (=> b!1209104 m!1114593))

(assert (=> b!1209104 m!1114593))

(assert (=> b!1209104 m!1115307))

(assert (=> d!133413 d!133621))

(declare-fun b!1209107 () Bool)

(declare-fun e!686767 () Option!683)

(assert (=> b!1209107 (= e!686767 (getValueByKey!632 (t!39504 lt!548344) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209108 () Bool)

(assert (=> b!1209108 (= e!686767 None!681)))

(declare-fun b!1209105 () Bool)

(declare-fun e!686766 () Option!683)

(assert (=> b!1209105 (= e!686766 (Some!682 (_2!9892 (h!27783 lt!548344))))))

(declare-fun d!133623 () Bool)

(declare-fun c!119159 () Bool)

(assert (=> d!133623 (= c!119159 (and ((_ is Cons!26565) lt!548344) (= (_1!9892 (h!27783 lt!548344)) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133623 (= (getValueByKey!632 lt!548344 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) e!686766)))

(declare-fun b!1209106 () Bool)

(assert (=> b!1209106 (= e!686766 e!686767)))

(declare-fun c!119160 () Bool)

(assert (=> b!1209106 (= c!119160 (and ((_ is Cons!26565) lt!548344) (not (= (_1!9892 (h!27783 lt!548344)) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!133623 c!119159) b!1209105))

(assert (= (and d!133623 (not c!119159)) b!1209106))

(assert (= (and b!1209106 c!119160) b!1209107))

(assert (= (and b!1209106 (not c!119160)) b!1209108))

(declare-fun m!1115309 () Bool)

(assert (=> b!1209107 m!1115309))

(assert (=> d!133413 d!133623))

(declare-fun d!133625 () Bool)

(assert (=> d!133625 (= (getValueByKey!632 lt!548344 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!682 (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!548577 () Unit!39973)

(assert (=> d!133625 (= lt!548577 (choose!1809 lt!548344 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!686768 () Bool)

(assert (=> d!133625 e!686768))

(declare-fun res!803470 () Bool)

(assert (=> d!133625 (=> (not res!803470) (not e!686768))))

(assert (=> d!133625 (= res!803470 (isStrictlySorted!717 lt!548344))))

(assert (=> d!133625 (= (lemmaContainsTupThenGetReturnValue!314 lt!548344 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!548577)))

(declare-fun b!1209109 () Bool)

(declare-fun res!803471 () Bool)

(assert (=> b!1209109 (=> (not res!803471) (not e!686768))))

(assert (=> b!1209109 (= res!803471 (containsKey!594 lt!548344 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209110 () Bool)

(assert (=> b!1209110 (= e!686768 (contains!6969 lt!548344 (tuple2!19763 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (= (and d!133625 res!803470) b!1209109))

(assert (= (and b!1209109 res!803471) b!1209110))

(assert (=> d!133625 m!1114587))

(declare-fun m!1115311 () Bool)

(assert (=> d!133625 m!1115311))

(declare-fun m!1115313 () Bool)

(assert (=> d!133625 m!1115313))

(declare-fun m!1115315 () Bool)

(assert (=> b!1209109 m!1115315))

(declare-fun m!1115317 () Bool)

(assert (=> b!1209110 m!1115317))

(assert (=> d!133413 d!133625))

(declare-fun bm!59061 () Bool)

(declare-fun call!59066 () List!26569)

(declare-fun call!59065 () List!26569)

(assert (=> bm!59061 (= call!59066 call!59065)))

(declare-fun b!1209111 () Bool)

(declare-fun e!686773 () List!26569)

(declare-fun e!686769 () List!26569)

(assert (=> b!1209111 (= e!686773 e!686769)))

(declare-fun c!119163 () Bool)

(assert (=> b!1209111 (= c!119163 (and ((_ is Cons!26565) (toList!8885 lt!548178)) (= (_1!9892 (h!27783 (toList!8885 lt!548178))) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1209112 () Bool)

(declare-fun lt!548578 () List!26569)

(declare-fun e!686770 () Bool)

(assert (=> b!1209112 (= e!686770 (contains!6969 lt!548578 (tuple2!19763 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1209113 () Bool)

(declare-fun e!686771 () List!26569)

(assert (=> b!1209113 (= e!686771 call!59066)))

(declare-fun call!59064 () List!26569)

(declare-fun c!119164 () Bool)

(declare-fun bm!59062 () Bool)

(declare-fun e!686772 () List!26569)

(assert (=> bm!59062 (= call!59064 ($colon$colon!611 e!686772 (ite c!119164 (h!27783 (toList!8885 lt!548178)) (tuple2!19763 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun c!119162 () Bool)

(assert (=> bm!59062 (= c!119162 c!119164)))

(declare-fun bm!59063 () Bool)

(assert (=> bm!59063 (= call!59065 call!59064)))

(declare-fun d!133627 () Bool)

(assert (=> d!133627 e!686770))

(declare-fun res!803473 () Bool)

(assert (=> d!133627 (=> (not res!803473) (not e!686770))))

(assert (=> d!133627 (= res!803473 (isStrictlySorted!717 lt!548578))))

(assert (=> d!133627 (= lt!548578 e!686773)))

(assert (=> d!133627 (= c!119164 (and ((_ is Cons!26565) (toList!8885 lt!548178)) (bvslt (_1!9892 (h!27783 (toList!8885 lt!548178))) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133627 (isStrictlySorted!717 (toList!8885 lt!548178))))

(assert (=> d!133627 (= (insertStrictlySorted!407 (toList!8885 lt!548178) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!548578)))

(declare-fun b!1209114 () Bool)

(assert (=> b!1209114 (= e!686769 call!59065)))

(declare-fun b!1209115 () Bool)

(declare-fun c!119161 () Bool)

(assert (=> b!1209115 (= e!686772 (ite c!119163 (t!39504 (toList!8885 lt!548178)) (ite c!119161 (Cons!26565 (h!27783 (toList!8885 lt!548178)) (t!39504 (toList!8885 lt!548178))) Nil!26566)))))

(declare-fun b!1209116 () Bool)

(declare-fun res!803472 () Bool)

(assert (=> b!1209116 (=> (not res!803472) (not e!686770))))

(assert (=> b!1209116 (= res!803472 (containsKey!594 lt!548578 (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209117 () Bool)

(assert (=> b!1209117 (= e!686772 (insertStrictlySorted!407 (t!39504 (toList!8885 lt!548178)) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209118 () Bool)

(assert (=> b!1209118 (= e!686771 call!59066)))

(declare-fun b!1209119 () Bool)

(assert (=> b!1209119 (= c!119161 (and ((_ is Cons!26565) (toList!8885 lt!548178)) (bvsgt (_1!9892 (h!27783 (toList!8885 lt!548178))) (_1!9892 (ite (or c!119000 c!118996) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> b!1209119 (= e!686769 e!686771)))

(declare-fun b!1209120 () Bool)

(assert (=> b!1209120 (= e!686773 call!59064)))

(assert (= (and d!133627 c!119164) b!1209120))

(assert (= (and d!133627 (not c!119164)) b!1209111))

(assert (= (and b!1209111 c!119163) b!1209114))

(assert (= (and b!1209111 (not c!119163)) b!1209119))

(assert (= (and b!1209119 c!119161) b!1209113))

(assert (= (and b!1209119 (not c!119161)) b!1209118))

(assert (= (or b!1209113 b!1209118) bm!59061))

(assert (= (or b!1209114 bm!59061) bm!59063))

(assert (= (or b!1209120 bm!59063) bm!59062))

(assert (= (and bm!59062 c!119162) b!1209117))

(assert (= (and bm!59062 (not c!119162)) b!1209115))

(assert (= (and d!133627 res!803473) b!1209116))

(assert (= (and b!1209116 res!803472) b!1209112))

(declare-fun m!1115319 () Bool)

(assert (=> d!133627 m!1115319))

(assert (=> d!133627 m!1115135))

(declare-fun m!1115321 () Bool)

(assert (=> bm!59062 m!1115321))

(declare-fun m!1115323 () Bool)

(assert (=> b!1209112 m!1115323))

(declare-fun m!1115325 () Bool)

(assert (=> b!1209117 m!1115325))

(declare-fun m!1115327 () Bool)

(assert (=> b!1209116 m!1115327))

(assert (=> d!133413 d!133627))

(declare-fun d!133629 () Bool)

(assert (=> d!133629 (= (apply!974 lt!548353 (select (arr!37708 _keys!1208) from!1455)) (get!19266 (getValueByKey!632 (toList!8885 lt!548353) (select (arr!37708 _keys!1208) from!1455))))))

(declare-fun bs!34168 () Bool)

(assert (= bs!34168 d!133629))

(assert (=> bs!34168 m!1114351))

(assert (=> bs!34168 m!1115003))

(assert (=> bs!34168 m!1115003))

(declare-fun m!1115329 () Bool)

(assert (=> bs!34168 m!1115329))

(assert (=> b!1208739 d!133629))

(assert (=> b!1208739 d!133483))

(declare-fun d!133631 () Bool)

(declare-fun lt!548579 () ListLongMap!17739)

(assert (=> d!133631 (not (contains!6966 lt!548579 k0!934))))

(assert (=> d!133631 (= lt!548579 (ListLongMap!17740 (removeStrictlySorted!97 (toList!8885 call!59035) k0!934)))))

(assert (=> d!133631 (= (-!1822 call!59035 k0!934) lt!548579)))

(declare-fun bs!34169 () Bool)

(assert (= bs!34169 d!133631))

(declare-fun m!1115331 () Bool)

(assert (=> bs!34169 m!1115331))

(declare-fun m!1115333 () Bool)

(assert (=> bs!34169 m!1115333))

(assert (=> b!1208716 d!133631))

(declare-fun d!133633 () Bool)

(declare-fun e!686775 () Bool)

(assert (=> d!133633 e!686775))

(declare-fun res!803474 () Bool)

(assert (=> d!133633 (=> res!803474 e!686775)))

(declare-fun lt!548580 () Bool)

(assert (=> d!133633 (= res!803474 (not lt!548580))))

(declare-fun lt!548582 () Bool)

(assert (=> d!133633 (= lt!548580 lt!548582)))

(declare-fun lt!548583 () Unit!39973)

(declare-fun e!686774 () Unit!39973)

(assert (=> d!133633 (= lt!548583 e!686774)))

(declare-fun c!119165 () Bool)

(assert (=> d!133633 (= c!119165 lt!548582)))

(assert (=> d!133633 (= lt!548582 (containsKey!594 (toList!8885 lt!548353) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133633 (= (contains!6966 lt!548353 #b1000000000000000000000000000000000000000000000000000000000000000) lt!548580)))

(declare-fun b!1209121 () Bool)

(declare-fun lt!548581 () Unit!39973)

(assert (=> b!1209121 (= e!686774 lt!548581)))

(assert (=> b!1209121 (= lt!548581 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548353) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1209121 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548353) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209122 () Bool)

(declare-fun Unit!40000 () Unit!39973)

(assert (=> b!1209122 (= e!686774 Unit!40000)))

(declare-fun b!1209123 () Bool)

(assert (=> b!1209123 (= e!686775 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133633 c!119165) b!1209121))

(assert (= (and d!133633 (not c!119165)) b!1209122))

(assert (= (and d!133633 (not res!803474)) b!1209123))

(declare-fun m!1115335 () Bool)

(assert (=> d!133633 m!1115335))

(declare-fun m!1115337 () Bool)

(assert (=> b!1209121 m!1115337))

(declare-fun m!1115339 () Bool)

(assert (=> b!1209121 m!1115339))

(assert (=> b!1209121 m!1115339))

(declare-fun m!1115341 () Bool)

(assert (=> b!1209121 m!1115341))

(assert (=> b!1209123 m!1115339))

(assert (=> b!1209123 m!1115339))

(assert (=> b!1209123 m!1115341))

(assert (=> b!1208741 d!133633))

(assert (=> b!1208791 d!133419))

(declare-fun d!133635 () Bool)

(declare-fun e!686777 () Bool)

(assert (=> d!133635 e!686777))

(declare-fun res!803475 () Bool)

(assert (=> d!133635 (=> res!803475 e!686777)))

(declare-fun lt!548584 () Bool)

(assert (=> d!133635 (= res!803475 (not lt!548584))))

(declare-fun lt!548586 () Bool)

(assert (=> d!133635 (= lt!548584 lt!548586)))

(declare-fun lt!548587 () Unit!39973)

(declare-fun e!686776 () Unit!39973)

(assert (=> d!133635 (= lt!548587 e!686776)))

(declare-fun c!119166 () Bool)

(assert (=> d!133635 (= c!119166 lt!548586)))

(assert (=> d!133635 (= lt!548586 (containsKey!594 (toList!8885 lt!548346) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133635 (= (contains!6966 lt!548346 #b0000000000000000000000000000000000000000000000000000000000000000) lt!548584)))

(declare-fun b!1209124 () Bool)

(declare-fun lt!548585 () Unit!39973)

(assert (=> b!1209124 (= e!686776 lt!548585)))

(assert (=> b!1209124 (= lt!548585 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548346) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1209124 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548346) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209125 () Bool)

(declare-fun Unit!40001 () Unit!39973)

(assert (=> b!1209125 (= e!686776 Unit!40001)))

(declare-fun b!1209126 () Bool)

(assert (=> b!1209126 (= e!686777 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548346) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133635 c!119166) b!1209124))

(assert (= (and d!133635 (not c!119166)) b!1209125))

(assert (= (and d!133635 (not res!803475)) b!1209126))

(declare-fun m!1115343 () Bool)

(assert (=> d!133635 m!1115343))

(declare-fun m!1115345 () Bool)

(assert (=> b!1209124 m!1115345))

(declare-fun m!1115347 () Bool)

(assert (=> b!1209124 m!1115347))

(assert (=> b!1209124 m!1115347))

(declare-fun m!1115349 () Bool)

(assert (=> b!1209124 m!1115349))

(assert (=> b!1209126 m!1115347))

(assert (=> b!1209126 m!1115347))

(assert (=> b!1209126 m!1115349))

(assert (=> d!133415 d!133635))

(assert (=> d!133415 d!133411))

(declare-fun b!1209132 () Bool)

(declare-fun e!686780 () Bool)

(declare-fun call!59071 () ListLongMap!17739)

(declare-fun call!59072 () ListLongMap!17739)

(assert (=> b!1209132 (= e!686780 (= call!59071 call!59072))))

(declare-fun d!133637 () Bool)

(assert (=> d!133637 e!686780))

(declare-fun c!119169 () Bool)

(assert (=> d!133637 (= c!119169 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (=> d!133637 true))

(declare-fun _$12!468 () Unit!39973)

(assert (=> d!133637 (= (choose!1807 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$12!468)))

(declare-fun bm!59068 () Bool)

(assert (=> bm!59068 (= call!59072 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59069 () Bool)

(assert (=> bm!59069 (= call!59071 (getCurrentListMapNoExtraKeys!5347 (array!78150 (store (arr!37708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38245 _keys!1208)) (array!78152 (store (arr!37709 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3267 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38246 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209131 () Bool)

(assert (=> b!1209131 (= e!686780 (= call!59071 (-!1822 call!59072 k0!934)))))

(assert (= (and d!133637 c!119169) b!1209131))

(assert (= (and d!133637 (not c!119169)) b!1209132))

(assert (= (or b!1209131 b!1209132) bm!59068))

(assert (= (or b!1209131 b!1209132) bm!59069))

(declare-fun b_lambda!21463 () Bool)

(assert (=> (not b_lambda!21463) (not bm!59069)))

(assert (=> bm!59069 t!39503))

(declare-fun b_and!42983 () Bool)

(assert (= b_and!42981 (and (=> t!39503 result!22105) b_and!42983)))

(assert (=> bm!59068 m!1114331))

(assert (=> bm!59069 m!1114359))

(assert (=> bm!59069 m!1114379))

(assert (=> bm!59069 m!1114381))

(assert (=> bm!59069 m!1114581))

(declare-fun m!1115351 () Bool)

(assert (=> b!1209131 m!1115351))

(assert (=> d!133409 d!133637))

(declare-fun b!1209133 () Bool)

(declare-fun e!686783 () Bool)

(declare-fun e!686784 () Bool)

(assert (=> b!1209133 (= e!686783 e!686784)))

(declare-fun res!803478 () Bool)

(assert (=> b!1209133 (=> (not res!803478) (not e!686784))))

(declare-fun e!686782 () Bool)

(assert (=> b!1209133 (= res!803478 (not e!686782))))

(declare-fun res!803476 () Bool)

(assert (=> b!1209133 (=> (not res!803476) (not e!686782))))

(assert (=> b!1209133 (= res!803476 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1209134 () Bool)

(assert (=> b!1209134 (= e!686782 (contains!6970 (ite c!119063 (Cons!26566 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) Nil!26567) Nil!26567) (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1209135 () Bool)

(declare-fun e!686781 () Bool)

(assert (=> b!1209135 (= e!686784 e!686781)))

(declare-fun c!119170 () Bool)

(assert (=> b!1209135 (= c!119170 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!59070 () Bool)

(declare-fun call!59073 () Bool)

(assert (=> bm!59070 (= call!59073 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!119170 (Cons!26566 (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!119063 (Cons!26566 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) Nil!26567) Nil!26567)) (ite c!119063 (Cons!26566 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) Nil!26567) Nil!26567))))))

(declare-fun b!1209136 () Bool)

(assert (=> b!1209136 (= e!686781 call!59073)))

(declare-fun b!1209137 () Bool)

(assert (=> b!1209137 (= e!686781 call!59073)))

(declare-fun d!133639 () Bool)

(declare-fun res!803477 () Bool)

(assert (=> d!133639 (=> res!803477 e!686783)))

(assert (=> d!133639 (= res!803477 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(assert (=> d!133639 (= (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119063 (Cons!26566 (select (arr!37708 _keys!1208) #b00000000000000000000000000000000) Nil!26567) Nil!26567)) e!686783)))

(assert (= (and d!133639 (not res!803477)) b!1209133))

(assert (= (and b!1209133 res!803476) b!1209134))

(assert (= (and b!1209133 res!803478) b!1209135))

(assert (= (and b!1209135 c!119170) b!1209137))

(assert (= (and b!1209135 (not c!119170)) b!1209136))

(assert (= (or b!1209137 b!1209136) bm!59070))

(assert (=> b!1209133 m!1114973))

(assert (=> b!1209133 m!1114973))

(assert (=> b!1209133 m!1114975))

(assert (=> b!1209134 m!1114973))

(assert (=> b!1209134 m!1114973))

(declare-fun m!1115353 () Bool)

(assert (=> b!1209134 m!1115353))

(assert (=> b!1209135 m!1114973))

(assert (=> b!1209135 m!1114973))

(assert (=> b!1209135 m!1114975))

(assert (=> bm!59070 m!1114973))

(declare-fun m!1115355 () Bool)

(assert (=> bm!59070 m!1115355))

(assert (=> bm!59040 d!133639))

(declare-fun d!133641 () Bool)

(declare-fun e!686786 () Bool)

(assert (=> d!133641 e!686786))

(declare-fun res!803479 () Bool)

(assert (=> d!133641 (=> res!803479 e!686786)))

(declare-fun lt!548588 () Bool)

(assert (=> d!133641 (= res!803479 (not lt!548588))))

(declare-fun lt!548590 () Bool)

(assert (=> d!133641 (= lt!548588 lt!548590)))

(declare-fun lt!548591 () Unit!39973)

(declare-fun e!686785 () Unit!39973)

(assert (=> d!133641 (= lt!548591 e!686785)))

(declare-fun c!119171 () Bool)

(assert (=> d!133641 (= c!119171 lt!548590)))

(assert (=> d!133641 (= lt!548590 (containsKey!594 (toList!8885 lt!548395) k0!934))))

(assert (=> d!133641 (= (contains!6966 lt!548395 k0!934) lt!548588)))

(declare-fun b!1209138 () Bool)

(declare-fun lt!548589 () Unit!39973)

(assert (=> b!1209138 (= e!686785 lt!548589)))

(assert (=> b!1209138 (= lt!548589 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548395) k0!934))))

(assert (=> b!1209138 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548395) k0!934))))

(declare-fun b!1209139 () Bool)

(declare-fun Unit!40002 () Unit!39973)

(assert (=> b!1209139 (= e!686785 Unit!40002)))

(declare-fun b!1209140 () Bool)

(assert (=> b!1209140 (= e!686786 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548395) k0!934)))))

(assert (= (and d!133641 c!119171) b!1209138))

(assert (= (and d!133641 (not c!119171)) b!1209139))

(assert (= (and d!133641 (not res!803479)) b!1209140))

(declare-fun m!1115357 () Bool)

(assert (=> d!133641 m!1115357))

(declare-fun m!1115359 () Bool)

(assert (=> b!1209138 m!1115359))

(declare-fun m!1115361 () Bool)

(assert (=> b!1209138 m!1115361))

(assert (=> b!1209138 m!1115361))

(declare-fun m!1115363 () Bool)

(assert (=> b!1209138 m!1115363))

(assert (=> b!1209140 m!1115361))

(assert (=> b!1209140 m!1115361))

(assert (=> b!1209140 m!1115363))

(assert (=> d!133449 d!133641))

(declare-fun b!1209151 () Bool)

(declare-fun e!686794 () List!26569)

(assert (=> b!1209151 (= e!686794 Nil!26566)))

(declare-fun b!1209152 () Bool)

(declare-fun e!686795 () Bool)

(declare-fun lt!548594 () List!26569)

(assert (=> b!1209152 (= e!686795 (not (containsKey!594 lt!548594 k0!934)))))

(declare-fun d!133643 () Bool)

(assert (=> d!133643 e!686795))

(declare-fun res!803482 () Bool)

(assert (=> d!133643 (=> (not res!803482) (not e!686795))))

(assert (=> d!133643 (= res!803482 (isStrictlySorted!717 lt!548594))))

(declare-fun e!686793 () List!26569)

(assert (=> d!133643 (= lt!548594 e!686793)))

(declare-fun c!119177 () Bool)

(assert (=> d!133643 (= c!119177 (and ((_ is Cons!26565) (toList!8885 call!58976)) (= (_1!9892 (h!27783 (toList!8885 call!58976))) k0!934)))))

(assert (=> d!133643 (isStrictlySorted!717 (toList!8885 call!58976))))

(assert (=> d!133643 (= (removeStrictlySorted!97 (toList!8885 call!58976) k0!934) lt!548594)))

(declare-fun b!1209153 () Bool)

(assert (=> b!1209153 (= e!686793 e!686794)))

(declare-fun c!119176 () Bool)

(assert (=> b!1209153 (= c!119176 (and ((_ is Cons!26565) (toList!8885 call!58976)) (not (= (_1!9892 (h!27783 (toList!8885 call!58976))) k0!934))))))

(declare-fun b!1209154 () Bool)

(assert (=> b!1209154 (= e!686794 ($colon$colon!611 (removeStrictlySorted!97 (t!39504 (toList!8885 call!58976)) k0!934) (h!27783 (toList!8885 call!58976))))))

(declare-fun b!1209155 () Bool)

(assert (=> b!1209155 (= e!686793 (t!39504 (toList!8885 call!58976)))))

(assert (= (and d!133643 c!119177) b!1209155))

(assert (= (and d!133643 (not c!119177)) b!1209153))

(assert (= (and b!1209153 c!119176) b!1209154))

(assert (= (and b!1209153 (not c!119176)) b!1209151))

(assert (= (and d!133643 res!803482) b!1209152))

(declare-fun m!1115365 () Bool)

(assert (=> b!1209152 m!1115365))

(declare-fun m!1115367 () Bool)

(assert (=> d!133643 m!1115367))

(declare-fun m!1115369 () Bool)

(assert (=> d!133643 m!1115369))

(declare-fun m!1115371 () Bool)

(assert (=> b!1209154 m!1115371))

(assert (=> b!1209154 m!1115371))

(declare-fun m!1115373 () Bool)

(assert (=> b!1209154 m!1115373))

(assert (=> d!133449 d!133643))

(declare-fun d!133645 () Bool)

(declare-fun e!686797 () Bool)

(assert (=> d!133645 e!686797))

(declare-fun res!803483 () Bool)

(assert (=> d!133645 (=> res!803483 e!686797)))

(declare-fun lt!548595 () Bool)

(assert (=> d!133645 (= res!803483 (not lt!548595))))

(declare-fun lt!548597 () Bool)

(assert (=> d!133645 (= lt!548595 lt!548597)))

(declare-fun lt!548598 () Unit!39973)

(declare-fun e!686796 () Unit!39973)

(assert (=> d!133645 (= lt!548598 e!686796)))

(declare-fun c!119178 () Bool)

(assert (=> d!133645 (= c!119178 lt!548597)))

(assert (=> d!133645 (= lt!548597 (containsKey!594 (toList!8885 lt!548302) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133645 (= (contains!6966 lt!548302 #b1000000000000000000000000000000000000000000000000000000000000000) lt!548595)))

(declare-fun b!1209156 () Bool)

(declare-fun lt!548596 () Unit!39973)

(assert (=> b!1209156 (= e!686796 lt!548596)))

(assert (=> b!1209156 (= lt!548596 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548302) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1209156 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548302) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209157 () Bool)

(declare-fun Unit!40003 () Unit!39973)

(assert (=> b!1209157 (= e!686796 Unit!40003)))

(declare-fun b!1209158 () Bool)

(assert (=> b!1209158 (= e!686797 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548302) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133645 c!119178) b!1209156))

(assert (= (and d!133645 (not c!119178)) b!1209157))

(assert (= (and d!133645 (not res!803483)) b!1209158))

(declare-fun m!1115375 () Bool)

(assert (=> d!133645 m!1115375))

(declare-fun m!1115377 () Bool)

(assert (=> b!1209156 m!1115377))

(declare-fun m!1115379 () Bool)

(assert (=> b!1209156 m!1115379))

(assert (=> b!1209156 m!1115379))

(declare-fun m!1115381 () Bool)

(assert (=> b!1209156 m!1115381))

(assert (=> b!1209158 m!1115379))

(assert (=> b!1209158 m!1115379))

(assert (=> b!1209158 m!1115381))

(assert (=> b!1208684 d!133645))

(declare-fun d!133647 () Bool)

(declare-fun e!686800 () Bool)

(assert (=> d!133647 e!686800))

(declare-fun c!119181 () Bool)

(assert (=> d!133647 (= c!119181 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!133647 true))

(declare-fun _$29!189 () Unit!39973)

(assert (=> d!133647 (= (choose!1808 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$29!189)))

(declare-fun b!1209163 () Bool)

(assert (=> b!1209163 (= e!686800 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209164 () Bool)

(assert (=> b!1209164 (= e!686800 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133647 c!119181) b!1209163))

(assert (= (and d!133647 (not c!119181)) b!1209164))

(assert (=> b!1209163 m!1114323))

(assert (=> d!133435 d!133647))

(assert (=> d!133435 d!133411))

(declare-fun b!1209165 () Bool)

(declare-fun e!686803 () Bool)

(declare-fun e!686804 () Bool)

(assert (=> b!1209165 (= e!686803 e!686804)))

(declare-fun res!803486 () Bool)

(assert (=> b!1209165 (=> (not res!803486) (not e!686804))))

(declare-fun e!686802 () Bool)

(assert (=> b!1209165 (= res!803486 (not e!686802))))

(declare-fun res!803484 () Bool)

(assert (=> b!1209165 (=> (not res!803484) (not e!686802))))

(assert (=> b!1209165 (= res!803484 (validKeyInArray!0 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1209166 () Bool)

(assert (=> b!1209166 (= e!686802 (contains!6970 (ite c!119064 (Cons!26566 (select (arr!37708 lt!548177) #b00000000000000000000000000000000) Nil!26567) Nil!26567) (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1209167 () Bool)

(declare-fun e!686801 () Bool)

(assert (=> b!1209167 (= e!686804 e!686801)))

(declare-fun c!119182 () Bool)

(assert (=> b!1209167 (= c!119182 (validKeyInArray!0 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!59071 () Bool)

(declare-fun call!59074 () Bool)

(assert (=> bm!59071 (= call!59074 (arrayNoDuplicates!0 lt!548177 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!119182 (Cons!26566 (select (arr!37708 lt!548177) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!119064 (Cons!26566 (select (arr!37708 lt!548177) #b00000000000000000000000000000000) Nil!26567) Nil!26567)) (ite c!119064 (Cons!26566 (select (arr!37708 lt!548177) #b00000000000000000000000000000000) Nil!26567) Nil!26567))))))

(declare-fun b!1209168 () Bool)

(assert (=> b!1209168 (= e!686801 call!59074)))

(declare-fun b!1209169 () Bool)

(assert (=> b!1209169 (= e!686801 call!59074)))

(declare-fun d!133649 () Bool)

(declare-fun res!803485 () Bool)

(assert (=> d!133649 (=> res!803485 e!686803)))

(assert (=> d!133649 (= res!803485 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38245 lt!548177)))))

(assert (=> d!133649 (= (arrayNoDuplicates!0 lt!548177 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119064 (Cons!26566 (select (arr!37708 lt!548177) #b00000000000000000000000000000000) Nil!26567) Nil!26567)) e!686803)))

(assert (= (and d!133649 (not res!803485)) b!1209165))

(assert (= (and b!1209165 res!803484) b!1209166))

(assert (= (and b!1209165 res!803486) b!1209167))

(assert (= (and b!1209167 c!119182) b!1209169))

(assert (= (and b!1209167 (not c!119182)) b!1209168))

(assert (= (or b!1209169 b!1209168) bm!59071))

(assert (=> b!1209165 m!1114827))

(assert (=> b!1209165 m!1114827))

(assert (=> b!1209165 m!1114829))

(assert (=> b!1209166 m!1114827))

(assert (=> b!1209166 m!1114827))

(declare-fun m!1115383 () Bool)

(assert (=> b!1209166 m!1115383))

(assert (=> b!1209167 m!1114827))

(assert (=> b!1209167 m!1114827))

(assert (=> b!1209167 m!1114829))

(assert (=> bm!59071 m!1114827))

(declare-fun m!1115385 () Bool)

(assert (=> bm!59071 m!1115385))

(assert (=> bm!59041 d!133649))

(declare-fun b!1209170 () Bool)

(declare-fun e!686807 () Bool)

(declare-fun e!686808 () Bool)

(assert (=> b!1209170 (= e!686807 e!686808)))

(declare-fun res!803489 () Bool)

(assert (=> b!1209170 (=> (not res!803489) (not e!686808))))

(declare-fun e!686806 () Bool)

(assert (=> b!1209170 (= res!803489 (not e!686806))))

(declare-fun res!803487 () Bool)

(assert (=> b!1209170 (=> (not res!803487) (not e!686806))))

(assert (=> b!1209170 (= res!803487 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1209171 () Bool)

(assert (=> b!1209171 (= e!686806 (contains!6970 (ite c!119065 (Cons!26566 (select (arr!37708 _keys!1208) from!1455) Nil!26567) Nil!26567) (select (arr!37708 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1209172 () Bool)

(declare-fun e!686805 () Bool)

(assert (=> b!1209172 (= e!686808 e!686805)))

(declare-fun c!119183 () Bool)

(assert (=> b!1209172 (= c!119183 (validKeyInArray!0 (select (arr!37708 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun bm!59072 () Bool)

(declare-fun call!59075 () Bool)

(assert (=> bm!59072 (= call!59075 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!119183 (Cons!26566 (select (arr!37708 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (ite c!119065 (Cons!26566 (select (arr!37708 _keys!1208) from!1455) Nil!26567) Nil!26567)) (ite c!119065 (Cons!26566 (select (arr!37708 _keys!1208) from!1455) Nil!26567) Nil!26567))))))

(declare-fun b!1209173 () Bool)

(assert (=> b!1209173 (= e!686805 call!59075)))

(declare-fun b!1209174 () Bool)

(assert (=> b!1209174 (= e!686805 call!59075)))

(declare-fun d!133651 () Bool)

(declare-fun res!803488 () Bool)

(assert (=> d!133651 (=> res!803488 e!686807)))

(assert (=> d!133651 (= res!803488 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(assert (=> d!133651 (= (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!119065 (Cons!26566 (select (arr!37708 _keys!1208) from!1455) Nil!26567) Nil!26567)) e!686807)))

(assert (= (and d!133651 (not res!803488)) b!1209170))

(assert (= (and b!1209170 res!803487) b!1209171))

(assert (= (and b!1209170 res!803489) b!1209172))

(assert (= (and b!1209172 c!119183) b!1209174))

(assert (= (and b!1209172 (not c!119183)) b!1209173))

(assert (= (or b!1209174 b!1209173) bm!59072))

(assert (=> b!1209170 m!1114779))

(assert (=> b!1209170 m!1114779))

(assert (=> b!1209170 m!1114791))

(assert (=> b!1209171 m!1114779))

(assert (=> b!1209171 m!1114779))

(declare-fun m!1115387 () Bool)

(assert (=> b!1209171 m!1115387))

(assert (=> b!1209172 m!1114779))

(assert (=> b!1209172 m!1114779))

(assert (=> b!1209172 m!1114791))

(assert (=> bm!59072 m!1114779))

(declare-fun m!1115389 () Bool)

(assert (=> bm!59072 m!1115389))

(assert (=> bm!59042 d!133651))

(declare-fun d!133653 () Bool)

(declare-fun res!803490 () Bool)

(declare-fun e!686809 () Bool)

(assert (=> d!133653 (=> res!803490 e!686809)))

(assert (=> d!133653 (= res!803490 (= (select (arr!37708 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!133653 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!686809)))

(declare-fun b!1209175 () Bool)

(declare-fun e!686810 () Bool)

(assert (=> b!1209175 (= e!686809 e!686810)))

(declare-fun res!803491 () Bool)

(assert (=> b!1209175 (=> (not res!803491) (not e!686810))))

(assert (=> b!1209175 (= res!803491 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38245 _keys!1208)))))

(declare-fun b!1209176 () Bool)

(assert (=> b!1209176 (= e!686810 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!133653 (not res!803490)) b!1209175))

(assert (= (and b!1209175 res!803491) b!1209176))

(assert (=> d!133653 m!1114973))

(declare-fun m!1115391 () Bool)

(assert (=> b!1209176 m!1115391))

(assert (=> b!1208709 d!133653))

(declare-fun d!133655 () Bool)

(declare-fun e!686812 () Bool)

(assert (=> d!133655 e!686812))

(declare-fun res!803492 () Bool)

(assert (=> d!133655 (=> res!803492 e!686812)))

(declare-fun lt!548599 () Bool)

(assert (=> d!133655 (= res!803492 (not lt!548599))))

(declare-fun lt!548601 () Bool)

(assert (=> d!133655 (= lt!548599 lt!548601)))

(declare-fun lt!548602 () Unit!39973)

(declare-fun e!686811 () Unit!39973)

(assert (=> d!133655 (= lt!548602 e!686811)))

(declare-fun c!119184 () Bool)

(assert (=> d!133655 (= c!119184 lt!548601)))

(assert (=> d!133655 (= lt!548601 (containsKey!594 (toList!8885 lt!548383) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133655 (= (contains!6966 lt!548383 #b0000000000000000000000000000000000000000000000000000000000000000) lt!548599)))

(declare-fun b!1209177 () Bool)

(declare-fun lt!548600 () Unit!39973)

(assert (=> b!1209177 (= e!686811 lt!548600)))

(assert (=> b!1209177 (= lt!548600 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8885 lt!548383) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1209177 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548383) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209178 () Bool)

(declare-fun Unit!40004 () Unit!39973)

(assert (=> b!1209178 (= e!686811 Unit!40004)))

(declare-fun b!1209179 () Bool)

(assert (=> b!1209179 (= e!686812 (isDefined!460 (getValueByKey!632 (toList!8885 lt!548383) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133655 c!119184) b!1209177))

(assert (= (and d!133655 (not c!119184)) b!1209178))

(assert (= (and d!133655 (not res!803492)) b!1209179))

(declare-fun m!1115393 () Bool)

(assert (=> d!133655 m!1115393))

(declare-fun m!1115395 () Bool)

(assert (=> b!1209177 m!1115395))

(declare-fun m!1115397 () Bool)

(assert (=> b!1209177 m!1115397))

(assert (=> b!1209177 m!1115397))

(declare-fun m!1115399 () Bool)

(assert (=> b!1209177 m!1115399))

(assert (=> b!1209179 m!1115397))

(assert (=> b!1209179 m!1115397))

(assert (=> b!1209179 m!1115399))

(assert (=> d!133441 d!133655))

(assert (=> d!133441 d!133411))

(declare-fun b!1209181 () Bool)

(declare-fun e!686814 () Bool)

(assert (=> b!1209181 (= e!686814 tp_is_empty!30667)))

(declare-fun b!1209180 () Bool)

(declare-fun e!686813 () Bool)

(assert (=> b!1209180 (= e!686813 tp_is_empty!30667)))

(declare-fun mapIsEmpty!47869 () Bool)

(declare-fun mapRes!47869 () Bool)

(assert (=> mapIsEmpty!47869 mapRes!47869))

(declare-fun condMapEmpty!47869 () Bool)

(declare-fun mapDefault!47869 () ValueCell!14624)

(assert (=> mapNonEmpty!47868 (= condMapEmpty!47869 (= mapRest!47868 ((as const (Array (_ BitVec 32) ValueCell!14624)) mapDefault!47869)))))

(assert (=> mapNonEmpty!47868 (= tp!90910 (and e!686814 mapRes!47869))))

(declare-fun mapNonEmpty!47869 () Bool)

(declare-fun tp!90911 () Bool)

(assert (=> mapNonEmpty!47869 (= mapRes!47869 (and tp!90911 e!686813))))

(declare-fun mapRest!47869 () (Array (_ BitVec 32) ValueCell!14624))

(declare-fun mapValue!47869 () ValueCell!14624)

(declare-fun mapKey!47869 () (_ BitVec 32))

(assert (=> mapNonEmpty!47869 (= mapRest!47868 (store mapRest!47869 mapKey!47869 mapValue!47869))))

(assert (= (and mapNonEmpty!47868 condMapEmpty!47869) mapIsEmpty!47869))

(assert (= (and mapNonEmpty!47868 (not condMapEmpty!47869)) mapNonEmpty!47869))

(assert (= (and mapNonEmpty!47869 ((_ is ValueCellFull!14624) mapValue!47869)) b!1209180))

(assert (= (and mapNonEmpty!47868 ((_ is ValueCellFull!14624) mapDefault!47869)) b!1209181))

(declare-fun m!1115401 () Bool)

(assert (=> mapNonEmpty!47869 m!1115401))

(declare-fun b_lambda!21465 () Bool)

(assert (= b_lambda!21445 (or (and start!101060 b_free!25963) b_lambda!21465)))

(declare-fun b_lambda!21467 () Bool)

(assert (= b_lambda!21455 (or (and start!101060 b_free!25963) b_lambda!21467)))

(declare-fun b_lambda!21469 () Bool)

(assert (= b_lambda!21459 (or (and start!101060 b_free!25963) b_lambda!21469)))

(declare-fun b_lambda!21471 () Bool)

(assert (= b_lambda!21457 (or (and start!101060 b_free!25963) b_lambda!21471)))

(declare-fun b_lambda!21473 () Bool)

(assert (= b_lambda!21447 (or (and start!101060 b_free!25963) b_lambda!21473)))

(declare-fun b_lambda!21475 () Bool)

(assert (= b_lambda!21449 (or (and start!101060 b_free!25963) b_lambda!21475)))

(declare-fun b_lambda!21477 () Bool)

(assert (= b_lambda!21443 (or (and start!101060 b_free!25963) b_lambda!21477)))

(declare-fun b_lambda!21479 () Bool)

(assert (= b_lambda!21453 (or (and start!101060 b_free!25963) b_lambda!21479)))

(declare-fun b_lambda!21481 () Bool)

(assert (= b_lambda!21451 (or (and start!101060 b_free!25963) b_lambda!21481)))

(declare-fun b_lambda!21483 () Bool)

(assert (= b_lambda!21461 (or (and start!101060 b_free!25963) b_lambda!21483)))

(declare-fun b_lambda!21485 () Bool)

(assert (= b_lambda!21463 (or (and start!101060 b_free!25963) b_lambda!21485)))

(check-sat (not b!1209023) (not bm!59052) (not b!1209154) (not b!1209014) (not b!1208933) (not b!1209156) (not b_lambda!21427) (not b!1208822) (not b!1209171) (not b!1208886) (not d!133539) (not d!133633) (not b!1208964) (not d!133511) (not b!1208889) (not d!133499) (not b_lambda!21437) (not d!133455) (not b!1209135) (not d!133527) (not b!1208999) (not d!133605) (not b!1209018) (not b!1208944) (not bm!59071) (not b!1209110) (not d!133579) (not b!1209060) (not d!133489) (not d!133635) (not b!1209107) (not b!1208949) (not d!133507) (not b_lambda!21485) b_and!42983 (not b!1208900) (not b!1209176) (not b!1208873) (not d!133645) (not b!1208925) (not b!1208957) (not b!1208913) (not b!1208820) (not d!133615) (not b!1208932) (not b!1208871) (not d!133467) (not b!1209065) (not d!133531) (not b!1209158) (not d!133525) (not b!1209094) (not b!1208917) (not b!1208911) (not d!133565) (not b!1209017) (not b!1209004) (not b!1208879) (not b!1208892) (not b!1208939) (not b!1208986) (not b!1208963) (not b_lambda!21481) (not d!133627) (not d!133519) (not b!1208940) (not b!1208973) (not b!1209076) (not b!1208941) (not d!133569) (not b_lambda!21483) (not d!133607) (not d!133461) (not b!1209131) (not bm!59055) (not b!1208920) (not bm!59059) (not b!1209054) (not d!133595) (not b_lambda!21435) (not bm!59069) (not b!1209116) (not b!1209121) (not d!133471) (not b!1208979) (not bm!59070) (not b!1208966) (not b!1209109) (not b!1209039) (not d!133501) (not b!1209140) (not b!1209126) (not b_lambda!21431) tp_is_empty!30667 (not b!1208974) (not d!133589) (not b!1208919) (not b!1209152) (not d!133485) (not d!133625) (not b!1208898) (not b!1209000) (not b!1209096) (not b_lambda!21441) (not b!1209069) (not d!133457) (not b!1208978) (not d!133557) (not b!1208968) (not b!1208997) (not b!1208995) (not b_next!25963) (not b!1208909) (not b!1209021) (not d!133555) (not b!1209167) (not b!1208942) (not b!1208975) (not b!1208952) (not b!1208839) (not b!1209093) (not b!1208989) (not b!1208916) (not b!1209006) (not b!1208950) (not b!1209170) (not b!1208931) (not b!1209078) (not d!133583) (not b!1209112) (not b!1209177) (not d!133543) (not b!1208982) (not b!1208918) (not b!1208988) (not b!1208882) (not d!133641) (not b!1208872) (not d!133549) (not b!1209050) (not b!1209133) (not b_lambda!21429) (not b_lambda!21473) (not b!1209001) (not b!1209101) (not b_lambda!21467) (not b!1209104) (not d!133541) (not d!133631) (not b!1208996) (not b!1208981) (not b_lambda!21469) (not d!133451) (not d!133585) (not bm!59060) (not d!133487) (not d!133529) (not b!1209102) (not d!133537) (not b!1209012) (not b!1208928) (not bm!59054) (not d!133561) (not b!1209002) (not d!133611) (not b!1208983) (not b!1208833) (not d!133473) (not b_lambda!21439) (not d!133613) (not b!1208969) (not b!1208926) (not d!133553) (not b!1208880) (not b!1208976) (not d!133535) (not d!133521) (not d!133571) (not b!1209007) (not d!133469) (not d!133575) (not b_lambda!21479) (not b!1208878) (not b!1208967) (not d!133643) (not b!1208955) (not d!133523) (not bm!59062) (not d!133477) (not b!1208922) (not bm!59068) (not b!1209166) (not b!1208912) (not d!133655) (not b!1209020) (not b!1208990) (not d!133603) (not b!1209074) (not bm!59058) (not b!1208924) (not bm!59057) (not d!133551) (not b!1209061) (not b!1208896) (not b!1209009) (not b!1208930) (not b!1208877) (not b!1208954) (not b!1208935) (not b_lambda!21471) (not b!1208862) (not d!133619) (not b_lambda!21405) (not b!1208840) (not b!1209092) (not d!133591) (not b!1208866) (not b!1209083) (not b!1208994) (not b!1209117) (not b!1209172) (not b!1209123) (not b_lambda!21425) (not b!1208867) (not b_lambda!21477) (not b!1209016) (not d!133621) (not b!1209124) (not b!1208910) (not bm!59056) (not b!1209010) (not b!1209044) (not mapNonEmpty!47869) (not d!133517) (not b_lambda!21433) (not d!133547) (not b!1209080) (not b!1208927) (not b!1209091) (not b_lambda!21465) (not b!1208894) (not b!1209063) (not d!133567) (not d!133573) (not b!1208884) (not b_lambda!21475) (not d!133497) (not b!1209165) (not b!1209099) (not b!1208915) (not d!133629) (not d!133493) (not b!1209013) (not b!1209052) (not b!1208934) (not b!1209042) (not b!1209134) (not d!133481) (not b!1209163) (not b!1209087) (not b!1209179) (not d!133503) (not d!133601) (not bm!59072) (not d!133495) (not b!1209138) (not b!1209072) (not b!1208947) (not b!1209086) (not b!1209085))
(check-sat b_and!42983 (not b_next!25963))
