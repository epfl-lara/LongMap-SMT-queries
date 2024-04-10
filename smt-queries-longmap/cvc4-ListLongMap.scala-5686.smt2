; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73904 () Bool)

(assert start!73904)

(declare-fun b_free!14819 () Bool)

(declare-fun b_next!14819 () Bool)

(assert (=> start!73904 (= b_free!14819 (not b_next!14819))))

(declare-fun tp!51960 () Bool)

(declare-fun b_and!24571 () Bool)

(assert (=> start!73904 (= tp!51960 b_and!24571)))

(declare-fun b!868395 () Bool)

(declare-fun e!483671 () Bool)

(declare-fun tp_is_empty!16955 () Bool)

(assert (=> b!868395 (= e!483671 tp_is_empty!16955)))

(declare-fun b!868396 () Bool)

(declare-fun e!483673 () Bool)

(assert (=> b!868396 (= e!483673 (not true))))

(declare-datatypes ((V!27653 0))(
  ( (V!27654 (val!8525 Int)) )
))
(declare-fun v!557 () V!27653)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8038 0))(
  ( (ValueCellFull!8038 (v!10950 V!27653)) (EmptyCell!8038) )
))
(declare-datatypes ((array!50066 0))(
  ( (array!50067 (arr!24064 (Array (_ BitVec 32) ValueCell!8038)) (size!24504 (_ BitVec 32))) )
))
(declare-fun lt!394456 () array!50066)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50068 0))(
  ( (array!50069 (arr!24065 (Array (_ BitVec 32) (_ BitVec 64))) (size!24505 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50068)

(declare-fun _values!688 () array!50066)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27653)

(declare-fun zeroValue!654 () V!27653)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11318 0))(
  ( (tuple2!11319 (_1!5670 (_ BitVec 64)) (_2!5670 V!27653)) )
))
(declare-datatypes ((List!17114 0))(
  ( (Nil!17111) (Cons!17110 (h!18241 tuple2!11318) (t!24151 List!17114)) )
))
(declare-datatypes ((ListLongMap!10087 0))(
  ( (ListLongMap!10088 (toList!5059 List!17114)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3028 (array!50068 array!50066 (_ BitVec 32) (_ BitVec 32) V!27653 V!27653 (_ BitVec 32) Int) ListLongMap!10087)

(declare-fun +!2401 (ListLongMap!10087 tuple2!11318) ListLongMap!10087)

(assert (=> b!868396 (= (getCurrentListMapNoExtraKeys!3028 _keys!868 lt!394456 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2401 (getCurrentListMapNoExtraKeys!3028 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11319 k!854 v!557)))))

(declare-datatypes ((Unit!29800 0))(
  ( (Unit!29801) )
))
(declare-fun lt!394454 () Unit!29800)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!595 (array!50068 array!50066 (_ BitVec 32) (_ BitVec 32) V!27653 V!27653 (_ BitVec 32) (_ BitVec 64) V!27653 (_ BitVec 32) Int) Unit!29800)

(assert (=> b!868396 (= lt!394454 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!595 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868397 () Bool)

(declare-fun e!483672 () Bool)

(assert (=> b!868397 (= e!483672 tp_is_empty!16955)))

(declare-fun b!868398 () Bool)

(declare-fun e!483668 () Bool)

(assert (=> b!868398 (= e!483668 e!483673)))

(declare-fun res!590072 () Bool)

(assert (=> b!868398 (=> (not res!590072) (not e!483673))))

(assert (=> b!868398 (= res!590072 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394455 () ListLongMap!10087)

(assert (=> b!868398 (= lt!394455 (getCurrentListMapNoExtraKeys!3028 _keys!868 lt!394456 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868398 (= lt!394456 (array!50067 (store (arr!24064 _values!688) i!612 (ValueCellFull!8038 v!557)) (size!24504 _values!688)))))

(declare-fun lt!394453 () ListLongMap!10087)

(assert (=> b!868398 (= lt!394453 (getCurrentListMapNoExtraKeys!3028 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868399 () Bool)

(declare-fun res!590077 () Bool)

(assert (=> b!868399 (=> (not res!590077) (not e!483668))))

(assert (=> b!868399 (= res!590077 (and (= (select (arr!24065 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!868400 () Bool)

(declare-fun e!483669 () Bool)

(declare-fun mapRes!27032 () Bool)

(assert (=> b!868400 (= e!483669 (and e!483671 mapRes!27032))))

(declare-fun condMapEmpty!27032 () Bool)

(declare-fun mapDefault!27032 () ValueCell!8038)

