; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98690 () Bool)

(assert start!98690)

(declare-fun b_free!24301 () Bool)

(declare-fun b_next!24301 () Bool)

(assert (=> start!98690 (= b_free!24301 (not b_next!24301))))

(declare-fun tp!85613 () Bool)

(declare-fun b_and!39429 () Bool)

(assert (=> start!98690 (= tp!85613 b_and!39429)))

(declare-datatypes ((V!43569 0))(
  ( (V!43570 (val!14472 Int)) )
))
(declare-datatypes ((tuple2!18436 0))(
  ( (tuple2!18437 (_1!9229 (_ BitVec 64)) (_2!9229 V!43569)) )
))
(declare-datatypes ((List!25173 0))(
  ( (Nil!25170) (Cons!25169 (h!26378 tuple2!18436) (t!36457 List!25173)) )
))
(declare-datatypes ((ListLongMap!16405 0))(
  ( (ListLongMap!16406 (toList!8218 List!25173)) )
))
(declare-fun call!53134 () ListLongMap!16405)

(declare-fun call!53135 () ListLongMap!16405)

(declare-fun e!653393 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1148734 () Bool)

(declare-fun -!1289 (ListLongMap!16405 (_ BitVec 64)) ListLongMap!16405)

(assert (=> b!1148734 (= e!653393 (= call!53134 (-!1289 call!53135 k0!934)))))

(declare-fun b!1148735 () Bool)

(declare-fun call!53138 () ListLongMap!16405)

(declare-fun contains!6678 (ListLongMap!16405 (_ BitVec 64)) Bool)

(assert (=> b!1148735 (contains!6678 call!53138 k0!934)))

(declare-datatypes ((Unit!37602 0))(
  ( (Unit!37603) )
))
(declare-fun lt!513489 () Unit!37602)

(declare-fun call!53137 () Unit!37602)

(assert (=> b!1148735 (= lt!513489 call!53137)))

(declare-fun call!53132 () Bool)

(assert (=> b!1148735 call!53132))

(declare-fun lt!513493 () ListLongMap!16405)

(declare-fun lt!513501 () ListLongMap!16405)

(declare-fun zeroValue!944 () V!43569)

(declare-fun +!3636 (ListLongMap!16405 tuple2!18436) ListLongMap!16405)

