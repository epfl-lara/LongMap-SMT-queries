; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73960 () Bool)

(assert start!73960)

(declare-fun b_free!14875 () Bool)

(declare-fun b_next!14875 () Bool)

(assert (=> start!73960 (= b_free!14875 (not b_next!14875))))

(declare-fun tp!52129 () Bool)

(declare-fun b_and!24627 () Bool)

(assert (=> start!73960 (= tp!52129 b_and!24627)))

(declare-fun b!869403 () Bool)

(declare-fun res!590829 () Bool)

(declare-fun e!484176 () Bool)

(assert (=> b!869403 (=> (not res!590829) (not e!484176))))

(declare-datatypes ((array!50170 0))(
  ( (array!50171 (arr!24116 (Array (_ BitVec 32) (_ BitVec 64))) (size!24556 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50170)

(declare-datatypes ((List!17150 0))(
  ( (Nil!17147) (Cons!17146 (h!18277 (_ BitVec 64)) (t!24187 List!17150)) )
))
(declare-fun arrayNoDuplicates!0 (array!50170 (_ BitVec 32) List!17150) Bool)

(assert (=> b!869403 (= res!590829 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17147))))

(declare-fun b!869404 () Bool)

(declare-fun res!590833 () Bool)

(assert (=> b!869404 (=> (not res!590833) (not e!484176))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869404 (= res!590833 (validKeyInArray!0 k!854))))

(declare-fun res!590830 () Bool)

(assert (=> start!73960 (=> (not res!590830) (not e!484176))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73960 (= res!590830 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24556 _keys!868))))))

(assert (=> start!73960 e!484176))

(declare-fun tp_is_empty!17011 () Bool)

(assert (=> start!73960 tp_is_empty!17011))

(assert (=> start!73960 true))

(assert (=> start!73960 tp!52129))

(declare-fun array_inv!19048 (array!50170) Bool)

(assert (=> start!73960 (array_inv!19048 _keys!868)))

(declare-datatypes ((V!27729 0))(
  ( (V!27730 (val!8553 Int)) )
))
(declare-datatypes ((ValueCell!8066 0))(
  ( (ValueCellFull!8066 (v!10978 V!27729)) (EmptyCell!8066) )
))
(declare-datatypes ((array!50172 0))(
  ( (array!50173 (arr!24117 (Array (_ BitVec 32) ValueCell!8066)) (size!24557 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50172)

(declare-fun e!484177 () Bool)

(declare-fun array_inv!19049 (array!50172) Bool)

(assert (=> start!73960 (and (array_inv!19049 _values!688) e!484177)))

(declare-fun b!869405 () Bool)

(declare-fun res!590826 () Bool)

(assert (=> b!869405 (=> (not res!590826) (not e!484176))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869405 (= res!590826 (and (= (select (arr!24116 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!869406 () Bool)

(declare-fun e!484173 () Bool)

(assert (=> b!869406 (= e!484176 e!484173)))

(declare-fun res!590832 () Bool)

(assert (=> b!869406 (=> (not res!590832) (not e!484173))))

(assert (=> b!869406 (= res!590832 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11360 0))(
  ( (tuple2!11361 (_1!5691 (_ BitVec 64)) (_2!5691 V!27729)) )
))
(declare-datatypes ((List!17151 0))(
  ( (Nil!17148) (Cons!17147 (h!18278 tuple2!11360) (t!24188 List!17151)) )
))
(declare-datatypes ((ListLongMap!10129 0))(
  ( (ListLongMap!10130 (toList!5080 List!17151)) )
))
(declare-fun lt!394790 () ListLongMap!10129)

(declare-fun lt!394789 () array!50172)

(declare-fun minValue!654 () V!27729)

(declare-fun zeroValue!654 () V!27729)

(declare-fun getCurrentListMapNoExtraKeys!3049 (array!50170 array!50172 (_ BitVec 32) (_ BitVec 32) V!27729 V!27729 (_ BitVec 32) Int) ListLongMap!10129)

(assert (=> b!869406 (= lt!394790 (getCurrentListMapNoExtraKeys!3049 _keys!868 lt!394789 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27729)

(assert (=> b!869406 (= lt!394789 (array!50173 (store (arr!24117 _values!688) i!612 (ValueCellFull!8066 v!557)) (size!24557 _values!688)))))

(declare-fun lt!394792 () ListLongMap!10129)

(assert (=> b!869406 (= lt!394792 (getCurrentListMapNoExtraKeys!3049 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869407 () Bool)

(declare-fun res!590834 () Bool)

(assert (=> b!869407 (=> (not res!590834) (not e!484176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869407 (= res!590834 (validMask!0 mask!1196))))

(declare-fun b!869408 () Bool)

(assert (=> b!869408 (= e!484173 (not true))))

(declare-fun +!2420 (ListLongMap!10129 tuple2!11360) ListLongMap!10129)

(assert (=> b!869408 (= (getCurrentListMapNoExtraKeys!3049 _keys!868 lt!394789 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2420 (getCurrentListMapNoExtraKeys!3049 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11361 k!854 v!557)))))

(declare-datatypes ((Unit!29838 0))(
  ( (Unit!29839) )
))
(declare-fun lt!394791 () Unit!29838)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!614 (array!50170 array!50172 (_ BitVec 32) (_ BitVec 32) V!27729 V!27729 (_ BitVec 32) (_ BitVec 64) V!27729 (_ BitVec 32) Int) Unit!29838)

(assert (=> b!869408 (= lt!394791 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!614 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869409 () Bool)

(declare-fun res!590828 () Bool)

(assert (=> b!869409 (=> (not res!590828) (not e!484176))))

(assert (=> b!869409 (= res!590828 (and (= (size!24557 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24556 _keys!868) (size!24557 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869410 () Bool)

(declare-fun e!484174 () Bool)

(declare-fun mapRes!27116 () Bool)

(assert (=> b!869410 (= e!484177 (and e!484174 mapRes!27116))))

(declare-fun condMapEmpty!27116 () Bool)

(declare-fun mapDefault!27116 () ValueCell!8066)

