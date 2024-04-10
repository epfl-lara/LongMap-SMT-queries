; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74298 () Bool)

(assert start!74298)

(declare-fun b_free!15061 () Bool)

(declare-fun b_next!15061 () Bool)

(assert (=> start!74298 (= b_free!15061 (not b_next!15061))))

(declare-fun tp!52858 () Bool)

(declare-fun b_and!24837 () Bool)

(assert (=> start!74298 (= tp!52858 b_and!24837)))

(declare-fun b!874181 () Bool)

(declare-fun res!594062 () Bool)

(declare-fun e!486755 () Bool)

(assert (=> b!874181 (=> (not res!594062) (not e!486755))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50738 0))(
  ( (array!50739 (arr!24397 (Array (_ BitVec 32) (_ BitVec 64))) (size!24837 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50738)

(assert (=> b!874181 (= res!594062 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24837 _keys!868))))))

(declare-fun b!874182 () Bool)

(declare-fun res!594063 () Bool)

(assert (=> b!874182 (=> (not res!594063) (not e!486755))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874182 (= res!594063 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27566 () Bool)

(declare-fun mapRes!27566 () Bool)

(declare-fun tp!52857 () Bool)

(declare-fun e!486752 () Bool)

(assert (=> mapNonEmpty!27566 (= mapRes!27566 (and tp!52857 e!486752))))

(declare-fun mapKey!27566 () (_ BitVec 32))

(declare-datatypes ((V!28121 0))(
  ( (V!28122 (val!8700 Int)) )
))
(declare-datatypes ((ValueCell!8213 0))(
  ( (ValueCellFull!8213 (v!11129 V!28121)) (EmptyCell!8213) )
))
(declare-fun mapValue!27566 () ValueCell!8213)

(declare-fun mapRest!27566 () (Array (_ BitVec 32) ValueCell!8213))

(declare-datatypes ((array!50740 0))(
  ( (array!50741 (arr!24398 (Array (_ BitVec 32) ValueCell!8213)) (size!24838 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50740)

(assert (=> mapNonEmpty!27566 (= (arr!24398 _values!688) (store mapRest!27566 mapKey!27566 mapValue!27566))))

(declare-fun mapIsEmpty!27566 () Bool)

(assert (=> mapIsEmpty!27566 mapRes!27566))

(declare-fun b!874183 () Bool)

(declare-fun res!594066 () Bool)

(assert (=> b!874183 (=> (not res!594066) (not e!486755))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874183 (= res!594066 (and (= (select (arr!24397 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!874184 () Bool)

(declare-fun res!594064 () Bool)

(assert (=> b!874184 (=> (not res!594064) (not e!486755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874184 (= res!594064 (validKeyInArray!0 k!854))))

(declare-fun b!874185 () Bool)

(declare-fun res!594065 () Bool)

(assert (=> b!874185 (=> (not res!594065) (not e!486755))))

(declare-datatypes ((List!17319 0))(
  ( (Nil!17316) (Cons!17315 (h!18446 (_ BitVec 64)) (t!24360 List!17319)) )
))
(declare-fun arrayNoDuplicates!0 (array!50738 (_ BitVec 32) List!17319) Bool)

(assert (=> b!874185 (= res!594065 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17316))))

(declare-fun b!874186 () Bool)

(declare-fun e!486753 () Bool)

(declare-fun e!486751 () Bool)

(assert (=> b!874186 (= e!486753 (and e!486751 mapRes!27566))))

(declare-fun condMapEmpty!27566 () Bool)

(declare-fun mapDefault!27566 () ValueCell!8213)

