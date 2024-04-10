; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132188 () Bool)

(assert start!132188)

(declare-fun b_free!31883 () Bool)

(declare-fun b_next!31883 () Bool)

(assert (=> start!132188 (= b_free!31883 (not b_next!31883))))

(declare-fun tp!111904 () Bool)

(declare-fun b_and!51309 () Bool)

(assert (=> start!132188 (= tp!111904 b_and!51309)))

(declare-fun b!1550869 () Bool)

(declare-datatypes ((V!59321 0))(
  ( (V!59322 (val!19157 Int)) )
))
(declare-datatypes ((tuple2!24692 0))(
  ( (tuple2!24693 (_1!12357 (_ BitVec 64)) (_2!12357 V!59321)) )
))
(declare-datatypes ((List!36171 0))(
  ( (Nil!36168) (Cons!36167 (h!37612 tuple2!24692) (t!50879 List!36171)) )
))
(declare-datatypes ((ListLongMap!22301 0))(
  ( (ListLongMap!22302 (toList!11166 List!36171)) )
))
(declare-fun e!863316 () ListLongMap!22301)

(declare-fun call!70872 () ListLongMap!22301)

(assert (=> b!1550869 (= e!863316 call!70872)))

(declare-fun b!1550870 () Bool)

(declare-fun res!1062184 () Bool)

(declare-fun e!863317 () Bool)

(assert (=> b!1550870 (=> (not res!1062184) (not e!863317))))

(declare-datatypes ((array!103516 0))(
  ( (array!103517 (arr!49959 (Array (_ BitVec 32) (_ BitVec 64))) (size!50509 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103516)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550870 (= res!1062184 (validKeyInArray!0 (select (arr!49959 _keys!618) from!762)))))

(declare-fun b!1550871 () Bool)

(declare-fun e!863310 () Bool)

(declare-fun e!863312 () Bool)

(declare-fun mapRes!58945 () Bool)

(assert (=> b!1550871 (= e!863310 (and e!863312 mapRes!58945))))

(declare-fun condMapEmpty!58945 () Bool)

(declare-datatypes ((ValueCell!18169 0))(
  ( (ValueCellFull!18169 (v!21959 V!59321)) (EmptyCell!18169) )
))
(declare-datatypes ((array!103518 0))(
  ( (array!103519 (arr!49960 (Array (_ BitVec 32) ValueCell!18169)) (size!50510 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103518)

(declare-fun mapDefault!58945 () ValueCell!18169)

