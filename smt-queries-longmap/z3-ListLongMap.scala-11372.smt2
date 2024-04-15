; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132086 () Bool)

(assert start!132086)

(declare-fun b_free!31849 () Bool)

(declare-fun b_next!31849 () Bool)

(assert (=> start!132086 (= b_free!31849 (not b_next!31849))))

(declare-fun tp!111799 () Bool)

(declare-fun b_and!51247 () Bool)

(assert (=> start!132086 (= tp!111799 b_and!51247)))

(declare-fun e!862562 () Bool)

(declare-datatypes ((array!103370 0))(
  ( (array!103371 (arr!49888 (Array (_ BitVec 32) (_ BitVec 64))) (size!50440 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103370)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((V!59277 0))(
  ( (V!59278 (val!19140 Int)) )
))
(declare-datatypes ((ValueCell!18152 0))(
  ( (ValueCellFull!18152 (v!21937 V!59277)) (EmptyCell!18152) )
))
(declare-datatypes ((array!103372 0))(
  ( (array!103373 (arr!49889 (Array (_ BitVec 32) ValueCell!18152)) (size!50441 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103372)

(declare-fun b!1549591 () Bool)

(declare-datatypes ((tuple2!24732 0))(
  ( (tuple2!24733 (_1!12377 (_ BitVec 64)) (_2!12377 V!59277)) )
))
(declare-datatypes ((List!36188 0))(
  ( (Nil!36185) (Cons!36184 (h!37630 tuple2!24732) (t!50882 List!36188)) )
))
(declare-datatypes ((ListLongMap!22341 0))(
  ( (ListLongMap!22342 (toList!11186 List!36188)) )
))
(declare-fun lt!667859 () ListLongMap!22341)

(declare-fun apply!1078 (ListLongMap!22341 (_ BitVec 64)) V!59277)

(declare-fun get!25998 (ValueCell!18152 V!59277) V!59277)

(declare-fun dynLambda!3821 (Int (_ BitVec 64)) V!59277)

(assert (=> b!1549591 (= e!862562 (= (apply!1078 lt!667859 (select (arr!49888 _keys!618) from!762)) (get!25998 (select (arr!49889 _values!470) from!762) (dynLambda!3821 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1549592 () Bool)

(declare-fun e!862565 () Bool)

(declare-fun tp_is_empty!38125 () Bool)

(assert (=> b!1549592 (= e!862565 tp_is_empty!38125)))

(declare-fun b!1549593 () Bool)

(declare-fun e!862556 () Bool)

(declare-fun e!862558 () Bool)

(declare-fun mapRes!58891 () Bool)

(assert (=> b!1549593 (= e!862556 (and e!862558 mapRes!58891))))

(declare-fun condMapEmpty!58891 () Bool)

(declare-fun mapDefault!58891 () ValueCell!18152)

(assert (=> b!1549593 (= condMapEmpty!58891 (= (arr!49889 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18152)) mapDefault!58891)))))

(declare-fun b!1549594 () Bool)

(declare-fun res!1061638 () Bool)

(declare-fun e!862564 () Bool)

(assert (=> b!1549594 (=> (not res!1061638) (not e!862564))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1549594 (= res!1061638 (and (= (size!50441 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50440 _keys!618) (size!50441 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1061637 () Bool)

(assert (=> start!132086 (=> (not res!1061637) (not e!862564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132086 (= res!1061637 (validMask!0 mask!926))))

(assert (=> start!132086 e!862564))

(declare-fun array_inv!38991 (array!103370) Bool)

(assert (=> start!132086 (array_inv!38991 _keys!618)))

(assert (=> start!132086 tp_is_empty!38125))

(assert (=> start!132086 true))

(assert (=> start!132086 tp!111799))

(declare-fun array_inv!38992 (array!103372) Bool)

(assert (=> start!132086 (and (array_inv!38992 _values!470) e!862556)))

(declare-fun bm!70559 () Bool)

(declare-fun call!70567 () Bool)

(declare-fun contains!10054 (ListLongMap!22341 (_ BitVec 64)) Bool)

(assert (=> bm!70559 (= call!70567 (contains!10054 lt!667859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1549595 () Bool)

(declare-datatypes ((Unit!51456 0))(
  ( (Unit!51457) )
))
(declare-fun e!862561 () Unit!51456)

(declare-fun Unit!51458 () Unit!51456)

(assert (=> b!1549595 (= e!862561 Unit!51458)))

(declare-fun b!1549596 () Bool)

(declare-fun e!862563 () ListLongMap!22341)

(declare-fun call!70565 () ListLongMap!22341)

(assert (=> b!1549596 (= e!862563 call!70565)))

(declare-fun b!1549597 () Bool)

(declare-fun e!862566 () ListLongMap!22341)

(declare-fun call!70566 () ListLongMap!22341)

(declare-fun minValue!436 () V!59277)

(declare-fun +!5003 (ListLongMap!22341 tuple2!24732) ListLongMap!22341)

(assert (=> b!1549597 (= e!862566 (+!5003 call!70566 (tuple2!24733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70560 () Bool)

(declare-fun call!70563 () ListLongMap!22341)

(declare-fun call!70564 () ListLongMap!22341)

(assert (=> bm!70560 (= call!70563 call!70564)))

(declare-fun b!1549598 () Bool)

(declare-fun e!862559 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549598 (= e!862559 (not (validKeyInArray!0 (select (arr!49888 _keys!618) from!762))))))

(declare-fun mapIsEmpty!58891 () Bool)

(assert (=> mapIsEmpty!58891 mapRes!58891))

(declare-fun b!1549599 () Bool)

(declare-fun e!862554 () ListLongMap!22341)

(assert (=> b!1549599 (= e!862566 e!862554)))

(declare-fun c!142382 () Bool)

(declare-fun lt!667853 () Bool)

(assert (=> b!1549599 (= c!142382 (and (not lt!667853) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549600 () Bool)

(declare-fun c!142385 () Bool)

(assert (=> b!1549600 (= c!142385 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667853))))

(assert (=> b!1549600 (= e!862554 e!862563)))

(declare-fun bm!70561 () Bool)

(declare-fun call!70562 () ListLongMap!22341)

(assert (=> bm!70561 (= call!70564 call!70562)))

(declare-fun bm!70562 () Bool)

(assert (=> bm!70562 (= call!70565 call!70566)))

(declare-fun b!1549601 () Bool)

(declare-fun e!862552 () Bool)

(assert (=> b!1549601 (= e!862552 (not call!70567))))

(declare-fun b!1549602 () Bool)

(assert (=> b!1549602 (= e!862554 call!70565)))

(declare-fun b!1549603 () Bool)

(declare-fun e!862557 () Bool)

(declare-fun zeroValue!436 () V!59277)

(assert (=> b!1549603 (= e!862557 (= (apply!1078 lt!667859 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!436))))

(declare-fun b!1549604 () Bool)

(declare-fun lt!667858 () Unit!51456)

(assert (=> b!1549604 (= e!862561 lt!667858)))

(declare-fun lt!667861 () ListLongMap!22341)

(declare-fun getCurrentListMapNoExtraKeys!6628 (array!103370 array!103372 (_ BitVec 32) (_ BitVec 32) V!59277 V!59277 (_ BitVec 32) Int) ListLongMap!22341)

(assert (=> b!1549604 (= lt!667861 (getCurrentListMapNoExtraKeys!6628 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!667855 () Unit!51456)

(declare-fun addStillContains!1276 (ListLongMap!22341 (_ BitVec 64) V!59277 (_ BitVec 64)) Unit!51456)

(assert (=> b!1549604 (= lt!667855 (addStillContains!1276 lt!667861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49888 _keys!618) from!762)))))

(declare-fun lt!667857 () ListLongMap!22341)

(assert (=> b!1549604 (= lt!667857 (+!5003 lt!667861 (tuple2!24733 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (=> b!1549604 (contains!10054 lt!667857 (select (arr!49888 _keys!618) from!762))))

(declare-fun addApplyDifferent!616 (ListLongMap!22341 (_ BitVec 64) V!59277 (_ BitVec 64)) Unit!51456)

(assert (=> b!1549604 (= lt!667858 (addApplyDifferent!616 lt!667861 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49888 _keys!618) from!762)))))

(declare-fun lt!667856 () V!59277)

(assert (=> b!1549604 (= lt!667856 (apply!1078 (+!5003 lt!667861 (tuple2!24733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49888 _keys!618) from!762)))))

(declare-fun lt!667854 () V!59277)

(assert (=> b!1549604 (= lt!667854 (apply!1078 lt!667861 (select (arr!49888 _keys!618) from!762)))))

(assert (=> b!1549604 (= lt!667856 lt!667854)))

(declare-fun lt!667850 () Unit!51456)

(assert (=> b!1549604 (= lt!667850 (addApplyDifferent!616 lt!667861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49888 _keys!618) from!762)))))

(assert (=> b!1549604 (= (apply!1078 lt!667857 (select (arr!49888 _keys!618) from!762)) lt!667854)))

(declare-fun b!1549605 () Bool)

(assert (=> b!1549605 (= e!862563 call!70563)))

(declare-fun b!1549606 () Bool)

(declare-fun e!862560 () Bool)

(assert (=> b!1549606 (= e!862560 e!862562)))

(declare-fun res!1061633 () Bool)

(assert (=> b!1549606 (=> (not res!1061633) (not e!862562))))

(assert (=> b!1549606 (= res!1061633 (contains!10054 lt!667859 (select (arr!49888 _keys!618) from!762)))))

(declare-fun bm!70563 () Bool)

(assert (=> bm!70563 (= call!70562 (getCurrentListMapNoExtraKeys!6628 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549607 () Bool)

(declare-fun res!1061631 () Bool)

(assert (=> b!1549607 (=> (not res!1061631) (not e!862564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103370 (_ BitVec 32)) Bool)

(assert (=> b!1549607 (= res!1061631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun c!142386 () Bool)

(declare-fun bm!70564 () Bool)

(assert (=> bm!70564 (= call!70566 (+!5003 (ite c!142386 call!70562 (ite c!142382 call!70564 call!70563)) (ite (or c!142386 c!142382) (tuple2!24733 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549608 () Bool)

(assert (=> b!1549608 (= e!862552 e!862557)))

(declare-fun res!1061636 () Bool)

(assert (=> b!1549608 (= res!1061636 call!70567)))

(assert (=> b!1549608 (=> (not res!1061636) (not e!862557))))

(declare-fun b!1549609 () Bool)

(declare-fun res!1061630 () Bool)

(declare-fun e!862553 () Bool)

(assert (=> b!1549609 (=> (not res!1061630) (not e!862553))))

(assert (=> b!1549609 (= res!1061630 e!862552)))

(declare-fun c!142383 () Bool)

(assert (=> b!1549609 (= c!142383 (not lt!667853))))

(declare-fun b!1549610 () Bool)

(declare-fun res!1061634 () Bool)

(assert (=> b!1549610 (=> (not res!1061634) (not e!862553))))

(assert (=> b!1549610 (= res!1061634 (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549611 () Bool)

(assert (=> b!1549611 (= e!862553 false)))

(declare-fun lt!667852 () Bool)

(assert (=> b!1549611 (= lt!667852 (contains!10054 lt!667859 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!58891 () Bool)

(declare-fun tp!111800 () Bool)

(assert (=> mapNonEmpty!58891 (= mapRes!58891 (and tp!111800 e!862565))))

(declare-fun mapKey!58891 () (_ BitVec 32))

(declare-fun mapValue!58891 () ValueCell!18152)

(declare-fun mapRest!58891 () (Array (_ BitVec 32) ValueCell!18152))

(assert (=> mapNonEmpty!58891 (= (arr!49889 _values!470) (store mapRest!58891 mapKey!58891 mapValue!58891))))

(declare-fun b!1549612 () Bool)

(declare-fun res!1061635 () Bool)

(assert (=> b!1549612 (=> (not res!1061635) (not e!862564))))

(assert (=> b!1549612 (= res!1061635 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50440 _keys!618))))))

(declare-fun b!1549613 () Bool)

(assert (=> b!1549613 (= e!862558 tp_is_empty!38125)))

(declare-fun b!1549614 () Bool)

(declare-fun res!1061629 () Bool)

(assert (=> b!1549614 (=> (not res!1061629) (not e!862564))))

(declare-datatypes ((List!36189 0))(
  ( (Nil!36186) (Cons!36185 (h!37631 (_ BitVec 64)) (t!50883 List!36189)) )
))
(declare-fun arrayNoDuplicates!0 (array!103370 (_ BitVec 32) List!36189) Bool)

(assert (=> b!1549614 (= res!1061629 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36186))))

(declare-fun b!1549615 () Bool)

(assert (=> b!1549615 (= e!862564 e!862553)))

(declare-fun res!1061639 () Bool)

(assert (=> b!1549615 (=> (not res!1061639) (not e!862553))))

(assert (=> b!1549615 (= res!1061639 e!862560)))

(declare-fun res!1061640 () Bool)

(assert (=> b!1549615 (=> res!1061640 e!862560)))

(declare-fun lt!667860 () Bool)

(assert (=> b!1549615 (= res!1061640 lt!667860)))

(declare-fun lt!667851 () Unit!51456)

(assert (=> b!1549615 (= lt!667851 e!862561)))

(declare-fun c!142384 () Bool)

(assert (=> b!1549615 (= c!142384 (not lt!667860))))

(assert (=> b!1549615 (= lt!667860 e!862559)))

(declare-fun res!1061632 () Bool)

(assert (=> b!1549615 (=> res!1061632 e!862559)))

(assert (=> b!1549615 (= res!1061632 (bvsge from!762 (size!50440 _keys!618)))))

(assert (=> b!1549615 (= lt!667859 e!862566)))

(assert (=> b!1549615 (= c!142386 (and (not lt!667853) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549615 (= lt!667853 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!132086 res!1061637) b!1549594))

(assert (= (and b!1549594 res!1061638) b!1549607))

(assert (= (and b!1549607 res!1061631) b!1549614))

(assert (= (and b!1549614 res!1061629) b!1549612))

(assert (= (and b!1549612 res!1061635) b!1549615))

(assert (= (and b!1549615 c!142386) b!1549597))

(assert (= (and b!1549615 (not c!142386)) b!1549599))

(assert (= (and b!1549599 c!142382) b!1549602))

(assert (= (and b!1549599 (not c!142382)) b!1549600))

(assert (= (and b!1549600 c!142385) b!1549596))

(assert (= (and b!1549600 (not c!142385)) b!1549605))

(assert (= (or b!1549596 b!1549605) bm!70560))

(assert (= (or b!1549602 bm!70560) bm!70561))

(assert (= (or b!1549602 b!1549596) bm!70562))

(assert (= (or b!1549597 bm!70561) bm!70563))

(assert (= (or b!1549597 bm!70562) bm!70564))

(assert (= (and b!1549615 (not res!1061632)) b!1549598))

(assert (= (and b!1549615 c!142384) b!1549604))

(assert (= (and b!1549615 (not c!142384)) b!1549595))

(assert (= (and b!1549615 (not res!1061640)) b!1549606))

(assert (= (and b!1549606 res!1061633) b!1549591))

(assert (= (and b!1549615 res!1061639) b!1549609))

(assert (= (and b!1549609 c!142383) b!1549608))

(assert (= (and b!1549609 (not c!142383)) b!1549601))

(assert (= (and b!1549608 res!1061636) b!1549603))

(assert (= (or b!1549608 b!1549601) bm!70559))

(assert (= (and b!1549609 res!1061630) b!1549610))

(assert (= (and b!1549610 res!1061634) b!1549611))

(assert (= (and b!1549593 condMapEmpty!58891) mapIsEmpty!58891))

(assert (= (and b!1549593 (not condMapEmpty!58891)) mapNonEmpty!58891))

(get-info :version)

(assert (= (and mapNonEmpty!58891 ((_ is ValueCellFull!18152) mapValue!58891)) b!1549592))

(assert (= (and b!1549593 ((_ is ValueCellFull!18152) mapDefault!58891)) b!1549613))

(assert (= start!132086 b!1549593))

(declare-fun b_lambda!24739 () Bool)

(assert (=> (not b_lambda!24739) (not b!1549591)))

(declare-fun t!50881 () Bool)

(declare-fun tb!12461 () Bool)

(assert (=> (and start!132086 (= defaultEntry!478 defaultEntry!478) t!50881) tb!12461))

(declare-fun result!26041 () Bool)

(assert (=> tb!12461 (= result!26041 tp_is_empty!38125)))

(assert (=> b!1549591 t!50881))

(declare-fun b_and!51249 () Bool)

(assert (= b_and!51247 (and (=> t!50881 result!26041) b_and!51249)))

(declare-fun m!1428147 () Bool)

(assert (=> b!1549611 m!1428147))

(declare-fun m!1428149 () Bool)

(assert (=> bm!70559 m!1428149))

(declare-fun m!1428151 () Bool)

(assert (=> b!1549606 m!1428151))

(assert (=> b!1549606 m!1428151))

(declare-fun m!1428153 () Bool)

(assert (=> b!1549606 m!1428153))

(declare-fun m!1428155 () Bool)

(assert (=> b!1549591 m!1428155))

(assert (=> b!1549591 m!1428151))

(assert (=> b!1549591 m!1428151))

(declare-fun m!1428157 () Bool)

(assert (=> b!1549591 m!1428157))

(declare-fun m!1428159 () Bool)

(assert (=> b!1549591 m!1428159))

(assert (=> b!1549591 m!1428155))

(assert (=> b!1549591 m!1428159))

(declare-fun m!1428161 () Bool)

(assert (=> b!1549591 m!1428161))

(declare-fun m!1428163 () Bool)

(assert (=> b!1549614 m!1428163))

(assert (=> b!1549598 m!1428151))

(assert (=> b!1549598 m!1428151))

(declare-fun m!1428165 () Bool)

(assert (=> b!1549598 m!1428165))

(declare-fun m!1428167 () Bool)

(assert (=> start!132086 m!1428167))

(declare-fun m!1428169 () Bool)

(assert (=> start!132086 m!1428169))

(declare-fun m!1428171 () Bool)

(assert (=> start!132086 m!1428171))

(declare-fun m!1428173 () Bool)

(assert (=> b!1549597 m!1428173))

(declare-fun m!1428175 () Bool)

(assert (=> mapNonEmpty!58891 m!1428175))

(declare-fun m!1428177 () Bool)

(assert (=> b!1549603 m!1428177))

(declare-fun m!1428179 () Bool)

(assert (=> b!1549607 m!1428179))

(declare-fun m!1428181 () Bool)

(assert (=> bm!70563 m!1428181))

(declare-fun m!1428183 () Bool)

(assert (=> bm!70564 m!1428183))

(assert (=> b!1549604 m!1428181))

(assert (=> b!1549604 m!1428151))

(assert (=> b!1549604 m!1428151))

(declare-fun m!1428185 () Bool)

(assert (=> b!1549604 m!1428185))

(assert (=> b!1549604 m!1428151))

(declare-fun m!1428187 () Bool)

(assert (=> b!1549604 m!1428187))

(assert (=> b!1549604 m!1428151))

(declare-fun m!1428189 () Bool)

(assert (=> b!1549604 m!1428189))

(assert (=> b!1549604 m!1428151))

(declare-fun m!1428191 () Bool)

(assert (=> b!1549604 m!1428191))

(declare-fun m!1428193 () Bool)

(assert (=> b!1549604 m!1428193))

(assert (=> b!1549604 m!1428151))

(declare-fun m!1428195 () Bool)

(assert (=> b!1549604 m!1428195))

(assert (=> b!1549604 m!1428193))

(assert (=> b!1549604 m!1428151))

(declare-fun m!1428197 () Bool)

(assert (=> b!1549604 m!1428197))

(assert (=> b!1549604 m!1428151))

(declare-fun m!1428199 () Bool)

(assert (=> b!1549604 m!1428199))

(declare-fun m!1428201 () Bool)

(assert (=> b!1549604 m!1428201))

(check-sat (not b!1549598) b_and!51249 (not b!1549597) (not start!132086) tp_is_empty!38125 (not b_lambda!24739) (not b!1549604) (not b!1549607) (not b!1549603) (not b!1549614) (not mapNonEmpty!58891) (not bm!70564) (not bm!70563) (not bm!70559) (not b!1549606) (not b!1549591) (not b_next!31849) (not b!1549611))
(check-sat b_and!51249 (not b_next!31849))
