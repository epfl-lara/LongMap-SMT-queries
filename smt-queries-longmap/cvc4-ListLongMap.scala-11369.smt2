; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132122 () Bool)

(assert start!132122)

(declare-fun b_free!31835 () Bool)

(declare-fun b_next!31835 () Bool)

(assert (=> start!132122 (= b_free!31835 (not b_next!31835))))

(declare-fun tp!111757 () Bool)

(declare-fun b_and!51245 () Bool)

(assert (=> start!132122 (= tp!111757 b_and!51245)))

(declare-fun b!1549481 () Bool)

(declare-datatypes ((V!59257 0))(
  ( (V!59258 (val!19133 Int)) )
))
(declare-datatypes ((tuple2!24644 0))(
  ( (tuple2!24645 (_1!12333 (_ BitVec 64)) (_2!12333 V!59257)) )
))
(declare-datatypes ((List!36129 0))(
  ( (Nil!36126) (Cons!36125 (h!37570 tuple2!24644) (t!50823 List!36129)) )
))
(declare-datatypes ((ListLongMap!22253 0))(
  ( (ListLongMap!22254 (toList!11142 List!36129)) )
))
(declare-fun e!862501 () ListLongMap!22253)

(declare-fun e!862499 () ListLongMap!22253)

(assert (=> b!1549481 (= e!862501 e!862499)))

(declare-fun c!142386 () Bool)

(declare-fun lt!667895 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1549481 (= c!142386 (and (not lt!667895) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!70493 () ListLongMap!22253)

(declare-datatypes ((array!103418 0))(
  ( (array!103419 (arr!49911 (Array (_ BitVec 32) (_ BitVec 64))) (size!50461 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103418)

(declare-fun zeroValue!436 () V!59257)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18145 0))(
  ( (ValueCellFull!18145 (v!21934 V!59257)) (EmptyCell!18145) )
))
(declare-datatypes ((array!103420 0))(
  ( (array!103421 (arr!49912 (Array (_ BitVec 32) ValueCell!18145)) (size!50462 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103420)

(declare-fun minValue!436 () V!59257)

(declare-fun bm!70487 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6594 (array!103418 array!103420 (_ BitVec 32) (_ BitVec 32) V!59257 V!59257 (_ BitVec 32) Int) ListLongMap!22253)

(assert (=> bm!70487 (= call!70493 (getCurrentListMapNoExtraKeys!6594 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549482 () Bool)

(declare-fun e!862497 () ListLongMap!22253)

(declare-fun call!70494 () ListLongMap!22253)

(assert (=> b!1549482 (= e!862497 call!70494)))

(declare-fun b!1549483 () Bool)

(declare-fun res!1061579 () Bool)

(declare-fun e!862500 () Bool)

(assert (=> b!1549483 (=> (not res!1061579) (not e!862500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549483 (= res!1061579 (validKeyInArray!0 (select (arr!49911 _keys!618) from!762)))))

(declare-fun b!1549484 () Bool)

(declare-fun e!862502 () Bool)

(declare-fun tp_is_empty!38111 () Bool)

(assert (=> b!1549484 (= e!862502 tp_is_empty!38111)))

(declare-fun bm!70488 () Bool)

(declare-fun call!70492 () ListLongMap!22253)

(declare-fun call!70490 () ListLongMap!22253)

(assert (=> bm!70488 (= call!70492 call!70490)))

(declare-fun b!1549485 () Bool)

(declare-fun +!4968 (ListLongMap!22253 tuple2!24644) ListLongMap!22253)

(assert (=> b!1549485 (= e!862501 (+!4968 call!70490 (tuple2!24645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549486 () Bool)

(declare-fun c!142388 () Bool)

(assert (=> b!1549486 (= c!142388 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667895))))

(assert (=> b!1549486 (= e!862499 e!862497)))

(declare-fun bm!70489 () Bool)

(declare-fun call!70491 () ListLongMap!22253)

(assert (=> bm!70489 (= call!70491 call!70493)))

(declare-fun bm!70490 () Bool)

(assert (=> bm!70490 (= call!70494 call!70491)))

(declare-fun b!1549487 () Bool)

(assert (=> b!1549487 (= e!862500 (not true))))

(declare-fun lt!667890 () ListLongMap!22253)

(declare-fun lt!667886 () Bool)

(declare-fun contains!10089 (ListLongMap!22253 (_ BitVec 64)) Bool)

(assert (=> b!1549487 (= lt!667886 (contains!10089 lt!667890 (select (arr!49911 _keys!618) from!762)))))

(declare-fun lt!667894 () V!59257)

(declare-fun lt!667892 () ListLongMap!22253)

(declare-fun apply!1082 (ListLongMap!22253 (_ BitVec 64)) V!59257)

(assert (=> b!1549487 (= (apply!1082 lt!667892 (select (arr!49911 _keys!618) from!762)) lt!667894)))

(declare-datatypes ((Unit!51614 0))(
  ( (Unit!51615) )
))
(declare-fun lt!667888 () Unit!51614)

(declare-fun addApplyDifferent!624 (ListLongMap!22253 (_ BitVec 64) V!59257 (_ BitVec 64)) Unit!51614)

(assert (=> b!1549487 (= lt!667888 (addApplyDifferent!624 lt!667890 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49911 _keys!618) from!762)))))

(declare-fun lt!667889 () V!59257)

(assert (=> b!1549487 (= lt!667889 lt!667894)))

(assert (=> b!1549487 (= lt!667894 (apply!1082 lt!667890 (select (arr!49911 _keys!618) from!762)))))

(assert (=> b!1549487 (= lt!667889 (apply!1082 (+!4968 lt!667890 (tuple2!24645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49911 _keys!618) from!762)))))

(declare-fun lt!667891 () Unit!51614)

(assert (=> b!1549487 (= lt!667891 (addApplyDifferent!624 lt!667890 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49911 _keys!618) from!762)))))

(assert (=> b!1549487 (contains!10089 lt!667892 (select (arr!49911 _keys!618) from!762))))

(assert (=> b!1549487 (= lt!667892 (+!4968 lt!667890 (tuple2!24645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667893 () Unit!51614)

(declare-fun addStillContains!1277 (ListLongMap!22253 (_ BitVec 64) V!59257 (_ BitVec 64)) Unit!51614)

(assert (=> b!1549487 (= lt!667893 (addStillContains!1277 lt!667890 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49911 _keys!618) from!762)))))

(assert (=> b!1549487 (= lt!667890 (getCurrentListMapNoExtraKeys!6594 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1061580 () Bool)

(declare-fun e!862495 () Bool)

(assert (=> start!132122 (=> (not res!1061580) (not e!862495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132122 (= res!1061580 (validMask!0 mask!926))))

(assert (=> start!132122 e!862495))

(declare-fun array_inv!38801 (array!103418) Bool)

(assert (=> start!132122 (array_inv!38801 _keys!618)))

(assert (=> start!132122 tp_is_empty!38111))

(assert (=> start!132122 true))

(assert (=> start!132122 tp!111757))

(declare-fun e!862498 () Bool)

(declare-fun array_inv!38802 (array!103420) Bool)

(assert (=> start!132122 (and (array_inv!38802 _values!470) e!862498)))

(declare-fun b!1549488 () Bool)

(declare-fun mapRes!58870 () Bool)

(assert (=> b!1549488 (= e!862498 (and e!862502 mapRes!58870))))

(declare-fun condMapEmpty!58870 () Bool)

(declare-fun mapDefault!58870 () ValueCell!18145)

