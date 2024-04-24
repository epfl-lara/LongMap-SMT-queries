; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100914 () Bool)

(assert start!100914)

(declare-fun b_free!25909 () Bool)

(declare-fun b_next!25909 () Bool)

(assert (=> start!100914 (= b_free!25909 (not b_next!25909))))

(declare-fun tp!90724 () Bool)

(declare-fun b_and!42767 () Bool)

(assert (=> start!100914 (= tp!90724 b_and!42767)))

(declare-datatypes ((V!45945 0))(
  ( (V!45946 (val!15363 Int)) )
))
(declare-datatypes ((tuple2!19712 0))(
  ( (tuple2!19713 (_1!9867 (_ BitVec 64)) (_2!9867 V!45945)) )
))
(declare-datatypes ((List!26522 0))(
  ( (Nil!26519) (Cons!26518 (h!27736 tuple2!19712) (t!39403 List!26522)) )
))
(declare-datatypes ((ListLongMap!17689 0))(
  ( (ListLongMap!17690 (toList!8860 List!26522)) )
))
(declare-fun lt!546608 () ListLongMap!17689)

(declare-fun call!58263 () Bool)

(declare-fun c!118461 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!58258 () Bool)

(declare-fun call!58265 () ListLongMap!17689)

(declare-fun contains!6937 (ListLongMap!17689 (_ BitVec 64)) Bool)

(assert (=> bm!58258 (= call!58263 (contains!6937 (ite c!118461 lt!546608 call!58265) k0!934))))

