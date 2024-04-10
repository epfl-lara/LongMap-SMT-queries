; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132080 () Bool)

(assert start!132080)

(declare-fun b_free!31793 () Bool)

(declare-fun b_next!31793 () Bool)

(assert (=> start!132080 (= b_free!31793 (not b_next!31793))))

(declare-fun tp!111631 () Bool)

(declare-fun b_and!51203 () Bool)

(assert (=> start!132080 (= tp!111631 b_and!51203)))

(declare-fun b!1548473 () Bool)

(declare-fun e!861930 () Bool)

(declare-fun tp_is_empty!38069 () Bool)

(assert (=> b!1548473 (= e!861930 tp_is_empty!38069)))

(declare-datatypes ((V!59201 0))(
  ( (V!59202 (val!19112 Int)) )
))
(declare-datatypes ((tuple2!24602 0))(
  ( (tuple2!24603 (_1!12312 (_ BitVec 64)) (_2!12312 V!59201)) )
))
(declare-datatypes ((List!36093 0))(
  ( (Nil!36090) (Cons!36089 (h!37534 tuple2!24602) (t!50787 List!36093)) )
))
(declare-datatypes ((ListLongMap!22211 0))(
  ( (ListLongMap!22212 (toList!11121 List!36093)) )
))
(declare-fun call!70177 () ListLongMap!22211)

(declare-fun zeroValue!436 () V!59201)

(declare-fun call!70178 () ListLongMap!22211)

(declare-fun call!70175 () ListLongMap!22211)

(declare-fun minValue!436 () V!59201)

(declare-fun c!142199 () Bool)

(declare-fun c!142198 () Bool)

(declare-fun bm!70172 () Bool)

(declare-fun call!70179 () ListLongMap!22211)

(declare-fun +!4951 (ListLongMap!22211 tuple2!24602) ListLongMap!22211)

(assert (=> bm!70172 (= call!70179 (+!4951 (ite c!142199 call!70177 (ite c!142198 call!70178 call!70175)) (ite (or c!142199 c!142198) (tuple2!24603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58807 () Bool)

(declare-fun mapRes!58807 () Bool)

(assert (=> mapIsEmpty!58807 mapRes!58807))

(declare-fun b!1548474 () Bool)

(declare-fun res!1061137 () Bool)

(declare-fun e!861933 () Bool)

(assert (=> b!1548474 (=> (not res!1061137) (not e!861933))))

(declare-datatypes ((array!103338 0))(
  ( (array!103339 (arr!49871 (Array (_ BitVec 32) (_ BitVec 64))) (size!50421 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103338)

(declare-datatypes ((List!36094 0))(
  ( (Nil!36091) (Cons!36090 (h!37535 (_ BitVec 64)) (t!50788 List!36094)) )
))
(declare-fun arrayNoDuplicates!0 (array!103338 (_ BitVec 32) List!36094) Bool)

(assert (=> b!1548474 (= res!1061137 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36091))))

(declare-fun b!1548475 () Bool)

(declare-fun e!861935 () Bool)

(assert (=> b!1548475 (= e!861935 (and e!861930 mapRes!58807))))

(declare-fun condMapEmpty!58807 () Bool)

(declare-datatypes ((ValueCell!18124 0))(
  ( (ValueCellFull!18124 (v!21913 V!59201)) (EmptyCell!18124) )
))
(declare-datatypes ((array!103340 0))(
  ( (array!103341 (arr!49872 (Array (_ BitVec 32) ValueCell!18124)) (size!50422 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103340)

(declare-fun mapDefault!58807 () ValueCell!18124)

