; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73964 () Bool)

(assert start!73964)

(declare-fun b_free!14879 () Bool)

(declare-fun b_next!14879 () Bool)

(assert (=> start!73964 (= b_free!14879 (not b_next!14879))))

(declare-fun tp!52141 () Bool)

(declare-fun b_and!24631 () Bool)

(assert (=> start!73964 (= tp!52141 b_and!24631)))

(declare-fun mapIsEmpty!27122 () Bool)

(declare-fun mapRes!27122 () Bool)

(assert (=> mapIsEmpty!27122 mapRes!27122))

(declare-fun b!869475 () Bool)

(declare-fun res!590888 () Bool)

(declare-fun e!484213 () Bool)

(assert (=> b!869475 (=> (not res!590888) (not e!484213))))

(declare-datatypes ((array!50178 0))(
  ( (array!50179 (arr!24120 (Array (_ BitVec 32) (_ BitVec 64))) (size!24560 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50178)

(declare-datatypes ((List!17154 0))(
  ( (Nil!17151) (Cons!17150 (h!18281 (_ BitVec 64)) (t!24191 List!17154)) )
))
(declare-fun arrayNoDuplicates!0 (array!50178 (_ BitVec 32) List!17154) Bool)

(assert (=> b!869475 (= res!590888 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17151))))

(declare-fun b!869476 () Bool)

(declare-fun res!590883 () Bool)

(assert (=> b!869476 (=> (not res!590883) (not e!484213))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869476 (= res!590883 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24560 _keys!868))))))

(declare-fun b!869477 () Bool)

(declare-fun e!484209 () Bool)

(assert (=> b!869477 (= e!484213 e!484209)))

(declare-fun res!590884 () Bool)

(assert (=> b!869477 (=> (not res!590884) (not e!484209))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869477 (= res!590884 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27733 0))(
  ( (V!27734 (val!8555 Int)) )
))
(declare-datatypes ((tuple2!11364 0))(
  ( (tuple2!11365 (_1!5693 (_ BitVec 64)) (_2!5693 V!27733)) )
))
(declare-datatypes ((List!17155 0))(
  ( (Nil!17152) (Cons!17151 (h!18282 tuple2!11364) (t!24192 List!17155)) )
))
(declare-datatypes ((ListLongMap!10133 0))(
  ( (ListLongMap!10134 (toList!5082 List!17155)) )
))
(declare-fun lt!394814 () ListLongMap!10133)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8068 0))(
  ( (ValueCellFull!8068 (v!10980 V!27733)) (EmptyCell!8068) )
))
(declare-datatypes ((array!50180 0))(
  ( (array!50181 (arr!24121 (Array (_ BitVec 32) ValueCell!8068)) (size!24561 (_ BitVec 32))) )
))
(declare-fun lt!394815 () array!50180)

(declare-fun minValue!654 () V!27733)

(declare-fun zeroValue!654 () V!27733)

(declare-fun getCurrentListMapNoExtraKeys!3051 (array!50178 array!50180 (_ BitVec 32) (_ BitVec 32) V!27733 V!27733 (_ BitVec 32) Int) ListLongMap!10133)

(assert (=> b!869477 (= lt!394814 (getCurrentListMapNoExtraKeys!3051 _keys!868 lt!394815 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27733)

(declare-fun _values!688 () array!50180)

(assert (=> b!869477 (= lt!394815 (array!50181 (store (arr!24121 _values!688) i!612 (ValueCellFull!8068 v!557)) (size!24561 _values!688)))))

(declare-fun lt!394816 () ListLongMap!10133)

(assert (=> b!869477 (= lt!394816 (getCurrentListMapNoExtraKeys!3051 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869478 () Bool)

(declare-fun res!590881 () Bool)

(assert (=> b!869478 (=> (not res!590881) (not e!484213))))

(assert (=> b!869478 (= res!590881 (and (= (size!24561 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24560 _keys!868) (size!24561 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869479 () Bool)

(declare-fun e!484212 () Bool)

(declare-fun tp_is_empty!17015 () Bool)

(assert (=> b!869479 (= e!484212 tp_is_empty!17015)))

(declare-fun b!869480 () Bool)

(declare-fun e!484210 () Bool)

(assert (=> b!869480 (= e!484210 tp_is_empty!17015)))

(declare-fun res!590887 () Bool)

(assert (=> start!73964 (=> (not res!590887) (not e!484213))))

(assert (=> start!73964 (= res!590887 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24560 _keys!868))))))

(assert (=> start!73964 e!484213))

(assert (=> start!73964 tp_is_empty!17015))

(assert (=> start!73964 true))

(assert (=> start!73964 tp!52141))

(declare-fun array_inv!19052 (array!50178) Bool)

(assert (=> start!73964 (array_inv!19052 _keys!868)))

(declare-fun e!484208 () Bool)

(declare-fun array_inv!19053 (array!50180) Bool)

(assert (=> start!73964 (and (array_inv!19053 _values!688) e!484208)))

(declare-fun b!869481 () Bool)

(declare-fun res!590880 () Bool)

(assert (=> b!869481 (=> (not res!590880) (not e!484213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869481 (= res!590880 (validMask!0 mask!1196))))

(declare-fun b!869482 () Bool)

(assert (=> b!869482 (= e!484209 (not true))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2422 (ListLongMap!10133 tuple2!11364) ListLongMap!10133)

(assert (=> b!869482 (= (getCurrentListMapNoExtraKeys!3051 _keys!868 lt!394815 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2422 (getCurrentListMapNoExtraKeys!3051 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11365 k!854 v!557)))))

(declare-datatypes ((Unit!29842 0))(
  ( (Unit!29843) )
))
(declare-fun lt!394813 () Unit!29842)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!616 (array!50178 array!50180 (_ BitVec 32) (_ BitVec 32) V!27733 V!27733 (_ BitVec 32) (_ BitVec 64) V!27733 (_ BitVec 32) Int) Unit!29842)

(assert (=> b!869482 (= lt!394813 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!616 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869483 () Bool)

(declare-fun res!590885 () Bool)

(assert (=> b!869483 (=> (not res!590885) (not e!484213))))

(assert (=> b!869483 (= res!590885 (and (= (select (arr!24120 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27122 () Bool)

(declare-fun tp!52140 () Bool)

(assert (=> mapNonEmpty!27122 (= mapRes!27122 (and tp!52140 e!484210))))

(declare-fun mapValue!27122 () ValueCell!8068)

(declare-fun mapKey!27122 () (_ BitVec 32))

(declare-fun mapRest!27122 () (Array (_ BitVec 32) ValueCell!8068))

(assert (=> mapNonEmpty!27122 (= (arr!24121 _values!688) (store mapRest!27122 mapKey!27122 mapValue!27122))))

(declare-fun b!869484 () Bool)

(declare-fun res!590886 () Bool)

(assert (=> b!869484 (=> (not res!590886) (not e!484213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50178 (_ BitVec 32)) Bool)

(assert (=> b!869484 (= res!590886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869485 () Bool)

(declare-fun res!590882 () Bool)

(assert (=> b!869485 (=> (not res!590882) (not e!484213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869485 (= res!590882 (validKeyInArray!0 k!854))))

(declare-fun b!869486 () Bool)

(assert (=> b!869486 (= e!484208 (and e!484212 mapRes!27122))))

(declare-fun condMapEmpty!27122 () Bool)

(declare-fun mapDefault!27122 () ValueCell!8068)

