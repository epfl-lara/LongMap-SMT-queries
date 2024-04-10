; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73790 () Bool)

(assert start!73790)

(declare-fun b_free!14705 () Bool)

(declare-fun b_next!14705 () Bool)

(assert (=> start!73790 (= b_free!14705 (not b_next!14705))))

(declare-fun tp!51618 () Bool)

(declare-fun b_and!24389 () Bool)

(assert (=> start!73790 (= tp!51618 b_and!24389)))

(declare-fun b!865875 () Bool)

(declare-fun res!588331 () Bool)

(declare-fun e!482346 () Bool)

(assert (=> b!865875 (=> (not res!588331) (not e!482346))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865875 (= res!588331 (validMask!0 mask!1196))))

(declare-fun b!865877 () Bool)

(declare-fun e!482344 () Bool)

(assert (=> b!865877 (= e!482346 e!482344)))

(declare-fun res!588332 () Bool)

(assert (=> b!865877 (=> (not res!588332) (not e!482344))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865877 (= res!588332 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49842 0))(
  ( (array!49843 (arr!23952 (Array (_ BitVec 32) (_ BitVec 64))) (size!24392 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49842)

(declare-datatypes ((V!27501 0))(
  ( (V!27502 (val!8468 Int)) )
))
(declare-fun zeroValue!654 () V!27501)

(declare-fun minValue!654 () V!27501)

(declare-datatypes ((ValueCell!7981 0))(
  ( (ValueCellFull!7981 (v!10893 V!27501)) (EmptyCell!7981) )
))
(declare-datatypes ((array!49844 0))(
  ( (array!49845 (arr!23953 (Array (_ BitVec 32) ValueCell!7981)) (size!24393 (_ BitVec 32))) )
))
(declare-fun lt!392578 () array!49844)

(declare-datatypes ((tuple2!11226 0))(
  ( (tuple2!11227 (_1!5624 (_ BitVec 64)) (_2!5624 V!27501)) )
))
(declare-datatypes ((List!17029 0))(
  ( (Nil!17026) (Cons!17025 (h!18156 tuple2!11226) (t!24000 List!17029)) )
))
(declare-datatypes ((ListLongMap!9995 0))(
  ( (ListLongMap!9996 (toList!5013 List!17029)) )
))
(declare-fun lt!392582 () ListLongMap!9995)

(declare-fun getCurrentListMapNoExtraKeys!2984 (array!49842 array!49844 (_ BitVec 32) (_ BitVec 32) V!27501 V!27501 (_ BitVec 32) Int) ListLongMap!9995)

(assert (=> b!865877 (= lt!392582 (getCurrentListMapNoExtraKeys!2984 _keys!868 lt!392578 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27501)

(declare-fun _values!688 () array!49844)

(assert (=> b!865877 (= lt!392578 (array!49845 (store (arr!23953 _values!688) i!612 (ValueCellFull!7981 v!557)) (size!24393 _values!688)))))

(declare-fun lt!392581 () ListLongMap!9995)

(assert (=> b!865877 (= lt!392581 (getCurrentListMapNoExtraKeys!2984 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865878 () Bool)

(declare-fun res!588341 () Bool)

(assert (=> b!865878 (=> (not res!588341) (not e!482346))))

(assert (=> b!865878 (= res!588341 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24392 _keys!868))))))

(declare-fun mapNonEmpty!26861 () Bool)

(declare-fun mapRes!26861 () Bool)

(declare-fun tp!51619 () Bool)

(declare-fun e!482343 () Bool)

(assert (=> mapNonEmpty!26861 (= mapRes!26861 (and tp!51619 e!482343))))

(declare-fun mapValue!26861 () ValueCell!7981)

(declare-fun mapRest!26861 () (Array (_ BitVec 32) ValueCell!7981))

(declare-fun mapKey!26861 () (_ BitVec 32))

(assert (=> mapNonEmpty!26861 (= (arr!23953 _values!688) (store mapRest!26861 mapKey!26861 mapValue!26861))))

(declare-fun b!865879 () Bool)

(declare-datatypes ((Unit!29668 0))(
  ( (Unit!29669) )
))
(declare-fun e!482342 () Unit!29668)

(declare-fun Unit!29670 () Unit!29668)

(assert (=> b!865879 (= e!482342 Unit!29670)))

(declare-fun b!865880 () Bool)

(declare-fun res!588335 () Bool)

(assert (=> b!865880 (=> (not res!588335) (not e!482346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49842 (_ BitVec 32)) Bool)

(assert (=> b!865880 (= res!588335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865881 () Bool)

(declare-fun res!588333 () Bool)

(assert (=> b!865881 (=> (not res!588333) (not e!482346))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865881 (= res!588333 (validKeyInArray!0 k!854))))

(declare-fun b!865882 () Bool)

(declare-fun res!588337 () Bool)

(assert (=> b!865882 (=> (not res!588337) (not e!482346))))

(assert (=> b!865882 (= res!588337 (and (= (select (arr!23952 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!865883 () Bool)

(declare-fun res!588336 () Bool)

(assert (=> b!865883 (=> (not res!588336) (not e!482346))))

(assert (=> b!865883 (= res!588336 (and (= (size!24393 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24392 _keys!868) (size!24393 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865884 () Bool)

(declare-fun e!482345 () Bool)

(declare-fun e!482350 () Bool)

(assert (=> b!865884 (= e!482345 (and e!482350 mapRes!26861))))

(declare-fun condMapEmpty!26861 () Bool)

(declare-fun mapDefault!26861 () ValueCell!7981)

