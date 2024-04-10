; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73982 () Bool)

(assert start!73982)

(declare-fun b_free!14897 () Bool)

(declare-fun b_next!14897 () Bool)

(assert (=> start!73982 (= b_free!14897 (not b_next!14897))))

(declare-fun tp!52195 () Bool)

(declare-fun b_and!24649 () Bool)

(assert (=> start!73982 (= tp!52195 b_and!24649)))

(declare-fun b!869799 () Bool)

(declare-fun res!591127 () Bool)

(declare-fun e!484373 () Bool)

(assert (=> b!869799 (=> (not res!591127) (not e!484373))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50212 0))(
  ( (array!50213 (arr!24137 (Array (_ BitVec 32) (_ BitVec 64))) (size!24577 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50212)

(assert (=> b!869799 (= res!591127 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24577 _keys!868))))))

(declare-fun b!869800 () Bool)

(declare-fun e!484372 () Bool)

(declare-fun tp_is_empty!17033 () Bool)

(assert (=> b!869800 (= e!484372 tp_is_empty!17033)))

(declare-fun res!591124 () Bool)

(assert (=> start!73982 (=> (not res!591124) (not e!484373))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73982 (= res!591124 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24577 _keys!868))))))

(assert (=> start!73982 e!484373))

(assert (=> start!73982 tp_is_empty!17033))

(assert (=> start!73982 true))

(assert (=> start!73982 tp!52195))

(declare-fun array_inv!19068 (array!50212) Bool)

(assert (=> start!73982 (array_inv!19068 _keys!868)))

(declare-datatypes ((V!27757 0))(
  ( (V!27758 (val!8564 Int)) )
))
(declare-datatypes ((ValueCell!8077 0))(
  ( (ValueCellFull!8077 (v!10989 V!27757)) (EmptyCell!8077) )
))
(declare-datatypes ((array!50214 0))(
  ( (array!50215 (arr!24138 (Array (_ BitVec 32) ValueCell!8077)) (size!24578 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50214)

(declare-fun e!484374 () Bool)

(declare-fun array_inv!19069 (array!50214) Bool)

(assert (=> start!73982 (and (array_inv!19069 _values!688) e!484374)))

(declare-fun mapIsEmpty!27149 () Bool)

(declare-fun mapRes!27149 () Bool)

(assert (=> mapIsEmpty!27149 mapRes!27149))

(declare-fun b!869801 () Bool)

(declare-fun res!591128 () Bool)

(assert (=> b!869801 (=> (not res!591128) (not e!484373))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869801 (= res!591128 (validMask!0 mask!1196))))

(declare-fun b!869802 () Bool)

(declare-fun res!591130 () Bool)

(assert (=> b!869802 (=> (not res!591130) (not e!484373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50212 (_ BitVec 32)) Bool)

(assert (=> b!869802 (= res!591130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869803 () Bool)

(declare-fun res!591126 () Bool)

(assert (=> b!869803 (=> (not res!591126) (not e!484373))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!869803 (= res!591126 (and (= (size!24578 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24577 _keys!868) (size!24578 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869804 () Bool)

(declare-fun e!484375 () Bool)

(assert (=> b!869804 (= e!484374 (and e!484375 mapRes!27149))))

(declare-fun condMapEmpty!27149 () Bool)

(declare-fun mapDefault!27149 () ValueCell!8077)

