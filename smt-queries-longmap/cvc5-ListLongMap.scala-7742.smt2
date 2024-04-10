; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97196 () Bool)

(assert start!97196)

(declare-fun res!737906 () Bool)

(declare-fun e!631100 () Bool)

(assert (=> start!97196 (=> (not res!737906) (not e!631100))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71771 0))(
  ( (array!71772 (arr!34538 (Array (_ BitVec 32) (_ BitVec 64))) (size!35074 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71771)

(assert (=> start!97196 (= res!737906 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35074 _keys!1208))))))

(assert (=> start!97196 e!631100))

(declare-fun array_inv!26582 (array!71771) Bool)

(assert (=> start!97196 (array_inv!26582 _keys!1208)))

(assert (=> start!97196 true))

(declare-datatypes ((V!41697 0))(
  ( (V!41698 (val!13770 Int)) )
))
(declare-datatypes ((ValueCell!13004 0))(
  ( (ValueCellFull!13004 (v!16403 V!41697)) (EmptyCell!13004) )
))
(declare-datatypes ((array!71773 0))(
  ( (array!71774 (arr!34539 (Array (_ BitVec 32) ValueCell!13004)) (size!35075 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71773)

(declare-fun e!631101 () Bool)

(declare-fun array_inv!26583 (array!71773) Bool)

(assert (=> start!97196 (and (array_inv!26583 _values!996) e!631101)))

(declare-fun mapIsEmpty!42958 () Bool)

(declare-fun mapRes!42958 () Bool)

(assert (=> mapIsEmpty!42958 mapRes!42958))

(declare-fun b!1105836 () Bool)

(declare-fun e!631097 () Bool)

(declare-fun tp_is_empty!27427 () Bool)

(assert (=> b!1105836 (= e!631097 tp_is_empty!27427)))

(declare-fun b!1105837 () Bool)

(assert (=> b!1105837 (= e!631101 (and e!631097 mapRes!42958))))

(declare-fun condMapEmpty!42958 () Bool)

(declare-fun mapDefault!42958 () ValueCell!13004)

