; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101082 () Bool)

(assert start!101082)

(declare-fun b_free!26043 () Bool)

(declare-fun b_next!26043 () Bool)

(assert (=> start!101082 (= b_free!26043 (not b_next!26043))))

(declare-fun tp!91147 () Bool)

(declare-fun b_and!43185 () Bool)

(assert (=> start!101082 (= tp!91147 b_and!43185)))

(declare-fun b!1211832 () Bool)

(declare-datatypes ((Unit!40184 0))(
  ( (Unit!40185) )
))
(declare-fun e!688218 () Unit!40184)

(declare-fun lt!550524 () Unit!40184)

(assert (=> b!1211832 (= e!688218 lt!550524)))

(declare-fun call!59978 () Unit!40184)

(assert (=> b!1211832 (= lt!550524 call!59978)))

(declare-fun call!59980 () Bool)

(assert (=> b!1211832 call!59980))

(declare-fun b!1211833 () Bool)

(declare-fun e!688212 () Bool)

(declare-fun tp_is_empty!30747 () Bool)

(assert (=> b!1211833 (= e!688212 tp_is_empty!30747)))

(declare-fun b!1211834 () Bool)

(declare-fun e!688217 () Unit!40184)

(declare-fun Unit!40186 () Unit!40184)

(assert (=> b!1211834 (= e!688217 Unit!40186)))

(declare-fun b!1211835 () Bool)

(declare-datatypes ((V!46123 0))(
  ( (V!46124 (val!15430 Int)) )
))
(declare-datatypes ((tuple2!19824 0))(
  ( (tuple2!19825 (_1!9923 (_ BitVec 64)) (_2!9923 V!46123)) )
))
(declare-datatypes ((List!26625 0))(
  ( (Nil!26622) (Cons!26621 (h!27830 tuple2!19824) (t!39648 List!26625)) )
))
(declare-datatypes ((ListLongMap!17793 0))(
  ( (ListLongMap!17794 (toList!8912 List!26625)) )
))
(declare-fun lt!550531 () ListLongMap!17793)

(declare-fun minValue!944 () V!46123)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6984 (ListLongMap!17793 (_ BitVec 64)) Bool)

(declare-fun +!4030 (ListLongMap!17793 tuple2!19824) ListLongMap!17793)

