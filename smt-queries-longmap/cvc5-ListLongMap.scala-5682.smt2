; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73876 () Bool)

(assert start!73876)

(declare-fun b_free!14791 () Bool)

(declare-fun b_next!14791 () Bool)

(assert (=> start!73876 (= b_free!14791 (not b_next!14791))))

(declare-fun tp!51876 () Bool)

(declare-fun b_and!24543 () Bool)

(assert (=> start!73876 (= tp!51876 b_and!24543)))

(declare-fun b!867891 () Bool)

(declare-fun res!589699 () Bool)

(declare-fun e!483417 () Bool)

(assert (=> b!867891 (=> (not res!589699) (not e!483417))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867891 (= res!589699 (validKeyInArray!0 k!854))))

(declare-fun b!867892 () Bool)

(declare-fun res!589698 () Bool)

(assert (=> b!867892 (=> (not res!589698) (not e!483417))))

(declare-datatypes ((array!50014 0))(
  ( (array!50015 (arr!24038 (Array (_ BitVec 32) (_ BitVec 64))) (size!24478 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50014)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50014 (_ BitVec 32)) Bool)

(assert (=> b!867892 (= res!589698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867893 () Bool)

(declare-fun res!589696 () Bool)

(assert (=> b!867893 (=> (not res!589696) (not e!483417))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867893 (= res!589696 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24478 _keys!868))))))

(declare-fun mapIsEmpty!26990 () Bool)

(declare-fun mapRes!26990 () Bool)

(assert (=> mapIsEmpty!26990 mapRes!26990))

(declare-fun b!867894 () Bool)

(declare-fun res!589693 () Bool)

(assert (=> b!867894 (=> (not res!589693) (not e!483417))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27617 0))(
  ( (V!27618 (val!8511 Int)) )
))
(declare-datatypes ((ValueCell!8024 0))(
  ( (ValueCellFull!8024 (v!10936 V!27617)) (EmptyCell!8024) )
))
(declare-datatypes ((array!50016 0))(
  ( (array!50017 (arr!24039 (Array (_ BitVec 32) ValueCell!8024)) (size!24479 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50016)

(assert (=> b!867894 (= res!589693 (and (= (size!24479 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24478 _keys!868) (size!24479 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867895 () Bool)

(declare-fun res!589697 () Bool)

(assert (=> b!867895 (=> (not res!589697) (not e!483417))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867895 (= res!589697 (and (= (select (arr!24038 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!867896 () Bool)

(declare-fun e!483418 () Bool)

(assert (=> b!867896 (= e!483418 (not true))))

(declare-fun v!557 () V!27617)

(declare-fun lt!394285 () array!50016)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27617)

(declare-fun zeroValue!654 () V!27617)

(declare-datatypes ((tuple2!11294 0))(
  ( (tuple2!11295 (_1!5658 (_ BitVec 64)) (_2!5658 V!27617)) )
))
(declare-datatypes ((List!17093 0))(
  ( (Nil!17090) (Cons!17089 (h!18220 tuple2!11294) (t!24130 List!17093)) )
))
(declare-datatypes ((ListLongMap!10063 0))(
  ( (ListLongMap!10064 (toList!5047 List!17093)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3016 (array!50014 array!50016 (_ BitVec 32) (_ BitVec 32) V!27617 V!27617 (_ BitVec 32) Int) ListLongMap!10063)

(declare-fun +!2391 (ListLongMap!10063 tuple2!11294) ListLongMap!10063)

(assert (=> b!867896 (= (getCurrentListMapNoExtraKeys!3016 _keys!868 lt!394285 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2391 (getCurrentListMapNoExtraKeys!3016 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11295 k!854 v!557)))))

(declare-datatypes ((Unit!29780 0))(
  ( (Unit!29781) )
))
(declare-fun lt!394288 () Unit!29780)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!585 (array!50014 array!50016 (_ BitVec 32) (_ BitVec 32) V!27617 V!27617 (_ BitVec 32) (_ BitVec 64) V!27617 (_ BitVec 32) Int) Unit!29780)

(assert (=> b!867896 (= lt!394288 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!585 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867897 () Bool)

(declare-fun res!589695 () Bool)

(assert (=> b!867897 (=> (not res!589695) (not e!483417))))

(declare-datatypes ((List!17094 0))(
  ( (Nil!17091) (Cons!17090 (h!18221 (_ BitVec 64)) (t!24131 List!17094)) )
))
(declare-fun arrayNoDuplicates!0 (array!50014 (_ BitVec 32) List!17094) Bool)

(assert (=> b!867897 (= res!589695 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17091))))

(declare-fun res!589694 () Bool)

(assert (=> start!73876 (=> (not res!589694) (not e!483417))))

(assert (=> start!73876 (= res!589694 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24478 _keys!868))))))

(assert (=> start!73876 e!483417))

(declare-fun tp_is_empty!16927 () Bool)

(assert (=> start!73876 tp_is_empty!16927))

(assert (=> start!73876 true))

(assert (=> start!73876 tp!51876))

(declare-fun array_inv!18994 (array!50014) Bool)

(assert (=> start!73876 (array_inv!18994 _keys!868)))

(declare-fun e!483416 () Bool)

(declare-fun array_inv!18995 (array!50016) Bool)

(assert (=> start!73876 (and (array_inv!18995 _values!688) e!483416)))

(declare-fun b!867898 () Bool)

(declare-fun e!483420 () Bool)

(assert (=> b!867898 (= e!483416 (and e!483420 mapRes!26990))))

(declare-fun condMapEmpty!26990 () Bool)

(declare-fun mapDefault!26990 () ValueCell!8024)

