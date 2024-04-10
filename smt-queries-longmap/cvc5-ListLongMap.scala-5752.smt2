; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74340 () Bool)

(assert start!74340)

(declare-fun b_free!15103 () Bool)

(declare-fun b_next!15103 () Bool)

(assert (=> start!74340 (= b_free!15103 (not b_next!15103))))

(declare-fun tp!52983 () Bool)

(declare-fun b_and!24879 () Bool)

(assert (=> start!74340 (= tp!52983 b_and!24879)))

(declare-fun b!874874 () Bool)

(declare-fun res!594568 () Bool)

(declare-fun e!487067 () Bool)

(assert (=> b!874874 (=> (not res!594568) (not e!487067))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50822 0))(
  ( (array!50823 (arr!24439 (Array (_ BitVec 32) (_ BitVec 64))) (size!24879 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50822)

(declare-datatypes ((V!28177 0))(
  ( (V!28178 (val!8721 Int)) )
))
(declare-datatypes ((ValueCell!8234 0))(
  ( (ValueCellFull!8234 (v!11150 V!28177)) (EmptyCell!8234) )
))
(declare-datatypes ((array!50824 0))(
  ( (array!50825 (arr!24440 (Array (_ BitVec 32) ValueCell!8234)) (size!24880 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50824)

(assert (=> b!874874 (= res!594568 (and (= (size!24880 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24879 _keys!868) (size!24880 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874875 () Bool)

(declare-fun res!594564 () Bool)

(assert (=> b!874875 (=> (not res!594564) (not e!487067))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874875 (= res!594564 (validKeyInArray!0 k!854))))

(declare-fun b!874876 () Bool)

(declare-fun res!594565 () Bool)

(assert (=> b!874876 (=> (not res!594565) (not e!487067))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!874876 (= res!594565 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24879 _keys!868))))))

(declare-fun mapIsEmpty!27629 () Bool)

(declare-fun mapRes!27629 () Bool)

(assert (=> mapIsEmpty!27629 mapRes!27629))

(declare-fun b!874877 () Bool)

(declare-fun res!594566 () Bool)

(assert (=> b!874877 (=> (not res!594566) (not e!487067))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874877 (= res!594566 (and (= (select (arr!24439 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!874878 () Bool)

(declare-fun res!594569 () Bool)

(assert (=> b!874878 (=> (not res!594569) (not e!487067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50822 (_ BitVec 32)) Bool)

(assert (=> b!874878 (= res!594569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874879 () Bool)

(declare-fun res!594567 () Bool)

(assert (=> b!874879 (=> (not res!594567) (not e!487067))))

(declare-datatypes ((List!17345 0))(
  ( (Nil!17342) (Cons!17341 (h!18472 (_ BitVec 64)) (t!24386 List!17345)) )
))
(declare-fun arrayNoDuplicates!0 (array!50822 (_ BitVec 32) List!17345) Bool)

(assert (=> b!874879 (= res!594567 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17342))))

(declare-fun b!874880 () Bool)

(declare-fun res!594570 () Bool)

(assert (=> b!874880 (=> (not res!594570) (not e!487067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874880 (= res!594570 (validMask!0 mask!1196))))

(declare-fun b!874881 () Bool)

(declare-fun e!487069 () Bool)

(declare-fun e!487070 () Bool)

(assert (=> b!874881 (= e!487069 (and e!487070 mapRes!27629))))

(declare-fun condMapEmpty!27629 () Bool)

(declare-fun mapDefault!27629 () ValueCell!8234)

