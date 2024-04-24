; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132494 () Bool)

(assert start!132494)

(declare-fun b_free!31795 () Bool)

(declare-fun b_next!31795 () Bool)

(assert (=> start!132494 (= b_free!31795 (not b_next!31795))))

(declare-fun tp!111637 () Bool)

(declare-fun b_and!51207 () Bool)

(assert (=> start!132494 (= tp!111637 b_and!51207)))

(declare-fun mapNonEmpty!58810 () Bool)

(declare-fun mapRes!58810 () Bool)

(declare-fun tp!111636 () Bool)

(declare-fun e!863466 () Bool)

(assert (=> mapNonEmpty!58810 (= mapRes!58810 (and tp!111636 e!863466))))

(declare-datatypes ((V!59205 0))(
  ( (V!59206 (val!19113 Int)) )
))
(declare-datatypes ((ValueCell!18125 0))(
  ( (ValueCellFull!18125 (v!21906 V!59205)) (EmptyCell!18125) )
))
(declare-fun mapRest!58810 () (Array (_ BitVec 32) ValueCell!18125))

(declare-fun mapValue!58810 () ValueCell!18125)

(declare-datatypes ((array!103466 0))(
  ( (array!103467 (arr!49928 (Array (_ BitVec 32) ValueCell!18125)) (size!50479 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103466)

(declare-fun mapKey!58810 () (_ BitVec 32))

(assert (=> mapNonEmpty!58810 (= (arr!49928 _values!470) (store mapRest!58810 mapKey!58810 mapValue!58810))))

(declare-fun b!1550957 () Bool)

(declare-fun e!863470 () Bool)

(assert (=> b!1550957 (= e!863470 (not true))))

(declare-fun lt!668249 () V!59205)

(declare-datatypes ((array!103468 0))(
  ( (array!103469 (arr!49929 (Array (_ BitVec 32) (_ BitVec 64))) (size!50480 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103468)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((tuple2!24664 0))(
  ( (tuple2!24665 (_1!12343 (_ BitVec 64)) (_2!12343 V!59205)) )
))
(declare-datatypes ((List!36136 0))(
  ( (Nil!36133) (Cons!36132 (h!37595 tuple2!24664) (t!50822 List!36136)) )
))
(declare-datatypes ((ListLongMap!22281 0))(
  ( (ListLongMap!22282 (toList!11156 List!36136)) )
))
(declare-fun lt!668252 () ListLongMap!22281)

(declare-fun apply!1077 (ListLongMap!22281 (_ BitVec 64)) V!59205)

(assert (=> b!1550957 (= (apply!1077 lt!668252 (select (arr!49929 _keys!618) from!762)) lt!668249)))

(declare-datatypes ((Unit!51519 0))(
  ( (Unit!51520) )
))
(declare-fun lt!668254 () Unit!51519)

(declare-fun zeroValue!436 () V!59205)

(declare-fun lt!668253 () ListLongMap!22281)

(declare-fun addApplyDifferent!606 (ListLongMap!22281 (_ BitVec 64) V!59205 (_ BitVec 64)) Unit!51519)

(assert (=> b!1550957 (= lt!668254 (addApplyDifferent!606 lt!668253 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49929 _keys!618) from!762)))))

(declare-fun lt!668250 () V!59205)

(assert (=> b!1550957 (= lt!668250 lt!668249)))

(assert (=> b!1550957 (= lt!668249 (apply!1077 lt!668253 (select (arr!49929 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59205)

(declare-fun +!4996 (ListLongMap!22281 tuple2!24664) ListLongMap!22281)

(assert (=> b!1550957 (= lt!668250 (apply!1077 (+!4996 lt!668253 (tuple2!24665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49929 _keys!618) from!762)))))

(declare-fun lt!668246 () Unit!51519)

(assert (=> b!1550957 (= lt!668246 (addApplyDifferent!606 lt!668253 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49929 _keys!618) from!762)))))

(declare-fun contains!10125 (ListLongMap!22281 (_ BitVec 64)) Bool)

(assert (=> b!1550957 (contains!10125 lt!668252 (select (arr!49929 _keys!618) from!762))))

(assert (=> b!1550957 (= lt!668252 (+!4996 lt!668253 (tuple2!24665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668251 () Unit!51519)

(declare-fun addStillContains!1267 (ListLongMap!22281 (_ BitVec 64) V!59205 (_ BitVec 64)) Unit!51519)

(assert (=> b!1550957 (= lt!668251 (addStillContains!1267 lt!668253 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49929 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6628 (array!103468 array!103466 (_ BitVec 32) (_ BitVec 32) V!59205 V!59205 (_ BitVec 32) Int) ListLongMap!22281)

(assert (=> b!1550957 (= lt!668253 (getCurrentListMapNoExtraKeys!6628 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550958 () Bool)

(declare-fun e!863467 () ListLongMap!22281)

(declare-fun call!70340 () ListLongMap!22281)

(assert (=> b!1550958 (= e!863467 call!70340)))

(declare-fun b!1550959 () Bool)

(declare-fun c!143007 () Bool)

(declare-fun lt!668247 () Bool)

(assert (=> b!1550959 (= c!143007 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668247))))

(declare-fun e!863468 () ListLongMap!22281)

(assert (=> b!1550959 (= e!863467 e!863468)))

(declare-fun res!1062018 () Bool)

(declare-fun e!863469 () Bool)

(assert (=> start!132494 (=> (not res!1062018) (not e!863469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132494 (= res!1062018 (validMask!0 mask!926))))

(assert (=> start!132494 e!863469))

(declare-fun array_inv!39085 (array!103468) Bool)

(assert (=> start!132494 (array_inv!39085 _keys!618)))

(declare-fun tp_is_empty!38071 () Bool)

(assert (=> start!132494 tp_is_empty!38071))

(assert (=> start!132494 true))

(assert (=> start!132494 tp!111637))

(declare-fun e!863471 () Bool)

(declare-fun array_inv!39086 (array!103466) Bool)

(assert (=> start!132494 (and (array_inv!39086 _values!470) e!863471)))

(declare-fun b!1550960 () Bool)

(declare-fun e!863464 () ListLongMap!22281)

(declare-fun call!70342 () ListLongMap!22281)

(assert (=> b!1550960 (= e!863464 (+!4996 call!70342 (tuple2!24665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550961 () Bool)

(assert (=> b!1550961 (= e!863468 call!70340)))

(declare-fun b!1550962 () Bool)

(assert (=> b!1550962 (= e!863466 tp_is_empty!38071)))

(declare-fun bm!70337 () Bool)

(declare-fun call!70343 () ListLongMap!22281)

(declare-fun call!70344 () ListLongMap!22281)

(assert (=> bm!70337 (= call!70343 call!70344)))

(declare-fun bm!70338 () Bool)

(declare-fun call!70341 () ListLongMap!22281)

(assert (=> bm!70338 (= call!70341 call!70343)))

(declare-fun b!1550963 () Bool)

(declare-fun res!1062016 () Bool)

(assert (=> b!1550963 (=> (not res!1062016) (not e!863469))))

(assert (=> b!1550963 (= res!1062016 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50480 _keys!618))))))

(declare-fun b!1550964 () Bool)

(declare-fun res!1062020 () Bool)

(assert (=> b!1550964 (=> (not res!1062020) (not e!863469))))

(assert (=> b!1550964 (= res!1062020 (and (= (size!50479 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50480 _keys!618) (size!50479 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550965 () Bool)

(declare-fun res!1062014 () Bool)

(assert (=> b!1550965 (=> (not res!1062014) (not e!863470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550965 (= res!1062014 (validKeyInArray!0 (select (arr!49929 _keys!618) from!762)))))

(declare-fun b!1550966 () Bool)

(declare-fun res!1062019 () Bool)

(assert (=> b!1550966 (=> (not res!1062019) (not e!863469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103468 (_ BitVec 32)) Bool)

(assert (=> b!1550966 (= res!1062019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70339 () Bool)

(assert (=> bm!70339 (= call!70340 call!70342)))

(declare-fun b!1550967 () Bool)

(declare-fun res!1062017 () Bool)

(assert (=> b!1550967 (=> (not res!1062017) (not e!863469))))

(declare-datatypes ((List!36137 0))(
  ( (Nil!36134) (Cons!36133 (h!37596 (_ BitVec 64)) (t!50823 List!36137)) )
))
(declare-fun arrayNoDuplicates!0 (array!103468 (_ BitVec 32) List!36137) Bool)

(assert (=> b!1550967 (= res!1062017 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36134))))

(declare-fun b!1550968 () Bool)

(assert (=> b!1550968 (= e!863464 e!863467)))

(declare-fun c!143008 () Bool)

(assert (=> b!1550968 (= c!143008 (and (not lt!668247) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58810 () Bool)

(assert (=> mapIsEmpty!58810 mapRes!58810))

(declare-fun b!1550969 () Bool)

(assert (=> b!1550969 (= e!863468 call!70341)))

(declare-fun bm!70340 () Bool)

(assert (=> bm!70340 (= call!70344 (getCurrentListMapNoExtraKeys!6628 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550970 () Bool)

(declare-fun e!863465 () Bool)

(assert (=> b!1550970 (= e!863471 (and e!863465 mapRes!58810))))

(declare-fun condMapEmpty!58810 () Bool)

(declare-fun mapDefault!58810 () ValueCell!18125)

(assert (=> b!1550970 (= condMapEmpty!58810 (= (arr!49928 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18125)) mapDefault!58810)))))

(declare-fun b!1550971 () Bool)

(assert (=> b!1550971 (= e!863469 e!863470)))

(declare-fun res!1062015 () Bool)

(assert (=> b!1550971 (=> (not res!1062015) (not e!863470))))

(assert (=> b!1550971 (= res!1062015 (bvslt from!762 (size!50480 _keys!618)))))

(declare-fun lt!668248 () ListLongMap!22281)

(assert (=> b!1550971 (= lt!668248 e!863464)))

(declare-fun c!143006 () Bool)

(assert (=> b!1550971 (= c!143006 (and (not lt!668247) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550971 (= lt!668247 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70341 () Bool)

(assert (=> bm!70341 (= call!70342 (+!4996 (ite c!143006 call!70344 (ite c!143008 call!70343 call!70341)) (ite (or c!143006 c!143008) (tuple2!24665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550972 () Bool)

(assert (=> b!1550972 (= e!863465 tp_is_empty!38071)))

(assert (= (and start!132494 res!1062018) b!1550964))

(assert (= (and b!1550964 res!1062020) b!1550966))

(assert (= (and b!1550966 res!1062019) b!1550967))

(assert (= (and b!1550967 res!1062017) b!1550963))

(assert (= (and b!1550963 res!1062016) b!1550971))

(assert (= (and b!1550971 c!143006) b!1550960))

(assert (= (and b!1550971 (not c!143006)) b!1550968))

(assert (= (and b!1550968 c!143008) b!1550958))

(assert (= (and b!1550968 (not c!143008)) b!1550959))

(assert (= (and b!1550959 c!143007) b!1550961))

(assert (= (and b!1550959 (not c!143007)) b!1550969))

(assert (= (or b!1550961 b!1550969) bm!70338))

(assert (= (or b!1550958 bm!70338) bm!70337))

(assert (= (or b!1550958 b!1550961) bm!70339))

(assert (= (or b!1550960 bm!70337) bm!70340))

(assert (= (or b!1550960 bm!70339) bm!70341))

(assert (= (and b!1550971 res!1062015) b!1550965))

(assert (= (and b!1550965 res!1062014) b!1550957))

(assert (= (and b!1550970 condMapEmpty!58810) mapIsEmpty!58810))

(assert (= (and b!1550970 (not condMapEmpty!58810)) mapNonEmpty!58810))

(get-info :version)

(assert (= (and mapNonEmpty!58810 ((_ is ValueCellFull!18125) mapValue!58810)) b!1550962))

(assert (= (and b!1550970 ((_ is ValueCellFull!18125) mapDefault!58810)) b!1550972))

(assert (= start!132494 b!1550970))

(declare-fun m!1430169 () Bool)

(assert (=> mapNonEmpty!58810 m!1430169))

(declare-fun m!1430171 () Bool)

(assert (=> bm!70341 m!1430171))

(declare-fun m!1430173 () Bool)

(assert (=> b!1550966 m!1430173))

(declare-fun m!1430175 () Bool)

(assert (=> start!132494 m!1430175))

(declare-fun m!1430177 () Bool)

(assert (=> start!132494 m!1430177))

(declare-fun m!1430179 () Bool)

(assert (=> start!132494 m!1430179))

(declare-fun m!1430181 () Bool)

(assert (=> b!1550965 m!1430181))

(assert (=> b!1550965 m!1430181))

(declare-fun m!1430183 () Bool)

(assert (=> b!1550965 m!1430183))

(declare-fun m!1430185 () Bool)

(assert (=> b!1550967 m!1430185))

(declare-fun m!1430187 () Bool)

(assert (=> bm!70340 m!1430187))

(declare-fun m!1430189 () Bool)

(assert (=> b!1550960 m!1430189))

(declare-fun m!1430191 () Bool)

(assert (=> b!1550957 m!1430191))

(assert (=> b!1550957 m!1430181))

(declare-fun m!1430193 () Bool)

(assert (=> b!1550957 m!1430193))

(assert (=> b!1550957 m!1430181))

(declare-fun m!1430195 () Bool)

(assert (=> b!1550957 m!1430195))

(assert (=> b!1550957 m!1430187))

(assert (=> b!1550957 m!1430181))

(declare-fun m!1430197 () Bool)

(assert (=> b!1550957 m!1430197))

(assert (=> b!1550957 m!1430181))

(declare-fun m!1430199 () Bool)

(assert (=> b!1550957 m!1430199))

(assert (=> b!1550957 m!1430181))

(declare-fun m!1430201 () Bool)

(assert (=> b!1550957 m!1430201))

(assert (=> b!1550957 m!1430181))

(declare-fun m!1430203 () Bool)

(assert (=> b!1550957 m!1430203))

(assert (=> b!1550957 m!1430191))

(assert (=> b!1550957 m!1430181))

(declare-fun m!1430205 () Bool)

(assert (=> b!1550957 m!1430205))

(assert (=> b!1550957 m!1430181))

(declare-fun m!1430207 () Bool)

(assert (=> b!1550957 m!1430207))

(check-sat (not b!1550957) (not bm!70340) (not b_next!31795) (not mapNonEmpty!58810) (not b!1550966) b_and!51207 (not start!132494) (not b!1550965) tp_is_empty!38071 (not b!1550967) (not bm!70341) (not b!1550960))
(check-sat b_and!51207 (not b_next!31795))
