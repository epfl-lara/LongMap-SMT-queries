; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132070 () Bool)

(assert start!132070)

(declare-fun b_free!31783 () Bool)

(declare-fun b_next!31783 () Bool)

(assert (=> start!132070 (= b_free!31783 (not b_next!31783))))

(declare-fun tp!111601 () Bool)

(declare-fun b_and!51193 () Bool)

(assert (=> start!132070 (= tp!111601 b_and!51193)))

(declare-fun bm!70097 () Bool)

(declare-datatypes ((V!59189 0))(
  ( (V!59190 (val!19107 Int)) )
))
(declare-datatypes ((tuple2!24594 0))(
  ( (tuple2!24595 (_1!12308 (_ BitVec 64)) (_2!12308 V!59189)) )
))
(declare-datatypes ((List!36086 0))(
  ( (Nil!36083) (Cons!36082 (h!37527 tuple2!24594) (t!50780 List!36086)) )
))
(declare-datatypes ((ListLongMap!22203 0))(
  ( (ListLongMap!22204 (toList!11117 List!36086)) )
))
(declare-fun call!70100 () ListLongMap!22203)

(declare-fun call!70102 () ListLongMap!22203)

(assert (=> bm!70097 (= call!70100 call!70102)))

(declare-fun b!1548233 () Bool)

(declare-fun e!861801 () Bool)

(declare-fun tp_is_empty!38059 () Bool)

(assert (=> b!1548233 (= e!861801 tp_is_empty!38059)))

(declare-fun b!1548234 () Bool)

(declare-fun e!861799 () Bool)

(assert (=> b!1548234 (= e!861799 (not true))))

(declare-fun lt!667183 () ListLongMap!22203)

(declare-datatypes ((array!103318 0))(
  ( (array!103319 (arr!49861 (Array (_ BitVec 32) (_ BitVec 64))) (size!50411 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103318)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!667180 () V!59189)

(declare-fun apply!1066 (ListLongMap!22203 (_ BitVec 64)) V!59189)

(assert (=> b!1548234 (= (apply!1066 lt!667183 (select (arr!49861 _keys!618) from!762)) lt!667180)))

(declare-datatypes ((Unit!51582 0))(
  ( (Unit!51583) )
))
(declare-fun lt!667182 () Unit!51582)

(declare-fun zeroValue!436 () V!59189)

(declare-fun lt!667181 () ListLongMap!22203)

(declare-fun addApplyDifferent!608 (ListLongMap!22203 (_ BitVec 64) V!59189 (_ BitVec 64)) Unit!51582)

(assert (=> b!1548234 (= lt!667182 (addApplyDifferent!608 lt!667181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49861 _keys!618) from!762)))))

(declare-fun lt!667179 () V!59189)

(assert (=> b!1548234 (= lt!667179 lt!667180)))

(assert (=> b!1548234 (= lt!667180 (apply!1066 lt!667181 (select (arr!49861 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59189)

(declare-fun +!4948 (ListLongMap!22203 tuple2!24594) ListLongMap!22203)

(assert (=> b!1548234 (= lt!667179 (apply!1066 (+!4948 lt!667181 (tuple2!24595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49861 _keys!618) from!762)))))

(declare-fun lt!667178 () Unit!51582)

(assert (=> b!1548234 (= lt!667178 (addApplyDifferent!608 lt!667181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49861 _keys!618) from!762)))))

(declare-fun contains!10073 (ListLongMap!22203 (_ BitVec 64)) Bool)

(assert (=> b!1548234 (contains!10073 lt!667183 (select (arr!49861 _keys!618) from!762))))

(assert (=> b!1548234 (= lt!667183 (+!4948 lt!667181 (tuple2!24595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667176 () Unit!51582)

(declare-fun addStillContains!1261 (ListLongMap!22203 (_ BitVec 64) V!59189 (_ BitVec 64)) Unit!51582)

(assert (=> b!1548234 (= lt!667176 (addStillContains!1261 lt!667181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49861 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18119 0))(
  ( (ValueCellFull!18119 (v!21908 V!59189)) (EmptyCell!18119) )
))
(declare-datatypes ((array!103320 0))(
  ( (array!103321 (arr!49862 (Array (_ BitVec 32) ValueCell!18119)) (size!50412 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103320)

(declare-fun getCurrentListMapNoExtraKeys!6574 (array!103318 array!103320 (_ BitVec 32) (_ BitVec 32) V!59189 V!59189 (_ BitVec 32) Int) ListLongMap!22203)

(assert (=> b!1548234 (= lt!667181 (getCurrentListMapNoExtraKeys!6574 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548235 () Bool)

(declare-fun res!1061032 () Bool)

(declare-fun e!861795 () Bool)

(assert (=> b!1548235 (=> (not res!1061032) (not e!861795))))

(assert (=> b!1548235 (= res!1061032 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50411 _keys!618))))))

(declare-fun b!1548236 () Bool)

(declare-fun e!861793 () ListLongMap!22203)

(declare-fun e!861794 () ListLongMap!22203)

(assert (=> b!1548236 (= e!861793 e!861794)))

(declare-fun c!142152 () Bool)

(declare-fun lt!667177 () Bool)

(assert (=> b!1548236 (= c!142152 (and (not lt!667177) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548237 () Bool)

(declare-fun res!1061033 () Bool)

(assert (=> b!1548237 (=> (not res!1061033) (not e!861795))))

(declare-datatypes ((List!36087 0))(
  ( (Nil!36084) (Cons!36083 (h!37528 (_ BitVec 64)) (t!50781 List!36087)) )
))
(declare-fun arrayNoDuplicates!0 (array!103318 (_ BitVec 32) List!36087) Bool)

(assert (=> b!1548237 (= res!1061033 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36084))))

(declare-fun b!1548238 () Bool)

(declare-fun call!70104 () ListLongMap!22203)

(assert (=> b!1548238 (= e!861793 (+!4948 call!70104 (tuple2!24595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548239 () Bool)

(declare-fun e!861796 () Bool)

(declare-fun e!861798 () Bool)

(declare-fun mapRes!58792 () Bool)

(assert (=> b!1548239 (= e!861796 (and e!861798 mapRes!58792))))

(declare-fun condMapEmpty!58792 () Bool)

(declare-fun mapDefault!58792 () ValueCell!18119)

