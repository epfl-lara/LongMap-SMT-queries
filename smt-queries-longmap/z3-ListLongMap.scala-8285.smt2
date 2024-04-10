; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100948 () Bool)

(assert start!100948)

(declare-fun b_free!25983 () Bool)

(declare-fun b_next!25983 () Bool)

(assert (=> start!100948 (= b_free!25983 (not b_next!25983))))

(declare-fun tp!90961 () Bool)

(declare-fun b_and!43029 () Bool)

(assert (=> start!100948 (= tp!90961 b_and!43029)))

(declare-fun b!1208751 () Bool)

(declare-fun res!803447 () Bool)

(declare-fun e!686498 () Bool)

(assert (=> b!1208751 (=> res!803447 e!686498)))

(declare-datatypes ((List!26568 0))(
  ( (Nil!26565) (Cons!26564 (h!27773 (_ BitVec 64)) (t!39531 List!26568)) )
))
(declare-fun noDuplicate!1625 (List!26568) Bool)

(assert (=> b!1208751 (= res!803447 (not (noDuplicate!1625 Nil!26565)))))

(declare-fun b!1208752 () Bool)

(declare-fun e!686503 () Bool)

(declare-fun tp_is_empty!30687 () Bool)

(assert (=> b!1208752 (= e!686503 tp_is_empty!30687)))

(declare-fun b!1208753 () Bool)

(declare-fun e!686488 () Bool)

(declare-fun e!686491 () Bool)

(assert (=> b!1208753 (= e!686488 (not e!686491))))

(declare-fun res!803450 () Bool)

(assert (=> b!1208753 (=> res!803450 e!686491)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208753 (= res!803450 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78157 0))(
  ( (array!78158 (arr!37716 (Array (_ BitVec 32) (_ BitVec 64))) (size!38252 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78157)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208753 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40065 0))(
  ( (Unit!40066) )
))
(declare-fun lt!548600 () Unit!40065)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78157 (_ BitVec 64) (_ BitVec 32)) Unit!40065)

(assert (=> b!1208753 (= lt!548600 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1208754 () Bool)

(declare-fun e!686502 () Bool)

(assert (=> b!1208754 (= e!686502 e!686488)))

(declare-fun res!803436 () Bool)

(assert (=> b!1208754 (=> (not res!803436) (not e!686488))))

(declare-fun lt!548601 () array!78157)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78157 (_ BitVec 32)) Bool)

(assert (=> b!1208754 (= res!803436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548601 mask!1564))))

(assert (=> b!1208754 (= lt!548601 (array!78158 (store (arr!37716 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38252 _keys!1208)))))

(declare-fun b!1208755 () Bool)

(declare-fun res!803449 () Bool)

(assert (=> b!1208755 (=> (not res!803449) (not e!686502))))

(assert (=> b!1208755 (= res!803449 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38252 _keys!1208))))))

(declare-fun bm!59213 () Bool)

(declare-datatypes ((V!46043 0))(
  ( (V!46044 (val!15400 Int)) )
))
(declare-datatypes ((tuple2!19766 0))(
  ( (tuple2!19767 (_1!9894 (_ BitVec 64)) (_2!9894 V!46043)) )
))
(declare-datatypes ((List!26569 0))(
  ( (Nil!26566) (Cons!26565 (h!27774 tuple2!19766) (t!39532 List!26569)) )
))
(declare-datatypes ((ListLongMap!17735 0))(
  ( (ListLongMap!17736 (toList!8883 List!26569)) )
))
(declare-fun call!59222 () ListLongMap!17735)

(declare-fun call!59223 () ListLongMap!17735)

(assert (=> bm!59213 (= call!59222 call!59223)))

(declare-fun bm!59214 () Bool)

(declare-fun call!59218 () Bool)

(declare-fun call!59217 () Bool)

(assert (=> bm!59214 (= call!59218 call!59217)))

(declare-fun e!686496 () Bool)

(declare-fun b!1208756 () Bool)

