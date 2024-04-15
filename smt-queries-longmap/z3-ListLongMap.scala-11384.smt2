; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132244 () Bool)

(assert start!132244)

(declare-fun b_free!31921 () Bool)

(declare-fun b_next!31921 () Bool)

(assert (=> start!132244 (= b_free!31921 (not b_next!31921))))

(declare-fun tp!112027 () Bool)

(declare-fun b_and!51341 () Bool)

(assert (=> start!132244 (= tp!112027 b_and!51341)))

(declare-fun mapNonEmpty!59011 () Bool)

(declare-fun mapRes!59011 () Bool)

(declare-fun tp!112028 () Bool)

(declare-fun e!863865 () Bool)

(assert (=> mapNonEmpty!59011 (= mapRes!59011 (and tp!112028 e!863865))))

(declare-datatypes ((V!59373 0))(
  ( (V!59374 (val!19176 Int)) )
))
(declare-datatypes ((ValueCell!18188 0))(
  ( (ValueCellFull!18188 (v!21977 V!59373)) (EmptyCell!18188) )
))
(declare-fun mapValue!59011 () ValueCell!18188)

(declare-fun mapRest!59011 () (Array (_ BitVec 32) ValueCell!18188))

(declare-datatypes ((array!103520 0))(
  ( (array!103521 (arr!49959 (Array (_ BitVec 32) ValueCell!18188)) (size!50511 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103520)

(declare-fun mapKey!59011 () (_ BitVec 32))

(assert (=> mapNonEmpty!59011 (= (arr!49959 _values!470) (store mapRest!59011 mapKey!59011 mapValue!59011))))

(declare-fun b!1551810 () Bool)

(declare-fun e!863859 () Bool)

(declare-fun e!863856 () Bool)

(assert (=> b!1551810 (= e!863859 e!863856)))

(declare-fun res!1062584 () Bool)

(assert (=> b!1551810 (=> (not res!1062584) (not e!863856))))

(declare-fun lt!668806 () Bool)

(assert (=> b!1551810 (= res!1062584 (not lt!668806))))

(declare-datatypes ((Unit!51511 0))(
  ( (Unit!51512) )
))
(declare-fun lt!668808 () Unit!51511)

(declare-fun e!863861 () Unit!51511)

(assert (=> b!1551810 (= lt!668808 e!863861)))

(declare-fun c!142827 () Bool)

(assert (=> b!1551810 (= c!142827 (not lt!668806))))

(declare-fun e!863857 () Bool)

(assert (=> b!1551810 (= lt!668806 e!863857)))

(declare-fun res!1062585 () Bool)

(assert (=> b!1551810 (=> res!1062585 e!863857)))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103522 0))(
  ( (array!103523 (arr!49960 (Array (_ BitVec 32) (_ BitVec 64))) (size!50512 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103522)

(assert (=> b!1551810 (= res!1062585 (bvsge from!762 (size!50512 _keys!618)))))

(declare-datatypes ((tuple2!24802 0))(
  ( (tuple2!24803 (_1!12412 (_ BitVec 64)) (_2!12412 V!59373)) )
))
(declare-datatypes ((List!36250 0))(
  ( (Nil!36247) (Cons!36246 (h!37692 tuple2!24802) (t!50956 List!36250)) )
))
(declare-datatypes ((ListLongMap!22411 0))(
  ( (ListLongMap!22412 (toList!11221 List!36250)) )
))
(declare-fun lt!668811 () ListLongMap!22411)

(declare-fun e!863860 () ListLongMap!22411)

(assert (=> b!1551810 (= lt!668811 e!863860)))

(declare-fun c!142828 () Bool)

(declare-fun lt!668812 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1551810 (= c!142828 (and (not lt!668812) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551810 (= lt!668812 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551811 () Bool)

(declare-fun lt!668807 () Unit!51511)

(assert (=> b!1551811 (= e!863861 lt!668807)))

(declare-fun zeroValue!436 () V!59373)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59373)

(declare-fun lt!668813 () ListLongMap!22411)

(declare-fun getCurrentListMapNoExtraKeys!6656 (array!103522 array!103520 (_ BitVec 32) (_ BitVec 32) V!59373 V!59373 (_ BitVec 32) Int) ListLongMap!22411)

(assert (=> b!1551811 (= lt!668813 (getCurrentListMapNoExtraKeys!6656 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668809 () Unit!51511)

(declare-fun addStillContains!1295 (ListLongMap!22411 (_ BitVec 64) V!59373 (_ BitVec 64)) Unit!51511)

(assert (=> b!1551811 (= lt!668809 (addStillContains!1295 lt!668813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49960 _keys!618) from!762)))))

(declare-fun lt!668805 () ListLongMap!22411)

(declare-fun +!5036 (ListLongMap!22411 tuple2!24802) ListLongMap!22411)

(assert (=> b!1551811 (= lt!668805 (+!5036 lt!668813 (tuple2!24803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10084 (ListLongMap!22411 (_ BitVec 64)) Bool)

(assert (=> b!1551811 (contains!10084 lt!668805 (select (arr!49960 _keys!618) from!762))))

(declare-fun addApplyDifferent!630 (ListLongMap!22411 (_ BitVec 64) V!59373 (_ BitVec 64)) Unit!51511)

(assert (=> b!1551811 (= lt!668807 (addApplyDifferent!630 lt!668813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49960 _keys!618) from!762)))))

(declare-fun lt!668816 () V!59373)

(declare-fun apply!1094 (ListLongMap!22411 (_ BitVec 64)) V!59373)

(assert (=> b!1551811 (= lt!668816 (apply!1094 (+!5036 lt!668813 (tuple2!24803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49960 _keys!618) from!762)))))

(declare-fun lt!668815 () V!59373)

(assert (=> b!1551811 (= lt!668815 (apply!1094 lt!668813 (select (arr!49960 _keys!618) from!762)))))

(assert (=> b!1551811 (= lt!668816 lt!668815)))

(declare-fun lt!668810 () Unit!51511)

(assert (=> b!1551811 (= lt!668810 (addApplyDifferent!630 lt!668813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49960 _keys!618) from!762)))))

(assert (=> b!1551811 (= (apply!1094 lt!668805 (select (arr!49960 _keys!618) from!762)) lt!668815)))

(declare-fun b!1551812 () Bool)

(declare-fun e!863858 () ListLongMap!22411)

(declare-fun call!71145 () ListLongMap!22411)

(assert (=> b!1551812 (= e!863858 call!71145)))

(declare-fun res!1062589 () Bool)

(assert (=> start!132244 (=> (not res!1062589) (not e!863859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132244 (= res!1062589 (validMask!0 mask!926))))

(assert (=> start!132244 e!863859))

(declare-fun array_inv!39039 (array!103522) Bool)

(assert (=> start!132244 (array_inv!39039 _keys!618)))

(declare-fun tp_is_empty!38197 () Bool)

(assert (=> start!132244 tp_is_empty!38197))

(assert (=> start!132244 true))

(assert (=> start!132244 tp!112027))

(declare-fun e!863863 () Bool)

(declare-fun array_inv!39040 (array!103520) Bool)

(assert (=> start!132244 (and (array_inv!39040 _values!470) e!863863)))

(declare-fun b!1551813 () Bool)

(declare-fun res!1062586 () Bool)

(assert (=> b!1551813 (=> (not res!1062586) (not e!863859))))

(assert (=> b!1551813 (= res!1062586 (and (= (size!50511 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50512 _keys!618) (size!50511 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!71142 () Bool)

(declare-fun call!71148 () ListLongMap!22411)

(assert (=> bm!71142 (= call!71145 call!71148)))

(declare-fun b!1551814 () Bool)

(declare-fun e!863864 () Bool)

(assert (=> b!1551814 (= e!863863 (and e!863864 mapRes!59011))))

(declare-fun condMapEmpty!59011 () Bool)

(declare-fun mapDefault!59011 () ValueCell!18188)

(assert (=> b!1551814 (= condMapEmpty!59011 (= (arr!49959 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18188)) mapDefault!59011)))))

(declare-fun b!1551815 () Bool)

(declare-fun c!142829 () Bool)

(assert (=> b!1551815 (= c!142829 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668812))))

(declare-fun e!863866 () ListLongMap!22411)

(assert (=> b!1551815 (= e!863866 e!863858)))

(declare-fun b!1551816 () Bool)

(declare-fun res!1062587 () Bool)

(assert (=> b!1551816 (=> (not res!1062587) (not e!863859))))

(declare-datatypes ((List!36251 0))(
  ( (Nil!36248) (Cons!36247 (h!37693 (_ BitVec 64)) (t!50957 List!36251)) )
))
(declare-fun arrayNoDuplicates!0 (array!103522 (_ BitVec 32) List!36251) Bool)

(assert (=> b!1551816 (= res!1062587 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36248))))

(declare-fun b!1551817 () Bool)

(declare-fun Unit!51513 () Unit!51511)

(assert (=> b!1551817 (= e!863861 Unit!51513)))

(declare-fun b!1551818 () Bool)

(declare-fun res!1062588 () Bool)

(assert (=> b!1551818 (=> (not res!1062588) (not e!863859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103522 (_ BitVec 32)) Bool)

(assert (=> b!1551818 (= res!1062588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551819 () Bool)

(assert (=> b!1551819 (= e!863865 tp_is_empty!38197)))

(declare-fun b!1551820 () Bool)

(declare-fun res!1062583 () Bool)

(assert (=> b!1551820 (=> (not res!1062583) (not e!863859))))

(assert (=> b!1551820 (= res!1062583 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50512 _keys!618))))))

(declare-fun bm!71143 () Bool)

(declare-fun call!71149 () ListLongMap!22411)

(declare-fun call!71147 () ListLongMap!22411)

(assert (=> bm!71143 (= call!71149 call!71147)))

(declare-fun b!1551821 () Bool)

(assert (=> b!1551821 (= e!863864 tp_is_empty!38197)))

(declare-fun mapIsEmpty!59011 () Bool)

(assert (=> mapIsEmpty!59011 mapRes!59011))

(declare-fun bm!71144 () Bool)

(declare-fun call!71146 () ListLongMap!22411)

(assert (=> bm!71144 (= call!71147 call!71146)))

(declare-fun b!1551822 () Bool)

(assert (=> b!1551822 (= e!863858 call!71149)))

(declare-fun b!1551823 () Bool)

(assert (=> b!1551823 (= e!863866 call!71145)))

(declare-fun b!1551824 () Bool)

(assert (=> b!1551824 (= e!863856 false)))

(declare-fun lt!668814 () Bool)

(assert (=> b!1551824 (= lt!668814 (contains!10084 lt!668811 (select (arr!49960 _keys!618) from!762)))))

(declare-fun b!1551825 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551825 (= e!863857 (not (validKeyInArray!0 (select (arr!49960 _keys!618) from!762))))))

(declare-fun b!1551826 () Bool)

(assert (=> b!1551826 (= e!863860 e!863866)))

(declare-fun c!142830 () Bool)

(assert (=> b!1551826 (= c!142830 (and (not lt!668812) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!71145 () Bool)

(assert (=> bm!71145 (= call!71146 (getCurrentListMapNoExtraKeys!6656 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!71146 () Bool)

(assert (=> bm!71146 (= call!71148 (+!5036 (ite c!142828 call!71146 (ite c!142830 call!71147 call!71149)) (ite (or c!142828 c!142830) (tuple2!24803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551827 () Bool)

(assert (=> b!1551827 (= e!863860 (+!5036 call!71148 (tuple2!24803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!132244 res!1062589) b!1551813))

(assert (= (and b!1551813 res!1062586) b!1551818))

(assert (= (and b!1551818 res!1062588) b!1551816))

(assert (= (and b!1551816 res!1062587) b!1551820))

(assert (= (and b!1551820 res!1062583) b!1551810))

(assert (= (and b!1551810 c!142828) b!1551827))

(assert (= (and b!1551810 (not c!142828)) b!1551826))

(assert (= (and b!1551826 c!142830) b!1551823))

(assert (= (and b!1551826 (not c!142830)) b!1551815))

(assert (= (and b!1551815 c!142829) b!1551812))

(assert (= (and b!1551815 (not c!142829)) b!1551822))

(assert (= (or b!1551812 b!1551822) bm!71143))

(assert (= (or b!1551823 bm!71143) bm!71144))

(assert (= (or b!1551823 b!1551812) bm!71142))

(assert (= (or b!1551827 bm!71144) bm!71145))

(assert (= (or b!1551827 bm!71142) bm!71146))

(assert (= (and b!1551810 (not res!1062585)) b!1551825))

(assert (= (and b!1551810 c!142827) b!1551811))

(assert (= (and b!1551810 (not c!142827)) b!1551817))

(assert (= (and b!1551810 res!1062584) b!1551824))

(assert (= (and b!1551814 condMapEmpty!59011) mapIsEmpty!59011))

(assert (= (and b!1551814 (not condMapEmpty!59011)) mapNonEmpty!59011))

(get-info :version)

(assert (= (and mapNonEmpty!59011 ((_ is ValueCellFull!18188) mapValue!59011)) b!1551819))

(assert (= (and b!1551814 ((_ is ValueCellFull!18188) mapDefault!59011)) b!1551821))

(assert (= start!132244 b!1551814))

(declare-fun m!1429807 () Bool)

(assert (=> mapNonEmpty!59011 m!1429807))

(declare-fun m!1429809 () Bool)

(assert (=> bm!71146 m!1429809))

(declare-fun m!1429811 () Bool)

(assert (=> b!1551827 m!1429811))

(declare-fun m!1429813 () Bool)

(assert (=> b!1551824 m!1429813))

(assert (=> b!1551824 m!1429813))

(declare-fun m!1429815 () Bool)

(assert (=> b!1551824 m!1429815))

(declare-fun m!1429817 () Bool)

(assert (=> b!1551816 m!1429817))

(declare-fun m!1429819 () Bool)

(assert (=> start!132244 m!1429819))

(declare-fun m!1429821 () Bool)

(assert (=> start!132244 m!1429821))

(declare-fun m!1429823 () Bool)

(assert (=> start!132244 m!1429823))

(declare-fun m!1429825 () Bool)

(assert (=> bm!71145 m!1429825))

(assert (=> b!1551825 m!1429813))

(assert (=> b!1551825 m!1429813))

(declare-fun m!1429827 () Bool)

(assert (=> b!1551825 m!1429827))

(assert (=> b!1551811 m!1429813))

(assert (=> b!1551811 m!1429813))

(declare-fun m!1429829 () Bool)

(assert (=> b!1551811 m!1429829))

(assert (=> b!1551811 m!1429813))

(declare-fun m!1429831 () Bool)

(assert (=> b!1551811 m!1429831))

(assert (=> b!1551811 m!1429813))

(declare-fun m!1429833 () Bool)

(assert (=> b!1551811 m!1429833))

(assert (=> b!1551811 m!1429813))

(declare-fun m!1429835 () Bool)

(assert (=> b!1551811 m!1429835))

(declare-fun m!1429837 () Bool)

(assert (=> b!1551811 m!1429837))

(assert (=> b!1551811 m!1429813))

(declare-fun m!1429839 () Bool)

(assert (=> b!1551811 m!1429839))

(assert (=> b!1551811 m!1429837))

(assert (=> b!1551811 m!1429825))

(assert (=> b!1551811 m!1429813))

(declare-fun m!1429841 () Bool)

(assert (=> b!1551811 m!1429841))

(declare-fun m!1429843 () Bool)

(assert (=> b!1551811 m!1429843))

(assert (=> b!1551811 m!1429813))

(declare-fun m!1429845 () Bool)

(assert (=> b!1551811 m!1429845))

(declare-fun m!1429847 () Bool)

(assert (=> b!1551818 m!1429847))

(check-sat tp_is_empty!38197 (not b!1551825) b_and!51341 (not b!1551811) (not b!1551818) (not start!132244) (not mapNonEmpty!59011) (not b!1551824) (not b!1551827) (not bm!71146) (not b_next!31921) (not bm!71145) (not b!1551816))
(check-sat b_and!51341 (not b_next!31921))
