; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74054 () Bool)

(assert start!74054)

(declare-fun b_free!14969 () Bool)

(declare-fun b_next!14969 () Bool)

(assert (=> start!74054 (= b_free!14969 (not b_next!14969))))

(declare-fun tp!52410 () Bool)

(declare-fun b_and!24721 () Bool)

(assert (=> start!74054 (= tp!52410 b_and!24721)))

(declare-fun b!871095 () Bool)

(declare-fun res!592099 () Bool)

(declare-fun e!485022 () Bool)

(assert (=> b!871095 (=> (not res!592099) (not e!485022))))

(declare-datatypes ((array!50352 0))(
  ( (array!50353 (arr!24207 (Array (_ BitVec 32) (_ BitVec 64))) (size!24647 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50352)

(declare-datatypes ((List!17215 0))(
  ( (Nil!17212) (Cons!17211 (h!18342 (_ BitVec 64)) (t!24252 List!17215)) )
))
(declare-fun arrayNoDuplicates!0 (array!50352 (_ BitVec 32) List!17215) Bool)

(assert (=> b!871095 (= res!592099 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17212))))

(declare-fun b!871096 () Bool)

(declare-fun e!485023 () Bool)

(assert (=> b!871096 (= e!485022 e!485023)))

(declare-fun res!592095 () Bool)

(assert (=> b!871096 (=> (not res!592095) (not e!485023))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871096 (= res!592095 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27853 0))(
  ( (V!27854 (val!8600 Int)) )
))
(declare-datatypes ((tuple2!11428 0))(
  ( (tuple2!11429 (_1!5725 (_ BitVec 64)) (_2!5725 V!27853)) )
))
(declare-datatypes ((List!17216 0))(
  ( (Nil!17213) (Cons!17212 (h!18343 tuple2!11428) (t!24253 List!17216)) )
))
(declare-datatypes ((ListLongMap!10197 0))(
  ( (ListLongMap!10198 (toList!5114 List!17216)) )
))
(declare-fun lt!395356 () ListLongMap!10197)

(declare-fun minValue!654 () V!27853)

(declare-fun zeroValue!654 () V!27853)

(declare-datatypes ((ValueCell!8113 0))(
  ( (ValueCellFull!8113 (v!11025 V!27853)) (EmptyCell!8113) )
))
(declare-datatypes ((array!50354 0))(
  ( (array!50355 (arr!24208 (Array (_ BitVec 32) ValueCell!8113)) (size!24648 (_ BitVec 32))) )
))
(declare-fun lt!395355 () array!50354)

(declare-fun getCurrentListMapNoExtraKeys!3083 (array!50352 array!50354 (_ BitVec 32) (_ BitVec 32) V!27853 V!27853 (_ BitVec 32) Int) ListLongMap!10197)

(assert (=> b!871096 (= lt!395356 (getCurrentListMapNoExtraKeys!3083 _keys!868 lt!395355 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27853)

(declare-fun _values!688 () array!50354)

(assert (=> b!871096 (= lt!395355 (array!50355 (store (arr!24208 _values!688) i!612 (ValueCellFull!8113 v!557)) (size!24648 _values!688)))))

(declare-fun lt!395353 () ListLongMap!10197)

(assert (=> b!871096 (= lt!395353 (getCurrentListMapNoExtraKeys!3083 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871097 () Bool)

(declare-fun res!592102 () Bool)

(assert (=> b!871097 (=> (not res!592102) (not e!485022))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!871097 (= res!592102 (and (= (select (arr!24207 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!871098 () Bool)

(declare-fun e!485020 () Bool)

(declare-fun e!485019 () Bool)

(declare-fun mapRes!27257 () Bool)

(assert (=> b!871098 (= e!485020 (and e!485019 mapRes!27257))))

(declare-fun condMapEmpty!27257 () Bool)

(declare-fun mapDefault!27257 () ValueCell!8113)

