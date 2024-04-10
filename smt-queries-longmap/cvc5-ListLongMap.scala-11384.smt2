; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132294 () Bool)

(assert start!132294)

(declare-fun b_free!31921 () Bool)

(declare-fun b_next!31921 () Bool)

(assert (=> start!132294 (= b_free!31921 (not b_next!31921))))

(declare-fun tp!112026 () Bool)

(declare-fun b_and!51359 () Bool)

(assert (=> start!132294 (= tp!112026 b_and!51359)))

(declare-fun b!1552123 () Bool)

(declare-fun res!1062718 () Bool)

(declare-fun e!864056 () Bool)

(assert (=> b!1552123 (=> (not res!1062718) (not e!864056))))

(declare-datatypes ((array!103596 0))(
  ( (array!103597 (arr!49996 (Array (_ BitVec 32) (_ BitVec 64))) (size!50546 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103596)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59373 0))(
  ( (V!59374 (val!19176 Int)) )
))
(declare-datatypes ((ValueCell!18188 0))(
  ( (ValueCellFull!18188 (v!21981 V!59373)) (EmptyCell!18188) )
))
(declare-datatypes ((array!103598 0))(
  ( (array!103599 (arr!49997 (Array (_ BitVec 32) ValueCell!18188)) (size!50547 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103598)

(assert (=> b!1552123 (= res!1062718 (and (= (size!50547 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50546 _keys!618) (size!50547 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1552124 () Bool)

(declare-fun e!864058 () Bool)

(assert (=> b!1552124 (= e!864056 e!864058)))

(declare-fun res!1062716 () Bool)

(assert (=> b!1552124 (=> (not res!1062716) (not e!864058))))

(declare-fun lt!669094 () Bool)

(assert (=> b!1552124 (= res!1062716 (not lt!669094))))

(declare-datatypes ((Unit!51691 0))(
  ( (Unit!51692) )
))
(declare-fun lt!669100 () Unit!51691)

(declare-fun e!864064 () Unit!51691)

(assert (=> b!1552124 (= lt!669100 e!864064)))

(declare-fun c!142917 () Bool)

(assert (=> b!1552124 (= c!142917 (not lt!669094))))

(declare-fun e!864059 () Bool)

(assert (=> b!1552124 (= lt!669094 e!864059)))

(declare-fun res!1062714 () Bool)

(assert (=> b!1552124 (=> res!1062714 e!864059)))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1552124 (= res!1062714 (bvsge from!762 (size!50546 _keys!618)))))

(declare-datatypes ((tuple2!24728 0))(
  ( (tuple2!24729 (_1!12375 (_ BitVec 64)) (_2!12375 V!59373)) )
))
(declare-datatypes ((List!36204 0))(
  ( (Nil!36201) (Cons!36200 (h!37645 tuple2!24728) (t!50918 List!36204)) )
))
(declare-datatypes ((ListLongMap!22337 0))(
  ( (ListLongMap!22338 (toList!11184 List!36204)) )
))
(declare-fun lt!669093 () ListLongMap!22337)

(declare-fun e!864057 () ListLongMap!22337)

(assert (=> b!1552124 (= lt!669093 e!864057)))

(declare-fun c!142916 () Bool)

(declare-fun lt!669099 () Bool)

(assert (=> b!1552124 (= c!142916 (and (not lt!669099) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552124 (= lt!669099 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1552125 () Bool)

(declare-fun c!142919 () Bool)

(assert (=> b!1552125 (= c!142919 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669099))))

(declare-fun e!864061 () ListLongMap!22337)

(declare-fun e!864055 () ListLongMap!22337)

(assert (=> b!1552125 (= e!864061 e!864055)))

(declare-fun b!1552126 () Bool)

(declare-fun call!71183 () ListLongMap!22337)

(assert (=> b!1552126 (= e!864061 call!71183)))

(declare-fun mapIsEmpty!59011 () Bool)

(declare-fun mapRes!59011 () Bool)

(assert (=> mapIsEmpty!59011 mapRes!59011))

(declare-fun b!1552127 () Bool)

(declare-fun e!864060 () Bool)

(declare-fun e!864063 () Bool)

(assert (=> b!1552127 (= e!864060 (and e!864063 mapRes!59011))))

(declare-fun condMapEmpty!59011 () Bool)

(declare-fun mapDefault!59011 () ValueCell!18188)

