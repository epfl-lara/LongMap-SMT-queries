; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73970 () Bool)

(assert start!73970)

(declare-fun b_free!14885 () Bool)

(declare-fun b_next!14885 () Bool)

(assert (=> start!73970 (= b_free!14885 (not b_next!14885))))

(declare-fun tp!52159 () Bool)

(declare-fun b_and!24637 () Bool)

(assert (=> start!73970 (= tp!52159 b_and!24637)))

(declare-fun b!869583 () Bool)

(declare-fun res!590967 () Bool)

(declare-fun e!484263 () Bool)

(assert (=> b!869583 (=> (not res!590967) (not e!484263))))

(declare-datatypes ((array!50190 0))(
  ( (array!50191 (arr!24126 (Array (_ BitVec 32) (_ BitVec 64))) (size!24566 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50190)

(declare-datatypes ((List!17160 0))(
  ( (Nil!17157) (Cons!17156 (h!18287 (_ BitVec 64)) (t!24197 List!17160)) )
))
(declare-fun arrayNoDuplicates!0 (array!50190 (_ BitVec 32) List!17160) Bool)

(assert (=> b!869583 (= res!590967 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17157))))

(declare-fun b!869584 () Bool)

(declare-fun res!590963 () Bool)

(assert (=> b!869584 (=> (not res!590963) (not e!484263))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27741 0))(
  ( (V!27742 (val!8558 Int)) )
))
(declare-datatypes ((ValueCell!8071 0))(
  ( (ValueCellFull!8071 (v!10983 V!27741)) (EmptyCell!8071) )
))
(declare-datatypes ((array!50192 0))(
  ( (array!50193 (arr!24127 (Array (_ BitVec 32) ValueCell!8071)) (size!24567 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50192)

(assert (=> b!869584 (= res!590963 (and (= (size!24567 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24566 _keys!868) (size!24567 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869585 () Bool)

(declare-fun res!590961 () Bool)

(assert (=> b!869585 (=> (not res!590961) (not e!484263))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869585 (= res!590961 (validKeyInArray!0 k!854))))

(declare-fun b!869586 () Bool)

(declare-fun res!590969 () Bool)

(assert (=> b!869586 (=> (not res!590969) (not e!484263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50190 (_ BitVec 32)) Bool)

(assert (=> b!869586 (= res!590969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869587 () Bool)

(declare-fun e!484264 () Bool)

(declare-fun tp_is_empty!17021 () Bool)

(assert (=> b!869587 (= e!484264 tp_is_empty!17021)))

(declare-fun res!590968 () Bool)

(assert (=> start!73970 (=> (not res!590968) (not e!484263))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73970 (= res!590968 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24566 _keys!868))))))

(assert (=> start!73970 e!484263))

(assert (=> start!73970 tp_is_empty!17021))

(assert (=> start!73970 true))

(assert (=> start!73970 tp!52159))

(declare-fun array_inv!19058 (array!50190) Bool)

(assert (=> start!73970 (array_inv!19058 _keys!868)))

(declare-fun e!484265 () Bool)

(declare-fun array_inv!19059 (array!50192) Bool)

(assert (=> start!73970 (and (array_inv!19059 _values!688) e!484265)))

(declare-fun b!869588 () Bool)

(declare-fun e!484267 () Bool)

(assert (=> b!869588 (= e!484263 e!484267)))

(declare-fun res!590964 () Bool)

(assert (=> b!869588 (=> (not res!590964) (not e!484267))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869588 (= res!590964 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394849 () array!50192)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11370 0))(
  ( (tuple2!11371 (_1!5696 (_ BitVec 64)) (_2!5696 V!27741)) )
))
(declare-datatypes ((List!17161 0))(
  ( (Nil!17158) (Cons!17157 (h!18288 tuple2!11370) (t!24198 List!17161)) )
))
(declare-datatypes ((ListLongMap!10139 0))(
  ( (ListLongMap!10140 (toList!5085 List!17161)) )
))
(declare-fun lt!394852 () ListLongMap!10139)

(declare-fun minValue!654 () V!27741)

(declare-fun zeroValue!654 () V!27741)

(declare-fun getCurrentListMapNoExtraKeys!3054 (array!50190 array!50192 (_ BitVec 32) (_ BitVec 32) V!27741 V!27741 (_ BitVec 32) Int) ListLongMap!10139)

(assert (=> b!869588 (= lt!394852 (getCurrentListMapNoExtraKeys!3054 _keys!868 lt!394849 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27741)

(assert (=> b!869588 (= lt!394849 (array!50193 (store (arr!24127 _values!688) i!612 (ValueCellFull!8071 v!557)) (size!24567 _values!688)))))

(declare-fun lt!394851 () ListLongMap!10139)

(assert (=> b!869588 (= lt!394851 (getCurrentListMapNoExtraKeys!3054 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869589 () Bool)

(declare-fun res!590962 () Bool)

(assert (=> b!869589 (=> (not res!590962) (not e!484263))))

(assert (=> b!869589 (= res!590962 (and (= (select (arr!24126 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!869590 () Bool)

(declare-fun res!590965 () Bool)

(assert (=> b!869590 (=> (not res!590965) (not e!484263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869590 (= res!590965 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27131 () Bool)

(declare-fun mapRes!27131 () Bool)

(assert (=> mapIsEmpty!27131 mapRes!27131))

(declare-fun b!869591 () Bool)

(declare-fun res!590966 () Bool)

(assert (=> b!869591 (=> (not res!590966) (not e!484263))))

(assert (=> b!869591 (= res!590966 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24566 _keys!868))))))

(declare-fun b!869592 () Bool)

(declare-fun e!484266 () Bool)

(assert (=> b!869592 (= e!484266 tp_is_empty!17021)))

(declare-fun b!869593 () Bool)

(assert (=> b!869593 (= e!484267 (not true))))

(declare-fun +!2425 (ListLongMap!10139 tuple2!11370) ListLongMap!10139)

(assert (=> b!869593 (= (getCurrentListMapNoExtraKeys!3054 _keys!868 lt!394849 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2425 (getCurrentListMapNoExtraKeys!3054 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11371 k!854 v!557)))))

(declare-datatypes ((Unit!29848 0))(
  ( (Unit!29849) )
))
(declare-fun lt!394850 () Unit!29848)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!619 (array!50190 array!50192 (_ BitVec 32) (_ BitVec 32) V!27741 V!27741 (_ BitVec 32) (_ BitVec 64) V!27741 (_ BitVec 32) Int) Unit!29848)

(assert (=> b!869593 (= lt!394850 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!619 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27131 () Bool)

(declare-fun tp!52158 () Bool)

(assert (=> mapNonEmpty!27131 (= mapRes!27131 (and tp!52158 e!484264))))

(declare-fun mapRest!27131 () (Array (_ BitVec 32) ValueCell!8071))

(declare-fun mapValue!27131 () ValueCell!8071)

(declare-fun mapKey!27131 () (_ BitVec 32))

(assert (=> mapNonEmpty!27131 (= (arr!24127 _values!688) (store mapRest!27131 mapKey!27131 mapValue!27131))))

(declare-fun b!869594 () Bool)

(assert (=> b!869594 (= e!484265 (and e!484266 mapRes!27131))))

(declare-fun condMapEmpty!27131 () Bool)

(declare-fun mapDefault!27131 () ValueCell!8071)