(declare-datatypes ((array!78037 0))(
  ( (array!78038 (arr!37655 (Array (_ BitVec 32) (_ BitVec 64))) (size!38192 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78037)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!684743 () Bool)

(declare-fun b!1205629 () Bool)

(declare-fun arrayContainsKey!0 (array!78037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205629 (= e!684743 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!684749 () Bool)

(assert (=> b!1205629 e!684749))

(declare-fun c!118458 () Bool)

(assert (=> b!1205629 (= c!118458 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!45945)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!39894 0))(
  ( (Unit!39895) )
))
(declare-fun lt!546607 () Unit!39894)

(declare-datatypes ((ValueCell!14597 0))(
  ( (ValueCellFull!14597 (v!18001 V!45945)) (EmptyCell!14597) )
))
(declare-datatypes ((array!78039 0))(
  ( (array!78040 (arr!37656 (Array (_ BitVec 32) ValueCell!14597)) (size!38193 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78039)

(declare-fun minValue!944 () V!45945)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!567 (array!78037 array!78039 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 64) (_ BitVec 32) Int) Unit!39894)

(assert (=> b!1205629 (= lt!546607 (lemmaListMapContainsThenArrayContainsFrom!567 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546617 () Unit!39894)

(declare-fun e!684752 () Unit!39894)

(assert (=> b!1205629 (= lt!546617 e!684752)))

(declare-fun lt!546610 () Bool)

(assert (=> b!1205629 (= c!118461 (and (not lt!546610) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205629 (= lt!546610 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205630 () Bool)

(declare-fun e!684755 () Bool)

(declare-fun e!684744 () Bool)

(assert (=> b!1205630 (= e!684755 e!684744)))

(declare-fun res!801769 () Bool)

(assert (=> b!1205630 (=> (not res!801769) (not e!684744))))

(declare-fun lt!546605 () array!78037)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78037 (_ BitVec 32)) Bool)

(assert (=> b!1205630 (= res!801769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546605 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205630 (= lt!546605 (array!78038 (store (arr!37655 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)))))

(declare-fun c!118460 () Bool)

(declare-fun bm!58259 () Bool)

(declare-fun call!58261 () ListLongMap!17689)

(declare-fun lt!546612 () array!78039)

(declare-fun getCurrentListMapNoExtraKeys!5326 (array!78037 array!78039 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 32) Int) ListLongMap!17689)

(assert (=> bm!58259 (= call!58261 (getCurrentListMapNoExtraKeys!5326 (ite c!118460 _keys!1208 lt!546605) (ite c!118460 _values!996 lt!546612) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58260 () Bool)

(declare-fun call!58266 () Unit!39894)

(declare-fun call!58268 () Unit!39894)

(assert (=> bm!58260 (= call!58266 call!58268)))

(declare-fun b!1205631 () Bool)

(declare-fun c!118459 () Bool)

(assert (=> b!1205631 (= c!118459 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546610))))

(declare-fun e!684746 () Unit!39894)

(declare-fun e!684748 () Unit!39894)

(assert (=> b!1205631 (= e!684746 e!684748)))

(declare-fun b!1205632 () Bool)

(declare-fun res!801773 () Bool)

(assert (=> b!1205632 (=> (not res!801773) (not e!684755))))

(assert (=> b!1205632 (= res!801773 (= (select (arr!37655 _keys!1208) i!673) k0!934))))

(declare-fun b!1205633 () Bool)

(assert (=> b!1205633 (= e!684749 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205634 () Bool)

(declare-fun e!684751 () Bool)

(assert (=> b!1205634 (= e!684744 (not e!684751))))

(declare-fun res!801768 () Bool)

(assert (=> b!1205634 (=> res!801768 e!684751)))

(assert (=> b!1205634 (= res!801768 (bvsgt from!1455 i!673))))

(assert (=> b!1205634 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546603 () Unit!39894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78037 (_ BitVec 64) (_ BitVec 32)) Unit!39894)

(assert (=> b!1205634 (= lt!546603 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1205635 () Bool)

(declare-fun e!684747 () Bool)

(declare-fun tp_is_empty!30613 () Bool)

(assert (=> b!1205635 (= e!684747 tp_is_empty!30613)))

(declare-fun b!1205636 () Bool)

(declare-fun lt!546616 () Unit!39894)

(assert (=> b!1205636 (= e!684752 lt!546616)))

(declare-fun lt!546604 () Unit!39894)

(assert (=> b!1205636 (= lt!546604 call!58268)))

(declare-fun lt!546606 () ListLongMap!17689)

(declare-fun +!4026 (ListLongMap!17689 tuple2!19712) ListLongMap!17689)

(assert (=> b!1205636 (= lt!546608 (+!4026 lt!546606 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1205636 call!58263))

(declare-fun addStillContains!1010 (ListLongMap!17689 (_ BitVec 64) V!45945 (_ BitVec 64)) Unit!39894)

(assert (=> b!1205636 (= lt!546616 (addStillContains!1010 lt!546608 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!58267 () ListLongMap!17689)

(assert (=> b!1205636 (contains!6937 call!58267 k0!934)))

(declare-fun b!1205637 () Bool)

(assert (=> b!1205637 (= e!684749 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546610) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1205638 () Bool)

(declare-fun res!801762 () Bool)

(assert (=> b!1205638 (=> (not res!801762) (not e!684755))))

(declare-datatypes ((List!26523 0))(
  ( (Nil!26520) (Cons!26519 (h!27737 (_ BitVec 64)) (t!39404 List!26523)) )
))
(declare-fun arrayNoDuplicates!0 (array!78037 (_ BitVec 32) List!26523) Bool)

(assert (=> b!1205638 (= res!801762 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26520))))

(declare-fun b!1205639 () Bool)

(assert (=> b!1205639 (= e!684752 e!684746)))

(declare-fun c!118457 () Bool)

(assert (=> b!1205639 (= c!118457 (and (not lt!546610) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205640 () Bool)

(declare-fun e!684750 () Bool)

(declare-fun e!684753 () Bool)

(assert (=> b!1205640 (= e!684750 e!684753)))

(declare-fun res!801772 () Bool)

(assert (=> b!1205640 (=> res!801772 e!684753)))

(assert (=> b!1205640 (= res!801772 (not (= (select (arr!37655 _keys!1208) from!1455) k0!934)))))

(declare-fun e!684745 () Bool)

(assert (=> b!1205640 e!684745))

(assert (=> b!1205640 (= c!118460 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546613 () Unit!39894)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1025 (array!78037 array!78039 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39894)

(assert (=> b!1205640 (= lt!546613 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1025 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47769 () Bool)

(declare-fun mapRes!47769 () Bool)

(assert (=> mapIsEmpty!47769 mapRes!47769))

(declare-fun b!1205641 () Bool)

(declare-fun call!58264 () ListLongMap!17689)

(assert (=> b!1205641 (= e!684745 (= call!58261 call!58264))))

(declare-fun b!1205642 () Bool)

(declare-fun res!801760 () Bool)

(assert (=> b!1205642 (=> (not res!801760) (not e!684755))))

(assert (=> b!1205642 (= res!801760 (and (= (size!38193 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38192 _keys!1208) (size!38193 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1205643 () Bool)

(declare-fun call!58262 () Bool)

(assert (=> b!1205643 call!58262))

(declare-fun lt!546611 () Unit!39894)

(assert (=> b!1205643 (= lt!546611 call!58266)))

(assert (=> b!1205643 (= e!684746 lt!546611)))

(declare-fun b!1205644 () Bool)

(declare-fun res!801767 () Bool)

(assert (=> b!1205644 (=> (not res!801767) (not e!684755))))

(assert (=> b!1205644 (= res!801767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47769 () Bool)

(declare-fun tp!90723 () Bool)

(assert (=> mapNonEmpty!47769 (= mapRes!47769 (and tp!90723 e!684747))))

(declare-fun mapValue!47769 () ValueCell!14597)

(declare-fun mapKey!47769 () (_ BitVec 32))

(declare-fun mapRest!47769 () (Array (_ BitVec 32) ValueCell!14597))

(assert (=> mapNonEmpty!47769 (= (arr!37656 _values!996) (store mapRest!47769 mapKey!47769 mapValue!47769))))

(declare-fun res!801764 () Bool)

(assert (=> start!100914 (=> (not res!801764) (not e!684755))))

(assert (=> start!100914 (= res!801764 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38192 _keys!1208))))))

(assert (=> start!100914 e!684755))

(assert (=> start!100914 tp_is_empty!30613))

(declare-fun array_inv!28756 (array!78037) Bool)

(assert (=> start!100914 (array_inv!28756 _keys!1208)))

(assert (=> start!100914 true))

(assert (=> start!100914 tp!90724))

(declare-fun e!684757 () Bool)

(declare-fun array_inv!28757 (array!78039) Bool)

(assert (=> start!100914 (and (array_inv!28757 _values!996) e!684757)))

(declare-fun bm!58261 () Bool)

(assert (=> bm!58261 (= call!58265 call!58267)))

(declare-fun bm!58262 () Bool)

(assert (=> bm!58262 (= call!58264 (getCurrentListMapNoExtraKeys!5326 (ite c!118460 lt!546605 _keys!1208) (ite c!118460 lt!546612 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58263 () Bool)

(assert (=> bm!58263 (= call!58267 (+!4026 (ite c!118461 lt!546608 lt!546606) (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1205645 () Bool)

(declare-fun -!1806 (ListLongMap!17689 (_ BitVec 64)) ListLongMap!17689)

(assert (=> b!1205645 (= e!684745 (= call!58264 (-!1806 call!58261 k0!934)))))

(declare-fun b!1205646 () Bool)

(declare-fun res!801770 () Bool)

(assert (=> b!1205646 (=> (not res!801770) (not e!684755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205646 (= res!801770 (validKeyInArray!0 k0!934))))

(declare-fun bm!58264 () Bool)

(assert (=> bm!58264 (= call!58268 (addStillContains!1010 lt!546606 (ite (or c!118461 c!118457) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118461 c!118457) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1205647 () Bool)

(declare-fun lt!546615 () Unit!39894)

(assert (=> b!1205647 (= e!684748 lt!546615)))

(assert (=> b!1205647 (= lt!546615 call!58266)))

(assert (=> b!1205647 call!58262))

(declare-fun b!1205648 () Bool)

(declare-fun res!801771 () Bool)

(assert (=> b!1205648 (=> (not res!801771) (not e!684744))))

(assert (=> b!1205648 (= res!801771 (arrayNoDuplicates!0 lt!546605 #b00000000000000000000000000000000 Nil!26520))))

(declare-fun bm!58265 () Bool)

(assert (=> bm!58265 (= call!58262 call!58263)))

(declare-fun b!1205649 () Bool)

(declare-fun res!801761 () Bool)

(assert (=> b!1205649 (=> (not res!801761) (not e!684755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205649 (= res!801761 (validMask!0 mask!1564))))

(declare-fun b!1205650 () Bool)

(assert (=> b!1205650 (= e!684751 e!684750)))

(declare-fun res!801765 () Bool)

(assert (=> b!1205650 (=> res!801765 e!684750)))

(assert (=> b!1205650 (= res!801765 (not (= from!1455 i!673)))))

(declare-fun lt!546609 () ListLongMap!17689)

(assert (=> b!1205650 (= lt!546609 (getCurrentListMapNoExtraKeys!5326 lt!546605 lt!546612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3251 (Int (_ BitVec 64)) V!45945)

(assert (=> b!1205650 (= lt!546612 (array!78040 (store (arr!37656 _values!996) i!673 (ValueCellFull!14597 (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996)))))

(declare-fun lt!546614 () ListLongMap!17689)

(assert (=> b!1205650 (= lt!546614 (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205651 () Bool)

(declare-fun e!684756 () Bool)

(assert (=> b!1205651 (= e!684756 tp_is_empty!30613)))

(declare-fun b!1205652 () Bool)

(declare-fun Unit!39896 () Unit!39894)

(assert (=> b!1205652 (= e!684748 Unit!39896)))

(declare-fun b!1205653 () Bool)

(assert (=> b!1205653 (= e!684757 (and e!684756 mapRes!47769))))

(declare-fun condMapEmpty!47769 () Bool)

(declare-fun mapDefault!47769 () ValueCell!14597)

(assert (=> b!1205653 (= condMapEmpty!47769 (= (arr!37656 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14597)) mapDefault!47769)))))

(declare-fun b!1205654 () Bool)

(declare-fun res!801766 () Bool)

(assert (=> b!1205654 (=> (not res!801766) (not e!684755))))

(assert (=> b!1205654 (= res!801766 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38192 _keys!1208))))))

(declare-fun b!1205655 () Bool)

(assert (=> b!1205655 (= e!684753 e!684743)))

(declare-fun res!801763 () Bool)

(assert (=> b!1205655 (=> res!801763 e!684743)))

(assert (=> b!1205655 (= res!801763 (not (contains!6937 lt!546606 k0!934)))))

(assert (=> b!1205655 (= lt!546606 (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100914 res!801764) b!1205649))

(assert (= (and b!1205649 res!801761) b!1205642))

(assert (= (and b!1205642 res!801760) b!1205644))

(assert (= (and b!1205644 res!801767) b!1205638))

(assert (= (and b!1205638 res!801762) b!1205654))

(assert (= (and b!1205654 res!801766) b!1205646))

(assert (= (and b!1205646 res!801770) b!1205632))

(assert (= (and b!1205632 res!801773) b!1205630))

(assert (= (and b!1205630 res!801769) b!1205648))

(assert (= (and b!1205648 res!801771) b!1205634))

(assert (= (and b!1205634 (not res!801768)) b!1205650))

(assert (= (and b!1205650 (not res!801765)) b!1205640))

(assert (= (and b!1205640 c!118460) b!1205645))

(assert (= (and b!1205640 (not c!118460)) b!1205641))

(assert (= (or b!1205645 b!1205641) bm!58259))

(assert (= (or b!1205645 b!1205641) bm!58262))

(assert (= (and b!1205640 (not res!801772)) b!1205655))

(assert (= (and b!1205655 (not res!801763)) b!1205629))

(assert (= (and b!1205629 c!118461) b!1205636))

(assert (= (and b!1205629 (not c!118461)) b!1205639))

(assert (= (and b!1205639 c!118457) b!1205643))

(assert (= (and b!1205639 (not c!118457)) b!1205631))

(assert (= (and b!1205631 c!118459) b!1205647))

(assert (= (and b!1205631 (not c!118459)) b!1205652))

(assert (= (or b!1205643 b!1205647) bm!58260))

(assert (= (or b!1205643 b!1205647) bm!58261))

(assert (= (or b!1205643 b!1205647) bm!58265))

(assert (= (or b!1205636 bm!58265) bm!58258))

(assert (= (or b!1205636 bm!58260) bm!58264))

(assert (= (or b!1205636 bm!58261) bm!58263))

(assert (= (and b!1205629 c!118458) b!1205633))

(assert (= (and b!1205629 (not c!118458)) b!1205637))

(assert (= (and b!1205653 condMapEmpty!47769) mapIsEmpty!47769))

(assert (= (and b!1205653 (not condMapEmpty!47769)) mapNonEmpty!47769))

(get-info :version)

(assert (= (and mapNonEmpty!47769 ((_ is ValueCellFull!14597) mapValue!47769)) b!1205635))

(assert (= (and b!1205653 ((_ is ValueCellFull!14597) mapDefault!47769)) b!1205651))

(assert (= start!100914 b!1205653))

(declare-fun b_lambda!21223 () Bool)

(assert (=> (not b_lambda!21223) (not b!1205650)))

(declare-fun t!39402 () Bool)

(declare-fun tb!10701 () Bool)

(assert (=> (and start!100914 (= defaultEntry!1004 defaultEntry!1004) t!39402) tb!10701))

(declare-fun result!21991 () Bool)

(assert (=> tb!10701 (= result!21991 tp_is_empty!30613)))

(assert (=> b!1205650 t!39402))

(declare-fun b_and!42769 () Bool)

(assert (= b_and!42767 (and (=> t!39402 result!21991) b_and!42769)))

(declare-fun m!1111903 () Bool)

(assert (=> b!1205630 m!1111903))

(declare-fun m!1111905 () Bool)

(assert (=> b!1205630 m!1111905))

(declare-fun m!1111907 () Bool)

(assert (=> b!1205646 m!1111907))

(declare-fun m!1111909 () Bool)

(assert (=> b!1205648 m!1111909))

(declare-fun m!1111911 () Bool)

(assert (=> bm!58263 m!1111911))

(declare-fun m!1111913 () Bool)

(assert (=> bm!58264 m!1111913))

(declare-fun m!1111915 () Bool)

(assert (=> b!1205632 m!1111915))

(declare-fun m!1111917 () Bool)

(assert (=> b!1205640 m!1111917))

(declare-fun m!1111919 () Bool)

(assert (=> b!1205640 m!1111919))

(declare-fun m!1111921 () Bool)

(assert (=> bm!58262 m!1111921))

(declare-fun m!1111923 () Bool)

(assert (=> b!1205638 m!1111923))

(declare-fun m!1111925 () Bool)

(assert (=> b!1205655 m!1111925))

(declare-fun m!1111927 () Bool)

(assert (=> b!1205655 m!1111927))

(declare-fun m!1111929 () Bool)

(assert (=> b!1205636 m!1111929))

(declare-fun m!1111931 () Bool)

(assert (=> b!1205636 m!1111931))

(declare-fun m!1111933 () Bool)

(assert (=> b!1205636 m!1111933))

(declare-fun m!1111935 () Bool)

(assert (=> b!1205649 m!1111935))

(declare-fun m!1111937 () Bool)

(assert (=> mapNonEmpty!47769 m!1111937))

(declare-fun m!1111939 () Bool)

(assert (=> start!100914 m!1111939))

(declare-fun m!1111941 () Bool)

(assert (=> start!100914 m!1111941))

(declare-fun m!1111943 () Bool)

(assert (=> b!1205634 m!1111943))

(declare-fun m!1111945 () Bool)

(assert (=> b!1205634 m!1111945))

(declare-fun m!1111947 () Bool)

(assert (=> b!1205644 m!1111947))

(declare-fun m!1111949 () Bool)

(assert (=> bm!58258 m!1111949))

(declare-fun m!1111951 () Bool)

(assert (=> b!1205650 m!1111951))

(declare-fun m!1111953 () Bool)

(assert (=> b!1205650 m!1111953))

(declare-fun m!1111955 () Bool)

(assert (=> b!1205650 m!1111955))

(declare-fun m!1111957 () Bool)

(assert (=> b!1205650 m!1111957))

(declare-fun m!1111959 () Bool)

(assert (=> b!1205633 m!1111959))

(assert (=> b!1205629 m!1111959))

(declare-fun m!1111961 () Bool)

(assert (=> b!1205629 m!1111961))

(declare-fun m!1111963 () Bool)

(assert (=> b!1205645 m!1111963))

(declare-fun m!1111965 () Bool)

(assert (=> bm!58259 m!1111965))

(check-sat (not b!1205629) (not b!1205650) (not b!1205636) (not bm!58263) (not bm!58258) (not start!100914) (not b!1205655) (not bm!58264) (not b!1205644) (not mapNonEmpty!47769) (not b!1205648) (not b_next!25909) tp_is_empty!30613 b_and!42769 (not b!1205638) (not b!1205630) (not b!1205634) (not b!1205649) (not b_lambda!21223) (not b!1205646) (not bm!58259) (not b!1205645) (not b!1205640) (not b!1205633) (not bm!58262))
(check-sat b_and!42769 (not b_next!25909))
(get-model)

(declare-fun b_lambda!21229 () Bool)

(assert (= b_lambda!21223 (or (and start!100914 b_free!25909) b_lambda!21229)))

(check-sat (not b!1205629) (not b!1205650) (not b!1205636) (not bm!58263) (not bm!58258) (not start!100914) (not b!1205655) (not bm!58264) (not b!1205644) (not b!1205649) (not mapNonEmpty!47769) (not b!1205648) (not b_next!25909) tp_is_empty!30613 b_and!42769 (not b!1205638) (not b!1205630) (not b!1205634) (not b!1205646) (not bm!58259) (not b!1205645) (not b!1205640) (not b_lambda!21229) (not b!1205633) (not bm!58262))
(check-sat b_and!42769 (not b_next!25909))
(get-model)

(declare-fun b!1205830 () Bool)

(declare-fun e!684852 () Bool)

(declare-fun call!58322 () ListLongMap!17689)

(declare-fun call!58321 () ListLongMap!17689)

(assert (=> b!1205830 (= e!684852 (= call!58322 call!58321))))

(assert (=> b!1205830 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38193 _values!996)))))

(declare-fun d!133223 () Bool)

(declare-fun e!684853 () Bool)

(assert (=> d!133223 e!684853))

(declare-fun res!801860 () Bool)

(assert (=> d!133223 (=> (not res!801860) (not e!684853))))

(assert (=> d!133223 (= res!801860 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38192 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38192 _keys!1208))))))))

(declare-fun lt!546710 () Unit!39894)

(declare-fun choose!1797 (array!78037 array!78039 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39894)

(assert (=> d!133223 (= lt!546710 (choose!1797 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133223 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(assert (=> d!133223 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1025 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546710)))

(declare-fun b!1205831 () Bool)

(assert (=> b!1205831 (= e!684852 (= call!58322 (-!1806 call!58321 k0!934)))))

(assert (=> b!1205831 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38193 _values!996)))))

(declare-fun bm!58318 () Bool)

(assert (=> bm!58318 (= call!58321 (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58319 () Bool)

(assert (=> bm!58319 (= call!58322 (getCurrentListMapNoExtraKeys!5326 (array!78038 (store (arr!37655 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38192 _keys!1208)) (array!78040 (store (arr!37656 _values!996) i!673 (ValueCellFull!14597 (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38193 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205832 () Bool)

(assert (=> b!1205832 (= e!684853 e!684852)))

(declare-fun c!118494 () Bool)

(assert (=> b!1205832 (= c!118494 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!133223 res!801860) b!1205832))

(assert (= (and b!1205832 c!118494) b!1205831))

(assert (= (and b!1205832 (not c!118494)) b!1205830))

(assert (= (or b!1205831 b!1205830) bm!58318))

(assert (= (or b!1205831 b!1205830) bm!58319))

(declare-fun b_lambda!21231 () Bool)

(assert (=> (not b_lambda!21231) (not bm!58319)))

(assert (=> bm!58319 t!39402))

(declare-fun b_and!42779 () Bool)

(assert (= b_and!42769 (and (=> t!39402 result!21991) b_and!42779)))

(declare-fun m!1112091 () Bool)

(assert (=> d!133223 m!1112091))

(declare-fun m!1112093 () Bool)

(assert (=> b!1205831 m!1112093))

(assert (=> bm!58318 m!1111927))

(assert (=> bm!58319 m!1111905))

(assert (=> bm!58319 m!1111953))

(assert (=> bm!58319 m!1111955))

(declare-fun m!1112095 () Bool)

(assert (=> bm!58319 m!1112095))

(assert (=> b!1205640 d!133223))

(declare-fun d!133225 () Bool)

(assert (=> d!133225 (contains!6937 (+!4026 lt!546606 (tuple2!19713 (ite (or c!118461 c!118457) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118461 c!118457) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!546713 () Unit!39894)

(declare-fun choose!1798 (ListLongMap!17689 (_ BitVec 64) V!45945 (_ BitVec 64)) Unit!39894)

(assert (=> d!133225 (= lt!546713 (choose!1798 lt!546606 (ite (or c!118461 c!118457) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118461 c!118457) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!133225 (contains!6937 lt!546606 k0!934)))

(assert (=> d!133225 (= (addStillContains!1010 lt!546606 (ite (or c!118461 c!118457) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118461 c!118457) zeroValue!944 minValue!944) k0!934) lt!546713)))

(declare-fun bs!34107 () Bool)

(assert (= bs!34107 d!133225))

(declare-fun m!1112097 () Bool)

(assert (=> bs!34107 m!1112097))

(assert (=> bs!34107 m!1112097))

(declare-fun m!1112099 () Bool)

(assert (=> bs!34107 m!1112099))

(declare-fun m!1112101 () Bool)

(assert (=> bs!34107 m!1112101))

(assert (=> bs!34107 m!1111925))

(assert (=> bm!58264 d!133225))

(declare-fun d!133227 () Bool)

(assert (=> d!133227 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1205646 d!133227))

(declare-fun d!133229 () Bool)

(declare-fun e!684858 () Bool)

(assert (=> d!133229 e!684858))

(declare-fun res!801863 () Bool)

(assert (=> d!133229 (=> res!801863 e!684858)))

(declare-fun lt!546724 () Bool)

(assert (=> d!133229 (= res!801863 (not lt!546724))))

(declare-fun lt!546723 () Bool)

(assert (=> d!133229 (= lt!546724 lt!546723)))

(declare-fun lt!546725 () Unit!39894)

(declare-fun e!684859 () Unit!39894)

(assert (=> d!133229 (= lt!546725 e!684859)))

(declare-fun c!118497 () Bool)

(assert (=> d!133229 (= c!118497 lt!546723)))

(declare-fun containsKey!591 (List!26522 (_ BitVec 64)) Bool)

(assert (=> d!133229 (= lt!546723 (containsKey!591 (toList!8860 lt!546606) k0!934))))

(assert (=> d!133229 (= (contains!6937 lt!546606 k0!934) lt!546724)))

(declare-fun b!1205840 () Bool)

(declare-fun lt!546722 () Unit!39894)

(assert (=> b!1205840 (= e!684859 lt!546722)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!419 (List!26522 (_ BitVec 64)) Unit!39894)

(assert (=> b!1205840 (= lt!546722 (lemmaContainsKeyImpliesGetValueByKeyDefined!419 (toList!8860 lt!546606) k0!934))))

(declare-datatypes ((Option!680 0))(
  ( (Some!679 (v!18004 V!45945)) (None!678) )
))
(declare-fun isDefined!457 (Option!680) Bool)

(declare-fun getValueByKey!629 (List!26522 (_ BitVec 64)) Option!680)

(assert (=> b!1205840 (isDefined!457 (getValueByKey!629 (toList!8860 lt!546606) k0!934))))

(declare-fun b!1205841 () Bool)

(declare-fun Unit!39901 () Unit!39894)

(assert (=> b!1205841 (= e!684859 Unit!39901)))

(declare-fun b!1205842 () Bool)

(assert (=> b!1205842 (= e!684858 (isDefined!457 (getValueByKey!629 (toList!8860 lt!546606) k0!934)))))

(assert (= (and d!133229 c!118497) b!1205840))

(assert (= (and d!133229 (not c!118497)) b!1205841))

(assert (= (and d!133229 (not res!801863)) b!1205842))

(declare-fun m!1112103 () Bool)

(assert (=> d!133229 m!1112103))

(declare-fun m!1112105 () Bool)

(assert (=> b!1205840 m!1112105))

(declare-fun m!1112107 () Bool)

(assert (=> b!1205840 m!1112107))

(assert (=> b!1205840 m!1112107))

(declare-fun m!1112109 () Bool)

(assert (=> b!1205840 m!1112109))

(assert (=> b!1205842 m!1112107))

(assert (=> b!1205842 m!1112107))

(assert (=> b!1205842 m!1112109))

(assert (=> b!1205655 d!133229))

(declare-fun b!1205867 () Bool)

(declare-fun e!684874 () Bool)

(assert (=> b!1205867 (= e!684874 (validKeyInArray!0 (select (arr!37655 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205867 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!133231 () Bool)

(declare-fun e!684880 () Bool)

(assert (=> d!133231 e!684880))

(declare-fun res!801874 () Bool)

(assert (=> d!133231 (=> (not res!801874) (not e!684880))))

(declare-fun lt!546743 () ListLongMap!17689)

(assert (=> d!133231 (= res!801874 (not (contains!6937 lt!546743 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!684877 () ListLongMap!17689)

(assert (=> d!133231 (= lt!546743 e!684877)))

(declare-fun c!118506 () Bool)

(assert (=> d!133231 (= c!118506 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(assert (=> d!133231 (validMask!0 mask!1564)))

(assert (=> d!133231 (= (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546743)))

(declare-fun b!1205868 () Bool)

(assert (=> b!1205868 (= e!684877 (ListLongMap!17690 Nil!26519))))

(declare-fun b!1205869 () Bool)

(declare-fun e!684878 () Bool)

(assert (=> b!1205869 (= e!684880 e!684878)))

(declare-fun c!118508 () Bool)

(assert (=> b!1205869 (= c!118508 e!684874)))

(declare-fun res!801872 () Bool)

(assert (=> b!1205869 (=> (not res!801872) (not e!684874))))

(assert (=> b!1205869 (= res!801872 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(declare-fun b!1205870 () Bool)

(assert (=> b!1205870 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(assert (=> b!1205870 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38193 _values!996)))))

(declare-fun e!684875 () Bool)

(declare-fun apply!971 (ListLongMap!17689 (_ BitVec 64)) V!45945)

(declare-fun get!19242 (ValueCell!14597 V!45945) V!45945)

(assert (=> b!1205870 (= e!684875 (= (apply!971 lt!546743 (select (arr!37655 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19242 (select (arr!37656 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!58325 () ListLongMap!17689)

(declare-fun bm!58322 () Bool)

(assert (=> bm!58322 (= call!58325 (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205871 () Bool)

(declare-fun lt!546740 () Unit!39894)

(declare-fun lt!546742 () Unit!39894)

(assert (=> b!1205871 (= lt!546740 lt!546742)))

(declare-fun lt!546746 () V!45945)

(declare-fun lt!546745 () (_ BitVec 64))

(declare-fun lt!546744 () ListLongMap!17689)

(declare-fun lt!546741 () (_ BitVec 64))

(assert (=> b!1205871 (not (contains!6937 (+!4026 lt!546744 (tuple2!19713 lt!546745 lt!546746)) lt!546741))))

(declare-fun addStillNotContains!292 (ListLongMap!17689 (_ BitVec 64) V!45945 (_ BitVec 64)) Unit!39894)

(assert (=> b!1205871 (= lt!546742 (addStillNotContains!292 lt!546744 lt!546745 lt!546746 lt!546741))))

(assert (=> b!1205871 (= lt!546741 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205871 (= lt!546746 (get!19242 (select (arr!37656 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205871 (= lt!546745 (select (arr!37655 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1205871 (= lt!546744 call!58325)))

(declare-fun e!684879 () ListLongMap!17689)

(assert (=> b!1205871 (= e!684879 (+!4026 call!58325 (tuple2!19713 (select (arr!37655 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19242 (select (arr!37656 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205872 () Bool)

(assert (=> b!1205872 (= e!684879 call!58325)))

(declare-fun b!1205873 () Bool)

(assert (=> b!1205873 (= e!684878 e!684875)))

(assert (=> b!1205873 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(declare-fun res!801873 () Bool)

(assert (=> b!1205873 (= res!801873 (contains!6937 lt!546743 (select (arr!37655 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205873 (=> (not res!801873) (not e!684875))))

(declare-fun b!1205874 () Bool)

(declare-fun e!684876 () Bool)

(assert (=> b!1205874 (= e!684876 (= lt!546743 (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205875 () Bool)

(declare-fun isEmpty!988 (ListLongMap!17689) Bool)

(assert (=> b!1205875 (= e!684876 (isEmpty!988 lt!546743))))

(declare-fun b!1205876 () Bool)

(declare-fun res!801875 () Bool)

(assert (=> b!1205876 (=> (not res!801875) (not e!684880))))

(assert (=> b!1205876 (= res!801875 (not (contains!6937 lt!546743 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1205877 () Bool)

(assert (=> b!1205877 (= e!684877 e!684879)))

(declare-fun c!118509 () Bool)

(assert (=> b!1205877 (= c!118509 (validKeyInArray!0 (select (arr!37655 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1205878 () Bool)

(assert (=> b!1205878 (= e!684878 e!684876)))

(declare-fun c!118507 () Bool)

(assert (=> b!1205878 (= c!118507 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 _keys!1208)))))

(assert (= (and d!133231 c!118506) b!1205868))

(assert (= (and d!133231 (not c!118506)) b!1205877))

(assert (= (and b!1205877 c!118509) b!1205871))

(assert (= (and b!1205877 (not c!118509)) b!1205872))

(assert (= (or b!1205871 b!1205872) bm!58322))

(assert (= (and d!133231 res!801874) b!1205876))

(assert (= (and b!1205876 res!801875) b!1205869))

(assert (= (and b!1205869 res!801872) b!1205867))

(assert (= (and b!1205869 c!118508) b!1205873))

(assert (= (and b!1205869 (not c!118508)) b!1205878))

(assert (= (and b!1205873 res!801873) b!1205870))

(assert (= (and b!1205878 c!118507) b!1205874))

(assert (= (and b!1205878 (not c!118507)) b!1205875))

(declare-fun b_lambda!21233 () Bool)

(assert (=> (not b_lambda!21233) (not b!1205870)))

(assert (=> b!1205870 t!39402))

(declare-fun b_and!42781 () Bool)

(assert (= b_and!42779 (and (=> t!39402 result!21991) b_and!42781)))

(declare-fun b_lambda!21235 () Bool)

(assert (=> (not b_lambda!21235) (not b!1205871)))

(assert (=> b!1205871 t!39402))

(declare-fun b_and!42783 () Bool)

(assert (= b_and!42781 (and (=> t!39402 result!21991) b_and!42783)))

(declare-fun m!1112111 () Bool)

(assert (=> b!1205875 m!1112111))

(declare-fun m!1112113 () Bool)

(assert (=> bm!58322 m!1112113))

(declare-fun m!1112115 () Bool)

(assert (=> b!1205876 m!1112115))

(assert (=> b!1205871 m!1111953))

(declare-fun m!1112117 () Bool)

(assert (=> b!1205871 m!1112117))

(declare-fun m!1112119 () Bool)

(assert (=> b!1205871 m!1112119))

(assert (=> b!1205871 m!1112117))

(declare-fun m!1112121 () Bool)

(assert (=> b!1205871 m!1112121))

(declare-fun m!1112123 () Bool)

(assert (=> b!1205871 m!1112123))

(declare-fun m!1112125 () Bool)

(assert (=> b!1205871 m!1112125))

(assert (=> b!1205871 m!1111953))

(declare-fun m!1112127 () Bool)

(assert (=> b!1205871 m!1112127))

(declare-fun m!1112129 () Bool)

(assert (=> b!1205871 m!1112129))

(assert (=> b!1205871 m!1112125))

(assert (=> b!1205877 m!1112129))

(assert (=> b!1205877 m!1112129))

(declare-fun m!1112131 () Bool)

(assert (=> b!1205877 m!1112131))

(assert (=> b!1205867 m!1112129))

(assert (=> b!1205867 m!1112129))

(assert (=> b!1205867 m!1112131))

(assert (=> b!1205870 m!1111953))

(assert (=> b!1205870 m!1112129))

(declare-fun m!1112133 () Bool)

(assert (=> b!1205870 m!1112133))

(assert (=> b!1205870 m!1112125))

(assert (=> b!1205870 m!1111953))

(assert (=> b!1205870 m!1112127))

(assert (=> b!1205870 m!1112129))

(assert (=> b!1205870 m!1112125))

(assert (=> b!1205874 m!1112113))

(declare-fun m!1112135 () Bool)

(assert (=> d!133231 m!1112135))

(assert (=> d!133231 m!1111935))

(assert (=> b!1205873 m!1112129))

(assert (=> b!1205873 m!1112129))

(declare-fun m!1112137 () Bool)

(assert (=> b!1205873 m!1112137))

(assert (=> b!1205655 d!133231))

(declare-fun d!133233 () Bool)

(assert (=> d!133233 (= (array_inv!28756 _keys!1208) (bvsge (size!38192 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100914 d!133233))

(declare-fun d!133235 () Bool)

(assert (=> d!133235 (= (array_inv!28757 _values!996) (bvsge (size!38193 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100914 d!133235))

(declare-fun d!133237 () Bool)

(declare-fun e!684883 () Bool)

(assert (=> d!133237 e!684883))

(declare-fun res!801880 () Bool)

(assert (=> d!133237 (=> (not res!801880) (not e!684883))))

(declare-fun lt!546756 () ListLongMap!17689)

(assert (=> d!133237 (= res!801880 (contains!6937 lt!546756 (_1!9867 (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!546758 () List!26522)

(assert (=> d!133237 (= lt!546756 (ListLongMap!17690 lt!546758))))

(declare-fun lt!546755 () Unit!39894)

(declare-fun lt!546757 () Unit!39894)

(assert (=> d!133237 (= lt!546755 lt!546757)))

(assert (=> d!133237 (= (getValueByKey!629 lt!546758 (_1!9867 (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!679 (_2!9867 (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!311 (List!26522 (_ BitVec 64) V!45945) Unit!39894)

(assert (=> d!133237 (= lt!546757 (lemmaContainsTupThenGetReturnValue!311 lt!546758 (_1!9867 (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9867 (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun insertStrictlySorted!404 (List!26522 (_ BitVec 64) V!45945) List!26522)

(assert (=> d!133237 (= lt!546758 (insertStrictlySorted!404 (toList!8860 (ite c!118461 lt!546608 lt!546606)) (_1!9867 (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9867 (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133237 (= (+!4026 (ite c!118461 lt!546608 lt!546606) (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!546756)))

(declare-fun b!1205883 () Bool)

(declare-fun res!801881 () Bool)

(assert (=> b!1205883 (=> (not res!801881) (not e!684883))))

(assert (=> b!1205883 (= res!801881 (= (getValueByKey!629 (toList!8860 lt!546756) (_1!9867 (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!679 (_2!9867 (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1205884 () Bool)

(declare-fun contains!6940 (List!26522 tuple2!19712) Bool)

(assert (=> b!1205884 (= e!684883 (contains!6940 (toList!8860 lt!546756) (ite c!118461 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118457 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133237 res!801880) b!1205883))

(assert (= (and b!1205883 res!801881) b!1205884))

(declare-fun m!1112139 () Bool)

(assert (=> d!133237 m!1112139))

(declare-fun m!1112141 () Bool)

(assert (=> d!133237 m!1112141))

(declare-fun m!1112143 () Bool)

(assert (=> d!133237 m!1112143))

(declare-fun m!1112145 () Bool)

(assert (=> d!133237 m!1112145))

(declare-fun m!1112147 () Bool)

(assert (=> b!1205883 m!1112147))

(declare-fun m!1112149 () Bool)

(assert (=> b!1205884 m!1112149))

(assert (=> bm!58263 d!133237))

(declare-fun b!1205893 () Bool)

(declare-fun e!684891 () Bool)

(declare-fun e!684892 () Bool)

(assert (=> b!1205893 (= e!684891 e!684892)))

(declare-fun c!118512 () Bool)

(assert (=> b!1205893 (= c!118512 (validKeyInArray!0 (select (arr!37655 lt!546605) #b00000000000000000000000000000000)))))

(declare-fun b!1205894 () Bool)

(declare-fun e!684890 () Bool)

(assert (=> b!1205894 (= e!684892 e!684890)))

(declare-fun lt!546766 () (_ BitVec 64))

(assert (=> b!1205894 (= lt!546766 (select (arr!37655 lt!546605) #b00000000000000000000000000000000))))

(declare-fun lt!546767 () Unit!39894)

(assert (=> b!1205894 (= lt!546767 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!546605 lt!546766 #b00000000000000000000000000000000))))

(assert (=> b!1205894 (arrayContainsKey!0 lt!546605 lt!546766 #b00000000000000000000000000000000)))

(declare-fun lt!546765 () Unit!39894)

(assert (=> b!1205894 (= lt!546765 lt!546767)))

(declare-fun res!801887 () Bool)

(declare-datatypes ((SeekEntryResult!9891 0))(
  ( (MissingZero!9891 (index!41935 (_ BitVec 32))) (Found!9891 (index!41936 (_ BitVec 32))) (Intermediate!9891 (undefined!10703 Bool) (index!41937 (_ BitVec 32)) (x!106396 (_ BitVec 32))) (Undefined!9891) (MissingVacant!9891 (index!41938 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78037 (_ BitVec 32)) SeekEntryResult!9891)

(assert (=> b!1205894 (= res!801887 (= (seekEntryOrOpen!0 (select (arr!37655 lt!546605) #b00000000000000000000000000000000) lt!546605 mask!1564) (Found!9891 #b00000000000000000000000000000000)))))

(assert (=> b!1205894 (=> (not res!801887) (not e!684890))))

(declare-fun b!1205895 () Bool)

(declare-fun call!58328 () Bool)

(assert (=> b!1205895 (= e!684890 call!58328)))

(declare-fun d!133239 () Bool)

(declare-fun res!801886 () Bool)

(assert (=> d!133239 (=> res!801886 e!684891)))

(assert (=> d!133239 (= res!801886 (bvsge #b00000000000000000000000000000000 (size!38192 lt!546605)))))

(assert (=> d!133239 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546605 mask!1564) e!684891)))

(declare-fun bm!58325 () Bool)

(assert (=> bm!58325 (= call!58328 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!546605 mask!1564))))

(declare-fun b!1205896 () Bool)

(assert (=> b!1205896 (= e!684892 call!58328)))

(assert (= (and d!133239 (not res!801886)) b!1205893))

(assert (= (and b!1205893 c!118512) b!1205894))

(assert (= (and b!1205893 (not c!118512)) b!1205896))

(assert (= (and b!1205894 res!801887) b!1205895))

(assert (= (or b!1205895 b!1205896) bm!58325))

(declare-fun m!1112151 () Bool)

(assert (=> b!1205893 m!1112151))

(assert (=> b!1205893 m!1112151))

(declare-fun m!1112153 () Bool)

(assert (=> b!1205893 m!1112153))

(assert (=> b!1205894 m!1112151))

(declare-fun m!1112155 () Bool)

(assert (=> b!1205894 m!1112155))

(declare-fun m!1112157 () Bool)

(assert (=> b!1205894 m!1112157))

(assert (=> b!1205894 m!1112151))

(declare-fun m!1112159 () Bool)

(assert (=> b!1205894 m!1112159))

(declare-fun m!1112161 () Bool)

(assert (=> bm!58325 m!1112161))

(assert (=> b!1205630 d!133239))

(declare-fun d!133241 () Bool)

(declare-fun res!801892 () Bool)

(declare-fun e!684897 () Bool)

(assert (=> d!133241 (=> res!801892 e!684897)))

(assert (=> d!133241 (= res!801892 (= (select (arr!37655 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133241 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!684897)))

(declare-fun b!1205901 () Bool)

(declare-fun e!684898 () Bool)

(assert (=> b!1205901 (= e!684897 e!684898)))

(declare-fun res!801893 () Bool)

(assert (=> b!1205901 (=> (not res!801893) (not e!684898))))

(assert (=> b!1205901 (= res!801893 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1205902 () Bool)

(assert (=> b!1205902 (= e!684898 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133241 (not res!801892)) b!1205901))

(assert (= (and b!1205901 res!801893) b!1205902))

(assert (=> d!133241 m!1112129))

(declare-fun m!1112163 () Bool)

(assert (=> b!1205902 m!1112163))

(assert (=> b!1205629 d!133241))

(declare-fun d!133243 () Bool)

(declare-fun e!684901 () Bool)

(assert (=> d!133243 e!684901))

(declare-fun c!118515 () Bool)

(assert (=> d!133243 (= c!118515 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546770 () Unit!39894)

(declare-fun choose!1799 (array!78037 array!78039 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 64) (_ BitVec 32) Int) Unit!39894)

(assert (=> d!133243 (= lt!546770 (choose!1799 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133243 (validMask!0 mask!1564)))

(assert (=> d!133243 (= (lemmaListMapContainsThenArrayContainsFrom!567 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546770)))

(declare-fun b!1205907 () Bool)

(assert (=> b!1205907 (= e!684901 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205908 () Bool)

(assert (=> b!1205908 (= e!684901 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133243 c!118515) b!1205907))

(assert (= (and d!133243 (not c!118515)) b!1205908))

(declare-fun m!1112165 () Bool)

(assert (=> d!133243 m!1112165))

(assert (=> d!133243 m!1111935))

(assert (=> b!1205907 m!1111959))

(assert (=> b!1205629 d!133243))

(declare-fun e!684902 () Bool)

(declare-fun b!1205909 () Bool)

(assert (=> b!1205909 (= e!684902 (validKeyInArray!0 (select (arr!37655 (ite c!118460 _keys!1208 lt!546605)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205909 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!133245 () Bool)

(declare-fun e!684908 () Bool)

(assert (=> d!133245 e!684908))

(declare-fun res!801896 () Bool)

(assert (=> d!133245 (=> (not res!801896) (not e!684908))))

(declare-fun lt!546774 () ListLongMap!17689)

(assert (=> d!133245 (= res!801896 (not (contains!6937 lt!546774 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!684905 () ListLongMap!17689)

(assert (=> d!133245 (= lt!546774 e!684905)))

(declare-fun c!118516 () Bool)

(assert (=> d!133245 (= c!118516 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (ite c!118460 _keys!1208 lt!546605))))))

(assert (=> d!133245 (validMask!0 mask!1564)))

(assert (=> d!133245 (= (getCurrentListMapNoExtraKeys!5326 (ite c!118460 _keys!1208 lt!546605) (ite c!118460 _values!996 lt!546612) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546774)))

(declare-fun b!1205910 () Bool)

(assert (=> b!1205910 (= e!684905 (ListLongMap!17690 Nil!26519))))

(declare-fun b!1205911 () Bool)

(declare-fun e!684906 () Bool)

(assert (=> b!1205911 (= e!684908 e!684906)))

(declare-fun c!118518 () Bool)

(assert (=> b!1205911 (= c!118518 e!684902)))

(declare-fun res!801894 () Bool)

(assert (=> b!1205911 (=> (not res!801894) (not e!684902))))

(assert (=> b!1205911 (= res!801894 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (ite c!118460 _keys!1208 lt!546605))))))

(declare-fun b!1205912 () Bool)

(assert (=> b!1205912 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (ite c!118460 _keys!1208 lt!546605))))))

(assert (=> b!1205912 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38193 (ite c!118460 _values!996 lt!546612))))))

(declare-fun e!684903 () Bool)

(assert (=> b!1205912 (= e!684903 (= (apply!971 lt!546774 (select (arr!37655 (ite c!118460 _keys!1208 lt!546605)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19242 (select (arr!37656 (ite c!118460 _values!996 lt!546612)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!58329 () ListLongMap!17689)

(declare-fun bm!58326 () Bool)

(assert (=> bm!58326 (= call!58329 (getCurrentListMapNoExtraKeys!5326 (ite c!118460 _keys!1208 lt!546605) (ite c!118460 _values!996 lt!546612) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205913 () Bool)

(declare-fun lt!546771 () Unit!39894)

(declare-fun lt!546773 () Unit!39894)

(assert (=> b!1205913 (= lt!546771 lt!546773)))

(declare-fun lt!546776 () (_ BitVec 64))

(declare-fun lt!546775 () ListLongMap!17689)

(declare-fun lt!546772 () (_ BitVec 64))

(declare-fun lt!546777 () V!45945)

(assert (=> b!1205913 (not (contains!6937 (+!4026 lt!546775 (tuple2!19713 lt!546776 lt!546777)) lt!546772))))

(assert (=> b!1205913 (= lt!546773 (addStillNotContains!292 lt!546775 lt!546776 lt!546777 lt!546772))))

(assert (=> b!1205913 (= lt!546772 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205913 (= lt!546777 (get!19242 (select (arr!37656 (ite c!118460 _values!996 lt!546612)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205913 (= lt!546776 (select (arr!37655 (ite c!118460 _keys!1208 lt!546605)) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1205913 (= lt!546775 call!58329)))

(declare-fun e!684907 () ListLongMap!17689)

(assert (=> b!1205913 (= e!684907 (+!4026 call!58329 (tuple2!19713 (select (arr!37655 (ite c!118460 _keys!1208 lt!546605)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19242 (select (arr!37656 (ite c!118460 _values!996 lt!546612)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205914 () Bool)

(assert (=> b!1205914 (= e!684907 call!58329)))

(declare-fun b!1205915 () Bool)

(assert (=> b!1205915 (= e!684906 e!684903)))

(assert (=> b!1205915 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (ite c!118460 _keys!1208 lt!546605))))))

(declare-fun res!801895 () Bool)

(assert (=> b!1205915 (= res!801895 (contains!6937 lt!546774 (select (arr!37655 (ite c!118460 _keys!1208 lt!546605)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205915 (=> (not res!801895) (not e!684903))))

(declare-fun e!684904 () Bool)

(declare-fun b!1205916 () Bool)

(assert (=> b!1205916 (= e!684904 (= lt!546774 (getCurrentListMapNoExtraKeys!5326 (ite c!118460 _keys!1208 lt!546605) (ite c!118460 _values!996 lt!546612) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205917 () Bool)

(assert (=> b!1205917 (= e!684904 (isEmpty!988 lt!546774))))

(declare-fun b!1205918 () Bool)

(declare-fun res!801897 () Bool)

(assert (=> b!1205918 (=> (not res!801897) (not e!684908))))

(assert (=> b!1205918 (= res!801897 (not (contains!6937 lt!546774 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1205919 () Bool)

(assert (=> b!1205919 (= e!684905 e!684907)))

(declare-fun c!118519 () Bool)

(assert (=> b!1205919 (= c!118519 (validKeyInArray!0 (select (arr!37655 (ite c!118460 _keys!1208 lt!546605)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1205920 () Bool)

(assert (=> b!1205920 (= e!684906 e!684904)))

(declare-fun c!118517 () Bool)

(assert (=> b!1205920 (= c!118517 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (ite c!118460 _keys!1208 lt!546605))))))

(assert (= (and d!133245 c!118516) b!1205910))

(assert (= (and d!133245 (not c!118516)) b!1205919))

(assert (= (and b!1205919 c!118519) b!1205913))

(assert (= (and b!1205919 (not c!118519)) b!1205914))

(assert (= (or b!1205913 b!1205914) bm!58326))

(assert (= (and d!133245 res!801896) b!1205918))

(assert (= (and b!1205918 res!801897) b!1205911))

(assert (= (and b!1205911 res!801894) b!1205909))

(assert (= (and b!1205911 c!118518) b!1205915))

(assert (= (and b!1205911 (not c!118518)) b!1205920))

(assert (= (and b!1205915 res!801895) b!1205912))

(assert (= (and b!1205920 c!118517) b!1205916))

(assert (= (and b!1205920 (not c!118517)) b!1205917))

(declare-fun b_lambda!21237 () Bool)

(assert (=> (not b_lambda!21237) (not b!1205912)))

(assert (=> b!1205912 t!39402))

(declare-fun b_and!42785 () Bool)

(assert (= b_and!42783 (and (=> t!39402 result!21991) b_and!42785)))

(declare-fun b_lambda!21239 () Bool)

(assert (=> (not b_lambda!21239) (not b!1205913)))

(assert (=> b!1205913 t!39402))

(declare-fun b_and!42787 () Bool)

(assert (= b_and!42785 (and (=> t!39402 result!21991) b_and!42787)))

(declare-fun m!1112167 () Bool)

(assert (=> b!1205917 m!1112167))

(declare-fun m!1112169 () Bool)

(assert (=> bm!58326 m!1112169))

(declare-fun m!1112171 () Bool)

(assert (=> b!1205918 m!1112171))

(assert (=> b!1205913 m!1111953))

(declare-fun m!1112173 () Bool)

(assert (=> b!1205913 m!1112173))

(declare-fun m!1112175 () Bool)

(assert (=> b!1205913 m!1112175))

(assert (=> b!1205913 m!1112173))

(declare-fun m!1112177 () Bool)

(assert (=> b!1205913 m!1112177))

(declare-fun m!1112179 () Bool)

(assert (=> b!1205913 m!1112179))

(declare-fun m!1112181 () Bool)

(assert (=> b!1205913 m!1112181))

(assert (=> b!1205913 m!1111953))

(declare-fun m!1112183 () Bool)

(assert (=> b!1205913 m!1112183))

(declare-fun m!1112185 () Bool)

(assert (=> b!1205913 m!1112185))

(assert (=> b!1205913 m!1112181))

(assert (=> b!1205919 m!1112185))

(assert (=> b!1205919 m!1112185))

(declare-fun m!1112187 () Bool)

(assert (=> b!1205919 m!1112187))

(assert (=> b!1205909 m!1112185))

(assert (=> b!1205909 m!1112185))

(assert (=> b!1205909 m!1112187))

(assert (=> b!1205912 m!1111953))

(assert (=> b!1205912 m!1112185))

(declare-fun m!1112189 () Bool)

(assert (=> b!1205912 m!1112189))

(assert (=> b!1205912 m!1112181))

(assert (=> b!1205912 m!1111953))

(assert (=> b!1205912 m!1112183))

(assert (=> b!1205912 m!1112185))

(assert (=> b!1205912 m!1112181))

(assert (=> b!1205916 m!1112169))

(declare-fun m!1112191 () Bool)

(assert (=> d!133245 m!1112191))

(assert (=> d!133245 m!1111935))

(assert (=> b!1205915 m!1112185))

(assert (=> b!1205915 m!1112185))

(declare-fun m!1112193 () Bool)

(assert (=> b!1205915 m!1112193))

(assert (=> bm!58259 d!133245))

(declare-fun bm!58329 () Bool)

(declare-fun call!58332 () Bool)

(declare-fun c!118522 () Bool)

(assert (=> bm!58329 (= call!58332 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118522 (Cons!26519 (select (arr!37655 _keys!1208) #b00000000000000000000000000000000) Nil!26520) Nil!26520)))))

(declare-fun b!1205931 () Bool)

(declare-fun e!684920 () Bool)

(declare-fun e!684918 () Bool)

(assert (=> b!1205931 (= e!684920 e!684918)))

(declare-fun res!801904 () Bool)

(assert (=> b!1205931 (=> (not res!801904) (not e!684918))))

(declare-fun e!684919 () Bool)

(assert (=> b!1205931 (= res!801904 (not e!684919))))

(declare-fun res!801906 () Bool)

(assert (=> b!1205931 (=> (not res!801906) (not e!684919))))

(assert (=> b!1205931 (= res!801906 (validKeyInArray!0 (select (arr!37655 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1205932 () Bool)

(declare-fun contains!6941 (List!26523 (_ BitVec 64)) Bool)

(assert (=> b!1205932 (= e!684919 (contains!6941 Nil!26520 (select (arr!37655 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133247 () Bool)

(declare-fun res!801905 () Bool)

(assert (=> d!133247 (=> res!801905 e!684920)))

(assert (=> d!133247 (= res!801905 (bvsge #b00000000000000000000000000000000 (size!38192 _keys!1208)))))

(assert (=> d!133247 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26520) e!684920)))

(declare-fun b!1205933 () Bool)

(declare-fun e!684917 () Bool)

(assert (=> b!1205933 (= e!684917 call!58332)))

(declare-fun b!1205934 () Bool)

(assert (=> b!1205934 (= e!684918 e!684917)))

(assert (=> b!1205934 (= c!118522 (validKeyInArray!0 (select (arr!37655 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1205935 () Bool)

(assert (=> b!1205935 (= e!684917 call!58332)))

(assert (= (and d!133247 (not res!801905)) b!1205931))

(assert (= (and b!1205931 res!801906) b!1205932))

(assert (= (and b!1205931 res!801904) b!1205934))

(assert (= (and b!1205934 c!118522) b!1205935))

(assert (= (and b!1205934 (not c!118522)) b!1205933))

(assert (= (or b!1205935 b!1205933) bm!58329))

(declare-fun m!1112195 () Bool)

(assert (=> bm!58329 m!1112195))

(declare-fun m!1112197 () Bool)

(assert (=> bm!58329 m!1112197))

(assert (=> b!1205931 m!1112195))

(assert (=> b!1205931 m!1112195))

(declare-fun m!1112199 () Bool)

(assert (=> b!1205931 m!1112199))

(assert (=> b!1205932 m!1112195))

(assert (=> b!1205932 m!1112195))

(declare-fun m!1112201 () Bool)

(assert (=> b!1205932 m!1112201))

(assert (=> b!1205934 m!1112195))

(assert (=> b!1205934 m!1112195))

(assert (=> b!1205934 m!1112199))

(assert (=> b!1205638 d!133247))

(declare-fun d!133249 () Bool)

(declare-fun lt!546780 () ListLongMap!17689)

(assert (=> d!133249 (not (contains!6937 lt!546780 k0!934))))

(declare-fun removeStrictlySorted!94 (List!26522 (_ BitVec 64)) List!26522)

(assert (=> d!133249 (= lt!546780 (ListLongMap!17690 (removeStrictlySorted!94 (toList!8860 call!58261) k0!934)))))

(assert (=> d!133249 (= (-!1806 call!58261 k0!934) lt!546780)))

(declare-fun bs!34108 () Bool)

(assert (= bs!34108 d!133249))

(declare-fun m!1112203 () Bool)

(assert (=> bs!34108 m!1112203))

(declare-fun m!1112205 () Bool)

(assert (=> bs!34108 m!1112205))

(assert (=> b!1205645 d!133249))

(declare-fun b!1205936 () Bool)

(declare-fun e!684921 () Bool)

(assert (=> b!1205936 (= e!684921 (validKeyInArray!0 (select (arr!37655 lt!546605) from!1455)))))

(assert (=> b!1205936 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun d!133251 () Bool)

(declare-fun e!684927 () Bool)

(assert (=> d!133251 e!684927))

(declare-fun res!801909 () Bool)

(assert (=> d!133251 (=> (not res!801909) (not e!684927))))

(declare-fun lt!546784 () ListLongMap!17689)

(assert (=> d!133251 (= res!801909 (not (contains!6937 lt!546784 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!684924 () ListLongMap!17689)

(assert (=> d!133251 (= lt!546784 e!684924)))

(declare-fun c!118523 () Bool)

(assert (=> d!133251 (= c!118523 (bvsge from!1455 (size!38192 lt!546605)))))

(assert (=> d!133251 (validMask!0 mask!1564)))

(assert (=> d!133251 (= (getCurrentListMapNoExtraKeys!5326 lt!546605 lt!546612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546784)))

(declare-fun b!1205937 () Bool)

(assert (=> b!1205937 (= e!684924 (ListLongMap!17690 Nil!26519))))

(declare-fun b!1205938 () Bool)

(declare-fun e!684925 () Bool)

(assert (=> b!1205938 (= e!684927 e!684925)))

(declare-fun c!118525 () Bool)

(assert (=> b!1205938 (= c!118525 e!684921)))

(declare-fun res!801907 () Bool)

(assert (=> b!1205938 (=> (not res!801907) (not e!684921))))

(assert (=> b!1205938 (= res!801907 (bvslt from!1455 (size!38192 lt!546605)))))

(declare-fun b!1205939 () Bool)

(assert (=> b!1205939 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38192 lt!546605)))))

(assert (=> b!1205939 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38193 lt!546612)))))

(declare-fun e!684922 () Bool)

(assert (=> b!1205939 (= e!684922 (= (apply!971 lt!546784 (select (arr!37655 lt!546605) from!1455)) (get!19242 (select (arr!37656 lt!546612) from!1455) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58330 () Bool)

(declare-fun call!58333 () ListLongMap!17689)

(assert (=> bm!58330 (= call!58333 (getCurrentListMapNoExtraKeys!5326 lt!546605 lt!546612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205940 () Bool)

(declare-fun lt!546781 () Unit!39894)

(declare-fun lt!546783 () Unit!39894)

(assert (=> b!1205940 (= lt!546781 lt!546783)))

(declare-fun lt!546787 () V!45945)

(declare-fun lt!546786 () (_ BitVec 64))

(declare-fun lt!546785 () ListLongMap!17689)

(declare-fun lt!546782 () (_ BitVec 64))

(assert (=> b!1205940 (not (contains!6937 (+!4026 lt!546785 (tuple2!19713 lt!546786 lt!546787)) lt!546782))))

(assert (=> b!1205940 (= lt!546783 (addStillNotContains!292 lt!546785 lt!546786 lt!546787 lt!546782))))

(assert (=> b!1205940 (= lt!546782 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205940 (= lt!546787 (get!19242 (select (arr!37656 lt!546612) from!1455) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205940 (= lt!546786 (select (arr!37655 lt!546605) from!1455))))

(assert (=> b!1205940 (= lt!546785 call!58333)))

(declare-fun e!684926 () ListLongMap!17689)

(assert (=> b!1205940 (= e!684926 (+!4026 call!58333 (tuple2!19713 (select (arr!37655 lt!546605) from!1455) (get!19242 (select (arr!37656 lt!546612) from!1455) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205941 () Bool)

(assert (=> b!1205941 (= e!684926 call!58333)))

(declare-fun b!1205942 () Bool)

(assert (=> b!1205942 (= e!684925 e!684922)))

(assert (=> b!1205942 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38192 lt!546605)))))

(declare-fun res!801908 () Bool)

(assert (=> b!1205942 (= res!801908 (contains!6937 lt!546784 (select (arr!37655 lt!546605) from!1455)))))

(assert (=> b!1205942 (=> (not res!801908) (not e!684922))))

(declare-fun e!684923 () Bool)

(declare-fun b!1205943 () Bool)

(assert (=> b!1205943 (= e!684923 (= lt!546784 (getCurrentListMapNoExtraKeys!5326 lt!546605 lt!546612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205944 () Bool)

(assert (=> b!1205944 (= e!684923 (isEmpty!988 lt!546784))))

(declare-fun b!1205945 () Bool)

(declare-fun res!801910 () Bool)

(assert (=> b!1205945 (=> (not res!801910) (not e!684927))))

(assert (=> b!1205945 (= res!801910 (not (contains!6937 lt!546784 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1205946 () Bool)

(assert (=> b!1205946 (= e!684924 e!684926)))

(declare-fun c!118526 () Bool)

(assert (=> b!1205946 (= c!118526 (validKeyInArray!0 (select (arr!37655 lt!546605) from!1455)))))

(declare-fun b!1205947 () Bool)

(assert (=> b!1205947 (= e!684925 e!684923)))

(declare-fun c!118524 () Bool)

(assert (=> b!1205947 (= c!118524 (bvslt from!1455 (size!38192 lt!546605)))))

(assert (= (and d!133251 c!118523) b!1205937))

(assert (= (and d!133251 (not c!118523)) b!1205946))

(assert (= (and b!1205946 c!118526) b!1205940))

(assert (= (and b!1205946 (not c!118526)) b!1205941))

(assert (= (or b!1205940 b!1205941) bm!58330))

(assert (= (and d!133251 res!801909) b!1205945))

(assert (= (and b!1205945 res!801910) b!1205938))

(assert (= (and b!1205938 res!801907) b!1205936))

(assert (= (and b!1205938 c!118525) b!1205942))

(assert (= (and b!1205938 (not c!118525)) b!1205947))

(assert (= (and b!1205942 res!801908) b!1205939))

(assert (= (and b!1205947 c!118524) b!1205943))

(assert (= (and b!1205947 (not c!118524)) b!1205944))

(declare-fun b_lambda!21241 () Bool)

(assert (=> (not b_lambda!21241) (not b!1205939)))

(assert (=> b!1205939 t!39402))

(declare-fun b_and!42789 () Bool)

(assert (= b_and!42787 (and (=> t!39402 result!21991) b_and!42789)))

(declare-fun b_lambda!21243 () Bool)

(assert (=> (not b_lambda!21243) (not b!1205940)))

(assert (=> b!1205940 t!39402))

(declare-fun b_and!42791 () Bool)

(assert (= b_and!42789 (and (=> t!39402 result!21991) b_and!42791)))

(declare-fun m!1112207 () Bool)

(assert (=> b!1205944 m!1112207))

(declare-fun m!1112209 () Bool)

(assert (=> bm!58330 m!1112209))

(declare-fun m!1112211 () Bool)

(assert (=> b!1205945 m!1112211))

(assert (=> b!1205940 m!1111953))

(declare-fun m!1112213 () Bool)

(assert (=> b!1205940 m!1112213))

(declare-fun m!1112215 () Bool)

(assert (=> b!1205940 m!1112215))

(assert (=> b!1205940 m!1112213))

(declare-fun m!1112217 () Bool)

(assert (=> b!1205940 m!1112217))

(declare-fun m!1112219 () Bool)

(assert (=> b!1205940 m!1112219))

(declare-fun m!1112221 () Bool)

(assert (=> b!1205940 m!1112221))

(assert (=> b!1205940 m!1111953))

(declare-fun m!1112223 () Bool)

(assert (=> b!1205940 m!1112223))

(declare-fun m!1112225 () Bool)

(assert (=> b!1205940 m!1112225))

(assert (=> b!1205940 m!1112221))

(assert (=> b!1205946 m!1112225))

(assert (=> b!1205946 m!1112225))

(declare-fun m!1112227 () Bool)

(assert (=> b!1205946 m!1112227))

(assert (=> b!1205936 m!1112225))

(assert (=> b!1205936 m!1112225))

(assert (=> b!1205936 m!1112227))

(assert (=> b!1205939 m!1111953))

(assert (=> b!1205939 m!1112225))

(declare-fun m!1112229 () Bool)

(assert (=> b!1205939 m!1112229))

(assert (=> b!1205939 m!1112221))

(assert (=> b!1205939 m!1111953))

(assert (=> b!1205939 m!1112223))

(assert (=> b!1205939 m!1112225))

(assert (=> b!1205939 m!1112221))

(assert (=> b!1205943 m!1112209))

(declare-fun m!1112231 () Bool)

(assert (=> d!133251 m!1112231))

(assert (=> d!133251 m!1111935))

(assert (=> b!1205942 m!1112225))

(assert (=> b!1205942 m!1112225))

(declare-fun m!1112233 () Bool)

(assert (=> b!1205942 m!1112233))

(assert (=> b!1205650 d!133251))

(declare-fun b!1205948 () Bool)

(declare-fun e!684928 () Bool)

(assert (=> b!1205948 (= e!684928 (validKeyInArray!0 (select (arr!37655 _keys!1208) from!1455)))))

(assert (=> b!1205948 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun d!133253 () Bool)

(declare-fun e!684934 () Bool)

(assert (=> d!133253 e!684934))

(declare-fun res!801913 () Bool)

(assert (=> d!133253 (=> (not res!801913) (not e!684934))))

(declare-fun lt!546791 () ListLongMap!17689)

(assert (=> d!133253 (= res!801913 (not (contains!6937 lt!546791 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!684931 () ListLongMap!17689)

(assert (=> d!133253 (= lt!546791 e!684931)))

(declare-fun c!118527 () Bool)

(assert (=> d!133253 (= c!118527 (bvsge from!1455 (size!38192 _keys!1208)))))

(assert (=> d!133253 (validMask!0 mask!1564)))

(assert (=> d!133253 (= (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546791)))

(declare-fun b!1205949 () Bool)

(assert (=> b!1205949 (= e!684931 (ListLongMap!17690 Nil!26519))))

(declare-fun b!1205950 () Bool)

(declare-fun e!684932 () Bool)

(assert (=> b!1205950 (= e!684934 e!684932)))

(declare-fun c!118529 () Bool)

(assert (=> b!1205950 (= c!118529 e!684928)))

(declare-fun res!801911 () Bool)

(assert (=> b!1205950 (=> (not res!801911) (not e!684928))))

(assert (=> b!1205950 (= res!801911 (bvslt from!1455 (size!38192 _keys!1208)))))

(declare-fun b!1205951 () Bool)

(assert (=> b!1205951 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38192 _keys!1208)))))

(assert (=> b!1205951 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38193 _values!996)))))

(declare-fun e!684929 () Bool)

(assert (=> b!1205951 (= e!684929 (= (apply!971 lt!546791 (select (arr!37655 _keys!1208) from!1455)) (get!19242 (select (arr!37656 _values!996) from!1455) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58331 () Bool)

(declare-fun call!58334 () ListLongMap!17689)

(assert (=> bm!58331 (= call!58334 (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205952 () Bool)

(declare-fun lt!546788 () Unit!39894)

(declare-fun lt!546790 () Unit!39894)

(assert (=> b!1205952 (= lt!546788 lt!546790)))

(declare-fun lt!546793 () (_ BitVec 64))

(declare-fun lt!546789 () (_ BitVec 64))

(declare-fun lt!546792 () ListLongMap!17689)

(declare-fun lt!546794 () V!45945)

(assert (=> b!1205952 (not (contains!6937 (+!4026 lt!546792 (tuple2!19713 lt!546793 lt!546794)) lt!546789))))

(assert (=> b!1205952 (= lt!546790 (addStillNotContains!292 lt!546792 lt!546793 lt!546794 lt!546789))))

(assert (=> b!1205952 (= lt!546789 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205952 (= lt!546794 (get!19242 (select (arr!37656 _values!996) from!1455) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205952 (= lt!546793 (select (arr!37655 _keys!1208) from!1455))))

(assert (=> b!1205952 (= lt!546792 call!58334)))

(declare-fun e!684933 () ListLongMap!17689)

(assert (=> b!1205952 (= e!684933 (+!4026 call!58334 (tuple2!19713 (select (arr!37655 _keys!1208) from!1455) (get!19242 (select (arr!37656 _values!996) from!1455) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205953 () Bool)

(assert (=> b!1205953 (= e!684933 call!58334)))

(declare-fun b!1205954 () Bool)

(assert (=> b!1205954 (= e!684932 e!684929)))

(assert (=> b!1205954 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38192 _keys!1208)))))

(declare-fun res!801912 () Bool)

(assert (=> b!1205954 (= res!801912 (contains!6937 lt!546791 (select (arr!37655 _keys!1208) from!1455)))))

(assert (=> b!1205954 (=> (not res!801912) (not e!684929))))

(declare-fun b!1205955 () Bool)

(declare-fun e!684930 () Bool)

(assert (=> b!1205955 (= e!684930 (= lt!546791 (getCurrentListMapNoExtraKeys!5326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205956 () Bool)

(assert (=> b!1205956 (= e!684930 (isEmpty!988 lt!546791))))

(declare-fun b!1205957 () Bool)

(declare-fun res!801914 () Bool)

(assert (=> b!1205957 (=> (not res!801914) (not e!684934))))

(assert (=> b!1205957 (= res!801914 (not (contains!6937 lt!546791 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1205958 () Bool)

(assert (=> b!1205958 (= e!684931 e!684933)))

(declare-fun c!118530 () Bool)

(assert (=> b!1205958 (= c!118530 (validKeyInArray!0 (select (arr!37655 _keys!1208) from!1455)))))

(declare-fun b!1205959 () Bool)

(assert (=> b!1205959 (= e!684932 e!684930)))

(declare-fun c!118528 () Bool)

(assert (=> b!1205959 (= c!118528 (bvslt from!1455 (size!38192 _keys!1208)))))

(assert (= (and d!133253 c!118527) b!1205949))

(assert (= (and d!133253 (not c!118527)) b!1205958))

(assert (= (and b!1205958 c!118530) b!1205952))

(assert (= (and b!1205958 (not c!118530)) b!1205953))

(assert (= (or b!1205952 b!1205953) bm!58331))

(assert (= (and d!133253 res!801913) b!1205957))

(assert (= (and b!1205957 res!801914) b!1205950))

(assert (= (and b!1205950 res!801911) b!1205948))

(assert (= (and b!1205950 c!118529) b!1205954))

(assert (= (and b!1205950 (not c!118529)) b!1205959))

(assert (= (and b!1205954 res!801912) b!1205951))

(assert (= (and b!1205959 c!118528) b!1205955))

(assert (= (and b!1205959 (not c!118528)) b!1205956))

(declare-fun b_lambda!21245 () Bool)

(assert (=> (not b_lambda!21245) (not b!1205951)))

(assert (=> b!1205951 t!39402))

(declare-fun b_and!42793 () Bool)

(assert (= b_and!42791 (and (=> t!39402 result!21991) b_and!42793)))

(declare-fun b_lambda!21247 () Bool)

(assert (=> (not b_lambda!21247) (not b!1205952)))

(assert (=> b!1205952 t!39402))

(declare-fun b_and!42795 () Bool)

(assert (= b_and!42793 (and (=> t!39402 result!21991) b_and!42795)))

(declare-fun m!1112235 () Bool)

(assert (=> b!1205956 m!1112235))

(declare-fun m!1112237 () Bool)

(assert (=> bm!58331 m!1112237))

(declare-fun m!1112239 () Bool)

(assert (=> b!1205957 m!1112239))

(assert (=> b!1205952 m!1111953))

(declare-fun m!1112241 () Bool)

(assert (=> b!1205952 m!1112241))

(declare-fun m!1112243 () Bool)

(assert (=> b!1205952 m!1112243))

(assert (=> b!1205952 m!1112241))

(declare-fun m!1112245 () Bool)

(assert (=> b!1205952 m!1112245))

(declare-fun m!1112247 () Bool)

(assert (=> b!1205952 m!1112247))

(declare-fun m!1112249 () Bool)

(assert (=> b!1205952 m!1112249))

(assert (=> b!1205952 m!1111953))

(declare-fun m!1112251 () Bool)

(assert (=> b!1205952 m!1112251))

(assert (=> b!1205952 m!1111917))

(assert (=> b!1205952 m!1112249))

(assert (=> b!1205958 m!1111917))

(assert (=> b!1205958 m!1111917))

(declare-fun m!1112253 () Bool)

(assert (=> b!1205958 m!1112253))

(assert (=> b!1205948 m!1111917))

(assert (=> b!1205948 m!1111917))

(assert (=> b!1205948 m!1112253))

(assert (=> b!1205951 m!1111953))

(assert (=> b!1205951 m!1111917))

(declare-fun m!1112255 () Bool)

(assert (=> b!1205951 m!1112255))

(assert (=> b!1205951 m!1112249))

(assert (=> b!1205951 m!1111953))

(assert (=> b!1205951 m!1112251))

(assert (=> b!1205951 m!1111917))

(assert (=> b!1205951 m!1112249))

(assert (=> b!1205955 m!1112237))

(declare-fun m!1112257 () Bool)

(assert (=> d!133253 m!1112257))

(assert (=> d!133253 m!1111935))

(assert (=> b!1205954 m!1111917))

(assert (=> b!1205954 m!1111917))

(declare-fun m!1112259 () Bool)

(assert (=> b!1205954 m!1112259))

(assert (=> b!1205650 d!133253))

(declare-fun d!133255 () Bool)

(declare-fun res!801915 () Bool)

(declare-fun e!684935 () Bool)

(assert (=> d!133255 (=> res!801915 e!684935)))

(assert (=> d!133255 (= res!801915 (= (select (arr!37655 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133255 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!684935)))

(declare-fun b!1205960 () Bool)

(declare-fun e!684936 () Bool)

(assert (=> b!1205960 (= e!684935 e!684936)))

(declare-fun res!801916 () Bool)

(assert (=> b!1205960 (=> (not res!801916) (not e!684936))))

(assert (=> b!1205960 (= res!801916 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38192 _keys!1208)))))

(declare-fun b!1205961 () Bool)

(assert (=> b!1205961 (= e!684936 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133255 (not res!801915)) b!1205960))

(assert (= (and b!1205960 res!801916) b!1205961))

(assert (=> d!133255 m!1112195))

(declare-fun m!1112261 () Bool)

(assert (=> b!1205961 m!1112261))

(assert (=> b!1205634 d!133255))

(declare-fun d!133257 () Bool)

(assert (=> d!133257 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546797 () Unit!39894)

(declare-fun choose!13 (array!78037 (_ BitVec 64) (_ BitVec 32)) Unit!39894)

(assert (=> d!133257 (= lt!546797 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133257 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133257 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!546797)))

(declare-fun bs!34109 () Bool)

(assert (= bs!34109 d!133257))

(assert (=> bs!34109 m!1111943))

(declare-fun m!1112263 () Bool)

(assert (=> bs!34109 m!1112263))

(assert (=> b!1205634 d!133257))

(declare-fun b!1205962 () Bool)

(declare-fun e!684938 () Bool)

(declare-fun e!684939 () Bool)

(assert (=> b!1205962 (= e!684938 e!684939)))

(declare-fun c!118531 () Bool)

(assert (=> b!1205962 (= c!118531 (validKeyInArray!0 (select (arr!37655 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1205963 () Bool)

(declare-fun e!684937 () Bool)

(assert (=> b!1205963 (= e!684939 e!684937)))

(declare-fun lt!546799 () (_ BitVec 64))

(assert (=> b!1205963 (= lt!546799 (select (arr!37655 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!546800 () Unit!39894)

(assert (=> b!1205963 (= lt!546800 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!546799 #b00000000000000000000000000000000))))

(assert (=> b!1205963 (arrayContainsKey!0 _keys!1208 lt!546799 #b00000000000000000000000000000000)))

(declare-fun lt!546798 () Unit!39894)

(assert (=> b!1205963 (= lt!546798 lt!546800)))

(declare-fun res!801918 () Bool)

(assert (=> b!1205963 (= res!801918 (= (seekEntryOrOpen!0 (select (arr!37655 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9891 #b00000000000000000000000000000000)))))

(assert (=> b!1205963 (=> (not res!801918) (not e!684937))))

(declare-fun b!1205964 () Bool)

(declare-fun call!58335 () Bool)

(assert (=> b!1205964 (= e!684937 call!58335)))

(declare-fun d!133259 () Bool)

(declare-fun res!801917 () Bool)

(assert (=> d!133259 (=> res!801917 e!684938)))

(assert (=> d!133259 (= res!801917 (bvsge #b00000000000000000000000000000000 (size!38192 _keys!1208)))))

(assert (=> d!133259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!684938)))

(declare-fun bm!58332 () Bool)

(assert (=> bm!58332 (= call!58335 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1205965 () Bool)

(assert (=> b!1205965 (= e!684939 call!58335)))

(assert (= (and d!133259 (not res!801917)) b!1205962))

(assert (= (and b!1205962 c!118531) b!1205963))

(assert (= (and b!1205962 (not c!118531)) b!1205965))

(assert (= (and b!1205963 res!801918) b!1205964))

(assert (= (or b!1205964 b!1205965) bm!58332))

(assert (=> b!1205962 m!1112195))

(assert (=> b!1205962 m!1112195))

(assert (=> b!1205962 m!1112199))

(assert (=> b!1205963 m!1112195))

(declare-fun m!1112265 () Bool)

(assert (=> b!1205963 m!1112265))

(declare-fun m!1112267 () Bool)

(assert (=> b!1205963 m!1112267))

(assert (=> b!1205963 m!1112195))

(declare-fun m!1112269 () Bool)

(assert (=> b!1205963 m!1112269))

(declare-fun m!1112271 () Bool)

(assert (=> bm!58332 m!1112271))

(assert (=> b!1205644 d!133259))

(declare-fun d!133261 () Bool)

(declare-fun e!684940 () Bool)

(assert (=> d!133261 e!684940))

(declare-fun res!801919 () Bool)

(assert (=> d!133261 (=> (not res!801919) (not e!684940))))

(declare-fun lt!546802 () ListLongMap!17689)

(assert (=> d!133261 (= res!801919 (contains!6937 lt!546802 (_1!9867 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!546804 () List!26522)

(assert (=> d!133261 (= lt!546802 (ListLongMap!17690 lt!546804))))

(declare-fun lt!546801 () Unit!39894)

(declare-fun lt!546803 () Unit!39894)

(assert (=> d!133261 (= lt!546801 lt!546803)))

(assert (=> d!133261 (= (getValueByKey!629 lt!546804 (_1!9867 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!679 (_2!9867 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133261 (= lt!546803 (lemmaContainsTupThenGetReturnValue!311 lt!546804 (_1!9867 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9867 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133261 (= lt!546804 (insertStrictlySorted!404 (toList!8860 lt!546606) (_1!9867 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9867 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133261 (= (+!4026 lt!546606 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!546802)))

(declare-fun b!1205966 () Bool)

(declare-fun res!801920 () Bool)

(assert (=> b!1205966 (=> (not res!801920) (not e!684940))))

(assert (=> b!1205966 (= res!801920 (= (getValueByKey!629 (toList!8860 lt!546802) (_1!9867 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!679 (_2!9867 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1205967 () Bool)

(assert (=> b!1205967 (= e!684940 (contains!6940 (toList!8860 lt!546802) (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!133261 res!801919) b!1205966))

(assert (= (and b!1205966 res!801920) b!1205967))

(declare-fun m!1112273 () Bool)

(assert (=> d!133261 m!1112273))

(declare-fun m!1112275 () Bool)

(assert (=> d!133261 m!1112275))

(declare-fun m!1112277 () Bool)

(assert (=> d!133261 m!1112277))

(declare-fun m!1112279 () Bool)

(assert (=> d!133261 m!1112279))

(declare-fun m!1112281 () Bool)

(assert (=> b!1205966 m!1112281))

(declare-fun m!1112283 () Bool)

(assert (=> b!1205967 m!1112283))

(assert (=> b!1205636 d!133261))

(declare-fun d!133263 () Bool)

(assert (=> d!133263 (contains!6937 (+!4026 lt!546608 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!546805 () Unit!39894)

(assert (=> d!133263 (= lt!546805 (choose!1798 lt!546608 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!133263 (contains!6937 lt!546608 k0!934)))

(assert (=> d!133263 (= (addStillContains!1010 lt!546608 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!546805)))

(declare-fun bs!34110 () Bool)

(assert (= bs!34110 d!133263))

(declare-fun m!1112285 () Bool)

(assert (=> bs!34110 m!1112285))

(assert (=> bs!34110 m!1112285))

(declare-fun m!1112287 () Bool)

(assert (=> bs!34110 m!1112287))

(declare-fun m!1112289 () Bool)

(assert (=> bs!34110 m!1112289))

(declare-fun m!1112291 () Bool)

(assert (=> bs!34110 m!1112291))

(assert (=> b!1205636 d!133263))

(declare-fun d!133265 () Bool)

(declare-fun e!684941 () Bool)

(assert (=> d!133265 e!684941))

(declare-fun res!801921 () Bool)

(assert (=> d!133265 (=> res!801921 e!684941)))

(declare-fun lt!546808 () Bool)

(assert (=> d!133265 (= res!801921 (not lt!546808))))

(declare-fun lt!546807 () Bool)

(assert (=> d!133265 (= lt!546808 lt!546807)))

(declare-fun lt!546809 () Unit!39894)

(declare-fun e!684942 () Unit!39894)

(assert (=> d!133265 (= lt!546809 e!684942)))

(declare-fun c!118532 () Bool)

(assert (=> d!133265 (= c!118532 lt!546807)))

(assert (=> d!133265 (= lt!546807 (containsKey!591 (toList!8860 call!58267) k0!934))))

(assert (=> d!133265 (= (contains!6937 call!58267 k0!934) lt!546808)))

(declare-fun b!1205968 () Bool)

(declare-fun lt!546806 () Unit!39894)

(assert (=> b!1205968 (= e!684942 lt!546806)))

(assert (=> b!1205968 (= lt!546806 (lemmaContainsKeyImpliesGetValueByKeyDefined!419 (toList!8860 call!58267) k0!934))))

(assert (=> b!1205968 (isDefined!457 (getValueByKey!629 (toList!8860 call!58267) k0!934))))

(declare-fun b!1205969 () Bool)

(declare-fun Unit!39902 () Unit!39894)

(assert (=> b!1205969 (= e!684942 Unit!39902)))

(declare-fun b!1205970 () Bool)

(assert (=> b!1205970 (= e!684941 (isDefined!457 (getValueByKey!629 (toList!8860 call!58267) k0!934)))))

(assert (= (and d!133265 c!118532) b!1205968))

(assert (= (and d!133265 (not c!118532)) b!1205969))

(assert (= (and d!133265 (not res!801921)) b!1205970))

(declare-fun m!1112293 () Bool)

(assert (=> d!133265 m!1112293))

(declare-fun m!1112295 () Bool)

(assert (=> b!1205968 m!1112295))

(declare-fun m!1112297 () Bool)

(assert (=> b!1205968 m!1112297))

(assert (=> b!1205968 m!1112297))

(declare-fun m!1112299 () Bool)

(assert (=> b!1205968 m!1112299))

(assert (=> b!1205970 m!1112297))

(assert (=> b!1205970 m!1112297))

(assert (=> b!1205970 m!1112299))

(assert (=> b!1205636 d!133265))

(declare-fun b!1205971 () Bool)

(declare-fun e!684943 () Bool)

(assert (=> b!1205971 (= e!684943 (validKeyInArray!0 (select (arr!37655 (ite c!118460 lt!546605 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205971 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!133267 () Bool)

(declare-fun e!684949 () Bool)

(assert (=> d!133267 e!684949))

(declare-fun res!801924 () Bool)

(assert (=> d!133267 (=> (not res!801924) (not e!684949))))

(declare-fun lt!546813 () ListLongMap!17689)

(assert (=> d!133267 (= res!801924 (not (contains!6937 lt!546813 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!684946 () ListLongMap!17689)

(assert (=> d!133267 (= lt!546813 e!684946)))

(declare-fun c!118533 () Bool)

(assert (=> d!133267 (= c!118533 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (ite c!118460 lt!546605 _keys!1208))))))

(assert (=> d!133267 (validMask!0 mask!1564)))

(assert (=> d!133267 (= (getCurrentListMapNoExtraKeys!5326 (ite c!118460 lt!546605 _keys!1208) (ite c!118460 lt!546612 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546813)))

(declare-fun b!1205972 () Bool)

(assert (=> b!1205972 (= e!684946 (ListLongMap!17690 Nil!26519))))

(declare-fun b!1205973 () Bool)

(declare-fun e!684947 () Bool)

(assert (=> b!1205973 (= e!684949 e!684947)))

(declare-fun c!118535 () Bool)

(assert (=> b!1205973 (= c!118535 e!684943)))

(declare-fun res!801922 () Bool)

(assert (=> b!1205973 (=> (not res!801922) (not e!684943))))

(assert (=> b!1205973 (= res!801922 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (ite c!118460 lt!546605 _keys!1208))))))

(declare-fun b!1205974 () Bool)

(assert (=> b!1205974 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (ite c!118460 lt!546605 _keys!1208))))))

(assert (=> b!1205974 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38193 (ite c!118460 lt!546612 _values!996))))))

(declare-fun e!684944 () Bool)

(assert (=> b!1205974 (= e!684944 (= (apply!971 lt!546813 (select (arr!37655 (ite c!118460 lt!546605 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19242 (select (arr!37656 (ite c!118460 lt!546612 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!58336 () ListLongMap!17689)

(declare-fun bm!58333 () Bool)

(assert (=> bm!58333 (= call!58336 (getCurrentListMapNoExtraKeys!5326 (ite c!118460 lt!546605 _keys!1208) (ite c!118460 lt!546612 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205975 () Bool)

(declare-fun lt!546810 () Unit!39894)

(declare-fun lt!546812 () Unit!39894)

(assert (=> b!1205975 (= lt!546810 lt!546812)))

(declare-fun lt!546814 () ListLongMap!17689)

(declare-fun lt!546811 () (_ BitVec 64))

(declare-fun lt!546816 () V!45945)

(declare-fun lt!546815 () (_ BitVec 64))

(assert (=> b!1205975 (not (contains!6937 (+!4026 lt!546814 (tuple2!19713 lt!546815 lt!546816)) lt!546811))))

(assert (=> b!1205975 (= lt!546812 (addStillNotContains!292 lt!546814 lt!546815 lt!546816 lt!546811))))

(assert (=> b!1205975 (= lt!546811 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205975 (= lt!546816 (get!19242 (select (arr!37656 (ite c!118460 lt!546612 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205975 (= lt!546815 (select (arr!37655 (ite c!118460 lt!546605 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1205975 (= lt!546814 call!58336)))

(declare-fun e!684948 () ListLongMap!17689)

(assert (=> b!1205975 (= e!684948 (+!4026 call!58336 (tuple2!19713 (select (arr!37655 (ite c!118460 lt!546605 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19242 (select (arr!37656 (ite c!118460 lt!546612 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3251 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205976 () Bool)

(assert (=> b!1205976 (= e!684948 call!58336)))

(declare-fun b!1205977 () Bool)

(assert (=> b!1205977 (= e!684947 e!684944)))

(assert (=> b!1205977 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (ite c!118460 lt!546605 _keys!1208))))))

(declare-fun res!801923 () Bool)

(assert (=> b!1205977 (= res!801923 (contains!6937 lt!546813 (select (arr!37655 (ite c!118460 lt!546605 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205977 (=> (not res!801923) (not e!684944))))

(declare-fun b!1205978 () Bool)

(declare-fun e!684945 () Bool)

(assert (=> b!1205978 (= e!684945 (= lt!546813 (getCurrentListMapNoExtraKeys!5326 (ite c!118460 lt!546605 _keys!1208) (ite c!118460 lt!546612 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205979 () Bool)

(assert (=> b!1205979 (= e!684945 (isEmpty!988 lt!546813))))

(declare-fun b!1205980 () Bool)

(declare-fun res!801925 () Bool)

(assert (=> b!1205980 (=> (not res!801925) (not e!684949))))

(assert (=> b!1205980 (= res!801925 (not (contains!6937 lt!546813 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1205981 () Bool)

(assert (=> b!1205981 (= e!684946 e!684948)))

(declare-fun c!118536 () Bool)

(assert (=> b!1205981 (= c!118536 (validKeyInArray!0 (select (arr!37655 (ite c!118460 lt!546605 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1205982 () Bool)

(assert (=> b!1205982 (= e!684947 e!684945)))

(declare-fun c!118534 () Bool)

(assert (=> b!1205982 (= c!118534 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38192 (ite c!118460 lt!546605 _keys!1208))))))

(assert (= (and d!133267 c!118533) b!1205972))

(assert (= (and d!133267 (not c!118533)) b!1205981))

(assert (= (and b!1205981 c!118536) b!1205975))

(assert (= (and b!1205981 (not c!118536)) b!1205976))

(assert (= (or b!1205975 b!1205976) bm!58333))

(assert (= (and d!133267 res!801924) b!1205980))

(assert (= (and b!1205980 res!801925) b!1205973))

(assert (= (and b!1205973 res!801922) b!1205971))

(assert (= (and b!1205973 c!118535) b!1205977))

(assert (= (and b!1205973 (not c!118535)) b!1205982))

(assert (= (and b!1205977 res!801923) b!1205974))

(assert (= (and b!1205982 c!118534) b!1205978))

(assert (= (and b!1205982 (not c!118534)) b!1205979))

(declare-fun b_lambda!21249 () Bool)

(assert (=> (not b_lambda!21249) (not b!1205974)))

(assert (=> b!1205974 t!39402))

(declare-fun b_and!42797 () Bool)

(assert (= b_and!42795 (and (=> t!39402 result!21991) b_and!42797)))

(declare-fun b_lambda!21251 () Bool)

(assert (=> (not b_lambda!21251) (not b!1205975)))

(assert (=> b!1205975 t!39402))

(declare-fun b_and!42799 () Bool)

(assert (= b_and!42797 (and (=> t!39402 result!21991) b_and!42799)))

(declare-fun m!1112301 () Bool)

(assert (=> b!1205979 m!1112301))

(declare-fun m!1112303 () Bool)

(assert (=> bm!58333 m!1112303))

(declare-fun m!1112305 () Bool)

(assert (=> b!1205980 m!1112305))

(assert (=> b!1205975 m!1111953))

(declare-fun m!1112307 () Bool)

(assert (=> b!1205975 m!1112307))

(declare-fun m!1112309 () Bool)

(assert (=> b!1205975 m!1112309))

(assert (=> b!1205975 m!1112307))

(declare-fun m!1112311 () Bool)

(assert (=> b!1205975 m!1112311))

(declare-fun m!1112313 () Bool)

(assert (=> b!1205975 m!1112313))

(declare-fun m!1112315 () Bool)

(assert (=> b!1205975 m!1112315))

(assert (=> b!1205975 m!1111953))

(declare-fun m!1112317 () Bool)

(assert (=> b!1205975 m!1112317))

(declare-fun m!1112319 () Bool)

(assert (=> b!1205975 m!1112319))

(assert (=> b!1205975 m!1112315))

(assert (=> b!1205981 m!1112319))

(assert (=> b!1205981 m!1112319))

(declare-fun m!1112321 () Bool)

(assert (=> b!1205981 m!1112321))

(assert (=> b!1205971 m!1112319))

(assert (=> b!1205971 m!1112319))

(assert (=> b!1205971 m!1112321))

(assert (=> b!1205974 m!1111953))

(assert (=> b!1205974 m!1112319))

(declare-fun m!1112323 () Bool)

(assert (=> b!1205974 m!1112323))

(assert (=> b!1205974 m!1112315))

(assert (=> b!1205974 m!1111953))

(assert (=> b!1205974 m!1112317))

(assert (=> b!1205974 m!1112319))

(assert (=> b!1205974 m!1112315))

(assert (=> b!1205978 m!1112303))

(declare-fun m!1112325 () Bool)

(assert (=> d!133267 m!1112325))

(assert (=> d!133267 m!1111935))

(assert (=> b!1205977 m!1112319))

(assert (=> b!1205977 m!1112319))

(declare-fun m!1112327 () Bool)

(assert (=> b!1205977 m!1112327))

(assert (=> bm!58262 d!133267))

(declare-fun d!133269 () Bool)

(declare-fun e!684950 () Bool)

(assert (=> d!133269 e!684950))

(declare-fun res!801926 () Bool)

(assert (=> d!133269 (=> res!801926 e!684950)))

(declare-fun lt!546819 () Bool)

(assert (=> d!133269 (= res!801926 (not lt!546819))))

(declare-fun lt!546818 () Bool)

(assert (=> d!133269 (= lt!546819 lt!546818)))

(declare-fun lt!546820 () Unit!39894)

(declare-fun e!684951 () Unit!39894)

(assert (=> d!133269 (= lt!546820 e!684951)))

(declare-fun c!118537 () Bool)

(assert (=> d!133269 (= c!118537 lt!546818)))

(assert (=> d!133269 (= lt!546818 (containsKey!591 (toList!8860 (ite c!118461 lt!546608 call!58265)) k0!934))))

(assert (=> d!133269 (= (contains!6937 (ite c!118461 lt!546608 call!58265) k0!934) lt!546819)))

(declare-fun b!1205983 () Bool)

(declare-fun lt!546817 () Unit!39894)

(assert (=> b!1205983 (= e!684951 lt!546817)))

(assert (=> b!1205983 (= lt!546817 (lemmaContainsKeyImpliesGetValueByKeyDefined!419 (toList!8860 (ite c!118461 lt!546608 call!58265)) k0!934))))

(assert (=> b!1205983 (isDefined!457 (getValueByKey!629 (toList!8860 (ite c!118461 lt!546608 call!58265)) k0!934))))

(declare-fun b!1205984 () Bool)

(declare-fun Unit!39903 () Unit!39894)

(assert (=> b!1205984 (= e!684951 Unit!39903)))

(declare-fun b!1205985 () Bool)

(assert (=> b!1205985 (= e!684950 (isDefined!457 (getValueByKey!629 (toList!8860 (ite c!118461 lt!546608 call!58265)) k0!934)))))

(assert (= (and d!133269 c!118537) b!1205983))

(assert (= (and d!133269 (not c!118537)) b!1205984))

(assert (= (and d!133269 (not res!801926)) b!1205985))

(declare-fun m!1112329 () Bool)

(assert (=> d!133269 m!1112329))

(declare-fun m!1112331 () Bool)

(assert (=> b!1205983 m!1112331))

(declare-fun m!1112333 () Bool)

(assert (=> b!1205983 m!1112333))

(assert (=> b!1205983 m!1112333))

(declare-fun m!1112335 () Bool)

(assert (=> b!1205983 m!1112335))

(assert (=> b!1205985 m!1112333))

(assert (=> b!1205985 m!1112333))

(assert (=> b!1205985 m!1112335))

(assert (=> bm!58258 d!133269))

(declare-fun bm!58334 () Bool)

(declare-fun call!58337 () Bool)

(declare-fun c!118538 () Bool)

(assert (=> bm!58334 (= call!58337 (arrayNoDuplicates!0 lt!546605 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118538 (Cons!26519 (select (arr!37655 lt!546605) #b00000000000000000000000000000000) Nil!26520) Nil!26520)))))

(declare-fun b!1205986 () Bool)

(declare-fun e!684955 () Bool)

(declare-fun e!684953 () Bool)

(assert (=> b!1205986 (= e!684955 e!684953)))

(declare-fun res!801927 () Bool)

(assert (=> b!1205986 (=> (not res!801927) (not e!684953))))

(declare-fun e!684954 () Bool)

(assert (=> b!1205986 (= res!801927 (not e!684954))))

(declare-fun res!801929 () Bool)

(assert (=> b!1205986 (=> (not res!801929) (not e!684954))))

(assert (=> b!1205986 (= res!801929 (validKeyInArray!0 (select (arr!37655 lt!546605) #b00000000000000000000000000000000)))))

(declare-fun b!1205987 () Bool)

(assert (=> b!1205987 (= e!684954 (contains!6941 Nil!26520 (select (arr!37655 lt!546605) #b00000000000000000000000000000000)))))

(declare-fun d!133271 () Bool)

(declare-fun res!801928 () Bool)

(assert (=> d!133271 (=> res!801928 e!684955)))

(assert (=> d!133271 (= res!801928 (bvsge #b00000000000000000000000000000000 (size!38192 lt!546605)))))

(assert (=> d!133271 (= (arrayNoDuplicates!0 lt!546605 #b00000000000000000000000000000000 Nil!26520) e!684955)))

(declare-fun b!1205988 () Bool)

(declare-fun e!684952 () Bool)

(assert (=> b!1205988 (= e!684952 call!58337)))

(declare-fun b!1205989 () Bool)

(assert (=> b!1205989 (= e!684953 e!684952)))

(assert (=> b!1205989 (= c!118538 (validKeyInArray!0 (select (arr!37655 lt!546605) #b00000000000000000000000000000000)))))

(declare-fun b!1205990 () Bool)

(assert (=> b!1205990 (= e!684952 call!58337)))

(assert (= (and d!133271 (not res!801928)) b!1205986))

(assert (= (and b!1205986 res!801929) b!1205987))

(assert (= (and b!1205986 res!801927) b!1205989))

(assert (= (and b!1205989 c!118538) b!1205990))

(assert (= (and b!1205989 (not c!118538)) b!1205988))

(assert (= (or b!1205990 b!1205988) bm!58334))

(assert (=> bm!58334 m!1112151))

(declare-fun m!1112337 () Bool)

(assert (=> bm!58334 m!1112337))

(assert (=> b!1205986 m!1112151))

(assert (=> b!1205986 m!1112151))

(assert (=> b!1205986 m!1112153))

(assert (=> b!1205987 m!1112151))

(assert (=> b!1205987 m!1112151))

(declare-fun m!1112339 () Bool)

(assert (=> b!1205987 m!1112339))

(assert (=> b!1205989 m!1112151))

(assert (=> b!1205989 m!1112151))

(assert (=> b!1205989 m!1112153))

(assert (=> b!1205648 d!133271))

(declare-fun d!133273 () Bool)

(assert (=> d!133273 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1205649 d!133273))

(assert (=> b!1205633 d!133241))

(declare-fun b!1205998 () Bool)

(declare-fun e!684960 () Bool)

(assert (=> b!1205998 (= e!684960 tp_is_empty!30613)))

(declare-fun b!1205997 () Bool)

(declare-fun e!684961 () Bool)

(assert (=> b!1205997 (= e!684961 tp_is_empty!30613)))

(declare-fun mapNonEmpty!47778 () Bool)

(declare-fun mapRes!47778 () Bool)

(declare-fun tp!90739 () Bool)

(assert (=> mapNonEmpty!47778 (= mapRes!47778 (and tp!90739 e!684961))))

(declare-fun mapValue!47778 () ValueCell!14597)

(declare-fun mapRest!47778 () (Array (_ BitVec 32) ValueCell!14597))

(declare-fun mapKey!47778 () (_ BitVec 32))

(assert (=> mapNonEmpty!47778 (= mapRest!47769 (store mapRest!47778 mapKey!47778 mapValue!47778))))

(declare-fun condMapEmpty!47778 () Bool)

(declare-fun mapDefault!47778 () ValueCell!14597)

(assert (=> mapNonEmpty!47769 (= condMapEmpty!47778 (= mapRest!47769 ((as const (Array (_ BitVec 32) ValueCell!14597)) mapDefault!47778)))))

(assert (=> mapNonEmpty!47769 (= tp!90723 (and e!684960 mapRes!47778))))

(declare-fun mapIsEmpty!47778 () Bool)

(assert (=> mapIsEmpty!47778 mapRes!47778))

(assert (= (and mapNonEmpty!47769 condMapEmpty!47778) mapIsEmpty!47778))

(assert (= (and mapNonEmpty!47769 (not condMapEmpty!47778)) mapNonEmpty!47778))

(assert (= (and mapNonEmpty!47778 ((_ is ValueCellFull!14597) mapValue!47778)) b!1205997))

(assert (= (and mapNonEmpty!47769 ((_ is ValueCellFull!14597) mapDefault!47778)) b!1205998))

(declare-fun m!1112341 () Bool)

(assert (=> mapNonEmpty!47778 m!1112341))

(declare-fun b_lambda!21253 () Bool)

(assert (= b_lambda!21233 (or (and start!100914 b_free!25909) b_lambda!21253)))

(declare-fun b_lambda!21255 () Bool)

(assert (= b_lambda!21247 (or (and start!100914 b_free!25909) b_lambda!21255)))

(declare-fun b_lambda!21257 () Bool)

(assert (= b_lambda!21231 (or (and start!100914 b_free!25909) b_lambda!21257)))

(declare-fun b_lambda!21259 () Bool)

(assert (= b_lambda!21237 (or (and start!100914 b_free!25909) b_lambda!21259)))

(declare-fun b_lambda!21261 () Bool)

(assert (= b_lambda!21251 (or (and start!100914 b_free!25909) b_lambda!21261)))

(declare-fun b_lambda!21263 () Bool)

(assert (= b_lambda!21241 (or (and start!100914 b_free!25909) b_lambda!21263)))

(declare-fun b_lambda!21265 () Bool)

(assert (= b_lambda!21235 (or (and start!100914 b_free!25909) b_lambda!21265)))

(declare-fun b_lambda!21267 () Bool)

(assert (= b_lambda!21243 (or (and start!100914 b_free!25909) b_lambda!21267)))

(declare-fun b_lambda!21269 () Bool)

(assert (= b_lambda!21249 (or (and start!100914 b_free!25909) b_lambda!21269)))

(declare-fun b_lambda!21271 () Bool)

(assert (= b_lambda!21245 (or (and start!100914 b_free!25909) b_lambda!21271)))

(declare-fun b_lambda!21273 () Bool)

(assert (= b_lambda!21239 (or (and start!100914 b_free!25909) b_lambda!21273)))

(check-sat (not bm!58322) (not b!1205840) (not b_lambda!21253) (not b!1205980) (not b!1205957) (not b!1205874) (not b_lambda!21265) (not bm!58332) (not b!1205873) (not b!1205942) (not b!1205918) (not d!133265) (not d!133267) (not b_lambda!21267) (not d!133261) (not b!1205971) (not b!1205970) (not d!133229) (not b!1205917) (not b!1205978) (not b_lambda!21257) (not b!1205945) b_and!42799 (not b!1205951) (not b_lambda!21255) (not b!1205962) (not bm!58334) (not b_lambda!21261) (not b!1205909) (not b!1205883) (not b!1205913) (not d!133249) (not b!1205983) (not b!1205974) (not b!1205956) (not b!1205939) (not b!1205831) (not b!1205977) (not b!1205902) (not b!1205842) (not b!1205944) (not b!1205963) (not b_lambda!21273) (not bm!58331) (not b!1205884) (not b!1205916) (not bm!58326) (not b!1205931) (not b!1205981) (not bm!58325) (not b!1205867) (not b!1205877) (not b!1205955) (not b!1205968) (not d!133225) (not d!133223) (not b!1205987) (not b!1205986) (not bm!58329) (not bm!58333) (not b!1205870) (not b!1205948) (not b!1205893) (not b!1205907) (not b!1205875) (not d!133237) (not b!1205934) (not b!1205894) (not b!1205936) (not mapNonEmpty!47778) (not b!1205919) (not b!1205967) (not bm!58330) (not d!133253) (not b!1205958) (not d!133243) (not bm!58318) (not b!1205912) (not b_next!25909) (not b!1205915) (not b_lambda!21259) tp_is_empty!30613 (not b!1205979) (not b!1205961) (not b_lambda!21229) (not b!1205952) (not b!1205989) (not b!1205871) (not b!1205975) (not d!133251) (not d!133231) (not b_lambda!21263) (not d!133263) (not bm!58319) (not b_lambda!21271) (not b!1205946) (not b!1205985) (not b!1205943) (not b!1205876) (not d!133269) (not b!1205932) (not b!1205940) (not b_lambda!21269) (not d!133257) (not d!133245) (not b!1205954) (not b!1205966))
(check-sat b_and!42799 (not b_next!25909))
