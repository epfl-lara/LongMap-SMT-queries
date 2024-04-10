; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132084 () Bool)

(assert start!132084)

(declare-fun b_free!31797 () Bool)

(declare-fun b_next!31797 () Bool)

(assert (=> start!132084 (= b_free!31797 (not b_next!31797))))

(declare-fun tp!111643 () Bool)

(declare-fun b_and!51207 () Bool)

(assert (=> start!132084 (= tp!111643 b_and!51207)))

(declare-fun b!1548569 () Bool)

(declare-datatypes ((V!59207 0))(
  ( (V!59208 (val!19114 Int)) )
))
(declare-datatypes ((tuple2!24606 0))(
  ( (tuple2!24607 (_1!12314 (_ BitVec 64)) (_2!12314 V!59207)) )
))
(declare-datatypes ((List!36097 0))(
  ( (Nil!36094) (Cons!36093 (h!37538 tuple2!24606) (t!50791 List!36097)) )
))
(declare-datatypes ((ListLongMap!22215 0))(
  ( (ListLongMap!22216 (toList!11123 List!36097)) )
))
(declare-fun e!861984 () ListLongMap!22215)

(declare-fun call!70207 () ListLongMap!22215)

(assert (=> b!1548569 (= e!861984 call!70207)))

(declare-fun b!1548570 () Bool)

(declare-fun res!1061176 () Bool)

(declare-fun e!861983 () Bool)

(assert (=> b!1548570 (=> (not res!1061176) (not e!861983))))

