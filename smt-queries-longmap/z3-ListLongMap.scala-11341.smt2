; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132362 () Bool)

(assert start!132362)

(declare-fun b_free!31663 () Bool)

(declare-fun b_next!31663 () Bool)

(assert (=> start!132362 (= b_free!31663 (not b_next!31663))))

(declare-fun tp!111240 () Bool)

(declare-fun b_and!51075 () Bool)

(assert (=> start!132362 (= tp!111240 b_and!51075)))

(declare-fun b!1547789 () Bool)

(declare-datatypes ((V!59029 0))(
  ( (V!59030 (val!19047 Int)) )
))
(declare-datatypes ((tuple2!24536 0))(
  ( (tuple2!24537 (_1!12279 (_ BitVec 64)) (_2!12279 V!59029)) )
))
(declare-datatypes ((List!36028 0))(
  ( (Nil!36025) (Cons!36024 (h!37487 tuple2!24536) (t!50714 List!36028)) )
))
(declare-datatypes ((ListLongMap!22153 0))(
  ( (ListLongMap!22154 (toList!11092 List!36028)) )
))
(declare-fun e!861686 () ListLongMap!22153)

(declare-fun e!861683 () ListLongMap!22153)

(assert (=> b!1547789 (= e!861686 e!861683)))

(declare-fun c!142414 () Bool)

