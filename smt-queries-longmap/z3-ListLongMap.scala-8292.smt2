; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101018 () Bool)

(assert start!101018)

(declare-fun b_free!26023 () Bool)

(declare-fun b_next!26023 () Bool)

(assert (=> start!101018 (= b_free!26023 (not b_next!26023))))

(declare-fun tp!91085 () Bool)

(declare-fun b_and!43101 () Bool)

(assert (=> start!101018 (= tp!91085 b_and!43101)))

(declare-fun b!1210615 () Bool)

(declare-fun res!804388 () Bool)

(declare-fun e!687529 () Bool)

(assert (=> b!1210615 (=> (not res!804388) (not e!687529))))

(declare-datatypes ((array!78152 0))(
  ( (array!78153 (arr!37713 (Array (_ BitVec 32) (_ BitVec 64))) (size!38251 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78152)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78152 (_ BitVec 32)) Bool)

(assert (=> b!1210615 (= res!804388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!46097 0))(
  ( (V!46098 (val!15420 Int)) )
))
(declare-datatypes ((tuple2!19880 0))(
  ( (tuple2!19881 (_1!9951 (_ BitVec 64)) (_2!9951 V!46097)) )
))
(declare-datatypes ((List!26658 0))(
  ( (Nil!26655) (Cons!26654 (h!27863 tuple2!19880) (t!39652 List!26658)) )
))
(declare-datatypes ((ListLongMap!17849 0))(
  ( (ListLongMap!17850 (toList!8940 List!26658)) )
))
(declare-fun lt!549589 () ListLongMap!17849)

(declare-fun b!1210616 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!687517 () Bool)

(declare-fun lt!549570 () ListLongMap!17849)

(declare-fun -!1819 (ListLongMap!17849 (_ BitVec 64)) ListLongMap!17849)

(assert (=> b!1210616 (= e!687517 (= (-!1819 lt!549589 k0!934) lt!549570))))

(declare-fun lt!549574 () V!46097)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!4063 (ListLongMap!17849 tuple2!19880) ListLongMap!17849)

(assert (=> b!1210616 (= (-!1819 (+!4063 lt!549570 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574)) (select (arr!37713 _keys!1208) from!1455)) lt!549570)))

(declare-datatypes ((Unit!39971 0))(
  ( (Unit!39972) )
))
(declare-fun lt!549588 () Unit!39971)

(declare-fun addThenRemoveForNewKeyIsSame!258 (ListLongMap!17849 (_ BitVec 64) V!46097) Unit!39971)

(assert (=> b!1210616 (= lt!549588 (addThenRemoveForNewKeyIsSame!258 lt!549570 (select (arr!37713 _keys!1208) from!1455) lt!549574))))

