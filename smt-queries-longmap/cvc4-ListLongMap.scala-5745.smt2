; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74302 () Bool)

(assert start!74302)

(declare-fun b_free!15065 () Bool)

(declare-fun b_next!15065 () Bool)

(assert (=> start!74302 (= b_free!15065 (not b_next!15065))))

(declare-fun tp!52869 () Bool)

(declare-fun b_and!24841 () Bool)

(assert (=> start!74302 (= tp!52869 b_and!24841)))

(declare-fun b!874248 () Bool)

(declare-fun res!594113 () Bool)

(declare-fun e!486783 () Bool)

(assert (=> b!874248 (=> (not res!594113) (not e!486783))))

(declare-datatypes ((array!50746 0))(
  ( (array!50747 (arr!24401 (Array (_ BitVec 32) (_ BitVec 64))) (size!24841 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50746)

(declare-datatypes ((List!17322 0))(
  ( (Nil!17319) (Cons!17318 (h!18449 (_ BitVec 64)) (t!24363 List!17322)) )
))
(declare-fun arrayNoDuplicates!0 (array!50746 (_ BitVec 32) List!17322) Bool)

(assert (=> b!874248 (= res!594113 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17319))))

(declare-fun b!874249 () Bool)

(declare-fun res!594107 () Bool)

(assert (=> b!874249 (=> (not res!594107) (not e!486783))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874249 (= res!594107 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!27572 () Bool)

(declare-fun mapRes!27572 () Bool)

(assert (=> mapIsEmpty!27572 mapRes!27572))

(declare-fun b!874250 () Bool)

(declare-fun res!594110 () Bool)

(assert (=> b!874250 (=> (not res!594110) (not e!486783))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50746 (_ BitVec 32)) Bool)

(assert (=> b!874250 (= res!594110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874251 () Bool)

(declare-fun res!594112 () Bool)

(assert (=> b!874251 (=> (not res!594112) (not e!486783))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28125 0))(
  ( (V!28126 (val!8702 Int)) )
))
(declare-datatypes ((ValueCell!8215 0))(
  ( (ValueCellFull!8215 (v!11131 V!28125)) (EmptyCell!8215) )
))
(declare-datatypes ((array!50748 0))(
  ( (array!50749 (arr!24402 (Array (_ BitVec 32) ValueCell!8215)) (size!24842 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50748)

(assert (=> b!874251 (= res!594112 (and (= (size!24842 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24841 _keys!868) (size!24842 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874252 () Bool)

(declare-fun e!486782 () Bool)

(declare-fun e!486781 () Bool)

(assert (=> b!874252 (= e!486782 (and e!486781 mapRes!27572))))

(declare-fun condMapEmpty!27572 () Bool)

(declare-fun mapDefault!27572 () ValueCell!8215)

