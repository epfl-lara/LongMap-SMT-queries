; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100986 () Bool)

(assert start!100986)

(declare-fun b_free!25921 () Bool)

(declare-fun b_next!25921 () Bool)

(assert (=> start!100986 (= b_free!25921 (not b_next!25921))))

(declare-fun tp!90766 () Bool)

(declare-fun b_and!42831 () Bool)

(assert (=> start!100986 (= tp!90766 b_and!42831)))

(declare-fun b!1206476 () Bool)

(declare-datatypes ((Unit!39914 0))(
  ( (Unit!39915) )
))
(declare-fun e!685245 () Unit!39914)

(declare-fun lt!547105 () Unit!39914)

(assert (=> b!1206476 (= e!685245 lt!547105)))

(declare-fun call!58451 () Unit!39914)

(assert (=> b!1206476 (= lt!547105 call!58451)))

(declare-fun call!58450 () Bool)

(assert (=> b!1206476 call!58450))

(declare-fun b!1206477 () Bool)

(declare-fun e!685254 () Bool)

(declare-datatypes ((V!45961 0))(
  ( (V!45962 (val!15369 Int)) )
))
(declare-datatypes ((tuple2!19724 0))(
  ( (tuple2!19725 (_1!9873 (_ BitVec 64)) (_2!9873 V!45961)) )
))
(declare-datatypes ((List!26533 0))(
  ( (Nil!26530) (Cons!26529 (h!27747 tuple2!19724) (t!39426 List!26533)) )
))
(declare-datatypes ((ListLongMap!17701 0))(
  ( (ListLongMap!17702 (toList!8866 List!26533)) )
))
(declare-fun call!58446 () ListLongMap!17701)

(declare-fun call!58449 () ListLongMap!17701)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1810 (ListLongMap!17701 (_ BitVec 64)) ListLongMap!17701)

(assert (=> b!1206477 (= e!685254 (= call!58446 (-!1810 call!58449 k0!934)))))

(declare-fun e!685253 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1206478 () Bool)

(declare-fun lt!547104 () Bool)