(assert (=> b!1208756 (= e!686496 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208757 () Bool)

(declare-fun e!686500 () Bool)

(assert (=> b!1208757 (= e!686500 e!686498)))

(declare-fun res!803435 () Bool)

(assert (=> b!1208757 (=> res!803435 e!686498)))

(assert (=> b!1208757 (= res!803435 (or (bvsge (size!38252 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 _keys!1208)) (bvsge from!1455 (size!38252 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!78157 (_ BitVec 32) List!26568) Bool)

(assert (=> b!1208757 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26565)))

(declare-fun lt!548606 () Unit!40065)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78157 (_ BitVec 32) (_ BitVec 32)) Unit!40065)

(assert (=> b!1208757 (= lt!548606 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1208757 e!686496))

(declare-fun res!803434 () Bool)

(assert (=> b!1208757 (=> (not res!803434) (not e!686496))))

(declare-fun e!686489 () Bool)

(assert (=> b!1208757 (= res!803434 e!686489)))

(declare-fun c!118948 () Bool)

(assert (=> b!1208757 (= c!118948 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!46043)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14634 0))(
  ( (ValueCellFull!14634 (v!18049 V!46043)) (EmptyCell!14634) )
))
(declare-datatypes ((array!78159 0))(
  ( (array!78160 (arr!37717 (Array (_ BitVec 32) ValueCell!14634)) (size!38253 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78159)

(declare-fun lt!548610 () Unit!40065)

(declare-fun minValue!944 () V!46043)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!585 (array!78157 array!78159 (_ BitVec 32) (_ BitVec 32) V!46043 V!46043 (_ BitVec 64) (_ BitVec 32) Int) Unit!40065)

(assert (=> b!1208757 (= lt!548610 (lemmaListMapContainsThenArrayContainsFrom!585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548605 () Unit!40065)

(declare-fun e!686497 () Unit!40065)

(assert (=> b!1208757 (= lt!548605 e!686497)))

(declare-fun c!118947 () Bool)

(declare-fun lt!548613 () Bool)

(assert (=> b!1208757 (= c!118947 (and (not lt!548613) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1208757 (= lt!548613 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!59215 () Bool)

(declare-fun call!59219 () ListLongMap!17735)

(declare-fun getCurrentListMapNoExtraKeys!5317 (array!78157 array!78159 (_ BitVec 32) (_ BitVec 32) V!46043 V!46043 (_ BitVec 32) Int) ListLongMap!17735)

(assert (=> bm!59215 (= call!59219 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208758 () Bool)

(declare-fun e!686494 () Bool)

(assert (=> b!1208758 (= e!686498 e!686494)))

(declare-fun res!803445 () Bool)

(assert (=> b!1208758 (=> (not res!803445) (not e!686494))))

(declare-fun contains!6946 (List!26568 (_ BitVec 64)) Bool)

(assert (=> b!1208758 (= res!803445 (not (contains!6946 Nil!26565 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!59221 () ListLongMap!17735)

(declare-fun bm!59216 () Bool)

(declare-fun lt!548609 () array!78159)

(assert (=> bm!59216 (= call!59221 (getCurrentListMapNoExtraKeys!5317 lt!548601 lt!548609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208759 () Bool)

(declare-fun e!686492 () Bool)

(assert (=> b!1208759 (= e!686491 e!686492)))

(declare-fun res!803437 () Bool)

(assert (=> b!1208759 (=> res!803437 e!686492)))

(assert (=> b!1208759 (= res!803437 (not (= from!1455 i!673)))))

(declare-fun lt!548603 () ListLongMap!17735)

(assert (=> b!1208759 (= lt!548603 (getCurrentListMapNoExtraKeys!5317 lt!548601 lt!548609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3218 (Int (_ BitVec 64)) V!46043)

(assert (=> b!1208759 (= lt!548609 (array!78160 (store (arr!37717 _values!996) i!673 (ValueCellFull!14634 (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38253 _values!996)))))

(declare-fun lt!548612 () ListLongMap!17735)

(assert (=> b!1208759 (= lt!548612 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!686495 () Bool)

(declare-fun b!1208760 () Bool)

(declare-fun -!1837 (ListLongMap!17735 (_ BitVec 64)) ListLongMap!17735)

(assert (=> b!1208760 (= e!686495 (= call!59221 (-!1837 call!59219 k0!934)))))

(declare-fun b!1208761 () Bool)

(declare-fun res!803443 () Bool)

(assert (=> b!1208761 (=> (not res!803443) (not e!686502))))

(assert (=> b!1208761 (= res!803443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1208762 () Bool)

(declare-fun c!118950 () Bool)

(assert (=> b!1208762 (= c!118950 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548613))))

(declare-fun e!686504 () Unit!40065)

(declare-fun e!686501 () Unit!40065)

(assert (=> b!1208762 (= e!686504 e!686501)))

(declare-fun lt!548604 () ListLongMap!17735)

(declare-fun c!118946 () Bool)

(declare-fun bm!59217 () Bool)

(declare-fun call!59216 () Unit!40065)

(declare-fun addStillContains!1031 (ListLongMap!17735 (_ BitVec 64) V!46043 (_ BitVec 64)) Unit!40065)

(assert (=> bm!59217 (= call!59216 (addStillContains!1031 lt!548604 (ite (or c!118947 c!118946) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118947 c!118946) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1208763 () Bool)

(declare-fun e!686499 () Bool)

(declare-fun mapRes!47896 () Bool)

(assert (=> b!1208763 (= e!686499 (and e!686503 mapRes!47896))))

(declare-fun condMapEmpty!47896 () Bool)

(declare-fun mapDefault!47896 () ValueCell!14634)

(assert (=> b!1208763 (= condMapEmpty!47896 (= (arr!37717 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14634)) mapDefault!47896)))))

(declare-fun bm!59218 () Bool)

(declare-fun +!4002 (ListLongMap!17735 tuple2!19766) ListLongMap!17735)

(assert (=> bm!59218 (= call!59223 (+!4002 lt!548604 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1208764 () Bool)

(assert (=> b!1208764 (= e!686489 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!47896 () Bool)

(assert (=> mapIsEmpty!47896 mapRes!47896))

(declare-fun b!1208765 () Bool)

(assert (=> b!1208765 call!59218))

(declare-fun lt!548614 () Unit!40065)

(declare-fun call!59220 () Unit!40065)

(assert (=> b!1208765 (= lt!548614 call!59220)))

(assert (=> b!1208765 (= e!686504 lt!548614)))

(declare-fun b!1208766 () Bool)

(declare-fun Unit!40067 () Unit!40065)

(assert (=> b!1208766 (= e!686501 Unit!40067)))

(declare-fun b!1208767 () Bool)

(declare-fun lt!548602 () Unit!40065)

(assert (=> b!1208767 (= e!686497 lt!548602)))

(declare-fun lt!548608 () Unit!40065)

(assert (=> b!1208767 (= lt!548608 call!59216)))

(declare-fun lt!548615 () ListLongMap!17735)

(assert (=> b!1208767 (= lt!548615 call!59223)))

(assert (=> b!1208767 call!59217))

(assert (=> b!1208767 (= lt!548602 (addStillContains!1031 lt!548615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6947 (ListLongMap!17735 (_ BitVec 64)) Bool)

(assert (=> b!1208767 (contains!6947 (+!4002 lt!548615 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1208768 () Bool)

(declare-fun lt!548611 () Unit!40065)

(assert (=> b!1208768 (= e!686501 lt!548611)))

(assert (=> b!1208768 (= lt!548611 call!59220)))

(assert (=> b!1208768 call!59218))

(declare-fun b!1208769 () Bool)

(assert (=> b!1208769 (= e!686497 e!686504)))

(assert (=> b!1208769 (= c!118946 (and (not lt!548613) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1208770 () Bool)

(declare-fun res!803438 () Bool)

(assert (=> b!1208770 (=> (not res!803438) (not e!686502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1208770 (= res!803438 (validMask!0 mask!1564))))

(declare-fun b!1208771 () Bool)

(assert (=> b!1208771 (= e!686489 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548613) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1208772 () Bool)

(declare-fun res!803444 () Bool)

(assert (=> b!1208772 (=> (not res!803444) (not e!686502))))

(assert (=> b!1208772 (= res!803444 (= (select (arr!37716 _keys!1208) i!673) k0!934))))

(declare-fun bm!59219 () Bool)

(assert (=> bm!59219 (= call!59217 (contains!6947 (ite c!118947 lt!548615 call!59222) k0!934))))

(declare-fun b!1208773 () Bool)

(declare-fun e!686505 () Bool)

(assert (=> b!1208773 (= e!686492 e!686505)))

(declare-fun res!803433 () Bool)

(assert (=> b!1208773 (=> res!803433 e!686505)))

(assert (=> b!1208773 (= res!803433 (not (= (select (arr!37716 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1208773 e!686495))

(declare-fun c!118949 () Bool)

(assert (=> b!1208773 (= c!118949 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548607 () Unit!40065)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1045 (array!78157 array!78159 (_ BitVec 32) (_ BitVec 32) V!46043 V!46043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40065)

(assert (=> b!1208773 (= lt!548607 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1045 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47896 () Bool)

(declare-fun tp!90962 () Bool)

(declare-fun e!686493 () Bool)

(assert (=> mapNonEmpty!47896 (= mapRes!47896 (and tp!90962 e!686493))))

(declare-fun mapValue!47896 () ValueCell!14634)

(declare-fun mapKey!47896 () (_ BitVec 32))

(declare-fun mapRest!47896 () (Array (_ BitVec 32) ValueCell!14634))

(assert (=> mapNonEmpty!47896 (= (arr!37717 _values!996) (store mapRest!47896 mapKey!47896 mapValue!47896))))

(declare-fun res!803441 () Bool)

(assert (=> start!100948 (=> (not res!803441) (not e!686502))))

(assert (=> start!100948 (= res!803441 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38252 _keys!1208))))))

(assert (=> start!100948 e!686502))

(assert (=> start!100948 tp_is_empty!30687))

(declare-fun array_inv!28728 (array!78157) Bool)

(assert (=> start!100948 (array_inv!28728 _keys!1208)))

(assert (=> start!100948 true))

(assert (=> start!100948 tp!90961))

(declare-fun array_inv!28729 (array!78159) Bool)

(assert (=> start!100948 (and (array_inv!28729 _values!996) e!686499)))

(declare-fun b!1208774 () Bool)

(declare-fun res!803440 () Bool)

(assert (=> b!1208774 (=> (not res!803440) (not e!686502))))

(assert (=> b!1208774 (= res!803440 (and (= (size!38253 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38252 _keys!1208) (size!38253 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1208775 () Bool)

(declare-fun res!803442 () Bool)

(assert (=> b!1208775 (=> (not res!803442) (not e!686502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1208775 (= res!803442 (validKeyInArray!0 k0!934))))

(declare-fun b!1208776 () Bool)

(assert (=> b!1208776 (= e!686494 (not (contains!6946 Nil!26565 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208777 () Bool)

(assert (=> b!1208777 (= e!686493 tp_is_empty!30687)))

(declare-fun b!1208778 () Bool)

(assert (=> b!1208778 (= e!686495 (= call!59221 call!59219))))

(declare-fun bm!59220 () Bool)

(assert (=> bm!59220 (= call!59220 call!59216)))

(declare-fun b!1208779 () Bool)

(declare-fun res!803448 () Bool)

(assert (=> b!1208779 (=> (not res!803448) (not e!686488))))

(assert (=> b!1208779 (= res!803448 (arrayNoDuplicates!0 lt!548601 #b00000000000000000000000000000000 Nil!26565))))

(declare-fun b!1208780 () Bool)

(assert (=> b!1208780 (= e!686505 e!686500)))

(declare-fun res!803439 () Bool)

(assert (=> b!1208780 (=> res!803439 e!686500)))

(assert (=> b!1208780 (= res!803439 (not (contains!6947 lt!548604 k0!934)))))

(assert (=> b!1208780 (= lt!548604 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208781 () Bool)

(declare-fun res!803446 () Bool)

(assert (=> b!1208781 (=> (not res!803446) (not e!686502))))

(assert (=> b!1208781 (= res!803446 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26565))))

(assert (= (and start!100948 res!803441) b!1208770))

(assert (= (and b!1208770 res!803438) b!1208774))

(assert (= (and b!1208774 res!803440) b!1208761))

(assert (= (and b!1208761 res!803443) b!1208781))

(assert (= (and b!1208781 res!803446) b!1208755))

(assert (= (and b!1208755 res!803449) b!1208775))

(assert (= (and b!1208775 res!803442) b!1208772))

(assert (= (and b!1208772 res!803444) b!1208754))

(assert (= (and b!1208754 res!803436) b!1208779))

(assert (= (and b!1208779 res!803448) b!1208753))

(assert (= (and b!1208753 (not res!803450)) b!1208759))

(assert (= (and b!1208759 (not res!803437)) b!1208773))

(assert (= (and b!1208773 c!118949) b!1208760))

(assert (= (and b!1208773 (not c!118949)) b!1208778))

(assert (= (or b!1208760 b!1208778) bm!59216))

(assert (= (or b!1208760 b!1208778) bm!59215))

(assert (= (and b!1208773 (not res!803433)) b!1208780))

(assert (= (and b!1208780 (not res!803439)) b!1208757))

(assert (= (and b!1208757 c!118947) b!1208767))

(assert (= (and b!1208757 (not c!118947)) b!1208769))

(assert (= (and b!1208769 c!118946) b!1208765))

(assert (= (and b!1208769 (not c!118946)) b!1208762))

(assert (= (and b!1208762 c!118950) b!1208768))

(assert (= (and b!1208762 (not c!118950)) b!1208766))

(assert (= (or b!1208765 b!1208768) bm!59220))

(assert (= (or b!1208765 b!1208768) bm!59213))

(assert (= (or b!1208765 b!1208768) bm!59214))

(assert (= (or b!1208767 bm!59214) bm!59219))

(assert (= (or b!1208767 bm!59220) bm!59217))

(assert (= (or b!1208767 bm!59213) bm!59218))

(assert (= (and b!1208757 c!118948) b!1208764))

(assert (= (and b!1208757 (not c!118948)) b!1208771))

(assert (= (and b!1208757 res!803434) b!1208756))

(assert (= (and b!1208757 (not res!803435)) b!1208751))

(assert (= (and b!1208751 (not res!803447)) b!1208758))

(assert (= (and b!1208758 res!803445) b!1208776))

(assert (= (and b!1208763 condMapEmpty!47896) mapIsEmpty!47896))

(assert (= (and b!1208763 (not condMapEmpty!47896)) mapNonEmpty!47896))

(get-info :version)

(assert (= (and mapNonEmpty!47896 ((_ is ValueCellFull!14634) mapValue!47896)) b!1208777))

(assert (= (and b!1208763 ((_ is ValueCellFull!14634) mapDefault!47896)) b!1208752))

(assert (= start!100948 b!1208763))

(declare-fun b_lambda!21545 () Bool)

(assert (=> (not b_lambda!21545) (not b!1208759)))

(declare-fun t!39530 () Bool)

(declare-fun tb!10783 () Bool)

(assert (=> (and start!100948 (= defaultEntry!1004 defaultEntry!1004) t!39530) tb!10783))

(declare-fun result!22157 () Bool)

(assert (=> tb!10783 (= result!22157 tp_is_empty!30687)))

(assert (=> b!1208759 t!39530))

(declare-fun b_and!43031 () Bool)

(assert (= b_and!43029 (and (=> t!39530 result!22157) b_and!43031)))

(declare-fun m!1114543 () Bool)

(assert (=> b!1208764 m!1114543))

(declare-fun m!1114545 () Bool)

(assert (=> b!1208779 m!1114545))

(declare-fun m!1114547 () Bool)

(assert (=> b!1208775 m!1114547))

(declare-fun m!1114549 () Bool)

(assert (=> bm!59219 m!1114549))

(declare-fun m!1114551 () Bool)

(assert (=> b!1208776 m!1114551))

(declare-fun m!1114553 () Bool)

(assert (=> bm!59217 m!1114553))

(assert (=> b!1208756 m!1114543))

(declare-fun m!1114555 () Bool)

(assert (=> b!1208757 m!1114555))

(declare-fun m!1114557 () Bool)

(assert (=> b!1208757 m!1114557))

(declare-fun m!1114559 () Bool)

(assert (=> b!1208757 m!1114559))

(declare-fun m!1114561 () Bool)

(assert (=> b!1208759 m!1114561))

(declare-fun m!1114563 () Bool)

(assert (=> b!1208759 m!1114563))

(declare-fun m!1114565 () Bool)

(assert (=> b!1208759 m!1114565))

(declare-fun m!1114567 () Bool)

(assert (=> b!1208759 m!1114567))

(declare-fun m!1114569 () Bool)

(assert (=> b!1208780 m!1114569))

(declare-fun m!1114571 () Bool)

(assert (=> b!1208780 m!1114571))

(declare-fun m!1114573 () Bool)

(assert (=> b!1208770 m!1114573))

(declare-fun m!1114575 () Bool)

(assert (=> b!1208767 m!1114575))

(declare-fun m!1114577 () Bool)

(assert (=> b!1208767 m!1114577))

(assert (=> b!1208767 m!1114577))

(declare-fun m!1114579 () Bool)

(assert (=> b!1208767 m!1114579))

(declare-fun m!1114581 () Bool)

(assert (=> b!1208761 m!1114581))

(declare-fun m!1114583 () Bool)

(assert (=> bm!59218 m!1114583))

(assert (=> bm!59215 m!1114571))

(declare-fun m!1114585 () Bool)

(assert (=> bm!59216 m!1114585))

(declare-fun m!1114587 () Bool)

(assert (=> b!1208772 m!1114587))

(declare-fun m!1114589 () Bool)

(assert (=> b!1208753 m!1114589))

(declare-fun m!1114591 () Bool)

(assert (=> b!1208753 m!1114591))

(declare-fun m!1114593 () Bool)

(assert (=> mapNonEmpty!47896 m!1114593))

(declare-fun m!1114595 () Bool)

(assert (=> start!100948 m!1114595))

(declare-fun m!1114597 () Bool)

(assert (=> start!100948 m!1114597))

(declare-fun m!1114599 () Bool)

(assert (=> b!1208758 m!1114599))

(declare-fun m!1114601 () Bool)

(assert (=> b!1208754 m!1114601))

(declare-fun m!1114603 () Bool)

(assert (=> b!1208754 m!1114603))

(declare-fun m!1114605 () Bool)

(assert (=> b!1208760 m!1114605))

(declare-fun m!1114607 () Bool)

(assert (=> b!1208773 m!1114607))

(declare-fun m!1114609 () Bool)

(assert (=> b!1208773 m!1114609))

(declare-fun m!1114611 () Bool)

(assert (=> b!1208751 m!1114611))

(declare-fun m!1114613 () Bool)

(assert (=> b!1208781 m!1114613))

(check-sat (not b!1208753) (not b!1208781) tp_is_empty!30687 (not b!1208767) (not b!1208758) (not b!1208773) (not b!1208761) (not b!1208770) (not b!1208756) (not b!1208754) (not b!1208751) (not b!1208760) (not b!1208775) b_and!43031 (not b!1208757) (not b_next!25983) (not bm!59218) (not b!1208764) (not bm!59217) (not b!1208779) (not b!1208759) (not bm!59216) (not b!1208780) (not mapNonEmpty!47896) (not bm!59215) (not b_lambda!21545) (not bm!59219) (not start!100948) (not b!1208776))
(check-sat b_and!43031 (not b_next!25983))
(get-model)

(declare-fun b_lambda!21549 () Bool)

(assert (= b_lambda!21545 (or (and start!100948 b_free!25983) b_lambda!21549)))

(check-sat (not b!1208753) (not b!1208781) tp_is_empty!30687 (not b!1208767) (not b!1208758) (not b!1208773) (not b!1208761) (not bm!59219) (not b!1208770) (not b_lambda!21549) (not b!1208756) (not b!1208754) (not b!1208751) (not b!1208760) (not b!1208775) b_and!43031 (not b!1208757) (not b_next!25983) (not bm!59218) (not b!1208764) (not bm!59217) (not b!1208779) (not b!1208759) (not bm!59216) (not b!1208780) (not mapNonEmpty!47896) (not bm!59215) (not start!100948) (not b!1208776))
(check-sat b_and!43031 (not b_next!25983))
(get-model)

(declare-fun b!1208887 () Bool)

(declare-fun e!686568 () Bool)

(declare-fun call!59250 () Bool)

(assert (=> b!1208887 (= e!686568 call!59250)))

(declare-fun b!1208888 () Bool)

(declare-fun e!686567 () Bool)

(assert (=> b!1208888 (= e!686567 call!59250)))

(declare-fun bm!59247 () Bool)

(assert (=> bm!59247 (= call!59250 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!548601 mask!1564))))

(declare-fun b!1208890 () Bool)

(assert (=> b!1208890 (= e!686567 e!686568)))

(declare-fun lt!548672 () (_ BitVec 64))

(assert (=> b!1208890 (= lt!548672 (select (arr!37716 lt!548601) #b00000000000000000000000000000000))))

(declare-fun lt!548671 () Unit!40065)

(assert (=> b!1208890 (= lt!548671 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!548601 lt!548672 #b00000000000000000000000000000000))))

(assert (=> b!1208890 (arrayContainsKey!0 lt!548601 lt!548672 #b00000000000000000000000000000000)))

(declare-fun lt!548670 () Unit!40065)

(assert (=> b!1208890 (= lt!548670 lt!548671)))

(declare-fun res!803509 () Bool)

(declare-datatypes ((SeekEntryResult!9940 0))(
  ( (MissingZero!9940 (index!42131 (_ BitVec 32))) (Found!9940 (index!42132 (_ BitVec 32))) (Intermediate!9940 (undefined!10752 Bool) (index!42133 (_ BitVec 32)) (x!106650 (_ BitVec 32))) (Undefined!9940) (MissingVacant!9940 (index!42134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78157 (_ BitVec 32)) SeekEntryResult!9940)

(assert (=> b!1208890 (= res!803509 (= (seekEntryOrOpen!0 (select (arr!37716 lt!548601) #b00000000000000000000000000000000) lt!548601 mask!1564) (Found!9940 #b00000000000000000000000000000000)))))

(assert (=> b!1208890 (=> (not res!803509) (not e!686568))))

(declare-fun d!133279 () Bool)

(declare-fun res!803510 () Bool)

(declare-fun e!686566 () Bool)

(assert (=> d!133279 (=> res!803510 e!686566)))

(assert (=> d!133279 (= res!803510 (bvsge #b00000000000000000000000000000000 (size!38252 lt!548601)))))

(assert (=> d!133279 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548601 mask!1564) e!686566)))

(declare-fun b!1208889 () Bool)

(assert (=> b!1208889 (= e!686566 e!686567)))

(declare-fun c!118968 () Bool)

(assert (=> b!1208889 (= c!118968 (validKeyInArray!0 (select (arr!37716 lt!548601) #b00000000000000000000000000000000)))))

(assert (= (and d!133279 (not res!803510)) b!1208889))

(assert (= (and b!1208889 c!118968) b!1208890))

(assert (= (and b!1208889 (not c!118968)) b!1208888))

(assert (= (and b!1208890 res!803509) b!1208887))

(assert (= (or b!1208887 b!1208888) bm!59247))

(declare-fun m!1114687 () Bool)

(assert (=> bm!59247 m!1114687))

(declare-fun m!1114689 () Bool)

(assert (=> b!1208890 m!1114689))

(declare-fun m!1114691 () Bool)

(assert (=> b!1208890 m!1114691))

(declare-fun m!1114693 () Bool)

(assert (=> b!1208890 m!1114693))

(assert (=> b!1208890 m!1114689))

(declare-fun m!1114695 () Bool)

(assert (=> b!1208890 m!1114695))

(assert (=> b!1208889 m!1114689))

(assert (=> b!1208889 m!1114689))

(declare-fun m!1114697 () Bool)

(assert (=> b!1208889 m!1114697))

(assert (=> b!1208754 d!133279))

(declare-fun d!133281 () Bool)

(assert (=> d!133281 (contains!6947 (+!4002 lt!548615 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!548675 () Unit!40065)

(declare-fun choose!1810 (ListLongMap!17735 (_ BitVec 64) V!46043 (_ BitVec 64)) Unit!40065)

(assert (=> d!133281 (= lt!548675 (choose!1810 lt!548615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!133281 (contains!6947 lt!548615 k0!934)))

(assert (=> d!133281 (= (addStillContains!1031 lt!548615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!548675)))

(declare-fun bs!34166 () Bool)

(assert (= bs!34166 d!133281))

(assert (=> bs!34166 m!1114577))

(assert (=> bs!34166 m!1114577))

(assert (=> bs!34166 m!1114579))

(declare-fun m!1114699 () Bool)

(assert (=> bs!34166 m!1114699))

(declare-fun m!1114701 () Bool)

(assert (=> bs!34166 m!1114701))

(assert (=> b!1208767 d!133281))

(declare-fun d!133283 () Bool)

(declare-fun e!686574 () Bool)

(assert (=> d!133283 e!686574))

(declare-fun res!803513 () Bool)

(assert (=> d!133283 (=> res!803513 e!686574)))

(declare-fun lt!548685 () Bool)

(assert (=> d!133283 (= res!803513 (not lt!548685))))

(declare-fun lt!548686 () Bool)

(assert (=> d!133283 (= lt!548685 lt!548686)))

(declare-fun lt!548687 () Unit!40065)

(declare-fun e!686573 () Unit!40065)

(assert (=> d!133283 (= lt!548687 e!686573)))

(declare-fun c!118971 () Bool)

(assert (=> d!133283 (= c!118971 lt!548686)))

(declare-fun containsKey!594 (List!26569 (_ BitVec 64)) Bool)

(assert (=> d!133283 (= lt!548686 (containsKey!594 (toList!8883 (+!4002 lt!548615 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!133283 (= (contains!6947 (+!4002 lt!548615 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!548685)))

(declare-fun b!1208898 () Bool)

(declare-fun lt!548684 () Unit!40065)

(assert (=> b!1208898 (= e!686573 lt!548684)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!424 (List!26569 (_ BitVec 64)) Unit!40065)

(assert (=> b!1208898 (= lt!548684 (lemmaContainsKeyImpliesGetValueByKeyDefined!424 (toList!8883 (+!4002 lt!548615 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-datatypes ((Option!689 0))(
  ( (Some!688 (v!18052 V!46043)) (None!687) )
))
(declare-fun isDefined!463 (Option!689) Bool)

(declare-fun getValueByKey!638 (List!26569 (_ BitVec 64)) Option!689)

(assert (=> b!1208898 (isDefined!463 (getValueByKey!638 (toList!8883 (+!4002 lt!548615 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1208899 () Bool)

(declare-fun Unit!40071 () Unit!40065)

(assert (=> b!1208899 (= e!686573 Unit!40071)))

(declare-fun b!1208900 () Bool)

(assert (=> b!1208900 (= e!686574 (isDefined!463 (getValueByKey!638 (toList!8883 (+!4002 lt!548615 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!133283 c!118971) b!1208898))

(assert (= (and d!133283 (not c!118971)) b!1208899))

(assert (= (and d!133283 (not res!803513)) b!1208900))

(declare-fun m!1114703 () Bool)

(assert (=> d!133283 m!1114703))

(declare-fun m!1114705 () Bool)

(assert (=> b!1208898 m!1114705))

(declare-fun m!1114707 () Bool)

(assert (=> b!1208898 m!1114707))

(assert (=> b!1208898 m!1114707))

(declare-fun m!1114709 () Bool)

(assert (=> b!1208898 m!1114709))

(assert (=> b!1208900 m!1114707))

(assert (=> b!1208900 m!1114707))

(assert (=> b!1208900 m!1114709))

(assert (=> b!1208767 d!133283))

(declare-fun d!133285 () Bool)

(declare-fun e!686577 () Bool)

(assert (=> d!133285 e!686577))

(declare-fun res!803519 () Bool)

(assert (=> d!133285 (=> (not res!803519) (not e!686577))))

(declare-fun lt!548696 () ListLongMap!17735)

(assert (=> d!133285 (= res!803519 (contains!6947 lt!548696 (_1!9894 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!548699 () List!26569)

(assert (=> d!133285 (= lt!548696 (ListLongMap!17736 lt!548699))))

(declare-fun lt!548698 () Unit!40065)

(declare-fun lt!548697 () Unit!40065)

(assert (=> d!133285 (= lt!548698 lt!548697)))

(assert (=> d!133285 (= (getValueByKey!638 lt!548699 (_1!9894 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!688 (_2!9894 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!315 (List!26569 (_ BitVec 64) V!46043) Unit!40065)

(assert (=> d!133285 (= lt!548697 (lemmaContainsTupThenGetReturnValue!315 lt!548699 (_1!9894 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9894 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!408 (List!26569 (_ BitVec 64) V!46043) List!26569)

(assert (=> d!133285 (= lt!548699 (insertStrictlySorted!408 (toList!8883 lt!548615) (_1!9894 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9894 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133285 (= (+!4002 lt!548615 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!548696)))

(declare-fun b!1208905 () Bool)

(declare-fun res!803518 () Bool)

(assert (=> b!1208905 (=> (not res!803518) (not e!686577))))

(assert (=> b!1208905 (= res!803518 (= (getValueByKey!638 (toList!8883 lt!548696) (_1!9894 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!688 (_2!9894 (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1208906 () Bool)

(declare-fun contains!6950 (List!26569 tuple2!19766) Bool)

(assert (=> b!1208906 (= e!686577 (contains!6950 (toList!8883 lt!548696) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!133285 res!803519) b!1208905))

(assert (= (and b!1208905 res!803518) b!1208906))

(declare-fun m!1114711 () Bool)

(assert (=> d!133285 m!1114711))

(declare-fun m!1114713 () Bool)

(assert (=> d!133285 m!1114713))

(declare-fun m!1114715 () Bool)

(assert (=> d!133285 m!1114715))

(declare-fun m!1114717 () Bool)

(assert (=> d!133285 m!1114717))

(declare-fun m!1114719 () Bool)

(assert (=> b!1208905 m!1114719))

(declare-fun m!1114721 () Bool)

(assert (=> b!1208906 m!1114721))

(assert (=> b!1208767 d!133285))

(declare-fun d!133287 () Bool)

(declare-fun res!803524 () Bool)

(declare-fun e!686582 () Bool)

(assert (=> d!133287 (=> res!803524 e!686582)))

(assert (=> d!133287 (= res!803524 (= (select (arr!37716 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133287 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!686582)))

(declare-fun b!1208911 () Bool)

(declare-fun e!686583 () Bool)

(assert (=> b!1208911 (= e!686582 e!686583)))

(declare-fun res!803525 () Bool)

(assert (=> b!1208911 (=> (not res!803525) (not e!686583))))

(assert (=> b!1208911 (= res!803525 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38252 _keys!1208)))))

(declare-fun b!1208912 () Bool)

(assert (=> b!1208912 (= e!686583 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133287 (not res!803524)) b!1208911))

(assert (= (and b!1208911 res!803525) b!1208912))

(declare-fun m!1114723 () Bool)

(assert (=> d!133287 m!1114723))

(declare-fun m!1114725 () Bool)

(assert (=> b!1208912 m!1114725))

(assert (=> b!1208753 d!133287))

(declare-fun d!133289 () Bool)

(assert (=> d!133289 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548702 () Unit!40065)

(declare-fun choose!13 (array!78157 (_ BitVec 64) (_ BitVec 32)) Unit!40065)

(assert (=> d!133289 (= lt!548702 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133289 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133289 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!548702)))

(declare-fun bs!34167 () Bool)

(assert (= bs!34167 d!133289))

(assert (=> bs!34167 m!1114589))

(declare-fun m!1114727 () Bool)

(assert (=> bs!34167 m!1114727))

(assert (=> b!1208753 d!133289))

(declare-fun d!133291 () Bool)

(assert (=> d!133291 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1208770 d!133291))

(declare-fun d!133293 () Bool)

(declare-fun res!803526 () Bool)

(declare-fun e!686584 () Bool)

(assert (=> d!133293 (=> res!803526 e!686584)))

(assert (=> d!133293 (= res!803526 (= (select (arr!37716 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133293 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!686584)))

(declare-fun b!1208913 () Bool)

(declare-fun e!686585 () Bool)

(assert (=> b!1208913 (= e!686584 e!686585)))

(declare-fun res!803527 () Bool)

(assert (=> b!1208913 (=> (not res!803527) (not e!686585))))

(assert (=> b!1208913 (= res!803527 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38252 _keys!1208)))))

(declare-fun b!1208914 () Bool)

(assert (=> b!1208914 (= e!686585 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133293 (not res!803526)) b!1208913))

(assert (= (and b!1208913 res!803527) b!1208914))

(declare-fun m!1114729 () Bool)

(assert (=> d!133293 m!1114729))

(declare-fun m!1114731 () Bool)

(assert (=> b!1208914 m!1114731))

(assert (=> b!1208764 d!133293))

(declare-fun d!133295 () Bool)

(declare-fun e!686586 () Bool)

(assert (=> d!133295 e!686586))

(declare-fun res!803529 () Bool)

(assert (=> d!133295 (=> (not res!803529) (not e!686586))))

(declare-fun lt!548703 () ListLongMap!17735)

(assert (=> d!133295 (= res!803529 (contains!6947 lt!548703 (_1!9894 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!548706 () List!26569)

(assert (=> d!133295 (= lt!548703 (ListLongMap!17736 lt!548706))))

(declare-fun lt!548705 () Unit!40065)

(declare-fun lt!548704 () Unit!40065)

(assert (=> d!133295 (= lt!548705 lt!548704)))

(assert (=> d!133295 (= (getValueByKey!638 lt!548706 (_1!9894 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!688 (_2!9894 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133295 (= lt!548704 (lemmaContainsTupThenGetReturnValue!315 lt!548706 (_1!9894 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9894 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133295 (= lt!548706 (insertStrictlySorted!408 (toList!8883 lt!548604) (_1!9894 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9894 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133295 (= (+!4002 lt!548604 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548703)))

(declare-fun b!1208915 () Bool)

(declare-fun res!803528 () Bool)

(assert (=> b!1208915 (=> (not res!803528) (not e!686586))))

(assert (=> b!1208915 (= res!803528 (= (getValueByKey!638 (toList!8883 lt!548703) (_1!9894 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!688 (_2!9894 (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1208916 () Bool)

(assert (=> b!1208916 (= e!686586 (contains!6950 (toList!8883 lt!548703) (ite (or c!118947 c!118946) (tuple2!19767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!133295 res!803529) b!1208915))

(assert (= (and b!1208915 res!803528) b!1208916))

(declare-fun m!1114733 () Bool)

(assert (=> d!133295 m!1114733))

(declare-fun m!1114735 () Bool)

(assert (=> d!133295 m!1114735))

(declare-fun m!1114737 () Bool)

(assert (=> d!133295 m!1114737))

(declare-fun m!1114739 () Bool)

(assert (=> d!133295 m!1114739))

(declare-fun m!1114741 () Bool)

(assert (=> b!1208915 m!1114741))

(declare-fun m!1114743 () Bool)

(assert (=> b!1208916 m!1114743))

(assert (=> bm!59218 d!133295))

(declare-fun b!1208927 () Bool)

(declare-fun e!686595 () Bool)

(assert (=> b!1208927 (= e!686595 (contains!6946 Nil!26565 (select (arr!37716 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208928 () Bool)

(declare-fun e!686596 () Bool)

(declare-fun e!686597 () Bool)

(assert (=> b!1208928 (= e!686596 e!686597)))

(declare-fun c!118974 () Bool)

(assert (=> b!1208928 (= c!118974 (validKeyInArray!0 (select (arr!37716 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208929 () Bool)

(declare-fun call!59253 () Bool)

(assert (=> b!1208929 (= e!686597 call!59253)))

(declare-fun bm!59250 () Bool)

(assert (=> bm!59250 (= call!59253 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118974 (Cons!26564 (select (arr!37716 _keys!1208) #b00000000000000000000000000000000) Nil!26565) Nil!26565)))))

(declare-fun b!1208930 () Bool)

(declare-fun e!686598 () Bool)

(assert (=> b!1208930 (= e!686598 e!686596)))

(declare-fun res!803536 () Bool)

(assert (=> b!1208930 (=> (not res!803536) (not e!686596))))

(assert (=> b!1208930 (= res!803536 (not e!686595))))

(declare-fun res!803538 () Bool)

(assert (=> b!1208930 (=> (not res!803538) (not e!686595))))

(assert (=> b!1208930 (= res!803538 (validKeyInArray!0 (select (arr!37716 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133297 () Bool)

(declare-fun res!803537 () Bool)

(assert (=> d!133297 (=> res!803537 e!686598)))

(assert (=> d!133297 (= res!803537 (bvsge #b00000000000000000000000000000000 (size!38252 _keys!1208)))))

(assert (=> d!133297 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26565) e!686598)))

(declare-fun b!1208931 () Bool)

(assert (=> b!1208931 (= e!686597 call!59253)))

(assert (= (and d!133297 (not res!803537)) b!1208930))

(assert (= (and b!1208930 res!803538) b!1208927))

(assert (= (and b!1208930 res!803536) b!1208928))

(assert (= (and b!1208928 c!118974) b!1208931))

(assert (= (and b!1208928 (not c!118974)) b!1208929))

(assert (= (or b!1208931 b!1208929) bm!59250))

(assert (=> b!1208927 m!1114723))

(assert (=> b!1208927 m!1114723))

(declare-fun m!1114745 () Bool)

(assert (=> b!1208927 m!1114745))

(assert (=> b!1208928 m!1114723))

(assert (=> b!1208928 m!1114723))

(declare-fun m!1114747 () Bool)

(assert (=> b!1208928 m!1114747))

(assert (=> bm!59250 m!1114723))

(declare-fun m!1114749 () Bool)

(assert (=> bm!59250 m!1114749))

(assert (=> b!1208930 m!1114723))

(assert (=> b!1208930 m!1114723))

(assert (=> b!1208930 m!1114747))

(assert (=> b!1208781 d!133297))

(declare-fun d!133299 () Bool)

(declare-fun e!686600 () Bool)

(assert (=> d!133299 e!686600))

(declare-fun res!803539 () Bool)

(assert (=> d!133299 (=> res!803539 e!686600)))

(declare-fun lt!548708 () Bool)

(assert (=> d!133299 (= res!803539 (not lt!548708))))

(declare-fun lt!548709 () Bool)

(assert (=> d!133299 (= lt!548708 lt!548709)))

(declare-fun lt!548710 () Unit!40065)

(declare-fun e!686599 () Unit!40065)

(assert (=> d!133299 (= lt!548710 e!686599)))

(declare-fun c!118975 () Bool)

(assert (=> d!133299 (= c!118975 lt!548709)))

(assert (=> d!133299 (= lt!548709 (containsKey!594 (toList!8883 lt!548604) k0!934))))

(assert (=> d!133299 (= (contains!6947 lt!548604 k0!934) lt!548708)))

(declare-fun b!1208932 () Bool)

(declare-fun lt!548707 () Unit!40065)

(assert (=> b!1208932 (= e!686599 lt!548707)))

(assert (=> b!1208932 (= lt!548707 (lemmaContainsKeyImpliesGetValueByKeyDefined!424 (toList!8883 lt!548604) k0!934))))

(assert (=> b!1208932 (isDefined!463 (getValueByKey!638 (toList!8883 lt!548604) k0!934))))

(declare-fun b!1208933 () Bool)

(declare-fun Unit!40072 () Unit!40065)

(assert (=> b!1208933 (= e!686599 Unit!40072)))

(declare-fun b!1208934 () Bool)

(assert (=> b!1208934 (= e!686600 (isDefined!463 (getValueByKey!638 (toList!8883 lt!548604) k0!934)))))

(assert (= (and d!133299 c!118975) b!1208932))

(assert (= (and d!133299 (not c!118975)) b!1208933))

(assert (= (and d!133299 (not res!803539)) b!1208934))

(declare-fun m!1114751 () Bool)

(assert (=> d!133299 m!1114751))

(declare-fun m!1114753 () Bool)

(assert (=> b!1208932 m!1114753))

(declare-fun m!1114755 () Bool)

(assert (=> b!1208932 m!1114755))

(assert (=> b!1208932 m!1114755))

(declare-fun m!1114757 () Bool)

(assert (=> b!1208932 m!1114757))

(assert (=> b!1208934 m!1114755))

(assert (=> b!1208934 m!1114755))

(assert (=> b!1208934 m!1114757))

(assert (=> b!1208780 d!133299))

(declare-fun b!1208959 () Bool)

(declare-fun e!686618 () Bool)

(declare-fun e!686619 () Bool)

(assert (=> b!1208959 (= e!686618 e!686619)))

(assert (=> b!1208959 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 _keys!1208)))))

(declare-fun res!803550 () Bool)

(declare-fun lt!548729 () ListLongMap!17735)

(assert (=> b!1208959 (= res!803550 (contains!6947 lt!548729 (select (arr!37716 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208959 (=> (not res!803550) (not e!686619))))

(declare-fun call!59256 () ListLongMap!17735)

(declare-fun bm!59253 () Bool)

(assert (=> bm!59253 (= call!59256 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208960 () Bool)

(declare-fun e!686617 () Bool)

(assert (=> b!1208960 (= e!686617 (= lt!548729 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208961 () Bool)

(declare-fun e!686616 () Bool)

(assert (=> b!1208961 (= e!686616 e!686618)))

(declare-fun c!118984 () Bool)

(declare-fun e!686615 () Bool)

(assert (=> b!1208961 (= c!118984 e!686615)))

(declare-fun res!803548 () Bool)

(assert (=> b!1208961 (=> (not res!803548) (not e!686615))))

(assert (=> b!1208961 (= res!803548 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 _keys!1208)))))

(declare-fun b!1208962 () Bool)

(assert (=> b!1208962 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 _keys!1208)))))

(assert (=> b!1208962 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38253 _values!996)))))

(declare-fun apply!967 (ListLongMap!17735 (_ BitVec 64)) V!46043)

(declare-fun get!19221 (ValueCell!14634 V!46043) V!46043)

(assert (=> b!1208962 (= e!686619 (= (apply!967 lt!548729 (select (arr!37716 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19221 (select (arr!37717 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208963 () Bool)

(declare-fun e!686621 () ListLongMap!17735)

(assert (=> b!1208963 (= e!686621 (ListLongMap!17736 Nil!26566))))

(declare-fun b!1208964 () Bool)

(declare-fun lt!548731 () Unit!40065)

(declare-fun lt!548726 () Unit!40065)

(assert (=> b!1208964 (= lt!548731 lt!548726)))

(declare-fun lt!548730 () ListLongMap!17735)

(declare-fun lt!548725 () V!46043)

(declare-fun lt!548727 () (_ BitVec 64))

(declare-fun lt!548728 () (_ BitVec 64))

(assert (=> b!1208964 (not (contains!6947 (+!4002 lt!548730 (tuple2!19767 lt!548727 lt!548725)) lt!548728))))

(declare-fun addStillNotContains!295 (ListLongMap!17735 (_ BitVec 64) V!46043 (_ BitVec 64)) Unit!40065)

(assert (=> b!1208964 (= lt!548726 (addStillNotContains!295 lt!548730 lt!548727 lt!548725 lt!548728))))

(assert (=> b!1208964 (= lt!548728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208964 (= lt!548725 (get!19221 (select (arr!37717 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208964 (= lt!548727 (select (arr!37716 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1208964 (= lt!548730 call!59256)))

(declare-fun e!686620 () ListLongMap!17735)

(assert (=> b!1208964 (= e!686620 (+!4002 call!59256 (tuple2!19767 (select (arr!37716 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19221 (select (arr!37717 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1208965 () Bool)

(assert (=> b!1208965 (= e!686620 call!59256)))

(declare-fun d!133301 () Bool)

(assert (=> d!133301 e!686616))

(declare-fun res!803549 () Bool)

(assert (=> d!133301 (=> (not res!803549) (not e!686616))))

(assert (=> d!133301 (= res!803549 (not (contains!6947 lt!548729 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133301 (= lt!548729 e!686621)))

(declare-fun c!118987 () Bool)

(assert (=> d!133301 (= c!118987 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 _keys!1208)))))

(assert (=> d!133301 (validMask!0 mask!1564)))

(assert (=> d!133301 (= (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548729)))

(declare-fun b!1208966 () Bool)

(assert (=> b!1208966 (= e!686615 (validKeyInArray!0 (select (arr!37716 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208966 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1208967 () Bool)

(assert (=> b!1208967 (= e!686621 e!686620)))

(declare-fun c!118986 () Bool)

(assert (=> b!1208967 (= c!118986 (validKeyInArray!0 (select (arr!37716 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1208968 () Bool)

(declare-fun isEmpty!991 (ListLongMap!17735) Bool)

(assert (=> b!1208968 (= e!686617 (isEmpty!991 lt!548729))))

(declare-fun b!1208969 () Bool)

(assert (=> b!1208969 (= e!686618 e!686617)))

(declare-fun c!118985 () Bool)

(assert (=> b!1208969 (= c!118985 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 _keys!1208)))))

(declare-fun b!1208970 () Bool)

(declare-fun res!803551 () Bool)

(assert (=> b!1208970 (=> (not res!803551) (not e!686616))))

(assert (=> b!1208970 (= res!803551 (not (contains!6947 lt!548729 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133301 c!118987) b!1208963))

(assert (= (and d!133301 (not c!118987)) b!1208967))

(assert (= (and b!1208967 c!118986) b!1208964))

(assert (= (and b!1208967 (not c!118986)) b!1208965))

(assert (= (or b!1208964 b!1208965) bm!59253))

(assert (= (and d!133301 res!803549) b!1208970))

(assert (= (and b!1208970 res!803551) b!1208961))

(assert (= (and b!1208961 res!803548) b!1208966))

(assert (= (and b!1208961 c!118984) b!1208959))

(assert (= (and b!1208961 (not c!118984)) b!1208969))

(assert (= (and b!1208959 res!803550) b!1208962))

(assert (= (and b!1208969 c!118985) b!1208960))

(assert (= (and b!1208969 (not c!118985)) b!1208968))

(declare-fun b_lambda!21551 () Bool)

(assert (=> (not b_lambda!21551) (not b!1208962)))

(assert (=> b!1208962 t!39530))

(declare-fun b_and!43037 () Bool)

(assert (= b_and!43031 (and (=> t!39530 result!22157) b_and!43037)))

(declare-fun b_lambda!21553 () Bool)

(assert (=> (not b_lambda!21553) (not b!1208964)))

(assert (=> b!1208964 t!39530))

(declare-fun b_and!43039 () Bool)

(assert (= b_and!43037 (and (=> t!39530 result!22157) b_and!43039)))

(declare-fun m!1114759 () Bool)

(assert (=> bm!59253 m!1114759))

(declare-fun m!1114761 () Bool)

(assert (=> b!1208968 m!1114761))

(assert (=> b!1208960 m!1114759))

(assert (=> b!1208962 m!1114729))

(declare-fun m!1114763 () Bool)

(assert (=> b!1208962 m!1114763))

(assert (=> b!1208962 m!1114563))

(declare-fun m!1114765 () Bool)

(assert (=> b!1208962 m!1114765))

(assert (=> b!1208962 m!1114763))

(assert (=> b!1208962 m!1114563))

(assert (=> b!1208962 m!1114729))

(declare-fun m!1114767 () Bool)

(assert (=> b!1208962 m!1114767))

(declare-fun m!1114769 () Bool)

(assert (=> b!1208970 m!1114769))

(assert (=> b!1208959 m!1114729))

(assert (=> b!1208959 m!1114729))

(declare-fun m!1114771 () Bool)

(assert (=> b!1208959 m!1114771))

(assert (=> b!1208967 m!1114729))

(assert (=> b!1208967 m!1114729))

(declare-fun m!1114773 () Bool)

(assert (=> b!1208967 m!1114773))

(assert (=> b!1208964 m!1114729))

(assert (=> b!1208964 m!1114763))

(assert (=> b!1208964 m!1114563))

(assert (=> b!1208964 m!1114765))

(declare-fun m!1114775 () Bool)

(assert (=> b!1208964 m!1114775))

(declare-fun m!1114777 () Bool)

(assert (=> b!1208964 m!1114777))

(assert (=> b!1208964 m!1114763))

(declare-fun m!1114779 () Bool)

(assert (=> b!1208964 m!1114779))

(assert (=> b!1208964 m!1114563))

(assert (=> b!1208964 m!1114777))

(declare-fun m!1114781 () Bool)

(assert (=> b!1208964 m!1114781))

(declare-fun m!1114783 () Bool)

(assert (=> d!133301 m!1114783))

(assert (=> d!133301 m!1114573))

(assert (=> b!1208966 m!1114729))

(assert (=> b!1208966 m!1114729))

(assert (=> b!1208966 m!1114773))

(assert (=> b!1208780 d!133301))

(declare-fun d!133303 () Bool)

(declare-fun res!803556 () Bool)

(declare-fun e!686626 () Bool)

(assert (=> d!133303 (=> res!803556 e!686626)))

(assert (=> d!133303 (= res!803556 ((_ is Nil!26565) Nil!26565))))

(assert (=> d!133303 (= (noDuplicate!1625 Nil!26565) e!686626)))

(declare-fun b!1208975 () Bool)

(declare-fun e!686627 () Bool)

(assert (=> b!1208975 (= e!686626 e!686627)))

(declare-fun res!803557 () Bool)

(assert (=> b!1208975 (=> (not res!803557) (not e!686627))))

(assert (=> b!1208975 (= res!803557 (not (contains!6946 (t!39531 Nil!26565) (h!27773 Nil!26565))))))

(declare-fun b!1208976 () Bool)

(assert (=> b!1208976 (= e!686627 (noDuplicate!1625 (t!39531 Nil!26565)))))

(assert (= (and d!133303 (not res!803556)) b!1208975))

(assert (= (and b!1208975 res!803557) b!1208976))

(declare-fun m!1114785 () Bool)

(assert (=> b!1208975 m!1114785))

(declare-fun m!1114787 () Bool)

(assert (=> b!1208976 m!1114787))

(assert (=> b!1208751 d!133303))

(declare-fun d!133305 () Bool)

(declare-fun lt!548734 () ListLongMap!17735)

(assert (=> d!133305 (not (contains!6947 lt!548734 k0!934))))

(declare-fun removeStrictlySorted!100 (List!26569 (_ BitVec 64)) List!26569)

(assert (=> d!133305 (= lt!548734 (ListLongMap!17736 (removeStrictlySorted!100 (toList!8883 call!59219) k0!934)))))

(assert (=> d!133305 (= (-!1837 call!59219 k0!934) lt!548734)))

(declare-fun bs!34168 () Bool)

(assert (= bs!34168 d!133305))

(declare-fun m!1114789 () Bool)

(assert (=> bs!34168 m!1114789))

(declare-fun m!1114791 () Bool)

(assert (=> bs!34168 m!1114791))

(assert (=> b!1208760 d!133305))

(declare-fun b!1208977 () Bool)

(declare-fun e!686631 () Bool)

(declare-fun e!686632 () Bool)

(assert (=> b!1208977 (= e!686631 e!686632)))

(assert (=> b!1208977 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38252 lt!548601)))))

(declare-fun lt!548739 () ListLongMap!17735)

(declare-fun res!803560 () Bool)

(assert (=> b!1208977 (= res!803560 (contains!6947 lt!548739 (select (arr!37716 lt!548601) from!1455)))))

(assert (=> b!1208977 (=> (not res!803560) (not e!686632))))

(declare-fun call!59257 () ListLongMap!17735)

(declare-fun bm!59254 () Bool)

(assert (=> bm!59254 (= call!59257 (getCurrentListMapNoExtraKeys!5317 lt!548601 lt!548609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208978 () Bool)

(declare-fun e!686630 () Bool)

(assert (=> b!1208978 (= e!686630 (= lt!548739 (getCurrentListMapNoExtraKeys!5317 lt!548601 lt!548609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208979 () Bool)

(declare-fun e!686629 () Bool)

(assert (=> b!1208979 (= e!686629 e!686631)))

(declare-fun c!118988 () Bool)

(declare-fun e!686628 () Bool)

(assert (=> b!1208979 (= c!118988 e!686628)))

(declare-fun res!803558 () Bool)

(assert (=> b!1208979 (=> (not res!803558) (not e!686628))))

(assert (=> b!1208979 (= res!803558 (bvslt from!1455 (size!38252 lt!548601)))))

(declare-fun b!1208980 () Bool)

(assert (=> b!1208980 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38252 lt!548601)))))

(assert (=> b!1208980 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38253 lt!548609)))))

(assert (=> b!1208980 (= e!686632 (= (apply!967 lt!548739 (select (arr!37716 lt!548601) from!1455)) (get!19221 (select (arr!37717 lt!548609) from!1455) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208981 () Bool)

(declare-fun e!686634 () ListLongMap!17735)

(assert (=> b!1208981 (= e!686634 (ListLongMap!17736 Nil!26566))))

(declare-fun b!1208982 () Bool)

(declare-fun lt!548741 () Unit!40065)

(declare-fun lt!548736 () Unit!40065)

(assert (=> b!1208982 (= lt!548741 lt!548736)))

(declare-fun lt!548735 () V!46043)

(declare-fun lt!548738 () (_ BitVec 64))

(declare-fun lt!548737 () (_ BitVec 64))

(declare-fun lt!548740 () ListLongMap!17735)

(assert (=> b!1208982 (not (contains!6947 (+!4002 lt!548740 (tuple2!19767 lt!548737 lt!548735)) lt!548738))))

(assert (=> b!1208982 (= lt!548736 (addStillNotContains!295 lt!548740 lt!548737 lt!548735 lt!548738))))

(assert (=> b!1208982 (= lt!548738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208982 (= lt!548735 (get!19221 (select (arr!37717 lt!548609) from!1455) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208982 (= lt!548737 (select (arr!37716 lt!548601) from!1455))))

(assert (=> b!1208982 (= lt!548740 call!59257)))

(declare-fun e!686633 () ListLongMap!17735)

(assert (=> b!1208982 (= e!686633 (+!4002 call!59257 (tuple2!19767 (select (arr!37716 lt!548601) from!1455) (get!19221 (select (arr!37717 lt!548609) from!1455) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1208983 () Bool)

(assert (=> b!1208983 (= e!686633 call!59257)))

(declare-fun d!133307 () Bool)

(assert (=> d!133307 e!686629))

(declare-fun res!803559 () Bool)

(assert (=> d!133307 (=> (not res!803559) (not e!686629))))

(assert (=> d!133307 (= res!803559 (not (contains!6947 lt!548739 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133307 (= lt!548739 e!686634)))

(declare-fun c!118991 () Bool)

(assert (=> d!133307 (= c!118991 (bvsge from!1455 (size!38252 lt!548601)))))

(assert (=> d!133307 (validMask!0 mask!1564)))

(assert (=> d!133307 (= (getCurrentListMapNoExtraKeys!5317 lt!548601 lt!548609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548739)))

(declare-fun b!1208984 () Bool)

(assert (=> b!1208984 (= e!686628 (validKeyInArray!0 (select (arr!37716 lt!548601) from!1455)))))

(assert (=> b!1208984 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1208985 () Bool)

(assert (=> b!1208985 (= e!686634 e!686633)))

(declare-fun c!118990 () Bool)

(assert (=> b!1208985 (= c!118990 (validKeyInArray!0 (select (arr!37716 lt!548601) from!1455)))))

(declare-fun b!1208986 () Bool)

(assert (=> b!1208986 (= e!686630 (isEmpty!991 lt!548739))))

(declare-fun b!1208987 () Bool)

(assert (=> b!1208987 (= e!686631 e!686630)))

(declare-fun c!118989 () Bool)

(assert (=> b!1208987 (= c!118989 (bvslt from!1455 (size!38252 lt!548601)))))

(declare-fun b!1208988 () Bool)

(declare-fun res!803561 () Bool)

(assert (=> b!1208988 (=> (not res!803561) (not e!686629))))

(assert (=> b!1208988 (= res!803561 (not (contains!6947 lt!548739 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133307 c!118991) b!1208981))

(assert (= (and d!133307 (not c!118991)) b!1208985))

(assert (= (and b!1208985 c!118990) b!1208982))

(assert (= (and b!1208985 (not c!118990)) b!1208983))

(assert (= (or b!1208982 b!1208983) bm!59254))

(assert (= (and d!133307 res!803559) b!1208988))

(assert (= (and b!1208988 res!803561) b!1208979))

(assert (= (and b!1208979 res!803558) b!1208984))

(assert (= (and b!1208979 c!118988) b!1208977))

(assert (= (and b!1208979 (not c!118988)) b!1208987))

(assert (= (and b!1208977 res!803560) b!1208980))

(assert (= (and b!1208987 c!118989) b!1208978))

(assert (= (and b!1208987 (not c!118989)) b!1208986))

(declare-fun b_lambda!21555 () Bool)

(assert (=> (not b_lambda!21555) (not b!1208980)))

(assert (=> b!1208980 t!39530))

(declare-fun b_and!43041 () Bool)

(assert (= b_and!43039 (and (=> t!39530 result!22157) b_and!43041)))

(declare-fun b_lambda!21557 () Bool)

(assert (=> (not b_lambda!21557) (not b!1208982)))

(assert (=> b!1208982 t!39530))

(declare-fun b_and!43043 () Bool)

(assert (= b_and!43041 (and (=> t!39530 result!22157) b_and!43043)))

(declare-fun m!1114793 () Bool)

(assert (=> bm!59254 m!1114793))

(declare-fun m!1114795 () Bool)

(assert (=> b!1208986 m!1114795))

(assert (=> b!1208978 m!1114793))

(declare-fun m!1114797 () Bool)

(assert (=> b!1208980 m!1114797))

(declare-fun m!1114799 () Bool)

(assert (=> b!1208980 m!1114799))

(assert (=> b!1208980 m!1114563))

(declare-fun m!1114801 () Bool)

(assert (=> b!1208980 m!1114801))

(assert (=> b!1208980 m!1114799))

(assert (=> b!1208980 m!1114563))

(assert (=> b!1208980 m!1114797))

(declare-fun m!1114803 () Bool)

(assert (=> b!1208980 m!1114803))

(declare-fun m!1114805 () Bool)

(assert (=> b!1208988 m!1114805))

(assert (=> b!1208977 m!1114797))

(assert (=> b!1208977 m!1114797))

(declare-fun m!1114807 () Bool)

(assert (=> b!1208977 m!1114807))

(assert (=> b!1208985 m!1114797))

(assert (=> b!1208985 m!1114797))

(declare-fun m!1114809 () Bool)

(assert (=> b!1208985 m!1114809))

(assert (=> b!1208982 m!1114797))

(assert (=> b!1208982 m!1114799))

(assert (=> b!1208982 m!1114563))

(assert (=> b!1208982 m!1114801))

(declare-fun m!1114811 () Bool)

(assert (=> b!1208982 m!1114811))

(declare-fun m!1114813 () Bool)

(assert (=> b!1208982 m!1114813))

(assert (=> b!1208982 m!1114799))

(declare-fun m!1114815 () Bool)

(assert (=> b!1208982 m!1114815))

(assert (=> b!1208982 m!1114563))

(assert (=> b!1208982 m!1114813))

(declare-fun m!1114817 () Bool)

(assert (=> b!1208982 m!1114817))

(declare-fun m!1114819 () Bool)

(assert (=> d!133307 m!1114819))

(assert (=> d!133307 m!1114573))

(assert (=> b!1208984 m!1114797))

(assert (=> b!1208984 m!1114797))

(assert (=> b!1208984 m!1114809))

(assert (=> b!1208759 d!133307))

(declare-fun b!1208989 () Bool)

(declare-fun e!686638 () Bool)

(declare-fun e!686639 () Bool)

(assert (=> b!1208989 (= e!686638 e!686639)))

(assert (=> b!1208989 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38252 _keys!1208)))))

(declare-fun lt!548746 () ListLongMap!17735)

(declare-fun res!803564 () Bool)

(assert (=> b!1208989 (= res!803564 (contains!6947 lt!548746 (select (arr!37716 _keys!1208) from!1455)))))

(assert (=> b!1208989 (=> (not res!803564) (not e!686639))))

(declare-fun call!59258 () ListLongMap!17735)

(declare-fun bm!59255 () Bool)

(assert (=> bm!59255 (= call!59258 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun e!686637 () Bool)

(declare-fun b!1208990 () Bool)

(assert (=> b!1208990 (= e!686637 (= lt!548746 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208991 () Bool)

(declare-fun e!686636 () Bool)

(assert (=> b!1208991 (= e!686636 e!686638)))

(declare-fun c!118992 () Bool)

(declare-fun e!686635 () Bool)

(assert (=> b!1208991 (= c!118992 e!686635)))

(declare-fun res!803562 () Bool)

(assert (=> b!1208991 (=> (not res!803562) (not e!686635))))

(assert (=> b!1208991 (= res!803562 (bvslt from!1455 (size!38252 _keys!1208)))))

(declare-fun b!1208992 () Bool)

(assert (=> b!1208992 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38252 _keys!1208)))))

(assert (=> b!1208992 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38253 _values!996)))))

(assert (=> b!1208992 (= e!686639 (= (apply!967 lt!548746 (select (arr!37716 _keys!1208) from!1455)) (get!19221 (select (arr!37717 _values!996) from!1455) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208993 () Bool)

(declare-fun e!686641 () ListLongMap!17735)

(assert (=> b!1208993 (= e!686641 (ListLongMap!17736 Nil!26566))))

(declare-fun b!1208994 () Bool)

(declare-fun lt!548748 () Unit!40065)

(declare-fun lt!548743 () Unit!40065)

(assert (=> b!1208994 (= lt!548748 lt!548743)))

(declare-fun lt!548742 () V!46043)

(declare-fun lt!548744 () (_ BitVec 64))

(declare-fun lt!548745 () (_ BitVec 64))

(declare-fun lt!548747 () ListLongMap!17735)

(assert (=> b!1208994 (not (contains!6947 (+!4002 lt!548747 (tuple2!19767 lt!548744 lt!548742)) lt!548745))))

(assert (=> b!1208994 (= lt!548743 (addStillNotContains!295 lt!548747 lt!548744 lt!548742 lt!548745))))

(assert (=> b!1208994 (= lt!548745 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208994 (= lt!548742 (get!19221 (select (arr!37717 _values!996) from!1455) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208994 (= lt!548744 (select (arr!37716 _keys!1208) from!1455))))

(assert (=> b!1208994 (= lt!548747 call!59258)))

(declare-fun e!686640 () ListLongMap!17735)

(assert (=> b!1208994 (= e!686640 (+!4002 call!59258 (tuple2!19767 (select (arr!37716 _keys!1208) from!1455) (get!19221 (select (arr!37717 _values!996) from!1455) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1208995 () Bool)

(assert (=> b!1208995 (= e!686640 call!59258)))

(declare-fun d!133309 () Bool)

(assert (=> d!133309 e!686636))

(declare-fun res!803563 () Bool)

(assert (=> d!133309 (=> (not res!803563) (not e!686636))))

(assert (=> d!133309 (= res!803563 (not (contains!6947 lt!548746 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133309 (= lt!548746 e!686641)))

(declare-fun c!118995 () Bool)

(assert (=> d!133309 (= c!118995 (bvsge from!1455 (size!38252 _keys!1208)))))

(assert (=> d!133309 (validMask!0 mask!1564)))

(assert (=> d!133309 (= (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548746)))

(declare-fun b!1208996 () Bool)

(assert (=> b!1208996 (= e!686635 (validKeyInArray!0 (select (arr!37716 _keys!1208) from!1455)))))

(assert (=> b!1208996 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1208997 () Bool)

(assert (=> b!1208997 (= e!686641 e!686640)))

(declare-fun c!118994 () Bool)

(assert (=> b!1208997 (= c!118994 (validKeyInArray!0 (select (arr!37716 _keys!1208) from!1455)))))

(declare-fun b!1208998 () Bool)

(assert (=> b!1208998 (= e!686637 (isEmpty!991 lt!548746))))

(declare-fun b!1208999 () Bool)

(assert (=> b!1208999 (= e!686638 e!686637)))

(declare-fun c!118993 () Bool)

(assert (=> b!1208999 (= c!118993 (bvslt from!1455 (size!38252 _keys!1208)))))

(declare-fun b!1209000 () Bool)

(declare-fun res!803565 () Bool)

(assert (=> b!1209000 (=> (not res!803565) (not e!686636))))

(assert (=> b!1209000 (= res!803565 (not (contains!6947 lt!548746 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133309 c!118995) b!1208993))

(assert (= (and d!133309 (not c!118995)) b!1208997))

(assert (= (and b!1208997 c!118994) b!1208994))

(assert (= (and b!1208997 (not c!118994)) b!1208995))

(assert (= (or b!1208994 b!1208995) bm!59255))

(assert (= (and d!133309 res!803563) b!1209000))

(assert (= (and b!1209000 res!803565) b!1208991))

(assert (= (and b!1208991 res!803562) b!1208996))

(assert (= (and b!1208991 c!118992) b!1208989))

(assert (= (and b!1208991 (not c!118992)) b!1208999))

(assert (= (and b!1208989 res!803564) b!1208992))

(assert (= (and b!1208999 c!118993) b!1208990))

(assert (= (and b!1208999 (not c!118993)) b!1208998))

(declare-fun b_lambda!21559 () Bool)

(assert (=> (not b_lambda!21559) (not b!1208992)))

(assert (=> b!1208992 t!39530))

(declare-fun b_and!43045 () Bool)

(assert (= b_and!43043 (and (=> t!39530 result!22157) b_and!43045)))

(declare-fun b_lambda!21561 () Bool)

(assert (=> (not b_lambda!21561) (not b!1208994)))

(assert (=> b!1208994 t!39530))

(declare-fun b_and!43047 () Bool)

(assert (= b_and!43045 (and (=> t!39530 result!22157) b_and!43047)))

(declare-fun m!1114821 () Bool)

(assert (=> bm!59255 m!1114821))

(declare-fun m!1114823 () Bool)

(assert (=> b!1208998 m!1114823))

(assert (=> b!1208990 m!1114821))

(assert (=> b!1208992 m!1114607))

(declare-fun m!1114825 () Bool)

(assert (=> b!1208992 m!1114825))

(assert (=> b!1208992 m!1114563))

(declare-fun m!1114827 () Bool)

(assert (=> b!1208992 m!1114827))

(assert (=> b!1208992 m!1114825))

(assert (=> b!1208992 m!1114563))

(assert (=> b!1208992 m!1114607))

(declare-fun m!1114829 () Bool)

(assert (=> b!1208992 m!1114829))

(declare-fun m!1114831 () Bool)

(assert (=> b!1209000 m!1114831))

(assert (=> b!1208989 m!1114607))

(assert (=> b!1208989 m!1114607))

(declare-fun m!1114833 () Bool)

(assert (=> b!1208989 m!1114833))

(assert (=> b!1208997 m!1114607))

(assert (=> b!1208997 m!1114607))

(declare-fun m!1114835 () Bool)

(assert (=> b!1208997 m!1114835))

(assert (=> b!1208994 m!1114607))

(assert (=> b!1208994 m!1114825))

(assert (=> b!1208994 m!1114563))

(assert (=> b!1208994 m!1114827))

(declare-fun m!1114837 () Bool)

(assert (=> b!1208994 m!1114837))

(declare-fun m!1114839 () Bool)

(assert (=> b!1208994 m!1114839))

(assert (=> b!1208994 m!1114825))

(declare-fun m!1114841 () Bool)

(assert (=> b!1208994 m!1114841))

(assert (=> b!1208994 m!1114563))

(assert (=> b!1208994 m!1114839))

(declare-fun m!1114843 () Bool)

(assert (=> b!1208994 m!1114843))

(declare-fun m!1114845 () Bool)

(assert (=> d!133309 m!1114845))

(assert (=> d!133309 m!1114573))

(assert (=> b!1208996 m!1114607))

(assert (=> b!1208996 m!1114607))

(assert (=> b!1208996 m!1114835))

(assert (=> b!1208759 d!133309))

(declare-fun d!133311 () Bool)

(declare-fun lt!548751 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!545 (List!26568) (InoxSet (_ BitVec 64)))

(assert (=> d!133311 (= lt!548751 (select (content!545 Nil!26565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!686647 () Bool)

(assert (=> d!133311 (= lt!548751 e!686647)))

(declare-fun res!803570 () Bool)

(assert (=> d!133311 (=> (not res!803570) (not e!686647))))

(assert (=> d!133311 (= res!803570 ((_ is Cons!26564) Nil!26565))))

(assert (=> d!133311 (= (contains!6946 Nil!26565 #b1000000000000000000000000000000000000000000000000000000000000000) lt!548751)))

(declare-fun b!1209005 () Bool)

(declare-fun e!686646 () Bool)

(assert (=> b!1209005 (= e!686647 e!686646)))

(declare-fun res!803571 () Bool)

(assert (=> b!1209005 (=> res!803571 e!686646)))

(assert (=> b!1209005 (= res!803571 (= (h!27773 Nil!26565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209006 () Bool)

(assert (=> b!1209006 (= e!686646 (contains!6946 (t!39531 Nil!26565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133311 res!803570) b!1209005))

(assert (= (and b!1209005 (not res!803571)) b!1209006))

(declare-fun m!1114847 () Bool)

(assert (=> d!133311 m!1114847))

(declare-fun m!1114849 () Bool)

(assert (=> d!133311 m!1114849))

(declare-fun m!1114851 () Bool)

(assert (=> b!1209006 m!1114851))

(assert (=> b!1208776 d!133311))

(declare-fun d!133313 () Bool)

(assert (=> d!133313 (contains!6947 (+!4002 lt!548604 (tuple2!19767 (ite (or c!118947 c!118946) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118947 c!118946) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!548752 () Unit!40065)

(assert (=> d!133313 (= lt!548752 (choose!1810 lt!548604 (ite (or c!118947 c!118946) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118947 c!118946) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!133313 (contains!6947 lt!548604 k0!934)))

(assert (=> d!133313 (= (addStillContains!1031 lt!548604 (ite (or c!118947 c!118946) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118947 c!118946) zeroValue!944 minValue!944) k0!934) lt!548752)))

(declare-fun bs!34169 () Bool)

(assert (= bs!34169 d!133313))

(declare-fun m!1114853 () Bool)

(assert (=> bs!34169 m!1114853))

(assert (=> bs!34169 m!1114853))

(declare-fun m!1114855 () Bool)

(assert (=> bs!34169 m!1114855))

(declare-fun m!1114857 () Bool)

(assert (=> bs!34169 m!1114857))

(assert (=> bs!34169 m!1114569))

(assert (=> bm!59217 d!133313))

(declare-fun b!1209007 () Bool)

(declare-fun e!686648 () Bool)

(assert (=> b!1209007 (= e!686648 (contains!6946 Nil!26565 (select (arr!37716 lt!548601) #b00000000000000000000000000000000)))))

(declare-fun b!1209008 () Bool)

(declare-fun e!686649 () Bool)

(declare-fun e!686650 () Bool)

(assert (=> b!1209008 (= e!686649 e!686650)))

(declare-fun c!118996 () Bool)

(assert (=> b!1209008 (= c!118996 (validKeyInArray!0 (select (arr!37716 lt!548601) #b00000000000000000000000000000000)))))

(declare-fun b!1209009 () Bool)

(declare-fun call!59259 () Bool)

(assert (=> b!1209009 (= e!686650 call!59259)))

(declare-fun bm!59256 () Bool)

(assert (=> bm!59256 (= call!59259 (arrayNoDuplicates!0 lt!548601 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118996 (Cons!26564 (select (arr!37716 lt!548601) #b00000000000000000000000000000000) Nil!26565) Nil!26565)))))

(declare-fun b!1209010 () Bool)

(declare-fun e!686651 () Bool)

(assert (=> b!1209010 (= e!686651 e!686649)))

(declare-fun res!803572 () Bool)

(assert (=> b!1209010 (=> (not res!803572) (not e!686649))))

(assert (=> b!1209010 (= res!803572 (not e!686648))))

(declare-fun res!803574 () Bool)

(assert (=> b!1209010 (=> (not res!803574) (not e!686648))))

(assert (=> b!1209010 (= res!803574 (validKeyInArray!0 (select (arr!37716 lt!548601) #b00000000000000000000000000000000)))))

(declare-fun d!133315 () Bool)

(declare-fun res!803573 () Bool)

(assert (=> d!133315 (=> res!803573 e!686651)))

(assert (=> d!133315 (= res!803573 (bvsge #b00000000000000000000000000000000 (size!38252 lt!548601)))))

(assert (=> d!133315 (= (arrayNoDuplicates!0 lt!548601 #b00000000000000000000000000000000 Nil!26565) e!686651)))

(declare-fun b!1209011 () Bool)

(assert (=> b!1209011 (= e!686650 call!59259)))

(assert (= (and d!133315 (not res!803573)) b!1209010))

(assert (= (and b!1209010 res!803574) b!1209007))

(assert (= (and b!1209010 res!803572) b!1209008))

(assert (= (and b!1209008 c!118996) b!1209011))

(assert (= (and b!1209008 (not c!118996)) b!1209009))

(assert (= (or b!1209011 b!1209009) bm!59256))

(assert (=> b!1209007 m!1114689))

(assert (=> b!1209007 m!1114689))

(declare-fun m!1114859 () Bool)

(assert (=> b!1209007 m!1114859))

(assert (=> b!1209008 m!1114689))

(assert (=> b!1209008 m!1114689))

(assert (=> b!1209008 m!1114697))

(assert (=> bm!59256 m!1114689))

(declare-fun m!1114861 () Bool)

(assert (=> bm!59256 m!1114861))

(assert (=> b!1209010 m!1114689))

(assert (=> b!1209010 m!1114689))

(assert (=> b!1209010 m!1114697))

(assert (=> b!1208779 d!133315))

(declare-fun d!133317 () Bool)

(assert (=> d!133317 (= (array_inv!28728 _keys!1208) (bvsge (size!38252 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100948 d!133317))

(declare-fun d!133319 () Bool)

(assert (=> d!133319 (= (array_inv!28729 _values!996) (bvsge (size!38253 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100948 d!133319))

(declare-fun b!1209012 () Bool)

(declare-fun e!686654 () Bool)

(declare-fun call!59260 () Bool)

(assert (=> b!1209012 (= e!686654 call!59260)))

(declare-fun b!1209013 () Bool)

(declare-fun e!686653 () Bool)

(assert (=> b!1209013 (= e!686653 call!59260)))

(declare-fun bm!59257 () Bool)

(assert (=> bm!59257 (= call!59260 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1209015 () Bool)

(assert (=> b!1209015 (= e!686653 e!686654)))

(declare-fun lt!548755 () (_ BitVec 64))

(assert (=> b!1209015 (= lt!548755 (select (arr!37716 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!548754 () Unit!40065)

(assert (=> b!1209015 (= lt!548754 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!548755 #b00000000000000000000000000000000))))

(assert (=> b!1209015 (arrayContainsKey!0 _keys!1208 lt!548755 #b00000000000000000000000000000000)))

(declare-fun lt!548753 () Unit!40065)

(assert (=> b!1209015 (= lt!548753 lt!548754)))

(declare-fun res!803575 () Bool)

(assert (=> b!1209015 (= res!803575 (= (seekEntryOrOpen!0 (select (arr!37716 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9940 #b00000000000000000000000000000000)))))

(assert (=> b!1209015 (=> (not res!803575) (not e!686654))))

(declare-fun d!133321 () Bool)

(declare-fun res!803576 () Bool)

(declare-fun e!686652 () Bool)

(assert (=> d!133321 (=> res!803576 e!686652)))

(assert (=> d!133321 (= res!803576 (bvsge #b00000000000000000000000000000000 (size!38252 _keys!1208)))))

(assert (=> d!133321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!686652)))

(declare-fun b!1209014 () Bool)

(assert (=> b!1209014 (= e!686652 e!686653)))

(declare-fun c!118997 () Bool)

(assert (=> b!1209014 (= c!118997 (validKeyInArray!0 (select (arr!37716 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133321 (not res!803576)) b!1209014))

(assert (= (and b!1209014 c!118997) b!1209015))

(assert (= (and b!1209014 (not c!118997)) b!1209013))

(assert (= (and b!1209015 res!803575) b!1209012))

(assert (= (or b!1209012 b!1209013) bm!59257))

(declare-fun m!1114863 () Bool)

(assert (=> bm!59257 m!1114863))

(assert (=> b!1209015 m!1114723))

(declare-fun m!1114865 () Bool)

(assert (=> b!1209015 m!1114865))

(declare-fun m!1114867 () Bool)

(assert (=> b!1209015 m!1114867))

(assert (=> b!1209015 m!1114723))

(declare-fun m!1114869 () Bool)

(assert (=> b!1209015 m!1114869))

(assert (=> b!1209014 m!1114723))

(assert (=> b!1209014 m!1114723))

(assert (=> b!1209014 m!1114747))

(assert (=> b!1208761 d!133321))

(declare-fun b!1209016 () Bool)

(declare-fun e!686655 () Bool)

(assert (=> b!1209016 (= e!686655 (contains!6946 Nil!26565 (select (arr!37716 _keys!1208) from!1455)))))

(declare-fun b!1209017 () Bool)

(declare-fun e!686656 () Bool)

(declare-fun e!686657 () Bool)

(assert (=> b!1209017 (= e!686656 e!686657)))

(declare-fun c!118998 () Bool)

(assert (=> b!1209017 (= c!118998 (validKeyInArray!0 (select (arr!37716 _keys!1208) from!1455)))))

(declare-fun b!1209018 () Bool)

(declare-fun call!59261 () Bool)

(assert (=> b!1209018 (= e!686657 call!59261)))

(declare-fun bm!59258 () Bool)

(assert (=> bm!59258 (= call!59261 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118998 (Cons!26564 (select (arr!37716 _keys!1208) from!1455) Nil!26565) Nil!26565)))))

(declare-fun b!1209019 () Bool)

(declare-fun e!686658 () Bool)

(assert (=> b!1209019 (= e!686658 e!686656)))

(declare-fun res!803577 () Bool)

(assert (=> b!1209019 (=> (not res!803577) (not e!686656))))

(assert (=> b!1209019 (= res!803577 (not e!686655))))

(declare-fun res!803579 () Bool)

(assert (=> b!1209019 (=> (not res!803579) (not e!686655))))

(assert (=> b!1209019 (= res!803579 (validKeyInArray!0 (select (arr!37716 _keys!1208) from!1455)))))

(declare-fun d!133323 () Bool)

(declare-fun res!803578 () Bool)

(assert (=> d!133323 (=> res!803578 e!686658)))

(assert (=> d!133323 (= res!803578 (bvsge from!1455 (size!38252 _keys!1208)))))

(assert (=> d!133323 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26565) e!686658)))

(declare-fun b!1209020 () Bool)

(assert (=> b!1209020 (= e!686657 call!59261)))

(assert (= (and d!133323 (not res!803578)) b!1209019))

(assert (= (and b!1209019 res!803579) b!1209016))

(assert (= (and b!1209019 res!803577) b!1209017))

(assert (= (and b!1209017 c!118998) b!1209020))

(assert (= (and b!1209017 (not c!118998)) b!1209018))

(assert (= (or b!1209020 b!1209018) bm!59258))

(assert (=> b!1209016 m!1114607))

(assert (=> b!1209016 m!1114607))

(declare-fun m!1114871 () Bool)

(assert (=> b!1209016 m!1114871))

(assert (=> b!1209017 m!1114607))

(assert (=> b!1209017 m!1114607))

(assert (=> b!1209017 m!1114835))

(assert (=> bm!59258 m!1114607))

(declare-fun m!1114873 () Bool)

(assert (=> bm!59258 m!1114873))

(assert (=> b!1209019 m!1114607))

(assert (=> b!1209019 m!1114607))

(assert (=> b!1209019 m!1114835))

(assert (=> b!1208757 d!133323))

(declare-fun d!133325 () Bool)

(assert (=> d!133325 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26565)))

(declare-fun lt!548758 () Unit!40065)

(declare-fun choose!39 (array!78157 (_ BitVec 32) (_ BitVec 32)) Unit!40065)

(assert (=> d!133325 (= lt!548758 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133325 (bvslt (size!38252 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133325 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!548758)))

(declare-fun bs!34170 () Bool)

(assert (= bs!34170 d!133325))

(assert (=> bs!34170 m!1114555))

(declare-fun m!1114875 () Bool)

(assert (=> bs!34170 m!1114875))

(assert (=> b!1208757 d!133325))

(declare-fun d!133327 () Bool)

(declare-fun e!686661 () Bool)

(assert (=> d!133327 e!686661))

(declare-fun c!119001 () Bool)

(assert (=> d!133327 (= c!119001 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548761 () Unit!40065)

(declare-fun choose!1811 (array!78157 array!78159 (_ BitVec 32) (_ BitVec 32) V!46043 V!46043 (_ BitVec 64) (_ BitVec 32) Int) Unit!40065)

(assert (=> d!133327 (= lt!548761 (choose!1811 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133327 (validMask!0 mask!1564)))

(assert (=> d!133327 (= (lemmaListMapContainsThenArrayContainsFrom!585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548761)))

(declare-fun b!1209025 () Bool)

(assert (=> b!1209025 (= e!686661 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209026 () Bool)

(assert (=> b!1209026 (= e!686661 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133327 c!119001) b!1209025))

(assert (= (and d!133327 (not c!119001)) b!1209026))

(declare-fun m!1114877 () Bool)

(assert (=> d!133327 m!1114877))

(assert (=> d!133327 m!1114573))

(assert (=> b!1209025 m!1114543))

(assert (=> b!1208757 d!133327))

(declare-fun d!133329 () Bool)

(declare-fun e!686663 () Bool)

(assert (=> d!133329 e!686663))

(declare-fun res!803580 () Bool)

(assert (=> d!133329 (=> res!803580 e!686663)))

(declare-fun lt!548763 () Bool)

(assert (=> d!133329 (= res!803580 (not lt!548763))))

(declare-fun lt!548764 () Bool)

(assert (=> d!133329 (= lt!548763 lt!548764)))

(declare-fun lt!548765 () Unit!40065)

(declare-fun e!686662 () Unit!40065)

(assert (=> d!133329 (= lt!548765 e!686662)))

(declare-fun c!119002 () Bool)

(assert (=> d!133329 (= c!119002 lt!548764)))

(assert (=> d!133329 (= lt!548764 (containsKey!594 (toList!8883 (ite c!118947 lt!548615 call!59222)) k0!934))))

(assert (=> d!133329 (= (contains!6947 (ite c!118947 lt!548615 call!59222) k0!934) lt!548763)))

(declare-fun b!1209027 () Bool)

(declare-fun lt!548762 () Unit!40065)

(assert (=> b!1209027 (= e!686662 lt!548762)))

(assert (=> b!1209027 (= lt!548762 (lemmaContainsKeyImpliesGetValueByKeyDefined!424 (toList!8883 (ite c!118947 lt!548615 call!59222)) k0!934))))

(assert (=> b!1209027 (isDefined!463 (getValueByKey!638 (toList!8883 (ite c!118947 lt!548615 call!59222)) k0!934))))

(declare-fun b!1209028 () Bool)

(declare-fun Unit!40073 () Unit!40065)

(assert (=> b!1209028 (= e!686662 Unit!40073)))

(declare-fun b!1209029 () Bool)

(assert (=> b!1209029 (= e!686663 (isDefined!463 (getValueByKey!638 (toList!8883 (ite c!118947 lt!548615 call!59222)) k0!934)))))

(assert (= (and d!133329 c!119002) b!1209027))

(assert (= (and d!133329 (not c!119002)) b!1209028))

(assert (= (and d!133329 (not res!803580)) b!1209029))

(declare-fun m!1114879 () Bool)

(assert (=> d!133329 m!1114879))

(declare-fun m!1114881 () Bool)

(assert (=> b!1209027 m!1114881))

(declare-fun m!1114883 () Bool)

(assert (=> b!1209027 m!1114883))

(assert (=> b!1209027 m!1114883))

(declare-fun m!1114885 () Bool)

(assert (=> b!1209027 m!1114885))

(assert (=> b!1209029 m!1114883))

(assert (=> b!1209029 m!1114883))

(assert (=> b!1209029 m!1114885))

(assert (=> bm!59219 d!133329))

(assert (=> b!1208756 d!133293))

(declare-fun b!1209030 () Bool)

(declare-fun e!686667 () Bool)

(declare-fun e!686668 () Bool)

(assert (=> b!1209030 (= e!686667 e!686668)))

(assert (=> b!1209030 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 lt!548601)))))

(declare-fun lt!548770 () ListLongMap!17735)

(declare-fun res!803583 () Bool)

(assert (=> b!1209030 (= res!803583 (contains!6947 lt!548770 (select (arr!37716 lt!548601) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1209030 (=> (not res!803583) (not e!686668))))

(declare-fun call!59262 () ListLongMap!17735)

(declare-fun bm!59259 () Bool)

(assert (=> bm!59259 (= call!59262 (getCurrentListMapNoExtraKeys!5317 lt!548601 lt!548609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1209031 () Bool)

(declare-fun e!686666 () Bool)

(assert (=> b!1209031 (= e!686666 (= lt!548770 (getCurrentListMapNoExtraKeys!5317 lt!548601 lt!548609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1209032 () Bool)

(declare-fun e!686665 () Bool)

(assert (=> b!1209032 (= e!686665 e!686667)))

(declare-fun c!119003 () Bool)

(declare-fun e!686664 () Bool)

(assert (=> b!1209032 (= c!119003 e!686664)))

(declare-fun res!803581 () Bool)

(assert (=> b!1209032 (=> (not res!803581) (not e!686664))))

(assert (=> b!1209032 (= res!803581 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 lt!548601)))))

(declare-fun b!1209033 () Bool)

(assert (=> b!1209033 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 lt!548601)))))

(assert (=> b!1209033 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38253 lt!548609)))))

(assert (=> b!1209033 (= e!686668 (= (apply!967 lt!548770 (select (arr!37716 lt!548601) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19221 (select (arr!37717 lt!548609) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1209034 () Bool)

(declare-fun e!686670 () ListLongMap!17735)

(assert (=> b!1209034 (= e!686670 (ListLongMap!17736 Nil!26566))))

(declare-fun b!1209035 () Bool)

(declare-fun lt!548772 () Unit!40065)

(declare-fun lt!548767 () Unit!40065)

(assert (=> b!1209035 (= lt!548772 lt!548767)))

(declare-fun lt!548771 () ListLongMap!17735)

(declare-fun lt!548769 () (_ BitVec 64))

(declare-fun lt!548768 () (_ BitVec 64))

(declare-fun lt!548766 () V!46043)

(assert (=> b!1209035 (not (contains!6947 (+!4002 lt!548771 (tuple2!19767 lt!548768 lt!548766)) lt!548769))))

(assert (=> b!1209035 (= lt!548767 (addStillNotContains!295 lt!548771 lt!548768 lt!548766 lt!548769))))

(assert (=> b!1209035 (= lt!548769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1209035 (= lt!548766 (get!19221 (select (arr!37717 lt!548609) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1209035 (= lt!548768 (select (arr!37716 lt!548601) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1209035 (= lt!548771 call!59262)))

(declare-fun e!686669 () ListLongMap!17735)

(assert (=> b!1209035 (= e!686669 (+!4002 call!59262 (tuple2!19767 (select (arr!37716 lt!548601) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19221 (select (arr!37717 lt!548609) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1209036 () Bool)

(assert (=> b!1209036 (= e!686669 call!59262)))

(declare-fun d!133331 () Bool)

(assert (=> d!133331 e!686665))

(declare-fun res!803582 () Bool)

(assert (=> d!133331 (=> (not res!803582) (not e!686665))))

(assert (=> d!133331 (= res!803582 (not (contains!6947 lt!548770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133331 (= lt!548770 e!686670)))

(declare-fun c!119006 () Bool)

(assert (=> d!133331 (= c!119006 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 lt!548601)))))

(assert (=> d!133331 (validMask!0 mask!1564)))

(assert (=> d!133331 (= (getCurrentListMapNoExtraKeys!5317 lt!548601 lt!548609 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548770)))

(declare-fun b!1209037 () Bool)

(assert (=> b!1209037 (= e!686664 (validKeyInArray!0 (select (arr!37716 lt!548601) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1209037 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1209038 () Bool)

(assert (=> b!1209038 (= e!686670 e!686669)))

(declare-fun c!119005 () Bool)

(assert (=> b!1209038 (= c!119005 (validKeyInArray!0 (select (arr!37716 lt!548601) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1209039 () Bool)

(assert (=> b!1209039 (= e!686666 (isEmpty!991 lt!548770))))

(declare-fun b!1209040 () Bool)

(assert (=> b!1209040 (= e!686667 e!686666)))

(declare-fun c!119004 () Bool)

(assert (=> b!1209040 (= c!119004 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 lt!548601)))))

(declare-fun b!1209041 () Bool)

(declare-fun res!803584 () Bool)

(assert (=> b!1209041 (=> (not res!803584) (not e!686665))))

(assert (=> b!1209041 (= res!803584 (not (contains!6947 lt!548770 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133331 c!119006) b!1209034))

(assert (= (and d!133331 (not c!119006)) b!1209038))

(assert (= (and b!1209038 c!119005) b!1209035))

(assert (= (and b!1209038 (not c!119005)) b!1209036))

(assert (= (or b!1209035 b!1209036) bm!59259))

(assert (= (and d!133331 res!803582) b!1209041))

(assert (= (and b!1209041 res!803584) b!1209032))

(assert (= (and b!1209032 res!803581) b!1209037))

(assert (= (and b!1209032 c!119003) b!1209030))

(assert (= (and b!1209032 (not c!119003)) b!1209040))

(assert (= (and b!1209030 res!803583) b!1209033))

(assert (= (and b!1209040 c!119004) b!1209031))

(assert (= (and b!1209040 (not c!119004)) b!1209039))

(declare-fun b_lambda!21563 () Bool)

(assert (=> (not b_lambda!21563) (not b!1209033)))

(assert (=> b!1209033 t!39530))

(declare-fun b_and!43049 () Bool)

(assert (= b_and!43047 (and (=> t!39530 result!22157) b_and!43049)))

(declare-fun b_lambda!21565 () Bool)

(assert (=> (not b_lambda!21565) (not b!1209035)))

(assert (=> b!1209035 t!39530))

(declare-fun b_and!43051 () Bool)

(assert (= b_and!43049 (and (=> t!39530 result!22157) b_and!43051)))

(declare-fun m!1114887 () Bool)

(assert (=> bm!59259 m!1114887))

(declare-fun m!1114889 () Bool)

(assert (=> b!1209039 m!1114889))

(assert (=> b!1209031 m!1114887))

(declare-fun m!1114891 () Bool)

(assert (=> b!1209033 m!1114891))

(declare-fun m!1114893 () Bool)

(assert (=> b!1209033 m!1114893))

(assert (=> b!1209033 m!1114563))

(declare-fun m!1114895 () Bool)

(assert (=> b!1209033 m!1114895))

(assert (=> b!1209033 m!1114893))

(assert (=> b!1209033 m!1114563))

(assert (=> b!1209033 m!1114891))

(declare-fun m!1114897 () Bool)

(assert (=> b!1209033 m!1114897))

(declare-fun m!1114899 () Bool)

(assert (=> b!1209041 m!1114899))

(assert (=> b!1209030 m!1114891))

(assert (=> b!1209030 m!1114891))

(declare-fun m!1114901 () Bool)

(assert (=> b!1209030 m!1114901))

(assert (=> b!1209038 m!1114891))

(assert (=> b!1209038 m!1114891))

(declare-fun m!1114903 () Bool)

(assert (=> b!1209038 m!1114903))

(assert (=> b!1209035 m!1114891))

(assert (=> b!1209035 m!1114893))

(assert (=> b!1209035 m!1114563))

(assert (=> b!1209035 m!1114895))

(declare-fun m!1114905 () Bool)

(assert (=> b!1209035 m!1114905))

(declare-fun m!1114907 () Bool)

(assert (=> b!1209035 m!1114907))

(assert (=> b!1209035 m!1114893))

(declare-fun m!1114909 () Bool)

(assert (=> b!1209035 m!1114909))

(assert (=> b!1209035 m!1114563))

(assert (=> b!1209035 m!1114907))

(declare-fun m!1114911 () Bool)

(assert (=> b!1209035 m!1114911))

(declare-fun m!1114913 () Bool)

(assert (=> d!133331 m!1114913))

(assert (=> d!133331 m!1114573))

(assert (=> b!1209037 m!1114891))

(assert (=> b!1209037 m!1114891))

(assert (=> b!1209037 m!1114903))

(assert (=> bm!59216 d!133331))

(declare-fun d!133333 () Bool)

(assert (=> d!133333 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208775 d!133333))

(declare-fun d!133335 () Bool)

(declare-fun lt!548773 () Bool)

(assert (=> d!133335 (= lt!548773 (select (content!545 Nil!26565) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!686672 () Bool)

(assert (=> d!133335 (= lt!548773 e!686672)))

(declare-fun res!803585 () Bool)

(assert (=> d!133335 (=> (not res!803585) (not e!686672))))

(assert (=> d!133335 (= res!803585 ((_ is Cons!26564) Nil!26565))))

(assert (=> d!133335 (= (contains!6946 Nil!26565 #b0000000000000000000000000000000000000000000000000000000000000000) lt!548773)))

(declare-fun b!1209042 () Bool)

(declare-fun e!686671 () Bool)

(assert (=> b!1209042 (= e!686672 e!686671)))

(declare-fun res!803586 () Bool)

(assert (=> b!1209042 (=> res!803586 e!686671)))

(assert (=> b!1209042 (= res!803586 (= (h!27773 Nil!26565) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209043 () Bool)

(assert (=> b!1209043 (= e!686671 (contains!6946 (t!39531 Nil!26565) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133335 res!803585) b!1209042))

(assert (= (and b!1209042 (not res!803586)) b!1209043))

(assert (=> d!133335 m!1114847))

(declare-fun m!1114915 () Bool)

(assert (=> d!133335 m!1114915))

(declare-fun m!1114917 () Bool)

(assert (=> b!1209043 m!1114917))

(assert (=> b!1208758 d!133335))

(assert (=> bm!59215 d!133301))

(declare-fun d!133337 () Bool)

(declare-fun e!686677 () Bool)

(assert (=> d!133337 e!686677))

(declare-fun res!803589 () Bool)

(assert (=> d!133337 (=> (not res!803589) (not e!686677))))

(assert (=> d!133337 (= res!803589 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38252 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38252 _keys!1208))))))))

(declare-fun lt!548776 () Unit!40065)

(declare-fun choose!1812 (array!78157 array!78159 (_ BitVec 32) (_ BitVec 32) V!46043 V!46043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40065)

(assert (=> d!133337 (= lt!548776 (choose!1812 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133337 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38252 _keys!1208)))))

(assert (=> d!133337 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1045 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548776)))

(declare-fun call!59268 () ListLongMap!17735)

(declare-fun bm!59264 () Bool)

(assert (=> bm!59264 (= call!59268 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209050 () Bool)

(declare-fun e!686678 () Bool)

(assert (=> b!1209050 (= e!686677 e!686678)))

(declare-fun c!119009 () Bool)

(assert (=> b!1209050 (= c!119009 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1209051 () Bool)

(declare-fun call!59267 () ListLongMap!17735)

(assert (=> b!1209051 (= e!686678 (= call!59267 call!59268))))

(assert (=> b!1209051 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38253 _values!996)))))

(declare-fun b!1209052 () Bool)

(assert (=> b!1209052 (= e!686678 (= call!59267 (-!1837 call!59268 k0!934)))))

(assert (=> b!1209052 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38253 _values!996)))))

(declare-fun bm!59265 () Bool)

(assert (=> bm!59265 (= call!59267 (getCurrentListMapNoExtraKeys!5317 (array!78158 (store (arr!37716 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38252 _keys!1208)) (array!78160 (store (arr!37717 _values!996) i!673 (ValueCellFull!14634 (dynLambda!3218 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38253 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133337 res!803589) b!1209050))

(assert (= (and b!1209050 c!119009) b!1209052))

(assert (= (and b!1209050 (not c!119009)) b!1209051))

(assert (= (or b!1209052 b!1209051) bm!59264))

(assert (= (or b!1209052 b!1209051) bm!59265))

(declare-fun b_lambda!21567 () Bool)

(assert (=> (not b_lambda!21567) (not bm!59265)))

(assert (=> bm!59265 t!39530))

(declare-fun b_and!43053 () Bool)

(assert (= b_and!43051 (and (=> t!39530 result!22157) b_and!43053)))

(declare-fun m!1114919 () Bool)

(assert (=> d!133337 m!1114919))

(assert (=> bm!59264 m!1114571))

(declare-fun m!1114921 () Bool)

(assert (=> b!1209052 m!1114921))

(assert (=> bm!59265 m!1114603))

(assert (=> bm!59265 m!1114563))

(assert (=> bm!59265 m!1114565))

(declare-fun m!1114923 () Bool)

(assert (=> bm!59265 m!1114923))

(assert (=> b!1208773 d!133337))

(declare-fun b!1209060 () Bool)

(declare-fun e!686684 () Bool)

(assert (=> b!1209060 (= e!686684 tp_is_empty!30687)))

(declare-fun condMapEmpty!47902 () Bool)

(declare-fun mapDefault!47902 () ValueCell!14634)

(assert (=> mapNonEmpty!47896 (= condMapEmpty!47902 (= mapRest!47896 ((as const (Array (_ BitVec 32) ValueCell!14634)) mapDefault!47902)))))

(declare-fun mapRes!47902 () Bool)

(assert (=> mapNonEmpty!47896 (= tp!90962 (and e!686684 mapRes!47902))))

(declare-fun mapIsEmpty!47902 () Bool)

(assert (=> mapIsEmpty!47902 mapRes!47902))

(declare-fun b!1209059 () Bool)

(declare-fun e!686683 () Bool)

(assert (=> b!1209059 (= e!686683 tp_is_empty!30687)))

(declare-fun mapNonEmpty!47902 () Bool)

(declare-fun tp!90971 () Bool)

(assert (=> mapNonEmpty!47902 (= mapRes!47902 (and tp!90971 e!686683))))

(declare-fun mapKey!47902 () (_ BitVec 32))

(declare-fun mapValue!47902 () ValueCell!14634)

(declare-fun mapRest!47902 () (Array (_ BitVec 32) ValueCell!14634))

(assert (=> mapNonEmpty!47902 (= mapRest!47896 (store mapRest!47902 mapKey!47902 mapValue!47902))))

(assert (= (and mapNonEmpty!47896 condMapEmpty!47902) mapIsEmpty!47902))

(assert (= (and mapNonEmpty!47896 (not condMapEmpty!47902)) mapNonEmpty!47902))

(assert (= (and mapNonEmpty!47902 ((_ is ValueCellFull!14634) mapValue!47902)) b!1209059))

(assert (= (and mapNonEmpty!47896 ((_ is ValueCellFull!14634) mapDefault!47902)) b!1209060))

(declare-fun m!1114925 () Bool)

(assert (=> mapNonEmpty!47902 m!1114925))

(declare-fun b_lambda!21569 () Bool)

(assert (= b_lambda!21563 (or (and start!100948 b_free!25983) b_lambda!21569)))

(declare-fun b_lambda!21571 () Bool)

(assert (= b_lambda!21559 (or (and start!100948 b_free!25983) b_lambda!21571)))

(declare-fun b_lambda!21573 () Bool)

(assert (= b_lambda!21567 (or (and start!100948 b_free!25983) b_lambda!21573)))

(declare-fun b_lambda!21575 () Bool)

(assert (= b_lambda!21561 (or (and start!100948 b_free!25983) b_lambda!21575)))

(declare-fun b_lambda!21577 () Bool)

(assert (= b_lambda!21565 (or (and start!100948 b_free!25983) b_lambda!21577)))

(declare-fun b_lambda!21579 () Bool)

(assert (= b_lambda!21553 (or (and start!100948 b_free!25983) b_lambda!21579)))

(declare-fun b_lambda!21581 () Bool)

(assert (= b_lambda!21555 (or (and start!100948 b_free!25983) b_lambda!21581)))

(declare-fun b_lambda!21583 () Bool)

(assert (= b_lambda!21557 (or (and start!100948 b_free!25983) b_lambda!21583)))

(declare-fun b_lambda!21585 () Bool)

(assert (= b_lambda!21551 (or (and start!100948 b_free!25983) b_lambda!21585)))

(check-sat (not d!133309) (not b!1208977) (not bm!59253) (not b!1209008) (not b!1208984) (not b!1209052) (not d!133289) (not b!1208996) (not bm!59258) (not b!1208890) (not d!133295) (not b!1208982) (not b!1208986) (not b!1208994) (not d!133299) (not d!133325) (not b_lambda!21569) tp_is_empty!30687 (not b!1209016) (not b!1208992) (not b!1208960) (not b!1208930) (not b!1209006) (not b!1208998) (not b!1209031) (not d!133327) (not b!1208985) (not b!1209014) (not b!1208966) (not b_lambda!21579) (not b!1209010) (not b!1208978) (not b_lambda!21571) (not b!1208962) (not b!1209030) (not b!1209039) (not d!133281) (not b!1209007) (not bm!59264) (not b!1209000) (not d!133311) (not b!1208976) (not b!1209037) (not d!133331) (not d!133305) (not bm!59254) (not b_lambda!21575) (not b!1208906) (not b!1208989) (not bm!59255) (not b!1209019) (not b_lambda!21583) b_and!43053 (not b!1209027) (not d!133335) (not d!133285) (not b!1208900) (not b!1209033) (not mapNonEmpty!47902) (not b_next!25983) (not d!133313) (not d!133307) (not bm!59257) (not b!1208932) (not b!1209017) (not b!1208970) (not b_lambda!21585) (not b!1208914) (not d!133337) (not b!1208990) (not bm!59247) (not b!1208988) (not d!133283) (not b!1208927) (not b!1208968) (not b!1208889) (not b!1209041) (not b_lambda!21581) (not b!1208980) (not d!133329) (not b!1209015) (not bm!59256) (not b!1208959) (not bm!59250) (not b!1209029) (not b_lambda!21549) (not bm!59259) (not b!1208934) (not b!1208912) (not b!1209025) (not b!1208915) (not b!1209043) (not b!1208928) (not b!1208916) (not b!1208905) (not bm!59265) (not b!1208997) (not b_lambda!21573) (not b!1208964) (not d!133301) (not b!1208967) (not b!1209035) (not b!1209038) (not b!1208898) (not b_lambda!21577) (not b!1208975))
(check-sat b_and!43053 (not b_next!25983))
