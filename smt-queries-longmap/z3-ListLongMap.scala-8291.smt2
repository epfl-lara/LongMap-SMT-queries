; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101020 () Bool)

(assert start!101020)

(declare-fun b_free!26019 () Bool)

(declare-fun b_next!26019 () Bool)

(assert (=> start!101020 (= b_free!26019 (not b_next!26019))))

(declare-fun tp!91073 () Bool)

(declare-fun b_and!43119 () Bool)

(assert (=> start!101020 (= tp!91073 b_and!43119)))

(declare-fun c!119287 () Bool)

(declare-datatypes ((V!46091 0))(
  ( (V!46092 (val!15418 Int)) )
))
(declare-datatypes ((tuple2!19802 0))(
  ( (tuple2!19803 (_1!9912 (_ BitVec 64)) (_2!9912 V!46091)) )
))
(declare-datatypes ((List!26603 0))(
  ( (Nil!26600) (Cons!26599 (h!27808 tuple2!19802) (t!39602 List!26603)) )
))
(declare-datatypes ((ListLongMap!17771 0))(
  ( (ListLongMap!17772 (toList!8901 List!26603)) )
))
(declare-fun call!59671 () ListLongMap!17771)

(declare-fun call!59674 () Bool)

(declare-fun bm!59666 () Bool)

(declare-fun lt!549662 () ListLongMap!17771)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6972 (ListLongMap!17771 (_ BitVec 64)) Bool)

(assert (=> bm!59666 (= call!59674 (contains!6972 (ite c!119287 lt!549662 call!59671) k0!934))))

(declare-fun b!1210570 () Bool)

(declare-fun e!687509 () Bool)

(declare-fun tp_is_empty!30723 () Bool)

(assert (=> b!1210570 (= e!687509 tp_is_empty!30723)))

(declare-fun b!1210571 () Bool)

(declare-datatypes ((Unit!40130 0))(
  ( (Unit!40131) )
))
(declare-fun e!687507 () Unit!40130)

(declare-fun Unit!40132 () Unit!40130)

(assert (=> b!1210571 (= e!687507 Unit!40132)))

(declare-fun b!1210572 () Bool)

(declare-fun c!119288 () Bool)

