; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100708 () Bool)

(assert start!100708)

(declare-fun b_free!25915 () Bool)

(declare-fun b_next!25915 () Bool)

(assert (=> start!100708 (= b_free!25915 (not b_next!25915))))

(declare-fun tp!90744 () Bool)

(declare-fun b_and!42773 () Bool)

(assert (=> start!100708 (= tp!90744 b_and!42773)))

(declare-fun b!1204632 () Bool)

(declare-fun e!684082 () Bool)

(declare-datatypes ((V!45953 0))(
  ( (V!45954 (val!15366 Int)) )
))
(declare-datatypes ((tuple2!19776 0))(
  ( (tuple2!19777 (_1!9899 (_ BitVec 64)) (_2!9899 V!45953)) )
))
(declare-datatypes ((List!26561 0))(
  ( (Nil!26558) (Cons!26557 (h!27766 tuple2!19776) (t!39447 List!26561)) )
))
(declare-datatypes ((ListLongMap!17745 0))(
  ( (ListLongMap!17746 (toList!8888 List!26561)) )
))
(declare-fun call!58270 () ListLongMap!17745)

(declare-fun call!58265 () ListLongMap!17745)

(assert (=> b!1204632 (= e!684082 (= call!58270 call!58265))))

(declare-fun b!1204633 () Bool)

(declare-datatypes ((Unit!39789 0))(
  ( (Unit!39790) )
))
(declare-fun e!684091 () Unit!39789)

(declare-fun e!684087 () Unit!39789)

(assert (=> b!1204633 (= e!684091 e!684087)))

(declare-fun c!118122 () Bool)

(declare-fun lt!546185 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1204633 (= c!118122 (and (not lt!546185) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!58262 () Bool)

(declare-fun call!58268 () Unit!39789)

(declare-fun call!58271 () Unit!39789)

(assert (=> bm!58262 (= call!58268 call!58271)))

(declare-fun b!1204634 () Bool)

(declare-fun e!684080 () Bool)

(declare-fun e!684079 () Bool)

(assert (=> b!1204634 (= e!684080 e!684079)))

(declare-fun res!801389 () Bool)

(assert (=> b!1204634 (=> (not res!801389) (not e!684079))))

(declare-datatypes ((array!77932 0))(
  ( (array!77933 (arr!37608 (Array (_ BitVec 32) (_ BitVec 64))) (size!38146 (_ BitVec 32))) )
))
(declare-fun lt!546175 () array!77932)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77932 (_ BitVec 32)) Bool)

(assert (=> b!1204634 (= res!801389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546175 mask!1564))))

(declare-fun _keys!1208 () array!77932)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1204634 (= lt!546175 (array!77933 (store (arr!37608 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38146 _keys!1208)))))

(declare-fun b!1204635 () Bool)

(declare-fun res!801398 () Bool)

(assert (=> b!1204635 (=> (not res!801398) (not e!684080))))

(assert (=> b!1204635 (= res!801398 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38146 _keys!1208))))))

(declare-fun b!1204636 () Bool)

(declare-fun e!684085 () Bool)

(declare-fun e!684093 () Bool)

(assert (=> b!1204636 (= e!684085 e!684093)))

(declare-fun res!801393 () Bool)

(assert (=> b!1204636 (=> res!801393 e!684093)))

(declare-fun lt!546183 () ListLongMap!17745)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6888 (ListLongMap!17745 (_ BitVec 64)) Bool)

(assert (=> b!1204636 (= res!801393 (not (contains!6888 lt!546183 k0!934)))))