(assert (=> b!1206478 (= e!685253 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547104) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!45961)

(declare-datatypes ((array!78063 0))(
  ( (array!78064 (arr!37666 (Array (_ BitVec 32) (_ BitVec 64))) (size!38203 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78063)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14603 0))(
  ( (ValueCellFull!14603 (v!18009 V!45961)) (EmptyCell!14603) )
))
(declare-datatypes ((array!78065 0))(
  ( (array!78066 (arr!37667 (Array (_ BitVec 32) ValueCell!14603)) (size!38204 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78065)

(declare-fun minValue!944 () V!45961)

(declare-fun bm!58443 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5329 (array!78063 array!78065 (_ BitVec 32) (_ BitVec 32) V!45961 V!45961 (_ BitVec 32) Int) ListLongMap!17701)

(assert (=> bm!58443 (= call!58449 (getCurrentListMapNoExtraKeys!5329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58444 () Bool)

(declare-fun call!58452 () Unit!39914)

(assert (=> bm!58444 (= call!58451 call!58452)))

(declare-fun b!1206479 () Bool)

(declare-fun res!802163 () Bool)

(declare-fun e!685250 () Bool)

(assert (=> b!1206479 (=> (not res!802163) (not e!685250))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206479 (= res!802163 (= (select (arr!37666 _keys!1208) i!673) k0!934))))

(declare-fun lt!547092 () array!78063)

(declare-fun lt!547102 () array!78065)

(declare-fun bm!58445 () Bool)

(assert (=> bm!58445 (= call!58446 (getCurrentListMapNoExtraKeys!5329 lt!547092 lt!547102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206481 () Bool)

(declare-fun res!802177 () Bool)

(assert (=> b!1206481 (=> (not res!802177) (not e!685250))))

(assert (=> b!1206481 (= res!802177 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38203 _keys!1208))))))

(declare-fun b!1206482 () Bool)

(declare-fun e!685255 () Bool)

(declare-fun e!685247 () Bool)

(assert (=> b!1206482 (= e!685255 e!685247)))

(declare-fun res!802167 () Bool)

(assert (=> b!1206482 (=> res!802167 e!685247)))

(assert (=> b!1206482 (= res!802167 (not (= from!1455 i!673)))))

(declare-fun lt!547106 () ListLongMap!17701)

(assert (=> b!1206482 (= lt!547106 (getCurrentListMapNoExtraKeys!5329 lt!547092 lt!547102 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3253 (Int (_ BitVec 64)) V!45961)

(assert (=> b!1206482 (= lt!547102 (array!78066 (store (arr!37667 _values!996) i!673 (ValueCellFull!14603 (dynLambda!3253 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38204 _values!996)))))

(declare-fun lt!547099 () ListLongMap!17701)

(assert (=> b!1206482 (= lt!547099 (getCurrentListMapNoExtraKeys!5329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1206483 () Bool)

(declare-fun e!685257 () Bool)

(declare-fun tp_is_empty!30625 () Bool)

(assert (=> b!1206483 (= e!685257 tp_is_empty!30625)))

(declare-fun b!1206484 () Bool)

(declare-fun res!802173 () Bool)

(declare-fun e!685251 () Bool)

(assert (=> b!1206484 (=> (not res!802173) (not e!685251))))

(declare-datatypes ((List!26534 0))(
  ( (Nil!26531) (Cons!26530 (h!27748 (_ BitVec 64)) (t!39427 List!26534)) )
))
(declare-fun arrayNoDuplicates!0 (array!78063 (_ BitVec 32) List!26534) Bool)

(assert (=> b!1206484 (= res!802173 (arrayNoDuplicates!0 lt!547092 #b00000000000000000000000000000000 Nil!26531))))

(declare-fun b!1206485 () Bool)

(assert (=> b!1206485 (= e!685250 e!685251)))

(declare-fun res!802170 () Bool)

(assert (=> b!1206485 (=> (not res!802170) (not e!685251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78063 (_ BitVec 32)) Bool)

(assert (=> b!1206485 (= res!802170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547092 mask!1564))))

(assert (=> b!1206485 (= lt!547092 (array!78064 (store (arr!37666 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38203 _keys!1208)))))

(declare-fun b!1206486 () Bool)

(declare-fun e!685259 () Bool)

(assert (=> b!1206486 (= e!685259 true)))

(declare-fun e!685256 () Bool)

(assert (=> b!1206486 e!685256))

(declare-fun res!802168 () Bool)

(assert (=> b!1206486 (=> (not res!802168) (not e!685256))))

(assert (=> b!1206486 (= res!802168 e!685253)))

(declare-fun c!118640 () Bool)

(assert (=> b!1206486 (= c!118640 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547103 () Unit!39914)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!571 (array!78063 array!78065 (_ BitVec 32) (_ BitVec 32) V!45961 V!45961 (_ BitVec 64) (_ BitVec 32) Int) Unit!39914)

(assert (=> b!1206486 (= lt!547103 (lemmaListMapContainsThenArrayContainsFrom!571 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547097 () Unit!39914)

(declare-fun e!685252 () Unit!39914)

(assert (=> b!1206486 (= lt!547097 e!685252)))

(declare-fun c!118639 () Bool)

(assert (=> b!1206486 (= c!118639 (and (not lt!547104) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206486 (= lt!547104 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1206487 () Bool)

(declare-fun res!802175 () Bool)

(assert (=> b!1206487 (=> (not res!802175) (not e!685250))))

(assert (=> b!1206487 (= res!802175 (and (= (size!38204 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38203 _keys!1208) (size!38204 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1206488 () Bool)

(declare-fun e!685246 () Unit!39914)

(assert (=> b!1206488 (= e!685252 e!685246)))

(declare-fun c!118637 () Bool)

(assert (=> b!1206488 (= c!118637 (and (not lt!547104) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1206489 () Bool)

(declare-fun res!802176 () Bool)

(assert (=> b!1206489 (=> (not res!802176) (not e!685250))))

(assert (=> b!1206489 (= res!802176 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26531))))

(declare-fun b!1206490 () Bool)

(declare-fun e!685248 () Bool)

(assert (=> b!1206490 (= e!685247 e!685248)))

(declare-fun res!802174 () Bool)

(assert (=> b!1206490 (=> res!802174 e!685248)))

(assert (=> b!1206490 (= res!802174 (not (= (select (arr!37666 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1206490 e!685254))

(declare-fun c!118638 () Bool)

(assert (=> b!1206490 (= c!118638 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547094 () Unit!39914)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1029 (array!78063 array!78065 (_ BitVec 32) (_ BitVec 32) V!45961 V!45961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39914)

(assert (=> b!1206490 (= lt!547094 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1029 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206491 () Bool)

(declare-fun arrayContainsKey!0 (array!78063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206491 (= e!685253 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58453 () Bool)

(declare-fun call!58448 () ListLongMap!17701)

(declare-fun bm!58446 () Bool)

(declare-fun lt!547093 () ListLongMap!17701)

(declare-fun contains!6946 (ListLongMap!17701 (_ BitVec 64)) Bool)

(assert (=> bm!58446 (= call!58453 (contains!6946 (ite c!118639 lt!547093 call!58448) k0!934))))

(declare-fun b!1206492 () Bool)

(declare-fun Unit!39916 () Unit!39914)

(assert (=> b!1206492 (= e!685245 Unit!39916)))

(declare-fun bm!58447 () Bool)

(assert (=> bm!58447 (= call!58450 call!58453)))

(declare-fun mapIsEmpty!47793 () Bool)

(declare-fun mapRes!47793 () Bool)

(assert (=> mapIsEmpty!47793 mapRes!47793))

(declare-fun b!1206493 () Bool)

(assert (=> b!1206493 (= e!685254 (= call!58446 call!58449))))

(declare-fun res!802172 () Bool)

(assert (=> start!100986 (=> (not res!802172) (not e!685250))))

(assert (=> start!100986 (= res!802172 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38203 _keys!1208))))))

(assert (=> start!100986 e!685250))

(assert (=> start!100986 tp_is_empty!30625))

(declare-fun array_inv!28762 (array!78063) Bool)

(assert (=> start!100986 (array_inv!28762 _keys!1208)))

(assert (=> start!100986 true))

(assert (=> start!100986 tp!90766))

(declare-fun e!685258 () Bool)

(declare-fun array_inv!28763 (array!78065) Bool)

(assert (=> start!100986 (and (array_inv!28763 _values!996) e!685258)))

(declare-fun b!1206480 () Bool)

(declare-fun res!802166 () Bool)

(assert (=> b!1206480 (=> (not res!802166) (not e!685250))))

(assert (=> b!1206480 (= res!802166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1206494 () Bool)

(declare-fun c!118641 () Bool)

(assert (=> b!1206494 (= c!118641 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547104))))

(assert (=> b!1206494 (= e!685246 e!685245)))

(declare-fun b!1206495 () Bool)

(assert (=> b!1206495 (= e!685248 e!685259)))

(declare-fun res!802165 () Bool)

(assert (=> b!1206495 (=> res!802165 e!685259)))

(declare-fun lt!547101 () ListLongMap!17701)

(assert (=> b!1206495 (= res!802165 (not (contains!6946 lt!547101 k0!934)))))

(assert (=> b!1206495 (= lt!547101 (getCurrentListMapNoExtraKeys!5329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206496 () Bool)

(declare-fun lt!547095 () Unit!39914)

(assert (=> b!1206496 (= e!685252 lt!547095)))

(declare-fun lt!547096 () Unit!39914)

(assert (=> b!1206496 (= lt!547096 call!58452)))

(declare-fun call!58447 () ListLongMap!17701)

(assert (=> b!1206496 (= lt!547093 call!58447)))

(assert (=> b!1206496 call!58453))

(declare-fun addStillContains!1015 (ListLongMap!17701 (_ BitVec 64) V!45961 (_ BitVec 64)) Unit!39914)

(assert (=> b!1206496 (= lt!547095 (addStillContains!1015 lt!547093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!4031 (ListLongMap!17701 tuple2!19724) ListLongMap!17701)

(assert (=> b!1206496 (contains!6946 (+!4031 lt!547093 (tuple2!19725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!58448 () Bool)

(assert (=> bm!58448 (= call!58452 (addStillContains!1015 lt!547101 (ite (or c!118639 c!118637) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118639 c!118637) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!58449 () Bool)

(assert (=> bm!58449 (= call!58447 (+!4031 lt!547101 (ite (or c!118639 c!118637) (tuple2!19725 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapNonEmpty!47793 () Bool)

(declare-fun tp!90765 () Bool)

(declare-fun e!685249 () Bool)

(assert (=> mapNonEmpty!47793 (= mapRes!47793 (and tp!90765 e!685249))))

(declare-fun mapKey!47793 () (_ BitVec 32))

(declare-fun mapValue!47793 () ValueCell!14603)

(declare-fun mapRest!47793 () (Array (_ BitVec 32) ValueCell!14603))

(assert (=> mapNonEmpty!47793 (= (arr!37667 _values!996) (store mapRest!47793 mapKey!47793 mapValue!47793))))

(declare-fun bm!58450 () Bool)

(assert (=> bm!58450 (= call!58448 call!58447)))

(declare-fun b!1206497 () Bool)

(assert (=> b!1206497 (= e!685251 (not e!685255))))

(declare-fun res!802169 () Bool)

(assert (=> b!1206497 (=> res!802169 e!685255)))

(assert (=> b!1206497 (= res!802169 (bvsgt from!1455 i!673))))

(assert (=> b!1206497 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547100 () Unit!39914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78063 (_ BitVec 64) (_ BitVec 32)) Unit!39914)

(assert (=> b!1206497 (= lt!547100 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1206498 () Bool)

(declare-fun res!802171 () Bool)

(assert (=> b!1206498 (=> (not res!802171) (not e!685250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206498 (= res!802171 (validMask!0 mask!1564))))

(declare-fun b!1206499 () Bool)

(assert (=> b!1206499 (= e!685256 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206500 () Bool)

(assert (=> b!1206500 call!58450))

(declare-fun lt!547098 () Unit!39914)

(assert (=> b!1206500 (= lt!547098 call!58451)))

(assert (=> b!1206500 (= e!685246 lt!547098)))

(declare-fun b!1206501 () Bool)

(assert (=> b!1206501 (= e!685249 tp_is_empty!30625)))

(declare-fun b!1206502 () Bool)

(declare-fun res!802164 () Bool)

(assert (=> b!1206502 (=> (not res!802164) (not e!685250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206502 (= res!802164 (validKeyInArray!0 k0!934))))

(declare-fun b!1206503 () Bool)

(assert (=> b!1206503 (= e!685258 (and e!685257 mapRes!47793))))

(declare-fun condMapEmpty!47793 () Bool)

(declare-fun mapDefault!47793 () ValueCell!14603)

(assert (=> b!1206503 (= condMapEmpty!47793 (= (arr!37667 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14603)) mapDefault!47793)))))

(assert (= (and start!100986 res!802172) b!1206498))

(assert (= (and b!1206498 res!802171) b!1206487))

(assert (= (and b!1206487 res!802175) b!1206480))

(assert (= (and b!1206480 res!802166) b!1206489))

(assert (= (and b!1206489 res!802176) b!1206481))

(assert (= (and b!1206481 res!802177) b!1206502))

(assert (= (and b!1206502 res!802164) b!1206479))

(assert (= (and b!1206479 res!802163) b!1206485))

(assert (= (and b!1206485 res!802170) b!1206484))

(assert (= (and b!1206484 res!802173) b!1206497))

(assert (= (and b!1206497 (not res!802169)) b!1206482))

(assert (= (and b!1206482 (not res!802167)) b!1206490))

(assert (= (and b!1206490 c!118638) b!1206477))

(assert (= (and b!1206490 (not c!118638)) b!1206493))

(assert (= (or b!1206477 b!1206493) bm!58443))

(assert (= (or b!1206477 b!1206493) bm!58445))

(assert (= (and b!1206490 (not res!802174)) b!1206495))

(assert (= (and b!1206495 (not res!802165)) b!1206486))

(assert (= (and b!1206486 c!118639) b!1206496))

(assert (= (and b!1206486 (not c!118639)) b!1206488))

(assert (= (and b!1206488 c!118637) b!1206500))

(assert (= (and b!1206488 (not c!118637)) b!1206494))

(assert (= (and b!1206494 c!118641) b!1206476))

(assert (= (and b!1206494 (not c!118641)) b!1206492))

(assert (= (or b!1206500 b!1206476) bm!58444))

(assert (= (or b!1206500 b!1206476) bm!58450))

(assert (= (or b!1206500 b!1206476) bm!58447))

(assert (= (or b!1206496 bm!58447) bm!58446))

(assert (= (or b!1206496 bm!58444) bm!58448))

(assert (= (or b!1206496 bm!58450) bm!58449))

(assert (= (and b!1206486 c!118640) b!1206491))

(assert (= (and b!1206486 (not c!118640)) b!1206478))

(assert (= (and b!1206486 res!802168) b!1206499))

(assert (= (and b!1206503 condMapEmpty!47793) mapIsEmpty!47793))

(assert (= (and b!1206503 (not condMapEmpty!47793)) mapNonEmpty!47793))

(get-info :version)

(assert (= (and mapNonEmpty!47793 ((_ is ValueCellFull!14603) mapValue!47793)) b!1206501))

(assert (= (and b!1206503 ((_ is ValueCellFull!14603) mapDefault!47793)) b!1206483))

(assert (= start!100986 b!1206503))

(declare-fun b_lambda!21319 () Bool)

(assert (=> (not b_lambda!21319) (not b!1206482)))

(declare-fun t!39425 () Bool)

(declare-fun tb!10713 () Bool)

(assert (=> (and start!100986 (= defaultEntry!1004 defaultEntry!1004) t!39425) tb!10713))

(declare-fun result!22019 () Bool)

(assert (=> tb!10713 (= result!22019 tp_is_empty!30625)))

(assert (=> b!1206482 t!39425))

(declare-fun b_and!42833 () Bool)

(assert (= b_and!42831 (and (=> t!39425 result!22019) b_and!42833)))

(declare-fun m!1112753 () Bool)

(assert (=> b!1206498 m!1112753))

(declare-fun m!1112755 () Bool)

(assert (=> b!1206496 m!1112755))

(declare-fun m!1112757 () Bool)

(assert (=> b!1206496 m!1112757))

(assert (=> b!1206496 m!1112757))

(declare-fun m!1112759 () Bool)

(assert (=> b!1206496 m!1112759))

(declare-fun m!1112761 () Bool)

(assert (=> b!1206477 m!1112761))

(declare-fun m!1112763 () Bool)

(assert (=> b!1206491 m!1112763))

(declare-fun m!1112765 () Bool)

(assert (=> start!100986 m!1112765))

(declare-fun m!1112767 () Bool)

(assert (=> start!100986 m!1112767))

(declare-fun m!1112769 () Bool)

(assert (=> bm!58449 m!1112769))

(declare-fun m!1112771 () Bool)

(assert (=> b!1206479 m!1112771))

(declare-fun m!1112773 () Bool)

(assert (=> bm!58448 m!1112773))

(declare-fun m!1112775 () Bool)

(assert (=> bm!58443 m!1112775))

(declare-fun m!1112777 () Bool)

(assert (=> b!1206484 m!1112777))

(declare-fun m!1112779 () Bool)

(assert (=> b!1206497 m!1112779))

(declare-fun m!1112781 () Bool)

(assert (=> b!1206497 m!1112781))

(declare-fun m!1112783 () Bool)

(assert (=> b!1206495 m!1112783))

(assert (=> b!1206495 m!1112775))

(declare-fun m!1112785 () Bool)

(assert (=> mapNonEmpty!47793 m!1112785))

(declare-fun m!1112787 () Bool)

(assert (=> b!1206480 m!1112787))

(declare-fun m!1112789 () Bool)

(assert (=> b!1206486 m!1112789))

(declare-fun m!1112791 () Bool)

(assert (=> b!1206485 m!1112791))

(declare-fun m!1112793 () Bool)

(assert (=> b!1206485 m!1112793))

(declare-fun m!1112795 () Bool)

(assert (=> b!1206489 m!1112795))

(declare-fun m!1112797 () Bool)

(assert (=> bm!58445 m!1112797))

(declare-fun m!1112799 () Bool)

(assert (=> b!1206490 m!1112799))

(declare-fun m!1112801 () Bool)

(assert (=> b!1206490 m!1112801))

(assert (=> b!1206499 m!1112763))

(declare-fun m!1112803 () Bool)

(assert (=> b!1206482 m!1112803))

(declare-fun m!1112805 () Bool)

(assert (=> b!1206482 m!1112805))

(declare-fun m!1112807 () Bool)

(assert (=> b!1206482 m!1112807))

(declare-fun m!1112809 () Bool)

(assert (=> b!1206482 m!1112809))

(declare-fun m!1112811 () Bool)

(assert (=> bm!58446 m!1112811))

(declare-fun m!1112813 () Bool)

(assert (=> b!1206502 m!1112813))

(check-sat (not b!1206484) (not b!1206495) (not b!1206490) (not b!1206485) (not b!1206498) (not mapNonEmpty!47793) (not b_lambda!21319) b_and!42833 (not b!1206496) (not bm!58449) (not bm!58445) (not b!1206477) (not bm!58446) tp_is_empty!30625 (not b!1206480) (not b!1206497) (not b!1206499) (not b!1206482) (not b!1206491) (not b_next!25921) (not b!1206502) (not b!1206489) (not start!100986) (not bm!58448) (not bm!58443) (not b!1206486))
(check-sat b_and!42833 (not b_next!25921))
