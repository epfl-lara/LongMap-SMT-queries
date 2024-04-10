; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132098 () Bool)

(assert start!132098)

(declare-fun b_free!31811 () Bool)

(declare-fun b_next!31811 () Bool)

(assert (=> start!132098 (= b_free!31811 (not b_next!31811))))

(declare-fun tp!111684 () Bool)

(declare-fun b_and!51221 () Bool)

(assert (=> start!132098 (= tp!111684 b_and!51221)))

(declare-fun b!1548905 () Bool)

(declare-fun res!1061327 () Bool)

(declare-fun e!862174 () Bool)

(assert (=> b!1548905 (=> (not res!1061327) (not e!862174))))

(declare-datatypes ((array!103372 0))(
  ( (array!103373 (arr!49888 (Array (_ BitVec 32) (_ BitVec 64))) (size!50438 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103372)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103372 (_ BitVec 32)) Bool)

(assert (=> b!1548905 (= res!1061327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548906 () Bool)

(declare-datatypes ((V!59225 0))(
  ( (V!59226 (val!19121 Int)) )
))
(declare-datatypes ((tuple2!24620 0))(
  ( (tuple2!24621 (_1!12321 (_ BitVec 64)) (_2!12321 V!59225)) )
))
(declare-datatypes ((List!36110 0))(
  ( (Nil!36107) (Cons!36106 (h!37551 tuple2!24620) (t!50804 List!36110)) )
))
(declare-datatypes ((ListLongMap!22229 0))(
  ( (ListLongMap!22230 (toList!11130 List!36110)) )
))
(declare-fun e!862175 () ListLongMap!22229)

(declare-fun call!70313 () ListLongMap!22229)

(assert (=> b!1548906 (= e!862175 call!70313)))

(declare-fun call!70310 () ListLongMap!22229)

(declare-fun zeroValue!436 () V!59225)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70307 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18133 0))(
  ( (ValueCellFull!18133 (v!21922 V!59225)) (EmptyCell!18133) )
))
(declare-datatypes ((array!103374 0))(
  ( (array!103375 (arr!49889 (Array (_ BitVec 32) ValueCell!18133)) (size!50439 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103374)

(declare-fun minValue!436 () V!59225)

(declare-fun getCurrentListMapNoExtraKeys!6584 (array!103372 array!103374 (_ BitVec 32) (_ BitVec 32) V!59225 V!59225 (_ BitVec 32) Int) ListLongMap!22229)

(assert (=> bm!70307 (= call!70310 (getCurrentListMapNoExtraKeys!6584 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70308 () Bool)

(declare-fun call!70314 () ListLongMap!22229)

(assert (=> bm!70308 (= call!70313 call!70314)))

(declare-fun b!1548907 () Bool)

(declare-fun e!862176 () Bool)

(declare-fun tp_is_empty!38087 () Bool)

(assert (=> b!1548907 (= e!862176 tp_is_empty!38087)))

(declare-fun res!1061325 () Bool)

(assert (=> start!132098 (=> (not res!1061325) (not e!862174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132098 (= res!1061325 (validMask!0 mask!926))))

(assert (=> start!132098 e!862174))

(declare-fun array_inv!38787 (array!103372) Bool)

(assert (=> start!132098 (array_inv!38787 _keys!618)))

(assert (=> start!132098 tp_is_empty!38087))

(assert (=> start!132098 true))

(assert (=> start!132098 tp!111684))

(declare-fun e!862172 () Bool)

(declare-fun array_inv!38788 (array!103374) Bool)

(assert (=> start!132098 (and (array_inv!38788 _values!470) e!862172)))

(declare-fun b!1548908 () Bool)

(declare-fun e!862173 () Bool)

(assert (=> b!1548908 (= e!862173 tp_is_empty!38087)))

(declare-fun b!1548909 () Bool)

(declare-fun res!1061322 () Bool)

(assert (=> b!1548909 (=> (not res!1061322) (not e!862174))))

(declare-datatypes ((List!36111 0))(
  ( (Nil!36108) (Cons!36107 (h!37552 (_ BitVec 64)) (t!50805 List!36111)) )
))
(declare-fun arrayNoDuplicates!0 (array!103372 (_ BitVec 32) List!36111) Bool)

(assert (=> b!1548909 (= res!1061322 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36108))))

(declare-fun b!1548910 () Bool)

(declare-fun e!862178 () Bool)

(assert (=> b!1548910 (= e!862178 (not true))))

(declare-fun lt!667558 () ListLongMap!22229)

(declare-fun lt!667562 () V!59225)

(declare-fun apply!1075 (ListLongMap!22229 (_ BitVec 64)) V!59225)

(assert (=> b!1548910 (= (apply!1075 lt!667558 (select (arr!49888 _keys!618) from!762)) lt!667562)))

(declare-fun lt!667557 () ListLongMap!22229)

(declare-datatypes ((Unit!51600 0))(
  ( (Unit!51601) )
))
(declare-fun lt!667554 () Unit!51600)

(declare-fun addApplyDifferent!617 (ListLongMap!22229 (_ BitVec 64) V!59225 (_ BitVec 64)) Unit!51600)

(assert (=> b!1548910 (= lt!667554 (addApplyDifferent!617 lt!667557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49888 _keys!618) from!762)))))

(declare-fun lt!667560 () V!59225)

(assert (=> b!1548910 (= lt!667560 lt!667562)))

(assert (=> b!1548910 (= lt!667562 (apply!1075 lt!667557 (select (arr!49888 _keys!618) from!762)))))

(declare-fun +!4959 (ListLongMap!22229 tuple2!24620) ListLongMap!22229)

(assert (=> b!1548910 (= lt!667560 (apply!1075 (+!4959 lt!667557 (tuple2!24621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49888 _keys!618) from!762)))))

(declare-fun lt!667556 () Unit!51600)

(assert (=> b!1548910 (= lt!667556 (addApplyDifferent!617 lt!667557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49888 _keys!618) from!762)))))

(declare-fun contains!10082 (ListLongMap!22229 (_ BitVec 64)) Bool)

(assert (=> b!1548910 (contains!10082 lt!667558 (select (arr!49888 _keys!618) from!762))))

(assert (=> b!1548910 (= lt!667558 (+!4959 lt!667557 (tuple2!24621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667561 () Unit!51600)

(declare-fun addStillContains!1270 (ListLongMap!22229 (_ BitVec 64) V!59225 (_ BitVec 64)) Unit!51600)

(assert (=> b!1548910 (= lt!667561 (addStillContains!1270 lt!667557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49888 _keys!618) from!762)))))

(assert (=> b!1548910 (= lt!667557 (getCurrentListMapNoExtraKeys!6584 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58834 () Bool)

(declare-fun mapRes!58834 () Bool)

(declare-fun tp!111685 () Bool)

(assert (=> mapNonEmpty!58834 (= mapRes!58834 (and tp!111685 e!862173))))

(declare-fun mapKey!58834 () (_ BitVec 32))

(declare-fun mapRest!58834 () (Array (_ BitVec 32) ValueCell!18133))

(declare-fun mapValue!58834 () ValueCell!18133)

(assert (=> mapNonEmpty!58834 (= (arr!49889 _values!470) (store mapRest!58834 mapKey!58834 mapValue!58834))))

(declare-fun bm!70309 () Bool)

(declare-fun call!70312 () ListLongMap!22229)

(declare-fun call!70311 () ListLongMap!22229)

(assert (=> bm!70309 (= call!70312 call!70311)))

(declare-fun b!1548911 () Bool)

(assert (=> b!1548911 (= e!862172 (and e!862176 mapRes!58834))))

(declare-fun condMapEmpty!58834 () Bool)

(declare-fun mapDefault!58834 () ValueCell!18133)

