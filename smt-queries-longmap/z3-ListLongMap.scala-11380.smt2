; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132658 () Bool)

(assert start!132658)

(declare-fun b_free!31897 () Bool)

(declare-fun b_next!31897 () Bool)

(assert (=> start!132658 (= b_free!31897 (not b_next!31897))))

(declare-fun tp!111951 () Bool)

(declare-fun b_and!51333 () Bool)

(assert (=> start!132658 (= tp!111951 b_and!51333)))

(declare-fun bm!71138 () Bool)

(declare-datatypes ((V!59341 0))(
  ( (V!59342 (val!19164 Int)) )
))
(declare-datatypes ((tuple2!24758 0))(
  ( (tuple2!24759 (_1!12390 (_ BitVec 64)) (_2!12390 V!59341)) )
))
(declare-datatypes ((List!36211 0))(
  ( (Nil!36208) (Cons!36207 (h!37670 tuple2!24758) (t!50915 List!36211)) )
))
(declare-datatypes ((ListLongMap!22375 0))(
  ( (ListLongMap!22376 (toList!11203 List!36211)) )
))
(declare-fun call!71143 () ListLongMap!22375)

(declare-fun call!71145 () ListLongMap!22375)

(assert (=> bm!71138 (= call!71143 call!71145)))

(declare-fun zeroValue!436 () V!59341)

(declare-fun call!71144 () ListLongMap!22375)

(declare-fun c!143568 () Bool)

(declare-fun c!143567 () Bool)

(declare-fun call!71142 () ListLongMap!22375)

(declare-fun minValue!436 () V!59341)

(declare-fun bm!71139 () Bool)

(declare-fun +!5033 (ListLongMap!22375 tuple2!24758) ListLongMap!22375)

