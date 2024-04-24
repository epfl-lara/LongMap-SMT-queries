; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132422 () Bool)

(assert start!132422)

(declare-fun b_free!31723 () Bool)

(declare-fun b_next!31723 () Bool)

(assert (=> start!132422 (= b_free!31723 (not b_next!31723))))

(declare-fun tp!111420 () Bool)

(declare-fun b_and!51135 () Bool)

(assert (=> start!132422 (= tp!111420 b_and!51135)))

(declare-fun b!1549229 () Bool)

(declare-fun e!862498 () Bool)

(declare-fun e!862495 () Bool)

(declare-fun mapRes!58702 () Bool)

(assert (=> b!1549229 (= e!862498 (and e!862495 mapRes!58702))))

(declare-fun condMapEmpty!58702 () Bool)

(declare-datatypes ((V!59109 0))(
  ( (V!59110 (val!19077 Int)) )
))
(declare-datatypes ((ValueCell!18089 0))(
  ( (ValueCellFull!18089 (v!21870 V!59109)) (EmptyCell!18089) )
))
(declare-datatypes ((array!103326 0))(
  ( (array!103327 (arr!49858 (Array (_ BitVec 32) ValueCell!18089)) (size!50409 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103326)

(declare-fun mapDefault!58702 () ValueCell!18089)

(assert (=> b!1549229 (= condMapEmpty!58702 (= (arr!49858 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18089)) mapDefault!58702)))))

(declare-fun b!1549230 () Bool)

(declare-fun c!142683 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667583 () Bool)

(assert (=> b!1549230 (= c!142683 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667583))))

(declare-datatypes ((tuple2!24594 0))(
  ( (tuple2!24595 (_1!12308 (_ BitVec 64)) (_2!12308 V!59109)) )
))
(declare-datatypes ((List!36077 0))(
  ( (Nil!36074) (Cons!36073 (h!37536 tuple2!24594) (t!50763 List!36077)) )
))
(declare-datatypes ((ListLongMap!22211 0))(
  ( (ListLongMap!22212 (toList!11121 List!36077)) )
))
(declare-fun e!862497 () ListLongMap!22211)

(declare-fun e!862494 () ListLongMap!22211)

(assert (=> b!1549230 (= e!862497 e!862494)))

(declare-fun zeroValue!436 () V!59109)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun call!69801 () ListLongMap!22211)

(declare-fun minValue!436 () V!59109)