(assert (=> b!1211835 (contains!6984 (+!4030 lt!550531 (tuple2!19825 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!550540 () Unit!40184)

(declare-fun addStillContains!1057 (ListLongMap!17793 (_ BitVec 64) V!46123 (_ BitVec 64)) Unit!40184)

(assert (=> b!1211835 (= lt!550540 (addStillContains!1057 lt!550531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!59983 () Bool)

(assert (=> b!1211835 call!59983))

(declare-fun call!59984 () ListLongMap!17793)

(assert (=> b!1211835 (= lt!550531 call!59984)))

(declare-fun lt!550523 () Unit!40184)

(declare-fun call!59981 () Unit!40184)

(assert (=> b!1211835 (= lt!550523 call!59981)))

(declare-fun e!688220 () Unit!40184)

(assert (=> b!1211835 (= e!688220 lt!550540)))

(declare-fun zeroValue!944 () V!46123)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun b!1211836 () Bool)

(declare-fun lt!550541 () ListLongMap!17793)

(declare-fun e!688223 () Bool)

(declare-datatypes ((array!78281 0))(
  ( (array!78282 (arr!37776 (Array (_ BitVec 32) (_ BitVec 64))) (size!38312 (_ BitVec 32))) )
))
(declare-fun lt!550536 () array!78281)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14664 0))(
  ( (ValueCellFull!14664 (v!18082 V!46123)) (EmptyCell!14664) )
))
(declare-datatypes ((array!78283 0))(
  ( (array!78284 (arr!37777 (Array (_ BitVec 32) ValueCell!14664)) (size!38313 (_ BitVec 32))) )
))
(declare-fun lt!550532 () array!78283)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5344 (array!78281 array!78283 (_ BitVec 32) (_ BitVec 32) V!46123 V!46123 (_ BitVec 32) Int) ListLongMap!17793)

(assert (=> b!1211836 (= e!688223 (= lt!550541 (getCurrentListMapNoExtraKeys!5344 lt!550536 lt!550532 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun lt!550528 () ListLongMap!17793)

(assert (=> b!1211836 (= lt!550541 lt!550528)))

(declare-fun lt!550527 () ListLongMap!17793)

(declare-fun -!1860 (ListLongMap!17793 (_ BitVec 64)) ListLongMap!17793)

(assert (=> b!1211836 (= lt!550541 (-!1860 lt!550527 k0!934))))

(declare-fun _keys!1208 () array!78281)

(declare-fun lt!550535 () V!46123)

(assert (=> b!1211836 (= (-!1860 (+!4030 lt!550528 (tuple2!19825 (select (arr!37776 _keys!1208) from!1455) lt!550535)) (select (arr!37776 _keys!1208) from!1455)) lt!550528)))

(declare-fun lt!550520 () Unit!40184)

(declare-fun addThenRemoveForNewKeyIsSame!277 (ListLongMap!17793 (_ BitVec 64) V!46123) Unit!40184)

(assert (=> b!1211836 (= lt!550520 (addThenRemoveForNewKeyIsSame!277 lt!550528 (select (arr!37776 _keys!1208) from!1455) lt!550535))))

(declare-fun lt!550525 () V!46123)

(declare-fun _values!996 () array!78283)

(declare-fun get!19252 (ValueCell!14664 V!46123) V!46123)

(assert (=> b!1211836 (= lt!550535 (get!19252 (select (arr!37777 _values!996) from!1455) lt!550525))))

(declare-fun lt!550538 () Unit!40184)

(assert (=> b!1211836 (= lt!550538 e!688217)))

(declare-fun c!119549 () Bool)

(assert (=> b!1211836 (= c!119549 (contains!6984 lt!550528 k0!934))))

(assert (=> b!1211836 (= lt!550528 (getCurrentListMapNoExtraKeys!5344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211837 () Bool)

(declare-fun e!688219 () Bool)

(declare-fun call!59985 () ListLongMap!17793)

(declare-fun call!59982 () ListLongMap!17793)

(assert (=> b!1211837 (= e!688219 (= call!59985 call!59982))))

(declare-fun bm!59975 () Bool)

(assert (=> bm!59975 (= call!59978 call!59981)))

(declare-fun b!1211838 () Bool)

(declare-fun e!688227 () Bool)

(declare-fun e!688226 () Bool)

(assert (=> b!1211838 (= e!688227 e!688226)))

(declare-fun res!804978 () Bool)

(assert (=> b!1211838 (=> (not res!804978) (not e!688226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78281 (_ BitVec 32)) Bool)

(assert (=> b!1211838 (= res!804978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550536 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211838 (= lt!550536 (array!78282 (store (arr!37776 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38312 _keys!1208)))))

(declare-fun b!1211839 () Bool)

(declare-fun e!688215 () Bool)

(assert (=> b!1211839 (= e!688226 (not e!688215))))

(declare-fun res!804967 () Bool)

(assert (=> b!1211839 (=> res!804967 e!688215)))

(assert (=> b!1211839 (= res!804967 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211839 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550539 () Unit!40184)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78281 (_ BitVec 64) (_ BitVec 32)) Unit!40184)

(assert (=> b!1211839 (= lt!550539 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1211840 () Bool)

(declare-fun e!688225 () Bool)

(assert (=> b!1211840 (= e!688215 e!688225)))

(declare-fun res!804969 () Bool)

(assert (=> b!1211840 (=> res!804969 e!688225)))

(assert (=> b!1211840 (= res!804969 (not (= from!1455 i!673)))))

(declare-fun lt!550522 () ListLongMap!17793)

(assert (=> b!1211840 (= lt!550522 (getCurrentListMapNoExtraKeys!5344 lt!550536 lt!550532 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1211840 (= lt!550532 (array!78284 (store (arr!37777 _values!996) i!673 (ValueCellFull!14664 lt!550525)) (size!38313 _values!996)))))

(declare-fun dynLambda!3238 (Int (_ BitVec 64)) V!46123)

(assert (=> b!1211840 (= lt!550525 (dynLambda!3238 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1211840 (= lt!550527 (getCurrentListMapNoExtraKeys!5344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59976 () Bool)

(assert (=> bm!59976 (= call!59980 call!59983)))

(declare-fun b!1211841 () Bool)

(declare-fun res!804977 () Bool)

(assert (=> b!1211841 (=> (not res!804977) (not e!688227))))

(assert (=> b!1211841 (= res!804977 (= (select (arr!37776 _keys!1208) i!673) k0!934))))

(declare-fun bm!59977 () Bool)

(assert (=> bm!59977 (= call!59982 (getCurrentListMapNoExtraKeys!5344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47992 () Bool)

(declare-fun mapRes!47992 () Bool)

(assert (=> mapIsEmpty!47992 mapRes!47992))

(declare-fun b!1211842 () Bool)

(declare-fun e!688221 () Bool)

(assert (=> b!1211842 (= e!688221 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!47992 () Bool)

(declare-fun tp!91148 () Bool)

(declare-fun e!688216 () Bool)

(assert (=> mapNonEmpty!47992 (= mapRes!47992 (and tp!91148 e!688216))))

(declare-fun mapKey!47992 () (_ BitVec 32))

(declare-fun mapRest!47992 () (Array (_ BitVec 32) ValueCell!14664))

(declare-fun mapValue!47992 () ValueCell!14664)

(assert (=> mapNonEmpty!47992 (= (arr!37777 _values!996) (store mapRest!47992 mapKey!47992 mapValue!47992))))

(declare-fun bm!59978 () Bool)

(assert (=> bm!59978 (= call!59985 (getCurrentListMapNoExtraKeys!5344 lt!550536 lt!550532 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211843 () Bool)

(assert (=> b!1211843 call!59980))

(declare-fun lt!550530 () Unit!40184)

(assert (=> b!1211843 (= lt!550530 call!59978)))

(declare-fun e!688224 () Unit!40184)

(assert (=> b!1211843 (= e!688224 lt!550530)))

(declare-fun b!1211844 () Bool)

(declare-fun Unit!40187 () Unit!40184)

(assert (=> b!1211844 (= e!688217 Unit!40187)))

(declare-fun lt!550533 () Bool)

(assert (=> b!1211844 (= lt!550533 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119546 () Bool)

(assert (=> b!1211844 (= c!119546 (and (not lt!550533) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550537 () Unit!40184)

(assert (=> b!1211844 (= lt!550537 e!688220)))

(declare-fun lt!550521 () Unit!40184)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!607 (array!78281 array!78283 (_ BitVec 32) (_ BitVec 32) V!46123 V!46123 (_ BitVec 64) (_ BitVec 32) Int) Unit!40184)

(assert (=> b!1211844 (= lt!550521 (lemmaListMapContainsThenArrayContainsFrom!607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119550 () Bool)

(assert (=> b!1211844 (= c!119550 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804968 () Bool)

(assert (=> b!1211844 (= res!804968 e!688221)))

(declare-fun e!688222 () Bool)

(assert (=> b!1211844 (=> (not res!804968) (not e!688222))))

(assert (=> b!1211844 e!688222))

(declare-fun lt!550534 () Unit!40184)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78281 (_ BitVec 32) (_ BitVec 32)) Unit!40184)

(assert (=> b!1211844 (= lt!550534 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26626 0))(
  ( (Nil!26623) (Cons!26622 (h!27831 (_ BitVec 64)) (t!39649 List!26626)) )
))
(declare-fun arrayNoDuplicates!0 (array!78281 (_ BitVec 32) List!26626) Bool)

(assert (=> b!1211844 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26623)))

(declare-fun lt!550529 () Unit!40184)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78281 (_ BitVec 64) (_ BitVec 32) List!26626) Unit!40184)

(assert (=> b!1211844 (= lt!550529 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26623))))

(assert (=> b!1211844 false))

(declare-fun b!1211845 () Bool)

(declare-fun e!688214 () Bool)

(assert (=> b!1211845 (= e!688214 (and e!688212 mapRes!47992))))

(declare-fun condMapEmpty!47992 () Bool)

(declare-fun mapDefault!47992 () ValueCell!14664)

(assert (=> b!1211845 (= condMapEmpty!47992 (= (arr!37777 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14664)) mapDefault!47992)))))

(declare-fun b!1211846 () Bool)

(declare-fun res!804974 () Bool)

(assert (=> b!1211846 (=> (not res!804974) (not e!688227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211846 (= res!804974 (validMask!0 mask!1564))))

(declare-fun res!804979 () Bool)

(assert (=> start!101082 (=> (not res!804979) (not e!688227))))

(assert (=> start!101082 (= res!804979 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38312 _keys!1208))))))

(assert (=> start!101082 e!688227))

(assert (=> start!101082 tp_is_empty!30747))

(declare-fun array_inv!28776 (array!78281) Bool)

(assert (=> start!101082 (array_inv!28776 _keys!1208)))

(assert (=> start!101082 true))

(assert (=> start!101082 tp!91147))

(declare-fun array_inv!28777 (array!78283) Bool)

(assert (=> start!101082 (and (array_inv!28777 _values!996) e!688214)))

(declare-fun b!1211847 () Bool)

(declare-fun res!804976 () Bool)

(assert (=> b!1211847 (=> (not res!804976) (not e!688227))))

(assert (=> b!1211847 (= res!804976 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26623))))

(declare-fun b!1211848 () Bool)

(assert (=> b!1211848 (= e!688225 e!688223)))

(declare-fun res!804973 () Bool)

(assert (=> b!1211848 (=> res!804973 e!688223)))

(assert (=> b!1211848 (= res!804973 (not (= (select (arr!37776 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1211848 e!688219))

(declare-fun c!119547 () Bool)

(assert (=> b!1211848 (= c!119547 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550526 () Unit!40184)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1070 (array!78281 array!78283 (_ BitVec 32) (_ BitVec 32) V!46123 V!46123 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40184)

(assert (=> b!1211848 (= lt!550526 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1070 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211849 () Bool)

(assert (=> b!1211849 (= e!688221 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550533) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1211850 () Bool)

(assert (=> b!1211850 (= e!688222 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun c!119551 () Bool)

(declare-fun bm!59979 () Bool)

(assert (=> bm!59979 (= call!59981 (addStillContains!1057 lt!550528 (ite (or c!119546 c!119551) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119546 c!119551) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!59980 () Bool)

(declare-fun call!59979 () ListLongMap!17793)

(assert (=> bm!59980 (= call!59979 call!59984)))

(declare-fun b!1211851 () Bool)

(declare-fun res!804975 () Bool)

(assert (=> b!1211851 (=> (not res!804975) (not e!688227))))

(assert (=> b!1211851 (= res!804975 (and (= (size!38313 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38312 _keys!1208) (size!38313 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1211852 () Bool)

(declare-fun res!804970 () Bool)

(assert (=> b!1211852 (=> (not res!804970) (not e!688226))))

(assert (=> b!1211852 (= res!804970 (arrayNoDuplicates!0 lt!550536 #b00000000000000000000000000000000 Nil!26623))))

(declare-fun bm!59981 () Bool)

(assert (=> bm!59981 (= call!59984 (+!4030 lt!550528 (ite (or c!119546 c!119551) (tuple2!19825 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19825 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1211853 () Bool)

(assert (=> b!1211853 (= e!688216 tp_is_empty!30747)))

(declare-fun b!1211854 () Bool)

(declare-fun res!804966 () Bool)

(assert (=> b!1211854 (=> (not res!804966) (not e!688227))))

(assert (=> b!1211854 (= res!804966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211855 () Bool)

(declare-fun Unit!40188 () Unit!40184)

(assert (=> b!1211855 (= e!688224 Unit!40188)))

(declare-fun b!1211856 () Bool)

(assert (=> b!1211856 (= e!688219 (= call!59985 (-!1860 call!59982 k0!934)))))

(declare-fun b!1211857 () Bool)

(declare-fun res!804971 () Bool)

(assert (=> b!1211857 (=> (not res!804971) (not e!688227))))

(assert (=> b!1211857 (= res!804971 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38312 _keys!1208))))))

(declare-fun bm!59982 () Bool)

(assert (=> bm!59982 (= call!59983 (contains!6984 (ite c!119546 lt!550531 call!59979) k0!934))))

(declare-fun b!1211858 () Bool)

(assert (=> b!1211858 (= c!119551 (and (not lt!550533) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1211858 (= e!688220 e!688218)))

(declare-fun b!1211859 () Bool)

(declare-fun res!804972 () Bool)

(assert (=> b!1211859 (=> (not res!804972) (not e!688227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211859 (= res!804972 (validKeyInArray!0 k0!934))))

(declare-fun b!1211860 () Bool)

(assert (=> b!1211860 (= e!688218 e!688224)))

(declare-fun c!119548 () Bool)

(assert (=> b!1211860 (= c!119548 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550533))))

(assert (= (and start!101082 res!804979) b!1211846))

(assert (= (and b!1211846 res!804974) b!1211851))

(assert (= (and b!1211851 res!804975) b!1211854))

(assert (= (and b!1211854 res!804966) b!1211847))

(assert (= (and b!1211847 res!804976) b!1211857))

(assert (= (and b!1211857 res!804971) b!1211859))

(assert (= (and b!1211859 res!804972) b!1211841))

(assert (= (and b!1211841 res!804977) b!1211838))

(assert (= (and b!1211838 res!804978) b!1211852))

(assert (= (and b!1211852 res!804970) b!1211839))

(assert (= (and b!1211839 (not res!804967)) b!1211840))

(assert (= (and b!1211840 (not res!804969)) b!1211848))

(assert (= (and b!1211848 c!119547) b!1211856))

(assert (= (and b!1211848 (not c!119547)) b!1211837))

(assert (= (or b!1211856 b!1211837) bm!59978))

(assert (= (or b!1211856 b!1211837) bm!59977))

(assert (= (and b!1211848 (not res!804973)) b!1211836))

(assert (= (and b!1211836 c!119549) b!1211844))

(assert (= (and b!1211836 (not c!119549)) b!1211834))

(assert (= (and b!1211844 c!119546) b!1211835))

(assert (= (and b!1211844 (not c!119546)) b!1211858))

(assert (= (and b!1211858 c!119551) b!1211832))

(assert (= (and b!1211858 (not c!119551)) b!1211860))

(assert (= (and b!1211860 c!119548) b!1211843))

(assert (= (and b!1211860 (not c!119548)) b!1211855))

(assert (= (or b!1211832 b!1211843) bm!59975))

(assert (= (or b!1211832 b!1211843) bm!59980))

(assert (= (or b!1211832 b!1211843) bm!59976))

(assert (= (or b!1211835 bm!59976) bm!59982))

(assert (= (or b!1211835 bm!59975) bm!59979))

(assert (= (or b!1211835 bm!59980) bm!59981))

(assert (= (and b!1211844 c!119550) b!1211842))

(assert (= (and b!1211844 (not c!119550)) b!1211849))

(assert (= (and b!1211844 res!804968) b!1211850))

(assert (= (and b!1211845 condMapEmpty!47992) mapIsEmpty!47992))

(assert (= (and b!1211845 (not condMapEmpty!47992)) mapNonEmpty!47992))

(get-info :version)

(assert (= (and mapNonEmpty!47992 ((_ is ValueCellFull!14664) mapValue!47992)) b!1211853))

(assert (= (and b!1211845 ((_ is ValueCellFull!14664) mapDefault!47992)) b!1211833))

(assert (= start!101082 b!1211845))

(declare-fun b_lambda!21681 () Bool)

(assert (=> (not b_lambda!21681) (not b!1211840)))

(declare-fun t!39647 () Bool)

(declare-fun tb!10843 () Bool)

(assert (=> (and start!101082 (= defaultEntry!1004 defaultEntry!1004) t!39647) tb!10843))

(declare-fun result!22281 () Bool)

(assert (=> tb!10843 (= result!22281 tp_is_empty!30747)))

(assert (=> b!1211840 t!39647))

(declare-fun b_and!43187 () Bool)

(assert (= b_and!43185 (and (=> t!39647 result!22281) b_and!43187)))

(declare-fun m!1117239 () Bool)

(assert (=> b!1211859 m!1117239))

(declare-fun m!1117241 () Bool)

(assert (=> b!1211854 m!1117241))

(declare-fun m!1117243 () Bool)

(assert (=> b!1211852 m!1117243))

(declare-fun m!1117245 () Bool)

(assert (=> b!1211856 m!1117245))

(declare-fun m!1117247 () Bool)

(assert (=> b!1211850 m!1117247))

(declare-fun m!1117249 () Bool)

(assert (=> bm!59982 m!1117249))

(declare-fun m!1117251 () Bool)

(assert (=> b!1211838 m!1117251))

(declare-fun m!1117253 () Bool)

(assert (=> b!1211838 m!1117253))

(declare-fun m!1117255 () Bool)

(assert (=> bm!59978 m!1117255))

(declare-fun m!1117257 () Bool)

(assert (=> b!1211847 m!1117257))

(declare-fun m!1117259 () Bool)

(assert (=> b!1211841 m!1117259))

(declare-fun m!1117261 () Bool)

(assert (=> bm!59981 m!1117261))

(declare-fun m!1117263 () Bool)

(assert (=> b!1211836 m!1117263))

(declare-fun m!1117265 () Bool)

(assert (=> b!1211836 m!1117265))

(declare-fun m!1117267 () Bool)

(assert (=> b!1211836 m!1117267))

(assert (=> b!1211836 m!1117265))

(declare-fun m!1117269 () Bool)

(assert (=> b!1211836 m!1117269))

(declare-fun m!1117271 () Bool)

(assert (=> b!1211836 m!1117271))

(declare-fun m!1117273 () Bool)

(assert (=> b!1211836 m!1117273))

(declare-fun m!1117275 () Bool)

(assert (=> b!1211836 m!1117275))

(declare-fun m!1117277 () Bool)

(assert (=> b!1211836 m!1117277))

(assert (=> b!1211836 m!1117275))

(assert (=> b!1211836 m!1117273))

(assert (=> b!1211836 m!1117275))

(declare-fun m!1117279 () Bool)

(assert (=> b!1211836 m!1117279))

(assert (=> b!1211836 m!1117255))

(declare-fun m!1117281 () Bool)

(assert (=> start!101082 m!1117281))

(declare-fun m!1117283 () Bool)

(assert (=> start!101082 m!1117283))

(declare-fun m!1117285 () Bool)

(assert (=> b!1211835 m!1117285))

(assert (=> b!1211835 m!1117285))

(declare-fun m!1117287 () Bool)

(assert (=> b!1211835 m!1117287))

(declare-fun m!1117289 () Bool)

(assert (=> b!1211835 m!1117289))

(assert (=> b!1211842 m!1117247))

(declare-fun m!1117291 () Bool)

(assert (=> b!1211844 m!1117291))

(declare-fun m!1117293 () Bool)

(assert (=> b!1211844 m!1117293))

(declare-fun m!1117295 () Bool)

(assert (=> b!1211844 m!1117295))

(declare-fun m!1117297 () Bool)

(assert (=> b!1211844 m!1117297))

(assert (=> b!1211848 m!1117275))

(declare-fun m!1117299 () Bool)

(assert (=> b!1211848 m!1117299))

(declare-fun m!1117301 () Bool)

(assert (=> b!1211840 m!1117301))

(declare-fun m!1117303 () Bool)

(assert (=> b!1211840 m!1117303))

(declare-fun m!1117305 () Bool)

(assert (=> b!1211840 m!1117305))

(declare-fun m!1117307 () Bool)

(assert (=> b!1211840 m!1117307))

(assert (=> bm!59977 m!1117263))

(declare-fun m!1117309 () Bool)

(assert (=> b!1211839 m!1117309))

(declare-fun m!1117311 () Bool)

(assert (=> b!1211839 m!1117311))

(declare-fun m!1117313 () Bool)

(assert (=> bm!59979 m!1117313))

(declare-fun m!1117315 () Bool)

(assert (=> b!1211846 m!1117315))

(declare-fun m!1117317 () Bool)

(assert (=> mapNonEmpty!47992 m!1117317))

(check-sat (not b!1211835) (not bm!59981) (not b!1211844) (not b!1211848) (not bm!59977) (not b!1211856) (not bm!59982) (not b!1211839) (not bm!59979) (not b!1211840) (not b!1211852) (not mapNonEmpty!47992) (not b!1211850) tp_is_empty!30747 (not b!1211846) (not start!101082) (not b_next!26043) (not b!1211859) (not b!1211847) (not b!1211836) (not b!1211842) (not b!1211838) (not bm!59978) (not b_lambda!21681) (not b!1211854) b_and!43187)
(check-sat b_and!43187 (not b_next!26043))
