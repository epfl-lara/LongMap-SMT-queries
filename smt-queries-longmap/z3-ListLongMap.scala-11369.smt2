; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132530 () Bool)

(assert start!132530)

(declare-fun b_free!31831 () Bool)

(declare-fun b_next!31831 () Bool)

(assert (=> start!132530 (= b_free!31831 (not b_next!31831))))

(declare-fun tp!111744 () Bool)

(declare-fun b_and!51243 () Bool)

(assert (=> start!132530 (= tp!111744 b_and!51243)))

(declare-fun b!1551821 () Bool)

(declare-fun res!1062398 () Bool)

(declare-fun e!863954 () Bool)

(assert (=> b!1551821 (=> (not res!1062398) (not e!863954))))

(declare-datatypes ((array!103538 0))(
  ( (array!103539 (arr!49964 (Array (_ BitVec 32) (_ BitVec 64))) (size!50515 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103538)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59253 0))(
  ( (V!59254 (val!19131 Int)) )
))
(declare-datatypes ((ValueCell!18143 0))(
  ( (ValueCellFull!18143 (v!21924 V!59253)) (EmptyCell!18143) )
))
(declare-datatypes ((array!103540 0))(
  ( (array!103541 (arr!49965 (Array (_ BitVec 32) ValueCell!18143)) (size!50516 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103540)

(assert (=> b!1551821 (= res!1062398 (and (= (size!50516 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50515 _keys!618) (size!50516 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58864 () Bool)

(declare-fun mapRes!58864 () Bool)

(assert (=> mapIsEmpty!58864 mapRes!58864))

(declare-fun b!1551822 () Bool)

(declare-fun e!863958 () Bool)

(declare-fun tp_is_empty!38107 () Bool)

(assert (=> b!1551822 (= e!863958 tp_is_empty!38107)))

(declare-fun b!1551823 () Bool)

(declare-datatypes ((tuple2!24700 0))(
  ( (tuple2!24701 (_1!12361 (_ BitVec 64)) (_2!12361 V!59253)) )
))
(declare-datatypes ((List!36165 0))(
  ( (Nil!36162) (Cons!36161 (h!37624 tuple2!24700) (t!50851 List!36165)) )
))
(declare-datatypes ((ListLongMap!22317 0))(
  ( (ListLongMap!22318 (toList!11174 List!36165)) )
))
(declare-fun e!863957 () ListLongMap!22317)

(declare-fun call!70611 () ListLongMap!22317)

(assert (=> b!1551823 (= e!863957 call!70611)))

(declare-fun b!1551824 () Bool)

(declare-fun res!1062393 () Bool)

(assert (=> b!1551824 (=> (not res!1062393) (not e!863954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103538 (_ BitVec 32)) Bool)

(assert (=> b!1551824 (= res!1062393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun zeroValue!436 () V!59253)

(declare-fun bm!70607 () Bool)

(declare-fun minValue!436 () V!59253)

(declare-fun call!70610 () ListLongMap!22317)

(declare-fun call!70612 () ListLongMap!22317)

(declare-fun c!143169 () Bool)

(declare-fun c!143168 () Bool)

(declare-fun call!70613 () ListLongMap!22317)

(declare-fun +!5011 (ListLongMap!22317 tuple2!24700) ListLongMap!22317)

(assert (=> bm!70607 (= call!70613 (+!5011 (ite c!143168 call!70612 (ite c!143169 call!70610 call!70611)) (ite (or c!143168 c!143169) (tuple2!24701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70608 () Bool)

(assert (=> bm!70608 (= call!70610 call!70612)))

(declare-fun bm!70609 () Bool)

(declare-fun call!70614 () ListLongMap!22317)

(assert (=> bm!70609 (= call!70614 call!70613)))

(declare-fun b!1551825 () Bool)

(declare-fun res!1062397 () Bool)

(assert (=> b!1551825 (=> (not res!1062397) (not e!863954))))

(declare-datatypes ((List!36166 0))(
  ( (Nil!36163) (Cons!36162 (h!37625 (_ BitVec 64)) (t!50852 List!36166)) )
))
(declare-fun arrayNoDuplicates!0 (array!103538 (_ BitVec 32) List!36166) Bool)

(assert (=> b!1551825 (= res!1062397 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36163))))

(declare-fun b!1551826 () Bool)

(declare-fun e!863953 () ListLongMap!22317)

(assert (=> b!1551826 (= e!863953 (+!5011 call!70613 (tuple2!24701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1062392 () Bool)

(assert (=> start!132530 (=> (not res!1062392) (not e!863954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132530 (= res!1062392 (validMask!0 mask!926))))

(assert (=> start!132530 e!863954))

(declare-fun array_inv!39113 (array!103538) Bool)

(assert (=> start!132530 (array_inv!39113 _keys!618)))

(assert (=> start!132530 tp_is_empty!38107))

(assert (=> start!132530 true))

(assert (=> start!132530 tp!111744))

(declare-fun e!863955 () Bool)

(declare-fun array_inv!39114 (array!103540) Bool)

(assert (=> start!132530 (and (array_inv!39114 _values!470) e!863955)))

(declare-fun b!1551827 () Bool)

(assert (=> b!1551827 (= e!863957 call!70614)))

(declare-fun b!1551828 () Bool)

(declare-fun e!863952 () ListLongMap!22317)

(assert (=> b!1551828 (= e!863953 e!863952)))

(declare-fun lt!668742 () Bool)

(assert (=> b!1551828 (= c!143169 (and (not lt!668742) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58864 () Bool)

(declare-fun tp!111745 () Bool)

(declare-fun e!863951 () Bool)

(assert (=> mapNonEmpty!58864 (= mapRes!58864 (and tp!111745 e!863951))))

(declare-fun mapKey!58864 () (_ BitVec 32))

(declare-fun mapRest!58864 () (Array (_ BitVec 32) ValueCell!18143))

(declare-fun mapValue!58864 () ValueCell!18143)

(assert (=> mapNonEmpty!58864 (= (arr!49965 _values!470) (store mapRest!58864 mapKey!58864 mapValue!58864))))

(declare-fun b!1551829 () Bool)

(declare-fun e!863950 () Bool)

(assert (=> b!1551829 (= e!863950 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!668734 () ListLongMap!22317)

(declare-fun lt!668743 () Bool)

(declare-fun contains!10137 (ListLongMap!22317 (_ BitVec 64)) Bool)

(assert (=> b!1551829 (= lt!668743 (contains!10137 lt!668734 (select (arr!49964 _keys!618) from!762)))))

(declare-fun lt!668739 () ListLongMap!22317)

(declare-fun lt!668737 () V!59253)

(declare-fun apply!1089 (ListLongMap!22317 (_ BitVec 64)) V!59253)

(assert (=> b!1551829 (= (apply!1089 lt!668739 (select (arr!49964 _keys!618) from!762)) lt!668737)))

(declare-datatypes ((Unit!51543 0))(
  ( (Unit!51544) )
))
(declare-fun lt!668738 () Unit!51543)

(declare-fun addApplyDifferent!618 (ListLongMap!22317 (_ BitVec 64) V!59253 (_ BitVec 64)) Unit!51543)

(assert (=> b!1551829 (= lt!668738 (addApplyDifferent!618 lt!668734 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49964 _keys!618) from!762)))))

(declare-fun lt!668741 () V!59253)

(assert (=> b!1551829 (= lt!668741 lt!668737)))

(assert (=> b!1551829 (= lt!668737 (apply!1089 lt!668734 (select (arr!49964 _keys!618) from!762)))))

(assert (=> b!1551829 (= lt!668741 (apply!1089 (+!5011 lt!668734 (tuple2!24701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49964 _keys!618) from!762)))))

(declare-fun lt!668740 () Unit!51543)

(assert (=> b!1551829 (= lt!668740 (addApplyDifferent!618 lt!668734 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49964 _keys!618) from!762)))))

(assert (=> b!1551829 (contains!10137 lt!668739 (select (arr!49964 _keys!618) from!762))))

(assert (=> b!1551829 (= lt!668739 (+!5011 lt!668734 (tuple2!24701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668735 () Unit!51543)

(declare-fun addStillContains!1279 (ListLongMap!22317 (_ BitVec 64) V!59253 (_ BitVec 64)) Unit!51543)

(assert (=> b!1551829 (= lt!668735 (addStillContains!1279 lt!668734 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49964 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6643 (array!103538 array!103540 (_ BitVec 32) (_ BitVec 32) V!59253 V!59253 (_ BitVec 32) Int) ListLongMap!22317)

(assert (=> b!1551829 (= lt!668734 (getCurrentListMapNoExtraKeys!6643 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70610 () Bool)

(assert (=> bm!70610 (= call!70612 (getCurrentListMapNoExtraKeys!6643 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551830 () Bool)

(assert (=> b!1551830 (= e!863951 tp_is_empty!38107)))

(declare-fun bm!70611 () Bool)

(assert (=> bm!70611 (= call!70611 call!70610)))

(declare-fun b!1551831 () Bool)

(declare-fun res!1062394 () Bool)

(assert (=> b!1551831 (=> (not res!1062394) (not e!863954))))

(assert (=> b!1551831 (= res!1062394 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50515 _keys!618))))))

(declare-fun b!1551832 () Bool)

(assert (=> b!1551832 (= e!863952 call!70614)))

(declare-fun b!1551833 () Bool)

(assert (=> b!1551833 (= e!863955 (and e!863958 mapRes!58864))))

(declare-fun condMapEmpty!58864 () Bool)

(declare-fun mapDefault!58864 () ValueCell!18143)

(assert (=> b!1551833 (= condMapEmpty!58864 (= (arr!49965 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18143)) mapDefault!58864)))))

(declare-fun b!1551834 () Bool)

(declare-fun res!1062395 () Bool)

(assert (=> b!1551834 (=> (not res!1062395) (not e!863950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551834 (= res!1062395 (validKeyInArray!0 (select (arr!49964 _keys!618) from!762)))))

(declare-fun b!1551835 () Bool)

(declare-fun c!143170 () Bool)

(assert (=> b!1551835 (= c!143170 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668742))))

(assert (=> b!1551835 (= e!863952 e!863957)))

(declare-fun b!1551836 () Bool)

(assert (=> b!1551836 (= e!863954 e!863950)))

(declare-fun res!1062396 () Bool)

(assert (=> b!1551836 (=> (not res!1062396) (not e!863950))))

(assert (=> b!1551836 (= res!1062396 (bvslt from!762 (size!50515 _keys!618)))))

(declare-fun lt!668736 () ListLongMap!22317)

(assert (=> b!1551836 (= lt!668736 e!863953)))

(assert (=> b!1551836 (= c!143168 (and (not lt!668742) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551836 (= lt!668742 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!132530 res!1062392) b!1551821))

(assert (= (and b!1551821 res!1062398) b!1551824))

(assert (= (and b!1551824 res!1062393) b!1551825))

(assert (= (and b!1551825 res!1062397) b!1551831))

(assert (= (and b!1551831 res!1062394) b!1551836))

(assert (= (and b!1551836 c!143168) b!1551826))

(assert (= (and b!1551836 (not c!143168)) b!1551828))

(assert (= (and b!1551828 c!143169) b!1551832))

(assert (= (and b!1551828 (not c!143169)) b!1551835))

(assert (= (and b!1551835 c!143170) b!1551827))

(assert (= (and b!1551835 (not c!143170)) b!1551823))

(assert (= (or b!1551827 b!1551823) bm!70611))

(assert (= (or b!1551832 bm!70611) bm!70608))

(assert (= (or b!1551832 b!1551827) bm!70609))

(assert (= (or b!1551826 bm!70608) bm!70610))

(assert (= (or b!1551826 bm!70609) bm!70607))

(assert (= (and b!1551836 res!1062396) b!1551834))

(assert (= (and b!1551834 res!1062395) b!1551829))

(assert (= (and b!1551833 condMapEmpty!58864) mapIsEmpty!58864))

(assert (= (and b!1551833 (not condMapEmpty!58864)) mapNonEmpty!58864))

(get-info :version)

(assert (= (and mapNonEmpty!58864 ((_ is ValueCellFull!18143) mapValue!58864)) b!1551830))

(assert (= (and b!1551833 ((_ is ValueCellFull!18143) mapDefault!58864)) b!1551822))

(assert (= start!132530 b!1551833))

(declare-fun m!1430889 () Bool)

(assert (=> bm!70607 m!1430889))

(declare-fun m!1430891 () Bool)

(assert (=> b!1551829 m!1430891))

(declare-fun m!1430893 () Bool)

(assert (=> b!1551829 m!1430893))

(declare-fun m!1430895 () Bool)

(assert (=> b!1551829 m!1430895))

(assert (=> b!1551829 m!1430891))

(assert (=> b!1551829 m!1430891))

(declare-fun m!1430897 () Bool)

(assert (=> b!1551829 m!1430897))

(declare-fun m!1430899 () Bool)

(assert (=> b!1551829 m!1430899))

(assert (=> b!1551829 m!1430891))

(declare-fun m!1430901 () Bool)

(assert (=> b!1551829 m!1430901))

(declare-fun m!1430903 () Bool)

(assert (=> b!1551829 m!1430903))

(assert (=> b!1551829 m!1430891))

(declare-fun m!1430905 () Bool)

(assert (=> b!1551829 m!1430905))

(assert (=> b!1551829 m!1430903))

(assert (=> b!1551829 m!1430891))

(declare-fun m!1430907 () Bool)

(assert (=> b!1551829 m!1430907))

(assert (=> b!1551829 m!1430891))

(declare-fun m!1430909 () Bool)

(assert (=> b!1551829 m!1430909))

(assert (=> b!1551829 m!1430891))

(declare-fun m!1430911 () Bool)

(assert (=> b!1551829 m!1430911))

(assert (=> b!1551829 m!1430891))

(declare-fun m!1430913 () Bool)

(assert (=> b!1551829 m!1430913))

(declare-fun m!1430915 () Bool)

(assert (=> b!1551824 m!1430915))

(declare-fun m!1430917 () Bool)

(assert (=> start!132530 m!1430917))

(declare-fun m!1430919 () Bool)

(assert (=> start!132530 m!1430919))

(declare-fun m!1430921 () Bool)

(assert (=> start!132530 m!1430921))

(declare-fun m!1430923 () Bool)

(assert (=> mapNonEmpty!58864 m!1430923))

(assert (=> bm!70610 m!1430895))

(declare-fun m!1430925 () Bool)

(assert (=> b!1551825 m!1430925))

(assert (=> b!1551834 m!1430891))

(assert (=> b!1551834 m!1430891))

(declare-fun m!1430927 () Bool)

(assert (=> b!1551834 m!1430927))

(declare-fun m!1430929 () Bool)

(assert (=> b!1551826 m!1430929))

(check-sat (not b_next!31831) (not b!1551834) b_and!51243 (not b!1551826) tp_is_empty!38107 (not b!1551825) (not mapNonEmpty!58864) (not bm!70607) (not b!1551829) (not bm!70610) (not start!132530) (not b!1551824))
(check-sat b_and!51243 (not b_next!31831))
