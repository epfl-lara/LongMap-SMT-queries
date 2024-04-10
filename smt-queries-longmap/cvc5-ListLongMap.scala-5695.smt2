; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73954 () Bool)

(assert start!73954)

(declare-fun b_free!14869 () Bool)

(declare-fun b_next!14869 () Bool)

(assert (=> start!73954 (= b_free!14869 (not b_next!14869))))

(declare-fun tp!52110 () Bool)

(declare-fun b_and!24621 () Bool)

(assert (=> start!73954 (= tp!52110 b_and!24621)))

(declare-fun res!590745 () Bool)

(declare-fun e!484121 () Bool)

(assert (=> start!73954 (=> (not res!590745) (not e!484121))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50158 0))(
  ( (array!50159 (arr!24110 (Array (_ BitVec 32) (_ BitVec 64))) (size!24550 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50158)

(assert (=> start!73954 (= res!590745 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24550 _keys!868))))))

(assert (=> start!73954 e!484121))

(declare-fun tp_is_empty!17005 () Bool)

(assert (=> start!73954 tp_is_empty!17005))

(assert (=> start!73954 true))

(assert (=> start!73954 tp!52110))

(declare-fun array_inv!19044 (array!50158) Bool)

(assert (=> start!73954 (array_inv!19044 _keys!868)))

(declare-datatypes ((V!27721 0))(
  ( (V!27722 (val!8550 Int)) )
))
(declare-datatypes ((ValueCell!8063 0))(
  ( (ValueCellFull!8063 (v!10975 V!27721)) (EmptyCell!8063) )
))
(declare-datatypes ((array!50160 0))(
  ( (array!50161 (arr!24111 (Array (_ BitVec 32) ValueCell!8063)) (size!24551 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50160)

(declare-fun e!484122 () Bool)

(declare-fun array_inv!19045 (array!50160) Bool)

(assert (=> start!73954 (and (array_inv!19045 _values!688) e!484122)))

(declare-fun b!869295 () Bool)

(declare-fun res!590751 () Bool)

(assert (=> b!869295 (=> (not res!590751) (not e!484121))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50158 (_ BitVec 32)) Bool)

(assert (=> b!869295 (= res!590751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27107 () Bool)

(declare-fun mapRes!27107 () Bool)

(declare-fun tp!52111 () Bool)

(declare-fun e!484120 () Bool)

(assert (=> mapNonEmpty!27107 (= mapRes!27107 (and tp!52111 e!484120))))

(declare-fun mapKey!27107 () (_ BitVec 32))

(declare-fun mapValue!27107 () ValueCell!8063)

(declare-fun mapRest!27107 () (Array (_ BitVec 32) ValueCell!8063))

(assert (=> mapNonEmpty!27107 (= (arr!24111 _values!688) (store mapRest!27107 mapKey!27107 mapValue!27107))))

(declare-fun b!869296 () Bool)

(declare-fun res!590749 () Bool)

(assert (=> b!869296 (=> (not res!590749) (not e!484121))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!869296 (= res!590749 (and (= (size!24551 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24550 _keys!868) (size!24551 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869297 () Bool)

(declare-fun e!484118 () Bool)

(assert (=> b!869297 (= e!484118 tp_is_empty!17005)))

(declare-fun b!869298 () Bool)

(declare-fun res!590746 () Bool)

(assert (=> b!869298 (=> (not res!590746) (not e!484121))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869298 (= res!590746 (validKeyInArray!0 k!854))))

(declare-fun b!869299 () Bool)

(assert (=> b!869299 (= e!484120 tp_is_empty!17005)))

(declare-fun b!869300 () Bool)

(declare-fun e!484119 () Bool)

(assert (=> b!869300 (= e!484119 (not true))))

(declare-fun lt!394756 () array!50160)

(declare-fun v!557 () V!27721)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27721)

(declare-fun zeroValue!654 () V!27721)

(declare-datatypes ((tuple2!11356 0))(
  ( (tuple2!11357 (_1!5689 (_ BitVec 64)) (_2!5689 V!27721)) )
))
(declare-datatypes ((List!17147 0))(
  ( (Nil!17144) (Cons!17143 (h!18274 tuple2!11356) (t!24184 List!17147)) )
))
(declare-datatypes ((ListLongMap!10125 0))(
  ( (ListLongMap!10126 (toList!5078 List!17147)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3047 (array!50158 array!50160 (_ BitVec 32) (_ BitVec 32) V!27721 V!27721 (_ BitVec 32) Int) ListLongMap!10125)

(declare-fun +!2418 (ListLongMap!10125 tuple2!11356) ListLongMap!10125)

(assert (=> b!869300 (= (getCurrentListMapNoExtraKeys!3047 _keys!868 lt!394756 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2418 (getCurrentListMapNoExtraKeys!3047 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11357 k!854 v!557)))))

(declare-datatypes ((Unit!29834 0))(
  ( (Unit!29835) )
))
(declare-fun lt!394755 () Unit!29834)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!612 (array!50158 array!50160 (_ BitVec 32) (_ BitVec 32) V!27721 V!27721 (_ BitVec 32) (_ BitVec 64) V!27721 (_ BitVec 32) Int) Unit!29834)

(assert (=> b!869300 (= lt!394755 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!612 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869301 () Bool)

(assert (=> b!869301 (= e!484122 (and e!484118 mapRes!27107))))

(declare-fun condMapEmpty!27107 () Bool)

(declare-fun mapDefault!27107 () ValueCell!8063)

