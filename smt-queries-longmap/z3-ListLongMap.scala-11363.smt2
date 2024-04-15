; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132032 () Bool)

(assert start!132032)

(declare-fun b_free!31795 () Bool)

(declare-fun b_next!31795 () Bool)

(assert (=> start!132032 (= b_free!31795 (not b_next!31795))))

(declare-fun tp!111637 () Bool)

(declare-fun b_and!51187 () Bool)

(assert (=> start!132032 (= tp!111637 b_and!51187)))

(declare-datatypes ((array!103268 0))(
  ( (array!103269 (arr!49837 (Array (_ BitVec 32) (_ BitVec 64))) (size!50389 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103268)

(declare-datatypes ((V!59205 0))(
  ( (V!59206 (val!19113 Int)) )
))
(declare-fun zeroValue!436 () V!59205)

(declare-fun bm!70152 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18125 0))(
  ( (ValueCellFull!18125 (v!21910 V!59205)) (EmptyCell!18125) )
))
(declare-datatypes ((array!103270 0))(
  ( (array!103271 (arr!49838 (Array (_ BitVec 32) ValueCell!18125)) (size!50390 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103270)

(declare-fun minValue!436 () V!59205)

(declare-datatypes ((tuple2!24680 0))(
  ( (tuple2!24681 (_1!12351 (_ BitVec 64)) (_2!12351 V!59205)) )
))
(declare-datatypes ((List!36144 0))(
  ( (Nil!36141) (Cons!36140 (h!37586 tuple2!24680) (t!50830 List!36144)) )
))
(declare-datatypes ((ListLongMap!22289 0))(
  ( (ListLongMap!22290 (toList!11160 List!36144)) )
))
(declare-fun call!70159 () ListLongMap!22289)

(declare-fun getCurrentListMapNoExtraKeys!6610 (array!103268 array!103270 (_ BitVec 32) (_ BitVec 32) V!59205 V!59205 (_ BitVec 32) Int) ListLongMap!22289)

(assert (=> bm!70152 (= call!70159 (getCurrentListMapNoExtraKeys!6610 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548208 () Bool)

(declare-fun e!861762 () ListLongMap!22289)

(declare-fun call!70158 () ListLongMap!22289)

(assert (=> b!1548208 (= e!861762 call!70158)))

(declare-fun mapIsEmpty!58810 () Bool)

(declare-fun mapRes!58810 () Bool)

(assert (=> mapIsEmpty!58810 mapRes!58810))

(declare-fun b!1548209 () Bool)

(declare-fun e!861757 () Bool)

(assert (=> b!1548209 (= e!861757 (not true))))

(declare-fun lt!667059 () ListLongMap!22289)

(declare-fun lt!667054 () V!59205)

(declare-fun apply!1063 (ListLongMap!22289 (_ BitVec 64)) V!59205)

(assert (=> b!1548209 (= (apply!1063 lt!667059 (select (arr!49837 _keys!618) from!762)) lt!667054)))

(declare-fun lt!667055 () ListLongMap!22289)

(declare-datatypes ((Unit!51423 0))(
  ( (Unit!51424) )
))
(declare-fun lt!667053 () Unit!51423)

(declare-fun addApplyDifferent!601 (ListLongMap!22289 (_ BitVec 64) V!59205 (_ BitVec 64)) Unit!51423)

(assert (=> b!1548209 (= lt!667053 (addApplyDifferent!601 lt!667055 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49837 _keys!618) from!762)))))

(declare-fun lt!667052 () V!59205)

(assert (=> b!1548209 (= lt!667052 lt!667054)))

(assert (=> b!1548209 (= lt!667054 (apply!1063 lt!667055 (select (arr!49837 _keys!618) from!762)))))

(declare-fun +!4983 (ListLongMap!22289 tuple2!24680) ListLongMap!22289)

(assert (=> b!1548209 (= lt!667052 (apply!1063 (+!4983 lt!667055 (tuple2!24681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49837 _keys!618) from!762)))))

(declare-fun lt!667057 () Unit!51423)

(assert (=> b!1548209 (= lt!667057 (addApplyDifferent!601 lt!667055 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49837 _keys!618) from!762)))))

(declare-fun contains!10038 (ListLongMap!22289 (_ BitVec 64)) Bool)

(assert (=> b!1548209 (contains!10038 lt!667059 (select (arr!49837 _keys!618) from!762))))

(assert (=> b!1548209 (= lt!667059 (+!4983 lt!667055 (tuple2!24681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667058 () Unit!51423)

(declare-fun addStillContains!1261 (ListLongMap!22289 (_ BitVec 64) V!59205 (_ BitVec 64)) Unit!51423)

(assert (=> b!1548209 (= lt!667058 (addStillContains!1261 lt!667055 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49837 _keys!618) from!762)))))

(assert (=> b!1548209 (= lt!667055 (getCurrentListMapNoExtraKeys!6610 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548210 () Bool)

(declare-fun e!861759 () ListLongMap!22289)

(declare-fun e!861764 () ListLongMap!22289)

(assert (=> b!1548210 (= e!861759 e!861764)))

(declare-fun c!142117 () Bool)

(declare-fun lt!667060 () Bool)

(assert (=> b!1548210 (= c!142117 (and (not lt!667060) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548211 () Bool)

(assert (=> b!1548211 (= e!861764 call!70158)))

(declare-fun call!70157 () ListLongMap!22289)

(declare-fun bm!70153 () Bool)

(declare-fun call!70155 () ListLongMap!22289)

(declare-fun call!70156 () ListLongMap!22289)

(declare-fun c!142119 () Bool)

(assert (=> bm!70153 (= call!70156 (+!4983 (ite c!142119 call!70159 (ite c!142117 call!70155 call!70157)) (ite (or c!142119 c!142117) (tuple2!24681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70154 () Bool)

(assert (=> bm!70154 (= call!70157 call!70155)))

(declare-fun b!1548212 () Bool)

(declare-fun res!1061028 () Bool)

(declare-fun e!861760 () Bool)

(assert (=> b!1548212 (=> (not res!1061028) (not e!861760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103268 (_ BitVec 32)) Bool)

(assert (=> b!1548212 (= res!1061028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58810 () Bool)

(declare-fun tp!111638 () Bool)

(declare-fun e!861761 () Bool)

(assert (=> mapNonEmpty!58810 (= mapRes!58810 (and tp!111638 e!861761))))

(declare-fun mapKey!58810 () (_ BitVec 32))

(declare-fun mapValue!58810 () ValueCell!18125)

(declare-fun mapRest!58810 () (Array (_ BitVec 32) ValueCell!18125))

(assert (=> mapNonEmpty!58810 (= (arr!49838 _values!470) (store mapRest!58810 mapKey!58810 mapValue!58810))))

(declare-fun b!1548214 () Bool)

(declare-fun e!861763 () Bool)

(declare-fun tp_is_empty!38071 () Bool)

(assert (=> b!1548214 (= e!861763 tp_is_empty!38071)))

(declare-fun bm!70155 () Bool)

(assert (=> bm!70155 (= call!70155 call!70159)))

(declare-fun b!1548215 () Bool)

(declare-fun e!861765 () Bool)

(assert (=> b!1548215 (= e!861765 (and e!861763 mapRes!58810))))

(declare-fun condMapEmpty!58810 () Bool)

(declare-fun mapDefault!58810 () ValueCell!18125)

(assert (=> b!1548215 (= condMapEmpty!58810 (= (arr!49838 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18125)) mapDefault!58810)))))

(declare-fun bm!70156 () Bool)

(assert (=> bm!70156 (= call!70158 call!70156)))

(declare-fun b!1548216 () Bool)

(declare-fun res!1061031 () Bool)

(assert (=> b!1548216 (=> (not res!1061031) (not e!861757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548216 (= res!1061031 (validKeyInArray!0 (select (arr!49837 _keys!618) from!762)))))

(declare-fun b!1548217 () Bool)

(declare-fun res!1061025 () Bool)

(assert (=> b!1548217 (=> (not res!1061025) (not e!861760))))

(assert (=> b!1548217 (= res!1061025 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50389 _keys!618))))))

(declare-fun b!1548218 () Bool)

(declare-fun res!1061030 () Bool)

(assert (=> b!1548218 (=> (not res!1061030) (not e!861760))))

(declare-datatypes ((List!36145 0))(
  ( (Nil!36142) (Cons!36141 (h!37587 (_ BitVec 64)) (t!50831 List!36145)) )
))
(declare-fun arrayNoDuplicates!0 (array!103268 (_ BitVec 32) List!36145) Bool)

(assert (=> b!1548218 (= res!1061030 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36142))))

(declare-fun b!1548219 () Bool)

(assert (=> b!1548219 (= e!861759 (+!4983 call!70156 (tuple2!24681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548220 () Bool)

(declare-fun res!1061026 () Bool)

(assert (=> b!1548220 (=> (not res!1061026) (not e!861760))))

(assert (=> b!1548220 (= res!1061026 (and (= (size!50390 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50389 _keys!618) (size!50390 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548221 () Bool)

(declare-fun c!142118 () Bool)

(assert (=> b!1548221 (= c!142118 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667060))))

(assert (=> b!1548221 (= e!861764 e!861762)))

(declare-fun res!1061029 () Bool)

(assert (=> start!132032 (=> (not res!1061029) (not e!861760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132032 (= res!1061029 (validMask!0 mask!926))))

(assert (=> start!132032 e!861760))

(declare-fun array_inv!38959 (array!103268) Bool)

(assert (=> start!132032 (array_inv!38959 _keys!618)))

(assert (=> start!132032 tp_is_empty!38071))

(assert (=> start!132032 true))

(assert (=> start!132032 tp!111637))

(declare-fun array_inv!38960 (array!103270) Bool)

(assert (=> start!132032 (and (array_inv!38960 _values!470) e!861765)))

(declare-fun b!1548213 () Bool)

(assert (=> b!1548213 (= e!861761 tp_is_empty!38071)))

(declare-fun b!1548222 () Bool)

(assert (=> b!1548222 (= e!861760 e!861757)))

(declare-fun res!1061027 () Bool)

(assert (=> b!1548222 (=> (not res!1061027) (not e!861757))))

(assert (=> b!1548222 (= res!1061027 (bvslt from!762 (size!50389 _keys!618)))))

(declare-fun lt!667056 () ListLongMap!22289)

(assert (=> b!1548222 (= lt!667056 e!861759)))

(assert (=> b!1548222 (= c!142119 (and (not lt!667060) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548222 (= lt!667060 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548223 () Bool)

(assert (=> b!1548223 (= e!861762 call!70157)))

(assert (= (and start!132032 res!1061029) b!1548220))

(assert (= (and b!1548220 res!1061026) b!1548212))

(assert (= (and b!1548212 res!1061028) b!1548218))

(assert (= (and b!1548218 res!1061030) b!1548217))

(assert (= (and b!1548217 res!1061025) b!1548222))

(assert (= (and b!1548222 c!142119) b!1548219))

(assert (= (and b!1548222 (not c!142119)) b!1548210))

(assert (= (and b!1548210 c!142117) b!1548211))

(assert (= (and b!1548210 (not c!142117)) b!1548221))

(assert (= (and b!1548221 c!142118) b!1548208))

(assert (= (and b!1548221 (not c!142118)) b!1548223))

(assert (= (or b!1548208 b!1548223) bm!70154))

(assert (= (or b!1548211 bm!70154) bm!70155))

(assert (= (or b!1548211 b!1548208) bm!70156))

(assert (= (or b!1548219 bm!70155) bm!70152))

(assert (= (or b!1548219 bm!70156) bm!70153))

(assert (= (and b!1548222 res!1061027) b!1548216))

(assert (= (and b!1548216 res!1061031) b!1548209))

(assert (= (and b!1548215 condMapEmpty!58810) mapIsEmpty!58810))

(assert (= (and b!1548215 (not condMapEmpty!58810)) mapNonEmpty!58810))

(get-info :version)

(assert (= (and mapNonEmpty!58810 ((_ is ValueCellFull!18125) mapValue!58810)) b!1548213))

(assert (= (and b!1548215 ((_ is ValueCellFull!18125) mapDefault!58810)) b!1548214))

(assert (= start!132032 b!1548215))

(declare-fun m!1427019 () Bool)

(assert (=> b!1548218 m!1427019))

(declare-fun m!1427021 () Bool)

(assert (=> bm!70152 m!1427021))

(declare-fun m!1427023 () Bool)

(assert (=> b!1548219 m!1427023))

(declare-fun m!1427025 () Bool)

(assert (=> start!132032 m!1427025))

(declare-fun m!1427027 () Bool)

(assert (=> start!132032 m!1427027))

(declare-fun m!1427029 () Bool)

(assert (=> start!132032 m!1427029))

(declare-fun m!1427031 () Bool)

(assert (=> b!1548216 m!1427031))

(assert (=> b!1548216 m!1427031))

(declare-fun m!1427033 () Bool)

(assert (=> b!1548216 m!1427033))

(declare-fun m!1427035 () Bool)

(assert (=> bm!70153 m!1427035))

(declare-fun m!1427037 () Bool)

(assert (=> mapNonEmpty!58810 m!1427037))

(assert (=> b!1548209 m!1427031))

(declare-fun m!1427039 () Bool)

(assert (=> b!1548209 m!1427039))

(assert (=> b!1548209 m!1427021))

(assert (=> b!1548209 m!1427031))

(declare-fun m!1427041 () Bool)

(assert (=> b!1548209 m!1427041))

(assert (=> b!1548209 m!1427031))

(declare-fun m!1427043 () Bool)

(assert (=> b!1548209 m!1427043))

(assert (=> b!1548209 m!1427031))

(declare-fun m!1427045 () Bool)

(assert (=> b!1548209 m!1427045))

(declare-fun m!1427047 () Bool)

(assert (=> b!1548209 m!1427047))

(assert (=> b!1548209 m!1427031))

(declare-fun m!1427049 () Bool)

(assert (=> b!1548209 m!1427049))

(assert (=> b!1548209 m!1427031))

(declare-fun m!1427051 () Bool)

(assert (=> b!1548209 m!1427051))

(assert (=> b!1548209 m!1427031))

(declare-fun m!1427053 () Bool)

(assert (=> b!1548209 m!1427053))

(assert (=> b!1548209 m!1427049))

(assert (=> b!1548209 m!1427031))

(declare-fun m!1427055 () Bool)

(assert (=> b!1548209 m!1427055))

(declare-fun m!1427057 () Bool)

(assert (=> b!1548212 m!1427057))

(check-sat (not start!132032) tp_is_empty!38071 (not b!1548216) (not b!1548209) (not b!1548218) (not bm!70153) (not bm!70152) (not b!1548219) (not mapNonEmpty!58810) (not b!1548212) b_and!51187 (not b_next!31795))
(check-sat b_and!51187 (not b_next!31795))
