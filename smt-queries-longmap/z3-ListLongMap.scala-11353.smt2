; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132434 () Bool)

(assert start!132434)

(declare-fun b_free!31735 () Bool)

(declare-fun b_next!31735 () Bool)

(assert (=> start!132434 (= b_free!31735 (not b_next!31735))))

(declare-fun tp!111456 () Bool)

(declare-fun b_and!51147 () Bool)

(assert (=> start!132434 (= tp!111456 b_and!51147)))

(declare-fun b!1549517 () Bool)

(declare-fun c!142738 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667674 () Bool)

(assert (=> b!1549517 (= c!142738 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667674))))

(declare-datatypes ((V!59125 0))(
  ( (V!59126 (val!19083 Int)) )
))
(declare-datatypes ((tuple2!24606 0))(
  ( (tuple2!24607 (_1!12314 (_ BitVec 64)) (_2!12314 V!59125)) )
))
(declare-datatypes ((List!36087 0))(
  ( (Nil!36084) (Cons!36083 (h!37546 tuple2!24606) (t!50773 List!36087)) )
))
(declare-datatypes ((ListLongMap!22223 0))(
  ( (ListLongMap!22224 (toList!11127 List!36087)) )
))
(declare-fun e!862658 () ListLongMap!22223)

(declare-fun e!862659 () ListLongMap!22223)

(assert (=> b!1549517 (= e!862658 e!862659)))

(declare-fun bm!69887 () Bool)

(declare-fun call!69893 () ListLongMap!22223)

(declare-fun call!69891 () ListLongMap!22223)

(assert (=> bm!69887 (= call!69893 call!69891)))

(declare-fun bm!69888 () Bool)

(declare-fun call!69892 () ListLongMap!22223)

(assert (=> bm!69888 (= call!69891 call!69892)))

(declare-fun mapIsEmpty!58720 () Bool)

(declare-fun mapRes!58720 () Bool)

(assert (=> mapIsEmpty!58720 mapRes!58720))

(declare-fun b!1549518 () Bool)

(declare-fun e!862661 () Bool)

(declare-fun e!862655 () Bool)

(assert (=> b!1549518 (= e!862661 (and e!862655 mapRes!58720))))

(declare-fun condMapEmpty!58720 () Bool)