(declare-datatypes ((array!103346 0))(
  ( (array!103347 (arr!49875 (Array (_ BitVec 32) (_ BitVec 64))) (size!50425 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103346)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548570 (= res!1061176 (validKeyInArray!0 (select (arr!49875 _keys!618) from!762)))))

(declare-fun b!1548571 () Bool)

(declare-fun e!861986 () ListLongMap!22215)

(declare-fun call!70205 () ListLongMap!22215)

(assert (=> b!1548571 (= e!861986 call!70205)))

(declare-fun call!70208 () ListLongMap!22215)

(declare-fun zeroValue!436 () V!59207)

(declare-fun bm!70202 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18126 0))(
  ( (ValueCellFull!18126 (v!21915 V!59207)) (EmptyCell!18126) )
))
(declare-datatypes ((array!103348 0))(
  ( (array!103349 (arr!49876 (Array (_ BitVec 32) ValueCell!18126)) (size!50426 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103348)

(declare-fun minValue!436 () V!59207)

(declare-fun getCurrentListMapNoExtraKeys!6579 (array!103346 array!103348 (_ BitVec 32) (_ BitVec 32) V!59207 V!59207 (_ BitVec 32) Int) ListLongMap!22215)

(assert (=> bm!70202 (= call!70208 (getCurrentListMapNoExtraKeys!6579 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548572 () Bool)

(declare-fun e!861987 () Bool)

(declare-fun tp_is_empty!38073 () Bool)

(assert (=> b!1548572 (= e!861987 tp_is_empty!38073)))

(declare-fun b!1548573 () Bool)

(declare-fun e!861985 () ListLongMap!22215)

(declare-fun call!70209 () ListLongMap!22215)

(declare-fun +!4953 (ListLongMap!22215 tuple2!24606) ListLongMap!22215)

(assert (=> b!1548573 (= e!861985 (+!4953 call!70209 (tuple2!24607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548574 () Bool)

(declare-fun res!1061181 () Bool)

(declare-fun e!861990 () Bool)

(assert (=> b!1548574 (=> (not res!1061181) (not e!861990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103346 (_ BitVec 32)) Bool)

(assert (=> b!1548574 (= res!1061181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70203 () Bool)

(declare-fun call!70206 () ListLongMap!22215)

(assert (=> bm!70203 (= call!70206 call!70208)))

(declare-fun b!1548575 () Bool)

(declare-fun c!142217 () Bool)

(declare-fun lt!667371 () Bool)

(assert (=> b!1548575 (= c!142217 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667371))))

(assert (=> b!1548575 (= e!861986 e!861984)))

(declare-fun b!1548576 () Bool)

(assert (=> b!1548576 (= e!861984 call!70205)))

(declare-fun res!1061179 () Bool)

(assert (=> start!132084 (=> (not res!1061179) (not e!861990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132084 (= res!1061179 (validMask!0 mask!926))))

(assert (=> start!132084 e!861990))

(declare-fun array_inv!38779 (array!103346) Bool)

(assert (=> start!132084 (array_inv!38779 _keys!618)))

(assert (=> start!132084 tp_is_empty!38073))

(assert (=> start!132084 true))

(assert (=> start!132084 tp!111643))

(declare-fun e!861989 () Bool)

(declare-fun array_inv!38780 (array!103348) Bool)

(assert (=> start!132084 (and (array_inv!38780 _values!470) e!861989)))

(declare-fun mapIsEmpty!58813 () Bool)

(declare-fun mapRes!58813 () Bool)

(assert (=> mapIsEmpty!58813 mapRes!58813))

(declare-fun b!1548577 () Bool)

(declare-fun res!1061180 () Bool)

(assert (=> b!1548577 (=> (not res!1061180) (not e!861990))))

(assert (=> b!1548577 (= res!1061180 (and (= (size!50426 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50425 _keys!618) (size!50426 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70204 () Bool)

(declare-fun c!142216 () Bool)

(declare-fun c!142215 () Bool)

(assert (=> bm!70204 (= call!70209 (+!4953 (ite c!142216 call!70208 (ite c!142215 call!70206 call!70207)) (ite (or c!142216 c!142215) (tuple2!24607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548578 () Bool)

(assert (=> b!1548578 (= e!861985 e!861986)))

(assert (=> b!1548578 (= c!142215 (and (not lt!667371) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548579 () Bool)

(declare-fun res!1061175 () Bool)

(assert (=> b!1548579 (=> (not res!1061175) (not e!861990))))

(assert (=> b!1548579 (= res!1061175 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50425 _keys!618))))))

(declare-fun bm!70205 () Bool)

(assert (=> bm!70205 (= call!70205 call!70209)))

(declare-fun b!1548580 () Bool)

(assert (=> b!1548580 (= e!861990 e!861983)))

(declare-fun res!1061178 () Bool)

(assert (=> b!1548580 (=> (not res!1061178) (not e!861983))))

(assert (=> b!1548580 (= res!1061178 (bvslt from!762 (size!50425 _keys!618)))))

(declare-fun lt!667369 () ListLongMap!22215)

(assert (=> b!1548580 (= lt!667369 e!861985)))

(assert (=> b!1548580 (= c!142216 (and (not lt!667371) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548580 (= lt!667371 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548581 () Bool)

(assert (=> b!1548581 (= e!861983 (not true))))

(declare-fun lt!667372 () V!59207)

(declare-fun lt!667368 () ListLongMap!22215)

(declare-fun apply!1070 (ListLongMap!22215 (_ BitVec 64)) V!59207)

(assert (=> b!1548581 (= (apply!1070 lt!667368 (select (arr!49875 _keys!618) from!762)) lt!667372)))

(declare-datatypes ((Unit!51590 0))(
  ( (Unit!51591) )
))
(declare-fun lt!667366 () Unit!51590)

(declare-fun lt!667370 () ListLongMap!22215)

(declare-fun addApplyDifferent!612 (ListLongMap!22215 (_ BitVec 64) V!59207 (_ BitVec 64)) Unit!51590)

(assert (=> b!1548581 (= lt!667366 (addApplyDifferent!612 lt!667370 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49875 _keys!618) from!762)))))

(declare-fun lt!667367 () V!59207)

(assert (=> b!1548581 (= lt!667367 lt!667372)))

(assert (=> b!1548581 (= lt!667372 (apply!1070 lt!667370 (select (arr!49875 _keys!618) from!762)))))

(assert (=> b!1548581 (= lt!667367 (apply!1070 (+!4953 lt!667370 (tuple2!24607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49875 _keys!618) from!762)))))

(declare-fun lt!667373 () Unit!51590)

(assert (=> b!1548581 (= lt!667373 (addApplyDifferent!612 lt!667370 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49875 _keys!618) from!762)))))

(declare-fun contains!10077 (ListLongMap!22215 (_ BitVec 64)) Bool)

(assert (=> b!1548581 (contains!10077 lt!667368 (select (arr!49875 _keys!618) from!762))))

(assert (=> b!1548581 (= lt!667368 (+!4953 lt!667370 (tuple2!24607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667365 () Unit!51590)

(declare-fun addStillContains!1265 (ListLongMap!22215 (_ BitVec 64) V!59207 (_ BitVec 64)) Unit!51590)

(assert (=> b!1548581 (= lt!667365 (addStillContains!1265 lt!667370 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49875 _keys!618) from!762)))))

(assert (=> b!1548581 (= lt!667370 (getCurrentListMapNoExtraKeys!6579 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70206 () Bool)

(assert (=> bm!70206 (= call!70207 call!70206)))

(declare-fun b!1548582 () Bool)

(assert (=> b!1548582 (= e!861989 (and e!861987 mapRes!58813))))

(declare-fun condMapEmpty!58813 () Bool)

(declare-fun mapDefault!58813 () ValueCell!18126)

(assert (=> b!1548582 (= condMapEmpty!58813 (= (arr!49876 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18126)) mapDefault!58813)))))

(declare-fun b!1548583 () Bool)

(declare-fun res!1061177 () Bool)

(assert (=> b!1548583 (=> (not res!1061177) (not e!861990))))

(declare-datatypes ((List!36098 0))(
  ( (Nil!36095) (Cons!36094 (h!37539 (_ BitVec 64)) (t!50792 List!36098)) )
))
(declare-fun arrayNoDuplicates!0 (array!103346 (_ BitVec 32) List!36098) Bool)

(assert (=> b!1548583 (= res!1061177 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36095))))

(declare-fun mapNonEmpty!58813 () Bool)

(declare-fun tp!111642 () Bool)

(declare-fun e!861982 () Bool)

(assert (=> mapNonEmpty!58813 (= mapRes!58813 (and tp!111642 e!861982))))

(declare-fun mapKey!58813 () (_ BitVec 32))

(declare-fun mapValue!58813 () ValueCell!18126)

(declare-fun mapRest!58813 () (Array (_ BitVec 32) ValueCell!18126))

(assert (=> mapNonEmpty!58813 (= (arr!49876 _values!470) (store mapRest!58813 mapKey!58813 mapValue!58813))))

(declare-fun b!1548584 () Bool)

(assert (=> b!1548584 (= e!861982 tp_is_empty!38073)))

(assert (= (and start!132084 res!1061179) b!1548577))

(assert (= (and b!1548577 res!1061180) b!1548574))

(assert (= (and b!1548574 res!1061181) b!1548583))

(assert (= (and b!1548583 res!1061177) b!1548579))

(assert (= (and b!1548579 res!1061175) b!1548580))

(assert (= (and b!1548580 c!142216) b!1548573))

(assert (= (and b!1548580 (not c!142216)) b!1548578))

(assert (= (and b!1548578 c!142215) b!1548571))

(assert (= (and b!1548578 (not c!142215)) b!1548575))

(assert (= (and b!1548575 c!142217) b!1548576))

(assert (= (and b!1548575 (not c!142217)) b!1548569))

(assert (= (or b!1548576 b!1548569) bm!70206))

(assert (= (or b!1548571 bm!70206) bm!70203))

(assert (= (or b!1548571 b!1548576) bm!70205))

(assert (= (or b!1548573 bm!70203) bm!70202))

(assert (= (or b!1548573 bm!70205) bm!70204))

(assert (= (and b!1548580 res!1061178) b!1548570))

(assert (= (and b!1548570 res!1061176) b!1548581))

(assert (= (and b!1548582 condMapEmpty!58813) mapIsEmpty!58813))

(assert (= (and b!1548582 (not condMapEmpty!58813)) mapNonEmpty!58813))

(get-info :version)

(assert (= (and mapNonEmpty!58813 ((_ is ValueCellFull!18126) mapValue!58813)) b!1548584))

(assert (= (and b!1548582 ((_ is ValueCellFull!18126) mapDefault!58813)) b!1548572))

(assert (= start!132084 b!1548582))

(declare-fun m!1427951 () Bool)

(assert (=> b!1548583 m!1427951))

(declare-fun m!1427953 () Bool)

(assert (=> bm!70204 m!1427953))

(declare-fun m!1427955 () Bool)

(assert (=> mapNonEmpty!58813 m!1427955))

(declare-fun m!1427957 () Bool)

(assert (=> b!1548574 m!1427957))

(declare-fun m!1427959 () Bool)

(assert (=> b!1548570 m!1427959))

(assert (=> b!1548570 m!1427959))

(declare-fun m!1427961 () Bool)

(assert (=> b!1548570 m!1427961))

(declare-fun m!1427963 () Bool)

(assert (=> b!1548581 m!1427963))

(assert (=> b!1548581 m!1427959))

(declare-fun m!1427965 () Bool)

(assert (=> b!1548581 m!1427965))

(assert (=> b!1548581 m!1427959))

(declare-fun m!1427967 () Bool)

(assert (=> b!1548581 m!1427967))

(assert (=> b!1548581 m!1427959))

(declare-fun m!1427969 () Bool)

(assert (=> b!1548581 m!1427969))

(assert (=> b!1548581 m!1427959))

(declare-fun m!1427971 () Bool)

(assert (=> b!1548581 m!1427971))

(assert (=> b!1548581 m!1427959))

(declare-fun m!1427973 () Bool)

(assert (=> b!1548581 m!1427973))

(declare-fun m!1427975 () Bool)

(assert (=> b!1548581 m!1427975))

(assert (=> b!1548581 m!1427959))

(declare-fun m!1427977 () Bool)

(assert (=> b!1548581 m!1427977))

(assert (=> b!1548581 m!1427965))

(assert (=> b!1548581 m!1427959))

(declare-fun m!1427979 () Bool)

(assert (=> b!1548581 m!1427979))

(assert (=> b!1548581 m!1427959))

(declare-fun m!1427981 () Bool)

(assert (=> b!1548581 m!1427981))

(assert (=> bm!70202 m!1427963))

(declare-fun m!1427983 () Bool)

(assert (=> start!132084 m!1427983))

(declare-fun m!1427985 () Bool)

(assert (=> start!132084 m!1427985))

(declare-fun m!1427987 () Bool)

(assert (=> start!132084 m!1427987))

(declare-fun m!1427989 () Bool)

(assert (=> b!1548573 m!1427989))

(check-sat (not b!1548573) (not b!1548570) (not b!1548583) b_and!51207 tp_is_empty!38073 (not b!1548581) (not b!1548574) (not b_next!31797) (not bm!70204) (not start!132084) (not mapNonEmpty!58813) (not bm!70202))
(check-sat b_and!51207 (not b_next!31797))