(declare-fun zeroValue!944 () V!45953)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14600 0))(
  ( (ValueCellFull!14600 (v!18008 V!45953)) (EmptyCell!14600) )
))
(declare-datatypes ((array!77934 0))(
  ( (array!77935 (arr!37609 (Array (_ BitVec 32) ValueCell!14600)) (size!38147 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77934)

(declare-fun minValue!944 () V!45953)

(declare-fun getCurrentListMapNoExtraKeys!5334 (array!77932 array!77934 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 32) Int) ListLongMap!17745)

(assert (=> b!1204636 (= lt!546183 (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47781 () Bool)

(declare-fun mapRes!47781 () Bool)

(assert (=> mapIsEmpty!47781 mapRes!47781))

(declare-fun b!1204637 () Bool)

(declare-fun e!684088 () Bool)

(declare-fun e!684086 () Bool)

(assert (=> b!1204637 (= e!684088 (and e!684086 mapRes!47781))))

(declare-fun condMapEmpty!47781 () Bool)

(declare-fun mapDefault!47781 () ValueCell!14600)

(assert (=> b!1204637 (= condMapEmpty!47781 (= (arr!37609 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14600)) mapDefault!47781)))))

(declare-fun b!1204638 () Bool)

(declare-fun res!801392 () Bool)

(assert (=> b!1204638 (=> (not res!801392) (not e!684080))))

(assert (=> b!1204638 (= res!801392 (and (= (size!38147 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38146 _keys!1208) (size!38147 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1204639 () Bool)

(declare-fun e!684092 () Bool)

(declare-fun arrayContainsKey!0 (array!77932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1204639 (= e!684092 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1204640 () Bool)

(declare-fun res!801385 () Bool)

(assert (=> b!1204640 (=> (not res!801385) (not e!684079))))

(declare-datatypes ((List!26562 0))(
  ( (Nil!26559) (Cons!26558 (h!27767 (_ BitVec 64)) (t!39448 List!26562)) )
))
(declare-fun arrayNoDuplicates!0 (array!77932 (_ BitVec 32) List!26562) Bool)

(assert (=> b!1204640 (= res!801385 (arrayNoDuplicates!0 lt!546175 #b00000000000000000000000000000000 Nil!26559))))

(declare-fun b!1204641 () Bool)

(declare-fun res!801396 () Bool)

(assert (=> b!1204641 (=> (not res!801396) (not e!684080))))

(assert (=> b!1204641 (= res!801396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1204642 () Bool)

(declare-fun lt!546178 () Unit!39789)

(assert (=> b!1204642 (= e!684091 lt!546178)))

(declare-fun lt!546174 () Unit!39789)

(assert (=> b!1204642 (= lt!546174 call!58271)))

(declare-fun lt!546173 () ListLongMap!17745)

(declare-fun call!58269 () ListLongMap!17745)

(assert (=> b!1204642 (= lt!546173 call!58269)))

(declare-fun call!58267 () Bool)

(assert (=> b!1204642 call!58267))

(declare-fun addStillContains!1004 (ListLongMap!17745 (_ BitVec 64) V!45953 (_ BitVec 64)) Unit!39789)

(assert (=> b!1204642 (= lt!546178 (addStillContains!1004 lt!546173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!4020 (ListLongMap!17745 tuple2!19776) ListLongMap!17745)

(assert (=> b!1204642 (contains!6888 (+!4020 lt!546173 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1204643 () Bool)

(declare-fun e!684090 () Bool)

(declare-fun tp_is_empty!30619 () Bool)

(assert (=> b!1204643 (= e!684090 tp_is_empty!30619)))

(declare-fun bm!58263 () Bool)

(assert (=> bm!58263 (= call!58265 (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546177 () array!77934)

(declare-fun bm!58264 () Bool)

(assert (=> bm!58264 (= call!58270 (getCurrentListMapNoExtraKeys!5334 lt!546175 lt!546177 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204644 () Bool)

(assert (=> b!1204644 (= e!684093 (bvslt (size!38146 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun e!684089 () Bool)

(assert (=> b!1204644 e!684089))

(declare-fun res!801395 () Bool)

(assert (=> b!1204644 (=> (not res!801395) (not e!684089))))

(assert (=> b!1204644 (= res!801395 e!684092)))

(declare-fun c!118125 () Bool)

(assert (=> b!1204644 (= c!118125 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546184 () Unit!39789)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!557 (array!77932 array!77934 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 64) (_ BitVec 32) Int) Unit!39789)

(assert (=> b!1204644 (= lt!546184 (lemmaListMapContainsThenArrayContainsFrom!557 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546176 () Unit!39789)

(assert (=> b!1204644 (= lt!546176 e!684091)))

(declare-fun c!118124 () Bool)

(assert (=> b!1204644 (= c!118124 (and (not lt!546185) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1204644 (= lt!546185 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1204645 () Bool)

(declare-fun e!684078 () Unit!39789)

(declare-fun Unit!39791 () Unit!39789)

(assert (=> b!1204645 (= e!684078 Unit!39791)))

(declare-fun b!1204646 () Bool)

(assert (=> b!1204646 (= e!684092 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546185) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!801397 () Bool)

(assert (=> start!100708 (=> (not res!801397) (not e!684080))))

(assert (=> start!100708 (= res!801397 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38146 _keys!1208))))))

(assert (=> start!100708 e!684080))

(assert (=> start!100708 tp_is_empty!30619))

(declare-fun array_inv!28762 (array!77932) Bool)

(assert (=> start!100708 (array_inv!28762 _keys!1208)))

(assert (=> start!100708 true))

(assert (=> start!100708 tp!90744))

(declare-fun array_inv!28763 (array!77934) Bool)

(assert (=> start!100708 (and (array_inv!28763 _values!996) e!684088)))

(declare-fun b!1204647 () Bool)

(assert (=> b!1204647 (= e!684086 tp_is_empty!30619)))

(declare-fun b!1204648 () Bool)

(declare-fun call!58266 () Bool)

(assert (=> b!1204648 call!58266))

(declare-fun lt!546181 () Unit!39789)

(assert (=> b!1204648 (= lt!546181 call!58268)))

(assert (=> b!1204648 (= e!684087 lt!546181)))

(declare-fun b!1204649 () Bool)

(declare-fun e!684084 () Bool)

(assert (=> b!1204649 (= e!684084 e!684085)))

(declare-fun res!801388 () Bool)

(assert (=> b!1204649 (=> res!801388 e!684085)))

(assert (=> b!1204649 (= res!801388 (not (= (select (arr!37608 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1204649 e!684082))

(declare-fun c!118123 () Bool)

(assert (=> b!1204649 (= c!118123 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546186 () Unit!39789)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1028 (array!77932 array!77934 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39789)

(assert (=> b!1204649 (= lt!546186 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1028 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58265 () Bool)

(assert (=> bm!58265 (= call!58271 (addStillContains!1004 lt!546183 (ite (or c!118124 c!118122) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118124 c!118122) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1204650 () Bool)

(declare-fun e!684081 () Bool)

(assert (=> b!1204650 (= e!684081 e!684084)))

(declare-fun res!801384 () Bool)

(assert (=> b!1204650 (=> res!801384 e!684084)))

(assert (=> b!1204650 (= res!801384 (not (= from!1455 i!673)))))

(declare-fun lt!546180 () ListLongMap!17745)

(assert (=> b!1204650 (= lt!546180 (getCurrentListMapNoExtraKeys!5334 lt!546175 lt!546177 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3205 (Int (_ BitVec 64)) V!45953)

(assert (=> b!1204650 (= lt!546177 (array!77935 (store (arr!37609 _values!996) i!673 (ValueCellFull!14600 (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38147 _values!996)))))

(declare-fun lt!546182 () ListLongMap!17745)

(assert (=> b!1204650 (= lt!546182 (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1204651 () Bool)

(assert (=> b!1204651 (= e!684089 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1204652 () Bool)

(declare-fun res!801386 () Bool)

(assert (=> b!1204652 (=> (not res!801386) (not e!684080))))

(assert (=> b!1204652 (= res!801386 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26559))))

(declare-fun call!58272 () ListLongMap!17745)

(declare-fun bm!58266 () Bool)

(assert (=> bm!58266 (= call!58267 (contains!6888 (ite c!118124 lt!546173 call!58272) k0!934))))

(declare-fun b!1204653 () Bool)

(declare-fun res!801390 () Bool)

(assert (=> b!1204653 (=> (not res!801390) (not e!684080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1204653 (= res!801390 (validMask!0 mask!1564))))

(declare-fun bm!58267 () Bool)

(assert (=> bm!58267 (= call!58269 (+!4020 lt!546183 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1204654 () Bool)

(declare-fun c!118121 () Bool)

(assert (=> b!1204654 (= c!118121 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546185))))

(assert (=> b!1204654 (= e!684087 e!684078)))

(declare-fun b!1204655 () Bool)

(declare-fun -!1780 (ListLongMap!17745 (_ BitVec 64)) ListLongMap!17745)

(assert (=> b!1204655 (= e!684082 (= call!58270 (-!1780 call!58265 k0!934)))))

(declare-fun mapNonEmpty!47781 () Bool)

(declare-fun tp!90745 () Bool)

(assert (=> mapNonEmpty!47781 (= mapRes!47781 (and tp!90745 e!684090))))

(declare-fun mapKey!47781 () (_ BitVec 32))

(declare-fun mapValue!47781 () ValueCell!14600)

(declare-fun mapRest!47781 () (Array (_ BitVec 32) ValueCell!14600))

(assert (=> mapNonEmpty!47781 (= (arr!37609 _values!996) (store mapRest!47781 mapKey!47781 mapValue!47781))))

(declare-fun b!1204656 () Bool)

(declare-fun lt!546172 () Unit!39789)

(assert (=> b!1204656 (= e!684078 lt!546172)))

(assert (=> b!1204656 (= lt!546172 call!58268)))

(assert (=> b!1204656 call!58266))

(declare-fun b!1204657 () Bool)

(declare-fun res!801387 () Bool)

(assert (=> b!1204657 (=> (not res!801387) (not e!684080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1204657 (= res!801387 (validKeyInArray!0 k0!934))))

(declare-fun b!1204658 () Bool)

(declare-fun res!801391 () Bool)

(assert (=> b!1204658 (=> (not res!801391) (not e!684080))))

(assert (=> b!1204658 (= res!801391 (= (select (arr!37608 _keys!1208) i!673) k0!934))))

(declare-fun bm!58268 () Bool)

(assert (=> bm!58268 (= call!58272 call!58269)))

(declare-fun bm!58269 () Bool)

(assert (=> bm!58269 (= call!58266 call!58267)))

(declare-fun b!1204659 () Bool)

(assert (=> b!1204659 (= e!684079 (not e!684081))))

(declare-fun res!801394 () Bool)

(assert (=> b!1204659 (=> res!801394 e!684081)))

(assert (=> b!1204659 (= res!801394 (bvsgt from!1455 i!673))))

(assert (=> b!1204659 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546179 () Unit!39789)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77932 (_ BitVec 64) (_ BitVec 32)) Unit!39789)

(assert (=> b!1204659 (= lt!546179 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100708 res!801397) b!1204653))

(assert (= (and b!1204653 res!801390) b!1204638))

(assert (= (and b!1204638 res!801392) b!1204641))

(assert (= (and b!1204641 res!801396) b!1204652))

(assert (= (and b!1204652 res!801386) b!1204635))

(assert (= (and b!1204635 res!801398) b!1204657))

(assert (= (and b!1204657 res!801387) b!1204658))

(assert (= (and b!1204658 res!801391) b!1204634))

(assert (= (and b!1204634 res!801389) b!1204640))

(assert (= (and b!1204640 res!801385) b!1204659))

(assert (= (and b!1204659 (not res!801394)) b!1204650))

(assert (= (and b!1204650 (not res!801384)) b!1204649))

(assert (= (and b!1204649 c!118123) b!1204655))

(assert (= (and b!1204649 (not c!118123)) b!1204632))

(assert (= (or b!1204655 b!1204632) bm!58264))

(assert (= (or b!1204655 b!1204632) bm!58263))

(assert (= (and b!1204649 (not res!801388)) b!1204636))

(assert (= (and b!1204636 (not res!801393)) b!1204644))

(assert (= (and b!1204644 c!118124) b!1204642))

(assert (= (and b!1204644 (not c!118124)) b!1204633))

(assert (= (and b!1204633 c!118122) b!1204648))

(assert (= (and b!1204633 (not c!118122)) b!1204654))

(assert (= (and b!1204654 c!118121) b!1204656))

(assert (= (and b!1204654 (not c!118121)) b!1204645))

(assert (= (or b!1204648 b!1204656) bm!58262))

(assert (= (or b!1204648 b!1204656) bm!58268))

(assert (= (or b!1204648 b!1204656) bm!58269))

(assert (= (or b!1204642 bm!58269) bm!58266))

(assert (= (or b!1204642 bm!58262) bm!58265))

(assert (= (or b!1204642 bm!58268) bm!58267))

(assert (= (and b!1204644 c!118125) b!1204639))

(assert (= (and b!1204644 (not c!118125)) b!1204646))

(assert (= (and b!1204644 res!801395) b!1204651))

(assert (= (and b!1204637 condMapEmpty!47781) mapIsEmpty!47781))

(assert (= (and b!1204637 (not condMapEmpty!47781)) mapNonEmpty!47781))

(get-info :version)

(assert (= (and mapNonEmpty!47781 ((_ is ValueCellFull!14600) mapValue!47781)) b!1204643))

(assert (= (and b!1204637 ((_ is ValueCellFull!14600) mapDefault!47781)) b!1204647))

(assert (= start!100708 b!1204637))

(declare-fun b_lambda!21255 () Bool)

(assert (=> (not b_lambda!21255) (not b!1204650)))

(declare-fun t!39446 () Bool)

(declare-fun tb!10707 () Bool)

(assert (=> (and start!100708 (= defaultEntry!1004 defaultEntry!1004) t!39446) tb!10707))

(declare-fun result!22005 () Bool)

(assert (=> tb!10707 (= result!22005 tp_is_empty!30619)))

(assert (=> b!1204650 t!39446))

(declare-fun b_and!42775 () Bool)

(assert (= b_and!42773 (and (=> t!39446 result!22005) b_and!42775)))

(declare-fun m!1110137 () Bool)

(assert (=> b!1204641 m!1110137))

(declare-fun m!1110139 () Bool)

(assert (=> b!1204636 m!1110139))

(declare-fun m!1110141 () Bool)

(assert (=> b!1204636 m!1110141))

(declare-fun m!1110143 () Bool)

(assert (=> b!1204639 m!1110143))

(assert (=> b!1204651 m!1110143))

(declare-fun m!1110145 () Bool)

(assert (=> b!1204652 m!1110145))

(declare-fun m!1110147 () Bool)

(assert (=> b!1204655 m!1110147))

(declare-fun m!1110149 () Bool)

(assert (=> b!1204644 m!1110149))

(declare-fun m!1110151 () Bool)

(assert (=> bm!58265 m!1110151))

(declare-fun m!1110153 () Bool)

(assert (=> b!1204640 m!1110153))

(declare-fun m!1110155 () Bool)

(assert (=> b!1204650 m!1110155))

(declare-fun m!1110157 () Bool)

(assert (=> b!1204650 m!1110157))

(declare-fun m!1110159 () Bool)

(assert (=> b!1204650 m!1110159))

(declare-fun m!1110161 () Bool)

(assert (=> b!1204650 m!1110161))

(declare-fun m!1110163 () Bool)

(assert (=> b!1204657 m!1110163))

(declare-fun m!1110165 () Bool)

(assert (=> b!1204659 m!1110165))

(declare-fun m!1110167 () Bool)

(assert (=> b!1204659 m!1110167))

(declare-fun m!1110169 () Bool)

(assert (=> bm!58266 m!1110169))

(declare-fun m!1110171 () Bool)

(assert (=> bm!58267 m!1110171))

(declare-fun m!1110173 () Bool)

(assert (=> b!1204658 m!1110173))

(declare-fun m!1110175 () Bool)

(assert (=> mapNonEmpty!47781 m!1110175))

(declare-fun m!1110177 () Bool)

(assert (=> b!1204642 m!1110177))

(declare-fun m!1110179 () Bool)

(assert (=> b!1204642 m!1110179))

(assert (=> b!1204642 m!1110179))

(declare-fun m!1110181 () Bool)

(assert (=> b!1204642 m!1110181))

(declare-fun m!1110183 () Bool)

(assert (=> bm!58264 m!1110183))

(declare-fun m!1110185 () Bool)

(assert (=> b!1204634 m!1110185))

(declare-fun m!1110187 () Bool)

(assert (=> b!1204634 m!1110187))

(declare-fun m!1110189 () Bool)

(assert (=> b!1204649 m!1110189))

(declare-fun m!1110191 () Bool)

(assert (=> b!1204649 m!1110191))

(declare-fun m!1110193 () Bool)

(assert (=> b!1204653 m!1110193))

(assert (=> bm!58263 m!1110141))

(declare-fun m!1110195 () Bool)

(assert (=> start!100708 m!1110195))

(declare-fun m!1110197 () Bool)

(assert (=> start!100708 m!1110197))

(check-sat (not b!1204652) (not b!1204634) (not b!1204657) (not b_lambda!21255) (not b!1204642) (not b!1204655) (not b!1204650) (not mapNonEmpty!47781) (not b!1204640) (not b!1204639) (not bm!58264) (not bm!58267) (not b!1204659) (not b!1204641) (not start!100708) (not b!1204649) tp_is_empty!30619 (not b!1204644) (not bm!58266) (not b!1204653) (not bm!58265) (not bm!58263) (not b!1204636) (not b!1204651) b_and!42775 (not b_next!25915))
(check-sat b_and!42775 (not b_next!25915))
(get-model)

(declare-fun b_lambda!21261 () Bool)

(assert (= b_lambda!21255 (or (and start!100708 b_free!25915) b_lambda!21261)))

(check-sat (not b!1204652) (not b!1204634) (not b!1204657) (not b_lambda!21261) (not b!1204642) (not b!1204655) (not b!1204650) (not mapNonEmpty!47781) (not b!1204640) (not b!1204639) (not bm!58264) (not bm!58267) (not b!1204659) (not b!1204641) (not start!100708) (not b!1204649) tp_is_empty!30619 (not b!1204644) (not bm!58266) (not b!1204653) (not bm!58265) (not bm!58263) (not b!1204636) (not b!1204651) b_and!42775 (not b_next!25915))
(check-sat b_and!42775 (not b_next!25915))
(get-model)

(declare-fun d!132683 () Bool)

(declare-fun res!801493 () Bool)

(declare-fun e!684194 () Bool)

(assert (=> d!132683 (=> res!801493 e!684194)))

(assert (=> d!132683 (= res!801493 (= (select (arr!37608 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!132683 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!684194)))

(declare-fun b!1204838 () Bool)

(declare-fun e!684195 () Bool)

(assert (=> b!1204838 (= e!684194 e!684195)))

(declare-fun res!801494 () Bool)

(assert (=> b!1204838 (=> (not res!801494) (not e!684195))))

(assert (=> b!1204838 (= res!801494 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38146 _keys!1208)))))

(declare-fun b!1204839 () Bool)

(assert (=> b!1204839 (= e!684195 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!132683 (not res!801493)) b!1204838))

(assert (= (and b!1204838 res!801494) b!1204839))

(declare-fun m!1110323 () Bool)

(assert (=> d!132683 m!1110323))

(declare-fun m!1110325 () Bool)

(assert (=> b!1204839 m!1110325))

(assert (=> b!1204651 d!132683))

(declare-fun b!1204864 () Bool)

(declare-fun e!684215 () ListLongMap!17745)

(assert (=> b!1204864 (= e!684215 (ListLongMap!17746 Nil!26558))))

(declare-fun b!1204865 () Bool)

(declare-fun e!684210 () ListLongMap!17745)

(assert (=> b!1204865 (= e!684215 e!684210)))

(declare-fun c!118167 () Bool)

(assert (=> b!1204865 (= c!118167 (validKeyInArray!0 (select (arr!37608 lt!546175) from!1455)))))

(declare-fun b!1204866 () Bool)

(declare-fun e!684211 () Bool)

(assert (=> b!1204866 (= e!684211 (validKeyInArray!0 (select (arr!37608 lt!546175) from!1455)))))

(assert (=> b!1204866 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204867 () Bool)

(declare-fun e!684212 () Bool)

(declare-fun lt!546293 () ListLongMap!17745)

(declare-fun isEmpty!990 (ListLongMap!17745) Bool)

(assert (=> b!1204867 (= e!684212 (isEmpty!990 lt!546293))))

(declare-fun b!1204868 () Bool)

(declare-fun e!684213 () Bool)

(declare-fun e!684214 () Bool)

(assert (=> b!1204868 (= e!684213 e!684214)))

(assert (=> b!1204868 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38146 lt!546175)))))

(declare-fun res!801503 () Bool)

(assert (=> b!1204868 (= res!801503 (contains!6888 lt!546293 (select (arr!37608 lt!546175) from!1455)))))

(assert (=> b!1204868 (=> (not res!801503) (not e!684214))))

(declare-fun b!1204869 () Bool)

(assert (=> b!1204869 (= e!684212 (= lt!546293 (getCurrentListMapNoExtraKeys!5334 lt!546175 lt!546177 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204870 () Bool)

(declare-fun lt!546294 () Unit!39789)

(declare-fun lt!546292 () Unit!39789)

(assert (=> b!1204870 (= lt!546294 lt!546292)))

(declare-fun lt!546295 () (_ BitVec 64))

(declare-fun lt!546296 () V!45953)

(declare-fun lt!546291 () ListLongMap!17745)

(declare-fun lt!546297 () (_ BitVec 64))

(assert (=> b!1204870 (not (contains!6888 (+!4020 lt!546291 (tuple2!19777 lt!546295 lt!546296)) lt!546297))))

(declare-fun addStillNotContains!292 (ListLongMap!17745 (_ BitVec 64) V!45953 (_ BitVec 64)) Unit!39789)

(assert (=> b!1204870 (= lt!546292 (addStillNotContains!292 lt!546291 lt!546295 lt!546296 lt!546297))))

(assert (=> b!1204870 (= lt!546297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19189 (ValueCell!14600 V!45953) V!45953)

(assert (=> b!1204870 (= lt!546296 (get!19189 (select (arr!37609 lt!546177) from!1455) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204870 (= lt!546295 (select (arr!37608 lt!546175) from!1455))))

(declare-fun call!58323 () ListLongMap!17745)

(assert (=> b!1204870 (= lt!546291 call!58323)))

(assert (=> b!1204870 (= e!684210 (+!4020 call!58323 (tuple2!19777 (select (arr!37608 lt!546175) from!1455) (get!19189 (select (arr!37609 lt!546177) from!1455) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132685 () Bool)

(declare-fun e!684216 () Bool)

(assert (=> d!132685 e!684216))

(declare-fun res!801506 () Bool)

(assert (=> d!132685 (=> (not res!801506) (not e!684216))))

(assert (=> d!132685 (= res!801506 (not (contains!6888 lt!546293 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132685 (= lt!546293 e!684215)))

(declare-fun c!118165 () Bool)

(assert (=> d!132685 (= c!118165 (bvsge from!1455 (size!38146 lt!546175)))))

(assert (=> d!132685 (validMask!0 mask!1564)))

(assert (=> d!132685 (= (getCurrentListMapNoExtraKeys!5334 lt!546175 lt!546177 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546293)))

(declare-fun b!1204871 () Bool)

(assert (=> b!1204871 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38146 lt!546175)))))

(assert (=> b!1204871 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38147 lt!546177)))))

(declare-fun apply!956 (ListLongMap!17745 (_ BitVec 64)) V!45953)

(assert (=> b!1204871 (= e!684214 (= (apply!956 lt!546293 (select (arr!37608 lt!546175) from!1455)) (get!19189 (select (arr!37609 lt!546177) from!1455) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204872 () Bool)

(assert (=> b!1204872 (= e!684216 e!684213)))

(declare-fun c!118166 () Bool)

(assert (=> b!1204872 (= c!118166 e!684211)))

(declare-fun res!801505 () Bool)

(assert (=> b!1204872 (=> (not res!801505) (not e!684211))))

(assert (=> b!1204872 (= res!801505 (bvslt from!1455 (size!38146 lt!546175)))))

(declare-fun b!1204873 () Bool)

(assert (=> b!1204873 (= e!684210 call!58323)))

(declare-fun bm!58320 () Bool)

(assert (=> bm!58320 (= call!58323 (getCurrentListMapNoExtraKeys!5334 lt!546175 lt!546177 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204874 () Bool)

(assert (=> b!1204874 (= e!684213 e!684212)))

(declare-fun c!118164 () Bool)

(assert (=> b!1204874 (= c!118164 (bvslt from!1455 (size!38146 lt!546175)))))

(declare-fun b!1204875 () Bool)

(declare-fun res!801504 () Bool)

(assert (=> b!1204875 (=> (not res!801504) (not e!684216))))

(assert (=> b!1204875 (= res!801504 (not (contains!6888 lt!546293 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132685 c!118165) b!1204864))

(assert (= (and d!132685 (not c!118165)) b!1204865))

(assert (= (and b!1204865 c!118167) b!1204870))

(assert (= (and b!1204865 (not c!118167)) b!1204873))

(assert (= (or b!1204870 b!1204873) bm!58320))

(assert (= (and d!132685 res!801506) b!1204875))

(assert (= (and b!1204875 res!801504) b!1204872))

(assert (= (and b!1204872 res!801505) b!1204866))

(assert (= (and b!1204872 c!118166) b!1204868))

(assert (= (and b!1204872 (not c!118166)) b!1204874))

(assert (= (and b!1204868 res!801503) b!1204871))

(assert (= (and b!1204874 c!118164) b!1204869))

(assert (= (and b!1204874 (not c!118164)) b!1204867))

(declare-fun b_lambda!21263 () Bool)

(assert (=> (not b_lambda!21263) (not b!1204870)))

(assert (=> b!1204870 t!39446))

(declare-fun b_and!42785 () Bool)

(assert (= b_and!42775 (and (=> t!39446 result!22005) b_and!42785)))

(declare-fun b_lambda!21265 () Bool)

(assert (=> (not b_lambda!21265) (not b!1204871)))

(assert (=> b!1204871 t!39446))

(declare-fun b_and!42787 () Bool)

(assert (= b_and!42785 (and (=> t!39446 result!22005) b_and!42787)))

(declare-fun m!1110327 () Bool)

(assert (=> b!1204866 m!1110327))

(assert (=> b!1204866 m!1110327))

(declare-fun m!1110329 () Bool)

(assert (=> b!1204866 m!1110329))

(declare-fun m!1110331 () Bool)

(assert (=> b!1204875 m!1110331))

(declare-fun m!1110333 () Bool)

(assert (=> b!1204869 m!1110333))

(declare-fun m!1110335 () Bool)

(assert (=> d!132685 m!1110335))

(assert (=> d!132685 m!1110193))

(assert (=> b!1204868 m!1110327))

(assert (=> b!1204868 m!1110327))

(declare-fun m!1110337 () Bool)

(assert (=> b!1204868 m!1110337))

(assert (=> b!1204870 m!1110157))

(declare-fun m!1110339 () Bool)

(assert (=> b!1204870 m!1110339))

(declare-fun m!1110341 () Bool)

(assert (=> b!1204870 m!1110341))

(assert (=> b!1204870 m!1110157))

(declare-fun m!1110343 () Bool)

(assert (=> b!1204870 m!1110343))

(declare-fun m!1110345 () Bool)

(assert (=> b!1204870 m!1110345))

(declare-fun m!1110347 () Bool)

(assert (=> b!1204870 m!1110347))

(assert (=> b!1204870 m!1110327))

(assert (=> b!1204870 m!1110345))

(declare-fun m!1110349 () Bool)

(assert (=> b!1204870 m!1110349))

(assert (=> b!1204870 m!1110341))

(assert (=> bm!58320 m!1110333))

(assert (=> b!1204871 m!1110157))

(assert (=> b!1204871 m!1110341))

(assert (=> b!1204871 m!1110157))

(assert (=> b!1204871 m!1110343))

(assert (=> b!1204871 m!1110341))

(assert (=> b!1204871 m!1110327))

(declare-fun m!1110351 () Bool)

(assert (=> b!1204871 m!1110351))

(assert (=> b!1204871 m!1110327))

(declare-fun m!1110353 () Bool)

(assert (=> b!1204867 m!1110353))

(assert (=> b!1204865 m!1110327))

(assert (=> b!1204865 m!1110327))

(assert (=> b!1204865 m!1110329))

(assert (=> b!1204650 d!132685))

(declare-fun b!1204876 () Bool)

(declare-fun e!684222 () ListLongMap!17745)

(assert (=> b!1204876 (= e!684222 (ListLongMap!17746 Nil!26558))))

(declare-fun b!1204877 () Bool)

(declare-fun e!684217 () ListLongMap!17745)

(assert (=> b!1204877 (= e!684222 e!684217)))

(declare-fun c!118171 () Bool)

(assert (=> b!1204877 (= c!118171 (validKeyInArray!0 (select (arr!37608 _keys!1208) from!1455)))))

(declare-fun b!1204878 () Bool)

(declare-fun e!684218 () Bool)

(assert (=> b!1204878 (= e!684218 (validKeyInArray!0 (select (arr!37608 _keys!1208) from!1455)))))

(assert (=> b!1204878 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204879 () Bool)

(declare-fun e!684219 () Bool)

(declare-fun lt!546300 () ListLongMap!17745)

(assert (=> b!1204879 (= e!684219 (isEmpty!990 lt!546300))))

(declare-fun b!1204880 () Bool)

(declare-fun e!684220 () Bool)

(declare-fun e!684221 () Bool)

(assert (=> b!1204880 (= e!684220 e!684221)))

(assert (=> b!1204880 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38146 _keys!1208)))))

(declare-fun res!801507 () Bool)

(assert (=> b!1204880 (= res!801507 (contains!6888 lt!546300 (select (arr!37608 _keys!1208) from!1455)))))

(assert (=> b!1204880 (=> (not res!801507) (not e!684221))))

(declare-fun b!1204881 () Bool)

(assert (=> b!1204881 (= e!684219 (= lt!546300 (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204882 () Bool)

(declare-fun lt!546301 () Unit!39789)

(declare-fun lt!546299 () Unit!39789)

(assert (=> b!1204882 (= lt!546301 lt!546299)))

(declare-fun lt!546302 () (_ BitVec 64))

(declare-fun lt!546303 () V!45953)

(declare-fun lt!546298 () ListLongMap!17745)

(declare-fun lt!546304 () (_ BitVec 64))

(assert (=> b!1204882 (not (contains!6888 (+!4020 lt!546298 (tuple2!19777 lt!546302 lt!546303)) lt!546304))))

(assert (=> b!1204882 (= lt!546299 (addStillNotContains!292 lt!546298 lt!546302 lt!546303 lt!546304))))

(assert (=> b!1204882 (= lt!546304 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204882 (= lt!546303 (get!19189 (select (arr!37609 _values!996) from!1455) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204882 (= lt!546302 (select (arr!37608 _keys!1208) from!1455))))

(declare-fun call!58324 () ListLongMap!17745)

(assert (=> b!1204882 (= lt!546298 call!58324)))

(assert (=> b!1204882 (= e!684217 (+!4020 call!58324 (tuple2!19777 (select (arr!37608 _keys!1208) from!1455) (get!19189 (select (arr!37609 _values!996) from!1455) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132687 () Bool)

(declare-fun e!684223 () Bool)

(assert (=> d!132687 e!684223))

(declare-fun res!801510 () Bool)

(assert (=> d!132687 (=> (not res!801510) (not e!684223))))

(assert (=> d!132687 (= res!801510 (not (contains!6888 lt!546300 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132687 (= lt!546300 e!684222)))

(declare-fun c!118169 () Bool)

(assert (=> d!132687 (= c!118169 (bvsge from!1455 (size!38146 _keys!1208)))))

(assert (=> d!132687 (validMask!0 mask!1564)))

(assert (=> d!132687 (= (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546300)))

(declare-fun b!1204883 () Bool)

(assert (=> b!1204883 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38146 _keys!1208)))))

(assert (=> b!1204883 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38147 _values!996)))))

(assert (=> b!1204883 (= e!684221 (= (apply!956 lt!546300 (select (arr!37608 _keys!1208) from!1455)) (get!19189 (select (arr!37609 _values!996) from!1455) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204884 () Bool)

(assert (=> b!1204884 (= e!684223 e!684220)))

(declare-fun c!118170 () Bool)

(assert (=> b!1204884 (= c!118170 e!684218)))

(declare-fun res!801509 () Bool)

(assert (=> b!1204884 (=> (not res!801509) (not e!684218))))

(assert (=> b!1204884 (= res!801509 (bvslt from!1455 (size!38146 _keys!1208)))))

(declare-fun b!1204885 () Bool)

(assert (=> b!1204885 (= e!684217 call!58324)))

(declare-fun bm!58321 () Bool)

(assert (=> bm!58321 (= call!58324 (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204886 () Bool)

(assert (=> b!1204886 (= e!684220 e!684219)))

(declare-fun c!118168 () Bool)

(assert (=> b!1204886 (= c!118168 (bvslt from!1455 (size!38146 _keys!1208)))))

(declare-fun b!1204887 () Bool)

(declare-fun res!801508 () Bool)

(assert (=> b!1204887 (=> (not res!801508) (not e!684223))))

(assert (=> b!1204887 (= res!801508 (not (contains!6888 lt!546300 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132687 c!118169) b!1204876))

(assert (= (and d!132687 (not c!118169)) b!1204877))

(assert (= (and b!1204877 c!118171) b!1204882))

(assert (= (and b!1204877 (not c!118171)) b!1204885))

(assert (= (or b!1204882 b!1204885) bm!58321))

(assert (= (and d!132687 res!801510) b!1204887))

(assert (= (and b!1204887 res!801508) b!1204884))

(assert (= (and b!1204884 res!801509) b!1204878))

(assert (= (and b!1204884 c!118170) b!1204880))

(assert (= (and b!1204884 (not c!118170)) b!1204886))

(assert (= (and b!1204880 res!801507) b!1204883))

(assert (= (and b!1204886 c!118168) b!1204881))

(assert (= (and b!1204886 (not c!118168)) b!1204879))

(declare-fun b_lambda!21267 () Bool)

(assert (=> (not b_lambda!21267) (not b!1204882)))

(assert (=> b!1204882 t!39446))

(declare-fun b_and!42789 () Bool)

(assert (= b_and!42787 (and (=> t!39446 result!22005) b_and!42789)))

(declare-fun b_lambda!21269 () Bool)

(assert (=> (not b_lambda!21269) (not b!1204883)))

(assert (=> b!1204883 t!39446))

(declare-fun b_and!42791 () Bool)

(assert (= b_and!42789 (and (=> t!39446 result!22005) b_and!42791)))

(assert (=> b!1204878 m!1110189))

(assert (=> b!1204878 m!1110189))

(declare-fun m!1110355 () Bool)

(assert (=> b!1204878 m!1110355))

(declare-fun m!1110357 () Bool)

(assert (=> b!1204887 m!1110357))

(declare-fun m!1110359 () Bool)

(assert (=> b!1204881 m!1110359))

(declare-fun m!1110361 () Bool)

(assert (=> d!132687 m!1110361))

(assert (=> d!132687 m!1110193))

(assert (=> b!1204880 m!1110189))

(assert (=> b!1204880 m!1110189))

(declare-fun m!1110363 () Bool)

(assert (=> b!1204880 m!1110363))

(assert (=> b!1204882 m!1110157))

(declare-fun m!1110365 () Bool)

(assert (=> b!1204882 m!1110365))

(declare-fun m!1110367 () Bool)

(assert (=> b!1204882 m!1110367))

(assert (=> b!1204882 m!1110157))

(declare-fun m!1110369 () Bool)

(assert (=> b!1204882 m!1110369))

(declare-fun m!1110371 () Bool)

(assert (=> b!1204882 m!1110371))

(declare-fun m!1110373 () Bool)

(assert (=> b!1204882 m!1110373))

(assert (=> b!1204882 m!1110189))

(assert (=> b!1204882 m!1110371))

(declare-fun m!1110375 () Bool)

(assert (=> b!1204882 m!1110375))

(assert (=> b!1204882 m!1110367))

(assert (=> bm!58321 m!1110359))

(assert (=> b!1204883 m!1110157))

(assert (=> b!1204883 m!1110367))

(assert (=> b!1204883 m!1110157))

(assert (=> b!1204883 m!1110369))

(assert (=> b!1204883 m!1110367))

(assert (=> b!1204883 m!1110189))

(declare-fun m!1110377 () Bool)

(assert (=> b!1204883 m!1110377))

(assert (=> b!1204883 m!1110189))

(declare-fun m!1110379 () Bool)

(assert (=> b!1204879 m!1110379))

(assert (=> b!1204877 m!1110189))

(assert (=> b!1204877 m!1110189))

(assert (=> b!1204877 m!1110355))

(assert (=> b!1204650 d!132687))

(declare-fun d!132689 () Bool)

(assert (=> d!132689 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204657 d!132689))

(declare-fun d!132691 () Bool)

(assert (=> d!132691 (contains!6888 (+!4020 lt!546173 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!546307 () Unit!39789)

(declare-fun choose!1803 (ListLongMap!17745 (_ BitVec 64) V!45953 (_ BitVec 64)) Unit!39789)

(assert (=> d!132691 (= lt!546307 (choose!1803 lt!546173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!132691 (contains!6888 lt!546173 k0!934)))

(assert (=> d!132691 (= (addStillContains!1004 lt!546173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!546307)))

(declare-fun bs!34067 () Bool)

(assert (= bs!34067 d!132691))

(assert (=> bs!34067 m!1110179))

(assert (=> bs!34067 m!1110179))

(assert (=> bs!34067 m!1110181))

(declare-fun m!1110381 () Bool)

(assert (=> bs!34067 m!1110381))

(declare-fun m!1110383 () Bool)

(assert (=> bs!34067 m!1110383))

(assert (=> b!1204642 d!132691))

(declare-fun d!132693 () Bool)

(declare-fun e!684229 () Bool)

(assert (=> d!132693 e!684229))

(declare-fun res!801513 () Bool)

(assert (=> d!132693 (=> res!801513 e!684229)))

(declare-fun lt!546319 () Bool)

(assert (=> d!132693 (= res!801513 (not lt!546319))))

(declare-fun lt!546318 () Bool)

(assert (=> d!132693 (= lt!546319 lt!546318)))

(declare-fun lt!546316 () Unit!39789)

(declare-fun e!684228 () Unit!39789)

(assert (=> d!132693 (= lt!546316 e!684228)))

(declare-fun c!118174 () Bool)

(assert (=> d!132693 (= c!118174 lt!546318)))

(declare-fun containsKey!590 (List!26561 (_ BitVec 64)) Bool)

(assert (=> d!132693 (= lt!546318 (containsKey!590 (toList!8888 (+!4020 lt!546173 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!132693 (= (contains!6888 (+!4020 lt!546173 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!546319)))

(declare-fun b!1204895 () Bool)

(declare-fun lt!546317 () Unit!39789)

(assert (=> b!1204895 (= e!684228 lt!546317)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!419 (List!26561 (_ BitVec 64)) Unit!39789)

(assert (=> b!1204895 (= lt!546317 (lemmaContainsKeyImpliesGetValueByKeyDefined!419 (toList!8888 (+!4020 lt!546173 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-datatypes ((Option!687 0))(
  ( (Some!686 (v!18011 V!45953)) (None!685) )
))
(declare-fun isDefined!462 (Option!687) Bool)

(declare-fun getValueByKey!636 (List!26561 (_ BitVec 64)) Option!687)

(assert (=> b!1204895 (isDefined!462 (getValueByKey!636 (toList!8888 (+!4020 lt!546173 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1204896 () Bool)

(declare-fun Unit!39797 () Unit!39789)

(assert (=> b!1204896 (= e!684228 Unit!39797)))

(declare-fun b!1204897 () Bool)

(assert (=> b!1204897 (= e!684229 (isDefined!462 (getValueByKey!636 (toList!8888 (+!4020 lt!546173 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!132693 c!118174) b!1204895))

(assert (= (and d!132693 (not c!118174)) b!1204896))

(assert (= (and d!132693 (not res!801513)) b!1204897))

(declare-fun m!1110385 () Bool)

(assert (=> d!132693 m!1110385))

(declare-fun m!1110387 () Bool)

(assert (=> b!1204895 m!1110387))

(declare-fun m!1110389 () Bool)

(assert (=> b!1204895 m!1110389))

(assert (=> b!1204895 m!1110389))

(declare-fun m!1110391 () Bool)

(assert (=> b!1204895 m!1110391))

(assert (=> b!1204897 m!1110389))

(assert (=> b!1204897 m!1110389))

(assert (=> b!1204897 m!1110391))

(assert (=> b!1204642 d!132693))

(declare-fun d!132695 () Bool)

(declare-fun e!684232 () Bool)

(assert (=> d!132695 e!684232))

(declare-fun res!801518 () Bool)

(assert (=> d!132695 (=> (not res!801518) (not e!684232))))

(declare-fun lt!546329 () ListLongMap!17745)

(assert (=> d!132695 (= res!801518 (contains!6888 lt!546329 (_1!9899 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!546330 () List!26561)

(assert (=> d!132695 (= lt!546329 (ListLongMap!17746 lt!546330))))

(declare-fun lt!546328 () Unit!39789)

(declare-fun lt!546331 () Unit!39789)

(assert (=> d!132695 (= lt!546328 lt!546331)))

(assert (=> d!132695 (= (getValueByKey!636 lt!546330 (_1!9899 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!686 (_2!9899 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!312 (List!26561 (_ BitVec 64) V!45953) Unit!39789)

(assert (=> d!132695 (= lt!546331 (lemmaContainsTupThenGetReturnValue!312 lt!546330 (_1!9899 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9899 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!405 (List!26561 (_ BitVec 64) V!45953) List!26561)

(assert (=> d!132695 (= lt!546330 (insertStrictlySorted!405 (toList!8888 lt!546173) (_1!9899 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9899 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132695 (= (+!4020 lt!546173 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!546329)))

(declare-fun b!1204902 () Bool)

(declare-fun res!801519 () Bool)

(assert (=> b!1204902 (=> (not res!801519) (not e!684232))))

(assert (=> b!1204902 (= res!801519 (= (getValueByKey!636 (toList!8888 lt!546329) (_1!9899 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!686 (_2!9899 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1204903 () Bool)

(declare-fun contains!6891 (List!26561 tuple2!19776) Bool)

(assert (=> b!1204903 (= e!684232 (contains!6891 (toList!8888 lt!546329) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!132695 res!801518) b!1204902))

(assert (= (and b!1204902 res!801519) b!1204903))

(declare-fun m!1110393 () Bool)

(assert (=> d!132695 m!1110393))

(declare-fun m!1110395 () Bool)

(assert (=> d!132695 m!1110395))

(declare-fun m!1110397 () Bool)

(assert (=> d!132695 m!1110397))

(declare-fun m!1110399 () Bool)

(assert (=> d!132695 m!1110399))

(declare-fun m!1110401 () Bool)

(assert (=> b!1204902 m!1110401))

(declare-fun m!1110403 () Bool)

(assert (=> b!1204903 m!1110403))

(assert (=> b!1204642 d!132695))

(declare-fun b!1204912 () Bool)

(declare-fun e!684241 () Bool)

(declare-fun e!684239 () Bool)

(assert (=> b!1204912 (= e!684241 e!684239)))

(declare-fun lt!546340 () (_ BitVec 64))

(assert (=> b!1204912 (= lt!546340 (select (arr!37608 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!546339 () Unit!39789)

(assert (=> b!1204912 (= lt!546339 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!546340 #b00000000000000000000000000000000))))

(assert (=> b!1204912 (arrayContainsKey!0 _keys!1208 lt!546340 #b00000000000000000000000000000000)))

(declare-fun lt!546338 () Unit!39789)

(assert (=> b!1204912 (= lt!546338 lt!546339)))

(declare-fun res!801525 () Bool)

(declare-datatypes ((SeekEntryResult!9935 0))(
  ( (MissingZero!9935 (index!42111 (_ BitVec 32))) (Found!9935 (index!42112 (_ BitVec 32))) (Intermediate!9935 (undefined!10747 Bool) (index!42113 (_ BitVec 32)) (x!106440 (_ BitVec 32))) (Undefined!9935) (MissingVacant!9935 (index!42114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77932 (_ BitVec 32)) SeekEntryResult!9935)

(assert (=> b!1204912 (= res!801525 (= (seekEntryOrOpen!0 (select (arr!37608 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9935 #b00000000000000000000000000000000)))))

(assert (=> b!1204912 (=> (not res!801525) (not e!684239))))

(declare-fun b!1204913 () Bool)

(declare-fun e!684240 () Bool)

(assert (=> b!1204913 (= e!684240 e!684241)))

(declare-fun c!118177 () Bool)

(assert (=> b!1204913 (= c!118177 (validKeyInArray!0 (select (arr!37608 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!58324 () Bool)

(declare-fun call!58327 () Bool)

(assert (=> bm!58324 (= call!58327 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1204914 () Bool)

(assert (=> b!1204914 (= e!684239 call!58327)))

(declare-fun b!1204915 () Bool)

(assert (=> b!1204915 (= e!684241 call!58327)))

(declare-fun d!132697 () Bool)

(declare-fun res!801524 () Bool)

(assert (=> d!132697 (=> res!801524 e!684240)))

(assert (=> d!132697 (= res!801524 (bvsge #b00000000000000000000000000000000 (size!38146 _keys!1208)))))

(assert (=> d!132697 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!684240)))

(assert (= (and d!132697 (not res!801524)) b!1204913))

(assert (= (and b!1204913 c!118177) b!1204912))

(assert (= (and b!1204913 (not c!118177)) b!1204915))

(assert (= (and b!1204912 res!801525) b!1204914))

(assert (= (or b!1204914 b!1204915) bm!58324))

(declare-fun m!1110405 () Bool)

(assert (=> b!1204912 m!1110405))

(declare-fun m!1110407 () Bool)

(assert (=> b!1204912 m!1110407))

(declare-fun m!1110409 () Bool)

(assert (=> b!1204912 m!1110409))

(assert (=> b!1204912 m!1110405))

(declare-fun m!1110411 () Bool)

(assert (=> b!1204912 m!1110411))

(assert (=> b!1204913 m!1110405))

(assert (=> b!1204913 m!1110405))

(declare-fun m!1110413 () Bool)

(assert (=> b!1204913 m!1110413))

(declare-fun m!1110415 () Bool)

(assert (=> bm!58324 m!1110415))

(assert (=> b!1204641 d!132697))

(declare-fun d!132699 () Bool)

(assert (=> d!132699 (contains!6888 (+!4020 lt!546183 (tuple2!19777 (ite (or c!118124 c!118122) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118124 c!118122) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!546341 () Unit!39789)

(assert (=> d!132699 (= lt!546341 (choose!1803 lt!546183 (ite (or c!118124 c!118122) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118124 c!118122) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!132699 (contains!6888 lt!546183 k0!934)))

(assert (=> d!132699 (= (addStillContains!1004 lt!546183 (ite (or c!118124 c!118122) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118124 c!118122) zeroValue!944 minValue!944) k0!934) lt!546341)))

(declare-fun bs!34068 () Bool)

(assert (= bs!34068 d!132699))

(declare-fun m!1110417 () Bool)

(assert (=> bs!34068 m!1110417))

(assert (=> bs!34068 m!1110417))

(declare-fun m!1110419 () Bool)

(assert (=> bs!34068 m!1110419))

(declare-fun m!1110421 () Bool)

(assert (=> bs!34068 m!1110421))

(assert (=> bs!34068 m!1110139))

(assert (=> bm!58265 d!132699))

(declare-fun d!132701 () Bool)

(declare-fun e!684246 () Bool)

(assert (=> d!132701 e!684246))

(declare-fun res!801528 () Bool)

(assert (=> d!132701 (=> (not res!801528) (not e!684246))))

(assert (=> d!132701 (= res!801528 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38146 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38146 _keys!1208))))))))

(declare-fun lt!546344 () Unit!39789)

(declare-fun choose!1804 (array!77932 array!77934 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39789)

(assert (=> d!132701 (= lt!546344 (choose!1804 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132701 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 _keys!1208)))))

(assert (=> d!132701 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1028 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546344)))

(declare-fun bm!58329 () Bool)

(declare-fun call!58333 () ListLongMap!17745)

(assert (=> bm!58329 (= call!58333 (getCurrentListMapNoExtraKeys!5334 (array!77933 (store (arr!37608 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38146 _keys!1208)) (array!77935 (store (arr!37609 _values!996) i!673 (ValueCellFull!14600 (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38147 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204922 () Bool)

(declare-fun e!684247 () Bool)

(declare-fun call!58332 () ListLongMap!17745)

(assert (=> b!1204922 (= e!684247 (= call!58333 call!58332))))

(assert (=> b!1204922 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38147 _values!996)))))

(declare-fun b!1204923 () Bool)

(assert (=> b!1204923 (= e!684247 (= call!58333 (-!1780 call!58332 k0!934)))))

(assert (=> b!1204923 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38147 _values!996)))))

(declare-fun bm!58330 () Bool)

(assert (=> bm!58330 (= call!58332 (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204924 () Bool)

(assert (=> b!1204924 (= e!684246 e!684247)))

(declare-fun c!118180 () Bool)

(assert (=> b!1204924 (= c!118180 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!132701 res!801528) b!1204924))

(assert (= (and b!1204924 c!118180) b!1204923))

(assert (= (and b!1204924 (not c!118180)) b!1204922))

(assert (= (or b!1204923 b!1204922) bm!58330))

(assert (= (or b!1204923 b!1204922) bm!58329))

(declare-fun b_lambda!21271 () Bool)

(assert (=> (not b_lambda!21271) (not bm!58329)))

(assert (=> bm!58329 t!39446))

(declare-fun b_and!42793 () Bool)

(assert (= b_and!42791 (and (=> t!39446 result!22005) b_and!42793)))

(declare-fun m!1110423 () Bool)

(assert (=> d!132701 m!1110423))

(assert (=> bm!58329 m!1110187))

(assert (=> bm!58329 m!1110157))

(assert (=> bm!58329 m!1110159))

(declare-fun m!1110425 () Bool)

(assert (=> bm!58329 m!1110425))

(declare-fun m!1110427 () Bool)

(assert (=> b!1204923 m!1110427))

(assert (=> bm!58330 m!1110141))

(assert (=> b!1204649 d!132701))

(declare-fun b!1204935 () Bool)

(declare-fun e!684259 () Bool)

(declare-fun e!684258 () Bool)

(assert (=> b!1204935 (= e!684259 e!684258)))

(declare-fun c!118183 () Bool)

(assert (=> b!1204935 (= c!118183 (validKeyInArray!0 (select (arr!37608 lt!546175) #b00000000000000000000000000000000)))))

(declare-fun bm!58333 () Bool)

(declare-fun call!58336 () Bool)

(assert (=> bm!58333 (= call!58336 (arrayNoDuplicates!0 lt!546175 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118183 (Cons!26558 (select (arr!37608 lt!546175) #b00000000000000000000000000000000) Nil!26559) Nil!26559)))))

(declare-fun b!1204936 () Bool)

(declare-fun e!684256 () Bool)

(assert (=> b!1204936 (= e!684256 e!684259)))

(declare-fun res!801535 () Bool)

(assert (=> b!1204936 (=> (not res!801535) (not e!684259))))

(declare-fun e!684257 () Bool)

(assert (=> b!1204936 (= res!801535 (not e!684257))))

(declare-fun res!801537 () Bool)

(assert (=> b!1204936 (=> (not res!801537) (not e!684257))))

(assert (=> b!1204936 (= res!801537 (validKeyInArray!0 (select (arr!37608 lt!546175) #b00000000000000000000000000000000)))))

(declare-fun b!1204937 () Bool)

(assert (=> b!1204937 (= e!684258 call!58336)))

(declare-fun b!1204938 () Bool)

(declare-fun contains!6892 (List!26562 (_ BitVec 64)) Bool)

(assert (=> b!1204938 (= e!684257 (contains!6892 Nil!26559 (select (arr!37608 lt!546175) #b00000000000000000000000000000000)))))

(declare-fun d!132703 () Bool)

(declare-fun res!801536 () Bool)

(assert (=> d!132703 (=> res!801536 e!684256)))

(assert (=> d!132703 (= res!801536 (bvsge #b00000000000000000000000000000000 (size!38146 lt!546175)))))

(assert (=> d!132703 (= (arrayNoDuplicates!0 lt!546175 #b00000000000000000000000000000000 Nil!26559) e!684256)))

(declare-fun b!1204939 () Bool)

(assert (=> b!1204939 (= e!684258 call!58336)))

(assert (= (and d!132703 (not res!801536)) b!1204936))

(assert (= (and b!1204936 res!801537) b!1204938))

(assert (= (and b!1204936 res!801535) b!1204935))

(assert (= (and b!1204935 c!118183) b!1204937))

(assert (= (and b!1204935 (not c!118183)) b!1204939))

(assert (= (or b!1204937 b!1204939) bm!58333))

(declare-fun m!1110429 () Bool)

(assert (=> b!1204935 m!1110429))

(assert (=> b!1204935 m!1110429))

(declare-fun m!1110431 () Bool)

(assert (=> b!1204935 m!1110431))

(assert (=> bm!58333 m!1110429))

(declare-fun m!1110433 () Bool)

(assert (=> bm!58333 m!1110433))

(assert (=> b!1204936 m!1110429))

(assert (=> b!1204936 m!1110429))

(assert (=> b!1204936 m!1110431))

(assert (=> b!1204938 m!1110429))

(assert (=> b!1204938 m!1110429))

(declare-fun m!1110435 () Bool)

(assert (=> b!1204938 m!1110435))

(assert (=> b!1204640 d!132703))

(assert (=> b!1204639 d!132683))

(declare-fun d!132705 () Bool)

(declare-fun lt!546347 () ListLongMap!17745)

(assert (=> d!132705 (not (contains!6888 lt!546347 k0!934))))

(declare-fun removeStrictlySorted!96 (List!26561 (_ BitVec 64)) List!26561)

(assert (=> d!132705 (= lt!546347 (ListLongMap!17746 (removeStrictlySorted!96 (toList!8888 call!58265) k0!934)))))

(assert (=> d!132705 (= (-!1780 call!58265 k0!934) lt!546347)))

(declare-fun bs!34069 () Bool)

(assert (= bs!34069 d!132705))

(declare-fun m!1110437 () Bool)

(assert (=> bs!34069 m!1110437))

(declare-fun m!1110439 () Bool)

(assert (=> bs!34069 m!1110439))

(assert (=> b!1204655 d!132705))

(declare-fun d!132707 () Bool)

(assert (=> d!132707 (= (array_inv!28762 _keys!1208) (bvsge (size!38146 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100708 d!132707))

(declare-fun d!132709 () Bool)

(assert (=> d!132709 (= (array_inv!28763 _values!996) (bvsge (size!38147 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100708 d!132709))

(declare-fun d!132711 () Bool)

(declare-fun e!684260 () Bool)

(assert (=> d!132711 e!684260))

(declare-fun res!801538 () Bool)

(assert (=> d!132711 (=> (not res!801538) (not e!684260))))

(declare-fun lt!546349 () ListLongMap!17745)

(assert (=> d!132711 (= res!801538 (contains!6888 lt!546349 (_1!9899 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!546350 () List!26561)

(assert (=> d!132711 (= lt!546349 (ListLongMap!17746 lt!546350))))

(declare-fun lt!546348 () Unit!39789)

(declare-fun lt!546351 () Unit!39789)

(assert (=> d!132711 (= lt!546348 lt!546351)))

(assert (=> d!132711 (= (getValueByKey!636 lt!546350 (_1!9899 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!686 (_2!9899 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132711 (= lt!546351 (lemmaContainsTupThenGetReturnValue!312 lt!546350 (_1!9899 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9899 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132711 (= lt!546350 (insertStrictlySorted!405 (toList!8888 lt!546183) (_1!9899 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9899 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132711 (= (+!4020 lt!546183 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!546349)))

(declare-fun b!1204940 () Bool)

(declare-fun res!801539 () Bool)

(assert (=> b!1204940 (=> (not res!801539) (not e!684260))))

(assert (=> b!1204940 (= res!801539 (= (getValueByKey!636 (toList!8888 lt!546349) (_1!9899 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!686 (_2!9899 (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1204941 () Bool)

(assert (=> b!1204941 (= e!684260 (contains!6891 (toList!8888 lt!546349) (ite (or c!118124 c!118122) (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!132711 res!801538) b!1204940))

(assert (= (and b!1204940 res!801539) b!1204941))

(declare-fun m!1110441 () Bool)

(assert (=> d!132711 m!1110441))

(declare-fun m!1110443 () Bool)

(assert (=> d!132711 m!1110443))

(declare-fun m!1110445 () Bool)

(assert (=> d!132711 m!1110445))

(declare-fun m!1110447 () Bool)

(assert (=> d!132711 m!1110447))

(declare-fun m!1110449 () Bool)

(assert (=> b!1204940 m!1110449))

(declare-fun m!1110451 () Bool)

(assert (=> b!1204941 m!1110451))

(assert (=> bm!58267 d!132711))

(declare-fun d!132713 () Bool)

(assert (=> d!132713 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1204653 d!132713))

(declare-fun d!132715 () Bool)

(declare-fun e!684262 () Bool)

(assert (=> d!132715 e!684262))

(declare-fun res!801540 () Bool)

(assert (=> d!132715 (=> res!801540 e!684262)))

(declare-fun lt!546355 () Bool)

(assert (=> d!132715 (= res!801540 (not lt!546355))))

(declare-fun lt!546354 () Bool)

(assert (=> d!132715 (= lt!546355 lt!546354)))

(declare-fun lt!546352 () Unit!39789)

(declare-fun e!684261 () Unit!39789)

(assert (=> d!132715 (= lt!546352 e!684261)))

(declare-fun c!118184 () Bool)

(assert (=> d!132715 (= c!118184 lt!546354)))

(assert (=> d!132715 (= lt!546354 (containsKey!590 (toList!8888 lt!546183) k0!934))))

(assert (=> d!132715 (= (contains!6888 lt!546183 k0!934) lt!546355)))

(declare-fun b!1204942 () Bool)

(declare-fun lt!546353 () Unit!39789)

(assert (=> b!1204942 (= e!684261 lt!546353)))

(assert (=> b!1204942 (= lt!546353 (lemmaContainsKeyImpliesGetValueByKeyDefined!419 (toList!8888 lt!546183) k0!934))))

(assert (=> b!1204942 (isDefined!462 (getValueByKey!636 (toList!8888 lt!546183) k0!934))))

(declare-fun b!1204943 () Bool)

(declare-fun Unit!39798 () Unit!39789)

(assert (=> b!1204943 (= e!684261 Unit!39798)))

(declare-fun b!1204944 () Bool)

(assert (=> b!1204944 (= e!684262 (isDefined!462 (getValueByKey!636 (toList!8888 lt!546183) k0!934)))))

(assert (= (and d!132715 c!118184) b!1204942))

(assert (= (and d!132715 (not c!118184)) b!1204943))

(assert (= (and d!132715 (not res!801540)) b!1204944))

(declare-fun m!1110453 () Bool)

(assert (=> d!132715 m!1110453))

(declare-fun m!1110455 () Bool)

(assert (=> b!1204942 m!1110455))

(declare-fun m!1110457 () Bool)

(assert (=> b!1204942 m!1110457))

(assert (=> b!1204942 m!1110457))

(declare-fun m!1110459 () Bool)

(assert (=> b!1204942 m!1110459))

(assert (=> b!1204944 m!1110457))

(assert (=> b!1204944 m!1110457))

(assert (=> b!1204944 m!1110459))

(assert (=> b!1204636 d!132715))

(declare-fun b!1204945 () Bool)

(declare-fun e!684268 () ListLongMap!17745)

(assert (=> b!1204945 (= e!684268 (ListLongMap!17746 Nil!26558))))

(declare-fun b!1204946 () Bool)

(declare-fun e!684263 () ListLongMap!17745)

(assert (=> b!1204946 (= e!684268 e!684263)))

(declare-fun c!118188 () Bool)

(assert (=> b!1204946 (= c!118188 (validKeyInArray!0 (select (arr!37608 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204947 () Bool)

(declare-fun e!684264 () Bool)

(assert (=> b!1204947 (= e!684264 (validKeyInArray!0 (select (arr!37608 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204947 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204948 () Bool)

(declare-fun e!684265 () Bool)

(declare-fun lt!546358 () ListLongMap!17745)

(assert (=> b!1204948 (= e!684265 (isEmpty!990 lt!546358))))

(declare-fun b!1204949 () Bool)

(declare-fun e!684266 () Bool)

(declare-fun e!684267 () Bool)

(assert (=> b!1204949 (= e!684266 e!684267)))

(assert (=> b!1204949 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 _keys!1208)))))

(declare-fun res!801541 () Bool)

(assert (=> b!1204949 (= res!801541 (contains!6888 lt!546358 (select (arr!37608 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204949 (=> (not res!801541) (not e!684267))))

(declare-fun b!1204950 () Bool)

(assert (=> b!1204950 (= e!684265 (= lt!546358 (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204951 () Bool)

(declare-fun lt!546359 () Unit!39789)

(declare-fun lt!546357 () Unit!39789)

(assert (=> b!1204951 (= lt!546359 lt!546357)))

(declare-fun lt!546362 () (_ BitVec 64))

(declare-fun lt!546361 () V!45953)

(declare-fun lt!546360 () (_ BitVec 64))

(declare-fun lt!546356 () ListLongMap!17745)

(assert (=> b!1204951 (not (contains!6888 (+!4020 lt!546356 (tuple2!19777 lt!546360 lt!546361)) lt!546362))))

(assert (=> b!1204951 (= lt!546357 (addStillNotContains!292 lt!546356 lt!546360 lt!546361 lt!546362))))

(assert (=> b!1204951 (= lt!546362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204951 (= lt!546361 (get!19189 (select (arr!37609 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204951 (= lt!546360 (select (arr!37608 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58337 () ListLongMap!17745)

(assert (=> b!1204951 (= lt!546356 call!58337)))

(assert (=> b!1204951 (= e!684263 (+!4020 call!58337 (tuple2!19777 (select (arr!37608 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19189 (select (arr!37609 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132717 () Bool)

(declare-fun e!684269 () Bool)

(assert (=> d!132717 e!684269))

(declare-fun res!801544 () Bool)

(assert (=> d!132717 (=> (not res!801544) (not e!684269))))

(assert (=> d!132717 (= res!801544 (not (contains!6888 lt!546358 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132717 (= lt!546358 e!684268)))

(declare-fun c!118186 () Bool)

(assert (=> d!132717 (= c!118186 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 _keys!1208)))))

(assert (=> d!132717 (validMask!0 mask!1564)))

(assert (=> d!132717 (= (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546358)))

(declare-fun b!1204952 () Bool)

(assert (=> b!1204952 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 _keys!1208)))))

(assert (=> b!1204952 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38147 _values!996)))))

(assert (=> b!1204952 (= e!684267 (= (apply!956 lt!546358 (select (arr!37608 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19189 (select (arr!37609 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204953 () Bool)

(assert (=> b!1204953 (= e!684269 e!684266)))

(declare-fun c!118187 () Bool)

(assert (=> b!1204953 (= c!118187 e!684264)))

(declare-fun res!801543 () Bool)

(assert (=> b!1204953 (=> (not res!801543) (not e!684264))))

(assert (=> b!1204953 (= res!801543 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 _keys!1208)))))

(declare-fun b!1204954 () Bool)

(assert (=> b!1204954 (= e!684263 call!58337)))

(declare-fun bm!58334 () Bool)

(assert (=> bm!58334 (= call!58337 (getCurrentListMapNoExtraKeys!5334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204955 () Bool)

(assert (=> b!1204955 (= e!684266 e!684265)))

(declare-fun c!118185 () Bool)

(assert (=> b!1204955 (= c!118185 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 _keys!1208)))))

(declare-fun b!1204956 () Bool)

(declare-fun res!801542 () Bool)

(assert (=> b!1204956 (=> (not res!801542) (not e!684269))))

(assert (=> b!1204956 (= res!801542 (not (contains!6888 lt!546358 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132717 c!118186) b!1204945))

(assert (= (and d!132717 (not c!118186)) b!1204946))

(assert (= (and b!1204946 c!118188) b!1204951))

(assert (= (and b!1204946 (not c!118188)) b!1204954))

(assert (= (or b!1204951 b!1204954) bm!58334))

(assert (= (and d!132717 res!801544) b!1204956))

(assert (= (and b!1204956 res!801542) b!1204953))

(assert (= (and b!1204953 res!801543) b!1204947))

(assert (= (and b!1204953 c!118187) b!1204949))

(assert (= (and b!1204953 (not c!118187)) b!1204955))

(assert (= (and b!1204949 res!801541) b!1204952))

(assert (= (and b!1204955 c!118185) b!1204950))

(assert (= (and b!1204955 (not c!118185)) b!1204948))

(declare-fun b_lambda!21273 () Bool)

(assert (=> (not b_lambda!21273) (not b!1204951)))

(assert (=> b!1204951 t!39446))

(declare-fun b_and!42795 () Bool)

(assert (= b_and!42793 (and (=> t!39446 result!22005) b_and!42795)))

(declare-fun b_lambda!21275 () Bool)

(assert (=> (not b_lambda!21275) (not b!1204952)))

(assert (=> b!1204952 t!39446))

(declare-fun b_and!42797 () Bool)

(assert (= b_and!42795 (and (=> t!39446 result!22005) b_and!42797)))

(assert (=> b!1204947 m!1110323))

(assert (=> b!1204947 m!1110323))

(declare-fun m!1110461 () Bool)

(assert (=> b!1204947 m!1110461))

(declare-fun m!1110463 () Bool)

(assert (=> b!1204956 m!1110463))

(declare-fun m!1110465 () Bool)

(assert (=> b!1204950 m!1110465))

(declare-fun m!1110467 () Bool)

(assert (=> d!132717 m!1110467))

(assert (=> d!132717 m!1110193))

(assert (=> b!1204949 m!1110323))

(assert (=> b!1204949 m!1110323))

(declare-fun m!1110469 () Bool)

(assert (=> b!1204949 m!1110469))

(assert (=> b!1204951 m!1110157))

(declare-fun m!1110471 () Bool)

(assert (=> b!1204951 m!1110471))

(declare-fun m!1110473 () Bool)

(assert (=> b!1204951 m!1110473))

(assert (=> b!1204951 m!1110157))

(declare-fun m!1110475 () Bool)

(assert (=> b!1204951 m!1110475))

(declare-fun m!1110477 () Bool)

(assert (=> b!1204951 m!1110477))

(declare-fun m!1110479 () Bool)

(assert (=> b!1204951 m!1110479))

(assert (=> b!1204951 m!1110323))

(assert (=> b!1204951 m!1110477))

(declare-fun m!1110481 () Bool)

(assert (=> b!1204951 m!1110481))

(assert (=> b!1204951 m!1110473))

(assert (=> bm!58334 m!1110465))

(assert (=> b!1204952 m!1110157))

(assert (=> b!1204952 m!1110473))

(assert (=> b!1204952 m!1110157))

(assert (=> b!1204952 m!1110475))

(assert (=> b!1204952 m!1110473))

(assert (=> b!1204952 m!1110323))

(declare-fun m!1110483 () Bool)

(assert (=> b!1204952 m!1110483))

(assert (=> b!1204952 m!1110323))

(declare-fun m!1110485 () Bool)

(assert (=> b!1204948 m!1110485))

(assert (=> b!1204946 m!1110323))

(assert (=> b!1204946 m!1110323))

(assert (=> b!1204946 m!1110461))

(assert (=> b!1204636 d!132717))

(declare-fun d!132719 () Bool)

(declare-fun res!801545 () Bool)

(declare-fun e!684270 () Bool)

(assert (=> d!132719 (=> res!801545 e!684270)))

(assert (=> d!132719 (= res!801545 (= (select (arr!37608 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132719 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!684270)))

(declare-fun b!1204957 () Bool)

(declare-fun e!684271 () Bool)

(assert (=> b!1204957 (= e!684270 e!684271)))

(declare-fun res!801546 () Bool)

(assert (=> b!1204957 (=> (not res!801546) (not e!684271))))

(assert (=> b!1204957 (= res!801546 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38146 _keys!1208)))))

(declare-fun b!1204958 () Bool)

(assert (=> b!1204958 (= e!684271 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132719 (not res!801545)) b!1204957))

(assert (= (and b!1204957 res!801546) b!1204958))

(assert (=> d!132719 m!1110405))

(declare-fun m!1110487 () Bool)

(assert (=> b!1204958 m!1110487))

(assert (=> b!1204659 d!132719))

(declare-fun d!132721 () Bool)

(assert (=> d!132721 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546365 () Unit!39789)

(declare-fun choose!13 (array!77932 (_ BitVec 64) (_ BitVec 32)) Unit!39789)

(assert (=> d!132721 (= lt!546365 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132721 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132721 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!546365)))

(declare-fun bs!34070 () Bool)

(assert (= bs!34070 d!132721))

(assert (=> bs!34070 m!1110165))

(declare-fun m!1110489 () Bool)

(assert (=> bs!34070 m!1110489))

(assert (=> b!1204659 d!132721))

(declare-fun d!132723 () Bool)

(declare-fun e!684274 () Bool)

(assert (=> d!132723 e!684274))

(declare-fun c!118191 () Bool)

(assert (=> d!132723 (= c!118191 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546368 () Unit!39789)

(declare-fun choose!1805 (array!77932 array!77934 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 64) (_ BitVec 32) Int) Unit!39789)

(assert (=> d!132723 (= lt!546368 (choose!1805 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132723 (validMask!0 mask!1564)))

(assert (=> d!132723 (= (lemmaListMapContainsThenArrayContainsFrom!557 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546368)))

(declare-fun b!1204963 () Bool)

(assert (=> b!1204963 (= e!684274 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1204964 () Bool)

(assert (=> b!1204964 (= e!684274 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!132723 c!118191) b!1204963))

(assert (= (and d!132723 (not c!118191)) b!1204964))

(declare-fun m!1110491 () Bool)

(assert (=> d!132723 m!1110491))

(assert (=> d!132723 m!1110193))

(assert (=> b!1204963 m!1110143))

(assert (=> b!1204644 d!132723))

(declare-fun b!1204965 () Bool)

(declare-fun e!684280 () ListLongMap!17745)

(assert (=> b!1204965 (= e!684280 (ListLongMap!17746 Nil!26558))))

(declare-fun b!1204966 () Bool)

(declare-fun e!684275 () ListLongMap!17745)

(assert (=> b!1204966 (= e!684280 e!684275)))

(declare-fun c!118195 () Bool)

(assert (=> b!1204966 (= c!118195 (validKeyInArray!0 (select (arr!37608 lt!546175) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204967 () Bool)

(declare-fun e!684276 () Bool)

(assert (=> b!1204967 (= e!684276 (validKeyInArray!0 (select (arr!37608 lt!546175) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204967 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204968 () Bool)

(declare-fun e!684277 () Bool)

(declare-fun lt!546371 () ListLongMap!17745)

(assert (=> b!1204968 (= e!684277 (isEmpty!990 lt!546371))))

(declare-fun b!1204969 () Bool)

(declare-fun e!684278 () Bool)

(declare-fun e!684279 () Bool)

(assert (=> b!1204969 (= e!684278 e!684279)))

(assert (=> b!1204969 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 lt!546175)))))

(declare-fun res!801547 () Bool)

(assert (=> b!1204969 (= res!801547 (contains!6888 lt!546371 (select (arr!37608 lt!546175) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204969 (=> (not res!801547) (not e!684279))))

(declare-fun b!1204970 () Bool)

(assert (=> b!1204970 (= e!684277 (= lt!546371 (getCurrentListMapNoExtraKeys!5334 lt!546175 lt!546177 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204971 () Bool)

(declare-fun lt!546372 () Unit!39789)

(declare-fun lt!546370 () Unit!39789)

(assert (=> b!1204971 (= lt!546372 lt!546370)))

(declare-fun lt!546373 () (_ BitVec 64))

(declare-fun lt!546369 () ListLongMap!17745)

(declare-fun lt!546374 () V!45953)

(declare-fun lt!546375 () (_ BitVec 64))

(assert (=> b!1204971 (not (contains!6888 (+!4020 lt!546369 (tuple2!19777 lt!546373 lt!546374)) lt!546375))))

(assert (=> b!1204971 (= lt!546370 (addStillNotContains!292 lt!546369 lt!546373 lt!546374 lt!546375))))

(assert (=> b!1204971 (= lt!546375 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204971 (= lt!546374 (get!19189 (select (arr!37609 lt!546177) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204971 (= lt!546373 (select (arr!37608 lt!546175) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58338 () ListLongMap!17745)

(assert (=> b!1204971 (= lt!546369 call!58338)))

(assert (=> b!1204971 (= e!684275 (+!4020 call!58338 (tuple2!19777 (select (arr!37608 lt!546175) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19189 (select (arr!37609 lt!546177) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132725 () Bool)

(declare-fun e!684281 () Bool)

(assert (=> d!132725 e!684281))

(declare-fun res!801550 () Bool)

(assert (=> d!132725 (=> (not res!801550) (not e!684281))))

(assert (=> d!132725 (= res!801550 (not (contains!6888 lt!546371 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132725 (= lt!546371 e!684280)))

(declare-fun c!118193 () Bool)

(assert (=> d!132725 (= c!118193 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 lt!546175)))))

(assert (=> d!132725 (validMask!0 mask!1564)))

(assert (=> d!132725 (= (getCurrentListMapNoExtraKeys!5334 lt!546175 lt!546177 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546371)))

(declare-fun b!1204972 () Bool)

(assert (=> b!1204972 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 lt!546175)))))

(assert (=> b!1204972 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38147 lt!546177)))))

(assert (=> b!1204972 (= e!684279 (= (apply!956 lt!546371 (select (arr!37608 lt!546175) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19189 (select (arr!37609 lt!546177) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204973 () Bool)

(assert (=> b!1204973 (= e!684281 e!684278)))

(declare-fun c!118194 () Bool)

(assert (=> b!1204973 (= c!118194 e!684276)))

(declare-fun res!801549 () Bool)

(assert (=> b!1204973 (=> (not res!801549) (not e!684276))))

(assert (=> b!1204973 (= res!801549 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 lt!546175)))))

(declare-fun b!1204974 () Bool)

(assert (=> b!1204974 (= e!684275 call!58338)))

(declare-fun bm!58335 () Bool)

(assert (=> bm!58335 (= call!58338 (getCurrentListMapNoExtraKeys!5334 lt!546175 lt!546177 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204975 () Bool)

(assert (=> b!1204975 (= e!684278 e!684277)))

(declare-fun c!118192 () Bool)

(assert (=> b!1204975 (= c!118192 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38146 lt!546175)))))

(declare-fun b!1204976 () Bool)

(declare-fun res!801548 () Bool)

(assert (=> b!1204976 (=> (not res!801548) (not e!684281))))

(assert (=> b!1204976 (= res!801548 (not (contains!6888 lt!546371 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132725 c!118193) b!1204965))

(assert (= (and d!132725 (not c!118193)) b!1204966))

(assert (= (and b!1204966 c!118195) b!1204971))

(assert (= (and b!1204966 (not c!118195)) b!1204974))

(assert (= (or b!1204971 b!1204974) bm!58335))

(assert (= (and d!132725 res!801550) b!1204976))

(assert (= (and b!1204976 res!801548) b!1204973))

(assert (= (and b!1204973 res!801549) b!1204967))

(assert (= (and b!1204973 c!118194) b!1204969))

(assert (= (and b!1204973 (not c!118194)) b!1204975))

(assert (= (and b!1204969 res!801547) b!1204972))

(assert (= (and b!1204975 c!118192) b!1204970))

(assert (= (and b!1204975 (not c!118192)) b!1204968))

(declare-fun b_lambda!21277 () Bool)

(assert (=> (not b_lambda!21277) (not b!1204971)))

(assert (=> b!1204971 t!39446))

(declare-fun b_and!42799 () Bool)

(assert (= b_and!42797 (and (=> t!39446 result!22005) b_and!42799)))

(declare-fun b_lambda!21279 () Bool)

(assert (=> (not b_lambda!21279) (not b!1204972)))

(assert (=> b!1204972 t!39446))

(declare-fun b_and!42801 () Bool)

(assert (= b_and!42799 (and (=> t!39446 result!22005) b_and!42801)))

(declare-fun m!1110493 () Bool)

(assert (=> b!1204967 m!1110493))

(assert (=> b!1204967 m!1110493))

(declare-fun m!1110495 () Bool)

(assert (=> b!1204967 m!1110495))

(declare-fun m!1110497 () Bool)

(assert (=> b!1204976 m!1110497))

(declare-fun m!1110499 () Bool)

(assert (=> b!1204970 m!1110499))

(declare-fun m!1110501 () Bool)

(assert (=> d!132725 m!1110501))

(assert (=> d!132725 m!1110193))

(assert (=> b!1204969 m!1110493))

(assert (=> b!1204969 m!1110493))

(declare-fun m!1110503 () Bool)

(assert (=> b!1204969 m!1110503))

(assert (=> b!1204971 m!1110157))

(declare-fun m!1110505 () Bool)

(assert (=> b!1204971 m!1110505))

(declare-fun m!1110507 () Bool)

(assert (=> b!1204971 m!1110507))

(assert (=> b!1204971 m!1110157))

(declare-fun m!1110509 () Bool)

(assert (=> b!1204971 m!1110509))

(declare-fun m!1110511 () Bool)

(assert (=> b!1204971 m!1110511))

(declare-fun m!1110513 () Bool)

(assert (=> b!1204971 m!1110513))

(assert (=> b!1204971 m!1110493))

(assert (=> b!1204971 m!1110511))

(declare-fun m!1110515 () Bool)

(assert (=> b!1204971 m!1110515))

(assert (=> b!1204971 m!1110507))

(assert (=> bm!58335 m!1110499))

(assert (=> b!1204972 m!1110157))

(assert (=> b!1204972 m!1110507))

(assert (=> b!1204972 m!1110157))

(assert (=> b!1204972 m!1110509))

(assert (=> b!1204972 m!1110507))

(assert (=> b!1204972 m!1110493))

(declare-fun m!1110517 () Bool)

(assert (=> b!1204972 m!1110517))

(assert (=> b!1204972 m!1110493))

(declare-fun m!1110519 () Bool)

(assert (=> b!1204968 m!1110519))

(assert (=> b!1204966 m!1110493))

(assert (=> b!1204966 m!1110493))

(assert (=> b!1204966 m!1110495))

(assert (=> bm!58264 d!132725))

(declare-fun d!132727 () Bool)

(declare-fun e!684283 () Bool)

(assert (=> d!132727 e!684283))

(declare-fun res!801551 () Bool)

(assert (=> d!132727 (=> res!801551 e!684283)))

(declare-fun lt!546379 () Bool)

(assert (=> d!132727 (= res!801551 (not lt!546379))))

(declare-fun lt!546378 () Bool)

(assert (=> d!132727 (= lt!546379 lt!546378)))

(declare-fun lt!546376 () Unit!39789)

(declare-fun e!684282 () Unit!39789)

(assert (=> d!132727 (= lt!546376 e!684282)))

(declare-fun c!118196 () Bool)

(assert (=> d!132727 (= c!118196 lt!546378)))

(assert (=> d!132727 (= lt!546378 (containsKey!590 (toList!8888 (ite c!118124 lt!546173 call!58272)) k0!934))))

(assert (=> d!132727 (= (contains!6888 (ite c!118124 lt!546173 call!58272) k0!934) lt!546379)))

(declare-fun b!1204977 () Bool)

(declare-fun lt!546377 () Unit!39789)

(assert (=> b!1204977 (= e!684282 lt!546377)))

(assert (=> b!1204977 (= lt!546377 (lemmaContainsKeyImpliesGetValueByKeyDefined!419 (toList!8888 (ite c!118124 lt!546173 call!58272)) k0!934))))

(assert (=> b!1204977 (isDefined!462 (getValueByKey!636 (toList!8888 (ite c!118124 lt!546173 call!58272)) k0!934))))

(declare-fun b!1204978 () Bool)

(declare-fun Unit!39799 () Unit!39789)

(assert (=> b!1204978 (= e!684282 Unit!39799)))

(declare-fun b!1204979 () Bool)

(assert (=> b!1204979 (= e!684283 (isDefined!462 (getValueByKey!636 (toList!8888 (ite c!118124 lt!546173 call!58272)) k0!934)))))

(assert (= (and d!132727 c!118196) b!1204977))

(assert (= (and d!132727 (not c!118196)) b!1204978))

(assert (= (and d!132727 (not res!801551)) b!1204979))

(declare-fun m!1110521 () Bool)

(assert (=> d!132727 m!1110521))

(declare-fun m!1110523 () Bool)

(assert (=> b!1204977 m!1110523))

(declare-fun m!1110525 () Bool)

(assert (=> b!1204977 m!1110525))

(assert (=> b!1204977 m!1110525))

(declare-fun m!1110527 () Bool)

(assert (=> b!1204977 m!1110527))

(assert (=> b!1204979 m!1110525))

(assert (=> b!1204979 m!1110525))

(assert (=> b!1204979 m!1110527))

(assert (=> bm!58266 d!132727))

(declare-fun b!1204980 () Bool)

(declare-fun e!684287 () Bool)

(declare-fun e!684286 () Bool)

(assert (=> b!1204980 (= e!684287 e!684286)))

(declare-fun c!118197 () Bool)

(assert (=> b!1204980 (= c!118197 (validKeyInArray!0 (select (arr!37608 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!58336 () Bool)

(declare-fun call!58339 () Bool)

(assert (=> bm!58336 (= call!58339 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118197 (Cons!26558 (select (arr!37608 _keys!1208) #b00000000000000000000000000000000) Nil!26559) Nil!26559)))))

(declare-fun b!1204981 () Bool)

(declare-fun e!684284 () Bool)

(assert (=> b!1204981 (= e!684284 e!684287)))

(declare-fun res!801552 () Bool)

(assert (=> b!1204981 (=> (not res!801552) (not e!684287))))

(declare-fun e!684285 () Bool)

(assert (=> b!1204981 (= res!801552 (not e!684285))))

(declare-fun res!801554 () Bool)

(assert (=> b!1204981 (=> (not res!801554) (not e!684285))))

(assert (=> b!1204981 (= res!801554 (validKeyInArray!0 (select (arr!37608 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204982 () Bool)

(assert (=> b!1204982 (= e!684286 call!58339)))

(declare-fun b!1204983 () Bool)

(assert (=> b!1204983 (= e!684285 (contains!6892 Nil!26559 (select (arr!37608 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132729 () Bool)

(declare-fun res!801553 () Bool)

(assert (=> d!132729 (=> res!801553 e!684284)))

(assert (=> d!132729 (= res!801553 (bvsge #b00000000000000000000000000000000 (size!38146 _keys!1208)))))

(assert (=> d!132729 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26559) e!684284)))

(declare-fun b!1204984 () Bool)

(assert (=> b!1204984 (= e!684286 call!58339)))

(assert (= (and d!132729 (not res!801553)) b!1204981))

(assert (= (and b!1204981 res!801554) b!1204983))

(assert (= (and b!1204981 res!801552) b!1204980))

(assert (= (and b!1204980 c!118197) b!1204982))

(assert (= (and b!1204980 (not c!118197)) b!1204984))

(assert (= (or b!1204982 b!1204984) bm!58336))

(assert (=> b!1204980 m!1110405))

(assert (=> b!1204980 m!1110405))

(assert (=> b!1204980 m!1110413))

(assert (=> bm!58336 m!1110405))

(declare-fun m!1110529 () Bool)

(assert (=> bm!58336 m!1110529))

(assert (=> b!1204981 m!1110405))

(assert (=> b!1204981 m!1110405))

(assert (=> b!1204981 m!1110413))

(assert (=> b!1204983 m!1110405))

(assert (=> b!1204983 m!1110405))

(declare-fun m!1110531 () Bool)

(assert (=> b!1204983 m!1110531))

(assert (=> b!1204652 d!132729))

(declare-fun b!1204985 () Bool)

(declare-fun e!684290 () Bool)

(declare-fun e!684288 () Bool)

(assert (=> b!1204985 (= e!684290 e!684288)))

(declare-fun lt!546382 () (_ BitVec 64))

(assert (=> b!1204985 (= lt!546382 (select (arr!37608 lt!546175) #b00000000000000000000000000000000))))

(declare-fun lt!546381 () Unit!39789)

(assert (=> b!1204985 (= lt!546381 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!546175 lt!546382 #b00000000000000000000000000000000))))

(assert (=> b!1204985 (arrayContainsKey!0 lt!546175 lt!546382 #b00000000000000000000000000000000)))

(declare-fun lt!546380 () Unit!39789)

(assert (=> b!1204985 (= lt!546380 lt!546381)))

(declare-fun res!801556 () Bool)

(assert (=> b!1204985 (= res!801556 (= (seekEntryOrOpen!0 (select (arr!37608 lt!546175) #b00000000000000000000000000000000) lt!546175 mask!1564) (Found!9935 #b00000000000000000000000000000000)))))

(assert (=> b!1204985 (=> (not res!801556) (not e!684288))))

(declare-fun b!1204986 () Bool)

(declare-fun e!684289 () Bool)

(assert (=> b!1204986 (= e!684289 e!684290)))

(declare-fun c!118198 () Bool)

(assert (=> b!1204986 (= c!118198 (validKeyInArray!0 (select (arr!37608 lt!546175) #b00000000000000000000000000000000)))))

(declare-fun bm!58337 () Bool)

(declare-fun call!58340 () Bool)

(assert (=> bm!58337 (= call!58340 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!546175 mask!1564))))

(declare-fun b!1204987 () Bool)

(assert (=> b!1204987 (= e!684288 call!58340)))

(declare-fun b!1204988 () Bool)

(assert (=> b!1204988 (= e!684290 call!58340)))

(declare-fun d!132731 () Bool)

(declare-fun res!801555 () Bool)

(assert (=> d!132731 (=> res!801555 e!684289)))

(assert (=> d!132731 (= res!801555 (bvsge #b00000000000000000000000000000000 (size!38146 lt!546175)))))

(assert (=> d!132731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546175 mask!1564) e!684289)))

(assert (= (and d!132731 (not res!801555)) b!1204986))

(assert (= (and b!1204986 c!118198) b!1204985))

(assert (= (and b!1204986 (not c!118198)) b!1204988))

(assert (= (and b!1204985 res!801556) b!1204987))

(assert (= (or b!1204987 b!1204988) bm!58337))

(assert (=> b!1204985 m!1110429))

(declare-fun m!1110533 () Bool)

(assert (=> b!1204985 m!1110533))

(declare-fun m!1110535 () Bool)

(assert (=> b!1204985 m!1110535))

(assert (=> b!1204985 m!1110429))

(declare-fun m!1110537 () Bool)

(assert (=> b!1204985 m!1110537))

(assert (=> b!1204986 m!1110429))

(assert (=> b!1204986 m!1110429))

(assert (=> b!1204986 m!1110431))

(declare-fun m!1110539 () Bool)

(assert (=> bm!58337 m!1110539))

(assert (=> b!1204634 d!132731))

(assert (=> bm!58263 d!132717))

(declare-fun condMapEmpty!47790 () Bool)

(declare-fun mapDefault!47790 () ValueCell!14600)

(assert (=> mapNonEmpty!47781 (= condMapEmpty!47790 (= mapRest!47781 ((as const (Array (_ BitVec 32) ValueCell!14600)) mapDefault!47790)))))

(declare-fun e!684296 () Bool)

(declare-fun mapRes!47790 () Bool)

(assert (=> mapNonEmpty!47781 (= tp!90745 (and e!684296 mapRes!47790))))

(declare-fun b!1204995 () Bool)

(declare-fun e!684295 () Bool)

(assert (=> b!1204995 (= e!684295 tp_is_empty!30619)))

(declare-fun mapIsEmpty!47790 () Bool)

(assert (=> mapIsEmpty!47790 mapRes!47790))

(declare-fun mapNonEmpty!47790 () Bool)

(declare-fun tp!90760 () Bool)

(assert (=> mapNonEmpty!47790 (= mapRes!47790 (and tp!90760 e!684295))))

(declare-fun mapRest!47790 () (Array (_ BitVec 32) ValueCell!14600))

(declare-fun mapKey!47790 () (_ BitVec 32))

(declare-fun mapValue!47790 () ValueCell!14600)

(assert (=> mapNonEmpty!47790 (= mapRest!47781 (store mapRest!47790 mapKey!47790 mapValue!47790))))

(declare-fun b!1204996 () Bool)

(assert (=> b!1204996 (= e!684296 tp_is_empty!30619)))

(assert (= (and mapNonEmpty!47781 condMapEmpty!47790) mapIsEmpty!47790))

(assert (= (and mapNonEmpty!47781 (not condMapEmpty!47790)) mapNonEmpty!47790))

(assert (= (and mapNonEmpty!47790 ((_ is ValueCellFull!14600) mapValue!47790)) b!1204995))

(assert (= (and mapNonEmpty!47781 ((_ is ValueCellFull!14600) mapDefault!47790)) b!1204996))

(declare-fun m!1110541 () Bool)

(assert (=> mapNonEmpty!47790 m!1110541))

(declare-fun b_lambda!21281 () Bool)

(assert (= b_lambda!21271 (or (and start!100708 b_free!25915) b_lambda!21281)))

(declare-fun b_lambda!21283 () Bool)

(assert (= b_lambda!21277 (or (and start!100708 b_free!25915) b_lambda!21283)))

(declare-fun b_lambda!21285 () Bool)

(assert (= b_lambda!21275 (or (and start!100708 b_free!25915) b_lambda!21285)))

(declare-fun b_lambda!21287 () Bool)

(assert (= b_lambda!21269 (or (and start!100708 b_free!25915) b_lambda!21287)))

(declare-fun b_lambda!21289 () Bool)

(assert (= b_lambda!21265 (or (and start!100708 b_free!25915) b_lambda!21289)))

(declare-fun b_lambda!21291 () Bool)

(assert (= b_lambda!21279 (or (and start!100708 b_free!25915) b_lambda!21291)))

(declare-fun b_lambda!21293 () Bool)

(assert (= b_lambda!21267 (or (and start!100708 b_free!25915) b_lambda!21293)))

(declare-fun b_lambda!21295 () Bool)

(assert (= b_lambda!21263 (or (and start!100708 b_free!25915) b_lambda!21295)))

(declare-fun b_lambda!21297 () Bool)

(assert (= b_lambda!21273 (or (and start!100708 b_free!25915) b_lambda!21297)))

(check-sat (not b_lambda!21293) (not bm!58336) (not b!1204952) (not b!1204986) (not d!132685) (not b!1204902) (not b!1204969) (not b!1204883) (not b!1204940) (not d!132723) (not mapNonEmpty!47790) (not b_lambda!21291) (not d!132705) (not b!1204946) (not b!1204948) (not b!1204971) (not bm!58330) (not b!1204887) (not b!1204970) (not bm!58333) (not b!1204976) (not b_lambda!21281) (not d!132715) (not b_lambda!21287) (not d!132717) (not b!1204958) (not b!1204942) (not d!132687) (not b!1204867) (not b!1204880) (not b!1204870) (not b!1204923) (not b!1204875) (not b_lambda!21283) (not b!1204839) (not b!1204866) (not b!1204895) (not b!1204967) (not b_lambda!21295) (not b!1204869) (not b_lambda!21289) (not bm!58337) (not bm!58320) (not b!1204944) (not bm!58329) tp_is_empty!30619 (not b!1204868) (not b!1204951) (not b!1204882) (not d!132725) (not bm!58334) (not d!132691) (not b!1204985) (not b!1204903) (not b!1204936) (not b!1204947) (not b_lambda!21297) (not b!1204912) (not b!1204981) (not b!1204935) (not d!132693) (not b!1204941) (not b!1204913) (not b_lambda!21261) (not b!1204871) (not b!1204938) (not b!1204949) (not b!1204966) (not b!1204972) (not b!1204881) (not b_next!25915) (not b!1204980) (not b!1204878) (not b!1204979) (not bm!58324) (not b!1204950) (not d!132711) (not d!132727) (not b_lambda!21285) (not b!1204963) (not d!132695) b_and!42801 (not b!1204977) (not b!1204983) (not b!1204968) (not b!1204879) (not b!1204865) (not b!1204877) (not bm!58321) (not bm!58335) (not b!1204897) (not d!132701) (not d!132699) (not d!132721) (not b!1204956))
(check-sat b_and!42801 (not b_next!25915))
