; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132254 () Bool)

(assert start!132254)

(declare-fun b_free!31905 () Bool)

(declare-fun b_next!31905 () Bool)

(assert (=> start!132254 (= b_free!31905 (not b_next!31905))))

(declare-fun tp!111975 () Bool)

(declare-fun b_and!51339 () Bool)

(assert (=> start!132254 (= tp!111975 b_and!51339)))

(declare-fun b!1551610 () Bool)

(declare-fun res!1062515 () Bool)

(declare-fun e!863750 () Bool)

(assert (=> b!1551610 (=> (not res!1062515) (not e!863750))))

(declare-datatypes ((array!103564 0))(
  ( (array!103565 (arr!49981 (Array (_ BitVec 32) (_ BitVec 64))) (size!50531 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103564)

(declare-datatypes ((List!36190 0))(
  ( (Nil!36187) (Cons!36186 (h!37631 (_ BitVec 64)) (t!50902 List!36190)) )
))
(declare-fun arrayNoDuplicates!0 (array!103564 (_ BitVec 32) List!36190) Bool)

(assert (=> b!1551610 (= res!1062515 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36187))))

(declare-fun b!1551611 () Bool)

(declare-fun e!863748 () Bool)

(declare-fun e!863752 () Bool)

(assert (=> b!1551611 (= e!863748 (not e!863752))))

(declare-fun res!1062517 () Bool)

(assert (=> b!1551611 (=> (not res!1062517) (not e!863752))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((V!59351 0))(
  ( (V!59352 (val!19168 Int)) )
))
(declare-datatypes ((tuple2!24712 0))(
  ( (tuple2!24713 (_1!12367 (_ BitVec 64)) (_2!12367 V!59351)) )
))
(declare-datatypes ((List!36191 0))(
  ( (Nil!36188) (Cons!36187 (h!37632 tuple2!24712) (t!50903 List!36191)) )
))
(declare-datatypes ((ListLongMap!22321 0))(
  ( (ListLongMap!22322 (toList!11176 List!36191)) )
))
(declare-fun lt!668780 () ListLongMap!22321)

(declare-fun contains!10117 (ListLongMap!22321 (_ BitVec 64)) Bool)

(assert (=> b!1551611 (= res!1062517 (contains!10117 lt!668780 (select (arr!49981 _keys!618) from!762)))))

(declare-fun lt!668779 () V!59351)

(declare-fun lt!668777 () ListLongMap!22321)

(declare-fun apply!1099 (ListLongMap!22321 (_ BitVec 64)) V!59351)

(assert (=> b!1551611 (= (apply!1099 lt!668777 (select (arr!49981 _keys!618) from!762)) lt!668779)))

(declare-fun zeroValue!436 () V!59351)

(declare-datatypes ((Unit!51672 0))(
  ( (Unit!51673) )
))
(declare-fun lt!668774 () Unit!51672)

(declare-fun addApplyDifferent!637 (ListLongMap!22321 (_ BitVec 64) V!59351 (_ BitVec 64)) Unit!51672)

(assert (=> b!1551611 (= lt!668774 (addApplyDifferent!637 lt!668780 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49981 _keys!618) from!762)))))

(declare-fun lt!668776 () V!59351)

(assert (=> b!1551611 (= lt!668776 lt!668779)))

(assert (=> b!1551611 (= lt!668779 (apply!1099 lt!668780 (select (arr!49981 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59351)

(declare-fun +!4997 (ListLongMap!22321 tuple2!24712) ListLongMap!22321)

(assert (=> b!1551611 (= lt!668776 (apply!1099 (+!4997 lt!668780 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49981 _keys!618) from!762)))))

(declare-fun lt!668782 () Unit!51672)

(assert (=> b!1551611 (= lt!668782 (addApplyDifferent!637 lt!668780 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49981 _keys!618) from!762)))))

(assert (=> b!1551611 (contains!10117 lt!668777 (select (arr!49981 _keys!618) from!762))))

(assert (=> b!1551611 (= lt!668777 (+!4997 lt!668780 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668781 () Unit!51672)

(declare-fun addStillContains!1295 (ListLongMap!22321 (_ BitVec 64) V!59351 (_ BitVec 64)) Unit!51672)

(assert (=> b!1551611 (= lt!668781 (addStillContains!1295 lt!668780 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49981 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18180 0))(
  ( (ValueCellFull!18180 (v!21972 V!59351)) (EmptyCell!18180) )
))
(declare-datatypes ((array!103566 0))(
  ( (array!103567 (arr!49982 (Array (_ BitVec 32) ValueCell!18180)) (size!50532 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103566)

(declare-fun getCurrentListMapNoExtraKeys!6623 (array!103564 array!103566 (_ BitVec 32) (_ BitVec 32) V!59351 V!59351 (_ BitVec 32) Int) ListLongMap!22321)

(assert (=> b!1551611 (= lt!668780 (getCurrentListMapNoExtraKeys!6623 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58984 () Bool)

(declare-fun mapRes!58984 () Bool)

(assert (=> mapIsEmpty!58984 mapRes!58984))

(declare-fun b!1551612 () Bool)

(assert (=> b!1551612 (= e!863752 (not (= (select (arr!49981 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1551613 () Bool)

(declare-fun res!1062513 () Bool)

(assert (=> b!1551613 (=> (not res!1062513) (not e!863750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103564 (_ BitVec 32)) Bool)

(assert (=> b!1551613 (= res!1062513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551614 () Bool)

(declare-fun e!863746 () ListLongMap!22321)

(declare-fun call!71054 () ListLongMap!22321)

(assert (=> b!1551614 (= e!863746 call!71054)))

(declare-fun b!1551615 () Bool)

(declare-fun e!863754 () Bool)

(declare-fun tp_is_empty!38181 () Bool)

(assert (=> b!1551615 (= e!863754 tp_is_empty!38181)))

(declare-fun bm!71048 () Bool)

(declare-fun call!71053 () ListLongMap!22321)

(declare-fun call!71051 () ListLongMap!22321)

(assert (=> bm!71048 (= call!71053 call!71051)))

(declare-fun b!1551616 () Bool)

(declare-fun e!863755 () Bool)

(assert (=> b!1551616 (= e!863755 tp_is_empty!38181)))

(declare-fun b!1551618 () Bool)

(declare-fun e!863749 () ListLongMap!22321)

(declare-fun e!863751 () ListLongMap!22321)

(assert (=> b!1551618 (= e!863749 e!863751)))

(declare-fun c!142802 () Bool)

(declare-fun lt!668775 () Bool)

(assert (=> b!1551618 (= c!142802 (and (not lt!668775) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58984 () Bool)

(declare-fun tp!111976 () Bool)

(assert (=> mapNonEmpty!58984 (= mapRes!58984 (and tp!111976 e!863754))))

(declare-fun mapValue!58984 () ValueCell!18180)

(declare-fun mapKey!58984 () (_ BitVec 32))

(declare-fun mapRest!58984 () (Array (_ BitVec 32) ValueCell!18180))

(assert (=> mapNonEmpty!58984 (= (arr!49982 _values!470) (store mapRest!58984 mapKey!58984 mapValue!58984))))

(declare-fun b!1551619 () Bool)

(declare-fun res!1062514 () Bool)

(assert (=> b!1551619 (=> (not res!1062514) (not e!863750))))

(assert (=> b!1551619 (= res!1062514 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50531 _keys!618))))))

(declare-fun b!1551620 () Bool)

(declare-fun call!71052 () ListLongMap!22321)

(assert (=> b!1551620 (= e!863749 (+!4997 call!71052 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551621 () Bool)

(declare-fun c!142804 () Bool)

(assert (=> b!1551621 (= c!142804 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668775))))

(assert (=> b!1551621 (= e!863751 e!863746)))

(declare-fun bm!71049 () Bool)

(assert (=> bm!71049 (= call!71054 call!71053)))

(declare-fun b!1551622 () Bool)

(declare-fun call!71055 () ListLongMap!22321)

(assert (=> b!1551622 (= e!863746 call!71055)))

(declare-fun b!1551623 () Bool)

(assert (=> b!1551623 (= e!863750 e!863748)))

(declare-fun res!1062512 () Bool)

(assert (=> b!1551623 (=> (not res!1062512) (not e!863748))))

(assert (=> b!1551623 (= res!1062512 (bvslt from!762 (size!50531 _keys!618)))))

(declare-fun lt!668778 () ListLongMap!22321)

(assert (=> b!1551623 (= lt!668778 e!863749)))

(declare-fun c!142803 () Bool)

(assert (=> b!1551623 (= c!142803 (and (not lt!668775) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551623 (= lt!668775 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!71050 () Bool)

(assert (=> bm!71050 (= call!71052 (+!4997 (ite c!142803 call!71051 (ite c!142802 call!71053 call!71054)) (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1062516 () Bool)

(assert (=> start!132254 (=> (not res!1062516) (not e!863750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132254 (= res!1062516 (validMask!0 mask!926))))

(assert (=> start!132254 e!863750))

(declare-fun array_inv!38855 (array!103564) Bool)

(assert (=> start!132254 (array_inv!38855 _keys!618)))

(assert (=> start!132254 tp_is_empty!38181))

(assert (=> start!132254 true))

(assert (=> start!132254 tp!111975))

(declare-fun e!863747 () Bool)

(declare-fun array_inv!38856 (array!103566) Bool)

(assert (=> start!132254 (and (array_inv!38856 _values!470) e!863747)))

(declare-fun b!1551617 () Bool)

(declare-fun res!1062518 () Bool)

(assert (=> b!1551617 (=> (not res!1062518) (not e!863748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551617 (= res!1062518 (validKeyInArray!0 (select (arr!49981 _keys!618) from!762)))))

(declare-fun b!1551624 () Bool)

(declare-fun res!1062511 () Bool)

(assert (=> b!1551624 (=> (not res!1062511) (not e!863750))))

(assert (=> b!1551624 (= res!1062511 (and (= (size!50532 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50531 _keys!618) (size!50532 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551625 () Bool)

(assert (=> b!1551625 (= e!863751 call!71055)))

(declare-fun b!1551626 () Bool)

(assert (=> b!1551626 (= e!863747 (and e!863755 mapRes!58984))))

(declare-fun condMapEmpty!58984 () Bool)

(declare-fun mapDefault!58984 () ValueCell!18180)

(assert (=> b!1551626 (= condMapEmpty!58984 (= (arr!49982 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18180)) mapDefault!58984)))))

(declare-fun bm!71051 () Bool)

(assert (=> bm!71051 (= call!71051 (getCurrentListMapNoExtraKeys!6623 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!71052 () Bool)

(assert (=> bm!71052 (= call!71055 call!71052)))

(assert (= (and start!132254 res!1062516) b!1551624))

(assert (= (and b!1551624 res!1062511) b!1551613))

(assert (= (and b!1551613 res!1062513) b!1551610))

(assert (= (and b!1551610 res!1062515) b!1551619))

(assert (= (and b!1551619 res!1062514) b!1551623))

(assert (= (and b!1551623 c!142803) b!1551620))

(assert (= (and b!1551623 (not c!142803)) b!1551618))

(assert (= (and b!1551618 c!142802) b!1551625))

(assert (= (and b!1551618 (not c!142802)) b!1551621))

(assert (= (and b!1551621 c!142804) b!1551622))

(assert (= (and b!1551621 (not c!142804)) b!1551614))

(assert (= (or b!1551622 b!1551614) bm!71049))

(assert (= (or b!1551625 bm!71049) bm!71048))

(assert (= (or b!1551625 b!1551622) bm!71052))

(assert (= (or b!1551620 bm!71048) bm!71051))

(assert (= (or b!1551620 bm!71052) bm!71050))

(assert (= (and b!1551623 res!1062512) b!1551617))

(assert (= (and b!1551617 res!1062518) b!1551611))

(assert (= (and b!1551611 res!1062517) b!1551612))

(assert (= (and b!1551626 condMapEmpty!58984) mapIsEmpty!58984))

(assert (= (and b!1551626 (not condMapEmpty!58984)) mapNonEmpty!58984))

(get-info :version)

(assert (= (and mapNonEmpty!58984 ((_ is ValueCellFull!18180) mapValue!58984)) b!1551615))

(assert (= (and b!1551626 ((_ is ValueCellFull!18180) mapDefault!58984)) b!1551616))

(assert (= start!132254 b!1551626))

(declare-fun m!1430249 () Bool)

(assert (=> b!1551611 m!1430249))

(declare-fun m!1430251 () Bool)

(assert (=> b!1551611 m!1430251))

(declare-fun m!1430253 () Bool)

(assert (=> b!1551611 m!1430253))

(declare-fun m!1430255 () Bool)

(assert (=> b!1551611 m!1430255))

(declare-fun m!1430257 () Bool)

(assert (=> b!1551611 m!1430257))

(assert (=> b!1551611 m!1430253))

(assert (=> b!1551611 m!1430253))

(declare-fun m!1430259 () Bool)

(assert (=> b!1551611 m!1430259))

(assert (=> b!1551611 m!1430253))

(declare-fun m!1430261 () Bool)

(assert (=> b!1551611 m!1430261))

(assert (=> b!1551611 m!1430253))

(declare-fun m!1430263 () Bool)

(assert (=> b!1551611 m!1430263))

(assert (=> b!1551611 m!1430253))

(declare-fun m!1430265 () Bool)

(assert (=> b!1551611 m!1430265))

(assert (=> b!1551611 m!1430253))

(declare-fun m!1430267 () Bool)

(assert (=> b!1551611 m!1430267))

(assert (=> b!1551611 m!1430251))

(assert (=> b!1551611 m!1430253))

(declare-fun m!1430269 () Bool)

(assert (=> b!1551611 m!1430269))

(assert (=> b!1551611 m!1430253))

(declare-fun m!1430271 () Bool)

(assert (=> b!1551611 m!1430271))

(assert (=> bm!71051 m!1430257))

(declare-fun m!1430273 () Bool)

(assert (=> b!1551620 m!1430273))

(declare-fun m!1430275 () Bool)

(assert (=> start!132254 m!1430275))

(declare-fun m!1430277 () Bool)

(assert (=> start!132254 m!1430277))

(declare-fun m!1430279 () Bool)

(assert (=> start!132254 m!1430279))

(declare-fun m!1430281 () Bool)

(assert (=> mapNonEmpty!58984 m!1430281))

(assert (=> b!1551612 m!1430253))

(declare-fun m!1430283 () Bool)

(assert (=> bm!71050 m!1430283))

(declare-fun m!1430285 () Bool)

(assert (=> b!1551613 m!1430285))

(declare-fun m!1430287 () Bool)

(assert (=> b!1551610 m!1430287))

(assert (=> b!1551617 m!1430253))

(assert (=> b!1551617 m!1430253))

(declare-fun m!1430289 () Bool)

(assert (=> b!1551617 m!1430289))

(check-sat (not b!1551617) (not b!1551611) (not start!132254) tp_is_empty!38181 (not b!1551620) (not bm!71051) (not b!1551610) b_and!51339 (not b!1551613) (not mapNonEmpty!58984) (not b_next!31905) (not bm!71050))
(check-sat b_and!51339 (not b_next!31905))
(get-model)

(declare-fun b!1551688 () Bool)

(declare-fun e!863795 () Bool)

(declare-fun e!863797 () Bool)

(assert (=> b!1551688 (= e!863795 e!863797)))

(declare-fun res!1062551 () Bool)

(assert (=> b!1551688 (=> (not res!1062551) (not e!863797))))

(declare-fun e!863796 () Bool)

(assert (=> b!1551688 (= res!1062551 (not e!863796))))

(declare-fun res!1062549 () Bool)

(assert (=> b!1551688 (=> (not res!1062549) (not e!863796))))

(assert (=> b!1551688 (= res!1062549 (validKeyInArray!0 (select (arr!49981 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1551689 () Bool)

(declare-fun e!863794 () Bool)

(declare-fun call!71073 () Bool)

(assert (=> b!1551689 (= e!863794 call!71073)))

(declare-fun b!1551690 () Bool)

(assert (=> b!1551690 (= e!863797 e!863794)))

(declare-fun c!142816 () Bool)

(assert (=> b!1551690 (= c!142816 (validKeyInArray!0 (select (arr!49981 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!160997 () Bool)

(declare-fun res!1062550 () Bool)

(assert (=> d!160997 (=> res!1062550 e!863795)))

(assert (=> d!160997 (= res!1062550 (bvsge #b00000000000000000000000000000000 (size!50531 _keys!618)))))

(assert (=> d!160997 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36187) e!863795)))

(declare-fun b!1551691 () Bool)

(assert (=> b!1551691 (= e!863794 call!71073)))

(declare-fun bm!71070 () Bool)

(assert (=> bm!71070 (= call!71073 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142816 (Cons!36186 (select (arr!49981 _keys!618) #b00000000000000000000000000000000) Nil!36187) Nil!36187)))))

(declare-fun b!1551692 () Bool)

(declare-fun contains!10118 (List!36190 (_ BitVec 64)) Bool)

(assert (=> b!1551692 (= e!863796 (contains!10118 Nil!36187 (select (arr!49981 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!160997 (not res!1062550)) b!1551688))

(assert (= (and b!1551688 res!1062549) b!1551692))

(assert (= (and b!1551688 res!1062551) b!1551690))

(assert (= (and b!1551690 c!142816) b!1551689))

(assert (= (and b!1551690 (not c!142816)) b!1551691))

(assert (= (or b!1551689 b!1551691) bm!71070))

(declare-fun m!1430333 () Bool)

(assert (=> b!1551688 m!1430333))

(assert (=> b!1551688 m!1430333))

(declare-fun m!1430335 () Bool)

(assert (=> b!1551688 m!1430335))

(assert (=> b!1551690 m!1430333))

(assert (=> b!1551690 m!1430333))

(assert (=> b!1551690 m!1430335))

(assert (=> bm!71070 m!1430333))

(declare-fun m!1430337 () Bool)

(assert (=> bm!71070 m!1430337))

(assert (=> b!1551692 m!1430333))

(assert (=> b!1551692 m!1430333))

(declare-fun m!1430339 () Bool)

(assert (=> b!1551692 m!1430339))

(assert (=> b!1551610 d!160997))

(declare-fun b!1551717 () Bool)

(assert (=> b!1551717 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50531 _keys!618)))))

(assert (=> b!1551717 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50532 _values!470)))))

(declare-fun e!863818 () Bool)

(declare-fun lt!668826 () ListLongMap!22321)

(declare-fun get!26024 (ValueCell!18180 V!59351) V!59351)

(declare-fun dynLambda!3804 (Int (_ BitVec 64)) V!59351)

(assert (=> b!1551717 (= e!863818 (= (apply!1099 lt!668826 (select (arr!49981 _keys!618) from!762)) (get!26024 (select (arr!49982 _values!470) from!762) (dynLambda!3804 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!160999 () Bool)

(declare-fun e!863812 () Bool)

(assert (=> d!160999 e!863812))

(declare-fun res!1062563 () Bool)

(assert (=> d!160999 (=> (not res!1062563) (not e!863812))))

(assert (=> d!160999 (= res!1062563 (not (contains!10117 lt!668826 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!863813 () ListLongMap!22321)

(assert (=> d!160999 (= lt!668826 e!863813)))

(declare-fun c!142828 () Bool)

(assert (=> d!160999 (= c!142828 (bvsge from!762 (size!50531 _keys!618)))))

(assert (=> d!160999 (validMask!0 mask!926)))

(assert (=> d!160999 (= (getCurrentListMapNoExtraKeys!6623 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!668826)))

(declare-fun b!1551718 () Bool)

(declare-fun e!863815 () Bool)

(assert (=> b!1551718 (= e!863815 (= lt!668826 (getCurrentListMapNoExtraKeys!6623 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1551719 () Bool)

(assert (=> b!1551719 (= e!863813 (ListLongMap!22322 Nil!36188))))

(declare-fun b!1551720 () Bool)

(declare-fun e!863817 () ListLongMap!22321)

(assert (=> b!1551720 (= e!863813 e!863817)))

(declare-fun c!142825 () Bool)

(assert (=> b!1551720 (= c!142825 (validKeyInArray!0 (select (arr!49981 _keys!618) from!762)))))

(declare-fun b!1551721 () Bool)

(declare-fun isEmpty!1131 (ListLongMap!22321) Bool)

(assert (=> b!1551721 (= e!863815 (isEmpty!1131 lt!668826))))

(declare-fun b!1551722 () Bool)

(declare-fun e!863816 () Bool)

(assert (=> b!1551722 (= e!863812 e!863816)))

(declare-fun c!142826 () Bool)

(declare-fun e!863814 () Bool)

(assert (=> b!1551722 (= c!142826 e!863814)))

(declare-fun res!1062562 () Bool)

(assert (=> b!1551722 (=> (not res!1062562) (not e!863814))))

(assert (=> b!1551722 (= res!1062562 (bvslt from!762 (size!50531 _keys!618)))))

(declare-fun b!1551723 () Bool)

(assert (=> b!1551723 (= e!863816 e!863815)))

(declare-fun c!142827 () Bool)

(assert (=> b!1551723 (= c!142827 (bvslt from!762 (size!50531 _keys!618)))))

(declare-fun b!1551724 () Bool)

(declare-fun lt!668829 () Unit!51672)

(declare-fun lt!668824 () Unit!51672)

(assert (=> b!1551724 (= lt!668829 lt!668824)))

(declare-fun lt!668825 () (_ BitVec 64))

(declare-fun lt!668830 () ListLongMap!22321)

(declare-fun lt!668828 () V!59351)

(declare-fun lt!668827 () (_ BitVec 64))

(assert (=> b!1551724 (not (contains!10117 (+!4997 lt!668830 (tuple2!24713 lt!668825 lt!668828)) lt!668827))))

(declare-fun addStillNotContains!512 (ListLongMap!22321 (_ BitVec 64) V!59351 (_ BitVec 64)) Unit!51672)

(assert (=> b!1551724 (= lt!668824 (addStillNotContains!512 lt!668830 lt!668825 lt!668828 lt!668827))))

(assert (=> b!1551724 (= lt!668827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1551724 (= lt!668828 (get!26024 (select (arr!49982 _values!470) from!762) (dynLambda!3804 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1551724 (= lt!668825 (select (arr!49981 _keys!618) from!762))))

(declare-fun call!71076 () ListLongMap!22321)

(assert (=> b!1551724 (= lt!668830 call!71076)))

(assert (=> b!1551724 (= e!863817 (+!4997 call!71076 (tuple2!24713 (select (arr!49981 _keys!618) from!762) (get!26024 (select (arr!49982 _values!470) from!762) (dynLambda!3804 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1551725 () Bool)

(declare-fun res!1062560 () Bool)

(assert (=> b!1551725 (=> (not res!1062560) (not e!863812))))

(assert (=> b!1551725 (= res!1062560 (not (contains!10117 lt!668826 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1551726 () Bool)

(assert (=> b!1551726 (= e!863814 (validKeyInArray!0 (select (arr!49981 _keys!618) from!762)))))

(assert (=> b!1551726 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun b!1551727 () Bool)

(assert (=> b!1551727 (= e!863816 e!863818)))

(assert (=> b!1551727 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50531 _keys!618)))))

(declare-fun res!1062561 () Bool)

(assert (=> b!1551727 (= res!1062561 (contains!10117 lt!668826 (select (arr!49981 _keys!618) from!762)))))

(assert (=> b!1551727 (=> (not res!1062561) (not e!863818))))

(declare-fun b!1551728 () Bool)

(assert (=> b!1551728 (= e!863817 call!71076)))

(declare-fun bm!71073 () Bool)

(assert (=> bm!71073 (= call!71076 (getCurrentListMapNoExtraKeys!6623 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(assert (= (and d!160999 c!142828) b!1551719))

(assert (= (and d!160999 (not c!142828)) b!1551720))

(assert (= (and b!1551720 c!142825) b!1551724))

(assert (= (and b!1551720 (not c!142825)) b!1551728))

(assert (= (or b!1551724 b!1551728) bm!71073))

(assert (= (and d!160999 res!1062563) b!1551725))

(assert (= (and b!1551725 res!1062560) b!1551722))

(assert (= (and b!1551722 res!1062562) b!1551726))

(assert (= (and b!1551722 c!142826) b!1551727))

(assert (= (and b!1551722 (not c!142826)) b!1551723))

(assert (= (and b!1551727 res!1062561) b!1551717))

(assert (= (and b!1551723 c!142827) b!1551718))

(assert (= (and b!1551723 (not c!142827)) b!1551721))

(declare-fun b_lambda!24779 () Bool)

(assert (=> (not b_lambda!24779) (not b!1551717)))

(declare-fun t!50906 () Bool)

(declare-fun tb!12481 () Bool)

(assert (=> (and start!132254 (= defaultEntry!478 defaultEntry!478) t!50906) tb!12481))

(declare-fun result!26079 () Bool)

(assert (=> tb!12481 (= result!26079 tp_is_empty!38181)))

(assert (=> b!1551717 t!50906))

(declare-fun b_and!51343 () Bool)

(assert (= b_and!51339 (and (=> t!50906 result!26079) b_and!51343)))

(declare-fun b_lambda!24781 () Bool)

(assert (=> (not b_lambda!24781) (not b!1551724)))

(assert (=> b!1551724 t!50906))

(declare-fun b_and!51345 () Bool)

(assert (= b_and!51343 (and (=> t!50906 result!26079) b_and!51345)))

(declare-fun m!1430341 () Bool)

(assert (=> b!1551725 m!1430341))

(declare-fun m!1430343 () Bool)

(assert (=> b!1551718 m!1430343))

(assert (=> b!1551720 m!1430253))

(assert (=> b!1551720 m!1430253))

(assert (=> b!1551720 m!1430289))

(declare-fun m!1430345 () Bool)

(assert (=> b!1551724 m!1430345))

(assert (=> b!1551724 m!1430253))

(declare-fun m!1430347 () Bool)

(assert (=> b!1551724 m!1430347))

(declare-fun m!1430349 () Bool)

(assert (=> b!1551724 m!1430349))

(declare-fun m!1430351 () Bool)

(assert (=> b!1551724 m!1430351))

(declare-fun m!1430353 () Bool)

(assert (=> b!1551724 m!1430353))

(declare-fun m!1430355 () Bool)

(assert (=> b!1551724 m!1430355))

(assert (=> b!1551724 m!1430353))

(assert (=> b!1551724 m!1430349))

(assert (=> b!1551724 m!1430347))

(declare-fun m!1430357 () Bool)

(assert (=> b!1551724 m!1430357))

(assert (=> b!1551726 m!1430253))

(assert (=> b!1551726 m!1430253))

(assert (=> b!1551726 m!1430289))

(declare-fun m!1430359 () Bool)

(assert (=> b!1551721 m!1430359))

(assert (=> bm!71073 m!1430343))

(declare-fun m!1430361 () Bool)

(assert (=> d!160999 m!1430361))

(assert (=> d!160999 m!1430275))

(assert (=> b!1551717 m!1430253))

(assert (=> b!1551717 m!1430347))

(assert (=> b!1551717 m!1430349))

(assert (=> b!1551717 m!1430351))

(assert (=> b!1551717 m!1430349))

(assert (=> b!1551717 m!1430347))

(assert (=> b!1551717 m!1430253))

(declare-fun m!1430363 () Bool)

(assert (=> b!1551717 m!1430363))

(assert (=> b!1551727 m!1430253))

(assert (=> b!1551727 m!1430253))

(declare-fun m!1430365 () Bool)

(assert (=> b!1551727 m!1430365))

(assert (=> bm!71051 d!160999))

(declare-fun d!161001 () Bool)

(assert (=> d!161001 (= (apply!1099 (+!4997 lt!668780 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49981 _keys!618) from!762)) (apply!1099 lt!668780 (select (arr!49981 _keys!618) from!762)))))

(declare-fun lt!668833 () Unit!51672)

(declare-fun choose!2033 (ListLongMap!22321 (_ BitVec 64) V!59351 (_ BitVec 64)) Unit!51672)

(assert (=> d!161001 (= lt!668833 (choose!2033 lt!668780 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49981 _keys!618) from!762)))))

(declare-fun e!863821 () Bool)

(assert (=> d!161001 e!863821))

(declare-fun res!1062566 () Bool)

(assert (=> d!161001 (=> (not res!1062566) (not e!863821))))

(assert (=> d!161001 (= res!1062566 (contains!10117 lt!668780 (select (arr!49981 _keys!618) from!762)))))

(assert (=> d!161001 (= (addApplyDifferent!637 lt!668780 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49981 _keys!618) from!762)) lt!668833)))

(declare-fun b!1551734 () Bool)

(assert (=> b!1551734 (= e!863821 (not (= (select (arr!49981 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161001 res!1062566) b!1551734))

(assert (=> d!161001 m!1430253))

(assert (=> d!161001 m!1430269))

(assert (=> d!161001 m!1430253))

(assert (=> d!161001 m!1430259))

(assert (=> d!161001 m!1430249))

(assert (=> d!161001 m!1430253))

(declare-fun m!1430367 () Bool)

(assert (=> d!161001 m!1430367))

(assert (=> d!161001 m!1430249))

(assert (=> d!161001 m!1430253))

(declare-fun m!1430369 () Bool)

(assert (=> d!161001 m!1430369))

(assert (=> b!1551611 d!161001))

(declare-fun d!161003 () Bool)

(declare-datatypes ((Option!807 0))(
  ( (Some!806 (v!21974 V!59351)) (None!805) )
))
(declare-fun get!26025 (Option!807) V!59351)

(declare-fun getValueByKey!731 (List!36191 (_ BitVec 64)) Option!807)

(assert (=> d!161003 (= (apply!1099 lt!668780 (select (arr!49981 _keys!618) from!762)) (get!26025 (getValueByKey!731 (toList!11176 lt!668780) (select (arr!49981 _keys!618) from!762))))))

(declare-fun bs!44582 () Bool)

(assert (= bs!44582 d!161003))

(assert (=> bs!44582 m!1430253))

(declare-fun m!1430371 () Bool)

(assert (=> bs!44582 m!1430371))

(assert (=> bs!44582 m!1430371))

(declare-fun m!1430373 () Bool)

(assert (=> bs!44582 m!1430373))

(assert (=> b!1551611 d!161003))

(declare-fun d!161005 () Bool)

(declare-fun e!863824 () Bool)

(assert (=> d!161005 e!863824))

(declare-fun res!1062571 () Bool)

(assert (=> d!161005 (=> (not res!1062571) (not e!863824))))

(declare-fun lt!668842 () ListLongMap!22321)

(assert (=> d!161005 (= res!1062571 (contains!10117 lt!668842 (_1!12367 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!668844 () List!36191)

(assert (=> d!161005 (= lt!668842 (ListLongMap!22322 lt!668844))))

(declare-fun lt!668843 () Unit!51672)

(declare-fun lt!668845 () Unit!51672)

(assert (=> d!161005 (= lt!668843 lt!668845)))

(assert (=> d!161005 (= (getValueByKey!731 lt!668844 (_1!12367 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!806 (_2!12367 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!373 (List!36191 (_ BitVec 64) V!59351) Unit!51672)

(assert (=> d!161005 (= lt!668845 (lemmaContainsTupThenGetReturnValue!373 lt!668844 (_1!12367 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12367 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun insertStrictlySorted!502 (List!36191 (_ BitVec 64) V!59351) List!36191)

(assert (=> d!161005 (= lt!668844 (insertStrictlySorted!502 (toList!11176 lt!668780) (_1!12367 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12367 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161005 (= (+!4997 lt!668780 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!668842)))

(declare-fun b!1551739 () Bool)

(declare-fun res!1062572 () Bool)

(assert (=> b!1551739 (=> (not res!1062572) (not e!863824))))

(assert (=> b!1551739 (= res!1062572 (= (getValueByKey!731 (toList!11176 lt!668842) (_1!12367 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!806 (_2!12367 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1551740 () Bool)

(declare-fun contains!10119 (List!36191 tuple2!24712) Bool)

(assert (=> b!1551740 (= e!863824 (contains!10119 (toList!11176 lt!668842) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!161005 res!1062571) b!1551739))

(assert (= (and b!1551739 res!1062572) b!1551740))

(declare-fun m!1430375 () Bool)

(assert (=> d!161005 m!1430375))

(declare-fun m!1430377 () Bool)

(assert (=> d!161005 m!1430377))

(declare-fun m!1430379 () Bool)

(assert (=> d!161005 m!1430379))

(declare-fun m!1430381 () Bool)

(assert (=> d!161005 m!1430381))

(declare-fun m!1430383 () Bool)

(assert (=> b!1551739 m!1430383))

(declare-fun m!1430385 () Bool)

(assert (=> b!1551740 m!1430385))

(assert (=> b!1551611 d!161005))

(declare-fun d!161007 () Bool)

(declare-fun e!863829 () Bool)

(assert (=> d!161007 e!863829))

(declare-fun res!1062575 () Bool)

(assert (=> d!161007 (=> res!1062575 e!863829)))

(declare-fun lt!668855 () Bool)

(assert (=> d!161007 (= res!1062575 (not lt!668855))))

(declare-fun lt!668857 () Bool)

(assert (=> d!161007 (= lt!668855 lt!668857)))

(declare-fun lt!668856 () Unit!51672)

(declare-fun e!863830 () Unit!51672)

(assert (=> d!161007 (= lt!668856 e!863830)))

(declare-fun c!142831 () Bool)

(assert (=> d!161007 (= c!142831 lt!668857)))

(declare-fun containsKey!753 (List!36191 (_ BitVec 64)) Bool)

(assert (=> d!161007 (= lt!668857 (containsKey!753 (toList!11176 lt!668780) (select (arr!49981 _keys!618) from!762)))))

(assert (=> d!161007 (= (contains!10117 lt!668780 (select (arr!49981 _keys!618) from!762)) lt!668855)))

(declare-fun b!1551747 () Bool)

(declare-fun lt!668854 () Unit!51672)

(assert (=> b!1551747 (= e!863830 lt!668854)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!499 (List!36191 (_ BitVec 64)) Unit!51672)

(assert (=> b!1551747 (= lt!668854 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11176 lt!668780) (select (arr!49981 _keys!618) from!762)))))

(declare-fun isDefined!547 (Option!807) Bool)

(assert (=> b!1551747 (isDefined!547 (getValueByKey!731 (toList!11176 lt!668780) (select (arr!49981 _keys!618) from!762)))))

(declare-fun b!1551748 () Bool)

(declare-fun Unit!51674 () Unit!51672)

(assert (=> b!1551748 (= e!863830 Unit!51674)))

(declare-fun b!1551749 () Bool)

(assert (=> b!1551749 (= e!863829 (isDefined!547 (getValueByKey!731 (toList!11176 lt!668780) (select (arr!49981 _keys!618) from!762))))))

(assert (= (and d!161007 c!142831) b!1551747))

(assert (= (and d!161007 (not c!142831)) b!1551748))

(assert (= (and d!161007 (not res!1062575)) b!1551749))

(assert (=> d!161007 m!1430253))

(declare-fun m!1430387 () Bool)

(assert (=> d!161007 m!1430387))

(assert (=> b!1551747 m!1430253))

(declare-fun m!1430389 () Bool)

(assert (=> b!1551747 m!1430389))

(assert (=> b!1551747 m!1430253))

(assert (=> b!1551747 m!1430371))

(assert (=> b!1551747 m!1430371))

(declare-fun m!1430391 () Bool)

(assert (=> b!1551747 m!1430391))

(assert (=> b!1551749 m!1430253))

(assert (=> b!1551749 m!1430371))

(assert (=> b!1551749 m!1430371))

(assert (=> b!1551749 m!1430391))

(assert (=> b!1551611 d!161007))

(declare-fun d!161009 () Bool)

(assert (=> d!161009 (= (apply!1099 (+!4997 lt!668780 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49981 _keys!618) from!762)) (get!26025 (getValueByKey!731 (toList!11176 (+!4997 lt!668780 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!49981 _keys!618) from!762))))))

(declare-fun bs!44583 () Bool)

(assert (= bs!44583 d!161009))

(assert (=> bs!44583 m!1430253))

(declare-fun m!1430393 () Bool)

(assert (=> bs!44583 m!1430393))

(assert (=> bs!44583 m!1430393))

(declare-fun m!1430395 () Bool)

(assert (=> bs!44583 m!1430395))

(assert (=> b!1551611 d!161009))

(declare-fun d!161011 () Bool)

(declare-fun e!863831 () Bool)

(assert (=> d!161011 e!863831))

(declare-fun res!1062576 () Bool)

(assert (=> d!161011 (=> res!1062576 e!863831)))

(declare-fun lt!668859 () Bool)

(assert (=> d!161011 (= res!1062576 (not lt!668859))))

(declare-fun lt!668861 () Bool)

(assert (=> d!161011 (= lt!668859 lt!668861)))

(declare-fun lt!668860 () Unit!51672)

(declare-fun e!863832 () Unit!51672)

(assert (=> d!161011 (= lt!668860 e!863832)))

(declare-fun c!142832 () Bool)

(assert (=> d!161011 (= c!142832 lt!668861)))

(assert (=> d!161011 (= lt!668861 (containsKey!753 (toList!11176 lt!668777) (select (arr!49981 _keys!618) from!762)))))

(assert (=> d!161011 (= (contains!10117 lt!668777 (select (arr!49981 _keys!618) from!762)) lt!668859)))

(declare-fun b!1551750 () Bool)

(declare-fun lt!668858 () Unit!51672)

(assert (=> b!1551750 (= e!863832 lt!668858)))

(assert (=> b!1551750 (= lt!668858 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11176 lt!668777) (select (arr!49981 _keys!618) from!762)))))

(assert (=> b!1551750 (isDefined!547 (getValueByKey!731 (toList!11176 lt!668777) (select (arr!49981 _keys!618) from!762)))))

(declare-fun b!1551751 () Bool)

(declare-fun Unit!51675 () Unit!51672)

(assert (=> b!1551751 (= e!863832 Unit!51675)))

(declare-fun b!1551752 () Bool)

(assert (=> b!1551752 (= e!863831 (isDefined!547 (getValueByKey!731 (toList!11176 lt!668777) (select (arr!49981 _keys!618) from!762))))))

(assert (= (and d!161011 c!142832) b!1551750))

(assert (= (and d!161011 (not c!142832)) b!1551751))

(assert (= (and d!161011 (not res!1062576)) b!1551752))

(assert (=> d!161011 m!1430253))

(declare-fun m!1430397 () Bool)

(assert (=> d!161011 m!1430397))

(assert (=> b!1551750 m!1430253))

(declare-fun m!1430399 () Bool)

(assert (=> b!1551750 m!1430399))

(assert (=> b!1551750 m!1430253))

(declare-fun m!1430401 () Bool)

(assert (=> b!1551750 m!1430401))

(assert (=> b!1551750 m!1430401))

(declare-fun m!1430403 () Bool)

(assert (=> b!1551750 m!1430403))

(assert (=> b!1551752 m!1430253))

(assert (=> b!1551752 m!1430401))

(assert (=> b!1551752 m!1430401))

(assert (=> b!1551752 m!1430403))

(assert (=> b!1551611 d!161011))

(declare-fun d!161013 () Bool)

(declare-fun e!863833 () Bool)

(assert (=> d!161013 e!863833))

(declare-fun res!1062577 () Bool)

(assert (=> d!161013 (=> (not res!1062577) (not e!863833))))

(declare-fun lt!668862 () ListLongMap!22321)

(assert (=> d!161013 (= res!1062577 (contains!10117 lt!668862 (_1!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668864 () List!36191)

(assert (=> d!161013 (= lt!668862 (ListLongMap!22322 lt!668864))))

(declare-fun lt!668863 () Unit!51672)

(declare-fun lt!668865 () Unit!51672)

(assert (=> d!161013 (= lt!668863 lt!668865)))

(assert (=> d!161013 (= (getValueByKey!731 lt!668864 (_1!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!806 (_2!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161013 (= lt!668865 (lemmaContainsTupThenGetReturnValue!373 lt!668864 (_1!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161013 (= lt!668864 (insertStrictlySorted!502 (toList!11176 lt!668780) (_1!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161013 (= (+!4997 lt!668780 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668862)))

(declare-fun b!1551753 () Bool)

(declare-fun res!1062578 () Bool)

(assert (=> b!1551753 (=> (not res!1062578) (not e!863833))))

(assert (=> b!1551753 (= res!1062578 (= (getValueByKey!731 (toList!11176 lt!668862) (_1!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!806 (_2!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1551754 () Bool)

(assert (=> b!1551754 (= e!863833 (contains!10119 (toList!11176 lt!668862) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161013 res!1062577) b!1551753))

(assert (= (and b!1551753 res!1062578) b!1551754))

(declare-fun m!1430405 () Bool)

(assert (=> d!161013 m!1430405))

(declare-fun m!1430407 () Bool)

(assert (=> d!161013 m!1430407))

(declare-fun m!1430409 () Bool)

(assert (=> d!161013 m!1430409))

(declare-fun m!1430411 () Bool)

(assert (=> d!161013 m!1430411))

(declare-fun m!1430413 () Bool)

(assert (=> b!1551753 m!1430413))

(declare-fun m!1430415 () Bool)

(assert (=> b!1551754 m!1430415))

(assert (=> b!1551611 d!161013))

(declare-fun d!161015 () Bool)

(assert (=> d!161015 (= (apply!1099 (+!4997 lt!668780 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49981 _keys!618) from!762)) (apply!1099 lt!668780 (select (arr!49981 _keys!618) from!762)))))

(declare-fun lt!668866 () Unit!51672)

(assert (=> d!161015 (= lt!668866 (choose!2033 lt!668780 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49981 _keys!618) from!762)))))

(declare-fun e!863834 () Bool)

(assert (=> d!161015 e!863834))

(declare-fun res!1062579 () Bool)

(assert (=> d!161015 (=> (not res!1062579) (not e!863834))))

(assert (=> d!161015 (= res!1062579 (contains!10117 lt!668780 (select (arr!49981 _keys!618) from!762)))))

(assert (=> d!161015 (= (addApplyDifferent!637 lt!668780 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49981 _keys!618) from!762)) lt!668866)))

(declare-fun b!1551755 () Bool)

(assert (=> b!1551755 (= e!863834 (not (= (select (arr!49981 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161015 res!1062579) b!1551755))

(assert (=> d!161015 m!1430253))

(assert (=> d!161015 m!1430269))

(assert (=> d!161015 m!1430253))

(assert (=> d!161015 m!1430259))

(assert (=> d!161015 m!1430251))

(assert (=> d!161015 m!1430253))

(assert (=> d!161015 m!1430255))

(assert (=> d!161015 m!1430251))

(assert (=> d!161015 m!1430253))

(declare-fun m!1430417 () Bool)

(assert (=> d!161015 m!1430417))

(assert (=> b!1551611 d!161015))

(assert (=> b!1551611 d!160999))

(declare-fun d!161017 () Bool)

(assert (=> d!161017 (= (apply!1099 lt!668777 (select (arr!49981 _keys!618) from!762)) (get!26025 (getValueByKey!731 (toList!11176 lt!668777) (select (arr!49981 _keys!618) from!762))))))

(declare-fun bs!44584 () Bool)

(assert (= bs!44584 d!161017))

(assert (=> bs!44584 m!1430253))

(assert (=> bs!44584 m!1430401))

(assert (=> bs!44584 m!1430401))

(declare-fun m!1430419 () Bool)

(assert (=> bs!44584 m!1430419))

(assert (=> b!1551611 d!161017))

(declare-fun d!161019 () Bool)

(assert (=> d!161019 (contains!10117 (+!4997 lt!668780 (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49981 _keys!618) from!762))))

(declare-fun lt!668869 () Unit!51672)

(declare-fun choose!2034 (ListLongMap!22321 (_ BitVec 64) V!59351 (_ BitVec 64)) Unit!51672)

(assert (=> d!161019 (= lt!668869 (choose!2034 lt!668780 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49981 _keys!618) from!762)))))

(assert (=> d!161019 (contains!10117 lt!668780 (select (arr!49981 _keys!618) from!762))))

(assert (=> d!161019 (= (addStillContains!1295 lt!668780 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49981 _keys!618) from!762)) lt!668869)))

(declare-fun bs!44585 () Bool)

(assert (= bs!44585 d!161019))

(assert (=> bs!44585 m!1430249))

(assert (=> bs!44585 m!1430249))

(assert (=> bs!44585 m!1430253))

(declare-fun m!1430421 () Bool)

(assert (=> bs!44585 m!1430421))

(assert (=> bs!44585 m!1430253))

(declare-fun m!1430423 () Bool)

(assert (=> bs!44585 m!1430423))

(assert (=> bs!44585 m!1430253))

(assert (=> bs!44585 m!1430259))

(assert (=> b!1551611 d!161019))

(declare-fun d!161021 () Bool)

(declare-fun res!1062584 () Bool)

(declare-fun e!863841 () Bool)

(assert (=> d!161021 (=> res!1062584 e!863841)))

(assert (=> d!161021 (= res!1062584 (bvsge #b00000000000000000000000000000000 (size!50531 _keys!618)))))

(assert (=> d!161021 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!863841)))

(declare-fun b!1551765 () Bool)

(declare-fun e!863842 () Bool)

(declare-fun e!863843 () Bool)

(assert (=> b!1551765 (= e!863842 e!863843)))

(declare-fun lt!668877 () (_ BitVec 64))

(assert (=> b!1551765 (= lt!668877 (select (arr!49981 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!668878 () Unit!51672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103564 (_ BitVec 64) (_ BitVec 32)) Unit!51672)

(assert (=> b!1551765 (= lt!668878 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!668877 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1551765 (arrayContainsKey!0 _keys!618 lt!668877 #b00000000000000000000000000000000)))

(declare-fun lt!668876 () Unit!51672)

(assert (=> b!1551765 (= lt!668876 lt!668878)))

(declare-fun res!1062585 () Bool)

(declare-datatypes ((SeekEntryResult!13515 0))(
  ( (MissingZero!13515 (index!56458 (_ BitVec 32))) (Found!13515 (index!56459 (_ BitVec 32))) (Intermediate!13515 (undefined!14327 Bool) (index!56460 (_ BitVec 32)) (x!139157 (_ BitVec 32))) (Undefined!13515) (MissingVacant!13515 (index!56461 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103564 (_ BitVec 32)) SeekEntryResult!13515)

(assert (=> b!1551765 (= res!1062585 (= (seekEntryOrOpen!0 (select (arr!49981 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13515 #b00000000000000000000000000000000)))))

(assert (=> b!1551765 (=> (not res!1062585) (not e!863843))))

(declare-fun b!1551766 () Bool)

(assert (=> b!1551766 (= e!863841 e!863842)))

(declare-fun c!142835 () Bool)

(assert (=> b!1551766 (= c!142835 (validKeyInArray!0 (select (arr!49981 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun bm!71076 () Bool)

(declare-fun call!71079 () Bool)

(assert (=> bm!71076 (= call!71079 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1551767 () Bool)

(assert (=> b!1551767 (= e!863843 call!71079)))

(declare-fun b!1551768 () Bool)

(assert (=> b!1551768 (= e!863842 call!71079)))

(assert (= (and d!161021 (not res!1062584)) b!1551766))

(assert (= (and b!1551766 c!142835) b!1551765))

(assert (= (and b!1551766 (not c!142835)) b!1551768))

(assert (= (and b!1551765 res!1062585) b!1551767))

(assert (= (or b!1551767 b!1551768) bm!71076))

(assert (=> b!1551765 m!1430333))

(declare-fun m!1430425 () Bool)

(assert (=> b!1551765 m!1430425))

(declare-fun m!1430427 () Bool)

(assert (=> b!1551765 m!1430427))

(assert (=> b!1551765 m!1430333))

(declare-fun m!1430429 () Bool)

(assert (=> b!1551765 m!1430429))

(assert (=> b!1551766 m!1430333))

(assert (=> b!1551766 m!1430333))

(assert (=> b!1551766 m!1430335))

(declare-fun m!1430431 () Bool)

(assert (=> bm!71076 m!1430431))

(assert (=> b!1551613 d!161021))

(declare-fun d!161023 () Bool)

(assert (=> d!161023 (= (validKeyInArray!0 (select (arr!49981 _keys!618) from!762)) (and (not (= (select (arr!49981 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49981 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1551617 d!161023))

(declare-fun d!161025 () Bool)

(assert (=> d!161025 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132254 d!161025))

(declare-fun d!161027 () Bool)

(assert (=> d!161027 (= (array_inv!38855 _keys!618) (bvsge (size!50531 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132254 d!161027))

(declare-fun d!161029 () Bool)

(assert (=> d!161029 (= (array_inv!38856 _values!470) (bvsge (size!50532 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132254 d!161029))

(declare-fun d!161031 () Bool)

(declare-fun e!863844 () Bool)

(assert (=> d!161031 e!863844))

(declare-fun res!1062586 () Bool)

(assert (=> d!161031 (=> (not res!1062586) (not e!863844))))

(declare-fun lt!668879 () ListLongMap!22321)

(assert (=> d!161031 (= res!1062586 (contains!10117 lt!668879 (_1!12367 (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!668881 () List!36191)

(assert (=> d!161031 (= lt!668879 (ListLongMap!22322 lt!668881))))

(declare-fun lt!668880 () Unit!51672)

(declare-fun lt!668882 () Unit!51672)

(assert (=> d!161031 (= lt!668880 lt!668882)))

(assert (=> d!161031 (= (getValueByKey!731 lt!668881 (_1!12367 (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!806 (_2!12367 (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161031 (= lt!668882 (lemmaContainsTupThenGetReturnValue!373 lt!668881 (_1!12367 (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12367 (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161031 (= lt!668881 (insertStrictlySorted!502 (toList!11176 (ite c!142803 call!71051 (ite c!142802 call!71053 call!71054))) (_1!12367 (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12367 (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161031 (= (+!4997 (ite c!142803 call!71051 (ite c!142802 call!71053 call!71054)) (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!668879)))

(declare-fun b!1551769 () Bool)

(declare-fun res!1062587 () Bool)

(assert (=> b!1551769 (=> (not res!1062587) (not e!863844))))

(assert (=> b!1551769 (= res!1062587 (= (getValueByKey!731 (toList!11176 lt!668879) (_1!12367 (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!806 (_2!12367 (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1551770 () Bool)

(assert (=> b!1551770 (= e!863844 (contains!10119 (toList!11176 lt!668879) (ite (or c!142803 c!142802) (tuple2!24713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161031 res!1062586) b!1551769))

(assert (= (and b!1551769 res!1062587) b!1551770))

(declare-fun m!1430433 () Bool)

(assert (=> d!161031 m!1430433))

(declare-fun m!1430435 () Bool)

(assert (=> d!161031 m!1430435))

(declare-fun m!1430437 () Bool)

(assert (=> d!161031 m!1430437))

(declare-fun m!1430439 () Bool)

(assert (=> d!161031 m!1430439))

(declare-fun m!1430441 () Bool)

(assert (=> b!1551769 m!1430441))

(declare-fun m!1430443 () Bool)

(assert (=> b!1551770 m!1430443))

(assert (=> bm!71050 d!161031))

(declare-fun d!161033 () Bool)

(declare-fun e!863845 () Bool)

(assert (=> d!161033 e!863845))

(declare-fun res!1062588 () Bool)

(assert (=> d!161033 (=> (not res!1062588) (not e!863845))))

(declare-fun lt!668883 () ListLongMap!22321)

(assert (=> d!161033 (= res!1062588 (contains!10117 lt!668883 (_1!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668885 () List!36191)

(assert (=> d!161033 (= lt!668883 (ListLongMap!22322 lt!668885))))

(declare-fun lt!668884 () Unit!51672)

(declare-fun lt!668886 () Unit!51672)

(assert (=> d!161033 (= lt!668884 lt!668886)))

(assert (=> d!161033 (= (getValueByKey!731 lt!668885 (_1!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!806 (_2!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161033 (= lt!668886 (lemmaContainsTupThenGetReturnValue!373 lt!668885 (_1!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161033 (= lt!668885 (insertStrictlySorted!502 (toList!11176 call!71052) (_1!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161033 (= (+!4997 call!71052 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668883)))

(declare-fun b!1551771 () Bool)

(declare-fun res!1062589 () Bool)

(assert (=> b!1551771 (=> (not res!1062589) (not e!863845))))

(assert (=> b!1551771 (= res!1062589 (= (getValueByKey!731 (toList!11176 lt!668883) (_1!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!806 (_2!12367 (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1551772 () Bool)

(assert (=> b!1551772 (= e!863845 (contains!10119 (toList!11176 lt!668883) (tuple2!24713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161033 res!1062588) b!1551771))

(assert (= (and b!1551771 res!1062589) b!1551772))

(declare-fun m!1430445 () Bool)

(assert (=> d!161033 m!1430445))

(declare-fun m!1430447 () Bool)

(assert (=> d!161033 m!1430447))

(declare-fun m!1430449 () Bool)

(assert (=> d!161033 m!1430449))

(declare-fun m!1430451 () Bool)

(assert (=> d!161033 m!1430451))

(declare-fun m!1430453 () Bool)

(assert (=> b!1551771 m!1430453))

(declare-fun m!1430455 () Bool)

(assert (=> b!1551772 m!1430455))

(assert (=> b!1551620 d!161033))

(declare-fun mapIsEmpty!58990 () Bool)

(declare-fun mapRes!58990 () Bool)

(assert (=> mapIsEmpty!58990 mapRes!58990))

(declare-fun mapNonEmpty!58990 () Bool)

(declare-fun tp!111985 () Bool)

(declare-fun e!863851 () Bool)

(assert (=> mapNonEmpty!58990 (= mapRes!58990 (and tp!111985 e!863851))))

(declare-fun mapKey!58990 () (_ BitVec 32))

(declare-fun mapRest!58990 () (Array (_ BitVec 32) ValueCell!18180))

(declare-fun mapValue!58990 () ValueCell!18180)

(assert (=> mapNonEmpty!58990 (= mapRest!58984 (store mapRest!58990 mapKey!58990 mapValue!58990))))

(declare-fun b!1551780 () Bool)

(declare-fun e!863850 () Bool)

(assert (=> b!1551780 (= e!863850 tp_is_empty!38181)))

(declare-fun b!1551779 () Bool)

(assert (=> b!1551779 (= e!863851 tp_is_empty!38181)))

(declare-fun condMapEmpty!58990 () Bool)

(declare-fun mapDefault!58990 () ValueCell!18180)

(assert (=> mapNonEmpty!58984 (= condMapEmpty!58990 (= mapRest!58984 ((as const (Array (_ BitVec 32) ValueCell!18180)) mapDefault!58990)))))

(assert (=> mapNonEmpty!58984 (= tp!111976 (and e!863850 mapRes!58990))))

(assert (= (and mapNonEmpty!58984 condMapEmpty!58990) mapIsEmpty!58990))

(assert (= (and mapNonEmpty!58984 (not condMapEmpty!58990)) mapNonEmpty!58990))

(assert (= (and mapNonEmpty!58990 ((_ is ValueCellFull!18180) mapValue!58990)) b!1551779))

(assert (= (and mapNonEmpty!58984 ((_ is ValueCellFull!18180) mapDefault!58990)) b!1551780))

(declare-fun m!1430457 () Bool)

(assert (=> mapNonEmpty!58990 m!1430457))

(declare-fun b_lambda!24783 () Bool)

(assert (= b_lambda!24779 (or (and start!132254 b_free!31905) b_lambda!24783)))

(declare-fun b_lambda!24785 () Bool)

(assert (= b_lambda!24781 (or (and start!132254 b_free!31905) b_lambda!24785)))

(check-sat (not d!161015) (not d!161007) (not d!161009) (not bm!71073) (not d!161031) (not b!1551725) (not d!161033) (not b!1551724) (not b!1551765) tp_is_empty!38181 (not b!1551717) (not b!1551766) (not b_lambda!24783) (not b!1551770) (not d!161005) (not b!1551688) (not b!1551739) (not mapNonEmpty!58990) (not bm!71076) (not b!1551772) (not b!1551771) (not b_next!31905) (not b!1551727) (not d!161001) (not b!1551718) b_and!51345 (not b!1551747) (not b!1551754) (not d!161017) (not d!161003) (not d!160999) (not d!161019) (not b!1551749) (not b!1551750) (not b!1551769) (not bm!71070) (not b!1551720) (not d!161011) (not b!1551752) (not b!1551740) (not b!1551690) (not b!1551726) (not b!1551753) (not b!1551721) (not b_lambda!24785) (not b!1551692) (not d!161013))
(check-sat b_and!51345 (not b_next!31905))