(assert (=> bm!71139 (= call!71142 (+!5033 (ite c!143568 call!71144 (ite c!143567 call!71145 call!71143)) (ite (or c!143568 c!143567) (tuple2!24759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-datatypes ((array!103672 0))(
  ( (array!103673 (arr!50028 (Array (_ BitVec 32) (_ BitVec 64))) (size!50579 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103672)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18176 0))(
  ( (ValueCellFull!18176 (v!21960 V!59341)) (EmptyCell!18176) )
))
(declare-datatypes ((array!103674 0))(
  ( (array!103675 (arr!50029 (Array (_ BitVec 32) ValueCell!18176)) (size!50580 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103674)

(declare-fun bm!71140 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6666 (array!103672 array!103674 (_ BitVec 32) (_ BitVec 32) V!59341 V!59341 (_ BitVec 32) Int) ListLongMap!22375)

(assert (=> bm!71140 (= call!71144 (getCurrentListMapNoExtraKeys!6666 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1553849 () Bool)

(declare-fun e!865146 () Bool)

(assert (=> b!1553849 (= e!865146 (not true))))

(declare-fun lt!669578 () V!59341)

(declare-fun lt!669574 () ListLongMap!22375)

(declare-fun apply!1101 (ListLongMap!22375 (_ BitVec 64)) V!59341)

(assert (=> b!1553849 (= (apply!1101 lt!669574 (select (arr!50028 _keys!618) from!762)) lt!669578)))

(declare-fun lt!669579 () ListLongMap!22375)

(declare-datatypes ((Unit!51583 0))(
  ( (Unit!51584) )
))
(declare-fun lt!669576 () Unit!51583)

(declare-fun addApplyDifferent!628 (ListLongMap!22375 (_ BitVec 64) V!59341 (_ BitVec 64)) Unit!51583)

(assert (=> b!1553849 (= lt!669576 (addApplyDifferent!628 lt!669579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50028 _keys!618) from!762)))))

(declare-fun lt!669575 () V!59341)

(assert (=> b!1553849 (= lt!669575 lt!669578)))

(assert (=> b!1553849 (= lt!669578 (apply!1101 lt!669579 (select (arr!50028 _keys!618) from!762)))))

(assert (=> b!1553849 (= lt!669575 (apply!1101 (+!5033 lt!669579 (tuple2!24759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50028 _keys!618) from!762)))))

(declare-fun lt!669582 () Unit!51583)

(assert (=> b!1553849 (= lt!669582 (addApplyDifferent!628 lt!669579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50028 _keys!618) from!762)))))

(declare-fun contains!10160 (ListLongMap!22375 (_ BitVec 64)) Bool)

(assert (=> b!1553849 (contains!10160 lt!669574 (select (arr!50028 _keys!618) from!762))))

(assert (=> b!1553849 (= lt!669574 (+!5033 lt!669579 (tuple2!24759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!669577 () Unit!51583)

(declare-fun addStillContains!1293 (ListLongMap!22375 (_ BitVec 64) V!59341 (_ BitVec 64)) Unit!51583)

(assert (=> b!1553849 (= lt!669577 (addStillContains!1293 lt!669579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50028 _keys!618) from!762)))))

(assert (=> b!1553849 (= lt!669579 (getCurrentListMapNoExtraKeys!6666 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58972 () Bool)

(declare-fun mapRes!58972 () Bool)

(assert (=> mapIsEmpty!58972 mapRes!58972))

(declare-fun bm!71141 () Bool)

(declare-fun call!71141 () ListLongMap!22375)

(assert (=> bm!71141 (= call!71141 call!71142)))

(declare-fun b!1553851 () Bool)

(declare-fun res!1063286 () Bool)

(declare-fun e!865149 () Bool)

(assert (=> b!1553851 (=> (not res!1063286) (not e!865149))))

(assert (=> b!1553851 (= res!1063286 (and (= (size!50580 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50579 _keys!618) (size!50580 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1553852 () Bool)

(declare-fun e!865144 () ListLongMap!22375)

(assert (=> b!1553852 (= e!865144 call!71141)))

(declare-fun b!1553853 () Bool)

(declare-fun res!1063282 () Bool)

(assert (=> b!1553853 (=> (not res!1063282) (not e!865149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103672 (_ BitVec 32)) Bool)

(assert (=> b!1553853 (= res!1063282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58972 () Bool)

(declare-fun tp!111952 () Bool)

(declare-fun e!865142 () Bool)

(assert (=> mapNonEmpty!58972 (= mapRes!58972 (and tp!111952 e!865142))))

(declare-fun mapRest!58972 () (Array (_ BitVec 32) ValueCell!18176))

(declare-fun mapKey!58972 () (_ BitVec 32))

(declare-fun mapValue!58972 () ValueCell!18176)

(assert (=> mapNonEmpty!58972 (= (arr!50029 _values!470) (store mapRest!58972 mapKey!58972 mapValue!58972))))

(declare-fun b!1553854 () Bool)

(declare-fun e!865150 () ListLongMap!22375)

(assert (=> b!1553854 (= e!865150 call!71143)))

(declare-fun bm!71142 () Bool)

(assert (=> bm!71142 (= call!71145 call!71144)))

(declare-fun b!1553855 () Bool)

(assert (=> b!1553855 (= e!865149 e!865146)))

(declare-fun res!1063284 () Bool)

(assert (=> b!1553855 (=> (not res!1063284) (not e!865146))))

(assert (=> b!1553855 (= res!1063284 (bvslt from!762 (size!50579 _keys!618)))))

(declare-fun lt!669580 () ListLongMap!22375)

(declare-fun e!865148 () ListLongMap!22375)

(assert (=> b!1553855 (= lt!669580 e!865148)))

(declare-fun lt!669581 () Bool)

(assert (=> b!1553855 (= c!143568 (and (not lt!669581) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1553855 (= lt!669581 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1553856 () Bool)

(declare-fun res!1063288 () Bool)

(assert (=> b!1553856 (=> (not res!1063288) (not e!865149))))

(declare-datatypes ((List!36212 0))(
  ( (Nil!36209) (Cons!36208 (h!37671 (_ BitVec 64)) (t!50916 List!36212)) )
))
(declare-fun arrayNoDuplicates!0 (array!103672 (_ BitVec 32) List!36212) Bool)

(assert (=> b!1553856 (= res!1063288 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36209))))

(declare-fun b!1553857 () Bool)

(assert (=> b!1553857 (= e!865148 e!865144)))

(assert (=> b!1553857 (= c!143567 (and (not lt!669581) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1553858 () Bool)

(declare-fun res!1063285 () Bool)

(assert (=> b!1553858 (=> (not res!1063285) (not e!865146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1553858 (= res!1063285 (validKeyInArray!0 (select (arr!50028 _keys!618) from!762)))))

(declare-fun b!1553859 () Bool)

(declare-fun tp_is_empty!38173 () Bool)

(assert (=> b!1553859 (= e!865142 tp_is_empty!38173)))

(declare-fun b!1553860 () Bool)

(assert (=> b!1553860 (= e!865148 (+!5033 call!71142 (tuple2!24759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1553861 () Bool)

(declare-fun e!865143 () Bool)

(assert (=> b!1553861 (= e!865143 tp_is_empty!38173)))

(declare-fun b!1553862 () Bool)

(declare-fun e!865145 () Bool)

(assert (=> b!1553862 (= e!865145 (and e!865143 mapRes!58972))))

(declare-fun condMapEmpty!58972 () Bool)

(declare-fun mapDefault!58972 () ValueCell!18176)

(assert (=> b!1553862 (= condMapEmpty!58972 (= (arr!50029 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18176)) mapDefault!58972)))))

(declare-fun b!1553863 () Bool)

(declare-fun res!1063287 () Bool)

(assert (=> b!1553863 (=> (not res!1063287) (not e!865149))))

(assert (=> b!1553863 (= res!1063287 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50579 _keys!618))))))

(declare-fun b!1553864 () Bool)

(assert (=> b!1553864 (= e!865150 call!71141)))

(declare-fun b!1553850 () Bool)

(declare-fun c!143566 () Bool)

(assert (=> b!1553850 (= c!143566 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669581))))

(assert (=> b!1553850 (= e!865144 e!865150)))

(declare-fun res!1063283 () Bool)

(assert (=> start!132658 (=> (not res!1063283) (not e!865149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132658 (= res!1063283 (validMask!0 mask!926))))

(assert (=> start!132658 e!865149))

(declare-fun array_inv!39155 (array!103672) Bool)

(assert (=> start!132658 (array_inv!39155 _keys!618)))

(assert (=> start!132658 tp_is_empty!38173))

(assert (=> start!132658 true))

(assert (=> start!132658 tp!111951))

(declare-fun array_inv!39156 (array!103674) Bool)

(assert (=> start!132658 (and (array_inv!39156 _values!470) e!865145)))

(assert (= (and start!132658 res!1063283) b!1553851))

(assert (= (and b!1553851 res!1063286) b!1553853))

(assert (= (and b!1553853 res!1063282) b!1553856))

(assert (= (and b!1553856 res!1063288) b!1553863))

(assert (= (and b!1553863 res!1063287) b!1553855))

(assert (= (and b!1553855 c!143568) b!1553860))

(assert (= (and b!1553855 (not c!143568)) b!1553857))

(assert (= (and b!1553857 c!143567) b!1553852))

(assert (= (and b!1553857 (not c!143567)) b!1553850))

(assert (= (and b!1553850 c!143566) b!1553864))

(assert (= (and b!1553850 (not c!143566)) b!1553854))

(assert (= (or b!1553864 b!1553854) bm!71138))

(assert (= (or b!1553852 bm!71138) bm!71142))

(assert (= (or b!1553852 b!1553864) bm!71141))

(assert (= (or b!1553860 bm!71142) bm!71140))

(assert (= (or b!1553860 bm!71141) bm!71139))

(assert (= (and b!1553855 res!1063284) b!1553858))

(assert (= (and b!1553858 res!1063285) b!1553849))

(assert (= (and b!1553862 condMapEmpty!58972) mapIsEmpty!58972))

(assert (= (and b!1553862 (not condMapEmpty!58972)) mapNonEmpty!58972))

(get-info :version)

(assert (= (and mapNonEmpty!58972 ((_ is ValueCellFull!18176) mapValue!58972)) b!1553859))

(assert (= (and b!1553862 ((_ is ValueCellFull!18176) mapDefault!58972)) b!1553861))

(assert (= start!132658 b!1553862))

(declare-fun m!1432345 () Bool)

(assert (=> mapNonEmpty!58972 m!1432345))

(declare-fun m!1432347 () Bool)

(assert (=> b!1553856 m!1432347))

(declare-fun m!1432349 () Bool)

(assert (=> b!1553853 m!1432349))

(declare-fun m!1432351 () Bool)

(assert (=> b!1553849 m!1432351))

(declare-fun m!1432353 () Bool)

(assert (=> b!1553849 m!1432353))

(declare-fun m!1432355 () Bool)

(assert (=> b!1553849 m!1432355))

(declare-fun m!1432357 () Bool)

(assert (=> b!1553849 m!1432357))

(assert (=> b!1553849 m!1432353))

(declare-fun m!1432359 () Bool)

(assert (=> b!1553849 m!1432359))

(declare-fun m!1432361 () Bool)

(assert (=> b!1553849 m!1432361))

(assert (=> b!1553849 m!1432353))

(declare-fun m!1432363 () Bool)

(assert (=> b!1553849 m!1432363))

(assert (=> b!1553849 m!1432353))

(declare-fun m!1432365 () Bool)

(assert (=> b!1553849 m!1432365))

(assert (=> b!1553849 m!1432353))

(assert (=> b!1553849 m!1432353))

(declare-fun m!1432367 () Bool)

(assert (=> b!1553849 m!1432367))

(assert (=> b!1553849 m!1432361))

(assert (=> b!1553849 m!1432353))

(declare-fun m!1432369 () Bool)

(assert (=> b!1553849 m!1432369))

(assert (=> b!1553849 m!1432353))

(declare-fun m!1432371 () Bool)

(assert (=> b!1553849 m!1432371))

(assert (=> bm!71140 m!1432357))

(declare-fun m!1432373 () Bool)

(assert (=> bm!71139 m!1432373))

(declare-fun m!1432375 () Bool)

(assert (=> start!132658 m!1432375))

(declare-fun m!1432377 () Bool)

(assert (=> start!132658 m!1432377))

(declare-fun m!1432379 () Bool)

(assert (=> start!132658 m!1432379))

(declare-fun m!1432381 () Bool)

(assert (=> b!1553860 m!1432381))

(assert (=> b!1553858 m!1432353))

(assert (=> b!1553858 m!1432353))

(declare-fun m!1432383 () Bool)

(assert (=> b!1553858 m!1432383))

(check-sat (not start!132658) (not b!1553853) (not b!1553849) tp_is_empty!38173 (not b!1553856) (not b!1553860) (not b_next!31897) b_and!51333 (not bm!71140) (not b!1553858) (not mapNonEmpty!58972) (not bm!71139))
(check-sat b_and!51333 (not b_next!31897))