(assert (=> b!1148735 (= lt!513493 (+!3636 lt!513501 (tuple2!18437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!513497 () Unit!37602)

(declare-fun addStillContains!848 (ListLongMap!16405 (_ BitVec 64) V!43569 (_ BitVec 64)) Unit!37602)

(assert (=> b!1148735 (= lt!513497 (addStillContains!848 lt!513501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!653381 () Unit!37602)

(assert (=> b!1148735 (= e!653381 lt!513489)))

(declare-fun b!1148736 () Bool)

(declare-fun c!113544 () Bool)

(declare-fun lt!513494 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1148736 (= c!113544 (and (not lt!513494) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653385 () Unit!37602)

(assert (=> b!1148736 (= e!653381 e!653385)))

(declare-fun bm!53128 () Bool)

(declare-fun minValue!944 () V!43569)

(declare-fun c!113542 () Bool)

(assert (=> bm!53128 (= call!53137 (addStillContains!848 (ite c!113542 lt!513493 lt!513501) (ite c!113542 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113544 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113542 minValue!944 (ite c!113544 zeroValue!944 minValue!944)) k0!934))))

(declare-fun lt!513481 () ListLongMap!16405)

(declare-fun b!1148737 () Bool)

(declare-fun e!653388 () Bool)

(assert (=> b!1148737 (= e!653388 (= (-!1289 lt!513481 k0!934) lt!513501))))

(declare-fun b!1148738 () Bool)

(declare-fun e!653387 () Unit!37602)

(declare-fun Unit!37604 () Unit!37602)

(assert (=> b!1148738 (= e!653387 Unit!37604)))

(assert (=> b!1148738 (= lt!513494 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148738 (= c!113542 (and (not lt!513494) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513485 () Unit!37602)

(assert (=> b!1148738 (= lt!513485 e!653381)))

(declare-datatypes ((array!74432 0))(
  ( (array!74433 (arr!35867 (Array (_ BitVec 32) (_ BitVec 64))) (size!36405 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74432)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13706 0))(
  ( (ValueCellFull!13706 (v!17108 V!43569)) (EmptyCell!13706) )
))
(declare-datatypes ((array!74434 0))(
  ( (array!74435 (arr!35868 (Array (_ BitVec 32) ValueCell!13706)) (size!36406 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74434)

(declare-fun lt!513500 () Unit!37602)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!440 (array!74432 array!74434 (_ BitVec 32) (_ BitVec 32) V!43569 V!43569 (_ BitVec 64) (_ BitVec 32) Int) Unit!37602)

(assert (=> b!1148738 (= lt!513500 (lemmaListMapContainsThenArrayContainsFrom!440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113541 () Bool)

(assert (=> b!1148738 (= c!113541 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764387 () Bool)

(declare-fun e!653382 () Bool)

(assert (=> b!1148738 (= res!764387 e!653382)))

(declare-fun e!653390 () Bool)

(assert (=> b!1148738 (=> (not res!764387) (not e!653390))))

(assert (=> b!1148738 e!653390))

(declare-fun lt!513496 () Unit!37602)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74432 (_ BitVec 32) (_ BitVec 32)) Unit!37602)

(assert (=> b!1148738 (= lt!513496 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25174 0))(
  ( (Nil!25171) (Cons!25170 (h!26379 (_ BitVec 64)) (t!36458 List!25174)) )
))
(declare-fun arrayNoDuplicates!0 (array!74432 (_ BitVec 32) List!25174) Bool)

(assert (=> b!1148738 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25171)))

(declare-fun lt!513499 () Unit!37602)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74432 (_ BitVec 64) (_ BitVec 32) List!25174) Unit!37602)

(assert (=> b!1148738 (= lt!513499 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25171))))

(assert (=> b!1148738 false))

(declare-fun res!764373 () Bool)

(declare-fun e!653384 () Bool)

(assert (=> start!98690 (=> (not res!764373) (not e!653384))))

(assert (=> start!98690 (= res!764373 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36405 _keys!1208))))))

(assert (=> start!98690 e!653384))

(declare-fun tp_is_empty!28831 () Bool)

(assert (=> start!98690 tp_is_empty!28831))

(declare-fun array_inv!27564 (array!74432) Bool)

(assert (=> start!98690 (array_inv!27564 _keys!1208)))

(assert (=> start!98690 true))

(assert (=> start!98690 tp!85613))

(declare-fun e!653395 () Bool)

(declare-fun array_inv!27565 (array!74434) Bool)

(assert (=> start!98690 (and (array_inv!27565 _values!996) e!653395)))

(declare-fun b!1148739 () Bool)

(declare-fun arrayContainsKey!0 (array!74432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148739 (= e!653382 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45071 () Bool)

(declare-fun mapRes!45071 () Bool)

(assert (=> mapIsEmpty!45071 mapRes!45071))

(declare-fun b!1148740 () Bool)

(declare-fun Unit!37605 () Unit!37602)

(assert (=> b!1148740 (= e!653387 Unit!37605)))

(declare-fun call!53131 () ListLongMap!16405)

(declare-fun bm!53129 () Bool)

(assert (=> bm!53129 (= call!53132 (contains!6678 (ite c!113542 lt!513493 call!53131) k0!934))))

(declare-fun b!1148741 () Bool)

(declare-fun res!764374 () Bool)

(assert (=> b!1148741 (=> (not res!764374) (not e!653384))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148741 (= res!764374 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36405 _keys!1208))))))

(declare-fun bm!53130 () Bool)

(declare-fun call!53133 () Unit!37602)

(assert (=> bm!53130 (= call!53133 call!53137)))

(declare-fun b!1148742 () Bool)

(declare-fun e!653397 () Bool)

(declare-fun e!653396 () Bool)

(assert (=> b!1148742 (= e!653397 e!653396)))

(declare-fun res!764380 () Bool)

(assert (=> b!1148742 (=> res!764380 e!653396)))

(assert (=> b!1148742 (= res!764380 (not (= from!1455 i!673)))))

(declare-fun lt!513490 () ListLongMap!16405)

(declare-fun lt!513495 () array!74434)

(declare-fun lt!513487 () array!74432)

(declare-fun getCurrentListMapNoExtraKeys!4703 (array!74432 array!74434 (_ BitVec 32) (_ BitVec 32) V!43569 V!43569 (_ BitVec 32) Int) ListLongMap!16405)

(assert (=> b!1148742 (= lt!513490 (getCurrentListMapNoExtraKeys!4703 lt!513487 lt!513495 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!513483 () V!43569)

(assert (=> b!1148742 (= lt!513495 (array!74435 (store (arr!35868 _values!996) i!673 (ValueCellFull!13706 lt!513483)) (size!36406 _values!996)))))

(declare-fun dynLambda!2671 (Int (_ BitVec 64)) V!43569)

(assert (=> b!1148742 (= lt!513483 (dynLambda!2671 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1148742 (= lt!513481 (getCurrentListMapNoExtraKeys!4703 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1148743 () Bool)

(declare-fun lt!513498 () Unit!37602)

(assert (=> b!1148743 (= e!653385 lt!513498)))

(assert (=> b!1148743 (= lt!513498 call!53133)))

(declare-fun call!53136 () Bool)

(assert (=> b!1148743 call!53136))

(declare-fun bm!53131 () Bool)

(assert (=> bm!53131 (= call!53135 (getCurrentListMapNoExtraKeys!4703 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148744 () Bool)

(assert (=> b!1148744 (= e!653393 (= call!53134 call!53135))))

(declare-fun b!1148745 () Bool)

(declare-fun res!764383 () Bool)

(declare-fun e!653389 () Bool)

(assert (=> b!1148745 (=> (not res!764383) (not e!653389))))

(assert (=> b!1148745 (= res!764383 (arrayNoDuplicates!0 lt!513487 #b00000000000000000000000000000000 Nil!25171))))

(declare-fun b!1148746 () Bool)

(declare-fun res!764385 () Bool)

(assert (=> b!1148746 (=> (not res!764385) (not e!653384))))

(assert (=> b!1148746 (= res!764385 (= (select (arr!35867 _keys!1208) i!673) k0!934))))

(declare-fun b!1148747 () Bool)

(declare-fun e!653391 () Bool)

(assert (=> b!1148747 (= e!653391 tp_is_empty!28831)))

(declare-fun b!1148748 () Bool)

(declare-fun e!653383 () Unit!37602)

(declare-fun Unit!37606 () Unit!37602)

(assert (=> b!1148748 (= e!653383 Unit!37606)))

(declare-fun b!1148749 () Bool)

(declare-fun res!764386 () Bool)

(assert (=> b!1148749 (=> (not res!764386) (not e!653384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148749 (= res!764386 (validKeyInArray!0 k0!934))))

(declare-fun b!1148750 () Bool)

(declare-fun e!653386 () Bool)

(assert (=> b!1148750 (= e!653396 e!653386)))

(declare-fun res!764378 () Bool)

(assert (=> b!1148750 (=> res!764378 e!653386)))

(assert (=> b!1148750 (= res!764378 (not (= (select (arr!35867 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1148750 e!653393))

(declare-fun c!113545 () Bool)

(assert (=> b!1148750 (= c!113545 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513482 () Unit!37602)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!566 (array!74432 array!74434 (_ BitVec 32) (_ BitVec 32) V!43569 V!43569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37602)

(assert (=> b!1148750 (= lt!513482 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!566 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148751 () Bool)

(declare-fun res!764381 () Bool)

(assert (=> b!1148751 (=> (not res!764381) (not e!653384))))

(assert (=> b!1148751 (= res!764381 (and (= (size!36406 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36405 _keys!1208) (size!36406 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148752 () Bool)

(assert (=> b!1148752 call!53136))

(declare-fun lt!513484 () Unit!37602)

(assert (=> b!1148752 (= lt!513484 call!53133)))

(assert (=> b!1148752 (= e!653383 lt!513484)))

(declare-fun b!1148753 () Bool)

(declare-fun e!653392 () Bool)

(assert (=> b!1148753 (= e!653392 tp_is_empty!28831)))

(declare-fun bm!53132 () Bool)

(assert (=> bm!53132 (= call!53134 (getCurrentListMapNoExtraKeys!4703 lt!513487 lt!513495 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148754 () Bool)

(assert (=> b!1148754 (= e!653395 (and e!653392 mapRes!45071))))

(declare-fun condMapEmpty!45071 () Bool)

(declare-fun mapDefault!45071 () ValueCell!13706)

(assert (=> b!1148754 (= condMapEmpty!45071 (= (arr!35868 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13706)) mapDefault!45071)))))

(declare-fun bm!53133 () Bool)

(assert (=> bm!53133 (= call!53131 call!53138)))

(declare-fun b!1148755 () Bool)

(assert (=> b!1148755 (= e!653390 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148756 () Bool)

(declare-fun res!764375 () Bool)

(assert (=> b!1148756 (=> (not res!764375) (not e!653384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148756 (= res!764375 (validMask!0 mask!1564))))

(declare-fun b!1148757 () Bool)

(assert (=> b!1148757 (= e!653385 e!653383)))

(declare-fun c!113546 () Bool)

(assert (=> b!1148757 (= c!113546 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513494))))

(declare-fun b!1148758 () Bool)

(assert (=> b!1148758 (= e!653386 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36405 _keys!1208))))))

(assert (=> b!1148758 e!653388))

(declare-fun res!764379 () Bool)

(assert (=> b!1148758 (=> (not res!764379) (not e!653388))))

(declare-fun lt!513486 () V!43569)

(assert (=> b!1148758 (= res!764379 (= (-!1289 (+!3636 lt!513501 (tuple2!18437 (select (arr!35867 _keys!1208) from!1455) lt!513486)) (select (arr!35867 _keys!1208) from!1455)) lt!513501))))

(declare-fun lt!513491 () Unit!37602)

(declare-fun addThenRemoveForNewKeyIsSame!149 (ListLongMap!16405 (_ BitVec 64) V!43569) Unit!37602)

(assert (=> b!1148758 (= lt!513491 (addThenRemoveForNewKeyIsSame!149 lt!513501 (select (arr!35867 _keys!1208) from!1455) lt!513486))))

(declare-fun get!18263 (ValueCell!13706 V!43569) V!43569)

(assert (=> b!1148758 (= lt!513486 (get!18263 (select (arr!35868 _values!996) from!1455) lt!513483))))

(declare-fun lt!513488 () Unit!37602)

(assert (=> b!1148758 (= lt!513488 e!653387)))

(declare-fun c!113543 () Bool)

(assert (=> b!1148758 (= c!113543 (contains!6678 lt!513501 k0!934))))

(assert (=> b!1148758 (= lt!513501 (getCurrentListMapNoExtraKeys!4703 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45071 () Bool)

(declare-fun tp!85614 () Bool)

(assert (=> mapNonEmpty!45071 (= mapRes!45071 (and tp!85614 e!653391))))

(declare-fun mapKey!45071 () (_ BitVec 32))

(declare-fun mapValue!45071 () ValueCell!13706)

(declare-fun mapRest!45071 () (Array (_ BitVec 32) ValueCell!13706))

(assert (=> mapNonEmpty!45071 (= (arr!35868 _values!996) (store mapRest!45071 mapKey!45071 mapValue!45071))))

(declare-fun bm!53134 () Bool)

(assert (=> bm!53134 (= call!53138 (+!3636 (ite c!113542 lt!513493 lt!513501) (ite c!113542 (tuple2!18437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113544 (tuple2!18437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1148759 () Bool)

(assert (=> b!1148759 (= e!653382 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513494) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1148760 () Bool)

(declare-fun res!764376 () Bool)

(assert (=> b!1148760 (=> (not res!764376) (not e!653384))))

(assert (=> b!1148760 (= res!764376 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25171))))

(declare-fun bm!53135 () Bool)

(assert (=> bm!53135 (= call!53136 call!53132)))

(declare-fun b!1148761 () Bool)

(assert (=> b!1148761 (= e!653384 e!653389)))

(declare-fun res!764377 () Bool)

(assert (=> b!1148761 (=> (not res!764377) (not e!653389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74432 (_ BitVec 32)) Bool)

(assert (=> b!1148761 (= res!764377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513487 mask!1564))))

(assert (=> b!1148761 (= lt!513487 (array!74433 (store (arr!35867 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36405 _keys!1208)))))

(declare-fun b!1148762 () Bool)

(assert (=> b!1148762 (= e!653389 (not e!653397))))

(declare-fun res!764382 () Bool)

(assert (=> b!1148762 (=> res!764382 e!653397)))

(assert (=> b!1148762 (= res!764382 (bvsgt from!1455 i!673))))

(assert (=> b!1148762 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513492 () Unit!37602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74432 (_ BitVec 64) (_ BitVec 32)) Unit!37602)

(assert (=> b!1148762 (= lt!513492 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1148763 () Bool)

(declare-fun res!764384 () Bool)

(assert (=> b!1148763 (=> (not res!764384) (not e!653384))))

(assert (=> b!1148763 (= res!764384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98690 res!764373) b!1148756))

(assert (= (and b!1148756 res!764375) b!1148751))

(assert (= (and b!1148751 res!764381) b!1148763))

(assert (= (and b!1148763 res!764384) b!1148760))

(assert (= (and b!1148760 res!764376) b!1148741))

(assert (= (and b!1148741 res!764374) b!1148749))

(assert (= (and b!1148749 res!764386) b!1148746))

(assert (= (and b!1148746 res!764385) b!1148761))

(assert (= (and b!1148761 res!764377) b!1148745))

(assert (= (and b!1148745 res!764383) b!1148762))

(assert (= (and b!1148762 (not res!764382)) b!1148742))

(assert (= (and b!1148742 (not res!764380)) b!1148750))

(assert (= (and b!1148750 c!113545) b!1148734))

(assert (= (and b!1148750 (not c!113545)) b!1148744))

(assert (= (or b!1148734 b!1148744) bm!53132))

(assert (= (or b!1148734 b!1148744) bm!53131))

(assert (= (and b!1148750 (not res!764378)) b!1148758))

(assert (= (and b!1148758 c!113543) b!1148738))

(assert (= (and b!1148758 (not c!113543)) b!1148740))

(assert (= (and b!1148738 c!113542) b!1148735))

(assert (= (and b!1148738 (not c!113542)) b!1148736))

(assert (= (and b!1148736 c!113544) b!1148743))

(assert (= (and b!1148736 (not c!113544)) b!1148757))

(assert (= (and b!1148757 c!113546) b!1148752))

(assert (= (and b!1148757 (not c!113546)) b!1148748))

(assert (= (or b!1148743 b!1148752) bm!53130))

(assert (= (or b!1148743 b!1148752) bm!53133))

(assert (= (or b!1148743 b!1148752) bm!53135))

(assert (= (or b!1148735 bm!53135) bm!53129))

(assert (= (or b!1148735 bm!53130) bm!53128))

(assert (= (or b!1148735 bm!53133) bm!53134))

(assert (= (and b!1148738 c!113541) b!1148739))

(assert (= (and b!1148738 (not c!113541)) b!1148759))

(assert (= (and b!1148738 res!764387) b!1148755))

(assert (= (and b!1148758 res!764379) b!1148737))

(assert (= (and b!1148754 condMapEmpty!45071) mapIsEmpty!45071))

(assert (= (and b!1148754 (not condMapEmpty!45071)) mapNonEmpty!45071))

(get-info :version)

(assert (= (and mapNonEmpty!45071 ((_ is ValueCellFull!13706) mapValue!45071)) b!1148747))

(assert (= (and b!1148754 ((_ is ValueCellFull!13706) mapDefault!45071)) b!1148753))

(assert (= start!98690 b!1148754))

(declare-fun b_lambda!19389 () Bool)

(assert (=> (not b_lambda!19389) (not b!1148742)))

(declare-fun t!36456 () Bool)

(declare-fun tb!9105 () Bool)

(assert (=> (and start!98690 (= defaultEntry!1004 defaultEntry!1004) t!36456) tb!9105))

(declare-fun result!18783 () Bool)

(assert (=> tb!9105 (= result!18783 tp_is_empty!28831)))

(assert (=> b!1148742 t!36456))

(declare-fun b_and!39431 () Bool)

(assert (= b_and!39429 (and (=> t!36456 result!18783) b_and!39431)))

(declare-fun m!1058703 () Bool)

(assert (=> b!1148755 m!1058703))

(declare-fun m!1058705 () Bool)

(assert (=> b!1148746 m!1058705))

(declare-fun m!1058707 () Bool)

(assert (=> bm!53131 m!1058707))

(declare-fun m!1058709 () Bool)

(assert (=> b!1148761 m!1058709))

(declare-fun m!1058711 () Bool)

(assert (=> b!1148761 m!1058711))

(declare-fun m!1058713 () Bool)

(assert (=> b!1148762 m!1058713))

(declare-fun m!1058715 () Bool)

(assert (=> b!1148762 m!1058715))

(declare-fun m!1058717 () Bool)

(assert (=> b!1148749 m!1058717))

(declare-fun m!1058719 () Bool)

(assert (=> b!1148738 m!1058719))

(declare-fun m!1058721 () Bool)

(assert (=> b!1148738 m!1058721))

(declare-fun m!1058723 () Bool)

(assert (=> b!1148738 m!1058723))

(declare-fun m!1058725 () Bool)

(assert (=> b!1148738 m!1058725))

(declare-fun m!1058727 () Bool)

(assert (=> b!1148734 m!1058727))

(assert (=> b!1148739 m!1058703))

(declare-fun m!1058729 () Bool)

(assert (=> bm!53128 m!1058729))

(declare-fun m!1058731 () Bool)

(assert (=> b!1148763 m!1058731))

(declare-fun m!1058733 () Bool)

(assert (=> mapNonEmpty!45071 m!1058733))

(assert (=> b!1148758 m!1058707))

(declare-fun m!1058735 () Bool)

(assert (=> b!1148758 m!1058735))

(assert (=> b!1148758 m!1058735))

(declare-fun m!1058737 () Bool)

(assert (=> b!1148758 m!1058737))

(declare-fun m!1058739 () Bool)

(assert (=> b!1148758 m!1058739))

(declare-fun m!1058741 () Bool)

(assert (=> b!1148758 m!1058741))

(assert (=> b!1148758 m!1058739))

(declare-fun m!1058743 () Bool)

(assert (=> b!1148758 m!1058743))

(declare-fun m!1058745 () Bool)

(assert (=> b!1148758 m!1058745))

(assert (=> b!1148758 m!1058743))

(assert (=> b!1148758 m!1058743))

(declare-fun m!1058747 () Bool)

(assert (=> b!1148758 m!1058747))

(declare-fun m!1058749 () Bool)

(assert (=> b!1148760 m!1058749))

(declare-fun m!1058751 () Bool)

(assert (=> b!1148737 m!1058751))

(declare-fun m!1058753 () Bool)

(assert (=> b!1148745 m!1058753))

(declare-fun m!1058755 () Bool)

(assert (=> bm!53129 m!1058755))

(declare-fun m!1058757 () Bool)

(assert (=> b!1148756 m!1058757))

(declare-fun m!1058759 () Bool)

(assert (=> start!98690 m!1058759))

(declare-fun m!1058761 () Bool)

(assert (=> start!98690 m!1058761))

(declare-fun m!1058763 () Bool)

(assert (=> b!1148735 m!1058763))

(declare-fun m!1058765 () Bool)

(assert (=> b!1148735 m!1058765))

(declare-fun m!1058767 () Bool)

(assert (=> b!1148735 m!1058767))

(declare-fun m!1058769 () Bool)

(assert (=> bm!53132 m!1058769))

(declare-fun m!1058771 () Bool)

(assert (=> bm!53134 m!1058771))

(declare-fun m!1058773 () Bool)

(assert (=> b!1148742 m!1058773))

(declare-fun m!1058775 () Bool)

(assert (=> b!1148742 m!1058775))

(declare-fun m!1058777 () Bool)

(assert (=> b!1148742 m!1058777))

(declare-fun m!1058779 () Bool)

(assert (=> b!1148742 m!1058779))

(assert (=> b!1148750 m!1058743))

(declare-fun m!1058781 () Bool)

(assert (=> b!1148750 m!1058781))

(check-sat (not bm!53132) (not b!1148742) (not b!1148737) (not b!1148735) (not b!1148755) (not bm!53131) (not b!1148756) (not bm!53129) (not b!1148763) (not b!1148738) b_and!39431 tp_is_empty!28831 (not b!1148734) (not b_lambda!19389) (not b!1148750) (not b!1148745) (not mapNonEmpty!45071) (not b!1148762) (not bm!53128) (not b_next!24301) (not bm!53134) (not start!98690) (not b!1148758) (not b!1148749) (not b!1148761) (not b!1148760) (not b!1148739))
(check-sat b_and!39431 (not b_next!24301))