(declare-fun lt!667201 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547789 (= c!142414 (and (not lt!667201) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547790 () Bool)

(declare-fun res!1060631 () Bool)

(declare-fun e!861688 () Bool)

(assert (=> b!1547790 (=> (not res!1060631) (not e!861688))))

(declare-datatypes ((array!103206 0))(
  ( (array!103207 (arr!49798 (Array (_ BitVec 32) (_ BitVec 64))) (size!50349 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103206)

(declare-datatypes ((List!36029 0))(
  ( (Nil!36026) (Cons!36025 (h!37488 (_ BitVec 64)) (t!50715 List!36029)) )
))
(declare-fun arrayNoDuplicates!0 (array!103206 (_ BitVec 32) List!36029) Bool)

(assert (=> b!1547790 (= res!1060631 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36026))))

(declare-fun b!1547791 () Bool)

(declare-fun res!1060629 () Bool)

(assert (=> b!1547791 (=> (not res!1060629) (not e!861688))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1547791 (= res!1060629 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50349 _keys!618))))))

(declare-fun b!1547792 () Bool)

(declare-fun call!69351 () ListLongMap!22153)

(assert (=> b!1547792 (= e!861683 call!69351)))

(declare-fun mapIsEmpty!58612 () Bool)

(declare-fun mapRes!58612 () Bool)

(assert (=> mapIsEmpty!58612 mapRes!58612))

(declare-fun bm!69347 () Bool)

(declare-fun call!69354 () ListLongMap!22153)

(assert (=> bm!69347 (= call!69351 call!69354)))

(declare-fun res!1060634 () Bool)

(assert (=> start!132362 (=> (not res!1060634) (not e!861688))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132362 (= res!1060634 (validMask!0 mask!926))))

(assert (=> start!132362 e!861688))

(declare-fun array_inv!38999 (array!103206) Bool)

(assert (=> start!132362 (array_inv!38999 _keys!618)))

(declare-fun tp_is_empty!37939 () Bool)

(assert (=> start!132362 tp_is_empty!37939))

(assert (=> start!132362 true))

(assert (=> start!132362 tp!111240))

(declare-datatypes ((ValueCell!18059 0))(
  ( (ValueCellFull!18059 (v!21840 V!59029)) (EmptyCell!18059) )
))
(declare-datatypes ((array!103208 0))(
  ( (array!103209 (arr!49799 (Array (_ BitVec 32) ValueCell!18059)) (size!50350 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103208)

(declare-fun e!861685 () Bool)

(declare-fun array_inv!39000 (array!103208) Bool)

(assert (=> start!132362 (and (array_inv!39000 _values!470) e!861685)))

(declare-fun b!1547793 () Bool)

(declare-fun e!861684 () Bool)

(assert (=> b!1547793 (= e!861684 tp_is_empty!37939)))

(declare-fun b!1547794 () Bool)

(declare-fun e!861687 () Bool)

(assert (=> b!1547794 (= e!861687 (not true))))

(declare-fun zeroValue!436 () V!59029)

(declare-fun lt!667202 () ListLongMap!22153)

(declare-fun contains!10079 (ListLongMap!22153 (_ BitVec 64)) Bool)

(declare-fun +!4939 (ListLongMap!22153 tuple2!24536) ListLongMap!22153)

(assert (=> b!1547794 (contains!10079 (+!4939 lt!667202 (tuple2!24537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49798 _keys!618) from!762))))

(declare-datatypes ((Unit!51427 0))(
  ( (Unit!51428) )
))
(declare-fun lt!667203 () Unit!51427)

(declare-fun addStillContains!1221 (ListLongMap!22153 (_ BitVec 64) V!59029 (_ BitVec 64)) Unit!51427)

(assert (=> b!1547794 (= lt!667203 (addStillContains!1221 lt!667202 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49798 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!59029)

(declare-fun getCurrentListMapNoExtraKeys!6576 (array!103206 array!103208 (_ BitVec 32) (_ BitVec 32) V!59029 V!59029 (_ BitVec 32) Int) ListLongMap!22153)

(assert (=> b!1547794 (= lt!667202 (getCurrentListMapNoExtraKeys!6576 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69348 () Bool)

(declare-fun call!69350 () ListLongMap!22153)

(assert (=> bm!69348 (= call!69350 (getCurrentListMapNoExtraKeys!6576 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58612 () Bool)

(declare-fun tp!111241 () Bool)

(declare-fun e!861690 () Bool)

(assert (=> mapNonEmpty!58612 (= mapRes!58612 (and tp!111241 e!861690))))

(declare-fun mapRest!58612 () (Array (_ BitVec 32) ValueCell!18059))

(declare-fun mapKey!58612 () (_ BitVec 32))

(declare-fun mapValue!58612 () ValueCell!18059)

(assert (=> mapNonEmpty!58612 (= (arr!49799 _values!470) (store mapRest!58612 mapKey!58612 mapValue!58612))))

(declare-fun bm!69349 () Bool)

(declare-fun call!69352 () ListLongMap!22153)

(assert (=> bm!69349 (= call!69352 call!69350)))

(declare-fun b!1547795 () Bool)

(assert (=> b!1547795 (= e!861685 (and e!861684 mapRes!58612))))

(declare-fun condMapEmpty!58612 () Bool)

(declare-fun mapDefault!58612 () ValueCell!18059)

(assert (=> b!1547795 (= condMapEmpty!58612 (= (arr!49799 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18059)) mapDefault!58612)))))

(declare-fun b!1547796 () Bool)

(declare-fun res!1060633 () Bool)

(assert (=> b!1547796 (=> (not res!1060633) (not e!861687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547796 (= res!1060633 (validKeyInArray!0 (select (arr!49798 _keys!618) from!762)))))

(declare-fun b!1547797 () Bool)

(declare-fun res!1060628 () Bool)

(assert (=> b!1547797 (=> (not res!1060628) (not e!861688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103206 (_ BitVec 32)) Bool)

(assert (=> b!1547797 (= res!1060628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69350 () Bool)

(declare-fun call!69353 () ListLongMap!22153)

(declare-fun c!142413 () Bool)

(assert (=> bm!69350 (= call!69354 (+!4939 (ite c!142413 call!69350 (ite c!142414 call!69352 call!69353)) (ite (or c!142413 c!142414) (tuple2!24537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547798 () Bool)

(declare-fun e!861682 () ListLongMap!22153)

(assert (=> b!1547798 (= e!861682 call!69351)))

(declare-fun b!1547799 () Bool)

(assert (=> b!1547799 (= e!861690 tp_is_empty!37939)))

(declare-fun bm!69351 () Bool)

(assert (=> bm!69351 (= call!69353 call!69352)))

(declare-fun b!1547800 () Bool)

(declare-fun res!1060632 () Bool)

(assert (=> b!1547800 (=> (not res!1060632) (not e!861688))))

(assert (=> b!1547800 (= res!1060632 (and (= (size!50350 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50349 _keys!618) (size!50350 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547801 () Bool)

(declare-fun c!142412 () Bool)

(assert (=> b!1547801 (= c!142412 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667201))))

(assert (=> b!1547801 (= e!861683 e!861682)))

(declare-fun b!1547802 () Bool)

(assert (=> b!1547802 (= e!861682 call!69353)))

(declare-fun b!1547803 () Bool)

(assert (=> b!1547803 (= e!861688 e!861687)))

(declare-fun res!1060630 () Bool)

(assert (=> b!1547803 (=> (not res!1060630) (not e!861687))))

(assert (=> b!1547803 (= res!1060630 (bvslt from!762 (size!50349 _keys!618)))))

(declare-fun lt!667204 () ListLongMap!22153)

(assert (=> b!1547803 (= lt!667204 e!861686)))

(assert (=> b!1547803 (= c!142413 (and (not lt!667201) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547803 (= lt!667201 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547804 () Bool)

(assert (=> b!1547804 (= e!861686 (+!4939 call!69354 (tuple2!24537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!132362 res!1060634) b!1547800))

(assert (= (and b!1547800 res!1060632) b!1547797))

(assert (= (and b!1547797 res!1060628) b!1547790))

(assert (= (and b!1547790 res!1060631) b!1547791))

(assert (= (and b!1547791 res!1060629) b!1547803))

(assert (= (and b!1547803 c!142413) b!1547804))

(assert (= (and b!1547803 (not c!142413)) b!1547789))

(assert (= (and b!1547789 c!142414) b!1547792))

(assert (= (and b!1547789 (not c!142414)) b!1547801))

(assert (= (and b!1547801 c!142412) b!1547798))

(assert (= (and b!1547801 (not c!142412)) b!1547802))

(assert (= (or b!1547798 b!1547802) bm!69351))

(assert (= (or b!1547792 bm!69351) bm!69349))

(assert (= (or b!1547792 b!1547798) bm!69347))

(assert (= (or b!1547804 bm!69349) bm!69348))

(assert (= (or b!1547804 bm!69347) bm!69350))

(assert (= (and b!1547803 res!1060630) b!1547796))

(assert (= (and b!1547796 res!1060633) b!1547794))

(assert (= (and b!1547795 condMapEmpty!58612) mapIsEmpty!58612))

(assert (= (and b!1547795 (not condMapEmpty!58612)) mapNonEmpty!58612))

(get-info :version)

(assert (= (and mapNonEmpty!58612 ((_ is ValueCellFull!18059) mapValue!58612)) b!1547799))

(assert (= (and b!1547795 ((_ is ValueCellFull!18059) mapDefault!58612)) b!1547793))

(assert (= start!132362 b!1547795))

(declare-fun m!1427961 () Bool)

(assert (=> b!1547804 m!1427961))

(declare-fun m!1427963 () Bool)

(assert (=> bm!69350 m!1427963))

(declare-fun m!1427965 () Bool)

(assert (=> b!1547790 m!1427965))

(declare-fun m!1427967 () Bool)

(assert (=> b!1547796 m!1427967))

(assert (=> b!1547796 m!1427967))

(declare-fun m!1427969 () Bool)

(assert (=> b!1547796 m!1427969))

(declare-fun m!1427971 () Bool)

(assert (=> b!1547794 m!1427971))

(assert (=> b!1547794 m!1427967))

(assert (=> b!1547794 m!1427967))

(declare-fun m!1427973 () Bool)

(assert (=> b!1547794 m!1427973))

(declare-fun m!1427975 () Bool)

(assert (=> b!1547794 m!1427975))

(assert (=> b!1547794 m!1427975))

(assert (=> b!1547794 m!1427967))

(declare-fun m!1427977 () Bool)

(assert (=> b!1547794 m!1427977))

(declare-fun m!1427979 () Bool)

(assert (=> b!1547797 m!1427979))

(assert (=> bm!69348 m!1427971))

(declare-fun m!1427981 () Bool)

(assert (=> mapNonEmpty!58612 m!1427981))

(declare-fun m!1427983 () Bool)

(assert (=> start!132362 m!1427983))

(declare-fun m!1427985 () Bool)

(assert (=> start!132362 m!1427985))

(declare-fun m!1427987 () Bool)

(assert (=> start!132362 m!1427987))

(check-sat (not b!1547790) b_and!51075 (not b!1547794) (not b!1547804) (not b!1547797) (not start!132362) (not bm!69348) (not bm!69350) (not b!1547796) (not mapNonEmpty!58612) (not b_next!31663) tp_is_empty!37939)
(check-sat b_and!51075 (not b_next!31663))
