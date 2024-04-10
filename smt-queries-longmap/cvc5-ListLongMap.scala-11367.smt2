; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132106 () Bool)

(assert start!132106)

(declare-fun b_free!31819 () Bool)

(declare-fun b_next!31819 () Bool)

(assert (=> start!132106 (= b_free!31819 (not b_next!31819))))

(declare-fun tp!111708 () Bool)

(declare-fun b_and!51229 () Bool)

(assert (=> start!132106 (= tp!111708 b_and!51229)))

(declare-fun mapNonEmpty!58846 () Bool)

(declare-fun mapRes!58846 () Bool)

(declare-fun tp!111709 () Bool)

(declare-fun e!862279 () Bool)

(assert (=> mapNonEmpty!58846 (= mapRes!58846 (and tp!111709 e!862279))))

(declare-fun mapKey!58846 () (_ BitVec 32))

(declare-datatypes ((V!59237 0))(
  ( (V!59238 (val!19125 Int)) )
))
(declare-datatypes ((ValueCell!18137 0))(
  ( (ValueCellFull!18137 (v!21926 V!59237)) (EmptyCell!18137) )
))
(declare-datatypes ((array!103388 0))(
  ( (array!103389 (arr!49896 (Array (_ BitVec 32) ValueCell!18137)) (size!50446 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103388)

(declare-fun mapValue!58846 () ValueCell!18137)

(declare-fun mapRest!58846 () (Array (_ BitVec 32) ValueCell!18137))

(assert (=> mapNonEmpty!58846 (= (arr!49896 _values!470) (store mapRest!58846 mapKey!58846 mapValue!58846))))

(declare-fun b!1549097 () Bool)

(declare-datatypes ((tuple2!24628 0))(
  ( (tuple2!24629 (_1!12325 (_ BitVec 64)) (_2!12325 V!59237)) )
))
(declare-datatypes ((List!36116 0))(
  ( (Nil!36113) (Cons!36112 (h!37557 tuple2!24628) (t!50810 List!36116)) )
))
(declare-datatypes ((ListLongMap!22237 0))(
  ( (ListLongMap!22238 (toList!11134 List!36116)) )
))
(declare-fun e!862280 () ListLongMap!22237)

(declare-fun call!70372 () ListLongMap!22237)

(assert (=> b!1549097 (= e!862280 call!70372)))

(declare-fun b!1549098 () Bool)

(declare-fun res!1061409 () Bool)

(declare-fun e!862283 () Bool)

(assert (=> b!1549098 (=> (not res!1061409) (not e!862283))))

(declare-datatypes ((array!103390 0))(
  ( (array!103391 (arr!49897 (Array (_ BitVec 32) (_ BitVec 64))) (size!50447 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103390)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549098 (= res!1061409 (validKeyInArray!0 (select (arr!49897 _keys!618) from!762)))))

(declare-fun b!1549099 () Bool)

(declare-fun e!862281 () Bool)

(declare-fun tp_is_empty!38095 () Bool)

(assert (=> b!1549099 (= e!862281 tp_is_empty!38095)))

(declare-fun bm!70367 () Bool)

(declare-fun call!70374 () ListLongMap!22237)

(declare-fun call!70373 () ListLongMap!22237)

(assert (=> bm!70367 (= call!70374 call!70373)))

(declare-fun b!1549100 () Bool)

(declare-fun e!862282 () Bool)

(assert (=> b!1549100 (= e!862282 (and e!862281 mapRes!58846))))

(declare-fun condMapEmpty!58846 () Bool)

(declare-fun mapDefault!58846 () ValueCell!18137)

