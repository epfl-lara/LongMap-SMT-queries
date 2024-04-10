; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73952 () Bool)

(assert start!73952)

(declare-fun b_free!14867 () Bool)

(declare-fun b_next!14867 () Bool)

(assert (=> start!73952 (= b_free!14867 (not b_next!14867))))

(declare-fun tp!52104 () Bool)

(declare-fun b_and!24619 () Bool)

(assert (=> start!73952 (= tp!52104 b_and!24619)))

(declare-fun b!869259 () Bool)

(declare-fun res!590718 () Bool)

(declare-fun e!484102 () Bool)

(assert (=> b!869259 (=> (not res!590718) (not e!484102))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50154 0))(
  ( (array!50155 (arr!24108 (Array (_ BitVec 32) (_ BitVec 64))) (size!24548 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50154)

(assert (=> b!869259 (= res!590718 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24548 _keys!868))))))

(declare-fun mapIsEmpty!27104 () Bool)

(declare-fun mapRes!27104 () Bool)

(assert (=> mapIsEmpty!27104 mapRes!27104))

(declare-fun b!869260 () Bool)

(declare-fun e!484105 () Bool)

(declare-fun tp_is_empty!17003 () Bool)

(assert (=> b!869260 (= e!484105 tp_is_empty!17003)))

(declare-fun b!869261 () Bool)

(declare-fun res!590720 () Bool)

(assert (=> b!869261 (=> (not res!590720) (not e!484102))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27717 0))(
  ( (V!27718 (val!8549 Int)) )
))
(declare-datatypes ((ValueCell!8062 0))(
  ( (ValueCellFull!8062 (v!10974 V!27717)) (EmptyCell!8062) )
))
(declare-datatypes ((array!50156 0))(
  ( (array!50157 (arr!24109 (Array (_ BitVec 32) ValueCell!8062)) (size!24549 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50156)

(assert (=> b!869261 (= res!590720 (and (= (size!24549 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24548 _keys!868) (size!24549 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869262 () Bool)

(declare-fun res!590725 () Bool)

(assert (=> b!869262 (=> (not res!590725) (not e!484102))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869262 (= res!590725 (and (= (select (arr!24108 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!869263 () Bool)

(declare-fun e!484100 () Bool)

(assert (=> b!869263 (= e!484102 e!484100)))

(declare-fun res!590722 () Bool)

(assert (=> b!869263 (=> (not res!590722) (not e!484100))))

(assert (=> b!869263 (= res!590722 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11354 0))(
  ( (tuple2!11355 (_1!5688 (_ BitVec 64)) (_2!5688 V!27717)) )
))
(declare-datatypes ((List!17146 0))(
  ( (Nil!17143) (Cons!17142 (h!18273 tuple2!11354) (t!24183 List!17146)) )
))
(declare-datatypes ((ListLongMap!10123 0))(
  ( (ListLongMap!10124 (toList!5077 List!17146)) )
))
(declare-fun lt!394741 () ListLongMap!10123)

(declare-fun lt!394742 () array!50156)

(declare-fun minValue!654 () V!27717)

(declare-fun zeroValue!654 () V!27717)

(declare-fun getCurrentListMapNoExtraKeys!3046 (array!50154 array!50156 (_ BitVec 32) (_ BitVec 32) V!27717 V!27717 (_ BitVec 32) Int) ListLongMap!10123)

(assert (=> b!869263 (= lt!394741 (getCurrentListMapNoExtraKeys!3046 _keys!868 lt!394742 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27717)

(assert (=> b!869263 (= lt!394742 (array!50157 (store (arr!24109 _values!688) i!612 (ValueCellFull!8062 v!557)) (size!24549 _values!688)))))

(declare-fun lt!394744 () ListLongMap!10123)

(assert (=> b!869263 (= lt!394744 (getCurrentListMapNoExtraKeys!3046 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869264 () Bool)

(declare-fun res!590719 () Bool)

(assert (=> b!869264 (=> (not res!590719) (not e!484102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50154 (_ BitVec 32)) Bool)

(assert (=> b!869264 (= res!590719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869265 () Bool)

(declare-fun e!484103 () Bool)

(assert (=> b!869265 (= e!484103 (and e!484105 mapRes!27104))))

(declare-fun condMapEmpty!27104 () Bool)

(declare-fun mapDefault!27104 () ValueCell!8062)

