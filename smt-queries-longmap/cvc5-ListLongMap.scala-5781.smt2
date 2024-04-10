; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74588 () Bool)

(assert start!74588)

(declare-fun b_free!15277 () Bool)

(declare-fun b_next!15277 () Bool)

(assert (=> start!74588 (= b_free!15277 (not b_next!15277))))

(declare-fun tp!53512 () Bool)

(declare-fun b_and!25153 () Bool)

(assert (=> start!74588 (= tp!53512 b_and!25153)))

(declare-fun res!597158 () Bool)

(declare-fun e!489148 () Bool)

(assert (=> start!74588 (=> (not res!597158) (not e!489148))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51168 0))(
  ( (array!51169 (arr!24610 (Array (_ BitVec 32) (_ BitVec 64))) (size!25050 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51168)

(assert (=> start!74588 (= res!597158 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25050 _keys!868))))))

(assert (=> start!74588 e!489148))

(declare-fun tp_is_empty!17521 () Bool)

(assert (=> start!74588 tp_is_empty!17521))

(assert (=> start!74588 true))

(assert (=> start!74588 tp!53512))

(declare-fun array_inv!19394 (array!51168) Bool)

(assert (=> start!74588 (array_inv!19394 _keys!868)))

(declare-datatypes ((V!28409 0))(
  ( (V!28410 (val!8808 Int)) )
))
(declare-datatypes ((ValueCell!8321 0))(
  ( (ValueCellFull!8321 (v!11248 V!28409)) (EmptyCell!8321) )
))
(declare-datatypes ((array!51170 0))(
  ( (array!51171 (arr!24611 (Array (_ BitVec 32) ValueCell!8321)) (size!25051 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51170)

(declare-fun e!489147 () Bool)

(declare-fun array_inv!19395 (array!51170) Bool)

(assert (=> start!74588 (and (array_inv!19395 _values!688) e!489147)))

(declare-fun b!878937 () Bool)

(declare-fun e!489145 () Bool)

(assert (=> b!878937 (= e!489145 tp_is_empty!17521)))

(declare-fun b!878938 () Bool)

(declare-fun e!489144 () Bool)

(assert (=> b!878938 (= e!489144 (bvslt from!1053 (size!25050 _keys!868)))))

(declare-fun b!878939 () Bool)

(declare-fun res!597154 () Bool)

(assert (=> b!878939 (=> (not res!597154) (not e!489148))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878939 (= res!597154 (validKeyInArray!0 k!854))))

(declare-fun b!878940 () Bool)

(declare-fun res!597159 () Bool)

(assert (=> b!878940 (=> (not res!597159) (not e!489148))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878940 (= res!597159 (and (= (select (arr!24610 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!878941 () Bool)

(declare-fun res!597157 () Bool)

(assert (=> b!878941 (=> (not res!597157) (not e!489148))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!878941 (= res!597157 (and (= (size!25051 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25050 _keys!868) (size!25051 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878942 () Bool)

(declare-fun e!489143 () Bool)

(assert (=> b!878942 (= e!489143 tp_is_empty!17521)))

(declare-fun b!878943 () Bool)

(declare-fun mapRes!27897 () Bool)

(assert (=> b!878943 (= e!489147 (and e!489143 mapRes!27897))))

(declare-fun condMapEmpty!27897 () Bool)

(declare-fun mapDefault!27897 () ValueCell!8321)

