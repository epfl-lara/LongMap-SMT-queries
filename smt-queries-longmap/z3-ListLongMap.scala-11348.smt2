; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132404 () Bool)

(assert start!132404)

(declare-fun b_free!31705 () Bool)

(declare-fun b_next!31705 () Bool)

(assert (=> start!132404 (= b_free!31705 (not b_next!31705))))

(declare-fun tp!111367 () Bool)

(declare-fun b_and!51117 () Bool)

(assert (=> start!132404 (= tp!111367 b_and!51117)))

(declare-fun b!1548797 () Bool)

(declare-fun e!862252 () Bool)

(declare-fun e!862257 () Bool)

(declare-fun mapRes!58675 () Bool)

(assert (=> b!1548797 (= e!862252 (and e!862257 mapRes!58675))))

(declare-fun condMapEmpty!58675 () Bool)

(declare-datatypes ((V!59085 0))(
  ( (V!59086 (val!19068 Int)) )
))
(declare-datatypes ((ValueCell!18080 0))(
  ( (ValueCellFull!18080 (v!21861 V!59085)) (EmptyCell!18080) )
))
(declare-datatypes ((array!103290 0))(
  ( (array!103291 (arr!49840 (Array (_ BitVec 32) ValueCell!18080)) (size!50391 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103290)

(declare-fun mapDefault!58675 () ValueCell!18080)

(assert (=> b!1548797 (= condMapEmpty!58675 (= (arr!49840 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18080)) mapDefault!58675)))))

(declare-fun bm!69662 () Bool)

(declare-datatypes ((tuple2!24578 0))(
  ( (tuple2!24579 (_1!12300 (_ BitVec 64)) (_2!12300 V!59085)) )
))
(declare-datatypes ((List!36064 0))(
  ( (Nil!36061) (Cons!36060 (h!37523 tuple2!24578) (t!50750 List!36064)) )
))
(declare-datatypes ((ListLongMap!22195 0))(
  ( (ListLongMap!22196 (toList!11113 List!36064)) )
))
(declare-fun call!69665 () ListLongMap!22195)

(declare-fun call!69667 () ListLongMap!22195)

(assert (=> bm!69662 (= call!69665 call!69667)))

(declare-fun bm!69663 () Bool)

(declare-fun call!69669 () ListLongMap!22195)

(declare-fun call!69666 () ListLongMap!22195)

(assert (=> bm!69663 (= call!69669 call!69666)))

(declare-datatypes ((array!103292 0))(
  ( (array!103293 (arr!49841 (Array (_ BitVec 32) (_ BitVec 64))) (size!50392 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103292)

(declare-fun zeroValue!436 () V!59085)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59085)

(declare-fun call!69668 () ListLongMap!22195)

(declare-fun bm!69664 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6594 (array!103292 array!103290 (_ BitVec 32) (_ BitVec 32) V!59085 V!59085 (_ BitVec 32) Int) ListLongMap!22195)

(assert (=> bm!69664 (= call!69668 (getCurrentListMapNoExtraKeys!6594 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548798 () Bool)

(declare-fun e!862250 () Bool)

(assert (=> b!1548798 (= e!862250 (not true))))

(declare-fun lt!667455 () ListLongMap!22195)

(declare-fun contains!10096 (ListLongMap!22195 (_ BitVec 64)) Bool)

(declare-fun +!4958 (ListLongMap!22195 tuple2!24578) ListLongMap!22195)

(assert (=> b!1548798 (contains!10096 (+!4958 lt!667455 (tuple2!24579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49841 _keys!618) from!762))))

(declare-datatypes ((Unit!51461 0))(
  ( (Unit!51462) )
))
(declare-fun lt!667456 () Unit!51461)

(declare-fun addStillContains!1238 (ListLongMap!22195 (_ BitVec 64) V!59085 (_ BitVec 64)) Unit!51461)

(assert (=> b!1548798 (= lt!667456 (addStillContains!1238 lt!667455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49841 _keys!618) from!762)))))

(assert (=> b!1548798 (= lt!667455 (getCurrentListMapNoExtraKeys!6594 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548799 () Bool)

(declare-fun res!1061071 () Bool)

(declare-fun e!862256 () Bool)

(assert (=> b!1548799 (=> (not res!1061071) (not e!862256))))

(assert (=> b!1548799 (= res!1061071 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50392 _keys!618))))))

(declare-fun b!1548800 () Bool)

(declare-fun res!1061072 () Bool)

(assert (=> b!1548800 (=> (not res!1061072) (not e!862256))))

(declare-datatypes ((List!36065 0))(
  ( (Nil!36062) (Cons!36061 (h!37524 (_ BitVec 64)) (t!50751 List!36065)) )
))
(declare-fun arrayNoDuplicates!0 (array!103292 (_ BitVec 32) List!36065) Bool)

(assert (=> b!1548800 (= res!1061072 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36062))))

(declare-fun mapIsEmpty!58675 () Bool)

(assert (=> mapIsEmpty!58675 mapRes!58675))

(declare-fun b!1548801 () Bool)

(declare-fun e!862254 () Bool)

(declare-fun tp_is_empty!37981 () Bool)

(assert (=> b!1548801 (= e!862254 tp_is_empty!37981)))

(declare-fun b!1548802 () Bool)

(declare-fun c!142601 () Bool)

(declare-fun lt!667453 () Bool)

(assert (=> b!1548802 (= c!142601 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667453))))

(declare-fun e!862249 () ListLongMap!22195)

(declare-fun e!862251 () ListLongMap!22195)

(assert (=> b!1548802 (= e!862249 e!862251)))

(declare-fun b!1548803 () Bool)

(declare-fun e!862253 () ListLongMap!22195)

(assert (=> b!1548803 (= e!862253 e!862249)))

(declare-fun c!142602 () Bool)

(assert (=> b!1548803 (= c!142602 (and (not lt!667453) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69665 () Bool)

(assert (=> bm!69665 (= call!69666 call!69668)))

(declare-fun b!1548804 () Bool)

(assert (=> b!1548804 (= e!862257 tp_is_empty!37981)))

(declare-fun res!1061074 () Bool)

(assert (=> start!132404 (=> (not res!1061074) (not e!862256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132404 (= res!1061074 (validMask!0 mask!926))))

(assert (=> start!132404 e!862256))

(declare-fun array_inv!39033 (array!103292) Bool)

(assert (=> start!132404 (array_inv!39033 _keys!618)))

(assert (=> start!132404 tp_is_empty!37981))

(assert (=> start!132404 true))

(assert (=> start!132404 tp!111367))

(declare-fun array_inv!39034 (array!103290) Bool)

(assert (=> start!132404 (and (array_inv!39034 _values!470) e!862252)))

(declare-fun b!1548805 () Bool)

(assert (=> b!1548805 (= e!862251 call!69669)))

(declare-fun b!1548806 () Bool)

(assert (=> b!1548806 (= e!862256 e!862250)))

(declare-fun res!1061075 () Bool)

(assert (=> b!1548806 (=> (not res!1061075) (not e!862250))))

(assert (=> b!1548806 (= res!1061075 (bvslt from!762 (size!50392 _keys!618)))))

(declare-fun lt!667454 () ListLongMap!22195)

(assert (=> b!1548806 (= lt!667454 e!862253)))

(declare-fun c!142603 () Bool)

(assert (=> b!1548806 (= c!142603 (and (not lt!667453) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548806 (= lt!667453 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548807 () Bool)

(declare-fun res!1061073 () Bool)

(assert (=> b!1548807 (=> (not res!1061073) (not e!862256))))

(assert (=> b!1548807 (= res!1061073 (and (= (size!50391 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50392 _keys!618) (size!50391 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548808 () Bool)

(assert (=> b!1548808 (= e!862253 (+!4958 call!69667 (tuple2!24579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69666 () Bool)

(assert (=> bm!69666 (= call!69667 (+!4958 (ite c!142603 call!69668 (ite c!142602 call!69666 call!69669)) (ite (or c!142603 c!142602) (tuple2!24579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548809 () Bool)

(declare-fun res!1061070 () Bool)

(assert (=> b!1548809 (=> (not res!1061070) (not e!862250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548809 (= res!1061070 (validKeyInArray!0 (select (arr!49841 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58675 () Bool)

(declare-fun tp!111366 () Bool)

(assert (=> mapNonEmpty!58675 (= mapRes!58675 (and tp!111366 e!862254))))

(declare-fun mapKey!58675 () (_ BitVec 32))

(declare-fun mapRest!58675 () (Array (_ BitVec 32) ValueCell!18080))

(declare-fun mapValue!58675 () ValueCell!18080)

(assert (=> mapNonEmpty!58675 (= (arr!49840 _values!470) (store mapRest!58675 mapKey!58675 mapValue!58675))))

(declare-fun b!1548810 () Bool)

(assert (=> b!1548810 (= e!862249 call!69665)))

(declare-fun b!1548811 () Bool)

(assert (=> b!1548811 (= e!862251 call!69665)))

(declare-fun b!1548812 () Bool)

(declare-fun res!1061069 () Bool)

(assert (=> b!1548812 (=> (not res!1061069) (not e!862256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103292 (_ BitVec 32)) Bool)

(assert (=> b!1548812 (= res!1061069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!132404 res!1061074) b!1548807))

(assert (= (and b!1548807 res!1061073) b!1548812))

(assert (= (and b!1548812 res!1061069) b!1548800))

(assert (= (and b!1548800 res!1061072) b!1548799))

(assert (= (and b!1548799 res!1061071) b!1548806))

(assert (= (and b!1548806 c!142603) b!1548808))

(assert (= (and b!1548806 (not c!142603)) b!1548803))

(assert (= (and b!1548803 c!142602) b!1548810))

(assert (= (and b!1548803 (not c!142602)) b!1548802))

(assert (= (and b!1548802 c!142601) b!1548811))

(assert (= (and b!1548802 (not c!142601)) b!1548805))

(assert (= (or b!1548811 b!1548805) bm!69663))

(assert (= (or b!1548810 bm!69663) bm!69665))

(assert (= (or b!1548810 b!1548811) bm!69662))

(assert (= (or b!1548808 bm!69665) bm!69664))

(assert (= (or b!1548808 bm!69662) bm!69666))

(assert (= (and b!1548806 res!1061075) b!1548809))

(assert (= (and b!1548809 res!1061070) b!1548798))

(assert (= (and b!1548797 condMapEmpty!58675) mapIsEmpty!58675))

(assert (= (and b!1548797 (not condMapEmpty!58675)) mapNonEmpty!58675))

(get-info :version)

(assert (= (and mapNonEmpty!58675 ((_ is ValueCellFull!18080) mapValue!58675)) b!1548801))

(assert (= (and b!1548797 ((_ is ValueCellFull!18080) mapDefault!58675)) b!1548804))

(assert (= start!132404 b!1548797))

(declare-fun m!1428549 () Bool)

(assert (=> bm!69664 m!1428549))

(declare-fun m!1428551 () Bool)

(assert (=> mapNonEmpty!58675 m!1428551))

(declare-fun m!1428553 () Bool)

(assert (=> b!1548812 m!1428553))

(declare-fun m!1428555 () Bool)

(assert (=> b!1548809 m!1428555))

(assert (=> b!1548809 m!1428555))

(declare-fun m!1428557 () Bool)

(assert (=> b!1548809 m!1428557))

(declare-fun m!1428559 () Bool)

(assert (=> start!132404 m!1428559))

(declare-fun m!1428561 () Bool)

(assert (=> start!132404 m!1428561))

(declare-fun m!1428563 () Bool)

(assert (=> start!132404 m!1428563))

(declare-fun m!1428565 () Bool)

(assert (=> b!1548808 m!1428565))

(declare-fun m!1428567 () Bool)

(assert (=> b!1548800 m!1428567))

(declare-fun m!1428569 () Bool)

(assert (=> bm!69666 m!1428569))

(declare-fun m!1428571 () Bool)

(assert (=> b!1548798 m!1428571))

(assert (=> b!1548798 m!1428549))

(assert (=> b!1548798 m!1428555))

(assert (=> b!1548798 m!1428571))

(assert (=> b!1548798 m!1428555))

(declare-fun m!1428573 () Bool)

(assert (=> b!1548798 m!1428573))

(assert (=> b!1548798 m!1428555))

(declare-fun m!1428575 () Bool)

(assert (=> b!1548798 m!1428575))

(check-sat (not b_next!31705) (not mapNonEmpty!58675) tp_is_empty!37981 (not b!1548812) b_and!51117 (not b!1548808) (not b!1548809) (not bm!69666) (not bm!69664) (not b!1548800) (not start!132404) (not b!1548798))
(check-sat b_and!51117 (not b_next!31705))
