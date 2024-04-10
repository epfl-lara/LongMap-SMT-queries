; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132078 () Bool)

(assert start!132078)

(declare-fun b_free!31791 () Bool)

(declare-fun b_next!31791 () Bool)

(assert (=> start!132078 (= b_free!31791 (not b_next!31791))))

(declare-fun tp!111625 () Bool)

(declare-fun b_and!51201 () Bool)

(assert (=> start!132078 (= tp!111625 b_and!51201)))

(declare-fun b!1548425 () Bool)

(declare-datatypes ((V!59199 0))(
  ( (V!59200 (val!19111 Int)) )
))
(declare-datatypes ((tuple2!24600 0))(
  ( (tuple2!24601 (_1!12311 (_ BitVec 64)) (_2!12311 V!59199)) )
))
(declare-datatypes ((List!36091 0))(
  ( (Nil!36088) (Cons!36087 (h!37532 tuple2!24600) (t!50785 List!36091)) )
))
(declare-datatypes ((ListLongMap!22209 0))(
  ( (ListLongMap!22210 (toList!11120 List!36091)) )
))
(declare-fun e!861903 () ListLongMap!22209)

(declare-fun call!70161 () ListLongMap!22209)

(assert (=> b!1548425 (= e!861903 call!70161)))

(declare-fun b!1548426 () Bool)

(declare-fun e!861907 () Bool)

(declare-fun e!861908 () Bool)

(assert (=> b!1548426 (= e!861907 e!861908)))

(declare-fun res!1061118 () Bool)

