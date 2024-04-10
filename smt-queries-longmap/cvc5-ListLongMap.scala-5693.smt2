; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73942 () Bool)

(assert start!73942)

(declare-fun b_free!14857 () Bool)

(declare-fun b_next!14857 () Bool)

(assert (=> start!73942 (= b_free!14857 (not b_next!14857))))

(declare-fun tp!52074 () Bool)

(declare-fun b_and!24609 () Bool)

(assert (=> start!73942 (= tp!52074 b_and!24609)))

(declare-fun b!869079 () Bool)

(declare-fun res!590587 () Bool)

(declare-fun e!484012 () Bool)

(assert (=> b!869079 (=> (not res!590587) (not e!484012))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50134 0))(
  ( (array!50135 (arr!24098 (Array (_ BitVec 32) (_ BitVec 64))) (size!24538 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50134)

(assert (=> b!869079 (= res!590587 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24538 _keys!868))))))

(declare-fun b!869080 () Bool)

(declare-fun e!484010 () Bool)

(assert (=> b!869080 (= e!484012 e!484010)))

(declare-fun res!590586 () Bool)

(assert (=> b!869080 (=> (not res!590586) (not e!484010))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869080 (= res!590586 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27705 0))(
  ( (V!27706 (val!8544 Int)) )
))
(declare-datatypes ((ValueCell!8057 0))(
  ( (ValueCellFull!8057 (v!10969 V!27705)) (EmptyCell!8057) )
))
(declare-datatypes ((array!50136 0))(
  ( (array!50137 (arr!24099 (Array (_ BitVec 32) ValueCell!8057)) (size!24539 (_ BitVec 32))) )
))
(declare-fun lt!394683 () array!50136)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11346 0))(
  ( (tuple2!11347 (_1!5684 (_ BitVec 64)) (_2!5684 V!27705)) )
))
(declare-datatypes ((List!17139 0))(
  ( (Nil!17136) (Cons!17135 (h!18266 tuple2!11346) (t!24176 List!17139)) )
))
(declare-datatypes ((ListLongMap!10115 0))(
  ( (ListLongMap!10116 (toList!5073 List!17139)) )
))
(declare-fun lt!394684 () ListLongMap!10115)

(declare-fun minValue!654 () V!27705)

(declare-fun zeroValue!654 () V!27705)

(declare-fun getCurrentListMapNoExtraKeys!3042 (array!50134 array!50136 (_ BitVec 32) (_ BitVec 32) V!27705 V!27705 (_ BitVec 32) Int) ListLongMap!10115)

(assert (=> b!869080 (= lt!394684 (getCurrentListMapNoExtraKeys!3042 _keys!868 lt!394683 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27705)

(declare-fun _values!688 () array!50136)

(assert (=> b!869080 (= lt!394683 (array!50137 (store (arr!24099 _values!688) i!612 (ValueCellFull!8057 v!557)) (size!24539 _values!688)))))

(declare-fun lt!394681 () ListLongMap!10115)

(assert (=> b!869080 (= lt!394681 (getCurrentListMapNoExtraKeys!3042 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869081 () Bool)

(declare-fun res!590590 () Bool)

(assert (=> b!869081 (=> (not res!590590) (not e!484012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50134 (_ BitVec 32)) Bool)

(assert (=> b!869081 (= res!590590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869082 () Bool)

(assert (=> b!869082 (= e!484010 (not true))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2414 (ListLongMap!10115 tuple2!11346) ListLongMap!10115)

(assert (=> b!869082 (= (getCurrentListMapNoExtraKeys!3042 _keys!868 lt!394683 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2414 (getCurrentListMapNoExtraKeys!3042 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11347 k!854 v!557)))))

(declare-datatypes ((Unit!29826 0))(
  ( (Unit!29827) )
))
(declare-fun lt!394682 () Unit!29826)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!608 (array!50134 array!50136 (_ BitVec 32) (_ BitVec 32) V!27705 V!27705 (_ BitVec 32) (_ BitVec 64) V!27705 (_ BitVec 32) Int) Unit!29826)

(assert (=> b!869082 (= lt!394682 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!608 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27089 () Bool)

(declare-fun mapRes!27089 () Bool)

(declare-fun tp!52075 () Bool)

(declare-fun e!484015 () Bool)

(assert (=> mapNonEmpty!27089 (= mapRes!27089 (and tp!52075 e!484015))))

(declare-fun mapRest!27089 () (Array (_ BitVec 32) ValueCell!8057))

(declare-fun mapKey!27089 () (_ BitVec 32))

(declare-fun mapValue!27089 () ValueCell!8057)

(assert (=> mapNonEmpty!27089 (= (arr!24099 _values!688) (store mapRest!27089 mapKey!27089 mapValue!27089))))

(declare-fun res!590585 () Bool)

(assert (=> start!73942 (=> (not res!590585) (not e!484012))))

(assert (=> start!73942 (= res!590585 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24538 _keys!868))))))

(assert (=> start!73942 e!484012))

(declare-fun tp_is_empty!16993 () Bool)

(assert (=> start!73942 tp_is_empty!16993))

(assert (=> start!73942 true))

(assert (=> start!73942 tp!52074))

(declare-fun array_inv!19034 (array!50134) Bool)

(assert (=> start!73942 (array_inv!19034 _keys!868)))

(declare-fun e!484011 () Bool)

(declare-fun array_inv!19035 (array!50136) Bool)

(assert (=> start!73942 (and (array_inv!19035 _values!688) e!484011)))

(declare-fun b!869083 () Bool)

(declare-fun e!484013 () Bool)

(assert (=> b!869083 (= e!484011 (and e!484013 mapRes!27089))))

(declare-fun condMapEmpty!27089 () Bool)

(declare-fun mapDefault!27089 () ValueCell!8057)

