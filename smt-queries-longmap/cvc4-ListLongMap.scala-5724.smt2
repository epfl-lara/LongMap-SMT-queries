; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74144 () Bool)

(assert start!74144)

(declare-fun b!872215 () Bool)

(declare-fun res!592829 () Bool)

(declare-fun e!485679 () Bool)

(assert (=> b!872215 (=> (not res!592829) (not e!485679))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50500 0))(
  ( (array!50501 (arr!24280 (Array (_ BitVec 32) (_ BitVec 64))) (size!24720 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50500)

(declare-datatypes ((V!27957 0))(
  ( (V!27958 (val!8639 Int)) )
))
(declare-datatypes ((ValueCell!8152 0))(
  ( (ValueCellFull!8152 (v!11064 V!27957)) (EmptyCell!8152) )
))
(declare-datatypes ((array!50502 0))(
  ( (array!50503 (arr!24281 (Array (_ BitVec 32) ValueCell!8152)) (size!24721 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50502)

(assert (=> b!872215 (= res!592829 (and (= (size!24721 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24720 _keys!868) (size!24721 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27377 () Bool)

(declare-fun mapRes!27377 () Bool)

(assert (=> mapIsEmpty!27377 mapRes!27377))

(declare-fun res!592827 () Bool)

(assert (=> start!74144 (=> (not res!592827) (not e!485679))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74144 (= res!592827 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24720 _keys!868))))))

(assert (=> start!74144 e!485679))

(assert (=> start!74144 true))

(declare-fun array_inv!19170 (array!50500) Bool)

(assert (=> start!74144 (array_inv!19170 _keys!868)))

(declare-fun e!485677 () Bool)

(declare-fun array_inv!19171 (array!50502) Bool)

(assert (=> start!74144 (and (array_inv!19171 _values!688) e!485677)))

(declare-fun b!872216 () Bool)

(declare-fun e!485678 () Bool)

(assert (=> b!872216 (= e!485677 (and e!485678 mapRes!27377))))

(declare-fun condMapEmpty!27377 () Bool)

(declare-fun mapDefault!27377 () ValueCell!8152)

