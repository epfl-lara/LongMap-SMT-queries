; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74164 () Bool)

(assert start!74164)

(declare-fun res!592946 () Bool)

(declare-fun e!485829 () Bool)

(assert (=> start!74164 (=> (not res!592946) (not e!485829))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50540 0))(
  ( (array!50541 (arr!24300 (Array (_ BitVec 32) (_ BitVec 64))) (size!24740 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50540)

(assert (=> start!74164 (= res!592946 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24740 _keys!868))))))

(assert (=> start!74164 e!485829))

(assert (=> start!74164 true))

(declare-fun array_inv!19184 (array!50540) Bool)

(assert (=> start!74164 (array_inv!19184 _keys!868)))

(declare-datatypes ((V!27985 0))(
  ( (V!27986 (val!8649 Int)) )
))
(declare-datatypes ((ValueCell!8162 0))(
  ( (ValueCellFull!8162 (v!11074 V!27985)) (EmptyCell!8162) )
))
(declare-datatypes ((array!50542 0))(
  ( (array!50543 (arr!24301 (Array (_ BitVec 32) ValueCell!8162)) (size!24741 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50542)

(declare-fun e!485830 () Bool)

(declare-fun array_inv!19185 (array!50542) Bool)

(assert (=> start!74164 (and (array_inv!19185 _values!688) e!485830)))

(declare-fun b!872425 () Bool)

(declare-fun e!485826 () Bool)

(declare-fun tp_is_empty!17203 () Bool)

(assert (=> b!872425 (= e!485826 tp_is_empty!17203)))

(declare-fun b!872426 () Bool)

(declare-fun e!485827 () Bool)

(declare-fun mapRes!27407 () Bool)

(assert (=> b!872426 (= e!485830 (and e!485827 mapRes!27407))))

(declare-fun condMapEmpty!27407 () Bool)

(declare-fun mapDefault!27407 () ValueCell!8162)

