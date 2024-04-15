; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131966 () Bool)

(assert start!131966)

(declare-fun b_free!31729 () Bool)

(declare-fun b_next!31729 () Bool)

(assert (=> start!131966 (= b_free!31729 (not b_next!31729))))

(declare-fun tp!111440 () Bool)

(declare-fun b_and!51121 () Bool)

(assert (=> start!131966 (= tp!111440 b_and!51121)))

(declare-fun b!1546624 () Bool)

(declare-fun e!860871 () Bool)

(assert (=> b!1546624 (= e!860871 (not true))))

(declare-datatypes ((array!103140 0))(
  ( (array!103141 (arr!49773 (Array (_ BitVec 32) (_ BitVec 64))) (size!50325 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103140)

(declare-datatypes ((V!59117 0))(
  ( (V!59118 (val!19080 Int)) )
))
(declare-datatypes ((tuple2!24616 0))(
  ( (tuple2!24617 (_1!12319 (_ BitVec 64)) (_2!12319 V!59117)) )
))
(declare-datatypes ((List!36087 0))(
  ( (Nil!36084) (Cons!36083 (h!37529 tuple2!24616) (t!50773 List!36087)) )
))
(declare-datatypes ((ListLongMap!22225 0))(
  ( (ListLongMap!22226 (toList!11128 List!36087)) )
))
(declare-fun lt!666436 () ListLongMap!22225)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun minValue!436 () V!59117)

(declare-fun apply!1039 (ListLongMap!22225 (_ BitVec 64)) V!59117)

(declare-fun +!4954 (ListLongMap!22225 tuple2!24616) ListLongMap!22225)

(assert (=> b!1546624 (= (apply!1039 (+!4954 lt!666436 (tuple2!24617 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49773 _keys!618) from!762)) (apply!1039 lt!666436 (select (arr!49773 _keys!618) from!762)))))

(declare-datatypes ((Unit!51375 0))(
  ( (Unit!51376) )
))
(declare-fun lt!666433 () Unit!51375)

(declare-fun addApplyDifferent!577 (ListLongMap!22225 (_ BitVec 64) V!59117 (_ BitVec 64)) Unit!51375)

(assert (=> b!1546624 (= lt!666433 (addApplyDifferent!577 lt!666436 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49773 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59117)

(declare-fun contains!10014 (ListLongMap!22225 (_ BitVec 64)) Bool)

(assert (=> b!1546624 (contains!10014 (+!4954 lt!666436 (tuple2!24617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49773 _keys!618) from!762))))

(declare-fun lt!666432 () Unit!51375)

(declare-fun addStillContains!1237 (ListLongMap!22225 (_ BitVec 64) V!59117 (_ BitVec 64)) Unit!51375)

(assert (=> b!1546624 (= lt!666432 (addStillContains!1237 lt!666436 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49773 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18092 0))(
  ( (ValueCellFull!18092 (v!21877 V!59117)) (EmptyCell!18092) )
))
(declare-datatypes ((array!103142 0))(
  ( (array!103143 (arr!49774 (Array (_ BitVec 32) ValueCell!18092)) (size!50326 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103142)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6582 (array!103140 array!103142 (_ BitVec 32) (_ BitVec 32) V!59117 V!59117 (_ BitVec 32) Int) ListLongMap!22225)

(assert (=> b!1546624 (= lt!666436 (getCurrentListMapNoExtraKeys!6582 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69657 () Bool)

(declare-fun call!69663 () ListLongMap!22225)

(declare-fun call!69664 () ListLongMap!22225)

(assert (=> bm!69657 (= call!69663 call!69664)))

(declare-fun b!1546625 () Bool)

(declare-fun e!860867 () ListLongMap!22225)

(declare-fun call!69661 () ListLongMap!22225)

(assert (=> b!1546625 (= e!860867 call!69661)))

(declare-fun b!1546626 () Bool)

(declare-fun e!860868 () Bool)

(assert (=> b!1546626 (= e!860868 e!860871)))

(declare-fun res!1060336 () Bool)

(assert (=> b!1546626 (=> (not res!1060336) (not e!860871))))

(assert (=> b!1546626 (= res!1060336 (bvslt from!762 (size!50325 _keys!618)))))

(declare-fun lt!666434 () ListLongMap!22225)

(declare-fun e!860873 () ListLongMap!22225)

(assert (=> b!1546626 (= lt!666434 e!860873)))

(declare-fun c!141821 () Bool)

(declare-fun lt!666435 () Bool)

(assert (=> b!1546626 (= c!141821 (and (not lt!666435) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546626 (= lt!666435 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!1060335 () Bool)

(assert (=> start!131966 (=> (not res!1060335) (not e!860868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131966 (= res!1060335 (validMask!0 mask!926))))

(assert (=> start!131966 e!860868))

(declare-fun array_inv!38907 (array!103140) Bool)

(assert (=> start!131966 (array_inv!38907 _keys!618)))

(declare-fun tp_is_empty!38005 () Bool)

(assert (=> start!131966 tp_is_empty!38005))

(assert (=> start!131966 true))

(assert (=> start!131966 tp!111440))

(declare-fun e!860866 () Bool)

(declare-fun array_inv!38908 (array!103142) Bool)

(assert (=> start!131966 (and (array_inv!38908 _values!470) e!860866)))

(declare-fun bm!69658 () Bool)

(declare-fun call!69660 () ListLongMap!22225)

(assert (=> bm!69658 (= call!69660 (getCurrentListMapNoExtraKeys!6582 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546627 () Bool)

(assert (=> b!1546627 (= e!860873 e!860867)))

(declare-fun c!141820 () Bool)

(assert (=> b!1546627 (= c!141820 (and (not lt!666435) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69659 () Bool)

(declare-fun call!69662 () ListLongMap!22225)

(assert (=> bm!69659 (= call!69661 call!69662)))

(declare-fun bm!69660 () Bool)

(assert (=> bm!69660 (= call!69662 (+!4954 (ite c!141821 call!69660 (ite c!141820 call!69664 call!69663)) (ite (or c!141821 c!141820) (tuple2!24617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24617 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546628 () Bool)

(declare-fun c!141822 () Bool)

(assert (=> b!1546628 (= c!141822 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666435))))

(declare-fun e!860870 () ListLongMap!22225)

(assert (=> b!1546628 (= e!860867 e!860870)))

(declare-fun b!1546629 () Bool)

(assert (=> b!1546629 (= e!860870 call!69661)))

(declare-fun b!1546630 () Bool)

(declare-fun res!1060333 () Bool)

(assert (=> b!1546630 (=> (not res!1060333) (not e!860868))))

(declare-datatypes ((List!36088 0))(
  ( (Nil!36085) (Cons!36084 (h!37530 (_ BitVec 64)) (t!50774 List!36088)) )
))
(declare-fun arrayNoDuplicates!0 (array!103140 (_ BitVec 32) List!36088) Bool)

(assert (=> b!1546630 (= res!1060333 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36085))))

(declare-fun b!1546631 () Bool)

(declare-fun res!1060338 () Bool)

(assert (=> b!1546631 (=> (not res!1060338) (not e!860868))))

(assert (=> b!1546631 (= res!1060338 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50325 _keys!618))))))

(declare-fun b!1546632 () Bool)

(declare-fun res!1060337 () Bool)

(assert (=> b!1546632 (=> (not res!1060337) (not e!860871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546632 (= res!1060337 (validKeyInArray!0 (select (arr!49773 _keys!618) from!762)))))

(declare-fun b!1546633 () Bool)

(assert (=> b!1546633 (= e!860870 call!69663)))

(declare-fun b!1546634 () Bool)

(assert (=> b!1546634 (= e!860873 (+!4954 call!69662 (tuple2!24617 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546635 () Bool)

(declare-fun e!860872 () Bool)

(assert (=> b!1546635 (= e!860872 tp_is_empty!38005)))

(declare-fun mapIsEmpty!58711 () Bool)

(declare-fun mapRes!58711 () Bool)

(assert (=> mapIsEmpty!58711 mapRes!58711))

(declare-fun b!1546636 () Bool)

(declare-fun res!1060334 () Bool)

(assert (=> b!1546636 (=> (not res!1060334) (not e!860868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103140 (_ BitVec 32)) Bool)

(assert (=> b!1546636 (= res!1060334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546637 () Bool)

(declare-fun e!860869 () Bool)

(assert (=> b!1546637 (= e!860866 (and e!860869 mapRes!58711))))

(declare-fun condMapEmpty!58711 () Bool)

(declare-fun mapDefault!58711 () ValueCell!18092)

(assert (=> b!1546637 (= condMapEmpty!58711 (= (arr!49774 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18092)) mapDefault!58711)))))

(declare-fun bm!69661 () Bool)

(assert (=> bm!69661 (= call!69664 call!69660)))

(declare-fun b!1546638 () Bool)

(assert (=> b!1546638 (= e!860869 tp_is_empty!38005)))

(declare-fun mapNonEmpty!58711 () Bool)

(declare-fun tp!111439 () Bool)

(assert (=> mapNonEmpty!58711 (= mapRes!58711 (and tp!111439 e!860872))))

(declare-fun mapValue!58711 () ValueCell!18092)

(declare-fun mapRest!58711 () (Array (_ BitVec 32) ValueCell!18092))

(declare-fun mapKey!58711 () (_ BitVec 32))

(assert (=> mapNonEmpty!58711 (= (arr!49774 _values!470) (store mapRest!58711 mapKey!58711 mapValue!58711))))

(declare-fun b!1546639 () Bool)

(declare-fun res!1060332 () Bool)

(assert (=> b!1546639 (=> (not res!1060332) (not e!860868))))

(assert (=> b!1546639 (= res!1060332 (and (= (size!50326 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50325 _keys!618) (size!50326 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!131966 res!1060335) b!1546639))

(assert (= (and b!1546639 res!1060332) b!1546636))

(assert (= (and b!1546636 res!1060334) b!1546630))

(assert (= (and b!1546630 res!1060333) b!1546631))

(assert (= (and b!1546631 res!1060338) b!1546626))

(assert (= (and b!1546626 c!141821) b!1546634))

(assert (= (and b!1546626 (not c!141821)) b!1546627))

(assert (= (and b!1546627 c!141820) b!1546625))

(assert (= (and b!1546627 (not c!141820)) b!1546628))

(assert (= (and b!1546628 c!141822) b!1546629))

(assert (= (and b!1546628 (not c!141822)) b!1546633))

(assert (= (or b!1546629 b!1546633) bm!69657))

(assert (= (or b!1546625 bm!69657) bm!69661))

(assert (= (or b!1546625 b!1546629) bm!69659))

(assert (= (or b!1546634 bm!69661) bm!69658))

(assert (= (or b!1546634 bm!69659) bm!69660))

(assert (= (and b!1546626 res!1060336) b!1546632))

(assert (= (and b!1546632 res!1060337) b!1546624))

(assert (= (and b!1546637 condMapEmpty!58711) mapIsEmpty!58711))

(assert (= (and b!1546637 (not condMapEmpty!58711)) mapNonEmpty!58711))

(get-info :version)

(assert (= (and mapNonEmpty!58711 ((_ is ValueCellFull!18092) mapValue!58711)) b!1546635))

(assert (= (and b!1546637 ((_ is ValueCellFull!18092) mapDefault!58711)) b!1546638))

(assert (= start!131966 b!1546637))

(declare-fun m!1425789 () Bool)

(assert (=> b!1546632 m!1425789))

(assert (=> b!1546632 m!1425789))

(declare-fun m!1425791 () Bool)

(assert (=> b!1546632 m!1425791))

(declare-fun m!1425793 () Bool)

(assert (=> bm!69660 m!1425793))

(declare-fun m!1425795 () Bool)

(assert (=> bm!69658 m!1425795))

(declare-fun m!1425797 () Bool)

(assert (=> b!1546634 m!1425797))

(declare-fun m!1425799 () Bool)

(assert (=> mapNonEmpty!58711 m!1425799))

(declare-fun m!1425801 () Bool)

(assert (=> b!1546636 m!1425801))

(declare-fun m!1425803 () Bool)

(assert (=> start!131966 m!1425803))

(declare-fun m!1425805 () Bool)

(assert (=> start!131966 m!1425805))

(declare-fun m!1425807 () Bool)

(assert (=> start!131966 m!1425807))

(declare-fun m!1425809 () Bool)

(assert (=> b!1546630 m!1425809))

(assert (=> b!1546624 m!1425795))

(assert (=> b!1546624 m!1425789))

(declare-fun m!1425811 () Bool)

(assert (=> b!1546624 m!1425811))

(assert (=> b!1546624 m!1425789))

(declare-fun m!1425813 () Bool)

(assert (=> b!1546624 m!1425813))

(assert (=> b!1546624 m!1425789))

(declare-fun m!1425815 () Bool)

(assert (=> b!1546624 m!1425815))

(assert (=> b!1546624 m!1425789))

(declare-fun m!1425817 () Bool)

(assert (=> b!1546624 m!1425817))

(declare-fun m!1425819 () Bool)

(assert (=> b!1546624 m!1425819))

(assert (=> b!1546624 m!1425789))

(declare-fun m!1425821 () Bool)

(assert (=> b!1546624 m!1425821))

(assert (=> b!1546624 m!1425789))

(declare-fun m!1425823 () Bool)

(assert (=> b!1546624 m!1425823))

(assert (=> b!1546624 m!1425819))

(assert (=> b!1546624 m!1425811))

(check-sat (not bm!69658) (not b_next!31729) tp_is_empty!38005 (not b!1546630) (not bm!69660) (not b!1546636) (not b!1546624) (not start!131966) b_and!51121 (not mapNonEmpty!58711) (not b!1546632) (not b!1546634))
(check-sat b_and!51121 (not b_next!31729))