(declare-datatypes ((ValueCell!18095 0))(
  ( (ValueCellFull!18095 (v!21876 V!59125)) (EmptyCell!18095) )
))
(declare-datatypes ((array!103348 0))(
  ( (array!103349 (arr!49869 (Array (_ BitVec 32) ValueCell!18095)) (size!50420 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103348)

(declare-fun mapDefault!58720 () ValueCell!18095)

(assert (=> b!1549518 (= condMapEmpty!58720 (= (arr!49869 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18095)) mapDefault!58720)))))

(declare-fun b!1549519 () Bool)

(declare-fun e!862657 () Bool)

(assert (=> b!1549519 (= e!862657 (not true))))

(declare-datatypes ((array!103350 0))(
  ( (array!103351 (arr!49870 (Array (_ BitVec 32) (_ BitVec 64))) (size!50421 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103350)

(declare-fun lt!667672 () ListLongMap!22223)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun minValue!436 () V!59125)

(declare-fun apply!1056 (ListLongMap!22223 (_ BitVec 64)) V!59125)

(declare-fun +!4970 (ListLongMap!22223 tuple2!24606) ListLongMap!22223)

(assert (=> b!1549519 (= (apply!1056 (+!4970 lt!667672 (tuple2!24607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49870 _keys!618) from!762)) (apply!1056 lt!667672 (select (arr!49870 _keys!618) from!762)))))

(declare-datatypes ((Unit!51477 0))(
  ( (Unit!51478) )
))
(declare-fun lt!667671 () Unit!51477)

(declare-fun addApplyDifferent!585 (ListLongMap!22223 (_ BitVec 64) V!59125 (_ BitVec 64)) Unit!51477)

(assert (=> b!1549519 (= lt!667671 (addApplyDifferent!585 lt!667672 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49870 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59125)

(declare-fun contains!10104 (ListLongMap!22223 (_ BitVec 64)) Bool)

(assert (=> b!1549519 (contains!10104 (+!4970 lt!667672 (tuple2!24607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49870 _keys!618) from!762))))

(declare-fun lt!667675 () Unit!51477)

(declare-fun addStillContains!1246 (ListLongMap!22223 (_ BitVec 64) V!59125 (_ BitVec 64)) Unit!51477)

(assert (=> b!1549519 (= lt!667675 (addStillContains!1246 lt!667672 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49870 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6603 (array!103350 array!103348 (_ BitVec 32) (_ BitVec 32) V!59125 V!59125 (_ BitVec 32) Int) ListLongMap!22223)

(assert (=> b!1549519 (= lt!667672 (getCurrentListMapNoExtraKeys!6603 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549520 () Bool)

(declare-fun call!69894 () ListLongMap!22223)

(assert (=> b!1549520 (= e!862659 call!69894)))

(declare-fun bm!69889 () Bool)

(declare-fun call!69890 () ListLongMap!22223)

(assert (=> bm!69889 (= call!69894 call!69890)))

(declare-fun bm!69890 () Bool)

(assert (=> bm!69890 (= call!69892 (getCurrentListMapNoExtraKeys!6603 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549521 () Bool)

(declare-fun e!862656 () ListLongMap!22223)

(assert (=> b!1549521 (= e!862656 e!862658)))

(declare-fun c!142737 () Bool)

(assert (=> b!1549521 (= c!142737 (and (not lt!667674) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58720 () Bool)

(declare-fun tp!111457 () Bool)

(declare-fun e!862662 () Bool)

(assert (=> mapNonEmpty!58720 (= mapRes!58720 (and tp!111457 e!862662))))

(declare-fun mapKey!58720 () (_ BitVec 32))

(declare-fun mapRest!58720 () (Array (_ BitVec 32) ValueCell!18095))

(declare-fun mapValue!58720 () ValueCell!18095)

(assert (=> mapNonEmpty!58720 (= (arr!49869 _values!470) (store mapRest!58720 mapKey!58720 mapValue!58720))))

(declare-fun b!1549522 () Bool)

(declare-fun res!1061389 () Bool)

(declare-fun e!862654 () Bool)

(assert (=> b!1549522 (=> (not res!1061389) (not e!862654))))

(declare-datatypes ((List!36088 0))(
  ( (Nil!36085) (Cons!36084 (h!37547 (_ BitVec 64)) (t!50774 List!36088)) )
))
(declare-fun arrayNoDuplicates!0 (array!103350 (_ BitVec 32) List!36088) Bool)

(assert (=> b!1549522 (= res!1061389 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36085))))

(declare-fun b!1549523 () Bool)

(assert (=> b!1549523 (= e!862658 call!69894)))

(declare-fun bm!69891 () Bool)

(declare-fun c!142736 () Bool)

(assert (=> bm!69891 (= call!69890 (+!4970 (ite c!142736 call!69892 (ite c!142737 call!69891 call!69893)) (ite (or c!142736 c!142737) (tuple2!24607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549524 () Bool)

(declare-fun res!1061385 () Bool)

(assert (=> b!1549524 (=> (not res!1061385) (not e!862654))))

(assert (=> b!1549524 (= res!1061385 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50421 _keys!618))))))

(declare-fun b!1549525 () Bool)

(declare-fun tp_is_empty!38011 () Bool)

(assert (=> b!1549525 (= e!862655 tp_is_empty!38011)))

(declare-fun res!1061384 () Bool)

(assert (=> start!132434 (=> (not res!1061384) (not e!862654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132434 (= res!1061384 (validMask!0 mask!926))))

(assert (=> start!132434 e!862654))

(declare-fun array_inv!39049 (array!103350) Bool)

(assert (=> start!132434 (array_inv!39049 _keys!618)))

(assert (=> start!132434 tp_is_empty!38011))

(assert (=> start!132434 true))

(assert (=> start!132434 tp!111456))

(declare-fun array_inv!39050 (array!103348) Bool)

(assert (=> start!132434 (and (array_inv!39050 _values!470) e!862661)))

(declare-fun b!1549526 () Bool)

(assert (=> b!1549526 (= e!862662 tp_is_empty!38011)))

(declare-fun b!1549527 () Bool)

(assert (=> b!1549527 (= e!862659 call!69893)))

(declare-fun b!1549528 () Bool)

(declare-fun res!1061390 () Bool)

(assert (=> b!1549528 (=> (not res!1061390) (not e!862654))))

(assert (=> b!1549528 (= res!1061390 (and (= (size!50420 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50421 _keys!618) (size!50420 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549529 () Bool)

(declare-fun res!1061387 () Bool)

(assert (=> b!1549529 (=> (not res!1061387) (not e!862654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103350 (_ BitVec 32)) Bool)

(assert (=> b!1549529 (= res!1061387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549530 () Bool)

(assert (=> b!1549530 (= e!862654 e!862657)))

(declare-fun res!1061388 () Bool)

(assert (=> b!1549530 (=> (not res!1061388) (not e!862657))))

(assert (=> b!1549530 (= res!1061388 (bvslt from!762 (size!50421 _keys!618)))))

(declare-fun lt!667673 () ListLongMap!22223)

(assert (=> b!1549530 (= lt!667673 e!862656)))

(assert (=> b!1549530 (= c!142736 (and (not lt!667674) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549530 (= lt!667674 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549531 () Bool)

(declare-fun res!1061386 () Bool)

(assert (=> b!1549531 (=> (not res!1061386) (not e!862657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549531 (= res!1061386 (validKeyInArray!0 (select (arr!49870 _keys!618) from!762)))))

(declare-fun b!1549532 () Bool)

(assert (=> b!1549532 (= e!862656 (+!4970 call!69890 (tuple2!24607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!132434 res!1061384) b!1549528))

(assert (= (and b!1549528 res!1061390) b!1549529))

(assert (= (and b!1549529 res!1061387) b!1549522))

(assert (= (and b!1549522 res!1061389) b!1549524))

(assert (= (and b!1549524 res!1061385) b!1549530))

(assert (= (and b!1549530 c!142736) b!1549532))

(assert (= (and b!1549530 (not c!142736)) b!1549521))

(assert (= (and b!1549521 c!142737) b!1549523))

(assert (= (and b!1549521 (not c!142737)) b!1549517))

(assert (= (and b!1549517 c!142738) b!1549520))

(assert (= (and b!1549517 (not c!142738)) b!1549527))

(assert (= (or b!1549520 b!1549527) bm!69887))

(assert (= (or b!1549523 bm!69887) bm!69888))

(assert (= (or b!1549523 b!1549520) bm!69889))

(assert (= (or b!1549532 bm!69888) bm!69890))

(assert (= (or b!1549532 bm!69889) bm!69891))

(assert (= (and b!1549530 res!1061388) b!1549531))

(assert (= (and b!1549531 res!1061386) b!1549519))

(assert (= (and b!1549518 condMapEmpty!58720) mapIsEmpty!58720))

(assert (= (and b!1549518 (not condMapEmpty!58720)) mapNonEmpty!58720))

(get-info :version)

(assert (= (and mapNonEmpty!58720 ((_ is ValueCellFull!18095) mapValue!58720)) b!1549526))

(assert (= (and b!1549518 ((_ is ValueCellFull!18095) mapDefault!58720)) b!1549525))

(assert (= start!132434 b!1549518))

(declare-fun m!1429047 () Bool)

(assert (=> mapNonEmpty!58720 m!1429047))

(declare-fun m!1429049 () Bool)

(assert (=> bm!69890 m!1429049))

(declare-fun m!1429051 () Bool)

(assert (=> b!1549522 m!1429051))

(declare-fun m!1429053 () Bool)

(assert (=> start!132434 m!1429053))

(declare-fun m!1429055 () Bool)

(assert (=> start!132434 m!1429055))

(declare-fun m!1429057 () Bool)

(assert (=> start!132434 m!1429057))

(declare-fun m!1429059 () Bool)

(assert (=> bm!69891 m!1429059))

(assert (=> b!1549519 m!1429049))

(declare-fun m!1429061 () Bool)

(assert (=> b!1549519 m!1429061))

(declare-fun m!1429063 () Bool)

(assert (=> b!1549519 m!1429063))

(declare-fun m!1429065 () Bool)

(assert (=> b!1549519 m!1429065))

(declare-fun m!1429067 () Bool)

(assert (=> b!1549519 m!1429067))

(assert (=> b!1549519 m!1429061))

(declare-fun m!1429069 () Bool)

(assert (=> b!1549519 m!1429069))

(assert (=> b!1549519 m!1429061))

(declare-fun m!1429071 () Bool)

(assert (=> b!1549519 m!1429071))

(assert (=> b!1549519 m!1429061))

(declare-fun m!1429073 () Bool)

(assert (=> b!1549519 m!1429073))

(assert (=> b!1549519 m!1429065))

(assert (=> b!1549519 m!1429061))

(declare-fun m!1429075 () Bool)

(assert (=> b!1549519 m!1429075))

(assert (=> b!1549519 m!1429067))

(assert (=> b!1549519 m!1429061))

(declare-fun m!1429077 () Bool)

(assert (=> b!1549532 m!1429077))

(declare-fun m!1429079 () Bool)

(assert (=> b!1549529 m!1429079))

(assert (=> b!1549531 m!1429061))

(assert (=> b!1549531 m!1429061))

(declare-fun m!1429081 () Bool)

(assert (=> b!1549531 m!1429081))

(check-sat tp_is_empty!38011 (not b!1549522) (not b!1549531) (not start!132434) (not bm!69891) (not bm!69890) (not b!1549519) b_and!51147 (not b!1549529) (not b!1549532) (not b_next!31735) (not mapNonEmpty!58720))
(check-sat b_and!51147 (not b_next!31735))