(declare-datatypes ((array!103328 0))(
  ( (array!103329 (arr!49859 (Array (_ BitVec 32) (_ BitVec 64))) (size!50410 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103328)

(declare-fun bm!69797 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6599 (array!103328 array!103326 (_ BitVec 32) (_ BitVec 32) V!59109 V!59109 (_ BitVec 32) Int) ListLongMap!22211)

(assert (=> bm!69797 (= call!69801 (getCurrentListMapNoExtraKeys!6599 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549231 () Bool)

(declare-fun call!69803 () ListLongMap!22211)

(assert (=> b!1549231 (= e!862494 call!69803)))

(declare-fun b!1549232 () Bool)

(declare-fun e!862492 () Bool)

(declare-fun tp_is_empty!37999 () Bool)

(assert (=> b!1549232 (= e!862492 tp_is_empty!37999)))

(declare-fun b!1549233 () Bool)

(declare-fun res!1061264 () Bool)

(declare-fun e!862500 () Bool)

(assert (=> b!1549233 (=> (not res!1061264) (not e!862500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103328 (_ BitVec 32)) Bool)

(assert (=> b!1549233 (= res!1061264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549234 () Bool)

(declare-fun e!862496 () Bool)

(assert (=> b!1549234 (= e!862496 (not true))))

(declare-fun lt!667585 () ListLongMap!22211)

(declare-fun apply!1052 (ListLongMap!22211 (_ BitVec 64)) V!59109)

(declare-fun +!4966 (ListLongMap!22211 tuple2!24594) ListLongMap!22211)

(assert (=> b!1549234 (= (apply!1052 (+!4966 lt!667585 (tuple2!24595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49859 _keys!618) from!762)) (apply!1052 lt!667585 (select (arr!49859 _keys!618) from!762)))))

(declare-datatypes ((Unit!51469 0))(
  ( (Unit!51470) )
))
(declare-fun lt!667582 () Unit!51469)

(declare-fun addApplyDifferent!581 (ListLongMap!22211 (_ BitVec 64) V!59109 (_ BitVec 64)) Unit!51469)

(assert (=> b!1549234 (= lt!667582 (addApplyDifferent!581 lt!667585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49859 _keys!618) from!762)))))

(declare-fun contains!10100 (ListLongMap!22211 (_ BitVec 64)) Bool)

(assert (=> b!1549234 (contains!10100 (+!4966 lt!667585 (tuple2!24595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49859 _keys!618) from!762))))

(declare-fun lt!667581 () Unit!51469)

(declare-fun addStillContains!1242 (ListLongMap!22211 (_ BitVec 64) V!59109 (_ BitVec 64)) Unit!51469)

(assert (=> b!1549234 (= lt!667581 (addStillContains!1242 lt!667585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49859 _keys!618) from!762)))))

(assert (=> b!1549234 (= lt!667585 (getCurrentListMapNoExtraKeys!6599 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549235 () Bool)

(assert (=> b!1549235 (= e!862500 e!862496)))

(declare-fun res!1061263 () Bool)

(assert (=> b!1549235 (=> (not res!1061263) (not e!862496))))

(assert (=> b!1549235 (= res!1061263 (bvslt from!762 (size!50410 _keys!618)))))

(declare-fun lt!667584 () ListLongMap!22211)

(declare-fun e!862499 () ListLongMap!22211)

(assert (=> b!1549235 (= lt!667584 e!862499)))

(declare-fun c!142684 () Bool)

(assert (=> b!1549235 (= c!142684 (and (not lt!667583) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549235 (= lt!667583 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549236 () Bool)

(declare-fun call!69804 () ListLongMap!22211)

(assert (=> b!1549236 (= e!862494 call!69804)))

(declare-fun b!1549237 () Bool)

(declare-fun res!1061261 () Bool)

(assert (=> b!1549237 (=> (not res!1061261) (not e!862496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549237 (= res!1061261 (validKeyInArray!0 (select (arr!49859 _keys!618) from!762)))))

(declare-fun b!1549238 () Bool)

(assert (=> b!1549238 (= e!862497 call!69803)))

(declare-fun b!1549239 () Bool)

(declare-fun res!1061259 () Bool)

(assert (=> b!1549239 (=> (not res!1061259) (not e!862500))))

(assert (=> b!1549239 (= res!1061259 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50410 _keys!618))))))

(declare-fun b!1549240 () Bool)

(assert (=> b!1549240 (= e!862499 e!862497)))

(declare-fun c!142682 () Bool)

(assert (=> b!1549240 (= c!142682 (and (not lt!667583) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69799 () Bool)

(declare-fun call!69802 () ListLongMap!22211)

(assert (=> bm!69799 (= call!69803 call!69802)))

(declare-fun b!1549241 () Bool)

(declare-fun res!1061258 () Bool)

(assert (=> b!1549241 (=> (not res!1061258) (not e!862500))))

(declare-datatypes ((List!36078 0))(
  ( (Nil!36075) (Cons!36074 (h!37537 (_ BitVec 64)) (t!50764 List!36078)) )
))
(declare-fun arrayNoDuplicates!0 (array!103328 (_ BitVec 32) List!36078) Bool)

(assert (=> b!1549241 (= res!1061258 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36075))))

(declare-fun bm!69800 () Bool)

(declare-fun call!69800 () ListLongMap!22211)

(assert (=> bm!69800 (= call!69800 call!69801)))

(declare-fun b!1549242 () Bool)

(assert (=> b!1549242 (= e!862495 tp_is_empty!37999)))

(declare-fun bm!69801 () Bool)

(assert (=> bm!69801 (= call!69802 (+!4966 (ite c!142684 call!69801 (ite c!142682 call!69800 call!69804)) (ite (or c!142684 c!142682) (tuple2!24595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1061260 () Bool)

(assert (=> start!132422 (=> (not res!1061260) (not e!862500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132422 (= res!1061260 (validMask!0 mask!926))))

(assert (=> start!132422 e!862500))

(declare-fun array_inv!39043 (array!103328) Bool)

(assert (=> start!132422 (array_inv!39043 _keys!618)))

(assert (=> start!132422 tp_is_empty!37999))

(assert (=> start!132422 true))

(assert (=> start!132422 tp!111420))

(declare-fun array_inv!39044 (array!103326) Bool)

(assert (=> start!132422 (and (array_inv!39044 _values!470) e!862498)))

(declare-fun bm!69798 () Bool)

(assert (=> bm!69798 (= call!69804 call!69800)))

(declare-fun mapNonEmpty!58702 () Bool)

(declare-fun tp!111421 () Bool)

(assert (=> mapNonEmpty!58702 (= mapRes!58702 (and tp!111421 e!862492))))

(declare-fun mapValue!58702 () ValueCell!18089)

(declare-fun mapRest!58702 () (Array (_ BitVec 32) ValueCell!18089))

(declare-fun mapKey!58702 () (_ BitVec 32))

(assert (=> mapNonEmpty!58702 (= (arr!49858 _values!470) (store mapRest!58702 mapKey!58702 mapValue!58702))))

(declare-fun b!1549243 () Bool)

(declare-fun res!1061262 () Bool)

(assert (=> b!1549243 (=> (not res!1061262) (not e!862500))))

(assert (=> b!1549243 (= res!1061262 (and (= (size!50409 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50410 _keys!618) (size!50409 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549244 () Bool)

(assert (=> b!1549244 (= e!862499 (+!4966 call!69802 (tuple2!24595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58702 () Bool)

(assert (=> mapIsEmpty!58702 mapRes!58702))

(assert (= (and start!132422 res!1061260) b!1549243))

(assert (= (and b!1549243 res!1061262) b!1549233))

(assert (= (and b!1549233 res!1061264) b!1549241))

(assert (= (and b!1549241 res!1061258) b!1549239))

(assert (= (and b!1549239 res!1061259) b!1549235))

(assert (= (and b!1549235 c!142684) b!1549244))

(assert (= (and b!1549235 (not c!142684)) b!1549240))

(assert (= (and b!1549240 c!142682) b!1549238))

(assert (= (and b!1549240 (not c!142682)) b!1549230))

(assert (= (and b!1549230 c!142683) b!1549231))

(assert (= (and b!1549230 (not c!142683)) b!1549236))

(assert (= (or b!1549231 b!1549236) bm!69798))

(assert (= (or b!1549238 bm!69798) bm!69800))

(assert (= (or b!1549238 b!1549231) bm!69799))

(assert (= (or b!1549244 bm!69800) bm!69797))

(assert (= (or b!1549244 bm!69799) bm!69801))

(assert (= (and b!1549235 res!1061263) b!1549237))

(assert (= (and b!1549237 res!1061261) b!1549234))

(assert (= (and b!1549229 condMapEmpty!58702) mapIsEmpty!58702))

(assert (= (and b!1549229 (not condMapEmpty!58702)) mapNonEmpty!58702))

(get-info :version)

(assert (= (and mapNonEmpty!58702 ((_ is ValueCellFull!18089) mapValue!58702)) b!1549232))

(assert (= (and b!1549229 ((_ is ValueCellFull!18089) mapDefault!58702)) b!1549242))

(assert (= start!132422 b!1549229))

(declare-fun m!1428831 () Bool)

(assert (=> mapNonEmpty!58702 m!1428831))

(declare-fun m!1428833 () Bool)

(assert (=> b!1549237 m!1428833))

(assert (=> b!1549237 m!1428833))

(declare-fun m!1428835 () Bool)

(assert (=> b!1549237 m!1428835))

(declare-fun m!1428837 () Bool)

(assert (=> b!1549234 m!1428837))

(assert (=> b!1549234 m!1428833))

(assert (=> b!1549234 m!1428837))

(assert (=> b!1549234 m!1428833))

(declare-fun m!1428839 () Bool)

(assert (=> b!1549234 m!1428839))

(assert (=> b!1549234 m!1428833))

(declare-fun m!1428841 () Bool)

(assert (=> b!1549234 m!1428841))

(assert (=> b!1549234 m!1428833))

(declare-fun m!1428843 () Bool)

(assert (=> b!1549234 m!1428843))

(declare-fun m!1428845 () Bool)

(assert (=> b!1549234 m!1428845))

(assert (=> b!1549234 m!1428845))

(assert (=> b!1549234 m!1428833))

(declare-fun m!1428847 () Bool)

(assert (=> b!1549234 m!1428847))

(assert (=> b!1549234 m!1428833))

(declare-fun m!1428849 () Bool)

(assert (=> b!1549234 m!1428849))

(declare-fun m!1428851 () Bool)

(assert (=> b!1549234 m!1428851))

(declare-fun m!1428853 () Bool)

(assert (=> b!1549244 m!1428853))

(declare-fun m!1428855 () Bool)

(assert (=> start!132422 m!1428855))

(declare-fun m!1428857 () Bool)

(assert (=> start!132422 m!1428857))

(declare-fun m!1428859 () Bool)

(assert (=> start!132422 m!1428859))

(assert (=> bm!69797 m!1428851))

(declare-fun m!1428861 () Bool)

(assert (=> b!1549233 m!1428861))

(declare-fun m!1428863 () Bool)

(assert (=> b!1549241 m!1428863))

(declare-fun m!1428865 () Bool)

(assert (=> bm!69801 m!1428865))

(check-sat (not b!1549244) (not start!132422) (not b!1549233) (not b_next!31723) (not bm!69801) (not bm!69797) tp_is_empty!37999 (not b!1549241) (not b!1549234) (not b!1549237) (not mapNonEmpty!58702) b_and!51135)
(check-sat b_and!51135 (not b_next!31723))
