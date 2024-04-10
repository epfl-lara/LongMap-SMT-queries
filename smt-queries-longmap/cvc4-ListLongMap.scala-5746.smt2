; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74308 () Bool)

(assert start!74308)

(declare-fun b_free!15071 () Bool)

(declare-fun b_next!15071 () Bool)

(assert (=> start!74308 (= b_free!15071 (not b_next!15071))))

(declare-fun tp!52887 () Bool)

(declare-fun b_and!24847 () Bool)

(assert (=> start!74308 (= tp!52887 b_and!24847)))

(declare-fun res!594184 () Bool)

(declare-fun e!486826 () Bool)

(assert (=> start!74308 (=> (not res!594184) (not e!486826))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50758 0))(
  ( (array!50759 (arr!24407 (Array (_ BitVec 32) (_ BitVec 64))) (size!24847 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50758)

(assert (=> start!74308 (= res!594184 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24847 _keys!868))))))

(assert (=> start!74308 e!486826))

(declare-fun tp_is_empty!17315 () Bool)

(assert (=> start!74308 tp_is_empty!17315))

(assert (=> start!74308 true))

(assert (=> start!74308 tp!52887))

(declare-fun array_inv!19252 (array!50758) Bool)

(assert (=> start!74308 (array_inv!19252 _keys!868)))

(declare-datatypes ((V!28133 0))(
  ( (V!28134 (val!8705 Int)) )
))
(declare-datatypes ((ValueCell!8218 0))(
  ( (ValueCellFull!8218 (v!11134 V!28133)) (EmptyCell!8218) )
))
(declare-datatypes ((array!50760 0))(
  ( (array!50761 (arr!24408 (Array (_ BitVec 32) ValueCell!8218)) (size!24848 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50760)

(declare-fun e!486829 () Bool)

(declare-fun array_inv!19253 (array!50760) Bool)

(assert (=> start!74308 (and (array_inv!19253 _values!688) e!486829)))

(declare-fun b!874346 () Bool)

(declare-fun res!594186 () Bool)

(assert (=> b!874346 (=> (not res!594186) (not e!486826))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!874346 (= res!594186 (and (= (select (arr!24407 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!874347 () Bool)

(declare-fun e!486830 () Bool)

(declare-fun mapRes!27581 () Bool)

(assert (=> b!874347 (= e!486829 (and e!486830 mapRes!27581))))

(declare-fun condMapEmpty!27581 () Bool)

(declare-fun mapDefault!27581 () ValueCell!8218)