(declare-datatypes ((ValueCell!14654 0))(
  ( (ValueCellFull!14654 (v!18070 V!46097)) (EmptyCell!14654) )
))
(declare-datatypes ((array!78154 0))(
  ( (array!78155 (arr!37714 (Array (_ BitVec 32) ValueCell!14654)) (size!38252 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78154)

(declare-fun lt!549587 () V!46097)

(declare-fun get!19233 (ValueCell!14654 V!46097) V!46097)

(assert (=> b!1210616 (= lt!549574 (get!19233 (select (arr!37714 _values!996) from!1455) lt!549587))))

(declare-fun lt!549571 () Unit!39971)

(declare-fun e!687528 () Unit!39971)

(assert (=> b!1210616 (= lt!549571 e!687528)))

(declare-fun c!119292 () Bool)

(declare-fun contains!6947 (ListLongMap!17849 (_ BitVec 64)) Bool)

(assert (=> b!1210616 (= c!119292 (contains!6947 lt!549570 k0!934))))

(declare-fun zeroValue!944 () V!46097)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46097)

(declare-fun getCurrentListMapNoExtraKeys!5382 (array!78152 array!78154 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 32) Int) ListLongMap!17849)

(assert (=> b!1210616 (= lt!549570 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210617 () Bool)

(declare-fun e!687516 () Bool)

(declare-fun e!687522 () Bool)

(assert (=> b!1210617 (= e!687516 (not e!687522))))

(declare-fun res!804391 () Bool)

(assert (=> b!1210617 (=> res!804391 e!687522)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210617 (= res!804391 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210617 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549572 () Unit!39971)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78152 (_ BitVec 64) (_ BitVec 32)) Unit!39971)

(assert (=> b!1210617 (= lt!549572 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1210618 () Bool)

(declare-fun call!59697 () Bool)

(assert (=> b!1210618 call!59697))

(declare-fun lt!549583 () Unit!39971)

(declare-fun call!59696 () Unit!39971)

(assert (=> b!1210618 (= lt!549583 call!59696)))

(declare-fun e!687525 () Unit!39971)

(assert (=> b!1210618 (= e!687525 lt!549583)))

(declare-fun b!1210619 () Bool)

(declare-fun res!804395 () Bool)

(assert (=> b!1210619 (=> (not res!804395) (not e!687529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210619 (= res!804395 (validMask!0 mask!1564))))

(declare-fun b!1210620 () Bool)

(declare-fun res!804387 () Bool)

(assert (=> b!1210620 (=> (not res!804387) (not e!687529))))

(declare-datatypes ((List!26659 0))(
  ( (Nil!26656) (Cons!26655 (h!27864 (_ BitVec 64)) (t!39653 List!26659)) )
))
(declare-fun arrayNoDuplicates!0 (array!78152 (_ BitVec 32) List!26659) Bool)

(assert (=> b!1210620 (= res!804387 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26656))))

(declare-fun b!1210621 () Bool)

(declare-fun e!687520 () Bool)

(declare-fun call!59698 () ListLongMap!17849)

(declare-fun call!59700 () ListLongMap!17849)

(assert (=> b!1210621 (= e!687520 (= call!59698 call!59700))))

(declare-fun b!1210622 () Bool)

(declare-fun res!804389 () Bool)

(assert (=> b!1210622 (=> (not res!804389) (not e!687529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210622 (= res!804389 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47959 () Bool)

(declare-fun mapRes!47959 () Bool)

(assert (=> mapIsEmpty!47959 mapRes!47959))

(declare-fun lt!549585 () ListLongMap!17849)

(declare-fun call!59693 () ListLongMap!17849)

(declare-fun call!59699 () Bool)

(declare-fun bm!59691 () Bool)

(declare-fun c!119291 () Bool)

(assert (=> bm!59691 (= call!59699 (contains!6947 (ite c!119291 lt!549585 call!59693) k0!934))))

(declare-fun b!1210623 () Bool)

(assert (=> b!1210623 (= e!687520 (= call!59698 (-!1819 call!59700 k0!934)))))

(declare-fun b!1210624 () Bool)

(declare-fun res!804394 () Bool)

(assert (=> b!1210624 (=> (not res!804394) (not e!687529))))

(assert (=> b!1210624 (= res!804394 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38251 _keys!1208))))))

(declare-fun b!1210625 () Bool)

(declare-fun Unit!39973 () Unit!39971)

(assert (=> b!1210625 (= e!687528 Unit!39973)))

(declare-fun bm!59692 () Bool)

(assert (=> bm!59692 (= call!59697 call!59699)))

(declare-fun b!1210626 () Bool)

(declare-fun e!687518 () Bool)

(declare-fun lt!549580 () Bool)

(assert (=> b!1210626 (= e!687518 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549580) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210627 () Bool)

(declare-fun e!687521 () Bool)

(declare-fun tp_is_empty!30727 () Bool)

(assert (=> b!1210627 (= e!687521 tp_is_empty!30727)))

(declare-fun b!1210628 () Bool)

(declare-fun e!687526 () Unit!39971)

(declare-fun lt!549573 () Unit!39971)

(assert (=> b!1210628 (= e!687526 lt!549573)))

(assert (=> b!1210628 (= lt!549573 call!59696)))

(assert (=> b!1210628 call!59697))

(declare-fun bm!59693 () Bool)

(declare-fun call!59694 () ListLongMap!17849)

(assert (=> bm!59693 (= call!59693 call!59694)))

(declare-fun b!1210629 () Bool)

(declare-fun e!687530 () Bool)

(assert (=> b!1210629 (= e!687522 e!687530)))

(declare-fun res!804392 () Bool)

(assert (=> b!1210629 (=> res!804392 e!687530)))

(assert (=> b!1210629 (= res!804392 (not (= from!1455 i!673)))))

(declare-fun lt!549575 () array!78152)

(declare-fun lt!549578 () array!78154)

(declare-fun lt!549577 () ListLongMap!17849)

(assert (=> b!1210629 (= lt!549577 (getCurrentListMapNoExtraKeys!5382 lt!549575 lt!549578 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1210629 (= lt!549578 (array!78155 (store (arr!37714 _values!996) i!673 (ValueCellFull!14654 lt!549587)) (size!38252 _values!996)))))

(declare-fun dynLambda!3241 (Int (_ BitVec 64)) V!46097)

(assert (=> b!1210629 (= lt!549587 (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1210629 (= lt!549589 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1210630 () Bool)

(declare-fun res!804393 () Bool)

(assert (=> b!1210630 (=> (not res!804393) (not e!687529))))

(assert (=> b!1210630 (= res!804393 (= (select (arr!37713 _keys!1208) i!673) k0!934))))

(declare-fun b!1210631 () Bool)

(declare-fun res!804397 () Bool)

(assert (=> b!1210631 (=> (not res!804397) (not e!687529))))

(assert (=> b!1210631 (= res!804397 (and (= (size!38252 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38251 _keys!1208) (size!38252 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!804398 () Bool)

(assert (=> start!101018 (=> (not res!804398) (not e!687529))))

(assert (=> start!101018 (= res!804398 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38251 _keys!1208))))))

(assert (=> start!101018 e!687529))

(assert (=> start!101018 tp_is_empty!30727))

(declare-fun array_inv!28836 (array!78152) Bool)

(assert (=> start!101018 (array_inv!28836 _keys!1208)))

(assert (=> start!101018 true))

(assert (=> start!101018 tp!91085))

(declare-fun e!687524 () Bool)

(declare-fun array_inv!28837 (array!78154) Bool)

(assert (=> start!101018 (and (array_inv!28837 _values!996) e!687524)))

(declare-fun c!119294 () Bool)

(declare-fun bm!59690 () Bool)

(assert (=> bm!59690 (= call!59694 (+!4063 (ite c!119291 lt!549585 lt!549570) (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1210632 () Bool)

(assert (=> b!1210632 (= e!687526 e!687525)))

(declare-fun c!119295 () Bool)

(assert (=> b!1210632 (= c!119295 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549580))))

(declare-fun b!1210633 () Bool)

(declare-fun Unit!39974 () Unit!39971)

(assert (=> b!1210633 (= e!687525 Unit!39974)))

(declare-fun b!1210634 () Bool)

(declare-fun res!804390 () Bool)

(assert (=> b!1210634 (=> (not res!804390) (not e!687516))))

(assert (=> b!1210634 (= res!804390 (arrayNoDuplicates!0 lt!549575 #b00000000000000000000000000000000 Nil!26656))))

(declare-fun b!1210635 () Bool)

(assert (=> b!1210635 (= e!687529 e!687516)))

(declare-fun res!804399 () Bool)

(assert (=> b!1210635 (=> (not res!804399) (not e!687516))))

(assert (=> b!1210635 (= res!804399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549575 mask!1564))))

(assert (=> b!1210635 (= lt!549575 (array!78153 (store (arr!37713 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38251 _keys!1208)))))

(declare-fun b!1210636 () Bool)

(declare-fun e!687531 () Bool)

(assert (=> b!1210636 (= e!687531 tp_is_empty!30727)))

(declare-fun e!687527 () Bool)

(declare-fun b!1210637 () Bool)

(assert (=> b!1210637 (= e!687527 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59694 () Bool)

(declare-fun call!59695 () Unit!39971)

(assert (=> bm!59694 (= call!59696 call!59695)))

(declare-fun b!1210638 () Bool)

(assert (=> b!1210638 (contains!6947 call!59694 k0!934)))

(declare-fun lt!549582 () Unit!39971)

(assert (=> b!1210638 (= lt!549582 call!59695)))

(assert (=> b!1210638 call!59699))

(assert (=> b!1210638 (= lt!549585 (+!4063 lt!549570 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549584 () Unit!39971)

(declare-fun addStillContains!1047 (ListLongMap!17849 (_ BitVec 64) V!46097 (_ BitVec 64)) Unit!39971)

(assert (=> b!1210638 (= lt!549584 (addStillContains!1047 lt!549570 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!687523 () Unit!39971)

(assert (=> b!1210638 (= e!687523 lt!549582)))

(declare-fun b!1210639 () Bool)

(assert (=> b!1210639 (= e!687518 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210640 () Bool)

(assert (=> b!1210640 (= e!687524 (and e!687521 mapRes!47959))))

(declare-fun condMapEmpty!47959 () Bool)

(declare-fun mapDefault!47959 () ValueCell!14654)

(assert (=> b!1210640 (= condMapEmpty!47959 (= (arr!37714 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14654)) mapDefault!47959)))))

(declare-fun bm!59695 () Bool)

(assert (=> bm!59695 (= call!59698 (getCurrentListMapNoExtraKeys!5382 lt!549575 lt!549578 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210641 () Bool)

(assert (=> b!1210641 (= c!119294 (and (not lt!549580) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1210641 (= e!687523 e!687526)))

(declare-fun bm!59696 () Bool)

(assert (=> bm!59696 (= call!59700 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210642 () Bool)

(assert (=> b!1210642 (= e!687530 e!687517)))

(declare-fun res!804386 () Bool)

(assert (=> b!1210642 (=> res!804386 e!687517)))

(assert (=> b!1210642 (= res!804386 (not (= (select (arr!37713 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1210642 e!687520))

(declare-fun c!119290 () Bool)

(assert (=> b!1210642 (= c!119290 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549569 () Unit!39971)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1061 (array!78152 array!78154 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39971)

(assert (=> b!1210642 (= lt!549569 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1061 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59697 () Bool)

(assert (=> bm!59697 (= call!59695 (addStillContains!1047 (ite c!119291 lt!549585 lt!549570) (ite c!119291 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119294 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119291 minValue!944 (ite c!119294 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapNonEmpty!47959 () Bool)

(declare-fun tp!91084 () Bool)

(assert (=> mapNonEmpty!47959 (= mapRes!47959 (and tp!91084 e!687531))))

(declare-fun mapKey!47959 () (_ BitVec 32))

(declare-fun mapRest!47959 () (Array (_ BitVec 32) ValueCell!14654))

(declare-fun mapValue!47959 () ValueCell!14654)

(assert (=> mapNonEmpty!47959 (= (arr!37714 _values!996) (store mapRest!47959 mapKey!47959 mapValue!47959))))

(declare-fun b!1210643 () Bool)

(declare-fun Unit!39975 () Unit!39971)

(assert (=> b!1210643 (= e!687528 Unit!39975)))

(assert (=> b!1210643 (= lt!549580 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1210643 (= c!119291 (and (not lt!549580) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549581 () Unit!39971)

(assert (=> b!1210643 (= lt!549581 e!687523)))

(declare-fun lt!549586 () Unit!39971)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!589 (array!78152 array!78154 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 64) (_ BitVec 32) Int) Unit!39971)

(assert (=> b!1210643 (= lt!549586 (lemmaListMapContainsThenArrayContainsFrom!589 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119293 () Bool)

(assert (=> b!1210643 (= c!119293 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804396 () Bool)

(assert (=> b!1210643 (= res!804396 e!687518)))

(assert (=> b!1210643 (=> (not res!804396) (not e!687527))))

(assert (=> b!1210643 e!687527))

(declare-fun lt!549576 () Unit!39971)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78152 (_ BitVec 32) (_ BitVec 32)) Unit!39971)

(assert (=> b!1210643 (= lt!549576 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1210643 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26656)))

(declare-fun lt!549579 () Unit!39971)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78152 (_ BitVec 64) (_ BitVec 32) List!26659) Unit!39971)

(assert (=> b!1210643 (= lt!549579 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26656))))

(assert (=> b!1210643 false))

(assert (= (and start!101018 res!804398) b!1210619))

(assert (= (and b!1210619 res!804395) b!1210631))

(assert (= (and b!1210631 res!804397) b!1210615))

(assert (= (and b!1210615 res!804388) b!1210620))

(assert (= (and b!1210620 res!804387) b!1210624))

(assert (= (and b!1210624 res!804394) b!1210622))

(assert (= (and b!1210622 res!804389) b!1210630))

(assert (= (and b!1210630 res!804393) b!1210635))

(assert (= (and b!1210635 res!804399) b!1210634))

(assert (= (and b!1210634 res!804390) b!1210617))

(assert (= (and b!1210617 (not res!804391)) b!1210629))

(assert (= (and b!1210629 (not res!804392)) b!1210642))

(assert (= (and b!1210642 c!119290) b!1210623))

(assert (= (and b!1210642 (not c!119290)) b!1210621))

(assert (= (or b!1210623 b!1210621) bm!59695))

(assert (= (or b!1210623 b!1210621) bm!59696))

(assert (= (and b!1210642 (not res!804386)) b!1210616))

(assert (= (and b!1210616 c!119292) b!1210643))

(assert (= (and b!1210616 (not c!119292)) b!1210625))

(assert (= (and b!1210643 c!119291) b!1210638))

(assert (= (and b!1210643 (not c!119291)) b!1210641))

(assert (= (and b!1210641 c!119294) b!1210628))

(assert (= (and b!1210641 (not c!119294)) b!1210632))

(assert (= (and b!1210632 c!119295) b!1210618))

(assert (= (and b!1210632 (not c!119295)) b!1210633))

(assert (= (or b!1210628 b!1210618) bm!59694))

(assert (= (or b!1210628 b!1210618) bm!59693))

(assert (= (or b!1210628 b!1210618) bm!59692))

(assert (= (or b!1210638 bm!59692) bm!59691))

(assert (= (or b!1210638 bm!59694) bm!59697))

(assert (= (or b!1210638 bm!59693) bm!59690))

(assert (= (and b!1210643 c!119293) b!1210639))

(assert (= (and b!1210643 (not c!119293)) b!1210626))

(assert (= (and b!1210643 res!804396) b!1210637))

(assert (= (and b!1210640 condMapEmpty!47959) mapIsEmpty!47959))

(assert (= (and b!1210640 (not condMapEmpty!47959)) mapNonEmpty!47959))

(get-info :version)

(assert (= (and mapNonEmpty!47959 ((_ is ValueCellFull!14654) mapValue!47959)) b!1210636))

(assert (= (and b!1210640 ((_ is ValueCellFull!14654) mapDefault!47959)) b!1210627))

(assert (= start!101018 b!1210640))

(declare-fun b_lambda!21597 () Bool)

(assert (=> (not b_lambda!21597) (not b!1210629)))

(declare-fun t!39651 () Bool)

(declare-fun tb!10815 () Bool)

(assert (=> (and start!101018 (= defaultEntry!1004 defaultEntry!1004) t!39651) tb!10815))

(declare-fun result!22231 () Bool)

(assert (=> tb!10815 (= result!22231 tp_is_empty!30727)))

(assert (=> b!1210629 t!39651))

(declare-fun b_and!43103 () Bool)

(assert (= b_and!43101 (and (=> t!39651 result!22231) b_and!43103)))

(declare-fun m!1115553 () Bool)

(assert (=> b!1210619 m!1115553))

(declare-fun m!1115555 () Bool)

(assert (=> b!1210629 m!1115555))

(declare-fun m!1115557 () Bool)

(assert (=> b!1210629 m!1115557))

(declare-fun m!1115559 () Bool)

(assert (=> b!1210629 m!1115559))

(declare-fun m!1115561 () Bool)

(assert (=> b!1210629 m!1115561))

(declare-fun m!1115563 () Bool)

(assert (=> b!1210616 m!1115563))

(declare-fun m!1115565 () Bool)

(assert (=> b!1210616 m!1115565))

(declare-fun m!1115567 () Bool)

(assert (=> b!1210616 m!1115567))

(declare-fun m!1115569 () Bool)

(assert (=> b!1210616 m!1115569))

(declare-fun m!1115571 () Bool)

(assert (=> b!1210616 m!1115571))

(assert (=> b!1210616 m!1115569))

(assert (=> b!1210616 m!1115565))

(declare-fun m!1115573 () Bool)

(assert (=> b!1210616 m!1115573))

(declare-fun m!1115575 () Bool)

(assert (=> b!1210616 m!1115575))

(assert (=> b!1210616 m!1115565))

(declare-fun m!1115577 () Bool)

(assert (=> b!1210616 m!1115577))

(assert (=> b!1210616 m!1115577))

(declare-fun m!1115579 () Bool)

(assert (=> b!1210616 m!1115579))

(declare-fun m!1115581 () Bool)

(assert (=> bm!59690 m!1115581))

(declare-fun m!1115583 () Bool)

(assert (=> b!1210639 m!1115583))

(declare-fun m!1115585 () Bool)

(assert (=> bm!59691 m!1115585))

(declare-fun m!1115587 () Bool)

(assert (=> b!1210630 m!1115587))

(declare-fun m!1115589 () Bool)

(assert (=> b!1210634 m!1115589))

(assert (=> bm!59696 m!1115563))

(declare-fun m!1115591 () Bool)

(assert (=> mapNonEmpty!47959 m!1115591))

(declare-fun m!1115593 () Bool)

(assert (=> b!1210622 m!1115593))

(declare-fun m!1115595 () Bool)

(assert (=> bm!59697 m!1115595))

(declare-fun m!1115597 () Bool)

(assert (=> b!1210643 m!1115597))

(declare-fun m!1115599 () Bool)

(assert (=> b!1210643 m!1115599))

(declare-fun m!1115601 () Bool)

(assert (=> b!1210643 m!1115601))

(declare-fun m!1115603 () Bool)

(assert (=> b!1210643 m!1115603))

(assert (=> b!1210642 m!1115565))

(declare-fun m!1115605 () Bool)

(assert (=> b!1210642 m!1115605))

(declare-fun m!1115607 () Bool)

(assert (=> bm!59695 m!1115607))

(declare-fun m!1115609 () Bool)

(assert (=> b!1210620 m!1115609))

(assert (=> b!1210637 m!1115583))

(declare-fun m!1115611 () Bool)

(assert (=> start!101018 m!1115611))

(declare-fun m!1115613 () Bool)

(assert (=> start!101018 m!1115613))

(declare-fun m!1115615 () Bool)

(assert (=> b!1210635 m!1115615))

(declare-fun m!1115617 () Bool)

(assert (=> b!1210635 m!1115617))

(declare-fun m!1115619 () Bool)

(assert (=> b!1210638 m!1115619))

(declare-fun m!1115621 () Bool)

(assert (=> b!1210638 m!1115621))

(declare-fun m!1115623 () Bool)

(assert (=> b!1210638 m!1115623))

(declare-fun m!1115625 () Bool)

(assert (=> b!1210615 m!1115625))

(declare-fun m!1115627 () Bool)

(assert (=> b!1210623 m!1115627))

(declare-fun m!1115629 () Bool)

(assert (=> b!1210617 m!1115629))

(declare-fun m!1115631 () Bool)

(assert (=> b!1210617 m!1115631))

(check-sat (not bm!59696) (not b!1210616) (not b!1210637) (not b!1210620) (not b!1210623) (not b!1210615) (not b_lambda!21597) tp_is_empty!30727 (not b!1210643) (not b!1210634) (not b!1210619) (not mapNonEmpty!47959) (not bm!59690) (not b!1210629) (not start!101018) (not b!1210622) (not b!1210638) (not b!1210639) (not b!1210617) (not b!1210635) b_and!43103 (not b!1210642) (not bm!59691) (not b_next!26023) (not bm!59697) (not bm!59695))
(check-sat b_and!43103 (not b_next!26023))
(get-model)

(declare-fun b_lambda!21603 () Bool)

(assert (= b_lambda!21597 (or (and start!101018 b_free!26023) b_lambda!21603)))

(check-sat (not bm!59696) (not b!1210616) (not b!1210637) (not b!1210620) (not b!1210623) (not b!1210615) tp_is_empty!30727 (not b!1210643) (not b_lambda!21603) (not b!1210634) (not b!1210619) (not mapNonEmpty!47959) (not bm!59690) (not b!1210629) (not start!101018) (not b!1210622) (not b!1210638) (not b!1210639) (not b!1210617) (not b!1210635) b_and!43103 (not b!1210642) (not bm!59691) (not b_next!26023) (not bm!59697) (not bm!59695))
(check-sat b_and!43103 (not b_next!26023))
(get-model)

(declare-fun d!133201 () Bool)

(declare-fun e!687632 () Bool)

(assert (=> d!133201 e!687632))

(declare-fun res!804486 () Bool)

(assert (=> d!133201 (=> res!804486 e!687632)))

(declare-fun lt!549724 () Bool)

(assert (=> d!133201 (= res!804486 (not lt!549724))))

(declare-fun lt!549726 () Bool)

(assert (=> d!133201 (= lt!549724 lt!549726)))

(declare-fun lt!549727 () Unit!39971)

(declare-fun e!687633 () Unit!39971)

(assert (=> d!133201 (= lt!549727 e!687633)))

(declare-fun c!119334 () Bool)

(assert (=> d!133201 (= c!119334 lt!549726)))

(declare-fun containsKey!595 (List!26658 (_ BitVec 64)) Bool)

(assert (=> d!133201 (= lt!549726 (containsKey!595 (toList!8940 (ite c!119291 lt!549585 call!59693)) k0!934))))

(assert (=> d!133201 (= (contains!6947 (ite c!119291 lt!549585 call!59693) k0!934) lt!549724)))

(declare-fun b!1210830 () Bool)

(declare-fun lt!549725 () Unit!39971)

(assert (=> b!1210830 (= e!687633 lt!549725)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!424 (List!26658 (_ BitVec 64)) Unit!39971)

(assert (=> b!1210830 (= lt!549725 (lemmaContainsKeyImpliesGetValueByKeyDefined!424 (toList!8940 (ite c!119291 lt!549585 call!59693)) k0!934))))

(declare-datatypes ((Option!692 0))(
  ( (Some!691 (v!18073 V!46097)) (None!690) )
))
(declare-fun isDefined!467 (Option!692) Bool)

(declare-fun getValueByKey!641 (List!26658 (_ BitVec 64)) Option!692)

(assert (=> b!1210830 (isDefined!467 (getValueByKey!641 (toList!8940 (ite c!119291 lt!549585 call!59693)) k0!934))))

(declare-fun b!1210831 () Bool)

(declare-fun Unit!39983 () Unit!39971)

(assert (=> b!1210831 (= e!687633 Unit!39983)))

(declare-fun b!1210832 () Bool)

(assert (=> b!1210832 (= e!687632 (isDefined!467 (getValueByKey!641 (toList!8940 (ite c!119291 lt!549585 call!59693)) k0!934)))))

(assert (= (and d!133201 c!119334) b!1210830))

(assert (= (and d!133201 (not c!119334)) b!1210831))

(assert (= (and d!133201 (not res!804486)) b!1210832))

(declare-fun m!1115793 () Bool)

(assert (=> d!133201 m!1115793))

(declare-fun m!1115795 () Bool)

(assert (=> b!1210830 m!1115795))

(declare-fun m!1115797 () Bool)

(assert (=> b!1210830 m!1115797))

(assert (=> b!1210830 m!1115797))

(declare-fun m!1115799 () Bool)

(assert (=> b!1210830 m!1115799))

(assert (=> b!1210832 m!1115797))

(assert (=> b!1210832 m!1115797))

(assert (=> b!1210832 m!1115799))

(assert (=> bm!59691 d!133201))

(declare-fun d!133203 () Bool)

(assert (=> d!133203 (= (array_inv!28836 _keys!1208) (bvsge (size!38251 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101018 d!133203))

(declare-fun d!133205 () Bool)

(assert (=> d!133205 (= (array_inv!28837 _values!996) (bvsge (size!38252 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101018 d!133205))

(declare-fun d!133207 () Bool)

(declare-fun res!804491 () Bool)

(declare-fun e!687638 () Bool)

(assert (=> d!133207 (=> res!804491 e!687638)))

(assert (=> d!133207 (= res!804491 (= (select (arr!37713 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133207 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!687638)))

(declare-fun b!1210837 () Bool)

(declare-fun e!687639 () Bool)

(assert (=> b!1210837 (= e!687638 e!687639)))

(declare-fun res!804492 () Bool)

(assert (=> b!1210837 (=> (not res!804492) (not e!687639))))

(assert (=> b!1210837 (= res!804492 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38251 _keys!1208)))))

(declare-fun b!1210838 () Bool)

(assert (=> b!1210838 (= e!687639 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133207 (not res!804491)) b!1210837))

(assert (= (and b!1210837 res!804492) b!1210838))

(declare-fun m!1115801 () Bool)

(assert (=> d!133207 m!1115801))

(declare-fun m!1115803 () Bool)

(assert (=> b!1210838 m!1115803))

(assert (=> b!1210639 d!133207))

(declare-fun d!133209 () Bool)

(assert (=> d!133209 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1210622 d!133209))

(declare-fun b!1210863 () Bool)

(declare-fun e!687659 () Bool)

(declare-fun lt!549744 () ListLongMap!17849)

(assert (=> b!1210863 (= e!687659 (= lt!549744 (getCurrentListMapNoExtraKeys!5382 lt!549575 lt!549578 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133211 () Bool)

(declare-fun e!687655 () Bool)

(assert (=> d!133211 e!687655))

(declare-fun res!804502 () Bool)

(assert (=> d!133211 (=> (not res!804502) (not e!687655))))

(assert (=> d!133211 (= res!804502 (not (contains!6947 lt!549744 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!687656 () ListLongMap!17849)

(assert (=> d!133211 (= lt!549744 e!687656)))

(declare-fun c!119346 () Bool)

(assert (=> d!133211 (= c!119346 (bvsge from!1455 (size!38251 lt!549575)))))

(assert (=> d!133211 (validMask!0 mask!1564)))

(assert (=> d!133211 (= (getCurrentListMapNoExtraKeys!5382 lt!549575 lt!549578 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!549744)))

(declare-fun b!1210864 () Bool)

(declare-fun e!687657 () Bool)

(declare-fun e!687658 () Bool)

(assert (=> b!1210864 (= e!687657 e!687658)))

(assert (=> b!1210864 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38251 lt!549575)))))

(declare-fun res!804501 () Bool)

(assert (=> b!1210864 (= res!804501 (contains!6947 lt!549744 (select (arr!37713 lt!549575) from!1455)))))

(assert (=> b!1210864 (=> (not res!804501) (not e!687658))))

(declare-fun b!1210865 () Bool)

(declare-fun isEmpty!997 (ListLongMap!17849) Bool)

(assert (=> b!1210865 (= e!687659 (isEmpty!997 lt!549744))))

(declare-fun b!1210866 () Bool)

(declare-fun e!687654 () ListLongMap!17849)

(declare-fun call!59751 () ListLongMap!17849)

(assert (=> b!1210866 (= e!687654 call!59751)))

(declare-fun b!1210867 () Bool)

(declare-fun e!687660 () Bool)

(assert (=> b!1210867 (= e!687660 (validKeyInArray!0 (select (arr!37713 lt!549575) from!1455)))))

(assert (=> b!1210867 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!59748 () Bool)

(assert (=> bm!59748 (= call!59751 (getCurrentListMapNoExtraKeys!5382 lt!549575 lt!549578 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1210868 () Bool)

(declare-fun res!804504 () Bool)

(assert (=> b!1210868 (=> (not res!804504) (not e!687655))))

(assert (=> b!1210868 (= res!804504 (not (contains!6947 lt!549744 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1210869 () Bool)

(assert (=> b!1210869 (= e!687656 (ListLongMap!17850 Nil!26655))))

(declare-fun b!1210870 () Bool)

(assert (=> b!1210870 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38251 lt!549575)))))

(assert (=> b!1210870 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38252 lt!549578)))))

(declare-fun apply!961 (ListLongMap!17849 (_ BitVec 64)) V!46097)

(assert (=> b!1210870 (= e!687658 (= (apply!961 lt!549744 (select (arr!37713 lt!549575) from!1455)) (get!19233 (select (arr!37714 lt!549578) from!1455) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1210871 () Bool)

(assert (=> b!1210871 (= e!687655 e!687657)))

(declare-fun c!119345 () Bool)

(assert (=> b!1210871 (= c!119345 e!687660)))

(declare-fun res!804503 () Bool)

(assert (=> b!1210871 (=> (not res!804503) (not e!687660))))

(assert (=> b!1210871 (= res!804503 (bvslt from!1455 (size!38251 lt!549575)))))

(declare-fun b!1210872 () Bool)

(assert (=> b!1210872 (= e!687657 e!687659)))

(declare-fun c!119343 () Bool)

(assert (=> b!1210872 (= c!119343 (bvslt from!1455 (size!38251 lt!549575)))))

(declare-fun b!1210873 () Bool)

(declare-fun lt!549745 () Unit!39971)

(declare-fun lt!549743 () Unit!39971)

(assert (=> b!1210873 (= lt!549745 lt!549743)))

(declare-fun lt!549742 () ListLongMap!17849)

(declare-fun lt!549746 () V!46097)

(declare-fun lt!549747 () (_ BitVec 64))

(declare-fun lt!549748 () (_ BitVec 64))

(assert (=> b!1210873 (not (contains!6947 (+!4063 lt!549742 (tuple2!19881 lt!549747 lt!549746)) lt!549748))))

(declare-fun addStillNotContains!297 (ListLongMap!17849 (_ BitVec 64) V!46097 (_ BitVec 64)) Unit!39971)

(assert (=> b!1210873 (= lt!549743 (addStillNotContains!297 lt!549742 lt!549747 lt!549746 lt!549748))))

(assert (=> b!1210873 (= lt!549748 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1210873 (= lt!549746 (get!19233 (select (arr!37714 lt!549578) from!1455) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1210873 (= lt!549747 (select (arr!37713 lt!549575) from!1455))))

(assert (=> b!1210873 (= lt!549742 call!59751)))

(assert (=> b!1210873 (= e!687654 (+!4063 call!59751 (tuple2!19881 (select (arr!37713 lt!549575) from!1455) (get!19233 (select (arr!37714 lt!549578) from!1455) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1210874 () Bool)

(assert (=> b!1210874 (= e!687656 e!687654)))

(declare-fun c!119344 () Bool)

(assert (=> b!1210874 (= c!119344 (validKeyInArray!0 (select (arr!37713 lt!549575) from!1455)))))

(assert (= (and d!133211 c!119346) b!1210869))

(assert (= (and d!133211 (not c!119346)) b!1210874))

(assert (= (and b!1210874 c!119344) b!1210873))

(assert (= (and b!1210874 (not c!119344)) b!1210866))

(assert (= (or b!1210873 b!1210866) bm!59748))

(assert (= (and d!133211 res!804502) b!1210868))

(assert (= (and b!1210868 res!804504) b!1210871))

(assert (= (and b!1210871 res!804503) b!1210867))

(assert (= (and b!1210871 c!119345) b!1210864))

(assert (= (and b!1210871 (not c!119345)) b!1210872))

(assert (= (and b!1210864 res!804501) b!1210870))

(assert (= (and b!1210872 c!119343) b!1210863))

(assert (= (and b!1210872 (not c!119343)) b!1210865))

(declare-fun b_lambda!21605 () Bool)

(assert (=> (not b_lambda!21605) (not b!1210870)))

(assert (=> b!1210870 t!39651))

(declare-fun b_and!43113 () Bool)

(assert (= b_and!43103 (and (=> t!39651 result!22231) b_and!43113)))

(declare-fun b_lambda!21607 () Bool)

(assert (=> (not b_lambda!21607) (not b!1210873)))

(assert (=> b!1210873 t!39651))

(declare-fun b_and!43115 () Bool)

(assert (= b_and!43113 (and (=> t!39651 result!22231) b_and!43115)))

(declare-fun m!1115805 () Bool)

(assert (=> b!1210864 m!1115805))

(assert (=> b!1210864 m!1115805))

(declare-fun m!1115807 () Bool)

(assert (=> b!1210864 m!1115807))

(assert (=> b!1210867 m!1115805))

(assert (=> b!1210867 m!1115805))

(declare-fun m!1115809 () Bool)

(assert (=> b!1210867 m!1115809))

(declare-fun m!1115811 () Bool)

(assert (=> b!1210865 m!1115811))

(assert (=> b!1210874 m!1115805))

(assert (=> b!1210874 m!1115805))

(assert (=> b!1210874 m!1115809))

(declare-fun m!1115813 () Bool)

(assert (=> b!1210868 m!1115813))

(declare-fun m!1115815 () Bool)

(assert (=> d!133211 m!1115815))

(assert (=> d!133211 m!1115553))

(assert (=> b!1210870 m!1115559))

(assert (=> b!1210870 m!1115805))

(declare-fun m!1115817 () Bool)

(assert (=> b!1210870 m!1115817))

(assert (=> b!1210870 m!1115805))

(declare-fun m!1115819 () Bool)

(assert (=> b!1210870 m!1115819))

(assert (=> b!1210870 m!1115819))

(assert (=> b!1210870 m!1115559))

(declare-fun m!1115821 () Bool)

(assert (=> b!1210870 m!1115821))

(declare-fun m!1115823 () Bool)

(assert (=> bm!59748 m!1115823))

(assert (=> b!1210873 m!1115559))

(assert (=> b!1210873 m!1115805))

(assert (=> b!1210873 m!1115819))

(declare-fun m!1115825 () Bool)

(assert (=> b!1210873 m!1115825))

(declare-fun m!1115827 () Bool)

(assert (=> b!1210873 m!1115827))

(declare-fun m!1115829 () Bool)

(assert (=> b!1210873 m!1115829))

(assert (=> b!1210873 m!1115819))

(assert (=> b!1210873 m!1115559))

(assert (=> b!1210873 m!1115821))

(assert (=> b!1210873 m!1115825))

(declare-fun m!1115831 () Bool)

(assert (=> b!1210873 m!1115831))

(assert (=> b!1210863 m!1115823))

(assert (=> b!1210629 d!133211))

(declare-fun b!1210875 () Bool)

(declare-fun lt!549751 () ListLongMap!17849)

(declare-fun e!687666 () Bool)

(assert (=> b!1210875 (= e!687666 (= lt!549751 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133213 () Bool)

(declare-fun e!687662 () Bool)

(assert (=> d!133213 e!687662))

(declare-fun res!804506 () Bool)

(assert (=> d!133213 (=> (not res!804506) (not e!687662))))

(assert (=> d!133213 (= res!804506 (not (contains!6947 lt!549751 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!687663 () ListLongMap!17849)

(assert (=> d!133213 (= lt!549751 e!687663)))

(declare-fun c!119350 () Bool)

(assert (=> d!133213 (= c!119350 (bvsge from!1455 (size!38251 _keys!1208)))))

(assert (=> d!133213 (validMask!0 mask!1564)))

(assert (=> d!133213 (= (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!549751)))

(declare-fun b!1210876 () Bool)

(declare-fun e!687664 () Bool)

(declare-fun e!687665 () Bool)

(assert (=> b!1210876 (= e!687664 e!687665)))

(assert (=> b!1210876 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38251 _keys!1208)))))

(declare-fun res!804505 () Bool)

(assert (=> b!1210876 (= res!804505 (contains!6947 lt!549751 (select (arr!37713 _keys!1208) from!1455)))))

(assert (=> b!1210876 (=> (not res!804505) (not e!687665))))

(declare-fun b!1210877 () Bool)

(assert (=> b!1210877 (= e!687666 (isEmpty!997 lt!549751))))

(declare-fun b!1210878 () Bool)

(declare-fun e!687661 () ListLongMap!17849)

(declare-fun call!59752 () ListLongMap!17849)

(assert (=> b!1210878 (= e!687661 call!59752)))

(declare-fun b!1210879 () Bool)

(declare-fun e!687667 () Bool)

(assert (=> b!1210879 (= e!687667 (validKeyInArray!0 (select (arr!37713 _keys!1208) from!1455)))))

(assert (=> b!1210879 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!59749 () Bool)

(assert (=> bm!59749 (= call!59752 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1210880 () Bool)

(declare-fun res!804508 () Bool)

(assert (=> b!1210880 (=> (not res!804508) (not e!687662))))

(assert (=> b!1210880 (= res!804508 (not (contains!6947 lt!549751 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1210881 () Bool)

(assert (=> b!1210881 (= e!687663 (ListLongMap!17850 Nil!26655))))

(declare-fun b!1210882 () Bool)

(assert (=> b!1210882 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38251 _keys!1208)))))

(assert (=> b!1210882 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38252 _values!996)))))

(assert (=> b!1210882 (= e!687665 (= (apply!961 lt!549751 (select (arr!37713 _keys!1208) from!1455)) (get!19233 (select (arr!37714 _values!996) from!1455) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1210883 () Bool)

(assert (=> b!1210883 (= e!687662 e!687664)))

(declare-fun c!119349 () Bool)

(assert (=> b!1210883 (= c!119349 e!687667)))

(declare-fun res!804507 () Bool)

(assert (=> b!1210883 (=> (not res!804507) (not e!687667))))

(assert (=> b!1210883 (= res!804507 (bvslt from!1455 (size!38251 _keys!1208)))))

(declare-fun b!1210884 () Bool)

(assert (=> b!1210884 (= e!687664 e!687666)))

(declare-fun c!119347 () Bool)

(assert (=> b!1210884 (= c!119347 (bvslt from!1455 (size!38251 _keys!1208)))))

(declare-fun b!1210885 () Bool)

(declare-fun lt!549752 () Unit!39971)

(declare-fun lt!549750 () Unit!39971)

(assert (=> b!1210885 (= lt!549752 lt!549750)))

(declare-fun lt!549755 () (_ BitVec 64))

(declare-fun lt!549753 () V!46097)

(declare-fun lt!549749 () ListLongMap!17849)

(declare-fun lt!549754 () (_ BitVec 64))

(assert (=> b!1210885 (not (contains!6947 (+!4063 lt!549749 (tuple2!19881 lt!549754 lt!549753)) lt!549755))))

(assert (=> b!1210885 (= lt!549750 (addStillNotContains!297 lt!549749 lt!549754 lt!549753 lt!549755))))

(assert (=> b!1210885 (= lt!549755 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1210885 (= lt!549753 (get!19233 (select (arr!37714 _values!996) from!1455) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1210885 (= lt!549754 (select (arr!37713 _keys!1208) from!1455))))

(assert (=> b!1210885 (= lt!549749 call!59752)))

(assert (=> b!1210885 (= e!687661 (+!4063 call!59752 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) (get!19233 (select (arr!37714 _values!996) from!1455) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1210886 () Bool)

(assert (=> b!1210886 (= e!687663 e!687661)))

(declare-fun c!119348 () Bool)

(assert (=> b!1210886 (= c!119348 (validKeyInArray!0 (select (arr!37713 _keys!1208) from!1455)))))

(assert (= (and d!133213 c!119350) b!1210881))

(assert (= (and d!133213 (not c!119350)) b!1210886))

(assert (= (and b!1210886 c!119348) b!1210885))

(assert (= (and b!1210886 (not c!119348)) b!1210878))

(assert (= (or b!1210885 b!1210878) bm!59749))

(assert (= (and d!133213 res!804506) b!1210880))

(assert (= (and b!1210880 res!804508) b!1210883))

(assert (= (and b!1210883 res!804507) b!1210879))

(assert (= (and b!1210883 c!119349) b!1210876))

(assert (= (and b!1210883 (not c!119349)) b!1210884))

(assert (= (and b!1210876 res!804505) b!1210882))

(assert (= (and b!1210884 c!119347) b!1210875))

(assert (= (and b!1210884 (not c!119347)) b!1210877))

(declare-fun b_lambda!21609 () Bool)

(assert (=> (not b_lambda!21609) (not b!1210882)))

(assert (=> b!1210882 t!39651))

(declare-fun b_and!43117 () Bool)

(assert (= b_and!43115 (and (=> t!39651 result!22231) b_and!43117)))

(declare-fun b_lambda!21611 () Bool)

(assert (=> (not b_lambda!21611) (not b!1210885)))

(assert (=> b!1210885 t!39651))

(declare-fun b_and!43119 () Bool)

(assert (= b_and!43117 (and (=> t!39651 result!22231) b_and!43119)))

(assert (=> b!1210876 m!1115565))

(assert (=> b!1210876 m!1115565))

(declare-fun m!1115833 () Bool)

(assert (=> b!1210876 m!1115833))

(assert (=> b!1210879 m!1115565))

(assert (=> b!1210879 m!1115565))

(declare-fun m!1115835 () Bool)

(assert (=> b!1210879 m!1115835))

(declare-fun m!1115837 () Bool)

(assert (=> b!1210877 m!1115837))

(assert (=> b!1210886 m!1115565))

(assert (=> b!1210886 m!1115565))

(assert (=> b!1210886 m!1115835))

(declare-fun m!1115839 () Bool)

(assert (=> b!1210880 m!1115839))

(declare-fun m!1115841 () Bool)

(assert (=> d!133213 m!1115841))

(assert (=> d!133213 m!1115553))

(assert (=> b!1210882 m!1115559))

(assert (=> b!1210882 m!1115565))

(declare-fun m!1115843 () Bool)

(assert (=> b!1210882 m!1115843))

(assert (=> b!1210882 m!1115565))

(assert (=> b!1210882 m!1115577))

(assert (=> b!1210882 m!1115577))

(assert (=> b!1210882 m!1115559))

(declare-fun m!1115845 () Bool)

(assert (=> b!1210882 m!1115845))

(declare-fun m!1115847 () Bool)

(assert (=> bm!59749 m!1115847))

(assert (=> b!1210885 m!1115559))

(assert (=> b!1210885 m!1115565))

(assert (=> b!1210885 m!1115577))

(declare-fun m!1115849 () Bool)

(assert (=> b!1210885 m!1115849))

(declare-fun m!1115851 () Bool)

(assert (=> b!1210885 m!1115851))

(declare-fun m!1115853 () Bool)

(assert (=> b!1210885 m!1115853))

(assert (=> b!1210885 m!1115577))

(assert (=> b!1210885 m!1115559))

(assert (=> b!1210885 m!1115845))

(assert (=> b!1210885 m!1115849))

(declare-fun m!1115855 () Bool)

(assert (=> b!1210885 m!1115855))

(assert (=> b!1210875 m!1115847))

(assert (=> b!1210629 d!133213))

(declare-fun d!133215 () Bool)

(declare-fun e!687668 () Bool)

(assert (=> d!133215 e!687668))

(declare-fun res!804509 () Bool)

(assert (=> d!133215 (=> res!804509 e!687668)))

(declare-fun lt!549756 () Bool)

(assert (=> d!133215 (= res!804509 (not lt!549756))))

(declare-fun lt!549758 () Bool)

(assert (=> d!133215 (= lt!549756 lt!549758)))

(declare-fun lt!549759 () Unit!39971)

(declare-fun e!687669 () Unit!39971)

(assert (=> d!133215 (= lt!549759 e!687669)))

(declare-fun c!119351 () Bool)

(assert (=> d!133215 (= c!119351 lt!549758)))

(assert (=> d!133215 (= lt!549758 (containsKey!595 (toList!8940 call!59694) k0!934))))

(assert (=> d!133215 (= (contains!6947 call!59694 k0!934) lt!549756)))

(declare-fun b!1210887 () Bool)

(declare-fun lt!549757 () Unit!39971)

(assert (=> b!1210887 (= e!687669 lt!549757)))

(assert (=> b!1210887 (= lt!549757 (lemmaContainsKeyImpliesGetValueByKeyDefined!424 (toList!8940 call!59694) k0!934))))

(assert (=> b!1210887 (isDefined!467 (getValueByKey!641 (toList!8940 call!59694) k0!934))))

(declare-fun b!1210888 () Bool)

(declare-fun Unit!39984 () Unit!39971)

(assert (=> b!1210888 (= e!687669 Unit!39984)))

(declare-fun b!1210889 () Bool)

(assert (=> b!1210889 (= e!687668 (isDefined!467 (getValueByKey!641 (toList!8940 call!59694) k0!934)))))

(assert (= (and d!133215 c!119351) b!1210887))

(assert (= (and d!133215 (not c!119351)) b!1210888))

(assert (= (and d!133215 (not res!804509)) b!1210889))

(declare-fun m!1115857 () Bool)

(assert (=> d!133215 m!1115857))

(declare-fun m!1115859 () Bool)

(assert (=> b!1210887 m!1115859))

(declare-fun m!1115861 () Bool)

(assert (=> b!1210887 m!1115861))

(assert (=> b!1210887 m!1115861))

(declare-fun m!1115863 () Bool)

(assert (=> b!1210887 m!1115863))

(assert (=> b!1210889 m!1115861))

(assert (=> b!1210889 m!1115861))

(assert (=> b!1210889 m!1115863))

(assert (=> b!1210638 d!133215))

(declare-fun d!133217 () Bool)

(declare-fun e!687672 () Bool)

(assert (=> d!133217 e!687672))

(declare-fun res!804515 () Bool)

(assert (=> d!133217 (=> (not res!804515) (not e!687672))))

(declare-fun lt!549769 () ListLongMap!17849)

(assert (=> d!133217 (= res!804515 (contains!6947 lt!549769 (_1!9951 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!549770 () List!26658)

(assert (=> d!133217 (= lt!549769 (ListLongMap!17850 lt!549770))))

(declare-fun lt!549768 () Unit!39971)

(declare-fun lt!549771 () Unit!39971)

(assert (=> d!133217 (= lt!549768 lt!549771)))

(assert (=> d!133217 (= (getValueByKey!641 lt!549770 (_1!9951 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!691 (_2!9951 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!317 (List!26658 (_ BitVec 64) V!46097) Unit!39971)

(assert (=> d!133217 (= lt!549771 (lemmaContainsTupThenGetReturnValue!317 lt!549770 (_1!9951 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9951 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun insertStrictlySorted!410 (List!26658 (_ BitVec 64) V!46097) List!26658)

(assert (=> d!133217 (= lt!549770 (insertStrictlySorted!410 (toList!8940 lt!549570) (_1!9951 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9951 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133217 (= (+!4063 lt!549570 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!549769)))

(declare-fun b!1210894 () Bool)

(declare-fun res!804514 () Bool)

(assert (=> b!1210894 (=> (not res!804514) (not e!687672))))

(assert (=> b!1210894 (= res!804514 (= (getValueByKey!641 (toList!8940 lt!549769) (_1!9951 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!691 (_2!9951 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1210895 () Bool)

(declare-fun contains!6949 (List!26658 tuple2!19880) Bool)

(assert (=> b!1210895 (= e!687672 (contains!6949 (toList!8940 lt!549769) (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!133217 res!804515) b!1210894))

(assert (= (and b!1210894 res!804514) b!1210895))

(declare-fun m!1115865 () Bool)

(assert (=> d!133217 m!1115865))

(declare-fun m!1115867 () Bool)

(assert (=> d!133217 m!1115867))

(declare-fun m!1115869 () Bool)

(assert (=> d!133217 m!1115869))

(declare-fun m!1115871 () Bool)

(assert (=> d!133217 m!1115871))

(declare-fun m!1115873 () Bool)

(assert (=> b!1210894 m!1115873))

(declare-fun m!1115875 () Bool)

(assert (=> b!1210895 m!1115875))

(assert (=> b!1210638 d!133217))

(declare-fun d!133219 () Bool)

(assert (=> d!133219 (contains!6947 (+!4063 lt!549570 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!549774 () Unit!39971)

(declare-fun choose!1821 (ListLongMap!17849 (_ BitVec 64) V!46097 (_ BitVec 64)) Unit!39971)

(assert (=> d!133219 (= lt!549774 (choose!1821 lt!549570 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!133219 (contains!6947 lt!549570 k0!934)))

(assert (=> d!133219 (= (addStillContains!1047 lt!549570 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!549774)))

(declare-fun bs!34163 () Bool)

(assert (= bs!34163 d!133219))

(assert (=> bs!34163 m!1115621))

(assert (=> bs!34163 m!1115621))

(declare-fun m!1115877 () Bool)

(assert (=> bs!34163 m!1115877))

(declare-fun m!1115879 () Bool)

(assert (=> bs!34163 m!1115879))

(assert (=> bs!34163 m!1115571))

(assert (=> b!1210638 d!133219))

(declare-fun d!133221 () Bool)

(declare-fun e!687673 () Bool)

(assert (=> d!133221 e!687673))

(declare-fun res!804517 () Bool)

(assert (=> d!133221 (=> (not res!804517) (not e!687673))))

(declare-fun lt!549776 () ListLongMap!17849)

(assert (=> d!133221 (= res!804517 (contains!6947 lt!549776 (_1!9951 (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!549777 () List!26658)

(assert (=> d!133221 (= lt!549776 (ListLongMap!17850 lt!549777))))

(declare-fun lt!549775 () Unit!39971)

(declare-fun lt!549778 () Unit!39971)

(assert (=> d!133221 (= lt!549775 lt!549778)))

(assert (=> d!133221 (= (getValueByKey!641 lt!549777 (_1!9951 (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!691 (_2!9951 (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133221 (= lt!549778 (lemmaContainsTupThenGetReturnValue!317 lt!549777 (_1!9951 (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9951 (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133221 (= lt!549777 (insertStrictlySorted!410 (toList!8940 (ite c!119291 lt!549585 lt!549570)) (_1!9951 (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9951 (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133221 (= (+!4063 (ite c!119291 lt!549585 lt!549570) (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!549776)))

(declare-fun b!1210897 () Bool)

(declare-fun res!804516 () Bool)

(assert (=> b!1210897 (=> (not res!804516) (not e!687673))))

(assert (=> b!1210897 (= res!804516 (= (getValueByKey!641 (toList!8940 lt!549776) (_1!9951 (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!691 (_2!9951 (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1210898 () Bool)

(assert (=> b!1210898 (= e!687673 (contains!6949 (toList!8940 lt!549776) (ite c!119291 (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119294 (tuple2!19881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133221 res!804517) b!1210897))

(assert (= (and b!1210897 res!804516) b!1210898))

(declare-fun m!1115881 () Bool)

(assert (=> d!133221 m!1115881))

(declare-fun m!1115883 () Bool)

(assert (=> d!133221 m!1115883))

(declare-fun m!1115885 () Bool)

(assert (=> d!133221 m!1115885))

(declare-fun m!1115887 () Bool)

(assert (=> d!133221 m!1115887))

(declare-fun m!1115889 () Bool)

(assert (=> b!1210897 m!1115889))

(declare-fun m!1115891 () Bool)

(assert (=> b!1210898 m!1115891))

(assert (=> bm!59690 d!133221))

(declare-fun d!133223 () Bool)

(declare-fun e!687676 () Bool)

(assert (=> d!133223 e!687676))

(declare-fun c!119354 () Bool)

(assert (=> d!133223 (= c!119354 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!549781 () Unit!39971)

(declare-fun choose!1822 (array!78152 array!78154 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 64) (_ BitVec 32) Int) Unit!39971)

(assert (=> d!133223 (= lt!549781 (choose!1822 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133223 (validMask!0 mask!1564)))

(assert (=> d!133223 (= (lemmaListMapContainsThenArrayContainsFrom!589 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!549781)))

(declare-fun b!1210903 () Bool)

(assert (=> b!1210903 (= e!687676 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210904 () Bool)

(assert (=> b!1210904 (= e!687676 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133223 c!119354) b!1210903))

(assert (= (and d!133223 (not c!119354)) b!1210904))

(declare-fun m!1115893 () Bool)

(assert (=> d!133223 m!1115893))

(assert (=> d!133223 m!1115553))

(assert (=> b!1210903 m!1115583))

(assert (=> b!1210643 d!133223))

(declare-fun d!133225 () Bool)

(assert (=> d!133225 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26656)))

(declare-fun lt!549784 () Unit!39971)

(declare-fun choose!39 (array!78152 (_ BitVec 32) (_ BitVec 32)) Unit!39971)

(assert (=> d!133225 (= lt!549784 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133225 (bvslt (size!38251 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133225 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!549784)))

(declare-fun bs!34164 () Bool)

(assert (= bs!34164 d!133225))

(assert (=> bs!34164 m!1115601))

(declare-fun m!1115895 () Bool)

(assert (=> bs!34164 m!1115895))

(assert (=> b!1210643 d!133225))

(declare-fun b!1210915 () Bool)

(declare-fun e!687686 () Bool)

(declare-fun e!687685 () Bool)

(assert (=> b!1210915 (= e!687686 e!687685)))

(declare-fun c!119357 () Bool)

(assert (=> b!1210915 (= c!119357 (validKeyInArray!0 (select (arr!37713 _keys!1208) from!1455)))))

(declare-fun b!1210916 () Bool)

(declare-fun call!59755 () Bool)

(assert (=> b!1210916 (= e!687685 call!59755)))

(declare-fun b!1210917 () Bool)

(declare-fun e!687688 () Bool)

(assert (=> b!1210917 (= e!687688 e!687686)))

(declare-fun res!804524 () Bool)

(assert (=> b!1210917 (=> (not res!804524) (not e!687686))))

(declare-fun e!687687 () Bool)

(assert (=> b!1210917 (= res!804524 (not e!687687))))

(declare-fun res!804525 () Bool)

(assert (=> b!1210917 (=> (not res!804525) (not e!687687))))

(assert (=> b!1210917 (= res!804525 (validKeyInArray!0 (select (arr!37713 _keys!1208) from!1455)))))

(declare-fun b!1210919 () Bool)

(assert (=> b!1210919 (= e!687685 call!59755)))

(declare-fun bm!59752 () Bool)

(assert (=> bm!59752 (= call!59755 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!119357 (Cons!26655 (select (arr!37713 _keys!1208) from!1455) Nil!26656) Nil!26656)))))

(declare-fun b!1210918 () Bool)

(declare-fun contains!6950 (List!26659 (_ BitVec 64)) Bool)

(assert (=> b!1210918 (= e!687687 (contains!6950 Nil!26656 (select (arr!37713 _keys!1208) from!1455)))))

(declare-fun d!133227 () Bool)

(declare-fun res!804526 () Bool)

(assert (=> d!133227 (=> res!804526 e!687688)))

(assert (=> d!133227 (= res!804526 (bvsge from!1455 (size!38251 _keys!1208)))))

(assert (=> d!133227 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26656) e!687688)))

(assert (= (and d!133227 (not res!804526)) b!1210917))

(assert (= (and b!1210917 res!804525) b!1210918))

(assert (= (and b!1210917 res!804524) b!1210915))

(assert (= (and b!1210915 c!119357) b!1210919))

(assert (= (and b!1210915 (not c!119357)) b!1210916))

(assert (= (or b!1210919 b!1210916) bm!59752))

(assert (=> b!1210915 m!1115565))

(assert (=> b!1210915 m!1115565))

(assert (=> b!1210915 m!1115835))

(assert (=> b!1210917 m!1115565))

(assert (=> b!1210917 m!1115565))

(assert (=> b!1210917 m!1115835))

(assert (=> bm!59752 m!1115565))

(declare-fun m!1115897 () Bool)

(assert (=> bm!59752 m!1115897))

(assert (=> b!1210918 m!1115565))

(assert (=> b!1210918 m!1115565))

(declare-fun m!1115899 () Bool)

(assert (=> b!1210918 m!1115899))

(assert (=> b!1210643 d!133227))

(declare-fun d!133229 () Bool)

(assert (=> d!133229 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38251 _keys!1208)) (not (= (select (arr!37713 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!549787 () Unit!39971)

(declare-fun choose!21 (array!78152 (_ BitVec 64) (_ BitVec 32) List!26659) Unit!39971)

(assert (=> d!133229 (= lt!549787 (choose!21 _keys!1208 k0!934 from!1455 Nil!26656))))

(assert (=> d!133229 (bvslt (size!38251 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133229 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26656) lt!549787)))

(declare-fun bs!34165 () Bool)

(assert (= bs!34165 d!133229))

(assert (=> bs!34165 m!1115565))

(declare-fun m!1115901 () Bool)

(assert (=> bs!34165 m!1115901))

(assert (=> b!1210643 d!133229))

(assert (=> b!1210637 d!133207))

(declare-fun b!1210920 () Bool)

(declare-fun e!687690 () Bool)

(declare-fun e!687689 () Bool)

(assert (=> b!1210920 (= e!687690 e!687689)))

(declare-fun c!119358 () Bool)

(assert (=> b!1210920 (= c!119358 (validKeyInArray!0 (select (arr!37713 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1210921 () Bool)

(declare-fun call!59756 () Bool)

(assert (=> b!1210921 (= e!687689 call!59756)))

(declare-fun b!1210922 () Bool)

(declare-fun e!687692 () Bool)

(assert (=> b!1210922 (= e!687692 e!687690)))

(declare-fun res!804527 () Bool)

(assert (=> b!1210922 (=> (not res!804527) (not e!687690))))

(declare-fun e!687691 () Bool)

(assert (=> b!1210922 (= res!804527 (not e!687691))))

(declare-fun res!804528 () Bool)

(assert (=> b!1210922 (=> (not res!804528) (not e!687691))))

(assert (=> b!1210922 (= res!804528 (validKeyInArray!0 (select (arr!37713 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1210924 () Bool)

(assert (=> b!1210924 (= e!687689 call!59756)))

(declare-fun bm!59753 () Bool)

(assert (=> bm!59753 (= call!59756 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119358 (Cons!26655 (select (arr!37713 _keys!1208) #b00000000000000000000000000000000) Nil!26656) Nil!26656)))))

(declare-fun b!1210923 () Bool)

(assert (=> b!1210923 (= e!687691 (contains!6950 Nil!26656 (select (arr!37713 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133231 () Bool)

(declare-fun res!804529 () Bool)

(assert (=> d!133231 (=> res!804529 e!687692)))

(assert (=> d!133231 (= res!804529 (bvsge #b00000000000000000000000000000000 (size!38251 _keys!1208)))))

(assert (=> d!133231 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26656) e!687692)))

(assert (= (and d!133231 (not res!804529)) b!1210922))

(assert (= (and b!1210922 res!804528) b!1210923))

(assert (= (and b!1210922 res!804527) b!1210920))

(assert (= (and b!1210920 c!119358) b!1210924))

(assert (= (and b!1210920 (not c!119358)) b!1210921))

(assert (= (or b!1210924 b!1210921) bm!59753))

(declare-fun m!1115903 () Bool)

(assert (=> b!1210920 m!1115903))

(assert (=> b!1210920 m!1115903))

(declare-fun m!1115905 () Bool)

(assert (=> b!1210920 m!1115905))

(assert (=> b!1210922 m!1115903))

(assert (=> b!1210922 m!1115903))

(assert (=> b!1210922 m!1115905))

(assert (=> bm!59753 m!1115903))

(declare-fun m!1115907 () Bool)

(assert (=> bm!59753 m!1115907))

(assert (=> b!1210923 m!1115903))

(assert (=> b!1210923 m!1115903))

(declare-fun m!1115909 () Bool)

(assert (=> b!1210923 m!1115909))

(assert (=> b!1210620 d!133231))

(declare-fun d!133233 () Bool)

(assert (=> d!133233 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1210619 d!133233))

(declare-fun d!133235 () Bool)

(assert (=> d!133235 (contains!6947 (+!4063 (ite c!119291 lt!549585 lt!549570) (tuple2!19881 (ite c!119291 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119294 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119291 minValue!944 (ite c!119294 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!549788 () Unit!39971)

(assert (=> d!133235 (= lt!549788 (choose!1821 (ite c!119291 lt!549585 lt!549570) (ite c!119291 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119294 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119291 minValue!944 (ite c!119294 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!133235 (contains!6947 (ite c!119291 lt!549585 lt!549570) k0!934)))

(assert (=> d!133235 (= (addStillContains!1047 (ite c!119291 lt!549585 lt!549570) (ite c!119291 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119294 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119291 minValue!944 (ite c!119294 zeroValue!944 minValue!944)) k0!934) lt!549788)))

(declare-fun bs!34166 () Bool)

(assert (= bs!34166 d!133235))

(declare-fun m!1115911 () Bool)

(assert (=> bs!34166 m!1115911))

(assert (=> bs!34166 m!1115911))

(declare-fun m!1115913 () Bool)

(assert (=> bs!34166 m!1115913))

(declare-fun m!1115915 () Bool)

(assert (=> bs!34166 m!1115915))

(declare-fun m!1115917 () Bool)

(assert (=> bs!34166 m!1115917))

(assert (=> bm!59697 d!133235))

(declare-fun d!133237 () Bool)

(declare-fun res!804535 () Bool)

(declare-fun e!687700 () Bool)

(assert (=> d!133237 (=> res!804535 e!687700)))

(assert (=> d!133237 (= res!804535 (bvsge #b00000000000000000000000000000000 (size!38251 lt!549575)))))

(assert (=> d!133237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549575 mask!1564) e!687700)))

(declare-fun b!1210933 () Bool)

(declare-fun e!687699 () Bool)

(declare-fun e!687701 () Bool)

(assert (=> b!1210933 (= e!687699 e!687701)))

(declare-fun lt!549796 () (_ BitVec 64))

(assert (=> b!1210933 (= lt!549796 (select (arr!37713 lt!549575) #b00000000000000000000000000000000))))

(declare-fun lt!549797 () Unit!39971)

(assert (=> b!1210933 (= lt!549797 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!549575 lt!549796 #b00000000000000000000000000000000))))

(assert (=> b!1210933 (arrayContainsKey!0 lt!549575 lt!549796 #b00000000000000000000000000000000)))

(declare-fun lt!549795 () Unit!39971)

(assert (=> b!1210933 (= lt!549795 lt!549797)))

(declare-fun res!804534 () Bool)

(declare-datatypes ((SeekEntryResult!9940 0))(
  ( (MissingZero!9940 (index!42131 (_ BitVec 32))) (Found!9940 (index!42132 (_ BitVec 32))) (Intermediate!9940 (undefined!10752 Bool) (index!42133 (_ BitVec 32)) (x!106756 (_ BitVec 32))) (Undefined!9940) (MissingVacant!9940 (index!42134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78152 (_ BitVec 32)) SeekEntryResult!9940)

(assert (=> b!1210933 (= res!804534 (= (seekEntryOrOpen!0 (select (arr!37713 lt!549575) #b00000000000000000000000000000000) lt!549575 mask!1564) (Found!9940 #b00000000000000000000000000000000)))))

(assert (=> b!1210933 (=> (not res!804534) (not e!687701))))

(declare-fun b!1210934 () Bool)

(assert (=> b!1210934 (= e!687700 e!687699)))

(declare-fun c!119361 () Bool)

(assert (=> b!1210934 (= c!119361 (validKeyInArray!0 (select (arr!37713 lt!549575) #b00000000000000000000000000000000)))))

(declare-fun bm!59756 () Bool)

(declare-fun call!59759 () Bool)

(assert (=> bm!59756 (= call!59759 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!549575 mask!1564))))

(declare-fun b!1210935 () Bool)

(assert (=> b!1210935 (= e!687699 call!59759)))

(declare-fun b!1210936 () Bool)

(assert (=> b!1210936 (= e!687701 call!59759)))

(assert (= (and d!133237 (not res!804535)) b!1210934))

(assert (= (and b!1210934 c!119361) b!1210933))

(assert (= (and b!1210934 (not c!119361)) b!1210935))

(assert (= (and b!1210933 res!804534) b!1210936))

(assert (= (or b!1210936 b!1210935) bm!59756))

(declare-fun m!1115919 () Bool)

(assert (=> b!1210933 m!1115919))

(declare-fun m!1115921 () Bool)

(assert (=> b!1210933 m!1115921))

(declare-fun m!1115923 () Bool)

(assert (=> b!1210933 m!1115923))

(assert (=> b!1210933 m!1115919))

(declare-fun m!1115925 () Bool)

(assert (=> b!1210933 m!1115925))

(assert (=> b!1210934 m!1115919))

(assert (=> b!1210934 m!1115919))

(declare-fun m!1115927 () Bool)

(assert (=> b!1210934 m!1115927))

(declare-fun m!1115929 () Bool)

(assert (=> bm!59756 m!1115929))

(assert (=> b!1210635 d!133237))

(declare-fun b!1210937 () Bool)

(declare-fun e!687703 () Bool)

(declare-fun e!687702 () Bool)

(assert (=> b!1210937 (= e!687703 e!687702)))

(declare-fun c!119362 () Bool)

(assert (=> b!1210937 (= c!119362 (validKeyInArray!0 (select (arr!37713 lt!549575) #b00000000000000000000000000000000)))))

(declare-fun b!1210938 () Bool)

(declare-fun call!59760 () Bool)

(assert (=> b!1210938 (= e!687702 call!59760)))

(declare-fun b!1210939 () Bool)

(declare-fun e!687705 () Bool)

(assert (=> b!1210939 (= e!687705 e!687703)))

(declare-fun res!804536 () Bool)

(assert (=> b!1210939 (=> (not res!804536) (not e!687703))))

(declare-fun e!687704 () Bool)

(assert (=> b!1210939 (= res!804536 (not e!687704))))

(declare-fun res!804537 () Bool)

(assert (=> b!1210939 (=> (not res!804537) (not e!687704))))

(assert (=> b!1210939 (= res!804537 (validKeyInArray!0 (select (arr!37713 lt!549575) #b00000000000000000000000000000000)))))

(declare-fun b!1210941 () Bool)

(assert (=> b!1210941 (= e!687702 call!59760)))

(declare-fun bm!59757 () Bool)

(assert (=> bm!59757 (= call!59760 (arrayNoDuplicates!0 lt!549575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!119362 (Cons!26655 (select (arr!37713 lt!549575) #b00000000000000000000000000000000) Nil!26656) Nil!26656)))))

(declare-fun b!1210940 () Bool)

(assert (=> b!1210940 (= e!687704 (contains!6950 Nil!26656 (select (arr!37713 lt!549575) #b00000000000000000000000000000000)))))

(declare-fun d!133239 () Bool)

(declare-fun res!804538 () Bool)

(assert (=> d!133239 (=> res!804538 e!687705)))

(assert (=> d!133239 (= res!804538 (bvsge #b00000000000000000000000000000000 (size!38251 lt!549575)))))

(assert (=> d!133239 (= (arrayNoDuplicates!0 lt!549575 #b00000000000000000000000000000000 Nil!26656) e!687705)))

(assert (= (and d!133239 (not res!804538)) b!1210939))

(assert (= (and b!1210939 res!804537) b!1210940))

(assert (= (and b!1210939 res!804536) b!1210937))

(assert (= (and b!1210937 c!119362) b!1210941))

(assert (= (and b!1210937 (not c!119362)) b!1210938))

(assert (= (or b!1210941 b!1210938) bm!59757))

(assert (=> b!1210937 m!1115919))

(assert (=> b!1210937 m!1115919))

(assert (=> b!1210937 m!1115927))

(assert (=> b!1210939 m!1115919))

(assert (=> b!1210939 m!1115919))

(assert (=> b!1210939 m!1115927))

(assert (=> bm!59757 m!1115919))

(declare-fun m!1115931 () Bool)

(assert (=> bm!59757 m!1115931))

(assert (=> b!1210940 m!1115919))

(assert (=> b!1210940 m!1115919))

(declare-fun m!1115933 () Bool)

(assert (=> b!1210940 m!1115933))

(assert (=> b!1210634 d!133239))

(declare-fun b!1210948 () Bool)

(declare-fun e!687711 () Bool)

(declare-fun e!687710 () Bool)

(assert (=> b!1210948 (= e!687711 e!687710)))

(declare-fun c!119365 () Bool)

(assert (=> b!1210948 (= c!119365 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!133241 () Bool)

(assert (=> d!133241 e!687711))

(declare-fun res!804541 () Bool)

(assert (=> d!133241 (=> (not res!804541) (not e!687711))))

(assert (=> d!133241 (= res!804541 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38251 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38251 _keys!1208))))))))

(declare-fun lt!549800 () Unit!39971)

(declare-fun choose!1823 (array!78152 array!78154 (_ BitVec 32) (_ BitVec 32) V!46097 V!46097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39971)

(assert (=> d!133241 (= lt!549800 (choose!1823 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133241 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 _keys!1208)))))

(assert (=> d!133241 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1061 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!549800)))

(declare-fun b!1210949 () Bool)

(declare-fun call!59765 () ListLongMap!17849)

(declare-fun call!59766 () ListLongMap!17849)

(assert (=> b!1210949 (= e!687710 (= call!59765 (-!1819 call!59766 k0!934)))))

(assert (=> b!1210949 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38252 _values!996)))))

(declare-fun b!1210950 () Bool)

(assert (=> b!1210950 (= e!687710 (= call!59765 call!59766))))

(assert (=> b!1210950 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38252 _values!996)))))

(declare-fun bm!59762 () Bool)

(assert (=> bm!59762 (= call!59766 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59763 () Bool)

(assert (=> bm!59763 (= call!59765 (getCurrentListMapNoExtraKeys!5382 (array!78153 (store (arr!37713 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38251 _keys!1208)) (array!78155 (store (arr!37714 _values!996) i!673 (ValueCellFull!14654 (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38252 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133241 res!804541) b!1210948))

(assert (= (and b!1210948 c!119365) b!1210949))

(assert (= (and b!1210948 (not c!119365)) b!1210950))

(assert (= (or b!1210949 b!1210950) bm!59762))

(assert (= (or b!1210949 b!1210950) bm!59763))

(declare-fun b_lambda!21613 () Bool)

(assert (=> (not b_lambda!21613) (not bm!59763)))

(assert (=> bm!59763 t!39651))

(declare-fun b_and!43121 () Bool)

(assert (= b_and!43119 (and (=> t!39651 result!22231) b_and!43121)))

(declare-fun m!1115935 () Bool)

(assert (=> d!133241 m!1115935))

(declare-fun m!1115937 () Bool)

(assert (=> b!1210949 m!1115937))

(assert (=> bm!59762 m!1115563))

(assert (=> bm!59763 m!1115617))

(assert (=> bm!59763 m!1115559))

(declare-fun m!1115939 () Bool)

(assert (=> bm!59763 m!1115939))

(declare-fun m!1115941 () Bool)

(assert (=> bm!59763 m!1115941))

(assert (=> b!1210642 d!133241))

(declare-fun d!133243 () Bool)

(declare-fun res!804542 () Bool)

(declare-fun e!687712 () Bool)

(assert (=> d!133243 (=> res!804542 e!687712)))

(assert (=> d!133243 (= res!804542 (= (select (arr!37713 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133243 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!687712)))

(declare-fun b!1210951 () Bool)

(declare-fun e!687713 () Bool)

(assert (=> b!1210951 (= e!687712 e!687713)))

(declare-fun res!804543 () Bool)

(assert (=> b!1210951 (=> (not res!804543) (not e!687713))))

(assert (=> b!1210951 (= res!804543 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38251 _keys!1208)))))

(declare-fun b!1210952 () Bool)

(assert (=> b!1210952 (= e!687713 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133243 (not res!804542)) b!1210951))

(assert (= (and b!1210951 res!804543) b!1210952))

(assert (=> d!133243 m!1115903))

(declare-fun m!1115943 () Bool)

(assert (=> b!1210952 m!1115943))

(assert (=> b!1210617 d!133243))

(declare-fun d!133245 () Bool)

(assert (=> d!133245 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549803 () Unit!39971)

(declare-fun choose!13 (array!78152 (_ BitVec 64) (_ BitVec 32)) Unit!39971)

(assert (=> d!133245 (= lt!549803 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133245 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133245 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!549803)))

(declare-fun bs!34167 () Bool)

(assert (= bs!34167 d!133245))

(assert (=> bs!34167 m!1115629))

(declare-fun m!1115945 () Bool)

(assert (=> bs!34167 m!1115945))

(assert (=> b!1210617 d!133245))

(declare-fun e!687719 () Bool)

(declare-fun b!1210953 () Bool)

(declare-fun lt!549806 () ListLongMap!17849)

(assert (=> b!1210953 (= e!687719 (= lt!549806 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133247 () Bool)

(declare-fun e!687715 () Bool)

(assert (=> d!133247 e!687715))

(declare-fun res!804545 () Bool)

(assert (=> d!133247 (=> (not res!804545) (not e!687715))))

(assert (=> d!133247 (= res!804545 (not (contains!6947 lt!549806 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!687716 () ListLongMap!17849)

(assert (=> d!133247 (= lt!549806 e!687716)))

(declare-fun c!119369 () Bool)

(assert (=> d!133247 (= c!119369 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 _keys!1208)))))

(assert (=> d!133247 (validMask!0 mask!1564)))

(assert (=> d!133247 (= (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!549806)))

(declare-fun b!1210954 () Bool)

(declare-fun e!687717 () Bool)

(declare-fun e!687718 () Bool)

(assert (=> b!1210954 (= e!687717 e!687718)))

(assert (=> b!1210954 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 _keys!1208)))))

(declare-fun res!804544 () Bool)

(assert (=> b!1210954 (= res!804544 (contains!6947 lt!549806 (select (arr!37713 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1210954 (=> (not res!804544) (not e!687718))))

(declare-fun b!1210955 () Bool)

(assert (=> b!1210955 (= e!687719 (isEmpty!997 lt!549806))))

(declare-fun b!1210956 () Bool)

(declare-fun e!687714 () ListLongMap!17849)

(declare-fun call!59767 () ListLongMap!17849)

(assert (=> b!1210956 (= e!687714 call!59767)))

(declare-fun b!1210957 () Bool)

(declare-fun e!687720 () Bool)

(assert (=> b!1210957 (= e!687720 (validKeyInArray!0 (select (arr!37713 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1210957 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!59764 () Bool)

(assert (=> bm!59764 (= call!59767 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1210958 () Bool)

(declare-fun res!804547 () Bool)

(assert (=> b!1210958 (=> (not res!804547) (not e!687715))))

(assert (=> b!1210958 (= res!804547 (not (contains!6947 lt!549806 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1210959 () Bool)

(assert (=> b!1210959 (= e!687716 (ListLongMap!17850 Nil!26655))))

(declare-fun b!1210960 () Bool)

(assert (=> b!1210960 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 _keys!1208)))))

(assert (=> b!1210960 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 _values!996)))))

(assert (=> b!1210960 (= e!687718 (= (apply!961 lt!549806 (select (arr!37713 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19233 (select (arr!37714 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1210961 () Bool)

(assert (=> b!1210961 (= e!687715 e!687717)))

(declare-fun c!119368 () Bool)

(assert (=> b!1210961 (= c!119368 e!687720)))

(declare-fun res!804546 () Bool)

(assert (=> b!1210961 (=> (not res!804546) (not e!687720))))

(assert (=> b!1210961 (= res!804546 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 _keys!1208)))))

(declare-fun b!1210962 () Bool)

(assert (=> b!1210962 (= e!687717 e!687719)))

(declare-fun c!119366 () Bool)

(assert (=> b!1210962 (= c!119366 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 _keys!1208)))))

(declare-fun b!1210963 () Bool)

(declare-fun lt!549807 () Unit!39971)

(declare-fun lt!549805 () Unit!39971)

(assert (=> b!1210963 (= lt!549807 lt!549805)))

(declare-fun lt!549810 () (_ BitVec 64))

(declare-fun lt!549809 () (_ BitVec 64))

(declare-fun lt!549804 () ListLongMap!17849)

(declare-fun lt!549808 () V!46097)

(assert (=> b!1210963 (not (contains!6947 (+!4063 lt!549804 (tuple2!19881 lt!549809 lt!549808)) lt!549810))))

(assert (=> b!1210963 (= lt!549805 (addStillNotContains!297 lt!549804 lt!549809 lt!549808 lt!549810))))

(assert (=> b!1210963 (= lt!549810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1210963 (= lt!549808 (get!19233 (select (arr!37714 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1210963 (= lt!549809 (select (arr!37713 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1210963 (= lt!549804 call!59767)))

(assert (=> b!1210963 (= e!687714 (+!4063 call!59767 (tuple2!19881 (select (arr!37713 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37714 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1210964 () Bool)

(assert (=> b!1210964 (= e!687716 e!687714)))

(declare-fun c!119367 () Bool)

(assert (=> b!1210964 (= c!119367 (validKeyInArray!0 (select (arr!37713 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!133247 c!119369) b!1210959))

(assert (= (and d!133247 (not c!119369)) b!1210964))

(assert (= (and b!1210964 c!119367) b!1210963))

(assert (= (and b!1210964 (not c!119367)) b!1210956))

(assert (= (or b!1210963 b!1210956) bm!59764))

(assert (= (and d!133247 res!804545) b!1210958))

(assert (= (and b!1210958 res!804547) b!1210961))

(assert (= (and b!1210961 res!804546) b!1210957))

(assert (= (and b!1210961 c!119368) b!1210954))

(assert (= (and b!1210961 (not c!119368)) b!1210962))

(assert (= (and b!1210954 res!804544) b!1210960))

(assert (= (and b!1210962 c!119366) b!1210953))

(assert (= (and b!1210962 (not c!119366)) b!1210955))

(declare-fun b_lambda!21615 () Bool)

(assert (=> (not b_lambda!21615) (not b!1210960)))

(assert (=> b!1210960 t!39651))

(declare-fun b_and!43123 () Bool)

(assert (= b_and!43121 (and (=> t!39651 result!22231) b_and!43123)))

(declare-fun b_lambda!21617 () Bool)

(assert (=> (not b_lambda!21617) (not b!1210963)))

(assert (=> b!1210963 t!39651))

(declare-fun b_and!43125 () Bool)

(assert (= b_and!43123 (and (=> t!39651 result!22231) b_and!43125)))

(assert (=> b!1210954 m!1115801))

(assert (=> b!1210954 m!1115801))

(declare-fun m!1115947 () Bool)

(assert (=> b!1210954 m!1115947))

(assert (=> b!1210957 m!1115801))

(assert (=> b!1210957 m!1115801))

(declare-fun m!1115949 () Bool)

(assert (=> b!1210957 m!1115949))

(declare-fun m!1115951 () Bool)

(assert (=> b!1210955 m!1115951))

(assert (=> b!1210964 m!1115801))

(assert (=> b!1210964 m!1115801))

(assert (=> b!1210964 m!1115949))

(declare-fun m!1115953 () Bool)

(assert (=> b!1210958 m!1115953))

(declare-fun m!1115955 () Bool)

(assert (=> d!133247 m!1115955))

(assert (=> d!133247 m!1115553))

(assert (=> b!1210960 m!1115559))

(assert (=> b!1210960 m!1115801))

(declare-fun m!1115957 () Bool)

(assert (=> b!1210960 m!1115957))

(assert (=> b!1210960 m!1115801))

(declare-fun m!1115959 () Bool)

(assert (=> b!1210960 m!1115959))

(assert (=> b!1210960 m!1115959))

(assert (=> b!1210960 m!1115559))

(declare-fun m!1115961 () Bool)

(assert (=> b!1210960 m!1115961))

(declare-fun m!1115963 () Bool)

(assert (=> bm!59764 m!1115963))

(assert (=> b!1210963 m!1115559))

(assert (=> b!1210963 m!1115801))

(assert (=> b!1210963 m!1115959))

(declare-fun m!1115965 () Bool)

(assert (=> b!1210963 m!1115965))

(declare-fun m!1115967 () Bool)

(assert (=> b!1210963 m!1115967))

(declare-fun m!1115969 () Bool)

(assert (=> b!1210963 m!1115969))

(assert (=> b!1210963 m!1115959))

(assert (=> b!1210963 m!1115559))

(assert (=> b!1210963 m!1115961))

(assert (=> b!1210963 m!1115965))

(declare-fun m!1115971 () Bool)

(assert (=> b!1210963 m!1115971))

(assert (=> b!1210953 m!1115963))

(assert (=> bm!59696 d!133247))

(declare-fun d!133249 () Bool)

(assert (=> d!133249 (= (-!1819 (+!4063 lt!549570 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574)) (select (arr!37713 _keys!1208) from!1455)) lt!549570)))

(declare-fun lt!549813 () Unit!39971)

(declare-fun choose!1824 (ListLongMap!17849 (_ BitVec 64) V!46097) Unit!39971)

(assert (=> d!133249 (= lt!549813 (choose!1824 lt!549570 (select (arr!37713 _keys!1208) from!1455) lt!549574))))

(assert (=> d!133249 (not (contains!6947 lt!549570 (select (arr!37713 _keys!1208) from!1455)))))

(assert (=> d!133249 (= (addThenRemoveForNewKeyIsSame!258 lt!549570 (select (arr!37713 _keys!1208) from!1455) lt!549574) lt!549813)))

(declare-fun bs!34168 () Bool)

(assert (= bs!34168 d!133249))

(assert (=> bs!34168 m!1115569))

(assert (=> bs!34168 m!1115569))

(assert (=> bs!34168 m!1115565))

(assert (=> bs!34168 m!1115573))

(assert (=> bs!34168 m!1115565))

(declare-fun m!1115973 () Bool)

(assert (=> bs!34168 m!1115973))

(assert (=> bs!34168 m!1115565))

(declare-fun m!1115975 () Bool)

(assert (=> bs!34168 m!1115975))

(assert (=> b!1210616 d!133249))

(declare-fun d!133251 () Bool)

(declare-fun lt!549816 () ListLongMap!17849)

(assert (=> d!133251 (not (contains!6947 lt!549816 (select (arr!37713 _keys!1208) from!1455)))))

(declare-fun removeStrictlySorted!101 (List!26658 (_ BitVec 64)) List!26658)

(assert (=> d!133251 (= lt!549816 (ListLongMap!17850 (removeStrictlySorted!101 (toList!8940 (+!4063 lt!549570 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574))) (select (arr!37713 _keys!1208) from!1455))))))

(assert (=> d!133251 (= (-!1819 (+!4063 lt!549570 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574)) (select (arr!37713 _keys!1208) from!1455)) lt!549816)))

(declare-fun bs!34169 () Bool)

(assert (= bs!34169 d!133251))

(assert (=> bs!34169 m!1115565))

(declare-fun m!1115977 () Bool)

(assert (=> bs!34169 m!1115977))

(assert (=> bs!34169 m!1115565))

(declare-fun m!1115979 () Bool)

(assert (=> bs!34169 m!1115979))

(assert (=> b!1210616 d!133251))

(declare-fun d!133253 () Bool)

(declare-fun c!119372 () Bool)

(assert (=> d!133253 (= c!119372 ((_ is ValueCellFull!14654) (select (arr!37714 _values!996) from!1455)))))

(declare-fun e!687723 () V!46097)

(assert (=> d!133253 (= (get!19233 (select (arr!37714 _values!996) from!1455) lt!549587) e!687723)))

(declare-fun b!1210969 () Bool)

(declare-fun get!19234 (ValueCell!14654 V!46097) V!46097)

(assert (=> b!1210969 (= e!687723 (get!19234 (select (arr!37714 _values!996) from!1455) lt!549587))))

(declare-fun b!1210970 () Bool)

(declare-fun get!19235 (ValueCell!14654 V!46097) V!46097)

(assert (=> b!1210970 (= e!687723 (get!19235 (select (arr!37714 _values!996) from!1455) lt!549587))))

(assert (= (and d!133253 c!119372) b!1210969))

(assert (= (and d!133253 (not c!119372)) b!1210970))

(assert (=> b!1210969 m!1115577))

(declare-fun m!1115981 () Bool)

(assert (=> b!1210969 m!1115981))

(assert (=> b!1210970 m!1115577))

(declare-fun m!1115983 () Bool)

(assert (=> b!1210970 m!1115983))

(assert (=> b!1210616 d!133253))

(declare-fun d!133255 () Bool)

(declare-fun lt!549817 () ListLongMap!17849)

(assert (=> d!133255 (not (contains!6947 lt!549817 k0!934))))

(assert (=> d!133255 (= lt!549817 (ListLongMap!17850 (removeStrictlySorted!101 (toList!8940 lt!549589) k0!934)))))

(assert (=> d!133255 (= (-!1819 lt!549589 k0!934) lt!549817)))

(declare-fun bs!34170 () Bool)

(assert (= bs!34170 d!133255))

(declare-fun m!1115985 () Bool)

(assert (=> bs!34170 m!1115985))

(declare-fun m!1115987 () Bool)

(assert (=> bs!34170 m!1115987))

(assert (=> b!1210616 d!133255))

(declare-fun d!133257 () Bool)

(declare-fun e!687724 () Bool)

(assert (=> d!133257 e!687724))

(declare-fun res!804549 () Bool)

(assert (=> d!133257 (=> (not res!804549) (not e!687724))))

(declare-fun lt!549819 () ListLongMap!17849)

(assert (=> d!133257 (= res!804549 (contains!6947 lt!549819 (_1!9951 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574))))))

(declare-fun lt!549820 () List!26658)

(assert (=> d!133257 (= lt!549819 (ListLongMap!17850 lt!549820))))

(declare-fun lt!549818 () Unit!39971)

(declare-fun lt!549821 () Unit!39971)

(assert (=> d!133257 (= lt!549818 lt!549821)))

(assert (=> d!133257 (= (getValueByKey!641 lt!549820 (_1!9951 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574))) (Some!691 (_2!9951 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574))))))

(assert (=> d!133257 (= lt!549821 (lemmaContainsTupThenGetReturnValue!317 lt!549820 (_1!9951 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574)) (_2!9951 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574))))))

(assert (=> d!133257 (= lt!549820 (insertStrictlySorted!410 (toList!8940 lt!549570) (_1!9951 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574)) (_2!9951 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574))))))

(assert (=> d!133257 (= (+!4063 lt!549570 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574)) lt!549819)))

(declare-fun b!1210971 () Bool)

(declare-fun res!804548 () Bool)

(assert (=> b!1210971 (=> (not res!804548) (not e!687724))))

(assert (=> b!1210971 (= res!804548 (= (getValueByKey!641 (toList!8940 lt!549819) (_1!9951 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574))) (Some!691 (_2!9951 (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574)))))))

(declare-fun b!1210972 () Bool)

(assert (=> b!1210972 (= e!687724 (contains!6949 (toList!8940 lt!549819) (tuple2!19881 (select (arr!37713 _keys!1208) from!1455) lt!549574)))))

(assert (= (and d!133257 res!804549) b!1210971))

(assert (= (and b!1210971 res!804548) b!1210972))

(declare-fun m!1115989 () Bool)

(assert (=> d!133257 m!1115989))

(declare-fun m!1115991 () Bool)

(assert (=> d!133257 m!1115991))

(declare-fun m!1115993 () Bool)

(assert (=> d!133257 m!1115993))

(declare-fun m!1115995 () Bool)

(assert (=> d!133257 m!1115995))

(declare-fun m!1115997 () Bool)

(assert (=> b!1210971 m!1115997))

(declare-fun m!1115999 () Bool)

(assert (=> b!1210972 m!1115999))

(assert (=> b!1210616 d!133257))

(assert (=> b!1210616 d!133247))

(declare-fun d!133259 () Bool)

(declare-fun e!687725 () Bool)

(assert (=> d!133259 e!687725))

(declare-fun res!804550 () Bool)

(assert (=> d!133259 (=> res!804550 e!687725)))

(declare-fun lt!549822 () Bool)

(assert (=> d!133259 (= res!804550 (not lt!549822))))

(declare-fun lt!549824 () Bool)

(assert (=> d!133259 (= lt!549822 lt!549824)))

(declare-fun lt!549825 () Unit!39971)

(declare-fun e!687726 () Unit!39971)

(assert (=> d!133259 (= lt!549825 e!687726)))

(declare-fun c!119373 () Bool)

(assert (=> d!133259 (= c!119373 lt!549824)))

(assert (=> d!133259 (= lt!549824 (containsKey!595 (toList!8940 lt!549570) k0!934))))

(assert (=> d!133259 (= (contains!6947 lt!549570 k0!934) lt!549822)))

(declare-fun b!1210973 () Bool)

(declare-fun lt!549823 () Unit!39971)

(assert (=> b!1210973 (= e!687726 lt!549823)))

(assert (=> b!1210973 (= lt!549823 (lemmaContainsKeyImpliesGetValueByKeyDefined!424 (toList!8940 lt!549570) k0!934))))

(assert (=> b!1210973 (isDefined!467 (getValueByKey!641 (toList!8940 lt!549570) k0!934))))

(declare-fun b!1210974 () Bool)

(declare-fun Unit!39985 () Unit!39971)

(assert (=> b!1210974 (= e!687726 Unit!39985)))

(declare-fun b!1210975 () Bool)

(assert (=> b!1210975 (= e!687725 (isDefined!467 (getValueByKey!641 (toList!8940 lt!549570) k0!934)))))

(assert (= (and d!133259 c!119373) b!1210973))

(assert (= (and d!133259 (not c!119373)) b!1210974))

(assert (= (and d!133259 (not res!804550)) b!1210975))

(declare-fun m!1116001 () Bool)

(assert (=> d!133259 m!1116001))

(declare-fun m!1116003 () Bool)

(assert (=> b!1210973 m!1116003))

(declare-fun m!1116005 () Bool)

(assert (=> b!1210973 m!1116005))

(assert (=> b!1210973 m!1116005))

(declare-fun m!1116007 () Bool)

(assert (=> b!1210973 m!1116007))

(assert (=> b!1210975 m!1116005))

(assert (=> b!1210975 m!1116005))

(assert (=> b!1210975 m!1116007))

(assert (=> b!1210616 d!133259))

(declare-fun d!133261 () Bool)

(declare-fun res!804552 () Bool)

(declare-fun e!687728 () Bool)

(assert (=> d!133261 (=> res!804552 e!687728)))

(assert (=> d!133261 (= res!804552 (bvsge #b00000000000000000000000000000000 (size!38251 _keys!1208)))))

(assert (=> d!133261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!687728)))

(declare-fun b!1210976 () Bool)

(declare-fun e!687727 () Bool)

(declare-fun e!687729 () Bool)

(assert (=> b!1210976 (= e!687727 e!687729)))

(declare-fun lt!549827 () (_ BitVec 64))

(assert (=> b!1210976 (= lt!549827 (select (arr!37713 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!549828 () Unit!39971)

(assert (=> b!1210976 (= lt!549828 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!549827 #b00000000000000000000000000000000))))

(assert (=> b!1210976 (arrayContainsKey!0 _keys!1208 lt!549827 #b00000000000000000000000000000000)))

(declare-fun lt!549826 () Unit!39971)

(assert (=> b!1210976 (= lt!549826 lt!549828)))

(declare-fun res!804551 () Bool)

(assert (=> b!1210976 (= res!804551 (= (seekEntryOrOpen!0 (select (arr!37713 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9940 #b00000000000000000000000000000000)))))

(assert (=> b!1210976 (=> (not res!804551) (not e!687729))))

(declare-fun b!1210977 () Bool)

(assert (=> b!1210977 (= e!687728 e!687727)))

(declare-fun c!119374 () Bool)

(assert (=> b!1210977 (= c!119374 (validKeyInArray!0 (select (arr!37713 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!59765 () Bool)

(declare-fun call!59768 () Bool)

(assert (=> bm!59765 (= call!59768 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1210978 () Bool)

(assert (=> b!1210978 (= e!687727 call!59768)))

(declare-fun b!1210979 () Bool)

(assert (=> b!1210979 (= e!687729 call!59768)))

(assert (= (and d!133261 (not res!804552)) b!1210977))

(assert (= (and b!1210977 c!119374) b!1210976))

(assert (= (and b!1210977 (not c!119374)) b!1210978))

(assert (= (and b!1210976 res!804551) b!1210979))

(assert (= (or b!1210979 b!1210978) bm!59765))

(assert (=> b!1210976 m!1115903))

(declare-fun m!1116009 () Bool)

(assert (=> b!1210976 m!1116009))

(declare-fun m!1116011 () Bool)

(assert (=> b!1210976 m!1116011))

(assert (=> b!1210976 m!1115903))

(declare-fun m!1116013 () Bool)

(assert (=> b!1210976 m!1116013))

(assert (=> b!1210977 m!1115903))

(assert (=> b!1210977 m!1115903))

(assert (=> b!1210977 m!1115905))

(declare-fun m!1116015 () Bool)

(assert (=> bm!59765 m!1116015))

(assert (=> b!1210615 d!133261))

(declare-fun e!687735 () Bool)

(declare-fun lt!549831 () ListLongMap!17849)

(declare-fun b!1210980 () Bool)

(assert (=> b!1210980 (= e!687735 (= lt!549831 (getCurrentListMapNoExtraKeys!5382 lt!549575 lt!549578 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133263 () Bool)

(declare-fun e!687731 () Bool)

(assert (=> d!133263 e!687731))

(declare-fun res!804554 () Bool)

(assert (=> d!133263 (=> (not res!804554) (not e!687731))))

(assert (=> d!133263 (= res!804554 (not (contains!6947 lt!549831 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!687732 () ListLongMap!17849)

(assert (=> d!133263 (= lt!549831 e!687732)))

(declare-fun c!119378 () Bool)

(assert (=> d!133263 (= c!119378 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 lt!549575)))))

(assert (=> d!133263 (validMask!0 mask!1564)))

(assert (=> d!133263 (= (getCurrentListMapNoExtraKeys!5382 lt!549575 lt!549578 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!549831)))

(declare-fun b!1210981 () Bool)

(declare-fun e!687733 () Bool)

(declare-fun e!687734 () Bool)

(assert (=> b!1210981 (= e!687733 e!687734)))

(assert (=> b!1210981 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 lt!549575)))))

(declare-fun res!804553 () Bool)

(assert (=> b!1210981 (= res!804553 (contains!6947 lt!549831 (select (arr!37713 lt!549575) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1210981 (=> (not res!804553) (not e!687734))))

(declare-fun b!1210982 () Bool)

(assert (=> b!1210982 (= e!687735 (isEmpty!997 lt!549831))))

(declare-fun b!1210983 () Bool)

(declare-fun e!687730 () ListLongMap!17849)

(declare-fun call!59769 () ListLongMap!17849)

(assert (=> b!1210983 (= e!687730 call!59769)))

(declare-fun b!1210984 () Bool)

(declare-fun e!687736 () Bool)

(assert (=> b!1210984 (= e!687736 (validKeyInArray!0 (select (arr!37713 lt!549575) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1210984 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!59766 () Bool)

(assert (=> bm!59766 (= call!59769 (getCurrentListMapNoExtraKeys!5382 lt!549575 lt!549578 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1210985 () Bool)

(declare-fun res!804556 () Bool)

(assert (=> b!1210985 (=> (not res!804556) (not e!687731))))

(assert (=> b!1210985 (= res!804556 (not (contains!6947 lt!549831 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1210986 () Bool)

(assert (=> b!1210986 (= e!687732 (ListLongMap!17850 Nil!26655))))

(declare-fun b!1210987 () Bool)

(assert (=> b!1210987 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 lt!549575)))))

(assert (=> b!1210987 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 lt!549578)))))

(assert (=> b!1210987 (= e!687734 (= (apply!961 lt!549831 (select (arr!37713 lt!549575) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19233 (select (arr!37714 lt!549578) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1210988 () Bool)

(assert (=> b!1210988 (= e!687731 e!687733)))

(declare-fun c!119377 () Bool)

(assert (=> b!1210988 (= c!119377 e!687736)))

(declare-fun res!804555 () Bool)

(assert (=> b!1210988 (=> (not res!804555) (not e!687736))))

(assert (=> b!1210988 (= res!804555 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 lt!549575)))))

(declare-fun b!1210989 () Bool)

(assert (=> b!1210989 (= e!687733 e!687735)))

(declare-fun c!119375 () Bool)

(assert (=> b!1210989 (= c!119375 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38251 lt!549575)))))

(declare-fun b!1210990 () Bool)

(declare-fun lt!549832 () Unit!39971)

(declare-fun lt!549830 () Unit!39971)

(assert (=> b!1210990 (= lt!549832 lt!549830)))

(declare-fun lt!549835 () (_ BitVec 64))

(declare-fun lt!549834 () (_ BitVec 64))

(declare-fun lt!549833 () V!46097)

(declare-fun lt!549829 () ListLongMap!17849)

(assert (=> b!1210990 (not (contains!6947 (+!4063 lt!549829 (tuple2!19881 lt!549834 lt!549833)) lt!549835))))

(assert (=> b!1210990 (= lt!549830 (addStillNotContains!297 lt!549829 lt!549834 lt!549833 lt!549835))))

(assert (=> b!1210990 (= lt!549835 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1210990 (= lt!549833 (get!19233 (select (arr!37714 lt!549578) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1210990 (= lt!549834 (select (arr!37713 lt!549575) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1210990 (= lt!549829 call!59769)))

(assert (=> b!1210990 (= e!687730 (+!4063 call!59769 (tuple2!19881 (select (arr!37713 lt!549575) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37714 lt!549578) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1210991 () Bool)

(assert (=> b!1210991 (= e!687732 e!687730)))

(declare-fun c!119376 () Bool)

(assert (=> b!1210991 (= c!119376 (validKeyInArray!0 (select (arr!37713 lt!549575) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!133263 c!119378) b!1210986))

(assert (= (and d!133263 (not c!119378)) b!1210991))

(assert (= (and b!1210991 c!119376) b!1210990))

(assert (= (and b!1210991 (not c!119376)) b!1210983))

(assert (= (or b!1210990 b!1210983) bm!59766))

(assert (= (and d!133263 res!804554) b!1210985))

(assert (= (and b!1210985 res!804556) b!1210988))

(assert (= (and b!1210988 res!804555) b!1210984))

(assert (= (and b!1210988 c!119377) b!1210981))

(assert (= (and b!1210988 (not c!119377)) b!1210989))

(assert (= (and b!1210981 res!804553) b!1210987))

(assert (= (and b!1210989 c!119375) b!1210980))

(assert (= (and b!1210989 (not c!119375)) b!1210982))

(declare-fun b_lambda!21619 () Bool)

(assert (=> (not b_lambda!21619) (not b!1210987)))

(assert (=> b!1210987 t!39651))

(declare-fun b_and!43127 () Bool)

(assert (= b_and!43125 (and (=> t!39651 result!22231) b_and!43127)))

(declare-fun b_lambda!21621 () Bool)

(assert (=> (not b_lambda!21621) (not b!1210990)))

(assert (=> b!1210990 t!39651))

(declare-fun b_and!43129 () Bool)

(assert (= b_and!43127 (and (=> t!39651 result!22231) b_and!43129)))

(declare-fun m!1116017 () Bool)

(assert (=> b!1210981 m!1116017))

(assert (=> b!1210981 m!1116017))

(declare-fun m!1116019 () Bool)

(assert (=> b!1210981 m!1116019))

(assert (=> b!1210984 m!1116017))

(assert (=> b!1210984 m!1116017))

(declare-fun m!1116021 () Bool)

(assert (=> b!1210984 m!1116021))

(declare-fun m!1116023 () Bool)

(assert (=> b!1210982 m!1116023))

(assert (=> b!1210991 m!1116017))

(assert (=> b!1210991 m!1116017))

(assert (=> b!1210991 m!1116021))

(declare-fun m!1116025 () Bool)

(assert (=> b!1210985 m!1116025))

(declare-fun m!1116027 () Bool)

(assert (=> d!133263 m!1116027))

(assert (=> d!133263 m!1115553))

(assert (=> b!1210987 m!1115559))

(assert (=> b!1210987 m!1116017))

(declare-fun m!1116029 () Bool)

(assert (=> b!1210987 m!1116029))

(assert (=> b!1210987 m!1116017))

(declare-fun m!1116031 () Bool)

(assert (=> b!1210987 m!1116031))

(assert (=> b!1210987 m!1116031))

(assert (=> b!1210987 m!1115559))

(declare-fun m!1116033 () Bool)

(assert (=> b!1210987 m!1116033))

(declare-fun m!1116035 () Bool)

(assert (=> bm!59766 m!1116035))

(assert (=> b!1210990 m!1115559))

(assert (=> b!1210990 m!1116017))

(assert (=> b!1210990 m!1116031))

(declare-fun m!1116037 () Bool)

(assert (=> b!1210990 m!1116037))

(declare-fun m!1116039 () Bool)

(assert (=> b!1210990 m!1116039))

(declare-fun m!1116041 () Bool)

(assert (=> b!1210990 m!1116041))

(assert (=> b!1210990 m!1116031))

(assert (=> b!1210990 m!1115559))

(assert (=> b!1210990 m!1116033))

(assert (=> b!1210990 m!1116037))

(declare-fun m!1116043 () Bool)

(assert (=> b!1210990 m!1116043))

(assert (=> b!1210980 m!1116035))

(assert (=> bm!59695 d!133263))

(declare-fun d!133265 () Bool)

(declare-fun lt!549836 () ListLongMap!17849)

(assert (=> d!133265 (not (contains!6947 lt!549836 k0!934))))

(assert (=> d!133265 (= lt!549836 (ListLongMap!17850 (removeStrictlySorted!101 (toList!8940 call!59700) k0!934)))))

(assert (=> d!133265 (= (-!1819 call!59700 k0!934) lt!549836)))

(declare-fun bs!34171 () Bool)

(assert (= bs!34171 d!133265))

(declare-fun m!1116045 () Bool)

(assert (=> bs!34171 m!1116045))

(declare-fun m!1116047 () Bool)

(assert (=> bs!34171 m!1116047))

(assert (=> b!1210623 d!133265))

(declare-fun b!1210998 () Bool)

(declare-fun e!687741 () Bool)

(assert (=> b!1210998 (= e!687741 tp_is_empty!30727)))

(declare-fun mapNonEmpty!47968 () Bool)

(declare-fun mapRes!47968 () Bool)

(declare-fun tp!91100 () Bool)

(assert (=> mapNonEmpty!47968 (= mapRes!47968 (and tp!91100 e!687741))))

(declare-fun mapKey!47968 () (_ BitVec 32))

(declare-fun mapValue!47968 () ValueCell!14654)

(declare-fun mapRest!47968 () (Array (_ BitVec 32) ValueCell!14654))

(assert (=> mapNonEmpty!47968 (= mapRest!47959 (store mapRest!47968 mapKey!47968 mapValue!47968))))

(declare-fun b!1210999 () Bool)

(declare-fun e!687742 () Bool)

(assert (=> b!1210999 (= e!687742 tp_is_empty!30727)))

(declare-fun condMapEmpty!47968 () Bool)

(declare-fun mapDefault!47968 () ValueCell!14654)

(assert (=> mapNonEmpty!47959 (= condMapEmpty!47968 (= mapRest!47959 ((as const (Array (_ BitVec 32) ValueCell!14654)) mapDefault!47968)))))

(assert (=> mapNonEmpty!47959 (= tp!91084 (and e!687742 mapRes!47968))))

(declare-fun mapIsEmpty!47968 () Bool)

(assert (=> mapIsEmpty!47968 mapRes!47968))

(assert (= (and mapNonEmpty!47959 condMapEmpty!47968) mapIsEmpty!47968))

(assert (= (and mapNonEmpty!47959 (not condMapEmpty!47968)) mapNonEmpty!47968))

(assert (= (and mapNonEmpty!47968 ((_ is ValueCellFull!14654) mapValue!47968)) b!1210998))

(assert (= (and mapNonEmpty!47959 ((_ is ValueCellFull!14654) mapDefault!47968)) b!1210999))

(declare-fun m!1116049 () Bool)

(assert (=> mapNonEmpty!47968 m!1116049))

(declare-fun b_lambda!21623 () Bool)

(assert (= b_lambda!21611 (or (and start!101018 b_free!26023) b_lambda!21623)))

(declare-fun b_lambda!21625 () Bool)

(assert (= b_lambda!21613 (or (and start!101018 b_free!26023) b_lambda!21625)))

(declare-fun b_lambda!21627 () Bool)

(assert (= b_lambda!21609 (or (and start!101018 b_free!26023) b_lambda!21627)))

(declare-fun b_lambda!21629 () Bool)

(assert (= b_lambda!21617 (or (and start!101018 b_free!26023) b_lambda!21629)))

(declare-fun b_lambda!21631 () Bool)

(assert (= b_lambda!21615 (or (and start!101018 b_free!26023) b_lambda!21631)))

(declare-fun b_lambda!21633 () Bool)

(assert (= b_lambda!21621 (or (and start!101018 b_free!26023) b_lambda!21633)))

(declare-fun b_lambda!21635 () Bool)

(assert (= b_lambda!21619 (or (and start!101018 b_free!26023) b_lambda!21635)))

(declare-fun b_lambda!21637 () Bool)

(assert (= b_lambda!21605 (or (and start!101018 b_free!26023) b_lambda!21637)))

(declare-fun b_lambda!21639 () Bool)

(assert (= b_lambda!21607 (or (and start!101018 b_free!26023) b_lambda!21639)))

(check-sat (not b!1210838) (not b!1210920) tp_is_empty!30727 (not d!133221) (not b_lambda!21603) (not d!133249) (not b!1210915) (not b!1210934) (not b!1210973) (not bm!59765) (not bm!59749) (not b!1210889) (not d!133265) (not b_lambda!21631) (not b!1210864) (not d!133213) (not b!1210952) (not b!1210982) (not d!133223) (not b!1210923) (not d!133263) (not d!133229) (not b!1210960) (not b!1210976) (not bm!59757) (not b!1210894) (not b!1210918) (not d!133211) (not b_lambda!21635) (not b!1210975) (not d!133251) (not b!1210937) (not b!1210886) (not b!1210971) (not b!1210868) (not b!1210987) (not mapNonEmpty!47968) (not bm!59763) (not b!1210874) (not b!1210949) (not b_lambda!21623) (not b!1210954) (not bm!59756) (not d!133259) (not b!1210903) (not b!1210870) (not b!1210867) (not b!1210933) (not b!1210865) (not b!1210832) (not b!1210939) (not b!1210887) (not bm!59764) (not b!1210964) (not b!1210980) b_and!43129 (not bm!59748) (not b_lambda!21625) (not b!1210880) (not b!1210877) (not b!1210882) (not b_next!26023) (not b!1210955) (not d!133235) (not b!1210879) (not b!1210885) (not b!1210953) (not b!1210898) (not b!1210977) (not d!133257) (not d!133217) (not b_lambda!21639) (not d!133247) (not b!1210830) (not b!1210922) (not bm!59762) (not b!1210985) (not bm!59753) (not b!1210991) (not bm!59752) (not b!1210963) (not b_lambda!21637) (not b!1210873) (not b!1210972) (not d!133225) (not b!1210981) (not d!133255) (not b!1210863) (not b!1210984) (not d!133219) (not b!1210958) (not b!1210876) (not d!133201) (not b!1210895) (not b!1210917) (not b!1210990) (not b!1210957) (not d!133241) (not b_lambda!21633) (not b_lambda!21629) (not d!133245) (not b!1210897) (not bm!59766) (not d!133215) (not b!1210940) (not b!1210969) (not b!1210970) (not b_lambda!21627) (not b!1210875))
(check-sat b_and!43129 (not b_next!26023))