(assert (=> b!1548426 (=> (not res!1061118) (not e!861908))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103334 0))(
  ( (array!103335 (arr!49869 (Array (_ BitVec 32) (_ BitVec 64))) (size!50419 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103334)

(assert (=> b!1548426 (= res!1061118 (bvslt from!762 (size!50419 _keys!618)))))

(declare-fun lt!667289 () ListLongMap!22209)

(declare-fun e!861904 () ListLongMap!22209)

(assert (=> b!1548426 (= lt!667289 e!861904)))

(declare-fun c!142190 () Bool)

(declare-fun lt!667288 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1548426 (= c!142190 (and (not lt!667288) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548426 (= lt!667288 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!1061113 () Bool)

(assert (=> start!132078 (=> (not res!1061113) (not e!861907))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132078 (= res!1061113 (validMask!0 mask!926))))

(assert (=> start!132078 e!861907))

(declare-fun array_inv!38775 (array!103334) Bool)

(assert (=> start!132078 (array_inv!38775 _keys!618)))

(declare-fun tp_is_empty!38067 () Bool)

(assert (=> start!132078 tp_is_empty!38067))

(assert (=> start!132078 true))

(assert (=> start!132078 tp!111625))

(declare-datatypes ((ValueCell!18123 0))(
  ( (ValueCellFull!18123 (v!21912 V!59199)) (EmptyCell!18123) )
))
(declare-datatypes ((array!103336 0))(
  ( (array!103337 (arr!49870 (Array (_ BitVec 32) ValueCell!18123)) (size!50420 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103336)

(declare-fun e!861905 () Bool)

(declare-fun array_inv!38776 (array!103336) Bool)

(assert (=> start!132078 (and (array_inv!38776 _values!470) e!861905)))

(declare-fun b!1548427 () Bool)

(declare-fun call!70163 () ListLongMap!22209)

(assert (=> b!1548427 (= e!861903 call!70163)))

(declare-fun b!1548428 () Bool)

(declare-fun res!1061112 () Bool)

(assert (=> b!1548428 (=> (not res!1061112) (not e!861907))))

(assert (=> b!1548428 (= res!1061112 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50419 _keys!618))))))

(declare-fun b!1548429 () Bool)

(declare-fun e!861909 () Bool)

(assert (=> b!1548429 (= e!861909 tp_is_empty!38067)))

(declare-fun b!1548430 () Bool)

(declare-fun res!1061117 () Bool)

(assert (=> b!1548430 (=> (not res!1061117) (not e!861908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548430 (= res!1061117 (validKeyInArray!0 (select (arr!49869 _keys!618) from!762)))))

(declare-fun b!1548431 () Bool)

(declare-fun res!1061114 () Bool)

(assert (=> b!1548431 (=> (not res!1061114) (not e!861907))))

(declare-datatypes ((List!36092 0))(
  ( (Nil!36089) (Cons!36088 (h!37533 (_ BitVec 64)) (t!50786 List!36092)) )
))
(declare-fun arrayNoDuplicates!0 (array!103334 (_ BitVec 32) List!36092) Bool)

(assert (=> b!1548431 (= res!1061114 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36089))))

(declare-fun mapIsEmpty!58804 () Bool)

(declare-fun mapRes!58804 () Bool)

(assert (=> mapIsEmpty!58804 mapRes!58804))

(declare-fun bm!70157 () Bool)

(declare-fun call!70160 () ListLongMap!22209)

(declare-fun zeroValue!436 () V!59199)

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!59199)

(declare-fun getCurrentListMapNoExtraKeys!6577 (array!103334 array!103336 (_ BitVec 32) (_ BitVec 32) V!59199 V!59199 (_ BitVec 32) Int) ListLongMap!22209)

(assert (=> bm!70157 (= call!70160 (getCurrentListMapNoExtraKeys!6577 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70158 () Bool)

(declare-fun call!70162 () ListLongMap!22209)

(assert (=> bm!70158 (= call!70162 call!70160)))

(declare-fun call!70164 () ListLongMap!22209)

(declare-fun bm!70159 () Bool)

(declare-fun c!142188 () Bool)

(declare-fun +!4950 (ListLongMap!22209 tuple2!24600) ListLongMap!22209)

(assert (=> bm!70159 (= call!70164 (+!4950 (ite c!142190 call!70160 (ite c!142188 call!70162 call!70161)) (ite (or c!142190 c!142188) (tuple2!24601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548432 () Bool)

(declare-fun e!861906 () ListLongMap!22209)

(assert (=> b!1548432 (= e!861906 call!70163)))

(declare-fun b!1548433 () Bool)

(assert (=> b!1548433 (= e!861905 (and e!861909 mapRes!58804))))

(declare-fun condMapEmpty!58804 () Bool)

(declare-fun mapDefault!58804 () ValueCell!18123)

(assert (=> b!1548433 (= condMapEmpty!58804 (= (arr!49870 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18123)) mapDefault!58804)))))

(declare-fun bm!70160 () Bool)

(assert (=> bm!70160 (= call!70163 call!70164)))

(declare-fun b!1548434 () Bool)

(assert (=> b!1548434 (= e!861904 e!861906)))

(assert (=> b!1548434 (= c!142188 (and (not lt!667288) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58804 () Bool)

(declare-fun tp!111624 () Bool)

(declare-fun e!861901 () Bool)

(assert (=> mapNonEmpty!58804 (= mapRes!58804 (and tp!111624 e!861901))))

(declare-fun mapRest!58804 () (Array (_ BitVec 32) ValueCell!18123))

(declare-fun mapValue!58804 () ValueCell!18123)

(declare-fun mapKey!58804 () (_ BitVec 32))

(assert (=> mapNonEmpty!58804 (= (arr!49870 _values!470) (store mapRest!58804 mapKey!58804 mapValue!58804))))

(declare-fun b!1548435 () Bool)

(assert (=> b!1548435 (= e!861908 (not true))))

(declare-fun lt!667285 () V!59199)

(declare-fun lt!667286 () ListLongMap!22209)

(declare-fun apply!1068 (ListLongMap!22209 (_ BitVec 64)) V!59199)

(assert (=> b!1548435 (= (apply!1068 lt!667286 (select (arr!49869 _keys!618) from!762)) lt!667285)))

(declare-fun lt!667291 () ListLongMap!22209)

(declare-datatypes ((Unit!51586 0))(
  ( (Unit!51587) )
))
(declare-fun lt!667287 () Unit!51586)

(declare-fun addApplyDifferent!610 (ListLongMap!22209 (_ BitVec 64) V!59199 (_ BitVec 64)) Unit!51586)

(assert (=> b!1548435 (= lt!667287 (addApplyDifferent!610 lt!667291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49869 _keys!618) from!762)))))

(declare-fun lt!667290 () V!59199)

(assert (=> b!1548435 (= lt!667290 lt!667285)))

(assert (=> b!1548435 (= lt!667285 (apply!1068 lt!667291 (select (arr!49869 _keys!618) from!762)))))

(assert (=> b!1548435 (= lt!667290 (apply!1068 (+!4950 lt!667291 (tuple2!24601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49869 _keys!618) from!762)))))

(declare-fun lt!667284 () Unit!51586)

(assert (=> b!1548435 (= lt!667284 (addApplyDifferent!610 lt!667291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49869 _keys!618) from!762)))))

(declare-fun contains!10075 (ListLongMap!22209 (_ BitVec 64)) Bool)

(assert (=> b!1548435 (contains!10075 lt!667286 (select (arr!49869 _keys!618) from!762))))

(assert (=> b!1548435 (= lt!667286 (+!4950 lt!667291 (tuple2!24601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667292 () Unit!51586)

(declare-fun addStillContains!1263 (ListLongMap!22209 (_ BitVec 64) V!59199 (_ BitVec 64)) Unit!51586)

(assert (=> b!1548435 (= lt!667292 (addStillContains!1263 lt!667291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49869 _keys!618) from!762)))))

(assert (=> b!1548435 (= lt!667291 (getCurrentListMapNoExtraKeys!6577 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548436 () Bool)

(assert (=> b!1548436 (= e!861901 tp_is_empty!38067)))

(declare-fun b!1548437 () Bool)

(declare-fun res!1061116 () Bool)

(assert (=> b!1548437 (=> (not res!1061116) (not e!861907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103334 (_ BitVec 32)) Bool)

(assert (=> b!1548437 (= res!1061116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548438 () Bool)

(declare-fun res!1061115 () Bool)

(assert (=> b!1548438 (=> (not res!1061115) (not e!861907))))

(assert (=> b!1548438 (= res!1061115 (and (= (size!50420 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50419 _keys!618) (size!50420 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70161 () Bool)

(assert (=> bm!70161 (= call!70161 call!70162)))

(declare-fun b!1548439 () Bool)

(assert (=> b!1548439 (= e!861904 (+!4950 call!70164 (tuple2!24601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548440 () Bool)

(declare-fun c!142189 () Bool)

(assert (=> b!1548440 (= c!142189 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667288))))

(assert (=> b!1548440 (= e!861906 e!861903)))

(assert (= (and start!132078 res!1061113) b!1548438))

(assert (= (and b!1548438 res!1061115) b!1548437))

(assert (= (and b!1548437 res!1061116) b!1548431))

(assert (= (and b!1548431 res!1061114) b!1548428))

(assert (= (and b!1548428 res!1061112) b!1548426))

(assert (= (and b!1548426 c!142190) b!1548439))

(assert (= (and b!1548426 (not c!142190)) b!1548434))

(assert (= (and b!1548434 c!142188) b!1548432))

(assert (= (and b!1548434 (not c!142188)) b!1548440))

(assert (= (and b!1548440 c!142189) b!1548427))

(assert (= (and b!1548440 (not c!142189)) b!1548425))

(assert (= (or b!1548427 b!1548425) bm!70161))

(assert (= (or b!1548432 bm!70161) bm!70158))

(assert (= (or b!1548432 b!1548427) bm!70160))

(assert (= (or b!1548439 bm!70158) bm!70157))

(assert (= (or b!1548439 bm!70160) bm!70159))

(assert (= (and b!1548426 res!1061118) b!1548430))

(assert (= (and b!1548430 res!1061117) b!1548435))

(assert (= (and b!1548433 condMapEmpty!58804) mapIsEmpty!58804))

(assert (= (and b!1548433 (not condMapEmpty!58804)) mapNonEmpty!58804))

(get-info :version)

(assert (= (and mapNonEmpty!58804 ((_ is ValueCellFull!18123) mapValue!58804)) b!1548436))

(assert (= (and b!1548433 ((_ is ValueCellFull!18123) mapDefault!58804)) b!1548429))

(assert (= start!132078 b!1548433))

(declare-fun m!1427831 () Bool)

(assert (=> b!1548430 m!1427831))

(assert (=> b!1548430 m!1427831))

(declare-fun m!1427833 () Bool)

(assert (=> b!1548430 m!1427833))

(declare-fun m!1427835 () Bool)

(assert (=> mapNonEmpty!58804 m!1427835))

(declare-fun m!1427837 () Bool)

(assert (=> b!1548431 m!1427837))

(declare-fun m!1427839 () Bool)

(assert (=> bm!70157 m!1427839))

(declare-fun m!1427841 () Bool)

(assert (=> bm!70159 m!1427841))

(assert (=> b!1548435 m!1427831))

(declare-fun m!1427843 () Bool)

(assert (=> b!1548435 m!1427843))

(assert (=> b!1548435 m!1427839))

(assert (=> b!1548435 m!1427831))

(declare-fun m!1427845 () Bool)

(assert (=> b!1548435 m!1427845))

(declare-fun m!1427847 () Bool)

(assert (=> b!1548435 m!1427847))

(assert (=> b!1548435 m!1427831))

(declare-fun m!1427849 () Bool)

(assert (=> b!1548435 m!1427849))

(assert (=> b!1548435 m!1427831))

(declare-fun m!1427851 () Bool)

(assert (=> b!1548435 m!1427851))

(assert (=> b!1548435 m!1427847))

(assert (=> b!1548435 m!1427831))

(declare-fun m!1427853 () Bool)

(assert (=> b!1548435 m!1427853))

(assert (=> b!1548435 m!1427831))

(declare-fun m!1427855 () Bool)

(assert (=> b!1548435 m!1427855))

(assert (=> b!1548435 m!1427831))

(declare-fun m!1427857 () Bool)

(assert (=> b!1548435 m!1427857))

(assert (=> b!1548435 m!1427831))

(declare-fun m!1427859 () Bool)

(assert (=> b!1548435 m!1427859))

(declare-fun m!1427861 () Bool)

(assert (=> b!1548439 m!1427861))

(declare-fun m!1427863 () Bool)

(assert (=> start!132078 m!1427863))

(declare-fun m!1427865 () Bool)

(assert (=> start!132078 m!1427865))

(declare-fun m!1427867 () Bool)

(assert (=> start!132078 m!1427867))

(declare-fun m!1427869 () Bool)

(assert (=> b!1548437 m!1427869))

(check-sat (not b!1548430) (not bm!70159) (not b_next!31791) (not b!1548431) (not b!1548439) (not b!1548435) (not b!1548437) (not start!132078) (not mapNonEmpty!58804) b_and!51201 (not bm!70157) tp_is_empty!38067)
(check-sat b_and!51201 (not b_next!31791))
