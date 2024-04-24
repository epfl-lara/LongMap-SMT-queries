; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132524 () Bool)

(assert start!132524)

(declare-fun b_free!31825 () Bool)

(declare-fun b_next!31825 () Bool)

(assert (=> start!132524 (= b_free!31825 (not b_next!31825))))

(declare-fun tp!111726 () Bool)

(declare-fun b_and!51237 () Bool)

(assert (=> start!132524 (= tp!111726 b_and!51237)))

(declare-fun mapNonEmpty!58855 () Bool)

(declare-fun mapRes!58855 () Bool)

(declare-fun tp!111727 () Bool)

(declare-fun e!863873 () Bool)

(assert (=> mapNonEmpty!58855 (= mapRes!58855 (and tp!111727 e!863873))))

(declare-fun mapKey!58855 () (_ BitVec 32))

(declare-datatypes ((V!59245 0))(
  ( (V!59246 (val!19128 Int)) )
))
(declare-datatypes ((ValueCell!18140 0))(
  ( (ValueCellFull!18140 (v!21921 V!59245)) (EmptyCell!18140) )
))
(declare-fun mapValue!58855 () ValueCell!18140)

(declare-fun mapRest!58855 () (Array (_ BitVec 32) ValueCell!18140))

(declare-datatypes ((array!103526 0))(
  ( (array!103527 (arr!49958 (Array (_ BitVec 32) ValueCell!18140)) (size!50509 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103526)

(assert (=> mapNonEmpty!58855 (= (arr!49958 _values!470) (store mapRest!58855 mapKey!58855 mapValue!58855))))

(declare-fun b!1551678 () Bool)

(declare-datatypes ((tuple2!24694 0))(
  ( (tuple2!24695 (_1!12358 (_ BitVec 64)) (_2!12358 V!59245)) )
))
(declare-datatypes ((List!36159 0))(
  ( (Nil!36156) (Cons!36155 (h!37618 tuple2!24694) (t!50845 List!36159)) )
))
(declare-datatypes ((ListLongMap!22311 0))(
  ( (ListLongMap!22312 (toList!11171 List!36159)) )
))
(declare-fun e!863869 () ListLongMap!22311)

(declare-fun call!70565 () ListLongMap!22311)

(assert (=> b!1551678 (= e!863869 call!70565)))

(declare-fun b!1551679 () Bool)

(declare-fun res!1062333 () Bool)

(declare-fun e!863876 () Bool)

(assert (=> b!1551679 (=> (not res!1062333) (not e!863876))))

(declare-datatypes ((array!103528 0))(
  ( (array!103529 (arr!49959 (Array (_ BitVec 32) (_ BitVec 64))) (size!50510 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103528)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551679 (= res!1062333 (validKeyInArray!0 (select (arr!49959 _keys!618) from!762)))))

(declare-fun b!1551680 () Bool)

(declare-fun res!1062330 () Bool)

(declare-fun e!863874 () Bool)

(assert (=> b!1551680 (=> (not res!1062330) (not e!863874))))

(assert (=> b!1551680 (= res!1062330 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50510 _keys!618))))))

(declare-fun b!1551681 () Bool)

(declare-fun e!863877 () Bool)

(declare-fun e!863871 () Bool)

(assert (=> b!1551681 (= e!863877 (and e!863871 mapRes!58855))))

(declare-fun condMapEmpty!58855 () Bool)

(declare-fun mapDefault!58855 () ValueCell!18140)

(assert (=> b!1551681 (= condMapEmpty!58855 (= (arr!49958 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18140)) mapDefault!58855)))))

(declare-fun b!1551682 () Bool)

(declare-fun e!863870 () ListLongMap!22311)

(assert (=> b!1551682 (= e!863870 call!70565)))

(declare-fun b!1551683 () Bool)

(declare-fun call!70569 () ListLongMap!22311)

(assert (=> b!1551683 (= e!863870 call!70569)))

(declare-fun b!1551684 () Bool)

(assert (=> b!1551684 (= e!863874 e!863876)))

(declare-fun res!1062329 () Bool)

(assert (=> b!1551684 (=> (not res!1062329) (not e!863876))))

(assert (=> b!1551684 (= res!1062329 (bvslt from!762 (size!50510 _keys!618)))))

(declare-fun lt!668655 () ListLongMap!22311)

(declare-fun e!863872 () ListLongMap!22311)

(assert (=> b!1551684 (= lt!668655 e!863872)))

(declare-fun c!143141 () Bool)

(declare-fun lt!668656 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1551684 (= c!143141 (and (not lt!668656) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551684 (= lt!668656 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!1062332 () Bool)

(assert (=> start!132524 (=> (not res!1062332) (not e!863874))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132524 (= res!1062332 (validMask!0 mask!926))))

(assert (=> start!132524 e!863874))

(declare-fun array_inv!39107 (array!103528) Bool)

(assert (=> start!132524 (array_inv!39107 _keys!618)))

(declare-fun tp_is_empty!38101 () Bool)

(assert (=> start!132524 tp_is_empty!38101))

(assert (=> start!132524 true))

(assert (=> start!132524 tp!111726))

(declare-fun array_inv!39108 (array!103526) Bool)

(assert (=> start!132524 (and (array_inv!39108 _values!470) e!863877)))

(declare-fun b!1551677 () Bool)

(assert (=> b!1551677 (= e!863873 tp_is_empty!38101)))

(declare-fun b!1551685 () Bool)

(declare-fun res!1062334 () Bool)

(assert (=> b!1551685 (=> (not res!1062334) (not e!863874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103528 (_ BitVec 32)) Bool)

(assert (=> b!1551685 (= res!1062334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551686 () Bool)

(assert (=> b!1551686 (= e!863872 e!863869)))

(declare-fun c!143142 () Bool)

(assert (=> b!1551686 (= c!143142 (and (not lt!668656) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551687 () Bool)

(assert (=> b!1551687 (= e!863871 tp_is_empty!38101)))

(declare-fun bm!70562 () Bool)

(declare-fun call!70568 () ListLongMap!22311)

(declare-fun call!70567 () ListLongMap!22311)

(assert (=> bm!70562 (= call!70568 call!70567)))

(declare-fun b!1551688 () Bool)

(assert (=> b!1551688 (= e!863876 (not true))))

(declare-fun lt!668654 () V!59245)

(declare-fun lt!668652 () ListLongMap!22311)

(declare-fun apply!1086 (ListLongMap!22311 (_ BitVec 64)) V!59245)

(assert (=> b!1551688 (= (apply!1086 lt!668652 (select (arr!49959 _keys!618) from!762)) lt!668654)))

(declare-datatypes ((Unit!51537 0))(
  ( (Unit!51538) )
))
(declare-fun lt!668653 () Unit!51537)

(declare-fun lt!668659 () ListLongMap!22311)

(declare-fun zeroValue!436 () V!59245)

(declare-fun addApplyDifferent!615 (ListLongMap!22311 (_ BitVec 64) V!59245 (_ BitVec 64)) Unit!51537)

(assert (=> b!1551688 (= lt!668653 (addApplyDifferent!615 lt!668659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49959 _keys!618) from!762)))))

(declare-fun lt!668658 () V!59245)

(assert (=> b!1551688 (= lt!668658 lt!668654)))

(assert (=> b!1551688 (= lt!668654 (apply!1086 lt!668659 (select (arr!49959 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59245)

(declare-fun +!5008 (ListLongMap!22311 tuple2!24694) ListLongMap!22311)

(assert (=> b!1551688 (= lt!668658 (apply!1086 (+!5008 lt!668659 (tuple2!24695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49959 _keys!618) from!762)))))

(declare-fun lt!668651 () Unit!51537)

(assert (=> b!1551688 (= lt!668651 (addApplyDifferent!615 lt!668659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49959 _keys!618) from!762)))))

(declare-fun contains!10134 (ListLongMap!22311 (_ BitVec 64)) Bool)

(assert (=> b!1551688 (contains!10134 lt!668652 (select (arr!49959 _keys!618) from!762))))

(assert (=> b!1551688 (= lt!668652 (+!5008 lt!668659 (tuple2!24695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668657 () Unit!51537)

(declare-fun addStillContains!1276 (ListLongMap!22311 (_ BitVec 64) V!59245 (_ BitVec 64)) Unit!51537)

(assert (=> b!1551688 (= lt!668657 (addStillContains!1276 lt!668659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49959 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6640 (array!103528 array!103526 (_ BitVec 32) (_ BitVec 32) V!59245 V!59245 (_ BitVec 32) Int) ListLongMap!22311)

(assert (=> b!1551688 (= lt!668659 (getCurrentListMapNoExtraKeys!6640 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun call!70566 () ListLongMap!22311)

(declare-fun bm!70563 () Bool)

(assert (=> bm!70563 (= call!70566 (+!5008 (ite c!143141 call!70567 (ite c!143142 call!70568 call!70569)) (ite (or c!143141 c!143142) (tuple2!24695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58855 () Bool)

(assert (=> mapIsEmpty!58855 mapRes!58855))

(declare-fun b!1551689 () Bool)

(declare-fun c!143143 () Bool)

(assert (=> b!1551689 (= c!143143 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668656))))

(assert (=> b!1551689 (= e!863869 e!863870)))

(declare-fun bm!70564 () Bool)

(assert (=> bm!70564 (= call!70567 (getCurrentListMapNoExtraKeys!6640 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551690 () Bool)

(declare-fun res!1062331 () Bool)

(assert (=> b!1551690 (=> (not res!1062331) (not e!863874))))

(assert (=> b!1551690 (= res!1062331 (and (= (size!50509 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50510 _keys!618) (size!50509 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551691 () Bool)

(declare-fun res!1062335 () Bool)

(assert (=> b!1551691 (=> (not res!1062335) (not e!863874))))

(declare-datatypes ((List!36160 0))(
  ( (Nil!36157) (Cons!36156 (h!37619 (_ BitVec 64)) (t!50846 List!36160)) )
))
(declare-fun arrayNoDuplicates!0 (array!103528 (_ BitVec 32) List!36160) Bool)

(assert (=> b!1551691 (= res!1062335 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36157))))

(declare-fun bm!70565 () Bool)

(assert (=> bm!70565 (= call!70565 call!70566)))

(declare-fun b!1551692 () Bool)

(assert (=> b!1551692 (= e!863872 (+!5008 call!70566 (tuple2!24695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70566 () Bool)

(assert (=> bm!70566 (= call!70569 call!70568)))

(assert (= (and start!132524 res!1062332) b!1551690))

(assert (= (and b!1551690 res!1062331) b!1551685))

(assert (= (and b!1551685 res!1062334) b!1551691))

(assert (= (and b!1551691 res!1062335) b!1551680))

(assert (= (and b!1551680 res!1062330) b!1551684))

(assert (= (and b!1551684 c!143141) b!1551692))

(assert (= (and b!1551684 (not c!143141)) b!1551686))

(assert (= (and b!1551686 c!143142) b!1551678))

(assert (= (and b!1551686 (not c!143142)) b!1551689))

(assert (= (and b!1551689 c!143143) b!1551682))

(assert (= (and b!1551689 (not c!143143)) b!1551683))

(assert (= (or b!1551682 b!1551683) bm!70566))

(assert (= (or b!1551678 bm!70566) bm!70562))

(assert (= (or b!1551678 b!1551682) bm!70565))

(assert (= (or b!1551692 bm!70562) bm!70564))

(assert (= (or b!1551692 bm!70565) bm!70563))

(assert (= (and b!1551684 res!1062329) b!1551679))

(assert (= (and b!1551679 res!1062333) b!1551688))

(assert (= (and b!1551681 condMapEmpty!58855) mapIsEmpty!58855))

(assert (= (and b!1551681 (not condMapEmpty!58855)) mapNonEmpty!58855))

(get-info :version)

(assert (= (and mapNonEmpty!58855 ((_ is ValueCellFull!18140) mapValue!58855)) b!1551677))

(assert (= (and b!1551681 ((_ is ValueCellFull!18140) mapDefault!58855)) b!1551687))

(assert (= start!132524 b!1551681))

(declare-fun m!1430769 () Bool)

(assert (=> bm!70564 m!1430769))

(declare-fun m!1430771 () Bool)

(assert (=> b!1551685 m!1430771))

(declare-fun m!1430773 () Bool)

(assert (=> bm!70563 m!1430773))

(declare-fun m!1430775 () Bool)

(assert (=> start!132524 m!1430775))

(declare-fun m!1430777 () Bool)

(assert (=> start!132524 m!1430777))

(declare-fun m!1430779 () Bool)

(assert (=> start!132524 m!1430779))

(declare-fun m!1430781 () Bool)

(assert (=> b!1551691 m!1430781))

(declare-fun m!1430783 () Bool)

(assert (=> b!1551692 m!1430783))

(declare-fun m!1430785 () Bool)

(assert (=> b!1551679 m!1430785))

(assert (=> b!1551679 m!1430785))

(declare-fun m!1430787 () Bool)

(assert (=> b!1551679 m!1430787))

(assert (=> b!1551688 m!1430785))

(declare-fun m!1430789 () Bool)

(assert (=> b!1551688 m!1430789))

(assert (=> b!1551688 m!1430769))

(assert (=> b!1551688 m!1430785))

(assert (=> b!1551688 m!1430785))

(declare-fun m!1430791 () Bool)

(assert (=> b!1551688 m!1430791))

(assert (=> b!1551688 m!1430785))

(declare-fun m!1430793 () Bool)

(assert (=> b!1551688 m!1430793))

(declare-fun m!1430795 () Bool)

(assert (=> b!1551688 m!1430795))

(assert (=> b!1551688 m!1430785))

(declare-fun m!1430797 () Bool)

(assert (=> b!1551688 m!1430797))

(assert (=> b!1551688 m!1430785))

(declare-fun m!1430799 () Bool)

(assert (=> b!1551688 m!1430799))

(declare-fun m!1430801 () Bool)

(assert (=> b!1551688 m!1430801))

(assert (=> b!1551688 m!1430785))

(declare-fun m!1430803 () Bool)

(assert (=> b!1551688 m!1430803))

(assert (=> b!1551688 m!1430795))

(assert (=> b!1551688 m!1430785))

(declare-fun m!1430805 () Bool)

(assert (=> b!1551688 m!1430805))

(declare-fun m!1430807 () Bool)

(assert (=> mapNonEmpty!58855 m!1430807))

(check-sat (not mapNonEmpty!58855) (not bm!70564) (not b!1551691) (not start!132524) (not b_next!31825) b_and!51237 tp_is_empty!38101 (not bm!70563) (not b!1551685) (not b!1551692) (not b!1551688) (not b!1551679))
(check-sat b_and!51237 (not b_next!31825))
