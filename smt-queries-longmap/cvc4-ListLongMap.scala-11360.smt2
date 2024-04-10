; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132068 () Bool)

(assert start!132068)

(declare-fun b_free!31781 () Bool)

(declare-fun b_next!31781 () Bool)

(assert (=> start!132068 (= b_free!31781 (not b_next!31781))))

(declare-fun tp!111595 () Bool)

(declare-fun b_and!51191 () Bool)

(assert (=> start!132068 (= tp!111595 b_and!51191)))

(declare-fun mapIsEmpty!58789 () Bool)

(declare-fun mapRes!58789 () Bool)

(assert (=> mapIsEmpty!58789 mapRes!58789))

(declare-fun b!1548185 () Bool)

(declare-fun e!861768 () Bool)

(assert (=> b!1548185 (= e!861768 (not true))))

(declare-datatypes ((array!103314 0))(
  ( (array!103315 (arr!49859 (Array (_ BitVec 32) (_ BitVec 64))) (size!50409 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103314)

(declare-datatypes ((V!59185 0))(
  ( (V!59186 (val!19106 Int)) )
))
(declare-datatypes ((tuple2!24592 0))(
  ( (tuple2!24593 (_1!12307 (_ BitVec 64)) (_2!12307 V!59185)) )
))
(declare-datatypes ((List!36085 0))(
  ( (Nil!36082) (Cons!36081 (h!37526 tuple2!24592) (t!50779 List!36085)) )
))
(declare-datatypes ((ListLongMap!22201 0))(
  ( (ListLongMap!22202 (toList!11116 List!36085)) )
))
(declare-fun lt!667157 () ListLongMap!22201)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!667151 () V!59185)

(declare-fun apply!1065 (ListLongMap!22201 (_ BitVec 64)) V!59185)

(assert (=> b!1548185 (= (apply!1065 lt!667157 (select (arr!49859 _keys!618) from!762)) lt!667151)))

(declare-fun zeroValue!436 () V!59185)

(declare-datatypes ((Unit!51580 0))(
  ( (Unit!51581) )
))
(declare-fun lt!667152 () Unit!51580)

(declare-fun lt!667156 () ListLongMap!22201)

(declare-fun addApplyDifferent!607 (ListLongMap!22201 (_ BitVec 64) V!59185 (_ BitVec 64)) Unit!51580)

(assert (=> b!1548185 (= lt!667152 (addApplyDifferent!607 lt!667156 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49859 _keys!618) from!762)))))

(declare-fun lt!667150 () V!59185)

(assert (=> b!1548185 (= lt!667150 lt!667151)))

(assert (=> b!1548185 (= lt!667151 (apply!1065 lt!667156 (select (arr!49859 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59185)

(declare-fun +!4947 (ListLongMap!22201 tuple2!24592) ListLongMap!22201)

(assert (=> b!1548185 (= lt!667150 (apply!1065 (+!4947 lt!667156 (tuple2!24593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49859 _keys!618) from!762)))))

(declare-fun lt!667149 () Unit!51580)

(assert (=> b!1548185 (= lt!667149 (addApplyDifferent!607 lt!667156 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49859 _keys!618) from!762)))))

(declare-fun contains!10072 (ListLongMap!22201 (_ BitVec 64)) Bool)

(assert (=> b!1548185 (contains!10072 lt!667157 (select (arr!49859 _keys!618) from!762))))

(assert (=> b!1548185 (= lt!667157 (+!4947 lt!667156 (tuple2!24593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667155 () Unit!51580)

(declare-fun addStillContains!1260 (ListLongMap!22201 (_ BitVec 64) V!59185 (_ BitVec 64)) Unit!51580)

(assert (=> b!1548185 (= lt!667155 (addStillContains!1260 lt!667156 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49859 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18118 0))(
  ( (ValueCellFull!18118 (v!21907 V!59185)) (EmptyCell!18118) )
))
(declare-datatypes ((array!103316 0))(
  ( (array!103317 (arr!49860 (Array (_ BitVec 32) ValueCell!18118)) (size!50410 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103316)

(declare-fun getCurrentListMapNoExtraKeys!6573 (array!103314 array!103316 (_ BitVec 32) (_ BitVec 32) V!59185 V!59185 (_ BitVec 32) Int) ListLongMap!22201)

(assert (=> b!1548185 (= lt!667156 (getCurrentListMapNoExtraKeys!6573 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548186 () Bool)

(declare-fun res!1061008 () Bool)

(declare-fun e!861769 () Bool)

(assert (=> b!1548186 (=> (not res!1061008) (not e!861769))))

(assert (=> b!1548186 (= res!1061008 (and (= (size!50410 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50409 _keys!618) (size!50410 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70082 () Bool)

(declare-fun call!70086 () ListLongMap!22201)

(declare-fun c!142145 () Bool)

(declare-fun call!70087 () ListLongMap!22201)

(declare-fun call!70085 () ListLongMap!22201)

(declare-fun call!70089 () ListLongMap!22201)

(declare-fun c!142144 () Bool)

(assert (=> bm!70082 (= call!70085 (+!4947 (ite c!142145 call!70086 (ite c!142144 call!70087 call!70089)) (ite (or c!142145 c!142144) (tuple2!24593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548187 () Bool)

(declare-fun res!1061007 () Bool)

(assert (=> b!1548187 (=> (not res!1061007) (not e!861769))))

(assert (=> b!1548187 (= res!1061007 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50409 _keys!618))))))

(declare-fun b!1548188 () Bool)

(declare-fun e!861774 () Bool)

(declare-fun tp_is_empty!38057 () Bool)

(assert (=> b!1548188 (= e!861774 tp_is_empty!38057)))

(declare-fun b!1548189 () Bool)

(declare-fun res!1061012 () Bool)

(assert (=> b!1548189 (=> (not res!1061012) (not e!861769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103314 (_ BitVec 32)) Bool)

(assert (=> b!1548189 (= res!1061012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70083 () Bool)

(assert (=> bm!70083 (= call!70089 call!70087)))

(declare-fun b!1548190 () Bool)

(declare-fun e!861771 () Bool)

(declare-fun e!861772 () Bool)

(assert (=> b!1548190 (= e!861771 (and e!861772 mapRes!58789))))

(declare-fun condMapEmpty!58789 () Bool)

(declare-fun mapDefault!58789 () ValueCell!18118)