(declare-fun lt!549650 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1210572 (= c!119288 (and (not lt!549650) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687504 () Unit!40130)

(declare-fun e!687513 () Unit!40130)

(assert (=> b!1210572 (= e!687504 e!687513)))

(declare-datatypes ((array!78231 0))(
  ( (array!78232 (arr!37752 (Array (_ BitVec 32) (_ BitVec 64))) (size!38288 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78231)

(declare-fun b!1210573 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!687518 () Bool)

(declare-fun arrayContainsKey!0 (array!78231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210573 (= e!687518 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210574 () Bool)

(declare-fun res!804384 () Bool)

(declare-fun e!687514 () Bool)

(assert (=> b!1210574 (=> (not res!804384) (not e!687514))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210574 (= res!804384 (= (select (arr!37752 _keys!1208) i!673) k0!934))))

(declare-fun b!1210575 () Bool)

(declare-fun res!804381 () Bool)

(assert (=> b!1210575 (=> (not res!804381) (not e!687514))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78231 (_ BitVec 32)) Bool)

(assert (=> b!1210575 (= res!804381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47953 () Bool)

(declare-fun mapRes!47953 () Bool)

(declare-fun tp!91072 () Bool)

(declare-fun e!687506 () Bool)

(assert (=> mapNonEmpty!47953 (= mapRes!47953 (and tp!91072 e!687506))))

(declare-datatypes ((ValueCell!14652 0))(
  ( (ValueCellFull!14652 (v!18069 V!46091)) (EmptyCell!14652) )
))
(declare-fun mapRest!47953 () (Array (_ BitVec 32) ValueCell!14652))

(declare-fun mapValue!47953 () ValueCell!14652)

(declare-datatypes ((array!78233 0))(
  ( (array!78234 (arr!37753 (Array (_ BitVec 32) ValueCell!14652)) (size!38289 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78233)

(declare-fun mapKey!47953 () (_ BitVec 32))

(assert (=> mapNonEmpty!47953 (= (arr!37753 _values!996) (store mapRest!47953 mapKey!47953 mapValue!47953))))

(declare-fun b!1210576 () Bool)

(declare-fun Unit!40133 () Unit!40130)

(assert (=> b!1210576 (= e!687507 Unit!40133)))

(assert (=> b!1210576 (= lt!549650 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1210576 (= c!119287 (and (not lt!549650) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549661 () Unit!40130)

(assert (=> b!1210576 (= lt!549661 e!687504)))

(declare-fun zeroValue!944 () V!46091)

(declare-fun lt!549663 () Unit!40130)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46091)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!598 (array!78231 array!78233 (_ BitVec 32) (_ BitVec 32) V!46091 V!46091 (_ BitVec 64) (_ BitVec 32) Int) Unit!40130)

(assert (=> b!1210576 (= lt!549663 (lemmaListMapContainsThenArrayContainsFrom!598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119286 () Bool)

(assert (=> b!1210576 (= c!119286 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804375 () Bool)

(declare-fun e!687516 () Bool)

(assert (=> b!1210576 (= res!804375 e!687516)))

(assert (=> b!1210576 (=> (not res!804375) (not e!687518))))

(assert (=> b!1210576 e!687518))

(declare-fun lt!549660 () Unit!40130)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78231 (_ BitVec 32) (_ BitVec 32)) Unit!40130)

(assert (=> b!1210576 (= lt!549660 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26604 0))(
  ( (Nil!26601) (Cons!26600 (h!27809 (_ BitVec 64)) (t!39603 List!26604)) )
))
(declare-fun arrayNoDuplicates!0 (array!78231 (_ BitVec 32) List!26604) Bool)

(assert (=> b!1210576 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26601)))

(declare-fun lt!549654 () Unit!40130)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78231 (_ BitVec 64) (_ BitVec 32) List!26604) Unit!40130)

(assert (=> b!1210576 (= lt!549654 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26601))))

(assert (=> b!1210576 false))

(declare-fun b!1210577 () Bool)

(declare-fun res!804374 () Bool)

(assert (=> b!1210577 (=> (not res!804374) (not e!687514))))

(assert (=> b!1210577 (= res!804374 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38288 _keys!1208))))))

(declare-fun bm!59668 () Bool)

(declare-fun call!59670 () Unit!40130)

(declare-fun call!59669 () Unit!40130)

(assert (=> bm!59668 (= call!59670 call!59669)))

(declare-fun b!1210578 () Bool)

(assert (=> b!1210578 (= e!687516 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549650) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210579 () Bool)

(declare-fun res!804380 () Bool)

(assert (=> b!1210579 (=> (not res!804380) (not e!687514))))

(assert (=> b!1210579 (= res!804380 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26601))))

(declare-fun b!1210580 () Bool)

(declare-fun e!687508 () Bool)

(declare-fun e!687510 () Bool)

(assert (=> b!1210580 (= e!687508 e!687510)))

(declare-fun res!804382 () Bool)

(assert (=> b!1210580 (=> res!804382 e!687510)))

(assert (=> b!1210580 (= res!804382 (not (= from!1455 i!673)))))

(declare-fun lt!549664 () array!78231)

(declare-fun lt!549659 () array!78233)

(declare-fun lt!549657 () ListLongMap!17771)

(declare-fun getCurrentListMapNoExtraKeys!5333 (array!78231 array!78233 (_ BitVec 32) (_ BitVec 32) V!46091 V!46091 (_ BitVec 32) Int) ListLongMap!17771)

(assert (=> b!1210580 (= lt!549657 (getCurrentListMapNoExtraKeys!5333 lt!549664 lt!549659 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3230 (Int (_ BitVec 64)) V!46091)

(assert (=> b!1210580 (= lt!549659 (array!78234 (store (arr!37753 _values!996) i!673 (ValueCellFull!14652 (dynLambda!3230 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38289 _values!996)))))

(declare-fun lt!549653 () ListLongMap!17771)

(assert (=> b!1210580 (= lt!549653 (getCurrentListMapNoExtraKeys!5333 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1210581 () Bool)

(declare-fun res!804372 () Bool)

(assert (=> b!1210581 (=> (not res!804372) (not e!687514))))

(assert (=> b!1210581 (= res!804372 (and (= (size!38289 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38288 _keys!1208) (size!38289 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!687517 () Bool)

(declare-fun b!1210582 () Bool)

(declare-fun lt!549666 () ListLongMap!17771)

(assert (=> b!1210582 (= e!687517 (not (contains!6972 lt!549666 (select (arr!37752 _keys!1208) from!1455))))))

(declare-fun lt!549665 () Unit!40130)

(assert (=> b!1210582 (= lt!549665 e!687507)))

(declare-fun c!119283 () Bool)

(assert (=> b!1210582 (= c!119283 (contains!6972 lt!549666 k0!934))))

(assert (=> b!1210582 (= lt!549666 (getCurrentListMapNoExtraKeys!5333 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210583 () Bool)

(assert (=> b!1210583 (= e!687510 e!687517)))

(declare-fun res!804373 () Bool)

(assert (=> b!1210583 (=> res!804373 e!687517)))

(assert (=> b!1210583 (= res!804373 (not (= (select (arr!37752 _keys!1208) from!1455) k0!934)))))

(declare-fun e!687515 () Bool)

(assert (=> b!1210583 e!687515))

(declare-fun c!119284 () Bool)

(assert (=> b!1210583 (= c!119284 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549651 () Unit!40130)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1060 (array!78231 array!78233 (_ BitVec 32) (_ BitVec 32) V!46091 V!46091 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40130)

(assert (=> b!1210583 (= lt!549651 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1060 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59669 () Bool)

(declare-fun call!59672 () Bool)

(assert (=> bm!59669 (= call!59672 call!59674)))

(declare-fun b!1210584 () Bool)

(declare-fun e!687511 () Bool)

(assert (=> b!1210584 (= e!687514 e!687511)))

(declare-fun res!804383 () Bool)

(assert (=> b!1210584 (=> (not res!804383) (not e!687511))))

(assert (=> b!1210584 (= res!804383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549664 mask!1564))))

(assert (=> b!1210584 (= lt!549664 (array!78232 (store (arr!37752 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38288 _keys!1208)))))

(declare-fun b!1210585 () Bool)

(assert (=> b!1210585 (= e!687516 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210586 () Bool)

(declare-fun e!687512 () Unit!40130)

(assert (=> b!1210586 (= e!687513 e!687512)))

(declare-fun c!119285 () Bool)

(assert (=> b!1210586 (= c!119285 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549650))))

(declare-fun bm!59670 () Bool)

(declare-fun addStillContains!1047 (ListLongMap!17771 (_ BitVec 64) V!46091 (_ BitVec 64)) Unit!40130)

(assert (=> bm!59670 (= call!59669 (addStillContains!1047 lt!549666 (ite (or c!119287 c!119288) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119287 c!119288) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1210587 () Bool)

(declare-fun lt!549655 () Unit!40130)

(assert (=> b!1210587 (= e!687513 lt!549655)))

(assert (=> b!1210587 (= lt!549655 call!59670)))

(assert (=> b!1210587 call!59672))

(declare-fun mapIsEmpty!47953 () Bool)

(assert (=> mapIsEmpty!47953 mapRes!47953))

(declare-fun res!804377 () Bool)

(assert (=> start!101020 (=> (not res!804377) (not e!687514))))

(assert (=> start!101020 (= res!804377 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38288 _keys!1208))))))

(assert (=> start!101020 e!687514))

(assert (=> start!101020 tp_is_empty!30723))

(declare-fun array_inv!28756 (array!78231) Bool)

(assert (=> start!101020 (array_inv!28756 _keys!1208)))

(assert (=> start!101020 true))

(assert (=> start!101020 tp!91073))

(declare-fun e!687505 () Bool)

(declare-fun array_inv!28757 (array!78233) Bool)

(assert (=> start!101020 (and (array_inv!28757 _values!996) e!687505)))

(declare-fun call!59676 () ListLongMap!17771)

(declare-fun bm!59667 () Bool)

(declare-fun +!4019 (ListLongMap!17771 tuple2!19802) ListLongMap!17771)

(assert (=> bm!59667 (= call!59676 (+!4019 (ite c!119287 lt!549662 lt!549666) (ite c!119287 (tuple2!19803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119288 (tuple2!19803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1210588 () Bool)

(declare-fun res!804371 () Bool)

(assert (=> b!1210588 (=> (not res!804371) (not e!687514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210588 (= res!804371 (validKeyInArray!0 k0!934))))

(declare-fun b!1210589 () Bool)

(assert (=> b!1210589 (= e!687505 (and e!687509 mapRes!47953))))

(declare-fun condMapEmpty!47953 () Bool)

(declare-fun mapDefault!47953 () ValueCell!14652)

(assert (=> b!1210589 (= condMapEmpty!47953 (= (arr!37753 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14652)) mapDefault!47953)))))

(declare-fun b!1210590 () Bool)

(assert (=> b!1210590 call!59672))

(declare-fun lt!549667 () Unit!40130)

(assert (=> b!1210590 (= lt!549667 call!59670)))

(assert (=> b!1210590 (= e!687512 lt!549667)))

(declare-fun call!59673 () ListLongMap!17771)

(declare-fun call!59675 () ListLongMap!17771)

(declare-fun b!1210591 () Bool)

(declare-fun -!1850 (ListLongMap!17771 (_ BitVec 64)) ListLongMap!17771)

(assert (=> b!1210591 (= e!687515 (= call!59675 (-!1850 call!59673 k0!934)))))

(declare-fun bm!59671 () Bool)

(assert (=> bm!59671 (= call!59673 (getCurrentListMapNoExtraKeys!5333 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59672 () Bool)

(assert (=> bm!59672 (= call!59671 call!59676)))

(declare-fun b!1210592 () Bool)

(declare-fun res!804376 () Bool)

(assert (=> b!1210592 (=> (not res!804376) (not e!687511))))

(assert (=> b!1210592 (= res!804376 (arrayNoDuplicates!0 lt!549664 #b00000000000000000000000000000000 Nil!26601))))

(declare-fun b!1210593 () Bool)

(assert (=> b!1210593 (= e!687515 (= call!59675 call!59673))))

(declare-fun b!1210594 () Bool)

(assert (=> b!1210594 (= e!687506 tp_is_empty!30723)))

(declare-fun b!1210595 () Bool)

(declare-fun res!804379 () Bool)

(assert (=> b!1210595 (=> (not res!804379) (not e!687514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210595 (= res!804379 (validMask!0 mask!1564))))

(declare-fun b!1210596 () Bool)

(assert (=> b!1210596 (contains!6972 call!59676 k0!934)))

(declare-fun lt!549656 () Unit!40130)

(assert (=> b!1210596 (= lt!549656 (addStillContains!1047 lt!549662 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1210596 call!59674))

(assert (=> b!1210596 (= lt!549662 (+!4019 lt!549666 (tuple2!19803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549652 () Unit!40130)

(assert (=> b!1210596 (= lt!549652 call!59669)))

(assert (=> b!1210596 (= e!687504 lt!549656)))

(declare-fun b!1210597 () Bool)

(assert (=> b!1210597 (= e!687511 (not e!687508))))

(declare-fun res!804378 () Bool)

(assert (=> b!1210597 (=> res!804378 e!687508)))

(assert (=> b!1210597 (= res!804378 (bvsgt from!1455 i!673))))

(assert (=> b!1210597 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549658 () Unit!40130)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78231 (_ BitVec 64) (_ BitVec 32)) Unit!40130)

(assert (=> b!1210597 (= lt!549658 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1210598 () Bool)

(declare-fun Unit!40134 () Unit!40130)

(assert (=> b!1210598 (= e!687512 Unit!40134)))

(declare-fun bm!59673 () Bool)

(assert (=> bm!59673 (= call!59675 (getCurrentListMapNoExtraKeys!5333 lt!549664 lt!549659 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101020 res!804377) b!1210595))

(assert (= (and b!1210595 res!804379) b!1210581))

(assert (= (and b!1210581 res!804372) b!1210575))

(assert (= (and b!1210575 res!804381) b!1210579))

(assert (= (and b!1210579 res!804380) b!1210577))

(assert (= (and b!1210577 res!804374) b!1210588))

(assert (= (and b!1210588 res!804371) b!1210574))

(assert (= (and b!1210574 res!804384) b!1210584))

(assert (= (and b!1210584 res!804383) b!1210592))

(assert (= (and b!1210592 res!804376) b!1210597))

(assert (= (and b!1210597 (not res!804378)) b!1210580))

(assert (= (and b!1210580 (not res!804382)) b!1210583))

(assert (= (and b!1210583 c!119284) b!1210591))

(assert (= (and b!1210583 (not c!119284)) b!1210593))

(assert (= (or b!1210591 b!1210593) bm!59673))

(assert (= (or b!1210591 b!1210593) bm!59671))

(assert (= (and b!1210583 (not res!804373)) b!1210582))

(assert (= (and b!1210582 c!119283) b!1210576))

(assert (= (and b!1210582 (not c!119283)) b!1210571))

(assert (= (and b!1210576 c!119287) b!1210596))

(assert (= (and b!1210576 (not c!119287)) b!1210572))

(assert (= (and b!1210572 c!119288) b!1210587))

(assert (= (and b!1210572 (not c!119288)) b!1210586))

(assert (= (and b!1210586 c!119285) b!1210590))

(assert (= (and b!1210586 (not c!119285)) b!1210598))

(assert (= (or b!1210587 b!1210590) bm!59668))

(assert (= (or b!1210587 b!1210590) bm!59672))

(assert (= (or b!1210587 b!1210590) bm!59669))

(assert (= (or b!1210596 bm!59669) bm!59666))

(assert (= (or b!1210596 bm!59668) bm!59670))

(assert (= (or b!1210596 bm!59672) bm!59667))

(assert (= (and b!1210576 c!119286) b!1210585))

(assert (= (and b!1210576 (not c!119286)) b!1210578))

(assert (= (and b!1210576 res!804375) b!1210573))

(assert (= (and b!1210589 condMapEmpty!47953) mapIsEmpty!47953))

(assert (= (and b!1210589 (not condMapEmpty!47953)) mapNonEmpty!47953))

(get-info :version)

(assert (= (and mapNonEmpty!47953 ((_ is ValueCellFull!14652) mapValue!47953)) b!1210594))

(assert (= (and b!1210589 ((_ is ValueCellFull!14652) mapDefault!47953)) b!1210570))

(assert (= start!101020 b!1210589))

(declare-fun b_lambda!21619 () Bool)

(assert (=> (not b_lambda!21619) (not b!1210580)))

(declare-fun t!39601 () Bool)

(declare-fun tb!10819 () Bool)

(assert (=> (and start!101020 (= defaultEntry!1004 defaultEntry!1004) t!39601) tb!10819))

(declare-fun result!22231 () Bool)

(assert (=> tb!10819 (= result!22231 tp_is_empty!30723)))

(assert (=> b!1210580 t!39601))

(declare-fun b_and!43121 () Bool)

(assert (= b_and!43119 (and (=> t!39601 result!22231) b_and!43121)))

(declare-fun m!1116041 () Bool)

(assert (=> b!1210576 m!1116041))

(declare-fun m!1116043 () Bool)

(assert (=> b!1210576 m!1116043))

(declare-fun m!1116045 () Bool)

(assert (=> b!1210576 m!1116045))

(declare-fun m!1116047 () Bool)

(assert (=> b!1210576 m!1116047))

(declare-fun m!1116049 () Bool)

(assert (=> b!1210595 m!1116049))

(declare-fun m!1116051 () Bool)

(assert (=> b!1210597 m!1116051))

(declare-fun m!1116053 () Bool)

(assert (=> b!1210597 m!1116053))

(declare-fun m!1116055 () Bool)

(assert (=> bm!59671 m!1116055))

(declare-fun m!1116057 () Bool)

(assert (=> b!1210574 m!1116057))

(declare-fun m!1116059 () Bool)

(assert (=> b!1210585 m!1116059))

(declare-fun m!1116061 () Bool)

(assert (=> b!1210596 m!1116061))

(declare-fun m!1116063 () Bool)

(assert (=> b!1210596 m!1116063))

(declare-fun m!1116065 () Bool)

(assert (=> b!1210596 m!1116065))

(declare-fun m!1116067 () Bool)

(assert (=> b!1210582 m!1116067))

(assert (=> b!1210582 m!1116067))

(declare-fun m!1116069 () Bool)

(assert (=> b!1210582 m!1116069))

(declare-fun m!1116071 () Bool)

(assert (=> b!1210582 m!1116071))

(assert (=> b!1210582 m!1116055))

(assert (=> b!1210573 m!1116059))

(declare-fun m!1116073 () Bool)

(assert (=> b!1210575 m!1116073))

(declare-fun m!1116075 () Bool)

(assert (=> bm!59667 m!1116075))

(declare-fun m!1116077 () Bool)

(assert (=> bm!59670 m!1116077))

(declare-fun m!1116079 () Bool)

(assert (=> b!1210584 m!1116079))

(declare-fun m!1116081 () Bool)

(assert (=> b!1210584 m!1116081))

(declare-fun m!1116083 () Bool)

(assert (=> b!1210588 m!1116083))

(declare-fun m!1116085 () Bool)

(assert (=> start!101020 m!1116085))

(declare-fun m!1116087 () Bool)

(assert (=> start!101020 m!1116087))

(declare-fun m!1116089 () Bool)

(assert (=> b!1210579 m!1116089))

(declare-fun m!1116091 () Bool)

(assert (=> b!1210592 m!1116091))

(assert (=> b!1210583 m!1116067))

(declare-fun m!1116093 () Bool)

(assert (=> b!1210583 m!1116093))

(declare-fun m!1116095 () Bool)

(assert (=> b!1210591 m!1116095))

(declare-fun m!1116097 () Bool)

(assert (=> mapNonEmpty!47953 m!1116097))

(declare-fun m!1116099 () Bool)

(assert (=> bm!59673 m!1116099))

(declare-fun m!1116101 () Bool)

(assert (=> b!1210580 m!1116101))

(declare-fun m!1116103 () Bool)

(assert (=> b!1210580 m!1116103))

(declare-fun m!1116105 () Bool)

(assert (=> b!1210580 m!1116105))

(declare-fun m!1116107 () Bool)

(assert (=> b!1210580 m!1116107))

(declare-fun m!1116109 () Bool)

(assert (=> bm!59666 m!1116109))

(check-sat (not b!1210591) (not bm!59671) (not b!1210592) (not b!1210596) (not b_next!26019) (not start!101020) (not b!1210575) (not b!1210580) (not b!1210588) b_and!43121 (not b!1210595) tp_is_empty!30723 (not mapNonEmpty!47953) (not b!1210582) (not b!1210579) (not b_lambda!21619) (not b!1210585) (not b!1210597) (not bm!59670) (not bm!59667) (not bm!59666) (not b!1210576) (not bm!59673) (not b!1210573) (not b!1210584) (not b!1210583))
(check-sat b_and!43121 (not b_next!26019))
